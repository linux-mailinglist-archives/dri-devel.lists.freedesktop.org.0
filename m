Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHdrHGAKcmmOagAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:30:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E140C66030
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 12:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B13510E985;
	Thu, 22 Jan 2026 11:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="Vz79PtSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C815C10E985
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 11:30:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769081434; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MtiHHIZYQUeCCYK1Vw+l3qYJ/cihtcyfKVG7igKL8pUW0pRICdGl4yONRbLcu1ZSBN+2SB0gwYQfXu+Szw09anRgVTldOpAl3MhD/kxRGWL+Nbb81363Vkk9F+6nYYoG8aPsw7ERcZMDn8+Nt8lrcZL4hJoVwgu2oAGe0gUhdlk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769081434;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=vs335ZT7EhWZfxxjTxl6JBDq5jVuuj9XZAER/sv59EM=; 
 b=Osy3BRq/nlLS8mi3Fto69HEEONzZ5iUMHmEeqnNnGeyFl2NawclAatZcP3lAMqmb/bSxY8qaybB5Lpn3ZcXIYBwLR5eq7Mtax73GON2EWhsyg8HliWqn1GVny5VtZWy+1tbixuzHg8vqq7oMgAYwMwWpgxENrdPy+qpFWSfF3Eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769081434; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=vs335ZT7EhWZfxxjTxl6JBDq5jVuuj9XZAER/sv59EM=;
 b=Vz79PtSUcLr7Mnt7C0I/xCT8Im9ctOIrfePxw7pyZdgfqflY1qgNi3rRyujPIAVV
 bkXqA6rO+3de5H62Gto5FwD39gc860c3MS7pZxuFgi3PeUe8dU5PcGaG7iWN6WDkG0Z
 uSg4+0U8Uz0YvRM0zKLPKcY+YwnpxxRpk/0L9kMlwOUCuIni7rVZrwfvi0MQlojT/B1
 V0XeORaiA70Hw78ZphFKgCijMRvBQkub6/p2WYef7HnlkirqPcrnTUB7N8Pmdv36QvH
 cYUspeBjkrKCBsp6uEX2duEJgbrlM/LpjHaTmb+TSKs9JpAAkZhx1lUzHdXb4U1SlpA
 0Nd20mncHA==
Received: by mx.zohomail.com with SMTPS id 1769081432999180.9632440094016;
 Thu, 22 Jan 2026 03:30:32 -0800 (PST)
Message-ID: <a49102edf09d26a885c02b206ff8f02aefcd9f29.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 19:30:14 +0800
In-Reply-To: <5fc5439b-ef21-416a-90fe-07f0d21de87d@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
 <0eb4b6ba8ef3b47cd28eb8d652b05eb5a6d1409c.camel@icenowy.me>
 <5fc5439b-ef21-416a-90fe-07f0d21de87d@suse.de>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icenowy.me,none];
	R_DKIM_ALLOW(-0.20)[icenowy.me:s=zmail2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:gaohan@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,ffwll.ch,redhat.com];
	FORGED_SENDER(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,iscas.ac.cn];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E140C66030
X-Rspamd-Action: no action

=E5=9C=A8 2026-01-22=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 11:39 +0100=EF=BC=
=8CThomas Zimmermann=E5=86=99=E9=81=93=EF=BC=9A
> Hi
>=20
> Am 22.01.26 um 10:23 schrieb Icenowy Zheng:
> > =E5=9C=A8 2026-01-21=E6=98=9F=E6=9C=9F=E4=B8=89=E7=9A=84 13:56 +0100=EF=
=BC=8CThomas Zimmermann=E5=86=99=E9=81=93=EF=BC=9A
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev_info(dev, "DC%x rev =
%x customer %x\n", dc-
> > > > > identity.model,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 dc->identity.revision, dc-
> > > > >identity.customer_id);
> > > drm_dbg().=C2=A0 Drivers should be quite by default.
> > Well for this kind of identification information I think driver is
> > usually not quiet, at least amdgpu (when doing IP discovery),
> > panfrost
> > and etnaviv (which shares the same set of identification registers
> > with
> > this driver) is reporting it.
>=20
> These drivers only get away with it because many other drivers keep=20
> quite. Otherwise the kernel log would be filled with init reports.
> Your=20
> choice, but it's questionable if anyone ever cares except for
> debugging.
>=20
>=20
> >=20
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (port_count > dc->ide=
ntity.display_count) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0dev_err(dev, "too many downstream ports than HW
> > > > capability\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0ret =3D -EINVAL;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto err_rst_assert;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > > +
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!state->visible || !=
fb) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, VSDC_FB_CONFIG(output),
> > > > 0);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs,
> > > > VSDC_FB_CONFIG_EX(output),
> > > > 0);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto commit;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0} else {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0regmap_set_bits(dc->regs,
> > > > VSDC_FB_CONFIG_EX(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VSDC_FB_CONFIG_EX_FB_EN);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> > > Since you handle the plane on/plane off cases here, I'd advise to
> > > implement atomic_enable and atomic_disable for the plane, if the
> > > hardware allows it. (There is hardware were the current pattern
> > > makes
> > > sense though.)
> > If atomic_*able is going to be implemented, should atomic_update()
> > keep
> > the plane on/off code?
>=20
> In this case, atomic_update should only perform an update of the
> plane's=20
> graphics buffer (scanout address, color format). The logic then is
>=20
> enable and mode setting:
>=20
> =C2=A0=C2=A0atomic_update, plus
> =C2=A0=C2=A0atomic_enable
>=20
> disable:
>=20
> =C2=A0=C2=A0atomic_disable only
>=20
> page flips:
>=20
> =C2=A0=C2=A0atomic_update only

The hardware seems to work well with this pattern.

However, I found that plane's atomic_enable is still a rare feature in
the kernel, and the found user of it, tidss, still need to handle
situations that the plane is invisible in atomic_update (and disable
the plane in the case).

>=20
> See=20
> https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/drm_atomi=
c_helper.c#L3022

The code gives me the feeling that the enablement status of a plane is
independent to the visibility status (because the code does not
reference visible field in the state), which totally confuses me about
the usage of atomic_enable.

So is it about some enablement of hardware unrelated to visibility?

>=20
> That's usually cleaner. But there's hardware where
> update/enable/disable=20
> is connected in such a way that a single atomic_update is better.
>=20
>=20
> >=20
> > BTW it seems that DC8200 has the shadow register capability that
> > could
> > be manually commited but the older DC8000 has no (the
> > VSDC_FB_CONFIG_EX_COMMIT bit written below is a new thing) -- the
> > VSDC_FB_CONFIG register on DC8000 has a write-only bit that when
> > written with 0 the display is put to reset and when written with 1
> > the
> > display will start to run. This pattern seems to be not able to
> > keep
> > the enabled state while programming (at least part of) new plane
> > configuration, see [1].
>=20
> I cannot comment on the hardware. But on the DRM side, we always
> disable=20
> the pipeline for we program a new display mode; and then do an enable
> step to program the new mode. This happens on the CRTC, but it also=20
> affects the CRTC's planes accordingly. For pageflips, we only run the
> plane's atomic_update.
>=20
> If you you see a page flip, but need a full mode-setting operation,
> you=20
> can manually trigger it by setting drm_crtc_state.mode_changed from
> the=20
> plane's atomic_check. Here's an example:=20
> https://elixir.bootlin.com/linux/v6.18.6/source/drivers/gpu/drm/mgag200/m=
gag200_mode.c#L503
>=20
> If the DC8000 and DC8200 behave sufficiently differently, my advise
> is=20
> to write multiple _funcs structs with custom helpers and pick the=20
> correct one when you initialize the modesetting pipeline.

Then let me just totally forget DC8000 now. At least the DC8200
hardware fits the update+enable model.

>=20
> Best regards
> Thomas
>=20
> >=20
> > [1]
> > https://github.com/milkv-megrez/rockos-u-boot/blob/c9221cf2fa77d39c0b24=
1ab4b030c708e7ebe279/drivers/video/eswin/eswin_dc_reg.h#L3579
> >=20
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_format_to_vs_format(=
state->fb->format->format,
> > > > &fmt);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(dc->r=
egs, VSDC_FB_CONFIG(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 VSDC_FB_CONFIG_FMT_MASK,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 VSDC_FB_CONFIG_FMT(fmt.color));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_update_bits(dc->r=
egs, VSDC_FB_CONFIG(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 VSDC_FB_CONFIG_SWIZZLE_MASK,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0
> > > > VSDC_FB_CONFIG_SWIZZLE(fmt.swizzle));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_assign_bits(dc->r=
egs, VSDC_FB_CONFIG(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 VSDC_FB_CONFIG_UV_SWIZZLE_EN,
> > > > fmt.uv_swizzle);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Get the physical addr=
ess of the buffer in memory */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gem =3D drm_fb_dma_get_g=
em_obj(fb, 0);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Compute the start of =
the displayed memory */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bpp =3D fb->format->cpp[=
0];
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_addr =3D gem->dma_ad=
dr + fb->offsets[0];
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* Fixup framebuffer add=
ress for src coordinates */
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_addr +=3D (state->sr=
c.x1 >> 16) * bpp;
> > > bpp is deprecated and should be avoided in new code. You can
> > > compute
> > > the
> > > offset with drm_format_min_pitch():
> > >=20
> > > drm_format_min_pitch(fb->format, 0, state->src.x1 >> 16 )
> > >=20
> > > Best regards
> > > Thomas
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_addr +=3D (state->sr=
c.y1 >> 16) * fb->pitches[0];
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, V=
SDC_FB_ADDRESS(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lower_32_bits(dma_addr));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, V=
SDC_FB_STRIDE(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fb->pitches[0]);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, V=
SDC_FB_TOP_LEFT(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_MAKE_PLANE_POS(state-=
>crtc_x, state-
> > > > > crtc_y));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, V=
SDC_FB_BOTTOM_RIGHT(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_MAKE_PLANE_POS(state-=
>crtc_x + state-
> > > > > crtc_w,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 state->crtc_y + state-
> > > > > crtc_h));
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, V=
SDC_FB_SIZE(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_MAKE_PLANE_SIZE(state=
->crtc_w, state-
> > > > > crtc_h));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_write(dc->regs, V=
SDC_FB_BLEND_CONFIG(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 VSDC_FB_BLEND_CONFIG_BLEND=
_DISABLE);
> > > > +commit:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0regmap_set_bits(dc->regs=
, VSDC_FB_CONFIG_EX(output),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0VSD=
C_FB_CONFIG_EX_COMMIT);
> > > > +}
> > > > +
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D 8< =3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20

