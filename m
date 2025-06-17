Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C19ADD53F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 18:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9234A10E00E;
	Tue, 17 Jun 2025 16:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J+GYEg3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E57410E00E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 16:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750177125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AhNKbkuIlPlf0ieOh+w6Xyw/UKHhPSsG6Hjs9ro9r1s=;
 b=J+GYEg3B7mpIrObVunqoyoGgPOSC2e97c5GogpRTKmTyJ9k/d70EZPkxZ5xGqQmJSZc3ej
 29+jiuX7Ai0uaKITJOdQp3MFjgXRqlUFnyZ4D/rgZDPsNU1+cCsSlpptYfCmtHdYaKQe0a
 g9spbonNHoJxHB0VaY4LtqigFvkARR4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-d3TR7pcaPMyNQfW_t7-7rA-1; Tue, 17 Jun 2025 12:18:42 -0400
X-MC-Unique: d3TR7pcaPMyNQfW_t7-7rA-1
X-Mimecast-MFC-AGG-ID: d3TR7pcaPMyNQfW_t7-7rA_1750177122
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-712a3ee12e2so1313737b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 09:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750177122; x=1750781922;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wXps2dFsPhp2x6VpAS0GfTpkzBEcIJJmsj5MxE/H/Ic=;
 b=F17JKd0nHvDfW9ruo28imYcjiz49GCaITdhHBQMDG/m+jUNG72bobYWDAh5Xsmta2B
 HDRuVJVZO7aL0gYGiBdbjqIxq0U1piVlir9PkAlbyGluPk0ORQsMi7BPjnGx5P5I97zQ
 Y4Fx6jYIJwDgZh4Zsgm0U+8z6XC7G6ptBkEKLejhRmt3kTNbSqJQMT+rL/cvmR+ETuUQ
 doesSF/aYPnpfRY8RWgP/YuTZ023fJDY5r6AUX4fTqALHTziCRnVRgQXPhDGx2KbAEY+
 9aS/cHdnbl1F2J41+7Wt2liyXDUVBtHJWx2yS9V1DhPYa+YamySByVuhV1GMPTl1Ljzr
 y0mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp9ObS2I3zS9J+JbkB80aWcFdP7g4z3X9LWihh/SVb/gi0qLASCRCFjkOgXmdas4niDruqn7T6KSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqVSH1eBDs5jwAUmKO5nrT3XJ2DROHspJKhkhf4rgNhL9iiEuU
 v7++BR72YsjZ+We9wJPoGZnP7oka557PuarTWTzUc9m0RdyglDbwFW15cCEqmiL+VqeHsXnJp3s
 FLBlgLjDlL7t34CgMKHVzx94lIKJItFte8zaX3Ajh7jGgRU+8CGKmkmrpOSuo51TiIFf9eImAFx
 45LEbUCDKxLtd+xH/eJRiqTWZkFGy1Mamd68SkRQsTyDGIeD5lGTnY47c=
X-Gm-Gg: ASbGnctrgfNNGqqsSizH8BxBaNg+ZsdhTHgZ3z0+579tcyMPN2JJ62LsMvzT/OWLdR9
 /9fcJT05jtLp3mxO65c7SiEdJnt5k0jlrnL+z8HsgrfOhIsk6S1g1GIimLs2n4NyhsUoxHmnbFN
 YP9Q==
X-Received: by 2002:a05:690c:4c12:b0:70f:8830:809c with SMTP id
 00721157ae682-7117490c319mr214656817b3.12.1750177121624; 
 Tue, 17 Jun 2025 09:18:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESe3H+RV+0FS60GU9OgvHyxl6rG3IxdgT1Xd8h/BCQacNjZgCNhSY3dyHj1SaZ7PJdw23Shr+dyFrORw04Vas=
X-Received: by 2002:a05:690c:4c12:b0:70f:8830:809c with SMTP id
 00721157ae682-7117490c319mr214656357b3.12.1750177121220; Tue, 17 Jun 2025
 09:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250612081834.GA248237@francesco-nb>
In-Reply-To: <20250612081834.GA248237@francesco-nb>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 17 Jun 2025 11:17:20 -0500
X-Gm-Features: AX0GCFsXC1PGCO9-jPPvZu32ehgVtXcSaN_GWimZYqtB3uU157F_7IGA08-2r_4
Message-ID: <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 321bINjVJMsiXf03n9rgl9Jw48K38MBdo2Zi41KP0ew_1750177122
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009ace300637c6dd33"
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

--0000000000009ace300637c6dd33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco Dolcini <francesco@dolcin=
i.it>
wrote:

> Hello all,
>
> Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in
> place of devm_kzalloc()")
> from 6.16-rc1 introduced a regression with this warning during probe
> with panel dpi described in the DT.
>
> A revert solves the issue.
>
> The issue is that connector_type is set to DRM_MODE_CONNECTOR_DPI in
> panel_dpi_probe() that after that change is called after
> devm_drm_panel_alloc().
>
> I am not sure if there are other implication for this change in the call
> ordering, apart the one that triggers this warning.
>
> [   12.089274] ------------[ cut here ]------------
> [   12.089303] WARNING: CPU: 0 PID: 96 at
> drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0xb8
> [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa
> gpu_sched panel_simple imx6_media(C) imx_media_common
> (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6 autofs4
> [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: G
>  C          6.16.0-rc1+ #1 PREEMPT
> [   12.157446] Tainted: [C]=3DCRAP
> [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   12.166953] Workqueue: events_unbound deferred_probe_work_func
> [   12.172805] Call trace:
> [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> [   12.195567]  warn_slowpath_fmt from devm_drm_of_get_bridge+0xac/0xb8
> [   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x164
> [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> [   12.218551]  really_probe from __driver_probe_device+0x8c/0x1d4
> [   12.224486]  __driver_probe_device from driver_probe_device+0x30/0xc0
> [   12.230942]  driver_probe_device from __device_attach_driver+0x98/0x10=
c
> [   12.237572]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
> [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
> [   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
> [   12.255285]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
> [   12.261739]  deferred_probe_work_func from process_one_work+0x154/0x2d=
c
> [   12.268371]  process_one_work from worker_thread+0x250/0x3f0
> [   12.274043]  worker_thread from kthread+0x12c/0x24c
> [   12.278940]  kthread from ret_from_fork+0x14/0x28
> [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> [   12.288720] 9fa0:                                     00000000 0000000=
0
> 00000000 00000000
> [   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000 0000000=
0
> 00000000 00000000
> [   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013 0000000=
0
> [   12.312050] ---[ end trace 0000000000000000 ]---
>
> #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057
>
> Any advise?
>
> Hey Francesco!

This mail reached my spam and I hadn't realised till today. Thanks for
bringing this to attention.

Thinking out loud here: If we called dpi_probe() before allocating the
panel using devm_drm_panel_alloc()
then we would have the connector type. But  dpi_probe() needs the panel to
be allocated....

We could actually hardcode the connector type to DRM_MODE_CONNECTOR_DPI....
Looking at panel_dpi_probe(), it guesses the connector_type:

/* We do not know the connector for the DT node, so guess it
*/=09desc->connector_type
<https://elixir.bootlin.com/linux/v6.16-rc2/C/ident/connector_type> =3D
DRM_MODE_CONNECTOR_DPI
<https://elixir.bootlin.com/linux/v6.16-rc2/C/ident/DRM_MODE_CONNECTOR_DPI>=
;


Reverting will improve the end user experience but if the fix can be quick,
we can
avoid dropping the change

Thanks,
Anusha


> Francesco
>
>

--0000000000009ace300637c6dd33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 12,=
 2025 at 3:24=E2=80=AFAM Francesco Dolcini &lt;<a href=3D"mailto:francesco@=
dolcini.it">francesco@dolcini.it</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello all,<br>
<br>
Commit de04bb0089a9 (&quot;drm/panel/panel-simple: Use the new allocation i=
n place of devm_kzalloc()&quot;)<br>
from 6.16-rc1 introduced a regression with this warning during probe<br>
with panel dpi described in the DT.<br>
<br>
A revert solves the issue.<br>
<br>
The issue is that connector_type is set to DRM_MODE_CONNECTOR_DPI in<br>
panel_dpi_probe() that after that change is called after<br>
devm_drm_panel_alloc().<br>
<br>
I am not sure if there are other implication for this change in the call<br=
>
ordering, apart the one that triggers this warning.<br>
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
[=C2=A0 =C2=A012.089274] ------------[ cut here ]------------<br>
[=C2=A0 =C2=A012.089303] WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/bridge/=
panel.c:377 devm_drm_of_get_bridge+0xac/0xb8<br>
[=C2=A0 =C2=A012.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa=
 gpu_sched panel_simple imx6_media(C) imx_media_common<br>
(C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6 autofs4<br=
>
[=C2=A0 =C2=A012.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: =
G=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.16=
.0-rc1+ #1 PREEMPT<br>
[=C2=A0 =C2=A012.157446] Tainted: [C]=3DCRAP<br>
[=C2=A0 =C2=A012.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Devi=
ce Tree)<br>
[=C2=A0 =C2=A012.166953] Workqueue: events_unbound deferred_probe_work_func=
<br>
[=C2=A0 =C2=A012.172805] Call trace:<br>
[=C2=A0 =C2=A012.172815]=C2=A0 unwind_backtrace from show_stack+0x10/0x14<b=
r>
[=C2=A0 =C2=A012.180598]=C2=A0 show_stack from dump_stack_lvl+0x68/0x74<br>
[=C2=A0 =C2=A012.185674]=C2=A0 dump_stack_lvl from __warn+0x7c/0xe0<br>
[=C2=A0 =C2=A012.190407]=C2=A0 __warn from warn_slowpath_fmt+0x1b8/0x1c0<br=
>
[=C2=A0 =C2=A012.195567]=C2=A0 warn_slowpath_fmt from devm_drm_of_get_bridg=
e+0xac/0xb8<br>
[=C2=A0 =C2=A012.201949]=C2=A0 devm_drm_of_get_bridge from imx_pd_probe+0x5=
8/0x164<br>
[=C2=A0 =C2=A012.207976]=C2=A0 imx_pd_probe from platform_probe+0x5c/0xb0<b=
r>
[=C2=A0 =C2=A012.213220]=C2=A0 platform_probe from really_probe+0xd0/0x3a4<=
br>
[=C2=A0 =C2=A012.218551]=C2=A0 really_probe from __driver_probe_device+0x8c=
/0x1d4<br>
[=C2=A0 =C2=A012.224486]=C2=A0 __driver_probe_device from driver_probe_devi=
ce+0x30/0xc0<br>
[=C2=A0 =C2=A012.230942]=C2=A0 driver_probe_device from __device_attach_dri=
ver+0x98/0x10c<br>
[=C2=A0 =C2=A012.237572]=C2=A0 __device_attach_driver from bus_for_each_drv=
+0x90/0xe4<br>
[=C2=A0 =C2=A012.243854]=C2=A0 bus_for_each_drv from __device_attach+0xa8/0=
x1c8<br>
[=C2=A0 =C2=A012.249614]=C2=A0 __device_attach from bus_probe_device+0x88/0=
x8c<br>
[=C2=A0 =C2=A012.255285]=C2=A0 bus_probe_device from deferred_probe_work_fu=
nc+0x8c/0xcc<br>
[=C2=A0 =C2=A012.261739]=C2=A0 deferred_probe_work_func from process_one_wo=
rk+0x154/0x2dc<br>
[=C2=A0 =C2=A012.268371]=C2=A0 process_one_work from worker_thread+0x250/0x=
3f0<br>
[=C2=A0 =C2=A012.274043]=C2=A0 worker_thread from kthread+0x12c/0x24c<br>
[=C2=A0 =C2=A012.278940]=C2=A0 kthread from ret_from_fork+0x14/0x28<br>
[=C2=A0 =C2=A012.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)<br>
[=C2=A0 =C2=A012.288720] 9fa0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A000000000 00000000 00000000 00000000<br>
[=C2=A0 =C2=A012.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000=
 00000000 00000000 00000000<br>
[=C2=A0 =C2=A012.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013=
 00000000<br>
[=C2=A0 =C2=A012.312050] ---[ end trace 0000000000000000 ]---<br>
<br>
#regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057<br>
<br>
Any advise?<br>
<br></blockquote><div>Hey Francesco!</div><div>=C2=A0<br></div><div><div>Th=
is mail reached my spam and I hadn&#39;t realised till today. Thanks for br=
inging this to attention.</div><div><br></div><div>Thinking out loud here: =
If we called dpi_probe() before allocating the panel using devm_drm_panel_a=
lloc()</div><div>then we would have the connector type. But=C2=A0 dpi_probe=
() needs the panel to be allocated....</div><div><br></div><div>We could ac=
tually hardcode the connector type to DRM_MODE_CONNECTOR_DPI....</div><div>=
Looking at panel_dpi_probe(), it guesses the connector_type:</div><div><pre=
><span id=3D"gmail-codeline-473"><span class=3D"gmail-w"></span><span class=
=3D"gmail-cm">/* We do not know the connector for the DT node, so guess it =
*/</span>
</span><span id=3D"gmail-codeline-474"><span class=3D"gmail-w">=09</span><s=
pan class=3D"gmail-n">desc</span><span class=3D"gmail-o">-&gt;</span><span =
class=3D"gmail-n"><a class=3D"gmail-ident" href=3D"https://elixir.bootlin.c=
om/linux/v6.16-rc2/C/ident/connector_type">connector_type</a></span><span c=
lass=3D"gmail-w"> </span><span class=3D"gmail-o">=3D</span><span class=3D"g=
mail-w"> </span><span class=3D"gmail-n"><a class=3D"gmail-ident" href=3D"ht=
tps://elixir.bootlin.com/linux/v6.16-rc2/C/ident/DRM_MODE_CONNECTOR_DPI">DR=
M_MODE_CONNECTOR_DPI</a></span><span class=3D"gmail-p">;</span></span></pre=
></div><div><br></div><div>Reverting will improve the end user experience b=
ut if the fix can be quick, we can</div><div>avoid dropping the change</div=
><div><br></div><div>Thanks,</div><div>Anusha</div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Francesco<br>
<br>
</blockquote></div></div>

--0000000000009ace300637c6dd33--

