Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623D8C0E826
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 15:44:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDF110E4C0;
	Mon, 27 Oct 2025 14:44:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="N30VL9c6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B06110E4C0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 14:44:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761576285; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lTdsw6N0xXzLaD7EGlrs5qL1gxQ9UlbOmXohNYZ3AC4eLnaugKEnyGo1TOnpCjCG86bUCp0eUf3BdyR5rjGWyvmMq7YriKxAUPztPE+wAyx+fMnNHr86Pjf2GWZ20hgHLFwAKwRfOsniymnVswG3vr49JxhvZ5ZajK2uKhLIn2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761576285;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oZrYDMRouHneyMB8tCbVdocN1AD7BicDvh/8ht3WR5s=; 
 b=Lnr+Ef4UoyA4ERzapTmeBqzezUXDR3B2t5E7t98SCs8NMYgCpZbwAkT07XAzUhrpZtJrtqlL/yTJyo2R0z+XViCHDvjCTMa8mOYyoZOo70Ow6yvfGb1p7U7KtKyiaWij3wh8uzojttrkJ2FiPrJ3kR1Ow9tk6tPVUlxTi+uBSGE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761576285; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=oZrYDMRouHneyMB8tCbVdocN1AD7BicDvh/8ht3WR5s=;
 b=N30VL9c61TjBWFtJhsGNPVwxmPGVzLfWFgwLLqwfVBxi7qKWkCPuX4j5zewqOCFR
 f7nZDE+KZvLLtnG9IMnVcRm3n6Ie80e4Z9957oSqiWS69rk0MuSFgGCnihbQD1O/c5a
 xOgFW3e1SfIUIbseUZPFo7MlAKJ+sgOBZmtPj22w=
Received: by mx.zohomail.com with SMTPS id 176157628274924.30349710427663;
 Mon, 27 Oct 2025 07:44:42 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the stored
 bridges: fix NULL pointer regression
Date: Mon, 27 Oct 2025 15:44:33 +0100
Message-ID: <5954683.DvuYhMxLoT@workhorse>
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 17 October 2025 18:15:03 Central European Standard Time Luca Ceresoli wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
> 
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
> 
>  - the same revert patch
>  - the original patch but rewritten without the same bug (and even simpler)
> 
> Also the re-written patch is now split in two for clarity because it was
> doing two somewhat different things.
> 
> [1] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> [2] https://lore.kernel.org/lkml/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> [3] https://lore.kernel.org/lkml/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com/
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - No changes to the revert patch
> - Added the (corrected) patch introducing the same feature as the original
>   buggy patch, and also split it in two fir clarity
> - Link to v1: https://lore.kernel.org/r/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com
> 
> ---
> Luca Ceresoli (3):
>       Revert "drm/display: bridge_connector: get/put the stored bridges"
>       drm/display: bridge_connector: get/put the stored bridges
>       drm/display: bridge_connector: get/put the panel_bridge
> 
>  drivers/gpu/drm/display/drm_bridge_connector.c | 92 +++++++++++---------------
>  1 file changed, 39 insertions(+), 53 deletions(-)
> ---
> base-commit: 84a0a3f014cda68ff10b8517d09e9f0c1cd942a2
> change-id: 20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-9a429ddb48e2
> 
> Best regards,
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Fixes a null pointer dereference on boot on my Radxa ROCK 5T
(RK3588) that's present in next-20251027.

Kind regards,
Nicolas Frattaroli


