Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA16B8CC108
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:13:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3510EEA2;
	Wed, 22 May 2024 12:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mWutsMvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF8310EEA2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:13:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EEE306297D;
 Wed, 22 May 2024 12:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27394C2BD11;
 Wed, 22 May 2024 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716379998;
 bh=Gr+/A7/ijZDQDz7elG8jrXwS23bISKQ5Fsa85hruja0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=mWutsMvzZUBTtqxqBX4RetMNkhaTTqzjlefCaYJAuPvgodzDZXQ/PkYev1wvXFbND
 ca8sdJCoPETdGJ7iV6OuJyo+P1drtBOcfLv1k6HKTRmQyWmEeHL0j1FLzJbeAtaPng
 oNen5q2As4+IfplhJMYDH7lASkVtUHX7XZX6xnXoU8Zm2ncmU4MAvP+Ov4F8QYyMQR
 cf2EodStPBHiIYiJtcJuAq5AeCo8bMNDDscLRxE3MSW90R0XdW0fZ09Tm7UJR1S6be
 x2fDatp3bqTgGKMU6PtbtG6VtafDYNnM5kWp/m1j+dp/uM8Pl/jFvZfwiHiVY91cyy
 q74M1J4k1hyXg==
From: Robert Foss <rfoss@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Allen Chen <allen.chen@ite.com.tw>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, kuro <kuro.chung@ite.com.tw>,
 Kenneth Haung <kenneth.hung@ite.com.tw>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Pin-yen Lin <treapking@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 open list <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.wu@ite.com.tw>
In-Reply-To: <20240522065528.1053439-1-kuro.chung@ite.com.tw>
References: <20240522065528.1053439-1-kuro.chung@ite.com.tw>
Subject: Re: [PATCH v13] drm/bridge: it6505: fix hibernate to resume no
 display issue
Message-Id: <171637999486.1598011.4983921044000498146.b4-ty@kernel.org>
Date: Wed, 22 May 2024 14:13:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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

On Wed, 22 May 2024 14:55:28 +0800, kuro wrote:
> From: Kuro Chung <kuro.chung@ite.com.tw>
> 
> When the system power resumes, the TTL input of IT6505 may experience
> some noise before the video signal stabilizes, necessitating a video
> reset. This patch is implemented to prevent a loop of video error
> interrupts, which can occur when a video reset in the video FIFO error
> interrupt triggers another such interrupt. The patch processes the SCDT
> and FIFO error interrupts simultaneously and ignores any video FIFO
> error interrupts caused by a video reset.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: it6505: fix hibernate to resume no display issue
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=484436ec5c2b



Rob

