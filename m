Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306CA8AD446
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 20:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D24910E494;
	Mon, 22 Apr 2024 18:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PxXZV2b5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54CD10E494
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 18:48:16 +0000 (UTC)
Message-ID: <4cfbbbd5-fd76-4426-a6be-ad6a82dae8bf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1713811695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEt+IUNNZ0s58xLemUV9lCabZNCE/TtBPyT3EKRdZWM=;
 b=PxXZV2b564EDYUZ1cMNfuPA3OWIDzAXHwpCVn9d5yL26gmg5e/sP0UhkD+uek5jr3Zs5u4
 6xKjAZ8B9lK6jeZJ6Uz89ckvuGiQ+NYt0bpU8AiZGzU20cQ5D7SQ6xsJr5AtBludBQf8U9
 +68nXwN+aEtknkmVAbIUP9zzmmEbyLM=
Date: Mon, 22 Apr 2024 14:48:11 -0400
MIME-Version: 1.0
Subject: Re: [PATCH v3 00/13] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>
References: <20240422184553.3573009-1-sean.anderson@linux.dev>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20240422184553.3573009-1-sean.anderson@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

On 4/22/24 14:45, Sean Anderson wrote:
> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
> that's done, it adds debugfs support. The intent is to enable compliance
> testing or to help debug signal-integrity issues.
> 
> Last time I discussed converting the HPD work(s) to a threaded IRQ. I
> did not end up doing that for this series since the steps would be
> 
> - Add locking
> - Move link retraining to a work function
> - Harden the IRQ
> - Merge the works into a threaded IRQ (omitted)
> 
> Which with the exception of the final step is the same as leaving those
> works as-is. Conversion to a threaded IRQ can be done as a follow-up.
> 
> Changes in v3:
> - Store base pointers in zynqmp_disp directly
> - Don't delay work
> - Convert to a hard IRQ
> - Use AUX IRQs instead of polling
> - Take dp->lock in zynqmp_dp_hpd_work_func
> 
> Changes in v2:
> - Fix kerneldoc
> - Rearrange zynqmp_dp for better padding
> - Split off the HPD IRQ work into another commit
> - Expand the commit message
> - Document hpd_irq_work
> - Document debugfs files
> - Add ignore_aux_errors and ignore_hpd debugfs files to replace earlier
>   implicit functionality
> - Attempt to fix unreproducable, spurious build warning
> - Drop "Optionally ignore DPCD errors" in favor of a debugfs file
>   directly affecting zynqmp_dp_aux_transfer.
> 
> Sean Anderson (13):
>   drm: xlnx: Store base pointers in zynqmp_disp directly
>   drm: xlnx: Fix kerneldoc
>   drm: zynqmp_dp: Downgrade log level for aux retries message
>   drm: zynqmp_dp: Adjust training values per-lane
>   drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
>   drm: zynqmp_dp: Don't delay work
>   drm: zynqmp_dp: Add locking
>   drm: zynqmp_dp: Don't retrain the link in our IRQ
>   drm: zynqmp_dp: Convert to a hard IRQ
>   drm: zynqmp_dp: Use AUX IRQs instead of polling
>   drm: zynqmp_dp: Split off several helper functions
>   drm: zynqmp_dp: Take dp->lock in zynqmp_dp_hpd_work_func
>   drm: zynqmp_dp: Add debugfs interface for compliance testing
> 
>  Documentation/gpu/drivers.rst       |   1 +
>  Documentation/gpu/zynqmp.rst        | 149 +++++
>  MAINTAINERS                         |   1 +
>  drivers/gpu/drm/xlnx/zynqmp_disp.c  |  44 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c    | 909 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.h |   1 +
>  drivers/gpu/drm/xlnx/zynqmp_kms.h   |   4 +-
>  7 files changed, 1000 insertions(+), 109 deletions(-)
>  create mode 100644 Documentation/gpu/zynqmp.rst
> 

+CC Tomi, who I forgot to add initially...
