Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 352659C1EF3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 15:15:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437D10E1B4;
	Fri,  8 Nov 2024 14:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="dyRNsVDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4747010E1B4
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 14:15:49 +0000 (UTC)
Date: Sat, 9 Nov 2024 01:15:16 +1100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1731075347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LsPCVms6hNNfLUkJTitnYnu1jKozUMg34GhP2YbGR/Y=;
 b=dyRNsVDTwaKej4kfRQld0HktPA9K31WMR+7RMV7BkZyFHohDGsgh1Ni/SdHK1cF+2R1gR3
 E44AMjR6bxQC7HScfiopeaR5sHe7tc5H73ez0wWQdpHXWy+DDSSuypMNYDuvBXu91X5OYX
 /zTcFle6IGlpjTeWpb1qWnbZ4sdt3OTUUJzLFXD85jv/Inx7Ng4nrf7Oa/tgwPYKYOHXfq
 q6Qyy6x94JDR5O6fGBJaN8B9vzCA5hihKqFw26GUNovZ5TwZAmuEy2myt3SLTCR/6xVmhU
 05FqmKXjfPLpUsWxlc8ivY1X3kFTZyT6Tj9eDu6viVNU/iM4CR6BdagzgqLxEw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Parthiban <parthiban@linumiz.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <Zy4c9BFcrz2JVU6k@titan>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
 <20241108115357.691b77b0@donnerap.manchester.arm.com>
 <Zy4SKCBwce3q0yj5@titan>
 <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b26b9d86-4ff9-4543-85ce-176dccfbfa05@linumiz.com>
X-Migadu-Flow: FLOW_OUT
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

On Fri, Nov 08, 2024 at 07:36:16PM +0530, Parthiban wrote:
> To add, 0x20 will be DE0 <--> LCD0 and DE1 <--> TV0. Below note (copied from
> R40) states the priority of the DE selection, which fails to work? Not sure,
> may be disabling CORE1_SCLK_GATE and CORE1_HCLK_GATE in de2-clk helps.
> 
> With A133 following the same as T113 with single mixer without TV, still
> sets 0x20 in vendor kernel.
> 
> copied from R40:
> Note: The priority of DE0 is higher than DE1.
> If TCON_LCD0 selects DE0 and DE1 as source at the same time, then
> DE0 will be used for the source of TCON_LCD0.

Hi there,

Yes that was a pretty bad typo, I meant to say DE1 to TV0
The prioritization seems broken in the T113 at least, it's racy from
what I see in testing. I should note this in the patch too.

I looked at the datasheets and kernel code briefly: I can't seem to
figure out what SCLK/HCLK gating does and I don't think the kernel
touches these registers which are gated by default.

> Thanks,
> Parthiban

John Watts
