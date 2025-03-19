Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5EA68ECA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D5710E510;
	Wed, 19 Mar 2025 14:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r08pHwKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038CA10E50F;
 Wed, 19 Mar 2025 14:19:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F599A44975;
 Wed, 19 Mar 2025 14:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE96C4CEE4;
 Wed, 19 Mar 2025 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742393939;
 bh=dAoUWEgPhk2QRdXLCT44t/EDS3tWNjL6kBs1ZsCscdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r08pHwKevnU20iS6Nz3unBUAHjit7HMdvHvZZXs95dpRqCUEKGb6iixPZj1MlEjEF
 FZjHaHFu35sDnIaw/QelxEnpNYizzXEizUZJjyonscG3AIPI/OTJEtV9C5UWUms/Kq
 qpBQzaw1k1oWaUtEpHMT1ZbI26zbNx4L6Gli5wotj+Y5G/GKHJR1vntbCRWeNkGPVs
 DVOLAAgHrm8CrfdVBZDX7PaJBpv4r1Car13XYcVJOrTP95zQOkmMtrCR6FqLXLGE04
 WxfBfeUIL2Wk9Gm7yBEDEVxUrrsDhUyJVfQoTzVf1rvQbTHP18kOSEBIx+7gDtqdh9
 lY/A2OOztp0oQ==
Date: Wed, 19 Mar 2025 15:18:54 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Chris Bainbridge <chris.bainbridge@gmail.com>,
 nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lyude@redhat.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
Message-ID: <Z9rSTkXlub-JZAz0@cassiopeiae>
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
 <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
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

On Wed, Mar 19, 2025 at 03:06:52PM +0100, Christian König wrote:
> Am 19.03.25 um 14:04 schrieb Danilo Krummrich:
> 
> >> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
> >> Co-Developed-by: Christian König <christian.koenig@amd.com>
> > Then also Christian's SoB is required.
> 
> I only pointed out which two lines in nouveau need to move to fix this.
> 
> All the credit to figuring out what's wrong go to Chris, but feel free to add my SoB if required.

Then maybe Suggested-by: is the tags that fits best. :)

> 
> >
> >> Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
> > This is a bug report from amdgpu, but I understand that the same issue applies
> > for nouveau.
> 
> The crash in amdgpu was caused by nouveau incorrectly dropping a DMA-buf reference while it was still needed.

Oh, I see.

> 
> Took us a while to figure that out, we could update the tags in the bug report but I think at this point it's unnecessary.

Agreed.

> 
> >
> > If at all, this needs to be
> >
> > 	Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
> >
> > Maybe you can add a brief comment that this report applies for nouveau as well.
> >
> > Please also add a Fixes: tag that indicates the commit in nouveau that
> > introduced the problem and Cc stable.
> 
> As far as I can see it was always there and was added >10years ago with the very first DMA-buf support.
> 
> But adding CC stable is a really good idea.

Sounds good.
