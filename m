Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFDD42C2DD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 16:21:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E096EA35;
	Wed, 13 Oct 2021 14:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489EB6EA02;
 Wed, 13 Oct 2021 14:21:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227397403"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="227397403"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:21:47 -0700
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="486922078"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.46])
 ([10.249.254.46])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 07:21:46 -0700
Message-ID: <3af6691caadc315b01bf3acdff94ff14f967a4a4.camel@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: Add a struct dma_fence_work
 timeline
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com
Date: Wed, 13 Oct 2021 16:21:43 +0200
In-Reply-To: <YWbUZ2A7iLEAaRW+@phenom.ffwll.local>
References: <20211008133530.664509-1-thomas.hellstrom@linux.intel.com>
 <20211008133530.664509-5-thomas.hellstrom@linux.intel.com>
 <YWbUZ2A7iLEAaRW+@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2021-10-13 at 14:43 +0200, Daniel Vetter wrote:
> On Fri, Oct 08, 2021 at 03:35:28PM +0200, Thomas Hellström wrote:
> > The TTM managers and, possibly, the gtt address space managers will
> > need to be able to order fences for async operation.
> > Using dma_fence_is_later() for this will require that the fences we
> > hand
> > them are from a single fence context and ordered.
> > 
> > Introduce a struct dma_fence_work_timeline, and a function to
> > attach
> > struct dma_fence_work to such a timeline in a way that all previous
> > fences attached to the timeline will be signaled when the latest
> > attached struct dma_fence_work signals.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> I'm not understanding why we need this:
> 
> - if we just want to order dma_fence work, then an ordered workqueue
> is
>   what we want. Which is why hand-rolling is better than reusing
>   dma_fence_work for absolutely everything.
> 
> - if we just need to make sure the public fences signal in order,
> then
>   it's a dma_fence_chain.

Part of the same series that needs reworking.

What we need here is a way to coalesce multiple fences from various
contexts (including both gpu and work fences) into a single fence and
then attach it to a timeline.

/Thomas




