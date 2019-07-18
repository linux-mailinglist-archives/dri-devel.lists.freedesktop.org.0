Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EA6C47E
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6EFF6E2D8;
	Thu, 18 Jul 2019 01:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953536E2D7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F20C130917A8;
 Thu, 18 Jul 2019 01:44:41 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23AB119C67;
 Thu, 18 Jul 2019 01:44:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/26] drm/dp_mst: Cleanup drm_dp_send_link_address() a bit
Date: Wed, 17 Jul 2019 21:42:37 -0400
Message-Id: <20190718014329.8107-15-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Thu, 18 Jul 2019 01:44:42 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
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
bnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVk
ZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMg
fCA0MiArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNl
cnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwppbmRleCAyNjU0MWFmNDdkOTEuLjEzYWRmYjc3YmYwMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jCkBAIC0yMzExLDkgKzIzMTEsOSBAQCBkcm1fZHBfZHVtcF9saW5r
X2FkZHJlc3Moc3RydWN0IGRybV9kcF9saW5rX2FkZHJlc3NfYWNrX3JlcGx5ICpyZXBseSkKIHN0
YXRpYyB2b2lkIGRybV9kcF9zZW5kX2xpbmtfYWRkcmVzcyhzdHJ1Y3QgZHJtX2RwX21zdF90b3Bv
bG9neV9tZ3IgKm1nciwKIAkJCQkgICAgIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YikK
IHsKLQlpbnQgbGVuOwogCXN0cnVjdCBkcm1fZHBfc2lkZWJhbmRfbXNnX3R4ICp0eG1zZzsKLQlp
bnQgcmV0OworCXN0cnVjdCBkcm1fZHBfbGlua19hZGRyZXNzX2Fja19yZXBseSAqcmVwbHk7CisJ
aW50IGksIGxlbiwgcmV0OwogCiAJdHhtc2cgPSBremFsbG9jKHNpemVvZigqdHhtc2cpLCBHRlBf
S0VSTkVMKTsKIAlpZiAoIXR4bXNnKQpAQCAtMjMyNSwyOCArMjMyNSwzMiBAQCBzdGF0aWMgdm9p
ZCBkcm1fZHBfc2VuZF9saW5rX2FkZHJlc3Moc3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdy
ICptZ3IsCiAJbXN0Yi0+bGlua19hZGRyZXNzX3NlbnQgPSB0cnVlOwogCWRybV9kcF9xdWV1ZV9k
b3duX3R4KG1nciwgdHhtc2cpOwogCisJLyogRklYTUU6IEFjdHVhbGx5IGRvIHNvbWUgcmVhbCBl
cnJvciBoYW5kbGluZyBoZXJlICovCiAJcmV0ID0gZHJtX2RwX21zdF93YWl0X3R4X3JlcGx5KG1z
dGIsIHR4bXNnKTsKLQlpZiAocmV0ID4gMCkgewotCQlpbnQgaTsKKwlpZiAocmV0IDw9IDApIHsK
KwkJRFJNX0VSUk9SKCJTZW5kaW5nIGxpbmsgYWRkcmVzcyBmYWlsZWQgd2l0aCAlZFxuIiwgcmV0
KTsKKwkJZ290byBvdXQ7CisJfQorCWlmICh0eG1zZy0+cmVwbHkucmVwbHlfdHlwZSA9PSBEUF9T
SURFQkFORF9SRVBMWV9OQUspIHsKKwkJRFJNX0VSUk9SKCJsaW5rIGFkZHJlc3MgTkFLIHJlY2Vp
dmVkXG4iKTsKKwkJcmV0ID0gLUVJTzsKKwkJZ290byBvdXQ7CisJfQogCi0JCWlmICh0eG1zZy0+
cmVwbHkucmVwbHlfdHlwZSA9PSBEUF9TSURFQkFORF9SRVBMWV9OQUspIHsKLQkJCURSTV9ERUJV
R19LTVMoImxpbmsgYWRkcmVzcyBuYWsgcmVjZWl2ZWRcbiIpOwotCQl9IGVsc2UgewotCQkJRFJN
X0RFQlVHX0tNUygibGluayBhZGRyZXNzIHJlcGx5OiAlZFxuIiwgdHhtc2ctPnJlcGx5LnUubGlu
a19hZGRyLm5wb3J0cyk7Ci0JCQlkcm1fZHBfZHVtcF9saW5rX2FkZHJlc3MoJnR4bXNnLT5yZXBs
eS51LmxpbmtfYWRkcik7CisJcmVwbHkgPSAmdHhtc2ctPnJlcGx5LnUubGlua19hZGRyOworCURS
TV9ERUJVR19LTVMoImxpbmsgYWRkcmVzcyByZXBseTogJWRcbiIsIHJlcGx5LT5ucG9ydHMpOwor
CWRybV9kcF9kdW1wX2xpbmtfYWRkcmVzcyhyZXBseSk7CiAKLQkJCWRybV9kcF9jaGVja19tc3Ri
X2d1aWQobXN0YiwgdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLmd1aWQpOworCWRybV9kcF9jaGVj
a19tc3RiX2d1aWQobXN0YiwgcmVwbHktPmd1aWQpOwogCi0JCQlmb3IgKGkgPSAwOyBpIDwgdHht
c2ctPnJlcGx5LnUubGlua19hZGRyLm5wb3J0czsgaSsrKSB7Ci0JCQkJZHJtX2RwX2FkZF9wb3J0
KG1zdGIsIG1nci0+ZGV2LCAmdHhtc2ctPnJlcGx5LnUubGlua19hZGRyLnBvcnRzW2ldKTsKLQkJ
CX0KLQkJCWRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQobWdyLT5kZXYpOwotCQl9Ci0JfSBl
bHNlIHsKLQkJbXN0Yi0+bGlua19hZGRyZXNzX3NlbnQgPSBmYWxzZTsKLQkJRFJNX0RFQlVHX0tN
UygibGluayBhZGRyZXNzIGZhaWxlZCAlZFxuIiwgcmV0KTsKLQl9CisJZm9yIChpID0gMDsgaSA8
IHJlcGx5LT5ucG9ydHM7IGkrKykKKwkJZHJtX2RwX2FkZF9wb3J0KG1zdGIsIG1nci0+ZGV2LCAm
cmVwbHktPnBvcnRzW2ldKTsKKworCWRybV9rbXNfaGVscGVyX2hvdHBsdWdfZXZlbnQobWdyLT5k
ZXYpOwogCitvdXQ6CisJaWYgKHJldCA8PSAwKQorCQltc3RiLT5saW5rX2FkZHJlc3Nfc2VudCA9
IGZhbHNlOwogCWtmcmVlKHR4bXNnKTsKIH0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
