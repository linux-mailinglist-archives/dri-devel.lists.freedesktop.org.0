Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE846E5AF3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1017710E6BC;
	Tue, 18 Apr 2023 07:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0934010E6BB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:49:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 098A1802;
 Tue, 18 Apr 2023 09:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681804184;
 bh=v2u4LNXCU7lB0ofRNe6LSiK35oTUg0RsosfcxK/5lZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s27+3FyVt6okWcHG/xM/OMWJe8oT32gul+Z3jl7/1ehLniHbdXQ2b+BM8spJK5HtQ
 Aa2ezaJTkGIZQSsu/uLaw/WalqmYW3l74uuZrZOgfsxsNvbFKVHdB5Aidg/AB14AiI
 abVSr4DmpBzArXjQ3nl3u/6QmyraRyu9dI95h21I=
Date: Tue, 18 Apr 2023 10:50:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 0/5] drm: shmobile: Fixes and enhancements
Message-ID: <20230418075000.GF4703@pendragon.ideasonboard.com>
References: <cover.1681734821.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1681734821.git.geert+renesas@glider.be>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Apr 17, 2023 at 03:40:20PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Currently, there are two drivers for the LCD controller on Renesas
> SuperH-based and ARM-based SH-Mobile and R-Mobile SoCs:
>   1. sh_mobile_lcdcfb, using the fbdev framework,
>   2. shmob_drm, using the DRM framework.
> However, only the former driver can be used, as all platform support
> integrates the former.  None of these drivers support DT-based systems.
> 
> This patch series is a first step to enable the SH-Mobile DRM driver for
> Renesas ARM-based SH-Mobile and R-Mobile SoCs.  The next step planned is
> to add DT support.
> 
> Changes compared to v1:
>   - Add Reviewed-by,
>   - Drop dependency on ARM.
> 
> This has been tested on the R-Mobile A1-based Atmark Techno
> Armadillo-800-EVA development board, using a temporary
> platform-enablement patch[1].
> 
> Thanks for applying to drm-misc!

Would you like to request drm-misc committer rights ? :-)

> [1] https://lore.kernel.org/r/c03d4edbd650836bf6a96504df82338ec6d800ff.1680272980.git.geert+renesas@glider.be
> 
> 
> Geert Uytterhoeven (5):
>   drm: shmobile: Use %p4cc to print fourcc codes
>   drm: shmobile: Add support for DRM_FORMAT_XRGB8888
>   drm: shmobile: Switch to drm_crtc_init_with_planes()
>   drm: shmobile: Add missing call to drm_fbdev_generic_setup()
>   drm: shmobile: Make DRM_SHMOBILE visible on Renesas SoC platforms
> 
>  drivers/gpu/drm/shmobile/Kconfig           |  4 +--
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c  | 35 +++++++++++++++++++---
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c   |  3 ++
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c   |  9 ++++--
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c |  5 ++++
>  5 files changed, 48 insertions(+), 8 deletions(-)

-- 
Regards,

Laurent Pinchart
