Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LqNDJQWk2nD1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:07:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF80143AC3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 14:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F4A10E052;
	Mon, 16 Feb 2026 13:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XdA74lDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6468B10E052
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 13:07:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1771247244; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MUtVUkjbO3wF62ULoQDCvoti7vkf2UzL/iIpWVg3OeoJYo1+T7R8hiZlZaC7dw/vHTHS/WyFCSHdhaPeKyY5C0muhUJ7X9yBEIqYJrzgP2G57+OV/jkW44YQrylU1owGIFFePMADjRslIfa0Z44QidN6kF/vD5RIfzifVpU+3jI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1771247244;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JGu/7CadCfnI7dq3WybZJKcCnjrFanotW4mbepc0i+8=; 
 b=nSKv8NHV22sUlwg5ny/7rf3YvJpPd04M4U1xXKJjPPHgJhgrqzh63p8uyhpcXFnlFFrdJGC9xUmxQlgxrd36wLUgIXAsAnIFfVTDJmxexqaa49SKAKcB7RmovADE41zaRSKIo/zXKmFkRuYFvLQ4R8+ApIy+QKJb6x/tIx1zt54=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771247244; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=JGu/7CadCfnI7dq3WybZJKcCnjrFanotW4mbepc0i+8=;
 b=XdA74lDT681nugGdLFGw9r8VDO9Nj8sarers1MES3gQXiP2e/UfVCP+hDazo9vm2
 2eYEc4ICdAi6dqZCXAUBLsWMGT9Xjl9EC0ehFtYyhQ4zGdKwuErxwMd6Ro3WGnWMlpR
 JYGHnlnek4/rLDDOoYpkHL14zI1fiL9ParrisucA=
Received: by mx.zohomail.com with SMTPS id 1771247243156433.035940506512;
 Mon, 16 Feb 2026 05:07:23 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except mt8196
Date: Mon, 16 Feb 2026 13:43:19 +0100
Message-ID: <4730819.LvFx2qVVIh@workhorse>
In-Reply-To: <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
References: <20260215100302.136719-1-work@onurozkan.dev>
 <20260216104423.6b5bcc96@fedora>
 <523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:aford173@gmail.com,m:angelogioacchino.delregno@collabora.com,m:work@onurozkan.dev,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:matthias.bgg@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[onurozkan.dev,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,onurozkan.dev:email]
X-Rspamd-Queue-Id: 8DF80143AC3
X-Rspamd-Action: no action

On Monday, 16 February 2026 12:44:39 Central European Standard Time AngeloG=
ioacchino Del Regno wrote:
> Il 16/02/26 10:44, Boris Brezillon ha scritto:
> > Hello Adam,
> >=20
> > On Sun, 15 Feb 2026 16:21:34 -0600
> > Adam Ford <aford173@gmail.com> wrote:
> >=20
> >> On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onurozka=
n.dev> wrote:
> >>>
> >>> If sram-supply is missing, Panthor falls back to a
> >>> dummy regulator with a warning. This implicit behavior
> >>> hides missing DT wiring behind regulator core fallback.

This is intentional design of the regulator API. A missing supply will
always result in a dummy regulator. The _optional function bubbles the
missing supply condition up to the caller.

Catching device trees lacking supplies that are marked as required by
the binding is done with dtbs_check, not at runtime.

> >>>
> >>> Make SRAM handling explicit: require sram-supply for all
> >>> Panthor compatibles except mt8196-mali where GPU supplies
> >>> are intentionally managed outside Panthor and DT does not
> >>> model sram-supply for that compatible.
> >>>
> >>> This keeps DT power modeling explicit and avoids relying on
> >>> dummy-regulator fallback.
> >>>
> >>> Link: https://lore.kernel.org/all/20260213155937.6af75786@nimda/
> >>> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> >>> ---
> >>>   drivers/gpu/drm/panthor/panthor_devfreq.c | 13 +++++++++----
> >>>   1 file changed, 9 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/=
drm/panthor/panthor_devfreq.c
> >>> index 2249b41ca4af..5f6075f18fe3 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> >>> @@ -206,12 +206,17 @@ int panthor_devfreq_init(struct panthor_device =
*ptdev)
> >>>           * But without knowing if it's beneficial or not (in term of=
 power
> >>>           * consumption), or how much it slows down the suspend/resum=
e steps,
> >>>           * let's just keep regulators enabled for the device lifetim=
e.
> >>> +        *
> >>> +        * Treat sram-supply as mandatory except for mt8196-mali. It =
manages
> >>> +        * SRAM outside Panthor so this driver must not require direc=
t control
> >>> +        * over it.
> >>>           */
> >>> -       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> >>> -       if (ret && ret !=3D -ENODEV) {
> >>> -               if (ret !=3D -EPROBE_DEFER)
> >>> +       if (!of_device_is_compatible(dev->of_node, "mediatek,mt8196-m=
ali")) {

If you really need a per-SoC branch then please just store it in the
platform data so we don't have these "of_device_is_compatible" checks
littered throughout the driver.

> >>
> >> I wonder if a more generic device tree flag would be better here.
> >=20
> > No, we don't want it as a separate DT flag. This is all stuff we can
> > hide behind the compat, and every bit we add to the DT we don't
> > strictly need turns out to be a liability in the long run in general.
> >=20
> >> What happens if others do the same as Mediatek or Mediatek decides to
> >> do this with more processors and this list grows?
> >=20
> > That's what panthor_soc_data is for: you can attach per-compat
> > properties without polluting the DT with more stuff that can be
> > directly inferred from the compatible.
> >=20
> >> It seems like a
> >> panthor binding might be useful to prevent future bloat.
> >=20
> > It's actually the opposite, the more we add to the DT, the trickier it
> > gets to maintain, because we tend to get those things wrong (is the
> > SRAM really not needed on mt8196, or is this just a workaround to hide
> > the fact the PM is deferred to some FW?).
> >=20
>=20
> MT8196 has three supplies: core, stack, sram.
>=20
> For example, the Google Rauru Chromebooks use those:
>=20
>         core-supply =3D <&mt6373_vbuck7>;
>         stack-supply =3D <&mt6316dp_vbuck0>;
>         sram-supply =3D <&mt6316kp_vbuck1>;
>=20
> As of now (in our midstream trees), these supplies are declared in the gp=
ufreq
> node (the performance domain controller), and required to be on whenever =
GPUEB
> interaction is needed, other than whenever the GPU itself is, well, neede=
d to
> be powered.
>=20
> As of the current model, these supplies are getting powered on and off al=
ong
> with the MFG power domain.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005
>=20
> I'm not sure what happens if we also add those to the GPU node... for thi=
s, I'm
> adding Nicolas to the Ccs, as he is the one who developed support for EB.

=46airly sure they need to be on as part of any of the operations the MFG s=
tuff
does, but I also am not 100% sure on this because I didn't take notes at the
time.

Either way, this patch shouldn't exist, it doesn't do anything useful, as a
missing supply from the DT can be caught with `make dtbs_check`. It does not
need to be booted on each device to then have the driver abort probe at run=
time.

>=20
> Cheers,
> Angelo
>=20
> > Regards,
> >=20
> > Boris
>=20
>=20
>=20




