Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BA6737F82
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 12:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC2310E440;
	Wed, 21 Jun 2023 10:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64A310E439;
 Wed, 21 Jun 2023 10:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=E5J3XlE1FsUIlBpFkRpwctJVhjB2FlOiEwVbSdNHhcE=; 
 t=1687342990; x=1688552590; b=fwZAzcF+UlIhVUrY3lP5AzfjB25U5O6sp/nmT71ZWMkuv28
 7yswjLQZ0nCvuFVWV35HK5GzxpOcCzvkiTfgw93axqgaYKgzyYe0EOPiL0HyKXq7mlnJiD1TCbXDN
 Pnyu8K16p6LOhZVq5wfEuMMJRUbIU+xdgQgEfAItdm5hOi8YOOZM3I9Nlc/M7MsMZQYFs/lk05Cpr
 hVhBKUE462lSTo3Tn8hoiMjBSm2rydC+656SxlphXsDdvegBofxbUB23OkIdUuAFHY/uzmYmERA55
 RSydKXbByZf5lUD2ptvJUVQ7UVIBCOz0EUoVgvMWHObHK3s/VkXudHfKK0rRSYng==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qBuym-00DagI-0V; Wed, 21 Jun 2023 12:22:24 +0200
Message-ID: <3eb2c16cb0692c8d6b03bd57cb049b1fb3457e92.camel@sipsolutions.net>
Subject: Re: [PATCH V4 3/8] wifi: mac80211: Add support for ACPI WBRF
From: Johannes Berg <johannes@sipsolutions.net>
To: Evan Quan <evan.quan@amd.com>, rafael@kernel.org, lenb@kernel.org, 
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, daniel@ffwll.ch, davem@davemloft.net,
 edumazet@google.com,  kuba@kernel.org, pabeni@redhat.com,
 mario.limonciello@amd.com, mdaenzer@redhat.com, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 hdegoede@redhat.com,  jingyuwang_vip@163.com, lijo.lazar@amd.com,
 jim.cromie@gmail.com,  bellosilicio@gmail.com, andrealmeid@igalia.com,
 trix@redhat.com, jsg@jsg.id.au,  arnd@arndb.de
Date: Wed, 21 Jun 2023 12:22:21 +0200
In-Reply-To: <20230621054603.1262299-4-evan.quan@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-4-evan.quan@amd.com>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-06-21 at 13:45 +0800, Evan Quan wrote:
> To support AMD's WBRF interference mitigation mechanism, Wifi adapters
> utilized in the system must register the frequencies in use(or unregister
> those frequencies no longer used) via the dedicated APCI calls. So that,
> other drivers responding to the frequencies can take proper actions to
> mitigate possible interference.
>=20
> To make WBRF feature functional, the kernel needs to be configured with
> CONFIG_ACPI_WBRF and the platform is equipped with WBRF support(from
> BIOS and drivers).
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> Co-developed-by: Evan Quan <evan.quan@amd.com>
> Signed-off-by: Evan Quan <evan.quan@amd.com>

I was going to say this looks good ... but still have a few nits, sorry.

But then the next question anyway is how we merge this? The wifi parts
sort of depend on the first patch, although technically I guess I could
merge them since it's all hidden behind the CONFIG_ symbol, assuming you
get that in via some other tree it can combine upstream.

I'd also say you can merge those parts elsewhere but I'm planning to
also land some locking rework that I've been working on, so it will
probably conflict somewhere.

> +++ b/net/mac80211/chan.c
> @@ -506,11 +506,16 @@ static void _ieee80211_change_chanctx(struct ieee80=
211_local *local,
> =20
>  	WARN_ON(!cfg80211_chandef_compatible(&ctx->conf.def, chandef));
> =20
> +	ieee80211_remove_wbrf(local, &ctx->conf.def);
> +
>  	ctx->conf.def =3D *chandef;
> =20
>  	/* check if min chanctx also changed */
>  	changed =3D IEEE80211_CHANCTX_CHANGE_WIDTH |
>  		  _ieee80211_recalc_chanctx_min_def(local, ctx, rsvd_for);
> +
> +	ieee80211_add_wbrf(local, &ctx->conf.def);

You ignore the return value here.


> @@ -668,6 +673,10 @@ static int ieee80211_add_chanctx(struct ieee80211_lo=
cal *local,
>  	lockdep_assert_held(&local->mtx);
>  	lockdep_assert_held(&local->chanctx_mtx);
> =20
> +	err =3D ieee80211_add_wbrf(local, &ctx->conf.def);
> +	if (err)
> +		return err;

But not here.

In the code, there are basically two error paths:

> +int ieee80211_add_wbrf(struct ieee80211_local *local,
> +		       struct cfg80211_chan_def *chandef)
> +{
> +	struct device *dev =3D local->hw.wiphy->dev.parent;
> +	struct wbrf_ranges_in ranges_in =3D {0};
> +	int ret;
> +
> +	if (!local->wbrf_supported)
> +		return 0;
> +
> +	ret =3D wbrf_get_ranges_from_chandef(chandef, &ranges_in);
> +	if (ret)
> +		return ret;

This really won't fail, just if the bandwidth calculation was bad, but
that's an internal error that WARNs anyway and we can ignore it.

> +	return wbrf_add_exclusion(ACPI_COMPANION(dev), &ranges_in);

This I find a bit confusing, why do we even propagate the error? If the
platform has some issue with it, should we really fail the connection?


I think it seems better to me to just make this void, and have it be
only a notification interface?

johannes
