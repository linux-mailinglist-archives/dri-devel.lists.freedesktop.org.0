Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DCACB6576
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF0B10E81C;
	Thu, 11 Dec 2025 15:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.b="aob9AFqO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 437 seconds by postgrey-1.36 at gabe;
 Thu, 11 Dec 2025 09:47:09 UTC
Received: from forwardcorp1d.mail.yandex.net (forwardcorp1d.mail.yandex.net
 [178.154.239.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B814E10E2AF;
 Thu, 11 Dec 2025 09:47:09 +0000 (UTC)
Received: from mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:94a9:0:640:a3fa:0])
 by forwardcorp1d.mail.yandex.net (Yandex) with ESMTPS id 889C5807A3;
 Thu, 11 Dec 2025 12:39:49 +0300 (MSK)
Received: from kniv-nix.yandex-team.ru (unknown [2a02:6bf:8080:c5c::1:37])
 by mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id MdLltr0FqCg0-XKazNBt7; Thu, 11 Dec 2025 12:39:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; t=1765445989;
 bh=gZ19bStIXK8ZTYeaIB4Wio3OCyGR20Y3eysM2vFARVU=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=aob9AFqOPibHIQfZ9z38+gzDHxMpxstejtPnTKQO/EzicSIfSGqNyRh6d5m/WF5Nm
 oDW7M1xsayyjBm1k9hLOCAkQOIGS1Q0nJ/F3V+ME4C4kYye8VWMq7jRTZYlaC3f2wX
 1vjFwfVpduMxoB8mv5sY5U5kF5EcH+VW2qYkNPFY=
Authentication-Results: mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Nikolay Kuratov <kniv@yandex-team.ru>
To: linux-kernel@vger.kernel.org
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Nikolay Kuratov <kniv@yandex-team.ru>, stable@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Date: Thu, 11 Dec 2025 12:36:30 +0300
Message-Id: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Dec 2025 15:27:30 +0000
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

It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
single place the check is missing.
Also use convenient locals instead of phys_enc->* where available.

Cc: stable@vger.kernel.org
Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 46f348972a97..6d28f2281c76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -247,14 +247,12 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
 		if (hw_cdm)
 			intf_cfg.cdm = hw_cdm->idx;
 
-		if (phys_enc->hw_pp->merge_3d && phys_enc->hw_pp->merge_3d->ops.setup_3d_mode)
-			phys_enc->hw_pp->merge_3d->ops.setup_3d_mode(phys_enc->hw_pp->merge_3d,
-					mode_3d);
+		if (hw_pp && hw_pp->merge_3d && hw_pp->merge_3d->ops.setup_3d_mode)
+			hw_pp->merge_3d->ops.setup_3d_mode(hw_pp->merge_3d, mode_3d);
 
 		/* setup which pp blk will connect to this wb */
-		if (hw_pp && phys_enc->hw_wb->ops.bind_pingpong_blk)
-			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
-					phys_enc->hw_pp->idx);
+		if (hw_pp && hw_wb->ops.bind_pingpong_blk)
+			hw_wb->ops.bind_pingpong_blk(hw_wb, hw_pp->idx);
 
 		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
 	} else if (phys_enc->hw_ctl && phys_enc->hw_ctl->ops.setup_intf_cfg) {
-- 
2.34.1

