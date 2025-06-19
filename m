Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8BADFA46
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 02:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0091310E972;
	Thu, 19 Jun 2025 00:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="owdmuYtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 413 seconds by postgrey-1.36 at gabe;
 Thu, 19 Jun 2025 00:33:16 UTC
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F8E10E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 00:33:16 +0000 (UTC)
Date: Wed, 18 Jun 2025 17:26:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1750292779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nuhOj2JDkzQw/7zlAKVO2sNp6aWtcNRC5tsim0B+Biw=;
 b=owdmuYtmxGijCF8aj30nwEZFIvtSrofp4uTKtSyHtqqqyhHoFQZEeOFQBhzbjOyHxXXCGO
 2hxOf55XeQ4rWKzeeIIwuKi/Nc6TkyMPswsjp5dnPgfe19tvUBESQbrZkfotYAGX8x69KG
 fVXgQzMAWejXuX7eVp/pWkKtn7PKjIg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>, 
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters
Message-ID: <6yxpihotsrg73dmlr2fajga2b7qbdnsroi2tq7alohrqt56dx3@sjyoy4yg2ck7>
References: <20250618040618.564650-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618040618.564650-1-airlied@gmail.com>
X-Migadu-Flow: FLOW_OUT
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

On Wed, Jun 18, 2025 at 02:06:17PM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> While discussing memcg intergration with gpu memory allocations,
> it was pointed out that there was no numa/system counters for
> GPU memory allocations.
> 
> With more integrated memory GPU server systems turning up, and
> more requirements for memory tracking it seems we should start
> closing the gap.
> 
> Add two counters to track GPU per-node system memory allocations.
> 
> The first is currently allocated to GPU objects, and the second
> is for memory that is stored in GPU page pools that can be reclaimed,
> by the shrinker.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> 
> I'd like to get acks to merge this via the drm tree, if possible,
> 
> Dave.
> ---
>  Documentation/filesystems/proc.rst | 6 ++++++
>  drivers/base/node.c                | 5 +++++
>  fs/proc/meminfo.c                  | 6 ++++++
>  include/linux/mmzone.h             | 2 ++
>  mm/show_mem.c                      | 9 +++++++--
>  mm/vmstat.c                        | 2 ++
>  6 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 5236cb52e357..45f61a19a790 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -1095,6 +1095,8 @@ Example output. You may not have all of these fields.
>      CmaFree:               0 kB
>      Unaccepted:            0 kB
>      Balloon:               0 kB
> +    GPUActive:             0 kB
> +    GPUReclaim:            0 kB
>      HugePages_Total:       0
>      HugePages_Free:        0
>      HugePages_Rsvd:        0
> @@ -1273,6 +1275,10 @@ Unaccepted
>                Memory that has not been accepted by the guest
>  Balloon
>                Memory returned to Host by VM Balloon Drivers
> +GPUActive
> +              Memory allocated to GPU objects
> +GPUReclaim
> +              Memory in GPU allocator pools that is reclaimable

Can you please explain a bit more about these GPUActive & GPUReclaim?
Please correct me if I am wrong, GPUActive is the total memory used by
GPU objects and GPUReclaim is the subset of GPUActive which is
reclaimable (possibly through shrinkers).
