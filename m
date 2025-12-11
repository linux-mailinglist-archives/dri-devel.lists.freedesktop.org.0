Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A041BCB5DF7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 13:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA36110E801;
	Thu, 11 Dec 2025 12:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZPFMDSAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C0F510E801
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 12:33:58 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7aa2170adf9so20248b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765456438; x=1766061238; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3dXU3GOLINLe9EjEUjPXBDJ3oxRXZRIziVkVY2yv9CM=;
 b=ZPFMDSAKUp/Q7iX2Kwf71za8vr5EjKaa/cw4naNjg5NxfDOzEC9VR8cLxJkdufCq3C
 DLgq1SBvYTpNQBNSgkLHO93hO4q64d25vVFI4w4Tp8WP20AnhAr7zaCfJSqXx0rr0wZv
 eJ6Q6ywhCXOditL25bvSS2htqlTxy3qXMTowZ+rTjVGfB3HO7aNFX9l+09qVhSg94XbP
 4VDVeqgXcOe9L5Fn8YmtsyHZKgL5vv2yVvkpSwkkB7LCHfqjGd/ZDcD5crl2DDUwObYB
 yHSA6C2ev5XxcoQMhDLKgiPO9YnH8LtNH/8isGZd1LnP1xwsTyR0X96bzCs13lu8up3j
 NZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765456438; x=1766061238;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dXU3GOLINLe9EjEUjPXBDJ3oxRXZRIziVkVY2yv9CM=;
 b=apsdQuuGp9WaBb0fPj5gA6uwb6z01wcdDBCSfsV+TVIODgK32JSJfMgL5m4p46kyKu
 +Bz7lnO8Sprw9FHq96b3Jv2OtkVmv6iB89NFbkHrHRnZkhEXdX5KOZG+F9jmJ0LCNn/X
 jXPs5I7qrHRqiVDYA2aWnIV37Ur5v9MvCRRMw6O9AU0tVn19h8gGoHlg3WqefF/6eEqf
 D8acM+nJaxD0dsochNU+ie6FTJvQdBmKOktPHPMO+tsdxBY9xiy28jrpSUaDPRb70TpJ
 Wq8IQx3x7VaB97LtzQPKohCiwyVIdegDFf1jEUo4UyHsscQBHLMV48SX6CYNpnj36VKB
 itdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4CFAa6+QTiWFtGOaFhHk4d44Ue4Xb7wPwI/Ej6PS/lTLFEv70mf6YYd9C7U6k1zHYGwO3ML8mT+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSucDIIvNi7WpG2xB1xG4HoCOZ0KpMWBSjsHBUdXtpdsE8DVjz
 bgoUbklkaGThStjGyQ8UmsuAzi5PFDUwC6T1qT2Sd/9CpEUIPhk+hM2H
X-Gm-Gg: AY/fxX6RN7B/txCge/NTFDGNBh3EsuXzw7KjQLfh/KFNRpZFFcp4L4x5MBvFl8qFnNP
 ZpItl2Ndx66mX6vu9ZiJw//+tSBiV+GWwLq/3bIbOiEpJPb3er4zqm6ogxVKWDkT92kTguTq26j
 yYqxVhdzhFV+hGOuFfQstfQ+YHyV2I/VZnBz8rO0IejLHcHPl9KrSXXJabyz5fknDSXtSmpnAnB
 Zf7gb3AydopW2Gs82L3MbAgukPt49GqgFF9G1J0DojYmIv0yKphVsVsE3YIccefR4FVccKxvHos
 KvfyMZLDoUIlSgtp66/2w0I7wYVXAOP5YFT2cdLAk8/pqPbDZTba7mMpk3BCcUaBfex8NrHhj0K
 9BSRZ9b1G1NK+oWNphATJoS8VJEgFq/Jw6fM/zeaItB/8VYd3hmDIb6rFSe+cVrgYYoRsVp233B
 /rs7ZsAMuLKl0oHtTYfhdlfy0=
X-Google-Smtp-Source: AGHT+IHDxSfBltK6rQPgl+NpCNPIOrqOJbDt51JmeLKoJKrrNu4oCo5oerpmzjaZy4g1sKK8owEQ/Q==
X-Received: by 2002:a05:6a00:18aa:b0:7b8:10b9:9bec with SMTP id
 d2e1a72fcca58-7f22dcb515cmr5589040b3a.19.1765456437862; 
 Thu, 11 Dec 2025 04:33:57 -0800 (PST)
Received: from c45b92c47440.. ([202.120.234.58])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7f4c27771b3sm2471892b3a.27.2025.12.11.04.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 04:33:57 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Tom Cooksey <tom.cooksey@arm.com>,
 Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/pl111: Fix error handling in pl111_amba_probe
Date: Thu, 11 Dec 2025 16:33:44 +0400
Message-Id: <20251211123345.2392065-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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

Jump to the existing dev_put label when devm_request_irq() fails
so drm_dev_put() and of_reserved_mem_device_release() run
instead of returning early and leaking resources.

Found via static analysis and code review.

Fixes: bed41005e617 ("drm/pl111: Initial drm/kms driver for pl111")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 56ff6a3fb483..d7dc83cf7b00 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -295,7 +295,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 			       variant->name, priv);
 	if (ret != 0) {
 		dev_err(dev, "%s failed irq %d\n", __func__, ret);
-		return ret;
+		goto dev_put;
 	}
 
 	ret = pl111_modeset_init(drm);
-- 
2.25.1

