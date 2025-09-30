Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 467E8BAC63C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 12:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A772210E548;
	Tue, 30 Sep 2025 10:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u2PeqyEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0310E562
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 10:01:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F7D460485;
 Tue, 30 Sep 2025 10:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB080C4CEF7;
 Tue, 30 Sep 2025 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759226473;
 bh=iE2mWhWpgyfdhRuac9l6SJdLnf87YLnaaVLWoINpmsc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u2PeqyEIEn/RL+ZKEIeA4zVMUVCsYx6OoYULh7tAqpkOu/mtxRbUiZts8vE7Trnbf
 F9giSkCK13o9kSKSRF0vvY5ybUi9qGUgcSzN6odhEy1sgzntPoPVqcQmDX6p/xtWqs
 2CTPgtdIq3181IFkY4sgVj5VDtJDSeYDT1+piVwGS2DzPhK4wLO4u4VwvBDhp6PtSq
 GXyekemMBEvyeJEC1JDrLQE5/tI0UpDfVEG82PUBlwLH0pYRJfSaE5tJVoxxFin1SQ
 SZ8bqEtwljALdCuI507fkwVp/gObKoardw6QrHiMgpL/4Y68Qh3CCh1ojJtz6l748p
 6mA78Er5cjd4A==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 22/29] drm/tidss: crtc: Cleanup reset
 implementation
Date: Tue, 30 Sep 2025 12:00:51 +0200
Message-ID: <175922644629.1134117.326733890416317223.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250902-drm-state-readout-v1-22-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
 <20250902-drm-state-readout-v1-22-14ad5315da3f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 02 Sep 2025 10:32:50 +0200, Maxime Ripard wrote:
> The tidss_crtc_reset() function will (rightfully) destroy any
> pre-existing state.
> 
> However, the tidss CRTC driver has its own CRTC state structure that
> subclasses drm_crtc_state, and yet will destroy the previous state
> by calling __drm_atomic_helper_crtc_destroy_state() and kfree() on its
> drm_crtc_state pointer.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
