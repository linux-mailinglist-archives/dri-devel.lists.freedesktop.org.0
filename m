Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E816E2C139
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1EC89C99;
	Tue, 28 May 2019 08:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9821189C96
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SKqr125154;
 Tue, 28 May 2019 03:28:20 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SKwn008473
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:20 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:19 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxub125039;
 Tue, 28 May 2019 03:28:17 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 07/24] drm/bridge: tc358767: move video stream setup to
 tc_main_link_stream
Date: Tue, 28 May 2019 11:27:30 +0300
Message-ID: <20190528082747.3631-8-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032100;
 bh=ubQKBchvHb1DbHv0IZwtMtXBvY0Jz1i/ykl/EdWvH34=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Nn3qXxuCDJTFfWL1w+GK3UqddweV95T9nqZmgpXvicg/qBky4mPHXMbEaYXh8Xv3n
 vG9eetTtXBvzplZijFl5O8x5LOymG2eNMvtyCdwNhzIHNPkQmHe56UYqCR8GIAYJ2u
 anUuZPrS0SZZY1WmjYNdc3kXaA5UQ+7BfMMt8WAE=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBjdXJyZW50bHkgc2V0cyB0aGUgdmlkZW8gc3RyZWFtIHJlZ2lzdGVycyBpbgp0
Y19tYWluX2xpbmtfc2V0dXAuIE9uZSBzaG91bGQgYmUgYWJsZSB0byBlc3RhYmxpc2ggdGhlIERQ
IGxpbmsgd2l0aG91dAphbnkgdmlkZW8gc3RyZWFtLCBzbyBhIG1vcmUgbG9naWNhbCBwbGFjZSBp
cyB0byBjb25maWd1cmUgdGhlIHN0cmVhbSBpbgp0aGUgdGNfbWFpbl9saW5rX3N0cmVhbS4gU28g
bW92ZSB0aGVtIHRoZXJlLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwg
MTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3
NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCAzOWE5ZGU4ODBl
NWEuLjRkZTIxYzM4ODNkOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1
ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTAwNCwx
NSArMTAwNCw2IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRh
ICp0YykKIAkJcmV0dXJuIC1FQUdBSU47CiAJfQogCi0JcmV0ID0gdGNfc2V0X3ZpZGVvX21vZGUo
dGMsIHRjLT5tb2RlKTsKLQlpZiAocmV0KQotCQlnb3RvIGVycjsKLQotCS8qIFNldCBNL04gKi8K
LQlyZXQgPSB0Y19zdHJlYW1fY2xvY2tfY2FsYyh0Yyk7Ci0JaWYgKHJldCkKLQkJZ290byBlcnI7
Ci0KIAlyZXR1cm4gMDsKIGVycl9kcGNkX3JlYWQ6CiAJZGV2X2Vycih0Yy0+ZGV2LCAiRmFpbGVk
IHRvIHJlYWQgRFBDRDogJWRcbiIsIHJldCk7CkBAIC0xMDMxLDYgKzEwMjIsMTUgQEAgc3RhdGlj
IGludCB0Y19tYWluX2xpbmtfc3RyZWFtKHN0cnVjdCB0Y19kYXRhICp0YywgaW50IHN0YXRlKQog
CWRldl9kYmcodGMtPmRldiwgInN0cmVhbTogJWRcbiIsIHN0YXRlKTsKIAogCWlmIChzdGF0ZSkg
eworCQlyZXQgPSB0Y19zZXRfdmlkZW9fbW9kZSh0YywgdGMtPm1vZGUpOworCQlpZiAocmV0KQor
CQkJZ290byBlcnI7CisKKwkJLyogU2V0IE0vTiAqLworCQlyZXQgPSB0Y19zdHJlYW1fY2xvY2tf
Y2FsYyh0Yyk7CisJCWlmIChyZXQpCisJCQlnb3RvIGVycjsKKwogCQl2YWx1ZSA9IFZJRF9NTl9H
RU4gfCBEUF9FTjsKIAkJaWYgKHRjLT5saW5rLmJhc2UuY2FwYWJpbGl0aWVzICYgRFBfTElOS19D
QVBfRU5IQU5DRURfRlJBTUlORykKIAkJCXZhbHVlIHw9IEVGX0VOOwotLSAKVGV4YXMgSW5zdHJ1
bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVu
bnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
