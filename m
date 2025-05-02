Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57EAA6E95
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B24110E07E;
	Fri,  2 May 2025 10:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="B+hSCZO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE93A10E16B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:00:56 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ac25520a289so310940266b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180055; x=1746784855; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
 b=B+hSCZO4umfFn1Xcmc+dviorZnNNWzlfjOdrU+ht8fAPTvAIsj6KRHfCc2g4tu8JMx
 k8S+9tVKju+bJRUoNyK0n/XxHP9k9qsGsm8arU1fDfbm7jqFi83PA/Yb0wg+AliymYPD
 r7CqOVi0TMGlcs7/gJWnH91jAs2GO0AlQ1GachOZWP0zu6icoIheNYFTNYtNUxMVmdhx
 i+RXr6+LOngZ25YPR7yL6ABvF4laE5fOOzvKM/rNuQsl8i9UpmWdHulLAHYzAFI4gkKk
 vhBxczgQhHHhbzMkgOwB035NQtIc5zR6aKV6K7QbEIZDstYir087iosxjc1O+NXHna2E
 qR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180055; x=1746784855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
 b=hwk0V53yax5l5Lb9sxqLYbeha45yxMdR0FmSqEHmKVDxugDbhycyWp/hv7tQR87kHJ
 x7nCh+m8PijWH8VsGcjJu4rqiXDljf5Vsm4dt9W2Q73dzMrkylTMUWswr8d+SyYKX+NL
 fjZksDdrl3xDN1hsCsGdwQTYe5kkemhnrBdOF+w4o2wXKhud++mTMkJeW3zlOb/QvkHA
 B1VXypgW7qAeLBZRbvoHWAkyT918bjqKuuAGYFomaB0Woiw3hYcUjh0RxduI1Si11gvA
 20TdqXmX1ax+m6q3TBewgLVcdXavowc1x9XDPtsz6rbvjOeAsKx586PAxtVyLlnJO5J1
 S7Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBn37Aqj8sg+/kqyeUMOVm/Nj3n4PMvq5+h/CaQwmxHrgz4cfvCRwK+WApHvhLZ5JJCGkpJeSSxpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIACPKUZIre0oPQcPyZSy9Zm4mNsq3eniu4Ys+2pNfXGa/U8bV
 sArPo/HWNtRhPbKty7ANA4r+5ZIKH8Rcew2J0G2cnPX4337qvE3nMhXfN4iT7c8=
X-Gm-Gg: ASbGncumlgl2kb753f8gcIvX8NfIqr9rY80qUNmg2elAGdjz6w16lcJLx4bU9LjHMyq
 w+jCX3SePDtzdav0Lmvve0pC2HMCEtC62rV+K/XM2CLi9bgPZ0aw8clCDRB9Hc3REK3P6uOAKGp
 gENhJThpJZJV3N3aENSMg6u32KKbzNfiNo4rXND+9gJu3E3PVQOgB291CBG/Kx5bhm2PjzzClRv
 bMoV5stobJHnjvR6+ciP+YTsjv546kK1s9K+7hvBfLKwUvuIVpFrY3Zh0AyijieZ9SCrLyPtEoq
 xD0Ns6MyfQ3F7lhlnoYt8SfNHDvEEFW+ZJ/LG9XrPsY/E6dv+Et4VvYY/OHhji8fcSA7gFoynv/
 YWX70FhfJvtm/2uF90w==
X-Google-Smtp-Source: AGHT+IHsIhA3Bp5ORflZ8bo2wewMeJPgYiXyKbBXizljuVxA1br3p39Mij4FHprUjRbWMN7T6ANK8g==
X-Received: by 2002:a17:907:3f0f:b0:ace:9d35:6987 with SMTP id
 a640c23a62f3a-ad17ad24ac3mr199033566b.3.1746180054591; 
 Fri, 02 May 2025 03:00:54 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:00:53 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from parent
 device
Date: Fri,  2 May 2025 11:59:15 +0200
Message-ID: <20250502100049.1746335-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0

