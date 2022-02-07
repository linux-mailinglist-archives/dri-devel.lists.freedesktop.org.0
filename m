Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0A44ACA7B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 21:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABC710FA0B;
	Mon,  7 Feb 2022 20:35:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F6710FA0B;
 Mon,  7 Feb 2022 20:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644266114; x=1675802114;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1PMU5mfGN9+HYk8xouP423635HLxNXxDLoElDCcK7RM=;
 b=mL3qquExRfe+jConSL7mRyjQYZ2xVPyLsrXBtNOZimgm9oYEEeBpyHXR
 G2MxyDucNFVTb4+n0XHDtPoTaDLc+HKpIaC4xqngva2WwGG55kYs/rBCr
 9bnVZsgC2u+8h2+wVpT2URF/V1GDCmN9TT9iOPUYpN61LCKxs9v7+IDf3
 qVS9RLM0c8wnO0IjLHH9VC2VJieVH+r+KxOSlfTNaOVFW5vyGED8P7wzI
 XoHrqSimF1O+DErhygQqRQa646YsrBt7KolCFpD2FIS43GlcWS3z1l74c
 UGXFYmrgQnS1e92LyyaM+s0HljHsFzXtinrYxyyd4sG5pPCISkeBgyBSr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="247638879"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="247638879"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:35:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="700596023"
Received: from tebrandt-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.209.6.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:35:02 -0800
Date: Mon, 7 Feb 2022 12:35:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 04/19] drm/i915/gt: Add helper for shmem copy to iosys_map
Message-ID: <20220207203501.jrjufcannp55ifwg@ldmartin-desk2>
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-5-lucas.demarchi@intel.com>
 <ebe6c396-efae-81a8-6c66-f5266ce4e20c@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebe6c396-efae-81a8-6c66-f5266ce4e20c@suse.de>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 04, 2022 at 08:15:12PM +0100, Thomas Zimmermann wrote:
>Hi
>
>Am 04.02.22 um 18:44 schrieb Lucas De Marchi:
>>Add a variant of shmem_read() that takes a iosys_map pointer rather
>>than a plain pointer as argument. It's mostly a copy __shmem_rw() but
>>adapting the api and removing the write support since there's currently
>>only need to use iosys_map as destination.
>>
>>Reworking __shmem_rw() to share the implementation was tempting, but
>>finding a good balance between reuse and clarity pushed towards a little
>>code duplication. Since the function is small, just add the similar
>>function with a copy/paste/adapt approach.
>>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>>Cc: David Airlie <airlied@linux.ie>
>>Cc: Daniel Vetter <daniel@ffwll.ch>
>>Cc: Matthew Auld <matthew.auld@intel.com>
>>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>  drivers/gpu/drm/i915/gt/shmem_utils.c | 33 +++++++++++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/shmem_utils.h |  3 +++
>>  2 files changed, 36 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.c b/drivers/gpu/drm/i915/gt/shmem_utils.c
>>index 0683b27a3890..764adefdb4be 100644
>>--- a/drivers/gpu/drm/i915/gt/shmem_utils.c
>>+++ b/drivers/gpu/drm/i915/gt/shmem_utils.c
>>@@ -3,6 +3,7 @@
>>   * Copyright © 2020 Intel Corporation
>>   */
>>+#include <linux/iosys-map.h>
>>  #include <linux/mm.h>
>>  #include <linux/pagemap.h>
>>  #include <linux/shmem_fs.h>
>>@@ -123,6 +124,38 @@ static int __shmem_rw(struct file *file, loff_t off,
>>  	return 0;
>>  }
>
>Here's a good example of how to avoid iosys_map_incr() and use the 
>memcpy offset:
>
>>+int shmem_read_to_iosys_map(struct file *file, loff_t off,
>>+			    struct iosys_map *map, size_t len)
>>+{
>>+	struct iosys_map map_iter = *map;
>
>Rather replace map_iter with something like
>
>  unsigned long map_off = 0;
>
>>+	unsigned long pfn;
>>+
>>+	for (pfn = off >> PAGE_SHIFT; len; pfn++) {
>>+		unsigned int this =
>>+			min_t(size_t, PAGE_SIZE - offset_in_page(off), len);
>>+		struct page *page;
>>+		void *vaddr;
>>+
>>+		page = shmem_read_mapping_page_gfp(file->f_mapping, pfn,
>>+						   GFP_KERNEL);
>>+		if (IS_ERR(page))
>>+			return PTR_ERR(page);
>>+
>>+		vaddr = kmap(page);
>>+		iosys_map_memcpy_to(&map_iter, 0, vaddr + offset_in_page(off),
>>+				    this);
>
>Use map_off to index into map directly.
>
>>+		mark_page_accessed(page);
>>+		kunmap(page);
>>+		put_page(page);
>>+
>>+		len -= this;
>>+		iosys_map_incr(&map_iter, this);
>
>Raplace iosys_map_incr() with map_off += this;
>
>>+		off = 0;
>
>Maybe off += this ?

Wouldn't that be wrong? AFAICS `off` is the offset of the file (source) and we
zero it here so just the first iteration considers it as a page offset -
next iterations are expected to copy whole pages or the remaining of the
buffer.

Encapsulating the dest offset calculation inside iosys_map with an iter
was a way to avoid this kind of bugs in places that need to keep track
of both source and dest.

Anyway, I disagree and commit here. I will change to map_off and think
about the other cases.

There are also some more complex cases in which copying the map
and work with it avoids other bugs that I will have to think about:

	- patch 9 ("drm/i915/guc: Convert engine record to
	  iosys_map"): as you already noticed we delegate its update to
	  other compilation unit

	- patch 11 ("drm/i915/guc: Convert golden context prep to iosys_map"):
	  info_map, which can point either to the real buffer (in system
	  or IO memory) or to a temporary buffer (system memory)

	- patch 17: it needs to write to 2 parts of struct: passing
	  different offsets depending on the call is IMO more error
	  prone than making sure we are working with the right variable.


thanks
Lucas De Marchi

>
>I think this pattern should be applied to all similar code. As you 
>already noted, iosys_map_incr() is problematic.
>
>Best regards
>Thomas
>
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>  int shmem_read(struct file *file, loff_t off, void *dst, size_t len)
>>  {
>>  	return __shmem_rw(file, off, dst, len, false);
>>diff --git a/drivers/gpu/drm/i915/gt/shmem_utils.h b/drivers/gpu/drm/i915/gt/shmem_utils.h
>>index c1669170c351..e1784999faee 100644
>>--- a/drivers/gpu/drm/i915/gt/shmem_utils.h
>>+++ b/drivers/gpu/drm/i915/gt/shmem_utils.h
>>@@ -8,6 +8,7 @@
>>  #include <linux/types.h>
>>+struct iosys_map;
>>  struct drm_i915_gem_object;
>>  struct file;
>>@@ -17,6 +18,8 @@ struct file *shmem_create_from_object(struct drm_i915_gem_object *obj);
>>  void *shmem_pin_map(struct file *file);
>>  void shmem_unpin_map(struct file *file, void *ptr);
>>+int shmem_read_to_iosys_map(struct file *file, loff_t off,
>>+			    struct iosys_map *map, size_t len);
>>  int shmem_read(struct file *file, loff_t off, void *dst, size_t len);
>>  int shmem_write(struct file *file, loff_t off, void *src, size_t len);
>
>-- 
>Thomas Zimmermann
>Graphics Driver Developer
>SUSE Software Solutions Germany GmbH
>Maxfeldstr. 5, 90409 Nürnberg, Germany
>(HRB 36809, AG Nürnberg)
>Geschäftsführer: Ivo Totev



