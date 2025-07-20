Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F3DB0B76E
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 19:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0247C10E22C;
	Sun, 20 Jul 2025 17:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv01.abscue.de (abscue.de [89.58.28.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D3510E219
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jul 2025 17:35:53 +0000 (UTC)
Received: from srv01.abscue.de (localhost [127.0.0.1])
 by spamfilter.srv.local (Postfix) with ESMTP id D3BE11C025E;
 Sun, 20 Jul 2025 19:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on abscue.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NO_RECEIVED,NO_RELAYS
 autolearn=ham autolearn_force=no version=4.0.1
Date: Sun, 20 Jul 2025 19:35:24 +0200
From: Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] dt-bindings: display: sprd: adapt for UMS9230
 support
Message-ID: <aH0o3HlyPci3-7DK@abscue.de>
References: <20250719-ums9230-drm-v1-0-e4344a05eb3d@abscue.de>
 <20250719-ums9230-drm-v1-1-e4344a05eb3d@abscue.de>
 <9966b9e4-399b-4446-81e4-15daf9acbff7@kernel.org>
 <aHz1Z94swDewvriQ@abscue.de>
 <40fd4502-71d5-435e-83f2-2df933c0467b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40fd4502-71d5-435e-83f2-2df933c0467b@kernel.org>
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

On Sun, Jul 20, 2025 at 05:38:02PM +0200, Krzysztof Kozlowski wrote:
> > 
> > The clocks should be the same on sharkl3 (sc9863a) and ums9230, but
> > the existing bindings don't really make sense here or are incomplete.
> > AFAIK there is no SoC in which this display controller is directly
> > connected to the PLL as shown in the example. The DSI controller is
> 
> This is not the PLL. Gate either. You are looking from wrong side - how
> clock is generated.
> 
> You describe here CLOCK INPUT.
> 
> > connected to a clock gate. The DPU actually does have two clocks, both
> > of which are clock muxes that allow selecting different frequencies and
> > one of which is behind a clock gate. I can add the second clock for the
> > DPU if needed.
> > 
> > Since nothing seems to be using these bindings at the moment, would it
> > be okay to drop the old clock names that refer to specific frequencies?
> 
> It is still completely irrelevant whether these are muxes. Dropping
> existing properties is ABI change, but anyway first figure out what is
> here really.

I was trying to point out that the existing clock names are incorrect
because they refer to a specific source that is not necessarily used
for these clocks, instead of giving a name for the clock input.

For the DPU, would "core" and "dpi" be more appropriate as clock names?
DPI refers to the interface used internally between the DPU and the DSI
controller.

For the DSI controller, it seems that the clock is actually an APB bus
clock needed for accessing the control registers. Again, it is not
required to be connected to a 96MHz clock source as the name used in the
binding suggests. Would something like "apb_clk" or "pclk" be more
descriptive?
