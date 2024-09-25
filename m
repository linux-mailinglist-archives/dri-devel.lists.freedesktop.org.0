Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 636F6986218
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA9F10E83E;
	Wed, 25 Sep 2024 15:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C9510EA28
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 15:07:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1stTbx-0005WS-Gp; Wed, 25 Sep 2024 17:07:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1stTbw-001Tgc-Qq; Wed, 25 Sep 2024 17:07:24 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1stTbw-000MKv-2P;
 Wed, 25 Sep 2024 17:07:24 +0200
Message-ID: <f894eb3fd132a214ddbf2fa3ed405d065e629398.camel@pengutronix.de>
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
Date: Wed, 25 Sep 2024 17:07:24 +0200
In-Reply-To: <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
 <a66a2eaf30e21ff7c87f140e97ed4639640121ba.camel@pengutronix.de>
 <3e850259-9349-4215-947a-ce192fa95f14@denx.de>
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

On Di, 2024-09-24 at 17:28 +0200, Marek Vasut wrote:
> On 9/6/24 11:01 AM, Philipp Zabel wrote:
[...]
> > Instead of presenting two devices to userspace, it would be better to
> > have a single video device that can distribute work to both IPUs.
>=20
> Why do you think so ?

The scaler/colorspace converter supports frames larger than the
1024x1024 hardware by splitting each frame into multiple tiles. It
currently does so sequentially on a single IC. Speed could be improved
by distributing the tiles to both ICs. This is not an option anymore if
there are two video devices that are fixed to one IC each.

The same would be possible for the deinterlacer, e.g. to support 720i
frames split into two tiles each sent to one of the two VDICs.

> I think it is better to keep the kernel code as simple as possible, i.e.=
=20
> provide the device node for each m2m device to userspace and handle the=
=20
> m2m device hardware interaction in the kernel driver, but let userspace=
=20
> take care of policy like job scheduling, access permissions assignment=
=20
> to each device (e.g. if different user accounts should have access to=20
> different VDICs), or other such topics.

I both agree and disagree with you at the same time.

If the programming model were more similar to DRM, I'd agree in a
heartbeat. If the kernel driver just had to do memory/fence handling
and command submission (and parameter sanitization, because there is no
MMU), and there was some userspace API on top, it would make sense to
me to handle parameter calculation and job scheduling in a hardware
specific userspace driver that can just open one device for each IPU.

With the rigid V4L2 model though, where memory handling, parameter
calculation, and job scheduling of tiles in a single frame all have to
be hidden behind the V4L2 API, I don't think requiring userspace to
combine multiple mem2mem video devices to work together on a single
frame is feasible.

Is limiting different users to the different deinterlacer hardware
units a real usecase? I saw the two ICs, when used as mem2mem devices,
as interchangeable resources.

> > To be fair, we never implemented that for the CSC/scaler mem2mem device
> > either.
>=20
> I don't think that is actually a good idea. Instead, it would be better=
=20
> to have two scaler nodes in userspace.

See above, that would make it impossible (or rather unreasonably
complicated) to distribute work on a single frame to both IPUs.

[...]
> > > +	ipu_cpmem_set_buffer(priv->vdi_out_ch,  0, out_phys);
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys + phys_offset)=
;
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, curr_phys);
> > > +	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys + phys_offset)=
;
> >=20
> > This always outputs at a frame rate of half the field rate, and only
> > top fields are ever used as current field, and bottom fields as
> > previous/next fields, right?
>=20
> Yes, currently the driver extracts 1 frame from two consecutive incoming=
=20
> fields (previous Bottom, and current Top and Bottom):
>=20
> (frame 1 and 3 below is omitted)
>=20
>      1  2  3  4
> ...|T |T |T |T |...
> ...| B| B| B| B|...
>       | ||  | ||
>       '-''  '-''
>        ||    ||
>        ||    \/
>        \/  Frame#4
>      Frame#2
>=20
> As far as I understand it, this is how the current VDI implementation=20
> behaves too, right ?

Yes, that is a hardware limitation when using the direct CSI->VDIC
direct path. As far as I understand, for each frame (two fields) the
CSI only sends the first ("PREV") field directly to the VDIC, which
therefor can only be run in full motion mode (use the filter to add in
the missing lines).
The second ("CUR") field is just ignored. It could be written to RAM
via IDMAC output channel 13 (IPUV3_CHANNEL_VDI_MEM_RECENT), which can
not be used by the VDIC in direct mode. So this is not implemented.

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/d=
rivers/staging/media/imx/imx-media-vdic.c#n207

That code is unused. The direct hardware path doesn't use
IPUV3_CHANNEL_MEM_VDI_PREV/CUR/NEXT, but is has a similar effect, half
of the incoming fields are dropped. The setup is vdic_setup_direct().

> > I think it would be good to add a mode that doesn't drop the
> >=20
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch_p, 0, prev_phys);
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch,   0, prev_phys + phys_offset);
> > 	ipu_cpmem_set_buffer(priv->vdi_in_ch_n, 0, curr_phys);
> >=20
> > output frames, right from the start.
>=20
> This would make the VDI act as a frame-rate doubler, which would spend a=
=20
> lot more memory bandwidth, which is limited on MX6, so I would also like=
=20
> to have a frame-drop mode (i.e. current behavior).
>
> Can we make that behavior configurable ? Since this is a mem2mem device,=
=20
> we do not really have any notion of input and output frame-rate, so I=20
> suspect this would need some VIDIOC_* ioctl ?

That would be good. The situation I'd like to avoid is that this device
becomes available without the full frame-rate mode, userspace then
assumes this is a 1:1 frame converter device, and then we can't add the
full frame-rate later without breaking userspace.

> > If we don't start with that supported, I fear userspace will make
> > assumptions and be surprised when a full rate mode is added later.
>=20
> I'm afraid that since the current VDI already does retain input frame=20
> rate instead of doubling it, the userspace already makes an assumption,=
=20
> so that ship has sailed.

No, this is about the deinterlacer mem2mem device, which doesn't exist
before this series.

The CSI capture path already has configurable framedrops (in the CSI).

> But I think we can make the frame doubling configurable ?

That would be good. Specifically, there must be no guarantee that one
input frame with two fields only produces one deinterlaced output
frame, and userspace should somehow be able to understand this.

This would be an argument against Nicolas' suggestion of including this
in the csc/scaler device, which always must produce one output frame
per input frame.

[...]
> > This maps to VDI_C_MOT_SEL_FULL aka VDI_MOT_SEL=3D2, which is documente=
d
> > as "full motion, only vertical filter is used". Doesn't this completely
> > ignore the previous/next fields and only use the output of the di_vfilt
> > four tap vertical filter block to fill in missing lines from the
> > surrounding pixels (above and below) of the current field?
>=20
> Is there a suitable knob for this or shall I introduce a device specific=
=20
> one, like the vdic_ctrl_motion_menu for the current VDIC direct driver ?
>=20
> If we introduce such a knob, then it is all the more reason to provide=
=20
> one device node per one VDIC hardware instance, since each can be=20
> configured for different motion settings.

As far as I know, there is no such control yet. I don't think this
should be per-device, but per-stream (or even per-frame).

> > I think this should at least be configurable, and probably default to
> > MED_MOTION.
>=20
> I think to be compatible with the current VDI behavior and to reduce=20
> memory bandwidth usage, let's default to the HIGH/full mode. That one=20
> produces reasonably good results without spending too much memory=20
> bandwidth which is constrained already on the MX6, and if the user needs=
=20
> better image quality, they can configure another mode using the V4L2=20
> control.

I'd rather not default to the setting that throws away half of the
input data. Not using frame doubling by default is sensible, but now
that using all three input fields to calculate the output frame is
possible, why not make that the default.

regards
Philipp
