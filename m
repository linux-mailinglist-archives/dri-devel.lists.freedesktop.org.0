Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B110CADF1B0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E1B10E030;
	Wed, 18 Jun 2025 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BPbGexgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C108710E030
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750261813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YJi2j8em4Bj4/9aMnxrzRIlXX/RxsR9egb3mtgpBbEo=;
 b=BPbGexgH1+QUKwOGHgQdfPtHTE9oDh0P0mfXU3C9omLUfRV4qtiOVpL1VaWmRROo+ePlnB
 HX0qabgd05KZWGxhXjawwLS+1l8vneyWZXeBR7OUQqNcYXzrvnAYNw4q61gRq/2hOheOU0
 2rmwHP48vnres1ZRqv7g4i6nsJmzBOc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-ILYZrxcSO8y7OtURT7VGLw-1; Wed, 18 Jun 2025 11:50:10 -0400
X-MC-Unique: ILYZrxcSO8y7OtURT7VGLw-1
X-Mimecast-MFC-AGG-ID: ILYZrxcSO8y7OtURT7VGLw_1750261810
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-710e75f9229so101887387b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750261810; x=1750866610;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YJi2j8em4Bj4/9aMnxrzRIlXX/RxsR9egb3mtgpBbEo=;
 b=fn5hpGI+y17p6QUIJ1sRm9vJUyGLUbyd10AAn9xEyDqVUrr5sir5U4wChNi5d4xVi+
 7QCWwyMqxjb0ORICrw4SAyYc6MKOT0/c4BTGm01WG1HpcJ32trzvu3j2Pin4vLwGW23P
 ZKTPKFbpeMFaM/GAJehzW0Q5SHnC/hVsgv/S0W33ZXOZSVr+FmFPup3sfdpCCGYKZ3W2
 2pRRZIeUW1p2rSF4mzCoF4lnnxIS3uMZVtnRCxYjwVhph1IuxHylf30Ep+hHBYJUqanE
 1WaZlyZf5xDLIaf9SpIiVXVe+oeWs6Rzl44rV6ifFuCJhQNd+klOzN+eooOkk8NfCasy
 JSRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9cBg5WXT4YFP08RwnlyAK16V8pLOFvnmP7JJibusAJU251i9XGis8e8DmyZ5Ya1zEuG7aZ8mHucI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhAri+z1OjzSyDPVhK8TdUjooppNW7mqGt2gVAFMfLtfvBJSix
 VtI7RDnx8atPiJWDnXI4XJkUWCFKQvqnMdAR9FlBW7LbSlG1rvqkX7Zg8rBjZ09hCS/dCAnA9rN
 7tLhd6Mv63b1SM+zk/0omrWgQud48skXjE1ZoijpDyIJE3w5hEcVOMI69heb9MZ2b8zktmflpWW
 mcCPTICbQTtQKSqzgPnZp0IYI23yAi+IGLaqvq/go8GUeC
X-Gm-Gg: ASbGncvRbFqTR4EoOZWJBLBKwrDETVRWwQjx1dwunMRBQ2IMi0BZFOwlzeKE+D9OxyK
 O4gTyhynJ6GtE0mbck/utAZCZ14YQjxrNdRb1WGQyMnh7Rd5MAHOXaKN3JHDVFzgYuJCqGnxMwm
 evYQ==
X-Received: by 2002:a05:690c:39a:b0:70f:6ebb:b29a with SMTP id
 00721157ae682-71175500379mr233560677b3.29.1750261809813; 
 Wed, 18 Jun 2025 08:50:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETnqNXuFE57iJUR7K3hG5NpVHvJaH9dITjByGvLtcThio+bbw3aGS8tTuksB0/mexPSzKstcr/oCOE/xzM+O0=
X-Received: by 2002:a05:690c:39a:b0:70f:6ebb:b29a with SMTP id
 00721157ae682-71175500379mr233560127b3.29.1750261809312; Wed, 18 Jun 2025
 08:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250612081834.GA248237@francesco-nb>
 <CAN9Xe3RFEXZuWTZB5E1tJdjXc9o_hB1ArgA5SvqbDUBkwYea8w@mail.gmail.com>
 <20250618105158.06e42668@booty>
 <20250618-fantastic-brown-elephant-df0ae4@houat>
In-Reply-To: <20250618-fantastic-brown-elephant-df0ae4@houat>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 18 Jun 2025 10:48:49 -0500
X-Gm-Features: AX0GCFuGeGz0RRtlyf0OrjRiBLLWGBTVsnjYOUUvk4eVVSEJ8bpOr9bs_oi9F3U
Message-ID: <CAN9Xe3RpkBx8k+=VqDFh1n+-35gHM_L3UQvCJH58bBPF6pPuuA@mail.gmail.com>
Subject: Re: drm/panel/panel-simple v6.16-rc1 WARNING regression
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zi9n0-TadfCR78lvW-UtVi3NQduMC9VQkEmo2x-5I58_1750261810
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006889e10637da9594"
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

--0000000000006889e10637da9594
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 4:23=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:

> On Wed, Jun 18, 2025 at 10:51:58AM +0200, Luca Ceresoli wrote:
> > Hello Anusha, Francesco,
> >
> > On Tue, 17 Jun 2025 11:17:20 -0500
> > Anusha Srivatsa <asrivats@redhat.com> wrote:
> >
> > > On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco Dolcini <
> francesco@dolcini.it>
> > > wrote:
> > >
> > > > Hello all,
> > > >
> > > > Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocatio=
n
> in
> > > > place of devm_kzalloc()")
> > > > from 6.16-rc1 introduced a regression with this warning during prob=
e
> > > > with panel dpi described in the DT.
> > > >
> > > > A revert solves the issue.
> > > >
> > > > The issue is that connector_type is set to DRM_MODE_CONNECTOR_DPI i=
n
> > > > panel_dpi_probe() that after that change is called after
> > > > devm_drm_panel_alloc().
> > > >
> > > > I am not sure if there are other implication for this change in the
> call
> > > > ordering, apart the one that triggers this warning.
> > > >
> > > > [   12.089274] ------------[ cut here ]------------
> > > > [   12.089303] WARNING: CPU: 0 PID: 96 at
> > > > drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0xb8
> > > > [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa
> > > > gpu_sched panel_simple imx6_media(C) imx_media_common
> > > > (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6
> autofs4
> > > > [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: G
> > > >  C          6.16.0-rc1+ #1 PREEMPT
> > > > [   12.157446] Tainted: [C]=3DCRAP
> > > > [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Device
> Tree)
> > > > [   12.166953] Workqueue: events_unbound deferred_probe_work_func
> > > > [   12.172805] Call trace:
> > > > [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> > > > [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> > > > [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> > > > [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> > > > [   12.195567]  warn_slowpath_fmt from
> devm_drm_of_get_bridge+0xac/0xb8
> > > > [   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x164
> > > > [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> > > > [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> > > > [   12.218551]  really_probe from __driver_probe_device+0x8c/0x1d4
> > > > [   12.224486]  __driver_probe_device from
> driver_probe_device+0x30/0xc0
> > > > [   12.230942]  driver_probe_device from
> __device_attach_driver+0x98/0x10c
> > > > [   12.237572]  __device_attach_driver from
> bus_for_each_drv+0x90/0xe4
> > > > [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
> > > > [   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
> > > > [   12.255285]  bus_probe_device from
> deferred_probe_work_func+0x8c/0xcc
> > > > [   12.261739]  deferred_probe_work_func from
> process_one_work+0x154/0x2dc
> > > > [   12.268371]  process_one_work from worker_thread+0x250/0x3f0
> > > > [   12.274043]  worker_thread from kthread+0x12c/0x24c
> > > > [   12.278940]  kthread from ret_from_fork+0x14/0x28
> > > > [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> > > > [   12.288720] 9fa0:                                     00000000
> 00000000
> > > > 00000000 00000000
> > > > [   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000
> 00000000
> > > > 00000000 00000000
> > > > [   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013
> 00000000
> > > > [   12.312050] ---[ end trace 0000000000000000 ]---
> > > >
> > > > #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe3057
> > > >
> > > > Any advise?
> > > >
> > > > Hey Francesco!
> > >
> > > This mail reached my spam and I hadn't realised till today. Thanks fo=
r
> > > bringing this to attention.
> > >
> > > Thinking out loud here: If we called dpi_probe() before allocating th=
e
> > > panel using devm_drm_panel_alloc()
> > > then we would have the connector type. But  dpi_probe() needs the
> panel to
> > > be allocated....
> >
> > Reading the panel-simple.c code, the handling of the panel_dsi
> > descriptor feels a bit hacky, and the recent change to
> > devm_drm_panel_alloc() breaks it easily. Perhaps it would be cleaner to
> > assess the whole descriptor before ding any allocation/init.
> >
> > You're right tat panel_dpi_probe() needs the panel, but it's only at th=
e
> > very end, to assign the descriptor:
> >
> >   panel->desc =3D desc;
> >
> > I think a good fix would be to clean it up by having:
> >
> >  * panel_dpi_probe() not take a panel pointer but rather returning a
> >    filled descriptor
> >  * panel_simple_probe() call panel_dpi_probe() early [before
> >    devm_drm_panel_alloc()] and get the filled descriptor
> >  * call devm_drm_panel_alloc() with that descriptor in the panel-dsi
> >    case, or with the good old descriptor otherwise
> >
> > As a good side effect, it would get rid of a case where
> > devm_drm_panel_alloc() is called with a Unknown connector type.
> >
> > Anusha, does it look like a good plan?
>
> It is, and I'd even go one step further. Like you said, panel_dpi_probe
> kind of exists to allocate and initialize the panel descriptor, and is
> called on the descriptor being equal to the (uninitialized) panel_dpi
> global variable.
>
> We should also get rid of that hack, so do something like creating a
> function that returns the descriptor, and is indeed called first in
> panel_simple_probe. It first calls of_device_get_match_data(), and if
> there's no match, and if the device is compatible with panel-dpi, then
> it calls panel_dpi_probe (we should probably change that name too). That
> way, we can get rid of the panel_dpi variable entirely.
>
>
Thanks Luca and Maxime.
To summarize:
1. add a function like of_device_get_simple_dsi_match_data() which calls
of_device_get_match_data(). if the device is compatible with panel-dpi,
call
panel-dpi-probe()
3. Change panel_dpi_probe() to return the panel descriptor
4. call devm_drm_panel_alloc()

Thanks,
Anusha

> Maxime
>

--0000000000006889e10637da9594
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 18,=
 2025 at 4:23=E2=80=AFAM Maxime Ripard &lt;<a href=3D"mailto:mripard@kernel=
.org">mripard@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Wed, Jun 18, 2025 at 10:51:58AM +0200, Luca Cere=
soli wrote:<br>
&gt; Hello Anusha, Francesco,<br>
&gt; <br>
&gt; On Tue, 17 Jun 2025 11:17:20 -0500<br>
&gt; Anusha Srivatsa &lt;<a href=3D"mailto:asrivats@redhat.com" target=3D"_=
blank">asrivats@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Jun 12, 2025 at 3:24=E2=80=AFAM Francesco Dolcini &lt;<a =
href=3D"mailto:francesco@dolcini.it" target=3D"_blank">francesco@dolcini.it=
</a>&gt;<br>
&gt; &gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; &gt; Hello all,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Commit de04bb0089a9 (&quot;drm/panel/panel-simple: Use the n=
ew allocation in<br>
&gt; &gt; &gt; place of devm_kzalloc()&quot;)<br>
&gt; &gt; &gt; from 6.16-rc1 introduced a regression with this warning duri=
ng probe<br>
&gt; &gt; &gt; with panel dpi described in the DT.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; A revert solves the issue.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; The issue is that connector_type is set to DRM_MODE_CONNECTO=
R_DPI in<br>
&gt; &gt; &gt; panel_dpi_probe() that after that change is called after<br>
&gt; &gt; &gt; devm_drm_panel_alloc().<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I am not sure if there are other implication for this change=
 in the call<br>
&gt; &gt; &gt; ordering, apart the one that triggers this warning.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.089274] ------------[ cut here ]-----------=
-<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.089303] WARNING: CPU: 0 PID: 96 at<br>
&gt; &gt; &gt; drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0x=
ac/0xb8<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.130808] Modules linked in: v4l2_jpeg pwm_im=
x27(+) imx_vdoa<br>
&gt; &gt; &gt; gpu_sched panel_simple imx6_media(C) imx_media_common<br>
&gt; &gt; &gt; (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse =
ipv6 autofs4<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker=
/u8:3 Tainted: G<br>
&gt; &gt; &gt;=C2=A0 C=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 6.16.0-rc1+ #1 PRE=
EMPT<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.157446] Tainted: [C]=3DCRAP<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.160418] Hardware name: Freescale i.MX6 Quad=
/DualLite (Device Tree)<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.166953] Workqueue: events_unbound deferred_=
probe_work_func<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.172805] Call trace:<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.172815]=C2=A0 unwind_backtrace from show_st=
ack+0x10/0x14<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.180598]=C2=A0 show_stack from dump_stack_lv=
l+0x68/0x74<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.185674]=C2=A0 dump_stack_lvl from __warn+0x=
7c/0xe0<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.190407]=C2=A0 __warn from warn_slowpath_fmt=
+0x1b8/0x1c0<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.195567]=C2=A0 warn_slowpath_fmt from devm_d=
rm_of_get_bridge+0xac/0xb8<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.201949]=C2=A0 devm_drm_of_get_bridge from i=
mx_pd_probe+0x58/0x164<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.207976]=C2=A0 imx_pd_probe from platform_pr=
obe+0x5c/0xb0<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.213220]=C2=A0 platform_probe from really_pr=
obe+0xd0/0x3a4<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.218551]=C2=A0 really_probe from __driver_pr=
obe_device+0x8c/0x1d4<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.224486]=C2=A0 __driver_probe_device from dr=
iver_probe_device+0x30/0xc0<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.230942]=C2=A0 driver_probe_device from __de=
vice_attach_driver+0x98/0x10c<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.237572]=C2=A0 __device_attach_driver from b=
us_for_each_drv+0x90/0xe4<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.243854]=C2=A0 bus_for_each_drv from __devic=
e_attach+0xa8/0x1c8<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.249614]=C2=A0 __device_attach from bus_prob=
e_device+0x88/0x8c<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.255285]=C2=A0 bus_probe_device from deferre=
d_probe_work_func+0x8c/0xcc<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.261739]=C2=A0 deferred_probe_work_func from=
 process_one_work+0x154/0x2dc<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.268371]=C2=A0 process_one_work from worker_=
thread+0x250/0x3f0<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.274043]=C2=A0 worker_thread from kthread+0x=
12c/0x24c<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.278940]=C2=A0 kthread from ret_from_fork+0x=
14/0x28<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.283660] Exception stack(0xd0be9fb0 to 0xd0b=
e9ff8)<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.288720] 9fa0:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A000000000 00000000<br>
&gt; &gt; &gt; 00000000 00000000<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.296906] 9fc0: 00000000 00000000 00000000 00=
000000 00000000 00000000<br>
&gt; &gt; &gt; 00000000 00000000<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.305089] 9fe0: 00000000 00000000 00000000 00=
000000 00000013 00000000<br>
&gt; &gt; &gt; [=C2=A0 =C2=A012.312050] ---[ end trace 0000000000000000 ]--=
-<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; #regzbot ^introduced: de04bb0089a96cc00d13b12cbf66a088befe30=
57<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Any advise?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hey Francesco!=C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; This mail reached my spam and I hadn&#39;t realised till today. T=
hanks for<br>
&gt; &gt; bringing this to attention.<br>
&gt; &gt;<br>
&gt; &gt; Thinking out loud here: If we called dpi_probe() before allocatin=
g the<br>
&gt; &gt; panel using devm_drm_panel_alloc()<br>
&gt; &gt; then we would have the connector type. But=C2=A0 dpi_probe() need=
s the panel to<br>
&gt; &gt; be allocated....<br>
&gt; <br>
&gt; Reading the panel-simple.c code, the handling of the panel_dsi<br>
&gt; descriptor feels a bit hacky, and the recent change to<br>
&gt; devm_drm_panel_alloc() breaks it easily. Perhaps it would be cleaner t=
o<br>
&gt; assess the whole descriptor before ding any allocation/init.<br>
&gt; <br>
&gt; You&#39;re right tat panel_dpi_probe() needs the panel, but it&#39;s o=
nly at the<br>
&gt; very end, to assign the descriptor:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0panel-&gt;desc =3D desc;<br>
&gt; <br>
&gt; I think a good fix would be to clean it up by having:<br>
&gt; <br>
&gt;=C2=A0 * panel_dpi_probe() not take a panel pointer but rather returnin=
g a<br>
&gt;=C2=A0 =C2=A0 filled descriptor<br>
&gt;=C2=A0 * panel_simple_probe() call panel_dpi_probe() early [before<br>
&gt;=C2=A0 =C2=A0 devm_drm_panel_alloc()] and get the filled descriptor<br>
&gt;=C2=A0 * call devm_drm_panel_alloc() with that descriptor in the panel-=
dsi<br>
&gt;=C2=A0 =C2=A0 case, or with the good old descriptor otherwise<br>
&gt; <br>
&gt; As a good side effect, it would get rid of a case where<br>
&gt; devm_drm_panel_alloc() is called with a Unknown connector type.<br>
&gt; <br>
&gt; Anusha, does it look like a good plan?<br>
<br>
It is, and I&#39;d even go one step further. Like you said, panel_dpi_probe=
<br>
kind of exists to allocate and initialize the panel descriptor, and is<br>
called on the descriptor being equal to the (uninitialized) panel_dpi<br>
global variable.<br>
<br>
We should also get rid of that hack, so do something like creating a<br>
function that returns the descriptor, and is indeed called first in<br>
panel_simple_probe. It first calls of_device_get_match_data(), and if<br>
there&#39;s no match, and if the device is compatible with panel-dpi, then<=
br>
it calls panel_dpi_probe (we should probably change that name too). That<br=
>
way, we can get rid of the panel_dpi variable entirely.<br>
<br></blockquote><div><br></div><div>Thanks Luca and Maxime.</div><div>To s=
ummarize:</div><div>1. add a function like of_device_get_simple_dsi_match_d=
ata() which calls</div><div>of_device_get_match_data(). if the device is co=
mpatible with panel-dpi,=C2=A0 call</div><div>panel-dpi-probe() <br></div><=
div>3. Change panel_dpi_probe() to return the panel descriptor</div><div>4.=
 call devm_drm_panel_alloc() <br></div><div><br></div><div>Thanks,</div><di=
v>Anusha</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Maxime<br>
</blockquote></div></div>

--0000000000006889e10637da9594--

