Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3AC9CDAA3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 09:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3F10E3C3;
	Fri, 15 Nov 2024 08:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="H4wn9Nmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A1010E3BB
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w8OgLECi2MzZsuLHWKXzJxOoaKR0j3CLKXbFjs87K0A=; b=H4wn9NmrHi9wGBUh0ZpeZIP4yG
 O/OfEgazN1CVhu0ANGgMMdfF3dkkI+s6IaOdz/U7FBu/KnBOymcEFwb+QXo8Frnah+iE5wHycU+dZ
 5Ydl+h0u9cwrjHF/q/nGdisjH1ST7orjL8eS/CBAzMQJdFd6g2TWfcVN4wiVLJ6rruvn6xfcH5sSf
 pggH4+Zr5QPpOr/MbiCqoAQzgQxrZMKunZ5OqfeGzq9BYLMISF5WRCn0hLkl7D/8DqgkjyAXhLBFL
 QatooX0HDjyNdnn+ONAj6zIt4tTLJVZk38Bk3AOjqZ4CqfsvCZNcrk8S9eHaAAh1qfMA75qUzNLMw
 iJ3r6fYA==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tBrn1-0000Ns-Vn; Fri, 15 Nov 2024 09:34:52 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Alexey Charkov <alchark@gmail.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 1/3] vop2: Add clock resets support
Date: Fri, 15 Nov 2024 09:34:50 +0100
Message-ID: <3346283.VqM8IeB0Os@diego>
In-Reply-To: <20241108185212.198603-2-detlev.casanova@collabora.com>
References: <20241108185212.198603-1-detlev.casanova@collabora.com>
 <20241108185212.198603-2-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Hi Detlev,

Am Freitag, 8. November 2024, 19:50:39 CET schrieb Detlev Casanova:
> At the end of initialization, each VP clock needs to be reset before
> they can be used.
> 
> Failing to do so can put the VOP in an undefined state where the
> generated HDMI signal is either lost or not matching the selected mode.
> 
> This issue can be reproduced by switching modes multiple times.
> Depending on the setup, after about 10 mode switches, the signal will be
> lost and the value in register 0x890 (VSYNCWIDTH + VFRONT) will take the value
> `0x0000018c`.
> That makes VSYNCWIDTH=0, which is wrong.
> 
> Adding the clock resets after the VOP configuration fixes the issue.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

patch subject should be "drm/rockchip: vop2: ...." please


>  static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  				    struct drm_atomic_state *state)
>  {
> @@ -2057,6 +2079,8 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
>  
>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>  
> +	vop2_clk_reset(vp);
> +
>  	drm_crtc_vblank_on(crtc);
>  
>  	vop2_unlock(vop2);

this conflicts with the merge gamma lut support, can you please rebase on
top of drm-misc-next? Or alternatively just tell me if it should be

	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);

+	vop2_clk_reset(vp);
+
	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);

	drm_crtc_vblank_on(crtc);

----- or ----
	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);

	vop2_crtc_atomic_try_set_gamma(vop2, vp, crtc, crtc_state);

+	vop2_clk_reset(vp);
+
	drm_crtc_vblank_on(crtc);


Thanks a lot
Heiko


