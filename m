Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7135C464EC7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448C26FD59;
	Wed,  1 Dec 2021 13:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E8896FD58
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 13:28:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13B466D;
 Wed,  1 Dec 2021 05:28:57 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E78633F5A1;
 Wed,  1 Dec 2021 05:28:56 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id A84C1684474; Wed,  1 Dec 2021 13:28:55 +0000 (GMT)
Date: Wed, 1 Dec 2021 13:28:55 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Zhou Qingyang <zhou1615@umn.edu>
Subject: Re: [PATCH v2] drm/komeda: Fix an undefined behavior bug in
 komeda_plane_add()
Message-ID: <Yad4l3HXBRavsE0y@e110455-lin.cambridge.arm.com>
References: <YaZqt7bwSJtS2SaT@e110455-lin.cambridge.arm.com>
 <20211201033704.32054-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211201033704.32054-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 01, 2021 at 11:37:03AM +0800, Zhou Qingyang wrote:
> In komeda_plane_add(), komeda_get_layer_fourcc_list() is assigned to
> formats and used in drm_universal_plane_init().
> drm_universal_plane_init() passes formats to
> __drm_universal_plane_init(). __drm_universal_plane_init() further
> passes formats to memcpy() as src parameter, which could lead to an
> undefined behavior bug on failure of komeda_get_layer_fourcc_list().
> 
> Fix this bug by adding a check of formats.
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_DRM_KOMEDA=m show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>

Thanks for the fix!

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Changes in v2
>   -  Use kfree and return instead of using 'goto'
> 
>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> index d63d83800a8a..aa193c58f4bf 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -265,6 +265,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
>  
>  	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>  					       layer->layer_type, &n_formats);
> +	if (!formats) {
> +		kfree(kplane);
> +		return -ENOMEM;
> +	}
>  
>  	err = drm_universal_plane_init(&kms->base, plane,
>  			get_possible_crtcs(kms, c->pipeline),
> -- 
> 2.25.1
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
