Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E2DB9F786
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 15:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A46F10E91E;
	Thu, 25 Sep 2025 13:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gzvovU8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F95010E91C;
 Thu, 25 Sep 2025 13:13:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5AA940535;
 Thu, 25 Sep 2025 13:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353DBC4CEF0;
 Thu, 25 Sep 2025 13:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758806032;
 bh=cCZgUIBrVeQH4Qj0/UtZsu52PYBfU0dJ0NUtJq+jcIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gzvovU8tXrqfJt7d6aeUUFY+RJDGux/jscGSa8kMdbXrO/rLqorUBaansDgXq0g66
 +qUHg/JyGfTpq9TADKP0RffbTAgoXOhhdZPvdBNIlgcAmyq8QaXlkHlJxMVcuAKMqq
 xjRJGpygehWcRqb3Dqcoc7EzAv/tYrh4A0M8NkYQWE11HKia4PLREibsncp4SJaKDG
 AuRjUTtUrJHGqxWKD7uGDXieqRsB3ysR5EsSCarQXzdKf8YVh05JZtV9hilmo9DECy
 734oPrXfMxJDyrsv0LtH6uYwj0Aq9rK3JHSlznQ6AtMdfk+jNVIz7o6WMc/XJBQ6BT
 cngn53msxiODg==
Date: Thu, 25 Sep 2025 15:13:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Daniel Stone <daniel@fooishbar.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
Message-ID: <20250925-fervent-merry-beagle-2baba3@penduick>
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
 <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
 <20250901-voracious-classy-hedgehog-ee28ef@houat>
 <voknqdv3zte2jzue5yxmysdiixxkogvpblvrccp5gu55x5ycca@srrcscly4ch4>
 <st6wob5hden6ypxt2emzokfhl3ezpbuypv2kdtf5zdrdhlyjfw@l2neflb4uupo>
 <pe6g2fanw65p67kfy5blbtiytngxmr6nkbazymojs4a66yvpl3@7j4ccnsvc6az>
 <20250910-didactic-honored-chachalaca-f233b2@houat>
 <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="66hnrwbpjdue4aou"
Content-Disposition: inline
In-Reply-To: <x562ueky2z5deqqmhl222moyrbylfwi35u4hb34dpl3z52ra4c@dyw4iayrewnz>
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


--66hnrwbpjdue4aou
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per
 driver capabilities
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 06:26:56PM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 10, 2025 at 09:30:19AM +0200, Maxime Ripard wrote:
> > On Wed, Sep 03, 2025 at 03:03:43AM +0300, Dmitry Baryshkov wrote:
> > > On Tue, Sep 02, 2025 at 08:06:54PM +0200, Maxime Ripard wrote:
> > > > On Tue, Sep 02, 2025 at 06:45:44AM +0300, Dmitry Baryshkov wrote:
> > > > > On Mon, Sep 01, 2025 at 09:07:02AM +0200, Maxime Ripard wrote:
> > > > > > On Sun, Aug 31, 2025 at 01:29:13AM +0300, Dmitry Baryshkov wrot=
e:
> > > > > > > On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > > > > > > > Hi Dmitry,
> > > > > > > >=20
> > > > > > > > On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> > > > > > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > > > > It's not uncommon for the particular device to support on=
ly a subset of
> > > > > > > > > HDMI InfoFrames. It's not a big problem for the kernel, s=
ince we adopted
> > > > > > > > > a model of ignoring the unsupported Infoframes, but it's =
a bigger
> > > > > > > > > problem for the userspace: we end up having files in debu=
gfs which do
> > > > > > > > > mot match what is being sent on the wire.
> > > > > > > > >
> > > > > > > > > Sort that out, making sure that all interfaces are consis=
tent.
> > > > > > > >=20
> > > > > > > > Thanks for the series, it's a really good cleanup.
> > > > > > > >=20
> > > > > > > > I know that dw-hdmi-qp can support _any_ infoframe, by manu=
ally
> > > > > > > > packing it into the two GHDMI banks. So the supported set t=
here is
> > > > > > > > 'all of the currently well-known ones, plus any two others,=
 but only
> > > > > > > > two and not more'. I wonder if that has any effect on the i=
nterface
> > > > > > > > you were thinking about for userspace?
> > > > > > >=20
> > > > > > > I was mostly concerned with the existing debugfs interface (a=
s it is
> > > > > > > also used e.g. for edid-decode, etc).
> > > > > > >=20
> > > > > > > It seems "everything + 2 spare" is more or less common (ADV75=
11, MSM
> > > > > > > HDMI also have those. I don't have at hand the proper datashe=
et for
> > > > > > > LT9611 (non-UXC one), but I think its InfoFrames are also mor=
e or less
> > > > > > > generic).  Maybe we should change debugfs integration to regi=
ster the
> > > > > > > file when the frame is being enabled and removing it when it =
gets unset.
> > > > > >=20
> > > > > > But, like, for what benefit?
> > > > > >=20
> > > > > > It's a debugfs interface for userspace to consume. The current =
setup
> > > > > > works fine with edid-decode already. Why should we complicate t=
he design
> > > > > > that much and create fun races like "I'm running edid-decode in=
 parallel
> > > > > > to a modeset that would remove the file I just opened, what is =
the file
> > > > > > now?".
> > > > >=20
> > > > > Aren't we trading that with the 'I'm running edid-decode in paral=
le with
> > > > > to a modeset and the file suddenly becomes empty'?
> > > >=20
> > > > In that case, you know what the file is going to be: empty. And you=
 went
> > > > from a racy, straightforward, design to a racy, complicated, design.
> > > >=20
> > > > It was my question before, but I still don't really see what benefi=
ts it
> > > > would have, and why we need to care about it in the core, when it c=
ould
> > > > be dealt with in the drivers just fine on a case by case basis.
> > >=20
> > > Actually it can not: debugfs files are registered from the core, not
> > > from the drivers. That's why I needed all the supported_infoframes
> > > (which later became software_infoframes).
> >=20
> > That's one thing we can change then.
> >=20
> > > Anyway, I'm fine with having empty files there.
> > >=20
> > > > > > > Then in the long run we can add 'slots' and allocate some of =
the frames
> > > > > > > to the slots. E.g. ADV7511 would get 'software AVI', 'softwar=
e SPD',
> > > > > > > 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can =
probably be
> > > > > > > salvaged as another generic one)). MSM HDMI would get 'softwa=
re AVI',
> > > > > > > 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI whic=
h I don't
> > > > > > > want to use). Then the framework might be able to prioritize =
whether to
> > > > > > > use generic slots for important data (as DRM HDR, HDMI) or le=
ss important
> > > > > > > (SPD).
> > > > > >=20
> > > > > > Why is it something for the framework to deal with? If you want=
 to have
> > > > > > extra infoframes in there, just go ahead and create additional =
debugfs
> > > > > > files in your driver.
> > > > > >=20
> > > > > > If you want to have the slot mechanism, check in your atomic_ch=
eck that
> > > > > > only $NUM_SLOT at most infoframes are set.
> > > > >=20
> > > > > The driver can only decide that 'we have VSI, SPD and DRM InfoFra=
mes
> > > > > which is -ETOOMUCH for 2 generic slots'. The framework should be =
able to
> > > > > decide 'the device has 2 generic slots, we have HDR data, use VSI=
 and
> > > > > DRM InfoFrames and disable SPD for now'.
> > > >=20
> > > > I mean... the spec does? The spec says when a particular feature
> > > > requires to send a particular infoframe. If your device cannot supp=
ort
> > > > to have more than two "features" enabled at the same time, so be it=
=2E It
> > > > something that should be checked in that driver atomic_check.
> > >=20
> > > Sounds good to me. Let's have those checks in the drivers until we
> > > actually have seveal drivers performing generic frame allocation.
> > >=20
> > > > Or just don't register the SPD debugfs file, ignore it, put a comme=
nt
> > > > there, and we're done too.
> > >=20
> > > It's generic code.
> > >=20
> > > > > But... We are not there yet and I don't have clear usecase (we su=
pport
> > > > > HDR neither on ADV7511 nor on MSM HDMI, after carefully reading t=
he
> > > > > guide I realised that ADV7511 has normal audio infoframes). Maybe=
 I
> > > > > should drop all the 'auto' features, simplifying this series and =
land
> > > > > [1] for LT9611UXC as I wanted origianlly.
> > > > >=20
> > > > > [1] https://lore.kernel.org/dri-devel/20250803-lt9611uxc-hdmi-v1-=
2-cb9ce1793acf@oss.qualcomm.com/
> > > >=20
> > > > Looking back at that series, I think it still has value to rely on =
the
> > > > HDMI infrastructure at the very least for the atomic_check sanitiza=
tion.
> > > >=20
> > > > But since you wouldn't use the generated infoframes, just skip the
> > > > debugfs files registration. You're not lying to userspace anymore, =
and
> > > > you get the benefits of the HDMI framework.
> > >=20
> > > We create all infoframe files for all HDMI connectors.
> >=20
> > Then we can provide a debugfs_init helper to register all of them, or
> > only some of them, and let the drivers figure it out.
> >=20
> > Worst case scenario, debugfs files will not get created, which is a much
> > better outcome than having to put boilerplate in every driver that will
> > get inconsistent over time.
>=20
> debugfs_init() for each infoframe or taking some kind of bitmask?

I meant turning hdmi_debugfs_add and create_hdmi_*_infoframe_file into
public helpers. That way, drivers that don't care can use the (renamed)
hdmi_debugfs_add, and drivers with different constraints can register
the relevant infoframes directly.

Maxime

--66hnrwbpjdue4aou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNVACgAKCRAnX84Zoj2+
ds6HAXwJ9eLLOI2EVfkUrhuPlQF7nB91vMzwx0YCbF2Y3KTVXHoq9v0iFjyXhrM4
GmFpCPgBf2tLzAYHz6J1tzDAdY2RnzoszUG2nVuosViqzP8jS1sDd3QWoW+sEQlD
GWljMh3wRQ==
=dtph
-----END PGP SIGNATURE-----

--66hnrwbpjdue4aou--
