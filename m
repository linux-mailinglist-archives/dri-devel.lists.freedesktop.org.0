Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD6122C92
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 14:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F11E6E118;
	Tue, 17 Dec 2019 13:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653EB6E118
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 13:11:22 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so3115127wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 05:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=EZSohn1ysZnbfO+3Bztlv6MzaXMOulcwi+iBjK/JuWw=;
 b=fc2Vim7oz1vcI4NLmDgMW1dhc0j8fgTDpLRrcaLg5cY39SRL+RXduKEm6XXtNlKeLx
 TOCFDNEAPs7T3Xb5xCtFVMzYDjMqGCEDtkbFKQbQPooDyqWVWTGqXlpgT/wwI7tV5Liz
 ggTVdpkqzR2EAt8HHECw0hyjZQI018s5nVgdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EZSohn1ysZnbfO+3Bztlv6MzaXMOulcwi+iBjK/JuWw=;
 b=q/dBe8+LtFVBMGsCTnva8fzYHN8iA9VDavpBgSVo8HVZdOWzuBA02d0zFHCkZfQ/S1
 nG4P6RG6QLUqAtu1QAoFhYDRfv9c/VHqzbsJavvwQETEXY6nQ3ZaZeD948xp0sLbSMZv
 x7B0eqWhimhOL+HO05SCAkpCRjUXeUB8CcZx4zaautoL7KO6f3CqmG4jNnob1KXN8fDV
 SfQ8hNBIThhrNeVq9Mj3qecoVsRHAS19V7pkn+FOoOrB7X93OG1/PeFzozSN+AXaYnDk
 HJHllYQArz+Tll+G5Ajxy5vZAxV0P1OjcR0kovPqJt/TVaF2AdG2RDdsBpR1eD9x2KwI
 cfXw==
X-Gm-Message-State: APjAAAUws8Omgy5gZ5YzebEwIXDxX8rY2dlPLnAR2s/98vOaDm71KOE4
 PuS5WMiBuozDx81JaezQEgRppBASJOE=
X-Google-Smtp-Source: APXvYqwnmrkbC3b8LKKLFJqsp0qQ0RvZn9NSTyd4VwnWz/FmEMNPXPPr1xwYT+qU4vMGwbEpGinYzw==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr5256447wmf.60.1576588280808; 
 Tue, 17 Dec 2019 05:11:20 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id k4sm3028383wmk.26.2019.12.17.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 05:11:19 -0800 (PST)
Date: Tue, 17 Dec 2019 14:11:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 04/10] drm/malidp: plane_state->fb iff plane_state->crtc
Message-ID: <20191217131118.GX624164@phenom.ffwll.local>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213172612.1514842-4-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 13, 2019 at 06:26:06PM +0100, Daniel Vetter wrote:
> Checking both is one too much, so wrap a WARN_ON around it to stope
> the copypasta.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: linux-arm-kernel@lists.infradead.org

Oops, subect should be drm/imx: ofc here.
-Daniel

> ---
>  drivers/gpu/drm/imx/ipuv3-plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 28826c0aa24a..6776ebb3246d 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -359,7 +359,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
>  	if (!fb)
>  		return 0;
>  
> -	if (!state->crtc)
> +	if (WARN_ON(!state->crtc))
>  		return -EINVAL;
>  
>  	crtc_state =
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
