Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8864DCDD9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 19:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D70410E012;
	Thu, 17 Mar 2022 18:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6918810E010;
 Thu, 17 Mar 2022 18:45:04 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id c11so3326506pgu.11;
 Thu, 17 Mar 2022 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8frA8T51BfSTppCN6qAkZ99su7zckg/tQTH5hUyS8LQ=;
 b=RyIndbofKYuCI2lbzTuwvX6FW6aLSdrSsTOTwX+0PpMG1tVUS6nBiZpd2wOMB7K7ay
 4TXEw9HIMq4ArLr+GY+kFHSa3rtOKuWQ87s/u9R2D32lRmCq3j6CFhCFxtPjLOd7b/hs
 DJMpaqjupWPONWXTRQ/l751ZZyaMTn81HGy5UFIHeDiX+ffcb16r2eiSWfF+XjtYoJZf
 iy49l9+lkoIEIRCzKoPdQj6f3X7G7il+VGeOHiFvt6MQbKpAGVI/tIWH/GoBh+5/obmw
 wmcY4pCIn1cM15qgfWs4J/FM/wtfVB0ze3e4oDlIlB2hRiPbQyL9YIGv9n6Gl0rtTJWn
 V+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8frA8T51BfSTppCN6qAkZ99su7zckg/tQTH5hUyS8LQ=;
 b=USHblmNMaLD32ALbvlaypr2WQK6mcG+TJgC05dJ7RfutlOu1SsDZq8N9uVlu08wUEK
 0Kc8SpHAO+TLTXIWy0K6EshDQoGmV2/xSZzoDd5FbXwJV/EkH14p9yQqOwW7TOMMK86V
 +HizMR8SL6bNGy8Pa7ltNPNJVfrEoTyQIsypbV1S4ccNiasnv1BKXTrUb9s7A3Z2VYKh
 /pnuyrr5wqNCj1PEBnW2F/NcwyZWaLj6gjl/FHtPFaPhwsDNq8P9j1IJ79qVa52O7GqG
 Yx3RBSwWWkDFGGS4BvMCnLBJfZu/IErWCXj0yiZiq5aJVlaaccBLkclNYRQt7owdMEz4
 zyXw==
X-Gm-Message-State: AOAM533Z6aNmStc+mUzsfADZNZqxBUX6zfLhwSnvr4WNFoOgGq1gUTvM
 AnUwM2pCucnxmyBLrLg0SjAXpZa2L3Q=
X-Google-Smtp-Source: ABdhPJw2Sgwey2XM0AbmtVD8ylMFuv07FxKNo/PyLtYEDBPs6DlFa+Py7zEbtBRkZ2Tx6uUEyf0HUQ==
X-Received: by 2002:a63:ab47:0:b0:375:5d05:9f79 with SMTP id
 k7-20020a63ab47000000b003755d059f79mr4900716pgp.192.1647542703366; 
 Thu, 17 Mar 2022 11:45:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090a560100b001bf72b5af97sm6285380pjf.13.2022.03.17.11.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 11:45:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add missing put_task_struct() in debugfs path
Date: Thu, 17 Mar 2022 11:45:49 -0700
Message-Id: <20220317184550.227991-1-robdclark@gmail.com>
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
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes: 25faf2f2e065 ("drm/msm: Show process names in gem_describe")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 02b9ae65a96a..a4f61972667b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -926,6 +926,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 					get_pid_task(aspace->pid, PIDTYPE_PID);
 				if (task) {
 					comm = kstrdup(task->comm, GFP_KERNEL);
+					put_task_struct(task);
 				} else {
 					comm = NULL;
 				}
-- 
2.35.1

