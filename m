Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D7EA45564
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 07:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B0710E1C4;
	Wed, 26 Feb 2025 06:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NsipuVRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A010E1C4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 06:17:13 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so614927e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 22:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740550632; x=1741155432; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vdAWglkpNWkKlfVQY0b30qa+fHtrIyjn4IdPv+J5KmY=;
 b=NsipuVRiHW77/Jw/za7aIcvfs8cae5rmVSb7jMmjoFFbiBjguQ/8FSrrW4HDYrXfPM
 fBJ9twOWCuP3NT3pGd+Loq9HU4XLY8bRna2z5qj7wY/403ng+PdqGDIhd6gFPXY8D8zh
 55DHKLCfpR86qISznMQ/WZaDLikQqetscVnVpv2sKqaoxGcvae/2V6J4YlpoX6Sjop/B
 R68wtXJLWFlULXeIQ/n1JXElWTVO2zq+VLCxtpFBvOHES3vNJS1HT797leelvSlqVMHe
 W+9+VIJku7kBRbMD88kr5dOFq5Q6FkB6RE/XQZg89aSLhFXAGLpWJipr4XNb1OtV1bdU
 Rgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740550632; x=1741155432;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdAWglkpNWkKlfVQY0b30qa+fHtrIyjn4IdPv+J5KmY=;
 b=mRKscj3XZPnM6LmremeiSU8T1vNU7jbJhJ1Seam33+nBIGBt8PhcKmSFcFCI0aFjHg
 +sLYJwWD7C1JAyyncgORx+xBGRz8MVs5VefHHiC/whYzReH850so270+T/NGV43czk8/
 1wXXP17o+DPANr9uq/Jvnuuy5PlLH3Xlxh0bbczE2ePNJ3bSBayYsOt02fqWVrZMIKFq
 L3JHB0Jc63IJNenxGmNvM4aDUZkKjaZFN5GFUFYRKoqi9V1f7yMqsT9isFTlJYPE7Kkd
 18cEVfsv1J3TMiWZGSoiCwYh6tdTY8Moa+M8T8yIZIDKSoADXTtVJsPpWCPT31ztJxS0
 sbzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn05xJ29MW5FVxnv4M2IuZolaXwHw9sA4pi3hP86RXYjVP32RUru7eU7yZ5rNYkmb2Y8ETURn+ScA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY+/yCAtaFXxLF5llALji8RKKR5ez2bDl4FQZVkMLoQVrqzjQ0
 wLmwpVVK6EK67c9sW6AdgHcRsQWEPGZgQ2HnwXi/E9JgIkzo2gG69wi/V5Jjb5E=
X-Gm-Gg: ASbGncsCLHCM9f53Dk8ZUscXQ4HSYYV53aoZVrjxWELbDfwebub5hWQluP+jkMFpbeC
 B/L5ix+nh3cFiCyXtsYf7PcKGhn2KzmN7gKocrFgRolBd7Yr7vDimQceW9hoW2umTzFVRdzdGHu
 8mxOdgotu2WyhuB4J8NovnaOy24h/k5iWBVoNnLyhfHhxMdnM++pcqlFyGyfzCB719bKSwK/2Vv
 5PYi9lHtKb4M0SsNu0906HbvK9bqMqeCSU5g09lrLv42+bNakf54hOb/NFKPrehaNAD17M2NqF/
 tKEZwDkZQc0zABGwsfHHmrRHXpF3+zc+zz4lpzSqsG9ouvtOgW/e0J/EZ3UAqS2WqHpm5Hi9Ara
 g1BxzPg==
X-Google-Smtp-Source: AGHT+IEs1dUcvgsmZtfFrnbSncV3gTJJg9pAfhXogUOwliuGtG6jolEBnnLRWX36IkMjWaHHwSk3BQ==
X-Received: by 2002:a05:6512:3d8b:b0:545:81b:1516 with SMTP id
 2adb3069b0e04-54838c73e38mr9564126e87.15.1740550631678; 
 Tue, 25 Feb 2025 22:17:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-548514f4d3asm357995e87.186.2025.02.25.22.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 22:17:10 -0800 (PST)
Date: Wed, 26 Feb 2025 08:17:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 04/15] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <foezi4xoq6zpzcn56z465epcxifkky6cctgvujkio5v4aswuqe@jx5wv437w3k4>
References: <20250225-bridge-connector-v4-0-7ecb07b09cad@kernel.org>
 <20250225-bridge-connector-v4-4-7ecb07b09cad@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-bridge-connector-v4-4-7ecb07b09cad@kernel.org>
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

On Tue, Feb 25, 2025 at 05:43:52PM +0100, Maxime Ripard wrote:
> With the bridges switching over to drm_bridge_connector, the direct
> association between a bridge driver and its connector was lost.
> 
> This is mitigated for atomic bridge drivers by the fact you can access
> the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> 
> This was also made easier by providing drm_atomic_state directly to all
> atomic hooks bridges can implement.
> 
> However, bridge drivers don't have a way to access drm_atomic_state
> outside of the modeset path, like from the hotplug interrupt path or any
> interrupt handler.
> 
> Let's introduce a function to retrieve the connector currently assigned
> to an encoder, without using drm_atomic_state, to make these drivers'
> life easier.
> 
> Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_atomic.h     |  3 +++
>  2 files changed, 48 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
