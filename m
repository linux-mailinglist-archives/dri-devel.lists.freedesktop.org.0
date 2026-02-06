Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OaJHozshWlvIQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:28:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02075FE1D7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 14:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1172D10E66B;
	Fri,  6 Feb 2026 13:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="MrABODs6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967E710E66B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 13:28:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770384499; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DNhXkQAPNzKgJra5xvbEkd80zM2ctRyQgWLurnlSVP13dexpfwbAKcknatu//Q/o50gvTzcTEQ1NKyu4UyPQubFoIfJj4S1uvzA4F86BsTqZWnzD5BFKT0lbGbCBxvP6u33L52vMVEiBEx1xnqNWPkOqyqCzvTXOOFWBDQx4Bwg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770384499;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=csYVRUvVWbvvf8wcgd3EzDmqbBogEBisUcbX8ERb4cc=; 
 b=krYDuojyZe9hxAX+UOlCdC2mVhUbMfhuPLmX5QHqX2jXYjuoOaNz0p81QpwP9tkJQIBY++TDZUzlCbo8pJTHM7xQ5iXOL+4v6boDpZiiJsq2BLg93Jp5mes0JCKBEa07dy/MYKrR/qCqfjKYXX2zf/9kNAtUzIePQZi6dDqDgAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770384499; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=csYVRUvVWbvvf8wcgd3EzDmqbBogEBisUcbX8ERb4cc=;
 b=MrABODs6Py2CZvfpDoWRviO/GTkEp24s+p+eSLIJjgdUCsmV3rSofLHtmRnF9AlB
 g1FUot3Db3J43BCNok1/pw+tAAHX+T57QxXQxqOsfDKN5vLn4VDBDquF+GobbLl6C6H
 IHbllLMwcl6p6cei54ZQmkuUz9CM38SovbYHkROs=
Received: by mx.zohomail.com with SMTPS id 1770384497666336.13465611924744;
 Fri, 6 Feb 2026 05:28:17 -0800 (PST)
Message-ID: <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>, Harry Wentland
 <harry.wentland@amd.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
 ariel.dalessandro@collabora.com, kernel@collabora.com, xaver.hugl@gmail.com
Date: Fri, 06 Feb 2026 08:28:14 -0500
In-Reply-To: <20260206110901.660cf712@eldfell>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
 <20260206110901.660cf712@eldfell>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
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
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:pekka.paalanen@collabora.com,m:harry.wentland@amd.com,m:wiagn233@outlook.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:daniels@collabora.com,m:ariel.dalessandro@collabora.com,m:kernel@collabora.com,m:xaver.hugl@gmail.com,m:matthiasbgg@gmail.com,m:xaverhugl@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[outlook.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 02075FE1D7
X-Rspamd-Action: no action

On Fri, 2026-02-06 at 11:09 +0200, Pekka Paalanen wrote:
> On Fri, 2 Jan 2026 13:40:21 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
>=20
> > On 2026-01-01 07:37, Shengyu Qu wrote:
> > >=20
> > >=20
> > > =E5=9C=A8 2025/12/30 02:53, Shengyu Qu =E5=86=99=E9=81=93:=C2=A0=20
> > > >=20
> > > >=20
> > > > =E5=9C=A8 2025/12/24 3:44, N=C3=83 colas F. R. A. Prado =E5=86=99=
=E9=81=93:=C2=A0=20
>=20
> > > > > Given the lack of support for writeback connectors on the
> > > > > MediaTek KMS driver, combined with limited hardware
> > > > > documentation, I haven't been able to verify the correctness
> > > > > of
> > > > > each curve, only that they were visually sane (gamma curves
> > > > > made
> > > > > the image on the display brighter, while inverse gamma made
> > > > > it
> > > > > darker).=C2=A0=20
> > > >=20
> > > > Hmmm I don't think this is acceptable. sRGB/scRGB has two
> > > > transfer
> > > > functions mentioned in original specification[1]. To keep color
> > > > accuracy, we need someone from mediatek confirm whether this is
> > > > piece- wise or pure power 2.2 transfer function, this is
> > > > already
> > > > done in original amdgpu color pipeline series, sRGB means
> > > > piece-wise while also dedicated power 2.2 function exists.=C2=A0=
=20
> >=20
> > Not sure what you mean with this not being acceptable. This is
> > about
> > enabling HW support for this functionality. Not every HW has
> > writeback for testing. At some point you'll have to trust the
> > driver
> > devs if you're going to use functionality of the driver. We're not
> > always going to get everything perfect, but if that's really such a
> > worry you can always use shaders to do precisely what you want.
> >=20
>=20
> Hi Harry,
>=20
> yes, but I understood that in this case, the hardware documentation
> available is so vague that it's impossible to say what it will
> actually
> do. There are no formulas given or referenced in the documentation,
> are
> there, N=C3=ADcolas?

No formulas at all, the only documentation I had available for the
curves was the register definition, which simply lists the possible
values: SCRGB, BT709, BT2020, HLG.

--=20
Thanks,

N=C3=ADcolas
