Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA2626607
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD43089BA1;
	Wed, 22 May 2019 14:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC47F899F3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 12:39:35 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id z26so1267909pfg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 05:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=dc7HIox1GsMuz4SBq4z5Y4Rf5G0I0yZOZzYD3qgtYkk=;
 b=P2ZQOW/DuxIJh7bm7BY8OehU6xLdfTnx0RaCjWnU7X9CxMcAZXzCXsmf2kVKeDDObd
 fdMKzfKtlf/lbNbYZefuk9IP2SiMVAiV5ykpPKhEY6Ai+z5Fsop+x6C0CT4W0qPSMKE4
 PRM076AsloZyfiY1U1kRj0Y8sECQtdvB9i4Zzb8NyGjy22XYiF9PTH3yhqFtIEHw+4vV
 0EliWJRhPLqSQMFJ19Vlrab8beZ0keIvo2IiUhxa6AiVOWoxE0ax2EEoiTGvVom2m5zd
 /ZUxjk/ToYomhTfRx+TIy1e+EIV13J/H+Ay2F5M7ZBrFmF0led6r95UKPxFJq9Bd/tjo
 k2tw==
X-Gm-Message-State: APjAAAVUtHe1GG7N/0oAiBfxrgyJ2T5nidcHosiBVFpNgQFt33q7Pfak
 goAo9rd9nXKSwqJR727nnSk=
X-Google-Smtp-Source: APXvYqxqnL4m4W21i3wMRJGnCrMhpbAjue2VzlAFhr3P/pr64Je+zpBUV1ERw25chi2BkyvOo31N9w==
X-Received: by 2002:a62:164f:: with SMTP id 76mr96965718pfw.172.1558528775567; 
 Wed, 22 May 2019 05:39:35 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id p16sm7830380pff.35.2019.05.22.05.39.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:39:35 -0700 (PDT)
Date: Wed, 22 May 2019 20:39:20 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: sean@poorly.run
Subject: [PATCH] drm_edid-load: Fix a missing-check bug in
 drivers/gpu/drm/drm_edid_load.c
Message-ID: <20190522123920.GB6772@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=dc7HIox1GsMuz4SBq4z5Y4Rf5G0I0yZOZzYD3qgtYkk=;
 b=bJ0iQKw1WpVz5o+fAWQbVQTRvyqZj/6Mirn0lL9A+ptZB/CHbOT2FixTnj4fc/NfrK
 0JAhbnGR9zUz4Fo1hnQ+GrtTo7OEfzVNY36Fwan0FSE6Kc3c535Ny13OG4ZKPC2RJhKW
 UhEpSp+NxC41s4Y9m+5Re0Ain+tENvUL6HfhP44K/gZiahcp94gVoH49moHpv14ffiQM
 KX+A99qSVDYJGv1m0/JaC9ztwdqkmN6cLO87sVlG4hTTlulR1f4k8ouVCMxMeyoT/AaL
 ZH4ckKIkO96lt0dRYoNO2AfOLRCy2qHasKE5gTdRrjIm/1QLfnFIaYLlZCA7jZAJ1O0r
 oyOw==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHJtX2xvYWRfZWRpZF9maXJtd2FyZSgpLCBmd3N0ciBpcyBhbGxvY2F0ZWQgYnkga3N0cmR1
cCgpLiBBbmQgZndzdHIKaXMgZGVyZWZlcmVuY2VkIGluIHRoZSBmb2xsb3dpbmcgY29kZXMuIEhv
d2V2ZXIsIG1lbW9yeSBhbGxvY2F0aW9uIApmdW5jdGlvbnMgc3VjaCBhcyBrc3RyZHVwKCkgbWF5
IGZhaWwgYW5kIHJldHVybnMgTlVMTC4gRGVyZWZlcmVuY2luZyAKdGhpcyBudWxsIHBvaW50ZXIg
bWF5IGNhdXNlIHRoZSBrZXJuZWwgZ28gd3JvbmcuIFRodXMgd2Ugc2hvdWxkIGNoZWNrIAp0aGlz
IGtzdHJkdXAoKSBvcGVyYXRpb24uCkZ1cnRoZXIsIGlmIGtzdHJkdXAoKSByZXR1cm5zIE5VTEws
IHdlIHNob3VsZCByZXR1cm4gRVJSX1BUUigtRU5PTUVNKSB0bwp0aGUgY2FsbGVyIHNpdGUuCgpT
aWduZWQtb2ZmLWJ5OiBHZW4gWmhhbmcgPGJsYWNrZ29kMDE2NTc0QGdtYWlsLmNvbT4KCi0tLQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZWRpZF9sb2FkLmMKaW5kZXggYTQ5MTUwOS4uYTBlMTA3YSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2VkaWRfbG9hZC5jCkBAIC0yOTAsNiArMjkwLDggQEAgc3RydWN0IGVkaWQgKmRybV9sb2FkX2Vk
aWRfZmlybXdhcmUoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAkgKiB0aGUgbGFz
dCBvbmUgZm91bmQgb25lIGFzIGEgZmFsbGJhY2suCiAJICovCiAJZndzdHIgPSBrc3RyZHVwKGVk
aWRfZmlybXdhcmUsIEdGUF9LRVJORUwpOworCWlmICghZndzdHIpCisJCXJldHVybiBFUlJfUFRS
KC1FTk9NRU0pOwogCWVkaWRzdHIgPSBmd3N0cjsKIAogCXdoaWxlICgoZWRpZG5hbWUgPSBzdHJz
ZXAoJmVkaWRzdHIsICIsIikpKSB7Ci0tLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
