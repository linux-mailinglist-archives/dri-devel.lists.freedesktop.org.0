Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219762B969
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 11:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1416810E11A;
	Wed, 16 Nov 2022 10:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE3EF10E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 10:41:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0345150C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 02:41:54 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5D6123F663
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Nov 2022 02:41:48 -0800 (PST)
Date: Wed, 16 Nov 2022 10:41:41 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3 0/5] drm/arm/malidp: use drm managed
 resources
Message-ID: <Y3S+ZQ9gJVf9YYra@e110455-lin.cambridge.arm.com>
References: <20221026155934.125294-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221026155934.125294-1-dakr@redhat.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 05:59:29PM +0200, Danilo Krummrich wrote:
> Hi,

Hi Danilo,

Sorry for the additional delay in reviewing and testing this series. I've now managed
to get enough of both to be happy with the series.

For the whole series: Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

I will push the series today to drm-misc-next.

Best regards,
Liviu

> 
> This patch series converts the driver to use drm managed resources to prevent
> potential use-after-free issues on driver unbind/rebind and to get rid of the
> usage of deprecated APIs.
> 
> Changes in v2:
>   - While protecting critical sections with drm_dev_{enter,exit} I forgot to
>     handle alternate return paths within the read-side critical sections, hence
>     fix them.
>   - Add a patch to remove explicit calls to drm_mode_config_cleanup() and switch
>     to drmm_mode_config_init() explicitly.
> 
> Changes in v3:
>   - Remove patches to protect platform device bound resources with
>     drm_dev_{enter,exit}, since this would leave the hardware enabled when
>     regularly unloading the driver e.g. via rmmod.
>     Instead do this in a later series, once we got drm_dev_unplug() in place
>     to deal with a regular driver shutdown.
> 
> Danilo Krummrich (5):
>   drm/arm/malidp: use drmm_* to allocate driver structures
>   drm/arm/malidp: replace drm->dev_private with drm_to_malidp()
>   drm/arm/malidp: crtc: use drmm_crtc_init_with_planes()
>   drm/arm/malidp: plane: use drm managed resources
>   drm/arm/malidp: remove calls to drm_mode_config_cleanup()
> 
>  drivers/gpu/drm/arm/malidp_crtc.c   |  7 ++-
>  drivers/gpu/drm/arm/malidp_drv.c    | 69 +++++++++++------------------
>  drivers/gpu/drm/arm/malidp_drv.h    |  2 +
>  drivers/gpu/drm/arm/malidp_hw.c     | 10 ++---
>  drivers/gpu/drm/arm/malidp_mw.c     |  6 +--
>  drivers/gpu/drm/arm/malidp_planes.c | 32 ++++---------
>  6 files changed, 48 insertions(+), 78 deletions(-)
> 
> 
> base-commit: e1e7bc481d49c3e3ada11029ce0d9b85a0a539d7
> -- 
> 2.37.3
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
