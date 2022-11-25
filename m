Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBF638C10
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 15:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B03610E7D7;
	Fri, 25 Nov 2022 14:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67E510E7D7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669386253; x=1700922253;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Axf0ye+XEVUXI2xIQqtvgHyZ/gzOeg96So5RXJuA5+0=;
 b=eRe7IfQSPyLwmAL5OVg0+q/7pFHbMzA18aL9ozJtJQP1rap+5waCWP3Z
 GuFxqopsNLtkAyZCwPxGsHKtTQsYHMIRaloQ3oTh5SSuEMYyDAiRTNyNW
 u+uaF1fpFKJt3H02iTimRGBHNbNDOS/troZv8/e5SpbR85LPNX1Rskfny
 77x9FHGJlM1WyQJhbQFFhBv0gacm9JP0EwTgEGmqJDTCtCAqNVcHjJRDk
 s5cBgBQs+AAVzxBnH5JiKTOmCpgUj1TQ/q+rGFlGEy3wGW968wWI4qHnj
 94BU7e8RxmutBUyXC01+M5GnmHdYo8lGq7EpK8NB/XfxXHhlK91Y8E8jX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="315648225"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="315648225"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 06:24:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="887709167"
X-IronPort-AV: E=Sophos;i="5.96,193,1665471600"; d="scan'208";a="887709167"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 06:24:10 -0800
Date: Fri, 25 Nov 2022 15:24:09 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
Subject: Re: [PATCH] drm: Fix possible memleak and UAF in drm_addmap_core()
Message-ID: <20221125142409.GA782501@linux.intel.com>
References: <20221124010219.2653190-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221124010219.2653190-1-cuigaosheng1@huawei.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, chris@chris-wilson.co.uk,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 09:02:19AM +0800, Gaosheng Cui wrote:
> The dma_free_coherent() should be called when memory fails to
> be allocated for list, or drm_map_handle() fails, otherwise there
> will be a memory leak, so add dma_free_coherent to fix it.
> 
> In addition, if drm_map_handle() fails in drm_addmap_core(), list
> will be freed, but list->head will not be removed from dev->map_list,
> then list traversal may cause UAF, fix it by removeing it from
> dev->map_list before kfree().
> 
> Fixes: 8e4ff9b56957 ("drm: Remove the dma_alloc_coherent wrapper for internal usage")
> Fixes: 8d153f7107ff ("drm: update user token hashing and map handles")
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

