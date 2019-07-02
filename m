Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612D15DE75
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2019 09:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEE16E0D6;
	Wed,  3 Jul 2019 07:13:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732126E0A2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 23:43:04 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r7so229297pfl.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 16:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aN1fc/2k+rfSW/EC4oQs93BniUXT0kzrcpLPTc60YrA=;
 b=X7tqeh7jCUUlsgTCS45VAAxGc2lZ3Pf7NUys6+3dFPLLlvICr1XmAwBYuXJBsgtOSl
 cI6ldv0LAG3rEbeNMMvTfOyh+e8NpniC4XuE3ymcif+g67byYA4OOD632LK95lkyVOjW
 BpBCNiBJL7HXVlP35UNqWwThDNbr81hLuf2zpjd7EGyFDwoUoxDg2GjaAl4wd+jOOMDb
 jM2WNZLfIKpmrNYH23Mfg28Gt+Kx2zsVUUxlD8BTZpjhYYeuh86XhH6ikzkPLb/S/M4Q
 u6o1J/FHCGFqtRutUBO5zQaiL8kymg3XZwMnhI5tsw8qWjng2+IF40NNSyxTym5fhqiT
 Ml/g==
X-Gm-Message-State: APjAAAUyxEj3Xd44gBAiKlNFC7B6V9ePvB+Fo8+eGWRvYMiSOy/6ipMu
 ZkmBClR97qHA+ScXagxlKmLGWw==
X-Google-Smtp-Source: APXvYqxntetr46hd4VdYt//b/thMhWSNbwb9vCbsmQW+Uc08wwpf2Ox1a6CJOdMbbCECegJUMT/tqA==
X-Received: by 2002:a17:90a:2305:: with SMTP id
 f5mr8983837pje.128.1562110984080; 
 Tue, 02 Jul 2019 16:43:04 -0700 (PDT)
Received: from exogeni.mtv.corp.google.com
 ([2620:15c:202:1:5be8:f2a6:fd7b:7459])
 by smtp.gmail.com with ESMTPSA id c26sm167611pfr.172.2019.07.02.16.43.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 16:43:03 -0700 (PDT)
From: Derek Basehore <dbasehore@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] drm/panel: Add helper for reading DT rotation
Date: Tue,  2 Jul 2019 16:42:55 -0700
Message-Id: <20190702234258.136349-2-dbasehore@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190702234258.136349-1-dbasehore@chromium.org>
References: <20190702234258.136349-1-dbasehore@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aN1fc/2k+rfSW/EC4oQs93BniUXT0kzrcpLPTc60YrA=;
 b=e9dnHhedfc+lNBCeuQXfqoxiBpz0VmlnQH3dYfHeptLuCxi0FSdQwptmK/hVygjteY
 67O617zIP6ppcNt6CT00h0I3dMCDvoFYdMLtG6ehC8KqJqijJU800ko63y3+dH3MlKdQ
 7IbBaEAUNGtXwQWMBgoAlAOSE/HJHBGWeepqU=
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
L2RybV9wYW5lbC5jIHwgNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
aW5jbHVkZS9kcm0vZHJtX3BhbmVsLmggICAgIHwgIDcgKysrKysrCiAyIGZpbGVzIGNoYW5nZWQs
IDUwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKaW5kZXggZGJkNWI4NzNlOGYyLi4xNjli
YWI1NGQ1MmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BhbmVsLmMKQEAgLTE3Miw2ICsxNzIsNDkgQEAgc3RydWN0IGRy
bV9wYW5lbCAqb2ZfZHJtX2ZpbmRfcGFuZWwoY29uc3Qgc3RydWN0IGRldmljZV9ub2RlICpucCkK
IAlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKIH0KIEVYUE9SVF9TWU1CT0wob2ZfZHJt
X2ZpbmRfcGFuZWwpOworCisvKioKKyAqIG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24gLSBs
b29rIHVwIHRoZSBvcmllbnRhdGlvbiBvZiB0aGUgcGFuZWwgdGhyb3VnaAorICogdGhlICJyb3Rh
dGlvbiIgYmluZGluZyBmcm9tIGEgZGV2aWNlIHRyZWUgbm9kZQorICogQG5wOiBkZXZpY2UgdHJl
ZSBub2RlIG9mIHRoZSBwYW5lbAorICogQG9yaWVudGF0aW9uOiBvcmllbnRhdGlvbiBlbnVtIHRv
IGJlIGZpbGxlZCBpbgorICoKKyAqIExvb2tzIHVwIHRoZSByb3RhdGlvbiBvZiBhIHBhbmVsIGlu
IHRoZSBkZXZpY2UgdHJlZS4gVGhlIG9yaWVudGF0aW9uIG9mIHRoZQorICogcGFuZWwgaXMgZXhw
cmVzc2VkIGFzIGEgcHJvcGVydHkgbmFtZSAicm90YXRpb24iIGluIHRoZSBkZXZpY2UgdHJlZS4g
VGhlCisgKiByb3RhdGlvbiBpbiB0aGUgZGV2aWNlIHRyZWUgaXMgY291bnRlciBjbG9ja3dpc2Uu
CisgKgorICogUmV0dXJuOiAwIHdoZW4gYSB2YWxpZCByb3RhdGlvbiB2YWx1ZSAoMCwgOTAsIDE4
MCwgb3IgMjcwKSBpcyByZWFkIG9yIHRoZQorICogcm90YXRpb24gcHJvcGVydHkgZG9lc24ndCBl
eGlzdC4gLUVFUlJPUiBvdGhlcndpc2UuCisgKi8KK2ludCBvZl9kcm1fZ2V0X3BhbmVsX29yaWVu
dGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCisJCQkJIGVudW0gZHJtX3BhbmVs
X29yaWVudGF0aW9uICpvcmllbnRhdGlvbikKK3sKKwlpbnQgcm90YXRpb24sIHJldDsKKworCXJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAicm90YXRpb24iLCAmcm90YXRpb24pOworCWlm
IChyZXQgPT0gLUVJTlZBTCkgeworCQkvKiBEb24ndCByZXR1cm4gYW4gZXJyb3IgaWYgdGhlcmUn
cyBubyByb3RhdGlvbiBwcm9wZXJ0eS4gKi8KKwkJKm9yaWVudGF0aW9uID0gRFJNX01PREVfUEFO
RUxfT1JJRU5UQVRJT05fVU5LTk9XTjsKKwkJcmV0dXJuIDA7CisJfQorCisJaWYgKHJldCA8IDAp
CisJCXJldHVybiByZXQ7CisKKwlpZiAocm90YXRpb24gPT0gMCkKKwkJKm9yaWVudGF0aW9uID0g
RFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fTk9STUFMOworCWVsc2UgaWYgKHJvdGF0aW9uID09
IDkwKQorCQkqb3JpZW50YXRpb24gPSBEUk1fTU9ERV9QQU5FTF9PUklFTlRBVElPTl9SSUdIVF9V
UDsKKwllbHNlIGlmIChyb3RhdGlvbiA9PSAxODApCisJCSpvcmllbnRhdGlvbiA9IERSTV9NT0RF
X1BBTkVMX09SSUVOVEFUSU9OX0JPVFRPTV9VUDsKKwllbHNlIGlmIChyb3RhdGlvbiA9PSAyNzAp
CisJCSpvcmllbnRhdGlvbiA9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX0xFRlRfVVA7CisJ
ZWxzZQorCQlyZXR1cm4gLUVJTlZBTDsKKworCXJldHVybiAwOworfQorRVhQT1JUX1NZTUJPTChv
Zl9kcm1fZ2V0X3BhbmVsX29yaWVudGF0aW9uKTsKICNlbmRpZgogCiBNT0RVTEVfQVVUSE9SKCJU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPiIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX3BhbmVsLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuZWwuaAppbmRleCA4YzczOGMw
ZTZlOWYuLjM1NjQ5NTJmMWE0ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3BhbmVsLmgKQEAgLTE5NywxMSArMTk3LDE4IEBAIGludCBk
cm1fcGFuZWxfZGV0YWNoKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKTsKIAogI2lmIGRlZmluZWQo
Q09ORklHX09GKSAmJiBkZWZpbmVkKENPTkZJR19EUk1fUEFORUwpCiBzdHJ1Y3QgZHJtX3BhbmVs
ICpvZl9kcm1fZmluZF9wYW5lbChjb25zdCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKK2ludCBv
Zl9kcm1fZ2V0X3BhbmVsX29yaWVudGF0aW9uKGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAs
CisJCQkJIGVudW0gZHJtX3BhbmVsX29yaWVudGF0aW9uICpvcmllbnRhdGlvbik7CiAjZWxzZQog
c3RhdGljIGlubGluZSBzdHJ1Y3QgZHJtX3BhbmVsICpvZl9kcm1fZmluZF9wYW5lbChjb25zdCBz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogewogCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogfQor
aW50IG9mX2RybV9nZXRfcGFuZWxfb3JpZW50YXRpb24oY29uc3Qgc3RydWN0IGRldmljZV9ub2Rl
ICpucCwKKwkJCQkgZW51bSBkcm1fcGFuZWxfb3JpZW50YXRpb24gKm9yaWVudGF0aW9uKQorewor
CXJldHVybiAtRU5PREVWOworfQogI2VuZGlmCiAKICNlbmRpZgotLSAKMi4yMi4wLjQxMC5nZDhm
ZGJlMjFiNS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
