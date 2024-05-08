Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 735A38C04BA
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE3710FC9E;
	Wed,  8 May 2024 19:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="aTYGbrIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DE110E9ED;
 Wed,  8 May 2024 19:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1715195338; x=1715800138; i=friedrich.vock@gmx.de;
 bh=+UbcRUpdYZe4OspKtemJiFrTHgTmVojYBYNL5yLcud8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aTYGbrIaOWELw7PUS3T66PFIxRXLw568g4OJI4xfDKdIstp6pxegPHI2OECmD8Ir
 Wd+RGA5Kye/7KWYr+PjsAcZqw/5+c77nPMkmIYLH7QzGqTR/k0oAsCqosJ+l0JfBd
 1500SRnnoZov8QebgjjabB3rlaofAnh/EMJabbjdz3CCUqTOLKECG/+qrdjbFSVKv
 z5E4kymroSXPJq61BKcTItN5HTZhq/5UfzpNSvKClknxlge0DcusVSC9c+S3Irfvy
 MiHnTalXg/yEO1qH3QdGvnMMbL9f9cu34gYULOoJ+tDvJwgXFQETNYOpiJMs9pDR/
 JH7QOqn5d0vs3v0T4w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.177.3] ([213.152.117.111]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Gj-1rzZrl2q9b-005Eku; Wed, 08
 May 2024 21:08:58 +0200
Message-ID: <146d615c-6eb1-491a-9494-cacb9337f13e@gmx.de>
Date: Wed, 8 May 2024 21:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/5] drm/amdgpu: Fix migration rate limiting accounting
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-2-tursulin@igalia.com>
Content-Language: en-US
From: Friedrich Vock <friedrich.vock@gmx.de>
Autocrypt: addr=friedrich.vock@gmx.de; keydata=
 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
 f7+xmX0X3AMtWz/15Y+7cPO2
In-Reply-To: <20240508180946.96863-2-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GkJKZi0MJBnjdBeYO9ANcIjuoxPNOZhI7SnUA+EgG98pdRJfnFH
 DC4DRDxHx60lYnSMJqluKjuEsPrFbvgCdbWI6zLHI+pT6z+1+38PSDEgZVrceKpyTVPsqdJ
 MV5J/sSAu2cjnkwy1J7HN1eaT/E0cR5HJCa7NgwXRQ2GKQg0kGO6QjRin2i1cioYCzvOa2p
 nLOir2VcD6ADUnMcnVpkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NQoOtdQp2ZI=;ZPcnX7+C052gyJ/HQ6NEOZQTi86
 09lmgI8Y/4z7ASHH/fSwbpwMIVSoCYK+jezNQGPiKkEhLeUH9zcGtQGxRzcN324Ztv4TmNq4w
 rbsdcc2d/kkixq6MiiE0k+xaDgadeIYaEdfdDV+tkpWWQ9rYlqnhuB/9WqUisz0A/Zp62LZuQ
 P4uTx8LW1XTCh2b/OctXqNAfloF3OVhhRif4OWaHpBb7O5iM1xqky2tQDoniCK1ixmCxPYIJS
 0AoE8SZeuixTNpmr3mldxK7M7Mmjpix5GGx6bZRDePwqhYOoyJWmX3ECIs4dKIgikzoqipicH
 sgVBM0QabsawmIvSQoJ71Jovzife1oMUE6TLEw6nxIe0VsOTetC5T7NCKcPadFS5JDi5KMPsZ
 bXyBLm4iSgbEzLxLmyKT1nb5/ro/CjCnE83dNsSUDUs3RWY/bFNpUZXDtXZ4aPe1sX7PI9Mvx
 GnJAqAczQEMbo1vDfypDvQCNzjKpevfBvKw/DdKzK9x1wFPJN4d94fTgkJgIBtAiy2XxcKqL1
 qJs8zvkDWUVmkT4F6jkXm5APk2YTLEQams2236A9lSTPODattUwpxOCtBUAWLnQaGsmy7RrIG
 oxmh4HsYsRyaCytUW8lcNeba14xL7L0Zw5+JwXcUXJwwOEhc6hNywG9HXDZDU++rogE4WBkLi
 4JNhTQbre6pOjZVISEJ2Cj3pLeltRf511RFMkk2CtzcJoACmvgsNGB0AC1k7AfBhCG3mEIva2
 +srfEVHK29gQlswCKj1lvmjL6PyiRROVRmV/HOHpUHAXGJqvZ34xfN4zEGFdyw1+J5+ars+ws
 pkN9PLZMxCx8t8f1b1vaNj5rdL+xq/G7nnDC2sXEzq3CU=
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

On 08.05.24 20:09, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> The logic assumed any migration attempt worked and therefore would over-
> account the amount of data migrated during buffer re-validation. As a
> consequence client can be unfairly penalised by incorrectly considering
> its migration budget spent.

If the migration failed but data was still moved (which I think could be
the case when we try evicting everything but it still doesn't work?),
shouldn't the eviction movements count towards the ratelimit too?

>
> Fix it by looking at the before and after buffer object backing store an=
d
> only account if there was a change.
>
> FIXME:
> I think this needs a better solution to account for migrations between
> VRAM visible and non-visible portions.

FWIW, I have some WIP patches (not posted on any MLs yet though) that
attempt to solve this issue (+actually enforcing ratelimits) by moving
the ratelimit accounting/enforcement to TTM entirely.

By moving the accounting to TTM we can count moved bytes when we move
them, and don't have to rely on comparing resources to determine whether
moving actually happened. This should address your FIXME as well.

Regards,
Friedrich

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_cs.c
> index ec888fc6ead8..22708954ae68 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -784,12 +784,15 @@ static int amdgpu_cs_bo_validate(void *param, stru=
ct amdgpu_bo *bo)
>   		.no_wait_gpu =3D false,
>   		.resv =3D bo->tbo.base.resv
>   	};
> +	struct ttm_resource *old_res;
>   	uint32_t domain;
>   	int r;
>
>   	if (bo->tbo.pin_count)
>   		return 0;
>
> +	old_res =3D bo->tbo.resource;
> +
>   	/* Don't move this buffer if we have depleted our allowance
>   	 * to move it. Don't move anything if the threshold is zero.
>   	 */
> @@ -817,16 +820,29 @@ static int amdgpu_cs_bo_validate(void *param, stru=
ct amdgpu_bo *bo)
>   	amdgpu_bo_placement_from_domain(bo, domain);
>   	r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>
> -	p->bytes_moved +=3D ctx.bytes_moved;
> -	if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> -	    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
> -		p->bytes_moved_vis +=3D ctx.bytes_moved;
> -
>   	if (unlikely(r =3D=3D -ENOMEM) && domain !=3D bo->allowed_domains) {
>   		domain =3D bo->allowed_domains;
>   		goto retry;
>   	}
>
> +	if (!r) {
> +		struct ttm_resource *new_res =3D bo->tbo.resource;
> +		bool moved =3D true;
> +
> +		if (old_res =3D=3D new_res)
> +			moved =3D false;
> +		else if (old_res && new_res &&
> +			 old_res->mem_type =3D=3D new_res->mem_type)
> +			moved =3D false;
> +
> +		if (moved) {
> +			p->bytes_moved +=3D ctx.bytes_moved;
> +			if (!amdgpu_gmc_vram_full_visible(&adev->gmc) &&
> +			    amdgpu_res_cpu_visible(adev, bo->tbo.resource))
> +				p->bytes_moved_vis +=3D ctx.bytes_moved;
> +		}
> +	}
> +
>   	return r;
>   }
>
