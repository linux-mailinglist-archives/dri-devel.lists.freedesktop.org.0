Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E236D4D20
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7AB10E509;
	Mon,  3 Apr 2023 16:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7304410E509
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 16:05:21 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 3D0407DB;
 Mon,  3 Apr 2023 16:05:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3D0407DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1680537920; bh=XfDtjdL03UON+Z3Zz6rkWcdyGXWekaxVNb7/+FX5L8U=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sVrUAqyYPK7wSsQ8IJs1cDsAqIQ/9M607jLg0H46pR87YlOzoTwtrvkB5Ca9++4eV
 rVRylq4QWLWdF+KrHhSq6nK3BOogOa7QkuajwHrpYdID0IN0ATCQeTnHBKW0dNL/ua
 Z4ughGpDPqsftpwEvFcM/7JwtMRuh3ghV4Nb420mH8KwQO09ssHZB86HkrJblm2U1L
 mz9CGfPXhE5r8LjPc3zqHXmLKYagH/mxqcAFkf723WAb6gwyTaLktx4tB5apj6BR+T
 K+6Ra6vhXGLyk+MErb7swJ4Lq6p0uzTbi8MLv8XfBleCma21sb2mq8Au/ieY2dCj+3
 uqlbQ3tHjxg4A==
From: Jonathan Corbet <corbet@lwn.net>
To: Paul Cercueil <paul@crapouillou.net>, Jonathan Cameron
 <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul
 <vkoul@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, Nuno
 =?utf-8?Q?S=C3=A1?= <noname.nuno@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 11/11] Documentation: iio: Document high-speed DMABUF
 based API
In-Reply-To: <20230403154955.216148-2-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154955.216148-1-paul@crapouillou.net>
 <20230403154955.216148-2-paul@crapouillou.net>
Date: Mon, 03 Apr 2023 10:05:19 -0600
Message-ID: <87zg7p7xz4.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Paul Cercueil <paul@crapouillou.net> writes:

One nit:

> Document the new DMABUF based API.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
>
> ---
> v2: - Explicitly state that the new interface is optional and is
>       not implemented by all drivers.
>     - The IOCTLs can now only be called on the buffer FD returned by
>       IIO_BUFFER_GET_FD_IOCTL.
>     - Move the page up a bit in the index since it is core stuff and not
>       driver-specific.
> v3: Update the documentation to reflect the new API.
> ---
>  Documentation/iio/dmabuf_api.rst | 59 ++++++++++++++++++++++++++++++++
>  Documentation/iio/index.rst      |  2 ++
>  2 files changed, 61 insertions(+)
>  create mode 100644 Documentation/iio/dmabuf_api.rst
>
> diff --git a/Documentation/iio/dmabuf_api.rst b/Documentation/iio/dmabuf_api.rst
> new file mode 100644
> index 000000000000..4d70372c7ebd
> --- /dev/null
> +++ b/Documentation/iio/dmabuf_api.rst
> @@ -0,0 +1,59 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===================================
> +High-speed DMABUF interface for IIO
> +===================================
> +
> +1. Overview
> +===========
> +
> +The Industrial I/O subsystem supports access to buffers through a
> +file-based interface, with read() and write() access calls through the
> +IIO device's dev node.
> +
> +It additionally supports a DMABUF based interface, where the userspace
> +can attach DMABUF objects (externally created) to a IIO buffer, and
> +subsequently use them for data transfers.
> +
> +A userspace application can then use this interface to share DMABUF
> +objects between several interfaces, allowing it to transfer data in a
> +zero-copy fashion, for instance between IIO and the USB stack.
> +
> +The userspace application can also memory-map the DMABUF objects, and
> +access the sample data directly. The advantage of doing this vs. the
> +read() interface is that it avoids an extra copy of the data between the
> +kernel and userspace. This is particularly useful for high-speed devices
> +which produce several megabytes or even gigabytes of data per second.
> +It does however increase the userspace-kernelspace synchronization
> +overhead, as the DMA_BUF_SYNC_START and DMA_BUF_SYNC_END IOCTLs have to
> +be used for data integrity.
> +
> +2. User API
> +===========
> +
> +As part of this interface, three new IOCTLs have been added. These three
> +IOCTLs have to be performed on the IIO buffer's file descriptor,
> +obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> +
> +``IIO_BUFFER_DMABUF_ATTACH_IOCTL(int)``
> +----------------------------------------------------------------
> +
> +Attach the DMABUF object, identified by its file descriptor, to the IIO
> +buffer. Returns zero on success, and a negative errno value on error.

Rather than abusing subsections, this would be better done as a
description list:

  IIO_BUFFER_DMABUF_ATTACH_IOCTL(int)
      Attach the DMABUF object, identified by its file descriptor, to
      the IIO buffer. Returns zero on success, and a negative errno
      value on error.

Thanks,

jon
