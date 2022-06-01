Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B76539BBC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 05:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1C310E166;
	Wed,  1 Jun 2022 03:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1AD10E166
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 03:39:44 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so801431pjf.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPt4dtaBXbbIz680GXjnifuabCoTnOqD29Zad6avBJU=;
 b=nw+3kMrrmiyzaKACHZawVtj2we71BB5rDBesnCh9NO42UAU718xHv+4OYahFJFuudK
 XcOIvtvKkfOQRmKQbxLr3rpnJupgBTVZVE0UORaYwSPeVqlZq9GYTT6Q/lX/oz9rHd2o
 /DESQ/UO2QFTUZm6469k5wjrjP+S2uB6joXn+Zls/op8LrYiLuOjwbsT2uOyRunC+A+2
 52j7OHCnkYe+FzrnjQvhkTSrJv7cPASgbNAdiLyczJegw1in7RVxFRV+7BwE9A4KT6gp
 FDR0Ucl3BNIj+Flg8wlS4WzhO678o9gmW8MJqi41oB3mIz5HW8/B0peaR4pBwmmuHE4R
 yyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPt4dtaBXbbIz680GXjnifuabCoTnOqD29Zad6avBJU=;
 b=nlicvhOpMXf+NrCXO+OTP20OzOdQCHc8mNpkBekj+RgVeUE53M0LrF7B97B6Mjdqfz
 qTtXsjr6b+EP48F4fv92r51hVsmIpIYsUHqQaoqCgDr5ad6UppjlS6+2rKDOVsfAsM0y
 I8pb//HF4Wc1O+8io/hqtu132K0qYzsnYY0zygwBw+63XGrtDZmVB0G9aDCyzjheVmvj
 5fMHzYTGEe+KwBjHQNYaYkZpw8O1xgIC5aNZSmLeaFC9PwLT8d93J7x8YxBZRvpuD97f
 CBGRhKUg1hkCfmfatDwwfR2OmryW14jot7lGX+9SK9jugYavEGn7P090iNCip08DPG1d
 F60w==
X-Gm-Message-State: AOAM5309e4QHWhmXfzGBK+wVhTal298Jj6nXZmvIVXedveHEt3NRUJ2o
 9PB8+KLMd9OSHLK+/UTzuPU=
X-Google-Smtp-Source: ABdhPJxer3AeLgoZLp4VQP+/nNyqbXOlRUDTKhy9HqMSwV7nbJJY3xIQCZ34bWrRjeUsoLJRduE3bg==
X-Received: by 2002:a17:90a:ab90:b0:1da:375f:2f44 with SMTP id
 n16-20020a17090aab9000b001da375f2f44mr31928040pjq.33.1654054783864; 
 Tue, 31 May 2022 20:39:43 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 dw15-20020a17090b094f00b001e0b971196csm2732415pjb.57.2022.05.31.20.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 20:39:43 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/meson: Fix refcount leak
Date: Wed,  1 Jun 2022 07:39:25 +0400
Message-Id: <20220601033927.47814-1-linmq006@gmail.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following patchset fix two refcount leak bugs.
The cause of the bugs are missing of_node_put() 
after of_graph_get_remote_node().

changes in v2:
- patch#2:Fixed patch in meson_encoder_hdmi_init, call of_node_put() 
  after of_find_device_by_node() and error paths before that. 
  noted by Martin Blumenstingl <martin.blumenstingl@googlemail.com>

(patch#1: no changes since v1)

v1 link:
patch#1: https://lore.kernel.org/r/20220531144818.26943-1-linmq006@gmail.com/ 
patch#2: https://lore.kernel.org/r/20220531144818.26943-2-linmq006@gmail.com/


Miaoqian Lin (2):
  drm/meson: encoder_cvbs: Fix refcount leak in meson_encoder_cvbs_init
  drm/meson: encoder_hdmi: Fix refcount leak in meson_encoder_hdmi_init

 drivers/gpu/drm/meson/meson_encoder_cvbs.c |  1 +
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 15 +++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.25.1

