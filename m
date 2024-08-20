Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01023958378
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C41810E664;
	Tue, 20 Aug 2024 10:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="VGvCfN+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46110E664
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yHeSzm7/HHCH2jDaxOZ9inBw36886zNHiUb2ixdrSZE=; b=VGvCfN+vRQgkiRyJfQl2ec5B6v
 dc5TNo8fOgYHiJA/07D5L5owqToc/eMtF9m69QgtZAldyeoaYTd6uP4OoIk5DAU4bs+ZKZgzsYPyT
 yKaDzlaiqvQazEX3RPTu9ooud7HiH+ud6xkyNuhZIt66jU2EgR0Z59S8YYdxtdK7gkO28EABhmNrp
 PCLdUivx8knLTGFij8QQfiMuHl5aCgBiqk9H1B1aFNe9CxxtHf1+EDqXYwtxHMVRd2ApR5AyIaVhY
 HukcMXeXyuIQpo2MujbnaojIftu5skGBtIWW9+PbR0CZtLAPu8foyk+beecR8iBrBjnYaoLrgHi8H
 ZI9eq5kA==;
Received: from i53875aca.versanet.de ([83.135.90.202] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sgLg1-000717-2I; Tue, 20 Aug 2024 12:01:21 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: Re: [PATCH v3 1/2] drm/panfrost: Add SYSTEM_TIMESTAMP and
 SYSTEM_TIMESTAMP_FREQUENCY parameters
Date: Tue, 20 Aug 2024 12:01:42 +0200
Message-ID: <7068759.18pcnM708K@diego>
In-Reply-To: <20240819080224.24914-2-mary.guillemard@collabora.com>
References: <20240819080224.24914-1-mary.guillemard@collabora.com>
 <20240819080224.24914-2-mary.guillemard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Montag, 19. August 2024, 10:02:22 CEST schrieb Mary Guillemard:
> Expose system timestamp and frequency supported by the GPU.
> 
> Mali uses an external timer as GPU system time. On ARM, this is wired to
> the generic arch timer so we wire cntfrq_el0 as device frequency.
> 
> This new uAPI will be used in Mesa to implement timestamp queries and
> VK_KHR_calibrated_timestamps.
> 
> v2:
> - Rewrote to use GPU timestamp register
> - Add missing include for arch_timer_get_cntfrq
> - Rework commit message
> 
> v3:
> - Move panfrost_cycle_counter_get and panfrost_cycle_counter_put to
>   panfrost_ioctl_query_timestamp
> - Handle possible overflow in panfrost_timestamp_read
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>


On a rk3588-tiger with matching MESA build and 
"RUSTICL_ENABLE=panfrost clpeak"

Tested-by: Heiko Stuebner <heiko@sntech.de>

Without this change, clpeak fails with
	clCreateCommandQueue (-35)


