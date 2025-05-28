Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D32AC6BEE
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE76F10E652;
	Wed, 28 May 2025 14:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HkF94/N/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E616D10E60D;
 Wed, 28 May 2025 14:39:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 690815C5585;
 Wed, 28 May 2025 14:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69022C4CEE3;
 Wed, 28 May 2025 14:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748443141;
 bh=9hhs+yXG/AecZ/bUtdW/KuRGFmTLmeWSPu/MBpou1GM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HkF94/N/gN5Jvj2MFFreV4syt+c5sS2zFhhTsFa7D4bDqjipMW/EoPp+3gDIshxnA
 3L23BSqbaDW1PmpTXJKKHwCKvgPtf6EFZV6xlZb/poYH1uKra96KOxATYqfaSTaetV
 OaTj6AFAA4+A/L/Mz4keSTf/VO90zWZkM+LXAbKRn/UxmGZWAs8f7qaClfozzKLM9M
 3jjtgUoql275xJJCeXg2eZO/UNrfULfqdg5NqTRGnrOZjP0+lOMLjOlbeFmE/fUVnC
 1nbpnRIf9I37F/YWKvSIbYfp3lLTHWnorS/UV/m//VGNocCTfs0/eGLcEOnPkMXOU9
 vYMGjA9xczTBQ==
Date: Wed, 28 May 2025 16:38:56 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, phasta@kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 tursulin@ursulin.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Message-ID: <aDcgAG0R-NxT0PaC@pollux>
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
 <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
 <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
 <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
 <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
 <CADnq5_NiMOhc95h-GLRjAD7LXyQ=9nb=Uvim1rwX4n9tekLkyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NiMOhc95h-GLRjAD7LXyQ=9nb=Uvim1rwX4n9tekLkyA@mail.gmail.com>
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

On Wed, May 28, 2025 at 09:29:30AM -0400, Alex Deucher wrote:
> On Wed, May 28, 2025 at 8:45 AM Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > I do occasionally find it useful as a record of different approaches
> > considered, which sometimes people fail to adequately cover in their
> > commit messages. Also useful indicator of how cursed a patch is :-)
> >
> > But as long as anything relevant does end up in the commit message and
> > people don't just delete stuff I don't care how it's done at all. It's
> > just that the cost of deleting something that should have been there can
> > be really nasty sometimes, and storage is cheap.
> 
> I like them for the same reasons.  Also, even with links, sometimes
> there are forks of the conversation that get missed that a changelog
> provides some insight into.  I find it useful in my own development as
> I can note what I've changed in a patch and can retain that in the
> commit rather than as something I need to track separately and then
> add to the patches when I send them out.

Personally, I don't think it's super useful in the commit message, it still
remains in the patches sent to the mailing list though. And since we put lore
links everywhere, it's easily accessible, *including* the context of why a
change was made from one version to another, i.e. the full conversation.

However, if we really want that, we should make it an offical thing, since
currently the kernel's process documentation [1] clearly states otherwise:

"Please put this information after the '---' line which separates the changelog
from the rest of the patch. The version information is not part of the changelog
which gets committed to the git tree. It is additional information for the
reviewers. If it's placed above the commit tags, it needs manual interaction to
remove it."

Alternatively, it can go into the cover letter.

[1] https://docs.kernel.org/process/submitting-patches.html#commentary
