Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FD9A9F65D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 18:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3A010E073;
	Mon, 28 Apr 2025 16:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com
 [91.218.175.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D2B10E073
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 16:59:28 +0000 (UTC)
Date: Mon, 28 Apr 2025 12:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745859563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B2C2yn8elBSXELDShaq1pAcO9k6vBEikFCz2S9SRVPY=;
 b=CI03rC4EDCIrP5aneiBluOKbjXSXi1RqFeF9FdLjb0Tst5K2p1266hSx52AJpP/DEaFKh9
 9f5c1TkCrODeWNWJPduCZcvLLs61tN7wZWyqIGCdMxMS22h9dEFcri6kKR2boq4dEkkfiJ
 PhWBoSs+zvM4yDbehkCQ6ECZFocoZCwg7AkgbOKnfcykr2r9OocWPzTFfAe/hwk1dXofUA
 u2HNMQn5LZDAkH188RAogLQwohAlwvaUB1yAKlhbixRoybFIpEaL5UcqypbqlBMnoGn6/S
 GiSTdiTMcamk6HhU8wcc2b1KIWU6LEjQIpnDY7/uKi/2JJWbU70pKK1nqHZOSg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: j@jannau.net
Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Neal Gompa <neal@gompa.dev>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm: adp: Handle drm_crtc_vblank_get() errors
Message-ID: <aA-z5mK4mmgPFNQP@blossom>
References: <20250428-drm_adp_fixes-v2-0-912e081e55d8@jannau.net>
 <20250428-drm_adp_fixes-v2-2-912e081e55d8@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250428-drm_adp_fixes-v2-2-912e081e55d8@jannau.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Mon , Apr 28, 2025 at 01:37:14PM +0200, Janne Grunau via B4 Relay a écrit :
> From: Janne Grunau <j@jannau.net>
> 
> drm_crtc_vblank_get() may fail when it's called before
> drm_crtc_vblank_on() on a resetted CRTC. This occurs in
> drm_crtc_helper_funcs' atomic_flush() calls after
> drm_atomic_helper_crtc_reset() for example directly after probe.
> Send the vblank event directly in such cases.
> Avoids following warning in the subsequent drm_crtc_vblank_put() call
> from the vblank irq handler as below:
> 
> adp 228200000.display-pipe: [drm] drm_WARN_ON(atomic_read(&vblank->refcount) == 0)
> WARNING: CPU: 5 PID: 1206 at drivers/gpu/drm/drm_vblank.c:1247 drm_vblank_put+0x158/0x170
> Modules linked in: uinput nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat videodev drm_dma_helper mc apple_soc_cpufreq drm_display_helper leds_pwm phram
> CPU: 5 UID: 0 PID: 1206 Comm: systemctl Not tainted 6.14.2-asahi+ #asahi-dev
> Hardware name: Apple MacBook Pro (13-inch, M2, 2022) (DT)
> pstate: 614000c5 (nZCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> pc : drm_vblank_put+0x158/0x170
> lr : drm_vblank_put+0x158/0x170
> sp : ffffc00082aa7e70
> x29: ffffc00082aa7e70 x28: ffff80003419e000 x27: ffff80003419e000
> x26: 0000000000000001 x25: 0000000000012400 x24: 0000000000000066
> x23: ffff800033fc8800 x22: 0000000000000000 x21: ffff800029688e70
> x20: ffff800029688000 x19: ffff800029688000 x18: 0000000000000000
> x17: ffffc0015c868000 x16: 0000000000000020 x15: 0000000000000004
> x14: 0000000000000000 x13: 0000000000000001 x12: ffffc000825b3a90
> x11: ffffc00082960e88 x10: ffffc00081b0ec88 x9 : ffffc0008017d0ec
> x8 : 000000000002ffe8 x7 : fefefefefefefefe x6 : ffffc00081bbec88
> x5 : ffff8001de237548 x4 : 0000000000000000 x3 : ffffc0015c868000
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff80003419e000
> Call trace:
>  drm_vblank_put+0x158/0x170 (P)
>  drm_crtc_vblank_put+0x24/0x38
>  adp_fe_irq+0xd8/0xe8 [adpdrm]
>  __handle_irq_event_percpu+0x94/0x318
>  handle_irq_event+0x54/0xd0
>  handle_fasteoi_irq+0xa8/0x240
>  handle_irq_desc+0x3c/0x68
>  generic_handle_domain_irq+0x24/0x40
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ------------------------ >8 ------------------------
> Changes in v2:
> - clear `crtc->state->event` only if non-NULL
> - use a temporary variable to clear `crtc->state->event` before sending
>   it
> 
> Modifying `crtc->state->event` here is fine as crtc->mutex is locked by
> the non-async atomic commit. In retrospect this looks so obvious that it
> doesn't warrant a comment in the file.
> ---
>  drivers/gpu/drm/adp/adp_drv.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
> index 157298a8ff42b95275411dd4a7a0c70780fd86fd..bdf27ee742ea01759b5d571a21b527687ffcada7 100644
> --- a/drivers/gpu/drm/adp/adp_drv.c
> +++ b/drivers/gpu/drm/adp/adp_drv.c
> @@ -331,13 +331,19 @@ static void adp_crtc_atomic_flush(struct drm_crtc *crtc,
>  	}
>  	writel(ADBE_FIFO_SYNC | frame_num, adp->be + ADBE_FIFO);
>  	//FIXME: use adbe flush interrupt
> -	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>  	if (crtc->state->event) {
> -		drm_crtc_vblank_get(crtc);
> -		adp->event = crtc->state->event;
> +		struct drm_pending_vblank_event *event = crtc->state->event;
> +
> +		crtc->state->event = NULL;
> +		spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +
> +		if (drm_crtc_vblank_get(crtc) != 0)
> +			drm_crtc_send_vblank_event(crtc, event);
> +		else
> +			adp->event = event;
> +
> +		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  	}
> -	crtc->state->event = NULL;
> -	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  }
>  
>  static const struct drm_crtc_funcs adp_crtc_funcs = {
> 
> -- 
> 2.49.0
> 
> 
