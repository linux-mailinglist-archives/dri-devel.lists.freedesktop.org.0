Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dqHYANZff2ncpAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:14:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12AC61BE
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 15:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB8110E081;
	Sun,  1 Feb 2026 14:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="kpITffrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F8D10E081
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 14:14:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 5DE2326125;
 Sun,  1 Feb 2026 15:14:37 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6vFyFPygDq0; Sun,  1 Feb 2026 15:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1769955276; bh=HyiFrtV16BT2yMD0/WH+EkSthkQwVKOebWrORCHC8bU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To;
 b=kpITffrXNM5mo/aIaQotE/HwHYqgja7BYdRED5/t14rR5pvLSCIBfuFithK+VaFd9
 TPzlXT08+jGsc/LDw+BhEDSproQ5MVaNlFBDGejKF5gfZ5b8v11/2FcOgkai7Oprkf
 qIA9Wm3T0eNy1FTIhAr5QLKh5ZTZ0e5fgrpJd5w60lBbR8TRtU9uVOXl9YggSFf23V
 KN45QW8Ogr2POMi6YUAawsibxCntEyrL0CF53lsEhNOV91IJugr8KQLccrSAoqU4En
 uQ7mXI304ZNA5kM5bIMXty6PewA9mVZfXPIKdvxuca+/SiK++FFfGU5AajZlsYFPQv
 zxNL3UkWoPKvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Feb 2026 19:44:24 +0530
Message-Id: <DG3ORZIEYI9Z.34Z2QZ4J2A21@disroot.org>
Subject: Re: [PATCH 1/3] drm/bridge: samsung-dsim: move bridge init sequence
 to atomic_enable
From: "Kaustabh Chakraborty" <kauschluss@disroot.org>
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, "Kaustabh Chakraborty"
 <kauschluss@disroot.org>, "Inki Dae" <inki.dae@samsung.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
References: <20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org>
 <CGME20260124172136eucas1p1e7a2da65c3fca268ea68f12506c6c19e@eucas1p1.samsung.com>
 <20260124-exynos-dsim-fixes-v1-1-122d047a23d1@disroot.org>
 <1db5ffdf-924b-49cb-a057-802a1bfe6073@samsung.com>
In-Reply-To: <1db5ffdf-924b-49cb-a057-802a1bfe6073@samsung.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:m.szyprowski@samsung.com,m:kauschluss@disroot.org,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[kauschluss@disroot.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[samsung.com,disroot.org,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kauschluss@disroot.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[disroot.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2D12AC61BE
X-Rspamd-Action: no action

On 2026-01-26 09:57 +01:00, Marek Szyprowski wrote:
> On 24.01.2026 18:20, Kaustabh Chakraborty wrote:
>> Since commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
>> pre-enable and post-disable"), pre-enable sequence is called before the
>> CRTC is enabled.
>>
>> This causes unintended side-effects (abberation among potentially other
>> things) in the display when samsung_dsim_init() is called in the
>> pre-enable part of the sequence. Call it in samsung_dsim_atomic_enable()
>> instead.
>>
>> Cc: stable@vger.kernel.org # v6.17 and later
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>
> I'm not sure if this will be needed:
>
> https://lore.kernel.org/all/20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideaso=
nboard.com/

Tested on v6.19-rc7, this is fixed now. This can be dropped.

>
>
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bri=
dge/samsung-dsim.c
>> index 1d85e706c74b9..975f8b50ae660 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1655,6 +1655,13 @@ static void samsung_dsim_atomic_pre_enable(struct=
 drm_bridge *bridge,
>>   	}
>>  =20
>>   	dsi->state |=3D DSIM_STATE_ENABLED;
>> +}
>> +
>> +static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>> +				       struct drm_atomic_state *state)
>> +{
>> +	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
>> +	int ret;
>>  =20
>>   	/*
>>   	 * For Exynos-DSIM the downstream bridge, or panel are expecting
>> @@ -1665,12 +1672,6 @@ static void samsung_dsim_atomic_pre_enable(struct=
 drm_bridge *bridge,
>>   		if (ret)
>>   			return;
>>   	}
>> -}
>> -
>> -static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>> -				       struct drm_atomic_state *state)
>> -{
>> -	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
>>  =20
>>   	samsung_dsim_set_display_mode(dsi);
>>   	samsung_dsim_set_display_enable(dsi, true);
>>
> Best regards

