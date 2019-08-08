Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E844886D14
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F886ECD0;
	Thu,  8 Aug 2019 22:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CA76ECCE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:22:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id b7so74845378otl.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1fnUesRlbFn29wRcuFLexUuzLWRtNkSEYvkJw+HNGBY=;
 b=phziIbTi2qFlsanX42sfTeo9bWfxqMIaDmlMCSrFXk7g6fIHntDdXcRxwOEyOD2lJx
 DP4m+qgwFBKLe/dUfCl7jpBFjaqb8qvaSH5sqnvRWcMefGaVPguF1cyj5/ELQaaydzuC
 ohEBpjoNlbMhQo8377+xihX7vGoy1pK6yAO4yQh0qasB/PA9bhTUMlmEt4DvMnDd3VsP
 LuEjy9r+KOv4Fx7i8hD+LmIvoAhVza4fwn9Y9MzQ2O/gBwQaS2pa3bUPIDElALtGdYvc
 x5/9++Da6hnWGnfhzucv+6YhaQdYDLw6m+iVm405rz7weTPdDjroOwULehLZ0YNk7o1g
 cgSw==
X-Gm-Message-State: APjAAAWbjGq9hZz9R99InZ//diBexNU8JHGmeQ5SMXg0O1WUP9eb0Z6i
 N2LjB5+Q/WWHWwI2s6TGnmefXWo=
X-Google-Smtp-Source: APXvYqw9nVjglJUV50C1hEZPrPC60feYxvBj8pIOW078bVMFqABHNKVlHh7D4dP83NqKSKTytEHlhQ==
X-Received: by 2002:a6b:8ed7:: with SMTP id
 q206mr10306346iod.120.1565302927425; 
 Thu, 08 Aug 2019 15:22:07 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id i4sm118528553iog.31.2019.08.08.15.22.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 15:22:06 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/9] drm/panfrost: Split panfrost_mmu_map SG list mapping
 to its own function
Date: Thu,  8 Aug 2019 16:21:55 -0600
Message-Id: <20190808222200.13176-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808222200.13176-1-robh@kernel.org>
References: <20190808222200.13176-1-robh@kernel.org>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gY3JlYXRlIHBhcnRpYWwgR1BVIG1hcHBpbmdzIG9mIEJPcyBvbiBw
YWdlIGZhdWx0cywKc3BsaXQgb3V0IHRoZSBTRyBsaXN0IGhhbmRsaW5nIG9mIHBhbmZyb3N0X21t
dV9tYXAoKS4KCkNjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpD
YzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KQ2M6IFJv
YmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+ClJldmlld2VkOiBTdGV2ZW4gUHJpY2Ug
PHN0ZXZlbi5wcmljZUBhcm0uY29tPgpBY2tlZC1ieTogQWx5c3NhIFJvc2VuendlaWcgPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21t
dS5jIHwgNTIgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGlu
c2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9tbXUuYwppbmRleCA5MmFjOTk1ZGQ5YzYuLmI0YWMxNDliMjM5OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwpAQCAtMTQ1LDI3ICsxNDUsMTMgQEAgc3RhdGlj
IHNpemVfdCBnZXRfcGdzaXplKHU2NCBhZGRyLCBzaXplX3Qgc2l6ZSkKIAlyZXR1cm4gU1pfMk07
CiB9CiAKLWludCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpi
bykKK3N0YXRpYyBpbnQgbW11X21hcF9zZyhzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwg
dTY0IGlvdmEsCisJCSAgICAgIGludCBwcm90LCBzdHJ1Y3Qgc2dfdGFibGUgKnNndCkKIHsKLQlz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZiby0+YmFzZS5iYXNlOwotCXN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2ID0gdG9fcGFuZnJvc3RfZGV2aWNlKG9iai0+ZGV2KTsKLQlzdHJ1
Y3QgaW9fcGd0YWJsZV9vcHMgKm9wcyA9IHBmZGV2LT5tbXUtPnBndGJsX29wczsKLQl1NjQgaW92
YSA9IGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7CiAJdW5zaWduZWQgaW50IGNvdW50Owog
CXN0cnVjdCBzY2F0dGVybGlzdCAqc2dsOwotCXN0cnVjdCBzZ190YWJsZSAqc2d0OwotCWludCBy
ZXQ7Ci0KLQlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVkKSkKLQkJcmV0dXJuIDA7Ci0KLQlzZ3Qg
PSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2JqKTsKLQlpZiAoV0FSTl9PTihJU19FUlIo
c2d0KSkpCi0JCXJldHVybiBQVFJfRVJSKHNndCk7Ci0KLQlyZXQgPSBwbV9ydW50aW1lX2dldF9z
eW5jKHBmZGV2LT5kZXYpOwotCWlmIChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OworCXN0cnVjdCBp
b19wZ3RhYmxlX29wcyAqb3BzID0gcGZkZXYtPm1tdS0+cGd0Ymxfb3BzOworCXU2NCBzdGFydF9p
b3ZhID0gaW92YTsKIAogCW11dGV4X2xvY2soJnBmZGV2LT5tbXUtPmxvY2spOwogCkBAIC0xNzgs
MTggKzE2NCw0MiBAQCBpbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29i
amVjdCAqYm8pCiAJCXdoaWxlIChsZW4pIHsKIAkJCXNpemVfdCBwZ3NpemUgPSBnZXRfcGdzaXpl
KGlvdmEgfCBwYWRkciwgbGVuKTsKIAotCQkJb3BzLT5tYXAob3BzLCBpb3ZhLCBwYWRkciwgcGdz
aXplLCBJT01NVV9XUklURSB8IElPTU1VX1JFQUQpOworCQkJb3BzLT5tYXAob3BzLCBpb3ZhLCBw
YWRkciwgcGdzaXplLCBwcm90KTsKIAkJCWlvdmEgKz0gcGdzaXplOwogCQkJcGFkZHIgKz0gcGdz
aXplOwogCQkJbGVuIC09IHBnc2l6ZTsKIAkJfQogCX0KIAotCW1tdV9od19kb19vcGVyYXRpb24o
cGZkZXYsIDAsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsCi0JCQkgICAgYm8tPm5vZGUu
c2l6ZSA8PCBQQUdFX1NISUZULCBBU19DT01NQU5EX0ZMVVNIX1BUKTsKKwltbXVfaHdfZG9fb3Bl
cmF0aW9uKHBmZGV2LCAwLCBzdGFydF9pb3ZhLCBpb3ZhIC0gc3RhcnRfaW92YSwKKwkJCSAgICBB
U19DT01NQU5EX0ZMVVNIX1BUKTsKIAogCW11dGV4X3VubG9jaygmcGZkZXYtPm1tdS0+bG9jayk7
CiAKKwlyZXR1cm4gMDsKK30KKworaW50IHBhbmZyb3N0X21tdV9tYXAoc3RydWN0IHBhbmZyb3N0
X2dlbV9vYmplY3QgKmJvKQoreworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmJvLT5i
YXNlLmJhc2U7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSB0b19wYW5mcm9zdF9k
ZXZpY2Uob2JqLT5kZXYpOworCXN0cnVjdCBzZ190YWJsZSAqc2d0OworCWludCByZXQ7CisJaW50
IHByb3QgPSBJT01NVV9SRUFEIHwgSU9NTVVfV1JJVEU7CisKKwlpZiAoV0FSTl9PTihiby0+aXNf
bWFwcGVkKSkKKwkJcmV0dXJuIDA7CisKKwlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19z
Z3Qob2JqKTsKKwlpZiAoV0FSTl9PTihJU19FUlIoc2d0KSkpCisJCXJldHVybiBQVFJfRVJSKHNn
dCk7CisKKwlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHBmZGV2LT5kZXYpOworCWlmIChyZXQg
PCAwKQorCQlyZXR1cm4gcmV0OworCisJbW11X21hcF9zZyhwZmRldiwgYm8tPm5vZGUuc3RhcnQg
PDwgUEFHRV9TSElGVCwgcHJvdCwgc2d0KTsKKwogCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3ko
cGZkZXYtPmRldik7CiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7CiAJ
Ym8tPmlzX21hcHBlZCA9IHRydWU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
