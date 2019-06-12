Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28941BF1
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECE28921B;
	Wed, 12 Jun 2019 06:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19C68921B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 397EB3F885;
 Wed, 12 Jun 2019 08:03:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.1
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l1xNOtby4Hwy; Wed, 12 Jun 2019 08:03:47 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 3EA723F7C8;
 Wed, 12 Jun 2019 08:03:47 +0200 (CEST)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D9FF1361B6A;
 Wed, 12 Jun 2019 08:03:46 +0200 (CEST)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thellstrom@vmwopensource.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/vmwgfx: Honor the sg list segment size limitation
Date: Wed, 12 Jun 2019 08:03:18 +0200
Message-Id: <20190612060318.42151-2-thellstrom@vmwopensource.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060318.42151-1-thellstrom@vmwopensource.org>
References: <20190612060318.42151-1-thellstrom@vmwopensource.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560319426;
 bh=xsPmZCixZKHH+YHg4b3jTyW05sClhEE9AKNGzoOrAQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vWUK25o6nnOLu4P99hL6fNA5wJlsjXiwgKZGZaYdaTmCbjqUS11iXkkxrA5Fhhh1r
 XgRt4Ie0EEa5+YSlATW1JXIZnkHK7M38QFkSmmXgd2byq6poPihpVfOE0qYS4SLpjH
 G/EfVrr9K9LfE+oAVEceCOtNUD9+lZuq/KImq2Gs=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=vWUK25o6; 
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Deepak Rawat <drawat@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2hlbiBidWls
ZGluZyBzZyB0YWJsZXMsIGhvbm9yIHRoZSBkZXZpY2Ugc2cgbGlzdCBzZWdtZW50IHNpemUgbGlt
aXRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13
YXJlLmNvbT4KUmV2aWV3ZWQtYnk6IERlZXBhayBSYXdhdCA8ZHJhd2F0QHZtd2FyZS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggYTZlYTc1YjU4
YTgzLi5kOGVhM2RkMTBhZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3R0bV9idWZmZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1f
YnVmZmVyLmMKQEAgLTQ0MSwxMSArNDQxLDExIEBAIHN0YXRpYyBpbnQgdm13X3R0bV9tYXBfZG1h
KHN0cnVjdCB2bXdfdHRtX3R0ICp2bXdfdHQpCiAJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCiAJ
CQlyZXR1cm4gcmV0OwogCi0JCXJldCA9IHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoJnZtd190
dC0+c2d0LCB2c2d0LT5wYWdlcywKLQkJCQkJCXZzZ3QtPm51bV9wYWdlcywgMCwKLQkJCQkJCSh1
bnNpZ25lZCBsb25nKQotCQkJCQkJdnNndC0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsCi0JCQkJ
CQlHRlBfS0VSTkVMKTsKKwkJcmV0ID0gX19zZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzCisJCQko
JnZtd190dC0+c2d0LCB2c2d0LT5wYWdlcywgdnNndC0+bnVtX3BhZ2VzLCAwLAorCQkJICh1bnNp
Z25lZCBsb25nKSB2c2d0LT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVCwKKwkJCSBkbWFfZ2V0X21h
eF9zZWdfc2l6ZShkZXZfcHJpdi0+ZGV2LT5kZXYpLAorCQkJIEdGUF9LRVJORUwpOwogCQlpZiAo
dW5saWtlbHkocmV0ICE9IDApKQogCQkJZ290byBvdXRfc2dfYWxsb2NfZmFpbDsKIAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
