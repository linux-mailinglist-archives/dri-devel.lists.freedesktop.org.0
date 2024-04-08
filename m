Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F189B7E7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 08:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B6310EE33;
	Mon,  8 Apr 2024 06:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PB6WFMUB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A12010EE33
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 06:48:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1614060C66;
 Mon,  8 Apr 2024 06:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9475BC433F1;
 Mon,  8 Apr 2024 06:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712558927;
 bh=fdlmo9nLEZZM0AajDxaXARTs2D2/fr2yANRzgsov9XQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=PB6WFMUBsWePt6MPDVGzjykATl5kIcolPq/DLxwqs//oBCb1C/Yk/z9Of2FEs0bUq
 fZ16EyAYreDRW37w6FaiAvs2FGG/zKeNxkM9ELyV7TGrlAjgYOQhS0tpvW6YAFyvz8
 IcLsT5SP1jheavN5f5UTTd16JvwjoedFC105oS5BIhBsmy5m1+9jYm2BUcRUYI5zHw
 4v2XQKaZD04yAuzuIxJZArCpAwgwrEjtH4YIxP2SrAuwLAsDLwvOWtcN1FysAPMDhq
 +Xe9ooN4viv3dsoHK4nSFO5xV2lrZOsCxpZn1KiW3Vgep887kUpfBcp+GKVmGxpUWh
 1GGXb/AIOeKcA==
Message-ID: <5b88fb4c1e02303bcbc59b92496735c9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87frw2a2e4.fsf@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <87frw2a2e4.fsf@oltmanns.dev>
Subject: Re: [PATCH v4 0/5] Pinephone video out fixes (flipping between two
 frames)
From: Stephen Boyd <sboyd@kernel.org>
Cc: Guido =?utf-8?q?G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, stable@vger.kernel.org,
 Diego Roversi <diegor@tiscali.it>, Erico Nunes <nunes.erico@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Frank Oltmanns <frank@oltmanns.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Samuel Holland <samuel@sholland.org>
Date: Sun, 07 Apr 2024 23:48:45 -0700
User-Agent: alot/0.10
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

Quoting Frank Oltmanns (2024-04-03 08:31:47)
> Dear clk and sunxi-ng maintainers,
>=20
> Patches 1-4 have been reviewed and there are no pending issues. If there
> is something else you need me to do to get this applied, please let me
> know.
>=20

I'm assuming sunxi maintainers will pick up the clk patches and send
them to clk tree in a PR.
