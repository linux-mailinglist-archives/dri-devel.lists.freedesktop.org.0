Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E8955670
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 10:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F64810E036;
	Sat, 17 Aug 2024 08:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jrf2ipw+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7A910E036;
 Sat, 17 Aug 2024 08:42:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B83D9CE0FFC;
 Sat, 17 Aug 2024 08:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765E7C116B1;
 Sat, 17 Aug 2024 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723884173;
 bh=wCPDpgJU3wZjcbdksuUtn6o6BHEmcbYJwksedTAOdnk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jrf2ipw+XP2hHIoE9izV0sNQF5Nl4z321jHbyn0zWZPoZqPL1LR02dn/0ycdsYPSK
 hNCp7UJ6cf+jtTaAIWFzs5JOehixXWZND8OCkVRRgV5H22njOjNNr5IZJwcoZ78M21
 fESXQWNCsepCSQQsZRxrfoW/kfbb/ovifwsYjtxo=
Date: Sat, 17 Aug 2024 10:42:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kevin Holm <kevin@holm.dev>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 amd-gfx@lists.freedesktop.org,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Wayne Lin <wayne.lin@amd.com>,
 Jerry Zuo <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Message-ID: <2024081739-suburb-manor-e6c3@gregkh>
References: <20240730185339.543359-1-kevin@holm.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730185339.543359-1-kevin@holm.dev>
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

On Tue, Jul 30, 2024 at 08:53:39PM +0200, Kevin Holm wrote:
> From: Wayne Lin <wayne.lin@amd.com>
> 
> [ Upstream commit fa57924c76d995e87ca3533ec60d1d5e55769a27 ]
> 
> [Why]
> dm_dp_mst_is_port_support_mode() is a bit not following the original design rule and cause
> light up issue with multiple 4k monitors after mst dsc hub.
> 
> [How]
> Refactor function dm_dp_mst_is_port_support_mode() a bit to solve the light up issue.
> 
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> [kevin@holm.dev: Resolved merge conflict in .../amdgpu_dm_mst_types.c]
> Fixes: 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for mst mode validation")
> Link: https://lore.kernel.org/stable/d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev/T/#u
> Signed-off-by: Kevin Holm <kevin@holm.dev>
> ---
> I resolved the merge conflict so that, after this patch is applied to the
> linux-6.10.y branch of the stable git repository, the resulting function
> dm_dp_mst_is_port_support_mode (and also the new function 
> dp_get_link_current_set_bw) is identical to the original commit.
> 
> I've confirmed that it fixes the regression I reported for my use case.

And it turns out this change breaks the arm and arm64 builds.  I tried
to fix it up by applying the fixup afterward for this file, but it's
just too much of a mess to unwind this, so I'm going to have to revert
this now, sorry.

See:
	https://lore.kernel.org/r/b27c5434-f1b1-4697-985b-91bb3e9a22df@roeck-us.net
for details.

greg k-h
