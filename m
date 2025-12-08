Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2A0CAC7C6
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 09:23:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5A210E3C5;
	Mon,  8 Dec 2025 08:23:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ixQkjy7r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766CD10E3C5;
 Mon,  8 Dec 2025 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765182229;
 bh=HahwClOUPbY8lYOiDnAM6v1rk/QJWpGTlK1cCdtwK0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ixQkjy7rJibW29crRfhTQtaul/vOnLCOvAdfgkKV5rrYSpOijD+Sx7VeFnQT12TzM
 ezC1jZOAPUsDizd7ZeNCEJoZVoL/7yfmHTOAqLBrWCZOQovKxaWpP8R4WIZWPA9fwe
 5JVYhPylQIle5ukhirviQLjACzt2mwW3u7vovoJ2hYaPppC/yGr/8pzdHr1geXYShE
 /WN1ipP+MpVOKJkBFIAUXR5dNstvYk38jhvCBJ8d9k20Bd0YdaOAXCeVaXugKAnk64
 xCouvH8RDyY6nvIWoEHOwio+mo3HpmjNNyPIgfQIkz3Bo7Rh6VJdNLKnPGIcOSxzmm
 AYOnOT5jFe1Zw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id F3C0217E0E30;
 Mon,  8 Dec 2025 09:23:47 +0100 (CET)
Date: Mon, 8 Dec 2025 09:23:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel
 Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>,
 Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan
 <surenb@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Steven Price
 <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liviu Dudau <liviu.dudau@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 5/7] drm/pan*: don't abuse current->group_leader
Message-ID: <20251208092343.2cbca352@fedora>
In-Reply-To: <aTV1maDfDvqgu1oT@redhat.com>
References: <aTV1KYdcDGvjXHos@redhat.com>
	<aTV1maDfDvqgu1oT@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sun, 7 Dec 2025 13:39:53 +0100
Oleg Nesterov <oleg@redhat.com> wrote:

> Cleanup and preparation to simplify the next changes.
> 
> Use current->tgid instead of current->group_leader->pid.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
>  drivers/gpu/drm/panthor/panthor_gem.c   | 2 +-

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

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

