Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3282CB2DA9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Dec 2025 12:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B9E10E258;
	Wed, 10 Dec 2025 11:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 325EC10E1F8;
 Wed, 10 Dec 2025 11:49:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A8FB153B;
 Wed, 10 Dec 2025 03:49:27 -0800 (PST)
Received: from [10.57.45.72] (unknown [10.57.45.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A77063F762;
 Wed, 10 Dec 2025 03:49:28 -0800 (PST)
Message-ID: <c78de0f8-fc58-4fde-b39f-4b6dcb34a3e5@arm.com>
Date: Wed, 10 Dec 2025 11:49:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/pan*: don't abuse current->group_leader
To: Oleg Nesterov <oleg@redhat.com>, Todd Kjos <tkjos@android.com>,
 Martijn Coenen <maco@android.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, =?UTF-8?Q?Adri=C3=A1n_Larumbe?=
 <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
References: <aTV1maDfDvqgu1oT@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <aTV1maDfDvqgu1oT@redhat.com>
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

On 07/12/2025 12:39, Oleg Nesterov wrote:
> Cleanup and preparation to simplify the next changes.
> 
> Use current->tgid instead of current->group_leader->pid.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Acked-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>  drivers/gpu/drm/panthor/panthor_gem.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
> index 8041b65c6609..1ff1f2c8b726 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
> @@ -17,7 +17,7 @@
>  static void panfrost_gem_debugfs_bo_add(struct panfrost_device *pfdev,
>  					struct panfrost_gem_object *bo)
>  {
> -	bo->debugfs.creator.tgid = current->group_leader->pid;
> +	bo->debugfs.creator.tgid = current->tgid;
>  	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
>  
>  	mutex_lock(&pfdev->debugfs.gems_lock);
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index fbde78db270a..29cc57efc4b9 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -27,7 +27,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>  	struct panthor_device *ptdev = container_of(bo->base.base.dev,
>  						    struct panthor_device, base);
>  
> -	bo->debugfs.creator.tgid = current->group_leader->pid;
> +	bo->debugfs.creator.tgid = current->tgid;
>  	get_task_comm(bo->debugfs.creator.process_name, current->group_leader);
>  
>  	mutex_lock(&ptdev->gems.lock);

