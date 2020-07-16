Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C279E2222F0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE05C6EC56;
	Thu, 16 Jul 2020 12:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EA76EC56
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:53:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B0968AEB6;
 Thu, 16 Jul 2020 12:53:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 yc_chen@aspeedtech.com
Subject: [PATCH v2 0/6] drm/ast: Managed MM
Date: Thu, 16 Jul 2020 14:53:47 +0200
Message-Id: <20200716125353.31512-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the second patchset for converting ast to managed DRM interfaces.
This one addresses memory management. There will be another, final round
of patches for converting DRM device structures as well.

Patch #1 introduces managed initialization for VRAM MM. Other drivers
using the VRAM helpers should be converted to this at some point.

Patches #2 to #4 do some preparation that make ast look slightly nicer.

Patch #5 fixes a long-standing bug that I found as part of the rework.
Posting the GPU requires information about the installed DRAM. So the DRAM
detection has to run before the GPU-posting code. This got reversed by a
fix in v4.11. The patch restores the original correct order of these
operations. As the GPU is usually posted by the VGA BIOS, the problem might
not have shown up in practice.

With all the cleanups in place, patch #6 switches memory management to
mnaged interfaces.

Tested on AST2100 HW.

v2:
	* reworked managed VRAM MM; new interface name, returns errno
	  code, improved documentation (Sam)

Thomas Zimmermann (6):
  drm/vram-helper: Managed vram helpers
  drm/ast: Rename ast_ttm.c to ast_mm.c
  drm/ast: Use managed VRAM-helper initialization
  drm/ast: Move VRAM size detection to ast_mm.c
  drm/ast: Initialize DRAM type before posting GPU
  drm/ast: Use managed MM initialization

 drivers/gpu/drm/ast/Makefile                |  2 +-
 drivers/gpu/drm/ast/ast_drv.h               |  2 -
 drivers/gpu/drm/ast/ast_main.c              | 45 ++---------
 drivers/gpu/drm/ast/{ast_ttm.c => ast_mm.c} | 77 ++++++++++++++-----
 drivers/gpu/drm/drm_gem_vram_helper.c       | 84 ++++++++++++---------
 include/drm/drm_gem_vram_helper.h           |  3 +
 6 files changed, 115 insertions(+), 98 deletions(-)
 rename drivers/gpu/drm/ast/{ast_ttm.c => ast_mm.c} (63%)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
