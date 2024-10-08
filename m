Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E19995170
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 16:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A95810E556;
	Tue,  8 Oct 2024 14:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2520610E556
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 14:23:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1syB7N-0007J1-6W; Tue, 08 Oct 2024 16:23:17 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1syB7M-000Nu1-Fu; Tue, 08 Oct 2024 16:23:16 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1syB7M-000Bnr-1K;
 Tue, 08 Oct 2024 16:23:16 +0200
Message-ID: <05c5b863f98bb61f67e79e83e05ca341285db205.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
 linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Tue, 08 Oct 2024 16:23:16 +0200
In-Reply-To: <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
 <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
 <0da39b8f-4cca-438f-9a39-40da7c34c895@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Do, 2024-10-03 at 16:57 +0200, Marek Vasut wrote:
> On 9/26/24 1:16 PM, Philipp Zabel wrote:
> > On Mi, 2024-09-25 at 22:45 +0200, Marek Vasut wrote:
> > [...]
> > > > The driver is not taking ownership of prev_buf, only curr_buf is gu=
aranteed to
> > > > exist until v4l2_m2m_job_finish() is called. Usespace could streamo=
ff, allocate
> > > > new buffers, and then an old freed buffer may endup being used.
> > >=20
> > > So, what should I do about this ? Is there some way to ref the buffer=
 to
> > > keep it around ?
> >=20
> > Have a look how other deinterlacers with temporal filtering do it.
> > sunxi/sun8i-di or ti/vpe look like candidates.
> I don't see exactly what those drivers are doing differently to protect=
=20
> the prev buffer during deinterlacing . Can you be more specific ?

In the EOF interrupt you are calling v4l2_m2m_buf_done() on src_buf,
which should be the same as ctx->curr_buf in the previous device_run.
Instead, you could release ctx->prev_buf and then store src_buf into
ctx->prev_buf. Storing curr_buf on the ctx doesn't seem to be necessary
at all. The mentioned deinterlacer drivers do something similar [1][2].

[1] https://elixir.bootlin.com/linux/master/source/drivers/media/platform/s=
unxi/sun8i-di/sun8i-di.c#L236
[2] https://elixir.bootlin.com/linux/master/source/drivers/media/platform/t=
i/vpe/vpe.c#L1481

regards
Philipp
