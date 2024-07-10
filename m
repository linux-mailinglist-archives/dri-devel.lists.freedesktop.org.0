Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C3492D34C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 15:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11D410E7CC;
	Wed, 10 Jul 2024 13:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jWZWM4tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B50C10E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4kAYpNXLlLXB920zUa/04CWkfwmM7xDwjfJIpNAa8C0=; b=jWZWM4tpC02OfxR0wJOneXgiqm
 xs88iHUXWLvxkG8TO2Iz2ik60TMY9ic5MyKkGxBUO8hHwp44lZm5ZA5/ydfTXDpcLik2c15k+cXfz
 IIx7uKzyu/yHqTucYJHKs3PloXoU6dlVLJyVdg0YsXRoFIwT08tDrP8SzTNpj8ghN3F6ZJfMM5yFb
 j5No23uC4D8aK/QtEGKDlIvJMZjWUCX1vIpKMnL2MDBgj7AByroi0nl2tiMQQHiGoBYfB91xDhJf9
 JyGfhtDpkiTgDQ3OjCRxITNfoLXA1HMzkaBRPiF/auxqifIV9u8UCgj57lQ6UopA/H7I2NoBQf5dF
 z8mgfgdw==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRXdr-00DH94-Ey; Wed, 10 Jul 2024 15:45:55 +0200
Message-ID: <fe477eb3-f702-40ca-ad94-6862e8692e30@igalia.com>
Date: Wed, 10 Jul 2024 14:45:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/v3d: Prevent out of bounds access in
 performance query extensions
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-2-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240710134130.17292-2-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 10/07/2024 14:41, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Check that the number of perfmons userspace is passing in the copy and
> reset extensions is not greater than the internal kernel storage where
> the ids will be copied into.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: bae7cb5d6800 ("drm/v3d: Create a CPU job extension for the reset performance query job"
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: <stable@vger.kernel.org> # v6.8+

On this one I forgot to carry over from v1:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

Regards,

Tvrtko

> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 88f63d526b22..263fefc1d04f 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -637,6 +637,9 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	if (copy_from_user(&reset, ext, sizeof(reset)))
>   		return -EFAULT;
>   
> +	if (reset.nperfmons > V3D_MAX_PERFMONS)
> +		return -EINVAL;
> +
>   	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(reset.count,
> @@ -708,6 +711,9 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	if (copy.pad)
>   		return -EINVAL;
>   
> +	if (copy.nperfmons > V3D_MAX_PERFMONS)
> +		return -EINVAL;
> +
>   	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(copy.count,
