Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B805B6341
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 00:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170A410E347;
	Mon, 12 Sep 2022 22:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091F10E332;
 Mon, 12 Sep 2022 22:02:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC1FD612BB;
 Mon, 12 Sep 2022 22:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD757C433D6;
 Mon, 12 Sep 2022 22:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663020144;
 bh=5rS0GDQM1LJit2JFh8qRzcwbV07Dpwm7u0iHI8wNtkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aoElzxAKBCsyfJK6B79EpEdBMyLY/kiy/QAFqqRwq/6F3Hgyby5WuTOBea2nYezZB
 +AfOyCrmGITq3l07VLO+3Hji8Zs4SXl92eW6m6TRHj3AAFCU+KQsgw4H/+W02K+WRw
 d0YN9o9QVFY7HnZeLMIQRpTESSuaXl+jZ2m1eoxN/CzUugDVktPxPcxOwy3K4YaUHB
 04pFPTWaBPuUM0LG8u1Q2Th6fGxVGW3HptIohargnZAn9bkHWi2kiwcVVuZuzNoufm
 J71do3AEzj3RrvUAU2gtLIPTgtMHYc9K/F5CqZMhSV+I+eq9Y7PMJMt4N8DJtgt+ze
 Vhpx1/rk694IQ==
Date: Mon, 12 Sep 2022 15:02:22 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Subject: Re: [PATCH 0/5] drm/amd/display: Reduce stack usage for clang
Message-ID: <Yx+sbmj94AOGAMCP@dev-arch.thelio-3990X>
References: <20220830203409.3491379-1-nathan@kernel.org>
 <ddc17b2a-fd9f-2eb6-7cdc-5f17c048b26a@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddc17b2a-fd9f-2eb6-7cdc-5f17c048b26a@amd.com>
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
Cc: llvm@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Tom Rix <trix@redhat.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Mon, Sep 12, 2022 at 05:50:31PM -0400, Rodrigo Siqueira Jordao wrote:
> 
> 
> On 2022-08-30 16:34, Nathan Chancellor wrote:
> > Hi all,
> > 
> > This series aims to address the following warnings, which are visible
> > when building x86_64 allmodconfig with clang after commit 3876a8b5e241
> > ("drm/amd/display: Enable building new display engine with KCOV
> > enabled").
> > 
> >      drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> >      void dml30_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> >          ^
> >      1 error generated.
> > 
> >      drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> >      void dml31_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> >          ^
> >      1 error generated.
> > 
> >      drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
> >      void dml32_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
> >          ^
> >      1 error generated.
> > 
> > This series is based on commit b3235e8635e1 ("drm/amd/display: clean up
> > some inconsistent indentings"). These warnings are fatal for
> > allmodconfig due to CONFIG_WERROR so ideally, I would like to see these
> > patches cherry-picked to a branch targeting mainline to allow our builds
> > to go back to green. However, since this series is not exactly trivial
> > in size, I can understand not wanting to apply these to mainline during
> > the -rc cycle. If they cannot be cherry-picked to mainline, I can add a
> > patch raising the value of -Wframe-larger-than for these files that can
> > be cherry-picked to 6.0/mainline then add a revert of that change as the
> > last patch in the stack so everything goes back to normal for -next/6.1.
> > I am open to other options though!
> > 
> > I have built this series against clang 16.0.0 (ToT) and GCC 12.2.0 for
> > x86_64. It has seen no runtime testing, as my only test system with AMD
> > graphics is a Renoir one, which as far as I understand it uses DCN 2.1.
> > 
> > Nathan Chancellor (5):
> >    drm/amd/display: Reduce number of arguments of
> >      dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport()
> >    drm/amd/display: Reduce number of arguments of
> >      dml32_CalculatePrefetchSchedule()
> >    drm/amd/display: Reduce number of arguments of dml31's
> >      CalculateWatermarksAndDRAMSpeedChangeSupport()
> >    drm/amd/display: Reduce number of arguments of dml31's
> >      CalculateFlipSchedule()
> >    drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline for stack
> >      usage
> > 
> >   .../dc/dml/dcn30/display_mode_vba_30.c        |   2 +-
> >   .../dc/dml/dcn31/display_mode_vba_31.c        | 420 +++++-------------
> >   .../dc/dml/dcn32/display_mode_vba_32.c        | 236 +++-------
> >   .../dc/dml/dcn32/display_mode_vba_util_32.c   | 323 ++++++--------
> >   .../dc/dml/dcn32/display_mode_vba_util_32.h   |  51 +--
> >   5 files changed, 318 insertions(+), 714 deletions(-)
> > 
> > 
> > base-commit: b3235e8635e1dd7ac1a27a73330e9880dfe05154
> 
> Hi Nathan,
> 
> First of all, thanks a lot for your patchset!
> 
> Sorry for the delay; it took me more time than I expected to review and run
> a couple of tests in this patchset (most of them were IGT). Anyway, I'm good
> with this change; this series is:
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> And I applied it to amd-staging-drm-next.
> 
> We will run some extra tests this week; if we find some issues, I'll debug
> them.
> 
> Also, thanks, Maíra, for checking this patch as well.

No worries on the delay, the series is not exactly the smallest one I
have ever sent :) While the changes were mostly mechanical, I could have
definitely messed something up and I appreciate you taking the time to
review it and run it through some tests. Please let me know if I can be
of further assistance on that front.

If you have any thoughts on the blurb I had in the cover letter around
how to handle the warnings this series resolves with regards to
mainline, I would love to hear them.

Cheers,
Nathan
