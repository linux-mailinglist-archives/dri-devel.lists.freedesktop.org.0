Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5753BA29E
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 17:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955FF6E09E;
	Fri,  2 Jul 2021 15:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87676E09E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 15:13:27 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c04:8c00::912b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ED3E91F44F44;
 Fri,  2 Jul 2021 16:13:22 +0100 (BST)
Date: Fri, 2 Jul 2021 11:13:16 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <YN8tDD6tRF85cR4z@maud>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702143225.3347980-6-boris.brezillon@collabora.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

```
> +/* Syncobj reference passed at job submission time to encode explicit
> + * input/output fences.
> + */
> +struct drm_panfrost_syncobj_ref {
> +	__u32 handle;
> +	__u32 pad;
> +	__u64 point;
> +};
```

What is handle? What is point? Why is there padding instead of putting
point first?

```
>  #define PANFROST_BO_REF_EXCLUSIVE	0x1
> +#define PANFROST_BO_REF_NO_IMPLICIT_DEP	0x2
```

This seems logically backwards. NO_IMPLICIT_DEP makes sense if we're
trying to keep backwards compatibility, but here you're crafting a new
interface totally from scratch. If anything, isn't BO_REF_IMPLICIT_DEP
the flag you'd want?

```
> +	/**
> +	 * Stride of the jobs array (needed to ease extension of the
> +	 * BATCH_SUBMIT ioctl). Should be set to
> +	 * sizeof(struct drm_panfrost_job).
> +	 */
> +	__u32 job_stride;
...
> +	/**
> +	 * Stride of the BO and syncobj reference arrays (needed to ease
> +	 * extension of the BATCH_SUBMIT ioctl). Should be set to
> +	 * sizeof(struct drm_panfrost_bo_ref).
> +	 */
> +	__u32 bo_ref_stride;
> +	__u32 syncobj_ref_stride;
```

Hmm. I'm not /opposed/ and I know kbase uses strides but it seems like
somewhat unwarranted complexity, and there is a combinatoric explosion
here (if jobs, bo refs, and syncobj refs use 3 different versions, as
this encoding permits... as opposed to just specifying a UABI version or
something like that)

```
> +	/**
> +	 * If the submission fails, this encodes the index of the job
> +	 * failed.
> +	 */
> +	__u32 fail_idx;
```

What if multiple jobs fail?

```
> +	/**
> +	 * ID of the queue to submit those jobs to. 0 is the default
> +	 * submit queue and should always exists. If you need a dedicated
> +	 * queue, create it with DRM_IOCTL_PANFROST_CREATE_SUBMITQUEUE.
> +	 */
> +	__u32 queue;
```

s/exists/exist/
