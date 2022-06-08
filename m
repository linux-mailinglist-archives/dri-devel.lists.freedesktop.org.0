Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81988542BDD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 11:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EDCC10E2F3;
	Wed,  8 Jun 2022 09:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6B010E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 09:48:23 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id t2so17186770pld.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 02:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xoj6Y6vsBc6hOtaXqeaeGFoJW8FafEOdkg5HbhVP/pQ=;
 b=ID4FZPatRWu6aKxAGWULNw3AmgDv3Cu0P9obA2A1AwWJXmfD1b1bk4RFCLFLnxOJib
 MpCD28iv6vJrfnKfQ/hNC9AfC4h6piTj0FtXXRNEncuhiyBwMcsIC+uLHVEh+DBKUH9H
 g/XjIEptHyQJv3NBf4eiNQu5uy1eX43PcqjJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xoj6Y6vsBc6hOtaXqeaeGFoJW8FafEOdkg5HbhVP/pQ=;
 b=jIur3QFd/A2Ve0w3cMSHzqZWFmXZXwtRP0pdsj8IRnq62SdjZvj+Zq/DBAabc2t2RD
 PHfL/L7JegYVKHZUBYRlLFSVZE+ANCPH4G3pCiZjUFChkf5VOA+rMHwape23lnq/DXrx
 uBot4GhASDmHYa+NWPYRCxj6Eb7i787Fv4ws6vp2/NNbNzymUq3s0Rj2zmvNdFkZ4PLs
 41zu9/Kicst3CJaETDovCYBczgxJ0fshNpi7KvUNspwS8usd6eUWbCOQSE4a0HBjtoGZ
 SLEogotL1OIfddXgK8ERu54ldQAgxTE5FkBsHYz+Y2+auHY3FN+X1p7LRx7KxFO+JCKx
 DpbQ==
X-Gm-Message-State: AOAM5304LAZw2fS+yaleTqckvFAbD43ngj7H/vFpGpo0CO3NIOtKHc8H
 O2v5dqFNzSgI7r/Bt46Uoefrzw==
X-Google-Smtp-Source: ABdhPJxPs9NcvxXZUKf1/v6rkHbKlBgtRBGn0bAl8jj+zewKhtrKaIRrG03sGONezyJrVcrnO9M6ZQ==
X-Received: by 2002:a17:902:bd83:b0:167:8dd5:6a5a with SMTP id
 q3-20020a170902bd8300b001678dd56a5amr9767295pls.114.1654681702602; 
 Wed, 08 Jun 2022 02:48:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c46b:e7b1:f6c8:5eb8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090a950a00b001e28e80a8d6sm13584038pjo.38.2022.06.08.02.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 02:48:22 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Hans de Goede <hdegoede@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v6 0/8] Add a panel API to set orientation properly
Date: Wed,  8 Jun 2022 17:48:08 +0800
Message-Id: <20220608094816.2898692-1-hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
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

Hsin-Yi Wang (8):
  drm/panel: Add an API to allow drm to set orientation from panel
  drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
  drm/panel: panel-edp: Implement .get_orientation callback
  drm/panel: lvds: Implement .get_orientation callback
  drm/panel: panel-simple: Implement .get_orientation callback
  drm/panel: ili9881c: Implement .get_orientation callback
  drm/panel: elida-kd35t133: Implement .get_orientation callback
  drm: Config orientation property if panel provides it

 drivers/gpu/drm/bridge/panel.c                | 36 +++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c        |  8 ++++-
 drivers/gpu/drm/drm_connector.c               | 32 +++++++++++++++++
 .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 12 +++++++
 drivers/gpu/drm/panel/panel-edp.c             | 13 ++++++-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  | 12 +++++++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 12 +++++++
 drivers/gpu/drm/panel/panel-lvds.c            | 13 +++++++
 drivers/gpu/drm/panel/panel-simple.c          | 14 +++++++-
 include/drm/drm_bridge.h                      |  3 ++
 include/drm/drm_connector.h                   |  4 +++
 include/drm/drm_panel.h                       |  9 +++++
 12 files changed, 165 insertions(+), 3 deletions(-)

-- 
2.36.1.255.ge46751e96f-goog

