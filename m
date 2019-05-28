Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F12C138
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A090689C97;
	Tue, 28 May 2019 08:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C0989C97
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:25 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SMQb031798;
 Tue, 28 May 2019 03:28:22 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SMM3008527
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:22 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxuc125039;
 Tue, 28 May 2019 03:28:19 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 08/24] drm/bridge: tc358767: split stream enable/disable
Date: Tue, 28 May 2019 11:27:31 +0300
Message-ID: <20190528082747.3631-9-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032102;
 bh=UBp4HzgSWnsLS3Nsd3+l4jRI+ThOve9T8Hu2uGbDU6I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ot+2+xLBl5x00NKiqMdnzYhzjZDt4OBI8cCNcRpExRP5pEl93lStg+4ZPYNURvJEn
 VimVijabPHO3Um3nY11dK6fnAo0darllThYbjeNrXCOpVFYz4RRGhfal+hI/mDRghU
 2gpZdv6Rsy4EDsFC3V3yX9OLP6vHdh/NO8tza8Gc=
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

SXQgaXMgbmljZXIgdG8gaGF2ZSBlbmFibGUvZGlzYWJsZSBmdW5jdGlvbnMgaW5zdGVhZCBvZiBz
ZXQoYm9vbCBlbmFibGUpCnN0eWxlIGZ1bmN0aW9uLgoKU3BsaXQgdGNfbWFpbl9saW5rX3N0cmVh
bSBpbnRvIHRjX3N0cmVhbV9lbmFibGUgYW5kIHRjX3N0cmVhbV9kaXNhYmxlLgoKU2lnbmVkLW9m
Zi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6
IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jIHwgODEgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvdGMzNTg3NjcuYwppbmRleCA0ZGUyMWMzODgzZDguLmEzNzliNjM2ODE1NyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtMTAxNCw0NyArMTAxNCw1NiBAQCBzdGF0aWMg
aW50IHRjX21haW5fbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJcmV0dXJuIHJldDsK
IH0KIAotc3RhdGljIGludCB0Y19tYWluX2xpbmtfc3RyZWFtKHN0cnVjdCB0Y19kYXRhICp0Yywg
aW50IHN0YXRlKQorc3RhdGljIGludCB0Y19zdHJlYW1fZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0
YykKIHsKIAlpbnQgcmV0OwogCXUzMiB2YWx1ZTsKIAotCWRldl9kYmcodGMtPmRldiwgInN0cmVh
bTogJWRcbiIsIHN0YXRlKTsKKwlkZXZfZGJnKHRjLT5kZXYsICJlbmFibGUgdmlkZW8gc3RyZWFt
XG4iKTsKIAotCWlmIChzdGF0ZSkgewotCQlyZXQgPSB0Y19zZXRfdmlkZW9fbW9kZSh0YywgdGMt
Pm1vZGUpOwotCQlpZiAocmV0KQotCQkJZ290byBlcnI7CisJcmV0ID0gdGNfc2V0X3ZpZGVvX21v
ZGUodGMsIHRjLT5tb2RlKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCi0JCS8qIFNldCBN
L04gKi8KLQkJcmV0ID0gdGNfc3RyZWFtX2Nsb2NrX2NhbGModGMpOwotCQlpZiAocmV0KQotCQkJ
Z290byBlcnI7CisJLyogU2V0IE0vTiAqLworCXJldCA9IHRjX3N0cmVhbV9jbG9ja19jYWxjKHRj
KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCi0JCXZhbHVlID0gVklEX01OX0dFTiB8IERQ
X0VOOwotCQlpZiAodGMtPmxpbmsuYmFzZS5jYXBhYmlsaXRpZXMgJiBEUF9MSU5LX0NBUF9FTkhB
TkNFRF9GUkFNSU5HKQotCQkJdmFsdWUgfD0gRUZfRU47Ci0JCXRjX3dyaXRlKERQMENUTCwgdmFs
dWUpOwotCQkvKgotCQkgKiBWSURfRU4gYXNzZXJ0aW9uIHNob3VsZCBiZSBkZWxheWVkIGJ5IGF0
IGxlYXN0IE4gKiBMU0NMSwotCQkgKiBjeWNsZXMgZnJvbSB0aGUgdGltZSBWSURfTU5fR0VOIGlz
IGVuYWJsZWQgaW4gb3JkZXIgdG8KLQkJICogZ2VuZXJhdGUgc3RhYmxlIHZhbHVlcyBmb3IgVklE
X00uIExTQ0xLIGlzIDI3MCBNSHogb3IKLQkJICogMTYyIE1IeiwgVklEX04gaXMgc2V0IHRvIDMy
NzY4IGluICB0Y19zdHJlYW1fY2xvY2tfY2FsYygpLAotCQkgKiBzbyBhIGRlbGF5IG9mIGF0IGxl
YXN0IDIwMyB1cyBzaG91bGQgc3VmZmljZS4KLQkJICovCi0JCXVzbGVlcF9yYW5nZSg1MDAsIDEw
MDApOwotCQl2YWx1ZSB8PSBWSURfRU47Ci0JCXRjX3dyaXRlKERQMENUTCwgdmFsdWUpOwotCQkv
KiBTZXQgaW5wdXQgaW50ZXJmYWNlICovCi0JCXZhbHVlID0gRFAwX0FVRFNSQ19OT19JTlBVVDsK
LQkJaWYgKHRjX3Rlc3RfcGF0dGVybikKLQkJCXZhbHVlIHw9IERQMF9WSURTUkNfQ09MT1JfQkFS
OwotCQllbHNlCi0JCQl2YWx1ZSB8PSBEUDBfVklEU1JDX0RQSV9SWDsKLQkJdGNfd3JpdGUoU1lT
Q1RSTCwgdmFsdWUpOwotCX0gZWxzZSB7Ci0JCXRjX3dyaXRlKERQMENUTCwgMCk7Ci0JfQorCXZh
bHVlID0gVklEX01OX0dFTiB8IERQX0VOOworCWlmICh0Yy0+bGluay5iYXNlLmNhcGFiaWxpdGll
cyAmIERQX0xJTktfQ0FQX0VOSEFOQ0VEX0ZSQU1JTkcpCisJCXZhbHVlIHw9IEVGX0VOOworCXRj
X3dyaXRlKERQMENUTCwgdmFsdWUpOworCS8qCisJICogVklEX0VOIGFzc2VydGlvbiBzaG91bGQg
YmUgZGVsYXllZCBieSBhdCBsZWFzdCBOICogTFNDTEsKKwkgKiBjeWNsZXMgZnJvbSB0aGUgdGlt
ZSBWSURfTU5fR0VOIGlzIGVuYWJsZWQgaW4gb3JkZXIgdG8KKwkgKiBnZW5lcmF0ZSBzdGFibGUg
dmFsdWVzIGZvciBWSURfTS4gTFNDTEsgaXMgMjcwIE1IeiBvcgorCSAqIDE2MiBNSHosIFZJRF9O
IGlzIHNldCB0byAzMjc2OCBpbiAgdGNfc3RyZWFtX2Nsb2NrX2NhbGMoKSwKKwkgKiBzbyBhIGRl
bGF5IG9mIGF0IGxlYXN0IDIwMyB1cyBzaG91bGQgc3VmZmljZS4KKwkgKi8KKwl1c2xlZXBfcmFu
Z2UoNTAwLCAxMDAwKTsKKwl2YWx1ZSB8PSBWSURfRU47CisJdGNfd3JpdGUoRFAwQ1RMLCB2YWx1
ZSk7CisJLyogU2V0IGlucHV0IGludGVyZmFjZSAqLworCXZhbHVlID0gRFAwX0FVRFNSQ19OT19J
TlBVVDsKKwlpZiAodGNfdGVzdF9wYXR0ZXJuKQorCQl2YWx1ZSB8PSBEUDBfVklEU1JDX0NPTE9S
X0JBUjsKKwllbHNlCisJCXZhbHVlIHw9IERQMF9WSURTUkNfRFBJX1JYOworCXRjX3dyaXRlKFNZ
U0NUUkwsIHZhbHVlKTsKKworCXJldHVybiAwOworZXJyOgorCXJldHVybiByZXQ7Cit9CisKK3N0
YXRpYyBpbnQgdGNfc3RyZWFtX2Rpc2FibGUoc3RydWN0IHRjX2RhdGEgKnRjKQoreworCWludCBy
ZXQ7CisKKwlkZXZfZGJnKHRjLT5kZXYsICJkaXNhYmxlIHZpZGVvIHN0cmVhbVxuIik7CisKKwl0
Y193cml0ZShEUDBDVEwsIDApOwogCiAJcmV0dXJuIDA7CiBlcnI6CkBAIC0xMDc5LDcgKzEwODgs
NyBAQCBzdGF0aWMgdm9pZCB0Y19icmlkZ2VfZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlk
Z2UpCiAJCXJldHVybjsKIAl9CiAKLQlyZXQgPSB0Y19tYWluX2xpbmtfc3RyZWFtKHRjLCAxKTsK
KwlyZXQgPSB0Y19zdHJlYW1fZW5hYmxlKHRjKTsKIAlpZiAocmV0IDwgMCkgewogCQlkZXZfZXJy
KHRjLT5kZXYsICJtYWluIGxpbmsgc3RyZWFtIHN0YXJ0IGVycm9yOiAlZFxuIiwgcmV0KTsKIAkJ
cmV0dXJuOwpAQCAtMTA5NSw3ICsxMTA0LDcgQEAgc3RhdGljIHZvaWQgdGNfYnJpZGdlX2Rpc2Fi
bGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAogCWRybV9wYW5lbF9kaXNhYmxlKHRjLT5w
YW5lbCk7CiAKLQlyZXQgPSB0Y19tYWluX2xpbmtfc3RyZWFtKHRjLCAwKTsKKwlyZXQgPSB0Y19z
dHJlYW1fZGlzYWJsZSh0Yyk7CiAJaWYgKHJldCA8IDApCiAJCWRldl9lcnIodGMtPmRldiwgIm1h
aW4gbGluayBzdHJlYW0gc3RvcCBlcnJvcjogJWRcbiIsIHJldCk7CiB9Ci0tIApUZXhhcyBJbnN0
cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10
dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lu
a2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
