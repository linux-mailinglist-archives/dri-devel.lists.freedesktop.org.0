Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617666E308
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79A110E57E;
	Tue, 17 Jan 2023 16:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A3910E57D;
 Tue, 17 Jan 2023 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673971492; x=1705507492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=83QUm+B1soJY7/5R+o87e442WuYAgBdKXUVW9VPPJwY=;
 b=IubsWkpoktWBNxNWo8Q20thw0LC165CNAyzo7Oolz9r+RtyZIgAjm3Rp
 A/KNXhaa+IEwcTMt5Ph+RxLkBkgsEQZY9LVP3tYJxmTFH/aLk88lXdWnt
 aFtxpoz1uPdcB4ouCvVb7boRTeDp7yz3qtCWa3OfyL3MqBKtYNQlJ3nGJ
 hmC67UgXtRZghYLUei/7ZifIEYnggj8toKfMSOwe4PP5alA9kxuXsqbBq
 8qnV9g5hcBbyOUZcFx2FQQ352MwtCF5o1BYUroOLBp46aa6EV7XzLXvI8
 /SebZ+j30dkD1d3Jsvwwu9gZjHcHjt04nFfviYG1V2k9Nmx8AeVxDu4gp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="323427600"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="323427600"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 08:03:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904695680"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="904695680"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 08:03:13 -0800
Date: Tue, 17 Jan 2023 17:03:11 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 04/12] drm/cgroup: Track clients per owning process
Message-ID: <20230117160311.GA15842@linux.intel.com>
References: <20230112165609.1083270-1-tvrtko.ursulin@linux.intel.com>
 <20230112165609.1083270-5-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112165609.1083270-5-tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, cgroups@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kenny.Ho@amd.com, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "T . J . Mercier" <tjmercier@google.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Tejun Heo <tj@kernel.org>,
 =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

On Thu, Jan 12, 2023 at 04:56:01PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> To enable propagation of settings from the cgroup drm controller to drm we
> need to start tracking which processes own which drm clients.
> 
> Implement that by tracking the struct pid pointer of the owning process in
> a new XArray, pointing to a structure containing a list of associated
> struct drm_file pointers.
> 
> Clients are added and removed under the filelist mutex and RCU list
> operations are used below it to allow for lockless lookup.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

<snip>

> +int drm_clients_open(struct drm_file *file_priv)
> +{
> +	struct drm_device *dev = file_priv->minor->dev;
> +	struct drm_pid_clients *clients;
> +	bool new_client = false;
> +	unsigned long pid;
> +
> +	lockdep_assert_held(&dev->filelist_mutex);
> +
> +	pid = (unsigned long)rcu_access_pointer(file_priv->pid);
> +	clients = xa_load(&drm_pid_clients, pid);
> +	if (!clients) {
> +		clients = __alloc_clients();
> +		if (!clients)
> +			return -ENOMEM;
> +		new_client = true;
> +	}
> +	atomic_inc(&clients->num);
> +	list_add_tail_rcu(&file_priv->clink, &clients->file_list);
> +	if (new_client) {
> +		void *xret;
> +
> +		xret = xa_store(&drm_pid_clients, pid, clients, GFP_KERNEL);
> +		if (xa_err(xret)) {
> +			list_del_init(&file_priv->clink);
> +			kfree(clients);
> +			return PTR_ERR(clients);

This looks incorrect, rather xa_err(xret) should be returned.

Regards
Stanislaw
