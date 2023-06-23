Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59473C340
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 23:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BF610E6CA;
	Fri, 23 Jun 2023 21:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA5A10E6CA;
 Fri, 23 Jun 2023 21:49:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC17D60F93;
 Fri, 23 Jun 2023 21:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1671C433C8;
 Fri, 23 Jun 2023 21:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687556978;
 bh=bPOn8vNljb4Kts16IvF12pTxf9JAyk3Q+pkgmofKYTI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l4LxiaK6FHJV+LaN+k19qJLvpsW7q6peMpRqQDAloqrBAb7yaQiFzdxyJRQOlUbhL
 XBecHa58jNv7ky9A034GYSD2hm6ptEDQNutUwI9YecVIS3WmPXE3L9OmXsZUz8kwS8
 TTwQFFfOfOtb8MAgVm196q6ZTVuewtnjos3fSTZ9GEVB31g3k5MJS42AVjc5SzUh/V
 FyhyE7GMMMzgjXlbaXwq0dZEfCVwkgehGZA7UY2GwQKM2vvvfQX8LDHnVUTOmbhZdZ
 3Ac0f71z1GBnxhPGwb/beOuZzWJU5QKmGVyY8UMScHTrLfTWh6qN+V7ajaXz+LKLHt
 /jQ/IQ+1PydAw==
Date: Fri, 23 Jun 2023 17:49:34 -0400
From: Chuck Lever <cel@kernel.org>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH 15/29] NFSD: dynamically allocate the nfsd-client shrinker
Message-ID: <ZJYTbnmRKF7j3CHW@manet.1015granger.net>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
 <20230622085335.77010-16-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622085335.77010-16-zhengqi.arch@bytedance.com>
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
Cc: djwong@kernel.org, roman.gushchin@linux.dev, david@fromorbit.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-ext4@vger.kernel.org,
 paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org, vbabka@suse.cz,
 brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 22, 2023 at 04:53:21PM +0800, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink,
> we need to dynamically allocate the nfsd-client shrinker,
> so that it can be freed asynchronously using kfree_rcu().
> Then it doesn't need to wait for RCU read-side critical
> section when releasing the struct nfsd_net.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

For 15/29 and 16/29 of this series:

Acked-by: Chuck Lever <chuck.lever@oracle.com>


> ---
>  fs/nfsd/netns.h     |  2 +-
>  fs/nfsd/nfs4state.c | 20 ++++++++++++--------
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
> index ec49b200b797..f669444d5336 100644
> --- a/fs/nfsd/netns.h
> +++ b/fs/nfsd/netns.h
> @@ -195,7 +195,7 @@ struct nfsd_net {
>  	int			nfs4_max_clients;
>  
>  	atomic_t		nfsd_courtesy_clients;
> -	struct shrinker		nfsd_client_shrinker;
> +	struct shrinker		*nfsd_client_shrinker;
>  	struct work_struct	nfsd_shrinker_work;
>  };
>  
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 6e61fa3acaf1..a06184270548 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -4388,8 +4388,7 @@ static unsigned long
>  nfsd4_state_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
>  {
>  	int count;
> -	struct nfsd_net *nn = container_of(shrink,
> -			struct nfsd_net, nfsd_client_shrinker);
> +	struct nfsd_net *nn = shrink->private_data;
>  
>  	count = atomic_read(&nn->nfsd_courtesy_clients);
>  	if (!count)
> @@ -8094,14 +8093,19 @@ static int nfs4_state_create_net(struct net *net)
>  	INIT_WORK(&nn->nfsd_shrinker_work, nfsd4_state_shrinker_worker);
>  	get_net(net);
>  
> -	nn->nfsd_client_shrinker.scan_objects = nfsd4_state_shrinker_scan;
> -	nn->nfsd_client_shrinker.count_objects = nfsd4_state_shrinker_count;
> -	nn->nfsd_client_shrinker.seeks = DEFAULT_SEEKS;
> -
> -	if (register_shrinker(&nn->nfsd_client_shrinker, "nfsd-client"))
> +	nn->nfsd_client_shrinker = shrinker_alloc_and_init(nfsd4_state_shrinker_count,
> +							   nfsd4_state_shrinker_scan,
> +							   0, DEFAULT_SEEKS, 0,
> +							   nn);
> +	if (!nn->nfsd_client_shrinker)
>  		goto err_shrinker;
> +
> +	if (register_shrinker(nn->nfsd_client_shrinker, "nfsd-client"))
> +		goto err_register;
>  	return 0;
>  
> +err_register:
> +	shrinker_free(nn->nfsd_client_shrinker);
>  err_shrinker:
>  	put_net(net);
>  	kfree(nn->sessionid_hashtbl);
> @@ -8197,7 +8201,7 @@ nfs4_state_shutdown_net(struct net *net)
>  	struct list_head *pos, *next, reaplist;
>  	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
>  
> -	unregister_shrinker(&nn->nfsd_client_shrinker);
> +	unregister_and_free_shrinker(nn->nfsd_client_shrinker);
>  	cancel_work(&nn->nfsd_shrinker_work);
>  	cancel_delayed_work_sync(&nn->laundromat_work);
>  	locks_end_grace(&nn->nfsd4_manager);
> -- 
> 2.30.2
> 
