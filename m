Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2EE1F4EF0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BE689ADC;
	Wed, 10 Jun 2020 07:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D98289A1A;
 Wed, 10 Jun 2020 07:33:40 +0000 (UTC)
IronPort-SDR: KM0jzZtiHkhalhvOX6iyqbXnKqbtvbTzK+vWDdkANf3V9BQCIJFL/ciXDXW35bfJRMG7hU7V62
 fooB+uIPUnjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 00:33:39 -0700
IronPort-SDR: IPB0qo45bW4Egg1JeE3fsG2kB7Qbs2qhpnyq4SvtQdEAR/fArOJEtYyZdqWXLbPK+SAeQwjIg3
 R+9vqL7F/s7w==
X-IronPort-AV: E=Sophos;i="5.73,495,1583222400"; d="scan'208";a="289093745"
Received: from unknown (HELO intel.com) ([10.237.72.89])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2020 00:33:37 -0700
Date: Wed, 10 Jun 2020 10:29:54 +0300
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 3/3] drm/dp_mst: Fix flushing the delayed port/mstb
 destroy work
Message-ID: <20200610072954.GA10678@intel.com>
References: <20200607212522.16935-1-imre.deak@intel.com>
 <20200607212522.16935-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607212522.16935-3-imre.deak@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 08, 2020 at 12:25:22AM +0300, Imre Deak wrote:
> Atm, a pending delayed destroy work during module removal will be
> canceled, leaving behind MST ports, mstbs. Fix this by using a dedicated
> workqueue which will be drained of requeued items as well when
> destroying it.
>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 17 ++++++++++++++---
>  include/drm/drm_dp_mst_helper.h       |  8 ++++++++
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index 083255c33ee0..075fb5ac9264 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -1630,7 +1630,7 @@ static void drm_dp_destroy_mst_branch_device(struct kref *kref)
>  	mutex_lock(&mgr->delayed_destroy_lock);
>  	list_add(&mstb->destroy_next, &mgr->destroy_branch_device_list);
>  	mutex_unlock(&mgr->delayed_destroy_lock);
> -	schedule_work(&mgr->delayed_destroy_work);
> +	queue_work(mgr->delayed_destroy_wq, &mgr->delayed_destroy_work);
>  }
>  
>  /**
> @@ -1747,7 +1747,7 @@ static void drm_dp_destroy_port(struct kref *kref)
>  	mutex_lock(&mgr->delayed_destroy_lock);
>  	list_add(&port->next, &mgr->destroy_port_list);
>  	mutex_unlock(&mgr->delayed_destroy_lock);
> -	schedule_work(&mgr->delayed_destroy_work);
> +	queue_work(mgr->delayed_destroy_wq, &mgr->delayed_destroy_work);
>  }
>  
>  /**
> @@ -5208,6 +5208,15 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
>  	INIT_LIST_HEAD(&mgr->destroy_port_list);
>  	INIT_LIST_HEAD(&mgr->destroy_branch_device_list);
>  	INIT_LIST_HEAD(&mgr->up_req_list);
> +
> +	/*
> +	 * delayed_destroy_work will be queued on a dedicated WQ, so that any
> +	 * requeuing will be also flushed when deiniting the topology manager.
> +	 */
> +	mgr->delayed_destroy_wq = alloc_ordered_workqueue("drm_dp_mst_wq", 0);
> +	if (mgr->delayed_destroy_wq == NULL)
> +		return -ENOMEM;
> +
>  	INIT_WORK(&mgr->work, drm_dp_mst_link_probe_work);
>  	INIT_WORK(&mgr->tx_work, drm_dp_tx_work);
>  	INIT_WORK(&mgr->delayed_destroy_work, drm_dp_delayed_destroy_work);
> @@ -5252,7 +5261,9 @@ void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr)
>  {
>  	drm_dp_mst_topology_mgr_set_mst(mgr, false);
>  	flush_work(&mgr->work);
> -	cancel_work_sync(&mgr->delayed_destroy_work);
> +	/* The following will also drain any requeued work on the WQ. */
> +	destroy_workqueue(mgr->delayed_destroy_wq);
> +	mgr->delayed_destroy_wq = NULL;
>  	mutex_lock(&mgr->payload_lock);
>  	kfree(mgr->payloads);
>  	mgr->payloads = NULL;
> diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
> index b230ff6f7081..8b9eb4db3381 100644
> --- a/include/drm/drm_dp_mst_helper.h
> +++ b/include/drm/drm_dp_mst_helper.h
> @@ -681,6 +681,14 @@ struct drm_dp_mst_topology_mgr {
>  	 * @destroy_branch_device_list.
>  	 */
>  	struct mutex delayed_destroy_lock;
> +
> +	/**
> +	 * @delayed_destroy_wq: Workqueue used for delayed_destroy_work items.
> +	 * A dedicated WQ makes it possible to drain any requeued work items
> +	 * on it.
> +	 */
> +	struct workqueue_struct *delayed_destroy_wq;
> +
>  	/**
>  	 * @delayed_destroy_work: Work item to destroy MST port and branch
>  	 * devices, needed to avoid locking inversion.
> -- 
> 2.23.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
