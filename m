Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABF262E723
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 22:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD8C10E696;
	Thu, 17 Nov 2022 21:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96AEE10E694;
 Thu, 17 Nov 2022 21:41:04 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13ae8117023so3756856fac.9; 
 Thu, 17 Nov 2022 13:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Nc+c1ZgyaRHbiRmnbtBUUwq9SlkKMk4TXjmG53a3qPI=;
 b=nVvdu7JjyqkMcVh0WyCRhREoZFkY9TCHEnNLzr+ogGqNGJR+sFmPKas4PS6VZx3R+F
 B5I57zIftnK/XsEP9bHGsyDaZZyyyYzIH7nVzWhpzXoc8dt0liEKqxA3wpLInzrJFraK
 uTps7bxurQEC6N71TBxEzdZhL+ATw3nhc1GGhjb9KqdVO+5AKaR24AH5zfeg81Mk7rgd
 F0rYnPRiVhXSfIU5l7eupBixu3JTRrI0A9EfldNo55GTD9ZpHI2iid7gzeKb2pAfxu9r
 nIfd/ULkmoTQ/SnGsb2JYm4onWueWg7QS8F6xOGKJ4J/DIRkyRvSj230OefIYh1v0tAq
 Nf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nc+c1ZgyaRHbiRmnbtBUUwq9SlkKMk4TXjmG53a3qPI=;
 b=31b5YdgAia7ehuUuY4Kpyu8bdgPKEje+EqXvLcsSKapRaB587nTwmaBmaN/CSPYWSz
 ixvbVo4MXrNCqv4bqwuBXUmqz93N6P6gobsHfAsX2NUYUj1apN+UkyVfnb/5nhOL5+2R
 Dd5MkoBY6zeqyDSbUUaCnVNQl2UfdVITXGsk0IpISdGivdCCW8ygsrPApFPkgB/tRsVh
 TaoGkCvi93znoIxtdzel7GIBFitplzgbwk8Il+NtmZOpOoWHbJdQ0kGtqbms//bDxeQd
 vZinJPFY13f7PuMr0wN1drKvlft+BloIxrYU5YXukwj2SZ3M54cEVgLVklhsH4d4vbIt
 TAQQ==
X-Gm-Message-State: ANoB5plWl58z9xCgLfF1f9Hrld33OPgJEGKOGlWfOlPeHaRoXpNV0bMa
 tMao4QM9TUh9g/Ei1LXdKZo1Qd8ip+zVmuITb8XFnJcy
X-Google-Smtp-Source: AA0mqf4kfKVTGi28Jg/pTNx2eiR1aNW14wXxeGvdl18I0KBg/P9rdGDpIevTBJ7ln+4qdyUStAa7R+2g/qBCXeQbqPs=
X-Received: by 2002:a05:6870:b07:b0:13b:d07f:f29d with SMTP id
 lh7-20020a0568700b0700b0013bd07ff29dmr2479858oab.96.1668721263887; Thu, 17
 Nov 2022 13:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20221114222046.386560-1-lyude@redhat.com>
In-Reply-To: <20221114222046.386560-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Nov 2022 16:40:52 -0500
Message-ID: <CADnq5_PrarJPZQu6uRwDdCqhZr7Hvbtxo_HuhiQ7H1DYRgSyqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/dc/dce120: Fix audio register mapping, stop
 triggering KASAN
To: Lyude Paul <lyude@redhat.com>, "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alan Liu <HaoPing.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 open list <linux-kernel@vger.kernel.org>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, stable@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 14, 2022 at 5:21 PM Lyude Paul <lyude@redhat.com> wrote:
>
> There's been a very long running bug that seems to have been neglected for
> a while, where amdgpu consistently triggers a KASAN error at start:
>
>   BUG: KASAN: global-out-of-bounds in read_indirect_azalia_reg+0x1d4/0x2a0 [amdgpu]
>   Read of size 4 at addr ffffffffc2274b28 by task modprobe/1889
>
> After digging through amd's rather creative method for accessing registers,
> I eventually discovered the problem likely has to do with the fact that on
> my dce120 GPU there are supposedly 7 sets of audio registers. But we only
> define a register mapping for 6 sets.
>
> So, fix this and fix the KASAN warning finally.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org

This is the correct fix for asics having 7 audio instances.  It looks
correct to me, assuming DCE12 actually has 7 audio instances.
@Wentland, Harry Do you know off hand?  If you can confirm that, the
patch is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>


> ---
> Sending this one separately from the rest of my fixes since:
>
> * It's definitely completely unrelated to the Gitlab 2171 issue
> * I'm not sure if this is the correct fix since it's in DC
>
>  drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> index 1b70b78e2fa15..af631085e88c5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> @@ -359,7 +359,8 @@ static const struct dce_audio_registers audio_regs[] = {
>         audio_regs(2),
>         audio_regs(3),
>         audio_regs(4),
> -       audio_regs(5)
> +       audio_regs(5),
> +       audio_regs(6),
>  };
>
>  #define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
> --
> 2.37.3
>
