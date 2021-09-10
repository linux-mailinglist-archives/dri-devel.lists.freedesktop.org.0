Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285D4070DD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 20:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C806EA5E;
	Fri, 10 Sep 2021 18:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03D3A6EA5E;
 Fri, 10 Sep 2021 18:24:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C95BC6D;
 Fri, 10 Sep 2021 11:24:47 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2AD13F5A1;
 Fri, 10 Sep 2021 11:24:46 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: add a WARN_ON in ttm_set_driver_manager when
 array bounds (v2)
To: Guchun Chen <guchun.chen@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 xinhui.pan@amd.com, alexander.deucher@amd.com
Cc: Leslie Shi <Yuliang.Shi@amd.com>
References: <20210910100922.12097-1-guchun.chen@amd.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <868cab56-607b-bcc8-e358-b2475315f862@arm.com>
Date: Fri, 10 Sep 2021 19:24:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210910100922.12097-1-guchun.chen@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 2021-09-10 11:09, Guchun Chen wrote:
> Vendor will define their own memory types on top of TTM_PL_PRIV,
> but call ttm_set_driver_manager directly without checking mem_type
> value when setting up memory manager. So add such check to aware
> the case when array bounds.
> 
> v2: lower check level to WARN_ON
> 
> Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
> ---
>   include/drm/ttm/ttm_device.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 07d722950d5b..aa79953c807c 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -291,6 +291,7 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)
>   static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
>   					  struct ttm_resource_manager *manager)
>   {
> +	WARN_ON(type >= TTM_NUM_MEM_TYPES);

Nit: I know nothing about this code, but from the context alone it would 
seem sensible to do

	if (WARN_ON(type >= TTM_NUM_MEM_TYPES))
		return;

to avoid making the subsequent assignment when we *know* it's invalid 
and likely to corrupt memory.

Robin.

>   	bdev->man_drv[type] = manager;
>   }
>   
> 
