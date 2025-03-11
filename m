Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA3CA5CF84
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:36:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8090510E2A9;
	Tue, 11 Mar 2025 19:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rPRgK1E4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADED10E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:36:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 316C95C6815;
 Tue, 11 Mar 2025 19:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482F3C4CEE9;
 Tue, 11 Mar 2025 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741721771;
 bh=9ZztcwujM2RKBfgxyjm6I2U1WTb1K0JNKkmtxjuvMAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rPRgK1E4GvODrXB6h5Y4d5ZvXmPK+l1GA0Dx5t6z+TrqR91t9/UBLHqG+3H3AeDYT
 CRSMdbbn1t2KX0LuXPWBBqESThVJ6AUILcs/tSLidO7y7Dz5nEzgMsvErp+PyyaWZX
 DbpN9upbkQhHwE29dellxe9MyeBUsOLAQHaRXhN2oVQ2fhRu0UY0JYDx8d0XU+O1TC
 IiEqFabOWQO/VRPau92QGpHccial7TYWn50jZ9IrpEBQk1KutAQQTy8z2IoVwQqm8h
 Ueamdly0b9OwmeBTMOLHYXGbHnzTbM+r8x32TxIOTSFoKmDdANdj4s79kUlXJvKYpN
 Da/JkP0cVe7tA==
Date: Tue, 11 Mar 2025 21:36:06 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] drm/connector: hdmi: Evaluate limited range after
 computing format
Message-ID: <fgimm4muxrk2g5wclquhj6nxk6o3ioj4tqaczgaabswpany4kf@oi5lvsfg474v>
References: <20250311-hdmi-conn-yuv-v2-0-fbdb94f02562@collabora.com>
 <20250311-hdmi-conn-yuv-v2-1-fbdb94f02562@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-hdmi-conn-yuv-v2-1-fbdb94f02562@collabora.com>
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

On Tue, Mar 11, 2025 at 12:57:33PM +0200, Cristian Ciocaltea wrote:
> Evaluating the requirement to use a limited RGB quantization range
> involves a verification of the output format, among others, but this is
> currently performed before actually computing the format, hence relying
> on the old connector state.
> 
> Move the call to hdmi_is_limited_range() after hdmi_compute_config() to
> ensure the verification is done on the updated output format.
> 
> Fixes: 027d43590649 ("drm/connector: hdmi: Add RGB Quantization Range to the connector state")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>

-- 
With best wishes
Dmitry
