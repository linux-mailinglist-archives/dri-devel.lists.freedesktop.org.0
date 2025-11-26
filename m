Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E15C8B2FA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 18:24:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEE810E6AC;
	Wed, 26 Nov 2025 17:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="K3CPd1RI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC6F10E6AC;
 Wed, 26 Nov 2025 17:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764177892;
 bh=Uc+ssNiXxhERUUzPvJb+iWY49nLHIm/x9daYUYqrCwc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K3CPd1RInTrx+Emz0MHRB+YiM0J8JpqcsqshFwztXkRwhTydVl3u8XzIaVx/0zyrp
 V0ymqaNSqTJZq71ZAyAhinFtLd5BxazQF6Z4OyZGmlfGVwAKPb8rPKVir9lahCfxI3
 d/m3pb90R2cKwXiEZMBRGfiw5ET2qcF/f6UHuaknQLyfR6uRHTx0SkFENPo+/r6w4u
 XDxL72ou5BJbDMeD7PnEBxU3YC3gEQgEiwFtQuxWBqpmjrgcpb040QB5ZkacAo2Fxs
 QLKdbKJU9Soh3+hqXPpvZQRx8i54gr3KtiAb/vVgwVUVGlkLdY2NqtYWzsNcWCzn+0
 tzXIBFy8R/YkQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A3A4F17E10E9;
 Wed, 26 Nov 2025 18:24:51 +0100 (CET)
Date: Wed, 26 Nov 2025 18:24:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>, Thierry
 Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v6 00/16] drm/panfrost,panthor: Cached maps and explicit
 flushing
Message-ID: <20251126182447.41d9b2e5@fedora>
In-Reply-To: <bcba3b95-aa46-497a-b76f-e96455bf7ce8@suse.de>
References: <20251126124455.3656651-1-boris.brezillon@collabora.com>
 <bcba3b95-aa46-497a-b76f-e96455bf7ce8@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Wed, 26 Nov 2025 17:20:08 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 26.11.25 um 13:44 schrieb Boris Brezillon:
> > This series implements cached maps and explicit flushing for both panfrost
> > and panthor. To avoid code/bug duplication, the tricky guts of the cache
> > flushing ioctl which walk the sg list are broken into a new common shmem
> > helper which can be used by any driver.  
> 
> Gem-shmem is getting more and more complicated. I think gem-shmem would 
> be better off to be a simple implementation for all the drivers that use 
> shadow buffering and software rendering. There are plenty of them. And 
> drivers like the ones in sysfb/ are our failure-mode fallback. They 
> should have non-complicated memory management wherever possible.

Just to be clear, none of the gem-shmem additions in this series are
forced to existing gem-shmem users, and no extra field is added to
drm_gem_shmem_object. Given how far were are, I'd be tempted to merge
this series, and revisit things later.

> 
> Therefore, could we first duplicate the existing gem-shmem code into 
> gem-uma as we discussed recently on IRC? The changes are simple:
> 
> - copy the existing gem-shmem to gem-uma (plus renames)
> - convert panthor and panfrost to the new interfaces

Actually, I started a panthor patchset adding reclaim support, and one
of the patch is parting ways with gem-shmem. I was planning on sending
that after I've got all the pending panthor patches merged.

Based on what we end up with, and if others are interested in moving to
this new implementation, I'll extract the code into a gem-uma layer, as
discussed.

> 
> And on top of that, further improvements, such as the series at hand, 
> could be done. Later we'd convert other drivers to gem-uma where it 
> fits, such as lima.

I'm fine with the request to fork gem-shmem in order to simplify the
implementation for the non-GPU use cases, it's the ordering I'm not
super happy with, because we're already at v6, and I was expecting those
changes to be merged soon...
