Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0564A2181B3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3076E873;
	Wed,  8 Jul 2020 07:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DFD6E89E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 07:49:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 26118AE83;
 Wed,  8 Jul 2020 07:49:14 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, noralf@tronnes.org,
 emil.l.velikov@gmail.com, yc_chen@aspeedtech.com
Subject: [PATCH 0/6] drm/ast: Managed MM
Date: Wed,  8 Jul 2020 09:49:06 +0200
Message-Id: <20200708074912.25422-1-tzimmermann@suse.de>
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

Thomas Zimmermann (6):
  drm/vram-helper: Managed vram helpers
  drm/ast: Rename ast_ttm.c to ast_mm.c
  drm/ast: Use managed VRAM-helper initialization
  drm/ast: Move VRAM size detection to ast_mm.c
  drm/ast: Initialize DRAM type before posting GPU
  drm/ast: Use managed MM initialization

 drivers/gpu/drm/ast/Makefile                |  2 +-
 drivers/gpu/drm/ast/ast_drv.h               |  2 -
 drivers/gpu/drm/ast/ast_main.c              | 45 ++-----------
 drivers/gpu/drm/ast/{ast_ttm.c => ast_mm.c} | 73 ++++++++++++++++-----
 drivers/gpu/drm/drm_gem_vram_helper.c       | 68 ++++++++++++++-----
 include/drm/drm_gem_vram_helper.h           |  4 ++
 6 files changed, 118 insertions(+), 76 deletions(-)
 rename drivers/gpu/drm/ast/{ast_ttm.c => ast_mm.c} (64%)

--
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
