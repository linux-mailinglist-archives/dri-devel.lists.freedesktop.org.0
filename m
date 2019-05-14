Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 776591C8C4
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C269F8930B;
	Tue, 14 May 2019 12:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFEE892E2;
 Tue, 14 May 2019 12:31:35 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x64so2668004wmb.5;
 Tue, 14 May 2019 05:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GbbxRsfFG7hvL8ShZwkSv3MwlUoTFC+UQMPAXiSd7+Q=;
 b=dY/6JvqJs2lQusbtlhMelL3iAF69MpAyKDzaDa44cVYyAeCC6W2PsYGRdk9+x2qvEW
 pKxigRT3RqKO/xFt+dlsTAChQXmpihtqIV+zgyYYOny7o3xx+BfgrmIEArLrtJjTv7rV
 BDxxyzxc5Ec0XThKSjWUuADHynPYho/lD/7Hu7xYXkUqO6OSPSqj3TznCAIvb0VR2HqS
 pGO5Wa6309LriVVlKed05/OlPKRZhRU6jXcURz2frw9xX+dwS0xjIGiS/p9hJ4rVj42e
 YyiMnBvR2Vr9nS2WACg8uK8kgGyXVeJPwbhurz2OkTl9DTr/5p3HbSq+lzlppUmPm8bl
 wJkA==
X-Gm-Message-State: APjAAAWEhu8p4jdzJWbeXkzQ6KN/HUwQT+nbNSymJWgIDOoVMF0ePsa0
 zChzSv55KnrP/snjgLg42UL7qMoF
X-Google-Smtp-Source: APXvYqxFXrDS8nf01mOnH1d0oJaeiwIevI8AHgSeyZELqaC0UbKTeByG7MXItYsbLb3JDWUvp9t38g==
X-Received: by 2002:a1c:6783:: with SMTP id b125mr19929401wmc.41.1557837094103; 
 Tue, 14 May 2019 05:31:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/11] drm/ttm: remove manual placement preference
Date: Tue, 14 May 2019 14:31:21 +0200
Message-Id: <20190514123127.1650-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GbbxRsfFG7hvL8ShZwkSv3MwlUoTFC+UQMPAXiSd7+Q=;
 b=vWUggTkWp//yYZ+CG7oUuCDmZu9IIgluMPvD8A+m0hMgMhPzHFUC+FLp2A2XUmbseR
 i72ItgML+SHp15JAv3GZThIgErlIfV9UIXzcFbP493LLUhsdtxfAe/yXSNTby+UTeuxd
 FyXd9vFi4vjRuVRi8C63wkYxs43enrR31iHfEnpYziTyw6OuH8yOB66URE2UiUnWPh3h
 SaVbyF4I6scKcSQzw4n7ylRaBLzWhLnUdtzU0uo9CqgGOSTClOxJ81V16P8ST51wA3MR
 LxrCFPRyA85P9mFg0HaYtl617BykGmNj/ffN5mQjlNjbUyVtFi4FMLi+8JVtyhHGqZMm
 9zng==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgZHJpdmVycyBkb24ndCBwcmVmZXIgYSBzeXN0ZW0gbWVtb3J5IHBsYWNlbWVudAp0aGV5IHNo
b3VsZCBub3QgYnV0IGl0IGludG8gdGhlIHBsYWNlbWVudCBsaXN0IGZpcnN0LgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKaW5kZXggNmY2OTJmOTJkMGY0Li4xZmUzMDJkZWUxYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpA
QCAtMTA4OCw4ICsxMDg4LDEyIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCiAJCXR0bV9mbGFnX21hc2tlZCgmY3VyX2ZsYWdzLCBwbGFjZS0+Zmxh
Z3MsCiAJCQkJflRUTV9QTF9NQVNLX01FTVRZUEUpOwogCi0JCWlmIChtZW1fdHlwZSA9PSBUVE1f
UExfU1lTVEVNKQotCQkJYnJlYWs7CisJCWlmIChtZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7
CisJCQltZW0tPm1lbV90eXBlID0gbWVtX3R5cGU7CisJCQltZW0tPnBsYWNlbWVudCA9IGN1cl9m
bGFnczsKKwkJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CisJCQlyZXR1cm4gMDsKKwkJfQogCiAJCXJl
dCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxhY2UsIG1lbSk7CiAJCWlmICh1
bmxpa2VseShyZXQpKQpAQCAtMTEwMSwxNiArMTEwNSwxMiBAQCBpbnQgdHRtX2JvX21lbV9zcGFj
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCSgqbWFuLT5mdW5jLT5wdXRfbm9k
ZSkobWFuLCBtZW0pOwogCQkJCXJldHVybiByZXQ7CiAJCQl9Ci0JCQlicmVhazsKKwkJCW1lbS0+
bWVtX3R5cGUgPSBtZW1fdHlwZTsKKwkJCW1lbS0+cGxhY2VtZW50ID0gY3VyX2ZsYWdzOworCQkJ
cmV0dXJuIDA7CiAJCX0KIAl9CiAKLQlpZiAoKHR5cGVfb2sgJiYgKG1lbV90eXBlID09IFRUTV9Q
TF9TWVNURU0pKSB8fCBtZW0tPm1tX25vZGUpIHsKLQkJbWVtLT5tZW1fdHlwZSA9IG1lbV90eXBl
OwotCQltZW0tPnBsYWNlbWVudCA9IGN1cl9mbGFnczsKLQkJcmV0dXJuIDA7Ci0JfQotCiAJZm9y
IChpID0gMDsgaSA8IHBsYWNlbWVudC0+bnVtX2J1c3lfcGxhY2VtZW50OyArK2kpIHsKIAkJY29u
c3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UgPSAmcGxhY2VtZW50LT5idXN5X3BsYWNlbWVudFtp
XTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
