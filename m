Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBG/OEFahGl92gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:52:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48748F00E7
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 09:52:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7614A10E805;
	Thu,  5 Feb 2026 08:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="V/OuwqIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1CE10E802
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 08:52:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8E380C243A8;
 Thu,  5 Feb 2026 08:52:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 873C2606FD;
 Thu,  5 Feb 2026 08:52:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2F4E1119A865B; Thu,  5 Feb 2026 09:52:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770281530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cAHuDZGdOHCkluE1sGpfz5BKQPev5pDJI3SbYCQhk/g=;
 b=V/OuwqIzGrMg16RK410fZ8NV8UB+SC8qXojKVuRT8brgx53s3SX7ZwCfi7PAcW/2JHIutf
 iP2WJOXeobyqbR08j0nlsZ9gn0awlNelWyoC+0GSqoCMfY7GjBIv1mEDo8X9s0PTQ+67Q4
 OJhfTxhZC72c5jAS/KG6hP83m5HTp8jaBeCaS4a3c7vo+i9vy8HgUCggTYW4Dy2IvOWXAg
 IbW4iE3RaOjukwR79O2XzAZDOMpgqnd/D95pr7vMSU6nen8QtJiw/DoGU3/ig/SC+hLo9a
 nFuBMTP8tV0eD2ryZHQ8gs+LIH6udPj2qI4ymiFWJNgdUUFFIKphgf/IG4uc1g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 09:52:04 +0100
Message-Id: <DG6WFD0WCCMQ.2AT7S8YHVLH7@bootlin.com>
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
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pixel-link: get/put the next bridge
Cc: "Hui Pu" <Hui.Pu@gehealthcare.com>, "Ian Ray"
 <ian.ray@gehealthcare.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-0-66bda8d617b4@bootlin.com>
 <20260203-drm-bridge-alloc-getput-drm_of_find_bridge-v5-1-66bda8d617b4@bootlin.com>
 <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
In-Reply-To: <8d8e678b-bd3f-441e-9496-e1461a1289ea@nxp.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:Hui.Pu@gehealthcare.com,m:ian.ray@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 48748F00E7
X-Rspamd-Action: no action

Hello Liu,

On Wed Feb 4, 2026 at 7:27 AM CET, Liu Ying wrote:
> Hi Luca,
>
> On Tue, Feb 03, 2026 at 11:35:25AM +0100, Luca Ceresoli wrote:
>> This driver obtains a bridge pointer from of_drm_find_bridge() in the pr=
obe
>> function and stores it until driver removal. of_drm_find_bridge() is
>> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
>> refcounted and use bridge->next_bridge to put the reference on
>> deallocation.
>>
>> To keep the code as simple and reliable as possible, get a reference for
>> each pointer that stores a drm_bridge address when it is stored and rele=
ase
>> it when the pointer is overwritten or goes out of scope. Also remove the
>> intermediate selected_bridge variable to reduce the refcounted variables=
 in
>> the function. The involved pointers are:
>>
>>  * next_bridge loop-local variable:
>>    - get reference by of_drm_find_and_get_bridge()
>>    - put reference at the end of the loop iteration (__free)
>>
>>  * pl->bridge.next_bridge, tied to struct imx8qxp_pixel_link lifetime:
>>    - get reference when assigned (by copy from next_bridge)
>>    - put reference before reassignment if reassignment happens
>>    - put reference when the struct imx8qxp_pixel_link embedding the
>>      struct drm_bridge is destroyed (struct drm_bridge::next_bridge)
>>
>> Additionally, split the somewhat complex if() for readability.
>>
>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>
>> ---
>>
>> Changes in v5:
>> - rewrite commit message after Liu's review to clarify the per-pointer
>>   get/put idea
>> - split the if()s involved in selcting the bridge
>> - remove intermediate selected_bridge pointer
>> - removed Maxime's R-by, patch changed
>> ---
>>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 17 ++++++++++-------
>>  1 file changed, 10 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/g=
pu/drm/bridge/imx/imx8qxp-pixel-link.c
>> index 91e4f4d55469..e29e099b893a 100644
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
>> @@ -260,7 +259,6 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
t imx8qxp_pixel_link *pl)
>>  {
>>  	struct device_node *np =3D pl->dev->of_node;
>>  	struct device_node *port;
>> -	struct drm_bridge *selected_bridge =3D NULL;
>>  	u32 port_id;
>>  	bool found_port =3D false;
>>  	int reg;
>> @@ -297,7 +295,8 @@ static int imx8qxp_pixel_link_find_next_bridge(struc=
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
>> @@ -305,12 +304,16 @@ static int imx8qxp_pixel_link_find_next_bridge(str=
uct imx8qxp_pixel_link *pl)
>>  		 * Select the next bridge with companion PXL2DPI if
>>  		 * present, otherwise default to the first bridge
>>  		 */
>> -		if (!selected_bridge || of_property_present(remote, "fsl,companion-px=
l2dpi"))
>> -			selected_bridge =3D next_bridge;
>> +		if (!pl->bridge.next_bridge)
>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +
>> +		if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>> +			drm_bridge_put(pl->bridge.next_bridge);
>> +			pl->bridge.next_bridge =3D drm_bridge_get(next_bridge);
>> +		}
>
> Can you drop the intermediate next_bridge variable to simplify the code?
>
> -8<-
> if (!pl->bridge.next_bridge) {
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
>
> if (of_property_present(remote, "fsl,companion-pxl2dpi")) {
>         drm_bridge_put(pl->bridge.next_bridge);
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
> -8<-

Potentially calling of_drm_find_and_get_bridge() twice on the same node,
with a put in the middle, looks poorly readable to me, even though it still
looks correct code.

However I think we can do even better with an 'else if':

  if (!pl->bridge.next_bridge) {
         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
         if (!pl->bridge.next_bridge)
                 return -EPROBE_DEFER;
  } else if (of_property_present(remote, "fsl,companion-pxl2dpi")) {   <=3D=
=3D=3D
         drm_bridge_put(pl->bridge.next_bridge);
         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
         if (!pl->bridge.next_bridge)
                 return -EPROBE_DEFER;
  }

Looks OK?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
