Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586274A3BB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 20:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B93610E08B;
	Thu,  6 Jul 2023 18:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD40110E08B;
 Thu,  6 Jul 2023 18:26:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B59DC6606FD3;
 Thu,  6 Jul 2023 19:26:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688668006;
 bh=UHG+XPRdoANiLLft5ASgcfyQgCpm/H7FwKZnn28txqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d4T/gG0MYfdGPgNKM5K8IQDQx74OzhJhWKaDZXejR3+LT2VTyuuEfy6smeIDxdaGO
 m6FrOeH+uPsXXkSlT6cpMeU12M14If4nOeKrDIGUFYMJCSYeqxnv0p2onOinYuKaFR
 10MHXerXhhUgQrjx30ZdecazE8N+Tqn7gbkUsEELf0xA8dkcLDWSlxTvpyZtLV1cwA
 UsqMGydu60eM4yq6ellXgU7rejxMkfDGf5TsTxExhOaQmWfMAKGNoPQEohPfWEUQG+
 IUvRT7R8YP5FQMRqU06ckEUsfjStXc/l2GumaBiVJqMT1y84wMQwghZn2TuXVkoQ0F
 50OGO31r/i18Q==
Date: Thu, 6 Jul 2023 20:26:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230706202642.4cbc7227@collabora.com>
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

On Fri, 30 Jun 2023 00:25:18 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> +#ifdef CONFIG_LOCKDEP
> +typedef struct lockdep_map *lockdep_map_p;
> +#define drm_gpuva_manager_ext_assert_held(mgr)		\
> +	lockdep_assert(lock_is_held((mgr)->ext_lock) != LOCK_STATE_NOT_HELD)
> +/**
> + * drm_gpuva_manager_set_ext_lock - set the external lock according to
> + * @DRM_GPUVA_MANAGER_LOCK_EXTERN
> + * @mgr: the &drm_gpuva_manager to set the lock for
> + * @lock: the lock to set
> + *
> + * If @DRM_GPUVA_MANAGER_LOCK_EXTERN is set, drivers need to call this function
> + * to provide the lock used to lock linking and unlinking of &drm_gpuvas to the
> + * &drm_gem_objects GPUVA list.
> + */
> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	\
> +	(mgr)->ext_lock = &(lock)->dep_map

Okay, so, IIUC, this is the lock protecting the GEM's active mappings
list, meaning the lock is likely to be attached to the GEM object. Are
we expected to call drm_gpuva_manager_set_ext_lock() every time we call
drm_gpuva_[un]link(), or are we supposed to have some lock at the
device level serializing all drm_gpuva_[un]link() calls across VMs? The
later doesn't sound like a good option to me, and the former feels a bit
weird. I'm wondering if we shouldn't just drop this assert_held() check
when DRM_GPUVA_MANAGER_LOCK_EXTERN is set. Alternatively, we could say
that any driver wanting to use a custom lock (which is basically all
drivers modifying the VA space asynchronously in the ::run_job() path)
has to provide its own variant of drm_gpuva_[un]link() (maybe with its
own VA list too), which doesn't sound like a good idea either.

> +#else
> +typedef struct { /* nothing */ } lockdep_map_p;
> +#define drm_gpuva_manager_ext_assert_held(mgr)		do { (void)(mgr); } while (0)
> +#define drm_gpuva_manager_set_ext_lock(mgr, lock)	do { } while (0)
> +#endif
