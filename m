Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFyDGKfGgWk0JwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:57:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74CDD731D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 10:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FC710E5C5;
	Tue,  3 Feb 2026 09:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mU9qdHWW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A436710E5B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 09:57:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CE4EE4E423E2;
 Tue,  3 Feb 2026 09:57:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 97E0B60728;
 Tue,  3 Feb 2026 09:57:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E4F65119A8891; Tue,  3 Feb 2026 10:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770112671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=vpUZYtj8lQcFWACxWodePAoJiEPpPqkbSTyFbqsxono=;
 b=mU9qdHWWKE+eo0Zsi7eZAjrpFGRvpHW5k0lhFn9bVc0nqSZ8njV6uj3nTuTpi5dvdxiV20
 OSHOGnG14jpx/JPFMD7lFOAnxeKCIXYn90v385S9FDFibD51IQt7KwmdSXaFktkaiNi4MR
 caEqk+uuoPgTzEztRKmEMqnvIbq1HjfKNnlITTybI2DYUge0egxqkLQLD3gFzo0Xfec5Ts
 gRPyXSD57I/Ao6PPpyHGUz2Z9BMjnwNa9gxyXtwFhCpL9LLR7XSYg1O7+E02DAnE0AmaTV
 4u12fcr16fsEGuEOE2tjLTuCH8fmcjvuaFb8ohTUyCgSoL0t0XPiUPtwLnLCJw==
Date: Tue, 3 Feb 2026 10:57:47 +0100
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
Message-ID: <20260203105747.71b71dfa@kmaincent-XPS-13-7390>
In-Reply-To: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
References: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E74CDD731D
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 00:21:19 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> The logicvc_drm_config_parse() function calls of_get_child_by_name() to
> find the "layers" node but fails to release the reference, leading to a
> device node reference leak.
>=20
> Fix this by using the __free(device_node) cleanup attribute to automatic
> release the reference when the variable goes out of scope.
>=20
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller=
")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c
> b/drivers/gpu/drm/logicvc/logicvc_drm.c index 204b0fee55d0..bbebf4fc7f51
> 100644 --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -92,7 +92,6 @@ static int logicvc_drm_config_parse(struct logicvc_drm
> *logicvc) struct device *dev =3D drm_dev->dev;
>  	struct device_node *of_node =3D dev->of_node;
>  	struct logicvc_drm_config *config =3D &logicvc->config;
> -	struct device_node *layers_node;
>  	int ret;
> =20
>  	logicvc_of_property_parse_bool(of_node,
> LOGICVC_OF_PROPERTY_DITHERING, @@ -128,7 +127,8 @@ static int
> logicvc_drm_config_parse(struct logicvc_drm *logicvc) if (ret)
>  		return ret;
> =20
> -	layers_node =3D of_get_child_by_name(of_node, "layers");
> +	struct device_node *layers_node __free(device_node) =3D
> +		of_get_child_by_name(of_node, "layers");

We usualy don't declare variable in the middle of a function.
You should rather simply change the declaration line at the top like this:
struct device_node *layers_node __free(device_node) =3D NULL;

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
