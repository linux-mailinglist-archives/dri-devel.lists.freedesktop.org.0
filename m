Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97ED65FD
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 17:16:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77C6E50D;
	Mon, 14 Oct 2019 15:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4914B6E50D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 15:16:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E731A28;
 Mon, 14 Oct 2019 08:16:25 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8FEF3F68E;
 Mon, 14 Oct 2019 08:16:24 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH] drm/panfrost: DMA map all pages shared with the GPU
Date: Mon, 14 Oct 2019 16:16:16 +0100
Message-Id: <20191014151616.14099-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFnZXMgc2hhcmVkIHdpdGggdGhlIEdQVSBhcmUgKG9mdGVuKSBub3QgY2FjaGUgY29oZXJlbnQg
d2l0aCB0aGUgQ1BVIHNvCmNhY2hlIG1haW50ZW5hbmNlIGlzIHJlcXVpcmVkIHRvIGZsdXNoIHRo
ZSBDUFUncyBjYWNoZXMuIFRoaXMgd2FzCmFscmVhZHkgZG9uZSB3aGVuIG1hcHBpbmcgcGFnZXMg
b24gZmF1bHQsIGJ1dCB3YXNuJ3QgcHJldmlvdXNseSBkb25lCndoZW4gbWFwcGluZyBhIGZyZXNo
bHkgYWxsb2NhdGVkIHBhZ2UuCgpGaXggdGhpcyBieSBtb3ZpbmcgdGhlIGNhbGwgdG8gZG1hX21h
cF9zZygpIGludG8gbW11X21hcF9zZygpIGVuc3VyaW5nCnRoYXQgaXQgaXMgYWx3YXlzIGNhbGxl
ZCB3aGVuIHBhZ2VzIGFyZSBtYXBwZWQgb250byB0aGUgR1BVLiBTaW5jZQptbXVfbWFwX3NnKCkg
Y2FuIG5vdyBmYWlsIHRoZSBjb2RlIGFsc28gbm93IGhhcyB0byBoYW5kbGUgYW4gZXJyb3IKcmV0
dXJuLgoKTm90IHBlcmZvcm1pbmcgdGhpcyBjYWNoZSBtYWludGVuYW5jZSBjYW4gY2F1c2UgZXJy
b3JzIGluIHRoZSBHUFUgb3V0cHV0CihDUFUgY2FjaGVzIGFyZSBsYXRlciBmbHVzaGVkIGFuZCBv
dmVyd3JpdGUgdGhlIEdQVSBvdXRwdXQpLiBJbiB0aGVvcnkKaXQgYWxzbyBhbGxvd3MgdGhlIEdQ
VSAoYW5kIGJ5IGV4dGVuc2lvbiB1c2VyIHNwYWNlKSB0byBvYnNlcnZlIHRoZQptZW1vcnkgY29u
dGVudHMgcHJpb3IgdG8gc2FuaXRpemF0aW9uLgoKRml4ZXM6IGYzYmE5MTIyOGU4ZSAoImRybS9w
YW5mcm9zdDogQWRkIGluaXRpYWwgcGFuZnJvc3QgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogU3Rl
dmVuIFByaWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X21tdS5jCmluZGV4IGJkZDk5MDU2ODQ3Ni4uMDQ5NWU0OGMyMzhkIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCkBAIC0yNDgsNiArMjQ4LDkg
QEAgc3RhdGljIGludCBtbXVfbWFwX3NnKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LCBz
dHJ1Y3QgcGFuZnJvc3RfbW11ICptbXUsCiAJc3RydWN0IGlvX3BndGFibGVfb3BzICpvcHMgPSBt
bXUtPnBndGJsX29wczsKIAl1NjQgc3RhcnRfaW92YSA9IGlvdmE7CiAKKwlpZiAoIWRtYV9tYXBf
c2cocGZkZXYtPmRldiwgc2d0LT5zZ2wsIHNndC0+bmVudHMsIERNQV9CSURJUkVDVElPTkFMKSkK
KwkJcmV0dXJuIC1FSU5WQUw7CisKIAlmb3JfZWFjaF9zZyhzZ3QtPnNnbCwgc2dsLCBzZ3QtPm5l
bnRzLCBjb3VudCkgewogCQl1bnNpZ25lZCBsb25nIHBhZGRyID0gc2dfZG1hX2FkZHJlc3Moc2ds
KTsKIAkJc2l6ZV90IGxlbiA9IHNnX2RtYV9sZW4oc2dsKTsKQEAgLTI3NSw2ICsyNzgsNyBAQCBp
bnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCiAJc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSB0b19wYW5mcm9zdF9kZXZpY2Uob2JqLT5kZXYp
OwogCXN0cnVjdCBzZ190YWJsZSAqc2d0OwogCWludCBwcm90ID0gSU9NTVVfUkVBRCB8IElPTU1V
X1dSSVRFOworCWludCByZXQ7CiAKIAlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVkKSkKIAkJcmV0
dXJuIDA7CkBAIC0yODYsMTAgKzI5MCwxMiBAQCBpbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3Qg
cGFuZnJvc3RfZ2VtX29iamVjdCAqYm8pCiAJaWYgKFdBUk5fT04oSVNfRVJSKHNndCkpKQogCQly
ZXR1cm4gUFRSX0VSUihzZ3QpOwogCi0JbW11X21hcF9zZyhwZmRldiwgYm8tPm1tdSwgYm8tPm5v
ZGUuc3RhcnQgPDwgUEFHRV9TSElGVCwgcHJvdCwgc2d0KTsKLQliby0+aXNfbWFwcGVkID0gdHJ1
ZTsKKwlyZXQgPSBtbXVfbWFwX3NnKHBmZGV2LCBiby0+bW11LCBiby0+bm9kZS5zdGFydCA8PCBQ
QUdFX1NISUZULAorCQkJIHByb3QsIHNndCk7CisJaWYgKHJldCA9PSAwKQorCQliby0+aXNfbWFw
cGVkID0gdHJ1ZTsKIAotCXJldHVybiAwOworCXJldHVybiByZXQ7CiB9CiAKIHZvaWQgcGFuZnJv
c3RfbW11X3VubWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKQEAgLTUwMywxMiAr
NTA5LDEwIEBAIGludCBwYW5mcm9zdF9tbXVfbWFwX2ZhdWx0X2FkZHIoc3RydWN0IHBhbmZyb3N0
X2RldmljZSAqcGZkZXYsIGludCBhcywgdTY0IGFkZHIpCiAJaWYgKHJldCkKIAkJZ290byBlcnJf
cGFnZXM7CiAKLQlpZiAoIWRtYV9tYXBfc2cocGZkZXYtPmRldiwgc2d0LT5zZ2wsIHNndC0+bmVu
dHMsIERNQV9CSURJUkVDVElPTkFMKSkgewotCQlyZXQgPSAtRUlOVkFMOworCXJldCA9IG1tdV9t
YXBfc2cocGZkZXYsIGJvLT5tbXUsIGFkZHIsCisJCQkgSU9NTVVfV1JJVEUgfCBJT01NVV9SRUFE
IHwgSU9NTVVfTk9FWEVDLCBzZ3QpOworCWlmIChyZXQpCiAJCWdvdG8gZXJyX21hcDsKLQl9Ci0K
LQltbXVfbWFwX3NnKHBmZGV2LCBiby0+bW11LCBhZGRyLCBJT01NVV9XUklURSB8IElPTU1VX1JF
QUQgfCBJT01NVV9OT0VYRUMsIHNndCk7CiAKIAliby0+aXNfbWFwcGVkID0gdHJ1ZTsKIAotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
