Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF55175C2
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 19:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B06010EAFF;
	Mon,  2 May 2022 17:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B21B10E10A;
 Mon,  2 May 2022 17:29:18 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id 202so1913875pgc.9;
 Mon, 02 May 2022 10:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyJeFqHoGWWfsmN7ZUpT0hPaBi24D+V4aGuy1zcw08U=;
 b=gkB3nWHWQfhKPTtg6lYd+R/7QE9aVQPHgvJtP+ctJQ0SBARAm7Sc7BRdc6cdk3juc9
 ZJdHsXlMexuGv8fVXyAYNdbL/cNP1soLaojegZvIp/Awj7Dhg00wO+PQQf+HTXhpWFWX
 BzndP2dJuMu3QU8Y6BoKOlHozEp6gaKV1lw3z1bfaBfebkKOXlj5HP4RJe6UhiYNu+qs
 MMEwC3mX6ypQIuWLK1Sb966deUIyH3tr6ez3WGKHDXFNwUe3FH5Y5b+JZ2sfCfzm9yhJ
 v1Pq1TmVb6qarjhBSpK1euW2N1S6uD9l+AbLaWM12sudV1HwnJTQ/3xjJhXnxN3lX6bR
 FOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyJeFqHoGWWfsmN7ZUpT0hPaBi24D+V4aGuy1zcw08U=;
 b=peKOFy2ug5wbyJtNq86aWeR/9teM88t4xmacKUzQTS/O0CjTxp3Sp2mIabqNDRYkyM
 MueCU7YFLTs/8/DNK4t2rF0vM0L1U7Pp+DpwNE26euJnyNT6d+8Qxu1kUBJz6eSWE9wy
 iE1w0okP9j6a501HUcc/Rg6gfkkGSxXSxjxhGUNwIv7scq3GoBYByttbd5lNchPmlXFW
 fLtqDpqDodD6Zo6KCBGXgLj6V058uhP/DPac00hQFjWhbo+PiOMkTwBvLTlNijDF5N09
 qCg27ZUcn4mdUail7biCc8GjOzwBxRJvNDhRmG4737cnpSA6h/nHfS8dGKX1BUCt8GTS
 KvvQ==
X-Gm-Message-State: AOAM532wc1751pW5aylWP4oDZZomLLP1VVeKumqo9MIGNVl8aps3SQd8
 iEXcM3WDvzguTq/0sQ1t9TY4A6zpzlU=
X-Google-Smtp-Source: ABdhPJyHf2OnaMoWX9/L1t52Z6eiweABLqlfrwiAvsNXVNVXwVpwyq5gx/jIDQrFotPphBbhdWbNHw==
X-Received: by 2002:a63:1c0d:0:b0:3ab:1a76:953f with SMTP id
 c13-20020a631c0d000000b003ab1a76953fmr10499701pgc.73.1651512557459; 
 Mon, 02 May 2022 10:29:17 -0700 (PDT)
Received: from localhost ([172.19.27.22]) by smtp.gmail.com with ESMTPSA id
 j14-20020aa7800e000000b0050dc762816bsm4942208pfi.69.2022.05.02.10.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 10:29:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Limit command submission when no IOMMU
Date: Mon,  2 May 2022 10:29:08 -0700
Message-Id: <20220502172908.3569799-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Running the GPU without an IOMMU is not really a supported (or sane)
configuration.  Yet it can be useful during SoC bringup (ie. if the
iommu driver doesn't work yet).

Lets limit it to users who already have /dev/mem access, to avoid the
chance that a user accidentially configures kernel without IOMMU
support.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 23b68bc945f6..9cd8c8708990 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -734,6 +734,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (args->pad)
 		return -EINVAL;
 
+	if (unlikely(!ctx->aspace) && !capable(CAP_SYS_RAWIO)) {
+		DRM_ERROR_RATELIMITED("IOMMU support or CAP_SYS_RAWIO required!\n");
+		return -EPERM;
+	}
+
 	/* for now, we just have 3d pipe.. eventually this would need to
 	 * be more clever to dispatch to appropriate gpu module:
 	 */
-- 
2.35.1

