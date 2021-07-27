Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 869A93D7E05
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9706E4C1;
	Tue, 27 Jul 2021 18:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ECB6E3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 18:52:01 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c39853f0-ef0b-11eb-8d1a-0050568cd888;
 Tue, 27 Jul 2021 18:52:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 4E468194BB3;
 Tue, 27 Jul 2021 20:52:17 +0200 (CEST)
Date: Tue, 27 Jul 2021 20:51:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/14] drm: Make DRM's IRQ helpers legacy
Message-ID: <YQBVyuPuf9InsY7g@ravnborg.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727182721.17981-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, nicolas.ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Tue, Jul 27, 2021 at 08:27:07PM +0200, Thomas Zimmermann wrote:
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
> Most KMs drivers already use Linux IRQ functions instead of DRM's
> abstraction layer. Patches 1 to 12 convert the remaining ones.
> The patches also resolve a bug for devices without assigned interrupt
> number. DRM helpers don't test for IRQ_NOTCONNECTED, so drivers do
> not detect if the device has no interrupt assigned.

Before diving into a review of these..
Any specific reason devm_request_irq is not used?

	Sam
