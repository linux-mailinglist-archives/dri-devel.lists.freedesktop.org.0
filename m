Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA501541B7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 11:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A57089F63;
	Thu,  6 Feb 2020 10:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE6289F63;
 Thu,  6 Feb 2020 10:19:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6E05B146;
 Thu,  6 Feb 2020 10:19:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/4] drm/nouveau: Remove struct nouveau_framebuffer
Date: Thu,  6 Feb 2020 11:19:38 +0100
Message-Id: <20200206101942.1412-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.0
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
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All fields in struct nouveau_framebuffer appear to be obsolete. The
data structure can be replaced by struct drm_framebuffer entirely.

Patch 1 removes several unused fields from struct nouveau_framebuffer.

Patch 2 moves the field vma to struct nouveau_fbdev. The information
in vma is only relevant for fbdev emulation, and as such he field is
only used there.

Patch 3 removes nvbo from struct nouveau_framebuffer. The nouveau
buffer object is based on gem, and as such should be stored in obj[0]
of struct drm_framebuffer. This also enables the use of several generic
GEM framebuffer functions.

Finally patch 4 removes struct nouveau_framebuffer. At this point it's
merely a wrapper around struct drm_framebuffer.

The patchset has been smoke-tested on NV34 HW by running fbcon and X11.

Future directions: There are still functions for creating frameuffers.
With further refinements of nouveau's fbcon code, GEM framebuffer helpers
could be used here.

Thomas Zimmermann (4):
  drm/nouveau: Remove unused fields from struct nouveau_framebuffer
  drm/nouveau: Move struct nouveau_framebuffer.vma to struct
    nouveau_fbdev
  drm/nouveau: Remove field nvbo from struct nouveau_framebuffer
  drm/nouveau: Remove struct nouveau_framebuffer

 drivers/gpu/drm/nouveau/dispnv04/crtc.c    | 19 ++++-----
 drivers/gpu/drm/nouveau/dispnv04/disp.c    | 21 +++++-----
 drivers/gpu/drm/nouveau/dispnv04/overlay.c | 21 +++++-----
 drivers/gpu/drm/nouveau/dispnv50/wndw.c    | 45 ++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_display.c  | 47 ++++++----------------
 drivers/gpu/drm/nouveau/nouveau_display.h  | 25 +++---------
 drivers/gpu/drm/nouveau/nouveau_fbcon.c    | 42 ++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_fbcon.h    |  3 ++
 drivers/gpu/drm/nouveau/nv50_fbcon.c       |  9 ++---
 drivers/gpu/drm/nouveau/nvc0_fbcon.c       |  9 ++---
 10 files changed, 108 insertions(+), 133 deletions(-)

--
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
