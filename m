Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 834D16D09A4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:32:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A6810EED0;
	Thu, 30 Mar 2023 15:32:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B729310EED8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:32:15 +0000 (UTC)
Received: from arch-x395 (unknown [IPv6:2a00:5f00:102:0:38b0:2479:c2d8:9a86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: evelikov)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 22E266603182;
 Thu, 30 Mar 2023 16:32:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680190334;
 bh=p9xh2PGZwQUEhazq04vRmfAksY+FnI7rW348g3zN2ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WpafA6xLX8wNLW7t10cXCU1KfzEIcmMuics5cKSh6JH1h8wYUfEMvgoQSQWRLjia0
 eJaYZp59H06LB7g0RxRhK9epvk4tdPdGOh3ih+QXtb9sGa292ImluHraX4ZPkhuS//
 +1cWUhK+nR8TPSUh5JEadRtr4gmbvhW1jDbe1CRyLWgw4YwDQlkvyT4eREvPdustP7
 dD36PeBBkprVDuKPz1H6BZJAbt2TYmXQWbivzUQXDK9b4wegLMufO4Q2qusE2njfnm
 7+y2EyywSKbtgMqdeVDxQcBy9A3eRdZtTpB+/xyGeDrDMSISYjI2puTaDx6Pwg7QS6
 oK6O/t0Nm6A6A==
Date: Thu, 30 Mar 2023 16:32:11 +0100
From: Emil Velikov <emil.velikov@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 1/2] drm/virtio: Refactor job submission code path
Message-ID: <ZCWre6oy0vHNyIkW@arch-x395>
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
 <20230323230755.1094832-2-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323230755.1094832-2-dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dmitry,

On 2023/03/24, Dmitry Osipenko wrote:
> Move virtio_gpu_execbuffer_ioctl() into separate virtgpu_submit.c file
> and refactor the code along the way to ease addition of new features to
> the ioctl.
> 

At a glance, we have a handful of no-op as well as some functional
changes - let's split those up in separate patches.

> Reviewed-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---


> +static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
> +				     struct dma_fence *fence)
> +{
> +	struct dma_fence_unwrap itr;
> +	struct dma_fence *f;
> +	int err;
> +
> +	dma_fence_unwrap_for_each(f, &itr, fence) {

The dma_fence_unwrap_for_each() change should be a separate patch,
highlighting why we want it.

> +		err = virtio_gpu_do_fence_wait(submit, f);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +


> +	ret = virtio_gpu_init_submit(&submit, exbuf, dev, file,
> +				     fence_ctx, ring_idx);
> +	if (ret)
> +		goto cleanup;
> +
> +	ret = virtio_gpu_wait_in_fence(&submit);
> +	if (ret)
> +		goto cleanup;
> +

We have reshuffled the order around in_fence waiting, out_fence install,
handles, cmdbuf, drm events, etc. Can we get that split up a bit, with
some comments.

If it were me, I would keep the wait_in_fence early and inline
virtio_gpu_init_submit (the nesting/abstraction seems a bit much). This
means one can omit the virtio_gpu_submit::exbuf all together.


HTH
Emil
