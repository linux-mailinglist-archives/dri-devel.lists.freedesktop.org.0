Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE5139E3D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 18:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AEE96E3FC;
	Mon,  7 Jun 2021 16:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F21A6E3FC
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 16:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 9ACB93FB5C;
 Mon,  7 Jun 2021 18:40:13 +0200 (CEST)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="W3e8cxqQ";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lRbCxKJtZ_p3; Mon,  7 Jun 2021 18:40:12 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id EA7823FB37;
 Mon,  7 Jun 2021 18:40:10 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.55.41])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 12C443600BE;
 Mon,  7 Jun 2021 18:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1623084010; bh=s1pA1qOitQXAR7AyVtLMgMefG/xeBCFCq2SY6VCEtIY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=W3e8cxqQRkMkt1ZSB/PanLyqpozhw+Ren9bjsq7rf3oH0fCzPSaUMg6MtRZbjdcls
 MSUF5dkO+L5Ha9kuhLvvyWnQEjuQiAVeDVY5En/3w0n0NnxMPyAKv6kjk2dJMBFF17
 alSBY09qCUBTej+G9pUVBzmJuhaJLSF4+tZNETPQ=
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
References: <20210602100914.46246-1-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
Date: Mon, 7 Jun 2021 18:40:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602100914.46246-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/2/21 12:09 PM, Christian König wrote:
...
> @@ -728,14 +728,15 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
>    */
>   static int ttm_bo_mem_force_space(struct ttm_buffer_object *bo,
>   				  const struct ttm_place *place,
> -				  struct ttm_resource *mem,
> +				  struct ttm_resource **mem,
>   				  struct ttm_operation_ctx *ctx)
>   {
>   	struct ttm_device *bdev = bo->bdev;
> -	struct ttm_resource_manager *man = ttm_manager_type(bdev, mem->mem_type);
> +	struct ttm_resource_manager *man;
>   	struct ww_acquire_ctx *ticket;
>   	int ret;
>   
> +	man = ttm_manager_type(bdev, (*mem)->mem_type);

Isn't (*mem) uninitialized here? Should be place->mem_type? Eviction is 
immediately sent to the bushes.

Got at least one additional NULL pointer deref to track down in the 
eviction code, but could be a merge error of mine as well.

/Thomas


