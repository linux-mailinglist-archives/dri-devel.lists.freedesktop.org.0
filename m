Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8EA7561
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C042D89BF4;
	Tue,  3 Sep 2019 20:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B78A89BF4;
 Tue,  3 Sep 2019 20:48:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1582F30860BD;
 Tue,  3 Sep 2019 20:48:31 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA44F1001B08;
 Tue,  3 Sep 2019 20:48:29 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 15/27] drm/dp_mst: Cleanup drm_dp_send_link_address() a bit
Date: Tue,  3 Sep 2019 16:45:53 -0400
Message-Id: <20190903204645.25487-16-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Tue, 03 Sep 2019 20:48:31 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVjbGFyZSBsb2NhbCBwb2ludGVyIHRvIHRoZSBkcm1fZHBfbGlua19hZGRyZXNzX2Fja19yZXBs
eSBzdHJ1Y3QKaW5zdGVhZCBvZiBjb25zdGFudGx5IGRlcmVmZXJlbmNpbmcgaXQgdGhyb3VnaCB0
aGUgdW5pb24gaW4KdHhtc2ctPnJlcGx5LiBUaGVuLCBpbnZlcnQgdGhlIG9yZGVyIG9mIGNvbmRp
dGlvbmFscyBzbyB3ZSBkb24ndCBoYXZlIHRvCmRvIHRoZSBidWxrIG9mIHRoZSB3b3JrIGluc2lk
ZSB0aGVtLCBhbmQgY2FuIHdyYXAgbGluZXMgZXZlbiBsZXNzLiBUaGVuCmZpbmFsbHksIHJlYXJy
YW5nZSB2YXJpYWJsZSBkZWNsYXJhdGlvbnMgYSBiaXQuCgpDYzogSnVzdG9uIExpIDxqdXN0b24u
bGlAaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdl
bnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgNDIgKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTkg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggMmY4
OGNjMTczNTAwLi5kMTYxMDQzNGEwY2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwpAQCAtMjM5OCw5ICsyMzk4LDkgQEAgZHJtX2RwX2R1bXBfbGlua19hZGRyZXNzKHN0cnVj
dCBkcm1fZHBfbGlua19hZGRyZXNzX2Fja19yZXBseSAqcmVwbHkpCiBzdGF0aWMgdm9pZCBkcm1f
ZHBfc2VuZF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptZ3Is
CiAJCQkJICAgICBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIpCiB7Ci0JaW50IGxlbjsK
IAlzdHJ1Y3QgZHJtX2RwX3NpZGViYW5kX21zZ190eCAqdHhtc2c7Ci0JaW50IHJldDsKKwlzdHJ1
Y3QgZHJtX2RwX2xpbmtfYWRkcmVzc19hY2tfcmVwbHkgKnJlcGx5OworCWludCBpLCBsZW4sIHJl
dDsKIAogCXR4bXNnID0ga3phbGxvYyhzaXplb2YoKnR4bXNnKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KCF0eG1zZykKQEAgLTI0MTIsMjggKzI0MTIsMzIgQEAgc3RhdGljIHZvaWQgZHJtX2RwX3NlbmRf
bGlua19hZGRyZXNzKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCW1zdGIt
PmxpbmtfYWRkcmVzc19zZW50ID0gdHJ1ZTsKIAlkcm1fZHBfcXVldWVfZG93bl90eChtZ3IsIHR4
bXNnKTsKIAorCS8qIEZJWE1FOiBBY3R1YWxseSBkbyBzb21lIHJlYWwgZXJyb3IgaGFuZGxpbmcg
aGVyZSAqLwogCXJldCA9IGRybV9kcF9tc3Rfd2FpdF90eF9yZXBseShtc3RiLCB0eG1zZyk7Ci0J
aWYgKHJldCA+IDApIHsKLQkJaW50IGk7CisJaWYgKHJldCA8PSAwKSB7CisJCURSTV9FUlJPUigi
U2VuZGluZyBsaW5rIGFkZHJlc3MgZmFpbGVkIHdpdGggJWRcbiIsIHJldCk7CisJCWdvdG8gb3V0
OworCX0KKwlpZiAodHhtc2ctPnJlcGx5LnJlcGx5X3R5cGUgPT0gRFBfU0lERUJBTkRfUkVQTFlf
TkFLKSB7CisJCURSTV9FUlJPUigibGluayBhZGRyZXNzIE5BSyByZWNlaXZlZFxuIik7CisJCXJl
dCA9IC1FSU87CisJCWdvdG8gb3V0OworCX0KIAotCQlpZiAodHhtc2ctPnJlcGx5LnJlcGx5X3R5
cGUgPT0gRFBfU0lERUJBTkRfUkVQTFlfTkFLKSB7Ci0JCQlEUk1fREVCVUdfS01TKCJsaW5rIGFk
ZHJlc3MgbmFrIHJlY2VpdmVkXG4iKTsKLQkJfSBlbHNlIHsKLQkJCURSTV9ERUJVR19LTVMoImxp
bmsgYWRkcmVzcyByZXBseTogJWRcbiIsIHR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5ucG9ydHMp
OwotCQkJZHJtX2RwX2R1bXBfbGlua19hZGRyZXNzKCZ0eG1zZy0+cmVwbHkudS5saW5rX2FkZHIp
OworCXJlcGx5ID0gJnR4bXNnLT5yZXBseS51LmxpbmtfYWRkcjsKKwlEUk1fREVCVUdfS01TKCJs
aW5rIGFkZHJlc3MgcmVwbHk6ICVkXG4iLCByZXBseS0+bnBvcnRzKTsKKwlkcm1fZHBfZHVtcF9s
aW5rX2FkZHJlc3MocmVwbHkpOwogCi0JCQlkcm1fZHBfY2hlY2tfbXN0Yl9ndWlkKG1zdGIsIHR4
bXNnLT5yZXBseS51LmxpbmtfYWRkci5ndWlkKTsKKwlkcm1fZHBfY2hlY2tfbXN0Yl9ndWlkKG1z
dGIsIHJlcGx5LT5ndWlkKTsKIAotCQkJZm9yIChpID0gMDsgaSA8IHR4bXNnLT5yZXBseS51Lmxp
bmtfYWRkci5ucG9ydHM7IGkrKykgewotCQkJCWRybV9kcF9hZGRfcG9ydChtc3RiLCBtZ3ItPmRl
diwgJnR4bXNnLT5yZXBseS51LmxpbmtfYWRkci5wb3J0c1tpXSk7Ci0JCQl9Ci0JCQlkcm1fa21z
X2hlbHBlcl9ob3RwbHVnX2V2ZW50KG1nci0+ZGV2KTsKLQkJfQotCX0gZWxzZSB7Ci0JCW1zdGIt
PmxpbmtfYWRkcmVzc19zZW50ID0gZmFsc2U7Ci0JCURSTV9ERUJVR19LTVMoImxpbmsgYWRkcmVz
cyBmYWlsZWQgJWRcbiIsIHJldCk7Ci0JfQorCWZvciAoaSA9IDA7IGkgPCByZXBseS0+bnBvcnRz
OyBpKyspCisJCWRybV9kcF9hZGRfcG9ydChtc3RiLCBtZ3ItPmRldiwgJnJlcGx5LT5wb3J0c1tp
XSk7CisKKwlkcm1fa21zX2hlbHBlcl9ob3RwbHVnX2V2ZW50KG1nci0+ZGV2KTsKIAorb3V0Ogor
CWlmIChyZXQgPD0gMCkKKwkJbXN0Yi0+bGlua19hZGRyZXNzX3NlbnQgPSBmYWxzZTsKIAlrZnJl
ZSh0eG1zZyk7CiB9CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
