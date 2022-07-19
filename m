Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CE57B16B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C48810F4A1;
	Wed, 20 Jul 2022 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7032514A2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:38:21 +0000 (UTC)
Received: from [IPv6:2a00:23c6:c30a:1501:8302:3eab:dcff:989c] (unknown
 [IPv6:2a00:23c6:c30a:1501:8302:3eab:dcff:989c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: martyn)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 830A566019EC;
 Tue, 19 Jul 2022 09:38:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.co.uk;
 s=mail; t=1658219899;
 bh=pT9LsgDPXQ0N4ZUhydSJXzlbrrIU5pdJxpX8OgBtKKo=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ZAM2U4AliGF0UNCwIZdgWYgG1mlKiLMsrfpv5iI8xik1utJb6T2n3DYMDooKyGdii
 UyWldvFNAg0/J1orEkFTg/P7M1qwUbLupaEh8xIUuZwqUsE6yrKPII8o4NhouLdsE7
 jzf2IfHDBSYRMKl5bMZ5QH1Id9d2Fph58g2WEaAp3UiqQUFYOhf12OXgWJSihkncZY
 uOxJsKudggnNoyJ5DTodeHcrFrhRb/StTMuvFMFH7T29SjMeTg6Eojk9nCbcBGCRy3
 6lp9Ib0YSu/6E8x5UGiXqm1jnze3N7mN5qhqxQbYZyP57yYcEuGeHxGNUAucthTckc
 gA1I1JhXry0kg==
Message-ID: <946c008942f4ef4ca642818b23e9941c162383e3.camel@collabora.co.uk>
Subject: Re: [PATCH] drm/bridge: megachips: Fix a null pointer dereference bug
From: Martyn Welch <martyn.welch@collabora.co.uk>
To: Zheyu Ma <zheyuma97@gmail.com>, peter.senna@gmail.com, 
 martin.donnelly@ge.com, andrzej.hajda@intel.com, narmstrong@baylibre.com, 
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 19 Jul 2022 09:38:16 +0100
In-Reply-To: <20220716081304.2762135-1-zheyuma97@gmail.com>
References: <20220716081304.2762135-1-zheyuma97@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2-1 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Jul 2022 07:11:29 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 2022-07-16 at 16:13 +0800, Zheyu Ma wrote:
> When removing the module we will get the following warning:
>=20
> [=C2=A0=C2=A0 31.911505] i2c-core: driver [stdp2690-ge-b850v3-fw] unregis=
tered
> [=C2=A0=C2=A0 31.912484] general protection fault, probably for non-canon=
ical
> address 0xdffffc0000000001: 0000 [#1] PREEMPT SMP KASAN PTI
> [=C2=A0=C2=A0 31.913338] KASAN: null-ptr-deref in range [0x00000000000000=
08-
> 0x000000000000000f]
> [=C2=A0=C2=A0 31.915280] RIP: 0010:drm_bridge_remove+0x97/0x130
> [=C2=A0=C2=A0 31.921825] Call Trace:
> [=C2=A0=C2=A0 31.922533]=C2=A0 stdp4028_ge_b850v3_fw_remove+0x34/0x60
> [megachips_stdpxxxx_ge_b850v3_fw]
> [=C2=A0=C2=A0 31.923139]=C2=A0 i2c_device_remove+0x181/0x1f0
>=20
> The two bridges (stdp2690, stdp4028) do not probe at the same time,
> so
> the driver does not call ge_b850v3_resgiter() when probing, causing
> the
> driver to try to remove the object that has not been initialized.
>=20
> Fix this by checking whether both the bridges are probed.
>=20
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

Good catch!

Acked-by: Martyn Welch <martyn.welch@collabora.com>

Would be worth adding:

Fixes: 11632d4aa2b3 ("drm/bridge: megachips: Ensure both bridges are
probed before registration")

> ---
> =C2=A0drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index cce98bf2a4e7..c68a4cdf4625 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -296,7 +296,9 @@ static void ge_b850v3_lvds_remove(void)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This check is to avoid=
 both the drivers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * removing the bridge in=
 their remove() function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ge_b850v3_lvds_ptr)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!ge_b850v3_lvds_ptr ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0!ge_b850v3_lvds_ptr->stdp2690_i2c ||
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0!ge_b850v3_lvds_ptr->stdp4028_i2c)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0goto out;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drm_bridge_remove(&ge_b85=
0v3_lvds_ptr->bridge);

