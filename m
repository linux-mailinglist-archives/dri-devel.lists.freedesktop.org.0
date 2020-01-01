Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB212E539
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:58:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5546F6E077;
	Thu,  2 Jan 2020 10:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A30F389B30
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 18:26:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="334542271"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 19:26:23 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 00/10] use resource_size
Date: Wed,  1 Jan 2020 18:49:40 +0100
Message-Id: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Thu, 02 Jan 2020 10:58:15 +0000
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
Cc: linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@
struct resource ptr;
@@

- ((ptr.end) - (ptr.start) + 1)
+ resource_size(&ptr)

@@
struct resource *ptr;
@@

- ((ptr->end) - (ptr->start) + 1)
+ resource_size(ptr)

@@
struct resource ptr;
@@

- ((ptr.end) + 1 - (ptr.start))
+ resource_size(&ptr)

@@
struct resource *ptr;
@@

- ((ptr->end) + 1 - (ptr->start))
+ resource_size(ptr)
</smpl>

---

 arch/mips/kernel/setup.c                  |    6 ++----
 arch/powerpc/platforms/83xx/km83xx.c      |    2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c |    4 ++--
 arch/x86/kernel/crash.c                   |    2 +-
 drivers/net/ethernet/freescale/fman/mac.c |    4 ++--
 drivers/usb/gadget/udc/omap_udc.c         |    6 +++---
 drivers/video/fbdev/cg14.c                |    3 +--
 drivers/video/fbdev/s1d13xxxfb.c          |   16 ++++++++--------
 sound/drivers/ml403-ac97cr.c              |    4 +---
 sound/soc/sof/imx/imx8.c                  |    3 +--
 10 files changed, 22 insertions(+), 28 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
