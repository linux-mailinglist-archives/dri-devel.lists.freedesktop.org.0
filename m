Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 251944AF380
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 15:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEBC10E4EA;
	Wed,  9 Feb 2022 14:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA30710E4EA;
 Wed,  9 Feb 2022 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644415336; x=1675951336;
 h=message-id:subject:from:to:date:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=g06LB+wvvw32xEoQsGOkCJmGKIE3q5aMdFKDmLcj+B8=;
 b=TR0/hHaA45s7ZYEjRDTUAQ3lpKcB3ieuBvETv/d8GxiQrEXYlQx5kCoo
 MujzKSBdWa+Ak49mIpeVU9olE8dMLErNduVmsG2OT3ggfLwSFaltHf+1w
 wezxiNyc4McUIj/g3+9IfP6qi21XsNpdwRAc6U+8Vj5vRnS8khtOq5qGK
 dPq+AcALhODecv2FtrdscH+4+AuU4IwIzk4OMK7hb4PBvmAzAwG1+wgVs
 NRhXV388JqCuJXT29dBxuCjxz8lVHo7R0nKk3tCio7ym1p88Zti7EJimQ
 64tjOGGDPEfXfxZrDHzBndlh/9kCna6J41qP3la+DCFCdr8MChfQBusk+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="246792974"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="246792974"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 06:02:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="701260468"
Received: from ksenyako-mobl.ccr.corp.intel.com (HELO [10.249.254.168])
 ([10.249.254.168])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 06:02:14 -0800
Message-ID: <b384ad5f76da0009dd49965769bcddbc0395111a.camel@linux.intel.com>
Subject: Re: [PATCH 3/6] dma-buf: Warn about dma_fence_chain container rules v2
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 sumit.semwal@linaro.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org,  linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Date: Wed, 09 Feb 2022 15:02:11 +0100
In-Reply-To: <20220204100429.2049-4-christian.koenig@amd.com>
References: <20220204100429.2049-1-christian.koenig@amd.com>
 <20220204100429.2049-4-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
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

On Fri, 2022-02-04 at 11:04 +0100, Christian König wrote:
> Chaining of dma_fence_chain objects is only allowed through the prev
> fence and not through the contained fence.
> 
> Warn about that when we create a dma_fence_chain.
> 
> v2: fix comment style
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

It looks like this blows up in generic drm code...

https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_22201/shard-skl10/igt@syncobj_timeline@transfer-timeline-point.html

/Thomas


