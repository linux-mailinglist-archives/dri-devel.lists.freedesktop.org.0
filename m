Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B374098DE63
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A8710E1D5;
	Wed,  2 Oct 2024 15:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="V4vWLW1E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50A410E1D5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 15:06:54 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5398d171fa2so4641870e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2024 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1727881613; x=1728486413;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0aaSKJint9BKAl1EBaxoQ2jVgmDuzxX5hASejfL2+k4=;
 b=V4vWLW1EgQA5NXiFtnR8JDCINjnNE2GYqfTSwMm4VT721LNzBrLNK/WVaIQBmUFgMx
 BeraeO9Zjan0M0kgyJxMDrhbTfSWmdJCT5PIh5vZzvSY/XfXxtUAR/DK9dK7r9ZNPZ53
 zQWWgVMT4s+C8mrD3wmcHuXqqqWtlCfO0Zz6iiUFp1QT/ZL8e/vo1oIzyNxaEFc9RtJH
 ZEZ/hnPS1JY0sWd5SPAlM+fn8JHoMA35IlovVQMYPqbCaSf7p36i4Rv9DfK3VG9q+75z
 FTZtUMp55ke/ZBEmeZEs/ja3sk7Nx+9MTL0IC56NnI7PnTe883CBiWh0zO3baR2ZNdaj
 aG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727881613; x=1728486413;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0aaSKJint9BKAl1EBaxoQ2jVgmDuzxX5hASejfL2+k4=;
 b=GISGUv3Nn2t1HJgKjzmaKFiN6i0b7Vy9jR1peakG1GoJmIopwEjNyG6n1dOot0mLCo
 G17puPuAMUFSxV9MO2dEn84J510Tc1hMpoA0E/ZfdtoRRSYGsIechxa/E37OUmbh6/ES
 eWgVOUKD6ly9vMpPPuZ3ptzw07xERCUCSiUUjSqOvjZU9CUi/g6FPelhB9kdOnR8KB44
 7QYpld4tNUSG8t5WDHGqEaoe9bAfCJt59r9fNLtyZ1c1oDYamr/5JhRBdIWBalay3rQs
 BH5FhhkM37hxvhPX93BI7VKXKovLjODcDc7zPc6IysffAnBJB+ZzX8L1sQaVo+FdS1AD
 lcWA==
X-Gm-Message-State: AOJu0Yz8vGnted61P0LYQSFV/PM29u6kYpJzKM1lSdYW9Js/JMmzmv5F
 I7br6/6z/FqQ0e3TkbCqxJ5+MAA7rW8AaE2ejnE+fdab9wMzH/30ua2TvXDUga0=
X-Google-Smtp-Source: AGHT+IHRN0bivOMkxtd7P9Vwt5ImGLSLuu4E/375FOcRMlxCyc6JCW56eMN/xSM59wtgzA73gEK8MA==
X-Received: by 2002:a05:6512:4011:b0:52e:9481:eaa1 with SMTP id
 2adb3069b0e04-539a06656cemr2152474e87.23.1727881612849; 
 Wed, 02 Oct 2024 08:06:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-42f79ec0a44sm20794485e9.17.2024.10.02.08.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 08:06:52 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 02 Oct 2024 16:06:20 +0100
Subject: [PATCH 2/2] drm/fbdev: Ensure that one of the probe functions is
 defined
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-vc4_fbdev_fix-v1-2-8737bd11b147@raspberrypi.com>
References: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
In-Reply-To: <20241002-vc4_fbdev_fix-v1-0-8737bd11b147@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

Commit 5d08c44e47b9 ("drm/fbdev: Add memory-agnostic fbdev client")
added the newer probe function, but left a path where no probe
function was called. fb_helper->fb would then be NULL and the strcpy
would throw a NULL pointer exception.

Handle that error case.

Fixes: 5d08c44e47b9 ("drm/fbdev: Add memory-agnostic fbdev client")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d5e8994345bb..9c8868d7b9d3 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1635,6 +1635,8 @@ static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 		ret = dev->driver->fbdev_probe(fb_helper, &sizes);
 	else if (fb_helper->funcs)
 		ret = fb_helper->funcs->fb_probe(fb_helper, &sizes);
+	else
+		ret = -EINVAL;
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

