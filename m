Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0707556445
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2A86E318;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DA46E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:35:03 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id s15so3637268wmj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pPfiVDgc5mzijoolmBgAn7nj9hFIGXkNoey2vIeezPw=;
 b=i1mtvBtE4svCQHZrn117+BjVPlybxtvq4y9qvXd3CinZOXxvWd0UEnZziypDJxukrq
 28HyHlPC6s5Hor1hJgh8qIvKo6u52bLXC7Dmmo+yg75+QL9n/60Ep1oV/zgcgbiAE8bm
 3tb4JSntatPzDwbM6iKZByALVpbeo7b+RiU57YEz287vvoa4aTjwQjsRAvVIUimxeZeu
 UE7nOkQ8ni8Disubv71CR0JA2pPTbwd3qj30yxRTdlmTfvctdF6jmdkAu9lottNsu9Fk
 fZ8uSR5HKsf/li3jaIHMEDL2EMG7nrzPCt0AFgKtiqb5wfU+sFo1lVogmSCaiWh5KdWX
 Hqlw==
X-Gm-Message-State: APjAAAXmAgO45NRiPfebzugjbPpFReQCA1PR0PDtVPbcS2+RPIWPuCHw
 oxQ0JU5OFw5vsQgbkWayVOAQtQ==
X-Google-Smtp-Source: APXvYqxt8oVzolPe1n9o8Uiv/T6+/noYyCssxvgjcGdkHFXUOpA/NNpR2yPO4gsel41nlJ0REFrQ8Q==
X-Received: by 2002:a1c:a842:: with SMTP id r63mr20223185wme.117.1561480501837; 
 Tue, 25 Jun 2019 09:35:01 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:35:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 08/12] ARM: davinci: da850-evm: switch to using a fixed
 regulator for lcdc
Date: Tue, 25 Jun 2019 18:34:30 +0200
Message-Id: <20190625163434.13620-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pPfiVDgc5mzijoolmBgAn7nj9hFIGXkNoey2vIeezPw=;
 b=PH6PJoOty745v5HCYWGPCWBeeSNGmb9UwwqkfUOiMl1dAeUCOfW64MYeP65AJk34q9
 QVGkrvI13TaiQUcKO3PAzYhR+SlYTOCGOCEmHOZl8pzZnDrgU3OgL2F4sF4t8Wuu45bI
 O0s/CEA9VySw6B9MT6SnlA85lLwIQMHTWKRdJ5dPWzlthv0Mp9kYKxLDYTI2NT9eAsHs
 9Bzih0UeynmsFxiAwYLqO5DU6VEut6rYd9k7eNOqFJNdg09L0b6P5zp0kJwKKrUMpgTh
 0ABqdJwysPXZFSMGHbolipLeMxh0463L8lROsmZybF2G0ckfGkRbbW/NOxebpA6Ut4Ft
 dJyg==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCk5v
dyB0aGF0IHRoZSBkYTh4eCBmYmRldiBkcml2ZXIgc3VwcG9ydHMgcG93ZXIgY29udHJvbCB3aXRo
IGFuIGFjdHVhbApyZWd1bGF0b3IsIHN3aXRjaCB0byB1c2luZyBhIGZpeGVkIHBvd2VyIHN1cHBs
eSBmb3IgZGE4NTAtZXZtLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8Ymdv
bGFzemV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBhcmNoL2FybS9tYWNoLWRhdmluY2kvYm9hcmQt
ZGE4NTAtZXZtLmMgfCA2MiArKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9h
cm0vbWFjaC1kYXZpbmNpL2JvYXJkLWRhODUwLWV2bS5jIGIvYXJjaC9hcm0vbWFjaC1kYXZpbmNp
L2JvYXJkLWRhODUwLWV2bS5jCmluZGV4IGZmZGE2MjNiYjU0My4uZDI2OTUwZjYwNWY0IDEwMDY0
NAotLS0gYS9hcmNoL2FybS9tYWNoLWRhdmluY2kvYm9hcmQtZGE4NTAtZXZtLmMKKysrIGIvYXJj
aC9hcm0vbWFjaC1kYXZpbmNpL2JvYXJkLWRhODUwLWV2bS5jCkBAIC04MDIsMTIgKzgwMiw2IEBA
IHN0YXRpYyBjb25zdCBzaG9ydCBkYTg1MF9ldm1fbW1jc2QwX3BpbnNbXSBfX2luaXRjb25zdCA9
IHsKIAktMQogfTsKIAotc3RhdGljIHZvaWQgZGE4NTBfcGFuZWxfcG93ZXJfY3RybChpbnQgdmFs
KQotewotCS8qIGxjZCBwb3dlciAqLwotCWdwaW9fc2V0X3ZhbHVlKERBODUwX0xDRF9QV1JfUElO
LCB2YWwpOwotfQotCiBzdGF0aWMgc3RydWN0IHByb3BlcnR5X2VudHJ5IGRhODUwX2xjZF9iYWNr
bGlnaHRfcHJvcHNbXSA9IHsKIAlQUk9QRVJUWV9FTlRSWV9CT09MKCJkZWZhdWx0LW9uIiksCiAJ
eyB9CkBAIC04MjcsMjggKzgyMSw2MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2Rl
dmljZV9pbmZvIGRhODUwX2xjZF9iYWNrbGlnaHRfaW5mbyA9IHsKIAkucHJvcGVydGllcwk9IGRh
ODUwX2xjZF9iYWNrbGlnaHRfcHJvcHMsCiB9OwogCitzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9j
b25zdW1lcl9zdXBwbHkgZGE4NTBfbGNkX3N1cHBsaWVzW10gPSB7CisJUkVHVUxBVE9SX1NVUFBM
WSgibGNkIiwgTlVMTCksCit9OworCitzdGF0aWMgc3RydWN0IHJlZ3VsYXRvcl9pbml0X2RhdGEg
ZGE4NTBfbGNkX3N1cHBseV9kYXRhID0geworCS5jb25zdW1lcl9zdXBwbGllcwk9IGRhODUwX2xj
ZF9zdXBwbGllcywKKwkubnVtX2NvbnN1bWVyX3N1cHBsaWVzCT0gQVJSQVlfU0laRShkYTg1MF9s
Y2Rfc3VwcGxpZXMpLAorCS5jb25zdHJhaW50cyAgICA9IHsKKwkJLnZhbGlkX29wc19tYXNrID0g
UkVHVUxBVE9SX0NIQU5HRV9TVEFUVVMsCisJfSwKK307CisKK3N0YXRpYyBzdHJ1Y3QgZml4ZWRf
dm9sdGFnZV9jb25maWcgZGE4NTBfbGNkX3N1cHBseSA9IHsKKwkuc3VwcGx5X25hbWUJCT0gImxj
ZCIsCisJLm1pY3Jvdm9sdHMJCT0gMzMwMDAwMDAsCisJLmluaXRfZGF0YQkJPSAmZGE4NTBfbGNk
X3N1cHBseV9kYXRhLAorfTsKKworc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgZGE4NTBf
bGNkX3N1cHBseV9kZXZpY2UgPSB7CisJLm5hbWUJCQk9ICJyZWctZml4ZWQtdm9sdGFnZSIsCisJ
LmlkCQkJPSAxLCAvKiBEdW1teSBmaXhlZCByZWd1bGF0b3IgaXMgMCAqLworCS5kZXYJCQk9IHsK
KwkJLnBsYXRmb3JtX2RhdGEgPSAmZGE4NTBfbGNkX3N1cHBseSwKKwl9LAorfTsKKworc3RhdGlj
IHN0cnVjdCBncGlvZF9sb29rdXBfdGFibGUgZGE4NTBfbGNkX3N1cHBseV9ncGlvX3RhYmxlID0g
eworCS5kZXZfaWQJCQk9ICJyZWctZml4ZWQtdm9sdGFnZS4xIiwKKwkudGFibGUgPSB7CisJCUdQ
SU9fTE9PS1VQKCJkYXZpbmNpX2dwaW8iLCBEQTg1MF9MQ0RfUFdSX1BJTiwgTlVMTCwgMCksCisJ
CXsgfQorCX0sCit9OworCitzdGF0aWMgc3RydWN0IGdwaW9kX2xvb2t1cF90YWJsZSAqZGE4NTBf
bGNkX2dwaW9fbG9va3Vwc1tdID0geworCSZkYTg1MF9sY2RfYmFja2xpZ2h0X2dwaW9fdGFibGUs
CisJJmRhODUwX2xjZF9zdXBwbHlfZ3Bpb190YWJsZSwKK307CisKIHN0YXRpYyBpbnQgZGE4NTBf
bGNkX2h3X2luaXQodm9pZCkKIHsKIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpiYWNrbGlnaHQ7
CiAJaW50IHN0YXR1czsKIAotCWdwaW9kX2FkZF9sb29rdXBfdGFibGUoJmRhODUwX2xjZF9iYWNr
bGlnaHRfZ3Bpb190YWJsZSk7CisJZ3Bpb2RfYWRkX2xvb2t1cF90YWJsZXMoZGE4NTBfbGNkX2dw
aW9fbG9va3VwcywKKwkJCQlBUlJBWV9TSVpFKGRhODUwX2xjZF9ncGlvX2xvb2t1cHMpKTsKKwog
CWJhY2tsaWdodCA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9mdWxsKCZkYTg1MF9sY2RfYmFj
a2xpZ2h0X2luZm8pOwogCWlmIChJU19FUlIoYmFja2xpZ2h0KSkKIAkJcmV0dXJuIFBUUl9FUlIo
YmFja2xpZ2h0KTsKIAotCXN0YXR1cyA9IGdwaW9fcmVxdWVzdChEQTg1MF9MQ0RfUFdSX1BJTiwg
ImxjZCBwd3IiKTsKLQlpZiAoc3RhdHVzIDwgMCkKKwlzdGF0dXMgPSBwbGF0Zm9ybV9kZXZpY2Vf
cmVnaXN0ZXIoJmRhODUwX2xjZF9zdXBwbHlfZGV2aWNlKTsKKwlpZiAoc3RhdHVzKQogCQlyZXR1
cm4gc3RhdHVzOwogCi0JZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KERBODUwX0xDRF9QV1JfUElOLCAw
KTsKLQotCS8qIFN3aXRjaCBvZmYgcGFuZWwgcG93ZXIgKi8KLQlkYTg1MF9wYW5lbF9wb3dlcl9j
dHJsKDApOwotCi0JLyogU3dpdGNoIG9uIHBhbmVsIHBvd2VyICovCi0JZGE4NTBfcGFuZWxfcG93
ZXJfY3RybCgxKTsKLQogCXJldHVybiAwOwogfQogCkBAIC0xNDU4LDcgKzE0ODUsNiBAQCBzdGF0
aWMgX19pbml0IHZvaWQgZGE4NTBfZXZtX2luaXQodm9pZCkKIAlpZiAocmV0KQogCQlwcl93YXJu
KCIlczogTENEIGluaXRpYWxpemF0aW9uIGZhaWxlZDogJWRcbiIsIF9fZnVuY19fLCByZXQpOwog
Ci0Jc2hhcnBfbGswNDN0MWRnMDFfcGRhdGEucGFuZWxfcG93ZXJfY3RybCA9IGRhODUwX3BhbmVs
X3Bvd2VyX2N0cmwsCiAJcmV0ID0gZGE4eHhfcmVnaXN0ZXJfbGNkYygmc2hhcnBfbGswNDN0MWRn
MDFfcGRhdGEpOwogCWlmIChyZXQpCiAJCXByX3dhcm4oIiVzOiBMQ0RDIHJlZ2lzdHJhdGlvbiBm
YWlsZWQ6ICVkXG4iLCBfX2Z1bmNfXywgcmV0KTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
