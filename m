Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEA559F454
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 09:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634AB11291B;
	Wed, 24 Aug 2022 07:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4831710ECB6
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 11:04:26 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 888C92B3;
 Tue, 23 Aug 2022 13:04:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1661252664;
 bh=xJ3Fu17rpjZxCTLIeAz6z/zPrh/wUOZvmL04gRfUyQ0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=f6Pi7Z7Mexm/UazkHQfjuHZCva0TIQd99F7RvV2NxcBVrmxTDNELznPkajjFDfrTz
 WoGLICYC9XnkVN0UtfXOMfCrcPpQ7Dtk05aIMJV1DMmFiPez4ZHYp5TFsd8ZdB4s2f
 3Riq1NNtOvIzOYQ4uXTmWTHL4Gj8e6mPMvPt9YRA=
Message-ID: <784e177f-f8fe-0a80-41fa-b9b3019ce16c@ideasonboard.com>
Date: Tue, 23 Aug 2022 14:04:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 4/5] drm: rcar-du: fix DSI enable & disable sequence
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20220822143401.135081-1-tomi.valkeinen@ideasonboard.com>
 <20220822143401.135081-5-tomi.valkeinen@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20220822143401.135081-5-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 24 Aug 2022 07:28:14 +0000
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

On 22/08/2022 17:34, Tomi Valkeinen wrote:

> +struct drm_atomic_state;
> +struct drm_bridge;
> +
> +#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> +void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +			       struct drm_atomic_state *state);
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge);
> +#else
> +static inline void rcar_mipi_dsi_pclk_enable(struct drm_bridge *bridge,
> +					     struct drm_atomic_state *state)
> +{
> +}
> +
> +void rcar_mipi_dsi_pclk_disable(struct drm_bridge *bridge)
> +{
> +}

This one is missing static inline.

Laurent, do you want me to re-send the series, or do you already have 
this applied to your branch?

  Tomi
