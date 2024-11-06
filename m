Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A01D9BF5E3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 19:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51A210E767;
	Wed,  6 Nov 2024 18:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4D9910E767
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 18:59:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BAD1497
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 11:00:22 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 504A93F528
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 10:59:52 -0800 (PST)
Date: Wed, 6 Nov 2024 18:59:44 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH] drm/panthor: Lock XArray when getting entries for heap
 and VM
Message-ID: <Zyu8oP3a4l678uhd@e110455-lin.cambridge.arm.com>
References: <20241106120748.290697-1-liviu.dudau@arm.com>
 <20241106131641.47487624@collabora.com>
 <ZytqzTg2QnEkvDcl@e110455-lin.cambridge.arm.com>
 <20241106142133.09378b5a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106142133.09378b5a@collabora.com>
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

On Wed, Nov 06, 2024 at 02:21:33PM +0100, Boris Brezillon wrote:
> On Wed, 6 Nov 2024 13:10:37 +0000
> Liviu Dudau <liviu.dudau@arm.com> wrote:
> 
> > panthor_heap_pool_release() does not take the panthor_heap_pool::lock, so the protection
> > is not really there. I could fix panthor_heap_pool_release() and then add a
> > lockdep_assert_held() before both calls to xa_load() if you think that's a better
> > solution.
> 
> Hm, but panthor_heap_pool_release() doesn't release the heap contexts,
> it just calls xa_destroy(). If we have objects remaining in the xarray,
> they'll be leaked, but that's not a race. BTW, can we make this two
> separate patches. I feel like the thing on the vm is an actual fix,
> while the second one (adding a helper with a lockdep_assert()) is
> safety net that's worth having, but not necessarily something we need
> to backport.

I've decided to drop the panthor_heap.c changes as Boris is right, the pool->lock
should be enough. Adding a lockdep_assert() right after the down_write() call
also feels a bit silly, so I did not bother with it.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
