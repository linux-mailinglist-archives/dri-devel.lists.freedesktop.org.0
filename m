Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BEC8CAE72
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 14:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFE010EB41;
	Tue, 21 May 2024 12:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OZDx+OIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2410EB7B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 12:39:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D58B3CE0FAA;
 Tue, 21 May 2024 12:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81845C2BD11;
 Tue, 21 May 2024 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716295189;
 bh=CQqcE0G+QZeu6DzDGfeN7Sv8BFku24oWCpZzI5G77MY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=OZDx+OIL5PjxdfLpNN/fwFDyeF7fUPLmFMBRPBZAl+wXQYWDXJFw8BcxPwBkJUBqI
 yfeojInsfvRzsYcP6mFUMVyMMLeYMTOogg87ZdW4IIABvnuGIyLMBAI+JV+szxHju0
 jeVchB0GU9z2+QRaGIp13GO10JeNZ+prhtfzNMxUVDyeeEhUytF9rpeVX85ni/NHKA
 iM1RJVnvF0fziEWwdxFHiSz1h0IEW3ErbvV/Ia8ma7PlSqnhTpNA0RwXZEPHQTXwWo
 SVYiT08BDpGnjnXQz5ZiAWOEX3AMGCXSSxfUrWpUoClpD3bl4zmjinPXLlADdOTopf
 eGIH+KUYxjFeQ==
From: Robert Foss <rfoss@kernel.org>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Michael Walle <mwalle@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 kernel@dh-electronics.com, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Ford <aford173@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240513021607.129111-1-marex@denx.de>
References: <20240513021607.129111-1-marex@denx.de>
Subject: Re: [PATCH] drm/bridge: tc358767: Enable FRMSYNC timing generator
Message-Id: <171629518524.1420247.5653225897605819257.b4-ty@kernel.org>
Date: Tue, 21 May 2024 14:39:45 +0200
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

On Mon, 13 May 2024 04:16:04 +0200, Marek Vasut wrote:
> TC9595 datasheet Video Path0 Control (VPCTRL0) Register bit FRMSYNC description
> says "This bit should be disabled only in video mode transmission where Host
> transmits video timing together with video data and where pixel clock source
> is from DSI clock." . This driver always sources pixel clock from external xtal,
> therefore the FRMSYNC bit must always be enabled, enable it.
> 
> This fixes an actual issue with DSI-to-DPI mode, where the display would
> randomly show subtle pixel flickering, or wobble, or shimmering. This is
> visible on solid gray color, but the degree of the shimmering differs
> between boots, which makes it hard to debug.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: tc358767: Enable FRMSYNC timing generator
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=d9ca4b760ef6



Rob

