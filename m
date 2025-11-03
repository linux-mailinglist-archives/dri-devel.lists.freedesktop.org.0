Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F1CC2C6E6
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 15:36:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C31B10E418;
	Mon,  3 Nov 2025 14:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0C3AB10E40B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 14:36:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6941D14
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:36:21 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E5393F694
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:36:29 -0800 (PST)
Date: Mon, 3 Nov 2025 14:36:25 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/2] drm/panthor: Handle errors returned by
 drm_sched_entity_init()
Message-ID: <aQi96WW4nm1EzdUN@e110455-lin.cambridge.arm.com>
References: <20251031160318.832427-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031160318.832427-1-boris.brezillon@collabora.com>
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

On Fri, Oct 31, 2025 at 05:03:17PM +0100, Boris Brezillon wrote:
> In practice it's not going to fail because we're passing the current
> sanity checks done by drm_sched_entity_init(), and that's the only
> reason it would return an error, but better safe than sorry.
> 
> v2:
> - Add R-b

Hi,

Pushed the series to drm-misc-next but edited the commit messages to
drop the v2 text.

Best regards,
Liviu

> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 4216913ad7c9..33e04208db31 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3430,6 +3430,8 @@ group_create_queue(struct panthor_group *group,
>  
>  	drm_sched = &queue->scheduler;
>  	ret = drm_sched_entity_init(&queue->entity, 0, &drm_sched, 1, NULL);
> +	if (ret)
> +		goto err_free_queue;
>  
>  	return queue;
>  
> -- 
> 2.51.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
