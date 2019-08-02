Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FF480165
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609A6EDD0;
	Fri,  2 Aug 2019 19:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778916ED77
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:51:58 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so34879387ioa.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6R0Kh/pwj1cRdwpfVM4GshO3ikYF6B47tkVOltQGdk=;
 b=jFM8LRNIH4Gc5BfOXxA1YdRltwTXgYZlI2Tuo5VX7Oof6kSnO//FDauzyHSo3JQmtu
 Hj19iTKBA0FLtfHrRCGr9mFgMZQeapLvwGj36AJN+wm8ZMGny8Z8K+CxxQbaDljAMRsp
 00OqNSDPFtWaY9tuVAfVjwV0ideZVlLMgH2GWNcTUiSHOLpqJLJLxXmvW19wKJwgMyll
 lSKqGEbRnfjlnqukZixvOBJYjM1VxY2eFBtexJruA2krlJzDSIw8MCrn2HJuGDeDmKtr
 5zilxVMPHB2xQQlL1AG0WPTkd1R+XOky5/N1Dugh9oiBR3gMxGiJUReO0Si9H6lliujt
 3JuQ==
X-Gm-Message-State: APjAAAWt0nkONM5msL59/tKj6r7bcU/bqyUaoWC5nZ+JvhiT8Ca/4/Oa
 9EK0MCPwx1WgU0OsbbqUFI8KnHk=
X-Google-Smtp-Source: APXvYqy81KDpz0jPEMq27jdwFR0xLtDqinS8hqczQ50ia1L0kZBapcGniHCTQaZQ2YRnxuTcZY+N5g==
X-Received: by 2002:a6b:7311:: with SMTP id e17mr82855629ioh.112.1564775517465; 
 Fri, 02 Aug 2019 12:51:57 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id s4sm98419934iop.25.2019.08.02.12.51.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:51:57 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/8] drm/panfrost: Split panfrost_mmu_map SG list mapping
 to its own function
Date: Fri,  2 Aug 2019 13:51:46 -0600
Message-Id: <20190802195150.23207-5-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802195150.23207-1-robh@kernel.org>
References: <20190802195150.23207-1-robh@kernel.org>
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
YmluIE11cnBoeSA8cm9iaW4ubXVycGh5QGFybS5jb20+CkNjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZl
bi5wcmljZUBhcm0uY29tPgpBY2tlZC1ieTogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nl
bnp3ZWlnQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIHwg
NTIgKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlv
bnMoKyksIDIxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYwppbmRleCA5MmFjOTk1ZGQ5YzYuLmI0YWMxNDliMjM5OSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9tbXUuYwpAQCAtMTQ1LDI3ICsxNDUsMTMgQEAgc3RhdGljIHNpemVf
dCBnZXRfcGdzaXplKHU2NCBhZGRyLCBzaXplX3Qgc2l6ZSkKIAlyZXR1cm4gU1pfMk07CiB9CiAK
LWludCBwYW5mcm9zdF9tbXVfbWFwKHN0cnVjdCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKK3N0
YXRpYyBpbnQgbW11X21hcF9zZyhzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgdTY0IGlv
dmEsCisJCSAgICAgIGludCBwcm90LCBzdHJ1Y3Qgc2dfdGFibGUgKnNndCkKIHsKLQlzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZiby0+YmFzZS5iYXNlOwotCXN0cnVjdCBwYW5mcm9zdF9k
ZXZpY2UgKnBmZGV2ID0gdG9fcGFuZnJvc3RfZGV2aWNlKG9iai0+ZGV2KTsKLQlzdHJ1Y3QgaW9f
cGd0YWJsZV9vcHMgKm9wcyA9IHBmZGV2LT5tbXUtPnBndGJsX29wczsKLQl1NjQgaW92YSA9IGJv
LT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQ7CiAJdW5zaWduZWQgaW50IGNvdW50OwogCXN0cnVj
dCBzY2F0dGVybGlzdCAqc2dsOwotCXN0cnVjdCBzZ190YWJsZSAqc2d0OwotCWludCByZXQ7Ci0K
LQlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVkKSkKLQkJcmV0dXJuIDA7Ci0KLQlzZ3QgPSBkcm1f
Z2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2JqKTsKLQlpZiAoV0FSTl9PTihJU19FUlIoc2d0KSkp
Ci0JCXJldHVybiBQVFJfRVJSKHNndCk7Ci0KLQlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHBm
ZGV2LT5kZXYpOwotCWlmIChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OworCXN0cnVjdCBpb19wZ3Rh
YmxlX29wcyAqb3BzID0gcGZkZXYtPm1tdS0+cGd0Ymxfb3BzOworCXU2NCBzdGFydF9pb3ZhID0g
aW92YTsKIAogCW11dGV4X2xvY2soJnBmZGV2LT5tbXUtPmxvY2spOwogCkBAIC0xNzgsMTggKzE2
NCw0MiBAQCBpbnQgcGFuZnJvc3RfbW11X21hcChzdHJ1Y3QgcGFuZnJvc3RfZ2VtX29iamVjdCAq
Ym8pCiAJCXdoaWxlIChsZW4pIHsKIAkJCXNpemVfdCBwZ3NpemUgPSBnZXRfcGdzaXplKGlvdmEg
fCBwYWRkciwgbGVuKTsKIAotCQkJb3BzLT5tYXAob3BzLCBpb3ZhLCBwYWRkciwgcGdzaXplLCBJ
T01NVV9XUklURSB8IElPTU1VX1JFQUQpOworCQkJb3BzLT5tYXAob3BzLCBpb3ZhLCBwYWRkciwg
cGdzaXplLCBwcm90KTsKIAkJCWlvdmEgKz0gcGdzaXplOwogCQkJcGFkZHIgKz0gcGdzaXplOwog
CQkJbGVuIC09IHBnc2l6ZTsKIAkJfQogCX0KIAotCW1tdV9od19kb19vcGVyYXRpb24ocGZkZXYs
IDAsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQsCi0JCQkgICAgYm8tPm5vZGUuc2l6ZSA8
PCBQQUdFX1NISUZULCBBU19DT01NQU5EX0ZMVVNIX1BUKTsKKwltbXVfaHdfZG9fb3BlcmF0aW9u
KHBmZGV2LCAwLCBzdGFydF9pb3ZhLCBpb3ZhIC0gc3RhcnRfaW92YSwKKwkJCSAgICBBU19DT01N
QU5EX0ZMVVNIX1BUKTsKIAogCW11dGV4X3VubG9jaygmcGZkZXYtPm1tdS0+bG9jayk7CiAKKwly
ZXR1cm4gMDsKK30KKworaW50IHBhbmZyb3N0X21tdV9tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9v
YmplY3QgKmJvKQoreworCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmJvLT5iYXNlLmJh
c2U7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSB0b19wYW5mcm9zdF9kZXZpY2Uo
b2JqLT5kZXYpOworCXN0cnVjdCBzZ190YWJsZSAqc2d0OworCWludCByZXQ7CisJaW50IHByb3Qg
PSBJT01NVV9SRUFEIHwgSU9NTVVfV1JJVEU7CisKKwlpZiAoV0FSTl9PTihiby0+aXNfbWFwcGVk
KSkKKwkJcmV0dXJuIDA7CisKKwlzZ3QgPSBkcm1fZ2VtX3NobWVtX2dldF9wYWdlc19zZ3Qob2Jq
KTsKKwlpZiAoV0FSTl9PTihJU19FUlIoc2d0KSkpCisJCXJldHVybiBQVFJfRVJSKHNndCk7CisK
KwlyZXQgPSBwbV9ydW50aW1lX2dldF9zeW5jKHBmZGV2LT5kZXYpOworCWlmIChyZXQgPCAwKQor
CQlyZXR1cm4gcmV0OworCisJbW11X21hcF9zZyhwZmRldiwgYm8tPm5vZGUuc3RhcnQgPDwgUEFH
RV9TSElGVCwgcHJvdCwgc2d0KTsKKwogCXBtX3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYt
PmRldik7CiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYtPmRldik7CiAJYm8tPmlz
X21hcHBlZCA9IHRydWU7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
