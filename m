Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3D4C58D28
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:45:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A0010E8C9;
	Thu, 13 Nov 2025 16:45:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CA3RziZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8008C10E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763052333; x=1794588333;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DZ65OqEYwdNFF6KiH64cjQNsny+9tsnZlOAkumCdths=;
 b=CA3RziZfzAzYuPWkD+rEvobfkRNRWOiPqStuc7VKZPcFLygUSVm6mzeo
 Wv8HNO0AfyC9Or+mWOyk27uGv0uyNzYELPk6csjvtqUwDxcOxJcBnqxzC
 qWR7+Wr+8Uh4V3LLj/L7gRXYH2B9IsUx3LW55DdWWyFHQYuJfJzGwbnP/
 G8DihGjI1SjySCsCZdELuLr0R1LcY+A31m0DdI3jGG8+mVjEMc1SKYAjP
 QS+gsM4tmmb/zJMSUJ6twzWcDIi5wzh7J2fQxFA8tQIFo65oaIyfFEW7V
 OfO5cYlw8G+BMlt231Jrjngp61wMupZTcuNpPe3xwZnP+tARHwvyHrRmZ g==;
X-CSE-ConnectionGUID: +2vM8evQTbiyHTq4hbpgAg==
X-CSE-MsgGUID: 2uQs4H4rSy+xHvftH+35Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69004361"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="69004361"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:45:32 -0800
X-CSE-ConnectionGUID: v1gPspn3R96lLRORcTSDUQ==
X-CSE-MsgGUID: vVL/sWyXTr+KKTDL8OguTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="212944298"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.246.18.39])
 ([10.246.18.39])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:45:30 -0800
Message-ID: <9ae59f7e-9d99-4e73-a805-99586d8f49bb@linux.intel.com>
Date: Thu, 13 Nov 2025 17:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Fix deadlock between context destroy and
 job timeout
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20251107181050.1293125-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20251107181050.1293125-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

You could add some lockdep assertions for dev_lock to better track its 
state.

Best regards,
Maciej

On 11/7/2025 7:10 PM, Lizhi Hou wrote:
> Hardware context destroy function holds dev_lock while waiting for all jobs
> to complete. The timeout job also needs to acquire dev_lock, this leads to
> a deadlock.
>
> Fix the issue by temporarily releasing dev_lock before waiting for all
> jobs to finish, and reacquiring it afterward.
>
> Fixes: 4fd6ca90fc7f ("accel/amdxdna: Refactor hardware context destroy routine")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_ctx.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index bdc90fe8a47e..42d876a427c5 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -690,17 +690,19 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>   	xdna = hwctx->client->xdna;
>   
>   	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
> -	drm_sched_entity_destroy(&hwctx->priv->entity);
> -
>   	aie2_hwctx_wait_for_idle(hwctx);
>   
>   	/* Request fw to destroy hwctx and cancel the rest pending requests */
>   	aie2_release_resource(hwctx);
>   
> +	mutex_unlock(&xdna->dev_lock);
> +	drm_sched_entity_destroy(&hwctx->priv->entity);
> +
>   	/* Wait for all submitted jobs to be completed or canceled */
>   	wait_event(hwctx->priv->job_free_wq,
>   		   atomic64_read(&hwctx->job_submit_cnt) ==
>   		   atomic64_read(&hwctx->job_free_cnt));
> +	mutex_lock(&xdna->dev_lock);
>   
>   	drm_sched_fini(&hwctx->priv->sched);
>   	aie2_ctx_syncobj_destroy(hwctx);
