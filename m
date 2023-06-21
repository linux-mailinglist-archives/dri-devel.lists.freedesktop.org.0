Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD387386DA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 16:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF2310E498;
	Wed, 21 Jun 2023 14:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7680A10E498;
 Wed, 21 Jun 2023 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=y8KezyLc/DUW29gVzDAPim1rZ/zbq0krh1pHlYpx9Jc=; 
 t=1687357522; x=1688567122; b=EhrdKum2HyOUfkWnDEKePBZ9zQB+RHIhNjCJcyj5oaYPU19
 khn6xt+qwrBAzilaQ0ZZ5aZ3TS+IByPzdyP6BOtapZpwNGE8u9GU1ssAnB6rued3TZVIlymchsxVJ
 culkl6J1yA6u4cBHOgAWgX5lPbyYP9IOKF+YeBkTcbwsnCI4fH2SoGdI9C3WlM81XmbgaJ1DK4+f7
 vxuI7s0KH0wjhaRhEPiW4ru9hjuei88HGDFUeXDKep0Bt7npw34tlBJezc9wmHpfhaLepvG2f9DKi
 8ISdA6l4tQJLiTP9nlbHRQJvOpoZT0QNSlqehD5/gqg6L7Nsj+3GFTnreWTTc7hQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qByln-00Dhei-0G; Wed, 21 Jun 2023 16:25:15 +0200
Message-ID: <9214266bf969207df60fdbde0157a0a5982bd2e0.camel@sipsolutions.net>
Subject: Re: [PATCH V4 3/8] wifi: mac80211: Add support for ACPI WBRF
From: Johannes Berg <johannes@sipsolutions.net>
To: "Limonciello, Mario" <mario.limonciello@amd.com>, Evan Quan
 <evan.quan@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 21 Jun 2023 16:25:13 +0200
In-Reply-To: <9fdcd5a6-5315-b4d8-1662-30bfc6cb67d8@amd.com>
References: <20230621054603.1262299-1-evan.quan@amd.com>
 <20230621054603.1262299-4-evan.quan@amd.com>
 <3eb2c16cb0692c8d6b03bd57cb049b1fb3457e92.camel@sipsolutions.net>
 <9fdcd5a6-5315-b4d8-1662-30bfc6cb67d8@amd.com>
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
Cc: jingyuwang_vip@163.com, bellosilicio@gmail.com, trix@redhat.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, edumazet@google.com,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org, mdaenzer@redhat.com,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org, andrealmeid@igalia.com,
 arnd@arndb.de, hdegoede@redhat.com, netdev@vger.kernel.org, Xinhui.Pan@amd.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-06-21 at 09:12 -0500, Limonciello, Mario wrote:
> >=20
> > But then the next question anyway is how we merge this? The wifi parts
> > sort of depend on the first patch, although technically I guess I could
> > merge them since it's all hidden behind the CONFIG_ symbol, assuming yo=
u
> > get that in via some other tree it can combine upstream.
> >=20
> > I'd also say you can merge those parts elsewhere but I'm planning to
> > also land some locking rework that I've been working on, so it will
> > probably conflict somewhere.
> Since it's all gated by CONFIG_ACPI_WBRF for each subsystem that it touch=
es,
> my take is that we should merge like this:
>=20
> 1) Get A-b/R-b on patch 1 (ACPI patch) from Rafael.
> 2) Merge mac80211 bits through WLAN trees
> 3) Merge AMDGPU bits *and* ACPI bits through amd-staging-drm-next=20
> followed by drm tree
>=20
> Since WLAN and AMDGPU bits are using the exported ACPI functions from
> patch 1, we need to make sure that it is accepted and won't change
> interface before merging other bits.

Right.

> Everything can come together in the upstream tree and the bots
> will be able to test linux-next as well this way.

Yeah, that's what I thought.

Sounds good to me!

Oh, also, since it's pretty late in the cycle I'm assuming for now that
you're not aiming this for 6.5 anymore. If you still are, it all would
probably need to happen very quickly.

johannes
