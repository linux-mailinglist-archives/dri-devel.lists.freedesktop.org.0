Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF72CBFF6B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9271910E00A;
	Thu, 23 Oct 2025 06:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="xtr/5YZl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45410E00A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 06:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=aGbadfXdorcMPnmwNXVNWcPnkf3aCIvQIT89nWPARCE=; b=xtr/5YZlHNoxBEPSRG93Jpb/9z
 /pNZd5Xgf1O4YmC64aLItyQI3crzt54lkDeYg2xBWhUDcyy6t/Qq/ZLObRj8pVhTTpUcsLlyT6ZMf
 zjvMUEy0Nn59qkLFt0f7B468C4xVfQy/K3QPwAdHsxBmtbsBHsWl2FcbfVB4R/ZC6+otj4nln3+KZ
 PbKZLuWBui8eSn2yXXuDMnaCRYa1HA23PSzg0q7rPzDNyIbn9GwSmA5r1FXk2SuqP1GBl8i1TZ2B4
 eHze05UMkDQWRgBA2v0w3mbpnyKdgARzG0YVHoH5B4+Hkx7avsZUJ18JvFVIdFL25T49EoYhufKgP
 ahCsokVA==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vBpEv-0001An-Ui; Thu, 23 Oct 2025 08:56:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/rockchip: Set VOP for the DRM DMA device
Date: Thu, 23 Oct 2025 08:56:00 +0200
Message-ID: <3705026.LM0AJKV5NW@phil>
In-Reply-To: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
References: <20251022161948.199731-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hi Dmitry,

Am Mittwoch, 22. Oktober 2025, 18:19:48 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Dmitry Osipenko:
> Use VOP for DMA operations performed by DRM core. Rockchip DRM driver
> is backed by a virtual device that isn't IOMMU-capable, while VOP is the
> actual display controller device backed by IOMMU. Fixes "swiotlb buffer
> is full" warning messages originated from GEM prime code paths.
>=20
> Note, that backporting is non-trivial as this depends on 143ec8d3f9396
> ("drm/prime: Support dedicated DMA device for dma-buf imports"), which
> landed in v6.16 and 421be3ee36a4 ("drm/rockchip: Refactor IOMMU
> initialisation"), which landed in v5.19.
>=20
> Reported-by: Daniel Stone <daniels@collabora.com>
> Fixes: 2048e3286f34 ("drm: rockchip: Add basic drm driver")
> Cc: stable@vger.kernel.org # v6.16+
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

just a process remark for now. This v1 so it definitly shouldn't come
with any Reviewed-by-s pre-applied, because this should happen in public.

It's not a huge issue here, because I do trust the people involved (you,
Sebastian, Daniel) and the change is small enough, but please for future
changes, let Review happen on the list, not on private channels.


Will look at the change itself when back home.


Thanks
Heiko


