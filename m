Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631CA40D91E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:54:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1195A6EB73;
	Thu, 16 Sep 2021 11:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEC96EB73
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 11:54:06 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1mQpxs-0007SA-Ls; Thu, 16 Sep 2021 13:54:04 +0200
Message-ID: <729a561b6cfed090457bcc856a9e14ed6209fe21.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-fixes for 5.15
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org, 
 kernel@pengutronix.de
Date: Thu, 16 Sep 2021 13:54:03 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Dave, Daniel,

please pull those etnaviv changes as fixes for the 5.15 release
series. 

Fixes a very annoying issue where the driver view of the MMU state gets
out of sync with the actual hardware state across a runtime PM cycle,
so we end up restarting the GPU with the wrong (potentially already
freed) MMU context. Hilarity ensues.

Regards,
Lucas

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux etnaviv/fixes

for you to fetch changes up to f2faea8b64125852fa9acc6771c07fc0311a039b:

  drm/etnaviv: add missing MMU context put when reaping MMU mapping (2021-09-16 10:35:37 +0200)

----------------------------------------------------------------
Lucas Stach (8):
      drm/etnaviv: return context from etnaviv_iommu_context_get
      drm/etnaviv: put submit prev MMU context when it exists
      drm/etnaviv: stop abusing mmu_context as FE running marker
      drm/etnaviv: keep MMU context across runtime suspend/resume
      drm/etnaviv: exec and MMU state is lost when resetting the GPU
      drm/etnaviv: fix MMU context leak on GPU reset
      drm/etnaviv: reference MMU context when setting up hardware state
      drm/etnaviv: add missing MMU context put when reaping MMU mapping

 drivers/gpu/drm/etnaviv/etnaviv_buffer.c     |  3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c        |  3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  3 +--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        | 43 +++++++++++++++++++++++++------------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_iommu.c      |  4 ++++
 drivers/gpu/drm/etnaviv/etnaviv_iommu_v2.c   |  8 ++++++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h        |  4 +++-
 9 files changed, 45 insertions(+), 25 deletions(-)


