Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D156CE99
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 12:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9A12B22C;
	Sun, 10 Jul 2022 10:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE92D12B22C
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oJ6OBvmCZMZ05TS3LXzSzenCruH7ROL/ugRgp9foa2A=;
 b=rZpAUIfoEBr7xoy0/nD8cZ3zCYCnlvldX9PLf9Zklo01jV3IVxz2iyl7QeruIqyYiK5ApFkdOB2Tz
 +abR1bOQTqAuCEjBLqdr4xKCfev/UxdYVbjbXkojz0VaHDVrkGBWkVG5y7yJj12Q8JIksv/oGiN0c/
 xChAx5yLuuN2qLNQJZrlkyo+VsaieL/jrjZUFybGzPLWTiurqPQXVPCl1kVFDNzcTY13NIY/QAnq4c
 lY2u2dIishZsTmjfw4fTwoutjqBh44llIMyJtW66ElkcWEuKgFCOZJ9ucggCR8ysLTOXZzxFpnpLJ4
 ZKOgk4ZJ6frAQWFVOL036mEue9FIKmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oJ6OBvmCZMZ05TS3LXzSzenCruH7ROL/ugRgp9foa2A=;
 b=y9IQLjASSUHFc2aQDvWfsYQm62uT3yRmNBXpXvm2gyScTQYcGF6FDxB/cY97wI3pju4eRtSwvkZGq
 beQdIbcCA==
X-HalOne-Cookie: 11dc927e8295dc0004309803151cb413d6bfccb7
X-HalOne-ID: b6f55bdb-003c-11ed-a6c6-d0431ea8a283
Received: from mailproxy4.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id b6f55bdb-003c-11ed-a6c6-d0431ea8a283;
 Sun, 10 Jul 2022 10:40:28 +0000 (UTC)
Date: Sun, 10 Jul 2022 12:40:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH libdrm v2 00/10] Add support for low-color frame buffer
 formats
Message-ID: <Ysqsm6l9z09n0PRq@ravnborg.org>
References: <cover.1657302034.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657302034.git.geert@linux-m68k.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Fri, Jul 08, 2022 at 08:21:30PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> A long outstanding issue with the DRM subsystem has been the lack of
> support for low-color displays, as used typically on older desktop
> systems, and on small embedded displays.
> 
> This patch series adds support for color-indexed frame buffer formats
> with 2, 4, and 16 colors.  It has been tested on ARAnyM using a
> work-in-progress Atari DRM driver.
> 
> Changes compared to v1:
>   - SMPTE color LUT accuracy,
>   - Factor out smpte color LUT,
>   - Restructure patches,
>   - Improve descriptions.
>   - Store number of colors for indexed formats,
>   - Add SMPTE pattern support for the C1 and C2 formats.
> 
> Please refer to [2] for related Linux DRM patches and background
> information.
> 
> Thanks for your comments!
> 
> [1] "[PATCH libdrm 0/3] Add support for low-color frame buffer formats"
>     https://lore.kernel.org/r/cover.1646683737.git.geert@linux-m68k.org
> [2] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
>     https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org
> 
> Geert Uytterhoeven (10):
>   util: Improve SMPTE color LUT accuracy
>   util: Factor out and optimize C8 SMPTE color LUT
>   [RFC] drm_fourcc: Add DRM_FORMAT_C[124]
>   util: Add support for DRM_FORMAT_C[124]
>   util: Store number of colors for indexed formats
>   util: Add SMPTE pattern support for C4 format
>   util: Add SMPTE pattern support for C1 format
>   util: Add SMPTE pattern support for C2 format
>   modetest: Add support for DRM_FORMAT_C[124]
>   modetest: Add SMPTE pattern support for C4 format

I have browsed the patches - everything looked good.
The parts with Floyd-Steinberg dithering did get less
attention as I do not know it.
But everything looked good and the series is:

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
