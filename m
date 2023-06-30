Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A746A743665
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 10:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6321510E10D;
	Fri, 30 Jun 2023 08:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42610E10D;
 Fri, 30 Jun 2023 08:02:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EA0A66606FDE;
 Fri, 30 Jun 2023 09:02:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688112175;
 bh=AZ8TNuVM1gieOIi8tQeOA/DmOnzpPZU4mn9mx4MyD4Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oDlrCeuTgLPl2QzJpS1vsno/RMHtI/H/HL1oScNeYUexrIbQm8ibBk8hwib4S7p7O
 //xJ1qfGJ6x8hRs9SawXTDJ+8QmISHpyUGxYpLXJOPIteRcM5AYBcnuiZDuY+sCkzb
 V9M15Lurltg9sEVYGaodChSzoFoKxO7Fr5eC6nK15snuNppKxwAxgprehJVA6pTZ/c
 IilIoHqUZU5/rvSAQt3NWZwNobOTxLik9Ht7cqOfd13bFIjzY0GW6kQgxXZAN8tNmd
 zFaX8bwAUoWJ/LZcBBWeHbWG+8IjHuriFjqN8pugoot4ntvBgodJuw2DvJzXhDIZ/k
 rXBQr+yfL9h7A==
Date: Fri, 30 Jun 2023 10:02:52 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230630100252.7ff6421d@collabora.com>
In-Reply-To: <20230629222651.3196-3-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
 <20230629222651.3196-3-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, willy@infradead.org,
 dri-devel@lists.freedesktop.org, corbet@lwn.net, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, Dave Airlie <airlied@redhat.com>,
 bagasdotme@gmail.com, christian.koenig@amd.com, jason@jlekstrand.net,
 Donald Robson <donald.robson@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

On Fri, 30 Jun 2023 00:25:18 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> + *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
> + *	{
> + *		struct driver_context *ctx = __ctx;
> + *
> + *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
> + *
> + *		drm_gpuva_unlink(op->remap.unmap->va);
> + *		kfree(op->remap.unmap->va);
> + *
> + *		if (op->remap.prev) {
> + *			drm_gpuva_link(ctx->prev_va);

I ended up switching to dma_resv-based locking for the GEMs and I
wonder what the locking is supposed to look like in the async-mapping
case, where we insert/remove the VA nodes in the drm_sched::run_job()
path.

What I have right now is something like:

	dma_resv_lock(vm->resv);

	// split done in drm_gpuva_sm_map(), each iteration
	// of the loop is a call to the driver ->[re,un]map()
	// hook
	for_each_sub_op() {
		
		// Private BOs have their resv field pointing to the
		// VM resv and we take the VM resv lock before calling
		// drm_gpuva_sm_map()
		if (vm->resv != gem->resv)
			dma_resv_lock(gem->resv);

		drm_gpuva_[un]link(va);
		gem_[un]pin(gem);

		if (vm->resv != gem->resv)
			dma_resv_unlock(gem->resv);
	}

	dma_resv_unlock(vm->resv);

In practice, I don't expect things to deadlock, because the VM resv is
not supposed to be taken outside the VM context and the locking order
is always the same (VM lock first, and then each shared BO
taken/released independently), but I'm not super thrilled by this
nested lock, and I'm wondering if we shouldn't have a pass collecting
locks in a drm_exec context first, and then have
the operations executed. IOW, something like that:

	drm_exec_init(exec, DRM_EXEC_IGNORE_DUPLICATES)
	drm_exec_until_all_locked(exec) {
		// Dummy GEM is the dummy GEM object I use to make the VM
		// participate in the locking without having to teach
		// drm_exec how to deal with raw dma_resv objects.
		ret = drm_exec_lock_obj(exec, vm->dummy_gem);
		drm_exec_retry_on_contention(exec);
		if (ret)
			return ret;

		// Could take the form of drm_gpuva_sm_[un]map_acquire_locks()
		// helpers
		for_each_sub_op() {
			ret = drm_exec_lock_obj(exec, gem);
			if (ret)
				return ret;
		}
	}

	// each iteration of the loop is a call to the driver
	// ->[re,un]map() hook
	for_each_sub_op() {
		...
		gem_[un]pin_locked(gem);
		drm_gpuva_[un]link(va);
		...
	}

	drm_exec_fini(exec);

Don't know if I got this right, or if I'm just confused again by how
the drm_gpuva API is supposed to be used.

Regards,

Boris

> + *			ctx->prev_va = NULL;
> + *		}
> + *
> + *		if (op->remap.next) {
> + *			drm_gpuva_link(ctx->next_va);
> + *			ctx->next_va = NULL;
> + *		}
> + *
> + *		return 0;
> + *	}
