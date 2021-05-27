Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381FA392C6D
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE2EF6EE8C;
	Thu, 27 May 2021 11:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C27C6EE7E;
 Thu, 27 May 2021 11:16:19 +0000 (UTC)
IronPort-SDR: 23YBh+YSdMY6ES8mP5FOyZAE2qowXS2Ftz+mF4xk1t3rlqUIJ8pVjuSn2LzpvhDoekBQG8my+A
 VD5gzDyjZDBg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="183043840"
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="183043840"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 04:16:19 -0700
IronPort-SDR: JXKNcgLd2D7JcHiYEpSi4GmeQktlDsODPL9sQXU/Abvda2SID17EBc+NlLq3nNPsiNwH9A045k
 5hGpwAXvwkkA==
X-IronPort-AV: E=Sophos;i="5.82,334,1613462400"; d="scan'208";a="477443491"
Received: from vsorokin-mobl.ccr.corp.intel.com (HELO [10.249.39.216])
 ([10.249.39.216])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2021 04:16:15 -0700
Subject: Re: [PATCH] drm/i915: Disable gpu relocations
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <20210526163730.3423181-1-daniel.vetter@ffwll.ch>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <55fb9d6c-23aa-bdce-250f-7f0377441a53@linux.intel.com>
Date: Thu, 27 May 2021 13:16:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210526163730.3423181-1-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 2021-05-26 om 18:37 schreef Daniel Vetter:
> Media userspace was the last userspace to still use them, and they
> converted now too:
>
> https://github.com/intel/media-driver/commit/144020c37770083974bedf59902b70b8f444c799
>
> This means no reason anymore to make relocations faster than they've
> been for the first 9 years of gem. This code was added in
>
> commit 7dd4f6729f9243bd7046c6f04c107a456bda38eb
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jun 16 15:05:24 2017 +0100
>
>     drm/i915: Async GPU relocation processing
>
> Furthermore there's pretty strong indications it's buggy, since the
> code to use it by default as the only option had to be reverted:
>
> commit ad5d95e4d538737ed3fa25493777decf264a3011
> Author: Dave Airlie <airlied@redhat.com>
> Date:   Tue Sep 8 15:41:17 2020 +1000
>
>     Revert "drm/i915/gem: Async GPU relocations only"
>
> This code just disables gpu relocations, leaving the garbage
> collection for later patches and more importantly, much less confusing
> diff. Also given how much headaches this code has caused in the past,
> letting this soak for a bit seems justified.
>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 43 ++++++++-----------
>  1 file changed, 18 insertions(+), 25 deletions(-)

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Note that a lot of complexity may be removed with gpu relocations gone. Some igt tests might also start to fail, as they expect relocations to complete asynchronously.

Is it kept in case we need to revive it?

~Maarten
