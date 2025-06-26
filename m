Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B56CAEAA9F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB67E10E272;
	Thu, 26 Jun 2025 23:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rHIlbWpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F2B310E272
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:32:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C32FA5C63E5;
 Thu, 26 Jun 2025 23:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55037C4CEEB;
 Thu, 26 Jun 2025 23:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750980722;
 bh=ckM1z62+dzERRsA8njW/QMC1vRSg8enjDPrdmoz/Lmo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rHIlbWpCPNwmNcL0HYK9yTLEIH5uOmpr090lt3qNIXx6tVE8EA61pGmhTQCt/H0eY
 UwFVgz/MDPsX2y3lVhHsJSWuA7LYJ4SqKB+EQluFhxP8YxaTk23J0vYc6aacoF1Wfp
 5j+ZCxFhZ38o0LZDsw21Ck6GNtVVcdnZTID6ArKUaB7SiyHkNi/uM5iJZkxc1plqG0
 jrn0dUpbD7fLllsOdKjNSojE1a5kmwLZdPaTfj3w5Cm1x1ydHGrSThA4+voXH/ZGgv
 tDSv8NasuyOyH6bFxSKDkjUCKc3L16JFMCH054gUlY1IksSRu/TqlHPTmGbQ7rUGxt
 6bd4N0d6PzSrA==
Date: Thu, 26 Jun 2025 16:32:01 -0700
From: Vinod Koul <vkoul@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Francesco Dolcini <francesco@dolcini.it>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Devarsh Thakkar <devarsht@ti.com>,
 Parth Pancholi <parth.pancholi@toradex.com>
Subject: Re: [PATCH v4 04/17] phy: cdns-dphy: Store hs_clk_rate and return it
Message-ID: <aF3YcUfnagD9rHvR@vaman>
References: <20250618-cdns-dsi-impro-v4-0-862c841dbe02@ideasonboard.com>
 <20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618-cdns-dsi-impro-v4-4-862c841dbe02@ideasonboard.com>
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

On 18-06-25, 12:59, Tomi Valkeinen wrote:
> The DPHY driver does not return the actual hs_clk_rate, so the DSI
> driver has no idea what clock was actually achieved. Set the realized
> hs_clk_rate to the opts struct, so that the DSI driver gets it back.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
