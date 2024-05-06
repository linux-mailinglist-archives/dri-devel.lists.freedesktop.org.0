Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDA68BD280
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 18:21:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB97112187;
	Mon,  6 May 2024 16:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A1611201A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 16:21:06 +0000 (UTC)
Received: from i53875b5d.versanet.de ([83.135.91.93] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1s415J-0007im-LL; Mon, 06 May 2024 18:21:01 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH v2 15/48] drm/panel: ltk050h3146w: Don't call
 unprepare+disable at shutdown/remove
Date: Mon, 06 May 2024 18:21:00 +0200
Message-ID: <2957706.k3LOHGUjKi@diego>
In-Reply-To: <20240503143327.RFT.v2.15.Ibeb2e5692e34b136afe4cf55532f0696ab3f5eed@changeid>
References: <20240503213441.177109-1-dianders@chromium.org>
 <20240503143327.RFT.v2.15.Ibeb2e5692e34b136afe4cf55532f0696ab3f5eed@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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

Am Freitag, 3. Mai 2024, 23:32:56 CEST schrieb Douglas Anderson:
> It's the responsibility of a correctly written DRM modeset driver to
> call drm_atomic_helper_shutdown() at shutdown time and that should be
> disabling / unpreparing the panel if needed. Panel drivers shouldn't
> be calling these functions themselves.
>=20
> A recent effort was made to fix as many DRM modeset drivers as
> possible [1] [2] [3] and most drivers are fixed now.
>=20
> Unfortunately, grepping mainline for this panel's compatible string
> shows no hits, so we can't be 100% sure if the DRM modeset driver used
> with this panel has been fixed. If it is found that the DRM modeset
> driver hasn't been fixed then this patch could be temporarily reverted
> until it is.
>=20
> [1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.o=
rg
> [2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.o=
rg
> [3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.=
org
>=20
> Cc: "Heiko St=FCbner" <heiko@sntech.de>
> Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

On a rk3588-tiger with WIP DSI patches and this display

Tested-by: Heiko Stuebner <heiko@sntech.de>

Before this patch on reboot the system emits
[  181.464230] panel-leadtek-ltk050h3146w fde20000.dsi.0: Skipping disable =
of already disabled panel
[  181.465056] panel-leadtek-ltk050h3146w fde20000.dsi.0: Skipping unprepar=
e of already unprepared panel

after applying this patch, those lines are gone.

Also the patch itself looks good
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


