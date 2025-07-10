Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D6AFFCB0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 10:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFB710E1B4;
	Thu, 10 Jul 2025 08:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mWTOgx4P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5749C10E1B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 08:45:02 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-558f7fda97eso390810e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752137101; x=1752741901; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fKdgn7tzsSWNEcaz5ZCKVyQCaGiMlPWSiLSm5o0J6RA=;
 b=mWTOgx4P1HiJUzfpJPq2l8GulRsYJ5ERvnVFO5sjdb401Iz3j1z4+/sHPnL3JC6EnI
 G4HiJMpHQt6sU46ow1hK+A99dn+cjhI3MlUxSLrRDSWQRfHjkZeCDfmYrkyri4/KE0Y9
 ATovK6IptENHIZ7oQ5c1r8nzhshejO0DWxBuiTuNFN+MhuKEIUX69mSibsRFfilyZP75
 gsjmPH/y4TZ3F5x5d9ELfg3xci89Jflchx2l/iYIEBXwbfpZwQMjSymzUdlm2PKjGEJZ
 6f/bnSStGGp7YlLItvYBccZUqkBOG5uOrpmSerfULQSavD/lCE8/m0+rhEFs6LtMYDUU
 txlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752137101; x=1752741901;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fKdgn7tzsSWNEcaz5ZCKVyQCaGiMlPWSiLSm5o0J6RA=;
 b=ayc5PHDuwzQ2HN8PXGjF8RU/YQD9PbHV69MJi0t5BGxx+6fFyD2HKlsfp+StnHAYMo
 CK1ZJuSqaoB6I/qwSVGF8/1pdlG2hYxmDRM+2lSMZnJgNW3gUXJfJ4U1WZ77GCTzfUbh
 h0+AuabkVl9Jeh4N57auN2ZpB6YcmLf8bI9Pt3t8YrFMkI+9hkYbMlTJ92o7XSNryDOk
 PdUL/G5VZISEjIyHlvqJXyXxYOgrPXeYGsHkd1hLhNpjwvq2CuG03+yeOspwGq4FzkXU
 9eDgkCTqDncpmw9/DZFDrJZM5K08iQF1q+YFjhXAyyJ3sZFjZYfKa3RYZf0KDorDgcwh
 fNQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4hvqiND7ICZRmmU7KLItCT1xXyN+1oDb8PmKGXrQqlWbZ1qhhAmoMWFH04YeieIuQWiJEH1tBM4c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZKP2RcS2pPpShHiISjbp3mmauF1mnlNe9ZYwnIsIr1VEaqKd8
 xwkdvbSJzS1u8VbZeaVRrjsxNuoCjNGbYwNuBUHo1SnYG21t1f5ebE1U
X-Gm-Gg: ASbGncvmQmYhLq+zx3xjszOSV5XErFsJUEEYfHpQUG2Xo2NENNxqfwxNVGEzihYswHg
 +g1aDwYbK/J/ShAxKnPMpLwLunBidZlq2YUEqsAboK+A/9Q6p3D40hvm5AhCroZdbFziLToTIc1
 QW6QZi1GdML0t2ZN1gQAHaRejAFiBS0r6JTFA1Vx46+90KXBSBBzhqItcpT6JXJxdAlvAPCgLaU
 CsRgFEEqTdN6E9+WO7vdG6a10/YnHWx+p/vkYo5YrWmGeXVCeYugS795+pR8YzHeKlQi/3rHy3a
 4D9BAjhc0nJ4sBkL3Yiod+QKwrsiFk+7wVxRz2BSjpupAdkmX5yTcSlu181gVFlDNpus1azhPpP
 7rfNf0s4PwPksqN2RCDsKFRraNrl4PhZ0CjA9prWwz4Q7ffCgI2E3Rw==
X-Google-Smtp-Source: AGHT+IHCpBc1171VY6lUvPoWG4vrSAtb9/OKExB5VZfZ0Hf6igfxd/hFTtzwqncaXe8j8hN1gV5DIA==
X-Received: by 2002:a05:6512:10c1:b0:558:f7fc:87c4 with SMTP id
 2adb3069b0e04-5592e3e0f5dmr646988e87.32.1752137100272; 
 Thu, 10 Jul 2025 01:45:00 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4464:423a:5ae9:509e:a65e:81f5?
 ([2a00:1fa0:4464:423a:5ae9:509e:a65e:81f5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d0942sm278431e87.138.2025.07.10.01.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 01:44:59 -0700 (PDT)
Message-ID: <924e885c-dc19-49f7-9991-58b6e248b208@gmail.com>
Date: Thu, 10 Jul 2025 11:44:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: renesas: rz-du: Set DSI divider based on target
 MIPI device
To: Chris Brandt <chris.brandt@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hien Huynh <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>,
 Hugo Villeneuve <hugo@hugovil.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-3-chris.brandt@renesas.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20250709205532.747596-3-chris.brandt@renesas.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/25 11:55 PM, Chris Brandt wrote:

> Before the MIPI DSI clock source can be configured, the target divide
> ratio needs to be known.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 4ad0be03a5b4..a8796df43f75 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
[...]
> @@ -666,6 +667,22 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	drm_bridge_add(&dsi->bridge);
>  
> +	/* Report required division ratio setting for the MIPI clock dividers

   /* should be on a line of its own (unless you do a networking patch)...

> +	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
> +	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
> +	 *
> +	 * pllclk/2 = vclk * DSI divider

   Why no spaces around / while there are spaces around *?

[...]

MBR, Sergey

