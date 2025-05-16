Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35138AB990B
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E144810EA15;
	Fri, 16 May 2025 09:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="S1xtfRw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953EF10EA12;
 Fri, 16 May 2025 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HwPh2eBNs0hNXHHLT8tt8Qp541jzhDZo++QuI5wHTns=; b=S1xtfRw/E021Pp6I0qsKt4PurZ
 9YVzcuiyjEoihL0GxI8K13n1cs535UI3B/GFNTgIWviER+j22RK2X/uifKH9Hrvl/fGTvovjKNSTk
 lSiZlLSMLQ5EVN8RMYRGoRahHMawjKckJzDh0YCSU2dBAHVbDgIiBFmUEtO5hslCLBkOl5k0Ly4YC
 X7u8nZCiYAe+QrYVEnDh6dAnoxybPzu0Sh+DhthfY2wmFbhzvHgPp7WEako0H1lmXbU0yOfDoByfu
 SDIrHdXYnCapVb9ztulpwvHk/TEfld9sG9pTJ5eu4ZPUQHwwPAP6Dn5Ur2uvSpaYzusFYfVjDtzLw
 OPdoIaiQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uFrSD-0091XF-LP; Fri, 16 May 2025 11:40:08 +0200
Message-ID: <236644fd-dbf4-48b0-a341-a26c0c8b9515@igalia.com>
Date: Fri, 16 May 2025 10:40:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] drm/sched: Warn if pending list is not empty
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-5-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250424095535.26119-5-phasta@kernel.org>
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


On 24/04/2025 10:55, Philipp Stanner wrote:
> drm_sched_fini() can leak jobs under certain circumstances.
> 
> Warn if that happens.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index c2ad6c70bfb6..0c56b85c574f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1457,6 +1457,9 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	sched->ready = false;
>   	kfree(sched->sched_rq);
>   	sched->sched_rq = NULL;
> +
> +	if (!list_empty(&sched->pending_list))
> +		dev_err(sched->dev, "Tearing down scheduler while jobs are pending!\n");

Is this expected to trigger for many drivers? In that case I am not sure 
if it helps anyone, apart from generating bug tracker entries across the 
world, for the issue we know about and could work
"quietly" on addressing it? Only if you think we don't really know who 
leaks and who doesn't and this will help figure out.

Hm wait, at this point in the series it would fire incorrectly for the 
mock scheduler. It should go last in the series at minimum.

Regards,

Tvrtko

>   }
>   EXPORT_SYMBOL(drm_sched_fini);
>   

