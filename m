Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8751EA3EFB1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 10:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6FD10EA40;
	Fri, 21 Feb 2025 09:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eOvrXnia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0203010EA40
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 09:12:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 38AAA611C9;
 Fri, 21 Feb 2025 09:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF0DC4CED6;
 Fri, 21 Feb 2025 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740129177;
 bh=mGyruGLf48W9PdHCU/1T2pGmF4R+E3nW6UeeBVAtmrA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eOvrXniaMi5ISUyFw5P3LDYA3GLaau6Z0hBefRURq22U28Gtx89/qJZqaKQAlFjFn
 NzsqPEeTOS/uB//GvmU2vykTyWBtxHH0fzQMsL9fpmSdqgr4kiX/qreqMIQdIsEilE
 0gpESbJ1rO+tUsJYxEIkKHiuweHLkPPSQo9UZ7D/Rix6NDr7pNTY5HlzlpDk7+bwe4
 2dmjKx7HrIYGyUgRWzAwCM31jwcf2L3OScZDa+jKwqi2TiloIutJDvIHu/s7Pw/cQ1
 rp1f+v5OPY28kaIS5uiLSkMMIqMDOSRqRNEAxfOYqZ67w/rjNERHsYnAN7zXJQKwhu
 n0zmklCfvEevQ==
Date: Fri, 21 Feb 2025 10:12:54 +0100
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
Subject: Re: [PATCH v5 00/21] Enable drm/imagination BXM-4-64 Support for
 LicheePi 4A
Message-ID: <20250221-eminent-squirrel-of-honor-dee80d@krzk-bin>
References: <CGME20250219140249eucas1p1291eb86c932373c847a3314ae54789d5@eucas1p1.samsung.com>
 <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
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

On Wed, Feb 19, 2025 at 03:02:18PM +0100, Michal Wilczynski wrote:
> The LicheePi 4A board, featuring the T-HEAD TH1520 SoC, includes an Imagination
> Technologies BXM-4-64 GPU. Initial support for this GPU was provided through a
> downstream driver [1]. Recently, efforts have been made to upstream support for
> the Rogue family GPUs, which the BXM-4-64 is part of [2].
> 
> While the initial upstream driver focused on the AXE-1-16 GPU, newer patches
> have introduced support for the BXS-4-64 GPU [3]. The modern upstream
> drm/imagination driver is expected to support the BXM-4-64 as well [4][5]. As
> this support is being developed, it's crucial to upstream the necessary glue
> code including clock and power-domain drivers so they're ready for integration
> with the drm/imagination driver.
> 

This is v5 of big patchset which became huge. I understand you did like
that for v1 which was RFC. But it stopped being RFC.

Split your patchset, keeping versioning and changelog, per subsystem.

Best regards,
Krzysztof

