Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB5F5F2FBF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 13:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF06C10E32A;
	Mon,  3 Oct 2022 11:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3B310E326
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 11:38:41 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EAB886602045;
 Mon,  3 Oct 2022 12:38:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664797119;
 bh=NhrwS4Jkzt4C7LwfgGSyg0vs/QLGg8vmZrzAYAY6HjY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=R0+mA/ZlPbkCIhzaYKUoP/AaiZpjjg9cAdBupiug68wkwIUeO1c8bcnyAnKXG1zj3
 zO9PjZc4C9NtL/V7Kv2lTdBGBRDsFCf8XoVi/gnndTrKN0dOPXMWysOifLePyTIrpz
 dKPOQRvRmJSYGGO+5dYzmHUNJfU/sKIuvXb/nGwrliV83gXB+9e5o+JclD/C8IDqHb
 XeUi3idrPBECw+EpoRrK/TfqSWbMg6NvHdgxUMgp8JmCmHiuBc4kPjmkOPIB/fCU2K
 bdh1Hxj3/MMKP65UoRKpA6RPnhOgVXUC6EmAoIZKJ5yvNGZlQxKr7HnqKM4J4RFd9H
 osLH+y9YRGYwg==
Message-ID: <27115639-bfe4-4e8a-f557-57a26ccd042f@collabora.com>
Date: Mon, 3 Oct 2022 13:38:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] drm/bridge: it6505: Add pre_enable/post_disable
 callback
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20221003050335.1007931-1-treapking@chromium.org>
 <20221003050335.1007931-3-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221003050335.1007931-3-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/10/22 07:03, Pin-yen Lin ha scritto:
> Add atomic_pre_enable and atomic_post_disable callback to make sure the
> bridge is not powered off until atomic_post_disable is called. This
> prevents a power leakage when it6505 is powered off, but the upstream
> DRM bridge is still sending display signals.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


