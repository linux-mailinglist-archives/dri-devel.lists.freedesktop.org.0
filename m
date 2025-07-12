Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145F2B02C71
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 20:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C176C10E0B7;
	Sat, 12 Jul 2025 18:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZWXW1XZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD0210E0B7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Jul 2025 18:27:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 069EAA54BBB;
 Sat, 12 Jul 2025 18:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CFDC4CEEF;
 Sat, 12 Jul 2025 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752344864;
 bh=W4g+kjPJ3K8wnVxOEoch4S5NoRMOytbxldAomVbV/v0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZWXW1XZgDikeuWRB5J/Tz5ESJdFkvhkISXQGON87SCIAGEOr3D+w2+8g32CMtr5mL
 hzpMhb5xonrIZeSJj+vuO88OTjh9J35oiByaffCj//mgGHgwQmR5/y+OZLiZ4tvJ3X
 YVKZoLYq5E8Ihj3aXPObLsFKC1XuAMNr1cPtwcSL7C1pbP0NGJiKuFmjDRIZYOyva2
 lk8nxcIYd81fT0y5Ejj/tlcZBKrLP6JJJAFE3FHIirlCUsYw5uSpDSA7JF/Y9t5cBX
 NHPBBpLkauCZGqVfrnzFOtYR8ei3eohbb8br5X3qWaXyQIj+Jn85sI76Lrikv0w2on
 efi92+bYdR9Zw==
Message-ID: <acd5b3e3-5370-49a4-aad9-b1001aa0eb5a@kernel.org>
Date: Sat, 12 Jul 2025 19:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250703183455.2074215-1-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250703183455.2074215-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
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



On 7/3/25 7:34 PM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_reserved_mem_lookup() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Srinivas Kandagatla <srini@kernel.org>


Greg, there are no more patches for fastrpc for this cycle, can you
please pick this up via char-misc tree?


thanks,
Srini



>  drivers/misc/fastrpc.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..53e88a1bc430 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2262,8 +2262,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	int i, err, domain_id = -1, vmcount;
>  	const char *domain;
>  	bool secure_dsp;
> -	struct device_node *rmem_node;
> -	struct reserved_mem *rmem;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
> @@ -2306,20 +2304,17 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> -	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> +	if (domain_id == SDSP_DOMAIN_ID) {
> +		struct resource res;
>  		u64 src_perms;
>  
> -		rmem = of_reserved_mem_lookup(rmem_node);
> -		if (!rmem) {
> -			err = -EINVAL;
> -			goto err_free_data;
> -		}
> +		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
> +		if (!err) {
> +			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -		src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
> +			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);
> +		}
>  
>  	}
>  

