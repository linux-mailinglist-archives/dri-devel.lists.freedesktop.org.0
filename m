Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC5756CBB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 21:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2833310E2A6;
	Mon, 17 Jul 2023 19:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A21610E2A6;
 Mon, 17 Jul 2023 19:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 2503141616;
 Mon, 17 Jul 2023 21:06:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-7QSlNy0TBa; Mon, 17 Jul 2023 21:06:06 +0200 (CEST)
Message-ID: <0ada1376-645f-58f1-c851-e51fd24295ad@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689620765; bh=r6NyomSvDb5EYiE1j0w9/RymGIQZhvqBajdP6JsmkUg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=HdaPe3daHJl5o2xmdD+JxXh3mwmoVAULY9ESJEOKHjHzDTsYkTZI4aEIox4ssaOeq
 O7tLD2bbrVr5Au2gyZunhO3HmNj2asM2aLbjbsyDvDTffIxw6Q9rqyLSBQZLXbcB0+
 EKfscO3VwSuockEvvzwNO5FFuvd2tH1+hN2eAZ6Y8foivJAJ4NcMxQRxY6JPTxQFe+
 eP3lUpDCORIavA8C39dc0P56NruwCoU1qPknemw6/Sk2gIiOyof3XhjfQp99OtblOe
 NowFmDtodCuqrvJq2YmSqxY2F1/LTgwjfk/VtM/yySVpyKf2Qna2JS23aZjKRu7gbo
 HeQWLjTClIAjA==
Date: Mon, 17 Jul 2023 16:04:43 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] drm: Replace drm_framebuffer plane size functions with
 its equivalents
Content-Language: pt-BR
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230627182239.15676-1-gcarlos@disroot.org>
 <58d90ae1-02f7-2866-dbb1-e7763a2399c5@igalia.com>
From: Carlos <gcarlos@disroot.org>
In-Reply-To: <58d90ae1-02f7-2866-dbb1-e7763a2399c5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: tvrtko.ursulin@linux.intel.com, stanislav.lisovskiy@intel.com,
 juhapekka.heikkila@gmail.com, tales.aparecida@gmail.com,
 intel-gfx@lists.freedesktop.org, mripard@kernel.org, mairacanal@riseup.net,
 matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com,
 niranjana.vishwanathapura@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi André, thanks for review!

On 7/12/23 20:30, André Almeida wrote:
> Hi Carlos,
>
> Em 27/06/2023 15:22, Carlos Eduardo Gallo Filho escreveu:
> [...]
>>
>> So, replace each drm_framebuffer_plane_{width,height} and
>> fb_plane_{width,height} call to drm_format_info_plane_{width,height}
>> and remove them.
>>
>
> I see that with this replace, there's a small code change from
>
>     return DIV_ROUND_UP(width, format->hsub);
>
> to
>     return width / info->hsub;
>
> is there any case that the replaced function will give different results?

Well, short answer: Yes, and I'm already thinking on how do address it.

Taking a look at some drivers, I could notice that almost every driver do
some similar calculating to obtain the size of a plane given the size of
the first (I guess that they would be using these functions though). So, I
stated that nearly all drivers implements this as a regular division, with
exception of exynos, sun4i and i915 (counting with the replaced function),
which all has at some point a DIV_ROUND_UP involving hsub or vsub.

Curiously, even the i915 having a DIV_ROUND_UP in some places, it also
has regular division involving hsub/vsub in others, which leads me to
guess if the chosen rounding method really matters. I also discovered
the existence of the intel_plane_check_src_coordinates() function,
that do some checks, which one of them consist of ensuring that for a
plane, both source coordinates and sizes are multiples of the vsub and
hsub, implying that no division rounding should occurs at all when it's
used. However, I couldn't state if this function is always called for
every source on every plane, so I can't assume anything from this.

Furthermore, I found the 33f673aa55e96 ("drm: Remove fb hsub/vsub
alignment requirement") commit, that explains the motivation for having
DIV_ROUND_UP on drm_framebuffer_plane_{width,height} functions. It says
that the DIV_ROUND_UP is needed on places where the
source isn't necessarily aligned with respect to the subsampling factors,
that should be the sane default for a core function.

Saying that, I thought some ways to address this problem:

1. Replace the regular division on drm_format_info_plane_{width,height}
    functions to DIV_ROUND_UP so that we assert that this function is
    always correct (as it seems that the places where regular division
    is used assumes alignment, implying no division rounding at all).

2. Create DIV_ROUND_UP variants of drm_format_info_plane_{width,height}
    functions and use each of them in the right place. Maybe
    let the default be the one with DIV_ROUND_UP and the
    variant with regular division, naming it as something like
    "drm_format_info_aligned_plane_{width,height}".

I personally would prefer the second alternative, as it provides more
flexibility and avoids using DIV_ROUND_UP unnecessarily. If nobody states
anything wrong with this approach, I'll be sending the second version
of this patch with it.

Thanks,
Carlos
