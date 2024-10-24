Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812FB9AD9DD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 04:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A0510E894;
	Thu, 24 Oct 2024 02:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MXeSpvzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FDDE10E890;
 Thu, 24 Oct 2024 02:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D16BC5C4681;
 Thu, 24 Oct 2024 02:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD7FC4CEC6;
 Thu, 24 Oct 2024 02:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1729736549;
 bh=inagGVKt4Zy33/ZhgAeuzXkDRExPeMKmeWkxJN+StHE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MXeSpvzNZH3neEpfIqeBYyTuGrfYdNqTJ2UNkCyomcsiNhfK7p03iX8EBK4XpNHxN
 q2WMUdjTYcnkaHDpSUg6Aj0cXvEyLymTab+z1UuQhpxQo+aplU98X18LEMW9D4xfOm
 6IIrG145K0vpUS9w6ydRaHBJu9zzOfbo6JW17Oeo=
Date: Wed, 23 Oct 2024 19:22:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <apopple@nvidia.com>
Subject: Re: [PATCH v3 1/1] mm/migrate: Add migrate_device_pfns
Message-Id: <20241023192229.64333482554de0135397cb23@linux-foundation.org>
In-Reply-To: <Zxmn6uGSOgi11rO2@DUT025-TGLU.fm.intel.com>
References: <20241023233944.1798835-1-matthew.brost@intel.com>
 <20241023233944.1798835-2-matthew.brost@intel.com>
 <20241023182217.147ee87197b53d47057a4c06@linux-foundation.org>
 <Zxmn6uGSOgi11rO2@DUT025-TGLU.fm.intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Thu, 24 Oct 2024 01:50:34 +0000 Matthew Brost <matthew.brost@intel.com> wrote:

> > On Wed, 23 Oct 2024 16:39:44 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
> > 
> > > Implement migrate_device_pfns to prepare an array of PFNs for migration.
> > > Handles non-contiguous ranges of device pages that require migration.
> > 
> > OK, that's "what".  We're more interested in "why".
> > 
> 
> Sure can add. The 'why' is:
> 
> A non-contiguous allocation of device pages can occur if a device is
> under memory pressure within a single driver allocation of device
> memory. Additionally, a driver allocation of memory can also be evicted
> under memory pressure. Therefore, an interface for migrating a set of
> non-contiguous device pages is required.

OK, thanks.  But when merging a new interface such as this we like to
see the code which will actually use the interface.  Along with reasons
to believe that the calling code will actually be merged, so we don't
end up with a new interface which has no callers.

Apart from that, I suspect that it makes more sense to merge this via
the DRM tree, alongside the code which uses it.

