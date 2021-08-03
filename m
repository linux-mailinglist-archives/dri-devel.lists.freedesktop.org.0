Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08453DF10D
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 17:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8237C6E888;
	Tue,  3 Aug 2021 15:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ED96E889
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 15:04:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 2eea81a6-f46c-11eb-9082-0050568c148b;
 Tue, 03 Aug 2021 15:05:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 95AF7194B8B;
 Tue,  3 Aug 2021 17:05:21 +0200 (CEST)
Date: Tue, 3 Aug 2021 17:04:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com,
 brian.starkey@arm.com, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, stefan@agner.ch, alison.wang@nxp.com,
 patrik.r.jakobsson@gmail.com, anitha.chrisanthus@intel.com,
 robdclark@gmail.com, edmund.j.dea@intel.com, sean@poorly.run,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 jyri.sarha@iki.fi, tomba@kernel.org, Dan.Sneddon@microchip.com,
 tomi.valkeinen@ideasonboard.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 00/14] drm: Make DRM's IRQ helpers legacy
Message-ID: <YQlbFjbrnyeWv7QP@ravnborg.org>
References: <20210803090704.32152-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803090704.32152-1-tzimmermann@suse.de>
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

Hi Thomas,

On Tue, Aug 03, 2021 at 11:06:50AM +0200, Thomas Zimmermann wrote:
> DRM's IRQ helpers are only helpful for old, non-KMS drivers. Move
> the code behind CONFIG_DRM_LEGACY. Convert KMS drivers to Linux
> IRQ interfaces.
> 
> DRM provides IRQ helpers for setting up, receiving and removing IRQ
> handlers. It's an abstraction over plain Linux functions. The code
> is mid-layerish with several callbacks to hook into the rsp drivers.
> Old UMS driver have their interrupts enabled via ioctl, so these
> abstractions makes some sense. Modern KMS manage all their interrupts
> internally. Using the DRM helpers adds indirection without benefits.
> 
> Most KMS drivers already use Linux IRQ functions instead of DRM's
> abstraction layer. Patches 1 to 12 convert the remaining ones.
> The patches also resolve a bug for devices without assigned interrupt
> number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
> not detect if the device has no interrupt assigned.
> 
> Patch 13 removes an unused function.
> 
> Patch 14 moves the DRM IRQ helpers behind CONFIG_DRM_LEGACY. Only
> the old non-KMS drivers still use the functionality.
> 
> v2:
> 	* drop IRQ_NOTCONNECTED test from atmel-hlcdc (Sam)
> 	* use devm_request_irq() in atmel-hlcdc (Sam)
> 	* unify variable names in arm/hlcdc (Sam)
> 
> Thomas Zimmermann (14):

The following patches are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

>   drm/fsl-dcu: Convert to Linux IRQ interfaces
>   drm/gma500: Convert to Linux IRQ interfaces
>   drm/kmb: Convert to Linux IRQ interfaces
>   drm/msm: Convert to Linux IRQ interfaces
>   drm/mxsfb: Convert to Linux IRQ interfaces
>   drm/tidss: Convert to Linux IRQ interfaces
>   drm/vc4: Convert to Linux IRQ interfaces
>   drm: Remove unused devm_drm_irq_install()

The remaining patches I either skipped or already had a feedback from
me or I asked a question.

	Sam
