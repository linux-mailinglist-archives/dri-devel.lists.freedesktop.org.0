Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E19786CA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 19:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3C610ED5A;
	Fri, 13 Sep 2024 17:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="J3bn2shj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441F610ED5A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 17:30:26 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1726248623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nke/5YLh6MHWfzE6gklOT9y6TbGopcbIdlXZPOZs7oA=;
 b=J3bn2shjG8JKynQlOWputFVEI1nNGcv2ULoyvL5XC54Cq0m4QV6Ax0dJNDcWW3CG7GEBRi
 jWezVb1MnzTkjxIQZKr15UxggV3fEbRNRExzG6zKoru5jwADrg0LpANpRmQskJHe8+z7lM
 PtbWLrHUZRSGjBvepXvbUcS3aitT/1Z199Nqnbd6Ln7SHW1RSB/YKoR0171FDoKs9yZgDq
 DkoMyH3KM+QDzI/7suxfaxxAsb+6QYxT5G1U7qKoyejQXdbEdpGXIk7eazPKBF74ZFx1Nk
 Bvnl1WZ/IrVcxypl583dxVPjzxTlVTdnLGjFdJpVSDjj77YWlWBvwyXggcZB8Q==
Content-Type: multipart/signed;
 boundary=d6f0c6cf338a74127d2f7d5ac197597d4aebc3a0a9a16533c3439fd9f222;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 13 Sep 2024 19:30:13 +0200
Message-Id: <D45C28ZF5US9.1BCL9HBVRERJB@cknow.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Jonas Karlman" <jonas@kwiboo.se>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Christian Hewitt"
 <christianshewitt@gmail.com>, "Christopher Obbard" <obbardc@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/10] drm: bridge: dw_hdmi: Misc enable/disable, CEC
 and EDID cleanup
References: <20240908132823.3308029-1-jonas@kwiboo.se>
In-Reply-To: <20240908132823.3308029-1-jonas@kwiboo.se>
X-Migadu-Flow: FLOW_OUT
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

--d6f0c6cf338a74127d2f7d5ac197597d4aebc3a0a9a16533c3439fd9f222
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jonas,

On Sun Sep 8, 2024 at 3:28 PM CEST, Jonas Karlman wrote:
> This series ensure poweron/poweroff and CEC phys addr invalidation is
> happening under drm mode_config mutex lock, and also ensure EDID is
> updated (when the dw-hdmi connector is used) after a hotplug pulse.
>
> These changes has mainly been tested on Rockchip devices together with a
> series [1] that add HDMI 2.0 4K@60Hz support to RK3228, RK3328, RK3399
> and RK3568.

I did some tests with this series (together with the 4K60Hz one).

Test setup:
- TV capable of display 4K@60Hz
- monitor capable of displaying 1080p@60Hz
- Quartz64 Model-A
- Rock64

When I booted up connected to the 4K TV, the boot messages were
displayed in 1080p resolution. IIUC it was to be considered an
improvement when it would be illegible at 4K, but that did not happen.
Neither on the Q64-A or the Rock64.

When executing ``cat /sys/class/graphics/*/modes`` it returned
``U:3840x2160p-0``, so that was good.

I then went on the HDMI-hot-plug-swap-test and connected it to my 1080p
monitor while the system was still online. That did not change the
output of the previous command. As my monitor doesn't support 4K it
seems to have chosen a 640p or 720p resolution.
IOW the letters were rather big. With enough output on the screen, it
went off the visible area, so all I could do then was 'blind' typing.

If I booted up connected to the 1080p monitor then it reported a 1080p
resolution and when swapping to the 4K TV, it kept reporting that value
and displaying things in 1080p resolution, but ofc there were no
abnormal big letters or output falling off the screen this time.

If I did those test when Sway was running, all the data (``swaymsg -t
get_outputs --pretty``) showed that a proper resolution switch was made
and the display was correctly adjusted accordingly.

I then tried to do the keep-swapping-until-output-breaks what Chris
reported about in the previous series.
At some point I thought I was able to reproduce the issue ... to then
conclude I had likely hit the poweroff button when swapping the cables.
And another time I thought I had managed to reproduce it ... to then
find out display wasn't working at all anymore. Turned out that likely
due to all that swapping, it was no longer properly inserted into my
monitor.
I've tried it a LOT of times, but I have to conclude that I was not able
to reproduce the problem and therefor also not the solution.

HTH,
  Diederik

--d6f0c6cf338a74127d2f7d5ac197597d4aebc3a0a9a16533c3439fd9f222
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZuR2qAAKCRDXblvOeH7b
blXRAQCfKcyHODxabQQ1dpuHfkKeLr6Iu72WhQRxgUdBVsfp1gD+LBWU+xjKnYb5
mVxYjuNwxGIjjztpo9Dy4jtfBMoYbwI=
=lsyh
-----END PGP SIGNATURE-----

--d6f0c6cf338a74127d2f7d5ac197597d4aebc3a0a9a16533c3439fd9f222--
