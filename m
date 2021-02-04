Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5530F4BA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 15:18:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED6D6ED85;
	Thu,  4 Feb 2021 14:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1420 seconds by postgrey-1.36 at gabe;
 Thu, 04 Feb 2021 14:18:04 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774816ED85
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=Wd62viddt+iw8X6Ld4I3X5EG1RRTcCilLHqUFE853sI=; 
 b=LFCseJJQP/UUqXtSVTwIsLQ/WuIewIiAnGpFhS8SXQMvy5EBNMVDu14uSobCR0zFydS1wqNaIa25T44SSCmOemZGj5wjYLhqk6qYvXRRtC4UTyIUOq7zcf5FCqJOe1QTcVq7ne1vg7ssw367rUjF167wt7M/3VA8Iho5ie6NDXCN7t1d2kafsYZXCPxcKmtpymG5wFNt8X0Tcxun1pr8sutUEHd1zk3DwZW+whadW1b7AI0W7XcorpKZP9xQ7Pke1nzSHyTRpk1FvNNVUSUVVzfkriVK4qPRySQ7gp82yS4tBJ/897oX4W5xy5e8lHZVPa2Wci/A9q/5+FMUE8dPMw==;
Received: from 91.34.165.83.dynamic.reverse-mundo-r.com ([83.165.34.91]
 helo=[192.168.50.10]) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1l7f5Q-0003Gj-Me; Thu, 04 Feb 2021 14:54:20 +0100
Subject: Re: [PATCH 1/3] drm/v3d: Don't resubmit guilty CSD jobs
To: Yukimasa Sugizaki <ysugi@idein.jp>, dri-devel@lists.freedesktop.org
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
 <20200903164821.2879-2-i.can.speak.c.and.basic@gmail.com>
From: Chema Casanova <jmcasanova@igalia.com>
Message-ID: <c934402e-efe7-8e7a-0182-5ffd2d05a4e8@igalia.com>
Date: Thu, 4 Feb 2021 14:54:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20200903164821.2879-2-i.can.speak.c.and.basic@gmail.com>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've tested the patch and confirmed that applies correctly over drm-next.

I've also confirmed that the timeout happens with the described test 
case by the developer.

https://github.com/raspberrypi/linux/pull/3816#issuecomment-682251862

Considering this is my first review of a patch in v3d kernel side I 
think this patch is fine.

Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

On 3/9/20 18:48, Yukimasa Sugizaki wrote:
> From: Yukimasa Sugizaki <ysugi@idein.jp>
>
> The previous code misses a check for the timeout error set by
> drm_sched_resubmit_jobs(), which results in an infinite GPU reset loop
> if once a timeout occurs:
>
> [  178.799106] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
> [  178.807836] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
> [  179.839132] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
> [  179.847865] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
> [  180.879146] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
> [  180.887925] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
> [  181.919188] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
> [  181.928002] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
> ...
>
> This commit adds the check for timeout as in v3d_{bin,render}_job_run():
>
> [   66.408962] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* Resetting GPU for hang.
> [   66.417734] v3d fec00000.v3d: [drm:v3d_reset [v3d]] *ERROR* V3D_ERR_STAT: 0x00001000
> [   66.428296] [drm] Skipping CSD job resubmission due to previous error (-125)
>
> , where -125 is -ECANCELED, though users currently have no way other
> than inspecting the dmesg to check if the timeout has occurred.
>
> Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 0747614a78f0..001216f22017 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -226,6 +226,17 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
>   	struct dma_fence *fence;
>   	int i;
>
> +	/* This error is set to -ECANCELED by drm_sched_resubmit_jobs() if this
> +	 * job timed out more than sched_job->sched->hang_limit times.
> +	 */
> +	int error = sched_job->s_fence->finished.error;
> +
> +	if (unlikely(error < 0)) {
> +		DRM_WARN("Skipping CSD job resubmission due to previous error (%d)\n",
> +			 error);
> +		return ERR_PTR(error);
> +	}
> +
>   	v3d->csd_job = job;
>
>   	v3d_invalidate_caches(v3d);
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
