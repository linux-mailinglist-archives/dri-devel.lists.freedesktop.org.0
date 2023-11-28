Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F67FBC62
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 15:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CE810E549;
	Tue, 28 Nov 2023 14:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::af])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083A810E549
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 14:11:48 +0000 (UTC)
Message-ID: <6d0f8057-70f9-46f9-828a-df03c753b42b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1701180706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Hxr6Qi8uAR1GAsmRwi31SrOVsQk0+PK+MAopQh8m5vk=;
 b=lKKIARlyv1H6YGZl6IGyLBEni04sQJfG863/4ZgCGXNR9S/hHpHmfvXyouaj//rnKHuvYk
 43za6NCU8WEn9fiHOOidCkKIH83XwBPPuHZ4e1Grw5BHUwFC6vH+V7cw0wmx5/w3WiJdFA
 LOF/zVvAJBOiCI+vxywRaIkiRGMDZMs=
Date: Tue, 28 Nov 2023 22:11:24 +0800
MIME-Version: 1.0
Subject: Re: [v4,43/45] drm/sun4i: hdmi: Switch to container_of_const
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>,
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20231128-kms-hdmi-connector-state-v4-43-c7602158306e@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20231128-kms-hdmi-connector-state-v4-43-c7602158306e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil@xs4all.nl>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/11/28 18:24, Maxime Ripard wrote:
> container_of_const() allows to preserve the pointer constness and is
> thus more flexible than inline functions.
>
> Let's switch all our instances of container_of() to container_of_const().
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>


LGTM,

Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 16 ++++------------
>   1 file changed, 4 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index bae69d696765..c276d984da6b 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -30,19 +30,11 @@
>   #include "sun4i_drv.h"
>   #include "sun4i_hdmi.h"
>   
> -static inline struct sun4i_hdmi *
> -drm_encoder_to_sun4i_hdmi(struct drm_encoder *encoder)
> -{
> -	return container_of(encoder, struct sun4i_hdmi,
> -			    encoder);
> -}
> +#define drm_encoder_to_sun4i_hdmi(e)		\
> +	container_of_const(e, struct sun4i_hdmi, encoder)
>   
> -static inline struct sun4i_hdmi *
> -drm_connector_to_sun4i_hdmi(struct drm_connector *connector)
> -{
> -	return container_of(connector, struct sun4i_hdmi,
> -			    connector);
> -}
> +#define drm_connector_to_sun4i_hdmi(c)		\
> +	container_of_const(c, struct sun4i_hdmi, connector)
>   
>   static int sun4i_hdmi_setup_avi_infoframes(struct sun4i_hdmi *hdmi,
>   					   struct drm_display_mode *mode)
