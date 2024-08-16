Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE8395537C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 00:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5BC10E852;
	Fri, 16 Aug 2024 22:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="o5tVgNn/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B3510E852
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 22:45:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0AD2ECE20D5;
 Fri, 16 Aug 2024 22:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB398C32782;
 Fri, 16 Aug 2024 22:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723848348;
 bh=iDrX16u0LelpRPgCqYpDAtw45aROAMIdsf3ytPkWCjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o5tVgNn/hemXq7NvKi/HfI7Sshqi9puD6hK31NaE2j+J4KFAcHQAcbwtsG7pmxRaC
 qWP2roWS/1RyUFsylYf65vDG9x99ofiOV9Ft+hbMWsZX4fekuhmqmTZMac6OYhZJ1A
 KGxx/8c48If8JFyYSNr68wjiKGA2ccEmU6hVo9Fl0gfm+uTytX9Iv/N+5B0UxI5Ina
 x9PpLFFhdzto6KhWyvfzKEXyNcho+db74mdhsvSU2RySSLPFpuO8Sn2tTqVqASXSzR
 fxLMJwMFbgmUzBmcHCZYdBsGmPW2vrxlIwE1DcH6MWDk29BJAAa92Wa8/yFoXycf7T
 cnN17B1cQYU4w==
Date: Fri, 16 Aug 2024 16:45:48 -0600
From: Rob Herring <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de, vkoul@kernel.org,
 kishon@kernel.org, aisheng.dong@nxp.com, agx@sigxcpu.org,
 francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [PATCH v3 02/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller blit engine
Message-ID: <20240816224548.GF2394350-robh@kernel.org>
References: <20240724092950.752536-1-victor.liu@nxp.com>
 <20240724092950.752536-3-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724092950.752536-3-victor.liu@nxp.com>
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

On Wed, Jul 24, 2024 at 05:29:33PM +0800, Liu Ying wrote:
> i.MX8qxp Display Controller contains a blit engine for raster graphics.
> It may read up to 3 source images from memory and computes one destination
> image from it, which is written back to memory.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3:
> * New patch. (Rob)
> 
>  .../imx/fsl,imx8qxp-dc-blit-engine.yaml       | 204 ++++++++++++++++++
>  1 file changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blit-engine.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
