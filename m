Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC212DEA1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jan 2020 12:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B878982A;
	Wed,  1 Jan 2020 11:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9C789330
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jan 2020 08:20:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.69,382,1571695200"; d="scan'208";a="429578748"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES128-SHA256;
 01 Jan 2020 09:20:08 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 00/16] constify copied structure
Date: Wed,  1 Jan 2020 08:43:18 +0100
Message-Id: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 01 Jan 2020 11:13:41 +0000
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
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-nfs@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make const static structures that are just copied into other structures.

The semantic patch that detects the opportunity for this change is as
follows: (http://coccinelle.lip6.fr/)

<smpl>
@r disable optional_qualifier@
identifier i,j;
position p;
@@
static struct i j@p = { ... };

@upd@
position p1;
identifier r.j;
expression e;
@@
e = j@p1

@ref@
position p2 != {r.p,upd.p1};
identifier r.j;
@@
j@p2

@script:ocaml depends on upd && !ref@
i << r.i;
j << r.j;
p << r.p;
@@
if j = (List.hd p).current_element
then Coccilib.print_main i p
</smpl>

---

 arch/powerpc/sysdev/mpic.c                          |    4 ++--
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c |    2 +-
 drivers/media/i2c/mt9v111.c                         |    2 +-
 drivers/media/platform/davinci/isif.c               |    2 +-
 drivers/media/usb/cx231xx/cx231xx-dvb.c             |    2 +-
 drivers/media/usb/dvb-usb-v2/anysee.c               |    4 ++--
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c           |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c            |    2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c             |    2 +-
 drivers/ptp/ptp_clockmatrix.c                       |    2 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c             |    2 +-
 drivers/video/fbdev/sa1100fb.c                      |    2 +-
 net/sunrpc/xdr.c                                    |    2 +-
 sound/isa/ad1816a/ad1816a_lib.c                     |    2 +-
 sound/pci/hda/hda_controller.c                      |    2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                    |    2 +-
 16 files changed, 18 insertions(+), 18 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
