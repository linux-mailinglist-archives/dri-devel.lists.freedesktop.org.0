Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAeIHcA1gmnZQgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:52:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D5DD217
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 18:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A53910E326;
	Tue,  3 Feb 2026 17:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="otFZ80fj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6F610E326
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 17:51:54 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BC74C4E423E4;
 Tue,  3 Feb 2026 17:51:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8C41760728;
 Tue,  3 Feb 2026 17:51:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4AAB119A8888; Tue,  3 Feb 2026 18:51:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770141111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=1xdZ/OSFUvAxKiBQgdcMhIY4/A3/12i5aPJKLBIc3FQ=;
 b=otFZ80fjX9UqRfcI9+MjBeKuolSOj6WASNsmJaNDZamNVbA4JHcEtRFVo0cTwme3yxqTWi
 e+4iy5M40vGHjfyxzGrIuadsekZif2cu5URUkrx5oI2YPtS3xIFPN4KV28SpB4OKtFy3iJ
 /JnZxBHwZtk5hRMD9hARxjXsdqp5Vgfnij8D4q7/4T5iEv0VOfBLnmnFVVudR0QXICdm3c
 OwnLlpssyqWD/17FLm26TwvXGX6MakxtuibOI+N+E1bzFvLVZDxmSnzIz1Oc4U58A3GkkS
 hFCHHV24hkxzjnXqmSiaA6HHqU3kB1MQ66kCK8CRHMCm9ALJqg2+UV8EIAFaxg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 18:51:47 +0100
Message-Id: <DG5INIQWWPJV.31PV8URRWUZF6@bootlin.com>
Subject: Re: [PATCH] drm/logicvc: Fix device node reference leak in
 logicvc_drm_config_parse()
Cc: "Paul Kocialkowski" <paulk@sys-base.io>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Paul Kocialkowski"
 <paul.kocialkowski@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Kory Maincent" <kory.maincent@bootlin.com>, "Felix Gu" <ustc.gu@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260130-logicvc_drm-v1-1-04366463750c@gmail.com>
 <20260203105747.71b71dfa@kmaincent-XPS-13-7390>
 <20260203143531.1ab9a19c@kmaincent-XPS-13-7390>
In-Reply-To: <20260203143531.1ab9a19c@kmaincent-XPS-13-7390>
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
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:paulk@sys-base.io,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:paul.kocialkowski@bootlin.com,m:linux-kernel@vger.kernel.org,m:kory.maincent@bootlin.com,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[sys-base.io,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Queue-Id: 7E1D5DD217
X-Rspamd-Action: no action

On Tue Feb 3, 2026 at 2:35 PM CET, Kory Maincent wrote:
> On Tue, 3 Feb 2026 10:57:47 +0100
> Kory Maincent <kory.maincent@bootlin.com> wrote:
>
>> On Fri, 30 Jan 2026 00:21:19 +0800
>> Felix Gu <ustc.gu@gmail.com> wrote:
>>
>> > The logicvc_drm_config_parse() function calls of_get_child_by_name() t=
o
>> > find the "layers" node but fails to release the reference, leading to =
a
>> > device node reference leak.
>> >
>> > Fix this by using the __free(device_node) cleanup attribute to automat=
ic
>> > release the reference when the variable goes out of scope.
>> >
>> > Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display control=
ler")
>> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>> > ---
>> >  drivers/gpu/drm/logicvc/logicvc_drm.c | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c
>> > b/drivers/gpu/drm/logicvc/logicvc_drm.c index 204b0fee55d0..bbebf4fc7f=
51
>> > 100644 --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
>> > +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
>> > @@ -92,7 +92,6 @@ static int logicvc_drm_config_parse(struct logicvc_d=
rm
>> > *logicvc) struct device *dev =3D drm_dev->dev;
>> >  	struct device_node *of_node =3D dev->of_node;
>> >  	struct logicvc_drm_config *config =3D &logicvc->config;
>> > -	struct device_node *layers_node;
>> >  	int ret;
>> >
>> >  	logicvc_of_property_parse_bool(of_node,
>> > LOGICVC_OF_PROPERTY_DITHERING, @@ -128,7 +127,8 @@ static int
>> > logicvc_drm_config_parse(struct logicvc_drm *logicvc) if (ret)
>> >  		return ret;
>> >
>> > -	layers_node =3D of_get_child_by_name(of_node, "layers");
>> > +	struct device_node *layers_node __free(device_node) =3D
>> > +		of_get_child_by_name(of_node, "layers");
>>
>> We usualy don't declare variable in the middle of a function.
>> You should rather simply change the declaration line at the top like thi=
s:
>> struct device_node *layers_node __free(device_node) =3D NULL;
>
> It seems Linus disagree on this topic and I understand his arguments:
> https://lore.kernel.org/all/CAHk-=3DwhPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztC=
dgPWP1WA@mail.gmail.com/
> https://lore.kernel.org/all/CAHk-=3DwiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQ=
HS_TkF5A@mail.gmail.com/

I agree it makes code much more readable, espacially in the case of cleanup
actions.

> Then, ok to me:
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thanks! I'm applying this patch to drm-misc-fixes perhaps next week.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
