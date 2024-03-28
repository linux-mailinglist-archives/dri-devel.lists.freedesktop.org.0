Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF97890CCC
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 22:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A0E10EB7F;
	Thu, 28 Mar 2024 21:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="0cNIl6rL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682E110EB7F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 21:59:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56c4ca65dc6so1797987a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1711663167; x=1712267967;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JkrR3TRsPYSXBmltvKoz6z3FLacSM3QfrKhBArRhwdM=;
 b=0cNIl6rLazojfxpH8Nx5Efm8kcv3Nj6ThC3jkhaq2EFTvoA4yyqR2NweE/8Lr1mrIY
 LXWvC2C9l7Ew//DOmkWTMBTGzVucrc9OnahXJvrLUWciLh6Ed/8yGsGIHZJKVBtwva1m
 VyNed33TLmO1+0J0DkSHLa/4i7eMBGoNNZLDHEzh7Hte6xjmP8sdNhYuaTQKBosEa21Z
 OBtP5ei6TSm/KkJ0pDHeGpA+QUn6OJcq/sRjsHOuWOFbS7XSEU8SfIZ3OsARLx59qJ2z
 R7WW71ie2fNyZMmyJN++syTWNzhqEINGnZPS3U/7akkfXdhU6MutDGn4JQSwNAKY5tcH
 ZqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711663167; x=1712267967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JkrR3TRsPYSXBmltvKoz6z3FLacSM3QfrKhBArRhwdM=;
 b=JiJw3CCOmamJ7Ze8hXf1s9v/Pg1f+hrUxAwT6hscmeE0Da7Y4+Ie+4jz4CXDWXQ9WV
 0lyB66SYgufNVi19luGtUIzW4+Uj/bQ80CbMrEGWaZ2AeJqFA+bcEvbivKrSqKn5rj1N
 IescVJ/txIwkgA3W5Jjdo1hkVl753hByV43sCMNk/xcmQhp12pW9o3403T+h744xr8E5
 kQKMej70R9jToL/ipxtOawCLBSeFDCwjD8BHwT06BrMzyHC5K2qgfkol7yu2h++Ognt1
 KF8OL65PVT9FxXRxiFeC3/7lWs8LChey0BiiUXwsvU/lCwVgW2KC/N/W9YiDXsuIDRyH
 3tRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDgqNbiqXaFT3eie+sYtmDmeIAb5gHmrbV0GWkm4JdluHSL647MsfDpSb3bJpLqQDegqPU4g3fC4olFPpVHxJnpwlzk7bwHo+2TsQZXDlI
X-Gm-Message-State: AOJu0Yz9thCvlFV1tBZoDMLHsDR+vXxhaJh4cncvS0eiBc5PQG/UA+no
 bRpyfDHtcGMKRhuka/nE96ouK+gPBsnWlaG3hC3ACZiYmH1tVKvHxAldcASrk3404eK6gaTvxpH
 YIK8wHdq+v6tShQMnK2U7TpuDY17RtXmYfZA+
X-Google-Smtp-Source: AGHT+IHxVJPGgWlPUtD38LmquZT+Kw2h6yv1jTsdsBsy+O/RrcoVPzZF9uidn02SdlhCE7x48PGrZPsbAniqVO9n/64=
X-Received: by 2002:a05:6402:3548:b0:56b:c210:870c with SMTP id
 f8-20020a056402354800b0056bc210870cmr331295edd.15.1711663167480; Thu, 28 Mar
 2024 14:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-panthor-drop-csg_mod_mask-v1-1-5a80be3df581@kernel.org>
In-Reply-To: <20240328-panthor-drop-csg_mod_mask-v1-1-5a80be3df581@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 14:59:15 -0700
Message-ID: <CAFhGd8qJQw9TFPzM5VqwPAdvFCfYRW6TMFYZcOOPWW74qvNz6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panthor: Fix clang -Wunused-but-set-variable in
 tick_ctx_apply()
To: Nathan Chancellor <nathan@kernel.org>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ndesaulniers@google.com, morbo@google.com, heiko@sntech.de, 
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev
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

On Thu, Mar 28, 2024 at 9:22=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Clang warns (or errors with CONFIG_WERROR):
>
>   drivers/gpu/drm/panthor/panthor_sched.c:2048:6: error: variable 'csg_mo=
d_mask' set but not used [-Werror,-Wunused-but-set-variable]
>    2048 |         u32 csg_mod_mask =3D 0, free_csg_slots =3D 0;
>         |             ^
>   1 error generated.
>
> The variable is an artifact left over from refactoring that occurred
> during the development of the initial series for this driver. Remove it
> to resolve the warning.

Yep, makes sense.

>
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index 5f7803b6fc48..e5a710f190d2 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2045,7 +2045,7 @@ tick_ctx_apply(struct panthor_scheduler *sched, str=
uct panthor_sched_tick_ctx *c
>         struct panthor_device *ptdev =3D sched->ptdev;
>         struct panthor_csg_slot *csg_slot;
>         int prio, new_csg_prio =3D MAX_CSG_PRIO, i;
> -       u32 csg_mod_mask =3D 0, free_csg_slots =3D 0;
> +       u32 free_csg_slots =3D 0;
>         struct panthor_csg_slots_upd_ctx upd_ctx;
>         int ret;
>
> @@ -2139,7 +2139,6 @@ tick_ctx_apply(struct panthor_scheduler *sched, str=
uct panthor_sched_tick_ctx *c
>
>                         csg_iface =3D panthor_fw_get_csg_iface(ptdev, csg=
_id);
>                         csg_slot =3D &sched->csg_slots[csg_id];
> -                       csg_mod_mask |=3D BIT(csg_id);
>                         group_bind_locked(group, csg_id);
>                         csg_slot_prog_locked(ptdev, csg_id, new_csg_prio-=
-);
>                         csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
>
> ---
> base-commit: d180649238f04183950d9c8a7d8a2c2f1788a89c
> change-id: 20240328-panthor-drop-csg_mod_mask-b4bbe317d690
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
