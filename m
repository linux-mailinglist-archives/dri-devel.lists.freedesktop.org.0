Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1170435B4
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F4989930;
	Thu, 13 Jun 2019 11:56:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45A89930;
 Thu, 13 Jun 2019 11:56:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 943BE20B7C;
 Thu, 13 Jun 2019 11:56:33 +0000 (UTC)
Date: Thu, 13 Jun 2019 13:56:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] radeon: no need to check return value of debugfs_create
 functions
Message-ID: <20190613115631.GA26335@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560426994;
 bh=cGJyFNSysBKkEbGag0nFtQzufbw2Vomx+jBegJ+zSy4=;
 h=Date:From:To:Cc:Subject:From;
 b=euB+iT7RGXopB+VvsAPWagPTpzwr+YZPThevHDay7Dm51jKH4GjmRyG3P+IzS4+ed
 HvB5qSJ6mi7tWJ/JFhMTFUfmI2mXzojQkvDp3GdvREkFa0yhHfvdihy0xLurJO7TFZ
 +tVWxF4xGE5NCfYOk/dqa7wOyMwBE7mRGSbdqrRg=
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBjYWxsaW5nIGRlYnVnZnMgZnVuY3Rpb25zLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV2ZXIg
Y2hlY2sgdGhlCnJldHVybiB2YWx1ZS4gIFRoZSBmdW5jdGlvbiBjYW4gd29yayBvciBub3QsIGJ1
dCB0aGUgY29kZSBsb2dpYyBzaG91bGQKbmV2ZXIgZG8gc29tZXRoaW5nIGRpZmZlcmVudCBiYXNl
ZCBvbiB0aGlzLgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
Q2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogIkRh
dmlkIChDaHVuTWluZykgWmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBs
aW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jIHwgMjEgKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCmlu
ZGV4IDVkNDJmOGQ4ZTY4ZC4uNmJiY2NjNzk2ZTQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uYwpAQCAtMTA1NiwxOSArMTA1NiwxNCBAQCBzdGF0aWMgaW50IHJhZGVvbl90dG1fZGVi
dWdmc19pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogCXVuc2lnbmVkIGNvdW50Owog
CiAJc3RydWN0IGRybV9taW5vciAqbWlub3IgPSByZGV2LT5kZGV2LT5wcmltYXJ5OwotCXN0cnVj
dCBkZW50cnkgKmVudCwgKnJvb3QgPSBtaW5vci0+ZGVidWdmc19yb290OwotCi0JZW50ID0gZGVi
dWdmc19jcmVhdGVfZmlsZSgicmFkZW9uX3ZyYW0iLCBTX0lGUkVHIHwgU19JUlVHTywgcm9vdCwK
LQkJCQkgIHJkZXYsICZyYWRlb25fdHRtX3ZyYW1fZm9wcyk7Ci0JaWYgKElTX0VSUihlbnQpKQot
CQlyZXR1cm4gUFRSX0VSUihlbnQpOwotCXJkZXYtPm1tYW4udnJhbSA9IGVudDsKLQotCWVudCA9
IGRlYnVnZnNfY3JlYXRlX2ZpbGUoInJhZGVvbl9ndHQiLCBTX0lGUkVHIHwgU19JUlVHTywgcm9v
dCwKLQkJCQkgIHJkZXYsICZyYWRlb25fdHRtX2d0dF9mb3BzKTsKLQlpZiAoSVNfRVJSKGVudCkp
Ci0JCXJldHVybiBQVFJfRVJSKGVudCk7Ci0JcmRldi0+bW1hbi5ndHQgPSBlbnQ7CisJc3RydWN0
IGRlbnRyeSAqcm9vdCA9IG1pbm9yLT5kZWJ1Z2ZzX3Jvb3Q7CisKKwlyZGV2LT5tbWFuLnZyYW0g
PSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYWRlb25fdnJhbSIsIFNfSUZSRUcgfCBTX0lSVUdPLAor
CQkJCQkgICAgICByb290LCByZGV2LAorCQkJCQkgICAgICAmcmFkZW9uX3R0bV92cmFtX2ZvcHMp
OworCisJcmRldi0+bW1hbi5ndHQgPSBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJyYWRlb25fZ3R0Iiwg
U19JRlJFRyB8IFNfSVJVR08sCisJCQkJCSAgICAgcm9vdCwgcmRldiwgJnJhZGVvbl90dG1fZ3R0
X2ZvcHMpOwogCiAJY291bnQgPSBBUlJBWV9TSVpFKHJhZGVvbl90dG1fZGVidWdmc19saXN0KTsK
IAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
