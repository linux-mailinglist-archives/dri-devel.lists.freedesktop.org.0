Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B231BA36311
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 17:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C4D10ED07;
	Fri, 14 Feb 2025 16:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kU3OvjKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3ED10ED06;
 Fri, 14 Feb 2025 16:28:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52C075C5832;
 Fri, 14 Feb 2025 16:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAB67C4CED1;
 Fri, 14 Feb 2025 16:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739550499;
 bh=pgd71EpmnkUr9PBF4eQep648ge+sakFKW/+uPciam1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kU3OvjKMmCfrYrIVpg50Qc1QvEVT1ZqLFCMAlw28HHgePVedUhFe1sD/Ug/28cHgq
 +n8ZRLH48l9Xwa39NAG7lxoMyfNsSNgplB9ekCLOLKWA7Oazt8r52RhNHYF6joJsic
 +rSIpHDqnpxz03438kgp2PFzSafbCXDkKq477w5OjroAIhRuC9NYfL9iHLUf3NvmpT
 dFnrvIl6HBN5GO9owmmVxxCvmTLbIjP9Q0HAZ8z7ysOkXvOAZoFJ890gUg6OgBZdXy
 UPxGvt7pdrAMSeOcsNauRitDEJbuWri56uVNEhceW6gS0HoBLIDCF0Udl8WQCKwyz2
 BrChrsPDUtNig==
Date: Fri, 14 Feb 2025 09:28:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Austin Zheng <Austin.Zheng@amd.com>,
 Dillon Varone <dillon.varone@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] drm/amd/display: Disable -Wenum-float-conversion for
 dml2_dpmm_dcn4.c
Message-ID: <20250214162813.GA3221808@ax162>
References: <20241219-amdgpu-fix-enum-float-conversion-again-again-v1-1-ef2c619724b1@kernel.org>
 <CADnq5_NKWH7UC_ow825aAtF1tZXJTVOwDWaqDR8_4Y6EmPXUiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NKWH7UC_ow825aAtF1tZXJTVOwDWaqDR8_4Y6EmPXUiA@mail.gmail.com>
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

On Thu, Dec 19, 2024 at 05:21:41PM -0500, Alex Deucher wrote:
> On Thu, Dec 19, 2024 at 12:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Commit be4e3509314a ("drm/amd/display: DML21 Reintegration For Various
> > Fixes") blew away commit fdedd77b0eb3 ("drm/amd/display: Reapply
> > 2fde4fdddc1f"), which itself was a reapplication for the same reason,
> > which results in that compiler warning returning:
> >
> >   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c:215:58: error: arithmetic between enumeration type 'enum dentist_divider_range' and floating-point type 'double' [-Werror,-Wenum-float-conversion]
> >     215 |         divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
> >         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > Just disable the warning for the whole file via Makefile to avoid having
> > to reapply the same fix every time the code syncs from wherever it is
> > actually maintained.
> >
> > Fixes: be4e3509314a ("drm/amd/display: DML21 Reintegration For Various Fixes")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> > If you would prefer reapplying the local fix, feel free to do so, but I
> > would like for it to be in the upstream source so it does not have to
> > keep being applied.
> 
> I've reapplied the original fix and I've confirmed that the fix will
> be pushed to the DML tree as well this time.

Did that actually end up happening? Commit 1b30456150e5
("drm/amd/display: DML21 Reintegration") in next-20250214 reintroduces
this warning... I guess it may be a timing thing because the author date
is three weeks ago or so. Should I send my "Reapply" patch or will you
take care of it?

Cheers,
Nathan
