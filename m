Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F639A2A8FE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 14:05:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E853110E2A4;
	Thu,  6 Feb 2025 13:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VNxLhGyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CC010E2A4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 13:05:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9257FA4423B;
 Thu,  6 Feb 2025 13:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA308C4CEDD;
 Thu,  6 Feb 2025 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738847107;
 bh=W5AM9RZgg67GctX9POakdPYKIrGtt44fCA6cr2QIVSs=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=VNxLhGyHzxicglO/D5ivZIdSr/a93Mw7FYISk0ur0L+3tzsAuN/rzAcAXyOOb8ZRo
 aObTLjrNmcAou3cDDtxAN1CWE/ZOtshMUERgMTwb2njUdvTUMOq3qO4O1ZHD0EY6Cp
 xkVmBmlx6p4kuaXzGeF26Ivx/BUP0PGr/MwXYtJtZm++1wAwBKKKug/lTHWVUXNHKa
 3/mMDkGQDaXb1YItsZ9va2pNR5YfpzdKsyS6fP6Y0bpLJCkbK9P5NbaOogE5RZNUV6
 vOxXh39z9lzDCoy1a2lZbMdTI0Yt5qX8h4fxvWoYSf7Xqs+5ksyWzolVDE/+s+pfEo
 9k6B+CyOAU9zA==
Message-ID: <5ef3905745ce4cc4ad43135c1e6a666e@kernel.org>
Date: Thu, 06 Feb 2025 13:05:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 4/4] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
In-Reply-To: <20250203161607.223731-5-herve.codina@bootlin.com>
References: <20250203161607.223731-5-herve.codina@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Conor
 Dooley" <conor+dt@kernel.org>,
 "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Jonas
 Karlman" <jonas@kwiboo.se>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Louis Chauvet" <louis.chauvet@bootlin.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek
 Vasut" <marex@denx.de>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>,
 "Rob Herring" <robh@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Mon, 3 Feb 2025 17:16:06 +0100, Herve Codina wrote:
> In some cases observed during ESD tests, the TI SN65DSI83 cannot recover
> from errors by itself. A full restart of the bridge is needed in those
> cases to have the bridge output LVDS signals again.
> 
> Also, during tests, cases were observed where reading the status of the
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
