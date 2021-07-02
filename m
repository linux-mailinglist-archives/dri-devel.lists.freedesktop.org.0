Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DEB3BA2CE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 17:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070096E0D7;
	Fri,  2 Jul 2021 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689896E13C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 15:34:13 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c04:8c00::912b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B6ED1F44F53;
 Fri,  2 Jul 2021 16:34:08 +0100 (BST)
Date: Fri, 2 Jul 2021 11:34:01 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v3 5/7] drm/panfrost: Add a new ioctl to submit batches
Message-ID: <YN8x6ZaBdI5Cahuv@maud>
References: <20210702143225.3347980-1-boris.brezillon@collabora.com>
 <20210702143225.3347980-6-boris.brezillon@collabora.com>
 <e8f60552-5e7a-199e-7642-cdadf8c9a1a1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8f60552-5e7a-199e-7642-cdadf8c9a1a1@arm.com>
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
 Rob Herring <robh+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Better, but I was hoping we can mostly delete panfrost_ioctl_submit(),
> leaving something along the lines of:
> 
> static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> 		struct drm_file *file)
> {
> 	struct panfrost_submitqueue *queue;
> 	struct drm_panfrost_submit *args = data;
> 	struct drm_panfrost_job submit_args = {
> 		.head = args->jc,
> 		.bos = args->bo_handles,
> 		.in_syncs = args->in_syncs,
> 		.out_syncs = &args->out_sync, // FIXME
> 		.in_sync_count = args->in_sync_count,
> 		.out_sync_count = args->out_sync > 0 ? 1 : 0,
> 		.bo_count = args->bo_handle_count,
> 		.requirements = args->requirements
> 	};
> 	int ret;
> 
> 	queue = panfrost_submitqueue_get(file->driver_priv, 0);
> 
> 	ret = panfrost_submit_job(dev, file, queue, &submit_args,
> 				  sizeof(u32), ...);
> 
> 	return ret;
> }
> 
> But obviously the out_sync part needs special handling as we can't just
> pass a kernel pointer in like that ;)

This, a dozen times this.
