Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A223A94FE2F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 09:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FA410E2C8;
	Tue, 13 Aug 2024 07:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975E510E2C8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 07:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HXz7qGN0/o3zPJNVxlpTDW7BW/yyxunHThT/lBkN8VA=; b=XE9kD1V63K1TBa4/I6elX/cU7K
 70RqYBcc6QbOm2dxc73h+bmeJQNgQLOajUFd3UdUndSMR8c5Fbz21bQA5c/DTO4+VOzxyrSInM9Ms
 yn0nVEApM0X7z9SLrVFGTVUMmCJo5BFf00XPVlADk63Y3+Oqeg6HFNpNPjHaeZbmqeRpwn7QqVjVp
 XQo7kknttetcjH5z+BJcpv5PF1uoYR/I7w0ACoh4Xhx63hPAeU8c0GIN39vxDxgL0QvbSJGhilDnA
 IbGt4j9fx80x70QqhczyIlu/omyO5hOfpg/tcyZQyxTYj0+P5xXYnhNgcmJl31Fv6txyC6p0yfZY7
 demfF+sg==;
Received: from i53875b02.versanet.de ([83.135.91.2] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sdlVx-0008QV-Hq; Tue, 13 Aug 2024 09:00:17 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>,
 Mary Guillemard <mary.guillemard@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mary Guillemard <mary.guillemard@collabora.com>
Subject: Re: [PATCH v2] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Date: Tue, 13 Aug 2024 09:00:14 +0200
Message-ID: <2629633.VnKG3xVv5R@diego>
In-Reply-To: <20240812122814.177544-2-mary.guillemard@collabora.com>
References: <20240812122814.177544-2-mary.guillemard@collabora.com>
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

Hi,

Am Montag, 12. August 2024, 14:28:15 CEST schrieb Mary Guillemard:
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
> Signed-off-by: Mary Guillemard <mary.guillemard@collabora.com>

I can't say much to the change itself, though did not see anything
obviously wrong with it. But I gave it a spin on one of my rk3588 boards
and together with the mesa change, it makes clpeak much more happy.

Where it originally failed to start at all due to not being able to create
its command-qeue and I had to resort to doing

        cl::CommandQueue queue = cl::CommandQueue(ctx, devices[d], 0/*CL_QUEUE_PROFILING_ENABLE*/);

the added profiling support from the timestamping is much appreciated.

Tested-by: Heiko Stuebner <heiko@sntech.de>


Thanks a lot
Heiko


