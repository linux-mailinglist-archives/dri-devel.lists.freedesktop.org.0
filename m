Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB91D62B4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4EC6E29B;
	Mon, 14 Oct 2019 12:38:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB246E297
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:38:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o18so19497886wrv.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=nOgIuc5Bl8KxMkxqtgNKl/6gzUvol4PhmKHmy0e21StYdk2fhrXpUMU4p9wtoAm3iv
 POFN1S/38ksiwAEwmbqrcRk5Qedo2WNyHcwYT2SS0EbE+t4N6Yu9zpTPRC+5cs1MsCcb
 Zgan2OCXkeLdFk50gP2ggL8KUQSOWmFl8sL88EH3Ajki+fMRsVSKX/oZbG+qeH7KGojn
 dxfui03DsO9cL4zPWApJ4bYsawZxrnqBPL9c3C0wmQpCeF1mJTsw/DDSRPjRLjQmPaeD
 Y609S8OwikHiuDJknDLCgBloHIflas984ka0wylDo6byHKX/FkhHJ6m8qrHIrpWt7DB8
 QldQ==
X-Gm-Message-State: APjAAAUnMCW5lJJ4ne5XSRfNP6BSvkuWkQJjKNMaZW5w7KYSfFNCW2Cg
 NpHnVjREIuDC3QDsWUiWpu8i2ybpDHKxcw==
X-Google-Smtp-Source: APXvYqz+FgWNXKrCNOXoVmPUuC4i7xprw0Czm06Vdv+ea21YC90NRDy0PnWiGTBp87e54R4LMiZMrQ==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr10203757wrs.158.1571056712727; 
 Mon, 14 Oct 2019 05:38:32 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm19171203wmo.22.2019.10.14.05.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:38:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/meson: store the framebuffer width for plane commit
Date: Mon, 14 Oct 2019 14:38:21 +0200
Message-Id: <20191014123826.27629-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014123826.27629-1-narmstrong@baylibre.com>
References: <20191014123826.27629-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=ky997XRIQt2f5E94jo8Ad4UADpcpymsI40Ut9P/rKg8HSRGnyFKZM2UDsfUtXxqOQ3
 dj7nMQi4IPsnIDnKJ5h8+hp93S0xQUPpoqMQEnlHaTbCM2/dc+NADw1taElaADL9C+qU
 SbE3aFnFYcKp0S/WGIcltZZV1KplmV2jKY1uTfcVpVHpOsmsaXw4bK8oWaK8HSPdpuCu
 5ALKEnzp5vA6mRgI60mPbfkMNix7x8EY4YPpGN2SIVSbJJ9F8Y1I2rOf4Ij3Rm5TsOfW
 tcLkaO2ysImc0kitgHBPQFkIhtRd3HivvdBggacn3e4Pe1kmCeDy+zrxyIW9/nuBoVvl
 NTdA==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyBzdG9yZSB0aGUgZnJhbWVidWZmZXIgd2lkdGggaW4gdGhlIHByaXZhdGUgY29tbW9uIHN0
cnVjdAp0byBiZSB1c2VkIGJ5IHRoZSBBRkJDIGRlY29kZXIgbW9kdWxlIGRyaXZlciB3aGVuIGNv
bW1pdHRpbmcgdGhlIEFGQkMKcGxhbmUuCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2Rydi5oICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9wbGFuZS5jIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuaAppbmRleCA4MjBkMDdiZGQ0MmEuLjMyODcyODI0NTBhOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kcnYuaApAQCAtNTIsNiArNTIsNyBAQCBzdHJ1Y3QgbWVzb25fZHJtIHsKIAkJdWludDMy
X3Qgb3NkMV9hZGRyOwogCQl1aW50MzJfdCBvc2QxX3N0cmlkZTsKIAkJdWludDMyX3Qgb3NkMV9o
ZWlnaHQ7CisJCXVpbnQzMl90IG9zZDFfd2lkdGg7CiAJCXVpbnQzMl90IG9zZF9zY19jdHJsMDsK
IAkJdWludDMyX3Qgb3NkX3NjX2lfd2hfbTE7CiAJCXVpbnQzMl90IG9zZF9zY19vX2hfc3RhcnRf
ZW5kOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYwppbmRleCBlZDU0MzIyN2IwMGQuLjVl
Nzk4YzI3NjAzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5l
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMKQEAgLTMwNSw2ICsz
MDUsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLAogCXByaXYtPnZpdS5vc2QxX2FkZHIgPSBnZW0tPnBhZGRyOwogCXByaXYt
PnZpdS5vc2QxX3N0cmlkZSA9IGZiLT5waXRjaGVzWzBdOwogCXByaXYtPnZpdS5vc2QxX2hlaWdo
dCA9IGZiLT5oZWlnaHQ7CisJcHJpdi0+dml1Lm9zZDFfd2lkdGggPSBmYi0+d2lkdGg7CiAKIAlp
ZiAoIW1lc29uX3BsYW5lLT5lbmFibGVkKSB7CiAJCS8qIFJlc2V0IE9TRDEgYmVmb3JlIGVuYWJs
aW5nIGl0IG9uIEdYTCsgU29DcyAqLwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
