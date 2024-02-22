Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 704F685EEE4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 03:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249AA10E854;
	Thu, 22 Feb 2024 02:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OYfgohSQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DF010E852;
 Thu, 22 Feb 2024 02:06:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79E16616EA;
 Thu, 22 Feb 2024 02:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A01CC433F1;
 Thu, 22 Feb 2024 02:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708567605;
 bh=Ybci3+TcYCfWUtyyK9oMeVMAce0zLcjOP2WOB1QozRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYfgohSQYfx5MuNjkVKbPMcSliwWc4XdYPqIUBvIvU4KT/boyIp106nCyVqD021Sd
 njg8Y4SdVFb5APDaQCYE2FZLojpASoRlm7m+focW1sr1wY5c1CzFAEp1Ag2fBVoJrT
 nzkinUd0UTlLcpG28vbMYlglF6egqdoraXipCtlKZ9oB0pbQR+DiuK2gfCFqa/iMVe
 oKBs87RNBKE5mMumkZsCJzbM3ew6tSls7bY5/3Yt59MZZEj1Q2ukrajX2bvO7RUFH5
 Vbx0/AuXX/AKEjWdBndtBOwymR7Hqck94bPygq4Jjs+1eidMFEX2QfAoI1iSTeXNyY
 mxbTcAqfLSiKg==
Date: Wed, 21 Feb 2024 20:06:41 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/6] drm/bridge: aux-hpd: separate allocation and
 registration
Message-ID: <cyzl3m67daaijpwhcwx53tk7tgrvw4kxiz7cj6bhx5xxwh6fuj@u2l674nlp4th>
References: <20240217150228.5788-1-johan+linaro@kernel.org>
 <20240217150228.5788-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240217150228.5788-3-johan+linaro@kernel.org>
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

On Sat, Feb 17, 2024 at 04:02:24PM +0100, Johan Hovold wrote:
> diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
[..]
> +/**
> + * devm_drm_dp_hpd_bridge_add - register a HDP DisplayPort bridge

kernel-doc wants () after function names.

> + * @dev: struct device to tie registration lifetime to
> + * @adev: bridge auxiliary device to be registered
> + *
> + * Returns: zero on success or a negative errno

and "Return:" without the 's'.

This could however be done in a separate patch, as the file is already
wrong in this regard.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn
