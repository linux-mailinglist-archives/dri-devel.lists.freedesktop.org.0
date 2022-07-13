Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A93573BAF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581D8E841;
	Wed, 13 Jul 2022 17:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69C818FFC9
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=gvXokCdEh4GHQb3GFyaTb4n/3n36WKAwVpTqm7iccIo=;
 b=BXAmKehi6y3mpm4DVB2VCyTloVxjvkC5tqoel7b1+LI2zQbg7LTEMr29gfWimsf98TP3u4IMUmXPr
 ztOmcWSvWJaEYiIVvFRNlIkL7jyau9zOracB9FhO92DBIuGIdN1yw5IpAbuMIcJRUgbSls6aMiJNl/
 RWVf+G3/GkOyd9PDFYr0v5Ig6jFLRKYm+87W64o90dLolzxeHSdMZ9DravQ4uyDZY4EXumI8W3gzCN
 5oXgpfPVPWU+DS1HDNIrehV+P3SOGTXrmMjECItg3h+fhgMIaUiK1cDCODSFQho9PgmUz3ALbrpHXt
 J5DjPHZ8WjzowiexLbnBtSvUXZksNJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=gvXokCdEh4GHQb3GFyaTb4n/3n36WKAwVpTqm7iccIo=;
 b=bLdoAZxXPq/RxrD6FAKdEoqnpqtKY7OpHEAdXBpkQoLrhfhJSREK0I0fLZELlOeAGbOh3+1ITn1u2
 T2TUYbCDQ==
X-HalOne-Cookie: d5c43ae498786818b73444e506a04f8e467bfd63
X-HalOne-ID: 85d189a7-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 85d189a7-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:06 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/11] drm/via: Make via a single file driver
Date: Wed, 13 Jul 2022 19:01:49 +0200
Message-Id: <20220713170202.1798216-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have an upcoming openchrome driver for VIA where some
of the files conflicts with the existing via driver.

It is not acceptable to just delete the existing DRI1
based driver as there are most likely users out there,
so a different approach was required.

It was disccussed what to do and the least invasive
solution was to keep the DRI1 driver in the current
directory as a single file.

Thomas Zimmermann already posted a patch to do the
same but it attemped to have a single driver
for the DRI1 and the upcoming new driver.

This patchset embeds the files one by one to make the
diffs remotely readable and end up with an independent
DRI1 driver.

The driver was built tested for each step.

v2:
  - Drop the rename of the driver - keep the name via.
    We can name the new driver viakms or openchrome so
    there is no confusion in userspace if the old or
    the new driver is used.
  - Add a few patches to make via_3d_reg more readable,
    which has the nice side-effect that it is now checkpatch
    clean.
  - Added Kevin as cc: on all patches

This set of patches should make it simpler to add the new
openchrome driver, and I am happy to assist if there are
open questions how to do it.

Note: The patches has seen zero run-time testing - I only
know they builds in my setup (for several archs).

	Sam

Sam Ravnborg (13):
      drm/via: Rename via_drv to via_dri1
      drm/via: Embed via_dma in via_dri1
      drm/via: Embed via_map in via_dri1
      drm/via: Embed via_mm in via_dri1
      drm/via: Embed via_video in via_dri1
      drm/via: Embed via_irq in via_dri1
      drm/via: Embed via_dmablit in via_dri1
      drm/via: Embed via_verifier in via_dri1
      drm/via: Embed via_drv.h in via_dri1
      drm/via: Update to the latest via_3d_reg header
      drm/via: Use SPDX tag for MIT license in via_3d_reg header
      drm/via: Make macros readable in the via_3d_reg header
      drm/via: Fix style issues in via_3d_reg header

 drivers/gpu/drm/via/Makefile       |    2 +-
 drivers/gpu/drm/via/via_3d_reg.h   |  349 ++--
 drivers/gpu/drm/via/via_dma.c      |  744 --------
 drivers/gpu/drm/via/via_dmablit.c  |  807 --------
 drivers/gpu/drm/via/via_dmablit.h  |  140 --
 drivers/gpu/drm/via/via_dri1.c     | 3630 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/via/via_drv.c      |  124 --
 drivers/gpu/drm/via/via_drv.h      |  229 ---
 drivers/gpu/drm/via/via_irq.c      |  388 ----
 drivers/gpu/drm/via/via_map.c      |  132 --
 drivers/gpu/drm/via/via_mm.c       |  241 ---
 drivers/gpu/drm/via/via_verifier.c | 1110 -----------
 drivers/gpu/drm/via/via_verifier.h |   62 -
 drivers/gpu/drm/via/via_video.c    |   94 -
 14 files changed, 3866 insertions(+), 4186 deletions(-)


