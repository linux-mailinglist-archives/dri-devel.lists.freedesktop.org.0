Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB82987293
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 13:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37510E2E5;
	Thu, 26 Sep 2024 11:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C48F10E2E5
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 11:14:32 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1stmRt-00051o-Lh; Thu, 26 Sep 2024 13:14:17 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1stmRs-001fjT-Te; Thu, 26 Sep 2024 13:14:16 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1stmRs-0005As-2h;
 Thu, 26 Sep 2024 13:14:16 +0200
Message-ID: <c09a325a5166cf31b9a7fd09ed8266a2b19afcd2.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Thu, 26 Sep 2024 13:14:16 +0200
In-Reply-To: <a7b7acff-e710-4c50-97b8-1bce557eadde@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
 <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
 <f894eb3fd132a214ddbf2fa3ed405d065e629398.camel@pengutronix.de>
 <a7b7acff-e710-4c50-97b8-1bce557eadde@denx.de>
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

Hi,

On Mi, 2024-09-25 at 22:14 +0200, Marek Vasut wrote:
> The userspace could distribute the frames between the two devices in an=
=20
> alternating manner, can it not ?

This doesn't help with latency, or when converting a single large
frame.

For the deinterlacer, this can't be done with the motion-aware
temporally filtering modes. Those need a field from the previous frame.

>=20
> Would the 1280x360 field be split into two tiles vertically and each=20
> tile (newly 1280/2 x 360) be enqueued on each VDIC ? I don't think that=
=20
> works, because you wouldn't be able to stitch those tiles back together=
=20
> nicely after the deinterlacing, would you? I would expect to see some=20
> sort of an artifact exactly where the two tiles got stitched back=20
> together, because the VDICs are unaware of each other and how each=20
> deinterlaced the tile.

I was thinking horizontally, two 640x720 tiles side by side. 1280 is
larger than the 968 pixel maximum horizontal resolution of the VDIC.

As you say, splitting vertically (which would be required for 1080i)
should cause artifacts at the seam due to the 4-tap vertical filter.

[...]
> >=20
> > With the rigid V4L2 model though, where memory handling, parameter
> > calculation, and job scheduling of tiles in a single frame all have to
> > be hidden behind the V4L2 API, I don't think requiring userspace to
> > combine multiple mem2mem video devices to work together on a single
> > frame is feasible.
>=20
> If your concern is throughput (from what I gathered from the text=20
> above), userspace could schedule frames on either VDIC in alternating=20
> manner.

Both throughput and latency.

Yes, alternating to different devices would help with throughput where
possible, but it's worse for frame pacing, a hassle to implement
generically in userspace, and it's straight up impossible with temporal
filtering.

> I think this is much better and actually generic approach than trying to=
=20
> combine two independent devices on kernel level and introduce some sort=
=20
> of scheduler into kernel driver to distribute jobs between the two=20
> devices. Generic, because this approach works even if either of the two=
=20
> devices is not VDIC. Independent devices, because yes, the MX6Q IPUs are=
=20
> two independent blocks, it is only the current design of the IPUv3=20
> driver that makes them look kind-of like they are one single big device,=
=20
> I am not happy about that design, but rewriting the IPUv3 driver is way=
=20
> out of scope here. (*)

The IPUs are glued together at the capture and output paths, so yes,
they are independent blocks, but also work together as a big device.

> > Is limiting different users to the different deinterlacer hardware
> > units a real usecase? I saw the two ICs, when used as mem2mem devices,
> > as interchangeable resources.
>=20
> I do not have that use case, but I can imagine it could come up.
> In my case, I schedule different cameras to different VDICs from=20
> userspace as needed.

Is this just because a single VDIC does not have enough throughput to
serve all cameras, or is there some reason for a fixed assignment
between cameras and VDICs?

> > > > To be fair, we never implemented that for the CSC/scaler mem2mem de=
vice
> > > > either.
> > >=20
> > > I don't think that is actually a good idea. Instead, it would be bett=
er
> > > to have two scaler nodes in userspace.
> >=20
> > See above, that would make it impossible (or rather unreasonably
> > complicated) to distribute work on a single frame to both IPUs.
>=20
> Is your concern latency instead of throughput ? See my comment in=20
> paragraph (*) .

Either, depending on the use case.

[...]
> > > >=20
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/staging/media/imx/imx-media-vdic.c#n207
> >=20
> > That code is unused. The direct hardware path doesn't use
> > IPUV3_CHANNEL_MEM_VDI_PREV/CUR/NEXT, but is has a similar effect, half
> > of the incoming fields are dropped. The setup is vdic_setup_direct().
>=20
> All right, let's drop that unused code then, I'll prepare a patch.

Thanks!

> But it seems the bottom line is, the VDI direct mode does not act as a=
=20
> frame-rate doubler ?

Yes, it can't. In direct mode, VDIC only receives half of the fields.

[...]
> > >=20
> Why would adding the (configurable) frame-rate doubling mode break=20
> userspace if this is not the default ?

I'm not sure it would. Maybe there should be a deinterlacer control to
choose between full and half field rate output (aka frame doubling and
1:1 input to output frame rate).

Also, my initial assumption was that currently there is 1:1 input
frames to output frames. But with temporal filtering enabled there's
already one input frame (the first one) that doesn't produce any
output.

> > > > If we don't start with that supported, I fear userspace will make
> > > > assumptions and be surprised when a full rate mode is added later.
> > >=20
> > > I'm afraid that since the current VDI already does retain input frame
> > > rate instead of doubling it, the userspace already makes an assumptio=
n,
> > > so that ship has sailed.
> >=20
> > No, this is about the deinterlacer mem2mem device, which doesn't exist
> > before this series.
>=20
> I am not convinced it is OK if the direct VDI path and mem2mem VDI=20
> behave differently, that would be surprising to me as a user ?

Is this still about the frame rate doubling? Surely supporting it in
the mem2mem device and not in the capture path is ok. I'm not arguing
that frame doubling should be enabled by default.

> > The CSI capture path already has configurable framedrops (in the CSI).
>=20
> What am I looking for ? git grep doesn't give me any hits ? (**)

That's configured by the set_frame_interval pad op of the CSI subdevice
- on the IDMAC output pad. See csi_find_best_skip().

> > > But I think we can make the frame doubling configurable ?
> >=20
> > That would be good. Specifically, there must be no guarantee that one
> > input frame with two fields only produces one deinterlaced output
> > frame, and userspace should somehow be able to understand this.
>=20
> See my question (**) , where is this configurable framedrops thing ?

This would have to be done differently, though. Here we don't have
subdev set_frame_interval configuration, and while VIDIOC_S_PARM /
v4l2_captureparm were used to configure frame dropping on capture
devices, that's not really applicable to mem2mem deinterlacers.

> > I'd rather not default to the setting that throws away half of the
> > input data. Not using frame doubling by default is sensible, but now
> > that using all three input fields to calculate the output frame is
> > possible, why not make that the default.
>
> To save memory bandwidth on the MX6, that's my main concern.

What userspace are you using to exercise this driver? Maybe we can back
this concern with a few numbers (or mine with pictures).

regards
Philipp
