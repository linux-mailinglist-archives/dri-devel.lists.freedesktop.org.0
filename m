Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B08BD170
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 17:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 787A3112147;
	Mon,  6 May 2024 15:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="EVulLAiy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E520112146
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 15:18:10 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3c71c7e2d40so153625b6e.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715008687; x=1715613487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NW0JfqB4OlLDKp6tehMofAKAc+mxXzyiE89TMPGmDxY=;
 b=EVulLAiymclTSTCfIzRLRaDlmQN8IJJDhoLDRHCDI4La+oNQErQ8vvngwljeGW7kGL
 Wbnnu6Rn8t1p6olU+aduXtWFSjDhLXq0xVEqCwfF6jJ1AYZdKYVZvCRA11dLXvgDCB2a
 j+l1Z9ifjRE7yS0cpLYMabxtXsNI40qnjy+ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715008687; x=1715613487;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NW0JfqB4OlLDKp6tehMofAKAc+mxXzyiE89TMPGmDxY=;
 b=UOPMv0hLRXhv9gJEMTQHieagvtdDHDCrg/E8HiSZCZqtkdZ+jGfYQKnQHtpRZasL16
 tuVV4Rj2ONQ943I6e09IFJS/4VExr47rEeDWeS0+BoBZ3D6wjfgd3KUqVG3X8Gbe40NX
 /2aPgA4NaVlojWb0A1dI9j7MC2T4yiHJMvTUXl2zPGDZDsIRsTAGbaX39dbv8MmnY5fo
 e5cAuTk0EeThdLzQtUYGZmTsqc91MF1qG8vtjEkxYWkcQ7bSlnZTuJpUOB5bbCni9E46
 V5VZuoRJQofdmTDO3G+AKW+69MRkAueMJqkFVXkUKALZpYxzRXaI1wGf5F2aynQrnF8m
 kIVQ==
X-Gm-Message-State: AOJu0YwO3NKFe2HwP5pfEdnwIAkmCAP9eQSXlI9eFqQV3NJ+C2cppAVZ
 vKizJj/tZgK/l5jNFdhl23uvh/JdoKlrqGUUtVHvV8F2dcy52IvvB+rGw8G58L8OOwVzWXNuuU8
 =
X-Google-Smtp-Source: AGHT+IF4DdON4ubuVz3i8O4bniyYE2OuEsRCeSgapDRBCSfZZI8LiCTyiHCtMvd4qQ2HH5aF6FZD5Q==
X-Received: by 2002:a05:6808:6082:b0:3c8:566a:bb9d with SMTP id
 de2-20020a056808608200b003c8566abb9dmr10880070oib.14.1715008686946; 
 Mon, 06 May 2024 08:18:06 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com.
 [209.85.160.172]) by smtp.gmail.com with ESMTPSA id
 q18-20020a0ce9d2000000b006a07e3701a2sm3767290qvo.143.2024.05.06.08.18.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 08:18:05 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-43d361a2124so333071cf.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 08:18:04 -0700 (PDT)
X-Received: by 2002:ac8:5ace:0:b0:43a:befb:dcdd with SMTP id
 d75a77b69052e-43d08a00245mr4460711cf.25.1715008683865; Mon, 06 May 2024
 08:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.15.Ibeb2e5692e34b136afe4cf55532f0696ab3f5eed@changeid>
 <dfc4699e-214b-4821-bdfc-7306eef80d30@cherry.de>
In-Reply-To: <dfc4699e-214b-4821-bdfc-7306eef80d30@cherry.de>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 May 2024 08:17:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UiFE+Zuz93B7K5g7WPZtSZnXqcAoJpj1E0wq9_ALk+PQ@mail.gmail.com>
Message-ID: <CAD=FV=UiFE+Zuz93B7K5g7WPZtSZnXqcAoJpj1E0wq9_ALk+PQ@mail.gmail.com>
Subject: Re: [RFT PATCH v2 15/48] drm/panel: ltk050h3146w: Don't call
 unprepare+disable at shutdown/remove
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

Hi,

On Mon, May 6, 2024 at 7:04=E2=80=AFAM Quentin Schulz <quentin.schulz@cherr=
y.de> wrote:
>
> Hi Douglas,
>
> On 5/3/24 11:32 PM, Douglas Anderson wrote:
> > [You don't often get email from dianders@chromium.org. Learn why this i=
s important at https://aka.ms/LearnAboutSenderIdentification ]
> >
> > It's the responsibility of a correctly written DRM modeset driver to
> > call drm_atomic_helper_shutdown() at shutdown time and that should be
> > disabling / unpreparing the panel if needed. Panel drivers shouldn't
> > be calling these functions themselves.
> >
> > A recent effort was made to fix as many DRM modeset drivers as
> > possible [1] [2] [3] and most drivers are fixed now.
> >
> > Unfortunately, grepping mainline for this panel's compatible string
> > shows no hits, so we can't be 100% sure if the DRM modeset driver used
> > with this panel has been fixed. If it is found that the DRM modeset
> > driver hasn't been fixed then this patch could be temporarily reverted
> > until it is.
> >
> > [1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium=
.org
> > [2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium=
.org
> > [3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromiu=
m.org
> >
> > Cc: "Heiko St=C3=BCbner" <heiko@sntech.de>
> > Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> I get:
>
> """
> [   27.239362] ------------[ cut here ]------------
> [   27.244549] refcount_t: addition on 0; use-after-free.
> [   27.250308] WARNING: CPU: 4 PID: 1 at lib/refcount.c:25
> refcount_warn_saturate+0x120/0x144
> [   27.259556] Modules linked in: snd_soc_simple_card crct10dif_ce
> snd_soc_simple_card_utils fuse [last unloaded: panel_leadtek_ltk050h3146w=
]
> [   27.273470] CPU: 4 PID: 1 Comm: systemd-shutdow Not tainted
> 6.9.0-rc7-00002-g4a8eaebfcfde-dirty #63
> [   27.283584] Hardware name: Theobroma Systems RK3399-Q7 SoM on Haikou
> devkit with Video Demo adapter (DT)
> [   27.294180] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [   27.301962] pc : refcount_warn_saturate+0x120/0x144
> [   27.307411] lr : refcount_warn_saturate+0x120/0x144
> [   27.312860] sp : ffff800081babb10
> [   27.316559] x29: ffff800081babb10 x28: ffff000000640000 x27:
> 0000000000000000
> [   27.324539] x26: ffff8000814847f8 x25: 0000000000000001 x24:
> ffff800081adb028
> [   27.332519] x23: ffff000000e13090 x22: ffff800081b3c280 x21:
> ffff0000006c8680
> [   27.340489] x20: ffff0000006c8680 x19: ffff00000a6f8000 x18:
> 0000000000000006
> [   27.348468] x17: 000000040044ffff x16: 00500074b5503510 x15:
> ffff800081bab580
> [   27.356447] x14: 0000000000000000 x13: ffff8000819944d0 x12:
> 0000000000000a2f
> [   27.364426] x11: 0000000000000365 x10: ffff8000819ec4d0 x9 :
> ffff8000819944d0
> [   27.372396] x8 : 00000000ffffefff x7 : ffff8000819ec4d0 x6 :
> 80000000fffff000
> [   27.380375] x5 : 0000000000000366 x4 : 0000000000000000 x3 :
> 0000000000000000
> [   27.388353] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff000000640000
> [   27.396332] Call trace:
> [   27.399061]  refcount_warn_saturate+0x120/0x144
> [   27.404122]  drm_dev_get+0x78/0x7c
> [   27.407924]  drm_atomic_state_init+0x78/0xd0
> [   27.412695]  drm_atomic_state_alloc+0x6c/0x9c
> [   27.417563]  drm_atomic_helper_disable_all+0x20/0x214
> [   27.423208]  drm_atomic_helper_shutdown+0xa4/0x148
> [   27.428560]  rockchip_drm_platform_shutdown+0x18/0x28
> [   27.434207]  platform_shutdown+0x24/0x34
> [   27.438589]  device_shutdown+0x150/0x258
> [   27.442973]  kernel_power_off+0x38/0x7c
> [   27.447260]  __do_sys_reboot+0x204/0x24c
> [   27.451643]  __arm64_sys_reboot+0x24/0x30
> [   27.456122]  invoke_syscall+0x48/0x114
> [   27.460311]  el0_svc_common.constprop.0+0x40/0xe0
> [   27.465567]  do_el0_svc+0x1c/0x28
> [   27.469269]  el0_svc+0x34/0xd8
> [   27.472681]  el0t_64_sync_handler+0x120/0x12c
> [   27.477548]  el0t_64_sync+0x190/0x194
> [   27.481639] ---[ end trace 0000000000000000 ]---
> [   27.486831] ------------[ cut here ]------------
> [   27.491995] refcount_t: underflow; use-after-free.
> [   27.497414] WARNING: CPU: 4 PID: 1 at lib/refcount.c:28
> refcount_warn_saturate+0xf4/0x144
> [   27.506558] Modules linked in: snd_soc_simple_card crct10dif_ce
> snd_soc_simple_card_utils fuse [last unloaded: panel_leadtek_ltk050h3146w=
]
> [   27.520468] CPU: 4 PID: 1 Comm: systemd-shutdow Tainted: G        W
>         6.9.0-rc7-00002-g4a8eaebfcfde-dirty #63
> [   27.532230] Hardware name: Theobroma Systems RK3399-Q7 SoM on Haikou
> devkit with Video Demo adapter (DT)
> [   27.542826] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [   27.550607] pc : refcount_warn_saturate+0xf4/0x144
> [   27.555958] lr : refcount_warn_saturate+0xf4/0x144
> [   27.561309] sp : ffff800081babb10
> [   27.565008] x29: ffff800081babb10 x28: ffff000000640000 x27:
> 0000000000000000
> [   27.572988] x26: ffff8000814847f8 x25: 0000000000000001 x24:
> ffff800081adb028
> [   27.580958] x23: ffff000000e13090 x22: ffff00000a6f82e0 x21:
> ffff00000a6f8170
> [   27.588928] x20: ffff00000a6f8000 x19: ffff00000a6f8000 x18:
> 0000000000000006
> [   27.596907] x17: 000000040044ffff x16: 00500074b5503510 x15:
> 072007200720072e
> [   27.604877] x14: 0000000000000000 x13: 0000000000000046 x12:
> 0000000000000000
> [   27.612847] x11: 0000000000000000 x10: 0000000000000a20 x9 :
> ffff800081bab980
> [   27.620826] x8 : ffff000000640a80 x7 : ffff0000054e1000 x6 :
> 00000000ffffffff
> [   27.628796] x5 : 00000000410fd080 x4 : 0000000000000002 x3 :
> 0000000000000000
> [   27.636775] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> ffff000000640000
> [   27.644754] Call trace:
> [   27.647482]  refcount_warn_saturate+0xf4/0x144
> [   27.652445]  drm_dev_put.part.0+0xb0/0xc0
> [   27.656925]  drm_dev_put+0x14/0x24
> [   27.660722]  __drm_atomic_state_free+0xbc/0xd0
> [   27.665687]  drm_atomic_helper_disable_all+0x108/0x214
> [   27.671429]  drm_atomic_helper_shutdown+0xa4/0x148
> [   27.676781]  rockchip_drm_platform_shutdown+0x18/0x28
> [   27.682425]  platform_shutdown+0x24/0x34
> [   27.686807]  device_shutdown+0x150/0x258
> [   27.691190]  kernel_power_off+0x38/0x7c
> [   27.695475]  __do_sys_reboot+0x204/0x24c
> [   27.699858]  __arm64_sys_reboot+0x24/0x30
> [   27.704337]  invoke_syscall+0x48/0x114
> [   27.708525]  el0_svc_common.constprop.0+0x40/0xe0
> [   27.713782]  do_el0_svc+0x1c/0x28
> [   27.717484]  el0_svc+0x34/0xd8
> [   27.720894]  el0t_64_sync_handler+0x120/0x12c
> [   27.725762]  el0t_64_sync+0x190/0x194
> [   27.729851] ---[ end trace 0000000000000000 ]---
> """
>
> when running "poweroff" after doing a modprobe -r of the driver on
> RK3399 Puma and PX30 Ringneck (the trace comes from RK3399 Puma). It is
> fine if I still have the device probed, no trace when powering off.

I'm not too surprised there. It's _really_ hard to successfully
"remove" DRM devices that are used on systems that use the component
model to get everything up and running. My series doesn't attempt to
make this better but it also shouldn't make it worse. It does point to
the fact that probably many of the remove() functions in DRM panels
are never exercised...


> BUT, I have the same trace in the 6.9-rc7 already, so I guess:
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3399 Puma with
> Haikou Video Demo
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # PX30 Ringneck
> with Haikou Video Demo
>
> I'll let Heiko test this on RK3588 Tiger with Haikou Video Demo to check
> the whole stack is ready there as well.

Thank you for reviewing / testing! :-)

-Doug
