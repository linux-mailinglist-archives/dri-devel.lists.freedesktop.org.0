Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CF94DD61E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 09:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C8910E161;
	Fri, 18 Mar 2022 08:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5922910E161
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 08:29:12 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so3891595pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZerwMZnU5WRGenUWw/mrV6k1v4q9EhMydhshaosUPPY=;
 b=T2JR3/lfNpGKK7qASyH6+wW97BBOWNrh7oRmcfnmWSqfgDCBAwtyhw6+z45yNahIVS
 eT7DsjSjEvXTznTI7qXdOGBWQS7eFEssrIgW0IBCHbilYllZhz4kW2weUObdWIu+O4X8
 KFf9ujVOZylaa3ymqWZq66ufRx7SrPJ6hbHD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZerwMZnU5WRGenUWw/mrV6k1v4q9EhMydhshaosUPPY=;
 b=lSr5zhnUWiPc6r1szoJCVgXygSvihsxL9Mant7wqDEb+Gi+SitTie3k/1YG1ea5v03
 skvlVnN5XwBgQzSkSx5+ZLIYovSdrw+yhIiwJXDj20fFz7BrIgG1nV4F9w1wMB+EI1MX
 yVh3Te8qVDYrHPlVEluZzbFMjM4EFQCAxqWeQWOx6ynSvogO+LvZ5DGJKYk7glaVfQRt
 0Oyx2ofddZWqEpiB3IKveHRUmcQ6+J9kwVZcLl9t5nlcsIHpfUStgGs6dBF2DXKH9kMi
 em2qsmwzCnH0r/o1qb1WWmzBpM+MMxUY+D0oly50slbiogoFKtt8DghkTFbBEDBQj2F0
 LI/Q==
X-Gm-Message-State: AOAM533VHQ50lUjtoAvszZudde1xKPlSIh3OAUldL/CJrwJ2n5GIGNhB
 WfieHfj3ru56qtxBGCAPTdd2pjiOvbRE8g==
X-Google-Smtp-Source: ABdhPJxSlFaBTNqCJx14g1bDgmJ+YaO+Pg4LlRrGaMoIJ9J2tXiqSbojTVGwkQAUer85nUyOr+wzKQ==
X-Received: by 2002:a17:90a:ba10:b0:1bf:6900:2c5d with SMTP id
 s16-20020a17090aba1000b001bf69002c5dmr20601000pjr.36.1647592151148; 
 Fri, 18 Mar 2022 01:29:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:435a:ce78:7223:1e88])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a056a00084200b004f761a7287dsm9404044pfk.131.2022.03.18.01.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 01:29:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 0/4] Separate panel orientation property creating and value
 setting
Date: Fri, 18 Mar 2022 15:48:21 +0800
Message-Id: <20220318074825.3359978-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
orientation. Panel calls drm_connector_set_panel_orientation() to create
orientation property and sets the value. However, connector properties
can't be created after drm_dev_register() is called. The goal is to
separate the orientation property creation, so drm drivers can create it
earlier before drm_dev_register().

After this series, drm_connector_set_panel_orientation() works like
before, so it won't affect other drm drivers. The only difference is that
some drm drivers can call drm_connector_init_panel_orientation_property()
earlier.

Hsin-Yi Wang (4):
  gpu: drm: separate panel orientation property creating and value
    setting
  drm/mediatek: init panel orientation property
  drm/msm: init panel orientation property
  arm64: dts: mt8183: Add panel rotation

 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
 drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
 drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
 include/drm/drm_connector.h                   |  2 +
 5 files changed, 59 insertions(+), 13 deletions(-)

-- 
2.35.1.894.gb6a874cedc-goog

