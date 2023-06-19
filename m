Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D91734D8A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A3410E1B1;
	Mon, 19 Jun 2023 08:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1F710E1B0;
 Mon, 19 Jun 2023 08:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=CmK/ulgQpHFWRxaRYT8veXW7TE7RM2/u+ZQEKDXpcoA=; 
 t=1687163072; x=1688372672; b=NwAyCGUlxHP7lkOqQiDL22vSi5/BO4nRZ4iIsehmqtPX2Ra
 ZuOyhshLu9Xcm5ManHE/CKt8EqSu7YSNsViaB+i6EIthJCEzcQDmfxpv98Bc5xYs912oc44QqUt5T
 Tu4HF0RKt8RCmGCJM8Eql+88EJrZix35PTjyi2mRmetonX3Qw1BmETSCtEL7JnVHjyfYyrAuiVmXR
 tIlkR4YQ3Zcgkp56qMra9IDXef1n+RVYMaF2V+xVHI0j4i5bI+wfw83xCPh/OV0VWVP9E1perxi4k
 3TW7HJfNRk26mPTG6F1TtYB07n88lDkX/Qr8zqJhwqlSocNSvy7FNLfcHO3jLtNg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qBABX-00BFMO-0Y; Mon, 19 Jun 2023 10:24:27 +0200
Message-ID: <5a19bd3074d2763b02a722f31713bbf3bae97e8f.camel@sipsolutions.net>
Subject: Re: [PATCH V3 2/7] wifi: mac80211: Add support for ACPI WBRF
From: Johannes Berg <johannes@sipsolutions.net>
To: Mario Limonciello <mario.limonciello@amd.com>, Evan Quan
 <evan.quan@amd.com>
Date: Mon, 19 Jun 2023 10:24:25 +0200
In-Reply-To: <3c3dccd6-6772-d62f-f183-bd84e109a366@amd.com>
References: <20230616065757.1054422-1-evan.quan@amd.com>
 <20230616065757.1054422-3-evan.quan@amd.com>
 <3c3dccd6-6772-d62f-f183-bd84e109a366@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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
Cc: ryder.lee@mediatek.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, lorenzo@kernel.org, kvalo@kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lijo.Lazar@amd.com,
 linux-acpi@vger.kernel.org, shayne.chen@mediatek.com, matthias.bgg@gmail.com,
 amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, nbd@nbd.name,
 Christian.Koenig@amd.com, sean.wang@mediatek.com, lenb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2023-06-18 at 21:17 -0500, Mario Limonciello wrote:
>=20
> > --- a/include/net/cfg80211.h
> > +++ b/include/net/cfg80211.h
> > @@ -920,6 +920,14 @@ const struct cfg80211_chan_def *
> >   cfg80211_chandef_compatible(const struct cfg80211_chan_def *chandef1,
> >   			    const struct cfg80211_chan_def *chandef2);
> >  =20
> > +/**
> > + * nl80211_chan_width_to_mhz - get the channel width in Mhz
> > + * @chan_width: the channel width from &enum nl80211_chan_width
> > + * Return: channel width in Mhz if the chan_width from &enum nl80211_c=
han_width
> > + * is valid. -1 otherwise.
> > + */
> > +int nl80211_chan_width_to_mhz(enum nl80211_chan_width chan_width);
> > +
>=20
> It's up to mac80211 maintainers, but I would think that the changes to=
=20
> change nl80211_chan_width_to_mhz from static to exported should be=20
> separate from the patch to introduced WBRF support in the series.

Yeah, that'd be nice :)


> > +#define KHZ_TO_HZ(freq)		((freq) * 1000ULL)

Together with MHZ_TO_KHZ() for example :)

johannes
