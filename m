Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A1F8BA9C8
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 11:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9B110F9F0;
	Fri,  3 May 2024 09:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8753910F9F0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 09:22:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76F4C2F4;
 Fri,  3 May 2024 02:22:42 -0700 (PDT)
Received: from [10.1.39.22] (e122027.cambridge.arm.com [10.1.39.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B43FF3F73F;
 Fri,  3 May 2024 02:22:15 -0700 (PDT)
Message-ID: <eba9c75d-ad1f-4c73-86de-624cb54e20a7@arm.com>
Date: Fri, 3 May 2024 10:22:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/panthor: Reset the FW VM to NULL on unplug
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
 <20240502183813.1612017-4-boris.brezillon@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20240502183813.1612017-4-boris.brezillon@collabora.com>
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

On 02/05/2024 19:38, Boris Brezillon wrote:
> This way get NULL derefs instead of use-after-free if the FW VM is
> referenced after the device has been unplugged.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index b41685304a83..93165961a6b5 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -1141,6 +1141,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>  	 * state to keep the active_refcnt balanced.
>  	 */
>  	panthor_vm_put(ptdev->fw->vm);
> +	ptdev->fw->vm = NULL;
>  
>  	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
>  }

