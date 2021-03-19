Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D93421C1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 17:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588916EA54;
	Fri, 19 Mar 2021 16:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083976EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 16:23:52 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id i9so3450071qka.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=827J05rE1xsthJW5mLQUpTPp0sqIQmHPybaAiIC1VsI=;
 b=PXx9uXgyBSZf09gQW6XSf91fPo2b5dxlLMvZJWnF9Rmvz8AIiTkFobJ5TVybpxb9eB
 6ZiXj/3oQQ8hwz7afz814jOdmM/1aAEj4nO5TQX7ZrzwtxoOmO7ZbZfMvCv8smW3mpAc
 s5EzDc/Y+N0wyOGKUVe3Hj+lJ5S/3sUff7ZP2m42w3a/S7+APhMWr4OiEhLSlJ5wJMG5
 1J4Ph4FlKj8XjpRYEaFygrWu1aldnmJ/FXX5ShzkwU7Zf/cleSnoDJrfdFsLufqnBi6P
 xIQfvxgZtasQC2j1jzO0nCce55oDiLQKmaGU4Km7tQuIbl3qciM9agqTzazUSnGF6XLJ
 VN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=827J05rE1xsthJW5mLQUpTPp0sqIQmHPybaAiIC1VsI=;
 b=sQbf3D6nkSeHhKhGId3CbVadas6ablAdcP0n6dfkl2B9W1qz+mkg8hm1NAnz7LCdvR
 nOnPegsZFwg9Os2xcJwMayXKfynDJ4nAWI87saPtggDy6XVlQHgAGElCt6cuRXoaZTLv
 Y/LHFkZHg1wStrOoj9xjjMeMkt8rJHtugBJ7Lx/p9dlLUcEB53nPl7v/oCEmUAYxNJmk
 LIatAhqow5yw4VXDSZXWwWp8RIQJ4nJ2seC/MgjVnctYzAK96YZEseOMz9SAJwnsMXPd
 0IlpVnvOtACO6eHRPRXW6QO8Pncdwq3KGo3N7mOpWBZZO+DZa8zfKvpmOgK5BpYqt7Wq
 lkeA==
X-Gm-Message-State: AOAM532loKK+uI7CLcu1LMpwFMQydbvmnylfFozhIPqOu8fJT43ugOaz
 uSmG6eZjOiJ5CbWG2CZiH8w=
X-Google-Smtp-Source: ABdhPJwrApMM3fTw0E5jETusnmKsUXxWmhGWkpmDOXZjEN2u/y3JJsFHxmZcXq0qS43MFBH/gT3nsQ==
X-Received: by 2002:a05:620a:1277:: with SMTP id
 b23mr9695186qkl.457.1616171031144; 
 Fri, 19 Mar 2021 09:23:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919:c165:89a3:1374:f96a])
 by smtp.gmail.com with ESMTPSA id
 q65sm4722903qkb.51.2021.03.19.09.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 09:23:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH 2/2] drm/msm: Fix suspend/resume on i.MX5
Date: Fri, 19 Mar 2021 13:23:33 -0300
Message-Id: <20210319162333.160421-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319162333.160421-1-festevam@gmail.com>
References: <20210319162333.160421-1-festevam@gmail.com>
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
Cc: dmitry.baryshkov@linaro.org, sean@poorly.run,
 dri-devel@lists.freedesktop.org
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
