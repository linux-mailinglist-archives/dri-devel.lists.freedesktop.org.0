Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A06A8852B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 16:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1C710E5F4;
	Mon, 14 Apr 2025 14:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CuL/950z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037A410E5F4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 14:36:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97DA6A49EE5;
 Mon, 14 Apr 2025 14:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD87C4CEE2;
 Mon, 14 Apr 2025 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744641387;
 bh=aOff9BPFO43gc3mX9Ira9Sxwu7SZfP2N3ALrH2jc/3o=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=CuL/950zA0sGWmEpodNpZXLcloq7JPAb8Am77ZZh15GRiP6HCP8l8P06gE6s0aweZ
 rGUqXUPfdfAK9rSEq+ccvUeo7uuRuJ7hm81quyzdzgJ6qY2iMOsslleF7pL/iL2Tv/
 Iy0q53tnr7GpTrsSP7PAVT4Hs196xwD/Ozl+I8soCKUJnhXvrtEAeoJDuLDDtsLDIh
 uba1faOJb7nzS5kaYDVElDB9K5okkLXbhekb3EypPDYO9eQYITCa9Wc9r/1UC0XQSo
 OUJCdh3ueZ+gi2SmHm2WqPCIlKGV/ZWlDt6VnBGyibJMoYd0ION9NXQDZdH3Zd8ypS
 7JnbmvyEOTq4Q==
Message-ID: <e0ea2e93061606a6a256ef8780797c31@kernel.org>
Date: Mon, 14 Apr 2025 14:36:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 05/11] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-5-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-5-04809b10d206@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
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

On Mon, 7 Apr 2025 18:11:02 +0300, Dmitry Baryshkov wrote:
> THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
> toggles whether DP_AUX_CEC support should be built into the
> drm_display_helper (which can be eithera module or built-in into the
> kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
> selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
