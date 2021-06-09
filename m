Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692863A0F81
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 11:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17A96E4A5;
	Wed,  9 Jun 2021 09:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com
 [IPv6:2607:f8b0:4864:20::e35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE08489F41;
 Wed,  9 Jun 2021 09:18:53 +0000 (UTC)
Received: by mail-vs1-xe35.google.com with SMTP id q2so5080915vsr.1;
 Wed, 09 Jun 2021 02:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ennvFw/mU48JbmhrcKIuOOumeudswlfu+tEnCytz0U8=;
 b=Htzu/QMrvPVqhLPBML5/QHvGxLBZw2EVZkihxeC/N6m2geqgEwKSc9uB3Vc5+upva/
 R2k9rQDA4GeOINDGHPE1f6Og0suJzzZ/T+BzqxPJIMbH67H8zHzkTAdoXT6nZyH0A1oW
 ILFMbVLlkTYbfDW4Tnv+YmRlHC//ddjJEmZKieoYMKmJXuvCgHBqx7iyV1910+kQW6jC
 dT9tWYhY1yXCf6TPfgkUEnG1uSNaSvSp9MoBYK6ykJLNMDbGrx1rLaIPVeBzo0XlVSp2
 ZtpXzSF88tU9exVJerHcd/uYul6rzEE2VRJRvqLj2CWnhqMTM2zAoSZwk1JhzfAWY8sS
 3G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ennvFw/mU48JbmhrcKIuOOumeudswlfu+tEnCytz0U8=;
 b=l87juWkexGV6bLFpswQ6U71ylV5xP54jrxljNHG39JDA0L3X+ztrp2+YuKgJbRoTCL
 XkHAdavjzLhgiWFp4JQMkSI+mo9rEmE5L+54Y5ZyZlcOJrOpCnCMjol1oGTJtCyxHoHs
 /Sdwb/U2LLf5XQEV0b03ODdm377NFnBUex3ZGL60NsmqtKJnEwuoU1oTRL5QbcSGz6Zu
 b5FVeA9pSXYQ99MMgWd1hHXtLChFT2VeNDoXt7flV43sxAxJr+zjylRP0D+xMHhMMCI2
 2YhHd6vRDWLay7wG7aPzCj27BHyXuv0S58dqwzVbM5U3sCR6CYzYFjDnlPbZ0LINpK67
 nTPw==
X-Gm-Message-State: AOAM531yrPsExtPH+TY7KXwCjTaLcugzjJxbbQ7w2Lt1YcmK4QzjRNWC
 CbcomZjEQduu249yw+9oezKyImURvhBB8NexEQE=
X-Google-Smtp-Source: ABdhPJwOaodoaSnaV3+O4+SU3r6M6SWeakQNi/diBvDiaz5bQDd2/aqLlT1MJsrmOQTflJ/bIrzapwFQj2T0pfufs6M=
X-Received: by 2002:a67:2d07:: with SMTP id t7mr2925vst.31.1623230332935; Wed,
 09 Jun 2021 02:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210604154905.660142-1-emil.l.velikov@gmail.com>
In-Reply-To: <20210604154905.660142-1-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 9 Jun 2021 10:18:41 +0100
Message-ID: <CACvgo53UfT6e_GHCLjEsAGGPQq_Kt3zWP3UvsDK=PYTo3D0mSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: apply WaEnableVGAAccessThroughIOPort as needed
To: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 kernel@collabora.com, ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 4 Jun 2021 at 16:49, Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> From: Emil Velikov <emil.velikov@collabora.com>
>
> Currently as the workaround is applied the screen flickers. As a result
> we do not achieve seamless boot experience.
>
> Avoiding the issue in the common use-case might be hard, although we can
> resolve it for dual GPU setups - when the "other" GPU is primary and/or
> outputs are connected to it.
>
> With this I was able to get seamless experience on my Intel/Nvidia box,
> running systemd-boot and sddm/Xorg. Note that the i915 driver is within
> initrd while the Nvidia one is not.
>
> Without this patch, the splash presented by systemd-boot (UEFI BGRT) is
> torn down as the code-path kicks in, leaving the monitor blank until the
> login manager starts.
>
> Same issue were reported with plymouth/grub, although personally I
> wasn't able to get them to behave on my setup.
>
> Suggested-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>
> Supersedes
> https://lore.kernel.org/dri-devel/20210516171432.1734268-1-emil.l.velikov=
@gmail.com/
>
> Ville, others,
>
> Patch is based against drm-intel/drm-intel-next and will apply cleanly
> against drm-intel/drm-intel-fixes.
>
> If possible, can one of the i915 maintainers apply it to the latter?
>
> Thanks
> Emil
> ---
>  drivers/gpu/drm/i915/display/intel_vga.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i=
915/display/intel_vga.c
> index be333699c515..7beef1206097 100644
> --- a/drivers/gpu/drm/i915/display/intel_vga.c
> +++ b/drivers/gpu/drm/i915/display/intel_vga.c
> @@ -29,6 +29,9 @@ void intel_vga_disable(struct drm_i915_private *dev_pri=
v)
>         i915_reg_t vga_reg =3D intel_vga_cntrl_reg(dev_priv);
>         u8 sr1;
>
> +       if (intel_de_read(dev_priv, vga_reg) & VGA_DISP_DISABLE)
> +               return;
> +
>         /* WaEnableVGAAccessThroughIOPort:ctg,elk,ilk,snb,ivb,vlv,hsw */
>         vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
>         outb(SR01, VGA_SR_INDEX);
> --
> 2.31.1
>

Humble poke?

-Emil
