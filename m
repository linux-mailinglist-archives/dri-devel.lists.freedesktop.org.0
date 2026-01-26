Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNLiIBawd2k3kQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:19:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CF38C08C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3402710E245;
	Mon, 26 Jan 2026 18:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NcArdz7x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC4E10E245
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:18:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0B921C214CF;
 Mon, 26 Jan 2026 18:18:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3774260717;
 Mon, 26 Jan 2026 18:18:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 79086119A8652; Mon, 26 Jan 2026 19:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769451534; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ls3taMwzvNNXHeVbQeNP5rFTYcAY6U5onCvB1yfNoQ8=;
 b=NcArdz7xzE0B9ZKlGEpC4zys8TGIgogLWz9VpMtrP6U+Em5MEEDrFaMiAA9LMfnJOpreJv
 +ZdWvIbH72LlOeGJQrsfZtHfGRyEexTvGXSZH6iMeG+1cpyK2Fi1EIwRshDDheiXKzKyd6
 wFNvp/9Bn4tLGNKIVhFjrKh4uJQ0WTU3BXvL2twizcVRwZbaeSzyo4fl5XICglLCoCeaC/
 xitZfUwjJmHl2YgbfQWLn4TR5aftP7+FMbOufQuPhkrL8oZwOx17YjlVJQgnJ5ioVgpTfz
 aYri0JDVyWhMbP97zYlt7JDxojnKMCruFM1l22lKmreDdrZRvqinZs6aNjVMCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 19:18:47 +0100
Message-Id: <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
Subject: Re: [PATCH v4 4/4] drm/bridge: imx8qxp-pixel-link: get/put the next
 bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-4-a62b4399a6bf@bootlin.com>
 <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
In-Reply-To: <e2536229-f8d9-4d65-8211-cf445677bef2@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
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
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E1CF38C08C
X-Rspamd-Action: no action

Hello Liu,

On Mon Jan 26, 2026 at 9:06 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Wed, Jan 07, 2026 at 10:56:29AM +0100, Luca Ceresoli wrote:
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> This needs to be handled in various steps:
>>
>>  * the bridge returned of_drm_get_bridge() is stored in the local tempor=
ary
>>    variable next_bridge whose scope is the for loop, so a cleanup action=
 is
>>    enough
>>  * the value of next_bridge is copied into selected_bridge, potentially
>>    more than once, so a cleanup action at function scope plus a
>>    drm_bridge_put() in case of reassignment are enough
>>  * on successful return selected_bridge is stored in bridge->next_bridge=
,
>>    which ensures it is put when the bridge is deallocated
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks for having found the time to go into the details and provide a
careful review of this series!

>> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
>> @@ -23,7 +23,6 @@
>>
>>  struct imx8qxp_pixel_link {
>>  	struct drm_bridge bridge;
>> -	struct drm_bridge *next_bridge;
>>  	struct device *dev;
>>  	struct imx_sc_ipc *ipc_handle;
>>  	u8 stream_id;
>> @@ -140,7 +139,7 @@ static int imx8qxp_pixel_link_bridge_attach(struct d=
rm_bridge *bridge,
>>  	}
>>
>>  	return drm_bridge_attach(encoder,
>> -				 pl->next_bridge, bridge,
>> +				 pl->bridge.next_bridge, bridge,
>>  				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  }
>>
>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  {
>>  	struct device_node *np =3D pl->dev->of_node;
>>  	struct device_node *port;
>> -	struct drm_bridge *selected_bridge =3D NULL;
>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NULL;
>>  	u32 port_id;
>>  	bool found_port =3D false;
>>  	int reg;
>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  			continue;
>>  		}
>>
>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>> +			of_drm_find_and_get_bridge(remote);
>>  		if (!next_bridge)
>>  			return -EPROBE_DEFER;
>>
>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>  		 * Select the next bridge with companion PXL2DPI if
>>  		 * present, otherwise default to the first bridge
>>  		 */
>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi"))
>> -			selected_bridge =3D next_bridge;
>> +		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi")) {
>> +			drm_bridge_put(selected_bridge);
>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>
> Considering selecting the first bridge without the companion pxl2dpi,
> there would be a superfluous refcount for the selected bridge:
>
> 1) of_drm_find_and_get_bridge: refcount =3D 1
> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D 1
> 3) drm_bridge_get: refcount =3D 2
> 4) drm_bridge_put(__free): refcount =3D 1
> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2

Here you are missing one put. There are two drm_bridge_put(__free), one for
next_bridge and one for selected_bridge. So your list should rather be:

1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NULL, re=
fcount =3D 1
3) selected_bridge =3D drm_bridge_get: refcount =3D 2
4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =3D 1
5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
6) drm_bridge_put(selected_bridge) [__free at function scope end]: refcount=
 =3D 1

The idea is that for each pointer (which is a reference) we get a reference
(refcount++) when the pointer is set and put the reference when that same
pointer goes out of scope or is reset to NULL. "the pointer is set" can be
either of_drm_find_and_get_bridge() or an assignment, as each of these
operations creates another reference (pointer) to the same bridge.

Does it look correct?

> I think the below snippet would be the right thing to do:
> -8<-
> {
> 	...
>
> 	struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
> 		of_drm_find_and_get_bridge(remote);
>   		if (!next_bridge)
>   			return -EPROBE_DEFER;
>
> 	/*
> 	 * Select the next bridge with companion PXL2DPI if
> 	 * present, otherwise default to the first bridge
> 	 */
> 	if (!selected_bridge)
> 		selected_bridge =3D drm_bridge_get(next_bridge);
>
> 	if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
> 		if (selected_bridge)
> 			drm_bridge_put(selected_bridge);
>
> 		selected_bridge =3D drm_bridge_get(next_bridge);
> 	}
> }

Your version of the code looks OK as well so far, but totally equivalent to
what my patch proposes.

Do you think splitting the if() into two if()s is clearer? Would you like
me to change this?

> ...
> pl->bridge.next_bridge =3D selected_bridge;

Based on the logic above the drm_bridge_get() is still needed here (both
with the single if() or the split if()s) because at function exit the
selected_bridge reference will be put.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
