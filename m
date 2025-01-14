Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009BBA109A6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7328610E36D;
	Tue, 14 Jan 2025 14:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="EfztuKp1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::b3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3F810E36D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:45:19 +0000 (UTC)
Message-ID: <7cfc1561-a229-43e7-b4bf-23ad258733c6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736865913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4CrvmDa8toY6AtXmfQcY5xCeVasEYj7Vun/mLN9MlgA=;
 b=EfztuKp1ntwUnlufMXKtuuB8SJNwbKnJAvyCrW0ceAZBZRRNa3wQ9v4eLvZK7o6+GUIf0F
 VtR+PXC19U4RDYYDT5WgwFhMMvNnMqYB+BxfgW1w5GMHvdsH9RHYipVX15aus1QER0xyDu
 FNAX/RrgTPRl8ck5oK5ylz7xfa+rAag=
Date: Tue, 14 Jan 2025 20:14:54 +0530
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <84ca02de-9788-4e16-bf24-1651bd365ebd@ideasonboard.com>
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

Hi Tomi,

On 1/14/25 18:00, Tomi Valkeinen wrote:
> Hi,
>=20
> On 14/01/2025 07:56, Aradhya Bhatia wrote:
>> From: Aradhya Bhatia <a-bhatia1@ti.com>
>>
>> The driver code doesn't have a Phy de-initialization path as yet, and =
so
>> it does not clear the phy_initialized flag while suspending. This is a=

>> problem because after resume the driver looks at this flag to determin=
e
>> if a Phy re-initialization is required or not. It is in fact required
>> because the hardware is resuming from a suspend, but the driver does n=
ot
>> carry out any re-initialization causing the D-Phy to not work at all.
>>
>> Call the counterparts of phy_init() and phy_power_on(), that are
>> phy_exit() and phy_power_off(), from _bridge_disable(), and clear the
>> flags so that the Phy can be initialized again when required.
>>
>> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
>> ---
>> =C2=A0 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 6 +++++-
>> =C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> index 056583e81155..039c5eb7fb66 100644
>> --- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> +++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
>> @@ -672,6 +672,11 @@ static void cdns_dsi_bridge_disable(struct
>> drm_bridge *bridge)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (dsi->platform_ops && dsi->platform_=
ops->disable)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dsi->platform_o=
ps->disable(dsi);
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 dsi->phy_initialized =3D false;
>> +=C2=A0=C2=A0=C2=A0 dsi->link_initialized =3D false;
>> +=C2=A0=C2=A0=C2=A0 phy_power_off(dsi->dphy);
>> +=C2=A0=C2=A0=C2=A0 phy_exit(dsi->dphy);
>> +
>=20
> The phy related lines are counterparts to what's done in
> cdns_dsi_hs_init(), right? Maybe add cdns_dsi_hs_uninit(),
>=20
> But is the phy_initialized even needed? phy_initialized() is called fro=
m
> cdns_dsi_bridge_enable() and cdns_dsi_bridge_pre_enable(). Won't the
> call in cdns_dsi_bridge_enable() be always skipped, as
> cdns_dsi_bridge_pre_enable() already set phy_initialized?

Yes, that is how the behavior has been. The initialization calls inside
the _bridge_enable() end-up getting skipped.

My first thought after reading your comments was to remove the init
calls entirely from the _bridge_pre_enable(), and drop the
phy_initialized flag too, and let _bridge_enable() only handle the init.
The _bridge_enable() will anyway get renamed to _bridge_pre_enable(),
while the existing _bridge_pre_enable() will get dropped, by the last
patch of this series.

But since this patch is intended as a fix, it will get applied to
previous versions while that last patch of the series won't... and then
we may end up having init calls only from _bridge_enable() for the older
versions.
Also, given all the fixes in the series, there is a possibility that an
older-version of the driver might become functional (except for the
color shift issue).

My question then is, would it be a cause for concern if all the init
calls are handled from the _bridge_enable() only?

(one of the potential concerns detailed below)

>=20
> Same question for cdns_dsi_init_link(), although that's also called fro=
m
> cdns_dsi_transfer(), so we probably need dsi->link_initialized.
>=20

Don't you think we'd need the phy to also be initialized for the DCS
command to work?

Usually, since DSI is among the initial bridges to get pre_enabled, the
Link and Phy are both initialized by the time cdns_dsi_transfer() is
called. So, even if cdns_dsi_transfer() doesn't call for
cdns_dsi_hs_init(), it is able to work fine.

If DCS commands do indeed require the cdns_dsi_hs_init(), then shifting
it to _bridge_enable() (like I suggested above) would be problematic
without fixing it here.


Regards
Aradhya

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pm_runtime_put(dsi->base.dev);
>> =C2=A0 }
>> =C2=A0 @@ -1130,7 +1135,6 @@ static int __maybe_unused
>> cdns_dsi_suspend(struct device *dev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(dsi->dsi_sys_clk)=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(dsi->dsi_p_clk);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset_control_assert(dsi->dsi_p_rst);
>> -=C2=A0=C2=A0=C2=A0 dsi->link_initialized =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0=20
>=20
