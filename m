Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2867FE513
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 01:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6329310E21A;
	Thu, 30 Nov 2023 00:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70CA10E0EC;
 Thu, 30 Nov 2023 00:42:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E9AB61D3F;
 Thu, 30 Nov 2023 00:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9A2C433C8;
 Thu, 30 Nov 2023 00:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701304946;
 bh=8nzlEGlTs23WnuWO60c1e2cluA21UQcXiLq8MdrlUq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Alcgnt/BtUoUp4InDQMZgs/IX+8gQPxIZcPXGUc0udT5b6Tq/haKiZm04X93M1BzD
 Cg2H1jkgvc5R6esOS+bKTc/iFFT9zDGZs+aQqPHL5H6aNrRhLBIV6v3ckvPghTNTiw
 ZKEes9qGssNEGFZXCGEqr1E0pfLLZ0qlTxIvKO1wxGHBL/kg0agO2xr80k+T196MZY
 IasBxgkod+kYtMMOaFuZg7Mv2JV5d2Ji2lJMMPNjpFO7MITDIg8DovvYNYpkFwdNcl
 NDOJAyyQw273ZvY0UoQUICBsc6cWBZQ6iz0LH4Kcv7JjIf502bEGHIiPPd18e74MH2
 ErMz8UgWXsP/A==
Date: Wed, 29 Nov 2023 17:42:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Message-ID: <20231130004224.GE2513828@dev-arch.thelio-3990X>
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123-headdress-mold-0dd7a74477f7@wendy>
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
Cc: llvm@lists.linux.dev, arnd@arndb.de, Leo Li <sunpeng.li@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-riscv@lists.infradead.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
> > RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
> > architectures. Enabling hardware FP requires overriding the ISA string
> > for the relevant compilation units.
> 
> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]

:(

> Nathan, have you given up on these being sorted out?

Does your configuration have KASAN (I don't think RISC-V supports
KCSAN)? It is possible that dml/dcn32 needs something similar to commit
6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
or KCSAN in dml2")?

I am not really interested in playing whack-a-mole with these warnings
like I have done in the past for the reasons I outlined here:

https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/

> Also, what on earth is that function name, it exceeds 80 characters
> before even considering anything else? Actually, I don't think I want
> to know.

Welcome to "gcc-parsable HW gospel, coming straight from HW engineers" :)

Cheers,
Nathan
