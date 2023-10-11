Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD527C4C91
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DB410E27C;
	Wed, 11 Oct 2023 08:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49AA210E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:01:54 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d849cc152so363918f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697011312; x=1697616112; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YZT/8mXHXiKgkNO5lwynSIruokO6XSAvA489Hqpy4Bo=;
 b=ZNEf4ha2U80DgGQDhcuhUq5JpvmeNkbwR2bKNSgBesYgM8LRxxWOeBwcOEg4e92jLU
 O+rOGUpiv8w9MHGANFK4Zki0muwzEuWvGsQX8ez5iSYt140KGRMRg3jvemD5XOqAL4lS
 z0K1w1Lqf6QqrVXpwaYGSNCou/B0hMdMr33NXFOIaXTzzKFBdTaQkUX4qnATefIYiS3w
 vUG8X0nrr1Ck9Q3HfVmSL9en+sXv+OXsh9IrkwkH5lBahA0UE/ofrkWiCcbk9wx0Lkrs
 54Ao7XUG2cbKjpjd2X9tiYN8g0fsZ98LOx4XSbepb4oQB1epnH4cCIj7xtAy+vvGnl6N
 LzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697011312; x=1697616112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YZT/8mXHXiKgkNO5lwynSIruokO6XSAvA489Hqpy4Bo=;
 b=D5G+1znZViyr6ts10c8RpnZRy8LxxWA47LmXe2HZ+gevJk5dUOHlsGMPwSgdTRHL0w
 7L38aRiaI1mlMa84P55F2o0wWRnP1F1wOgmPQNVT80uYceD+fLxVP1DjUsVszvv/kOZs
 mEQO+smkjFd/LVwYxxyJorUqr1rOqjaP0qHmvms4L33HqkhkRz6NTT4IBp6C/xTHVoUe
 C/fAlwpW6LJ+0PpgxhqJiRcN/PorjFZ7Qm2HcngKauXXGxRcMhMKdNOypXlVxHamvZtO
 WTyrllP0mAYsn8Jax9gaZIJIseRZv9m987ds1vmtfAT8NLGvGFqD3vkwpwM9SYuKyrTh
 XA1w==
X-Gm-Message-State: AOJu0YxJun521LQjsMpvp9a/aREDczeXEAfyJuez4dtZrnLfKELTjPw3
 xcxAMp8IwrgmVTj1XCEJU+JPNQ==
X-Google-Smtp-Source: AGHT+IHlYGaipThrXKIKMr2CcQW1kf8ZvYk9AY5BdTWtgsZ4chvat2yBykWEZU5sAaKVW2Tsl/EQeQ==
X-Received: by 2002:a5d:5911:0:b0:324:e284:fab8 with SMTP id
 v17-20020a5d5911000000b00324e284fab8mr19093365wrd.39.1697011312630; 
 Wed, 11 Oct 2023 01:01:52 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n6-20020adffe06000000b003140f47224csm14690117wrr.15.2023.10.11.01.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 01:01:52 -0700 (PDT)
Date: Wed, 11 Oct 2023 11:01:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] drm/rockchip: Fix type promotion bug in
 rockchip_gem_iommu_map()
Message-ID: <2bfa28b5-145d-4b9e-a18a-98819dd686ce@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: kernel-janitors@vger.kernel.org, Shunqian Zheng <zhengsq@rock-chips.com>,
 Sandy Huang <hjc@rock-chips.com>, Maxime Ripard <mripard@kernel.org>,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, rjan Eide <orjan.eide@arm.com>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "ret" variable is declared as ssize_t and it can hold negative error
codes but the "rk_obj->base.size" variable is type size_t.  This means
that when we compare them, they are both type promoted to size_t and the
negative error code becomes a high unsigned value and is treated as
success.  Add a cast to fix this.

Fixes: 38f993b7c59e ("drm/rockchip: Do not use DMA mapping API if attached to IOMMU domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b8f8b45ebf59..93ed841f5dce 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -40,7 +40,7 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 
 	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
 				prot);
-	if (ret < rk_obj->base.size) {
+	if (ret < (ssize_t)rk_obj->base.size) {
 		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
 			  ret, rk_obj->base.size);
 		ret = -ENOMEM;
-- 
2.39.2

