Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199E99F5D0
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 20:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4EA10E5F0;
	Tue, 15 Oct 2024 18:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="J5mqeifY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5309910E5EE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 18:40:19 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6cbf2fc28feso33150686d6.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 11:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729017618; x=1729622418;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8ZIAcIQNXFU0HJAbelK5w6AajE5AfFCSDcserEzGKO8=;
 b=J5mqeifYjv9X7qcZKGGZJ5OrtO4UV8ZDhPc/XYCmB1JwAJp2tL1va0sWB/SNic6/OS
 JthKBl1MuFEsnKtlnt4HMC5an0wMqQf+Cw3MEljMx4N5mT1v9JiFFc1j8Vdz1orCOi6y
 FWYG4EdEWSY77tpNVKBT8trYOhD12FdmcG5X87Or69wFH/Ei8KXxFxptl/Hmbd2SoFA8
 ziG5r4ZLaeUVV01MxarNXro9x8qOVb7FJMLrCE8uQp+hTB/xKufquG1BI/pUswNPzL8D
 Y6cNdPwFQRgrQmB120LesVSiuEefDlXtqX9Lv8ES14e4eug+hOHLfj55dz4a88ewnZ67
 osLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729017618; x=1729622418;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8ZIAcIQNXFU0HJAbelK5w6AajE5AfFCSDcserEzGKO8=;
 b=T/RpT/cVG8Qe5TXuWONgQ1FkSiDW5L4Xj749crIql8r/6Ty0UmEfybrrcXniHX5pQo
 qrwtY++MEKhDAnE1Rj31rBh27BOCNGQ0iTzMCrrg6GyGcl6Qmkk99fiRtGrGfxS6H/UG
 Y4jFBP8pFEA6fsNgzgbf+hxkQVnPWBx/r9k6rar5EgDFCFtBvm+MzNMeXJI1XtHSUOO3
 FrTeTp5XjEthrqpvDwRtw9ua9AGz2ecpfh8dg22WgLWgQUfRMlJRIEyiCqT03OKYYtJp
 nvEpn0xXjgyeB89tPL1P64aZxLZNng1OKrRgHKm3FOzgAOtRtGy6WExIXg9GSJN7q78s
 fTNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtEA/IvYmD3cUmcLXZBchM3RhTwXQdmk6gLea1ACoVpdP0ZkkVsAJ9Uq6r6fY5zpsy5HybPK83VPA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/FB4+eQGC6cGOZRLLsCclgwG1UHIEGEFoCOP9VMdaPD4t7OVW
 QlDGKPueMhYYGAUoW7lBzd+ixy0TYlgNe7O7AsqvNSNSje/9WUZwvmMfa4aA0Kg=
X-Google-Smtp-Source: AGHT+IFusBTYb7gPAxZixD4vre5MF4aNXpzmSWO1sCDmCktW5i/0FD6ZzrAV8Ze8EESk75jqueZHlQ==
X-Received: by 2002:a05:6214:469b:b0:6cb:faee:76da with SMTP id
 6a1803df08f44-6cc2b923c6fmr17530536d6.48.1729017618017; 
 Tue, 15 Oct 2024 11:40:18 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6cc22959b4fsm9683206d6.84.2024.10.15.11.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 11:40:17 -0700 (PDT)
Message-ID: <ef6f582876782339a6abed5e5d114efade10f9ec.camel@ndufresne.ca>
Subject: Re: [PATCH v1 00/10] Add MediaTek ISP7 camera system driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org, 
 shun-yi.wang@mediatek.com
Date: Tue, 15 Oct 2024 14:40:16 -0400
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le mercredi 09 octobre 2024 =C3=A0 19:15 +0800, Shu-hsiang Yang a =C3=A9cri=
t=C2=A0:
> Based on linux-next/master, tag: next-20241008
>=20
> The patch set adds the MediaTek ISP7.x camera system hardware driver.
>=20
> This driver sets up ISP hardware, handles interrupts, and initializes
> V4L2 device nodes and functions. Moreover, implement V4L2 standard
> video driver that utilizes media framework APIs. It also connects
> the sensors and ISP, bridging with the seninf interface. Communicate
> with SCP co-processor to compose ISP registers in the firmware.

Thanks for this work. If I read you correctly, this will depends on an scp
firmware update. Its probably early at rev1, but we appreciate if you can c=
ross-
reference your associated linux-firmware submission (or document which MT
flavour of SCP firmware) contains this support already.

For ISP drivers reviewers, we have the experience with SCP that the IPC is =
not
versioned, making it difficult to maintain backward compatibility. Won't ma=
tter
until this is merged, but be aware that unless this SCP IPC design issue ha=
s
been fixed, any change to the -if headers means a modification to the SCP h=
as
been made, and often we have had to ask MTK to revisit the firmware code to
unbreak backward compatibility.

If this specific part of the SCP IPC is versioned, please let us know. I do=
n't
want this to be alarming message, just something we need to collectively be
aware of not to break userspace, which may not update their firmwares in lo=
ck
step with the kernel.

regards,
Nicolas

p.s. for those new to MTK architecture, the SCP firmware provides services =
to
everything multimedia in the platform, including CODECs, color converter an=
d
scalers, etc.

>=20
> These patches include CSI received data from sensors, sensor interface
> bridge, raw/YUV image pre-processing, ISP utility and ISP control parts.
>=20
> Thank you for reviewing these patches.
>=20
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
>=20
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
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,cam-raw.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,cam-yuv.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,camisp.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,seninf-core.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,seninf.yaml
>  create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Mak=
efile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_=
imgsensor_define_v4l2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ctrl.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ctrl.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-defs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-dmadbg.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-feature.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-feature.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-fmt.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ipi.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-meta-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-plat-util.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-plat-util.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-pool.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-pool.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw_debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw_debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-regs-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-drv.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-drv.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-hw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-if.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-regs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-route.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-route.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-timesync.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-timesync.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ufbc-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-video.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-video.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_camera-v4l2-controls.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-cammux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-seninf1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-tg1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
>  create mode 100644 include/uapi/linux/mtkisp_camsys.h
>=20

