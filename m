Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3F6D24BAE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D9610E0A2;
	Thu, 15 Jan 2026 13:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 725BA10E0A2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 13:29:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3480AFEC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 05:29:35 -0800 (PST)
Received: from e142607.local (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 A8B633F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 05:29:41 -0800 (PST)
Date: Thu, 15 Jan 2026 13:28:45 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Subject: Re: [PATCH v1 1/9] drm/gem: Consider GEM object reclaimable if
 shrinking fails
Message-ID: <aWjrjRIeHawkOrre@e142607>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260109130801.1239558-2-boris.brezillon@collabora.com>
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

On Fri, Jan 09, 2026 at 02:07:53PM +0100, Boris Brezillon wrote:
> If the object wasn't moved to a different LRU after the shrink callback
> is called, it means the buffer is still reclaimable. Update the remaining
> counter to reflect that.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/drm_gem.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index f7cbf6e8d1e0..442853511106 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1671,6 +1671,16 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
>  			 */
>  			WARN_ON(obj->lru == &still_in_lru);
>  			WARN_ON(obj->lru == lru);
> +		} else if (obj->lru == &still_in_lru) {
> +			/*
> +			 * If the object wasn't moved and wasn't shrunk either,
> +			 * it's still remaining as reclaimable. Note that
> +			 * obj->lru is supposed to be checked with the LRU lock
> +			 * held for an accurate result, but we don't care about
> +			 * accuracy here. Worst thing that could happen is an
> +			 * extra scan.
> +			 */
> +			*remaining += obj->size >> PAGE_SHIFT;
>  		}
>  
>  		dma_resv_unlock(obj->resv);
> -- 
> 2.52.0
> 
