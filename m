Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9E37B63F
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4C6E0DE;
	Wed, 12 May 2021 06:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B676E0DE;
 Wed, 12 May 2021 06:40:10 +0000 (UTC)
Received: from Normandy.localdomain (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7B565B00539;
 Wed, 12 May 2021 08:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620801608;
 bh=G+fqPsWs7aNx2UZuhTvM3ja9/zXQOlLMol12RyDINks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2z1VMzIygzUWd8rnIfcb+AyqAQ/Zv7SIWIofNWU2sUGh5MUZqopSGl2jxO0Ttykt
 xBvjCCl9x8uRSh6DqKnGbhC6CQTK0CbU/C1l+yhjUA8nFvSqrXDG1ZwPlX4Mj8cuGI
 2D9iG2W8lfXPaikDHTmsvG38g4LsPuGjOZlGMozQF2eTJsclFLGlBw7WfO1a2VuGkK
 N5L6I7a1jk2s3y/UpYHXm65Q17IySJQZJImcL2KQyPPU34vEF7yNCePuQ8ehyl2j3n
 yeaT7JkepMYPyHqtTWd5Utwk+Pf7XAYAOCMJThc/p2eb8ME2dck9Z3+16DbShaNYNL
 8+xqDOadaVuMg==
Date: Wed, 12 May 2021 08:39:52 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [Nouveau] [PATCH v2 1/2] drm/nouveau: Fix ida leak
Message-ID: <20210512063952.5kwdrq2yzbmgmn4x@Normandy.localdomain>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
 <20210511082841.4181-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210511082841.4181-2-thunder.leizhen@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Why remove the const modifier on `nb`?

On 2021-05-11 — 16:28, Zhen Lei wrote:
> When the 'nb' value allocated from 'bl_ida' is greater than or equal to
> 100, it will not be released. In fact, we can simplify operations by
> limiting the range of idas that can be applied for.
> 
> By the way, delete the const modifier of the local variable 'nb'.
> 
> Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 72f35a2babcb20e..d1c998e645fb4b6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -51,8 +51,9 @@ static bool
>  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
>  			   struct nouveau_backlight *bl)
>  {
> -	const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
> -	if (nb < 0 || nb >= 100)
> +	int nb = ida_simple_get(&bl_ida, 0, 100, GFP_KERNEL);
> +
> +	if (nb < 0)
>  		return false;
>  	if (nb > 0)
>  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
> -- 
> 2.26.0.106.g9fadedd
> 
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
