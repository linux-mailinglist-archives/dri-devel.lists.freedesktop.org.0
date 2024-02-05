Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D6849488
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 08:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBE610E675;
	Mon,  5 Feb 2024 07:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HMM8ttdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E34F10EA30
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 07:29:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (99.141-128-109.adsl-dyn.isp.belgacom.be [109.128.141.99])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 758DA667;
 Mon,  5 Feb 2024 08:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707118064;
 bh=LFfsqhF5yh5rxZ01HaZmxLQPdLG81PK0wpbUW6uXSfQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMM8ttdWdXy26wgclMS+zPW1vmO0x+7NBIwVNpGyKJwLlY6m7a3qIcku6PP10nQmj
 PDSBTOkAWSzmdiEE1nZrvEnL1/PFm7tLsQYsCW+aE0s7kZEoQtniAIiUjkSEiY1wIh
 jT6lmIH5ANbCacLWGbk4reubOPKyO3M1HKGC8AJ8=
Date: Mon, 5 Feb 2024 09:29:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Fixing live video input in ZynqMP DPSUB
Message-ID: <20240205072908.GE6804@pendragon.ideasonboard.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
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

Hello,

This series looks good. Tomi, could you get it merged through drm-misc ?

On Tue, Jan 23, 2024 at 06:53:57PM -0800, Anatoliy Klymenko wrote:
> Add few missing pieces to support ZynqMP DPSUB live video in mode.
> 
> ZynqMP DPSUB supports 2 modes of operations in regard to video data
> input.
>     
> In the first mode, DPSUB uses DMA engine to pull video data from memory
> buffers. To support this the driver implements CRTC and DRM bridge
> representing DP encoder.
>     
> In the second mode, DPSUB acquires video data pushed from FPGA and 
> passes it downstream to DP output. This mode of operation is modeled in
> the driver as a DRM bridge that should be attached to some external
> CRTC.
> 
> Patches 1/5,2/5,3/5,4/5 are minor fixes.
> 
> DPSUB requires input live video format to be configured.
> Patch 5/5: The DP Subsystem requires the input live video format to be
> configured. In this patch, we are assuming that the CRTC's bus format is
> fixed (typical for FPGA CRTC) and comes from the device tree. This is a
> proposed solution, as there is no API to query CRTC output bus format
> or negotiate it in any other way.
> 
> Changes in v2: 
> - Address reviewers' comments:
>   - More elaborate and consistent comments / commit messages
>   - Fix includes' order
>   - Replace of_property_read_u32_index() with of_property_read_u32()
> 
> Changes in v3:
> - Split patch #3 into 3) moving status register clear immediately after
>   read; 4) masking status against interrupts' mask
> 
> Link to v1: https://lore.kernel.org/all/20240112234222.913138-1-anatoliy.klymenko@amd.com/
> Link to v2: https://lore.kernel.org/all/20240119055437.2549149-1-anatoliy.klymenko@amd.com/
> 
> Anatoliy Klymenko (5):
>   drm: xlnx: zynqmp_dpsub: Make drm bridge discoverable
>   drm: xlnx: zynqmp_dpsub: Fix timing for live mode
>   drm: xlnx: zynqmp_dpsub: Clear status register ASAP
>   drm: xlnx: zynqmp_dpsub: Filter interrupts against mask
>   drm: xlnx: zynqmp_dpsub: Set live video in format
> 
>  drivers/gpu/drm/xlnx/zynqmp_disp.c      | 111 +++++++++++++++++++++---
>  drivers/gpu/drm/xlnx/zynqmp_disp.h      |   3 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   8 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c        |  16 +++-
>  drivers/gpu/drm/xlnx/zynqmp_kms.c       |   2 +-
>  5 files changed, 119 insertions(+), 21 deletions(-)

-- 
Regards,

Laurent Pinchart
