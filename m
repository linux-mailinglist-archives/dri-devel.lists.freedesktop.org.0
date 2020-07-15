Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7022136E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 19:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B466EBE1;
	Wed, 15 Jul 2020 17:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0DF46E3CE;
 Wed, 15 Jul 2020 17:17:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A8A94AC37;
 Wed, 15 Jul 2020 17:18:01 +0000 (UTC)
Date: Wed, 15 Jul 2020 19:17:56 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200715171756.GA18606@linux-uq9g>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here is the PR for the current drm-misc-fixes. The aspeed fix is only
about dmesg noise. The dmabuf locking appears to be a real bug.

Best regards
Thomas

drm-misc-fixes-2020-07-15:
 * aspeed: setup fbdev console after registering device; avoids warning
   and stacktrace in dmesg log
 * dmabuf: protect dmabuf->name with a spinlock; avoids sleeping in
   atomic context
The following changes since commit 00debf8109e5fad3db31375be2a3c515e1461b4a:

  drm/hisilicon/hibmc: Move drm_fbdev_generic_setup() down to avoid the splat (2020-07-08 09:08:22 +0000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-07-15

for you to fetch changes up to 6348dd291e3653534a9e28e6917569bc9967b35b:

  dmabuf: use spinlock to access dmabuf->name (2020-07-10 15:39:29 +0530)

----------------------------------------------------------------
 * aspeed: setup fbdev console after registering device; avoids warning
   and stacktrace in dmesg log
 * dmabuf: protect dmabuf->name with a spinlock; avoids sleeping in
   atomic context

----------------------------------------------------------------
Charan Teja Kalla (1):
      dmabuf: use spinlock to access dmabuf->name

Guenter Roeck (1):
      drm/aspeed: Call drm_fbdev_generic_setup after drm_dev_register

 drivers/dma-buf/dma-buf.c               | 11 +++++++----
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c |  3 +--
 include/linux/dma-buf.h                 |  1 +
 3 files changed, 9 insertions(+), 6 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
