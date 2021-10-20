Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9F8434B50
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 14:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 038BE89503;
	Wed, 20 Oct 2021 12:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE6B89503
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 12:39:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso9910985wmb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 05:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfqEwxQ0oeVce6XN/FotGcdbRwWTkZxc+4NzjkrPbLY=;
 b=iLOOkhdfedcjdoYDlO1FDqiD2TfL5IoaiJJDviRSsHgdh2Z029yz03Ca3ocnHGjqlU
 31yNNCtO5Qz3I9r74gYFlgIKegt7gn0s85y3qgeTu+mozyKKVk9E2wlHSTJZkum4fyj+
 R3shv/VMI3B0eapO4GtZOEbyZJnTeqtUNbmJVp8qbU7bP0VMy6IsanpsMaDXO4avwF78
 WUc0THvvukidKtbe7S19w0G/9TnBiozXMVkBaD3X66OHUu70vYMlwZtQkQ8+mB94O5/7
 Y/8MusDe8aeO8Flw1Ef57eEHghtFIDVi1q/r5Yd70riUb7ZKfXLo2tZ4y5nWy6QPyAHs
 t7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfqEwxQ0oeVce6XN/FotGcdbRwWTkZxc+4NzjkrPbLY=;
 b=eKWewIgdLeZrI4xSlXnqjkxrSs8espamCODiPvh1GGPyNu4kH2XCaQYhmyMk44JXLm
 ZuDEFtr5HWSMQlXNM+TOxLQXXatdZG+Ds8t2wXtWCacfEGyBifXpKOZCTYWz6uAQLGN4
 S14QqO1RchD4L+Ai3EYXJ+9dmy3PtVcwX3kPwMdV0QpFvb4fpJCB+/7wUSCPiF8nZ0XV
 IkTDmK/N4MjhpQ5K4ujdjxkTf1h9bDeniY1x+CKwaIqAqi62ah4twpyb6CoEg5bhdikO
 GmRY1RkSMhNtOoh7AKmi45NGmMvH5+N9irwuO5axI2CQINBR5X5S4zYWqFTPEWgBhobV
 nDcA==
X-Gm-Message-State: AOAM530HqLvZEz81MCdapkK+JNFh47ruLAuGFzAgu9jz8A7zySfVvpf/
 tyC5VjZy/FCNvwFG1cZpkoxNtA==
X-Google-Smtp-Source: ABdhPJwl8Ts87hZRgxL1JkpipJUybRCLe/XlIvuoep4YqIHcPr/Gzp/nQxCIUNvKWJD2Q2HqcRVy1g==
X-Received: by 2002:adf:aad7:: with SMTP id i23mr50717247wrc.209.1634733590344; 
 Wed, 20 Oct 2021 05:39:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d31f:1512:8915:e439])
 by smtp.gmail.com with ESMTPSA id b19sm5342680wmj.9.2021.10.20.05.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 05:39:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch,
	Laurent.pinchart@ideasonboard.com,
	sam@ravnborg.org
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/6] drm/meson: rework encoders to pass ATTACH_NO_CONNECTOR
Date: Wed, 20 Oct 2021 14:39:41 +0200
Message-Id: <20211020123947.2585572-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3018; h=from:subject;
 bh=cWFwjmC/5GnLgzWGXoT3IdxliBahsmwbo6WyE42OGn4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhcA31L8TQmWY5npZGtnPH7O5j5oqdb7wVGthRzvCV
 gB+2cfSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYXAN9QAKCRB33NvayMhJ0eQuD/
 4gGveSkz1ZuRkc55e/MBJloENZ5rwdQTwFyWoCJuxIEdrOHIsJ9vSng549esl2i95cLc9fwTX9T8Gh
 V8gDYqmJ2O+jdN/4tqEHNBfdXC5rKym0FNNW2gpUltewCoBqwVpl6vxVvUOGuT/Vtn/Sw+atD6ix4j
 lcgu9Pxr8lXtLGfVJNAoQ69Z0Dt2Sz3AzYc+EGEpOCFZ38iSlwCMNwvo7LhFeQ2t2Kqa7nHAEX0jy3
 PMDUrb3d9OOFJhpYnqg3+9S8hBqp+wX7rkdCEXyJueHDUPPenv7DdhPPPp9EH11HQolhBn8O7cm1zP
 mZKeoI42V4nmK3hsjaq8Sj4ybNyZ2GjiYPJVnm0g6MhRMaj9BUN6Nh4IOQ76JqEVpYapWWRqY6EpVV
 YEzLNl/NP8ylijWW7Ocxsd2L5IG1xQ+KxKQV5HOGlZgheIfsksftZsU0Ggus81xn+jR1Uzs6/l+v6l
 1/RC1jliV7ZzLdRb2ha2tBnwihSfLOve38RntsMmjXNzth6iCoBjBiYdJSDbEFF2foQ59wx5ZS5sPN
 BG7vEhlXnd/HDHcbuW9dOC3uQ2JgoIygsHG2i6JEFzpmF1Z7Gw+0xTKLySzJo1rbg/eRIjLZAhyePp
 fTMihTnnuRMgi1kPAIvaAymKLHL236RpPF6+2aybeXTpbdBkOxK563H+yMhQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

This serie finnally reworks the drm/meson driver by extracting the encoders
in their own file and moves to bridge-only callbacks.

This permits passing the ATTACH_NO_CONNECTOR bridge attach flag and finally
use the CVBS & HDMI display-connector driver.

This will ease Martin Blumenstingl writing the HDMI transceiver driver for
the older Meson8/8b SoCs, and sets the proper architecture for the work in
progress MIPI-DSI support.

Finally, this serie will path the way to a removal of the device component
and use the drmm memory management.

Changes since v2 at [2]:
 - patch 1: no changes
 - patch 2: added martin's ack
 - patch 3: moved ->enable & ->disable to atomic, added sam's & martin's acks
 - patch 4: added martin's ack
 - patch 5: added martin's ack
 - patch 6: moved ->enable & ->disable to atomic, added martin's ack

Changes since v1 at [1];
 - patch 1: added sam's review tag, fixed include order, fixed doc wording
 - patch 2: added sam's ack tag, switched to dev_dbg()
 - patch 3: moved mode_set to atomic_enable, removed DRM_DEBUG, fixed include order
 - patch 4: added sam's ack tag & applied to drm-misc-next
 - patch 5 & 6: added sam's ack tag
 - patch 7: added sam's review tag, stopped saving connector, moved mode_set to atomic_enable,
 	added missing atomic state callbacks, fixed include order, switched to dev_dbg/dev_err

[1] https://lore.kernel.org/r/20211014152606.2289528-1-narmstrong@baylibre.com
[2] https://lore.kernel.org/r/20211015141107.2430800-1-narmstrong@baylibre.com

Neil Armstrong (6):
  drm/bridge: display-connector: implement bus fmts callbacks
  drm/meson: remove useless recursive components matching
  drm/meson: split out encoder from meson_dw_hdmi
  drm/meson: encoder_hdmi: switch to bridge
    DRM_BRIDGE_ATTACH_NO_CONNECTOR
  drm/meson: rename venc_cvbs to encoder_cvbs
  drm/meson: encoder_cvbs: switch to bridge with ATTACH_NO_CONNECTOR

 drivers/gpu/drm/bridge/display-connector.c    |  86 ++++
 drivers/gpu/drm/meson/Kconfig                 |   2 +
 drivers/gpu/drm/meson/Makefile                |   3 +-
 drivers/gpu/drm/meson/meson_drv.c             |  71 ++-
 drivers/gpu/drm/meson/meson_dw_hdmi.c         | 342 +-------------
 drivers/gpu/drm/meson/meson_encoder_cvbs.c    | 284 +++++++++++
 ...meson_venc_cvbs.h => meson_encoder_cvbs.h} |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 446 ++++++++++++++++++
 drivers/gpu/drm/meson/meson_encoder_hdmi.h    |  12 +
 drivers/gpu/drm/meson/meson_venc_cvbs.c       | 293 ------------
 10 files changed, 881 insertions(+), 660 deletions(-)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_cvbs.c
 rename drivers/gpu/drm/meson/{meson_venc_cvbs.h => meson_encoder_cvbs.h} (92%)
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.c
 create mode 100644 drivers/gpu/drm/meson/meson_encoder_hdmi.h
 delete mode 100644 drivers/gpu/drm/meson/meson_venc_cvbs.c


base-commit: f6632721cd6231e1bf28b5317dcc7543e43359f7
-- 
2.25.1

