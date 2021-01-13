Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421D62F52FA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 20:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97F86EC06;
	Wed, 13 Jan 2021 19:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373266E896
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 19:03:43 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 13 Jan 2021 11:03:34 -0800
Received: from vertex.vmware.com (unknown [10.21.245.145])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 2F9A6202F1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 11:03:39 -0800 (PST)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/8] Misc cleanups and fixes for vmwgfx
Date: Wed, 13 Jan 2021 14:03:30 -0500
Message-ID: <20210113190338.292507-1-zackr@vmware.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Received-SPF: None (EX13-EDG-OU-001.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the same set I've sent earlier in the week. CI found a warning
and I wanted to give the systems a chance to compile/run the fixed
version before submitting it.

Roland Scheidegger (1):
  drm/vmwgfx: add Zack Rusin as maintainer

Zack Rusin (7):
  drm/vmwgfx: Remove stealth mode
  drm/vmwgfx: Switch to a managed drm device
  drm/vmwgfx: Cleanup fifo mmio handling
  drm/vmwgfx: Cleanup pci resource allocation
  drm/vmwgfx: Remove the throttling code
  drm/vmwgfx: Cleanup the cmd/fifo split
  drm/vmwgfx: Fix display register usage for some older configs

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/vmwgfx/Makefile               |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_binding.c       |  52 ++---
 .../vmwgfx/{vmwgfx_fifo.c => vmwgfx_cmd.c}    | 127 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |  22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c       |  40 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 220 +++++++++---------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |  92 +++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       |  22 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c         |  28 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_gmr.c           |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c         |  15 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c           |  10 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |  74 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |   9 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_marker.c        | 155 ------------
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c           |  16 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c       |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |  28 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c        |  24 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c            |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |  32 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_streamoutput.c  |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  40 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |   6 +-
 28 files changed, 434 insertions(+), 645 deletions(-)
 rename drivers/gpu/drm/vmwgfx/{vmwgfx_fifo.c => vmwgfx_cmd.c} (82%)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_marker.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
