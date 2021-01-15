Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF82F83A5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57976E4CA;
	Fri, 15 Jan 2021 18:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3722E6E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id 7so2972813wrz.0
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GmnTQYGZFT8V4aHtRElOATkEuVPQEpEkCVYessHQgb4=;
 b=ao9i4vgDHHQIUekQ87MHFQREuE2D0YpI1oA3cL0opjewp4Err83XY74KoQW+PUQcRb
 5/OpZ0hdYs3gjXlaP4yjSWRMs8fpNjQkP5N5s+0qHuSdnNtrQNkslDD5dTRBpdk81T82
 4WPof4xIye7KPIpjykKw+as/Cvbr9v1Rl35atrE3W11DRTGEVwpo/EwHgUrj5ekuqI7L
 UUn7enAqQxpHwWjStPF8uo8DaTyvkZ9pdHdvzPePM1Q8OkvY0mpwg96l4+z6Iw6+1tC0
 bxLNZbk/UNcrrkbxvO9Xtzv6XjYJ/EbZQr8gLmniTqceS+jGGfITIBLFZYamuuJSqY2e
 Qc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GmnTQYGZFT8V4aHtRElOATkEuVPQEpEkCVYessHQgb4=;
 b=lRQMvVfas8oWuIHdwOovAkCJ5NgCBFhoV7i9I7fxuiJcnequ7f/FHok8Rs/7wJtwU+
 Z3ERQ645wqDO3046ARCAih+O9Gvd99WJCCl8l/vScRCYEcsJgmy6P55MSJ1VVX/cpfqE
 1+047PpLAIlIcUF1ZOvLn3/DShmmv0kMnOJnIkqBEhZSgagep46cyv0Ar+QIyJovI/FI
 wvWlVYQqFwU9GFxyguuMQsi/p0XsvdFpoRtYxGCGQpzznoWhY9Z/Gw/ovBUvNut+W694
 zzR/6Q9u5BnU21VNeiprrJfDp4sNDRTqKFQ39iKe+VnD+9kPN4RLeRAdP5MIKNBdTpOR
 Gh5Q==
X-Gm-Message-State: AOAM531KFodedmdkuhjDX7cOIHN+Fzz28MK2VjyrZcVKFG+u7kSA88rD
 WujnqO/jhPD2dHe7UxLZToLfKw==
X-Google-Smtp-Source: ABdhPJym4/tW0/UVxoaeFRN8gzoR+0lDT/OQGytPzdRqN6VKamUOSS/5kWdr2iqHm14l/DYCyWCijA==
X-Received: by 2002:adf:92a4:: with SMTP id 33mr14241917wrn.347.1610734574855; 
 Fri, 15 Jan 2021 10:16:14 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 06/29] drm/gma500/mmu: Actually return an error if one occurs
Date: Fri, 15 Jan 2021 18:15:38 +0000
Message-Id: <20210115181601.3432599-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2dtYTUwMC9tbXUuYzogSW4gZnVuY3Rpb24g4oCYcHNiX21tdV9pbnNlcnRfcGZu
X3NlcXVlbmNl4oCZOgogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tbXUuYzo2NTE6Njogd2Fybmlu
ZzogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCgpDYzogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWls
LmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
U2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9tbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvbW11LmMKaW5kZXggMDE0ZGFmMDI4MDQ4
NS4uMTNhZmYxOWFhZTliYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tbXUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL21tdS5jCkBAIC02ODEsNyArNjgxLDcgQEAg
aW50IHBzYl9tbXVfaW5zZXJ0X3Bmbl9zZXF1ZW5jZShzdHJ1Y3QgcHNiX21tdV9wZCAqcGQsIHVp
bnQzMl90IHN0YXJ0X3BmbiwKIAlpZiAocGQtPmh3X2NvbnRleHQgIT0gLTEpCiAJCXBzYl9tbXVf
Zmx1c2gocGQtPmRyaXZlcik7CiAKLQlyZXR1cm4gMDsKKwlyZXR1cm4gcmV0OwogfQogCiBpbnQg
cHNiX21tdV9pbnNlcnRfcGFnZXMoc3RydWN0IHBzYl9tbXVfcGQgKnBkLCBzdHJ1Y3QgcGFnZSAq
KnBhZ2VzLAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
