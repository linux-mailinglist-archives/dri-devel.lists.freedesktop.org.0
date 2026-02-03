Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC8CFq75gWk7NQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:35:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A3D9EEC
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ABC10E652;
	Tue,  3 Feb 2026 13:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UuWjXHa5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5761F10E652
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:35:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 059234E42365;
 Tue,  3 Feb 2026 13:35:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CC64C60728;
 Tue,  3 Feb 2026 13:35:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D70B119A8888; Tue,  3 Feb 2026 14:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770125736; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=9X4/c3afNW5z4imlA1v5TGJeAloy0wWUIb+4tbtByFA=;
 b=UuWjXHa53fHUVjL8pw0KR03dFJwO/9nROEdEzMUpA7u11KgqLwGivxH4WnkmUCu7YNu1QM
 8699s0aUgQ1YbuRJwKW4v92p2yxFq1N5joFnI9OAHBt0NvE+u4TygvrfgnMu4+PlFYB24j
 Ml2dA8+9jKfoVJCSOF/1+SuoASmBk+F6SroNI83C4+4KABzl/U0ayQ7Pdz3LSh0xb1YNUF
 Za+n7ljBVY+fRdQ5QOj83P3MLKcrOB5EsbAMaSAEB4UIidIf+YUx6npd1Q7+Apr91VoHa5
 /aXsT+jubba+VPCuHe6VKJrFalSJBOGOk5BjUrDeOnLnFLoSIvBL+55skraGuw==
Date: Tue, 3 Feb 2026 14:35:31 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/logicvc: Fix device node reference leak in
 logicvc_drm_config_parse()
Message-ID: <20260203143531.1ab9a19c@kmaincent-XPS-13-7390>
In-Reply-To: <20260203105747.71b71dfa@kmaincent-XPS-13-7390>
References: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
 <20260203105747.71b71dfa@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:paulk@sys-base.io,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:paul.kocialkowski@bootlin.com,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[kory.maincent@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[sys-base.io,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AF7A3D9EEC
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 10:57:47 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> On Fri, 30 Jan 2026 00:21:19 +0800
> Felix Gu <ustc.gu@gmail.com> wrote:
>=20
> > The logicvc_drm_config_parse() function calls of_get_child_by_name() to
> > find the "layers" node but fails to release the reference, leading to a
> > device node reference leak.
> >=20
> > Fix this by using the __free(device_node) cleanup attribute to automatic
> > release the reference when the variable goes out of scope.
> >=20
> > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controll=
er")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/gpu/drm/logicvc/logicvc_drm.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c
> > b/drivers/gpu/drm/logicvc/logicvc_drm.c index 204b0fee55d0..bbebf4fc7f51
> > 100644 --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> > @@ -92,7 +92,6 @@ static int logicvc_drm_config_parse(struct logicvc_drm
> > *logicvc) struct device *dev =3D drm_dev->dev;
> >  	struct device_node *of_node =3D dev->of_node;
> >  	struct logicvc_drm_config *config =3D &logicvc->config;
> > -	struct device_node *layers_node;
> >  	int ret;
> > =20
> >  	logicvc_of_property_parse_bool(of_node,
> > LOGICVC_OF_PROPERTY_DITHERING, @@ -128,7 +127,8 @@ static int
> > logicvc_drm_config_parse(struct logicvc_drm *logicvc) if (ret)
> >  		return ret;
> > =20
> > -	layers_node =3D of_get_child_by_name(of_node, "layers");
> > +	struct device_node *layers_node __free(device_node) =3D
> > +		of_get_child_by_name(of_node, "layers"); =20
>=20
> We usualy don't declare variable in the middle of a function.
> You should rather simply change the declaration line at the top like this:
> struct device_node *layers_node __free(device_node) =3D NULL;

It seems Linus disagree on this topic and I understand his arguments:
https://lore.kernel.org/all/CAHk-=3DwhPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdg=
PWP1WA@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=3DwiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS=
_TkF5A@mail.gmail.com/

Then, ok to me:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
