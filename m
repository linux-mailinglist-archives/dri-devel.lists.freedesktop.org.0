Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB76AD022D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 14:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F1710E373;
	Fri,  6 Jun 2025 12:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EiZ2fPYn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FF310E365
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 12:26:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 551A961F1B;
 Fri,  6 Jun 2025 12:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FC6C4CEEB;
 Fri,  6 Jun 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749212761;
 bh=NzZ6wArFnrGATALrD5br9/mTy388nlgqYwCWAd+sWQw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EiZ2fPYnGmkyPX43Dw4Rbvx0AEMETr9vcxm2Uo5W72lIl260ACm5TTMQN7pzV4K+j
 GxMnTyYsCT2e80eaEf29V55iZTp32FuhkSxJf7FicEaV8UvsZGBj49Gwwb2p58PCdG
 fU8Nj6EUbDTbjyWZ8/yDfinwty/dLFKVVsgbRML4KnaVCTtK0tSH9ezBjb+7F2rP6+
 /0GY86t/VVfdd0OEF45x2lbI8reWsnjBlrDY+5hGlIejnWZDx1G2+afosGADTlXc7I
 o6GRTORi+JKxTchsxcKyD+Bq2TLV5BivvUwhmDjQunad9C9NQAsGapU/G7f2lGK6oA
 6v4vy0rqS1evw==
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Maxime Ripard <mripard@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v13 0/4] drm/atomic-helper: Re-order CRTC and Bridge ops
Date: Fri,  6 Jun 2025 14:25:56 +0200
Message-ID: <174921275438.1606688.14453750248073205511.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
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

On Thu, 05 Jun 2025 22:45:20 +0530, Aradhya Bhatia wrote:
> This series re-orders the sequences in which the drm CRTC and the drm
> Bridge get enabled and disabled with respect to each other.
> 
> The bridge pre_enable calls have been shifted before the crtc_enable and
> the bridge post_disable calls have been shifted after the crtc_disable.
> 
> This has been done as per the definition of bridge pre_enable.
> "The display pipe (i.e. clocks and timing signals) feeding this bridge will
> not yet be running when this callback is called".
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
