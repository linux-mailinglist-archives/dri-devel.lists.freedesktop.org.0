Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530F75F2FC1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Oct 2022 13:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447B610E329;
	Mon,  3 Oct 2022 11:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6A910E329
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Oct 2022 11:38:50 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E26276602045;
 Mon,  3 Oct 2022 12:38:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664797128;
 bh=VaX129b4BNwVQU4FPh9jbsOSti9h5ZFnOnyy64nSsnM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YXMd6j0kIOIjv7crq7kTWn8nHhYIHjMOXxJGSeOHA9HD0/0Pd7wKgnyVCFjutzDBm
 w+zdjMDKDLQV9c6ZyBwNLePYI6zLn1eeQbS9/zxqvQExEaA+KVqoGBCHJX2msaXKu6
 7BtVIqn4KA4eAhGApyavHGLg1igD6lMgkZLNflEw/vXZQH5sFXK5/YJqMWJhXyk9LF
 JzPuFiPeyvYr9xH/GtVzuwusTrREvmqH5P1kndVc4JEQwDHv+brd3ujqe/oB2/jXy1
 aeyTh466cxuRfTauV9tyXTG/VZxhW63yptaFDBzXSCMkg96HGLySO1v4z82lwYopUN
 ekRoIKkCYbDpw==
Message-ID: <cece2c1d-6e9b-d850-5321-31fae15cadb7@collabora.com>
Date: Mon, 3 Oct 2022 13:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 1/2] drm/bridge: it6505: Adapt runtime power management
 framework
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20221003050335.1007931-1-treapking@chromium.org>
 <20221003050335.1007931-2-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221003050335.1007931-2-treapking@chromium.org>
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
> Use pm_runtime_(get|put)_sync to control the bridge power, and add
> SET_SYSTEM_SLEEP_PM_OPS with pm_runtime_force_(suspend|resume) to it6505
> driver. Without SET_SYSTEM_SLEEP_PM_OPS, the bridge will be powered on
> unnecessarily when no external display is connected.
> 
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> Changes in v2:
> - Handle the error from pm_runtime_get_sync in it6505_extcon_work
> 
>   drivers/gpu/drm/bridge/ite-it6505.c | 33 +++++++++++++++++++++--------
>   1 file changed, 24 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 2bb957cffd94..685d8e750b12 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -421,6 +421,7 @@ struct it6505 {
>   	struct notifier_block event_nb;
>   	struct extcon_dev *extcon;
>   	struct work_struct extcon_wq;
> +	int extcon_state;
>   	enum drm_connector_status connector_status;
>   	enum link_train_status link_state;
>   	struct work_struct link_works;
> @@ -2685,31 +2686,42 @@ static void it6505_extcon_work(struct work_struct *work)
>   {
>   	struct it6505 *it6505 = container_of(work, struct it6505, extcon_wq);
>   	struct device *dev = &it6505->client->dev;
> -	int state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
> -	unsigned int pwroffretry = 0;
> +	int state, ret;
>   
>   	if (it6505->enable_drv_hold)
>   		return;
>   
>   	mutex_lock(&it6505->extcon_lock);
>   
> +	state = extcon_get_state(it6505->extcon, EXTCON_DISP_DP);
>   	DRM_DEV_DEBUG_DRIVER(dev, "EXTCON_DISP_DP = 0x%02x", state);
> +
> +	if (state == it6505->extcon_state)
> +		goto unlock;

Even if it's unlikely for anything bad to happen, please add error handling,
or we might end up with unbalanced pm_runtime calls.

	if (state == it6505->extcon_state || unlikely(state < 0))
		goto unlock;
	it6505->extcon_state = state;
	if (state) {
		....
	} else {
		....
	}

Regards,
Angelo

