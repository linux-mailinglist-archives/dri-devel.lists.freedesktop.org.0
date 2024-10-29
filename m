Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719379B4435
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 09:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA6D10E5D1;
	Tue, 29 Oct 2024 08:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="cCBhpok4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 527 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2024 08:27:37 UTC
Received: from msa.smtpout.orange.fr (msa-209.smtpout.orange.fr
 [193.252.23.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7808F10E5D1;
 Tue, 29 Oct 2024 08:27:37 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id 5hR7twWHkhwv35hR7tySSs; Tue, 29 Oct 2024 09:18:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1730189928;
 bh=b+GxDsuZC4j8RNTX1hXyuIOyIWp5LC02jZqsiJ2B6H4=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=cCBhpok4W6M/oxZwRUtwfYmiunXFw2E7NgZPIMpIdvch+Ejyefnv6D6xwtGAAkbvN
 9KEpDHsq8nKlSd+9H03Z+lSynoDGS/Ht/U7JR+yXFw3JpbIBX+JWIOXpbI/brqaUkK
 yzTDzyiJ6YevTb+IW1qwNrYJzUafqtyGTBeRrzSyotm61wTO90fnDnAB+cSiTMvKLs
 0B2YPNZQ75ngSPjRJ4msmoL4749u35tNwdoLCwlpvAudICOhmT30JOYSyY1MCBMqpA
 MN3B1+w7EBpkGleABZ/ZEgcszSvDdgFRNSckXb+6psXEdPXWm7xJ+AwyyH2+fEAKUh
 /Qpab+NbMgirQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 29 Oct 2024 09:18:48 +0100
X-ME-IP: 90.11.132.44
Message-ID: <2a070669-aa48-413e-959c-4107d9c2f97c@wanadoo.fr>
Date: Tue, 29 Oct 2024 09:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: Fix possible NULL pointer dereference
To: Li Huafei <lihuafei1@huawei.com>, alexander.deucher@amd.com,
 lijo.lazar@amd.com
Cc: christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 simona@ffwll.ch, Hawking.Zhang@amd.com, yifan1.zhang@amd.com,
 Likun.Gao@amd.com, Tim.Huang@amd.com, pratap.nirujogi@amd.com,
 victorchengchi.lu@amd.com, Jun.Ma2@amd.com, le.ma@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241029101839.2605713-1-lihuafei1@huawei.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241029101839.2605713-1-lihuafei1@huawei.com>
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

Le 29/10/2024 à 11:18, Li Huafei a écrit :
> Fix the potential NULL pointer dereference on mem_ranges in
> amdgpu_discovery_get_nps_info(). Additionally, assign the output
> parameters nps_type and range_cnt after the kvzalloc() call to prevent
> modifying the output parameters in case of an error return.
> 
> Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
> Changes in v2:
>   - kvzalloc() call uses 'nps_info->v1.count' instead of '*range_cnt'
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> index 4bd61c169ca8..9a0b1b208a9d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
>   
>   	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
>   	case 1:
> -		*nps_type = nps_info->v1.nps_type;
> -		*range_cnt = nps_info->v1.count;
>   		mem_ranges = kvzalloc(

Not strictly related to your fix, but this could also be kvcalloc() to 
avoid potential overflow in the multiplication.

CJ

> -			*range_cnt * sizeof(struct amdgpu_gmc_memrange),
> +			nps_info->v1.count * sizeof(struct amdgpu_gmc_memrange),
>   			GFP_KERNEL);
> +		if (!mem_ranges)
> +			return -ENOMEM;
> +		*nps_type = nps_info->v1.nps_type;
> +		*range_cnt = nps_info->v1.count;
>   		for (i = 0; i < *range_cnt; i++) {
>   			mem_ranges[i].base_address =
>   				nps_info->v1.instance_info[i].base_address;

