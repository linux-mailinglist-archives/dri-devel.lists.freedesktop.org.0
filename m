Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1609D8201
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 10:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68F3A10E3A8;
	Mon, 25 Nov 2024 09:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QpPx+Qo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7E710E3A8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 09:15:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 67C06A413F6;
 Mon, 25 Nov 2024 09:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF05CC4CED3;
 Mon, 25 Nov 2024 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732526141;
 bh=IRcmX+kFalTpcSK8+zzcKFRuZILPS7wKDDgoGabM+io=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=QpPx+Qo202rIesU6hZWyg4cz5JxOXDshswbouHI57nf7BX4EHA3I0vZbXhmJvP7sW
 iKdvFvojGpDjfq4E3akvfGt0iYJUtIJKHrtNcuBCVLBP+bRWeCJ0zRCdr3VApwC+Cv
 KMHXl/5iNeU9Ptt1GRX1qy4ubTBEJMZ/zr10SnHNx3wfb2jd+xkCcYZBxeu0lB25UO
 seArg2dYg5S1tyDQD8/bjOgGJcmBP4IkTsOlT/+eQ0pvXRXfZA+NQ7EtTMiht48wy6
 9NwGpOsyd6as6csAH2QitozGdCZUJoTIipGrxZTpRE2nP+n5SHw5IQ3pBG7ViY9UFI
 bhGDoCkkUoJvA==
Message-ID: <0f588822988dafd9a8acd3ca86731be6@kernel.org>
Date: Mon, 25 Nov 2024 09:15:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 10/10] drm/sun4i: use
 drm_atomic_helper_connector_hdmi_check()
In-Reply-To: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-10-2fee4a83ab79@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Chen-Yu Tsai" <wens@csie.org>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>,
 "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert
 Foss" <rfoss@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Fri, 22 Nov 2024 11:13:06 +0200, Dmitry Baryshkov wrote:
> Replace sun4i_hdmi_connector_atomic_check(), which performs just TMDS
> char rate check, with drm_atomic_helper_connector_hdmi_check(), which
> performs additional checks basing on the HDMI Connector's state.
> 
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
