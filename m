Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14C46C777
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 23:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7DB6E0DB;
	Tue,  7 Dec 2021 22:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01796E0DB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 22:29:13 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bu18so1773051lfb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 14:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tMJvV86m/ZeXgXgTnYzA2Z7tIMKoHvAbqCoassUZvfg=;
 b=SaZyruxCjfmMTKQ3ALXyShb0kwDg0MKN7K54apM4VaZqUmVv7HYqTTlSpoYa0QGmTk
 qr5PPp/k4j5M4LlSIGGah1zRV5Goixoukf4zK7o8xinPE9XDOCFxz8hb5oxZ4WRlDFHM
 +3mNA38J1lcLoqqwlaWw++tLn3kPiVCtzCAPGFx/PIUFitZcuGnYgbmPlR1a+e5cHDXp
 uVi/254IT0Aw2g3uxaaMTlecTVKMTpLX9HT2wQ7aZiKLaotoawSQ/7WUu+G2PLRAX2xa
 jk1aQLvrIYwV/NVR1FOzIgZRzrsetKEm0FS13WXMcY12dFl90H72FuOHTj3+OWiCjIE2
 j7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tMJvV86m/ZeXgXgTnYzA2Z7tIMKoHvAbqCoassUZvfg=;
 b=MixJTrExo1N5xTwZo3Fxq2GYfydRp3bXmHvyuFYcWFg7AnREVFr/al9FJNxuPX5wpN
 4Al/ijUlR9WMXNVKR5DLTmh82K+0Mgt/xEE2BXShR3wu8K1zt5qZuLikLr7PmyMrzod5
 +aIxq4xPRgwNpTdhOkUNUx5wyTFAxDg10DOcOu74cwMYrISd8btB+0WyZjfEVe6Ay6xy
 dORUAkIJI+CjXFfQTV4LX6vSEk99HX7TkSOYFyEpv3vEwSYdT0IKbunzIIEusHNnlIst
 Ylm7GPxJCCvUaKO3T361DCq3vApo9DmdOXmHUmwQIfKOdmD5dq5/nUjrF55pPr2eQ80b
 b1Og==
X-Gm-Message-State: AOAM533wiPkrohgWxKiPoyoYNaax0D5ztyPpyRQIzcaDzL2rrl3UoDAQ
 /9yH0KLM9ZIjkJogVmLQAdV4iw==
X-Google-Smtp-Source: ABdhPJzfMVwZI18ytPow1qWZAobewkqQ9vJbmPpnSk9E2qaQQev90HlvV7+Tk+PsMoHFI+CXk2/K9A==
X-Received: by 2002:a05:6512:16a4:: with SMTP id
 bu36mr44052612lfb.255.1638916152061; 
 Tue, 07 Dec 2021 14:29:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p22sm79423lfe.257.2021.12.07.14.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 14:29:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 0/2] drm/msm/dsi: switch msm/dsi to DRM_PANEL_BRIDGE
Date: Wed,  8 Dec 2021 01:28:59 +0300
Message-Id: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the DSI driver has two separate paths: one if the next device
in a chain is a bridge and another one if the panel is connected
directly to the DSI host.

The later functionality is already suppurted by the panel-bridge driver,
which wraps drm panel into the drm bridge instance. Using it will remove
the need for special handling of drm_panel and drm_connector inside the
DSI driver. With these patches in all cases the DSI driver will see the
chain bridges which either support bridge-connector or allocate the
connector on their own.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dsi: move DSI host powerup to modeset time
      drm/msm/dsi: switch to DRM_PANEL_BRIDGE

 drivers/gpu/drm/msm/dsi/dsi.c         |  32 +---
 drivers/gpu/drm/msm/dsi/dsi.h         |  10 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    |  20 +--
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 296 ++++++----------------------------
 4 files changed, 61 insertions(+), 297 deletions(-)



