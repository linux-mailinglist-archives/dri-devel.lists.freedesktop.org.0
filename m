Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF02EAD7F31
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 01:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBBA10E0BD;
	Thu, 12 Jun 2025 23:48:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M1dY5CXU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A37210E0A4;
 Thu, 12 Jun 2025 23:48:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6FD575C6772;
 Thu, 12 Jun 2025 23:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AC1C4CEEA;
 Thu, 12 Jun 2025 23:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749772111;
 bh=O/72JgDCcxrRU5EXgsc21mqxUG13GVYUayVLib8RrAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M1dY5CXUddceuif/EUp4AJDlXiOFIg15mHIIdFmccQVSX93PGRoXCBhpovIckbEFK
 t3KsDvQKlY/EA6WkWfg/Wi4WhXcd/YG8SvQeOlSIP8fzN4SfGiIu0RblyWrqmTpPuK
 0EdUVXMAqdFOTt7yk2RUCyUSBBFnHVl69mDOxtiGjZtCTNUy+1qPIQ7sCYqmTsZhWR
 +cfnVgtl6WE+vHFyWqkdsttgEkMwoWA6XmJC4t6ffC3eI6heNDldM8nMg9sTwuAxyc
 mz2SS/T9CpbBs5+On70NJJdyySeKRXcJQgKM49f04RgwW4yMcTC7tDmZy8teItiSL5
 6l4K1m14wPcmg==
Date: Fri, 13 Jun 2025 01:48:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
Message-ID: <aEtnS6kvh1mssFTb@cassiopeiae>
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com>
 <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com>
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

On Thu, Jun 12, 2025 at 09:00:34AM +0200, Christian König wrote:
> On 6/11/25 17:11, Danilo Krummrich wrote:
> >>>> Mhm, reiterating our internal discussion on the mailing list.
> >>>>
> >>>> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
> >>>>
> >>>> @Philip and @Danilo any opinion on that?
> >>>
> >>> Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
> >>> why we need client_id to be a u64, wouldn't a u32 not be enough?
> >>
> >> That can trivially overflow on long running boxes.
> > 
> > I don't know if "trivially" is the word of choice given that the number is
> > 4,294,967,295.
> > 
> > But I did indeed miss that this is a for ever increasing atomic. Why is it an
> > atomic? Why is it not an IDA?
> 
> Well IDA has some extra overhead compared to an ever increasing atomic, additional to that it might not be the best choice to re-use numbers for clients in a trace log.

I think the overhead is not relevant at all, this is called from
drm_file_alloc(). The only path I can see where this is called is
drm_client_init(), which isn't high frequent stuff at all, is it?

It seems to me that we should probably use IDA here.

> On the other hand using smaller numbers is usually nicer for manual inspection.

Another option is to just add an interface to get a kernel client_id from the
same atomic / IDA.
