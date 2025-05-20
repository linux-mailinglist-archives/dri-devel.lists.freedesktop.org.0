Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 108C1ABE3F9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 21:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F71D10E078;
	Tue, 20 May 2025 19:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EQ+s0uJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BAC10E078
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 19:44:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C6833A4AAF0;
 Tue, 20 May 2025 19:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3841FC4CEE9;
 Tue, 20 May 2025 19:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747770289;
 bh=tyB8bM25Lx88UIlFfLPvpzsA6oH222+P3KY3XVdZCD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EQ+s0uJw+DAGmRPrd44KxUoDRsHE10cfsTm2/lPwWlO/EN4fqu7gbS98tFMx7RmYp
 Pj0b+nlPE8D9pYbVRy5Erhg+Xpks/Gz6yxqADe5xxS4K0SzspbASqUitxZRuD+Zk9l
 pd3/z9eiDgE56TCMo/SG/fYD6akLTr1pYybCoNdm7y/CzgCi1K1yKJKLD/1yum13dI
 qdIBTCWXizphNAB2/4o0THYVC/JCvZ2bgx34R9TSu8H4RkF9DeF8NPcOVsPAFWzWDT
 ACizlv1KsOOtYiOC/KaoY+L1KwsKdkvEEC6QI4MnB0sj/9E0SZf7l04nQ5V9R2kNdG
 W2//7OlXAKN5Q==
Date: Tue, 20 May 2025 14:44:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Conor Dooley <conor+dt@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: renesas,dsi: allow
 properties from dsi-controller
Message-ID: <174777028582.1243201.5153635156225821461.robh@kernel.org>
References: <20250520151112.3278569-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520151112.3278569-1-hugo@hugovil.com>
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


On Tue, 20 May 2025 11:11:12 -0400, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Allow to inherit valid properties from the dsi-controller. This fixes the
> following warning when adding a panel property:
> 
> rzg2lc.dtb: dsi@10850000: '#address-cells', '#size-cells', 'panel@0' do not
>     match any of the regexes: 'pinctrl-[0-9]+'
>     from schema $id:
>         http://devicetree.org/schemas/display/bridge/renesas,dsi.yaml#
> 
> Also add a panel property to the example.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
> V1 -> V2: add separate example
> ---
>  .../bindings/display/bridge/renesas,dsi.yaml  | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)
> 

Applied, thanks!

