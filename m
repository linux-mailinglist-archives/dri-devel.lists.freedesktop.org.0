Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9345191E871
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 21:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C9310E4E4;
	Mon,  1 Jul 2024 19:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JdFGNnYK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E262E10E4DB;
 Mon,  1 Jul 2024 19:19:41 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2c80637d8adso1943557a91.0; 
 Mon, 01 Jul 2024 12:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719861581; x=1720466381; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n7dX91rR++X8l6FgAb2IdZ2jTpqGOU3hxaiyihnGxWg=;
 b=JdFGNnYKXwnsdXWNYmqWyAU2PKLNhe+rgEWRP/iS4WpgK/pkyHRYzwU83BmzTNylzQ
 zRsZtdhPWqzxpTG8NiiQbmRkumw1C8kNuUp5aIOaNbyldzcw4a9zuTDCHWy5100+TZId
 Ja6luAjaKbtvHa+TEfMGXCcaLR8RqRxFCa/Hi56wPcZfYdR1UAXLW47/duQ0ZRncpi4W
 dT4/AvcfYPj1geocVtusvJPY2Te//6+onpyRZDRMMwQvOc5+Jq4DEYRbsaOjvIu0vcxE
 GED8FFmzj4SaXUfopkVv0F6tnmNMf73DVD61w4q1GvZa1/7Fy5KDyXZmzjF0mZj+XlL8
 U0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719861581; x=1720466381;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n7dX91rR++X8l6FgAb2IdZ2jTpqGOU3hxaiyihnGxWg=;
 b=YFX/99FzW4ScRJk84kXPnwg0XpzqWugeVULCjFpSXjXbIBT6jKgqbJUOnxCeDIe7Af
 Ro9seZ7r3yGi6k50VnGT0njuWRMRAsPsRSRLYeEJxKHgSWGN4MfGNxb4NI/2PXrfQEGw
 1rC9ZHrrqQL1Iu21TO4OrSE4Us9znGfstbGA33MbE7po3TuXrhGDtoBb4GMOvmYXZ2tx
 aQbgMt/t/ObS+uGSJnunopIFWhy/FWRSyA/WK5ZAZyrh7knHmKCnGUCPnTYDGBG/zgY5
 fuJPYsy27Zli9vefjSEMBDtVX5jYub8l/baLG2z+PWaiqI/Z/QOvNndO+kgPIIHPFzcK
 2yFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKN9w39rhrVm8ZoFBGNKaadfrEPlvHuBbqOpyaK4M5+uAk6aq+vextDUb2Zp63u8i/VmNgF6FcVERLT8rvizTH+FPoxufJXrbUSonSeON7ae26AedYc7MaIKSwpG39IRPL9WWRboRIzk3FYt8Kdg==
X-Gm-Message-State: AOJu0Yx87jkETcqd5bzfO68hjW633niUN2ULYO1pbT/E8l463Qf/qBx9
 N0jW8Gs1zoI9Lk9wI5hH4voD9Z7TRcE3QdgdE7lmtgBULzqAbjjIVGXwdHfiqJThe0z7q8bCQ5O
 QiaZTzw4h10SUqKt6Bhd/Cyaz2UU=
X-Google-Smtp-Source: AGHT+IG5+yZI4SRXCP1ZRSO57iNkvyORgQdxHHwZ6QNuY1DRKJ4lk+z/+oxiPHPCnZXrnlpXT/gQVlhMBabT1lU/5O4=
X-Received: by 2002:a17:90b:e0f:b0:2c8:a8f:45fa with SMTP id
 98e67ed59e1d1-2c93d6c650cmr3631105a91.2.1719861581296; Mon, 01 Jul 2024
 12:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240701025028.36072-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20240701025028.36072-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 1 Jul 2024 15:19:29 -0400
Message-ID: <CADnq5_N3wS=dbg5cfjKdqnU+JmCw80Evat_3-H_RJ3Aus7CfyA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix unsigned comparison with less than
 zero
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

Applied.  Thanks!

On Sun, Jun 30, 2024 at 11:10=E2=80=AFPM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> The return value from the call to dml21_find_dc_pipes_for_plane() is int.
> However, the return value is being assigned to an unsigned int variable
> 'num_pipes', the condition if(num_pipes <=3D 0) is not rigorous enough,
> so making 'num_pipes' an int.
>
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:318:6-15: WAR=
NING: Unsigned expression compared with zero: num_pipes <=3D 0.
> ./drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c:360:6-15: WAR=
NING: Unsigned expression compared with zero: num_pipes <=3D 0.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D9454
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/=
drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> index c310354cd5fc..9d96a31419fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
> @@ -280,7 +280,8 @@ bool dml21_validate(const struct dc *in_dc, struct dc=
_state *context, struct dml
>
>  void dml21_prepare_mcache_programming(struct dc *in_dc, struct dc_state =
*context, struct dml2_context *dml_ctx)
>  {
> -       unsigned int num_pipes, dml_prog_idx, dml_phantom_prog_idx, dc_pi=
pe_index;
> +       unsigned int dml_prog_idx, dml_phantom_prog_idx, dc_pipe_index;
> +       int num_pipes;
>         struct pipe_ctx *dc_main_pipes[__DML2_WRAPPER_MAX_STREAMS_PLANES_=
_];
>         struct pipe_ctx *dc_phantom_pipes[__DML2_WRAPPER_MAX_STREAMS_PLAN=
ES__] =3D {0};
>
> @@ -314,10 +315,8 @@ void dml21_prepare_mcache_programming(struct dc *in_=
dc, struct dc_state *context
>                 }
>
>                 num_pipes =3D dml21_find_dc_pipes_for_plane(in_dc, contex=
t, dml_ctx, dc_main_pipes, dc_phantom_pipes, dml_prog_idx);
> -
> -               if (num_pipes <=3D 0 ||
> -                               dc_main_pipes[0]->stream =3D=3D NULL ||
> -                               dc_main_pipes[0]->plane_state =3D=3D NULL=
)
> +               if (num_pipes <=3D 0 || dc_main_pipes[0]->stream =3D=3D N=
ULL ||
> +                   dc_main_pipes[0]->plane_state =3D=3D NULL)
>                         continue;
>
>                 /* get config for each pipe */
> @@ -356,10 +355,8 @@ void dml21_prepare_mcache_programming(struct dc *in_=
dc, struct dc_state *context
>                 pln_prog =3D &dml_ctx->v21.mode_programming.programming->=
plane_programming[dml_prog_idx];
>
>                 num_pipes =3D dml21_find_dc_pipes_for_plane(in_dc, contex=
t, dml_ctx, dc_main_pipes, dc_phantom_pipes, dml_prog_idx);
> -
> -               if (num_pipes <=3D 0 ||
> -                               dc_main_pipes[0]->stream =3D=3D NULL ||
> -                               dc_main_pipes[0]->plane_state =3D=3D NULL=
)
> +               if (num_pipes <=3D 0 || dc_main_pipes[0]->stream =3D=3D N=
ULL ||
> +                   dc_main_pipes[0]->plane_state =3D=3D NULL)
>                         continue;
>
>                 /* get config for each pipe */
> --
> 2.20.1.7.g153144c
>
