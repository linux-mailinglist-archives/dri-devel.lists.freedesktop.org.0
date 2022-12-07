Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292C664574F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 11:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BCE10E386;
	Wed,  7 Dec 2022 10:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49DB10E386
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 10:15:29 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p2rSa-0001Ko-Bo; Wed, 07 Dec 2022 11:15:28 +0100
Message-ID: <d3433e207ff8ea243ff1d4cceeea19e4676c97c5.camel@pengutronix.de>
Subject: Re: [PATCH] drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
From: Lucas Stach <l.stach@pengutronix.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Date: Wed, 07 Dec 2022 11:15:25 +0100
In-Reply-To: <20221206192123.661448-1-robdclark@gmail.com>
References: <20221206192123.661448-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

Am Dienstag, dem 06.12.2022 um 11:21 -0800 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
> 
> In cases where implicit sync is used, it is still useful (for things
> like sub-allocation, etc) to allow userspace to opt-out of implicit
> sync on per-BO basis.
> 
Out of curiosity and because I have been thinking about something like
that for etnaviv for while: do you only use this for immutable buffers
or do you have some kind of userspace fencing in place for the
suballocated buffers?

Regards,
Lucas

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c        |  3 ++-
>  drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++++++++
>  include/uapi/drm/msm_drm.h           |  4 +++-
>  3 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 017a512982a2..e0e1199a822f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -45,9 +45,10 @@
>   * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
>   * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
>   * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
> + * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
>   */
>  #define MSM_VERSION_MAJOR	1
> -#define MSM_VERSION_MINOR	9
> +#define MSM_VERSION_MINOR	10
>  #define MSM_VERSION_PATCHLEVEL	0
>  
>  static const struct drm_mode_config_funcs mode_config_funcs = {
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index eb3536e3d66a..8bad07a04f85 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -334,9 +334,20 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
>  		if (ret)
>  			return ret;
>  
> +		/* If userspace has determined that explicit fencing is
> +		 * used, it can disable implicit sync on the entire
> +		 * submit:
> +		 */
>  		if (no_implicit)
>  			continue;
>  
> +		/* Otherwise userspace can ask for implicit sync to be
> +		 * disabled on specific buffers.  This is useful for internal
> +		 * usermode driver managed buffers, suballocation, etc.
> +		 */
> +		if (submit->bos[i].flags & MSM_SUBMIT_BO_NO_IMPLICIT)
> +			continue;
> +
>  		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
>  							      obj,
>  							      write);
> diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> index f54b48ef6a2d..329100016e7c 100644
> --- a/include/uapi/drm/msm_drm.h
> +++ b/include/uapi/drm/msm_drm.h
> @@ -222,10 +222,12 @@ struct drm_msm_gem_submit_cmd {
>  #define MSM_SUBMIT_BO_READ             0x0001
>  #define MSM_SUBMIT_BO_WRITE            0x0002
>  #define MSM_SUBMIT_BO_DUMP             0x0004
> +#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
>  
>  #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
>  					MSM_SUBMIT_BO_WRITE | \
> -					MSM_SUBMIT_BO_DUMP)
> +					MSM_SUBMIT_BO_DUMP | \
> +					MSM_SUBMIT_BO_NO_IMPLICIT)
>  
>  struct drm_msm_gem_submit_bo {
>  	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */


