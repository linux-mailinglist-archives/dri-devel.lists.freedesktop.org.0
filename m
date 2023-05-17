Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C476F706D9C
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001E110E44C;
	Wed, 17 May 2023 16:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4226710E19B;
 Wed, 17 May 2023 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684339528; x=1715875528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hHCacUkHNFVr1TLeuXXuOoHKVuUURTA9Q0Ewj6Y7U+o=;
 b=gaBVFzFmyCVw5v+bVP0djD5ITImFv/BqMgPxg8YEZkzqrAL7HL+I+nQm
 F7Jz4M5g+WAzDJ8pIJKQZ5dCdG0hcVRHwwnp3VGAxJkBZ7acjvsRN6KV2
 2D1r2Ok706gym5moBSbW8ADrzN7GHF7Qerf4W+r71I42Xal6IpOQGTCD7
 u1Wwt5qR8CEaC4EGLM0by9Snu4M25v8E8FsZvQG/22EDg37SczNxY8Th5
 XCgMYDR3dWg1oZSQr88xnq/NSJkYJSjGhsZjpBXKCkDTh0XsL07qiYVQL
 TNxqvxjGPOqg4c5zDyKZl0WL5PDM6C6rJ+l0Mw0RWh9v1Cs/s9um2CXeK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="354100656"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="354100656"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:05:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="766831188"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="766831188"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:05:25 -0700
Date: Wed, 17 May 2023 18:05:23 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
Message-ID: <20230517160523.GA607652@linux.intel.com>
References: <20230517152244.348171-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517152244.348171-1-matthew.auld@intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 04:22:38PM +0100, Matthew Auld wrote:
> In mutex_init() lockdep seems to identify a lock by defining a static
> key for each lock class. However if we wrap the whole thing in a
> function the static key will be the same for everything calling that
> function, which looks to be the case for drmm_mutex_init(). This then
> results in impossible lockdep splats since lockdep thinks completely
> unrelated locks are the same lock class. The other issue is that when
> looking at splats we lose the actual lock name, where instead of seeing
> something like xe->mem_access.lock for the name, we just see something
> generic like lock#8.
> 
> Attempt to fix this by converting drmm_mutex_init() into a macro, which
> should ensure that mutex_init() behaves as expected.

Nice catch :-) we observed lockdep deadlock false alarms too, but I could
not spot it out and were adding lockdep_set_class(key) to avoid those.


> +static inline void __drmm_mutex_release(struct drm_device *dev, void *res)

Can this be inline if used in drmm_add_action_or_reset() ? 


> +{
> +	struct mutex *lock = res;
> +
> +	mutex_destroy(lock);
> +}
> +
> +/**
> + * drmm_mutex_init - &drm_device-managed mutex_init()
> + * @dev: DRM device
> + * @lock: lock to be initialized
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of mutex_init(). The initialized
> + * lock is automatically destroyed on the final drm_dev_put().
> + */
> +#define drmm_mutex_init(dev, lock) ({					     \
> +	mutex_init(lock);						     \
> +	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
> +})									     \

Regards
Stanislaw


