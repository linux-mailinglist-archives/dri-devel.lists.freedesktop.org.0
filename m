Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904239C8812
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 11:51:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522ED10E7DE;
	Thu, 14 Nov 2024 10:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD71C10E7D9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 10:50:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 624052BC2;
 Thu, 14 Nov 2024 02:51:29 -0800 (PST)
Received: from [10.1.26.55] (e122027.cambridge.arm.com [10.1.26.55])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BEEE3F6A8;
 Thu, 14 Nov 2024 02:50:58 -0800 (PST)
Message-ID: <35784fb5-a53d-4893-8e21-661ebe28a35d@arm.com>
Date: Thu, 14 Nov 2024 10:50:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/panthor: Preserve the result returned by
 panthor_fw_resume()
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
 <20241113154257.1971284-2-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241113154257.1971284-2-boris.brezillon@collabora.com>
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

On 13/11/2024 15:42, Boris Brezillon wrote:
> WARN() will return true if the condition is true, false otherwise.
> If we store the return of drm_WARN_ON() in ret, we lose the actual
> error code.
> 
> Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 4082c8f2951d..db7ba40f771d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -441,8 +441,8 @@ int panthor_device_resume(struct device *dev)
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
>  		panthor_gpu_resume(ptdev);
>  		panthor_mmu_resume(ptdev);
> -		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
> -		if (!ret) {
> +		ret = panthor_fw_resume(ptdev);
> +		if (!drm_WARN_ON(&ptdev->base, ret)) {
>  			panthor_sched_resume(ptdev);
>  		} else {
>  			panthor_mmu_suspend(ptdev);

