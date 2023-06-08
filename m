Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8512F7290B9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 09:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA2D10E637;
	Fri,  9 Jun 2023 07:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 550B110E5AF;
 Thu,  8 Jun 2023 10:27:58 +0000 (UTC)
Message-ID: <b761cb4c-5cb6-9228-ab99-c2fe4a6353a8@lankhorst.se>
Date: Thu, 8 Jun 2023 12:27:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-fixes, try 2.
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 09 Jun 2023 07:16:27 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Same pull request, just verifying tooling works as intended now. :-)

drm-misc-fixes for v6.4-rc6.

Seems to be mostly small fixes, just a few more for ivpu.

~Maarten

drm-misc-fixes-2023-06-08:
drm-misc-fixes for v6.4-rc6:
- resume and modeset fixes for ast.
- Fill in fb-helper vars more correctly.
- Assorted ivpu fixes.
- lima context destroy fix.
The following changes since commit e997c218ad736fd6f524d73a987bad9d94128d3d:

  accel/qaic: Fix NNC message corruption (2023-05-23 09:51:38 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-06-08

for you to fetch changes up to a3efabee5878b8d7b1863debb78cb7129d07a346:

  accel/ivpu: Fix sporadic VPU boot failure (2023-06-08 08:17:27 +0200)

----------------------------------------------------------------
drm-misc-fixes for v6.4-rc6:
- resume and modeset fixes for ast.
- Fill in fb-helper vars more correctly.
- Assorted ivpu fixes.
- lima context destroy fix.

----------------------------------------------------------------
Andrzej Kacprowski (2):
      accel/ivpu: Do not trigger extra VPU reset if the VPU is idle
      accel/ivpu: Fix sporadic VPU boot failure

Erico Nunes (1):
      drm/lima: fix sched context destroy

Geert Uytterhoeven (1):
      drm/fb-helper: Fix height, width, and accel_flags in fb_var

Jammy Huang (2):
      drm/ast: Fix long time waiting on s3/s4 resume
      drm/ast: Fix modeset failed on DisplayPort

Randy Dunlap (1):
      accel/ivpu: ivpu_ipc needs GENERIC_ALLOCATOR

Stanislaw Gruszka (2):
      accel/ivpu: Reserve all non-command bo's using DMA_RESV_USAGE_BOOKKEEP
      accel/ivpu: Do not use mutex_lock_interruptible

 drivers/accel/ivpu/Kconfig           |  1 +
 drivers/accel/ivpu/ivpu_hw_mtl.c     | 22 +++++++++++----
 drivers/accel/ivpu/ivpu_hw_mtl_reg.h |  1 +
 drivers/accel/ivpu/ivpu_ipc.c        |  4 +--
 drivers/accel/ivpu/ivpu_job.c        | 21 +++++++++-----
 drivers/accel/ivpu/ivpu_mmu.c        | 22 ++++-----------
 drivers/gpu/drm/ast/ast_dp.c         | 55 +++++++++++-------------------------
 drivers/gpu/drm/ast/ast_drv.h        |  5 +---
 drivers/gpu/drm/ast/ast_main.c       | 11 ++++++--
 drivers/gpu/drm/ast/ast_mode.c       | 15 ++++++++--
 drivers/gpu/drm/ast/ast_post.c       |  3 +-
 drivers/gpu/drm/drm_fb_helper.c      | 12 ++++----
 drivers/gpu/drm/lima/lima_sched.c    |  2 +-
 13 files changed, 90 insertions(+), 84 deletions(-)
