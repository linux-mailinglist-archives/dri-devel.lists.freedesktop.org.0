Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JdgNjArd2nacwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:52:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 479AC859CF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 09:52:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FA610E10F;
	Mon, 26 Jan 2026 08:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QedPXVXD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0643F10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 08:51:58 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D39E3C225BF;
 Mon, 26 Jan 2026 08:51:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45F5960717;
 Mon, 26 Jan 2026 08:51:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C0EF6119A80E2; Mon, 26 Jan 2026 09:51:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769417515; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=YoimUg/B3WMdwPjCRvv8ClMn1Rr3hFGXgkVjA9JOOIg=;
 b=QedPXVXDwD6tu/9yJqyZ7TIZOoQUoEcFq8esUex1XnWQ/7sm1bFOA2z39idJnnow/kk7jh
 4bX3+4Bql4HHg0wqoLaFx8rcPJlzoP4Ec7NI8I1sc3nY7unHATPwtp81uuyUwggtYUNuVF
 I11hqr3BcWARPJ5sA2i+jelLE8m0w/eeN3y3bC4ZDSuxCIlAw/aivEBPr+4u20+WMlshVO
 qfnQreqggUqpQoXr5MSEXcPPNYDOPot6IY7nWQSIqHWMNv8qoIQB16jWyOB9bin6jWH+x+
 jXD8zr35RSom94S4/PC3dmjDMKQYOvxdKgb5Wjd4Lu4JkspNxzPyBAQyrPRTmg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 09:51:49 +0100
Message-Id: <DFYE5QDGOF28.2S7XJ1IFZIMX0@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
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
Subject: Re: [PATCH 3/3] drm/bridge: imx8qxp-pixel-combiner: Fix bailout for
 imx8qxp_pc_bridge_probe()
X-Mailer: aerc 0.20.1
References: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
 <20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com>
 <DFYDRSZBQBND.QSY119QND1GE@bootlin.com>
 <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
In-Reply-To: <42f86084-5200-4dc0-86a7-4719d7d19cf7@nxp.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,pengutronix.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 479AC859CF
X-Rspamd-Action: no action

On Mon Jan 26, 2026 at 9:47 AM CET, Liu Ying wrote:
>
>
> On Mon, Jan 26, 2026 at 09:33:38AM +0100, Luca Ceresoli wrote:
>> On Fri Jan 23, 2026 at 10:22 AM CET, Liu Ying wrote:
>>> In case the channel0 is unavailable and bailing out from free_child is
>>> needed when we fail to add a DRM bridge for the available channel1,
>>> pointer pc->ch[0] in the bailout path would be NULL and it would be
>>> dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
>>> pc->ch[0] before dereferencing it.
>>
>> Thanks for checking this code and providing fixes! These drivers have a
>> complex code path so I had a hard time in following the logic without ne=
ing
>> able to test on hardware. Apologies for the issues emerged.
>
> Thanks for your quick review and hard work!
>
>>
>>> Fixes: ae754f049ce1 ("drm/bridge: imx8qxp-pixel-combiner: get/put the n=
ext bridge")
>>> Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to de=
vm_drm_bridge_alloc() API")
>>
>> The bug was introduced by 99764593528f, while ae754f049ce1 is not changi=
ng
>> the bug, so for the sake of precision we can remove the first 'Fixes:'
>> line.
>
> I added Fixes tag for ae754f049ce1 because it is the first commit which
> this commit could be applied upon properly.  Maybe this helps some tools
> apply this commit or maybe tools are smart enough to find ae754f049ce1
> automatically?

Uhm, good point, maybe it can be a useful reference for the stable team to
backport the fix... Well, let's leave both lines then:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I'm applying this series perhaps tomorrow (if no one does it before).

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
