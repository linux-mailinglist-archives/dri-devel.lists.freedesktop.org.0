Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA053E561
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F01A1122AA;
	Mon,  6 Jun 2022 15:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAC51122AA
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:24:37 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id gd1so13092071pjb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nCKSgi5ghJh488few+daxz3n+frldGQMli1tF7tyziw=;
 b=Ly/cjxqyjPT9IndQDQLYI+ZjtL8lWCrmZudRv3GvHr7KjYTv4MVJzC8F4KqzUH1WZI
 ctE8rDupsFcURmpqMWiF944tW2wc65OHIXrkmqNN1RblfZ5SXZrHEPuXa7lrzgx0btu8
 +bCBc0Pcrtiwv8frSSD330az/t2Dp7qQy0uMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nCKSgi5ghJh488few+daxz3n+frldGQMli1tF7tyziw=;
 b=tZQTcg949OFiviWJc0+1VQjLoUwlTm4f/SFfEzgfnlMfclBNT+xi8Ws38DLOFjnkXQ
 O++wPQPW+jkjTxAoayXimbHZZKzBj7lA3t5LaLbZQ+MOihr66+bj90OegC8tcXT1vez2
 N9+liSxlAExKpn/K1V0vIFEd3Zu86WV3SSPeUCht8hPr9OfQPz44W3LSYO1+kzj/E+li
 U2lv7hxpjZO8Ygp2rDMzu4CDtPAT0EJRx71xmt3HJtKwj0oo6tmlw5ZEFzzlAZj6GUh/
 w+TuIrXcmeiY9/RHikJZ/QCYoQUJ/hz+Q55JneK02fx6p/z+hnZ/pIyGk6TD9gv746j6
 8UMA==
X-Gm-Message-State: AOAM5328WsIm8tbUy7s03SuA7jzuctQc3LTewiACeQj1MqQuDmbsqYCj
 fHYIJNatKW4RrjgocJ5LGD9FsQ==
X-Google-Smtp-Source: ABdhPJx/j2miMgCNt4Lz+zNAOBFsU+ps9maigyn2E1oMZ0cj6Y7pMkdlNEf4FN7+jd1e8jQNIgqnrw==
X-Received: by 2002:a17:90b:33c4:b0:1e8:6e2f:97a2 with SMTP id
 lk4-20020a17090b33c400b001e86e2f97a2mr10110935pjb.165.1654529077457; 
 Mon, 06 Jun 2022 08:24:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0a:5e4:e24:c8c4]) by smtp.gmail.com with ESMTPSA id
 h1-20020a655181000000b003fbaae74971sm10749306pgq.72.2022.06.06.08.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 08:24:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v4 0/8] Add a panel API to return panel orientation
Date: Mon,  6 Jun 2022 23:24:23 +0800
Message-Id: <20220606152431.1889185-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
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
Cc: Rob Clark <robdclark@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN()[1].

The orientation property is known earlier. For example, some panels
parse the property through device tree during probe.

The series add a panel API drm_panel_get_orientation() for drm/kms
drivers. The drivers can use the API to get panel's orientation, so they
can call drm_connector_set_panel_orientation() before drm_dev_register().

Panel needs to implement .get_orientation callback to return the property.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

Hsin-Yi Wang (8):
  drm/panel: Add an API drm_panel_get_orientation() to return panel
    orientation
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm/mediatek: Config orientation property if panel provides it

 drivers/gpu/drm/drm_panel.c                    |  9 +++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-edp.c              | 15 ++++++++++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c   | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  | 14 ++++++++++++++
 drivers/gpu/drm/panel/panel-lvds.c             | 15 +++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c           | 16 +++++++++++++++-
 include/drm/drm_panel.h                        | 10 ++++++++++
 9 files changed, 115 insertions(+), 2 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

