Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F75A17B11
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD77710E536;
	Tue, 21 Jan 2025 10:09:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a4vNfWTm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BAA10E533
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6BD55C108B;
 Tue, 21 Jan 2025 10:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1A6C4CEDF;
 Tue, 21 Jan 2025 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737454189;
 bh=iKXCTaunJbbRfM7uFpg3sysGlHLpmUBaQn4ftpbByNk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a4vNfWTm0j9rRNxhZuaSage+sdEk8JCmjCoa3wLc6Z5/AfCSE/L5DZ23foA2UuP/8
 eZXlut+CC8hHE5fHnUGnxVpiAnr89DM+5ZjN4NZIPc6x9HL5ibNUtdeT6Oj/qTQh4G
 ruzNd/xMzX95yJ4RDyU+foZRT3hi1ioh3dngg/tOtyEFUlhhMmFNRUatah7N7TdsiQ
 X4Sw3QA3SvgmLclgpjef4/V9xq47jdsGcY9TNc+VyduufFh+1IZM5ijEiUnRHFmQoU
 Ctics4OdqCYxK3KkXTIU6egITiZsI7F/SNS7xUid0gegywWRk7zX92P+2sD07bXnUK
 x2vhHUKEuLTDA==
Date: Tue, 21 Jan 2025 11:09:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, p.zabel@pengutronix.de, m.szyprowski@samsung.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Subject: Re: [RFC v3 10/18] dt-bindings: gpu: Add 'resets' property for GPU
 initialization
Message-ID: <20250121-thankful-discreet-hawk-2fdc26@krzk-bin>
References: <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <CGME20250120172133eucas1p232c85cb934148427e52dd939c974a82b@eucas1p2.samsung.com>
 <20250120172111.3492708-11-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250120172111.3492708-11-m.wilczynski@samsung.com>
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

On Mon, Jan 20, 2025 at 06:21:03PM +0100, Michal Wilczynski wrote:
> Many RISC-V boards featuring Imagination Technologies GPUs require a
> reset line to be de-asserted as part of the GPU power-up sequence. To
> support this, add a 'resets' property (and corresponding 'reset-names')
> to the GPU device tree bindings. This ensures the GPU can be properly
> initialized on these platforms.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

