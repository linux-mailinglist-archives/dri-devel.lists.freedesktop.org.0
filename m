Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEF3AEB1D9
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBDF510E988;
	Fri, 27 Jun 2025 09:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KEuny7OA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50DCF10E982
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:00:03 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-4e9a109035bso1239344137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751014802; x=1751619602; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SnsCM6vh1hbia2n0ngkw0JzLXSE1g1GRVQpvRtLRTdA=;
 b=KEuny7OA/uyLABpArW8aaJsYiMt6eLaW4snfknA3za6/c203sr6zV9JOAW0GWTriHx
 z63VP80AloUB1aKQnmYfFTpbCz5cia85I3gK6iEZy8TJENVWkRK5LmUy0bhvX+B6EWo8
 ONK378nenbTkyR1oBULrZ3AAXC0XgG2dWc/C8AmwOw7RvCkhy29UGcVOx2o48ZO2QIXc
 jcpWFZucHns2a+x8GQD2CKjGLWHh+Sck5CXPK5HTi/WqnUcFXsCcYKO83TIj1iDHxP3f
 fK2JtzPojPSIKi4EPjffQWfHHnt8tLn+wThJZA49+0byITfYfOrBmhYYxiw8E90Txz3M
 +8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751014802; x=1751619602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SnsCM6vh1hbia2n0ngkw0JzLXSE1g1GRVQpvRtLRTdA=;
 b=lW54XoMizCz1FezCK1vZ7TnSZMDSn0bhA0BLB5OcxIi2FBeCYqFJdtc2XnKHLi0L7z
 L9hG6JbKS1ygpEJ+yCxCOX1TOZc15aBMjLklX/dj7C7IkYksS+PT6LWsfECmwKmzvPHN
 NUmiLb1OwqhDGaXcFLFkbjNtjrYAWATb4aIoIRuInZttqVR7tTu//KnUxtCKdL7ueHHr
 D4Unchw5eC+w3hCpyY2saRtNru9O3dhTgh0IjCtiPiZTRiDs1qkt1N5WVkfYGwEdH4yS
 hpuFpdy7czDzaYrGMGiXJdPUUTu83SBqG2Jep3MagZQUdQDvQU41wUw/gJoQs+lBfUZi
 c33A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1nEJYNhWoSARtfPux+dIU9ndQ76i1LbKlV9OANJom/q0gFris1tFxMIZECm/4R6Op1rhm1PDLLBM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzglOPWDN+9kOuJjQsooOL0ZSOR9kStOA1Y6t5S5Sh3chhls64r
 TgD8Lx+20wk2u3ZqMzlItVs/S+AOoIhkeWOD5har/Cyy8Nf58LVjhrued1J0TNwDCRgSI05dgXp
 Wnhjp99qVfk1uQqP+1MHeglY6Gg4pbGk=
X-Gm-Gg: ASbGnctMU8JV7iIAoP03sUK9Fwqjaxur5wf4uVGZtpuiI6arfQ1xIjjYw1BXAt8mGWk
 C7eHy0anID1j7H2JvdS/gjkifldDiqm9TzVRJm/KbSGe3+lyFUpv5wJPXPfgPTpylUdpwx4n/zk
 bjA0lHc97Hjwcu26Z3KVF+w9kIiPqcFFp4dUTeHFx+TN289N15XNPB
X-Google-Smtp-Source: AGHT+IG0giQJgiPaZuODgMaMoAB9XTNdwCdCo2KNw4Z1XIix6KlPI3eNjv42gi2fFl0eXZTrN9Xo04XnwaYsNYTjCsI=
X-Received: by 2002:a05:6102:c06:b0:4e7:bc41:a9ab with SMTP id
 ada2fe7eead31-4ee4fa0bfcfmr1949507137.23.1751014802254; Fri, 27 Jun 2025
 02:00:02 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250618120644eucas1p2b084977540772f3623f3f9e834604668@eucas1p2.samsung.com>
 <20250618120626.217023-1-m.szyprowski@samsung.com>
 <96b92a56-028f-452d-b2dd-8362491f5a84@ideasonboard.com>
 <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
In-Reply-To: <a89ebc1f-82a0-4bb8-87a8-71a6b373ab24@samsung.com>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 17:59:23 +0900
X-Gm-Features: Ac12FXy11lwfrAQqrGiTkAgvbq022_Vm3UIn23uII1Nxc8apm6Ln8LIsYR0HYKQ
Message-ID: <CAAQKjZNQa=g=a_sWnhVrR5_9EJx9hVqbi-=HDXWtRwqb18-NKA@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: fimd: Guard display clock control with
 runtime PM calls
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
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

Hi Marek,

2025=EB=85=84 6=EC=9B=94 19=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 7:39, M=
arek Szyprowski <m.szyprowski@samsung.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> On 18.06.2025 14:25, Tomi Valkeinen wrote:
> > On 18/06/2025 15:06, Marek Szyprowski wrote:
> >> Commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-ena=
ble
> >> and post-disable") changed the call sequence to the CRTC enable/disabl=
e
> >> and bridge pre_enable/post_disable methods, so those bridge methods ar=
e
> >> now called when CRTC is not yet enabled.
> >>
> >> This causes a lockup observed on Samsung Peach-Pit/Pi Chromebooks. The
> >> source of this lockup is a call to fimd_dp_clock_enable() function, wh=
en
> >> FIMD device is not yet runtime resumed. It worked before the mentioned
> >> commit only because the CRTC implemented by the FIMD driver was always
> >> enabled what guaranteed the FIMD device to be runtime resumed.
> >>
> >> This patch adds runtime PM guards to the fimd_dp_clock_enable() functi=
on
> >> to enable its proper operation also when the CRTC implemented by FIMD =
is
> >> not yet enabled.
> >>
> >> Fixes: 196e059a8a6a ("drm/exynos: convert clock_enable crtc callback t=
o pipeline clock")
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >>   drivers/gpu/drm/exynos/exynos_drm_fimd.c | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/dr=
m/exynos/exynos_drm_fimd.c
> >> index c394cc702d7d..205c238cc73a 100644
> >> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> >> @@ -187,6 +187,7 @@ struct fimd_context {
> >>      u32                             i80ifcon;
> >>      bool                            i80_if;
> >>      bool                            suspended;
> >> +    bool                            dp_clk_enabled;
> >>      wait_queue_head_t               wait_vsync_queue;
> >>      atomic_t                        wait_vsync_event;
> >>      atomic_t                        win_updated;
> >> @@ -1047,7 +1048,18 @@ static void fimd_dp_clock_enable(struct exynos_=
drm_clk *clk, bool enable)
> >>      struct fimd_context *ctx =3D container_of(clk, struct fimd_contex=
t,
> >>                                              dp_clk);
> >>      u32 val =3D enable ? DP_MIE_CLK_DP_ENABLE : DP_MIE_CLK_DISABLE;
> >> +
> >> +    if (enable =3D=3D ctx->dp_clk_enabled)
> >> +            return;
> > Does this happen, i.e. is this function called multiple times with
> > enable set? If so, do you rather need ref counting here? Otherwise the
> > first fimd_dp_clock_enable(enable=3Dfalse) call with disable the clock,
> > instead of the last (assuming the enable/disable calls are matched on
> > the caller side).
>
> No reference counting is needed here, as the clock enable/disable is
> called from runtime resume/suspend of the exynos_dp (analogix_dp_core)
> and there are only single calls to enable or disable. The only problem
> is that the first call is fimd_dp_clock_enable(enable=3Dfalse), which
> should be skipped from the fimd runtime PM perspective, that is why I
> added the (enable =3D=3D ctx->dp_clk_enabled) check.

The fimd_dp_clock_enable function is called from
exynos_drm_pipe_clk_enable(), which, as far as I can see, is invoked
by three modules: the analogix DP driver, the exynos5433 DECON driver,
and the exynos mixer driver.

First, both the decon_atomic_enable() function in
exynos5433_drm_fimd.c and the mixer_atomic_enable() function in
exynos_mixer.c explicitly request runtime PM resume before calling
exynos_drm_pipe_clk_enable(). This ensures the device is properly
powered before any register access.

In my opinion, the root cause of this issue is that the analogix DP
driver does not follow the DRM atomic pipeline and attempts to access
the register file without requesting runtime PM resume.

As you pointed out, the main problem is that the analogix_dp driver
calls exynos_drm_pipe_clk_enable() through exynos_dp_poweron() without
requesting runtime PM.

Given that the exynos_dp.c driver, which uses the analogix DP module,
does register the runtime PM interface, we should look for a more
generic solution that ensures exynos DP is included in the DRM atomic
pipeline chain and requests runtime PM at the appropriate point.

Since this is a critical issue, I will merge the current patch without
further modifications. :)

Thanks,
Inki Dae


>
> >> +
> >> +    if (enable)
> >> +            pm_runtime_resume_and_get(ctx->dev);
> >> +
> >> +    ctx->dp_clk_enabled =3D enable;
> >>      writel(val, ctx->regs + DP_MIE_CLKCON);
> >> +
> >> +    if (!enable)
> >> +            pm_runtime_put(ctx->dev);
> >>   }
> >>
> >>   static const struct exynos_drm_crtc_ops fimd_crtc_ops =3D {
> >   Tomi
> >
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
>
