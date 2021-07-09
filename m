Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9932E3C2BC9
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 01:50:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03BD6E9B5;
	Fri,  9 Jul 2021 23:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27156E9B5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 23:50:27 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id e20so10627582ljn.8
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 16:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sn0jP9DnLuphcw0YXtYqDYqKI3YxyEQFHRMjVN+jOvc=;
 b=xV8l78WU8UxRjNv+nVa245XgCmMJfpSGkEwsjN7diyuHONzbyxpoH/eqdmwKCrd3TT
 WT4RM/Ej2xty+Jul6ScQG1zeIUs6YcIs7tqg/0klfEkV15sbqWsn5WeOg+K89gPwY+qX
 xxk0Zs5zc/gzLb2k4C3HTsnfX0oqmoh1m6MY6cXnMVpmGndxKWOAMT5c5zxmg62nYKBr
 +Qp1APOlrOO8//Y5l5aUPMrR7/TQOga8On+w2TNsYs0kU/g6UhMsS+YcI9bbVoT5ou0q
 j5O3tcb/7RfIcvK9Np808G1vz8+8VECiYzomvkz446FnBdmCu8qVExllflKAu5mwXSXa
 WVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sn0jP9DnLuphcw0YXtYqDYqKI3YxyEQFHRMjVN+jOvc=;
 b=B9UgATtAfM1ft/vqy61bqMnw3/kmPbdRz0SxqX0NK3Jf0bCx2bvJ5Y/1xGN+MoZPAI
 OteYvEf4nft6r2SYuBDW3BMTKoYa4XPR/XSCPxArsygT5txTH9VxDCTD6muGjXzHo3qo
 2DXmLzJQsY+BpzeDd7RQK9zbYVKy/Y4eFt5SSntDlxdhsXOBel0hjt3s5HRDCrtheSid
 zH5L6SO6VaOMjB+mSj0RIDgrSkOjyv7rjvfZ72C3myc6RMnCp3ZilrQM7KWEg6pyT4mz
 GjNw8GFvQxXi1fQIsj3hQ9GLGYO8uUsW+g8kOBFUiekSt3L2OOWZYfkzuM8GCHfYjjcC
 0r1Q==
X-Gm-Message-State: AOAM530kqVZEA2+smyDYK0X5N0nNS+y/BmDxZdCq5TF6DwUPe34w+gYF
 7GehhZAJS29zDdM+jdJuu96oFw==
X-Google-Smtp-Source: ABdhPJyjoB4ZEO4ir2no0ThokAQYqxv3KsDYgYA5XgCzVrVEBeS6wwizc71TcMr2/JFMK2iDRr/z7g==
X-Received: by 2002:a2e:8244:: with SMTP id j4mr21369949ljh.364.1625874625964; 
 Fri, 09 Jul 2021 16:50:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:50:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH v2 0/7] drm/msm/dpu: add support for independent DSI config
Date: Sat, 10 Jul 2021 02:50:17 +0300
Message-Id: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchseries adds support for independent DSI config to DPU1 display
subdriver. Also drop one of msm_kms_funcs callbacks, made unnecessary
now.

Tested on RB5 (dpu, dsi). Previous iteration was tested by Alexey
Minnekhanov.

Cahanges since v1:
 - Rewrote dsi encoder setup function by separating common code sequence
   and calling it either for the bonded interface or twice for each of
   the DSI hosts.

Changes since RFC:
 - renamed dual DSI to bonded DSI as suggsted by Abhinav
 - added comments to _dpu_kms_initialize_dsi() regarding encoders usage

The following changes since commit e88bbc91849b2bf57683119c339e52916d34433f:

  Revert "drm/msm/mdp5: provide dynamic bandwidth management" (2021-06-23 14:06:20 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-drm-drop-set-encoder-mode-2

for you to fetch changes up to 3e10b945035d638bdf94f06b3fc86a6deaa41e63:

  drm/msm/kms: drop set_encoder_mode callback (2021-07-10 02:46:00 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dsi: rename dual DSI to bonded DSI
      drm/msm/dsi: add two helper functions
      drm/msm/dpu: support setting up two independent DSI connectors
      drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
      drm/msm/dp: stop calling set_encoder_mode callback
      drm/msm/dsi: stop calling set_encoder_mode callback
      drm/msm/kms: drop set_encoder_mode callback

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 130 +++++++++++++++++++------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  11 +--
 drivers/gpu/drm/msm/dp/dp_display.c      |  18 -----
 drivers/gpu/drm/msm/dsi/dsi.c            |   9 ++-
 drivers/gpu/drm/msm/dsi/dsi.h            |   9 +--
 drivers/gpu/drm/msm/dsi/dsi_cfg.h        |   2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c       |  30 +++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |  93 ++++++++++------------
 drivers/gpu/drm/msm/msm_drv.h            |  12 ++-
 drivers/gpu/drm/msm/msm_kms.h            |   3 -
 10 files changed, 158 insertions(+), 159 deletions(-)

