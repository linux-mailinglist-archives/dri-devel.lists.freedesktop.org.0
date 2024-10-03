Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827F98F0CC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 15:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5DB10E84B;
	Thu,  3 Oct 2024 13:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ispras.ru header.i=@ispras.ru header.b="f6DMs9mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 616 seconds by postgrey-1.36 at gabe;
 Thu, 03 Oct 2024 13:49:14 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43310E844;
 Thu,  3 Oct 2024 13:49:14 +0000 (UTC)
Received: from fpc (unknown [10.10.165.16])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3F68540A1DCA;
 Thu,  3 Oct 2024 13:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 3F68540A1DCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1727962735;
 bh=KOWqdSYd0HRIuG/HzcyDAFKhPmaylzN0roNXviZpNtw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f6DMs9mcJlTEHUqLTs5QPEMUO7gN0VYHvdDmd/FxOybqbeRUBvUpIagjui8SOv9vZ
 0DYyc/90v8TpSAxjE75gy5VUGqVGVkNcXu27F6n8d+RR/5hbeGUDOBvskxjKGnxgh9
 zYDYpR5pfyt4HfkQWc7/PPrL62IBlNdpvRVbgIJk=
Date: Thu, 3 Oct 2024 16:38:46 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 lvc-project@linuxtesting.org, Xinhui Pan <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [lvc-project] [PATCH v2] drm/amd/pm: check return value of
 amdgpu_irq_add_id()
Message-ID: <20241003-271275e284694a8c82dac508-pchelkin@ispras.ru>
References: <7b3ea9a6-575e-4fe5-98d9-6e53803188fa@amd.com>
 <20241002130149.1607979-1-Igor.A.Artemiev@mcst.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002130149.1607979-1-Igor.A.Artemiev@mcst.ru>
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

On Wed, 02. Oct 16:01, Igor Artemiev wrote:
> amdgpu_irq_ad_id() may fail and the irq handlers will not be registered.
> This patch adds error code check.
> 
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
> 
> Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
> ---
> v2: Remove the cast to struct amdgpu_device as Christian König 
> <christian.koenig@amd.com> suggested.
> 
>  .../drm/amd/pm/powerplay/hwmgr/smu_helper.c   | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> index 79a566f3564a..50a3085c00aa 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> @@ -647,28 +647,41 @@ int smu9_register_irq_handlers(struct pp_hwmgr *hwmgr)
>  {
>  	struct amdgpu_irq_src *source =
>  		kzalloc(sizeof(struct amdgpu_irq_src), GFP_KERNEL);
> +	int ret;
>  
>  	if (!source)
>  		return -ENOMEM;
>  
>  	source->funcs = &smu9_irq_funcs;
>  
> -	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +	ret = amdgpu_irq_add_id(hwmgr->adev,
>  			SOC15_IH_CLIENTID_THM,
>  			THM_9_0__SRCID__THM_DIG_THERM_L2H,
>  			source);
> -	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +	if (ret)
> +		goto err;
> +
> +	ret = amdgpu_irq_add_id(hwmgr->adev,
>  			SOC15_IH_CLIENTID_THM,
>  			THM_9_0__SRCID__THM_DIG_THERM_H2L,
>  			source);
> +	if (ret)
> +		goto err;
>  
>  	/* Register CTF(GPIO_19) interrupt */
> -	amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> +	ret = amdgpu_irq_add_id(hwmgr->adev,
>  			SOC15_IH_CLIENTID_ROM_SMUIO,
>  			SMUIO_9_0__SRCID__SMUIO_GPIO19,
>  			source);
> +	if (ret)
> +		goto err;
>  
>  	return 0;
> +
> +err:
> +	kfree(source);

Oh, the calltrace looks like:

hwmgr_sw_init()
  phm_register_irq_handlers()
    ->register_irq_handlers()
    smu9_register_irq_handlers()

And the return value of phm_register_irq_handlers() is not processed and
the error is not reported anywhere, so I guess there is a risk of
use-after-free: the source pointer may have been already registered by
some of amdgpu_irq_add_id() calls before the error occured.

The similar code exists in smu7_register_irq_handlers(), maybe should be
fixed as well.

Alex, is https://gitlab.freedesktop.org/agd5f/linux a public repo this
patch should go in? I'd suggest to drop the patch and ask Igor to do a
complete fix or, if dropping is not possible now, fix it by another patch.
For the latter one I can do this myself but it would be nice to refer to
the current patch via a git hash (it's probably not published yet in your
repo).

> +
> +	return ret;
>  }
>  
>  void *smu_atom_get_data_table(void *dev, uint32_t table, uint16_t *size,
> -- 
> 2.39.2
