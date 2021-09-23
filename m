Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968844158C4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0596ECE5;
	Thu, 23 Sep 2021 07:07:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536756ECE5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 07:07:05 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d6so14070688wrc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GWAsl4l64TQBtsmcfug9p1yGttFyM9Ke67LZF01xVU=;
 b=d9BuzkQ4r4tP5eRWDOMRiIPSIfhlfsoyCCF+cNGUvGn07I1BwTOcpGUCMrCVzi/TEW
 eludHV8OstE6OBnKI4OyMUuhifZDSLAvY465HQBx38ydDMB1y1+JBn9+xqqvowRE8qN/
 7Rgss8Pts8eUU6DuMYkj6ZSFRND3sDk21e9ppIu7Eo3gQ57XfSdyPQip2/Us8qrQInEV
 NGVzPYy4OyyNzLm2CBtpZE7vSVGo4XleSk7sBiCtsCzC70jBPoFO1ThEDBQfkADjdO/+
 /FODRtwF3tMr1PxxskKxcZW9cV6MrYW8nKaW2WY17DtzDrwa9JiJ1XB+g+Fg1GA/fT8w
 0wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5GWAsl4l64TQBtsmcfug9p1yGttFyM9Ke67LZF01xVU=;
 b=3V44m5ngEh9aZUMD7wKHaEYQNqOv3asaKesTp7nC3We1QRqzcrAIyiLuk3z7kaNRa6
 rfYJy3em1K9du1WZzEcGSs95BAuTOZLxmJFmfJg4YXvNfMFk7k6wsY14BEURAtrA+nQ+
 KprebKk4wHAZCL9l30Ivz5UsE0GDWVmuiCUTVrUhyvN00mTf4RXUYKhnZ6L8cdo2kNKp
 BRHrFyIza3OzCEUew8sZS99Olhp0yTKb5SVnkMXczmEhZQfAyc+AdqTmDUHe5SoTTWby
 R63BB1DvOTAYtnH/UtqfxHTW8IX8Qyk1ip2ntLUUDEfmE13y8h+h+doRv31qFD0zgxUY
 wrbw==
X-Gm-Message-State: AOAM532nl2lZfLd2GGDDJJQunEVRfyoXRdGiXjoneM6sfKJvpBs++2T9
 ZQtHKOvWbkg3SgmaThi3+9fjXg==
X-Google-Smtp-Source: ABdhPJzJXo/zSlxISVuBtECbdiljJaMAtg8mhirRu9qOf52JpS4J5LwiHunEEHKRXiTq0yePT2icuw==
X-Received: by 2002:adf:ec4b:: with SMTP id w11mr3091248wrn.389.1632380823641; 
 Thu, 23 Sep 2021 00:07:03 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:74cf:b054:76f4:7692])
 by smtp.gmail.com with ESMTPSA id d2sm4380357wrc.32.2021.09.23.00.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 00:07:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: tomba@kernel.org
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v5 0/8] drm/omap: Add virtual-planes support
Date: Thu, 23 Sep 2021 09:06:53 +0200
Message-Id: <20210923070701.145377-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2183; h=from:subject;
 bh=yOy5rWZ5ENlqECjbFwkSYwKDX6hpYWcemiBYkbWEeNs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhTCceglpcB1dj9PYGpYa5ZkCO0lTrijPyuaDPsRyi
 x8nXJ6iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYUwnHgAKCRB33NvayMhJ0W26D/
 42qZZtIUkKfXE+zeZeenqKivzrk/RLby68iBMhBX+Uth+xSa9ZmVyrn6dDEIEIPQnh/Hd+UjyU/1Hv
 XoBm2eatKhFoKW72clHIuNuocTEXGqTW6B42PQyENIwYD3TMxhDi+FM/mAe85U9v0S9eBITQMiEm8K
 0U1q76x06HrR09+i0sEmBtsDVhYe7lvAdOoDFerkToRbHpf8KT6r3aaxZ/CCNBm75VhpNipSBbCo4J
 ikYm/woKxBlcjxDqwjd93mmlwnY7ug4dbJosf4JqTurmWzgyPMe3zKs6u8uAVTENn2inKLDdYAeU90
 mjmZf7OAzxXnLV2Bjz8pmcjDdk5qYirz4YjncdarFbjU1GAdLdNbMXVJJQVlYYP4LLU9t+FYRNDTZ9
 vyEVtt3KLK1JIR4LakD5LpEjx1vtU79pXjK0giIRxewOK4d4McH5l+BahcfbQpDrWLJVUd+w+Bqoys
 7+Rh+tzTHTEgOlrE5X+cTlhos63WcGXR6Op3PoNHRYg9LUuOeVMYN1mBTnnnWMUf/hIRgtzvLerMgM
 P/hiKmJEG9iKPdmDYxhKp5fTQONdM1obR8QaPKZnWQ98vE3QNxPAn2/kF0U6ns3H/su2P20cncPB18
 /hehqOaHi29JbDFWZU24zyXMpyQRfPNpCiHIi3TTh+UomFFxBlM9vvhMnp7Q==
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

This patchset is the follow-up the v4 patchset from Benoit Parrot at [1].

This patch series adds virtual-plane support to omapdrm driver to allow the use
of display wider than 2048 pixels.

In order to do so we introduce the concept of hw_overlay which can then be
dynamically allocated to a plane. When the requested output width exceed what
be supported by one overlay a second is then allocated if possible to handle
display wider then 2048.

This series replaces an earlier series which was DT based and using statically
allocated resources. 

This implementation is inspired from the work done in msm/disp/mdp5
driver.

Changes since v4 at [1]:
- rebased on v5.15-rc2
- adapted to drm_atomic_get_new/old_plane_state()
- tested on Beagle-x15
- checked for non-regression on Beagle-x15
- removed unused "state" variable in omap_global_state

[1] https://lore.kernel.org/all/20181012201703.29065-1-bparrot@ti.com/

Benoit Parrot (8):
  drm/omap: Add ability to check if requested plane modes can be
    supported
  drm/omap: Add ovl checking funcs to dispc_ops
  drm/omap: introduce omap_hw_overlay
  drm/omap: omap_plane: subclass drm_plane_state
  drm/omap: Add global state as a private atomic object
  drm/omap: dynamically assign hw overlays to planes
  drm/omap: add plane_atomic_print_state support
  drm/omap: Add a 'right overlay' to plane state

 drivers/gpu/drm/omapdrm/Makefile       |   1 +
 drivers/gpu/drm/omapdrm/dss/dispc.c    |  31 +-
 drivers/gpu/drm/omapdrm/dss/dss.h      |   5 +
 drivers/gpu/drm/omapdrm/omap_drv.c     | 189 ++++++++++++-
 drivers/gpu/drm/omapdrm/omap_drv.h     |  28 ++
 drivers/gpu/drm/omapdrm/omap_fb.c      |  33 ++-
 drivers/gpu/drm/omapdrm/omap_fb.h      |   4 +-
 drivers/gpu/drm/omapdrm/omap_overlay.c | 254 +++++++++++++++++
 drivers/gpu/drm/omapdrm/omap_overlay.h |  41 +++
 drivers/gpu/drm/omapdrm/omap_plane.c   | 375 +++++++++++++++++++++----
 drivers/gpu/drm/omapdrm/omap_plane.h   |   1 +
 11 files changed, 903 insertions(+), 59 deletions(-)
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.c
 create mode 100644 drivers/gpu/drm/omapdrm/omap_overlay.h

-- 
2.25.1

