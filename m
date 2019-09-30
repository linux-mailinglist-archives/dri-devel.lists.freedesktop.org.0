Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC0C1F43
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 12:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F686E25A;
	Mon, 30 Sep 2019 10:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916006E24B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 10:39:01 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UAcxEA100925;
 Mon, 30 Sep 2019 05:38:59 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UAcxHK016965;
 Mon, 30 Sep 2019 05:38:59 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 05:38:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 05:38:49 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8UAck23011864;
 Mon, 30 Sep 2019 05:38:58 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
Subject: [PATCHv2 7/7] drm/omap: hdmi4: fix use of uninitialized var
Date: Mon, 30 Sep 2019 13:38:40 +0300
Message-ID: <20190930103840.18970-8-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190930103840.18970-1-tomi.valkeinen@ti.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569839939;
 bh=DtW0L6HyQo6uDdSd8XmxCvBOVsGLA+IZZDnLj7Wxxb0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=sYxEbJi/SX9ECw+XTzKfq0zM4WZj11tlnh1vu4JSfKJKTfBvCIMlLmvuH2/N/xedq
 x7utzeHMoGNoSROvgX93jKoaiaY0YfRC6oJp3SDdvQ0kV09GVYOUOqoEsYaSPyMWBa
 TGKVnetKREb3kUrWuiWM6jSP9e0Y9Ff1eSh/Xcvc=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgdXNlX21jbGsgaXMgZmFsc2UsIG1jbGtfbW9kZSBpcyB3cml0dGVuIHRvIGEgcmVnaXN0ZXIg
d2l0aG91dAppbml0aWFsaXphdGlvbi4gVGhpcyBkb2Vzbid0IGNhdXNlIGFueSBpbGwgZWZmZWN0
cyBhcyB0aGUgd3JpdHRlbiB2YWx1ZQppcyBub3QgdXNlZCB3aGVuIHVzZV9tY2xrIGlzIGZhbHNl
LgoKVG8gZml4IHRoaXMsIHdyaXRlIHVzZV9tY2xrIG9ubHkgd2hlbiB1c2VfbWNsayBpcyB0cnVl
LgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jIHwgNSArKystLQog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jIGIvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2NvcmUuYwppbmRleCA1ZDVkNTU4OGViYzEuLmM0ZmZl
OTZlMjhiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2hkbWk0X2Nv
cmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvaGRtaTRfY29yZS5jCkBAIC01
NDIsOCArNTQyLDkgQEAgc3RhdGljIHZvaWQgaGRtaV9jb3JlX2F1ZGlvX2NvbmZpZyhzdHJ1Y3Qg
aGRtaV9jb3JlX2RhdGEgKmNvcmUsCiAJfQogCiAJLyogU2V0IEFDUiBjbG9jayBkaXZpc29yICov
Ci0JUkVHX0ZMRF9NT0QoYXZfYmFzZSwKLQkJCUhETUlfQ09SRV9BVl9GUkVRX1NWQUwsIGNmZy0+
bWNsa19tb2RlLCAyLCAwKTsKKwlpZiAoY2ZnLT51c2VfbWNsaykKKwkJUkVHX0ZMRF9NT0QoYXZf
YmFzZSwgSERNSV9DT1JFX0FWX0ZSRVFfU1ZBTCwKKwkJCSAgICBjZmctPm1jbGtfbW9kZSwgMiwg
MCk7CiAKIAlyID0gaGRtaV9yZWFkX3JlZyhhdl9iYXNlLCBIRE1JX0NPUkVfQVZfQUNSX0NUUkwp
OwogCS8qCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
