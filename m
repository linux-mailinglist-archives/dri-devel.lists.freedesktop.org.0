Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA90190242A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 16:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE1910E24A;
	Mon, 10 Jun 2024 14:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="acPil28z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6197110E24A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 14:34:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53CBFCE140C;
 Mon, 10 Jun 2024 14:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFBDC2BBFC;
 Mon, 10 Jun 2024 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718030089;
 bh=8EaYTiI7dlRaNP/ku+p78n5fiWhhP6LeJZbLbulj3oc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=acPil28zhn/45T86ovd9G4KWdjb4/i6R8dclYk7t9IrWc+S/zGN9fOIb1ipYjBI0b
 IeNoxSvTK3/DjDm02FMv2I1Bdb50/axmf8YkVVsz6sbzIcWQfmM7Gj5Gd3D5jb45Ar
 9kg1KGjomoN9APoVjB3g3G3luBy/nhUdLNI+JzJMDkSPQvdMkraxT4D7VVnQbgV4Ou
 d7Lab7e3wGhvmrLHAv4eZ2kGHopEplmysKLyvlR9QgUZxRQATeAQhULilTVlrfjLZY
 NdhykRGmJecCVTRXs0jPxqSuWertgB9QOev31ClMei8YE5os1jsZx8NBDkbBNDZ2nO
 /d1Tsr5bn1RAw==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org, Adam Ford <aford173@gmail.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Michael Tretter <m.tretter@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Daniel Vetter <daniel@ffwll.ch>, aford@beaconembedded.com,
 Jonas Karlman <jonas@kwiboo.se>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Marco Felsch <m.felsch@pengutronix.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20240601144103.198299-1-aford173@gmail.com>
References: <20240601144103.198299-1-aford173@gmail.com>
Subject: Re: [PATCH V3 1/2] drm/bridge: samsung-dsim: Set P divider based on
 min/max of fin pll
Message-Id: <171803008513.465712.14703974733678728383.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 16:34:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Sat, 1 Jun 2024 09:41:01 -0500, Adam Ford wrote:
> The P divider should be set based on the min and max values of
> the fin pll which may vary between different platforms.
> These ranges are defined per platform, but hard-coded values
> were used instead which resulted in a smaller range available
> on the i.MX8M[MNP] than what was possible.
> 
> As noted by Frieder, there are descripencies between the reference
> manuals of the Mini, Nano and Plus, so I reached out to my NXP
> rep and got the following response regarding the varing notes
> in the documentation.
> 
> [...]

Applied, thanks!

[1/2] drm/bridge: samsung-dsim: Set P divider based on min/max of fin pll
      (no commit info)
[2/2] drm/bridge: samsung-dsim: Fix porch calcalcuation rounding
      (no commit info)



Rob

