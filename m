Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA244F3C7
	for <lists+dri-devel@lfdr.de>; Sat, 13 Nov 2021 15:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A954D6FAA2;
	Sat, 13 Nov 2021 14:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3406FA75
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Nov 2021 14:51:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D720B60F55;
 Sat, 13 Nov 2021 14:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636815111;
 bh=jGmB9l12slqlYECZsKytyWyiLK/2uH6ek7dFjEWaY9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RpdF23io7YzBaTvc+iWU2wbo9cdR8LikD4vYTTckkLuzfagJfNDdNbVEALjOK4K/D
 T4PAIVoDTSeZ388GpoA7cIEBZGvlRKOqpAi1eEAuT4kL/7K+lyKMEexPNZqUzZKJDU
 jS3NpIunGH8zjxJ/gcLs52OG5f5X9ioSdRSggV5I=
Date: Sat, 13 Nov 2021 15:51:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH v3 11/12] drm/virtio: implement context init: add
 virtio_gpu_fence_event
Message-ID: <YY/RBOdU6+SgbRrq@kroah.com>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
 <20210921232024.817-12-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210921232024.817-12-gurchetansingh@chromium.org>
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
Cc: virtio-dev@lists.oasis-open.org, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 21, 2021 at 04:20:23PM -0700, Gurchetan Singh wrote:
> Similar to DRM_VMW_EVENT_FENCE_SIGNALED.  Sends a pollable event
> to the DRM file descriptor when a fence on a specific ring is
> signaled.
> 
> One difference is the event is not exposed via the UAPI -- this is
> because host responses are on a shared memory buffer of type
> BLOB_MEM_GUEST [this is the common way to receive responses with
> virtgpu].  As such, there is no context specific read(..)
> implementation either -- just a poll(..) implementation.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> Acked-by: Nicholas Verne <nverne@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c   | 43 +++++++++++++++++++++++++-
>  drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++++
>  drivers/gpu/drm/virtio/virtgpu_fence.c | 10 ++++++
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++
>  4 files changed, 93 insertions(+), 1 deletion(-)

This commit seems to cause a crash in a virtual drm gpu driver for
Android.  I have reverted this, and the next commit in the series from
Linus's tree and all is good again.

Any ideas?

thanks,

greg k-h
