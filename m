Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDA4463D89
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 19:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F3C6E0A5;
	Tue, 30 Nov 2021 18:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 100FD6E0A5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 18:17:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C9E2106F;
 Tue, 30 Nov 2021 10:17:28 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BCED3F694;
 Tue, 30 Nov 2021 10:17:28 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 39A39684474; Tue, 30 Nov 2021 18:17:27 +0000 (GMT)
Date: Tue, 30 Nov 2021 18:17:27 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Zhou Qingyang <zhou1615@umn.edu>
Subject: Re: [PATCH] drm/komeda: Fix an undefined behavior bug in
 komeda_plane_add()
Message-ID: <YaZqt7bwSJtS2SaT@e110455-lin.cambridge.arm.com>
References: <20211130142301.155586-1-zhou1615@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211130142301.155586-1-zhou1615@umn.edu>
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

Hi Zhou,

On Tue, Nov 30, 2021 at 10:23:01PM +0800, Zhou Qingyang wrote:
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

If multiple researchers have cross-reviewed the bug how many have reviewed the fix?
I'm asking because there is a problem with the fix ....


> 
> Builds with CONFIG_DRM_KOMEDA=m show no new warnings,
> and our static analyzer no longer warns about this code.
> 
> Fixes: 61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> index d63d83800a8a..dd3f17e970dd 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
> @@ -265,6 +265,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
>  
>  	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
>  					       layer->layer_type, &n_formats);
> +	if (!formats) {
> +		err = -ENOMEM;
> +		goto cleanup;

If you go to cleanup here it is too early, as the plane variable has not been
initialised by the drm_universal_plane_init(), so komeda_plane_destroy() will crash.
The correct fix here is to free the kplane allocation and then return -ENOMEM.

> +	}
>  
>  	err = drm_universal_plane_init(&kms->base, plane,
>  			get_possible_crtcs(kms, c->pipeline),
> -- 
> 2.25.1
> 

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
