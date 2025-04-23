Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF78A9840C
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 10:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9508089B01;
	Wed, 23 Apr 2025 08:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RuSTyi6A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA3189B01;
 Wed, 23 Apr 2025 08:48:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96DE75C5D0D;
 Wed, 23 Apr 2025 08:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11ABC4CEE2;
 Wed, 23 Apr 2025 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745398102;
 bh=lxI7uZm0J8wxK/ssb3AyiM5Vlyi6PpJgaX+mJgJT0qE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RuSTyi6AYiIXpMn7HmgxqlWIEs1Rqk+Xl2bKtLvaQ1s/QEdTz6EFB8lP41hGw008h
 4RdP3hLk1SqU3T0NUDDd2Cp7H/wM8wkcXISxdMfO4KxZlOXQyCKpLK0GYPVEKqfwot
 M1dol5r/n8I425eDRzDlceRWZjAkoVxGfg9OxYNxdFDrZYLr91o5En0NsgurQUoa/H
 NxYTX40WhG0DP1CAz3VfvhKNXzLZ8ewNKwd3MCF3ib78BQ4za/CJu6jvv6gov6Umqp
 ZUu3MaYv+ONa9GvLBKe+scEeYGYVvyOIDLw3wF6aYh5y4sE0zak+/Y/7A20tIwfrIn
 ye5xmXT556K1w==
Date: Wed, 23 Apr 2025 10:48:17 +0200
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
Message-ID: <aAipUTTQuv9MXoTA@pollux>
References: <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
 <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
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

On Wed, Apr 23, 2025 at 08:34:08AM +0100, Tvrtko Ursulin wrote:
> 
> IMO it is better to leave it. Regardless of whether it was added because
> some driver is actually operating like that, it does describe a _currently_
> workable option to avoid memory leaks. Once a better method is there, ie.
> FIXME is addressed, then it can be removed or replaced.

I'm not willing to sign off on encouraging drivers to rely on scheduler
internals -- also not in this case, sorry.

Our primary goal with the scheduler is to *remove* such broken contracts where
drivers rely on scheduler internal implementation details, mess with scheduler
internal data structures etc. This is clearly a step back.

And AFAICT, as by now drivers either do a) or simply nothing (with the exception
of the mock scheduler). Drivers can do a) in the meantime, there's no reason at
all to additionally offer b).
