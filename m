Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B823A33E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 13:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30986E25D;
	Mon,  3 Aug 2020 11:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8BB6E11A;
 Mon,  3 Aug 2020 11:22:39 +0000 (UTC)
IronPort-SDR: ER62CD0G/ZnQleT5mxNrR+j9jggTLEyfMZyN66QdEmcQNTBrOATz/VIEFnpSj1soxoWsHZXe4x
 i5fQk77QVA0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9701"; a="132141217"
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="132141217"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 04:22:39 -0700
IronPort-SDR: zd2GDu6ioj2xMQsk6W93hfl/90HuulrIaLTlPZ5gCdBQOLmL+O9jPauybMvBeRtqLQ1mM0+pvF
 LLXs3JDXq9NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="331859687"
Received: from unknown (HELO [10.252.62.131]) ([10.252.62.131])
 by orsmga007.jf.intel.com with ESMTP; 03 Aug 2020 04:22:37 -0700
Subject: Re: [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
Date: Mon, 3 Aug 2020 13:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> Purely conjecture, but I think the original locking inversion with the
> legacy page flip code between flipping and ttm's bo move function
> shoudn't exist anymore with atomic: With atomic the bo pinning and
> actual modeset commit is completely separated in the code patsh.
>
> This annotation was originally added in
>
> commit 060810d7abaabcab282e062c595871d661561400
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Mon Jul 8 14:15:51 2013 +1000
>
>     drm/nouveau: fix locking issues in page flipping paths
>
> due to
>
> commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> Date:   Thu Jun 27 13:48:18 2013 +0200
>
>     drm/nouveau: make flipping lockdep safe
>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: nouveau@lists.freedesktop.org
> ---
> I might be totally wrong, so this definitely needs testing :-)
>
> Cheers, Daniel
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 7806278dce57..a7b2a9bb0ffe 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
>  			return ret;
>  	}
>  
> -	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> +	if (drm_drv_uses_atomic_modeset(drm->dev))
> +		mutex_lock(&cli->mutex);
> +	else
> +		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> +
>  	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
>  	if (ret == 0) {
>  		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);

Well if you're certain it works now. :)

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
