Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79456CE0F
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 10:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA3610F1DE;
	Sun, 10 Jul 2022 08:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EC610F1DE
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 08:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=HDY6iMRFEec+vJg1LjxuOFIShIIv9JbD3rmY2GYQGCY=;
 b=bU89xEAEcf3fIpi4jCbDMRmlZhgld0+fj4VRvHMoYbORbqnnlTCv7wdPLpYlQSCDaZRWnYU8J4+7s
 rPByGRt983iYVO7Vhj+ZY4vxMV7f9N5FzoIdwpzyrNr4fjYCbX8X1WWJKr/M73LR6NBzbxllcDwqT9
 VtxRVM4z20fTiy6g8Z0oBAJ+UykfCmIr0HtaRXADCZKX0/w/9XuYH9HV7oAIhKPjm3SUAdGOWC3HmN
 z5scK4HX8v7Pek/U60Yx268bwX7Smg2wDTBQM0dMVSAD0ZO0PNQhBwkNi8R7Sjoh+HOyYLdNdrgD+5
 KB5Pu/I5LexXwRU+VGfowooc2ni++iQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=HDY6iMRFEec+vJg1LjxuOFIShIIv9JbD3rmY2GYQGCY=;
 b=NQSWfcB4aHyli0HntG8c9YJIyEeHP7nZFozi8cGnkcfMKnKzpyYSkjnPoVBHoiWODzyMK9GSKxisV
 Vv/XJxFCQ==
X-HalOne-Cookie: 60b8b56f6eb0318fb02299530f16c00627f33c26
X-HalOne-ID: 0664486d-002e-11ed-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 0664486d-002e-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 08:55:20 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 0/11] drm/via: Make via a single file driver
Date: Sun, 10 Jul 2022 10:54:55 +0200
Message-Id: <20220710085506.1384056-1-sam@ravnborg.org>
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

The driver is in the end renamed to via_dri1.
Some feedback on this would be good as I do not know
what impact it will have on users.

The very last patch synchronize the via_3d_reg header
file with the one used in the openchrome driver.
This was added to verify that the new header would not
break the DRI1 driver.

	Sam

Sam Ravnborg (11):
      drm/via: Rename via_drv to via_dri1
      drm/via: Embed via_dma in via_dri1
      drm/via: Embed via_map in via_dri1
      drm/via: Embed via_mm in via_dri1
      drm/via: Embed via_video in via_dri1
      drm/via: Embed via_irq in via_dri1
      drm/via: Embed via_dmablit in via_dri1
      drm/via: Embed via_verifier in via_dri1
      drm/via: Embed via_drv.h in via_dri1
      drm/via: Rename the via driver to via_dri1
      drm/via: Update to the latest via_3d_reg file

 drivers/gpu/drm/via/Makefile       |    4 +-
 drivers/gpu/drm/via/via_3d_reg.h   |  395 +++-
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
 14 files changed, 3935 insertions(+), 4165 deletions(-)


