Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239953F900
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF16112B50;
	Tue,  7 Jun 2022 09:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF41112AEC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:05:55 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id y187so15294941pgd.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 02:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4LE7zrySWEA9gMurfRvYyAHVJx1m9VkHmbAjloR5rc=;
 b=OSmFZAqcOBYpVk9PtT//wYdshGIbZFqLmNvinrT7LM2bplu1QaPw+SAh9TblfHTm81
 tHtOg9TZdOLiWycsapflLUGU+qZw0lGKzsP2SvF0Sru6lkn3VoC4KdThYPVwFRvsn7IC
 DSxoneUuol+XxCC8sHbzH+zHV1oF13gvUW5o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4LE7zrySWEA9gMurfRvYyAHVJx1m9VkHmbAjloR5rc=;
 b=q0KtlQovzAtXo4AnsePcB4unUMPkUJaqumkI7q98LnWDZgRJBDeTp1mfB/i8bCfhHC
 +6221JJm1C2NG/DQO/shUUsq0stnsVso2wA0usiImCxiqmbzRAmbSpEgQN397p+kkb1B
 dwbH1Ufylknl62C7A/YNHJsrIi14s6hOGqNm0LjGfkpCwO7mfAWRjZKFvm3YFgh1lV5m
 klVdqHFci5GfgKtM6j3woFedy2Rpn/0MJKUyGAiV85p/phQw7CIn1qybVEIn4fo7aSlA
 q98ZvsA1V06VLrzREZSCSFDQiDe+WqTLNGCVDh00RrPVat85mVLNf4DxGLLw/45jtemG
 tvzg==
X-Gm-Message-State: AOAM532ts6cwBiTlykDVZwRp2udbwrnsh2Dc3lVksWCjQZl1O2ojzjrC
 cB8KoLwsd6Kwi8WtV3/OSUS0tw==
X-Google-Smtp-Source: ABdhPJw1n+xUkdGWbXx1cahLihtS+UTJFd1fPnlTaE3+N4brLzLb0z8zg/XQOnqI8aeTH/v2v9Cp7g==
X-Received: by 2002:a05:6a00:244a:b0:4fa:ebf9:75de with SMTP id
 d10-20020a056a00244a00b004faebf975demr28675288pfj.73.1654592755183; 
 Tue, 07 Jun 2022 02:05:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:40b7:55ce:10ee:c7a0])
 by smtp.gmail.com with ESMTPSA id
 t27-20020aa7947b000000b0051c0fe8fb8csm4507010pfq.95.2022.06.07.02.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:05:54 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v5 0/8] Add a panel API to set orientation properly
Date: Tue,  7 Jun 2022 17:05:41 +0800
Message-Id: <20220607090549.2345795-1-hsinyi@chromium.org>
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

The series add a panel API drm_connector_set_orientation_from_panel()
for drm/kms drivers. The drivers can call the API to set panel's
orientation before drm_dev_register().

Panel needs to implement .get_orientation callback to return the property.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

v4 of this series is "Add a panel API to return panel orientation":
https://lore.kernel.org/lkml/20220606152431.1889185-1-hsinyi@chromium.org/

Hsin-Yi Wang (8):
  drm/panel: Add an API to allow drm to set orientation from panel
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm/mediatek: Config orientation property if panel provides it

 drivers/gpu/drm/drm_connector.c               | 32 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dsi.c            | 15 +++++++++
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 12 +++++++
 drivers/gpu/drm/panel/panel-edp.c             | 13 +++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 12 +++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 +++++++
 drivers/gpu/drm/panel/panel-lvds.c            | 13 ++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 14 +++++++-
 include/drm/drm_connector.h                   |  4 +++
 include/drm/drm_panel.h                       |  9 ++++++
 10 files changed, 134 insertions(+), 2 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

