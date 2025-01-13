Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7BA0B336
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE7110E5ED;
	Mon, 13 Jan 2025 09:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rE94vW8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5610E5F6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:40:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53e384e3481so3704195e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736761207; x=1737366007; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B4ZnILMs3Sqik1UwgOJjEpIcuGVrAd2tpCnx4OTVQI4=;
 b=rE94vW8v/iSPA4h7lnzeTh/NPDLzq1Xf+/ystsQEPv652wuuwW4HaICZkhwUvmSjN2
 9+6GjvxOBRgr1Gi6Y7z4ojyG98F7QrTQAZ9TlpalFA8YhqgibYTA2dGyBNSUESl8gt3r
 Kd5qeCDt6AOZfGderkGO4VYwcSAsjAZNfN67xe4GGPHughuWAUzLlMY35Vhny8bAvUxH
 X4dON6TrrIP2NRWl9iUqb2UNyU+0Fh//xZ+81zXmUTOyHmmFg9pkLXhFtEA2xiiJu/yl
 CZ9w8eSpk9XEAzfpmLpUdATwnZjBeIe9CXT1Ue7Xl2+jHKHn87i34pndRoN0gjnYzp5J
 +g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736761207; x=1737366007;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B4ZnILMs3Sqik1UwgOJjEpIcuGVrAd2tpCnx4OTVQI4=;
 b=OCWRq0KVdnW8sVa3a2mv5rF3QZKgG1Sbc8fbEDkheijnkoAe3n/rhbCfm4KKMVbS+0
 u1h1l/s0eqFevojiCpgLX7pYrgpvCCjl7Ai1nEQEdhxIIL2iGbFVhdAy0qnYzl2I8p4G
 mOnz+XbyJpK33HPp+iDjW7t5QErAc/cD7BnkO2K1090J4NeIY2ODoz45L9XysoZ8d0Rr
 zudt5MD1gcneM5m/nM7KErvP2ZqQYPtxwt3q7gD8EmO6IICEqvmympyUWbyUk5SdPaeE
 9V/j4O7lfwV45fcIoISdKlRR/fiJH6EpdZycMgXTHFQfWaDVjh6TlqxfFvQNo/ThHp65
 vATA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl7qCoNrfnZzLkafFrAInjbWQieke//G4fI21FA3di5h/4RMlhX5nsRg1BElRzD4Z0hBMKpmiVd7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGnSrWC2pp4oHIfnLOjNw64rJjpKH9UYuio7ZW4wWV4XOfEOFx
 DkgH7nH4knG2F7WKcWQBPEweEvkUSCZzlInl2mtjxezoKp0kmrZ+tUIqsoFBw6s=
X-Gm-Gg: ASbGncu7fGaJd3gLG7uKpQ3bkZxhD71FWSfxr3UMxAP+tWUlPaXQWUWsFgtr2FHWdFD
 V+7KR9selQ03B0Uvfgb2BEPeJKLDYY/DJHvcXKxYrmLni20pSLGPhAUy7PzdcqR6OLeZqqput6M
 cR0FOSIlD8BeuwCtWQ8fnDjXoA/2L4W67fUJTY+bmQSP2sTFk4WAAhsXZmZw/25kEbUU0EcOu6P
 Dtk6hNovhNmI8s+0OYdWdY2+y4LclFpdAxxxDTdumxnfVERcF1qbOpRE9lZb/G2HtfrNqFiLDx5
 MaLvk+loukAm4z76YwUDWICiH0EYfVCs9gd9
X-Google-Smtp-Source: AGHT+IHoDHwrDwH2BtUZfPmkbuWM5Vya5vfye+xXd5cy8w47jADejwEa/cvWxg9BRtrdpFI3GRX4Fg==
X-Received: by 2002:ac2:51cd:0:b0:542:9987:6e9f with SMTP id
 2adb3069b0e04-54299877145mr2052777e87.53.1736761207187; 
 Mon, 13 Jan 2025 01:40:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea7616sm1282041e87.133.2025.01.13.01.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:40:05 -0800 (PST)
Date: Mon, 13 Jan 2025 11:40:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/12] drm/bridge: cdns-dsi: Fix phy de-init and flag
 it so
Message-ID: <dqmzdxhgnabfq6zzbd424ajfd734gza5aitmk5bfswff52d76r@2swxl627az3d>
References: <20250111192738.308889-1-aradhya.bhatia@linux.dev>
 <20250111192738.308889-4-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111192738.308889-4-aradhya.bhatia@linux.dev>
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

On Sun, Jan 12, 2025 at 12:57:29AM +0530, Aradhya Bhatia wrote:
> From: Aradhya Bhatia <a-bhatia1@ti.com>
> 
> The driver code doesn't have a de-initialization path as yet, and so it
> does not clear the phy_initialized flag while suspending. This is a
> problem because after resume the driver looks at this flag to determine
> if a Phy re-initialization is required or not. It is in fact required
> because the hardware is resuming from a suspend, but the driver does not
> carry out any re-initialization causing the D-Phy to not work at all.
> 
> Add the counterpart of phy_power_on(), that is phy_power_off() from the
> _bridge_disable() and clear the flags so that the Phy can be initialized
> again when required.
> 
> Move the Phy initialization from _bridge_enable() to _resume(), and
> de-initialize during the _suspend() - so that the phy_{init, exit}()
> take place once every resume/suspend cycle.

Is it okay to call phy_init() before writing MCTL_DPHY_CFG0 ?

> 
> The order of calls still remains the same. phy_init() needs to be called
> before phy_power_on() - which happens still. What this patch changes is
> the frequency of the phy_init() call. Instead of it being called once
> every bridge enable/disable cycle, it is now being called once every
> resume/suspend cycle. This move has been considered safe after numerous
> tests with the hardware.
> 
> Fixes: fced5a364dee ("drm/bridge: cdns: Convert to phy framework")
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

-- 
With best wishes
Dmitry
