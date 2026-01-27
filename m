Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGl2LUvgeGkGtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:56:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22355973A9
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AEC10E593;
	Tue, 27 Jan 2026 15:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hOX1JPJp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A5510E593
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769529412;
 bh=1jKQDBenEWaJ7TFf0WrfzC1mycbwa8UujGQlMExWCaQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hOX1JPJpzCqCWc7TlXWIgZRV5N7gH7GITOjU48pflKseDKzQWDlLvhkcIDpMd9MuT
 wQE9nwUxuXdtHzPz3OsVckwsUq3BFIoU9I5lS0fZbs0yaxht2/h2mKGJmmR+5ZkyFp
 xRxNVZ5xRq5RVzEV8ny8LeRWDZDKG05bZQUEVASixaR9CZw/xafnzpcaINuKXlb0Sy
 PzrnZzNVWYdiTBcA9JI4keBfODhf2PsR9RpaVXmvRv7n7G8zcxRJRDDAO2ukDZXEmI
 ZvLR3Ur4tCTjoS/hW8DOVaH5yTPvJO6uMifpzmNPxPVgICZ3cWSfOIPlGv1jkH9PqU
 bMru0xzfY/JHA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7070217E12E4;
 Tue, 27 Jan 2026 16:56:52 +0100 (CET)
Date: Tue, 27 Jan 2026 16:56:48 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: loic.molinari@collabora.com, willy@infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, frank.binns@imgtec.com, matt.coster@imgtec.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/3] drm/gem-shmem: Track folio accessed/dirty status in
 vmap
Message-ID: <20260127165648.4fc27c4b@fedora>
In-Reply-To: <20260127132938.429288-4-tzimmermann@suse.de>
References: <20260127132938.429288-1-tzimmermann@suse.de>
 <20260127132938.429288-4-tzimmermann@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:tzimmermann@suse.de,m:loic.molinari@collabora.com,m:willy@infradead.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:frank.binns@imgtec.com,m:matt.coster@imgtec.com,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,infradead.org,linux.intel.com,kernel.org,gmail.com,ffwll.ch,imgtec.com,lists.freedesktop.org,kvack.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 22355973A9
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 14:16:38 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> On successful vmap, set the page_mark_accessed_on_put and _dirty_on_put
> flags in the gem-shmem object. Signals that the contained pages require
> LRU and dirty tracking when they are being released back to SHMEM. Clear
> these flags on put, so that buffer remains quiet until the next call to
> vmap. There's no means of handling dirty status in vmap as there's no
> write-only mapping available.
> 
> Both flags, _accessed_on_put and _dirty_on_put, have always been part of
> the gem-shmem object, but never used much. So most drivers did not track
> the page status correctly.
> 
> Only the v3d and imagination drivers make limited use of _dirty_on_put. In
> the case of imagination, move the flag setting from init to cleanup. This
> ensures writeback of modified pages but does not interfere with the
> internal vmap/vunmap calls. V3d already implements this behaviour.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

The gem-shmem changes are

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++++
>  drivers/gpu/drm/imagination/pvr_gem.c  | 6 ++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 30cd34d3a111..8c07a8f81322 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -265,6 +265,8 @@ void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
>  				  shmem->pages_mark_dirty_on_put,
>  				  shmem->pages_mark_accessed_on_put);
>  		shmem->pages = NULL;
> +		shmem->pages_mark_accessed_on_put = false;
> +		shmem->pages_mark_dirty_on_put = false;
>  	}
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_shmem_put_pages_locked);
> @@ -397,6 +399,8 @@ int drm_gem_shmem_vmap_locked(struct drm_gem_shmem_object *shmem,
>  		} else {
>  			iosys_map_set_vaddr(map, shmem->vaddr);
>  			refcount_set(&shmem->vmap_use_count, 1);
> +			shmem->pages_mark_accessed_on_put = true;
> +			shmem->pages_mark_dirty_on_put = true;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
> index c07c9a915190..307b02c916d4 100644
> --- a/drivers/gpu/drm/imagination/pvr_gem.c
> +++ b/drivers/gpu/drm/imagination/pvr_gem.c
> @@ -25,7 +25,10 @@
>  
>  static void pvr_gem_object_free(struct drm_gem_object *obj)
>  {
> -	drm_gem_shmem_object_free(obj);
> +	struct drm_gem_shmem_object *shmem_obj = to_drm_gem_shmem_obj(obj);
> +
> +	shmem_obj->pages_mark_dirty_on_put = true;
> +	drm_gem_shmem_free(shmem_obj);
>  }
>  
>  static struct dma_buf *pvr_gem_export(struct drm_gem_object *obj, int flags)
> @@ -363,7 +366,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
>  	if (IS_ERR(shmem_obj))
>  		return ERR_CAST(shmem_obj);
>  
> -	shmem_obj->pages_mark_dirty_on_put = true;
>  	shmem_obj->map_wc = !(flags & PVR_BO_CPU_CACHED);
>  	pvr_obj = shmem_gem_to_pvr_gem(shmem_obj);
>  	pvr_obj->flags = flags;

