Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE8172FA24
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 12:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040E210E43A;
	Wed, 14 Jun 2023 10:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF01610E438;
 Wed, 14 Jun 2023 10:09:40 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DA6493F7F8;
 Wed, 14 Jun 2023 12:09:38 +0200 (CEST)
Date: Wed, 14 Jun 2023 12:09:37 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 0/3] Add support for databus widen mode
Message-ID: <daltbzem4x5azhqt4xtjip4alc2r6huis4qnukl5h2w3rle56y@7b7kkoltys4s>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-13 18:57:10, Jessica Zhang wrote:
> DPU 5.x+ and DSI 6G 2.5.x+ support a databus-widen mode that allows for
> more compressed data to be transferred per pclk.
> 
> This series adds support for enabling this feature for both DPU and DSI
> by doing the following:
> 
> 1. Add a DPU_INTF_DATABUS_WIDEN feature flag
> 2. Add a DPU INTF op to set the DATABUS_WIDEN register
> 3. Set the DATABUS_WIDEN register and do the proper hdisplay
>    calculations in DSI when applicable
> 
> Note: This series will only enable the databus-widen mode for command
> mode as we are currently unable to validate it on video mode.
> 
> Depends on: "Add DSC v1.2 Support for DSI" [1]
> 
> [1] https://patchwork.freedesktop.org/series/117219/

Didn't Dmitry already pick that up for msm-next-lumag?

- Marijn

> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Jessica Zhang (3):
>       drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag for DPU >= 5.0
>       drm/msm/dpu: Set DATABUS_WIDEN on command mode encoders
>       drm/msm/dsi: Enable DATABUS_WIDEN for DSI command mode
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 12 ++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          |  3 +++
>  drivers/gpu/drm/msm/dsi/dsi.xml.h                    |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 19 ++++++++++++++++++-
>  7 files changed, 41 insertions(+), 2 deletions(-)
> ---
> base-commit: 1981c2c0c05f5d7fe4d4552d4f352cb46840e51e
> change-id: 20230525-add-widebus-support-f785546ee751
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 
