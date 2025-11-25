Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8946FC84BE0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 12:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152D610E3B6;
	Tue, 25 Nov 2025 11:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Bm+dRFbR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558E210E3B6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 11:30:30 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42b32a3e78bso4464027f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 03:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1764070229; x=1764675029;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vcYZq0V9wI5Ih/VVpvXT3ha6ZvwMnj0ifXs9GGriRN4=;
 b=Bm+dRFbROzZlQzde66H8tnHnmVjseITrQTDWfRY9SRSui0glxKEBqUH3WzNrDRrvul
 tm+IHVRJEpAyr4rsxZiwuIJNrPgVQHc/uZTchC0L8MKlC1NaNnX8JTpRU6DabEpCHCPg
 oAv9eykhp/yRM+ytmKsK73iOKU132m1cLJJGv1AbnVbnkD0GNALOili3qOXicvhsYakp
 NaQDz2g+cVJZbBvy3nvtZL2WBBirNgk4k92SHwa5Q4dTWIdzcOoygFiXdTVBJJgHmXuD
 RiZ2Gcb1Lym40+QFZFyaomE0qjVDvRmEAjf5L4mF00Kahm4UyAjhTGavF56BpiSyawfm
 cTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764070229; x=1764675029;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vcYZq0V9wI5Ih/VVpvXT3ha6ZvwMnj0ifXs9GGriRN4=;
 b=M4+K0rJZG8UWplctA+faECfCLDTCHYvvPc0d7h9GjxoRHCMVAp3II3VLYs62Y3NcPn
 gBVePfYIJrU83n0+WgGOhhxH/idg3T1QS3OrAE5GW01LADFD0W8TgUmCGquKO3/xaVkR
 CbyH2KlzjZZudBT+SjKOg3t1bf0FMhFcPmq3PjlumN0QeN/P59iOmKobwTtcU61jNJjO
 sm8F72Sf8h65uSg/KP1fms6YfzWRBBySdF920aqULGA6R+D3R3cRduXotqYEmv/HQvBb
 mw7+ICf9mVE0YiBQpqKPHbnjJTpVn9VnMTWylT/gxpQN4W5S2qvXD0BxKJ2RuZvIXkPx
 wfjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5M/8tByGqjrVSZ/8nx5Mh0iyDcCbPRfhtBHBxGluCkl0XGfSvrQ7v/4b+cecAL/FONP2BdnLdd7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIqBvFFaCkP1aeX8mT3cKX2zLDvrNQokpOIeq5snWnnDD1tGFp
 gq0BQHtDpaF7+6dIy0HmKz+yvulWRhIhl7/puNHLhfy2ulhuwWI9aNkJp9H56oG3BGQ=
X-Gm-Gg: ASbGncvXAlBuHuB6QX6oP6+3s84dQT0As23a+JiYIzfLKEZHdHCsd0Cnomfzug8tF3/
 0QHMXH68c0jXWwA/Y2if12xromBEYcTiub0J6Pz6ajGavtFbMxIRbPcW84vw/Kzf3prNIG4D5TH
 b42Iqc5eHL1pqMWLgtA4qPuAnNMnlLlFB1rnLbmjpogf85kLIEFBfkdpmCT+q4jbJIPhXTp/63N
 CqYASCIwrYtZ7CDgvD8V1Op8hnuOnSCaRTz3R8n1YaJDRNtKvMx5J9JEXdR30x4iV8OaeSwoP88
 oOqXnhDy+KSIgQoYxinEhQ6QvFoOXqtVkwvC9gDavIA1FaEPgMQ6m/0DKl2/s4qazpcimeU+JAR
 Fv2qOdARpgGz5C81iXd1G6zKtyof5V1k75/Ez3eDkaITb9qUyS/3xgLGY49iQajffynRWf0tOPc
 x+9NFTxYyD4YqkEp9YAebfiEF7uq0SxexD4Jn1RcCr7Ko0FBsHgczwky0p1n1+pUQvFCHFlg==
X-Google-Smtp-Source: AGHT+IEumK8b3/5kjOBvj8Oiu+dANyL2I+Rp0YSuQXsAfKV+gSoMX684uwjAqtKAsBGy6Gspp6EKyw==
X-Received: by 2002:a05:6000:1ace:b0:42b:4177:711e with SMTP id
 ffacd0b85a97d-42cc1d0cf97mr16706916f8f.37.1764070228512; 
 Tue, 25 Nov 2025 03:30:28 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd9061sm34007441f8f.41.2025.11.25.03.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 03:30:27 -0800 (PST)
Date: Tue, 25 Nov 2025 11:34:18 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Daniel Thompson <danielt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Pengutronix <kernel@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: apply the initial backlight state
 with sane defaults
Message-ID: <aSWUOoyusb2BJ6QA@aspen.lan>
References: <20250731-blpwm-v1-1-0171fd31bff9@pengutronix.de>
 <f492d4d3-751c-40a3-bb93-0e1bb192cde7@sirena.org.uk>
 <aRxr_sR0ksklFsw-@aspen.lan> <aSVnulk0yfAd4UCx@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSVnulk0yfAd4UCx@pengutronix.de>
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

On Tue, Nov 25, 2025 at 09:24:26AM +0100, Michael Grzeschik wrote:
> On Tue, Nov 18, 2025 at 12:52:14PM +0000, Daniel Thompson wrote:
> > On Fri, Nov 14, 2025 at 02:09:56PM +0000, Mark Brown wrote:
> > > On Thu, Jul 31, 2025 at 10:47:18AM +0200, Michael Grzeschik wrote:
> > > > Currently when calling pwm_apply_might_sleep in the probe routine
> > > > the pwm will be configured with an not fully defined state.
> > > >
> > > > The duty_cycle is not yet set in that moment. There is a final
> > > > backlight_update_status call that will have a properly setup state.
> > > > However this change in the backlight can create a short flicker if the
> > > > backlight was already preinitialised.
> > >
> > > I'm seeing the libre.computer Renegade Elite producing warnings during
> > > boot in -next which bisect to this patch.  The warnings are:
> > >
> > > [   24.175095] input: adc-keys as /devices/platform/adc-keys/input/input1
> > > [   24.176612] ------------[ cut here ]------------
> > > [   24.177048] WARNING: CPU: 0 PID: 0 at kernel/context_tracking.c:127 ct_kernel_exit.constprop.0+0x98/0xa0
> > >
> > > ...
> > >
> > > [   24.190106] Call trace:
> > > [   24.190325]  ct_kernel_exit.constprop.0+0x98/0xa0 (P)
> > > [   24.190775]  ct_idle_enter+0x10/0x20
> > > [   24.191096]  cpuidle_enter_state+0x1fc/0x320
> > > [   24.191476]  cpuidle_enter+0x38/0x50
> > > [   24.191802]  do_idle+0x1e4/0x260
> > > [   24.192094]  cpu_startup_entry+0x34/0x3c
> > > [   24.192444]  rest_init+0xdc/0xe0
> > > [   24.192734]  console_on_rootfs+0x0/0x6c
> > > [   24.193082]  __primary_switched+0x88/0x90
> > > [   24.193445] ---[ end trace 0000000000000000 ]---
> > >
> > > which seems a little surprising but there is some console stuff there
> > > that looks relevant.
> > >
> > > Full log:
> > >
> > >     https://lava.sirena.org.uk/scheduler/job/2086528#L897
> >
> > Michael, reading these logs it looks to me like the underlying oops
> > is this backtrace (which makes a lot more sense given the code you
> > altered):
> >
> > [   24.133631] Call trace:
> > [   24.133853]  pwm_backlight_probe+0x830/0x868 [pwm_bl] (P)
> > [   24.134341]  platform_probe+0x5c/0xa4
> > [   24.134679]  really_probe+0xbc/0x2c0
> > [   24.135001]  __driver_probe_device+0x78/0x120
> > [   24.135391]  driver_probe_device+0x3c/0x154
> > [   24.135765]  __driver_attach+0x90/0x1a0
> > [   24.136111]  bus_for_each_dev+0x7c/0xdc
> > [   24.136462]  driver_attach+0x24/0x38
> > [   24.136785]  bus_add_driver+0xe4/0x208
> > [   24.137124]  driver_register+0x68/0x130
> > [   24.137468]  __platform_driver_register+0x24/0x30
> > [   24.137888]  pwm_backlight_driver_init+0x20/0x1000 [pwm_bl]
> > [   24.138389]  do_one_initcall+0x60/0x1d4
> > [   24.138735]  do_init_module+0x54/0x23c
> > [   24.139073]  load_module+0x1760/0x1cf0
> > [   24.139407]  init_module_from_file+0x88/0xcc
> > [   24.139787]  __arm64_sys_finit_module+0x1bc/0x338
> > [   24.140207]  invoke_syscall+0x48/0x104
> > [   24.140549]  el0_svc_common.constprop.0+0x40/0xe0
> > [   24.140970]  do_el0_svc+0x1c/0x28
> > [   24.141268]  el0_svc+0x34/0xec
> > [   24.141548]  el0t_64_sync_handler+0xa0/0xf0
> > [   24.141920]  el0t_64_sync+0x198/0x19c
> >
> > Should we back out the patch for now?
>
> I would be fine with that. But actually I would like to see the
> proof that without the patch, this backtrace will not trigger.
> Looking through the codepath, I could not directly find a case
> where this should happen.

I took a look at the logs Mark provided and I think the problem
is a divide-by-zero caused by calling pwm_backlight_brightness_default()
when state.period is zero.

It emerges as a BRK because the compiler recognised there is undefined
behaviour. The zero that we divide by comes from a ternary condition in
fls(). The compiler recognises one of the conditional code paths will
result in undefined behaviour so, it doesn't need to generating code for
the bad code path, it just injects a brk instruction.


> Mark, is there a way to rerun this without my patch?

I have to admit I thought this was why Mark provided a bisect log!

Anyhow, unless someone can refute the analysis above I do think we need
to pull the patch.


Daniel.
