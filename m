Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795F9C6135E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 12:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 349F010E0F6;
	Sun, 16 Nov 2025 11:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O9lwb9Mt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C2C10E0F6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 11:33:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5EFD844158;
 Sun, 16 Nov 2025 11:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A80B7C4CEF1;
 Sun, 16 Nov 2025 11:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763292802;
 bh=aTVKcWg8+7e+j27IM4wyG63oyRGSBSps9hXBl5rry+4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O9lwb9MtrAwaMgWxarcIBMhbs88fyByN1BXLpUCIMMB9VGpbHAI70G8h6pfD8VPMh
 elnjiiZFkkuJlAohkMpH3CJr9VOmJ3ZtZfrB+HAy0/p+kXeaQcXjHpa5JC0bqeyFJA
 2YGALecHiW3KJV4NejWLA4Oq6BSoTDsOp69+AuqEb3a+DASnPHhQH5vbFCoJsIcFSA
 mIY66abzLRKzkOeIs36AzO9AvLG9h1xpzpJcCGWkcK3xYlfgaiWpLfYksTYv9zOsOx
 JT+pdLB0NdaAwU+awik54ZLMs2lh3XHJi6wH/k/4bZGlQPOzmEs0e1jGY6QzfT6Fr0
 PwW+fxwZuD+HA==
Date: Sun, 16 Nov 2025 12:33:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: wens@csie.org, samuel@sholland.org, mripard@kernel.org, 
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, 
 sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: display: allwinner: Update H616 DE33
 binding
Message-ID: <20251116-pigeon-of-optimal-blizzard-2cb3b3@kuoka>
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-7-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251115141347.13087-7-jernej.skrabec@gmail.com>
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

On Sat, Nov 15, 2025 at 03:13:46PM +0100, Jernej Skrabec wrote:
> As it turns out, current H616 DE33 binding was written based on
> incomplete understanding of DE33 design. Namely, planes are shared
> resource and not tied to specific mixer, which was the case for previous
> generations of Display Engine (DE3 and earlier).
> 
> This means that current DE33 binding doesn't properly reflect HW and
> using it would mean that second mixer (used for second display output)
> can't be supported.
> 
> Update DE33 mixer binding so instead of referencing planes register
> space, it contains phandle to newly introduced DE33 planes node.
> 
> There is no user of this binding yet, so changes can be made safely,
> without breaking any backward compatibility.

And why would you configure statically - per soc - always the same plane
as per mixer? If you do that, it means it is really fixed and internal
to display engine thus should not be exposed in DT.

Describing each IP block resource in DT is way too granular.

Best regards,
Krzysztof

