Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EDD341DF4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 14:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED2E6E039;
	Fri, 19 Mar 2021 13:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5A16E039
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 13:17:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g20so5445557wmk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 06:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XizLt9y8QuBfn2G+PzFtXWPzUzKqS1ZiChsPNFkRApk=;
 b=YB8qKNA6B4cZmWQT/WAKLTHxYtmHqt634FbsdwDgpZyqri/cQY/UZiEtTe+CTnrgqz
 te/BzCXJ4TW3lVvuKSgVivT6uO/fKHWK3VzhCS2PNGusetGs9m9eXhDfTCFuSs9R6DDn
 IBZPYiH51alhl6BTqBRPWcgNepruiU6s8G/aOH+KSFwPhAAjmYbZTS1mDjCUmfa/0N0+
 xn6umPZTXeIhcKJ351TYxy944cjBAgiY+dviOqR8Qy4PtJwiBDnyVOs5/YX3vz7ER4Dz
 FbvTMtDkuoSWfiduRJRB+vn2TMVhuzNOe2wFujXj3R766+x6rhW3pmBfAJGMsj99LoyD
 qN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XizLt9y8QuBfn2G+PzFtXWPzUzKqS1ZiChsPNFkRApk=;
 b=kkOG4uWIu0czF99f8cAfXE73aECNzkDxCaAdpKFaNiaDOB+20/Bmeg5ATQP8mCf61q
 x0NTzBe5Sigfo+uLgFtEQBMmcM4v+IayCYj/3Gu+KcNScI/SgYtmRbsLKRIEV3BDWg97
 /TVR/kByaZ6ZE4M8neON7zZcRTO/hyQAfO82p5TpzB2e7IMwvp3QgRb4Rqo8xCQQCk4a
 7oj4qEgbGwI7LuzFjlIM6UT4rirPD1b5zMOajVWSWXAAn3ciyRiP5ld7Qdx4obyT3bgf
 3Qvhrg5Qh/SoV0nO/T5viu1B8avB3G3NSw+B3pa+K0u2hZdRy2AkC+DZ11mdMBEGiJI9
 TUGA==
X-Gm-Message-State: AOAM531Ty4oWS/h4BUX72iklXyo19343MtRM62zDy4YxiJcNJw6v/e3f
 4FNiStzZVfvU9+cWdGtOy1s=
X-Google-Smtp-Source: ABdhPJwBF7w8X7bdxys0Tqi+8wIl/IGC/1bwGuOFfayyc+m7sznQJqmPUnyRyNE7wEQei1ajbTLj5Q==
X-Received: by 2002:a1c:5416:: with SMTP id i22mr3715894wmb.146.1616159833941; 
 Fri, 19 Mar 2021 06:17:13 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f4sm6627946wrz.4.2021.03.19.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 06:17:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: sor: Grab runtime PM reference across reset
Date: Fri, 19 Mar 2021 14:17:22 +0100
Message-Id: <20210319131722.1425804-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The SOR resets are exclusively shared with the SOR power domain. This
means that exclusive access can only be granted temporarily and in order
for that to work, a rigorous sequence must be observed. To ensure that a
single consumer gets exclusive access to a reset, each consumer must
implement a rigorous protocol using the reset_control_acquire() and
reset_control_release() functions.

However, these functions alone don't provide any guarantees at the
system level. Drivers need to ensure that the only a single consumer has
access to the reset at the same time. In order for the SOR to be able to
exclusively access its reset, it must therefore ensure that the SOR
power domain is not powered off by holding on to a runtime PM reference
to that power domain across the reset assert/deassert operation.

This used to work fine by accident, but was revealed when recently more
devices started to rely on the SOR power domain.

Fixes: 11c632e1cfd3 ("drm/tegra: sor: Implement acquire/release for reset")
Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index f02a035dda45..7b88261f57bb 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3115,6 +3115,12 @@ static int tegra_sor_init(struct host1x_client *client)
 	 * kernel is possible.
 	 */
 	if (sor->rst) {
+		err = pm_runtime_resume_and_get(sor->dev);
+		if (err < 0) {
+			dev_err(sor->dev, "failed to get runtime PM: %d\n", err);
+			return err;
+		}
+
 		err = reset_control_acquire(sor->rst);
 		if (err < 0) {
 			dev_err(sor->dev, "failed to acquire SOR reset: %d\n",
@@ -3148,6 +3154,7 @@ static int tegra_sor_init(struct host1x_client *client)
 		}
 
 		reset_control_release(sor->rst);
+		pm_runtime_put(sor->dev);
 	}
 
 	err = clk_prepare_enable(sor->clk_safe);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
