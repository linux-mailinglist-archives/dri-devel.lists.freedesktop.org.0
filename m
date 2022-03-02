Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D04CA8FD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BBC10E133;
	Wed,  2 Mar 2022 15:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD34410E133
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:24:41 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 5A9DE2838F8;
 Wed,  2 Mar 2022 15:24:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1646234679; bh=NsBCPKIraDpwZSHpysiv0ZBxwpip1qIhkrPwOCfMTpQ=;
 h=From:To:Cc:Subject:Date:From;
 b=aZ5d1OAuUBEB0Tz5F6XgFL+hEDYZZT6LyOVArLVXo8srMWfnU/DTX0olvGXZmqWi7
 6AsioIM6jB0wFro/kRXC1vNoQN5O4VQIJlaWMsV+f10add+xxtX7YEk7HGkKenZ9oX
 jHhM0kUvHRQs8egOfZ/9FDPDHrONHFklgfRThQdbOZALOU3ds4/hnLjTOO/Xus0DS+
 s8knqJQsv0d2MGvWaFku531WS1nJwPPYgc9cu6xsW+HJ0X6qWmy4gyvmKlxpxL3g64
 CEe0DJWBB6vkMhykTTLmjL8A2p1ko4wXhEjjMxA6MpEDvP6cBzxoE2RweGP3g8/HU0
 LNOCOBC8MSSnQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/vmwgfx: 3D on arm64 and large cursor support
Date: Wed,  2 Mar 2022 10:24:18 -0500
Message-Id: <20220302152426.885214-1-zack@kde.org>
X-Mailer: git-send-email 2.32.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Series finishes 3D support on arm64 with vmwgfx. With this and changes
that add svga3 pci id's to Mesa3D - OpenGL 4.3 and GLES 3.1 work smoothly
on arm64.
                                                                           
Most changes are not svga3 specific but rather could be classified as
generic improvements. That's in particular true for support for curso
mobs which enable large cursor support on both svga2 and svga3 and fixing
initialization of drm_mode_fb_cmd2 struct.

Martin Krastev (1):
  drm/vmwgfx: Add support for CursorMob and CursorBypass 4

Zack Rusin (7):
  drm/vmwgfx: Cleanup multimon initialization code
  drm/vmwgfx: Print capabilities early during the initialization
  drm/vmwgfx: Fix fencing on SVGAv3
  drm/vmwgfx: Allow querying of the SVGA PCI id from the userspace
  drm/vmwgfx: Initialize drm_mode_fb_cmd2
  drm/vmwgfx: Implement MSI/MSI-X support for IRQs
  drm/vmwgfx: Stop using surface dma commands on most configurations

 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c   |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c   |  20 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h   |  23 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c    |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c |  28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c |  27 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c   |  80 ++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c   | 407 +++++++++++++++++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h   |  28 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c   |  36 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c  |  17 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c  |  27 +-
 include/uapi/drm/vmwgfx_drm.h         |   9 +-
 13 files changed, 538 insertions(+), 168 deletions(-)

-- 
2.32.0

