Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B25A16971
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 10:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F7E10E390;
	Mon, 20 Jan 2025 09:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="a5BW+f2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0BC10E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 09:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737365167;
 bh=XLHW9Xlxwngn1I2lo/Z1hj+kDSsOP1FLCFa0VV5xfCE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=a5BW+f2PvqMj5ersOmtnCf65IJhY46344qAOOP1z5Igiqft3KSvTgMQ3ymw+2QKfJ
 kp/58w87j0UHxb+da2CSIaWwg93z+i3NS6ErA8T8dTjOBiXGl+YqT/sXkGvDnCCYHr
 XAD7oxPufYgQ1LENk8uKFqGuKDmB/pAMDDx4iUe2UrDnsyPZV3SIYxCAmJQ9bHCzcU
 0b5n2nwO1OMZJdavUStvB6qdW4VzsKDXtt14S2YjGARN3qQ1nPlyLNDKYknlDnZ1zs
 B7+iN6E8EC5QQZDurKnBiPjalwjs3Yd7Pl+SmnPa/0HM8Lz/FRyzAOMWZSa1nkzyMJ
 LV48ZhQ+xQw/Q==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B95F017E023F;
 Mon, 20 Jan 2025 10:26:06 +0100 (CET)
Date: Mon, 20 Jan 2025 10:26:00 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Su Hui <suhui@nfschina.com>
Cc: steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, mary.guillemard@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: avoid garbage value in
 panthor_ioctl_dev_query()
Message-ID: <20250120102600.39b1be80@collabora.com>
In-Reply-To: <20250119025828.1168419-1-suhui@nfschina.com>
References: <20250119025828.1168419-1-suhui@nfschina.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Sun, 19 Jan 2025 10:58:29 +0800
Su Hui <suhui@nfschina.com> wrote:

> 'priorities_info' is uninitialized, and the uninitialized value is copied
> to user object when calling PANTHOR_UOBJ_SET(). Using memset to initialize
> 'priorities_info' to avoid this garbage value problem.
> 
> Fixes: f70000ef2352 ("drm/panthor: Add DEV_QUERY_GROUP_PRIORITIES_INFO dev query")
> Signed-off-by: Su Hui <suhui@nfschina.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

