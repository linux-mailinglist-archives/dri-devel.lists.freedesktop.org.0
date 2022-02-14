Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEDC4B54B0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 16:24:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB97710E1CA;
	Mon, 14 Feb 2022 15:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB68A10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 15:23:58 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso16131538pjh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 07:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhJtpZeOTdYyGP8p2E+Zf5kH9MRPmhWE9u/AfJAE6Mo=;
 b=kNpDvUysQUEvmZ5w3BuqltpbmJ+AQHLHIWMDxiQovbpTsVj+9FuZt99RgOUZq5xE5z
 Fy2dNXffr+aoxtptpQ/CV8xakhdCRr4LHFq1eSsU3cVa+dY+n41TsXH2Z6xc86dL6awH
 ef9O6j2VP40vC7v4gP52Wcj5FIV0DOn0uVyLtj/rGPUO3CTGm4aw+hqLp7yT6PQkvzwM
 sVfXFiBx7xSTvXvTAcxFzhm0KA8mvLCXx6ZenfBIVt1SJiKYAnJqiPyjtrsF16J5xwPD
 Nxyf4qD1dnaYivBr6+AY/QVA5CHwA3jyuRF0JgouQt3REhlyIb1nI0vKqWelcDKivJgP
 a3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhJtpZeOTdYyGP8p2E+Zf5kH9MRPmhWE9u/AfJAE6Mo=;
 b=bK1zyvhCts0Tx4kyyRkzsnjlTgVjXWCPE2IPxgtk2V08Oyhi/yPkccaZVsXAjprXWg
 YbZpcBTaGFuc6kJ91xG5hUDlUkEl0nkY5ifiWLtDFKd0/u5RWZRdHpWTFFGWk9ckWpVl
 Og3x+7Wm3oooUDNY7UIiYxOWucw3qc7wjOezgeH7WbXL7o2aXij9QtKOOpm+tULsJ7iu
 QKNzkA9DHOz1u6LT0xScjzQXBxjQSm+nKY3R6L/f2LwR4ky9XCQfpbJdolccO28klakq
 Smjqw2apnHMK5AcM9NFjamI/3aSJo71/gaav4qKCnh4q7Xxemqs1VtlT1fa8YswfvNTA
 eIqQ==
X-Gm-Message-State: AOAM531KowAgI5EWsyjJ69lzcKonyJaKnmT1OzejkPuQBqcqI9wT30DP
 Ya2vs4jkzFYGqf9WjxAhuLAcGvSbQLV+cZxpQOq9dA==
X-Google-Smtp-Source: ABdhPJxzlo2fKWRLWKCCBqGfAnMwp753+nt7M/y+3k0m/Ol30ZMFZpSc4+cJI/8d6Ccy3kODmtUkt+Ih+lUayKYwZvY=
X-Received: by 2002:a17:90b:1b46:: with SMTP id
 nv6mr15409095pjb.179.1644852238358; 
 Mon, 14 Feb 2022 07:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20220210103827.402436-1-treapking@chromium.org>
In-Reply-To: <20220210103827.402436-1-treapking@chromium.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 14 Feb 2022 16:23:47 +0100
Message-ID: <CAG3jFytQUetqJ+HrCxSg8njmErCNRSTthCKMy+BRC6LBU0vR6Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/bridge: anx7625: Fix overflow issue on reading EDID
To: Pin-Yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Feb 2022 at 11:38, Pin-Yen Lin <treapking@chromium.org> wrote:
>
> The length of EDID block can be longer than 256 bytes, so we should use
> `int` instead of `u8` for the `edid_pos` variable.
>
> Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>
> Changes in v2:
> - add "Fixes" tag
> - collect review tag
>
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 2346dbcc505f..e596cacce9e3 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -846,7 +846,8 @@ static int segments_edid_read(struct anx7625_data *ctx,
>  static int sp_tx_edid_read(struct anx7625_data *ctx,
>                            u8 *pedid_blocks_buf)
>  {
> -       u8 offset, edid_pos;
> +       u8 offset;
> +       int edid_pos;
>         int count, blocks_num;
>         u8 pblock_buf[MAX_DPCD_BUFFER_SIZE];
>         u8 i, j;
> --
> 2.35.0.263.gb82422642f-goog
>

Applied to drm-misc-next.
