Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3779AC6C2D
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 16:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4E910E62A;
	Wed, 28 May 2025 14:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lOVAYdQJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7112910E624;
 Wed, 28 May 2025 14:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 836BBA4CC64;
 Wed, 28 May 2025 14:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C333C4CEE3;
 Wed, 28 May 2025 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748443624;
 bh=nLmKJD5IpmF4nfL3t8+jStuysUaSLpHrTyHAc+DS90k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lOVAYdQJb/7IIrN3DLUOOmMT6SSXAefSdXeglizcFB74aaYvRAD+tkM4bh/uCipWq
 5uG4CEOneec46RlwMJLASokeg22OsQf9XmWGk+7h58SKbNUgDpI+PjxPPqs+DiaBS3
 1F02ZH2BfQOTQ6lfIemewVBbGnzks9dkK5Ju51LLww3O8fOLDDi2sXJsv9Tw/vyYqi
 egvX9e2oIRhncOrW+qN8rsMcQ24i4QLInywg4Ff94v5CBjxDbTTo1LU2CumdCuCc3P
 okhO3C6ZXWv5IPrlSdqzf4RfsCBZ25lMKm3tBcEWrXZTsT7D0DoLUyfdXKM6EzSQW9
 NEgO4khV0EWPw==
Date: Wed, 28 May 2025 16:47:00 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, phasta@kernel.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 tursulin@ursulin.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
Message-ID: <aDch5McYYa3AVtTV@pollux>
References: <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
 <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
 <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
 <cbd3eaa4c228c0d0688745e8a539103eb2278a0b.camel@mailbox.org>
 <aDcB0AbQiHOVUyAU@phenom.ffwll.local>
 <CADnq5_NiMOhc95h-GLRjAD7LXyQ=9nb=Uvim1rwX4n9tekLkyA@mail.gmail.com>
 <aDcgAG0R-NxT0PaC@pollux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDcgAG0R-NxT0PaC@pollux>
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

On Wed, May 28, 2025 at 04:39:01PM +0200, Danilo Krummrich wrote:
> On Wed, May 28, 2025 at 09:29:30AM -0400, Alex Deucher wrote:
> > On Wed, May 28, 2025 at 8:45 AM Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > > I do occasionally find it useful as a record of different approaches
> > > considered, which sometimes people fail to adequately cover in their
> > > commit messages. Also useful indicator of how cursed a patch is :-)
> > >
> > > But as long as anything relevant does end up in the commit message and
> > > people don't just delete stuff I don't care how it's done at all. It's
> > > just that the cost of deleting something that should have been there can
> > > be really nasty sometimes, and storage is cheap.
> > 
> > I like them for the same reasons.  Also, even with links, sometimes
> > there are forks of the conversation that get missed that a changelog
> > provides some insight into.  I find it useful in my own development as
> > I can note what I've changed in a patch and can retain that in the
> > commit rather than as something I need to track separately and then
> > add to the patches when I send them out.
> 
> Personally, I don't think it's super useful in the commit message, it still
> remains in the patches sent to the mailing list though. And since we put lore
> links everywhere, it's easily accessible, *including* the context of why a
> change was made from one version to another, i.e. the full conversation.
> 
> However, if we really want that, we should make it an offical thing, since
> currently the kernel's process documentation [1] clearly states otherwise:
> 
> "Please put this information after the '---' line which separates the changelog
> from the rest of the patch. The version information is not part of the changelog
> which gets committed to the git tree. It is additional information for the
> reviewers. If it's placed above the commit tags, it needs manual interaction to
> remove it."
> 
> Alternatively, it can go into the cover letter.

One additional note:

This is not me trying to be super bureaucratic; instead I think being consistent
in the process across the whole kernel results in a better experience for (new)
contributors.

> [1] https://docs.kernel.org/process/submitting-patches.html#commentary
