Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0E490220F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 14:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A99D89F27;
	Mon, 10 Jun 2024 12:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KBtghAgz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5497489F27
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2024 12:53:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9F5F2CE1050;
 Mon, 10 Jun 2024 12:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5905C2BBFC;
 Mon, 10 Jun 2024 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718023993;
 bh=5T5umR+EX/ptN9iQJvLK1D/jl6cODlTCfcGAFbufGD4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KBtghAgzRaFLKG9esobbXEG9J0zxxCzcRZ0W7LtrZYx4ElErgKSkaotQYNNLYDTo7
 1DzP4Msau4VUWY0thAhXFlPQufDXq90H28f/+eX182/eYTCboegEN9Umh5cqlE0Cc3
 VKL5sSWaKZdqxDSHoblfrc5hxHsAoHxbQA8EkGNHvjAlaXySr5qTbc2eUSvvk78b1V
 aBWEIlAv0hkP/2t1WUXcX3H1oBOPZnPfQAFp4EjKxgH13ffYDZoXv3hajb6o2mIEAK
 VGSr6sD6pkjYj7BljjGVW+yCokFZvIvmgLgEpTx3sLANrQIfeMR56QWQlJvAlaBqHe
 lsnYeRW/lBGFQ==
From: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
References: <20240531-bridge_chain_mode-v1-0-8b49e36c5dd3@ravnborg.org>
Subject: Re: [PATCH 0/2] drm bridge: drop drm_bridge_chain_mode_fixup.
Message-Id: <171802398950.436486.1468849081814066761.b4-ty@kernel.org>
Date: Mon, 10 Jun 2024 14:53:09 +0200
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

On Fri, 31 May 2024 22:37:44 +0200, Sam Ravnborg wrote:
> I had a few bridge related patches in an old branch.
> 
> They were last posted here almost one year ago:
> https://lore.kernel.org/dri-devel/20220717174454.46616-1-sam@ravnborg.org/
> 
> The following two patches gets rid of drm_bridge_chain_mode_fixup.
> The patches was already rb / ab - but due to the age a repost is
> due before applying the patches.
> 
> [...]

Applied, thanks!

[1/2] drm/mediatek: Drop chain_mode_fixup call in mode_valid()
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=ac4be1e50165
[2/2] drm/bridge: Drop drm_bridge_chain_mode_fixup
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1f0204954583



Rob

