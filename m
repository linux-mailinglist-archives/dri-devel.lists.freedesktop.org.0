Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8567DEDA5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 08:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334E010E820;
	Thu,  2 Nov 2023 07:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8B710E820
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 07:50:23 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so1040379a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698911422; x=1699516222; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eOgWp9zQ8adWZfxPVj8ivR5Dd8RUJXykZgeUD4r8Tv4=;
 b=nzA/lc0zwpVixEAgFbqWj/w+dGhVvsld1g+yr91A9CAGSdE7I6XZM5RKFHJHYwpNTM
 SrGvGEUQYjS/2K2VkbtCaA/YvQWHXpgoXQwhSNzWeTv2qz2sxUsKD0OMfCssLAeuGjrQ
 J87O8ldNH/4Ty7AIJzvkhXd3i5HOT1oX4StYoEk5dJyJO6IzTQrPJo355/SaNF0lRJ94
 zHHXj/GHXgzJxC7Q3qm0VQcpMSlhtzT5F3cBkD6sRh3FR5SkkTW0WaZu+Ttr1QxPydO0
 wcSeWcrwfG5yBfLneslxZKJWQg1lm0A3Blm61ubryNrv2Ej0FDhBa+QpVDVwcdjZfuj+
 fE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698911422; x=1699516222;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eOgWp9zQ8adWZfxPVj8ivR5Dd8RUJXykZgeUD4r8Tv4=;
 b=hbgQtWcM+JpRLX67kus+7eqq8YpuFj+PVqAYrLFU66nzGWowEzA2ltyX414BDm1cs0
 LKgm/qk5qZ8x12DZzgo8U29znOQ+srQr7KGv135N/s6hst9RjSHdA59JpPqiBwxY2ajD
 5aR9b9dG+X4f5c8nhhfPHFy0T2zADRixu8BW9kKqqovXT52toi+PbZsAqvRGsjrao8CD
 WctGkSAnKZUEby05Xb6ENbcO9QBRWt9UIksi2XyKI+P/y1eEkTNsFdDpiXbiNuKsTQXD
 qq56LC9RcmrqTDO/bunUwitAERBm0jjidSqgXsD30LnGNl+X9DS0JKVa2p0lK99OcAfy
 2wVw==
X-Gm-Message-State: AOJu0YxzewgJ0a4q2vcVSaBjkudotBACZ2KawkufgOspOYHcbSqzoCRb
 jP1gX7s9UvZpeDNTav6sywufQQ==
X-Google-Smtp-Source: AGHT+IHPKGuXe8tUEB069T/of2LV/2a4x0JbrQfIfOB1y1WR5ngO5/gEeHd06ctlFdgCWrzjNKAI7Q==
X-Received: by 2002:a50:aad0:0:b0:542:fb42:3631 with SMTP id
 r16-20020a50aad0000000b00542fb423631mr10018635edc.0.1698911421484; 
 Thu, 02 Nov 2023 00:50:21 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q22-20020a50c356000000b0053dec545c8fsm2037918edb.3.2023.11.02.00.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 00:50:20 -0700 (PDT)
Date: Thu, 2 Nov 2023 10:50:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 kv-team <kv-team@linaro.org>
Subject: [PATCH] drm/rect: only print the stack trace in drm_calc_scale() once
Message-ID: <fcf5eab3-240c-4a38-8515-d8cf5c6a3751@moroto.mountain>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kunit test triggers this stack trace deliberately.  The
drm_rect_scale_cases[] test cases include a negative src and a negative
dst.  This ends up spamming the logs and can obscure real warnings.

Just print the warning once.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYuA643RHHpPnz9Ww7rr3zV5a0y=7_uFcybBSL=QP_sQvQ@mail.gmail.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_rect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_rect.c b/drivers/gpu/drm/drm_rect.c
index 85c79a38c13a..a992d70b928b 100644
--- a/drivers/gpu/drm/drm_rect.c
+++ b/drivers/gpu/drm/drm_rect.c
@@ -135,7 +135,7 @@ static int drm_calc_scale(int src, int dst)
 {
 	int scale = 0;
 
-	if (WARN_ON(src < 0 || dst < 0))
+	if (WARN_ON_ONCE(src < 0 || dst < 0))
 		return -EINVAL;
 
 	if (dst == 0)
-- 
2.42.0

