Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBC314C729
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 09:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CA26E209;
	Wed, 29 Jan 2020 08:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [IPv6:2001:470:0:1f2::b869:4820])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9D76E07F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 14:06:56 +0000 (UTC)
Received: from localhost.localdomain ([94.155.250.134])
 by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 06:06:52 -0800
From: Stefan Mavrodiev <stefan@olimex.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support)
Subject: [PATCH v3 0/1] Add support for sun4i HDMI audio
Date: Tue, 28 Jan 2020 16:06:41 +0200
Message-Id: <20200128140642.8404-1-stefan@olimex.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 29 Jan 2020 08:06:22 +0000
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
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series add support for HDMI audio for sun4i HDMI encored.
The code uses some parts from the Allwinners's BSP kernel.

In the previous patch series there was additional patch enabling the
cyclic DMA transfers. It was accepted, so it's omitted here.

The patch is tested on A20 chip. For the other chips, only the addresses
of the registers are checked.

Changes for v3:
 - Dropped the patch which enable the cyclic DMA transfers
 - In v2, a separate platform_driver was created. However this is not
   practical and the idea is dropped.
 - Since this module depends on SND_SOC, a new Kconfig entry is added. When
   SND_SOC is not enabled, the audio part is not initialized.
 - The "big" issue with v1 was that snd_soc_register_card() overwrites
   the driver_data pointer. To resolve this issue, the original pointer is
   stored as drvdata of the card. Then before card unregistering, the
   pointer is restored. This is done by calling additional destroy function.

Changes for v2:
 - Create a new platform driver instead of using the HDMI encoder
 - Expose a new kcontrol to the userspace holding the ELD data
 - Wrap all macro arguments in parentheses

Stefan Mavrodiev (1):
  drm: sun4i: hdmi: Add support for sun4i HDMI encoder audio

 drivers/gpu/drm/sun4i/Kconfig            |  11 +
 drivers/gpu/drm/sun4i/Makefile           |   3 +
 drivers/gpu/drm/sun4i/sun4i_hdmi.h       |  37 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c | 450 +++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c   |  14 +
 5 files changed, 515 insertions(+)
 create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c

-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
