Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624CCA16A2E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 11:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D448B10E389;
	Mon, 20 Jan 2025 10:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED6C210E389
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 10:01:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC5641063;
 Mon, 20 Jan 2025 02:01:53 -0800 (PST)
Received: from [10.57.5.233] (unknown [10.57.5.233])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3E13F66E;
 Mon, 20 Jan 2025 02:01:22 -0800 (PST)
Message-ID: <c72f4ab1-dcb1-48fb-aaf3-f9af3e74979a@arm.com>
Date: Mon, 20 Jan 2025 10:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
To: Su Hui <suhui@nfschina.com>, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: mary.guillemard@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20250119025828.1168419-1-suhui@nfschina.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250119025828.1168419-1-suhui@nfschina.com>
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

On 19/01/2025 02:58, Su Hui wrote:
> 'priorities_info' is uninitialized, and the uninitialized value is copied
> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> 'priorities_info' to avoid this garbage value problem.
> 
> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 0b3fbee3d37a..44f5c72d46c3 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -802,6 +802,7 @@ static void panthor_query_group_priorities_info(struct drm_file *file,
>  {
>  	int prio;
>  
> +	memset(arg, 0, sizeof(*arg));
>  	for (prio = PANTHOR_GROUP_PRIORITY_REALTIME; prio >= 0; prio--) {
>  		if (!group_priority_permit(file, prio))
>  			arg->allowed_mask |= BIT(prio);

