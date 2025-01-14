Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53FA10C55
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F7E89264;
	Tue, 14 Jan 2025 16:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="m/Xx5zPE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDE889264
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:33:22 +0000 (UTC)
Message-ID: <6f7bafba-9b40-491f-bf6b-00094840089c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736872395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Ojil1oI08n7TnuyhgGkQyWcip5MZyN6QJJ93Wot6AA=;
 b=m/Xx5zPEI6pKC+vyLqDbJPGVCr/PZuFs1E9SFykJydhzO6hYCzYpxXugrX4exCppJbNj1B
 C7VInTSn1SP1zewtDqxF+s7duUCaG0eu1BhQ3FehZpv/Q1BKm7vu+0ravF8hm/L5phU+c/
 XLUpYmyC2K0w7UK7va0NEydL6gjg8F4=
Date: Tue, 14 Jan 2025 22:02:57 +0530
MIME-Version: 1.0
Subject: Re: [PATCH v7 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-4-aradhya.bhatia@linux.dev>
 <84ca02de-9788-4e16-bf24-1651bd365ebd@ideasonboard.com>
 <7cfc1561-a229-43e7-b4bf-23ad258733c6@linux.dev>
 <0e0ee18e-28f6-4c57-a47d-cd7ace84fa70@ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <0e0ee18e-28f6-4c57-a47d-cd7ace84fa70@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
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

On 1/14/25 20:50, Tomi Valkeinen wrote:
> Hi,
>=20
> On 14/01/2025 16:44, Aradhya Bhatia wrote:
>> Hi Tomi,
>>
>> On 1/14/25 18:00, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 14/01/2025 07:56, Aradhya Bhatia wrote:
>>>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>>>
>>>> The driver code doesn't have a Phy de-initialization path as yet,
>>>> and so
>>>> it does not clear the phy_initialized flag while suspending. This is=
 a
>>>> problem because after resume the driver looks at this flag to determ=
ine
>>>> if a Phy re-initialization is required or not. It is in fact require=
d
>>>> because the hardware is resuming from a suspend, but the driver does=

>>>> not
>>>> carry out any re-initialization causing the D-Phy to not work at all=
=2E
>>>>
>>>> Call the counterparts of phy_init() and phy_power_on(), that are
>>>> phy_exit() and phy_power_off(), from _bridge_disable(), and clear th=
e
>>>> flags so that the Phy can be initialized again when required.
>>>>
>>>> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>>>> ---
>>>> =C2=A0=C2=A0 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 ++++=
+-
>>>> =C2=A0=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> index 056583e81155..039c5eb7fb66 100644
>>>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>>>> @@ -672,6 +672,11 @@ static void cdns_dsi_bridge_disable(struct
>>>> drm_bridge *bridge)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dsi->platform_ops && dsi->p=
latform_ops->disable)
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsi->pl=
atform_ops->disable(dsi);
>>>> =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0 dsi->phy_initialized =3D false;
>>>> +=C2=A0=C2=A0=C2=A0 dsi->link_initialized =3D false;
>>>> +=C2=A0=C2=A0=C2=A0 phy_power_off(dsi->dphy);
>>>> +=C2=A0=C2=A0=C2=A0 phy_exit(dsi->dphy);
>>>> +
>>>
>>> The phy related lines are counterparts to what's done in
>>> cdns_dsi_hs_init(), right? Maybe add cdns_dsi_hs_uninit(),
>>>
>>> But is the phy_initialized even needed? phy_initialized() is called f=
rom
>>> cdns_dsi_bridge_enable() and cdns_dsi_bridge_pre_enable(). Won't the
>>> call in cdns_dsi_bridge_enable() be always skipped, as
>>> cdns_dsi_bridge_pre_enable() already set phy_initialized?
>>
>> Yes, that is how the behavior has been. The initialization calls insid=
e
>> the _bridge_enable() end-up getting skipped.
>>
>> My first thought after reading your comments was to remove the init
>> calls entirely from the _bridge_pre_enable(), and drop the
>> phy_initialized flag too, and let _bridge_enable() only handle the ini=
t.
>=20
> Isn't that the wrong way around? If currently bridge_pre_enable enables=

> the phy, your suggestion above would change that. I would think keeping=

> the init calls in bridge_pre_enable, and drop from bridge_enable.
>=20
>> The _bridge_enable() will anyway get renamed to _bridge_pre_enable(),
>> while the existing _bridge_pre_enable() will get dropped, by the last
>> patch of this series.
>=20
> Ok, but you can't do a fix that'll only be right after some future patc=
h
> does more changes =3D).

Yeah, that would be wrong. =3D)

>=20
>> But since this patch is intended as a fix, it will get applied to
>> previous versions while that last patch of the series won't... and the=
n
>=20
> Speaking of which, I think you should cc: stable for the ones that
> should be applied to earlier kernels. And it would be good to have all
> such patches first in the series, to decrease any dependencies.

Will do!

>=20
>> we may end up having init calls only from _bridge_enable() for the old=
er
>> versions.
>> Also, given all the fixes in the series, there is a possibility that a=
n
>> older-version of the driver might become functional (except for the
>> color shift issue).
>>
>> My question then is, would it be a cause for concern if all the init
>> calls are handled from the _bridge_enable() only?
>=20
> I'm not sure I follow here. Don't we want the init calls to happen in
> the pre_enable phase, both before and after the sequence change (patch =
12)?
>=20

It is, now. For that brief period, I was considering to keep them only
in _bridge_enable().

> But generally speaking, yes, it's good to keep fixes simple, and do
> cleanups later on top. Keeping that in mind, maybe this current patch i=
s
> fine as it is. Although... if the init is done in pre_enable, shouldn't=

> the deinit be done in post_disable?

Yes, I will move the deinit to _bridge_post_disable().


So, if we keep the fix limited to deinit in _bridge_post_disable(), then
the cleanup would involve dropping the init calls from _bridge_enable().
And then the patch-12 would do 3 things -

	1. Drop older _bridge_pre_enable()
	2. Rename old _bridge_enable() to _bridge_pre_enable()
	3. Since the _old_ _bridge_enable() has the calls dropped in the
	   cleanup patch, add those calls again in the _new_
	   _bridge_pre_enable() (which are really the same function
	   bodies).

Do you think we can instead skip the cleanup patch, as well as #3 from
patch-12?

Fun fact: We already have patch-4 which fixes the order of init calls in
_bridge_enable()! =3D)

>=20
>> (one of the potential concerns detailed below)
>>
>>>
>>> Same question for cdns_dsi_init_link(), although that's also called f=
rom
>>> cdns_dsi_transfer(), so we probably need dsi->link_initialized.
>>>
>>
>> Don't you think we'd need the phy to also be initialized for the DCS
>> command to work?
>=20
> I'm sure we do. But the driver doesn't do that currently, does it? Whic=
h
> I did find a bit odd, but I'm not familiar with the HW.
>=20
> However, my comment was related to calling cdns_dsi_init_link() in both=

> cdns_dsi_bridge_enable and cdns_dsi_bridge_pre_enable functions. In thi=
s
> case the call in the cdns_dsi_bridge_enable function is a no-op, simila=
r
> to calling cdns_dsi_hs_init().
>=20
> But, if changed, that's also a cleanup, so maybe better keep away from
> fix patches.
>=20
>> Usually, since DSI is among the initial bridges to get pre_enabled, th=
e
>> Link and Phy are both initialized by the time cdns_dsi_transfer() is
>> called. So, even if cdns_dsi_transfer() doesn't call for
>> cdns_dsi_hs_init(), it is able to work fine.
>>
>> If DCS commands do indeed require the cdns_dsi_hs_init(), then shiftin=
g
>> it to _bridge_enable() (like I suggested above) would be problematic
>> without fixing it here.
>=20
> I don't know what how the HW works, but we definitely need PHY to send
> DCS commands. But we don't necessarily need HS mode, LP works fine
> (usually). It's just not clear to me what exactly cdns_dsi_hs_init() an=
d
> cdns_dsi_init_link() do. What is "link"? Looks like cdns_dsi_init_link
> is doing some PHY stuff, which is kind of strange thing to do, as
> phy_init() and phy_power_on() are only done later.

That is where my confusion is too. A quick look into the TRM didn't
help me with distinctions either.

>=20
> In any case, yes, the cdns_dsi_transfer() has to make sure we have LP/H=
S
> working. So indeed it might mean calling both functions. This is,
> however, perhaps a different topic, best left out of this series.
>=20

Alright. Since it is decided to keep the init calls in
_bridge_pre_enable(), cdns_dsi_transfer() is not going to be affected
any more than it already is, and we won't be breaking anything new.

I guess there can be some trial and error done to find whether
cdns_dsi_transfer() is really dependent on cdns_dsi_hs_init() -
but yes, let's keep that out of this series' scope.


Regards
Aradhya
