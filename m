Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730A4FDA2
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2019 20:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5217A89939;
	Sun, 23 Jun 2019 18:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A339E6E953
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 03:41:12 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id e5so3881416pls.13
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 20:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VR+1gVBeNp5zLQOTjis3BU5nyFYrQmMm0AGMlO4tl+8=;
 b=WHUMOwCo/bvFTQaOm//pTCeZkAwRFiqo5FyxLc1RTGlSSABSHrQOGXFN/zk703OiRv
 9tBFpbN6DhzFyYeBtjr01tlbm9K/yZv6AvLA2roy5jJYWJHiPxtCG+d0A0UkjfiS1LKl
 D2JmKVA4+7lB7+Ya7/K3U7EfcIjwsjPrSpW01B0VEB82EgZJ4QcCNTWkRSeWD/pDiD+A
 FL+Lb5TZml9GEYqyvek/6WIiqgcCcuC9w8i9EcYprM5xGnJMWNFVFMEwayIIVKJYvfxp
 pXubogx+slqi4Al+8woyvVxWZHNFJfwR24HLDWvahIYY1p4GXbuklIDhNFZlru3llh64
 lb+w==
X-Gm-Message-State: APjAAAV+68puQxpgJBbkQqI4xH/A/Ojp3/hloH3zfMyMIuPnyYFldbuG
 ge8KeDZ+MShwawUIF7D/QaVerw==
X-Google-Smtp-Source: APXvYqy7OZlNIJV/wKk0qzH/BBdfdv3svSddCMNCO3q2GvadO7lmbf1GC5jUG+WPh26RLzF0aYG8KQ==
X-Received: by 2002:a17:902:e58b:: with SMTP id
 cl11mr113259716plb.24.1561174872149; 
 Fri, 21 Jun 2019 20:41:12 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id u128sm4756688pfu.26.2019.06.21.20.41.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 21 Jun 2019 20:41:11 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] drm/panel: Add helper for reading DT rotation
Date: Fri, 21 Jun 2019 20:41:02 -0700
Message-Id: <20190622034105.188454-2-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190622034105.188454-1-dbasehore@chromium.org>
References: <20190622034105.188454-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 23 Jun 2019 18:32:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VR+1gVBeNp5zLQOTjis3BU5nyFYrQmMm0AGMlO4tl+8=;
 b=Hz1UANN1roomVyU9jl8Q45f5XfmMGxREC6DBubcmkHxA8N1aR36jWxl686CM4zFQL/
 7MiFPw3h+X4133oN0+Q3yDg/27rL+fCVzFuuMjiJdEJ0QbnbArUJNJK5+nHiqylNnq3C
 XXbpjYWXPs4o9kfi5BLzH73e3K1SmGKI8+SCU=
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
Cc: Derek Basehore <dbasehore@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGEgaGVscGVyIGZ1bmN0aW9uIGZvciByZWFkaW5nIHRoZSByb3RhdGlvbiAocGFu
ZWwKb3JpZW50YXRpb24pIGZyb20gdGhlIGRldmljZSB0cmVlLgoKU2lnbmVkLW9mZi1ieTogRGVy
ZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9wYW5lbC5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
aW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggICAgIHwgIDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0OSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5l
bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCmluZGV4IGRiZDViODczZThmMi4uNTA3
MDk5YWY0YjU3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCkBAIC0xNzIsNiArMTcyLDQ4IEBAIHN0cnVjdCBk
cm1fcGFuZWwgKm9mX2RybV9maW5kX3BhbmVsKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAp
CiAJcmV0dXJuIEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7CiB9CiBFWFBPUlRfU1lNQk9MKG9mX2Ry
bV9maW5kX3BhbmVsKTsKKworLyoqCisgKiBvZl9kcm1fZ2V0X3BhbmVsX29yaWVudGF0aW9uIC0g
bG9vayB1cCB0aGUgcm90YXRpb24gb2YgdGhlIHBhbmVsIHVzaW5nIGEKKyAqIGRldmljZSB0cmVl
IG5vZGUKKyAqIEBucDogZGV2aWNlIHRyZWUgbm9kZSBvZiB0aGUgcGFuZWwKKyAqIEBvcmllbnRh
dGlvbjogb3JpZW50YXRpb24gZW51bSB0byBiZSBmaWxsZWQgaW4KKyAqCisgKiBMb29rcyB1cCB0
aGUgcm90YXRpb24gb2YgYSBwYW5lbCBpbiB0aGUgZGV2aWNlIHRyZWUuIFRoZSByb3RhdGlvbiBp
biB0aGUKKyAqIGRldmljZSB0cmVlIGlzIGNvdW50ZXIgY2xvY2t3aXNlLgorICoKKyAqIFJldHVy
bjogMCB3aGVuIGEgdmFsaWQgcm90YXRpb24gdmFsdWUgKDAsIDkwLCAxODAsIG9yIDI3MCkgaXMg
cmVhZCBvciB0aGUKKyAqIHJvdGF0aW9uIHByb3BlcnR5IGRvZXNuJ3QgZXhpc3QuIC1FRVJST1Ig
b3RoZXJ3aXNlLgorICovCitpbnQgb2ZfZHJtX2dldF9wYW5lbF9vcmllbnRhdGlvbihjb25zdCBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAorCQkJCSBlbnVtIGRybV9wYW5lbF9vcmllbnRhdGlvbiAq
b3JpZW50YXRpb24pCit7CisJaW50IHJvdGF0aW9uLCByZXQ7CisKKwlyZXQgPSBvZl9wcm9wZXJ0
eV9yZWFkX3UzMihucCwgInJvdGF0aW9uIiwgJnJvdGF0aW9uKTsKKwlpZiAocmV0ID09IC1FSU5W
QUwpIHsKKwkJLyogRG9uJ3QgcmV0dXJuIGFuIGVycm9yIGlmIHRoZXJlJ3Mgbm8gcm90YXRpb24g
cHJvcGVydHkuICovCisJCSpvcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9O
X1VOS05PV047CisJCXJldHVybiAwOworCX0KKworCWlmIChyZXQgPCAwKQorCQlyZXR1cm4gcmV0
OworCisJaWYgKHJvdGF0aW9uID09IDApCisJCSpvcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVM
X09SSUVOVEFUSU9OX05PUk1BTDsKKwllbHNlIGlmIChyb3RhdGlvbiA9PSA5MCkKKwkJKm9yaWVu
dGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fUklHSFRfVVA7CisJZWxzZSBpZiAo
cm90YXRpb24gPT0gMTgwKQorCQkqb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRB
VElPTl9CT1RUT01fVVA7CisJZWxzZSBpZiAocm90YXRpb24gPT0gMjcwKQorCQkqb3JpZW50YXRp
b24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9MRUZUX1VQOworCWVsc2UKKwkJcmV0dXJu
IC1FSU5WQUw7CisKKwlyZXR1cm4gMDsKK30KK0VYUE9SVF9TWU1CT0wob2ZfZHJtX2dldF9wYW5l
bF9vcmllbnRhdGlvbik7CiAjZW5kaWYKIAogTU9EVUxFX0FVVEhPUigiVGhpZXJyeSBSZWRpbmcg
PHRyZWRpbmdAbnZpZGlhLmNvbT4iKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9wYW5l
bC5oIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKaW5kZXggOGM3MzhjMGU2ZTlmLi4zNTY0OTUy
ZjFhNGYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5oCisrKyBiL2luY2x1ZGUv
ZHJtL2RybV9wYW5lbC5oCkBAIC0xOTcsMTEgKzE5NywxOCBAQCBpbnQgZHJtX3BhbmVsX2RldGFj
aChzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCk7CiAKICNpZiBkZWZpbmVkKENPTkZJR19PRikgJiYg
ZGVmaW5lZChDT05GSUdfRFJNX1BBTkVMKQogc3RydWN0IGRybV9wYW5lbCAqb2ZfZHJtX2ZpbmRf
cGFuZWwoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCk7CitpbnQgb2ZfZHJtX2dldF9wYW5l
bF9vcmllbnRhdGlvbihjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAorCQkJCSBlbnVtIGRy
bV9wYW5lbF9vcmllbnRhdGlvbiAqb3JpZW50YXRpb24pOwogI2Vsc2UKIHN0YXRpYyBpbmxpbmUg
c3RydWN0IGRybV9wYW5lbCAqb2ZfZHJtX2ZpbmRfcGFuZWwoY29uc3Qgc3RydWN0IGRldmljZV9u
b2RlICpucCkKIHsKIAlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIH0KK2ludCBvZl9kcm1fZ2V0
X3BhbmVsX29yaWVudGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCisJCQkJIGVu
dW0gZHJtX3BhbmVsX29yaWVudGF0aW9uICpvcmllbnRhdGlvbikKK3sKKwlyZXR1cm4gLUVOT0RF
VjsKK30KICNlbmRpZgogCiAjZW5kaWYKLS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
