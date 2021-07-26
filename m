Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FBC3D6383
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 18:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF45172E79;
	Mon, 26 Jul 2021 16:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3541F72E79
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 16:38:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80EAE60EB2;
 Mon, 26 Jul 2021 16:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627317517;
 bh=T5gtnG56UyEdqLhML5SDWuzR5PbDuAxCfdJhsOmPVLM=;
 h=From:To:Cc:Subject:Date:From;
 b=QYyePFs2iFNe9oEF6vt+NZWww3yixpMeY2poxxc25XMmRSjbC3Y7NHdESTrCiUQe3
 BJwAUeiF/Im+GvXihQfOWCFTzIXGJbNAxzQVm8RO3zPl18ZzQFKzCNLrFCICkXbg1h
 +5CG7EIJIyuiccyHxek8+1gZi0H1pJqZeOh0wdsOIn96EnEFpNPNh+aycoezwHT20X
 iGCBKJT6J+kVzdza6hhGDA5j7SjJ+mb2/knM93sPhcwIVwhhXMrLkNEPhm3J5qn7a+
 u1D1V/0ZJrd5BQ81AZHIANdKFBbnUcKa5HqjyyDgwrRWU4pnFXq9cWgzxvMUMF8Ivm
 DsVOrXIh+fi4w==
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@linux.ie>,
	DRI <dri-devel@lists.freedesktop.org>
Subject: linux-next: manual merge of the drm tree with the qcom/for-next tree
Date: Mon, 26 Jul 2021 17:38:14 +0100
Message-Id: <20210726163814.6483-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/firmware/Makefile

between commit:

  b42000e4b874 ("firmware: qcom_scm: Allow qcom_scm driver to be loadable as a permenent module")

from the qcom/for-next tree and commits:

  8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
  d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 3c2af2e98def..5ced0673d94b 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -19,6 +19,8 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
 qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_SYSFB)		+= sysfb.o
+obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
