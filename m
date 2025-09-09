Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83A7B49E14
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 02:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56BA10E2A9;
	Tue,  9 Sep 2025 00:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R1mlSOC1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7189F10E218;
 Tue,  9 Sep 2025 00:36:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8BBB5601B0;
 Tue,  9 Sep 2025 00:36:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7AAC4AF09;
 Tue,  9 Sep 2025 00:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757378195;
 bh=Uok9CjbesSYK3ohcsag5t7XUC+DHX/La43yUddfR6ZU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R1mlSOC1zIqUJ/ypd4bdckQG/BsCEdFAyG8e7B8p9xzQrUbYt5RmxXEUizpf3GGZJ
 YyuFGdEfASVRL9u6PyXTl0YOr5RVldJoLcqgh03wERTOhcRVdYPUP7zt3W7XO2fsqX
 PwGP3x0ZO0eJb8HCptkU+B4ilpHfKV1ytt//q3cOKyIGfznEodU6hx1xGqxa39jzvh
 7xBsCKEgaA7pDaXbJV4jkQvYKYnQwLmB1UhkgqrLqTzxmGsVVG/wuqnlHpsYFdUpZx
 btKFz5670ky3/4K1vJyoikkvhch3dU9WRAm2cz1hdScAPPDCo2oxJJjFOg0qPMCXha
 ubEOofevbMkEg==
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so758699566b.2; 
 Mon, 08 Sep 2025 17:36:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHtPBV+oxu8l4yElkMkyBSBneaESRGvVl1dyGB3ZULkmS8+/Ad+Cfc/9PajoLGN3ZdFMZiFy5y18TU@lists.freedesktop.org,
 AJvYcCUysdjVv8MuvcbHTdXgExJBYpU0jmoT+C95u3V0oXqUgWsyRjrCjvlUzu2nlwwR5KYNZcCyZvUm@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxi6L2PM/e9g8Jfb+YURapaWq4/qWwMHGuLTrn2/PMVBFvJm7dE
 mKcBc4GGjLSTiAeKR7awURpwCsEdGRbyZAmbxUan0vRrL++UkYQzUXr9c0KG8JOYDKzTW7jwC/w
 aIuW4ARwH6mkyFVvfgpuR3ipC1ZGsBAo=
X-Google-Smtp-Source: AGHT+IF9MNT9kUYVDyI7G7dOeR2X5rkbSvsOCALtswIel9/537ksCvevAUIPUYflHXcqGv3z+TpTCjUeGlaoZ55Ocsc=
X-Received: by 2002:a17:907:7202:b0:afe:23e9:2b4d with SMTP id
 a640c23a62f3a-b04b16f07camr906872966b.43.1757378193778; Mon, 08 Sep 2025
 17:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250825085211.34396-1-xry111@xry111.site>
In-Reply-To: <20250825085211.34396-1-xry111@xry111.site>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 9 Sep 2025 08:36:21 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fUyeXN19i1zgtmiPcDFTK2YhTKKFxq88+m+7kiN7wBQ@mail.gmail.com>
X-Gm-Features: Ac12FXx2eWqMWWcgoL0rNhOz0pSpfln-psGlimWc6rSDPf-voN-aHE-6M820Ido
Message-ID: <CAAhV-H4fUyeXN19i1zgtmiPcDFTK2YhTKKFxq88+m+7kiN7wBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display/dml2: Guard
 dml21_map_dc_state_into_dml_display_cfg with DC_FP_START
To: Xi Ruoyao <xry111@xry111.site>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org, WANG Xuerui <kernel@xen0n.name>, 
 Mingcong Bai <jeffbai@aosc.io>, dri-devel@lists.freedesktop.org, 
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Asiacn <710187964@qq.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 25, 2025 at 4:54=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> dml21_map_dc_state_into_dml_display_cfg calls (the call is usually
> inlined by the compiler) populate_dml21_surface_config_from_plane_state
> and populate_dml21_plane_config_from_plane_state which may use FPU.  In
> a x86-64 build:
>
>     $ objdump --disassemble=3Ddml21_map_dc_state_into_dml_display_cfg \
>     > drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.=
o |
>     > grep %xmm -c
>     63
>
> Thus it needs to be guarded with DC_FP_START.  But we must note that the
> current code quality of the in-kernel FPU use in AMD dml2 is very much
> problematic: we are actually calling DC_FP_START in dml21_wrapper.c
> here, and this translation unit is built with CC_FLAGS_FPU.  Strictly
> speaking this does not make any sense: with CC_FLAGS_FPU the compiler is
> allowed to generate FPU uses anywhere in the translated code, perhaps
> out of the DC_FP_START guard.  This problematic pattern also occurs in
> at least dml2_wrapper.c, dcn35_fpu.c, and dcn351_fpu.c.  Thus we really
> need a careful audit and refactor for the in-kernel FPU uses, and this
> patch is simply whacking a mole.  However per the reporter, whacking
> this mole is enough to make a 9060XT "just work."
>
> Reported-by: Asiacn <710187964@qq.com>
> Link: https://github.com/loongson-community/discussions/issues/102
> Tested-by: Asiacn <710187964@qq.com>
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/=
drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> index 03de3cf06ae5..059ede6ff256 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> @@ -224,7 +224,9 @@ static bool dml21_mode_check_and_programming(const st=
ruct dc *in_dc, struct dc_s
>         dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_=
planes(in_dc, context);
>
>         /* Populate stream, plane mappings and other fields in display co=
nfig. */
> +       DC_FP_START();
>         result =3D dml21_map_dc_state_into_dml_display_cfg(in_dc, context=
, dml_ctx);
> +       DC_FP_END();
>         if (!result)
>                 return false;
>
> @@ -279,7 +281,9 @@ static bool dml21_check_mode_support(const struct dc =
*in_dc, struct dc_state *co
>         dml_ctx->config.svp_pstate.callbacks.release_phantom_streams_and_=
planes(in_dc, context);
>
>         mode_support->dml2_instance =3D dml_init->dml2_instance;
> +       DC_FP_START();
>         dml21_map_dc_state_into_dml_display_cfg(in_dc, context, dml_ctx);
> +       DC_FP_END();
>         dml_ctx->v21.mode_programming.dml2_instance->scratch.build_mode_p=
rogramming_locals.mode_programming_params.programming =3D dml_ctx->v21.mode=
_programming.programming;
>         DC_FP_START();
>         is_supported =3D dml2_check_mode_supported(mode_support);
> --
> 2.51.0
>
>
