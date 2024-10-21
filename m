Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFD89A6A80
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:37:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41CB10E501;
	Mon, 21 Oct 2024 13:37:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U8Ym+ShZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9C710E501
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:37:52 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-539f7606199so4900744e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729517871; x=1730122671; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fC1MtmbCN57A6bjwUEsG+s8kklw98PPJXY/T3i9tkGI=;
 b=U8Ym+ShZ15MF8NUV7BnXmD820uRpnMDA02s4fWsSsSJ3QLldjW+jTLY7m/u87mQDt6
 71gQML4rS+2/flMXowdVBM5/xKH5L6xChHagaEUpsr6GkxwzzPVpYo827Hxt1gRdtXWM
 LY5ahWYBSShy3DHh+xLTa3abYYOAEirqY/ks4ZGWrf5NZu4NkRvBevDrNB0YEq26J6xQ
 iNxjum5rznZjv/YiXM1Vtb2dUP+DjEEDtqbLIO2HnMQqOFllFx1GvxTU29a8K23a4s0r
 7XAl6B6EZ6T43zSnPGo+477VAgdXDljUmTOHmKvN3vMulOjwLV0BvtitIG+Rsp7Gm3xj
 y8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729517871; x=1730122671;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fC1MtmbCN57A6bjwUEsG+s8kklw98PPJXY/T3i9tkGI=;
 b=r85LyQG+inj01Wk58j9EwKrYgXmWoROGu46IPwQ5ty6VGE2zxtnORUQLFDPikUT4pY
 hqLHtP1eAeCRAGSGEo5tEOKT6kSqF0AEZV52oL+Rw86xMcYYE/BCVOnGLT/1lWkTKo0u
 uf7D3tbceo3UPEY2kj1jKcVI68kLTUSpiQyptaucVT3jD9lxkVm/HagioaU1AC26X3Yu
 tnyAiOWsY+P/PRto6LfR2D3c/OWslIajHnOo1C/jFRWsrXSyhmK//uxojIs/dHkd79O1
 bsdz+eZinEaSQAbZjOOYKeM/2wh54iC6keP1+Njn0dTIh2+5yDc21JHurB95c4OiS23V
 NXig==
X-Gm-Message-State: AOJu0Yx2I0SitvC3cFbaJqE/YWGZxCuGzvbJLt4Yfi0LGPH3f8zvRX63
 Xed4R5NRyNvwHbz0WfWt0D3eO1E0S/GhEnL6I6+O1TDLQvQPctlF/uUxNPk0/tA=
X-Google-Smtp-Source: AGHT+IHIBrzPSrtxxezikBJ8RWJQ/7DBIsPbOI7qex7+5iaCtDjcjOOwcYu9pj7lrqoxGT33evVFNQ==
X-Received: by 2002:a05:6512:2209:b0:53a:40e:d547 with SMTP id
 2adb3069b0e04-53a1520afadmr5582803e87.5.1729517870933; 
 Mon, 21 Oct 2024 06:37:50 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a2243198dsm480767e87.224.2024.10.21.06.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 06:37:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 16:37:46 +0300
Subject: [PATCH v2] drm/fbdev: fix drm_fb_helper_deferred_io() build
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241021-fix-drm-deferred-v2-1-db1de4c6b042@linaro.org>
X-B4-Tracking: v=1; b=H4sIACpZFmcC/32NQQ6CMBBFr0Jm7ZhOUbSuvIdhUdoBJlFqpoZoC
 He3cgCX7+f/9xfIrMIZLtUCyrNkSVMBu6sgjH4aGCUWBmvsgQydsZc3Rn1g5J5VOaKh4JxrAp1
 8A2X2VC6dTXlrC4+SX0k/28NMv/SPbCYkDHXd9cdojevM9S6T17RPOkC7rusXI1lD7LEAAAA=
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yx0nEL3eDqy4wnT/TPSTYD0CqCa7ByqGEhXEm4yYtd8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ7pYpI6xc0FWfLde7mw2lleHoy37/tiWyrq5LVtkk8Fql
 2LMadPJaMzCwMjFICumyOJT0DI1ZlNy2IcdU+thBrEygUxh4OIUgIlku7L/95I9d9rk3JOLL2rT
 fWUPJ69+rHJ04p2rxsWS2ZbhXhLPfKKc/lc3Cea3xX7pWDdTi6nFl+GXx6WUP/bvWub8Yv4SePb
 V25UvGTlcb5aL17ge/eV/8oKRb4/25fzgbfdWfuV5VavnIC6zzFh97V41jqLOaYy73h5vc+5pTH
 6SEqz2gWFGQZ1l5LPPSuK7Dra8v6t3VkOsyiT/jl2Gi9uSgikvqi6b/rG/r5X33NHYO9zrUWrgQ
 50P6v3uoo8l9V5y3K7MdCphWcBaHsojnLhc9Q+jQ6Acy+fzHEGPF4TutJzxYfq16Vnf/52uTuxQ
 6dD3mXbf+sT6LQ3nF9w4fCdCQcmqXsPPRGd+9ocnW9YDAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The drm_fb_helper_deferred_io() uses struct fb_deferred_io_pageref,
which isn't available without CONFIG_FB_DEFERRED_IO. Put the function
under corresponding #ifdef to fix build failure if deferred I/O isn't
enabled.

Fixes: 8058944f5226 ("drm/fbdev: Select fbdev I/O helpers from modules that require them")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Added guard #ifdef's around function prototype and a stub (Thomas)
- Link to v1: https://lore.kernel.org/r/20241018-fix-drm-deferred-v1-1-c33bf5d209b0@linaro.org
---
 drivers/gpu/drm/drm_fb_helper.c | 2 ++
 include/drm/drm_fb_helper.h     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index d5e8994345bb..c9008113111b 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -697,6 +697,7 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
 }
 EXPORT_SYMBOL(drm_fb_helper_damage_area);
 
+#ifdef CONFIG_FB_DEFERRED_IO
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
@@ -740,6 +741,7 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 	}
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
+#endif
 
 /**
  * drm_fb_helper_set_suspend - wrapper around fb_set_suspend
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 699f2790b9ac..8426b9921a03 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -256,7 +256,9 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len);
 void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height);
 
+#ifdef CONFIG_FB_DEFERRED_IO
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
+#endif
 
 void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
 void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
@@ -361,10 +363,12 @@ static inline int drm_fb_helper_ioctl(struct fb_info *info, unsigned int cmd,
 	return 0;
 }
 
+#ifdef CONFIG_FB_DEFERRED_IO
 static inline void drm_fb_helper_deferred_io(struct fb_info *info,
 					     struct list_head *pagelist)
 {
 }
+#endif
 
 static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
 					     bool suspend)

---
base-commit: 2063ca42486bc07b49bc145b5dfcb421f4deebaf
change-id: 20241018-fix-drm-deferred-01c9996c17a6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

