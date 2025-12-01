Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BBEC99A6C
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 01:32:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70DF10E4F2;
	Tue,  2 Dec 2025 00:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EEfnN7kE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FAE10E470
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 19:34:50 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-4ee1fca7a16so38567381cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 11:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764617689; x=1765222489; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hrfv4uQbdf8StxC+iSo/uBPbeiOcK3CrZj4RJ6zLs4c=;
 b=EEfnN7kEI2fhsaACpzC5VYO97zURiNtkxY5mpwdN271R10NUw+YkS2DmiJnM+iSux3
 cS1gwVcD+xs6m6dpimHVB6zOyJ9IkS/OOJbdBKF+Ig98omxPFvsHn1kcwxErBVhggvy2
 j8mNu1w34Y0LvPFCpVIBi22yx0I/a8M3RKr8MGeKFFOMlU55G5Jh8slDwB6fv3Wk6v+Z
 zjtcMdElia0BpRKVRuh6TT3OTHYS8VN4Ol+iuDiKJPsVDf8qGMfY6vpQ6ToH9Rbogpyf
 C2c67lIubPvMSjZzX0FxOJ6onJ09wK6zlzw/ZY3YEwdf7gAZ2GelTgAmmp0S+k0PXJxD
 ALhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764617690; x=1765222490;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hrfv4uQbdf8StxC+iSo/uBPbeiOcK3CrZj4RJ6zLs4c=;
 b=wDm8t3ZDLAPpSsljax5+m03zaxQ8X6cHD8Wj05Sl7VMINLimfNiZHXA3Qq55Abd/lg
 2K6rznZ1ktcE/KWFAqSbbrl9iXUqykdWtf4y5lpCWE3p45NWdYm3Q6a2jp4l7ITkSSr4
 E7wRw9ykJU1D/90WYatjrISLtTwSz/MG4pLGc1NlYZAZWaMedKRNNDGbQUQQLo4uY5jZ
 q2EVoOlKt2SmoJRgjEYrybnmbdKCJbp+4bbc4ItnWDjfVRfeBIIMijWe8eYNBv2JFSJX
 rF535FOAGRNRUCOe0u4PjE3kPFtutU+7KqVzps4QdHKF16jHXnFWO7E1MVmHj5kDdN57
 k/6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu6F9I3utzFkXVfzZHDFbczevUKlC7tkID8EpULJmOOYciovSRTzlgnt8dA/d2u7Z7nmvyBxfpo78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxd32+NG3L2UbOhPVn74s2gBWSo5Z6amQV0dfEAwjrGRo97yeui
 zbEItounAPc7Jt9eTvuQ6MSDSsjmWJ+tfVOEyoM9HFlmETEA0RtCXSvPIV5d+AV6uFYzhciulE2
 XOJrX8ZKCxPZZVFVtU4eaSr/AnmVVPlY=
X-Gm-Gg: ASbGncvQ43X8d82shO+7J7VRRxKfQkIG9UhmQN8gwmTHIyjk8D/J/M+2y+1WqYTLMRM
 O39BIh7wgeLtAlF9M+oE+viSWFDl61orllBVD3gkzb9zaq2nEMVAbFnVjuatGsyaH1X8eUH3WPv
 QAT08+wXzfKgVXmFAqBzRZinYDUejfo8zxgpUSPZ7/Jr/yl9XaI2+KZw1SLLA2hHQP2CWDOvF3K
 3AJqw9a71uTw8bE9LFC86XNxswlEeg6TjsOSwSCVyrphXxTCFGuNbtvJOm96GEqdv9dqC8=
X-Google-Smtp-Source: AGHT+IFmpaTlE0AJcrh+QxTgK8vVtC9Vj6+bDrj0oNWe++M08sNSGuES2hkzGIvaWy1+DDrTM6TnlpfqbJJ0XAa4r+0=
X-Received: by 2002:ac8:7d0b:0:b0:4ee:84c:20c9 with SMTP id
 d75a77b69052e-4efbdafab77mr349104211cf.65.1764617689540; Mon, 01 Dec 2025
 11:34:49 -0800 (PST)
MIME-Version: 1.0
References: <CAAMcf8BfxMJx+5ttEXx0kONP2OYWSLFqEYF6rfVBKoRg5TKZzQ@mail.gmail.com>
 <bea50d14-2311-46ad-bb30-9d60a4c5e3a2@linux.dev>
 <ff21cbd1-dc77-43ae-85a8-dc6a56a1cefa@linux.dev>
In-Reply-To: <ff21cbd1-dc77-43ae-85a8-dc6a56a1cefa@linux.dev>
From: Vicente Bergas <vicencb@gmail.com>
Date: Mon, 1 Dec 2025 20:34:37 +0100
X-Gm-Features: AWmQ_bml5Hxt0ZY0wbmke64TybbEljkRASfjj-7FDHjmQsBWPE_Fq-D3Dj-00w8
Message-ID: <CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
 alexander.sverdlin@siemens.com, andrzej.hajda@intel.com, 
 dri-devel <dri-devel@lists.freedesktop.org>, jernej.skrabec@gmail.com, 
 Jonas Karlman <jonas@kwiboo.se>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, lumag@kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 neil.armstrong@linaro.org, nm@ti.com, rfoss@kernel.org, simona@ffwll.ch, 
 tomi.valkeinen@ideasonboard.com, tzimmermann@suse.de, vigneshr@ti.com, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Damon Ding <damon.ding@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Linux Rockchip Support List <linux-rockchip@lists.infradead.org>,
 Devarsh Thakkar <devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 02 Dec 2025 00:31:59 +0000
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

On Mon, Oct 6, 2025 at 5:30=E2=80=AFPM Aradhya Bhatia <aradhya.bhatia@linux=
.dev> wrote:
>
> +rockchip maintainers
>
> Hi Vicente, all,

Hi everybody,
please, can some expert on this platform take a look at this bug?

Regards,
  Vicente.

> I went through the drivers and the affected areas in the gru-kevin
> chromebook pipeline last week, but nothing has stood out.
>
>
> Pipeline:
>
> rockchip,display-subsystem / rk3399-vop (Big/Lite) (CRTC) ->
> rk3399-edp (Encoder) -> analogix_dp_core (Bridge) ->
> sharp,lq123p (edp-panel)
>
> I am unable to debug this further since I do not have the hardware.
>
> I could use some help, especially from folks who understand the hardware
> requirements better.
>
>
> On 11/09/25 09:01, Aradhya Bhatia wrote:
> > Hi Vicente,
> >
> > Thank you for the bisection and reporting the issue.
> >
> > On 10/09/25 16:17, Vicente Bergas wrote:
> >> Hi,
> >> this patch causes a regression. It has been reported in
> >> https://bugzilla.kernel.org/show_bug.cgi?id=3D220554
> >>
> >> It affects the gru/kevin platform (arm64,RK3399) with the Panfrost DRM=
 driver.
> >
> > I believe the Panfrost DRM driver may only be for the GPU.
> >
> > Based on the dts files in arm64/rockchip/, this is the pipeline of the
> > gru-kevin setup that I understand.
> >
> >       rk3399-vop (Big/Lite) -> rk3399-edp -> sharp,lq123p (edp-panel)
> >
> > The setup seems to be using the drm/rockchip drivers for the display
> > controller and for the bridge.
> >
> >>
> >> When it boots in console mode, the blinking of the cursor keeps the di=
splay on.
> >> If it is turned off via /sys/class/graphics/fbcon/cursor_blink, then
> >> the display briefly shows each key press presented on screen for less
> >> than one second and then powers off.
> >>
> >> When starting the graphical mode (wayland), if there are no
> >> applications drawing on the screen, the only way to keep the display
> >> on is by continuously moving the mouse.
> >>
> >
> > Okay!
> >
> > I will have a look through the drivers. In the meanwhile, please do
> > report back if you find any other observations.
> >
> >
>
> --
> Regards
> Aradhya
>
