Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3987AB077F2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 16:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0539410E757;
	Wed, 16 Jul 2025 14:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="draWh2eO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A3910E757
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 14:24:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D1D0614A1;
 Wed, 16 Jul 2025 14:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6418C4CEE7;
 Wed, 16 Jul 2025 14:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1752675886;
 bh=GcRVyuyICkB4oYe+kNj5tR7mu/raflvNKtFzB2rF/rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=draWh2eO3YZdQSdhKfGiQv5HceZ46q38NDX5a8WwvB3SSqdjUEQiICT9amU58tYvD
 ueHETWvA6yewuqf8qD9mW3LkJULiEgQclHFVxO8wkVsPi1CUtEhmntuL/JDMk7vIGX
 IfB1VlKdy813cg28+ROsgMRYdZosZUm2ryFqvw3Q=
Date: Wed, 16 Jul 2025 16:24:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phasta@kernel.org
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 "cao, lin" <lin.cao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] drm/sched: Remove optimization that causes hang when
 killing dependent jobs
Message-ID: <2025071623-sanitary-gully-a1b6@gregkh>
References: <b7e207ef3a775fed0f344ca24990c5aeb36b2507.camel@mailbox.org>
 <CO6PR12MB5491F9E1F21F95C89CC91DA2F556A@CO6PR12MB5491.namprd12.prod.outlook.com>
 <df5fe40e79db8e988661704ea4f72be1a2e4c14c.camel@mailbox.org>
 <fd46ca0c-e484-4bf8-b74e-0139ecc7deae@mailbox.org>
 <49d822fc0f46e0fdeaccaeb2fbb1ade1c5cb1e5d.camel@mailbox.org>
 <ff383098-b453-44bd-9862-c6fc1447cf1d@amd.com>
 <2025071635-petition-unhitched-bdd0@gregkh>
 <0e58a96e61054ae88de112cb8be7e45e2b6f4f0c.camel@mailbox.org>
 <2025071620-reunion-polka-ae73@gregkh>
 <d229a8b9ddaa169d504bd2dd68faf209709cff60.camel@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d229a8b9ddaa169d504bd2dd68faf209709cff60.camel@mailbox.org>
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

On Wed, Jul 16, 2025 at 04:11:27PM +0200, Philipp Stanner wrote:
> On Wed, 2025-07-16 at 14:05 +0200, Greg Kroah-Hartman wrote:
> > On Wed, Jul 16, 2025 at 01:32:42PM +0200, Philipp Stanner wrote:
> > > On Wed, 2025-07-16 at 13:15 +0200, Greg Kroah-Hartman wrote:
> > > > On Wed, Jul 16, 2025 at 12:58:28PM +0200, Christian König wrote:
> > > > > On 16.07.25 12:46, Philipp Stanner wrote:
> > > > > > +Cc Greg, Sasha
> > > > > > 
> > > > > > On Wed, 2025-07-16 at 12:40 +0200, Michel Dänzer wrote:
> > > > > > > On 16.07.25 11:57, Philipp Stanner wrote:
> > > > > > > > On Wed, 2025-07-16 at 09:43 +0000, cao, lin wrote:
> > > > > > > > > 
> > > > > > > > > Hi Philipp,
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Thank you for the review. I found that this
> > > > > > > > > optimization
> > > > > > > > > was
> > > > > > > > > introduced 9 years ago in commit
> > > > > > > > > 777dbd458c89d4ca74a659f85ffb5bc817f29a35 ("drm/amdgpu:
> > > > > > > > > drop
> > > > > > > > > a
> > > > > > > > > dummy
> > > > > > > > > wakeup scheduler").
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Given that the codebase has undergone significant
> > > > > > > > > changes
> > > > > > > > > over
> > > > > > > > > these
> > > > > > > > > 9 years. May I ask if I still need to include the
> > > > > > > > > Fixes:
> > > > > > > > > tag?
> > > > > > > > 
> > > > > > > > Yes. It's a helpful marker to see where the problem comes
> > > > > > > > from, and
> > > > > > > > it
> > > > > > > > adds redundancy helping the stable-kernel maintainers in
> > > > > > > > figuring
> > > > > > > > out
> > > > > > > > to which kernels to backport it to.
> > > > > > > > 
> > > > > > > > If stable can't apply a patch to a very old stable kernel
> > > > > > > > because
> > > > > > > > the
> > > > > > > > code base changed too much, they'll ping us and we might
> > > > > > > > provide a
> > > > > > > > dedicated fix.
> > > > > > > > 
> > > > > > > > So like that:
> > > > > > > > 
> > > > > > > > Cc: stable@vger.kernel.org # v4.6+
> > > > > > > > Fixes: 777dbd458c89 ("drm/amdgpu: drop a dummy wakeup
> > > > > > > > scheduler")
> > > > > > > 
> > > > > > > FWIW, Fixes: alone is enough for getting backported to
> > > > > > > stable
> > > > > > > branches, Cc: stable is redundant with it.
> > > > > > 
> > > > > > Both are used all the time together, though. And the official
> > > > > > documentation does not list dropping Cc: stable as a valid
> > > > > > option
> > > > > > in
> > > > > > this regard
> > > > > > 
> > > > > > https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1
> > > > > > 
> > > > > > 
> > > > > > As long as the official documentation demands it, I'm not
> > > > > > willing
> > > > > > to
> > > > > > drop it. If the docu were to be changed, that would be fine
> > > > > > by
> > > > > > me, too.
> > > > > 
> > > > > As far as I understand "CC: stable" and "Fixes:" tags are to
> > > > > handle
> > > > > two distinct use cases.
> > > > 
> > > > Yes.
> > > > 
> > > > > "CC: stable..." means please backport, eventually with a kernel
> > > > > version and/or necessary pre-requisites.
> > > > 
> > > > Yes.
> > > > 
> > > > > "Fixes:" only backport if you have this patch in your tree as
> > > > > well.
> > > > > In other words it is a restriction when to backport something.
> > > > 
> > > > No.
> > > > 
> > > > "Fixes:" is only for you to say "this commit fixes this other
> > > > commit".
> > > > And when you add a cc: stable, that will get you a FAILED email
> > > > if
> > > > the
> > > > commit does NOT apply that far back.
> > > 
> > > Does that mean we should NOT add Fixes: if the fixing patch does
> > > not
> > > apply on top of that old commit?
> > 
> > Add Fixes: if you feel it accurataly describes the commit that caused
> > the problem that this commit is fixing.  That is independant of "you
> > need other commits after that to apply this one", that issue can be
> > resolved by reading the stable kernel rules document and following
> > what
> > it says there to do for that.
> > 
> > > And if so, should we drop the Fixes: tag completely in such cases
> > > as
> > > Lin suggested in this thread?
> > 
> > If you don't want to ever be notified of any failures of stable
> > patches
> > being applied as far back as they should be applied, sure, don't put
> > a
> > Fixes: tag.  That means I do a "best effort" and just stop applying
> > when
> > they don't apply anymore.
> > 
> > It also means that if you do NOT have a Fixes: tag, and the commit
> > ends
> > up getting assigned a CVE, we have to assume that the bug has been
> > there
> > since "the beginning of time" and will mark it as such.  Which might
> > cause you headaches if you are responsible for keeping older kernels
> > alive for vendors :)
> > 
> > your call.
> > 
> > hope this helps, and really, this should all be documented already,
> > right?  If not, what is missing (becides the CVE stuff.)
> 
> It does help, thank you.
> 
> Regarding documentation, I can only tell you that the stable kernel
> docu only sparringly mentions the Fixes: tag and it certainly doesn't
> mention what you detail above.
> 
> https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Yes, it does not mention Fixes: because that's not the way to get a
patch applied to the stable trees.

It says, in plain words:

	Option 1

	To have a patch you submit for mainline inclusion later
	automatically picked up for stable trees, add this tag in the
	sign-off area:
		Cc: stable@vger.kernel.org

Simple, complete, and correct, what more do you want?  :)

thanks,

greg k-h
