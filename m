Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B870984E37
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 00:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48DE10E767;
	Tue, 24 Sep 2024 22:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mp6EwC+0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC05610E767
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 22:57:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 974BAA43955;
 Tue, 24 Sep 2024 22:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332CEC4CEC4;
 Tue, 24 Sep 2024 22:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727218635;
 bh=7TOMyGnNRfS07fDKrf9aztT10/hMmF0NI01sY3HZEsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mp6EwC+08tvRjigKaxyJ0SgygzO2X+itRiyuGjzwyDO3asFTYZXXsTplobETHh3tv
 GX9H0Q94sHa0EQR6zMcsS69k3CPXnMn7fsaR80H33xTdnyVw744cqvOqJZvy1bt3sE
 UvA3gPXxNjzwVzDVxujk62sq9gIXVJcGtZ+On8TSvGOjt0dHf6zAsuoJ0dYYpOSm3E
 D/ojir7uhxPXDvqslcjeF4NkgEY/IyeGvUkcnWJ+A2auex1H/itCpG+ob3OOonMvPB
 gi2sryBW6y7IYilQrnCWwxkdPt0s0Ep98KmA+noVQ8SOPF5tXu5lox0ouXHmUKawZ6
 JYfoz4Orlj1EA==
Date: Tue, 24 Sep 2024 17:57:14 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Lukasz Majewski <lukma@denx.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: lcdif: Add support for specifying display
 with timings
Message-ID: <20240924225714.GA441530-robh@kernel.org>
References: <20240923135744.2813712-1-lukma@denx.de>
 <0e72b574-14ec-4369-b899-30d5c615d238@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e72b574-14ec-4369-b899-30d5c615d238@denx.de>
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

On Mon, Sep 23, 2024 at 07:53:57PM +0200, Marek Vasut wrote:
> On 9/23/24 3:57 PM, Lukasz Majewski wrote:
> > Up till now the fsl,lcdif.yaml was requiring the "port" property as a
> > must have to specify the display interface on iMX devices.
> > 
> > However, it shall also be possible to specify the display only with
> > passing its timing parameters (h* and v* ones) via "display" property:
> > (as in
> > Documentation/devicetree/bindings/display/panel/display-timings.yaml).
> 
> Timings should go into panel node, not into scanout engine node.
> 
> See e.g. panel-timings in arch/arm64/boot/dts/freescale/imx8mm-phg.dts , in
> your case the compatible might be "panel-dpi" .

I agree, but if this is already in use, we should allow it. We can mark 
it deprecated though.

Rob
