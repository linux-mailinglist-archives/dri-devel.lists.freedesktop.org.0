Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9138C9A546E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2024 15:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0301A10E0B1;
	Sun, 20 Oct 2024 13:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Jt0MHQPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97DE10E0B1
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 13:53:38 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539e3f35268so1525145e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729432417; x=1730037217; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wOuFO1XApK7lWi0ocIJGVQpcUmSA5iEtXQj95TkVeaQ=;
 b=Jt0MHQPKjmUtdqtJbjtt0bthOH8HQhuYKkimQIfAB2nH1oCtM9eiYvduRx16KyWchm
 Y0DMl46sbiWyUUWzaSTGBy3Qf621WYXskzsBLdtsJzMHJu8fYy+14FT/61gBuuwP/4VH
 W91M26a6b8f7mUGEBI0g2PcjceE4bim/vl14dfBRKYJKkv1YIjtCYH3wVkBPxDgplVLO
 ZMhzNibrTcDq1ZWmBlS9Jdolf7EBMRwrxf7SVkzpHrq05tdLXLKRxcLoUhNyprFZo7jj
 3BrN/jvH94XfztBVZgvYxdd/aQ3tm5dZmhJ5MD7ZbvrE4WePAD1OShDdabYkgDIVcMXR
 4HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729432417; x=1730037217;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wOuFO1XApK7lWi0ocIJGVQpcUmSA5iEtXQj95TkVeaQ=;
 b=LD1lJuioQ+ON6m5vr0jcgaOjejzzhHLtWQ5vR5vKIVWuD61gYWUd/RffDemJE7aRK7
 uNamUxiz5Qp7B6F2xBSE0M9IwtPVPXNIAEu3A6LzSVAj1Me5e/mbE6ymwiV9UpVjSOao
 +9bkXkxAWP0E339daJO9KhZFqM7mDf4n3KgfhgAxDATP30fcdFdSdOhlgA2FBIIFmNTg
 Q5UKIajfIn6i/IyFaCUYYdVGnraPtHPGItVPihuugBTNgCfDRR1DRJZwUtwiNqfzTSIV
 Km+oV4PFACqD7d6aMw9EvYkWnzDf1g9gxezhS+vMUB7zI0uDQiB7vA2PJ3XECVnMVcQJ
 nsAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWu8/+QxzkUAvsFanlsseAkKnJGsYJNw1VIqamMYei1dbx89phhEn0V3wEBddvepqbWl8qlCJiU8YE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMYijBDSK6sL8bajd8ZDb6Gf7M5LHcevLEjAFGlu+PJPu0Dm20
 VM4xqX8pebsDyAc1Vsnkk3zLlRR1WbqKi5HUPYAbDpqkcU+A6iUS5L/XASOL5hI=
X-Google-Smtp-Source: AGHT+IG1ECX7k0ZRy9wiVfYsGu4/HiF9PAp9DXVVa91IJVug3PAhPrdZylY14mOGVojrS7cxiyPHZw==
X-Received: by 2002:a05:6512:4017:b0:539:a924:74ba with SMTP id
 2adb3069b0e04-53a154a2c0bmr3834476e87.56.1729432416836; 
 Sun, 20 Oct 2024 06:53:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a223effa5sm230074e87.88.2024.10.20.06.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 06:53:35 -0700 (PDT)
Date: Sun, 20 Oct 2024 16:53:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hermes.wu@ite.com.tw
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Pin-yen Lin <treapking@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Kenneth Hung <Kenneth.hung@ite.com.tw>, Pet Weng <Pet.Weng@ite.com.tw>
Subject: Re: [PATCH v6 04/10] drm/bridge: it6505: Change definition
 MAX_HDCP_DOWN_STREAM_COUNT
Message-ID: <itqfr42yvg5n322uhjgvydxtffcsgbngvvg6or2xghah3xyjse@lsdftsvl4zdf>
References: <20241016-upstream-v6-v6-0-4d93a0c46de1@ite.com.tw>
 <20241016-upstream-v6-v6-4-4d93a0c46de1@ite.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-upstream-v6-v6-4-4d93a0c46de1@ite.com.tw>
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

On Wed, Oct 16, 2024 at 03:54:16PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> A HDCP source device shall support max downstream to 127 devices.
> Change definition MAX_HDCP_DOWN_STREAM_COUNT to 127
> 
> KSVs shall save for DRM blocked devices check.
> This results in struct it6505 growth by ~0.5 KiB.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
