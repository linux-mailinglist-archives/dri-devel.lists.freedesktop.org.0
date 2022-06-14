Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3DE54BA67
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 21:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D0E112B76;
	Tue, 14 Jun 2022 19:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764C112B76
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 19:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655234258; x=1686770258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=23VQ7leWs0spO1pA9IGsmH1MhRfZo6c/IOuSTQVZUCs=;
 b=NLghmWpe1B2RON9hoM4IYtIfGsVlfX2oVa6+pNQuOlHFfUAfMTizxq8g
 LnrwIC8JthzgVvCgVKW1mT0RSbJsrz3w00Hdrpf9eoeHMajrNWIfYg+0U
 YV1bYsvQSVD3xXmdKDetMI3qKi9TSTr1+Zynp2ZoRaBlVs+NWcqcutncm
 nS5SPTZZXBLRGiFcqQfI6aQBButuMXMccKc3+WC0rWvewr+BiVHAsr444
 SmdwKBlIT02oqtg/4t4aLfjihKcg7cYtX4Kpod3Uvw8UHlUrVrNGY8gpi
 KdLAmUuR1PNy2ouQOpbAAKKfQClbMXOjhnxwq8A3qDydNrFoR+nl/E1jn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="277504833"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="277504833"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 12:17:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="674058704"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.121.200.184])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 12:17:38 -0700
Date: Tue, 14 Jun 2022 12:17:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Message-ID: <20220614191737.GA67@dongwonk-MOBL.amr.corp.intel.com>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
 <20220603211849.27703-3-dongwon.kim@intel.com>
 <20220609042443.giva3mt773fteaio@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609042443.giva3mt773fteaio@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 06:24:43AM +0200, Gerd Hoffmann wrote:
> On Fri, Jun 03, 2022 at 02:18:49PM -0700, Dongwon Kim wrote:
> > Having one fence for a vgfb would cause conflict in case there are
> > multiple planes referencing the same vgfb (e.g. Xorg screen covering
> > two displays in extended mode) being flushed simultaneously. So it makes
> > sence to use a separated fence for each plane update to prevent this.
> > 
> > vgfb->fence is not required anymore with the suggested code change so
> > both prepare_fb and cleanup_fb are removed since only fence creation/
> > freeing are done in there.
> 
> The fences are allocated and released in prepare_fb + cleanup_fb for a
> reason: atomic_update must not fail.

In case fence allocation fails, it falls back to non-fence path so it
won't fail for primary-plane-update.

For cursor plane update, it returns if fence is NULL but we could change
it to just proceed and just make it skip waiting like,

if (fence) {
    dma_fence_wait(&fence->f, true);
    dma_fence_put(&fence->f);
}						

Or maybe I can limit my suggested changes to primary-plane-update only.

What do you think about these?

> 
> I guess virtio-gpu must be fixed to use drm_plane_state->fence
> correctly ...

I was thinking about this too but current functions (e.g.
virtio_gpu_cmd_transfer_to_host_2d) takes "struct virtio_gpu_fence".
Not sure what is the best way to connect drm_plane_state->fence to
virtio_gpu_fence without changing major function interfaces.

> 
> take care,
>   Gerd
> 
