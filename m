Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0CA7F15F
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 01:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33D10E588;
	Mon,  7 Apr 2025 23:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r8Z86gJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4203810E588
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 23:48:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE1BF5C563D;
 Mon,  7 Apr 2025 23:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2EAC4CEDD;
 Mon,  7 Apr 2025 23:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744069694;
 bh=61FySSGCFmYcaDfbgWfsvj/rq0z+27TihchOLygJZyk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r8Z86gJojkJUri5K0AWxvKlU4zjP2gmuFhQCGbJJmxFyihKwvvFO2IAaHOb/0bNdE
 kfHzhAJ1AWCxi/DIZyppPOBls8mrv/D68nZDU041XdNOBYZnH4wmyMQ7jLJY1vyA37
 iamK6ikTJoTmU1a5w7jxK60NIJIgKZzT4rvKqRGyRUoEKkQLLSEG5k8rF/SYG2P04Q
 VnooibXuzPc7+YQhHahs+2glJGfTyZyaPiah8itex2xNcm7DkaBdT4sQJxv4SMf1L7
 FyQNSiSz/m0l31nbQaAstYp5b1G02XyZmcYcsa9b7uJU/RHjVyYV+BcO/dJVdlxcEn
 6p1n/baAFJIaA==
Date: Mon, 7 Apr 2025 18:48:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: jernej.skrabec@gmail.com, krzk@kernel.org, agx@sigxcpu.org,
 linux-kernel@vger.kernel.org, robert.chiras@nxp.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, devicetree@vger.kernel.org, mripard@kernel.org,
 andrzej.hajda@intel.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, airlied@gmail.com
Subject: Re: [PATCH RESEND V2 1/1] dt-bindings: display: nwl-dsi: Allow
 'data-lanes' property for port@1
Message-ID: <174406969099.171841.8161329634639318848.robh@kernel.org>
References: <20250407150442.2778299-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407150442.2778299-1-Frank.Li@nxp.com>
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


On Mon, 07 Apr 2025 11:04:42 -0400, Frank Li wrote:
> This controller support scalable data lanes from 1 to 4. Add the
> 'data-lanes' property to configure the number of MIPI display panel lanes
> selected for boards.
> 
> Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> property referencing video-interfaces.yaml. Allow 'data-lanes' values
> 1, 2, 3, and 4 for port@1.
> 
> Fix below CHECK_DTB warnings:
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
>  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Missed v6.15 merge windows.
> 
> This one elimiate last two lines warning under arm64: dts/freescale
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Resend V2: include Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> tags.
> 
> Original v2 thread:
> https://lore.kernel.org/imx/c5y6mocsd77wj5lah6n47vtteqc5ekcrbdod6z5vtcnxhleudw@kfhpyoiylqqp/
> 
> Change from v1 to v2
> - Add the reason why need 'data-lanes' property in commit message.
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 

Applied, thanks!

