Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FEC4DD7DF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 11:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A8B10E9B8;
	Fri, 18 Mar 2022 10:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0687910E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 10:22:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 362351F45DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647598921;
 bh=W1u39IUbe6otztE9r97TmBCaSkIJMT4WAPdgwQbuLz4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iyNSFjkU8INvl3lzVLbYVltGn9Ljcetd9s8dl/V8f5DVEU00xl0ZDrqbXRsL65QYc
 UoeyDwjqn2KUdwJYnh2luQ44Ht+3XAgexrigTM7hX0WFQwVZFoY6kyhOAHAj7xn1UN
 uwcXJkRlIm/z0mP82WxrdoYQeCNZ4pjawzoLTPZpRC9vBB4NUFLXMJJIUcJwAp1Rrw
 45qYx9I4aN+L8o8FrQ6sR70thPKtHdlYwfCY89nbYDEJMtJkminYYjuULIgIuK6Gsk
 5iQbJZfsZDXGcjQckZrH245rhABMCJAiZ+VD9Xae84TfHqV13qmye6VmojaJWYAE8Q
 m6U05UKxQXLTw==
Message-ID: <bb78f340-4a37-33ad-55d6-805f64e1389c@collabora.com>
Date: Fri, 18 Mar 2022 11:21:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/2 RESEND] drm/bridge: parade-ps8640: avoid race
 condition on driver unbinding
Content-Language: en-US
To: =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20220311093406.4068019-1-ricardo.canuelo@collabora.com>
 <20220311093406.4068019-2-ricardo.canuelo@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220311093406.4068019-2-ricardo.canuelo@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, andrzej.hajda@intel.com,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/03/22 10:34, Ricardo Cañuelo ha scritto:
> When unbinding a DRM master driver there's a race condition that
> sometimes results in an invalid vm access when userspace (gnome-shell)
> issues a DRM_IOCTL_MODE_GETCONNECTOR ioctl right after a bridge has been
> removed from an encoder's bridge chain.
> 
> This means that once a bridge has been disabled and gone through
> ps8640_post_disable(), if ps8640_bridge_get_edid() runs afterwards as a
> result of that ioctl call it will call drm_bridge_chain_pre_enable()
> and drm_bridge_chain_post_disable() again in a bridge that has been
> already detached.
> 
> Setting `ps_bridge->pre_enabled = false` at a later stage of the
> bringdown path and calling drm_bridge_chain_pre_enable() inside
> ps8640_bridge_get_edid() only if needed avoid this, although a proper
> subsystem-wide fix would be the proper solution, since the same type of
> race conditions might happen somewhere else.
> 
> Tested on an Acer Chromebook R13 (Elm, MT8173) with Debian Sid.
> 
> Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/bridge/parade-ps8640.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 

