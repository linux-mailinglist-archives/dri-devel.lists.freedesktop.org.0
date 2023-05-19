Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CAB7093DD
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 11:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E3D10E34C;
	Fri, 19 May 2023 09:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470910E14E;
 Fri, 19 May 2023 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684489261; x=1716025261;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jjSgRuyJkBnG/vrWLXUL4ivDFw/8Ieq66WjecBNhUAg=;
 b=I7w82F+jvU+j+71+xmVd8YTk6GwcgQneVzbOtkM8odpZqxt8ApyZa66b
 jWtdprv76R6Gh8Ja0tTfZ6AApxq9eEMI4iOfsOV4s2zl7W0pqa+DCgG6c
 rApGCbAvEfCmeHjat6+pW7Y03cxLZHaG1XqvVzmby63ouy4jS4v4/Mggo
 aPfQu53eMRMtr4W9Y3f8iSQU6z9I4netixqJ07AB+YzFhMNxu+wWMbY9p
 mqQJjc/wE+cJxdF8BgtuJilBq2JNzA8inu1q4VV35P1oJ0g/c/oyurlLu
 DNswLoHgPqSel2RdzoiyE12SF16fvQpoR60jo8tNOEkcWTpyRKo9ovHO0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354684349"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="354684349"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:41:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="767556568"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; d="scan'208";a="767556568"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:40:58 -0700
Date: Fri, 19 May 2023 11:40:56 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm: fix drmm_mutex_init()
Message-ID: <20230519094056.GB650806@linux.intel.com>
References: <20230519090733.489019-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230519090733.489019-1-matthew.auld@intel.com>
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
 Jocelyn Falempe <jfalempe@redhat.com>, Sarah Walker <sarah.walker@imgtec.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 19, 2023 at 10:07:33AM +0100, Matthew Auld wrote:
> In mutex_init() lockdep identifies a lock by defining a special static
> key for each lock class. However if we wrap the macro in a function,
> like in drmm_mutex_init(), we end up generating:
> 
> int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
> {
>       static struct lock_class_key __key;
> 
>       __mutex_init((lock), "lock", &__key);
>       ....
> }
> 
> The static __key here is what lockdep uses to identify the lock class,
> however since this is just a normal function the key here will be
> created once, where all callers then use the same key. In effect the
> mutex->depmap.key will be the same pointer for different
> drmm_mutex_init() callers. This then results in impossible lockdep
> splats since lockdep thinks completely unrelated locks are the same lock
> class.
> 
> To fix this turn drmm_mutex_init() into a macro such that it generates a
> different "static struct lock_class_key __key" for each invocation,
> which looks to be inline with what mutex_init() wants.
> 
> v2:
>   - Revamp the commit message with clearer explanation of the issue.
>   - Rather export __drmm_mutex_release() than static inline.
> 
> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reported-by: Sarah Walker <sarah.walker@imgtec.com>
> Fixes: e13f13e039dc ("drm: Add DRM-managed mutex_init()")
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Regards
Stanislaw
