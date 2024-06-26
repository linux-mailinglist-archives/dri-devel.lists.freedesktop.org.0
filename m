Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93524917AF7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 10:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3F710E7C0;
	Wed, 26 Jun 2024 08:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50D10E7BE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 08:29:08 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1sMO1Q-00064a-Jz; Wed, 26 Jun 2024 10:28:56 +0200
Message-ID: <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>, Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Stone <daniel@fooishbar.org>, linux-kernel@vger.kernel.org, Oded
 Gabbay <ogabbay@kernel.org>, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@gmail.com>,  etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Date: Wed, 26 Jun 2024 10:28:55 +0200
In-Reply-To: <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
References: <20240424063753.3740664-1-tomeu@tomeuvizoso.net>
 <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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

Am Mittwoch, dem 26.06.2024 um 09:28 +0200 schrieb Daniel Vetter:
> On Mon, Jun 17, 2024 at 07:01:05PM +0200, Tomeu Vizoso wrote:
> > Hi Lucas,
> >=20
> > Do you have any idea on how not to break userspace if we expose a rende=
r node?
>=20
> So if you get a new chip with an incompatible 3d block, you already have
> that issue. And I hope etnaviv userspace can cope.
>=20
> Worst case you need to publish a fake extremely_fancy_3d_block to make
> sure old mesa never binds against an NPU-only instance.
>=20
> Or mesa just doesn't cope, in which case we need a etnaviv-v2-we_are_sorr=
y
> drm driver name, or something like that.

Mesa doesn't cope right now. Mostly because of the renderonly thing
where we magically need to match render devices to otherwise render
incapable KMS devices. The way this matching works is that the
renderonly code tries to open a screen on a rendernode and if that
succeeds we treat it as the matching render device.

The core of the issue is that we have no way of specifying which kind
of screen we need at that point, i.e. if the screen should have 3D
render capabilities or if compute-only or even NN-accel-only would be
okay. So we can't fail screen creation if there is no 3D engine, as
this would break the teflon case, which needs a screen for the NN
accel, but once we successfully create a screen reanderonly might treat
the thing as a rendering device.
So we are kind of stuck here between breaking one or the other use-
case. I'm leaning heavily into the direction of just fixing Mesa, so we
can specify the type of screen we need at creation time to avoid the
renderonly issue, porting this change as far back as reasonably
possible and file old userspace into shit-happens.

Regards,
Lucas

>=20
> >=20
> > Cheers,
> >=20
> > Tomeu
> >=20
> > On Wed, Jun 12, 2024 at 4:26=E2=80=AFPM Tomeu Vizoso <tomeu@tomeuvizoso=
.net> wrote:
> > >=20
> > > On Mon, May 20, 2024 at 1:19=E2=80=AFPM Daniel Stone <daniel@fooishba=
r.org> wrote:
> > > >=20
> > > > Hi,
> > > >=20
> > > > On Mon, 20 May 2024 at 08:39, Tomeu Vizoso <tomeu@tomeuvizoso.net> =
wrote:
> > > > > On Fri, May 10, 2024 at 10:34=E2=80=AFAM Lucas Stach <l.stach@pen=
gutronix.de> wrote:
> > > > > > Am Mittwoch, dem 24.04.2024 um 08:37 +0200 schrieb Tomeu Vizoso=
:
> > > > > > > If we expose a render node for NPUs without rendering capabil=
ities, the
> > > > > > > userspace stack will offer it to compositors and applications=
 for
> > > > > > > rendering, which of course won't work.
> > > > > > >=20
> > > > > > > Userspace is probably right in not questioning whether a rend=
er node
> > > > > > > might not be capable of supporting rendering, so change it in=
 the kernel
> > > > > > > instead by exposing a /dev/accel node.
> > > > > > >=20
> > > > > > > Before we bring the device up we don't know whether it is cap=
able of
> > > > > > > rendering or not (depends on the features of its blocks), so =
first try
> > > > > > > to probe a rendering node, and if we find out that there is n=
o rendering
> > > > > > > hardware, abort and retry with an accel node.
> > > > > >=20
> > > > > > On the other hand we already have precedence of compute only DR=
M
> > > > > > devices exposing a render node: there are AMD GPUs that don't e=
xpose a
> > > > > > graphics queue and are thus not able to actually render graphic=
s. Mesa
> > > > > > already handles this in part via the PIPE_CAP_GRAPHICS and I th=
ink we
> > > > > > should simply extend this to not offer a EGL display on screens=
 without
> > > > > > that capability.
> > > > >=20
> > > > > The problem with this is that the compositors I know don't loop o=
ver
> > > > > /dev/dri files, trying to create EGL screens and moving to the ne=
xt
> > > > > one until they find one that works.
> > > > >=20
> > > > > They take the first render node (unless a specific one has been
> > > > > configured), and assumes it will be able to render with it.
> > > > >=20
> > > > > To me it seems as if userspace expects that /dev/dri/renderD* dev=
ices
> > > > > can be used for rendering and by breaking this assumption we woul=
d be
> > > > > breaking existing software.
> > > >=20
> > > > Mm, it's sort of backwards from that. Compositors just take a
> > > > non-render DRM node for KMS, then ask GBM+EGL to instantiate a GPU
> > > > which can work with that. When run in headless mode, we don't take
> > > > render nodes directly, but instead just create an EGLDisplay or
> > > > VkPhysicalDevice and work backwards to a render node, rather than
> > > > selecting a render node and going from there.
> > > >=20
> > > > So from that PoV I don't think it's really that harmful. The only
> > > > complication is in Mesa, where it would see an etnaviv/amdgpu/...
> > > > render node and potentially try to use it as a device. As long as M=
esa
> > > > can correctly skip, there should be no userspace API implications.
> > > >=20
> > > > That being said, I'm not entirely sure what the _benefit_ would be =
of
> > > > exposing a render node for a device which can't be used by any
> > > > 'traditional' DRM consumers, i.e. GL/Vulkan/winsys.
> > >=20
> > > What I don't understand yet from Lucas proposal is how this isn't
> > > going to break existing userspace.
> > >=20
> > > I mean, even if we find a good way of having userspace skip
> > > non-rendering render nodes, what about existing userspace that isn't
> > > able to do that? Any updates to newer kernels are going to break them=
.
> > >=20
> > > Regards,
> > >=20
> > > Tomeu
>=20

