Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D1C0E6F6
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:31:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E110E4BC;
	Mon, 27 Oct 2025 14:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="JFCRzvik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7C310E4BC
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761575501;
 bh=VdWLvlec4owgKSLuZPZ5AeOCOOq3PaC0ucUYJYVqsAU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JFCRzvikkg0zalCE058zIPnyylLwZMQ3GhgSH4FDe8dgcbDs5qmsiaTXnogTsic+Y
 +r0H2l5aXJb7jTXzKKU/q20dlfSxuWKEDyPDiABiFABOVYt7x9J3Qvm4lVbc2FxUsg
 PZbxPxmi0kXgVWeygww0Try/IDhuip8Pk22enS1mJv8xMsT2hdzWUc9ZPihm0rSykC
 Lzy/0r5OjDpA663JCCu70T+MmydQlONWeKIWWAwha2Qy0+pBsEuhIchRT1rn5+TU7m
 0Jg9rcrhkK84Bmgc0TXU//vyFNv38903TU5Z/g2nqsDDz2Ywesmy8D77gYRbZIId/J
 9M0Jp0i7UoljQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3ED3F17E12D5;
 Mon, 27 Oct 2025 15:31:41 +0100 (CET)
Date: Mon, 27 Oct 2025 15:31:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Heiko Stuebner
 <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/panthor: Fix UAF race between device unplug and
 FW event processing
Message-ID: <20251027153130.2e9ccee2@fedora>
In-Reply-To: <20251027140217.121274-1-ketil.johnsen@arm.com>
References: <20251027140217.121274-1-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Mon, 27 Oct 2025 15:02:15 +0100
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> The function panthor_fw_unplug() will free the FW memory sections.
> The problem is that there could still be pending FW events which are yet
> not handled at this point. process_fw_events_work() can in this case try
> to access said freed memory.
> 
> Simply call disable_work_sync() to both drain and prevent future
> invocation of process_fw_events_work().
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Fixes: de85488138247 ("drm/panthor: Add the scheduler logical block")

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Would you mind sending a patch on top of this one turning all
cancel_[delayed_]work_sync() happening in the unplug path int
disable_[delayed_]work_sync(), so we're sure we won't face other "work
in queued after being cancelled" issues in the future.

> ---
> v2:
> - Followed Boris's advice and handle the race purely within the
>   scheduler block (by adding a destroyed state)
> 
> v3:
> - New approach, one single call to disable_work_sync()
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 0cc9055f4ee52..b7595beaa0205 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3880,6 +3880,7 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  
>  	cancel_delayed_work_sync(&sched->tick_work);
> +	disable_work_sync(&sched->fw_events_work);
>  
>  	mutex_lock(&sched->lock);
>  	if (sched->pm.has_ref) {

