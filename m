Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC599C95628
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 00:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBAA10E291;
	Sun, 30 Nov 2025 23:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AgH1xA/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF8310E1FE
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 14:16:05 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5958232f806so3134031e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 06:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764425763; x=1765030563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CCb0Eqo5GqhxN4l/mvqQ6jrTkxIuERyWVn+iJxuMgs0=;
 b=AgH1xA/mmxpYX8GQhQFVZEWLWj1fvBJw/nCHWOj6sW7OLfiARU6eZjDcKVhyCE9oJN
 xgjE2qxzh2KW4MneLWuzrZcBvhxWUbo7Klobol51s9Z/nEgTQjsjPnXYiC+DwRsK+z/j
 aeDsvf3zs/eZ21DQwkUyaXG5vVWOc6NrRa1RgDPbgYu7wEvvADtCsnhgv0NvtJHK3ObZ
 xdBNIKbJmNkwEehYCrvPW90TqoutBUdl2dB6Mt9E5wHsK8L+4iZRMLnitmXFv9WINmQy
 C8bRW1O93vWycaW7wAICesA9wsYeCq04M1GRjWUdYsPQqzmVl/t/wqBuRMtzVlP5Na/U
 4Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764425763; x=1765030563;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCb0Eqo5GqhxN4l/mvqQ6jrTkxIuERyWVn+iJxuMgs0=;
 b=Bzk+08gNvGo4EeURF0IgRHpv8K0IXCpOaXL3qcq6C49+dhOls2Ww0qg25mi4Nk0732
 zSj0ZXBzeTKqFdbsWZww+WNWBYOuQ90Vmksr+OOwOYf+T8W6EI2Y2UF9IqlrQLtNdnEO
 aY5+vLCmFc1oitm6PddugREtfARvz0QWVhzFYVP4Wdkd+p5vFYzhjiHXpuiDMNWYD2sR
 Yvt5rsEUSApqX+HbijJc3lnP/cQ+4FQRWgkd9cv6aD5lw3Rn7e+W+7XBZV1qw/0N65xA
 NSQJzXQgT2+eSVJ69RQ5B972oPSBVuV+QAsIpVAWjjwE69mjtmmyVeiAc8lS9iAlqc/T
 pNeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmIXQIH2zj6aD8oHKpc15quFJaJVZ4ELm2pk9Eq8ieDSKnfsJQZRB3J2mCsHzISaz9F4oi/Li3+fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDi/B3FOJ+gNUH6tK3Y2p0h6aWJpE3TEXcxjxSPddY4PbqucOp
 NTC5cV2ZxSKxtCU91i9XrG5+iG17XlbJxwsH0t4hsmwm0Nchs/haU2vB
X-Gm-Gg: ASbGncszzfWuhcA1z2/39FQFcNTjjVOM2P5eyGtKHWPmZUY2yNc9Y/FyJtwVwAEULgQ
 PYiJP4YDIVzKG5ykmDIM09SZSXLdq7OMHreFj+kO/8H0ousvVZ+moBYjFDi6BXrSlLm60zs3I0V
 HCq7RPOYuvk1myB3NMESMXgiA+JovpHNfhHuN5GcZ1igCA+0UNWuy1JAYzpfaFHt/TNVmkU4dM7
 6xB/mMshaHbBDzgbqD0YaLxs+joQ8zn077cgV6QzUWFmq8kMFAwi47PtxtegCb5nam1gsU8rgc6
 H5V0ibPaiGidt28TP4mGG2Kyj35P86n9GZbIoLRGS1QU+dmMiM/cLUByAlRg+bsZG75Kx8BIWPV
 qcwqPSGydU9wucwQKSELKzOseYoFuE8hC0SnfuOITsJPARkzoZmHsrs5m83M9ER1Q3bYnkSblBG
 tTtilLRbixAf1NV0YRg5/7s3xAw3Jc9oFgJdOBX6JWoy4C5BOxi8DUl0xxUKU=
X-Google-Smtp-Source: AGHT+IEA3WrHgp5ecEMKNm9JiVdtpzxk9v/x2/vTeR8RniWcj0S+d7R5TzjjaIhv5WRyeSx0oFzvMg==
X-Received: by 2002:a05:6512:23a1:b0:594:36b3:d1fa with SMTP id
 2adb3069b0e04-596a3ed471fmr11203155e87.29.1764425763064; 
 Sat, 29 Nov 2025 06:16:03 -0800 (PST)
Received: from home-server.lan (89-109-48-215.dynamic.mts-nn.ru.
 [89.109.48.215]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa43f33sm1945600e87.49.2025.11.29.06.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Nov 2025 06:16:02 -0800 (PST)
From: Alexey Simakov <bigalex934@gmail.com>
To: bskeggs@redhat.com
Cc: Alexey Simakov <bigalex934@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Francisco Jerez <currojerez@riseup.net>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Alexandr Sapozhnikov <alsp705@gmail.com>
Subject: 
Date: Sat, 29 Nov 2025 17:14:40 +0300
Message-Id: <20251129141438.8789-1-bigalex934@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 30 Nov 2025 23:28:49 +0000
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

Date: Sat, 29 Nov 2025 17:06:57 +0300
Subject: [PATCH v2] drm/nouveau: fix div-by-zero in nouveau_bo_fixup_align

The expression 64 * nvbo->mode can be zero when nvbo->mode equals
U32_MAX / 64, causing a division by zero in do_div(). Values greater
than U32_MAX / 64 cause a u32 overflow, leading to incorrect results.

Since nvbo->mode comes from userspace via ioctl, it must be validated
to prevent crashes or undefined behavior.

Add a check to ensure nvbo->mode is less than U32_MAX / 64
before use in multiplication.

Found by Linux Verification Center (linuxtesting.org) with Svace.

Fixes: a0af9add499c ("drm/nouveau: Make the MM aware of pre-G80 tiling.")
Co-developed-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
Signed-off-by: Alexey Simakov <bigalex934@gmail.com>
---

v2 - move value check at the begining of nouveau_bo_alloc for
preventing execution of function for case, when tile_mode is too large

link to v1: https://lore.kernel.org/dri-devel/20251022041302.13-1-alsp705@gmail.com/

 drivers/gpu/drm/nouveau/nouveau_bo.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 96a8b7b1215e..774888ffa4a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -207,6 +207,9 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	struct nvif_vmm *vmm = cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
 	int i, pi = -1;
 
+	if (tile_mode > U32_MAX / 64)
+		return ERR_PTR(-EINVAL);
+
 	if (!*size) {
 		NV_WARN(drm, "skipped size %016llx\n", *size);
 		return ERR_PTR(-EINVAL);
-- 
2.34.1

