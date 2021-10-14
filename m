Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B4942E332
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 23:22:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEAF6E204;
	Thu, 14 Oct 2021 21:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F2C6E204
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 21:21:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y26so32738279lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kQwUmmPeJ8Hce507ICCeYLH5aPrCZw/ZIJrPidgd9ZE=;
 b=HMN7qIWonn2K5R4zTQ2lDey6lWwmzqJlSStqviM7qxSdzciKyT9pSF7PvGKF5nZtKe
 bIzc4Wim9DKWdo0s7t/S4Stw+bjX4NTSbQrEJXGloTpUc6lXYgElEKn+fmaT+mtRsmGm
 xGbMRdPYm9U4MsGWGEUCFlmSokKe85X36P7IgBgCqzKY4ZNddAphaTGb0qrQCavQXL1W
 rKbTCLqs/PIp8yRaN2vjKJ7nxoHhOh98POPoAqbsDljCp1c04VsHN4U+di73gsd3JdGJ
 EMi0ZmE1nolIZ2ZQmA0xOep6o/wongsjBW0ShfD0eCV2it/KczUx6S47vV01tPsfoEzY
 f14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kQwUmmPeJ8Hce507ICCeYLH5aPrCZw/ZIJrPidgd9ZE=;
 b=CAjab8kn2s5UnYWZG50kIGk2tNFJzM+rhEyJS20joSqRJ+LlQ7m8jo0zg0OW2vF+dE
 yYYAyksqjU16c8dfn3xKXMrz28y48OTmDESY5P6nCUVATi6oQspPL0yhZmmiUd6dVcfz
 U11mQFsoWrHCOKNLagdM7VmEUni9Cj5nqcO+NAc56mjDRaLAqiLFGpdVF/HLyzk0YUEy
 UX4znAwymXK9AdC2sh2CYtcJTlAC6KAglSG4DXTN9YszAMa4UhMormCjsQb+8e47EcSF
 9BetLMyFnXK141bjhaRmdgwxjXtZ0/UETGf7jDDrzPguNWRZDxxIGzpcMRCiC+BoS8mw
 BREQ==
X-Gm-Message-State: AOAM5323g/NBWsGpuJLwowwpQVX/FwtEWa0y9Y3lr7jfekzJPpoDKZII
 Feik/6i6oDpyakig9JqzYaMaGTDELyNgHr0OYVujtA==
X-Google-Smtp-Source: ABdhPJzcKBq6vCrkR8ENl9gj9IqS485yrxDyz2P7VIjz8eeAT/1thN0HtZ0Fi2grgZQEmwtsIyFcjiem2P07eTN9XKg=
X-Received: by 2002:a2e:461a:: with SMTP id t26mr8609302lja.198.1634246515116; 
 Thu, 14 Oct 2021 14:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211014211916.3550122-1-nathan@kernel.org>
In-Reply-To: <20211014211916.3550122-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Oct 2021 14:21:43 -0700
Message-ID: <CAKwvOdmSFP98Mc1u2b+=_Dux9eB_yumRvxOx7UTXuyXOYzG3uA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Avoid bitwise vs logical OR warning in
 snb_wm_latency_quirk()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?UTF-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>
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

On Thu, Oct 14, 2021 at 2:19 PM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> A new warning in clang points out a place in this file where a bitwise
> OR is being used with boolean types:
>
> drivers/gpu/drm/i915/intel_pm.c:3066:12: warning: use of bitwise '|' with=
 boolean operands [-Wbitwise-instead-of-logical]
>         changed =3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_la=
tency, 12) |
>                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
>
> This construct is intentional, as it allows every one of the calls to
> ilk_increase_wm_latency() to occur (instead of short circuiting with
> logical OR) while still caring about the result of each call.
>
> To make this clearer to the compiler, use the '|=3D' operator to assign
> the result of each ilk_increase_wm_latency() call to changed, which
> keeps the meaning of the code the same but makes it obvious that every
> one of these calls is expected to happen.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1473
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the patch!
Suggested-by: D=C3=A1vid Bolvansk=C3=BD <david.bolvansky@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel=
_pm.c
> index f90fe39cf8ca..aaa3a0998e4c 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -3050,9 +3050,9 @@ static void snb_wm_latency_quirk(struct drm_i915_pr=
ivate *dev_priv)
>          * The BIOS provided WM memory latency values are often
>          * inadequate for high resolution displays. Adjust them.
>          */
> -       changed =3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_la=
tency, 12) |
> -               ilk_increase_wm_latency(dev_priv, dev_priv->wm.spr_latenc=
y, 12) |
> -               ilk_increase_wm_latency(dev_priv, dev_priv->wm.cur_latenc=
y, 12);
> +       changed =3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.pri_la=
tency, 12);
> +       changed |=3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.spr_l=
atency, 12);
> +       changed |=3D ilk_increase_wm_latency(dev_priv, dev_priv->wm.cur_l=
atency, 12);
>
>         if (!changed)
>                 return;
>
> base-commit: d73b17465d6da0a94bc0fcc86b150e1e923e8f71
> --
> 2.33.1.637.gf443b226ca
>


--=20
Thanks,
~Nick Desaulniers
