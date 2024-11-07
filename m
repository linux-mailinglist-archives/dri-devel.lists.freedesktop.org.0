Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763959C0297
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 11:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E8910E7EC;
	Thu,  7 Nov 2024 10:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="C9mMt3q9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B126310E7F7;
 Thu,  7 Nov 2024 10:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I/wj5FuLo31/fpnWb4VJXuQTUN+dwPCJttGkV3MBVS0=; b=C9mMt3q9FCa9LTALsiyHOPTo3E
 LPgZcDE3GZNshn3tFJDHp53XdtWHITHZFEMEhj6MVWx7cfC1MyGO/WS22qz+6SadyfWiWNbJhjcHO
 KcLwJYK1XvTdmlwqdFv4fcmFQv/GCaQg+hF7ywKallUVDy8DC/9pWrIVWRxuXBCfN8lVoanHIU+7F
 cos89d4wRQD84M5pGeL+TluKodrCS25OSIWV274sDd9d+0DcyA3iY3QfXiRB4tgqK/xBO1y77M6FQ
 mtKfIyoQDO2vMeo4JVsYqF6fYVPXU42+SiTYJGv0SNIaZhJlTVCJuNV+rBT1ksEpvPO8r5bwi54uP
 h1XrBw5g==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t8zwo-003WcZ-P4; Thu, 07 Nov 2024 11:41:06 +0100
Message-ID: <b31fd5b2-094a-4d3a-bab9-83102726eefa@igalia.com>
Date: Thu, 7 Nov 2024 10:41:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
To: Yunxiang Li <Yunxiang.Li@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
 <20241025174113.554-5-Yunxiang.Li@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20241025174113.554-5-Yunxiang.Li@amd.com>
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


On 25/10/2024 18:41, Yunxiang Li wrote:
> Add a helper to check if the memory stats is zero, this will be used to
> check for memory accounting errors.
> 
> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
> ---
>   drivers/gpu/drm/drm_file.c | 9 +++++++++
>   include/drm/drm_file.h     | 1 +
>   2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 714e42b051080..75ed701d80f74 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -859,6 +859,15 @@ static void print_size(struct drm_printer *p, const char *stat,
>   	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
>   }
>   
> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
> +	return (stats->shared == 0 &&
> +		stats->private == 0 &&
> +		stats->resident == 0 &&
> +		stats->purgeable == 0 &&
> +		stats->active == 0);
> +}

Could use mem_is_zero() for some value of source/binary compactness.

> +EXPORT_SYMBOL(drm_memory_stats_is_zero);
> +

I am not a huge fan of adding this as an interface as the only caller 
appears to be a sanity check in amdgpu_vm_fini():

	if (!amdgpu_vm_stats_is_zero(vm))
		dev_err(adev->dev, "VM memory stats is non-zero when fini\n");

But I guess there is some value in sanity checking since amdgpu does not 
have a notion of debug only code (compiled at production and exercised 
via a test suite).

I do suggest to demote the dev_err to notice log level would suffice and 
be more accurate.

Regards,

Tvrtko

>   /**
>    * drm_print_memory_stats - A helper to print memory stats
>    * @p: The printer to print output to
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index ab230d3af138d..7f91e35d027d9 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -477,6 +477,7 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,
