Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC64066353F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 00:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBBD10E096;
	Mon,  9 Jan 2023 23:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0762A10E096
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 23:28:49 +0000 (UTC)
Received: from [192.168.2.154] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BEE746602D68;
 Mon,  9 Jan 2023 23:28:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673306928;
 bh=bw1hYe8Xc6/o43q1d4oFrzR72ui9P2UWVKyDLL+iuMM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NzWsjApffRkLRnZprpeIs5QfddIl4P1biqIapM5DhZgQJkuE2qGgflKHWsp0yBcn1
 1kywVhNkjT9t4PXlW9fw9pTLNGzYT1QUhlBB+Tl7PXCdgL4uXjmLCus8IhZgcRQnrA
 te34I4JVLVinz9NQyc0gGpduCXQn9C7m5jpdVBqBjT3PbyniWl7UvPfce+F9SSeEIA
 ueyjjIguXgOmtWiq/FQdiU1RTKS8bzPiYEiLWldCpjF6ClbI8L2XqwiTl9QasmzZeH
 1vll2NrOznZg/KRupuB7y7r+ElLaPLnlVUJkQzF80vlGNcFwCVknbedF/qj7SnhI70
 s5NP5ZOPSpHlQ==
Message-ID: <3ae74f28-580b-3b53-3d7b-e8bde97dabe3@collabora.com>
Date: Tue, 10 Jan 2023 02:28:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/virtio: Fix GEM handle creation UAF
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20221216233355.542197-1-robdclark@gmail.com>
 <20221216233355.542197-2-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20221216233355.542197-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/22 02:33, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Userspace can guess the handle value and try to race GEM object creation
> with handle close, resulting in a use-after-free if we dereference the
> object after dropping the handle's reference.  For that reason, dropping
> the handle's reference must be done *after* we are done dereferencing
> the object.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

Added fixes/stable tags and applied this virtio-gpu patch to misc-fixes.
The Panfrost patch is untouched.

-- 
Best regards,
Dmitry

