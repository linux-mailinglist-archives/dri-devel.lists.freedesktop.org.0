Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B793F74AF47
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 13:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4188B10E55B;
	Fri,  7 Jul 2023 11:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0013B10E55B;
 Fri,  7 Jul 2023 11:00:17 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E12D96606FCD;
 Fri,  7 Jul 2023 12:00:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688727614;
 bh=loLGVRQqyArFuNBoSNIhMt6M/KC703SMKl35YJuaCrw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BSRQYXK9Sa3nNwKV4rG0/26Z/hJlhwYBkBDf6C+G2yFkYL25cMFO6WEMv+ks4S13W
 KxviaaSG8QoCtljRNYygCPaisghYahAVHCA8NuTGMWNk9gxoH2GWL6ivC+i44BMjez
 iX1a5g/H8Rh3OqcRMDNzrC2XPIhsvuTDhmjhD3fny8TbKyG4TmZiwA/72h179h66y4
 dtgc3tqCHOJEuD0ebZ/HNT234/vo8p2wCNZDwj/UTCl0USSkmLTUFeK44mk+J1ogIt
 dZq20bRuqgHT78/tWinzHW276jjSpZCmpEFN9Od+q2c6+727fCX36J2vMXWt/xv0N/
 DN6kts+12TpuQ==
Date: Fri, 7 Jul 2023 13:00:10 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next v6 02/13] drm: manager to keep track of GPUs VA
 mappings
Message-ID: <20230707130010.1bd5d41b@collabora.com>
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

> +/**
> + * drm_gpuva_for_each_va_range - iternator to walk over a range of &drm_gpuvas
> + * @va__: &drm_gpuva structure to assign to in each iteration step
> + * @mgr__: &drm_gpuva_manager to walk over
> + * @start__: starting offset, the first gpuva will overlap this
> + * @end__: ending offset, the last gpuva will start before this (but may
> + * overlap)
> + *
> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
> + * between @start__ and @end__. It is implemented similarly to list_for_each(),
> + * but is using the &drm_gpuva_manager's internal interval tree to accelerate
> + * the search for the starting &drm_gpuva, and hence isn't safe against removal
> + * of elements. It assumes that @end__ is within (or is the upper limit of) the
> + * &drm_gpuva_manager. This iterator does not skip over the &drm_gpuva_manager's
> + * @kernel_alloc_node.
> + */
> +#define drm_gpuva_for_each_va_range(va__, mgr__, start__, end__) \
> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)); \

drm_gpuva_find_first() takes the range size as its last argument, not
the range end:

	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \


> +	     va__ && (va__->va.addr < (end__)) && \
> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
> +	     va__ = list_next_entry(va__, rb.entry))

If you define:

static inline struct drm_gpuva *
drm_gpuva_next(struct drm_gpuva *va)
{
	if (va && !list_is_last(&va->rb.entry, &va->mgr->rb.list))
		return list_next_entry(va, rb.entry);

	return NULL;
}

the for loop becomes a bit more readable:

	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)); \
	     va__ && (va__->va.addr < (end__)); \
	     va__ = drm_gpuva_next(va__))

> +
> +/**
> + * drm_gpuva_for_each_va_range_safe - iternator to safely walk over a range of
> + * &drm_gpuvas
> + * @va__: &drm_gpuva to assign to in each iteration step
> + * @next__: another &drm_gpuva to use as temporary storage
> + * @mgr__: &drm_gpuva_manager to walk over
> + * @start__: starting offset, the first gpuva will overlap this
> + * @end__: ending offset, the last gpuva will start before this (but may
> + * overlap)
> + *
> + * This iterator walks over all &drm_gpuvas in the &drm_gpuva_manager that lie
> + * between @start__ and @end__. It is implemented similarly to
> + * list_for_each_safe(), but is using the &drm_gpuva_manager's internal interval
> + * tree to accelerate the search for the starting &drm_gpuva, and hence is safe
> + * against removal of elements. It assumes that @end__ is within (or is the
> + * upper limit of) the &drm_gpuva_manager. This iterator does not skip over the
> + * &drm_gpuva_manager's @kernel_alloc_node.
> + */
> +#define drm_gpuva_for_each_va_range_safe(va__, next__, mgr__, start__, end__) \
> +	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__)), \
> +	     next__ = va ? list_next_entry(va__, rb.entry) : NULL; \
> +	     va__ && (va__->va.addr < (end__)) && \
> +	     !list_entry_is_head(va__, &(mgr__)->rb.list, rb.entry); \
> +	     va__ = next__, next__ = list_next_entry(va__, rb.entry))

And this is the safe version using the drm_gpuva_next() helper:

	for (va__ = drm_gpuva_find_first((mgr__), (start__), (end__) - (start__)), \
	     next__ = drm_gpuva_next(va__); \
	     va__ && (va__->va.addr < (end__)); \
	     va__ = next__, next__ = drm_gpuva_next(va__))

Those changes fixed an invalid pointer access I had in the sm_unmap()
path.
