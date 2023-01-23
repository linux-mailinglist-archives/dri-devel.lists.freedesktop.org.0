Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89C677D20
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 14:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433F710E49A;
	Mon, 23 Jan 2023 13:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24B510E498
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 13:55:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C5472B3;
 Mon, 23 Jan 2023 14:55:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674482147;
 bh=6OMfBS4zGHxl1yc7Z1SfyOLfxUIVyVOKAzsjZUlbwBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFHru+S3ErLB/7W0Tpb/SZiqW9yw68qfr6PBEiiaSQXAgKr0x/qXMpAiFBDag+pTa
 1+E1k4SkfIv3bi4zgVrIiujdlyvWcwGTwGSyuhGD3mEjcO99PXUWJmLtlJcMQNA3iB
 sL1nG+YZm4EgklN4+7UbL6rIb5mYlIb8WvQ6AFtk=
Date: Mon, 23 Jan 2023 15:55:42 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: DMA-heap driver hints
Message-ID: <Y86R3vQX+vW0+oxw@pendragon.ideasonboard.com>
References: <20230123123756.401692-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230123123756.401692-1-christian.koenig@amd.com>
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
Cc: James Jones <jajones@nvidia.com>, linaro-mm-sig@lists.linaro.org,
 sebastian.wick@redhat.com, labbott@redhat.com, benjamin.gaignard@collabora.com,
 linux-media@vger.kernel.org, mchehab@kernel.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca, hverkuil@xs4all.nl,
 jstultz@google.com, lmark@codeaurora.org, tfiga@chromium.org,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

CC'ing James as I think this is related to his work on the unix device
memory allocator ([1]).

[1] https://lore.kernel.org/dri-devel/8b555674-1c5b-c791-4547-2ea7c16aee6c@nvidia.com/

On Mon, Jan 23, 2023 at 01:37:54PM +0100, Christian König wrote:
> Hi guys,
> 
> this is just an RFC! The last time we discussed the DMA-buf coherency
> problem [1] we concluded that DMA-heap first needs a better way to
> communicate to userspace which heap to use for a certain device.
> 
> As far as I know userspace currently just hard codes that information
> which is certainly not desirable considering that we should have this
> inside the kernel as well.
> 
> So what those two patches here do is to first add some
> dma_heap_create_device_link() and  dma_heap_remove_device_link()
> function and then demonstrating the functionality with uvcvideo
> driver.
> 
> The preferred DMA-heap is represented with a symlink in sysfs between
> the device and the virtual DMA-heap device node.

I'll start with a few high-level comments/questions:

- Instead of tying drivers to heaps, have you considered a system where
  a driver would expose constraints, and a heap would then be selected
  based on those constraints ? A tight coupling between heaps and
  drivers means downstream patches to drivers in order to use
  vendor-specific heaps, that sounds painful.

  A constraint-based system would also, I think, be easier to extend
  with additional constraints in the future.

- I assume some drivers will be able to support multiple heaps. How do
  you envision this being implemented ?

- Devices could have different constraints based on particular
  configurations. For instance, a device may require specific memory
  layout for multi-planar YUV formats only (as in allocating the Y and C
  planes of NV12 from different memory banks). A dynamic API may thus be
  needed (but may also be very painful to use from userspace).

> What's still missing is certainly matching userspace for this since I
> wanted to discuss the initial kernel approach first.

https://git.libcamera.org/libcamera/libcamera.git/ would be a good place
to prototype userspace support :-)

> Please take a look and comment.
> 
> Thanks,
> Christian.
> 
> [1] https://lore.kernel.org/all/11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com/T/

-- 
Regards,

Laurent Pinchart
