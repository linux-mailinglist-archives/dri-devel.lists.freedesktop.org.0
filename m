Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAFC12D9C
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1376289EA6;
	Fri,  3 May 2019 12:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA7A89EB1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CV7Z5095212;
 Fri, 3 May 2019 07:31:07 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CV711110545
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:05 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtt002029;
 Fri, 3 May 2019 07:31:03 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 11/23] drm/bridge: tc358767: disable only video stream in
 tc_stream_disable
Date: Fri, 3 May 2019 15:29:37 +0300
Message-ID: <20190503122949.12266-12-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886667;
 bh=U0s88hjpMcp+CwUIIMCeaqA+v8qLPzl6hAenrqDaA9A=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Z06CrQXV7CdCZWDMIOHEzxXysiWnvqS+y4gKSpqGIbnHRz89X6GhncnnzSrE3tpPa
 jBn9wzJ1zfmkdb+EZVS+OkkgUM/VxtHLy4h7n0q+mEdX+8Sfy3YntDSnIHthLmWSEf
 6jprAOD/+eXrg2ajg8ch99CoLxguIEU0LSIaX3Uo=
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

Q3VycmVudGx5IHRoZSBjb2RlIHdyaXRlcyAwIHRvIERQMENUTCBpbiB0Y19zdHJlYW1fZGlzYWJs
ZSgpLCB3aGljaApkaXNhYmxlcyB0aGUgd2hvbGUgRFAgbGluayBpbnN0ZWFkIG9mIGp1c3QgdGhl
IHZpZGVvIHN0cmVhbS4gV2UgYWx3YXlzCmRpc2FibGUgdGhlIGxpbmsgYW5kIHRoZSBzdHJlYW0g
dG9nZXRoZXIgZnJvbSB0Y19icmlkZ2VfZGlzYWJsZSgpLCBzbwp0aGlzIGRvZXNuJ3QgY2F1c2Ug
YW55IGlzc3Vlcy4KCk5ldmVydGhlbGVzcywgZml4IHRoaXMgYnkgb25seSBjbGVhcmluZyBWSURf
RU4gaW4gdGNfc3RyZWFtX2Rpc2FibGUgdG8Kc3RvcCB0aGUgdmlkZW8gc3RyZWFtIHdoaWxlIGtl
ZXBpbmcgdGhlIGxpbmsgZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0
b21pLnZhbGtlaW5lbkB0aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCBiMjJmNWZlN2NjZmQuLjg2ZTJl
MTZjNWE5MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTA3NiwxMCArMTA3Niwx
MyBAQCBzdGF0aWMgaW50IHRjX3N0cmVhbV9lbmFibGUoc3RydWN0IHRjX2RhdGEgKnRjKQogc3Rh
dGljIGludCB0Y19zdHJlYW1fZGlzYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiB7CiAJaW50IHJl
dDsKKwl1MzIgdmFsOwogCiAJZGV2X2RiZyh0Yy0+ZGV2LCAiZGlzYWJsZSB2aWRlbyBzdHJlYW1c
biIpOwogCi0JdGNfd3JpdGUoRFAwQ1RMLCAwKTsKKwl0Y19yZWFkKERQMENUTCwgJnZhbCk7CisJ
dmFsICY9IH5WSURfRU47CisJdGNfd3JpdGUoRFAwQ1RMLCB2YWwpOwogCiAJdGNfcHhsX3BsbF9k
aXModGMpOwogCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
