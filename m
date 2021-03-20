Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456DB342C9A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 12:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A20816EB5E;
	Sat, 20 Mar 2021 11:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C396EB5C;
 Sat, 20 Mar 2021 11:56:28 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id c6so8885089qtc.1;
 Sat, 20 Mar 2021 04:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlRIPZDWLtVzMPV1+DyrJiYllc0VltZdGCVn3dbwgEc=;
 b=fG+qh6vMzL1J8aL/4mB9WmrYBcnYkaKchaQUAfW/JFdI5+RT6y2+6FIAoQ6CwgJrl4
 7w10dXOS7FpLloB2paud6HvB14283R5Ju7I7Fabf/xVlnRXG0AwxgI9kAU8+XlK9DhHl
 /nTZ1lJ3RWaSOCeEsJHCRYG23kKO38aeY3rw1+bj51haBCHQYR4Km0tnwDuuDXo4m8Cj
 e/NZNmxzThZALcGExHLclMvI5xomjUQnuu32mU0xJ1Y881nh75qUXohfI5kAci39tF31
 uOak3a41d15SsJGZF5GOW2BDrSH+jO27bj+0yR4kPMv292WD7ulV3OjHCyKkYdotTooO
 FjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlRIPZDWLtVzMPV1+DyrJiYllc0VltZdGCVn3dbwgEc=;
 b=UNPvGtc7+rbLXYQniLY3BUSfNiKqmlJAlgYKXRHswpdEyBHIZFjnNvv4O0LzMMmOg0
 hDivxNgKAHTkgxugWW14DU3s35YMT02H9NXbRF5VI/TZ1Lp/zWkCFZSUC74rA9vo/7hY
 iMkiPg5aQB+iFbS03zRSNohz02APP+0RT8LCYs5wq12saKFiylJb98M08z6fg7Ii9PcC
 j+5W3udn3vBtEBEij0IGBOy6YIQV09/ycAH70qtNZJN8aln1fjjoCQHufdniqFQpzbPI
 x+61Y/V4wuNDOT9m7oeFg08UZc6jvi9Tl9vgiMnrypIt3/vpqK5kDk7DCCme5KLmMVk3
 xGYQ==
X-Gm-Message-State: AOAM530f0w+2EhRGWD6sW6sSl0GntIEDiS/oNzTXeVEiv/jHx6YSrzLq
 RprJ9lij0qpQBarawyvN7rM=
X-Google-Smtp-Source: ABdhPJwD09mVKagZvZacKaoFdMcNiv74c0BScJ8M2admK6YvtkFIoIjF4787ni2LDwQjwsMTSTdPDQ==
X-Received: by 2002:aed:3023:: with SMTP id 32mr2580664qte.173.1616241387864; 
 Sat, 20 Mar 2021 04:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:d77f:dedf:c165:89a3:1374:f96a])
 by smtp.gmail.com with ESMTPSA id j30sm5720233qtv.90.2021.03.20.04.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 04:56:27 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 2/2] drm/msm: Fix suspend/resume on i.MX5
Date: Sat, 20 Mar 2021 08:56:03 -0300
Message-Id: <20210320115603.183083-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320115603.183083-1-festevam@gmail.com>
References: <20210320115603.183083-1-festevam@gmail.com>
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
Cc: dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org,
 sean@poorly.run, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When putting iMX5 into suspend, the following flow is
observed:

[   70.023427] [<c07755f0>] (msm_atomic_commit_tail) from [<c06e7218>]
(commit_tail+0x9c/0x18c)
[   70.031890] [<c06e7218>] (commit_tail) from [<c0e2920c>]
(drm_atomic_helper_commit+0x1a0/0x1d4)
[   70.040627] [<c0e2920c>] (drm_atomic_helper_commit) from
[<c06e74d4>] (drm_atomic_helper_disable_all+0x1c4/0x1d4)
[   70.050913] [<c06e74d4>] (drm_atomic_helper_disable_all) from
[<c0e2943c>] (drm_atomic_helper_suspend+0xb8/0x170)
[   70.061198] [<c0e2943c>] (drm_atomic_helper_suspend) from
[<c06e84bc>] (drm_mode_config_helper_suspend+0x24/0x58)

In the i.MX5 case, priv->kms is not populated (as i.MX5 does not use any
of the Qualcomm display controllers), causing a NULL pointer
dereference in msm_atomic_commit_tail():

[   24.268964] 8<--- cut here ---
[   24.274602] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
[   24.283434] pgd = (ptrval)
[   24.286387] [00000000] *pgd=ca212831
[   24.290788] Internal error: Oops: 17 [#1] SMP ARM
[   24.295609] Modules linked in:
[   24.298777] CPU: 0 PID: 197 Comm: init Not tainted 5.11.0-rc2-next-20210111 #333
[   24.306276] Hardware name: Freescale i.MX53 (Device Tree Support)
[   24.312442] PC is at msm_atomic_commit_tail+0x54/0xb9c
[   24.317743] LR is at commit_tail+0xa4/0x1b0

Fix the problem by calling drm_mode_config_helper_suspend/resume()
only when priv->kms is available.

Fixes: ca8199f13498 ("drm/msm/dpu: ensure device suspend happens during PM sleep")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None, only added freedreno@lists.freedesktop.org on Cc

 drivers/gpu/drm/msm/msm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fd2ac54caf9f..a5c6b8c23336 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1072,6 +1072,10 @@ static int __maybe_unused msm_pm_resume(struct device *dev)
 static int __maybe_unused msm_pm_prepare(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct msm_drm_private *priv = ddev ? ddev->dev_private : NULL;
+
+	if (!priv || !priv->kms)
+		return 0;
 
 	return drm_mode_config_helper_suspend(ddev);
 }
@@ -1079,6 +1083,10 @@ static int __maybe_unused msm_pm_prepare(struct device *dev)
 static void __maybe_unused msm_pm_complete(struct device *dev)
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
+	struct msm_drm_private *priv = ddev ? ddev->dev_private : NULL;
+
+	if (!priv || !priv->kms)
+		return;
 
 	drm_mode_config_helper_resume(ddev);
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
