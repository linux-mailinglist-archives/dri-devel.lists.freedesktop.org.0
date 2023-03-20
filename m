Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F48C6C0F87
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012B010E32F;
	Mon, 20 Mar 2023 10:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD4F10E32F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:44:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j2so9839616wrh.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679309057;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MGEZCQ150WLMwboCRH3jhHI9TWpdx3QCBwHBAGlQva8=;
 b=n2/0i2L0Dz4SRvTTNgGnznlHXJo0b4MZGU5NGLIgSNHRwOAHRjImLnm+6DrTRGFq93
 gokQPiOIeusC9nZf4aiHUwrXexNyFRkSTDZVoHVdeMstDOfau8kJEBQ/5tA99KbYedgD
 Y5sRh8B/PNF8Mr3SS/w2o4bD8Ld5lVNwYhEKo1QeZSaRNhzy6AsPUMWjXrFUOVRjX2bt
 KODRrfw7su6HFPR7Lei+5Td41sl6u+tI3T5Q403vrfkLlg/G0mb9IMVv/n5SFu6BllQi
 qWsRe506okSNSdx8NWAqW2u6dRNAMOUSDf89e1gn1dhoVa9OlQX8fWsheVGdFTEtv1Jo
 zZJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679309057;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MGEZCQ150WLMwboCRH3jhHI9TWpdx3QCBwHBAGlQva8=;
 b=lC14OMlv8cF+SODIJCDCt3USajo2vyvFu7wF7GLbBfEZmmZmAbvaA7rPB3QzQ7rFZl
 nooHEcUryqoons/11i3PYiBvsF9dT09R84xZBVzZrvb0EzC2OzZcE3KIZhRW7U6trezm
 YmBpyjvcNJWdVEYB6xTvJmVWUMK0ZbKx2Sz1kcD7Y0PzW6ndYoXNXPfcMBcPs8eXIAku
 +MMY5qHkFSjN5aZYR+qsa12q0c2RYPMEn5jplbbAZK2B8AXY9k6Dmn39bjZbjkKWwX0J
 EZZlaqlfezICZcKeBgfXtazKv8N7wFGTAlqx41zAbU1ablstL+jagO/guXWAcd8/WGG+
 hhVg==
X-Gm-Message-State: AO0yUKWlIniOIdtiaANZL7V4kSbrGl39azcFqUNwI/7PjyKXcDwK0Ghx
 airjW8O/Dn+onxeUHEq9STmaCg==
X-Google-Smtp-Source: AK7set8ws1fvI/lQ/aLItuJCYxfZJ340DRxEnPFrM8z3p+AXst2wtKtiztvyfSGEkh6pYlpHvg2pgQ==
X-Received: by 2002:a05:6000:1144:b0:2c7:a3c:5bd6 with SMTP id
 d4-20020a056000114400b002c70a3c5bd6mr13422741wrx.52.1679309056890; 
 Mon, 20 Mar 2023 03:44:16 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 c15-20020adffb0f000000b002c6e8cb612fsm8537741wrr.92.2023.03.20.03.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 03:44:16 -0700 (PDT)
Message-ID: <afc44c13-0863-d1de-df03-30b83f5a015a@linaro.org>
Date: Mon, 20 Mar 2023 11:44:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/bridge: nwl-dsi: fix packet read ISR handling
Content-Language: en-US
To: Kevin Groeneveld <kgroeneveld@lenbrook.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230318223621.4239-1-kgroeneveld@lenbrook.com>
Organization: Linaro Developer Services
In-Reply-To: <20230318223621.4239-1-kgroeneveld@lenbrook.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 18/03/2023 23:36, Kevin Groeneveld wrote:
> In some cases the NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD interrupt flag is not
> set along with NWL_DSI_RX_PKT_HDR_RCVD when the initial interrupt fires.
> Since the NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD_MASK was not set then the ISR
> does not fire again when NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD is finally set
> and the read times out.
> 
> Also the read packet handling checks for NWL_DSI_DPHY_DIRECTION which is
> not always set when the ISR for reading the payload runs. Instead it seems
> better to check xfer->direction is DSI_PACKET_RECEIVE (more similar to the
> send packet case).
> 
> The above two changes were required to perform a successful DCS read from
> a display with a Chipone ICNL9707 driver IC.
> 
> Signed-off-by: Kevin Groeneveld <kgroeneveld@lenbrook.com>


Thanks for the patch, can you provide a Fixes tag ?

Neil

> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 6dc2a4e191d7..241568a17f60 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -334,6 +334,7 @@ static int nwl_dsi_init_interrupts(struct nwl_dsi *dsi)
>   {
>   	u32 irq_enable = ~(u32)(NWL_DSI_TX_PKT_DONE_MASK |
>   				NWL_DSI_RX_PKT_HDR_RCVD_MASK |
> +				NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD_MASK |
>   				NWL_DSI_TX_FIFO_OVFLW_MASK |
>   				NWL_DSI_HS_TX_TIMEOUT_MASK);
>   
> @@ -489,7 +490,7 @@ static void nwl_dsi_finish_transmission(struct nwl_dsi *dsi, u32 status)
>   	    status & NWL_DSI_TX_PKT_DONE) {
>   		xfer->status = xfer->tx_len;
>   		end_packet = true;
> -	} else if (status & NWL_DSI_DPHY_DIRECTION &&
> +	} else if (xfer->direction == DSI_PACKET_RECEIVE &&
>   		   ((status & (NWL_DSI_RX_PKT_HDR_RCVD |
>   			       NWL_DSI_RX_PKT_PAYLOAD_DATA_RCVD)))) {
>   		end_packet = nwl_dsi_read_packet(dsi, status);

