Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4BF93D24C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 13:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D6910E0CA;
	Fri, 26 Jul 2024 11:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="OGJ8Sj4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E742810E0CA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 11:31:46 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5d31ef2c73cso539402eaf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2024 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1721993506; x=1722598306;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kmk1JjA2Ls4g+KyqSuHumcBghaFAtTT2atg+wkKZS7s=;
 b=OGJ8Sj4rH3+nhzMNCDIbiV40Asvzf4LdcL0GU4ZhN/Y2v6sQuZdMKgQO8icEZJ/tnd
 kETg/9bNSspVOe9KLhHqqijpHdZZb72PEA+jdqfScBS6rZ5BWWe3oT42imNu2FF0mTb6
 FMcpLJDlzSW4UmPQeoD5ctAE25e9nwd4tOWd6UENut9zUt6a/h4ORMTnNRaVFoHz2RzQ
 sSwkhEpch6d/p6glYODuV1yGLtkBFDoIGwtGGCeqGYKnL3Gg6MzJHV57NCD3+0tM+0uj
 0hIdI5+jZryK+3w+0ELTCEh1Ce9M0wmOoacLE4y+MgtJ0rX8x/6B/gEP2OdiGQ2EaMGv
 UhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721993506; x=1722598306;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kmk1JjA2Ls4g+KyqSuHumcBghaFAtTT2atg+wkKZS7s=;
 b=NswYV4L8Vt2+zVXKn38yUcNR5B9YauEKAO+P/5jkJaJIBxol2xepIJb8eBokWOKYyM
 FuTNSt6MROIyJSH7FGr+/qYsGE9VxBwVED3pP5OF7Ogmo0u7YDV+0CjB1ofHl8KxchLZ
 VOPhtZTPU4Z1qJ7Kn2muF0hVw7uZxk2r0WwMwvzJbg5JjjnfCWgCfDDRpuvfW+sY83a7
 ke//VaP6qn+7ARcZlNPR5c+YnGzL4BOsMS2kqtzBbAXBK51JkQD8MwXjlBTAFKB7wYWy
 BuDXR4c/LKaZJuM78BdILIUvllSdg+1M3aJd+Qh8teH6IlkwO4IKFwFwdRzfZZG1uFgo
 eURQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX22WFfFVHr/xToh8f4bcIqiW9zthdlX+x5q7ZBih3Mj3+0aSQhjkkEvHOZlkHKSJwADPG1wZ22Hd3ie5CYaNJJkRI1krWPioZSGiOYmWNY
X-Gm-Message-State: AOJu0YxfNxZqgC3Q1nf4bl2l3sTYVfPSpGpp674na+h3keYdm/duaofR
 xFBSTNtg05lBveCFOrWN8o46V0BwnbnCnoC58fCkNRUH0B3X2E2gYZq7PgLRxCKYRunhR94nPv4
 jrMOrQWAweBNa9WkldkVQAaBDZjcARBAKEMDc5A==
X-Google-Smtp-Source: AGHT+IGvPfPntSm/3Bto2qo4lI9AXdvO3Bew6FS2Yq3n8hvJGd9oEEOgF1uuOwWL92xMEZYtBtPacNHYm21W/2FzE+w=
X-Received: by 2002:a05:6358:280e:b0:1aa:bad6:2ba7 with SMTP id
 e5c5f4694b2df-1acfb99ed34mr636036055d.25.1721993505839; Fri, 26 Jul 2024
 04:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <TkgKVivuaLFLILPY-n3iZo_8KF-daKdqdu-0_e0HP-5Ar_8DALDeNWog2suwWKjX7eomcbGET0KZe7DlzdhK2YM6CbLbeKeFZr-MJzJMtw0=@proton.me>
 <CAPj87rPwJ-vRTsjM1rWRj1gyjbJM_ryrkTiPRBF3ZF1D7TVDYw@mail.gmail.com>
 <PGDz1uKmBh2U_yB-ut5xcahPHdmxgrIRAwALnJzsEHFuYssmMhQUz8jbHpEyUDBMjVbmQCjlP3K4gbzw3zZ53HhXUsXufBb5YzptnC58aeQ=@proton.me>
In-Reply-To: <PGDz1uKmBh2U_yB-ut5xcahPHdmxgrIRAwALnJzsEHFuYssmMhQUz8jbHpEyUDBMjVbmQCjlP3K4gbzw3zZ53HhXUsXufBb5YzptnC58aeQ=@proton.me>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 26 Jul 2024 12:31:34 +0100
Message-ID: <CAPj87rOM=j0zmuWL9frGKV1xzPbJrk=Q9ip7F_HAPYnbCqPouw@mail.gmail.com>
Subject: Re: [PATCH v3] rockchip/drm: vop2: add support for gamma LUT
To: Piotr Zalewski <pZ010001011111@proton.me>
Cc: "airlied@gmail.com" <airlied@gmail.com>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "heiko@sntech.de" <heiko@sntech.de>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Piotr,

On Thu, 25 Jul 2024 at 20:06, Piotr Zalewski <pZ010001011111@proton.me> wrote:
> I based my patch on how gamma LUT is handled in VOP. There, in atomic
> enable, gamma LUT write takes places at the end too, after the mutex was
> already first-time unlocked. I understand the concept of DRM atomic state
> updates and what you wrote makes sense.

Yeah, no problem - the old VOP1 code is clearly incorrect here. I'm
glad you can improve VOP2. :)

>  static void vop2_dither_setup(struct drm_crtc *crtc, u32 *dsp_ctrl)
> @@ -2152,6 +2127,9 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         vop2_post_config(crtc);
>
> +       if (crtc->state->gamma_lut)
> +               vop2_crtc_gamma_set(vop2, crtc, old_state, &dsp_ctrl);

I think this call should be unconditional, so that we correctly
program LUT_DIS if there is no LUT set up during enable.

> @@ -2599,8 +2575,17 @@ static void vop2_crtc_atomic_begin(struct drm_crtc *crtc,
>         vop2_setup_alpha(vp);
>         vop2_setup_dly_for_windows(vop2);
>
> -       if (crtc_state->color_mgmt_changed && !crtc_state->active_changed)
> -               vop2_crtc_gamma_set(vop2, crtc, old_crtc_state);
> +       if (crtc_state->color_mgmt_changed && !crtc_state->active_changed) {
> +               u32 dsp_ctrl = vop2_vp_read(vp, RK3568_VP_DSP_CTRL);;
> +
> +               vop2_lock(vop2);
> +
> +               vop2_crtc_gamma_set(vop2, crtc, old_crtc_state, &dsp_ctrl);
> +
> +               vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> +               vop2_cfg_done(vp);
> +               vop2_unlock(vop2);
> +       }

Calling lock/set/write/done/unlock here seems like an anti-pattern;
the cfg_done is already written in atomic_flush, so at least that part
is not necessary.

On platforms like RK3588, it looks like the new LUT can just be
written directly from atomic_begin without needing to program
DSP_CTRL, take locks, or synchronise against anything, so that should
be an easy straight-line path.

On platforms like RK3568, it would probably be better to set
mode_changed when the colour management configuration changes. That
will give you a good point to synchronise the cross-VOP dependencies
(i.e. claim or release the shared LUT when it is being
enabled/disabled), and also a hint to userspace that it is not going
to be a seamless transition as the LUT is disabled, programmed, then
re-enabled.

I think this would end up in a net reduction of LoC as well as a net
reduction of code weirdness.

Cheers,
Daniel
