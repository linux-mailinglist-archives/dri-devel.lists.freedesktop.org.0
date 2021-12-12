Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ABA471BA1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 17:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5710E862;
	Sun, 12 Dec 2021 16:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7226D10E862;
 Sun, 12 Dec 2021 16:40:04 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id m6so14996392lfu.1;
 Sun, 12 Dec 2021 08:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cnedO9b6vjLZxKJM/wEKxKhqHm2FwahC7goP3pJJhNw=;
 b=V5oJ3i+5pWNV6Tlck110K9NB214XryU6AzpHIegPkXHZ5EiBItZnD9NflSGyGPf7a8
 c2C5IKpPHAUmGij+o7h8RKJ8H2CkmJzWZl4dmiHtRKCZf2qgqil5+thx5wrWXUW6Gkqs
 cMty2xGJpRbRowBIHaUNcsxVfVivDizL037Xt8yjPQT9Ilm6FUxHgjstH+asxYGAU6/o
 BVE8nIZmucjNUqNgkMDlx0lU5nv5lAp91b4xXn6vrd/TNL9fQUYQJB2O+jKG7/UtKN4l
 uwYYKFQ38Y+X3wYGEMlVLbCvd/lEvn0Q7TwFhOvy4+CZGNJxss8uqEXzlutEjpHI/Spp
 z1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cnedO9b6vjLZxKJM/wEKxKhqHm2FwahC7goP3pJJhNw=;
 b=4YYU56V7Orb13vjwP7vnZ0ogJJGKlqoJK+ufR2n5VI7/mQxMvh+bGuKQY/f3PfsS4+
 xam9U01VwbyN0oOMk6BsGP3pIsu6RL4xih+FK2Cbcy8OotJ2eJB31tDFFa0NDW29TueV
 pVguVmHDrYtoRp4xCyWtE+NIHu2toi+PMKqyBcwnVdeGu00wKp54k/hlOkGjPTvPUVjr
 69yi4QLWYtACZZpAZmhnyV6ezJrLQZK63xVh9F0cTUoX386yhxvyinzF3p+nK4+YQdGJ
 kNLeU/etwLgKxul5yMSdOetw/UMNu3r/LyRcfCV65dTmrqDXr/61CZZD5rdRb62gylnv
 TlKA==
X-Gm-Message-State: AOAM532cv83lfixdZAR/Qso3rWQQg+qAUZvgjI+XBAD12lOUqOr61l7Y
 Krk6aNcefGlbq5ge9EgSfPA=
X-Google-Smtp-Source: ABdhPJzbzHHtaprJmbFJWQm+Zl/A3sbrNT7y1KqWq84qcIZgutxfbO8KaGojTHfKuutQJMs79ryaKg==
X-Received: by 2002:a05:6512:2289:: with SMTP id
 f9mr24013249lfu.619.1639327202731; 
 Sun, 12 Dec 2021 08:40:02 -0800 (PST)
Received: from localhost.localdomain (public-nat-10.vpngate.v4.open.ad.jp.
 [219.100.37.242])
 by smtp.gmail.com with ESMTPSA id u7sm1110936lja.58.2021.12.12.08.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 08:40:02 -0800 (PST)
From: Vladimir Lypak <vladimir.lypak@gmail.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: [PATCH v2 2/2] drm/msm/a5xx: Fix missing CP_PROTECT for SMMU on A540
Date: Sun, 12 Dec 2021 16:03:17 +0000
Message-Id: <20211212160333.980343-2-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212160333.980343-1-vladimir.lypak@gmail.com>
References: <20211212160333.980343-1-vladimir.lypak@gmail.com>
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
Cc: freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A CP_PROTECT entry for SMMU registers is missing for A540. According to
downstream sources its length is same as on A530 - 0x20000 bytes.

On all other revisions SMMU region length is 0x10000 bytes. Despite
this, we setup region of length 0x20000 on all revisions. This doesn't
cause any issues on those GPUs. As for preventing accesses to the region
from protected mode it was tested to work the same.

This patch drops the "if" condition in setup of CP_PROTECT entry because
it already includes all supported revisions except A540.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 894881d273b8..fea632c789a0 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -860,10 +860,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a506(adreno_gou) || adreno_is_a508(adreno_gpu) ||
-	    adreno_is_a509(adreno_gpu) || adreno_is_a510(adreno_gpu) ||
-	    adreno_is_a512(adreno_gpu) || adreno_is_a530(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
+	/* SMMU */
+	gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
 			ADRENO_PROTECT_RW(0x10000, 0x8000));
 
 	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_CNTL, 0);
-- 
2.33.1

