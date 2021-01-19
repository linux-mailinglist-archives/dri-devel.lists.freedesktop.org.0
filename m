Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3212FC484
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 00:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049C36E045;
	Tue, 19 Jan 2021 23:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743B56E045
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 23:13:12 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id b64so23677709qkc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 15:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFDeRRXpIwJ9CiC4D5FKzuA49LZcu+/pdjtRByjt0xo=;
 b=sqoHROC9LkFMGRZVIpGm0kyyjpzP41GfuKZ6mpuqTy3cS8R7YsvLzEgPG0D25QKUTw
 7+IuUbBr3hZNyJnPEqcqXm0gkA+zzQAheq9QCFPcA7Wbpv1GAS5/kRv+h46uknGyg08y
 w3ZjMPDmm0//W9KTj6/wqUJfxQ+6GWVTny5GJvSuWIjWaO0VX2n9nrXGQ02xQSpzU4/i
 /7ojzbLEryT9wZYreis+nUEM4SEi4Wy2Av7legkmZKHJlPmHos8exBA2sjZpYddGy6kz
 329Mec5o4iU4riYH/AJsLFGly3xA2050pddCbb9vFr0PVCurQIWH1BFot1ZDJ3wqBPA3
 Oeeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zFDeRRXpIwJ9CiC4D5FKzuA49LZcu+/pdjtRByjt0xo=;
 b=raTOFbW4prUYd2uvnDbKA+rQIanzyoYsUM7ISKFBqwK/lr0qHq7UltbUR7LJ+bIfeR
 JJ2wbLK8hXNbQiUPK/oxItPoNg0iHRjTzkUQeSiiL4ihLq/hso9KVRM132kNOrN9IjMp
 MT/myqBVS9ZWN6cPOZ25Ne99eCgKq9rdJ/TVme72jyDAo9LRi0iqeZVdLBGI7vVr7zhT
 wSkmK5OWRu3l6lZzefTh9nL4Lfx2LBV8V+P9qj8BAbU8sJmu+ssySEqDLbUYYztTQyf8
 3ccESl/Bk0AplEr1uc0pjwvvtVu+KuUVr41PNowqEnp1tR6UoApqiJX7PnTdhyxK1v26
 1GQg==
X-Gm-Message-State: AOAM533bx2rj13F/aMtxh/vBYyFHduYfWRJ/AixqwLm7NfzDW8oaeV0x
 m9g+N2zNjKBOLXUbahyNw0o=
X-Google-Smtp-Source: ABdhPJxgRZBW3+fVONVNJTB6QzcuDx+eY1pKQbv+mTe76B4trG+p0wwmu64ftSl1PErrEcQFCLuxcQ==
X-Received: by 2002:a37:8703:: with SMTP id j3mr6871202qkd.455.1611097991587; 
 Tue, 19 Jan 2021 15:13:11 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
 by smtp.gmail.com with ESMTPSA id q185sm149865qka.96.2021.01.19.15.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 15:13:10 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: robdclark@gmail.com
Subject: [PATCH v2 1/2] drm/msm: Call shutdown conditionally
Date: Tue, 19 Jan 2021 20:10:54 -0300
Message-Id: <20210119231055.2497880-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: mkrishn@codeaurora.org, jonathan@marek.ca, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 stable@vger.kernel.org, kernel@pengutronix.de, kalyan_t@codeaurora.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Issuing a 'reboot' command in i.MX5 leads to the following flow:

[   24.557742] [<c0769b78>] (msm_atomic_commit_tail) from [<c06db0b4>]
(commit_tail+0xa4/0x1b0)
[   24.566349] [<c06db0b4>] (commit_tail) from [<c06dbed0>]
(drm_atomic_helper_commit+0x154/0x188)
[   24.575193] [<c06dbed0>] (drm_atomic_helper_commit) from
[<c06db604>] (drm_atomic_helper_disable_all+0x154/0x1c0)
[   24.585599] [<c06db604>] (drm_atomic_helper_disable_all) from
[<c06db704>] (drm_atomic_helper_shutdown+0x94/0x12c)
[   24.596094] [<c06db704>] (drm_atomic_helper_shutdown) from

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

Fix the problem by calling drm_atomic_helper_shutdown() conditionally.

Cc: <stable@vger.kernel.org>
Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Explain in the commit log that the problem happens after a 'reboot' command.

 drivers/gpu/drm/msm/msm_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 108c405e03dd..c082b72b9e3b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1311,7 +1311,8 @@ static void msm_pdev_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	drm_atomic_helper_shutdown(drm);
+	if (get_mdp_ver(pdev))
+		drm_atomic_helper_shutdown(drm);
 }
 
 static const struct of_device_id dt_match[] = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
