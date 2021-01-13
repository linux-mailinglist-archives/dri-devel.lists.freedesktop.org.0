Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592AF2F4447
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 07:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CCF89DC2;
	Wed, 13 Jan 2021 06:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8990189DB4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:07:48 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id u4so492965pjn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 22:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aCU+PqhEWezTw2ZPt5auPvzhMgYd3zUnYvcsCAHOrFc=;
 b=RZo9hecfkmLCLrEAA+Esn1wktnCUuPVVGhDxzfEa+8Qa42oumC92OA/IkdU+uLVHtF
 PMfpzDOLNhXeiSUEDjbm05XF66wNVArDODjg0Eul9orRoTHkbrhjkn6NKaOdNaEZnhLI
 SEyBqasonHJqnqjWaARq4/drtPKUyILGKBMw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aCU+PqhEWezTw2ZPt5auPvzhMgYd3zUnYvcsCAHOrFc=;
 b=TMP/Tv49ajOD7hLYAGsZ8ihZkDHfSRyR2Xz0DShVRPuodJ7ZsujTHLC5AaEKwqQIPs
 OGE48mNMy19qqmJARfD+1n9R7HfhwhXIPp+BbwjmpArj7OovJ1ei9eda6JDCl79AEShQ
 HXu5SIcnlha/YsYb55/jMou6y3R6ESJEetqJdXY6dFDDDPaY+JM62yHGOVwVzqXvq74A
 Ih/js0YHehrTQUwUZ1JYRuM2zQ6DgGWFjmcIaiAvwD3OlMtSoC+hpRzK3D5JzGNZxHWW
 2SyEaQpwK5gvokuh1m6owIAsQXLgUUKUF7CwJ3Tp+pJbpCNuais8QhLuMVq8n0xnk1yc
 XKyw==
X-Gm-Message-State: AOAM532hlmmMWBqGsNwxugQKQlkP2sAwuGMqCad7iFZ7CNmRMrvka8ZF
 2VUBwNPMvd/SCqt2xqqgorbC5A==
X-Google-Smtp-Source: ABdhPJxWa7zfR5BtclGM1k98qcWG8hY8CikWMIJLdiAdmFTAInCRR/4YlpS0XoVJZbdC3XMMjgnIZQ==
X-Received: by 2002:a17:90a:fc97:: with SMTP id
 ci23mr543919pjb.83.1610518068204; 
 Tue, 12 Jan 2021 22:07:48 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id y21sm1263556pfr.90.2021.01.12.22.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:07:47 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v10 3/4] drm/panfrost: devfreq: Disable devfreq when
 num_supplies > 1
Date: Wed, 13 Jan 2021 14:07:02 +0800
Message-Id: <20210113140546.v10.3.I3af068abe30c9c85cabc4486385c52e56527a509@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113060703.3122661-1-drinkcat@chromium.org>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 hsinyi@chromium.org, hoegsberg@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GPUs with more than a single regulator (e.g. G72 on MT8183) will
require platform-specific handling for devfreq, for 2 reasons:
 1. The opp core (drivers/opp/core.c:_generic_set_opp_regulator)
    does not support multiple regulators, so we'll need custom
    handlers.
 2. Generally, platforms with 2 regulators have platform-specific
    constraints on how the voltages should be set (e.g.
    minimum/maximum voltage difference between them), so we
    should not just create generic handlers that simply
    change the voltages without taking care of those constraints.

Disable devfreq for now on those GPUs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

(no changes since v9)

Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message

Changes in v6:
 - New change

 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f44d28fad085..812cfecdee3b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -92,6 +92,15 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
+	if (pfdev->comp->num_supplies > 1) {
+		/*
+		 * GPUs with more than 1 supply require platform-specific handling:
+		 * continue without devfreq
+		 */
+		DRM_DEV_INFO(dev, "More than 1 supply is not supported yet\n");
+		return 0;
+	}
+
 	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
 					      pfdev->comp->num_supplies);
 	if (IS_ERR(opp_table)) {
-- 
2.30.0.284.gd98b1dd5eaa7-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
