Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6887E9BCF3C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 15:27:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC60610E0ED;
	Tue,  5 Nov 2024 14:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ogheu//N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110D710E0ED
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 14:27:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EE775C4C0E;
 Tue,  5 Nov 2024 14:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D3CC4CED0;
 Tue,  5 Nov 2024 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730816831;
 bh=H9lnLtemQ/eUrm6ZowUvs0U4ycXB0QN6ws8h/hIo9/c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ogheu//NIDOF8rIG04kMJnc8LFupeuSjfNXm5VShLhda4WRd4NVbJXKt4bczFS3mj
 FupDNUsOy7m41/xyyPuPM+vkL6JTwzVUmImMQWikHeQZaB0KRKZfEYuBJ4XicDAwAX
 AsMigEk1+Q728CPS52aYB6Oc3b10XMSFg57tWEYwbpKq1PA1K5xdveK45YZ9C9O6FW
 2owv2l+weBf2rBtzNawO1P737eFBC7v250BWjA1jaqbVThDaGiLsgGcT9FTNK6HMQp
 TmyBka1xWcHVWrC72ot5uxqJYbB2xB+Y6GOiohoj5aM7IWH4/RHENfyLQ0/hcuU4AW
 NAzSFvX/q1pvQ==
Date: Tue, 5 Nov 2024 08:27:08 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common
 DAI properties
Message-ID: <173081682847.3210195.439507232582613661.robh@kernel.org>
References: <20241105090207.3892242-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105090207.3892242-1-fshao@chromium.org>
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


On Tue, 05 Nov 2024 17:00:28 +0800, Fei Shao wrote:
> The MediaTek DP hardware supports audio and exposes a DAI, so the
> '#sound-dai-cells' property is needed for describing the DAI links.
> 
> Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
> used, and filter out non-DP compatibles as MediaTek eDP in the same
> binding doesn't support audio.
> 
> This fixes dtbs_check error:
>   '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
> Changes in v2:
> - reference to dai-common.yaml since the hardware exposes DAI
>   and update to `unevaluatedProperties: false`
> - update commit message
> 
>  .../display/mediatek/mediatek,dp.yaml         | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

