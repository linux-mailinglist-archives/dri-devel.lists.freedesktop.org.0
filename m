Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 482168C8C2B
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 20:16:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142F510EF4E;
	Fri, 17 May 2024 18:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jZcCheO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7246C10EF4E;
 Fri, 17 May 2024 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715969782;
 bh=lT7ANqA15p++xYidjcIo07kOO4xRG9QuB0j8hQzfJzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jZcCheO8ZjwBpoug2Q2/ytG3gx657OskG/XbaIiAZrOhXfcorzpCs4iF5I1afHlgs
 EZ4NZjPdPgX3Cp10KlT8F3s7346E8K0x0ihp4YspKbBELQdEUyW6WnexjRnIzm6Vhg
 yRMtbPnmF9eol0nJKLKxZJT7MkJ6CdvpLSjg7AOl9P5vE3FDD7G/MOiIZOXd+al0FD
 OEgg3IqeqjIFoF/SQwpHht8bL5hIC5gnDGUSIEW7rSevhet68oFAJLvlw0Un8F+BPI
 p+9/xedK8zxIpfkFnKN3HlFvDVn0KYgfrUymxPXLUFTJz3tqt6bdM3wgFaCxKbuNvE
 79uYcdKoa1rlw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5439837821B7;
 Fri, 17 May 2024 18:16:22 +0000 (UTC)
Date: Fri, 17 May 2024 19:16:21 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Steven Price <steven.price@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian Koenig= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Zack Rusin <zack.rusin@broadcom.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v3 0/2] drm: Fix dma_resv deadlock at drm object pin time
Message-ID: <t64xneene7m7x2akecvrmr44yottiicy2mle7e5fimg7vacb4n@n4cjdf7g3nlp>
References: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
 <84a5f7b6-d20a-4c69-83a8-d8394fea2b68@suse.de>
 <20240502135941.136ad639@collabora.com>
 <20240502140012.68e88831@collabora.com>
 <d520ea1b-e399-4c3d-8546-87c68e480cbc@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d520ea1b-e399-4c3d-8546-87c68e480cbc@suse.de>
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

Hi Boris and Thomas,

On 02.05.2024 14:18, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.05.24 um 14:00 schrieb Boris Brezillon:
> > On Thu, 2 May 2024 13:59:41 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > 
> > > Hi Thomas,
> > > 
> > > On Thu, 2 May 2024 13:51:16 +0200
> > > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > 
> > > > Hi,
> > > > 
> > > > ignoring my r-b on patch 1, I'd like to rethink the current patches in
> > > > general.
> > > > 
> > > > I think drm_gem_shmem_pin() should become the locked version of _pin(),
> > > > so that drm_gem_shmem_object_pin() can call it directly. The existing
> > > > _pin_unlocked() would not be needed any longer. Same for the _unpin()
> > > > functions. This change would also fix the consistency with the semantics
> > > > of the shmem _vmap() functions, which never take reservation locks.
> > > > 
> > > > There are only two external callers of drm_gem_shmem_pin(): the test
> > > > case and panthor. These assume that drm_gem_shmem_pin() acquires the
> > > > reservation lock. The test case should likely call drm_gem_pin()
> > > > instead. That would acquire the reservation lock and the test would
> > > > validate that shmem's pin helper integrates well into the overall GEM
> > > > framework. The way panthor uses drm_gem_shmem_pin() looks wrong to me.
> > > > For now, it could receive a wrapper that takes the lock and that's it.
> > > I do agree that the current inconsistencies in the naming is
> > > troublesome (sometimes _unlocked, sometimes _locked, with the version
> > > without any suffix meaning either _locked or _unlocked depending on
> > > what the suffixed version does), and that's the very reason I asked
> > > Dmitry to address that in his shrinker series [1]. So, ideally I'd
> > > prefer if patches from Dmitry's series were applied instead of
> > > trying to fix that here (IIRC, we had an ack from Maxime).
> > With the link this time :-).
> > 
> > [1]https://lore.kernel.org/lkml/20240105184624.508603-1-dmitry.osipenko@collabora.com/T/
> 
> Thanks. I remember these patches. Somehow I thought they would have been
> merged already. I wasn't super happy about the naming changes in patch 5,
> because the names of the GEM object callbacks do no longer correspond with
> their implementations. But anyway.
> 
> If we go that direction, we should here simply push drm_gem_shmem_pin() and
> drm_gem_shmem_unpin() into panthor and update the shmem tests with
> drm_gem_pin(). Panfrost and lima would call drm_gem_shmem_pin_locked(). IMHO
> we should not promote the use of drm_gem_shmem_object_*() functions, as they
> are meant to be callbacks for struct drm_gem_object_funcs. (Auto-generating
> them would be nice.)

I'll be doing this in the next patch series iteration, casting the pin function's
drm object parameter to an shmem object.

Also for the sake of leaving things in a consistent state, and against Boris' advice,
I think I'll leave the drm WARN statement inside drm_gem_shmem_pin_locked. I guess
even though Dmitry's working on it, rebasing his work on top of this minor change
shouldn't be an issue.

Cheers,
Adrian Larumbe

> Best regards
> Thomas
> 
> 
> > 
> > > Regards,
> > > 
> > > Boris
