Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3390E290C18
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 21:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEEA6EE7A;
	Fri, 16 Oct 2020 19:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BBD6EE78
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 19:08:25 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 5C98180623;
 Fri, 16 Oct 2020 21:08:22 +0200 (CEST)
Date: Fri, 16 Oct 2020 21:08:21 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH RFC v7 0/6] Add Unisoc's drm kms module
Message-ID: <20201016190821.GC1345100@ravnborg.org>
References: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=Bk4yDtxpmw7rSWEHNH8A:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: mark.rutland@arm.com, airlied@linux.ie, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, orsonzhai@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin,

> v7:
> 1. Fix DTC unit name warnings
> 2. Fix the problem of maintainers
> 3. Call drmm_mode_config_init to mode config init
> 4. Embed drm_device in sprd_drm and use devm_drm_dev_alloc
> 5. Replace DRM_XXX with drm_xxx on KMS module, but not suitable for other subsystems
> 6. Remove plane_update stuff, dpu handles all the HW update in crtc->atomic_flush
> 7. Dsi&Dphy Code structure adjustment, all move to "sprd/"

I can see some of my feedback from last round of review is not
addressed. There were makefile fixes and then I asked for a high-level
intro.

Can you please revisit last round of review feedback to check what was
missed.

	Sam


> 
> Kevin Tang (6):
>   dt-bindings: display: add Unisoc's drm master bindings
>   drm/sprd: add Unisoc's drm kms master
>   dt-bindings: display: add Unisoc's dpu bindings
>   drm/sprd: add Unisoc's drm display controller driver
>   dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
>   drm/sprd: add Unisoc's drm mipi dsi&dphy driver
> 
>  .../display/sprd/sprd,display-subsystem.yaml       |   39 +
>  .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   83 ++
>  .../display/sprd/sprd,sharkl3-dsi-host.yaml        |   98 ++
>  .../display/sprd/sprd,sharkl3-dsi-phy.yaml         |   75 +
>  drivers/gpu/drm/Kconfig                            |    2 +
>  drivers/gpu/drm/Makefile                           |    1 +
>  drivers/gpu/drm/sprd/Kconfig                       |   13 +
>  drivers/gpu/drm/sprd/Makefile                      |   12 +
>  drivers/gpu/drm/sprd/dpu_r2p0.c                    |  636 +++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl.c                 |  792 +++++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl.h                 | 1475 ++++++++++++++++++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c             |  276 ++++
>  drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h             |   34 +
>  drivers/gpu/drm/sprd/megacores_pll.c               |  315 +++++
>  drivers/gpu/drm/sprd/megacores_pll.h               |  146 ++
>  drivers/gpu/drm/sprd/sprd_dphy.c                   |  335 +++++
>  drivers/gpu/drm/sprd/sprd_dphy.h                   |   39 +
>  drivers/gpu/drm/sprd/sprd_dpu.c                    |  501 +++++++
>  drivers/gpu/drm/sprd/sprd_dpu.h                    |  217 +++
>  drivers/gpu/drm/sprd/sprd_drm.c                    |  263 ++++
>  drivers/gpu/drm/sprd/sprd_drm.h                    |   20 +
>  drivers/gpu/drm/sprd/sprd_dsi.c                    | 1102 +++++++++++++++
>  drivers/gpu/drm/sprd/sprd_dsi.h                    |  105 ++
>  23 files changed, 6579 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
>  create mode 100644 drivers/gpu/drm/sprd/Kconfig
>  create mode 100644 drivers/gpu/drm/sprd/Makefile
>  create mode 100644 drivers/gpu/drm/sprd/dpu_r2p0.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
>  create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
>  create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
>  create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
