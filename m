Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B193B1DC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4120310E6BD;
	Wed, 24 Jul 2024 13:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ftXvG2yP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6265F10E3CA
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 07:59:57 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-708cf5138b6so3163695a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2024 00:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721635196; x=1722239996; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UVLVoBrSBIABdH8HVi5V5EvdQRfT90TgTG6ticvnc8Q=;
 b=ftXvG2yPmhGJmsI7pzkf7zk58qcd7P1GFvLHSBjxGOsqtCQz6ZtumW+kHbS4X0Tb/F
 ioWbunm2WN5GLLH1Ws0eX5AsiHLiejPNaJPvlS5aENbKQzNwnAeS8ZN1j7AXxE7wYSIt
 6iEUu2YCz9NnZoX7zjxRK5bf69B6pa7qXIscjPAU2pOy4ufrLpETyL6gJ9zedKMToTgy
 56REUdrKb9RuiNLkm7jaJs8e5k3mjDB3sByl1HU0e14N7EbjXI/XxLntwG29tuPA9Ree
 VFGdA8Xf59gZaz1tDUuWVRWOHVlGIQkgCgUZx2aYB+17HTVVrzj7cQHkSK7aSL7ExoLK
 PCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721635196; x=1722239996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UVLVoBrSBIABdH8HVi5V5EvdQRfT90TgTG6ticvnc8Q=;
 b=rp+5Z1/52DRq95KIP6qxw8yy256TjeihcXZ+ETvMnDN1rz/RW18P/Ymiz4mLeq+tXv
 2/+lJuIeUXkAd1p8vRDY5IKielzIaAYmblZWXu/d/XZ0BiKIXELnswsUQVaF4Ai3BQT4
 esQdvWkR6sHlwt3WAMYk23jdq4uEP8KW91Qx0BclogFlMcet1pSeT/vlmhnSQhcPRr5t
 fR3MttyHYuTHeX1C9LCEb/4IUfwbHbYkt/FTbbeolAKb5Zs46UMCOIkmnlRa+pnra8+y
 4cTOhL9oAnpRw/t1zjcIrlP/Trea+bIQAGNSLCuVipTKss1GwlujgUxM/LQF1qlAKTpN
 SWew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzDRDu/vopmVSBlGu4IQcjQM6ZiVu2qWENy0SBQFSqwYCvDhBHV69vk/I+7/DkkApdHw4EDFr+J7pxU5zfWYRMkq6K5y9ELymXZyalTsQc
X-Gm-Message-State: AOJu0Yxv6ELixl3fTMwq5x3lvp/864WUW/o407QnSk7D+P7rTFj9WN2U
 TNDsJUQHR+EqQjH4jSiY/OletimfUgGr+r4lD7LCW5GxWBAMxQk0wpGDc3bp+hmYqmuk16V1H2Q
 1HDZ8EVtDeFCw18SRU4gclMGVm/o=
X-Google-Smtp-Source: AGHT+IFUVAP4yCPxQNkNXhJFNJxMnQsofIn15s5YDS4IN3h0ofNDy5sFWJzr5lQhswyLC0ffiBD77t00NaabnKZvsFI=
X-Received: by 2002:a05:6830:7302:b0:703:5db8:80a with SMTP id
 46e09a7af769-709009042e5mr8949781a34.8.1721635196448; Mon, 22 Jul 2024
 00:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240129104106.43141-1-raphael.gallais-pou@foss.st.com>
 <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
In-Reply-To: <21f4d43d-4abd-4aca-7abb-7321bcfa0f1d@foss.st.com>
From: Yanjun Yang <yangyj.ee@gmail.com>
Date: Mon, 22 Jul 2024 15:59:45 +0800
Message-ID: <CAE8JAfwMqiZxGPm4LK_22iWdCa=BS7SX3gbwhrCTOdx=K4yNzA@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH RESEND v3 0/3] Update STM DSI PHY driver
To: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000513b13061dd16e08"
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:48 +0000
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

--000000000000513b13061dd16e08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 8:47=E2=80=AFPM Philippe CORNU <philippe.cornu@foss=
.st.com>
wrote:

>
>
> On 1/29/24 11:41, Raphael Gallais-Pou wrote:
> >
> > This patch series aims to add several features of the dw-mipi-dsi phy
> > driver that are missing or need to be updated.
> >
> > First patch update a PM macro.
> >
> > Second patch adds runtime PM functionality to the driver.
> >
> > Third patch adds a clock provider generated by the PHY itself.  As
> > explained in the commit log of the second patch, a clock declaration is
> > missing.  Since this clock is parent of 'dsi_k', it leads to an orphan
> > clock.  Most importantly this patch is an anticipation for future
> > versions of the DSI PHY, and its inclusion within the display subsystem
> > and the DRM framework.
> >
> > Last patch fixes a corner effect introduced previously.  Since 'dsi' an=
d
> > 'dsi_k' are gated by the same bit on the same register, both reference
> > work as peripheral clock in the device-tree.
> >


This patch (commit id:185f99b614427360) seems to break the dsi of stm32f469
chip.
I'm not familiar with the drm and the clock framework, maybe it's because
there is no
 "ck_dsi_phy" defined for stm32f469.


>
> > ---
> > Changes in v3-resend:
> >       - Removed last patch as it has been merged
> >
> https://lore.kernel.org/lkml/bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st=
.com/
> >
> > Changes in v3:
> >       - Fix smatch warning (disable dsi->pclk when clk_register fails)
> >
> > Changes in v2:
> >       - Added patch 1/4 to use SYSTEM_SLEEP_PM_OPS instead of old macro
> >         and removed __maybe_used for accordingly
> >       - Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_OPS
> >
> > Raphael Gallais-Pou (3):
> >    drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro
> >    drm/stm: dsi: expose DSI PHY internal clock
> >
> > Yannick Fertre (1):
> >    drm/stm: dsi: add pm runtime ops
> >
> >   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 279 ++++++++++++++++++++++---=
-
> >   1 file changed, 238 insertions(+), 41 deletions(-)
> >
>
> Hi Rapha=C3=ABl & Yannick,
> Applied on drm-misc-next.
> Many thanks,
> Philippe :-)
> _______________________________________________
> Linux-stm32 mailing list
> Linux-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
>

--000000000000513b13061dd16e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 28, 2024 at 8:47=E2=
=80=AFPM Philippe CORNU &lt;<a href=3D"mailto:philippe.cornu@foss.st.com">p=
hilippe.cornu@foss.st.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex"><br>
<br>
On 1/29/24 11:41, Raphael Gallais-Pou wrote:<br>
&gt; <br>
&gt; This patch series aims to add several features of the dw-mipi-dsi phy<=
br>
&gt; driver that are missing or need to be updated.<br>
&gt; <br>
&gt; First patch update a PM macro.<br>
&gt; <br>
&gt; Second patch adds runtime PM functionality to the driver.<br>
&gt; <br>
&gt; Third patch adds a clock provider generated by the PHY itself.=C2=A0 A=
s<br>
&gt; explained in the commit log of the second patch, a clock declaration i=
s<br>
&gt; missing.=C2=A0 Since this clock is parent of &#39;dsi_k&#39;, it leads=
 to an orphan<br>
&gt; clock.=C2=A0 Most importantly this patch is an anticipation for future=
<br>
&gt; versions of the DSI PHY, and its inclusion within the display subsyste=
m<br>
&gt; and the DRM framework.<br>
&gt; <br>
&gt; Last patch fixes a corner effect introduced previously.=C2=A0 Since &#=
39;dsi&#39; and<br>
&gt; &#39;dsi_k&#39; are gated by the same bit on the same register, both r=
eference<br>
&gt; work as peripheral clock in the device-tree.<br>
&gt;</blockquote><div><br></div><div>This patch (commit id:185f99b614427360=
)=C2=A0seems to break the dsi of stm32f469 chip.=C2=A0</div><div>I&#39;m no=
t familiar with the drm and the clock framework, maybe it&#39;s because the=
re is no</div><div>=C2=A0&quot;ck_dsi_phy&quot; defined for stm32f469.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"> <br>
&gt; ---<br>
&gt; Changes in v3-resend:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Removed last patch as it has been merged<b=
r>
&gt; <a href=3D"https://lore.kernel.org/lkml/bf49f4c9-9e81-4c91-972d-13782d=
996aaa@foss.st.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/lkml/bf49f4c9-9e81-4c91-972d-13782d996aaa@foss.st.com/</a><br>
&gt; <br>
&gt; Changes in v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Fix smatch warning (disable dsi-&gt;pclk w=
hen clk_register fails)<br>
&gt; <br>
&gt; Changes in v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Added patch 1/4 to use SYSTEM_SLEEP_PM_OPS=
 instead of old macro<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and removed __maybe_used for accordin=
gly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Changed SET_RUNTIME_PM_OPS to RUNTIME_PM_O=
PS<br>
&gt; <br>
&gt; Raphael Gallais-Pou (3):<br>
&gt;=C2=A0 =C2=A0 drm/stm: dsi: use new SYSTEM_SLEEP_PM_OPS() macro<br>
&gt;=C2=A0 =C2=A0 drm/stm: dsi: expose DSI PHY internal clock<br>
&gt; <br>
&gt; Yannick Fertre (1):<br>
&gt;=C2=A0 =C2=A0 drm/stm: dsi: add pm runtime ops<br>
&gt; <br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 279 ++++++++++++++=
++++++++----<br>
&gt;=C2=A0 =C2=A01 file changed, 238 insertions(+), 41 deletions(-)<br>
&gt; <br>
<br>
Hi Rapha=C3=ABl &amp; Yannick,<br>
Applied on drm-misc-next.<br>
Many thanks,<br>
Philippe :-)<br>
_______________________________________________<br>
Linux-stm32 mailing list<br>
<a href=3D"mailto:Linux-stm32@st-md-mailman.stormreply.com" target=3D"_blan=
k">Linux-stm32@st-md-mailman.stormreply.com</a><br>
<a href=3D"https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm3=
2" rel=3D"noreferrer" target=3D"_blank">https://st-md-mailman.stormreply.co=
m/mailman/listinfo/linux-stm32</a><br>
</blockquote></div></div>

--000000000000513b13061dd16e08--
