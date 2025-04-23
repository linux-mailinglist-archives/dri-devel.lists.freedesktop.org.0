Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63546A98745
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 12:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9219B10E666;
	Wed, 23 Apr 2025 10:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PIVL03PD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A97E10E664;
 Wed, 23 Apr 2025 10:26:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7F243614BF;
 Wed, 23 Apr 2025 10:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F98C4CEE2;
 Wed, 23 Apr 2025 10:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745404010;
 bh=ntTT//J2B8pcFKYLfru/QnidU17YFxtnzYOlBfMeaLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIVL03PD2Re97acHs7r+J1qgTccfAsRgtr4NedPLtOaZ/f1HiQDEy2ivUkf5/W740
 zpJ8nWbPcOM9EjusEIH/33HvMFZe9R8DJNZPqqVDni5kzAbrPtzn+zcbqx8vI7cP1s
 aqOUrfM+fEVPlG6FWKEQrsKsyZItUu/n98ezZzEs1rvDxuupkV6rqCskMzNDkYQxc8
 pF33v8M6enghp4WsJFK14grgzWNXGzYnV1oFAzi4Gx7VT9CgswbxndCRgGlJaA4Llx
 RiGs6U+wj67GFRASuFwN8yZuvj1gKgGxaeWypYHql5hCJqcYz2Gy9LLDlBs6g6LWRO
 wbPUGKYmSl+WA==
Date: Wed, 23 Apr 2025 12:26:44 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
Message-ID: <aAjAZH7m96oz4ohC@pollux>
References: <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
 <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
 <aAipUTTQuv9MXoTA@pollux>
 <893b1d5e-7940-4abb-97bb-57f9ee2916cc@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893b1d5e-7940-4abb-97bb-57f9ee2916cc@igalia.com>
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

On Wed, Apr 23, 2025 at 11:10:51AM +0100, Tvrtko Ursulin wrote:
> 
> On 23/04/2025 09:48, Danilo Krummrich wrote:
> > On Wed, Apr 23, 2025 at 08:34:08AM +0100, Tvrtko Ursulin wrote:
> > > 
> > > IMO it is better to leave it. Regardless of whether it was added because
> > > some driver is actually operating like that, it does describe a _currently_
> > > workable option to avoid memory leaks. Once a better method is there, ie.
> > > FIXME is addressed, then it can be removed or replaced.
> > 
> > I'm not willing to sign off on encouraging drivers to rely on scheduler
> > internals -- also not in this case, sorry.
> > 
> > Our primary goal with the scheduler is to *remove* such broken contracts where
> > drivers rely on scheduler internal implementation details, mess with scheduler
> > internal data structures etc. This is clearly a step back.
> > 
> > And AFAICT, as by now drivers either do a) or simply nothing (with the exception
> > of the mock scheduler). Drivers can do a) in the meantime, there's no reason at
> > all to additionally offer b).
> 
> What mechanism do we currently have to enable using a), and which you would
> not consider needing knowledge of scheduler internals?

The rule is that drivers must not call drm_sched_fini() before all jobs are
processed.

For this, drivers may reference count their scheduler "subclass" for each job
in flight and only call drm_sched_fini() once the reference count becomes zero,
or keep their own list of jobs in flight and just wait for the list to become
empty.

This is possible with the regular API and none of this requires relying on
scheduler internals or messing with scheduler internal data structures.

The problem is limited to the aspect that the GPU scheduler does not provide an
API for drivers to solve this problem.
