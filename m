Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55075ACDC71
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71DB410E72B;
	Wed,  4 Jun 2025 11:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aCdqXEl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F51410E72B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1749036264;
 bh=xsT7df1iosQgc0GDXxlbzLg0Z/QlQnax8MazA18G5ak=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aCdqXEl/DCOyBnn9BxAS+/b2YaPf/UGyGV6m4yy3uYyL6uM8bs/bKMvFm6arFV+c5
 MuMLWDBM+bdLAs5W1PVV6itr/Jzgv+RhgaRdfOga6lXLo+szBR+TkBXlvcLqwwDgtP
 gsfXvC0OJuYXiDqOEq70RnPjB6TFedF7JnLcYVvqIP+FYn+kHHfl/emDUlozDMq3Nv
 yGgT5UoYRvqg4N6EsuRwqgEfZLHrMjzLYr5nMxN98SJhkTFjVXjnT58+eEp/ID4p+B
 QeJ4Zp/8Nxv+6JYddH7Tdhnf3Q9Ll6+ii15J15buKhq7KFtqxjE5QeGsrzEDxNDdTS
 AfKOcf+rATNLg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 120D517E010B;
 Wed,  4 Jun 2025 13:24:24 +0200 (CEST)
Date: Wed, 4 Jun 2025 13:24:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ashley Smith <ashley.smith@collabora.com>
Cc: "Liviu Dudau" <liviu.dudau@arm.com>, "Steven Price"
 <steven.price@arm.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "kernel"
 <kernel@collabora.com>, "open list:ARM MALI PANTHOR DRM DRIVER"
 <dri-devel@lists.freedesktop.org>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination fails
Message-ID: <20250604132418.6685ff7c@collabora.com>
In-Reply-To: <1973a637a7f.b61987aa482053.3031227813632792112@collabora.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
 <20250603094952.4188093-2-ashley.smith@collabora.com>
 <aD7X-O8ykIGZjHjc@e110455-lin.cambridge.arm.com>
 <1973a637a7f.b61987aa482053.3031227813632792112@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 04 Jun 2025 11:01:27 +0100
Ashley Smith <ashley.smith@collabora.com> wrote:

> On Tue, 03 Jun 2025 12:09:44 +0100 Liviu Dudau <liviu.dudau@arm.com>
> wrote:
>  > On Tue, Jun 03, 2025 at 10:49:31AM +0100, Ashley Smith wrote:   
>  > > This fixes a bug where if we timeout after a suspend and the
>  > > termination fails, due to waiting on a fence that will never be
>  > > signalled for example, we do not resume the group correctly. The
>  > > fix forces a reset for groups that are not terminated correctly.
>  > >   
>  >  
>  > I have a question on the commit message: you're describing a
>  > situation where a fence will *never* be signalled. Is that a real
>  > example? I thought this is not supposed to ever happen! Or are you
>  > trying to say that the fence signalling happens after the timeout?
>  >  
> 
> This covers cases where a fence is never signalled.

Fence not being signaled in time is covered by the job timeout. What
you're fixing here is the FW not responding to a CSG SUSPEND/TERMINATE
request, which is different.

> It shouldn't
> happen, but we have found this in some situations with a FW hang.

This ^.

> Since queue_suspend_timeout() is only called on state update, if a
> suspend/terminate fails due to a FW hang for example this will leave
> delayed work, possibly leading to an incorrect queue_timeout_work().

Nah, that's not true until the second patch in this series is applied,
because drm_sched_stop(), which is called in the
panthor_sched_pre_reset() path, takes care of suspending the drm_sched
timer. What's still problematic if we don't call cs_slot_reset_locked()
here is that we don't re-initialize the FW CS slots, and since
cs_slot_prog_locked() is only called on active queues, we might end up
with an unused CS slot that still has values from the previous user of
this slot. Not sure how harmful this is in practice, but it's certainly
not great.

The true reason we have a Fixes tag is because the second patch has
a Fixes tag too, and it relies on the new driver timer being stopped
even if the FW hangs on a TERMINATE request (queue_suspend_timeout() is
called in cs_slot_reset_locked()). So, either we merge the two patches
back, like was done in v2, or we have to flag both as Fixes.
