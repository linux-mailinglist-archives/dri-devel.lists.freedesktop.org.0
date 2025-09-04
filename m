Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED016B44062
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 17:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F9910EA78;
	Thu,  4 Sep 2025 15:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U7Y5JcbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA96E10EA78
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756999225;
 bh=lVG6RUOs/vuQiBSENy+Q+/Zs0wuP4CpZcsQ73d+Pss8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U7Y5JcbY2K+IP0RMcFoAhMxwWToXwsmZAUBPqSUOj9V997aSIGUmbeK0y6imQs3Mq
 /yPGz/VKDcqdAlxxChCXdUDccQSCCrYO4CdLPYL4kBDnGqqnjlpchyf4QFdGbXfcpA
 s2cd5lGAV2Um5SV545DCTXRIJJPXvwOKFonzwsvH+mZSWKpDK5FZOkP+2ew0Rs5nHg
 wBtisdLnWdyT4UFDT1tBM9hQcvR5sfg7iZ7U/DEdUKx0NHagcfrDeXuT8Q/itWCbBc
 QjAgvmjtx5TS18EhBtX3mi52zUojjACKwpZnC5uobBoTUFImGh4oXZDLVVJa6ZGyBI
 cv54/J3WQod/w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A057617E04D6;
 Thu,  4 Sep 2025 17:20:24 +0200 (CEST)
Date: Thu, 4 Sep 2025 17:20:19 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org, Conor
 Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
Message-ID: <20250904172019.58e5f589@fedora>
In-Reply-To: <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 4 Sep 2025 16:54:38 +0200
Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 9/4/25 4:04 PM, Boris Brezillon wrote:
> 
> Hello Boris,
> 
> >>>> I suspect the extra soft reset I did before "un-halted" the GPU and
> >>>> allowed it to proceed.  
> >>>
> >>> Hm, not quite. I mean, you still need to explicitly boot the MCU after
> >>> a reset, which is what the write to MCU_CONTROL [1] does. What the
> >>> soft-reset does though, is reset all GPU blocks, including the MCU.
> >>> This means the MCU starts from a fresh state when you reach [1].  
> >>
> >> I have a feeling the write to MCU_CONTROL does nothing in my case.  
> > 
> > I believe it does, otherwise you wouldn't be able to kick the MCU
> > and get things working until the first runtime suspend happens. I gut
> > feeling is that there's something fishy in the FW or SoC integration
> > that causes the FW HALT request to put the MCU/GPU in a bad state
> > preventing further MCU_CONTROL(AUTO_START) from functioning correctly
> > after that point.  
> 
> I wonder who at NXP could chime in ... Peng, do you know ?
> 
> >> Is there some way to probe the MCU state before/after setting GLB_HALT,
> >> and also before/after the MCU_CONTROL write, using
> >> gpu_read()/gpu_write() register operations, to find out what is going on
> >> with the MCU at each point ?  
> > 
> > Yes, there's an MCU_STATUS register [1].  
> Is that the only register I can use , or is there something more 
> detailed ? This register only returns values 0..3 which is not very 
> informative.

Not that I'm aware.
