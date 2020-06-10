Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E331F5233
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 12:26:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A95B6E0BC;
	Wed, 10 Jun 2020 10:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DCB6E0BC;
 Wed, 10 Jun 2020 10:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id E15653F9F5;
 Wed, 10 Jun 2020 12:25:56 +0200 (CEST)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="QIwAgYRB";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e4UsNpfjkLuV; Wed, 10 Jun 2020 12:25:56 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 2428A3F4CA;
 Wed, 10 Jun 2020 12:25:53 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 25F71360060;
 Wed, 10 Jun 2020 12:25:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1591784753; bh=wU8RKATsV6OHlRI0fpBbOdnJVaB9z2zis0YvRywgYtQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QIwAgYRBj9TuooCL9Dj4Kj+d3aveIvKWfmhMP8O6s+m0rhfvvfUNezMpy4to4a5CF
 zxtqXe67Rs/YgxndNbGHb+Nqn91edpxLOBRymBo+kpI/UziRu8Xt3ynQ+oBq6UwdC8
 wCt00s4FY0zk8o5BSAsHbdVbAj5jKenDPtD8edls=
Subject: Re: [PATCH 5/6] drm/ttm: Add destroy flag in TTM BO eviction interface
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <1589050310-19666-6-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <dd61e068-cbf1-c612-2c7f-f1e7786b16f7@shipmail.org>
Date: Wed, 10 Jun 2020 12:25:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1589050310-19666-6-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/9/20 8:51 PM, Andrey Grodzovsky wrote:
> This will allow to invalidate, destroy backing storage and notify users
> of BOs when device is unpluged.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

Please add a motivation in the commit message and use imperative wording 
("Allow to invalidate..." instead of "This will allow to")

s /unpluged/unplugged/


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c            |  4 +--
>   drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                | 41 ++++++++++++++++++-----------
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 ++---
>   include/drm/ttm/ttm_bo_api.h                |  2 +-
>   8 files changed, 35 insertions(+), 26 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index b9bc1b0..9d57b8c 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -597,7 +597,7 @@ int ttm_bo_clean_mm(struct ttm_bo_device *bdev, unsigned mem_type);
>    * -ERESTARTSYS: The call was interrupted by a signal while waiting to
>    * evict a buffer.
>    */

Please also update the function documentation.

> -int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type);
> +int ttm_bo_evict_mm(struct ttm_bo_device *bdev, unsigned mem_type, bool destroy);
>   
>   /**
>    * ttm_kmap_obj_virtual


Thanks,

Thomas


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
