Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 306B3B9CD37
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 02:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D3A10E261;
	Thu, 25 Sep 2025 00:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rl5MdRO4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3275410E261
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 00:15:49 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cXDl53gZvz9tfZ;
 Thu, 25 Sep 2025 02:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758759345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bTtDLT8H2plsrrvyz4ktwDsg5w24dGcjLmDpwykIzss=;
 b=rl5MdRO4kh7Cu1/5cEAoVYY6++WFy7gocUO6QYAvoShlRgs3056mqhgjfayP+2PcjyWXtO
 d9JHB2InCx9/0ATXWHcD0hlhqVegLCwZUen6+SLgp40Ba+N3Ixkq2X56oVfXPPiK6OzeRt
 gDwhClZYD1hJACc3DKyuCXgsg2wT3b4o7XjSw69BZfyR+AKY+48NYMIlKTlDrlG+LK3AsB
 4WAWFFpSaK7+X03Pv35KXE4kNHBtBp2pfSD9loNaqIYHpoAnA1G/BjzXScHK5lUuqWqOE3
 049qYq+Wjjsxcu3r2ISTvAYVHVal79U4jCN5XCR7XhAjJ8vOxpTnSv3+HxuEMQ==
Message-ID: <6e50e9fb-10f5-48e6-bc04-ec66ca90a626@mailbox.org>
Date: Thu, 25 Sep 2025 02:15:41 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/panel: sitronix-st7789v: fix sync flags for
 t28cp45tn89
To: Sebastian Reichel <sre@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Riesch <michael.riesch@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
References: <20250924-t28cp45tn89-fix-v1-1-8e8f52239c84@collabora.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250924-t28cp45tn89-fix-v1-1-8e8f52239c84@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: wfjs4nj6e736ezfw8su1auuimktxzj6j
X-MBO-RS-ID: 93eb9d9084b88f6345c
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

On 9/24/25 11:46 PM, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> I planned to set the polarity of horizontal and vertical sync, but
> accidentally described vertical sync twice with different polarity
> instead.
> 
> Note, that there is no functional change, because the driver only
> makes use of DRM_MODE_FLAG_P[HV]SYNC to divert from the default
> active-low polarity.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Closes: https://lore.kernel.org/all/20250923132616.GH20765@pendragon.ideasonboard.com/
> Fixes: a411558cc143 ("drm/panel: sitronix-st7789v: add Inanbo T28CP45TN89 support")
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> index 04d91929eedda092b966b8cffdef5b267748f190..dedf0a390a88dd45a8179e2d22e872128c87cfda 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -261,7 +261,7 @@ static const struct drm_display_mode t28cp45tn89_mode = {
>   	.vtotal = 320 + 8 + 4 + 4,
>   	.width_mm = 43,
>   	.height_mm = 57,
> -	.flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_PVSYNC,
Is this panel somehow special with its NHSYNC / PVSYNC , compared to the 
other supported panels, which all use PHSYNC / PVSYNC ? I would expect 
all of these DSI TCON to use the same polarity, how come this one needs 
NHSYNC ?
