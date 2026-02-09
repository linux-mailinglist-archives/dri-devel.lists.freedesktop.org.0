Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOgFKf7ViWnYCAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:41:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E610EDB1
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 13:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A4610E3D2;
	Mon,  9 Feb 2026 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Le1n5iQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CEE10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 12:41:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B0E49C250FF;
 Mon,  9 Feb 2026 12:41:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCDEB6074B;
 Mon,  9 Feb 2026 12:41:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1B51A119D2205; Mon,  9 Feb 2026 13:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770640887; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cSsgQvh8THNhGe6nGgOwd+lN5eH/AP6yL+drDBDmWyk=;
 b=Le1n5iQ0reY9YFSYi/FycKd5tr5b+CMHeQClTeemnOBSMFvPOmJ25hZwn2MMAFYsZNNR1V
 z5i9fAw6jSC1ICG6D3l+ehR1cX6Ptoz4pJ3t0HFCh8WCll8xM75HhHXRGNiXP9xAwRQDmF
 2yxmpT4WMc8xMxbLC8STL0bsOhhLA2LdJWX46oBvczGmeNbdbSbkmFzLOIYXP4eQLAGUB1
 Sb3ophmiRX6hoCeWOYcqwi5F6lKy+62E1608DY+qB7qw4mUxDMZAs1xy+JjRZmVYXtZWJl
 1v1UjmW0TZwsgm0ozpR2wbVMY64PjZ3iWIjD5iS11+xL2l7T+Ucd7U8mtQGBqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 13:41:21 +0100
Message-Id: <DGAFT3L8L5DO.FU8O3M5KTJ40@bootlin.com>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix memory leak in error path
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260207183721.43087-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260207183721.43087-1-osama.abdelkader@gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:osama.abdelkader@gmail.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:osamaabdelkader@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 089E610EDB1
X-Rspamd-Action: no action

Hello Osama,

On Sat Feb 7, 2026 at 7:37 PM CET, Osama Abdelkader wrote:
> In samsung_dsim_host_attach(), drm_bridge_add() is called to add the
> bridge. However, if samsung_dsim_register_te_irq() or
> pdata->host_ops->attach() fails afterwards, the function returns
> without removing the bridge, causing a memory leak.
>
> Fix this by adding proper error handling with goto labels to ensure
> drm_bridge_remove() is called in all error paths. Also ensure that
> samsung_dsim_unregister_te_irq() is called if the attach operation
> fails after the TE IRQ has been registered.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Good catch!

However being a fix you need a 'Fixes:' line pointing to the first commit
where hte bug exists. At a quick search it looks like f9bfd326f57e, but
please double check that. And with a Fixes tag you need Cc: stable, see the
docs [0].

> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1881,6 +1881,8 @@ static int samsung_dsim_register_te_irq(struct sams=
ung_dsim *dsi, struct device
>  	return 0;
>  }
>
> +static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi);

Please don't add a forward declaration. Just move
samsung_dsim_unregister_te_irq() function earlier, perhaps right here. Also
mention in the commit message that you have just moved it without changes,
to help reviewers: unfortunately code being moved it not very well
visualized in a diff.

Otherwise looks good!

It would be great if you please add me in Cc for future patches to this
driver. I'm using and touching it [1][2] so I'd like to review patches
touching it. Thanks!

[0] https://docs.kernel.org/process/stable-kernel-rules.html
[1] https://lore.kernel.org/lkml/20260109-drm-bridge-alloc-getput-drm_of_fi=
nd_bridge-2-v2-0-8bad3ef90b9f@bootlin.com/
[2] https://lore.kernel.org/lkml/20260206-drm-bridge-atomic-vs-remove-clear=
_and_put-v1-2-6f1a7d03c45f@bootlin.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
