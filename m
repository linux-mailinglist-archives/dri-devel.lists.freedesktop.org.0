Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E318CC112
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 14:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D914E10EE9F;
	Wed, 22 May 2024 12:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SvO8HaY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F38A10F504
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 12:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716380430;
 bh=njOAfBjXLvEbmliBJBN4l58lcKJ7aM5s+Q0su+46D5M=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=SvO8HaY9Uk9liy6/Ru4/iRCvBZoyS0Ktnz6u2SNBPDn1ncbkxSnjpPS6Y4SUeBMlE
 FN1QXYN6eZRYOw9mQslo9XDUFA1IiJ6HNP7XRpwT3XcYZizfldWDqYFwfkR3l8utU+
 cvmimjy2aNiFxudH/aR4R/9a4xtvfePzHgCrtzMCPZpAZNzzJXB3BmNVXaddsDpOrV
 8kebVRw6JnApGLj7BEdvloAemKT+VjWleZ7/RavVMWuufj7XQHv+25pG++oTWt5V4h
 qw/a7znCtlkhjdVYzfk+/JkGf8OnWpPdwlyY7k/G9wr7zRHqEHBsdVZ4QDlFckwvq/
 0fknKXJZKsBoQ==
Received: from [100.95.196.182] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: andrzej.p)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id D8D9D37821A0;
 Wed, 22 May 2024 12:20:28 +0000 (UTC)
Message-ID: <643d9d0e-a2ff-43ee-933b-55dd191407ae@collabora.com>
Date: Wed, 22 May 2024 14:20:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6,02/24] v4l2: handle restricted memory flags in queue
 setup
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Brian Starkey
 <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-3-yunfei.dong@mediatek.com>
Content-Language: en-US
In-Reply-To: <20240516122102.16379-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei & Jeffrey,

W dniu 16.05.2024 o 14:20, Yunfei Dong pisze:
> From: Jeffrey Kardatzke <jkardatzke@google.com>
> 
> Validates the restricted memory flags when setting up a queue and
> ensures the queue has the proper capability.
> 
> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../media/common/videobuf2/videobuf2-core.c   | 21 +++++++++++++++++++
>   .../media/common/videobuf2/videobuf2-v4l2.c   |  4 +++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
> index 358f1fe42975..fe4c0594ab81 100644
> --- a/drivers/media/common/videobuf2/videobuf2-core.c
> +++ b/drivers/media/common/videobuf2/videobuf2-core.c
> @@ -831,6 +831,15 @@ static bool verify_coherency_flags(struct vb2_queue *q, bool non_coherent_mem)
>   	return true;
>   }
>   
> +static bool verify_restricted_mem_flags(struct vb2_queue *q, bool restricted_mem)
> +{
> +	if (restricted_mem != q->restricted_mem) {
> +		dprintk(q, 1, "restricted memory model mismatch\n");
> +		return false;
> +	}
> +	return true;
> +}
> +
>   static int vb2_core_allocated_buffers_storage(struct vb2_queue *q)
>   {
>   	if (!q->bufs)
> @@ -864,6 +873,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   	unsigned int q_num_bufs = vb2_get_num_buffers(q);
>   	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>   	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
> +	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
>   	unsigned int i, first_index;
>   	int ret = 0;
>   
> @@ -907,6 +917,9 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   			return 0;
>   	}
>   
> +	if (restricted_mem && (!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF))
> +		return -EINVAL;
> +
>   	/*
>   	 * Make sure the requested values and current defaults are sane.
>   	 */
> @@ -924,6 +937,7 @@ int vb2_core_reqbufs(struct vb2_queue *q, enum vb2_memory memory,
>   	if (ret)
>   		return ret;
>   	set_queue_coherency(q, non_coherent_mem);
> +	q->restricted_mem = restricted_mem;
>   
>   	/*
>   	 * Ask the driver how many buffers and planes per buffer it requires.
> @@ -1032,6 +1046,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   	unsigned plane_sizes[VB2_MAX_PLANES] = { };
>   	bool non_coherent_mem = flags & V4L2_MEMORY_FLAG_NON_COHERENT;
>   	unsigned int q_num_bufs = vb2_get_num_buffers(q);
> +	bool restricted_mem = flags & V4L2_MEMORY_FLAG_RESTRICTED;
>   	bool no_previous_buffers = !q_num_bufs;
>   	int ret = 0;
>   
> @@ -1040,6 +1055,9 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   		return -ENOBUFS;
>   	}
>   
> +	if (restricted_mem && (!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF))
> +		return -EINVAL;
> +

This condition is repeated in another place. If it is ever to be
changed, the person changing it must remember to look at both
places. Maybe:

static inline int restricted_mem_mismatch(bool restricted_mem,
				struct vb2_queue *q, enum vb2_memory memory)
{
	return restricted_mem &&
		(!q->allow_restricted_mem || memory != VB2_MEMORY_DMABUF) ?
		-1 : 0;
}

(you probably want to clean up line breaks)

and:

	if (restricted_mem_mismatch(restricted_mem, q, memory))
		return -EINVAL;

Regards,

Andrzej

>   	if (no_previous_buffers) {
>   		if (q->waiting_in_dqbuf && *count) {
>   			dprintk(q, 1, "another dup()ped fd is waiting for a buffer\n");
> @@ -1058,6 +1076,7 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   			return ret;
>   		q->waiting_for_buffers = !q->is_output;
>   		set_queue_coherency(q, non_coherent_mem);
> +		q->restricted_mem = restricted_mem;
>   	} else {
>   		if (q->memory != memory) {
>   			dprintk(q, 1, "memory model mismatch\n");
> @@ -1065,6 +1084,8 @@ int vb2_core_create_bufs(struct vb2_queue *q, enum vb2_memory memory,
>   		}
>   		if (!verify_coherency_flags(q, non_coherent_mem))
>   			return -EINVAL;
> +		if (!verify_restricted_mem_flags(q, restricted_mem))
> +			return -EINVAL;
>   	}
>   
>   	num_buffers = min(*count, q->max_num_buffers - q_num_bufs);
> diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> index 293f3d5f1c4e..9ee24e537e0c 100644
> --- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
> +++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
> @@ -682,7 +682,7 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>   		*flags = 0;
>   	} else {
>   		/* Clear all unknown flags. */
> -		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT;
> +		*flags &= V4L2_MEMORY_FLAG_NON_COHERENT | V4L2_MEMORY_FLAG_RESTRICTED;
>   	}
>   
>   	*caps |= V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS;
> @@ -698,6 +698,8 @@ static void vb2_set_flags_and_caps(struct vb2_queue *q, u32 memory,
>   		*caps |= V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS;
>   	if (q->supports_requests)
>   		*caps |= V4L2_BUF_CAP_SUPPORTS_REQUESTS;
> +	if (q->allow_restricted_mem && q->io_modes & VB2_DMABUF)
> +		*caps |= V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM;
>   	if (max_num_bufs) {
>   		*max_num_bufs = q->max_num_buffers;
>   		*caps |= V4L2_BUF_CAP_SUPPORTS_MAX_NUM_BUFFERS;

