Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524517FBB90
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 14:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60CE10E523;
	Tue, 28 Nov 2023 13:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C5610E523
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 13:29:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C11EEB8399C;
 Tue, 28 Nov 2023 13:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68D8C433C9;
 Tue, 28 Nov 2023 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701178183;
 bh=eegc62CSFJSGMpwmfbQ9cieR8ro9QUfxI2Hecr1t0d0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jq7O6PHR6YExx9eupodBnBU26Udoi6FMtcX3bU0B51+pFSeHpJij8cLvwfre2NU9r
 hlU8qmy3P9IKCI32NGfGoni/pILrS/N0Cck3Tw7ijrhJCX1Sf7O7oU2BFFkwWdJZNR
 iiQeyGhKbsamyvQTl7kyEyLKkq+N2PPHIolJ5kOfAAHS1dm/aR6mTJirWaZ/FWN7tf
 0D1yIWE/TUPh7NQQ1aZp2qlVgarhL3nEIZNzaQVa5OpJCI47SJqKml4TEp3yPS9Ti8
 JMc/ozLQGq95jIAU9G6MmFGXMRLW2Otb9xTDH8Yas6bpLF9Wg1eT7bbYXmlO/TiwG2
 JdNpUHuh7JNOg==
Date: Tue, 28 Nov 2023 14:29:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v4 05/45] drm/connector: Check drm_connector_init
 pointers arguments
Message-ID: <v3hplco5fdedv6bnc6mwx2zhhw4xxdiekha26ykhc5cmy7ol77@2irk3w4hmabw>
References: <20231128-kms-hdmi-connector-state-v4-0-c7602158306e@kernel.org>
 <20231128-kms-hdmi-connector-state-v4-5-c7602158306e@kernel.org>
 <87h6l66nth.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ncmpulkgjsh2p7e6"
Content-Disposition: inline
In-Reply-To: <87h6l66nth.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>, Sandy Huang <hjc@rock-chips.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-doc@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ncmpulkgjsh2p7e6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Tue, Nov 28, 2023 at 02:54:02PM +0200, Jani Nikula wrote:
> On Tue, 28 Nov 2023, Maxime Ripard <mripard@kernel.org> wrote:
> > All the drm_connector_init variants take at least a pointer to the
> > device, connector and hooks implementation.
> >
> > However, none of them check their value before dereferencing those
> > pointers which can lead to a NULL-pointer dereference if the author
> > isn't careful.
>=20
> Arguably oopsing on the spot is preferrable when this can't be caused by
> user input. It's always a mistake that should be caught early during
> development.
>=20
> Not everyone checks the return value of drm_connector_init and friends,
> so those cases will lead to more mysterious bugs later. And probably
> oopses as well.

So maybe we can do both then, with something like

if (WARN_ON(!dev))
   return -EINVAL

if (drm_WARN_ON(dev, !connector || !funcs))
   return -EINVAL;

I'd still like to check for this, so we can have proper testing, and we
already check for those pointers in some places (like funcs in
drm_connector_init), so if we don't cover everything we're inconsistent.

Maxime

--ncmpulkgjsh2p7e6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWXrRAAKCRDj7w1vZxhR
xTyXAP0W+h2/0xLXXBJVtoNPSJ+MdMt1B3qXNmsRScATV36j3QD+JmPDNBt3syJA
33NzAAvtBetz/KSX6B52Yckf1U8lwwU=
=KHiZ
-----END PGP SIGNATURE-----

--ncmpulkgjsh2p7e6--
