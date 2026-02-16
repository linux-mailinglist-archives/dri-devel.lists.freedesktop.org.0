Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHuLILonk2kI2AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:20:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDA21447D8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 15:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3C910E12B;
	Mon, 16 Feb 2026 14:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lv7OKuFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C348410E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 14:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1771251635;
 bh=LpONIyurVKlNTOn/3d2FZntrtRRFlJmchmd0RLMCFp4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lv7OKuFvFLoZjW/iPvVCHfLw3yaZpQvkh3sCrud39qbidVRk2kcy4bj8BV9HimpzH
 WdoT65tJex7/y9zX1hnnbFB4PSh+wY7U2a2FhWurd81XyuRCidjy/cd6PtuCtRDOOc
 9r2lwRDOBLwVoZHRTDcR2h+aGJ8UREz9vDQUIcy5/zJ6mud4XH9Ddbh4kMCC2R5/aY
 MfzL7UuvaCA+TpZACzGQ6t8xBAi6Uz8ze2ejrhIkjlYCCrYectziG458moo1lBNsXZ
 D3nuoqoOCfZfxAyulNvByrAtqFoeRgds6/BGcv3P1Bom4ePkeAjvqY92+C2sj4Gfd8
 qIuFqm7x6OCkw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C40E917E0454;
 Mon, 16 Feb 2026 15:20:34 +0100 (CET)
Date: Mon, 16 Feb 2026 15:20:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Adam Ford
 <aford173@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Onur =?UTF-8?B?w5Z6a2Fu?=
 <work@onurozkan.dev>, Steven Price <steven.price@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Message-ID: <20260216152030.5f91104e@fedora>
In-Reply-To: <aZMiv7ARO4TUSUTa@e142607>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260216104423.6b5bcc96@fedora>
 <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
 <4730819.LvFx2qVVIh@workhorse> <aZMiv7ARO4TUSUTa@e142607>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:liviu.dudau@arm.com,m:nicolas.frattaroli@collabora.com,m:aford173@gmail.com,m:angelogioacchino.delregno@collabora.com,m:work@onurozkan.dev,m:steven.price@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:krzk+dt@kernel.org,m:broonie@kernel.org,m:matthiasbgg@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,gmail.com,onurozkan.dev,arm.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[onurozkan.dev:email,collabora.com:dkim]
X-Rspamd-Queue-Id: CDDA21447D8
X-Rspamd-Action: no action

Hi Liviu,

On Mon, 16 Feb 2026 13:59:27 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, Feb 16, 2026 at 01:43:19PM +0100, Nicolas Frattaroli wrote:
> > On Monday, 16 February 2026 12:44:39 Central European Standard Time Ang=
eloGioacchino Del Regno wrote: =20
> > > Il 16/02/26 10:44, Boris Brezillon ha scritto: =20
> > > > Hello Adam,
> > > >=20
> > > > On Sun, 15 Feb 2026 16:21:34 -0600
> > > > Adam Ford <aford173@gmail.com> wrote:
> > > >  =20
> > > >> On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onur=
ozkan.dev> wrote: =20
> > > >>>
> > > >>> If sram-supply is missing, Panthor falls back to a
> > > >>> dummy regulator with a warning. This implicit behavior
> > > >>> hides missing DT wiring behind regulator core fallback. =20
> >=20
> > This is intentional design of the regulator API. A missing supply will
> > always result in a dummy regulator. The _optional function bubbles the
> > missing supply condition up to the caller.
> >=20
> > Catching device trees lacking supplies that are marked as required by
> > the binding is done with dtbs_check, not at runtime. =20
>=20
> I'm replying to this thread while I'm also trying to cover some discussio=
n in the
> DT patch series.
>=20
> What we're trying to solve is this: the Mali GPUs have an L2$+bits power =
domain
> that in upstream ended up being called 'sram' for reasons. The domain is =
important
> both for ultimate power savings (you can turn off most of the other GPU d=
omains
> and preserve enough state for the GPU to wake up on an interrupt) and for=
 normal
> operations, for obvious reasons. Now, vendors either don't bother to put a
> separate domain just for "sram" or go to the extreme of handing over cont=
rol over
> that domain to an MCU that implements aggresive and system-wide policies.=
 We're
> trying to cater for all cases, include the (currently hypotetical) one wh=
ere you
> have a separate "sram" power domain that Linux can control.
>=20
> When we have first upstreamed the bindings, inspired by Panfrost driver, =
we have
> added the sram-supply as mandatory which I think is turning out to be a m=
istake.
> Prompted by Mark Brown's reply[1] to Tyr adding 'sram-supply' as an optio=
nal
> property, Onur has started this and the DT patch series[2] to enforce the=
 presence
> of an 'sram-supply' to reduce the number of warnings in dtbs_check. In re=
ality
> what we are enforcing is a dummy supply that is the same as the one the G=
PU is using
> because most of the systems don't have a specific one.
>=20
> So the problem we have is: do we change the upstream binding and make 'sr=
am-supply'
> optional for every compatible string given that it is unlikely to be prov=
ided (and
> the code did not enforce it in panthor_devfreq.c anyway from the beginnin=
g), or
> do we accept that this power domain is important but usually not specifie=
d and we
> go with the current DT patch series that provides one?

My main worry with this approach is that SoC/board bring-up tends to be
an iterative process in practice, and it usually starts with a
bunch of resources forcibly enabled (either in the bootloader
or directly in Linux) because that's easy. Problem is, that's also very
easy to forget defining non-optional resources when the dts[i] is
upstreamed, because everything seems to work just fine. And because of
this DT backward-compat constraint, if get it wrong, and the supply is
needed for real, when we get to implement the real thing we're just
screwed. Having a runtime error preventing the device to probe forces
people to at least think twice before doing something stupid, like
making the SRAM (or L2-cache) supply point to the core supply when they
are two distinct regulator outputs.

Regards,

Boris
