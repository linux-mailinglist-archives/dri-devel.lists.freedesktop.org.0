Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE31B4783
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 16:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF24989F61;
	Wed, 22 Apr 2020 14:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2236E3FE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:41:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CAB61AD9F;
 Wed, 22 Apr 2020 14:40:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
 christian.koenig@amd.com, kraxel@redhat.com
Subject: [PATCH 0/2] drm/vram-helper: Reduce memory fragmentation
Date: Wed, 22 Apr 2020 16:40:53 +0200
Message-Id: <20200422144055.27801-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.26.0
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

VRAM memory can easily fragment, which leads to OOM errors on devices
with little VRAM available (i.e., all of them). This patchset addresses
the problem by placing BOs near the bottom and top ends of the VRAM and
keeping available areas near the middle.

Thomas Zimmermann (2):
  drm/vram-helper: Don't put new BOs into VRAM
  drm/vram-helper: Alternate between bottom-up and top-down placement

 drivers/gpu/drm/drm_gem_vram_helper.c | 30 +++++++++++++++++++++------
 include/drm/drm_gem_vram_helper.h     | 10 +++++----
 2 files changed, 30 insertions(+), 10 deletions(-)

--
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
