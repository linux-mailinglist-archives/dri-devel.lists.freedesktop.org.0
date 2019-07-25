Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA3742C5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 03:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2244B6E386;
	Thu, 25 Jul 2019 01:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150996E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:10:12 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i10so93582806iol.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:10:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vtjr2+2ofsw45xyTHE3FvXFioIOLEbSTpIy61lySGK0=;
 b=twLRZTWrT4vFrN996zPkX3YRS/mDlNSuha7ZQ57gJeBAuZBu97bnu2BYYZcFhQidn6
 ao/xZOCHzKugWEAJUfz9j7JQ56u/wsmLVpyrpBFayX3FBtL9VCLaukc3clODYQnWWwnw
 CQWU/41ak33xA+Mixl8TvwTjYBl+gp+vzXRMdXxy3+aZsRCVEeDb4IHAK6yrmJIybT6j
 iqRbkV7Djz99tRFxjFgUiSsIUH2d1ZpcS9hd/YeWnV0Q0DAKX/2nM27ZABCmtsq3MaJh
 OSgDOjVP8iTs5ACyKvrq9y+S1ggWDFhqxhEacm6ObJ8TJjYYAO8ly3jKB7N7Po9yGNVZ
 UIBw==
X-Gm-Message-State: APjAAAVYSLVkHaFlWxSPLH57M8ytbTAW2KPTE+rtfEtiOlPt8rPJcUx/
 548S2/QpVcJWdttDr3C2ErrK81k=
X-Google-Smtp-Source: APXvYqyDThLEyokZMvfdy5ssoUVD7WB/uR49wUi3Ig4+JzGZJB15LQHZCkSnynZuuQ6OnV/ET+vi6w==
X-Received: by 2002:a5d:8411:: with SMTP id i17mr49770529ion.83.1564017011013; 
 Wed, 24 Jul 2019 18:10:11 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id o7sm40675924ioo.81.2019.07.24.18.10.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 18:10:10 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/panfrost: Split panfrost_mmu_map SG list mapping
 to its own function
Date: Wed, 24 Jul 2019 19:10:00 -0600
Message-Id: <20190725011003.30837-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725011003.30837-1-robh@kernel.org>
References: <20190725011003.30837-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gY3JlYXRlIHBhcnRpYWwgR1BVIG1hcHBpbmdzIG9mIEJPcyBvbiBw
YWdlIGZhdWx0cywKc3BsaXQgb3V0IHRoZSBTRyBsaXN0IGhhbmRsaW5nIG9mIHBhbmZyb3N0X21t
dV9tYXAoKS4KCkNjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpD
YzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KQ2M6IFJv
YmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8
YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IFN0ZXZlbiBQcmlj
ZSA8c3RldmVuLnByaWNlQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5j
IHwgNTIgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9tbXUuYwppbmRleCA5MmFjOTk1ZGQ5YzYuLmI0YWMxNDliMjM5OSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwpAQCAtMTQ1LDI3ICsxNDUsMTMgQEAgc3RhdGljIHNp
emVfdCBnZXRfcGdzaXplKHU2NCBhZGRyLCBzaXplX3Qgc2l6ZSkKIAlyZXR1cm4gU1pfMk07CiB9
CiAKLWludCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykK
K3N0YXRpYyBpbnQgbW11X21hcF9zZyhzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgdTY0
IGlvdmEsCisJCSAgICAgIGludCBwcm90LCBzdHJ1Y3Qgc2dfdGFibGUgKnNndCkKIHsKLQlzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZiby0+YmFzZS5iYXNlOwotCXN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2ID0gdG9fcGFuZnJvc3RfZGV2aWNlKG9iai0+ZGV2KTsKLQlzdHJ1Y3Qg
aW9fcGd0YWJsZV9vcHMgKm9wcyA9IHBmZGV2LT5tbXUtPnBndGJsX29wczsKLQl1NjQgaW92YSA9
IGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7CiAJdW5zaWduZWQgaW50IGNvdW50OwogCXN0
cnVjdCBzY2F0dGVybGlzdCAqc2dsOwotCXN0cnVjdCBzZ190YWJsZSAqc2d0OwotCWludCByZXQ7
Ci0KLQlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVkKSkKLQkJcmV0dXJuIDA7Ci0KLQlzZ3QgPSBk
cm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2JqKTsKLQlpZiAoV0FSTl9PTihJU19FUlIoc2d0
KSkpCi0JCXJldHVybiBQVFJfRVJSKHNndCk7Ci0KLQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5j
KHBmZGV2LT5kZXYpOwotCWlmIChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OworCXN0cnVjdCBpb19w
Z3RhYmxlX29wcyAqb3BzID0gcGZkZXYtPm1tdS0+cGd0Ymxfb3BzOworCXU2NCBzdGFydF9pb3Zh
ID0gaW92YTsKIAogCW11dGV4X2xvY2soJnBmZGV2LT5tbXUtPmxvY2spOwogCkBAIC0xNzgsMTgg
KzE2NCw0MiBAQCBpbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVj
dCAqYm8pCiAJCXdoaWxlIChsZW4pIHsKIAkJCXNpemVfdCBwZ3NpemUgPSBnZXRfcGdzaXplKGlv
dmEgfCBwYWRkciwgbGVuKTsKIAotCQkJb3BzLT5tYXAob3BzLCBpb3ZhLCBwYWRkciwgcGdzaXpl
LCBJT01NVV9XUklURSB8IElPTU1VX1JFQUQpOworCQkJb3BzLT5tYXAob3BzLCBpb3ZhLCBwYWRk
ciwgcGdzaXplLCBwcm90KTsKIAkJCWlvdmEgKz0gcGdzaXplOwogCQkJcGFkZHIgKz0gcGdzaXpl
OwogCQkJbGVuIC09IHBnc2l6ZTsKIAkJfQogCX0KIAotCW1tdV9od19kb19vcGVyYXRpb24ocGZk
ZXYsIDAsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsCi0JCQkgICAgYm8tPm5vZGUuc2l6
ZSA8PCBQQUdFX1NISUZULCBBU19DT01NQU5EX0ZMVVNIX1BUKTsKKwltbXVfaHdfZG9fb3BlcmF0
aW9uKHBmZGV2LCAwLCBzdGFydF9pb3ZhLCBpb3ZhIC0gc3RhcnRfaW92YSwKKwkJCSAgICBBU19D
T01NQU5EX0ZMVVNIX1BUKTsKIAogCW11dGV4X3VubG9jaygmcGZkZXYtPm1tdS0+bG9jayk7CiAK
KwlyZXR1cm4gMDsKK30KKworaW50IHBhbmZyb3N0X21tdV9tYXAoc3RydWN0IHBhbmZyb3N0X2dl
bV9vYmplY3QgKmJvKQoreworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmJvLT5iYXNl
LmJhc2U7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSB0b19wYW5mcm9zdF9kZXZp
Y2Uob2JqLT5kZXYpOworCXN0cnVjdCBzZ190YWJsZSAqc2d0OworCWludCByZXQ7CisJaW50IHBy
b3QgPSBJT01NVV9SRUFEIHwgSU9NTVVfV1JJVEU7CisKKwlpZiAoV0FSTl9PTihiby0+aXNfbWFw
cGVkKSkKKwkJcmV0dXJuIDA7CisKKwlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qo
b2JqKTsKKwlpZiAoV0FSTl9PTihJU19FUlIoc2d0KSkpCisJCXJldHVybiBQVFJfRVJSKHNndCk7
CisKKwlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHBmZGV2LT5kZXYpOworCWlmIChyZXQgPCAw
KQorCQlyZXR1cm4gcmV0OworCisJbW11X21hcF9zZyhwZmRldiwgYm8tPm5vZGUuc3RhcnQgPDwg
UEFHRV9TSElGVCwgcHJvdCwgc2d0KTsKKwogCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZk
ZXYtPmRldik7CiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7CiAJYm8t
PmlzX21hcHBlZCA9IHRydWU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
