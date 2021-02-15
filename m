Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B953B31B983
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04C16E24D;
	Mon, 15 Feb 2021 12:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4DA89C08
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 11:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1613387495;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=K9idY10taL60f48UStUVqH7VeUDlqoBOrxbno4VV8tc=;
 b=IqjYqGtPe3yTGwDa9CtGQa5Q5yUlijfqsQP9vgbxRVFel3fpRaUgVo6eA9z0NcSnas
 CMcRN/QLaG+1LL49Ta0PUxPPwLm+axDnZ85qVP7xOmVZAZur/VXxV/EtA/Yf5JAzwX/8
 CRhk8AdUHEGlPUfHzEZZlwyaN0Js8j22DlxCMgvuhIYtHSwe6AjEoIckBhwE9EB8sgwu
 86ZTQoQCu1eq+oJOTcIewvlJxV7+vJnoPE358ywWh97pDW2/1UWBQbZo1PmM15uaEeb+
 gJVflsHr+xsYmXpsN56wCL/8USb6rnDBCbgsq2+aTJKLD2GGt+X8T51NHuduOY54y5mI
 RjOg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPruwDvG"
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 47.18.0 DYNA|AUTH)
 with ESMTPSA id v00cf5x1FBBC0xX
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256
 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 15 Feb 2021 12:11:12 +0100 (CET)
Subject: Re: [PATCH 0/5] drm/omap: hdmi: improve hdmi4 CEC, add CEC for hdmi5
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: H. Nikolaus Schaller <hns@goldelico.com>
In-Reply-To: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
Date: Mon, 15 Feb 2021 12:11:11 +0100
Message-Id: <1707AE88-75E5-4B61-B336-09757674B6A1@goldelico.com>
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailer: Apple Mail (2.3124)
X-Mailman-Approved-At: Mon, 15 Feb 2021 12:45:13 +0000
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel@pyra-handheld.com,
 Linux-OMAP <linux-omap@vger.kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Am 11.02.2021 um 11:36 schrieb Hans Verkuil <hverkuil-cisco@xs4all.nl>:
> 
> This series improves the drm_bridge support for CEC by introducing two
> new bridge ops in the first patch, and using those in the second patch.
> 
> This makes it possible to call cec_s_conn_info() and set
> CEC_CAP_CONNECTOR_INFO for the CEC adapter, so userspace can associate
> the CEC adapter with the corresponding DRM connector.
> 
> The third patch simplifies CEC physical address handling by using the
> cec_s_phys_addr_from_edid helper function that didn't exist when this
> code was originally written.
> 
> The fourth patch adds CEC support to the OMAP5 driver and the last
> patch adds the missing cec clock to the dra7 and omap5 device tree.
> 
> Tested with a Pandaboard and a Beagle X15 board.

Tested to have no adverse effect on Pyra (omap5432).
But I have not tested if CEC itself is working.

> 
> Regards,
> 
> 	Hans
> 
> Hans Verkuil (5):
>  drm: drm_bridge: add cec_init/exit bridge ops
>  drm/omap: hdmi4: switch to the cec bridge ops
>  drm/omap: hdmi4: simplify CEC Phys Addr handling
>  drm/omap: hdmi5: add CEC support
>  ARM: dts: dra7/omap5: add cec clock
> 
> arch/arm/boot/dts/dra7.dtsi              |   5 +-
> arch/arm/boot/dts/omap5.dtsi             |   5 +-
> drivers/gpu/drm/drm_bridge_connector.c   |  23 +++
> drivers/gpu/drm/omapdrm/dss/Kconfig      |   8 +
> drivers/gpu/drm/omapdrm/dss/Makefile     |   1 +

Merging with patch series by Tomi Valkeinen and Sebastian Reichel
for omapdrm/dsi will need to move the Kconfig and Makefile one level
up.

> drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
> drivers/gpu/drm/omapdrm/dss/hdmi4.c      |  41 ++---
> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c  |  12 +-
> drivers/gpu/drm/omapdrm/dss/hdmi4_cec.h  |  12 +-
> drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 201 +++++++++++++++++++++++
> drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
> drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  28 +++-
> drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
> include/drm/drm_bridge.h                 |  31 ++++
> 15 files changed, 453 insertions(+), 53 deletions(-)
> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
> create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
> 
> -- 
> 2.30.0
> 

BR and thanks,
Nikolaus Schaller

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
