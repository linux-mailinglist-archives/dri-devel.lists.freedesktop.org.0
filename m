Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEEQJALnkmlSzwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:44:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7B9142083
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 10:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A9C10E0D3;
	Mon, 16 Feb 2026 09:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FEiCZYIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7189210E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771235068;
 bh=ZmNpag6GBURIks4wmS3ojXtnwZVF30mG5EnZSm/42mM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FEiCZYIl0PM2WOaah9nVZrSvsCdSKwKNLfCD+UYJF/IgEmZSmsyUdvPWNVRDhU6Zz
 HLsdZID4K3bLcl7wVOEEePR+PyIjUjxlMBD0O3/F8GBitCJBvH/FnLWm3MfuAAKwDF
 2Hv3MiIVwzGLbxx+GyPk4Lr32zrHmgTbMz/3mO03RuvUyxlvHxAJhaRAFUgPTWZWlb
 yfO9tJEmjxotzi7TjCN904iA+CEiy1ytTOZJB0yGTK/v52v4NPe8v50fAQ+frMwPrE
 rKvgD4+TyXe7CCkD/iA9MRiuNLFjHwpToTbnBKSzL9CZ1ZYNjsC6vpOFtE7j3GWGM+
 YjCjTxQghzd0A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8841A17E137B;
 Mon, 16 Feb 2026 10:44:27 +0100 (CET)
Date: Mon, 16 Feb 2026 10:44:23 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adam Ford <aford173@gmail.com>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Message-ID: <20260216104423.6b5bcc96@fedora>
In-Reply-To: <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260215100302.136719-2-work@onurozkan.dev>
 <CAHCN7xJJgLxPSf0QJ9nvY4Z3BguDmYJtpeprT+obD5DgA8rOgQ@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:aford173@gmail.com,m:work@onurozkan.dev,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[onurozkan.dev,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: EF7B9142083
X-Rspamd-Action: no action

Hello Adam,

On Sun, 15 Feb 2026 16:21:34 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.d=
ev> wrote:
> >
> > If sram-supply is missing, Panthor falls back to a
> > dummy regulator with a warning. This implicit behavior
> > hides missing DT wiring behind regulator core fallback.
> >
> > Make SRAM handling explicit: require sram-supply for all
> > Panthor compatibles except mt8196-mali where GPU supplies
> > are intentionally managed outside Panthor and DT does not
> > model sram-supply for that compatible.
> >
> > This keeps DT power modeling explicit and avoids relying on
> > dummy-regulator fallback.
> >
> > Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> > ---
> >  drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/dr=
m/panthor/panthor_devfreq.c
> > index 2249b41ca4af..5f6075f18fe3 100644
> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device *p=
tdev)
> >          * But without knowing if it's beneficial or not (in term of po=
wer
> >          * consumption), or how much it slows down the suspend/resume s=
teps,
> >          * let's just keep regulators enabled for the device lifetime.
> > +        *
> > +        * Treat sram-supply as mandatory except for mt8196-mali. It ma=
nages
> > +        * SRAM outside Panthor so this driver must not require direct =
control
> > +        * over it.
> >          */
> > -       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> > -       if (ret && ret !=3D -ENODEV) {
> > -               if (ret !=3D -EPROBE_DEFER)
> > +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-mal=
i")) { =20
>=20
> I wonder if a more generic device tree flag would be better here.

No, we don't want it as a separate DT flag. This is all stuff we can
hide behind the compat, and every bit we add to the DT we don't
strictly need turns out to be a liability in the long run in general.

> What happens if others do the same as Mediatek or Mediatek decides to
> do this with more processors and this list grows?

That's what panthor_soc_data is for: you can attach per-compat
properties without polluting the DT with more stuff that can be
directly inferred from the compatible.

> It seems like a
> panthor binding might be useful to prevent future bloat.

It's actually the opposite, the more we add to the DT, the trickier it
gets to maintain, because we tend to get those things wrong (is the
SRAM really not needed on mt8196, or is this just a workaround to hide
the fact the PM is deferred to some FW?).

Regards,

Boris
