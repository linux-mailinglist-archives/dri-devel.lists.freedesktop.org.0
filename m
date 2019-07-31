Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980537C1E1
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 14:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2973189CE0;
	Wed, 31 Jul 2019 12:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DBD89CE0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 12:44:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3CD6208E3;
 Wed, 31 Jul 2019 12:44:04 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 10/10] video: fbdev: sm501fb: convert platform driver to
 use dev_groups
Date: Wed, 31 Jul 2019 14:43:49 +0200
Message-Id: <20190731124349.4474-11-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731124349.4474-1-gregkh@linuxfoundation.org>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564577045;
 bh=dOauvtVe9yCPSP0ChARSYwAi6eemkfSk00etuTmxP94=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rDjo31Gp98T2gFdLY039cbiyj4PAacUBKvstkRQIB1ZAszuZ1lLwgJ4RrJkSdwedK
 d8bygUyV0zt4ievvAetFIsLr45vONXfpE6cNuMsj1/U+1gbVbvEBKFFUFaOlfvJR9x
 E8ronTcaI/nWIQomapLDtcVwHuImfvVG+Qvtqmtk=
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxhdGZvcm0gZHJpdmVycyBub3cgaGF2ZSB0aGUgb3B0aW9uIHRvIGhhdmUgdGhlIHBsYXRmb3Jt
IGNvcmUgY3JlYXRlCmFuZCByZW1vdmUgYW55IG5lZWRlZCBzeXNmcyBhdHRyaWJ1dGUgZmlsZXMu
ICBTbyB0YWtlIGFkdmFudGFnZSBvZiB0aGF0CmFuZCBkbyBub3QgcmVnaXN0ZXIgImJ5IGhhbmQi
IGEgYnVuY2ggb2Ygc3lzZnMgZmlsZXMuCgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnCkFja2VkLWJ5OiBCYXJ0bG9taWVq
IFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJp
dmVycy92aWRlby9mYmRldi9zbTUwMWZiLmMgfCAzNyArKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zbTUwMWZiLmMgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L3NtNTAxZmIuYwppbmRleCA2ZWRiNDQ5MmU2NzUuLjNkZDFiMWQ3NmU5OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zbTUwMWZiLmMKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9zbTUwMWZiLmMKQEAgLTEyNzEsNiArMTI3MSwxNCBAQCBzdGF0aWMgc3NpemVf
dCBzbTUwMWZiX2RlYnVnX3Nob3dfcG5sKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIERF
VklDRV9BVFRSKGZicmVnc19wbmwsIDA0NDQsIHNtNTAxZmJfZGVidWdfc2hvd19wbmwsIE5VTEwp
OwogCitzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqc201MDFmYl9hdHRyc1tdID0geworCSZkZXZf
YXR0cl9jcnRfc3JjLmF0dHIsCisJJmRldl9hdHRyX2ZicmVnc19wbmwuYXR0ciwKKwkmZGV2X2F0
dHJfZmJyZWdzX2NydC5hdHRyLAorCU5VTEwsCit9OworQVRUUklCVVRFX0dST1VQUyhzbTUwMWZi
KTsKKwogLyogYWNjZWxlcmF0aW9uIG9wZXJhdGlvbnMgKi8KIHN0YXRpYyBpbnQgc201MDFmYl9z
eW5jKHN0cnVjdCBmYl9pbmZvICppbmZvKQogewpAQCAtMjAxMSwzMyArMjAxOSw5IEBAIHN0YXRp
YyBpbnQgc201MDFmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3Rv
IGVycl9zdGFydGVkX2NydDsKIAl9CiAKLQkvKiBjcmVhdGUgZGV2aWNlIGZpbGVzICovCi0KLQly
ZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfY3J0X3NyYyk7Ci0JaWYgKHJl
dCkKLQkJZ290byBlcnJfc3RhcnRlZF9wYW5lbDsKLQotCXJldCA9IGRldmljZV9jcmVhdGVfZmls
ZShkZXYsICZkZXZfYXR0cl9mYnJlZ3NfcG5sKTsKLQlpZiAocmV0KQotCQlnb3RvIGVycl9hdHRh
Y2hlZF9jcnRzcmNfZmlsZTsKLQotCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShkZXYsICZkZXZf
YXR0cl9mYnJlZ3NfY3J0KTsKLQlpZiAocmV0KQotCQlnb3RvIGVycl9hdHRhY2hlZF9wbmxyZWdz
X2ZpbGU7Ci0KIAkvKiB3ZSByZWdpc3RlcmVkLCByZXR1cm4gb2sgKi8KIAlyZXR1cm4gMDsKIAot
ZXJyX2F0dGFjaGVkX3BubHJlZ3NfZmlsZToKLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoZGV2LCAmZGV2
X2F0dHJfZmJyZWdzX3BubCk7Ci0KLWVycl9hdHRhY2hlZF9jcnRzcmNfZmlsZToKLQlkZXZpY2Vf
cmVtb3ZlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfY3J0X3NyYyk7Ci0KLWVycl9zdGFydGVkX3BhbmVs
OgotCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mby0+ZmJbSEVBRF9QQU5FTF0pOwotCXNtNTAx
X2ZyZWVfaW5pdF9mYihpbmZvLCBIRUFEX1BBTkVMKTsKLQogZXJyX3N0YXJ0ZWRfY3J0OgogCXVu
cmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mby0+ZmJbSEVBRF9DUlRdKTsKIAlzbTUwMV9mcmVlX2lu
aXRfZmIoaW5mbywgSEVBRF9DUlQpOwpAQCAtMjA2NywxMCArMjA1MSw2IEBAIHN0YXRpYyBpbnQg
c201MDFmYl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgZmJf
aW5mbwkgICAqZmJpbmZvX2NydCA9IGluZm8tPmZiWzBdOwogCXN0cnVjdCBmYl9pbmZvCSAgICpm
YmluZm9fcG5sID0gaW5mby0+ZmJbMV07CiAKLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJnBkZXYtPmRl
diwgJmRldl9hdHRyX2ZicmVnc19jcnQpOwotCWRldmljZV9yZW1vdmVfZmlsZSgmcGRldi0+ZGV2
LCAmZGV2X2F0dHJfZmJyZWdzX3BubCk7Ci0JZGV2aWNlX3JlbW92ZV9maWxlKCZwZGV2LT5kZXYs
ICZkZXZfYXR0cl9jcnRfc3JjKTsKLQogCXNtNTAxX2ZyZWVfaW5pdF9mYihpbmZvLCBIRUFEX0NS
VCk7CiAJc201MDFfZnJlZV9pbml0X2ZiKGluZm8sIEhFQURfUEFORUwpOwogCkBAIC0yMjM0LDYg
KzIyMTQsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBzbTUwMWZiX2RyaXZlciA9
IHsKIAkucmVzdW1lCQk9IHNtNTAxZmJfcmVzdW1lLAogCS5kcml2ZXIJCT0gewogCQkubmFtZQk9
ICJzbTUwMS1mYiIsCisJCS5kZXZfZ3JvdXBzCT0gc201MDFmYl9ncm91cHMsCiAJfSwKIH07CiAK
LS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
