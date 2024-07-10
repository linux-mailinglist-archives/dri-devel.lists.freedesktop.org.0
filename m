Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703A592D505
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 17:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B905310E09F;
	Wed, 10 Jul 2024 15:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G1xiXe8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F2910E25E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 15:34:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9939CE16FC;
 Wed, 10 Jul 2024 15:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105FBC32781;
 Wed, 10 Jul 2024 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720625599;
 bh=zDVY8tB780k6z4UBCPdCtJgt9crXAab77/6Rj9QcuuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G1xiXe8c6dikEOrQ6IdV0UJ2x0OhCKo3EqQPrKer8X1ZHe7UcBbAFXHEyVsXzk4rn
 tebme7oVZk27Gy/21YNzWl0w6fE3YVnIE1WhtxyHj/p/ek3JF5P9SnJzD+FERUzYZf
 lHIW0RfXO72ryZVjOM4sCQZCT9G0v3/sEB0/ktrZa0B3NbFKVk7Jyl176nKzSn7ZPB
 9uqO4ICGlfAU1cf3lQ2jvir/hxviLP4ti20+Khfg1rcG3b7oobGyYWQHTryrDUiFn3
 BoiUcml49KrL6Ed/ZJS/sdizx/4zOQU8FbrH9MeCSD7+gOC8ljETkmx+b/E881gt4N
 iMFpEGOXI2Dlw==
Date: Wed, 10 Jul 2024 09:33:17 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, kernel@dh-electronics.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <rfoss@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: tc358867: Document
 default DP preemphasis
Message-ID: <172062558439.3107707.14187355988690749078.robh@kernel.org>
References: <20240708150130.54484-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708150130.54484-1-marex@denx.de>
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


On Mon, 08 Jul 2024 17:01:13 +0200, Marek Vasut wrote:
> Document default DP port preemphasis configurable via new DT property
> "toshiba,pre-emphasis". This is useful in case the DP link properties
> are known and starting link training from preemphasis setting of 0 dB
> is not useful. The preemphasis can be set separately for both DP lanes
> in range 0=0dB, 1=3.5dB, 2=6dB .
> 
> This is an endpoint property, not a port property, because the TC9595
> datasheet does mention that the DP might operate in some sort of split
> mode, where each DP lane is used to feed one display, so in that case
> there might be two endpoints.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
> V2: - Fix the type to u8 array
>     - Fix the enum items to match what they represent
> V3: - Update commit message, expand on this being an endpoint property
> V4: - Fix ref: /schemas/graph.yaml#/$defs/port-base and add unevaluatedProperties
> ---
>  .../display/bridge/toshiba,tc358767.yaml      | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

