Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 113386D51B0
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41D310E1D4;
	Mon,  3 Apr 2023 19:59:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9F10E1D4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 19:59:41 +0000 (UTC)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru
 [109.252.124.32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4B534660313D;
 Mon,  3 Apr 2023 20:59:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680551979;
 bh=zSQYwYndd2ZkXF8gAMJqDSt3JLQqZ/V49jQOay+yYh0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gmZTC9WgGEnkIJRbZHhDIpRyiFsupcwjPbNtMgslR/51LDLLd5HmQn8sqR/dESI+1
 EconZcSC1VbR4oKxOMBOVjzgogZLjWd3LHkWimqGYNrO6oZKBjV7Kl0CquIQZjA6n1
 X08RkSBI362i7jevCEn2j1MxdLj7K99mNfXNkBD6mEOtSEqEjNayEC2BZxUUUhz5KA
 EKKkdwpOtXymF7WmVTRPIrAIMCydIjYhd7WzwROta2zKBoJF/WnXXODKmoQpMGuFMk
 2pgOQDEhIgWdf2nuISrD9pVw6124hOBt+tUXCYBTvRudhk3vII3t7bK/Jdz1dWSxgX
 gMNBSgm82G1/w==
Message-ID: <699f2130-11be-e0db-5f7f-ff53dc3a46fc@collabora.com>
Date: Mon, 3 Apr 2023 22:59:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 1/2] drm/virtio: Refactor job submission code path
Content-Language: en-US
To: Emil Velikov <emil.velikov@collabora.com>
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
 <20230323230755.1094832-2-dmitry.osipenko@collabora.com>
 <ZCWre6oy0vHNyIkW@arch-x395>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZCWre6oy0vHNyIkW@arch-x395>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/23 18:32, Emil Velikov wrote:
>> +static int virtio_gpu_dma_fence_wait(struct virtio_gpu_submit *submit,
>> +				     struct dma_fence *fence)
>> +{
>> +	struct dma_fence_unwrap itr;
>> +	struct dma_fence *f;
>> +	int err;
>> +
>> +	dma_fence_unwrap_for_each(f, &itr, fence) {
> The dma_fence_unwrap_for_each() change should be a separate patch,
> highlighting why we want it.

Good point, it actually should be a potential optimization for the
in-fence waiting.

>> +	ret = virtio_gpu_init_submit(&submit, exbuf, dev, file,
>> +				     fence_ctx, ring_idx);
>> +	if (ret)
>> +		goto cleanup;
>> +
>> +	ret = virtio_gpu_wait_in_fence(&submit);
>> +	if (ret)
>> +		goto cleanup;
>> +
> We have reshuffled the order around in_fence waiting, out_fence install,
> handles, cmdbuf, drm events, etc. Can we get that split up a bit, with
> some comments.
> 
> If it were me, I would keep the wait_in_fence early and inline
> virtio_gpu_init_submit (the nesting/abstraction seems a bit much). This
> means one can omit the virtio_gpu_submit::exbuf all together.

I tried to inline and this variant makes code much less readable to me.

The point of having wait_in_fence after submit_init is that it makes
submit code path shorter. If we have to wait for in-fence, then once
fence signals, there is no need to init and instead move directly to a
further submission step.

Perhaps won't hurt to also factor out the wait_fence from parse_deps in
the second patch and do all the waits right before locking the buflist.

-- 
Best regards,
Dmitry

