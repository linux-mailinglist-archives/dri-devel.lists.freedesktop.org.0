Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2E7B07478
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 13:16:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD4810E060;
	Wed, 16 Jul 2025 11:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k4QENnLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1130610E060
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 11:16:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 520FCA56F61;
 Wed, 16 Jul 2025 11:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83928C4CEF0;
 Wed, 16 Jul 2025 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752664603;
 bh=TG1acE7nMtWtoIam9461xYKie1pDhX6BPiukuv2rb/8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k4QENnLPhqXVfpjP833WnLbGbHXwioMwf6DqZnFECNZ9SM+s3+qPHAxxaPP1bplpy
 xJH1usHzHrKZ9eRBGwnfLvxdBkyq1VjCHbmrKcULM2d8fJJW3wDkIMKN1DkrkvabSS
 Qle5j/bvjvieA30BwgTU/Nq/fQKQs/5Q4NpRzDRE=
Date: Wed, 16 Jul 2025 13:16:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phasta@kernel.org
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
Message-ID: <2025071623-sleeve-flip-3836@gregkh>
References: <20250715135033.706126-1-lincao12@amd.com>
 <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
 <49d822fc0f46e0fdeaccaeb2fbb1ade1c5cb1e5d.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49d822fc0f46e0fdeaccaeb2fbb1ade1c5cb1e5d.camel@mailbox.org>
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

On Wed, Jul 16, 2025 at 12:46:21PM +0200, Philipp Stanner wrote:
> +Cc Greg, Sasha
> 
> On Wed, 2025-07-16 at 12:40 +0200, Michel Dänzer wrote:
> > On 16.07.25 11:57, Philipp Stanner wrote:
> > > On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
> > > > 
> > > > Hi Philipp,
> > > > 
> > > > 
> > > > Thank you for the review. I found that this optimization was
> > > > introduced 9 years ago in commit
> > > > 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu: drop a
> > > > dummy
> > > > wakeup scheduler").
> > > > 
> > > > 
> > > > Given that the codebase has undergone significant changes over
> > > > these
> > > > 9 years. May I ask if I still need to include the Fixes: tag?
> > > 
> > > Yes. It's a helpful marker to see where the problem comes from, and
> > > it
> > > adds redundancy helping the stable-kernel maintainers in figuring
> > > out
> > > to which kernels to backport it to.
> > > 
> > > If stable can't apply a patch to a very old stable kernel because
> > > the
> > > code base changed too much, they'll ping us and we might provide a
> > > dedicated fix.
> > > 
> > > So like that:
> > > 
> > > Cc: stable@vger.kernel.org # v4.6+
> > > Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup scheduler")
> > 
> > FWIW, Fixes: alone is enough for getting backported to stable
> > branches, Cc: stable is redundant with it.

As stated later in this thread, this is NOT TRUE AT ALL.

Always explicitly tag things for stable with "cc: stable" for stuff you
want to go to the stable trees.  If you only use "Fixes:" there is no
such guarantee at all.

That goes doubly for the drm trees, where we have a hard enough time
applying the cc: stable@ patches that you all double-commit to different
branches, and we dread every time we see it happen...

thanks,

greg k-h
