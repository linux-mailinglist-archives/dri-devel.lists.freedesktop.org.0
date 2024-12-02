Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34E89E0759
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580DF10E7B1;
	Mon,  2 Dec 2024 15:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bBLmPfEu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E501110E7B1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 15:44:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E37775C674D;
 Mon,  2 Dec 2024 15:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF5C4CED1;
 Mon,  2 Dec 2024 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733154295;
 bh=J/q1xWj4DxCp6IzU7uPb7iTssY8YnrBnsl5MtdaRI/Q=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=bBLmPfEuiTfRJnp+ZnwgaRqb9cxXz0K6fMMlUyvDEsusKLVmzaRUkMK6epO8opKEs
 PwmmSAPf9vdTpehrIfen0th26tLjWFetjQq2vFJs315alQa0XFABW5BAVfcJy5vH3D
 qCnqbb0sbSC8lSZB9WwLsOaDr4ykQgEM6fQUspxdClGm1c1NZI0O9ThDWxAH9A4id7
 hIwTG55au1gkzWkIt3zOPFTeeNy8K6nea7RTJUvG/AkLDeFtDbKtDjcZq8Tq7a1zQ5
 jOfEqNrBFhY8oDlt835VUwvXntb8rAhmkDL0P1EWn8PrpBBLQVNpG3mQzMwHuhfP1x
 DYAxZ855ED4dg==
Message-ID: <f7d5a7e084f01661572b2608c9a73db2@kernel.org>
Date: Mon, 02 Dec 2024 15:44:53 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 04/10] drm/display: hdmi: add generic mode_valid helper
In-Reply-To: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
References: <20241130-hdmi-mode-valid-v5-4-742644ec3b1f@linaro.org>
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

On Sat, 30 Nov 2024 03:52:29 +0200, Dmitry Baryshkov wrote:
> Add drm_hdmi_connector_mode_valid(), generic helper for HDMI connectors.
> It can be either used directly or as a part of the .mode_valid callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
