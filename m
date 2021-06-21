Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9793AE3D8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1185C89D77;
	Mon, 21 Jun 2021 07:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC6F89A35
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:44:32 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id h26so1762507pfo.5
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 23:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYWJuyK1bUpXUNYlMG8y+I7VziTPyHJu5fz70XXNt7o=;
 b=zSsBl46XOGZe6gvr8o3kSN6cTIPzym+tkv/0ToxwVp80014S9cjzeYVaJTe7IchkT3
 KzO0Rrnnnb0txcx1hIR4xdteZ4vsg1vsE5Y2rnAl/G3FEoMMUe2KYfexSXNGEnx8OtaS
 ECt8k6XlbFEv1yvP34tPW4y704OmqqlCktx5y0nZXNr5gSEpSpphC9BAjnL5HgbeUDxo
 TAUXuI8SUtGC7pJsajJykD2gc7WtGj2LQTUZ5G9Rv5/EQwUDJDHyBKw9zMX/1Iq/8Y1Y
 i7XI+UqHlL1TCvgn8DVn8B21N4EHMGd/uaasHWQaYYI8Ky00kLsBtw7bGJMey2M24OBS
 7H9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qYWJuyK1bUpXUNYlMG8y+I7VziTPyHJu5fz70XXNt7o=;
 b=MRIRvgTvBtbYU1fXVwzj5KshputhwZdPho3XmYmzahIPgNH9y3iuq2au18YcKCATBj
 i6pZDyhF8njvUuE1EOILk0F54BDBofWtiQ8LND2GeQUSw7sUbTuQVFfIxJdIqMcndzp3
 VhVv1BUw0R7Vfgd/tXM0z1i8JwZnt9ZSUO26DLKUV0IwQmbRRHnnqJTgj/QxtKl/qGGS
 D8RJ5vjaDIRkW8h1dlWrLWGm+VigksIpeXFA5eBNwuhoamvqJc21Ef/SRRyTUSPIidxT
 fYk3CWNsYCKw1oHuzD0ddteiMQ/0XTx3w2NAXB5E/vpEa1dOOF5Ewzi4FnrOqox36zC+
 LLDA==
X-Gm-Message-State: AOAM533zCm9v6KWZC76ZGwfoa8ILYOaE5fDi+FSuXFW3adbguIkRgDlJ
 mAY/vqdwpV6m2fTktZr+QP8D6Fzux1JeqqPh
X-Google-Smtp-Source: ABdhPJyU0p37To1lNBWRzUCiNdn9mBwEeKIBU3xGQdaMaX1k0DNbUC1ZknIAhuYlvctiMOE5qL9jKg==
X-Received: by 2002:a62:ee16:0:b029:2fe:ffcf:775a with SMTP id
 e22-20020a62ee160000b02902feffcf775amr17476747pfi.59.1624257872488; 
 Sun, 20 Jun 2021 23:44:32 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
 by smtp.gmail.com with ESMTPSA id
 o34sm12744450pgm.6.2021.06.20.23.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:44:32 -0700 (PDT)
From: Tomohito Esaki <etom@igel.co.jp>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATH 0/4] [RFC] Support virtual DRM
Date: Mon, 21 Jun 2021 15:43:59 +0900
Message-Id: <20210621064403.26663-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Jun 2021 07:07:50 +0000
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello
Sorry, there was a typo in the dri-devel mail address, so I've resend it.
---

Virtual DRM splits the overlay planes of a display controller into multiple
virtual devices to allow each plane to be accessed by each process.

This makes it possible to overlay images output from multiple processes on a
display. For example, one process displays the camera image without compositor
while another process overlays the UI.

Virtual DRM driver doesn’t directly control the display hardware and has no
access to the physical bus. Instead, the virtual DRM driver issues requests to
the standard DRM device driver (parent) when the hardware needs to be
controlled. The parent is modified to notify the virtual DRM driver of
interruptevents from the display hardware. Therefore, in order to use virtual
DRM, each DRM device driver needs to add code to support virutal DRM.

The only driver supported in this patch series is rcar-du. This patch series
is divided into multiple. The first patch adds vDRM feature to DRM, and the
second patch support vDRM for the rcar-du driver. The other patches add
documentation.

In particular, I would appreciate your advice on the following points:
* virtual DRM generalization
  I've only tested with rcar-du, is there anything I should consider to make
  virtual DRM work with other drivers?

* Integration to upstream
  I think it is a good idea to add virtual DRM to the DRM core functionality,
  but I would appreciate any suggestions on what needs to be improved for
  integration to upstream.

* dumb_create and fb_create callback
  I think that the dumb_create and fb_create callbacks need to be done by the
  parent, and it is preferable to use the parent's callbacks as they are.
  However, since the dumb buffer needs to be registered in the parent and
  the fb handle needs to be registered in the drm_file of the vDRM, the
  dumb_create callbacks from the parent driver cannot be used as is.
  Therefore, the current implementation of the dumb_create callback is
  workarround.
  What do you think is the best way to deal with this issue?


Tomohito Esaki (4):
  Add Virtual DRM device driver
  rcar-du: Add support virtual DRM device
  dt-bindings: display: Add virtual DRM
  doc-rst: Add virtual DRM documentation

 .../devicetree/bindings/display/vdrm.yaml     |  67 ++
 Documentation/gpu/drivers.rst                 |   1 +
 Documentation/gpu/vdrm.rst                    |  51 ++
 drivers/gpu/drm/Kconfig                       |   7 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/rcar-du/Kconfig               |   4 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  42 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h        |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.h         |   3 +
 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c        | 191 ++++
 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h        |  67 ++
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  22 +
 drivers/gpu/drm/rcar-du/rcar_du_vsp.h         |   1 +
 drivers/gpu/drm/vdrm/vdrm_api.h               |  68 ++
 drivers/gpu/drm/vdrm/vdrm_drv.c               | 859 ++++++++++++++++++
 drivers/gpu/drm/vdrm/vdrm_drv.h               |  80 ++
 18 files changed, 1491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/vdrm.yaml
 create mode 100644 Documentation/gpu/vdrm.rst
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_vdrm.h
 create mode 100644 drivers/gpu/drm/vdrm/vdrm_api.h
 create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.c
 create mode 100644 drivers/gpu/drm/vdrm/vdrm_drv.h

-- 
2.25.1

