Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B36A2A75
	for <lists+dri-devel@lfdr.de>; Sat, 25 Feb 2023 16:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE1610E13A;
	Sat, 25 Feb 2023 15:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBCC10E13A
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 15:21:38 +0000 (UTC)
Received: from [192.168.2.94] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6475E6602FB0;
 Sat, 25 Feb 2023 15:21:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677338496;
 bh=7jBenHKBdFCc4MyDCi41WuTdy4hTEhAYm+jhGxudmJM=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=GIawh0H3XWWIFT1T4YktDsV4RCnMIZ2c2ntQa5vrgxqCIKinucESZIhWVJn9EeYfS
 OjP2krt53cvyTah2DhNpwRpf2hyZrTxhMC3rd57wtO1qufwbj3I3n9B4Efjbm8on09
 WKRgVj1KECaJvYfoLXwTh9YfZF7k3Cr3WMRL0DnHk6yOJCtYRi+Eb4w2jtX4jDJmDM
 gQ+vrECHzKPL6QNpR72bUv9CB/wsTyDdw1D3/+nLEW/rcZZjpj1BDf+oDeKlavQE6G
 rnuOJ4JmGbavUYQOM+g7ssUAYmOD0j/bUqECxJXFSFvXqALqrj5jY/kqH6kVMZzG5o
 ZhT8T0N5GVKEQ==
Message-ID: <c45a0c45-ed87-636f-aa68-3d7ff81b83b6@collabora.com>
Date: Sat, 25 Feb 2023 18:21:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/1] drm/virtio: Support sync objects
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
References: <20230119004143.968942-1-dmitry.osipenko@collabora.com>
 <20230119004143.968942-2-dmitry.osipenko@collabora.com>
In-Reply-To: <20230119004143.968942-2-dmitry.osipenko@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/23 03:41, Dmitry Osipenko wrote:
> +		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
> +					     syncobj_desc.point, 0, &in_fence);
> +		if (ret)
> +			break;
> +
> +		if (!dma_fence_match_context(in_fence, fence_ctx + ring_idx))
> +			ret = dma_fence_wait(in_fence, true);

I missed to add dma_fence_chain_contained(in_fence) here, otherwise the
match always fails for a chained fence.

-- 
Best regards,
Dmitry

