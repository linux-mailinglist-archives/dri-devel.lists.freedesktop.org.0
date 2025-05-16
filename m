Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667F0AB996E
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 11:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B84D10EA1F;
	Fri, 16 May 2025 09:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QcKZy4Gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1F910EA1F;
 Fri, 16 May 2025 09:54:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B58BF5C4C08;
 Fri, 16 May 2025 09:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC948C4CEEB;
 Fri, 16 May 2025 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747389239;
 bh=0NmYmHQpmmTXAe2glYLIWi5M+RsPJTTf88j/HHzPGiw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QcKZy4Gmo2P63XWMThleIHYS7/cocfu3Q3YxBEdcqEkiHVs7DzZq0AO9jC6qHAnSh
 4N1lYNti52dAHWiUQIfBi648Hzh6B2J1mxes1ZL958oQtR8jCWad/sCviatNTTqxUN
 S2XsaZqU24xBfc5ZSRwamXONSglPBtNx7Tk8w6kISiNIPVzgt4juIFq4b8/P4veVNR
 wsf+jcLB0hxLfjDwEqbalFsv4CaKKBOrFAvaJKxlT2ECoxW9JJHrwYsxvdzMExro+l
 ONLVxFgh7CvP8ILynCoL+RBjZZTiBZR2My9quDDwWoxuC2I4Zu/cPYCGS3tKWmKG/E
 CXbXHN+Y7tizA==
Date: Fri, 16 May 2025 11:53:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 2/6] drm/sched: Prevent teardown waitque from blocking
 too long
Message-ID: <aCcLMhS5kyD60PEX@pollux>
References: <20250424095535.26119-2-phasta@kernel.org>
 <20250424095535.26119-4-phasta@kernel.org>
 <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1297389f-70f6-4813-8de8-1a0c4f92250a@igalia.com>
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

On Fri, May 16, 2025 at 10:33:30AM +0100, Tvrtko Ursulin wrote:
> On 24/04/2025 10:55, Philipp Stanner wrote:
> > +	 * @kill_fence_context: kill the fence context belonging to this scheduler
> 
> Which fence context would that be? ;)

There's one one per ring and a scheduler instance represents a single ring. So,
what should be specified here?

> Also, "fence context" would be a new terminology in gpu_scheduler.h API
> level. You could call it ->sched_fini() or similar to signify at which point
> in the API it gets called and then the fact it takes sched as parameter
> would be natural.

The driver should tear down the fence context in this callback, not the while
scheduler. ->sched_fini() would hence be misleading.

> We also probably want some commentary on the topic of indefinite (or very
> long at least) blocking a thread exit / SIGINT/TERM/KILL time.

You mean in case the driver does implement the callback, but does *not* properly
tear down the fence context? So, you ask for describing potential consequences
of drivers having bugs in the implementation of the callback? Or something else?

> Is the idea to let drivers shoot themselves in the foot or what?

Please abstain from such rhetorical questions, that's not a good way of having
technical discussions.

- Danilo
