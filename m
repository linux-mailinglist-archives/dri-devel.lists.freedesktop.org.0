Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC1C5E763A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6CD10E76F;
	Fri, 23 Sep 2022 08:52:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F20110E770
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 08:52:02 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 486016601FC6;
 Fri, 23 Sep 2022 09:52:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663923121;
 bh=ox4wuykABnxE9Ig+CtH6jcoQRf8aCc6ns6TQ/fos1yc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=X9ny9hfels7ip2vmqUTqCZnEstchQpL/E2O1JEsgRmnPMaH8xqFSRkpfWaQgibGBt
 7KBSIEbw4e62b/b/Oiza+4DMQ0joR+Wmwx76Zmn/xBE38E61JMh8imexQi+3hZAMzc
 ZjUb0vB6agU1dbbGTFUK8bpf9YwJShbNZbTAvCx8iv3GgptIl4mjm1uhOqCdy2vvQj
 BlqK89A+T7S9KTJA8Sv6It2+/hl4QwQx5qRMKtgPE3766IA1U4CevbxbivbPYCMicG
 +G1TnMCh1S+iB3ZQ7W2ST0rSMMGu6XJxXgoBaVmOHuofYHtYIpy7IjYl2yAByMxMcV
 wzvpnR2n+LfXg==
Message-ID: <3fac3cdc-2c05-57b8-d854-a1f517616706@collabora.com>
Date: Fri, 23 Sep 2022 10:51:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] drm/bridge: anx7625: Notify audio framework of connector
 status changes
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Robert Foss <robert.foss@linaro.org>
References: <20220922232103.246955-1-nfraprado@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220922232103.246955-1-nfraprado@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, kernel@collabora.com,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/09/22 01:21, Nícolas F. R. A. Prado ha scritto:
> We already have anx7625_audio_update_connector_status() to notify the
> audio framework when HDMI is (dis)connected, but up until now this
> function was only called during the callback setup. Add a call for it
> to the HPD change handling logic.
> 
> A couple functions needed to be hoisted as part of this.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> ---
> 
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 48 ++++++++++++-----------
>   1 file changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index b0ff1ecb80a5..da54d6a61e07 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1588,6 +1588,29 @@ static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
>   	return 0;
>   }
>   

..snip..

> +
>   static void anx7625_work_func(struct work_struct *work)
>   {
>   	int event;
> @@ -1603,6 +1626,8 @@ static void anx7625_work_func(struct work_struct *work)
>   	if (event < 0)
>   		goto unlock;
>   
> +	anx7625_audio_update_connector_status(ctx, anx7625_sink_detect(ctx));

I think that this can be done in a smarter way.

In this worker, you have a call to anx7625_hpd_change_detect(): this is checking
the status of the hotplug detect signal (see it like a GPIO, as that's just a pin
in the DVI/HDMI/DP physical connectors going LOW or HIGH for "presence" detection),
so you should be able to make that decision in function dp_hpd_change_handler().

(Please correct me if I'm wrong!)

If HPD is LOW, this means that the external display was unplugged, so you should
be able to do something like:

static void dp_hpd_change_handler(struct .....)
{
	....
	if (on == 0) {
		anx7625_audio_update_connector_status(ctx, on);
		remove_edid(), stop_dp()
	} else {
		start_dp, adjust_swing,
		and7625_audio_update_connector_status(ctx, on);
	}
}

That's to make sure that we send unplug events *before* stopping the DP.

What do you think?

Cheers,
Angelo
