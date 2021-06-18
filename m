Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7C3AD87E
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 09:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93516EA87;
	Sat, 19 Jun 2021 07:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AC06E986
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 08:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624003515; x=1655539515;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=RQal2gD0iwrHc9ZppKiQ+W3oXPHMjyF8tv8gePj7iNs=;
 b=x5oMQ+BmlMDWHI2cb+7KIi9g69t5LE4dNV7TJLOIeLMCLcZl73tn1iKf
 Iy5y+ffknCKGht6hX1/nB/6FSMt3DjKprMXe8743+Um8BZFXV1D/xUXLm
 xbVjZHIHb8bqGz3BGlFrw7O3Nu7cu5zOmVDbMblWKa6le0m70gv/L2Ns1
 BZ/clJrf+0VzJqdhWg45bM36VJDps0wYkma2IihXSukEjEr2x/hfre8GP
 I6/j97x+EeMiiyZaciLvzGZoxfvESPsLMllVi3jTPlQVJTEfMgLZFWCxX
 h05vVRDiIo5IJThA4JmcgSvLr7XA3y4KR6CNd869aAajIh5ei99vZI4xz w==;
IronPort-SDR: MZ69SXR9w1lN7HEuHcGZ7QiBogbYQnTsZ4y1ME3u3U96aAl47xYEMtEXITp60Y3yj92C/yQ8JA
 Ih9dLXt7xIQIi+e9BGUBTy6luqPsWKh4lD+N+ipR3lMBWKXU3HO67Tw+IunWHrztG/zSc9ZhoB
 b0QG3TtPU6MoTnLby1aEQ4xylski3UC+wDgOGuP8nVDHHwUTQzKMXhiF+o/Tybo8gqvCJb4Ot6
 nOzlRkfyQ6LEWkUaq32t3CzSYfpCBTKGGKdAK+FuTImZabNVgsP3kkG543fBLOpC+wPWzOfVP6
 P0I=
X-IronPort-AV: E=Sophos;i="5.83,283,1616482800"; d="scan'208";a="125790287"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Jun 2021 01:05:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 18 Jun 2021 01:05:14 -0700
Received: from [10.12.73.56] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Fri, 18 Jun 2021 01:05:12 -0700
Subject: Re: [PATCH] drm:atmel: Enable the crtc vblank prior to crtc usage.
To: Dan Sneddon <dan.sneddon@microchip.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, <dri-devel@lists.freedesktop.org>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20210602160846.5013-1-dan.sneddon@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
Message-ID: <72ac51ca-a7df-c6ce-ba10-5dd26369e137@microchip.com>
Date: Fri, 18 Jun 2021 10:05:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602160846.5013-1-dan.sneddon@microchip.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 19 Jun 2021 07:44:34 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel, Sam,

On 02/06/2021 at 18:08, Dan Sneddon wrote:
> 'commit eec44d44a3d2 ("drm/atmel: Use drm_atomic_helper_commit")'
> removed the home-grown handling of atomic commits and exposed an issue
> in the crtc atomic commit handling where vblank is expected to be
> enabled but hasn't yet, causing kernel warnings during boot.  This patch
> cleans up the crtc vblank handling thus removing the warning on boot.
> 
> Fixes: eec44d44a3d2 ("drm/atmel: Use drm_atomic_helper_commit")
> 
> Signed-off-by: Dan Sneddon <dan.sneddon@microchip.com>

Is this fix need more input from us, is there something missing (aka ping)?

Regards,
   Nicolas


> ---
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> index 05ad75d155e8..cfe4fc69277e 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
> @@ -232,7 +232,6 @@ static void atmel_hlcdc_crtc_atomic_enable(struct drm_crtc *c,
>   
>   	pm_runtime_put_sync(dev->dev);
>   
> -	drm_crtc_vblank_on(c);
>   }
>   
>   #define ATMEL_HLCDC_RGB444_OUTPUT	BIT(0)
> @@ -343,8 +342,17 @@ static int atmel_hlcdc_crtc_atomic_check(struct drm_crtc *c,
>   
>   static void atmel_hlcdc_crtc_atomic_begin(struct drm_crtc *c,
>   					  struct drm_atomic_state *state)
> +{
> +	drm_crtc_vblank_on(c);
> +}
> +
> +static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *c,
> +					  struct drm_atomic_state *state)
>   {
>   	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&c->dev->event_lock, flags);
>   
>   	if (c->state->event) {
>   		c->state->event->pipe = drm_crtc_index(c);
> @@ -354,12 +362,7 @@ static void atmel_hlcdc_crtc_atomic_begin(struct drm_crtc *c,
>   		crtc->event = c->state->event;
>   		c->state->event = NULL;
>   	}
> -}
> -
> -static void atmel_hlcdc_crtc_atomic_flush(struct drm_crtc *crtc,
> -					  struct drm_atomic_state *state)
> -{
> -	/* TODO: write common plane control register if available */
> +	spin_unlock_irqrestore(&c->dev->event_lock, flags);
>   }
>   
>   static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
> 


-- 
Nicolas Ferre
