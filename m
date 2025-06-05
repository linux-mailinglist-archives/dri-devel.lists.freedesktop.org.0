Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA9ACF973
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 00:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F5010E9BC;
	Thu,  5 Jun 2025 22:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VTxpUdJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A788010EB08
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 22:01:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C1B9861F1D;
 Thu,  5 Jun 2025 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409A4C4CEE7;
 Thu,  5 Jun 2025 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749160877;
 bh=LSWvhFvn4bSvUg9aMhGnvwKlF1PbeLBvfGTYfwBBF+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VTxpUdJ5OHKZjXAi+PQNclXJB8RI+uPvU8mIL52gQ6MxUBUPmyd3TpdB59NsjoCFs
 w1NnTzk7G+bIZ8C4mX0sRObH7XokmO/WOvDtjspEm99M+NHf6iVMu0oaQuMsHjhXVj
 kZMXPqb8oz46aCYwtnCQGKlauDA3NYjq4TFtEjIqbnOLSVjIERmQuJ+3YRc4qkiATs
 Ww587r/V4MBABbHZuLb6tdLAnNDIfc/3K+ox4K1udF2AkdokpUpjyAPMIspQV2hknt
 Q88ELbggQTWNM5eEjwUKo7bVLfC52GP6oAefKl6ZnPwL+vyyA+12yBSASZk1d+JFaT
 z2l/J3O+VVymQ==
Date: Thu, 5 Jun 2025 17:01:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: drm/bridge: ti-sn65dsi83: drop $ref to fix
 lvds-vod* warnings
Message-ID: <174916086474.3326887.3182401787143665659.robh@kernel.org>
References: <20250529053654.1754926-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529053654.1754926-1-andrej.picej@norik.com>
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


On Thu, 29 May 2025 07:36:53 +0200, Andrej Picej wrote:
> The kernel test robot reported a warning related to the use of "$ref"
> type definitions for custom endpoint properties
> - "ti,lvds-vod-swing-clock-microvolt" and
> - "ti,lvds-vod-swing-data-microvolt".
> 
> Using "$ref" with "uint32-array" is not correctly handled in this
> context. Removing "$ref" and relying solely on "maxItems: 2" enforces
> the intended requirement of specifying exactly two values, without
> triggering a schema validation warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505021937.efnQPPqx-lkp@intel.com/
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml      | 4 ----
>  1 file changed, 4 deletions(-)
> 

Applied, thanks!

