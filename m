Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914A3958353
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2A110E65D;
	Tue, 20 Aug 2024 09:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="VcGOLeqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0738B10E65D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9DaJJPiwUvlSFnUUActMVJXI0QVdEXy6fadv1aQUXnU=; b=VcGOLeqj9QdamuwLskHPEMNbax
 l8hdih50g5UqDwP3fu97/B9G8nfu4okpEYhmSsKDOdvBfSl0qQ7OcwuK29YN9QUmDmZkdfnFJYqYz
 h7aB8KQurLiAIEnI8QBOyID4x3v4b8gW5JgYCtmwFPQTXQOPE3LCfTpnMnv/fcObE8vSVwuCi4C3i
 Q64D2VYtg8oHUIT9jWx0uGJWQyRW+ULmoCpaC/t5ZcdVgvecr8KZj4E+TM6YvV2j2u21My8d9EWbO
 m9e5c71dFjp/qRlLXsJK4iGai4oQvJHfZjwLvr0HvW3zFMMWXQ5wfMeuC/D92a37HLe6LBYi5nuYU
 ar8yAQcg==;
Received: from i53875aca.versanet.de ([83.135.90.202] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sgLat-0006zG-AM; Tue, 20 Aug 2024 11:56:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel@collabora.com, Christopher Healy <healych@amazon.com>,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: Re: [PATCH v3] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Date: Tue, 20 Aug 2024 11:56:25 +0200
Message-ID: <4687763.CvnuH1ECHv@diego>
In-Reply-To: <20240819112508.67988-2-mary.guillemard@collabora.com>
References: <20240819112508.67988-2-mary.guillemard@collabora.com>
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

Am Montag, 19. August 2024, 13:25:08 CEST schrieb Mary Guillemard:
> Expose timestamp information supported by the GPU with a new device
> query.
> 
> Mali uses an external timer as GPU system time. On ARM, this is wired to
> the generic arch timer so we wire cntfrq_el0 as device frequency.
> 
> This new uAPI will be used in Mesa to implement timestamp queries and
> VK_KHR_calibrated_timestamps.
> 
> Since this extends the uAPI and because userland needs a way to advertise
> those features conditionally, this also bumps the driver minor version.
> 
> v2:
> - Rewrote to use GPU timestamp register
> - Added timestamp_offset to drm_panthor_timestamp_info
> - Add missing include for arch_timer_get_cntfrq
> - Rework commit message
> 
> v3:
> - Add panthor_gpu_read_64bit_counter
> - Change panthor_gpu_read_timestamp to use
>   panthor_gpu_read_64bit_counter
> 
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>

On a rk3588-tiger with matching MESA build and 
"RUSTICL_ENABLE=panfrost clpeak"

Tested-by: Heiko Stuebner <heiko@sntech.de>


