Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2871DAC58
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4BB6E5B4;
	Wed, 20 May 2020 07:35:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073476E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 09:03:05 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id f6so6101188pgm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g7l8f0Zv5HCPiGiqrR0/5unpKCy3N2qumpqSQ5QZRv0=;
 b=gxVEiKnOHOpzOMXUCO9AgTFR22gtEofog93jxkLur8uXfyuNpzgdZgCu3EOHfO9WOd
 0cL7wt4UUibv9MBJafxdPTHN/RfQoO4vj/YedXi8+hmwEoSmkuzzJJoFKLBuKCSc4BrS
 yPTZjpa6RBovbwSNwyowJyjwwyk/tcLCs41eLCAB6iuD/o2z1RlRZ63TtXtAYlGMvgFc
 quh0GXOlj/vK+QcvBfttYKm6KlfCECFdW/lIoSlNDFy4srlxabF0n3c7efj2p1V/YZyb
 Lx/WtWN5LPn/l74DI721wUsRc62KfXTbuIspRtQTL3Ez/foiRnn2u40HnRmnXv1g7lki
 Q4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g7l8f0Zv5HCPiGiqrR0/5unpKCy3N2qumpqSQ5QZRv0=;
 b=MTlkMhSkGeooCWSd7T12yBIDBuFWd+9HR5dm/BIYEqLcOyrXIiYQuGzQfhSKtW4kIi
 szgQYMBDf1dWQns+BwEvY/BD7CfXlEML0SUrtR9jENBujlaXalInU+58jblgqyWJXERO
 sxmsbP3LEtgukL4+H9R+6CpKfOAEpIfOJj4ZZZOWjBYWDMJWeBcL0oF64qT5maamvpOv
 02EO/UQ/dL6mTyl7C0p4uUKfDGIwf+W0P8c0uM/1a20O8YhYlxWSWR1J/QcuXjBGoOBg
 JZfZelbhqP9jkpuiORnPU5wMp+P+37+UKLXoexEqK+Nd2ZA+wuCSWEV+1AnGrI9YJagc
 YnaQ==
X-Gm-Message-State: AOAM532MB4/1VY6qRB6jRC2xsjqsqj9IIZ7Dhs6qZaP7t3U9gXJjGBrS
 2tDgfxW1J2l7vCNjMmboEaw=
X-Google-Smtp-Source: ABdhPJzb0ZYQ3HiDvsOVxjLFhTBa2u5r+klKCMhULaQYcLI8QEUl5NNR9NwoIW5wXqC85Fj8q6UQGw==
X-Received: by 2002:aa7:8c53:: with SMTP id e19mr16678053pfd.264.1589878984490; 
 Tue, 19 May 2020 02:03:04 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (searspoint.nvidia.com.
 [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id i128sm10843094pfc.149.2020.05.19.02.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 02:03:04 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH] drm/tegra: hub: Do not enable orphaned window group
Date: Tue, 19 May 2020 02:03:01 -0700
Message-Id: <20200519090301.32689-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Though the unconditional enable/disable code is not a final solution,
we don't want to run into a NULL pointer situation when window group
doesn't link to its DC parent if the DC is disabled in Device Tree.

So this patch simply adds a check to make sure that window group has
a valid parent before running into tegra_windowgroup_enable/disable.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/gpu/drm/tegra/hub.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8183e617bf6b..a2ef8f218d4e 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -149,7 +149,9 @@ int tegra_display_hub_prepare(struct tegra_display_hub *hub)
 	for (i = 0; i < hub->soc->num_wgrps; i++) {
 		struct tegra_windowgroup *wgrp = &hub->wgrps[i];
 
-		tegra_windowgroup_enable(wgrp);
+		/* Skip orphaned window group whose parent DC is disabled */
+		if (wgrp->parent)
+			tegra_windowgroup_enable(wgrp);
 	}
 
 	return 0;
@@ -166,7 +168,9 @@ void tegra_display_hub_cleanup(struct tegra_display_hub *hub)
 	for (i = 0; i < hub->soc->num_wgrps; i++) {
 		struct tegra_windowgroup *wgrp = &hub->wgrps[i];
 
-		tegra_windowgroup_disable(wgrp);
+		/* Skip orphaned window group whose parent DC is disabled */
+		if (wgrp->parent)
+			tegra_windowgroup_disable(wgrp);
 	}
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
