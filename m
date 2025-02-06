Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB19A2A8F7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC51410E2D3;
	Thu,  6 Feb 2025 13:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pDZ2ygPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA23B10E2D3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:04:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7F1C55C57E4;
 Thu,  6 Feb 2025 13:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773E5C4CEDD;
 Thu,  6 Feb 2025 13:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738847068;
 bh=HcPtGRcTHAOfFGOkTyn/W0r0zfnZmlWtrN18FEpXJh8=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=pDZ2ygPJsmDFa8WwJ3UD3N5GE6qpleBBL5vG7ZH/EnrMA+YS+Euxx8GgnLzhwSC3e
 Mk5a0IwDMiUW13tzHVnwrZqM8PqUTbEt5UeLzUSdxFjSfBjh4f5hsk24BkpzE5m6Yf
 pJ8E2hhl4IYgr5mYL854fDdkqVJKP3nz5MsZA842RI+JCzvt65rFQtQL9dL+8Guvmo
 N0msJyO/UuXWpzRfEa6Az05uyqbHFlBAQ6l3fgz13Ho0DD4gSALD5xQz9JtQ+0l6/x
 i1W39I4VgyzT7A76IR5D+W2/rdNNy5jveHMG9NZmA2OeVjiSc/fTX+Q3byEdInWMXn
 IDVqw/q55Aw0A==
Message-ID: <cc915f4a4aa81e1a26e768c54c26c195@kernel.org>
Date: Thu, 06 Feb 2025 13:04:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
In-Reply-To: <20250203161607.223731-4-herve.codina@bootlin.com>
References: <20250203161607.223731-4-herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Conor
 Dooley" <conor+dt@kernel.org>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Rob Herring" <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 3 Feb 2025 17:16:05 +0100, Herve Codina wrote:
> The current code uses a the reset_pipe() local function to reset the
> CRTC outputs.
> 
> drm_atomic_helper_reset_crtc() has been introduced recently and it
> performs exact same operations.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
