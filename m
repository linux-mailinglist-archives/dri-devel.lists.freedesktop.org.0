Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB0AA03B61
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC62F10E3BB;
	Tue,  7 Jan 2025 09:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bQVAEnnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CB710E3BB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:44:46 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-30227ccf803so172456461fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 01:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736243025; x=1736847825; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uFrAmvAWBlu1SsVDiIn8XWI+a6rw6/lgfZLdFt8GxUs=;
 b=bQVAEnnWWFW/ge52L+vfPSBlKfWYyeXmFYFw1cu3mvBMnIuHq254nPVA1zIk4r41cl
 8p3AY8PGLzMA/kh6aeeJiD3tOkjLBs9yrAbU4kgp98UtpO1heW/JCOu/irguFrimiIXB
 5BoxIxiNbn7zgeKVJ9l3CCi5s3u1rLSORTlCrhVgfPlEK5Dw77zbPPOEZkEaAK5KJVhf
 J1j6qWuUvBomJLkRX0W9i4Tr+Sc45qwzMcMJfTPh92xqP2+YV8A9D4h97BfXKAIFMs96
 M60eYKSpS9Oj3tv/Srh3MXwVqXuaOVO9vyU3ZRpbXgWRnvIukTZXIu1wGEWQm7oS0I/3
 bB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736243025; x=1736847825;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uFrAmvAWBlu1SsVDiIn8XWI+a6rw6/lgfZLdFt8GxUs=;
 b=G6n+BM7WkoHnxz3DkGwWuEREWi41aT3OaJKa+kMXBxkOWvgiR61FdL9SgYc8DKymKn
 gHocZh47XF3eDhPzOG91U7wg6XW0wAZAb0/echWfDiyhQfxNQTmXo4upDc2L0meoeKcz
 Mq5eyGUqn9ledEVNyWHOvoNeRvFBhgSSt9Q8yzTFXqy/eO15Bd+dZoSXNtugGlCJYWof
 x2hFpmqB+1lONhuAmwjwmXTO5Xpg7N9IG03AeHWqWqurGA7sJjKnKlhluC3kRBwZiSkF
 2YrcTjtnDwLcpqZt8OV7kHcUE2AAgvaoYJifloKptBPbo1eTThvuIFF+6XwlrMSvPdzV
 ik7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFjc6lxk+qglI1/QabclwOXj2PS1c105E9HODVp8rq0mA0SG2EsvT1QW2mFdO4TfFQ46P+a7q93CY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6lSv+BVLHcdv9r439cFYuZOIGj4KRJFxZmLVx7QSSg0Vg5OKN
 gEUt52iHmGk8Co55QCvyG1zNtiOU7lOjn/OdOrqfyWqGU0TRorrS437QrJ2DuihC5HWBjXKu1zw
 VPxw=
X-Gm-Gg: ASbGnctN22oScSllQkR6rmeuLdVwHn5bLzReGbnEoj58cgOEjLJ/CrRZxTBWASgjZpH
 pcKkh7A4eJvzxgCm+CiKiNyrnOlLHKWZv7JOq44G0Jcz6yVLB2UawNFt3Ek9ITaYwxt7purZTQe
 iPANY25V5WZJ1uC0fcO1WQ7/d6uHOKMhWAjjuXpRr1cqJl8IDMxS7QRKjouRVFQ+e+i8CqtDVPR
 ksUOBYzsMw+SQDO+aVkP1vGP85vQzJt0bIlq4xZV1PI3EaDq3qTKuMf04+oMHUseFuxyooMe5ef
 14dXyETH8hWEonmZ/lgFXtqF0/AWQIc2SlZd
X-Google-Smtp-Source: AGHT+IGfihRS3MG5OKuI1d1n+E2Ih4a1TbTO2toYbQmR1la3cmwTL26/9WAjtIXK9TzQ6a61GT5wdA==
X-Received: by 2002:a2e:b888:0:b0:302:4115:18b with SMTP id
 38308e7fff4ca-30468517861mr182389001fa.1.1736242535725; 
 Tue, 07 Jan 2025 01:35:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-304b866ecb8sm29884151fa.39.2025.01.07.01.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 01:35:34 -0800 (PST)
Date: Tue, 7 Jan 2025 11:35:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/connector: hdmi: Handle NULL display mode in state
 check helper
Message-ID: <rljy4kzfb2zdecshtbbqy5lg22ejw4yrjao5dedwh43icq3h5c@zj7cwppkllr2>
References: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-hdmi-conn-null-mode-v1-1-fff4be46d106@collabora.com>
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

On Tue, Jan 07, 2025 at 02:00:35AM +0200, Cristian Ciocaltea wrote:
> drm_atomic_helper_connector_hdmi_check() helper makes use of
> connector_state_get_mode() to obtain a drm_display_mode pointer, but it
> doesn't validate it, which may lead to a NULL pointer dereference in
> some cases, i.e. unloading a DRM module:
> 
> [ 1002.910414] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [...]
> [ 1002.923833] Hardware name: Radxa ROCK 5B (DT)
> [ 1002.924819] pc : drm_match_cea_mode+0x30/0x280 [drm]
> [ 1002.925318] lr : hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
> [...]
> [ 1002.932411] Call trace:
> [ 1002.932626]  drm_match_cea_mode+0x30/0x280 [drm] (P)
> [ 1002.933120]  hdmi_try_format_bpc+0x7c/0x580 [drm_display_helper]
> [ 1002.933662]  drm_atomic_helper_connector_hdmi_check+0x10c/0x478 [drm_display_helper]
> [ 1002.934355]  drm_bridge_connector_atomic_check+0x20/0x40 [drm_display_helper]
> [ 1002.934993]  drm_atomic_helper_check_modeset+0x698/0xd28 [drm_kms_helper]
> [ 1002.935607]  drm_atomic_helper_check+0x28/0xb8 [drm_kms_helper]
> [ 1002.936143]  drm_atomic_check_only+0x794/0x988 [drm]
> [ 1002.936635]  drm_atomic_commit+0x60/0xe0 [drm]
> [ 1002.937082]  drm_atomic_helper_disable_all+0x184/0x218 [drm_kms_helper]
> [ 1002.937678]  drm_atomic_helper_shutdown+0x90/0x150 [drm_kms_helper]
> [ 1002.938243]  rockchip_drm_unbind+0x38/0x80 [rockchipdrm]
> [ 1002.938720]  component_master_del+0xac/0xf8
> [ 1002.939089]  rockchip_drm_platform_remove+0x34/0x78 [rockchipdrm]
> [...]
> 
> Add the missing NULL check before passing the mode pointer further.
> 
> Fixes: f035f4097f1e ("drm/connector: hdmi: Calculate TMDS character rate")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
