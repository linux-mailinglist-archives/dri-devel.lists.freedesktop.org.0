Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA5840ACE
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 17:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72A610F780;
	Mon, 29 Jan 2024 16:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BA510E02A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 16:06:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2A614CE13CA;
 Mon, 29 Jan 2024 16:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778D2C433F1;
 Mon, 29 Jan 2024 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706544389;
 bh=gsE0VC+Mvbx3+PkIl0OpvvJzIerilw+wc6PT2Cojk7M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W4bHpZJUG5NkBQWJp3rWUIB/6TdU+kl66Nf4/ZU78lxHVixTYe9AeKvbbDRmSksr0
 m+Vh7H3/nkNF2q/r/V0l71sx/bwdyNgjdX1I/kvUF8mnhEw5+7aD0K96ORl9Gcs+eE
 6a2qZ8cTBCxgFiCXSUeDsuinsOVArv2nrnaxEfaDiZIkSMdDnzrtTN6ApIvaVyL10U
 5KhH2X1L1fgcjY47JAU74bG/thy9vAnRDt7MAltHpWBokVnvFMQexc3aoZO6yZ5ZHt
 BUaltN98E3w+RPHXUZttVy6LeHQVZcnNGlzOTSeyajChSGZKbePBpaF3ZXyl/aFgho
 CKt39XlaD041w==
MIME-Version: 1.0
Date: Mon, 29 Jan 2024 17:06:22 +0100
From: Michael Walle <mwalle@kernel.org>
To: Dave Airlie <airlied@gmail.com>, Dario Binacchi
 <dario.binacchi@amarulasolutions.com>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH] drm: bridge: samsung-dsim: Don't use FORCE_STOP_STATE
In-Reply-To: <b18d88302acfca001a6693d78909bc2a@kernel.org>
References: <20231113164344.1612602-1-mwalle@kernel.org>
 <631fe35a2a3b00781231e4f3f5094fae@kernel.org>
 <1ef3dad2-5f55-40e5-bba7-3c71d71c12e4@kontron.de>
 <CAAQKjZMccDwa63_PNJCP0rNOaHjTwcOz8AbKa=JXLQi-b0QVVw@mail.gmail.com>
 <2400535875c353ff7208be2d86d4556f@kernel.org>
 <ZZ1BBO2nNSp3g-gT@phenom.ffwll.local>
 <CAAQKjZNnJQDn_r1+WNmsxM-2O48O0+yWAUAqpjZRjMYMT3xGwg@mail.gmail.com>
 <CAPM=9tytMB9frxNeD08hu1qsusY=wEE3bJOFmUgA1rSpabwDpg@mail.gmail.com>
 <b18d88302acfca001a6693d78909bc2a@kernel.org>
Message-ID: <31e1a38a1d012a32d6f7bc8372b6360e@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Tim Harvey <tharvey@gateworks.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <daeinki@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> Just FYI this conflictted pretty heavily with drm-misc-next changes in
>> the same area, someone should check drm-tip has the correct
>> resolution, I'm not really sure what is definitely should be.
> 
> FWIW, this looks rather messy now. The drm-tip doesn't build.
> 
> There was a new call to samsung_dsim_set_stop_state() introduced
> in commit b2fe2292624ac (drm: bridge: samsung-dsim: enter display
> mode in the enable() callback).

I had a closer look at the latest linux-next (where somehow my patch
made it into) and tried to apply commit b2fe2292624ac (drm: bridge:
samsung-dsim: enter display mode in the enable() callback). It looks
like only the following hunk is still needed from that patch. Everything
else is covered by this fixes patch.

Dario, could you rebase your commit onto this patch? I had a quick test
with this change and it seems to work fine for our case.

--snip--
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 63a1a0c88be4..92755c90e7d2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1498,6 +1498,8 @@ static void samsung_dsim_atomic_disable(struct 
drm_bridge *bridge,
         if (!(dsi->state & DSIM_STATE_ENABLED))
                 return;

+       samsung_dsim_set_display_enable(dsi, false);
+
         dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
  }

@@ -1506,8 +1508,6 @@ static void 
samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
  {
         struct samsung_dsim *dsi = bridge_to_dsi(bridge);

-       samsung_dsim_set_display_enable(dsi, false);
-
         dsi->state &= ~DSIM_STATE_ENABLED;
         pm_runtime_put_sync(dsi->dev);
  }
--snip--

-michael
