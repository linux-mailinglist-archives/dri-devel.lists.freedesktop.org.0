Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EA3C4D5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 09:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C8D89150;
	Tue, 11 Jun 2019 07:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1D7890F0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 04:03:56 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d126so6542944pfd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dK5nepKO/Lu9qcWjch0d2Z8IhG0b83DDW/+1Tc5GcLg=;
 b=FdBmW1D0SsKtsULqQh1PSG6JrZ5/6myFIzlBbgh/0NbGKiLsZwOXEjK/HIwm7B9L73
 M/4jjxBmOh9PsER3pVbWmsvqGHMNdmIo9tsC2b4ZgD03YIVYmNIF5rLjZR04DtZrqUtb
 G030siA3snkb6dOSgN84d8x28eu+xFB6K0yWm9/iClXtC6Hz+5SCEByYEAPK3mac6hcP
 sv7KELeB9e/HeFWJuHqb9OiJpCWkcexNSu3ijj3vtE7QDqYfOZX+aAD1O24/hcrWmsj0
 HALCrhnJf/YAL8XdLPvXkzlM5DI6Fef8ehepRjXsEwoHtn2JfiFvM3mSYbbEmGcWejPs
 nLkA==
X-Gm-Message-State: APjAAAUdKc3TNpjhOlkDxaMZDGpqVdVWHETcQQPX1df/8e/Qa75FmZ9O
 arOtrvs/3BhVkgcFJ8Z9t1Vwig==
X-Google-Smtp-Source: APXvYqwobTrT91p21YyGnsEse1+RxzZxvnHAKh/XjPiTdvWC3iFSRE8s82N6n3Ie7F+FBFdVUvCVAQ==
X-Received: by 2002:a62:ce07:: with SMTP id y7mr49658309pfg.12.1560225836465; 
 Mon, 10 Jun 2019 21:03:56 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id y133sm13301185pfb.28.2019.06.10.21.03.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 21:03:55 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/panel: Add helper for reading DT rotation
Date: Mon, 10 Jun 2019 21:03:46 -0700
Message-Id: <20190611040350.90064-2-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611040350.90064-1-dbasehore@chromium.org>
References: <20190611040350.90064-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jun 2019 07:21:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dK5nepKO/Lu9qcWjch0d2Z8IhG0b83DDW/+1Tc5GcLg=;
 b=KXrCMiQg7a3OfPUXlEJ0jxFjUzyZmNjg7jLQ3vlyHvu+/ZoYFywdDn0CYhVxJ6210H
 Be7ENhzB8haIWSJaAFOqD/im/zV70ZC09Z+ulYwJ0v3pb2/30T9ccgBbFuxxbqyb4Sb3
 F8SC9XyvrE2wKX+6pwO4Kc/M8q4p4YESBKAMI=
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Derek Basehore <dbasehore@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-mediatek@lists.infradead.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIGEgaGVscGVyIGZ1bmN0aW9uIGZvciByZWFkaW5nIHRoZSByb3RhdGlvbiAocGFu
ZWwKb3JpZW50YXRpb24pIGZyb20gdGhlIGRldmljZSB0cmVlLgoKU2lnbmVkLW9mZi1ieTogRGVy
ZWsgQmFzZWhvcmUgPGRiYXNlaG9yZUBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9wYW5lbC5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
aW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggICAgIHwgIDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2Vk
LCA0OCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5l
bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCmluZGV4IGRiZDViODczZThmMi4uM2I2
ODljZTRhNTFhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9wYW5lbC5jCkBAIC0xNzIsNiArMTcyLDQ3IEBAIHN0cnVjdCBk
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
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgKm9yaWVudGF0aW9uKQoreworCWludCByb3RhdGlv
biwgcmV0OworCisJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJyb3RhdGlvbiIsICZy
b3RhdGlvbik7CisJaWYgKHJldCA9PSAtRUlOVkFMKSB7CisJCS8qIERvbid0IHJldHVybiBhbiBl
cnJvciBpZiB0aGVyZSdzIG5vIHJvdGF0aW9uIHByb3BlcnR5LiAqLworCQkqb3JpZW50YXRpb24g
PSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9VTktOT1dOOworCQlyZXR1cm4gMDsKKwl9CisK
KwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKworCWlmIChyb3RhdGlvbiA9PSAwKQorCQkq
b3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9OT1JNQUw7CisJZWxzZSBp
ZiAocm90YXRpb24gPT0gOTApCisJCSpvcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVO
VEFUSU9OX1JJR0hUX1VQOworCWVsc2UgaWYgKHJvdGF0aW9uID09IDE4MCkKKwkJKm9yaWVudGF0
aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fQk9UVE9NX1VQOworCWVsc2UgaWYgKHJv
dGF0aW9uID09IDI3MCkKKwkJKm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJ
T05fTEVGVF9VUDsKKwllbHNlCisJCXJldHVybiAtRUlOVkFMOworCisJcmV0dXJuIDA7Cit9CitF
WFBPUlRfU1lNQk9MKG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24pOwogI2VuZGlmCiAKIE1P
RFVMRV9BVVRIT1IoIlRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Iik7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaCBiL2luY2x1ZGUvZHJtL2RybV9wYW5lbC5o
CmluZGV4IDhjNzM4YzBlNmU5Zi4uMTM2MzFiMmVmYmFhIDEwMDY0NAotLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fcGFuZWwuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaApAQCAtMTk3LDExICsx
OTcsMTggQEAgaW50IGRybV9wYW5lbF9kZXRhY2goc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpOwog
CiAjaWYgZGVmaW5lZChDT05GSUdfT0YpICYmIGRlZmluZWQoQ09ORklHX0RSTV9QQU5FTCkKIHN0
cnVjdCBkcm1fcGFuZWwgKm9mX2RybV9maW5kX3BhbmVsKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9k
ZSAqbnApOworaW50IG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24oY29uc3Qgc3RydWN0IGRl
dmljZV9ub2RlICpucCwKKwkJCQkgaW50ICpvcmllbnRhdGlvbik7CiAjZWxzZQogc3RhdGljIGlu
bGluZSBzdHJ1Y3QgZHJtX3BhbmVsICpvZl9kcm1fZmluZF9wYW5lbChjb25zdCBzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wKQogewogCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogfQoraW50IG9mX2Ry
bV9nZXRfcGFuZWxfb3JpZW50YXRpb24oY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJ
CQkgaW50ICpvcmllbnRhdGlvbikKK3sKKwlyZXR1cm4gLUVOT0RFVjsKK30KICNlbmRpZgogCiAj
ZW5kaWYKLS0gCjIuMjIuMC5yYzIuMzgzLmdmNGZiYmYzMGMyLWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
