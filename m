Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A5989BEB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C90510E3BB;
	Mon, 30 Sep 2024 07:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E876510E3BB
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 07:52:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4AAEFEC;
 Mon, 30 Sep 2024 00:52:34 -0700 (PDT)
Received: from [10.57.76.28] (unknown [10.57.76.28])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 872003F64C;
 Mon, 30 Sep 2024 00:52:02 -0700 (PDT)
Message-ID: <7a568b22-d259-4f04-98f7-b3b25f326037@arm.com>
Date: Mon, 30 Sep 2024 08:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Set FMODE_UNSIGNED_OFFSET in fop_flags
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc: Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
 Jan Kara <jack@suse.cz>, Boris Brezillon <boris.brezillon@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240929221034.1889572-1-linkmauve@linkmauve.fr>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20240929221034.1889572-1-linkmauve@linkmauve.fr>
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

On 29/09/2024 23:10, Emmanuel Gil Peyrot wrote:
> This fixes a regression introduced in commit
> 641bb4394f405cba498b100b44541ffc0aed5be1.  No panthor device, card or
> render node, could be open() since this commit, returning EINVAL
> instead.  This prevented Mesa from working on SoCs such as the rk3588
> which contains a Mali-G610 GPU.
> 
> The commit mentions which drivers must be changed to set that flag, but
> panthor seemingly got forgotten, triggering the WARN_ON_ONCE() added
> in drm_open_helper().

Hi Emmanuel,

Liviu posted an identical patch earlier:

https://lore.kernel.org/r/20240920102802.2483367-1-liviu.dudau%40arm.com

The problem is because 641bb4394f40 isn't yet back-merged into any DRM
tree we can't merge it yet (as that commit added the definition of
FOP_UNSIGNED_OFFSET).

Liviu was going to ask the DRM maintainers for advice - I'm not sure
what the outcome way. But anyway we should get -rc1 back-merged soon and
then can apply this to drm-misc-fixes.

Thanks,
Steve

> ---
>  drivers/gpu/drm/panthor/panthor_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 34182f67136c..c520f156e2d7 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1383,6 +1383,7 @@ static const struct file_operations panthor_drm_driver_fops = {
>  	.read = drm_read,
>  	.llseek = noop_llseek,
>  	.mmap = panthor_mmap,
> +	.fop_flags = FOP_UNSIGNED_OFFSET,
>  };
>  
>  #ifdef CONFIG_DEBUG_FS

