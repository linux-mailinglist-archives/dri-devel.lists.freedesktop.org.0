Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E267A73
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jul 2019 16:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A33C89948;
	Sat, 13 Jul 2019 14:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D10B6E33F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 10:05:24 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id t16so4087463pfe.11
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rS6zkcW47m8W9zfkh+VM7vIXvZMkibrUOXYUf4msEEM=;
 b=E9lYOLrkyb53ejB/FMnvxF2Wz9N0EvcTkRW+nL2U71+qRDHw3bIs71K/nLSV6JtaoT
 xk3BCfHy3RiOl590yAbqJRIWmF97LB0g6Idu3cA5p45v3neV2itNai42cs6eU1Cm+1sl
 d3diENJhQzCyn8eKhos5FXGYpl2zEDCcm1v5dLjOhhzeavvZlMMuUf1nO9gphiRBXete
 0vYKB5qa1SggBbWEkAg54MQBqGy2Sk4W1GZ04gbT4dqCIdUCA2458yLBstbJr4lgDP9W
 M/32J3dvtrBbzhK14Ai4OIo4dQekOlHBuItpLJWsmLefR7fybzUxpuRD6U7djd2Lx8Aj
 /HSg==
X-Gm-Message-State: APjAAAU3Eqk5sSQ+OOpfykOcI6EQNVsGeTGpVJzi7i6VEcCqdUPJJD9F
 hE/BGRNNFeD+rcOqItv51udVmQ==
X-Google-Smtp-Source: APXvYqz7SudcvvS5pF+UuX1xodz8OlwvmJ4ZVax0qTiAuJMFysNNw5skd8gJXRuISPAh/Pift1dikA==
X-Received: by 2002:a17:90a:898e:: with SMTP id
 v14mr10597150pjn.119.1562925924549; 
 Fri, 12 Jul 2019 03:05:24 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id s11sm7658859pgv.13.2019.07.12.03.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 03:05:23 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
Date: Fri, 12 Jul 2019 18:04:39 +0800
Message-Id: <20190712100443.221322-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190712100443.221322-1-cychiang@chromium.org>
References: <20190712100443.221322-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 13 Jul 2019 14:24:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rS6zkcW47m8W9zfkh+VM7vIXvZMkibrUOXYUf4msEEM=;
 b=RDVx1KXccl3mvFHUy6r7nTol8Lf7wAQOsrR/0/uAxUrL7oNBlwm9mkTQQMbzZbVwHH
 KcW5fTbUZyvWJCY2CbIAdoPOk4gWZa6CxObxvRpHBj4SYAJOz2cnrVCVij9HqjhFtIjQ
 pz4bYOSc1ZWCTc4s8x3GObiD4Dr1AUwN4Qbt8=
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIG9wIGluIGhkbWlfY29kZWNfb3BzIHNvIGNvZGVjIGRyaXZlciBjYW4gcmVnaXN0ZXIg
Y2FsbGJhY2sKZnVuY3Rpb24gdG8gaGFuZGxlIHBsdWcgZXZlbnQuCgpEcml2ZXIgaW4gRFJNIGNh
biB1c2UgdGhpcyBjYWxsYmFjayBmdW5jdGlvbiB0byByZXBvcnQgY29ubmVjdG9yIHN0YXR1cy4K
ClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgot
LS0KIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oICAgIHwgMTYgKysrKysrKysrKysrKwogc291
bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMgfCA0NSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmggYi9pbmNsdWRlL3NvdW5kL2hkbWktY29kZWMu
aAppbmRleCA3ZmVhNDk2ZjFmMzQuLjlhODY2MTY4MDI1NiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9z
b3VuZC9oZG1pLWNvZGVjLmgKKysrIGIvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgKQEAgLTQ3
LDYgKzQ3LDkgQEAgc3RydWN0IGhkbWlfY29kZWNfcGFyYW1zIHsKIAlpbnQgY2hhbm5lbHM7CiB9
OwogCit0eXBlZGVmIHZvaWQgKCpoZG1pX2NvZGVjX3BsdWdnZWRfY2IpKHN0cnVjdCBkZXZpY2Ug
KmRldiwKKwkJCQkgICAgICBib29sIHBsdWdnZWQpOworCiBzdHJ1Y3QgaGRtaV9jb2RlY19wZGF0
YTsKIHN0cnVjdCBoZG1pX2NvZGVjX29wcyB7CiAJLyoKQEAgLTg4LDYgKzkxLDEzIEBAIHN0cnVj
dCBoZG1pX2NvZGVjX29wcyB7CiAJICovCiAJaW50ICgqZ2V0X2RhaV9pZCkoc3RydWN0IHNuZF9z
b2NfY29tcG9uZW50ICpjb21tZW50LAogCQkJICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50
KTsKKworCS8qCisJICogSG9vayBjYWxsYmFjayBmdW5jdGlvbiB0byBoYW5kbGUgY29ubmVjdG9y
IHBsdWcgZXZlbnQuCisJICogT3B0aW9uYWwKKwkgKi8KKwlpbnQgKCpob29rX3BsdWdnZWRfY2Ip
KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKKwkJCSAgICAgICBoZG1pX2NvZGVjX3Bs
dWdnZWRfY2IgZm4pOwogfTsKIAogLyogSERNSSBjb2RlYyBpbml0YWxpemF0aW9uIGRhdGEgKi8K
QEAgLTk5LDYgKzEwOSwxMiBAQCBzdHJ1Y3QgaGRtaV9jb2RlY19wZGF0YSB7CiAJdm9pZCAqZGF0
YTsKIH07CiAKK3N0cnVjdCBzbmRfc29jX2NvbXBvbmVudDsKK3N0cnVjdCBzbmRfc29jX2phY2s7
CisKK2ludCBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdChzdHJ1Y3Qgc25kX3NvY19jb21wb25l
bnQgKmNvbXBvbmVudCwKKwkJCSAgICAgICBzdHJ1Y3Qgc25kX3NvY19qYWNrICpqYWNrKTsKKwog
I2RlZmluZSBIRE1JX0NPREVDX0RSVl9OQU1FICJoZG1pLWF1ZGlvLWNvZGVjIgogCiAjZW5kaWYg
LyogX19IRE1JX0NPREVDX0hfXyAqLwpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9oZG1p
LWNvZGVjLmMgYi9zb3VuZC9zb2MvY29kZWNzL2hkbWktY29kZWMuYwppbmRleCAwYmYxYzhjYWQx
MDguLjMyYmY3NDQxYmU1YyAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVj
LmMKKysrIGIvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMKQEAgLTcsNiArNyw3IEBACiAj
aW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvc3RyaW5nLmg+CiAjaW5j
bHVkZSA8c291bmQvY29yZS5oPgorI2luY2x1ZGUgPHNvdW5kL2phY2suaD4KICNpbmNsdWRlIDxz
b3VuZC9wY20uaD4KICNpbmNsdWRlIDxzb3VuZC9wY21fcGFyYW1zLmg+CiAjaW5jbHVkZSA8c291
bmQvc29jLmg+CkBAIC0yNzQsNiArMjc1LDggQEAgc3RydWN0IGhkbWlfY29kZWNfcHJpdiB7CiAJ
c3RydWN0IHNuZF9wY21fY2htYXAgKmNobWFwX2luZm87CiAJdW5zaWduZWQgaW50IGNobWFwX2lk
eDsKIAlzdHJ1Y3QgbXV0ZXggbG9jazsKKwlzdHJ1Y3Qgc25kX3NvY19qYWNrICpqYWNrOworCXVu
c2lnbmVkIGludCBqYWNrX3N0YXR1czsKIH07CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3Nv
Y19kYXBtX3dpZGdldCBoZG1pX3dpZGdldHNbXSA9IHsKQEAgLTY2Myw2ICs2NjYsNDggQEAgc3Rh
dGljIGludCBoZG1pX2RhaV9wcm9iZShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKIAlyZXR1cm4g
MDsKIH0KIAorc3RhdGljIHZvaWQgaGRtaV9jb2RlY19qYWNrX3JlcG9ydChzdHJ1Y3QgaGRtaV9j
b2RlY19wcml2ICpoY3AsCisJCQkJICAgdW5zaWduZWQgaW50IGphY2tfc3RhdHVzKQoreworCWlm
IChoY3AtPmphY2sgJiYgamFja19zdGF0dXMgIT0gaGNwLT5qYWNrX3N0YXR1cykgeworCQlzbmRf
c29jX2phY2tfcmVwb3J0KGhjcC0+amFjaywgamFja19zdGF0dXMsIFNORF9KQUNLX0xJTkVPVVQp
OworCQloY3AtPmphY2tfc3RhdHVzID0gamFja19zdGF0dXM7CisJfQorfQorCitzdGF0aWMgdm9p
ZCBwbHVnZ2VkX2NiKHN0cnVjdCBkZXZpY2UgKmRldiwgYm9vbCBwbHVnZ2VkKQoreworCXN0cnVj
dCBoZG1pX2NvZGVjX3ByaXYgKmhjcCA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCisJaWYgKHBs
dWdnZWQpCisJCWhkbWlfY29kZWNfamFja19yZXBvcnQoaGNwLCBTTkRfSkFDS19MSU5FT1VUKTsK
KwllbHNlCisJCWhkbWlfY29kZWNfamFja19yZXBvcnQoaGNwLCAwKTsKK30KKworLyoqCisgKiBo
ZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdCAtIHJlZ2lzdGVyIEhETUkgcGx1Z2dlZCBjYWxsYmFj
aworICogQGNvbXBvbmVudDogdGhlIGhkbWktY29kZWMgaW5zdGFuY2UKKyAqIEBqYWNrOiBBU29D
IGphY2sgdG8gcmVwb3J0IChkaXMpY29ubmVjdGlvbiBldmVudHMgb24KKyAqLworaW50IGhkbWlf
Y29kZWNfc2V0X2phY2tfZGV0ZWN0KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50
LAorCQkJICAgICAgIHN0cnVjdCBzbmRfc29jX2phY2sgKmphY2spCit7CisJc3RydWN0IGhkbWlf
Y29kZWNfcHJpdiAqaGNwID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50
KTsKKwlpbnQgcmV0ID0gLUVPUE5PVFNVUFA7CisKKwlpZiAoaGNwLT5oY2Qub3BzLT5ob29rX3Bs
dWdnZWRfY2IpIHsKKwkJaGNwLT5qYWNrID0gamFjazsKKwkJcmV0ID0gaGNwLT5oY2Qub3BzLT5o
b29rX3BsdWdnZWRfY2IoY29tcG9uZW50LT5kZXYtPnBhcmVudCwKKwkJCQkJCSAgICBoY3AtPmhj
ZC5kYXRhLAorCQkJCQkJICAgIHBsdWdnZWRfY2IpOworCQlpZiAocmV0KQorCQkJaGNwLT5qYWNr
ID0gTlVMTDsKKwl9CisJcmV0dXJuIHJldDsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKGhkbWlfY29k
ZWNfc2V0X2phY2tfZGV0ZWN0KTsKKwogc3RhdGljIGludCBoZG1pX2RhaV9zcGRpZl9wcm9iZShz
dHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKIHsKIAlzdHJ1Y3QgaGRtaV9jb2RlY19kYWlmbXQgKmNm
ID0gZGFpLT5wbGF5YmFja19kbWFfZGF0YTsKLS0gCjIuMjIuMC41MTAuZzI2NGYyYzgxN2EtZ29v
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
