Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4291BCBC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 12:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C2010EC0A;
	Fri, 28 Jun 2024 10:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5987F10EC0B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:39:36 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sN90v-0003kD-Ub; Fri, 28 Jun 2024 12:39:34 +0200
Message-ID: <e8b91e2f18e6eaa722569dd21f559009064b1730.camel@pengutronix.de>
Subject: [GIT PULL] etnaviv-next for 6.11
From: Lucas Stach <l.stach@pengutronix.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel@pengutronix.de, etnaviv@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Fri, 28 Jun 2024 12:39:33 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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

Hi Dave, hi Sima,

please pull the following changes for the next merge window. Mostly
fixes, but as they concern new hardware support there's no need to rush
them into the current -rc.

Regards,
Lucas

The following changes since commit e67572cd2204894179d89bd7b984072f19313b03=
:

  Linux 6.9-rc6 (2024-04-28 13:47:24 -0700)

are available in the Git repository at:

  https://git.pengutronix.de/git/lst/linux tags/drm-etnaviv-next-2024-06-28

for you to fetch changes up to 704d3d60fec451f37706368d9d3e320322978986:

  drm/etnaviv: don't block scheduler when GPU is still active (2024-06-26 1=
5:33:25 +0200)

----------------------------------------------------------------
- fix i.MX8MP NPU clock gating
- workaround FE register cdc issues on some cores
- fix DMA sync handling for cached buffers
- fix job timeout handling
- keep TS enabled on MMUv2 cores for improved performance

----------------------------------------------------------------
Derek Foreman (1):
      drm/etnaviv: Read some FE registers twice

Krzysztof Kozlowski (1):
      drm/etnaviv: drop driver owner assignment

Lucas Stach (5):
      drm/etnaviv: don't disable TS on MMUv2 core when moving the linear wi=
ndow
      drm/etnaviv: switch devcoredump allocations to GFP_NOWAIT
      drm/etnaviv: fix DMA direction handling for cached RW buffers
      drm/etnaviv: reduce number of ktime_get calls in IRQ handler
      drm/etnaviv: don't block scheduler when GPU is still active

Philipp Zabel (3):
      drm/etnaviv: Update hardware headers from rnndb
      drm/etnaviv: Turn etnaviv_is_model_rev() into a function
      drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+

 drivers/gpu/drm/etnaviv/cmdstream.xml.h |  52 +++++++++++++++++++++++--
 drivers/gpu/drm/etnaviv/common.xml.h    |  12 +++---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c  |   5 +--
 drivers/gpu/drm/etnaviv/etnaviv_gem.c   |   6 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c   |  83 ++++++++++++++++++++++------=
------------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h   |   8 ++++
 drivers/gpu/drm/etnaviv/etnaviv_sched.c |   9 ++---
 drivers/gpu/drm/etnaviv/state.xml.h     | 103 ++++++++++++++++++++++++++++=
++++++++++++++--------
 drivers/gpu/drm/etnaviv/state_blt.xml.h |  22 +++++------
 drivers/gpu/drm/etnaviv/state_hi.xml.h  |  30 +++++++++------
 10 files changed, 238 insertions(+), 92 deletions(-)

