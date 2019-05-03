Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F0A12D98
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C1C89E9E;
	Fri,  3 May 2019 12:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E87B89E98
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CUxpB032330;
 Fri, 3 May 2019 07:30:59 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CUxtU128266
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:30:59 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:30:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:30:57 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtq002029;
 Fri, 3 May 2019 07:30:55 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 08/23] drm/bridge: tc358767: split stream enable/disable
Date: Fri, 3 May 2019 15:29:34 +0300
Message-ID: <20190503122949.12266-9-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886659;
 bh=/D7uxwhKjLDZVQj+zONFbgZJ1Sbz1HkhsYC/GjmJG4c=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=hjkSuB8VZ29Xv0EVXQVkVu5fzCRlCvO/EtTjV0fgibjHniMSwkfIgPbYlmUsZb1OI
 kuOVwTz5HsLoKuHk0KRJR4doS6uDZrH3lvoKt4MVA766AYo0Kk1+eGXNtMVR6ZBZpU
 sCUF8yzD4AWZ04q3J3zKgquK3cBTMwonCnqxEsxc=
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
Zi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgfCA4MSArKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4IDhkYzYzZGUzOWU3My4uNjQxMjk1YWMy
YzBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCkBAIC0xMDE0LDQ3ICsxMDE0LDU2IEBA
IHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0YykKIAlyZXR1
cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IHRjX21haW5fbGlua19zdHJlYW0oc3RydWN0IHRjX2Rh
dGEgKnRjLCBpbnQgc3RhdGUpCitzdGF0aWMgaW50IHRjX3N0cmVhbV9lbmFibGUoc3RydWN0IHRj
X2RhdGEgKnRjKQogewogCWludCByZXQ7CiAJdTMyIHZhbHVlOwogCi0JZGV2X2RiZyh0Yy0+ZGV2
LCAic3RyZWFtOiAlZFxuIiwgc3RhdGUpOworCWRldl9kYmcodGMtPmRldiwgImVuYWJsZSB2aWRl
byBzdHJlYW1cbiIpOwogCi0JaWYgKHN0YXRlKSB7Ci0JCXJldCA9IHRjX3NldF92aWRlb19tb2Rl
KHRjLCB0Yy0+bW9kZSk7Ci0JCWlmIChyZXQpCi0JCQlnb3RvIGVycjsKKwlyZXQgPSB0Y19zZXRf
dmlkZW9fbW9kZSh0YywgdGMtPm1vZGUpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQkJ
LyogU2V0IE0vTiAqLwotCQlyZXQgPSB0Y19zdHJlYW1fY2xvY2tfY2FsYyh0Yyk7Ci0JCWlmIChy
ZXQpCi0JCQlnb3RvIGVycjsKKwkvKiBTZXQgTS9OICovCisJcmV0ID0gdGNfc3RyZWFtX2Nsb2Nr
X2NhbGModGMpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQkJdmFsdWUgPSBWSURfTU5f
R0VOIHwgRFBfRU47Ci0JCWlmICh0Yy0+bGluay5iYXNlLmNhcGFiaWxpdGllcyAmIERQX0xJTktf
Q0FQX0VOSEFOQ0VEX0ZSQU1JTkcpCi0JCQl2YWx1ZSB8PSBFRl9FTjsKLQkJdGNfd3JpdGUoRFAw
Q1RMLCB2YWx1ZSk7Ci0JCS8qCi0JCSAqIFZJRF9FTiBhc3NlcnRpb24gc2hvdWxkIGJlIGRlbGF5
ZWQgYnkgYXQgbGVhc3QgTiAqIExTQ0xLCi0JCSAqIGN5Y2xlcyBmcm9tIHRoZSB0aW1lIFZJRF9N
Tl9HRU4gaXMgZW5hYmxlZCBpbiBvcmRlciB0bwotCQkgKiBnZW5lcmF0ZSBzdGFibGUgdmFsdWVz
IGZvciBWSURfTS4gTFNDTEsgaXMgMjcwIE1IeiBvcgotCQkgKiAxNjIgTUh6LCBWSURfTiBpcyBz
ZXQgdG8gMzI3NjggaW4gIHRjX3N0cmVhbV9jbG9ja19jYWxjKCksCi0JCSAqIHNvIGEgZGVsYXkg
b2YgYXQgbGVhc3QgMjAzIHVzIHNob3VsZCBzdWZmaWNlLgotCQkgKi8KLQkJdXNsZWVwX3Jhbmdl
KDUwMCwgMTAwMCk7Ci0JCXZhbHVlIHw9IFZJRF9FTjsKLQkJdGNfd3JpdGUoRFAwQ1RMLCB2YWx1
ZSk7Ci0JCS8qIFNldCBpbnB1dCBpbnRlcmZhY2UgKi8KLQkJdmFsdWUgPSBEUDBfQVVEU1JDX05P
X0lOUFVUOwotCQlpZiAodGNfdGVzdF9wYXR0ZXJuKQotCQkJdmFsdWUgfD0gRFAwX1ZJRFNSQ19D
T0xPUl9CQVI7Ci0JCWVsc2UKLQkJCXZhbHVlIHw9IERQMF9WSURTUkNfRFBJX1JYOwotCQl0Y193
cml0ZShTWVNDVFJMLCB2YWx1ZSk7Ci0JfSBlbHNlIHsKLQkJdGNfd3JpdGUoRFAwQ1RMLCAwKTsK
LQl9CisJdmFsdWUgPSBWSURfTU5fR0VOIHwgRFBfRU47CisJaWYgKHRjLT5saW5rLmJhc2UuY2Fw
YWJpbGl0aWVzICYgRFBfTElOS19DQVBfRU5IQU5DRURfRlJBTUlORykKKwkJdmFsdWUgfD0gRUZf
RU47CisJdGNfd3JpdGUoRFAwQ1RMLCB2YWx1ZSk7CisJLyoKKwkgKiBWSURfRU4gYXNzZXJ0aW9u
IHNob3VsZCBiZSBkZWxheWVkIGJ5IGF0IGxlYXN0IE4gKiBMU0NMSworCSAqIGN5Y2xlcyBmcm9t
IHRoZSB0aW1lIFZJRF9NTl9HRU4gaXMgZW5hYmxlZCBpbiBvcmRlciB0bworCSAqIGdlbmVyYXRl
IHN0YWJsZSB2YWx1ZXMgZm9yIFZJRF9NLiBMU0NMSyBpcyAyNzAgTUh6IG9yCisJICogMTYyIE1I
eiwgVklEX04gaXMgc2V0IHRvIDMyNzY4IGluICB0Y19zdHJlYW1fY2xvY2tfY2FsYygpLAorCSAq
IHNvIGEgZGVsYXkgb2YgYXQgbGVhc3QgMjAzIHVzIHNob3VsZCBzdWZmaWNlLgorCSAqLworCXVz
bGVlcF9yYW5nZSg1MDAsIDEwMDApOworCXZhbHVlIHw9IFZJRF9FTjsKKwl0Y193cml0ZShEUDBD
VEwsIHZhbHVlKTsKKwkvKiBTZXQgaW5wdXQgaW50ZXJmYWNlICovCisJdmFsdWUgPSBEUDBfQVVE
U1JDX05PX0lOUFVUOworCWlmICh0Y190ZXN0X3BhdHRlcm4pCisJCXZhbHVlIHw9IERQMF9WSURT
UkNfQ09MT1JfQkFSOworCWVsc2UKKwkJdmFsdWUgfD0gRFAwX1ZJRFNSQ19EUElfUlg7CisJdGNf
d3JpdGUoU1lTQ1RSTCwgdmFsdWUpOworCisJcmV0dXJuIDA7CitlcnI6CisJcmV0dXJuIHJldDsK
K30KKworc3RhdGljIGludCB0Y19zdHJlYW1fZGlzYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCit7
CisJaW50IHJldDsKKworCWRldl9kYmcodGMtPmRldiwgImRpc2FibGUgdmlkZW8gc3RyZWFtXG4i
KTsKKworCXRjX3dyaXRlKERQMENUTCwgMCk7CiAKIAlyZXR1cm4gMDsKIGVycjoKQEAgLTEwNzks
NyArMTA4OCw3IEBAIHN0YXRpYyB2b2lkIHRjX2JyaWRnZV9lbmFibGUoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkKIAkJcmV0dXJuOwogCX0KIAotCXJldCA9IHRjX21haW5fbGlua19zdHJlYW0o
dGMsIDEpOworCXJldCA9IHRjX3N0cmVhbV9lbmFibGUodGMpOwogCWlmIChyZXQgPCAwKSB7CiAJ
CWRldl9lcnIodGMtPmRldiwgIm1haW4gbGluayBzdHJlYW0gc3RhcnQgZXJyb3I6ICVkXG4iLCBy
ZXQpOwogCQlyZXR1cm47CkBAIC0xMDk1LDcgKzExMDQsNyBAQCBzdGF0aWMgdm9pZCB0Y19icmlk
Z2VfZGlzYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQogCiAJZHJtX3BhbmVsX2Rpc2Fi
bGUodGMtPnBhbmVsKTsKIAotCXJldCA9IHRjX21haW5fbGlua19zdHJlYW0odGMsIDApOworCXJl
dCA9IHRjX3N0cmVhbV9kaXNhYmxlKHRjKTsKIAlpZiAocmV0IDwgMCkKIAkJZGV2X2Vycih0Yy0+
ZGV2LCAibWFpbiBsaW5rIHN0cmVhbSBzdG9wIGVycm9yOiAlZFxuIiwgcmV0KTsKIH0KLS0gClRl
eGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNp
bmtpLgpZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxl
OiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
