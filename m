Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD5372AFF
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D3A6EAF0;
	Tue,  4 May 2021 13:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F31D6EADC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:38 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id b25so13159872eju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IDgRUHJwicRUiun+FrCDeqYmcPNSG89xMILj1rEOdww=;
 b=M0uHIm8+sTc3gANiNC0mkVCOPLizdMx76fZ0EPENotHLmlid5eN/5OjOwo32oKT6u0
 tKVYzhxzRCHHzlDA2wzhLdleT9XqlcuDlNsGDXAiBidFz9hA56kL0OrGhp3d+ezTBe4U
 07hDTggqaNDxnSN3txipS/OMebi3CsOpsq7xQrW6hPa21MsKm47bSROtvztxUFi9C+7w
 ooa0U08CAuk+9ee0Balm7BIKI3H+E18Mj+zqd0nUp/tlQCYmnm8VrT11D8di7nhcBnA8
 enUiKp0GQJOD3+Kh6mkrLP7svc45FzP4idwa6HQsnlK+B0e32r52iTw7dVCNKtNnk0Rq
 JuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IDgRUHJwicRUiun+FrCDeqYmcPNSG89xMILj1rEOdww=;
 b=HApQ5dQQHZq+UTXo7JnjHfWTvrZIOnlsLDiLCRr4393LAjZNm0UfN+UsoSpusp6bwR
 lbXTh4YuMEkHowacGrSQcgXpVHdg2VsWbogjAXYANtrBWm5hdv66UsdsOwO6wVQQo0Dd
 X5bnAJbOTK2rIlN46RDyNZrqTb2B9c/8ymfIkua29oEZNIwP1gglXBFOSW69uQ3Ypwfv
 +jXcuX4K6GIBe1fVhuMKKuHtELmgu7Cao1M8FKvgDu1z0RsJy/fIyz+3RpAcL65dqqER
 JzgybUdL5lMezDY2EbNCAACFcWwjg+xnrC2BW3345/FvtW1yOF5fmLZIklrTd3IEjdtd
 uIsA==
X-Gm-Message-State: AOAM530RQrHzGC1z2CmiTH1FRxWunPv+m85az/QY+nM5gNdMmFVw7ZTI
 sjG/jatYYkogAZsVpfru/z6SK6rGNAA=
X-Google-Smtp-Source: ABdhPJxNBhm1kwbAr94iVfgKGVBTIYGAXactpfsemSkX3vsq2DiEqE27hPS4wovSl9eoOdg9kF3XbA==
X-Received: by 2002:a17:906:a103:: with SMTP id
 t3mr22356706ejy.334.1620134857254; 
 Tue, 04 May 2021 06:27:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/12] drm/msm: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:25 +0200
Message-Id: <20210504132729.2046-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMgfCAxOCArKysrKysrKysrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZ2VtX3N1Ym1pdC5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1p
dC5jCmluZGV4IDU0ODA4NTJiZGVkYS4uYTc3Mzg5Y2UyM2QwIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ2VtX3N1Ym1pdC5jCkBAIC0yODUsNiArMjg1LDIwIEBAIHN0YXRpYyBpbnQgc3VibWl0X2xv
Y2tfb2JqZWN0cyhzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdCkKIAlyZXR1cm4gcmV0Owog
fQogCitzdGF0aWMgaW50IHN1Ym1pdF9zeW5jX3VzZXJfZmVuY2Uoc3RydWN0IG1zbV9nZW1fc3Vi
bWl0ICpzdWJtaXQpCit7CisJaW50IGksIHJldDsKKworCWZvciAoaSA9IDA7IGkgPCBzdWJtaXQt
Pm5yX2JvczsgaSsrKSB7CisJCXN0cnVjdCBtc21fZ2VtX29iamVjdCAqbXNtX29iaiA9IHN1Ym1p
dC0+Ym9zW2ldLm9iajsKKworCQlyZXQgPSBkbWFfcmVzdl9zeW5jX3VzZXJfZmVuY2UobXNtX29i
ai0+YmFzZS5yZXN2KTsKKwkJaWYgKHJldCkKKwkJCXJldHVybiByZXQ7CisJfQorCXJldHVybiAw
OworfQorCiBzdGF0aWMgaW50IHN1Ym1pdF9mZW5jZV9zeW5jKHN0cnVjdCBtc21fZ2VtX3N1Ym1p
dCAqc3VibWl0LCBib29sIG5vX2ltcGxpY2l0KQogewogCWludCBpLCByZXQgPSAwOwpAQCAtNzY5
LDYgKzc4MywxMCBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSwKIAkgKi8KIAlwbV9ydW50aW1lX2dldF9zeW5jKCZncHUtPnBkZXYt
PmRldik7CiAKKwlyZXQgPSBzdWJtaXRfc3luY191c2VyX2ZlbmNlKHN1Ym1pdCk7CisJaWYgKHJl
dCkKKwkJZ290byBvdXQ7CisKIAkvKiBjb3B5XypfdXNlciB3aGlsZSBob2xkaW5nIGEgd3cgdGlj
a2V0IHVwc2V0cyBsb2NrZGVwICovCiAJd3dfYWNxdWlyZV9pbml0KCZzdWJtaXQtPnRpY2tldCwg
JnJlc2VydmF0aW9uX3d3X2NsYXNzKTsKIAloYXNfd3dfdGlja2V0ID0gdHJ1ZTsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
