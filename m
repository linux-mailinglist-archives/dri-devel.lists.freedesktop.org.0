Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 130A689F858
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 15:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6EF113398;
	Wed, 10 Apr 2024 13:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EuOWvRYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE42112959
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 13:40:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B3A9CE28B8;
 Wed, 10 Apr 2024 13:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06818C433C7;
 Wed, 10 Apr 2024 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712756435;
 bh=p18qotW+KxhzNUSz13Cq9m9XVyU+HW3r6Ugdz1OAnps=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EuOWvRYOHfdbejlUerbsP8dhtUr1Qgu6w26fvX7cBEKn2lmz6xed35MKE+xtwk/z1
 ez+VfTqQrwwKX6F1OucTyqsiwACc9iPGB+YjNcDo8OVxnCiyvSPCLLkAqiRewyNpwK
 agdlTopV0dLfiwyXs8JNRdwTgQLG5GD4AJAxe+OL+NQpmjlXoObvqK2r1uAzFfKMol
 RmaOMvf3mNX0IlNbfCf1cE6zgyqS4ma/0oKA8quqfZZoptiGJ4JaunAHTAhwR1Ir6Q
 BwUyLmLUKzx6SYE/PAyFpXI+1ufhtwmpscWjMOF8GLOXJvFfWUb/VDKEXOXRmg2hap
 X4pc6gN78flYw==
From: Robert Foss <rfoss@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
In-Reply-To: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
References: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove
 callback returning void
Message-Id: <171275643072.2948280.4830683289450618114.b4-ty@kernel.org>
Date: Wed, 10 Apr 2024 15:40:30 +0200
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

On Mon, 4 Mar 2024 10:10:06 +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback returning void
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=2caad4f7b024



Rob

