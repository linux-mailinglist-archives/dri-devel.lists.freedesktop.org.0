Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6D92E9206
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:40:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBED89E98;
	Mon,  4 Jan 2021 08:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA39689690;
 Sat,  2 Jan 2021 20:26:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r3so27072106wrt.2;
 Sat, 02 Jan 2021 12:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uuaswafA4TQVvz1UZDdvhjuiKY9mruy0RJy3iy5N0mA=;
 b=p3yCOhnYofMOj78YUL7K29Ms+2FxrUzvnsAF11Neo6tRCNTVQGMZd7lvKJrc/mCIfs
 /ften1O0U3MrV614/ggLyDGT8TqlzR23qZi7nsUg80nRFZeTh3qH3SYvkx+gwpSnFb11
 Dui+1C/tbdkTBs1XZJUBAEgm0417BZtl5SmNSd3I1LrOxI2iGoGiIiVSYrfUzWi+AJPx
 RxcZVtsrHxg78ZUuObilVVx/egGgkF5jp3jcwXKZqx9ImXMt3UdJ5a3sFsgRtQcOGqG4
 Jmb/XrZQlpdpQLGNfXeBy3ZVqZEhVTwnO43NaT+bUbLMnxPqHEnb+h6+Rpc+vI6DS9iY
 WXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uuaswafA4TQVvz1UZDdvhjuiKY9mruy0RJy3iy5N0mA=;
 b=LYzLCm82syKK1S8VfxlrYCtbWgJjcfvgRg3UZhznubemY6M/sAbplnCz0Ok3dDD1YG
 TVu7LTuX2/gH9HiocGFdbpJAYRbWlpW5W7Lb7TMQbA/mS5HrlDR9qTimvqzxGqwVFwPB
 Rg2n3QOIP39e2OKr3b93eFNGVSGNoH6G+S2Uc4UppqSQS1jYyHsP57T6FtwSeZwrYlVh
 uc34Z/Or+1+iuJEEPkIyHwOD3j4B8XTEN0+D7tRG0M5igNOPsc4k91810bPHLKSyIdSf
 9nFPZMw4E/Xm5qb52q7hZWkykltywGafkPLqAPMfAEXLf/Y+Yb4XiLL3AVK+QSv10Kh7
 6nAQ==
X-Gm-Message-State: AOAM531dtr2AVoHIYd/CPEnqmJ5i+maamnuiEzvwF+95z10/Uqa+ybP4
 o0Qb/2YWSr2ZrlU/ZisDo4lxdOrOu+O2GA==
X-Google-Smtp-Source: ABdhPJyiDyyRt4hq1SXo4hGhsh+SBiY6KZ/2itqNLIp8w4wvHWusI0T9nN/nQQqg2i2ag1jf1MPGJQ==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr72164660wru.398.1609619173035; 
 Sat, 02 Jan 2021 12:26:13 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id s25sm90902853wrs.49.2021.01.02.12.26.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:26:12 -0800 (PST)
From: Iskren Chernev <iskren.chernev@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
Date: Sat,  2 Jan 2021 22:24:37 +0200
Message-Id: <20210102202437.1630365-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
!= NULL, because aspace is NULL when using vram carveout.

Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c5e61cb3356df..c1953fb079133 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
 		struct drm_file *file, struct drm_gem_object *obj,
 		uint64_t *iova)
 {
+	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_file_private *ctx = file->driver_priv;
 
-	if (!ctx->aspace)
+	if (!priv->gpu)
 		return -EINVAL;
 
 	/*
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
