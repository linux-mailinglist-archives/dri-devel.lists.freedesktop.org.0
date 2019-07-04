Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9C75F4D6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1596E30E;
	Thu,  4 Jul 2019 08:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438F66E30E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:47:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A113F218A6;
 Thu,  4 Jul 2019 08:47:06 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] video: fbdev: sm501fb: convert platform driver to use
 dev_groups
Date: Thu,  4 Jul 2019 10:46:15 +0200
Message-Id: <20190704084617.3602-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190704084617.3602-1-gregkh@linuxfoundation.org>
References: <20190704084617.3602-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562230027;
 bh=9kr+WquUsx/ezUvWIT9JMoBqrRGzTuebO01ejx6/NRw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2TR1gRN+oqWdeQDSWJvCKh7HzTKLd6dE8gajijp4mu1AYkPuXfIlFWNHNkf3Fk426
 XcZJ74dIURrNuzD004fFCALLfWCZSt8ElpRqi2KKTRbXuYF/9pufzkJtKve9vg8odo
 +w5WYKJKuOX7MVh4ZmcbYP+gZkbz3XTG2rLVlNeY=
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
IGEgYnVuY2ggb2Ygc3lzZnMgZmlsZXMuCgpDYzogQmFydGxvbWllaiBab2xuaWVya2lld2ljeiA8
Yi56b2xuaWVya2llQHNhbXN1bmcuY29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcg
S3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy92
aWRlby9mYmRldi9zbTUwMWZiLmMgfCAzNyArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zbTUwMWZiLmMgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L3NtNTAxZmIuYwppbmRleCBkZGU1MmQwMjc0MTYuLmM2MzNlZTc2YTczZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zbTUwMWZiLmMKKysrIGIvZHJpdmVycy92aWRlby9m
YmRldi9zbTUwMWZiLmMKQEAgLTEyNzQsNiArMTI3NCwxNCBAQCBzdGF0aWMgc3NpemVfdCBzbTUw
MWZiX2RlYnVnX3Nob3dfcG5sKHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIERFVklDRV9B
VFRSKGZicmVnc19wbmwsIDA0NDQsIHNtNTAxZmJfZGVidWdfc2hvd19wbmwsIE5VTEwpOwogCitz
dGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqc201MDFmYl9hdHRyc1tdID0geworCSZkZXZfYXR0cl9j
cnRfc3JjLmF0dHIsCisJJmRldl9hdHRyX2ZicmVnc19wbmwuYXR0ciwKKwkmZGV2X2F0dHJfZmJy
ZWdzX2NydC5hdHRyLAorCU5VTEwsCit9OworQVRUUklCVVRFX0dST1VQUyhzbTUwMWZiKTsKKwog
LyogYWNjZWxlcmF0aW9uIG9wZXJhdGlvbnMgKi8KIHN0YXRpYyBpbnQgc201MDFmYl9zeW5jKHN0
cnVjdCBmYl9pbmZvICppbmZvKQogewpAQCAtMjAxNiwzMyArMjAyNCw5IEBAIHN0YXRpYyBpbnQg
c201MDFmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQlnb3RvIGVycl9z
dGFydGVkX2NydDsKIAl9CiAKLQkvKiBjcmVhdGUgZGV2aWNlIGZpbGVzICovCi0KLQlyZXQgPSBk
ZXZpY2VfY3JlYXRlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfY3J0X3NyYyk7Ci0JaWYgKHJldCkKLQkJ
Z290byBlcnJfc3RhcnRlZF9wYW5lbDsKLQotCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShkZXYs
ICZkZXZfYXR0cl9mYnJlZ3NfcG5sKTsKLQlpZiAocmV0KQotCQlnb3RvIGVycl9hdHRhY2hlZF9j
cnRzcmNfZmlsZTsKLQotCXJldCA9IGRldmljZV9jcmVhdGVfZmlsZShkZXYsICZkZXZfYXR0cl9m
YnJlZ3NfY3J0KTsKLQlpZiAocmV0KQotCQlnb3RvIGVycl9hdHRhY2hlZF9wbmxyZWdzX2ZpbGU7
Ci0KIAkvKiB3ZSByZWdpc3RlcmVkLCByZXR1cm4gb2sgKi8KIAlyZXR1cm4gMDsKIAotZXJyX2F0
dGFjaGVkX3BubHJlZ3NfZmlsZToKLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoZGV2LCAmZGV2X2F0dHJf
ZmJyZWdzX3BubCk7Ci0KLWVycl9hdHRhY2hlZF9jcnRzcmNfZmlsZToKLQlkZXZpY2VfcmVtb3Zl
X2ZpbGUoZGV2LCAmZGV2X2F0dHJfY3J0X3NyYyk7Ci0KLWVycl9zdGFydGVkX3BhbmVsOgotCXVu
cmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mby0+ZmJbSEVBRF9QQU5FTF0pOwotCXNtNTAxX2ZyZWVf
aW5pdF9mYihpbmZvLCBIRUFEX1BBTkVMKTsKLQogZXJyX3N0YXJ0ZWRfY3J0OgogCXVucmVnaXN0
ZXJfZnJhbWVidWZmZXIoaW5mby0+ZmJbSEVBRF9DUlRdKTsKIAlzbTUwMV9mcmVlX2luaXRfZmIo
aW5mbywgSEVBRF9DUlQpOwpAQCAtMjA3MiwxMCArMjA1Niw2IEBAIHN0YXRpYyBpbnQgc201MDFm
Yl9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgZmJfaW5mbwkg
ICAqZmJpbmZvX2NydCA9IGluZm8tPmZiWzBdOwogCXN0cnVjdCBmYl9pbmZvCSAgICpmYmluZm9f
cG5sID0gaW5mby0+ZmJbMV07CiAKLQlkZXZpY2VfcmVtb3ZlX2ZpbGUoJnBkZXYtPmRldiwgJmRl
dl9hdHRyX2ZicmVnc19jcnQpOwotCWRldmljZV9yZW1vdmVfZmlsZSgmcGRldi0+ZGV2LCAmZGV2
X2F0dHJfZmJyZWdzX3BubCk7Ci0JZGV2aWNlX3JlbW92ZV9maWxlKCZwZGV2LT5kZXYsICZkZXZf
YXR0cl9jcnRfc3JjKTsKLQogCXNtNTAxX2ZyZWVfaW5pdF9mYihpbmZvLCBIRUFEX0NSVCk7CiAJ
c201MDFfZnJlZV9pbml0X2ZiKGluZm8sIEhFQURfUEFORUwpOwogCkBAIC0yMjMzLDYgKzIyMTMs
NyBAQCBzdGF0aWMgaW50IHNtNTAxZmJfcmVzdW1lKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAjZW5kaWYKIAogc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgc201MDFmYl9kcml2
ZXIgPSB7CisJLmRldl9ncm91cHMJPSBzbTUwMWZiX2dyb3VwcywKIAkucHJvYmUJCT0gc201MDFm
Yl9wcm9iZSwKIAkucmVtb3ZlCQk9IHNtNTAxZmJfcmVtb3ZlLAogCS5zdXNwZW5kCT0gc201MDFm
Yl9zdXNwZW5kLAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
