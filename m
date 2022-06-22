Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413555430D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 09:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67CF5113B48;
	Wed, 22 Jun 2022 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDDB113B48
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 07:02:16 +0000 (UTC)
Date: Wed, 22 Jun 2022 07:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1655881334; x=1656140534;
 bh=hW6aQpyvrQi+nVh0DL4cohSiWMLpTMwE3tnnUD5pEHc=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
 Feedback-ID:Message-ID;
 b=zPgSvVxQLJVZ8kUbeSjT6fZZhN8tgkMspF9xTC+0xN8i36hhESoEA4bqRfwNOX28+
 BGxiOXxyum7Bdjlwev8aNvA4rE/AGCQzzddCaEEhJedkeWqKTlfgcjyD+xjALkcFKE
 MxDXPq2hnLQwUXwtbZCO6kwciR+3jKj/zoTVH9Z26oR4id73wnnfwoZvMfAVqgjgqp
 qsQFRr7W5uBSjNtrHu9ci/BxZejVKXgQKrLUESfGoTE6fs0kZ1WhP8130XcYr6jtg9
 v6nUPedlQ9mlsFk37PbD42VtAp4/rtRrhCq1EksZ3+J6bJ5zU1l2IHguHXP4PcBXFE
 h/3P+Wl7zBi/A==
To: Carlos Llamas <cmllamas@google.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/fourcc: fix integer type usage in uapi header
Message-ID: <uvR86emMYmXwy4OxDiY5OlpRs9UIoEce59p_VukwHwNa368FpqXYVtN7tqccW6WzG5Vz08ycVdxXonbMczsohHw8O8Dx7WdJv8pnrYb9V34=@emersion.fr>
In-Reply-To: <20220621203921.3594920-1-cmllamas@google.com>
References: <20220621203921.3594920-1-cmllamas@google.com>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tuesday, June 21st, 2022 at 22:39, Carlos Llamas <cmllamas@google.com> w=
rote:

> Kernel uapi headers are supposed to use __[us]{8,16,32,64} types defined
> by <linux/types.h> as opposed to 'uint32_t' and similar. See [1] for the
> relevant discussion about this topic. In this particular case, the usage
> of 'uint64_t' escaped headers_check as these macros are not being called
> here. However, the following program triggers a compilation error:
>
>   #include <drm/drm_fourcc.h>
>
>   int main()
>   {
>   =09unsigned long x =3D AMD_FMT_MOD_CLEAR(RB);
>   =09return 0;
>   }
>
> gcc error:
>   drm.c:5:27: error: =E2=80=98uint64_t=E2=80=99 undeclared (first use in =
this function)
>       5 |         unsigned long x =3D AMD_FMT_MOD_CLEAR(RB);
>         |                           ^~~~~~~~~~~~~~~~~
>
> This patch changes AMD_FMT_MOD_{SET,CLEAR} macros to use the correct
> integer types, which fixes the above issue.
>
>   [1] https://lkml.org/lkml/2019/6/5/18
>
> Fixes: 8ba16d599374 ("drm/fourcc: Add AMD DRM modifiers.")
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Simon Ser <contact@emersion.fr>

Cc'ing Bas as well

> ---
>  include/uapi/drm/drm_fourcc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index f1972154a594..0980678d502d 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -1444,11 +1444,11 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 m=
odifier)
>  #define AMD_FMT_MOD_PIPE_MASK 0x7
>
>  #define AMD_FMT_MOD_SET(field, value) \
> -=09((uint64_t)(value) << AMD_FMT_MOD_##field##_SHIFT)
> +=09((__u64)(value) << AMD_FMT_MOD_##field##_SHIFT)
>  #define AMD_FMT_MOD_GET(field, value) \
>  =09(((value) >> AMD_FMT_MOD_##field##_SHIFT) & AMD_FMT_MOD_##field##_MAS=
K)
>  #define AMD_FMT_MOD_CLEAR(field) \
> -=09(~((uint64_t)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIF=
T))
> +=09(~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>
>  #if defined(__cplusplus)
>  }
> --
> 2.37.0.rc0.104.g0611611a94-goog
