Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AEA666AE3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 06:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDEF10E879;
	Thu, 12 Jan 2023 05:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DB110E879
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 05:37:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bt23so26804528lfb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=euPiCyuxjKhvf7883JyXlPwa55bTGV9dDUqFNI2G4e4=;
 b=CxqNhg7RmF6aUndfw64nsrJhUdJMUyZ5J34c0SbGaR1+Z5GljQ3Pnw9dA8UnUdANAK
 fPUsMVl8FbMXKYA4vhWYfAeHMgV1vK9SDpif2K7xzrz9wLMLZa89K5VK7Ro2f8rbNcFd
 tsOILCo6F4WIVGZXFblu1bXDTjXDPgJ8iFExxEAYPefIyGXGmxbd+NAFEw4aWAixLGAU
 KmzdVHlW/0K7fbbr2LL0DVnRkEVwxUMnc1GpzwgB51hvo01Clo9TjdvKcK6yFmxhf3Tb
 eSYJ9pezywDcPmK1hLdE+j2RkoC2ioLMFT/ap5/VWsYg/CZZIXa8CM3DwiH1BU4MYtrl
 cqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=euPiCyuxjKhvf7883JyXlPwa55bTGV9dDUqFNI2G4e4=;
 b=R8D5Uys2j8sonf5tIOS7ER/38blzaXs+ETGqSsWfSexyg6wdsqt0Mg+yAv/UomKQ1Q
 cS2Q8/thFyEsKmSHytsLkE+JoaQZGGIif/aRxq2wROoxs7e7cX5tC2kxh7jqkMlb1FEB
 NbdHgaHAKRDicniq6aQzpj7NZsUqgyFRCLW+00SSdx0VM80y6RdBD1Lxi2v7OoD8fjw7
 xKXGLk/Hj34uFOSbZF0qEbBY32V28To5KAMF6L01pgbQTFEVcWeAH5DgPbuvst/bCiIR
 nx3+lHimNy3gcyvOmVt11HVtsTDlYblXpJ5ENr8ksXrXEO2ZSlgRTXmW+CGWgAinVYYR
 3u6g==
X-Gm-Message-State: AFqh2kpUx+7PpcqJhG9B4hnxjCUL0tydDCJQGj1OpW8MApzeSY58DOUS
 HPVlxVDTq78baLq1FwzChQLRNg==
X-Google-Smtp-Source: AMrXdXuvririeBJ8WjXu2KAx0GI2JmDnxcCjGnVxFSF1Yor8Y9Ngws9wxghdxTZtDynrUZ9x2d/2aQ==
X-Received: by 2002:a05:6512:3a91:b0:4b5:9b8f:cc89 with SMTP id
 q17-20020a0565123a9100b004b59b8fcc89mr24059401lfu.55.1673501820199; 
 Wed, 11 Jan 2023 21:37:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bq26-20020a056512151a00b004ae24559388sm3077817lfb.111.2023.01.11.21.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 21:36:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: merge two CRTC debugfs dirs
Date: Thu, 12 Jan 2023 07:36:59 +0200
Message-Id: <20230112053659.1361298-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For each CRTC we are creating two different debugfs directories one
using crtc index (created automatically for the CRC files) and another
one using CRTC name/object ID (for state and status files).

This can be confusing, so move our custom files to crtc->debugfs_entry,
effetively merging two debugfs dirs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7f0f467dbabd..659fdfec5346 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1380,16 +1380,12 @@ DEFINE_SHOW_ATTRIBUTE(dpu_crtc_debugfs_state);
 static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 {
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-	struct dentry *debugfs_root;
-
-	debugfs_root = debugfs_create_dir(dpu_crtc->name,
-			crtc->dev->primary->debugfs_root);
 
 	debugfs_create_file("status", 0400,
-			debugfs_root,
+			crtc->debugfs_entry,
 			dpu_crtc, &_dpu_debugfs_status_fops);
 	debugfs_create_file("state", 0600,
-			debugfs_root,
+			crtc->debugfs_entry,
 			&dpu_crtc->base,
 			&dpu_crtc_debugfs_state_fops);
 
-- 
2.39.0

