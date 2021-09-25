Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B5A418428
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 21:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC346E457;
	Sat, 25 Sep 2021 19:28:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F856E457
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 19:27:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i4so56020783lfv.4
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 12:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GNhncKhzYt179JtcdPH7NHcfH9wwnLbbbm0VxyfgFY=;
 b=Gj5pzAQvVgG2EffN+M+6NlFN8FcsHHq1Wn80RUxW4esA5eJjxuh+fNK0wva16U3AM7
 PYkL2thL37ugm+QR7NUPh01QXaYpyvkrBzRgN7aRvEzhGb6VgzrPe1940OR80e31IsV/
 L39vWXpE/d1l+vHZyGMXGbbrfofIbkt3pKaGWsN00zO3EpFlOpaTBIt5tOFid8W6fMdf
 /kjEKFNuJUyQufP2PRx5RuUC5W8NQXhzHw91v/P4Y6G8qJ0shZ26nQiyIRChLa/2zEAA
 URACDn0qAZgDmwsdQMlV36gR64lHB7e9XCq7SzYz00TC9Gzr0+O2Vu8k5JDJ1N//ZH+B
 4Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GNhncKhzYt179JtcdPH7NHcfH9wwnLbbbm0VxyfgFY=;
 b=GCYieyamQ7qye+m3EDI4/XWZj/WV2Nh7o+WV3XcL+9PlQzA5zWEvt37HBGVqOLg77Y
 xqclkZVLbyhves9NzvAdwYP/OmnV/OnjEfPJDpyytjdSNpGN2AFOENSqvnolFXgke4CN
 TFQ65rlXDhJwciuH1QhyNoMS3jPkGlceU712ShVMGOaye2scVCqzUATWegjFH3eQ7Atq
 ReSptMSY/WoMpo2CzMj5/kmporbglLBu3O0v/GwgRjxx/Fbb/Qhs5RSPbpjFsSvF9i/1
 sMXjNVASzkTs2LXn5y+M1hrAHn8SFdmjHyuqpaongG93o3S3A3XvDBzsRt6qnI9EMYXx
 +qcw==
X-Gm-Message-State: AOAM533yLf4dofENN629BeP6R5yoME+Am0DkrNkB+nfPNGdvm2tlNsLh
 JlzfHsbIqNGUHjgEjs+rPf+k1Q==
X-Google-Smtp-Source: ABdhPJy6LX179GHqGuBzASUeTK3hyXnohSWMwDszmleLcDgLGKerUG7Nt+weSiJSkUa7xW24kN4OJw==
X-Received: by 2002:a19:6a16:: with SMTP id u22mr16061203lfu.444.1632598078048; 
 Sat, 25 Sep 2021 12:27:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id x9sm1100753lfn.303.2021.09.25.12.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 12:27:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: fix possible oops in msm_submitqueues code
Date: Sat, 25 Sep 2021 22:27:54 +0300
Message-Id: <20210925192754.3416212-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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

Even without GPU, the ctx->submitqueues list should be properly
initialized. Otherwise msm_submitqueue_close() (which can still be
called even w/o the GPU) will ooops while trying to traverse the list.

Move ctx->submitqueues initialization earlier, before !GPU check.

Fixes: 86c2a0f000c1 ("drm/msm: Small submitqueue creation cleanup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 32a55d81b58b..a0303be05445 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -128,6 +128,8 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+
 	if (!priv->gpu)
 		return -ENODEV;
 
@@ -140,8 +142,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	 */
 	default_prio = DIV_ROUND_UP(max_priority, 2);
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-
 	rwlock_init(&ctx->queuelock);
 
 	return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
-- 
2.33.0

