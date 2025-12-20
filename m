Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7B9CD2F39
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 13:55:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3EC10E012;
	Sat, 20 Dec 2025 12:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hNVOhvyc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B270010E012
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 12:55:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4A2FE40485;
 Sat, 20 Dec 2025 12:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD91FC116D0;
 Sat, 20 Dec 2025 12:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766235319;
 bh=MRnaPvNUsM3C1QVwEqlYbFLPv+0NuwF7Xn+8YTf2DRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hNVOhvyc2nQ2EAOdPfMbSrgPWjIoMShcik8XDz252J1qWh2Zf7pLnjoqxVsVCuJKs
 PV1tuC7ZYu6wUCOn6oBMYOkB8g6YQ/LB3kfEY0ODx6XanTKiRjLJqHfc2ItGXFk9CX
 4dvrfiOUIzRkodk/ym/CrPwizDcc8HfpziStD7e7T6YHhnn5uj1K4qNV0cfgDKrLuR
 RRW6AOsWhACJ+gBNy/AHABBe26wWK2gnAvbmnv5OJ3fENav88l7Byy8h0AZB1BRWqE
 C7oUfrG03fxOsbhxiKmchWXYZWHOQto3vhJ3Tu6BHPxBxSv8059cNJWm5zdCycUDCZ
 h8NWda6wXNJSw==
Date: Sat, 20 Dec 2025 13:52:49 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] overflow: Remove is_non_negative() and
 is_negative()
Message-ID: <aUacIe84RuAxGV6W@levanger>
Mail-Followup-To: Vincent Mailhol <mailhol@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20251220-remove_wtype-limits-v3-0-24b170af700e@kernel.org>
 <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
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

On Sat, Dec 20, 2025 at 12:02:21PM +0100, Vincent Mailhol wrote:
> The is_non_negative() and is_negative() function-like macros just
> exist as a workaround to silence the -Wtype-limits warning. Now that
> this warning is disabled, those two macros have lost their raison
> d'être. Remove them.
> 
> This reverts commit dc7fe518b049 ("overflow: Fix -Wtype-limits
> compilation warnings").
> 
> Suggested-by: Nicolas Schier <nsc@kernel.org>
> Link: https://lore.kernel.org/all/aUT_yWin_xslnOFh@derry.ads.avm.de
> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
> Changelog:
> 
>   v1 -> v2: new patch
> ---
>  include/linux/overflow.h | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>
