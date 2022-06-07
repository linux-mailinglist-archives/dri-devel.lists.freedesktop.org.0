Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B9853FCEA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 13:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE8610E0E7;
	Tue,  7 Jun 2022 11:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0831E10E08A;
 Tue,  7 Jun 2022 11:08:53 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so20531242pju.1; 
 Tue, 07 Jun 2022 04:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Po1Q5+6dI5yA4ldBgb2PF70K+bMXEwc5eVZhSQFEPLQ=;
 b=oGkUJxSiFWnEbzHhenRsTq1+Di2BTqEPtyQKOuzfE117dtISgEKhcUGbepRpqseLXc
 uDjuopqh2LIvIPWDRqkn3HtKKfO5WfoShBll48QLsqVtzwIG2CqplMMXW8kWt+77SMZz
 eUfInGS8fV+8vqasQ/gFjGTS7u4hQ4Z1Gw0R2Y1jzLfKm9MQSduAN5Csz1EseWH4Tv3u
 kTxulbf3f9SvFFo7VVjRTl9VDqktaI+zbxKnHuAeGK53bVfl7dPZpgqO1vNb4s74A+WS
 iWkQdPJDO8jOgwTbwFasvLepqmcno7hRXfXSzHI1OKITixe1XbMtaxn8/j1hneoXgDmh
 c0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Po1Q5+6dI5yA4ldBgb2PF70K+bMXEwc5eVZhSQFEPLQ=;
 b=4TVA0/GMkr/DpLVkhEHhcmVBFBfDRqMQPXZTy6OuR20jogJ0t69j5NwhRkiFtzBZFR
 wjB+mIeY3l2uevBLYCUdN1bmXMx2k+DEYslf6VSBnerXlE3sOn1C8NS28YmUORpARMBM
 wmMn8yIX0VgXfYFlH1Lf4tTePsuWzZ4dMfVe+2t7GJMaXOToTbWXzMNT6PdYR0JosVrO
 1fCHXT/8iTX++f2vlHgNMVn+n4+VGoAWilItDzo6Z/IXUpB/MBpbtKgcePUjFEG8+f3k
 T0+Yr8Sdbbmrv54yGpCjup50bWOdQtINcfi5OQfPTqmoJ9GN2Uo8ddVNIMYcvI0NjHRM
 ae6Q==
X-Gm-Message-State: AOAM5311XtR4pK7pEz6Q8Qur4rzKhzbnkdla3QmQJUcA2dEylGXI8sop
 TyfP1ElJwV5smb6yAUTrUis=
X-Google-Smtp-Source: ABdhPJyzMIIixx7LNlorf8GeSs9/oSuBiBElDRVrwCUcFan3ee56iXcevAaVtwW0gAdH+D0FOIGpsg==
X-Received: by 2002:a17:902:d58a:b0:164:f5d1:82e9 with SMTP id
 k10-20020a170902d58a00b00164f5d182e9mr28874742plh.3.1654600133569; 
 Tue, 07 Jun 2022 04:08:53 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm10439542pfo.121.2022.06.07.04.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 04:08:52 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 David Heidelberg <david@ixit.cz>, Guo Zhengkui <guozhengkui@vivo.com>,
 Xu Wang <vulab@iscas.ac.cn>, Miaoqian Lin <linmq006@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
Date: Tue,  7 Jun 2022 15:08:38 +0400
Message-Id: <20220607110841.53889-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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

of_graph_get_remote_node() returns remote device node pointer with
refcount incremented, we should use of_node_put() on it
when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index fb48c8c19ec3..17cb1fc78379 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -216,6 +216,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		encoder = mdp4_lcdc_encoder_init(dev, panel_node);
 		if (IS_ERR(encoder)) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
+			of_node_put(panel_node);
 			return PTR_ERR(encoder);
 		}
 
@@ -225,6 +226,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
 		if (IS_ERR(connector)) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
+			of_node_put(panel_node);
 			return PTR_ERR(connector);
 		}
 
-- 
2.25.1

