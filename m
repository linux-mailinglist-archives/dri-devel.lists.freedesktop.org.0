Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WC1iBD0/fmk6WgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 18:43:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8FC3635
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jan 2026 18:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CB810E0E5;
	Sat, 31 Jan 2026 17:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SJMrMNct";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA14710E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jan 2026 17:43:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 16D591A2B5F;
 Sat, 31 Jan 2026 17:43:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CA50E606B6;
 Sat, 31 Jan 2026 17:43:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 472E9119A888D; Sat, 31 Jan 2026 18:43:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769881397; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+0GLAxiMOsLVdd68D5Q5jgpRId3SxU0Ogg0V46Yapj0=;
 b=SJMrMNctuR74wAN8d4z0NJzEOlaGLF1diXKFZ5u1qknb7SE9NOGtn8mUGXpYpQvfDYtdeR
 Zbx6nd1axeg5Aoze4vT/4lnKT+ZC4qxC2FpFj7h+1o2LxxUj/7seU8u1leoz1PWioDNpzU
 6k0hOqGHR/CHDUsXeEwYmj9yxTfS9F7E3EIVNVWB2zX3FLZojA5jQnIAOusXd1Fox40j0k
 lOFxwTi3ls00YGrvWActsK5XmsiCv/rxtvGmexbrfInrtdcZVHYMpnCnTx9f+nFPRFoz4j
 dPwItRhhKdKhrWIU8wFOi1ekIvo3hsuK+SHh1cYbvFQqnpvN33/aAK7+QtkszQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 18:43:08 +0100
Message-Id: <DG2YL94N216P.31GDSWQ0OD1PT@bootlin.com>
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
 <DFYQ7TS25SQT.2F7NBYOP8P5R4@bootlin.com>
 <efeb3583-dd0c-4e91-bbfc-54b04644f2c2@nxp.com>
 <DG0CHD0TAH9A.27UW4KKY2O9V7@bootlin.com>
 <d0836d04-d15d-45de-a765-bacad9e7759a@nxp.com>
 <aff6f95e-abdc-4253-8724-eec4a98bb268@nxp.com>
In-Reply-To: <aff6f95e-abdc-4253-8724-eec4a98bb268@nxp.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Hui.Pu@gehealthcare.com,m:thomas.petazzoni@bootlin.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:victor.liu@nxp.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 68D8FC3635
X-Rspamd-Action: no action

On Thu Jan 29, 2026 at 9:18 AM CET, Liu Ying wrote:
>
>
> On Thu, Jan 29, 2026 at 03:49:38PM +0800, Liu Ying wrote:
>>
>>
>> On Wed, Jan 28, 2026 at 04:58:18PM +0100, Luca Ceresoli wrote:
>>> On Tue Jan 27, 2026 at 4:54 AM CET, Liu Ying wrote:
>>>
>>> ...
>>>
>>>>>>> @@ -260,7 +259,7 @@ static int imx8qxp_pixel_link_find_next_bridge(=
struct imx8qxp_pixel_link *pl)
>>>>>>>  {
>>>>>>>  	struct device_node *np =3D pl->dev->of_node;
>>>>>>>  	struct device_node *port;
>>>>>>> -	struct drm_bridge *selected_bridge =3D NULL;
>>>>>>> +	struct drm_bridge *selected_bridge __free(drm_bridge_put) =3D NUL=
L;
>>>>>>>  	u32 port_id;
>>>>>>>  	bool found_port =3D false;
>>>>>>>  	int reg;
>>>>>>> @@ -297,7 +296,8 @@ static int imx8qxp_pixel_link_find_next_bridge(=
struct imx8qxp_pixel_link *pl)
>>>>>>>  			continue;
>>>>>>>  		}
>>>>>>>
>>>>>>> -		struct drm_bridge *next_bridge =3D of_drm_find_bridge(remote);
>>>>>>> +		struct drm_bridge *next_bridge __free(drm_bridge_put) =3D
>>>>>>> +			of_drm_find_and_get_bridge(remote);
>>>>>>>  		if (!next_bridge)
>>>>>>>  			return -EPROBE_DEFER;
>>>>>>>
>>>>>>> @@ -305,12 +305,14 @@ static int imx8qxp_pixel_link_find_next_bridg=
e(struct imx8qxp_pixel_link *pl)
>>>>>>>  		 * Select the next bridge with companion PXL2DPI if
>>>>>>>  		 * present, otherwise default to the first bridge
>>>>>>>  		 */
>>>>>>> -		if (!selected_bridge || of_property_present(remote, "fsl,compani=
on-pxl2dpi"))
>>>>>>> -			selected_bridge =3D next_bridge;
>>>>>>> +		if (!selected_bridge || of_property_present(remote, "fsl,compani=
on-pxl2dpi")) {
>>>>>>> +			drm_bridge_put(selected_bridge);
>>>>>>> +			selected_bridge =3D drm_bridge_get(next_bridge);
>>>>>>
>>>>>> Considering selecting the first bridge without the companion pxl2dpi=
,
>>>>>> there would be a superfluous refcount for the selected bridge:
>>>>>>
>>>>>> 1) of_drm_find_and_get_bridge: refcount =3D 1
>>>>>> 2) drm_bridge_put: noop, since selected_bridge is NULL, refcount =3D=
 1
>>>>>> 3) drm_bridge_get: refcount =3D 2
>>>>>> 4) drm_bridge_put(__free): refcount =3D 1
>>>>>> 5) drm_bridge_get: for the pl->bridge.next_bridge, refcount =3D 2
>>>>>
>>>>> Here you are missing one put. There are two drm_bridge_put(__free), o=
ne for
>>>>> next_bridge and one for selected_bridge. So your list should rather b=
e:
>>>>>
>>>>> 1) next_bridge =3D of_drm_find_and_get_bridge: refcount =3D 1
>>>>> 2) drm_bridge_put(selected_bridge): noop, since selected_bridge is NU=
LL, refcount =3D 1
>>>>> 3) selected_bridge =3D drm_bridge_get: refcount =3D 2
>>>>> 4) drm_bridge_put(next_bridge) [__free at loop scope end]: refcount =
=3D 1
>>>>> 5) pl->bridge.next_bridge =3D drm_bridge_get(), refcount =3D 2
>>>>> 6) drm_bridge_put(selected_bridge) [__free at function scope end]: re=
fcount =3D 1
>>>>
>>>> Ah, right, I did miss this last put because selected_bridge is declare=
d with
>>>> __free a bit far away from the loop at the very beginning of
>>>> imx8qxp_pixel_link_find_next_bridge() - that's my problem I guess, but=
 I'm
>>>> not even sure if I'll fall into this same pitfall again after a while,=
 which
>>>> makes the driver difficult to maintain.
>>>>
>>>> Also, it seems that the refcount dance(back and forth bewteen 1 and 2)=
 is not
>>>> something straightforward for driver readers to follow.
>>>
>>> I thing the whole logic becomes straightforward if you think it this wa=
y:
>>>
>>>  * when a pointer is assigned =3D a new reference starts existing -> re=
fcount++
>>>  * when a pointer is cleared/overwritten or goes out of scope =3D a ref=
erence
>>>    stops existing -> refcount--
>>>
>>> In short: one pointer, one reference, one refcount.
>>>
>>> If you re-read the patch with this in mind, does it become clearer?
>>
>> Thanks for more explaination, maybe it becomes a bit clearer, I'm not su=
re:/
>>
>> Anyway, to simplify things with another try, I came up with the below
>> snippet in that loop, which drops the two intermediate bridges(local
>> next_bridge and selected_bridge) and uses pl->next_bridge only.
>
> Fix a typo:
> s/pl->next_bridge/pl->bridge.next_bridge/
>
>> It looks ok to me(at least, refcount dance is much simpler).
>>
>> -8<-
>> if (!pl->next_bridge || of_property_present(remote, "fsl,companion-pxl2d=
pi")) {
>>         drm_bridge_put(pl->next_bridge);
>>         pl->next_bridge =3D of_drm_find_and_get_bridge(remote);
>>         if (!pl->next_bridge)
>>                 return -EPROBE_DEFER;
>> }
>> -8<-
>
> -8<-
> if (!pl->bridge.next_bridge || of_property_present(remote, "fsl,companion=
-pxl2dpi")) {
>         drm_bridge_put(pl->bridge.next_bridge);
>         pl->bridge.next_bridge =3D of_drm_find_and_get_bridge(remote);
>         if (!pl->bridge.next_bridge)
>                 return -EPROBE_DEFER;
> }
> -8<-

It's OK enough, so in v5 I'm going to split the if() and skip the
intermediate selected_bridge variable.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
