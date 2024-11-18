Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82C9D0DA4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 11:00:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC81610E485;
	Mon, 18 Nov 2024 10:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vMqNyWbz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03FD10E485
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 10:00:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C333B5B3;
 Mon, 18 Nov 2024 11:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1731924032;
 bh=jkPR4Kt9JiPbGFeygxRhst2pg8qwoxgS332CjCC2qS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vMqNyWbzBKi1a1biVT1taieKIO9CoVgiOXzX2QqeM3IoMu0YU8dTopXPfgmwORWQA
 rvfDbWCSgD91xxwU4AQeNtK0O063Ko8+LJMshfd94zJa70hg/JzZmY7iiM+nXD+RtR
 O/Z+oAAExLkYDV4JbQvjq9/RWOligt6bHfjeouIk=
Date: Mon, 18 Nov 2024 12:00:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 yaya.chang@mediatek.com, teddy.chen@mediatek.com,
 hidenorik@chromium.org, yunkec@chromium.org, shun-yi.wang@mediatek.com
Subject: Re: [PATCH v1 00/10] Add MediaTek ISP7 camera system driver
Message-ID: <20241118100039.GB30268@pendragon.ideasonboard.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Shu-hsiang,

On Wed, Oct 09, 2024 at 07:15:41PM +0800, Shu-hsiang Yang wrote:
> Based on linux-next/master, tag: next-20241008
> 
> The patch set adds the MediaTek ISP7.x camera system hardware driver.
> 
> This driver sets up ISP hardware, handles interrupts, and initializes
> V4L2 device nodes and functions. Moreover, implement V4L2 standard
> video driver that utilizes media framework APIs. It also connects
> the sensors and ISP, bridging with the seninf interface. Communicate
> with SCP co-processor to compose ISP registers in the firmware.
> 
> These patches include CSI received data from sensors, sensor interface
> bridge, raw/YUV image pre-processing, ISP utility and ISP control parts.
> 
> Thank you for reviewing these patches.

Could you please include the v4l2-compliance report for the driver in
the cover letter of the next version ? This is required for all new
drivers. Please use the very latest version of v4l2-compliance, compiled
from the master branch of v4l-utils.

> Shu-hsiang Yang (10):
>   dt-bindings: media: mediatek: add camsys device
>   media: platform: mediatek: add seninf controller
>   media: platform: mediatek: add isp_7x seninf unit
>   media: platform: mediatek: add isp_7x cam-raw unit
>   media: platform: mediatek: add isp_7x camsys unit
>   media: platform: mediatek: add isp_7x utility
>   media: platform: mediatek: add isp_7x video ops
>   media: platform: mediatek: add isp_7x state ctrl
>   media: platform: mediatek: add isp_7x build config
>   uapi: linux: add mediatek isp_7x camsys user api
> 
>  .../media/mediatek/mediatek,cam-raw.yaml      |  169 +
>  .../media/mediatek/mediatek,cam-yuv.yaml      |  148 +
>  .../media/mediatek/mediatek,camisp.yaml       |   71 +
>  .../media/mediatek/mediatek,seninf-core.yaml  |  106 +
>  .../media/mediatek/mediatek,seninf.yaml       |   88 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    2 +
>  drivers/media/platform/mediatek/isp/Kconfig   |   21 +
>  .../platform/mediatek/isp/isp_7x/Makefile     |    7 +
>  .../mediatek/isp/isp_7x/camsys/Makefile       |   16 +
>  .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   87 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1797 ++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  140 +
>  .../isp/isp_7x/camsys/mtk_cam-debug.c         | 1271 ++++
>  .../isp/isp_7x/camsys/mtk_cam-debug.h         |  273 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  168 +
>  .../isp/isp_7x/camsys/mtk_cam-dmadbg.h        |  721 +++
>  .../isp/isp_7x/camsys/mtk_cam-feature.c       |   40 +
>  .../isp/isp_7x/camsys/mtk_cam-feature.h       |   26 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  233 +
>  .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2436 ++++++++
>  .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  207 +
>  .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   16 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  393 ++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
>  .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
>  .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
>  .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  382 ++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  193 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1741 ++++++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  120 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   28 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   40 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  356 ++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   23 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  170 +
>  .../isp/isp_7x/camsys/mtk_cam-timesync.c      |  125 +
>  .../isp/isp_7x/camsys/mtk_cam-timesync.h      |   12 +
>  .../isp/isp_7x/camsys/mtk_cam-ufbc-def.h      |   59 +
>  .../isp/isp_7x/camsys/mtk_cam-video.c         | 1817 ++++++
>  .../isp/isp_7x/camsys/mtk_cam-video.h         |  224 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam.c      | 4168 +++++++++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam.h      |  733 +++
>  .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
>  .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 +++
>  .../mtk_cam-seninf-csi0-cphy.h                |   69 +
>  .../mtk_cam-seninf-csi0-dphy.h                |  139 +
>  .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++
>  .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 +
>  .../mtk_cam-seninf-seninf1-csi2.h             |  415 ++
>  .../mtk_cam-seninf-seninf1-mux.h              |  147 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
>  include/uapi/linux/mtkisp_camsys.h            |  227 +
>  60 files changed, 30194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-raw.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,cam-yuv.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,camisp.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf-core.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/mediatek,seninf.yaml
>  create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-dmadbg.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-feature.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw_debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ufbc-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
>  create mode 100644 include/uapi/linux/mtkisp_camsys.h

-- 
Regards,

Laurent Pinchart
