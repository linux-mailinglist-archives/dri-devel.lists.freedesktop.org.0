Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E55506E6C16
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5BE10E160;
	Tue, 18 Apr 2023 18:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4220110E160
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 18:29:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E01E62F6B;
 Tue, 18 Apr 2023 18:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A74FC433D2;
 Tue, 18 Apr 2023 18:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681842581;
 bh=8EF/b6rFEqY18fb5qJviLJjMaViEY5I0RMFUi25++jY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N6Ua9lozDUX+VtIi5y1RT1zzlKZd5EN9A+VUZna09GR6kyCpeZOJ7PxApwwBCdlLq
 YJmVFOjM7+dx2foTIuJm+Ymm+jln1k+s7SnRHzRrqW4JDNLGjgyI4NCMTHt34N7Ug1
 A66IY3AY3mwEWc1l55FV7O2pbDamDBO4Xi+aAxB2sn+eJeWJYtThYJWzbRjqUdQ1SS
 NCLj6PkUPPTyla8S/0j1jyUJtYIgKxfGFbWkdzUtt/j/ludJE1VTvo8pcNZowd0YST
 mM9nge6LlHx6LvWqVgkcuyTnWio2jd0V7d2CwkkpJqqnJi5ek7qEenrbFop2tOQL6Q
 bEjRAMUpdK1Yg==
Date: Tue, 18 Apr 2023 11:29:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the drm tree with the powerpc tree
Message-ID: <20230418182938.GA2066635@dev-arch.thelio-3990X>
References: <20230412112213.59365041@canb.auug.org.au>
 <20230413184725.GA3183133@dev-arch.thelio-3990X>
 <2d69ba0a-b12f-4bd1-83c5-d7c01ceec4e8@sirena.org.uk>
 <20230418182145.GA1392657@dev-arch.thelio-3990X>
 <57051c9d-aba4-4c47-bdaf-f7230dbab69a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57051c9d-aba4-4c47-bdaf-f7230dbab69a@sirena.org.uk>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 07:25:00PM +0100, Mark Brown wrote:
> On Tue, Apr 18, 2023 at 11:21:45AM -0700, Nathan Chancellor wrote:
> > On Fri, Apr 14, 2023 at 05:55:10PM +0100, Mark Brown wrote:
> 
> > > Done.
> 
> > Thanks a lot, sorry for not saying it sooner! It looks like this
> > regressed in next-20230417 and next-20230418 though.
> 
> Someone sent a mail saying they thought they'd fixed the DRM tree - is
> that not the case?

Does not seem like it:

$ git show -s --format='%h ("%s")'
67d5d9f013d6 ("Add linux-next specific files for 20230418")

$ git grep DRM_AMD_DC_DCN
drivers/gpu/drm/amd/display/Kconfig:    select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))

Cheers,
Nathan
