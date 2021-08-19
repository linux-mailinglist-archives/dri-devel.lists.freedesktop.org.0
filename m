Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2523F1463
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 09:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7E16E52D;
	Thu, 19 Aug 2021 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53246E52D;
 Thu, 19 Aug 2021 07:32:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216534676"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216534676"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 00:32:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="462976392"
Received: from mdziuba-mobl.ger.corp.intel.com (HELO [10.249.254.196])
 ([10.249.254.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2021 00:32:24 -0700
Message-ID: <811cc4bfb6262d9050140ed9a9eac1dd7632d33a.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915/debugfs: hook up ttm_resource_manager_debug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 19 Aug 2021 09:32:20 +0200
In-Reply-To: <20210818145850.225387-2-matthew.auld@intel.com>
References: <20210818145850.225387-1-matthew.auld@intel.com>
 <20210818145850.225387-2-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 (3.40.3-1.fc34) 
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

On Wed, 2021-08-18 at 15:58 +0100, Matthew Auld wrote:
> This should give a more complete view of the various bits of internal
> resource manager state, for device local-memory.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c
> b/drivers/gpu/drm/i915/i915_debugfs.c
> index eec0d349ea6a..109e6feed6be 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -238,6 +238,7 @@ i915_debugfs_describe_obj(struct seq_file *m,
> struct drm_i915_gem_object *obj)
>  static int i915_gem_object_info(struct seq_file *m, void *data)
>  {
>         struct drm_i915_private *i915 = node_to_i915(m->private);
> +       struct drm_printer p = drm_seq_file_printer(m);
>         struct intel_memory_region *mr;
>         enum intel_region_id id;
>  
> @@ -245,9 +246,14 @@ static int i915_gem_object_info(struct seq_file
> *m, void *data)
>                    i915->mm.shrink_count,
>                    atomic_read(&i915->mm.free_count),
>                    i915->mm.shrink_memory);
> -       for_each_memory_region(mr, i915, id)
> -               seq_printf(m, "%s: total:%pa, available:%pa bytes\n",
> -                          mr->name, &mr->total, &mr->avail);
> +       for_each_memory_region(mr, i915, id) {
> +               seq_printf(m, "%s: ", mr->name);
> +               if (mr->region_private)
> +                       ttm_resource_manager_debug(mr-
> >region_private, &p);
> +               else
> +                       seq_printf(m, "total:%pa, available:%pa
> bytes\n",
> +                                  &mr->total, &mr->avail);

Hm. Shouldn't we make the above intel_memory_region_debug() or perhaps
intel_memory_region_info() to avoid using memory region internals
directly here?

/Thomas


