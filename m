Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5196D3984
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 19:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE8B10E045;
	Sun,  2 Apr 2023 17:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D32110E045
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 17:45:26 +0000 (UTC)
Received: from [192.168.2.163] (109-252-124-32.nat.spd-mgts.ru
 [109.252.124.32])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CC166602EDC;
 Sun,  2 Apr 2023 18:45:23 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1680457524;
 bh=LQR9mavIiKKD1Q2f+8uq43FK4M4C09ETxpwD/UcvWp0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IdhoDVHb2ZwbrR5Bt8RZj7mnma0Wf1SMHw9eb6adCbETUE8xjL07xb9bvdDHQV7Tr
 ywWSc46Jn9vKXR+zsyamTXeVG1Oezt7oVRfrdkCuv5TZExjn3MzxW/ZlXrrQVVuzOQ
 z8VxYvafqCqj97+2JFjJn1LKv3mfmRG7m00WXZEfdLz/P9M11NVgWXwwemlCoeRrxh
 GJuHF4qba5PftW3e4p9WLvXY8GG3pUAgS3hcxv3KhUC9l1QHOtusNxl989O3HTIg8a
 U2Dtj+SWl/z2joh7OHomI931kz1NlBZSyjRTvGJsCwrAOUomT3iVtsEcps87aJumpv
 yh2EBlykfj+Wg==
Message-ID: <3618a293-4f61-b076-0a9c-c70812436431@collabora.com>
Date: Sun, 2 Apr 2023 20:45:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 2/2] drm/virtio: Support sync objects
Content-Language: en-US
To: Emil Velikov <emil.velikov@collabora.com>
References: <20230323230755.1094832-1-dmitry.osipenko@collabora.com>
 <20230323230755.1094832-3-dmitry.osipenko@collabora.com>
 <ZCXF4q81wPcczkqx@arch-x395>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ZCXF4q81wPcczkqx@arch-x395>
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

On 3/30/23 20:24, Emil Velikov wrote:
> Hi Dmitry,
> 
> Have you considered creating a few DRM helpers for this functionality?
> 
> AFAICT this is the third driver which supports syncobj timelines and
> looking at one of the implementations ... it is not great. Note that
> this suggestion is _not_ a blocker.

Would like to see a third driver starting to use the exactly same
drm_execbuffer_syncobj struct because UABI part isn't generic, though
it's a replica of the MSM driver for now.

The virtio-gpu is only at the beginning of starting to use sync objects,
compared to MSM driver. Will be better to defer the generalization until
virtio-gpu will become more mature, like maybe after a year since the
time virtio userspace will start using sync objects, IMO.

...
>> +static void virtio_gpu_reset_syncobjs(struct drm_syncobj **syncobjs,
>> +				      uint32_t nr_syncobjs)
>> +{
>> +	uint32_t i;
>> +
>> +	for (i = 0; i < nr_syncobjs; i++) {
>> +		if (syncobjs[i])
>> +			drm_syncobj_replace_fence(syncobjs[i], NULL);
> 
> Side note: the drm_syncobj_put() called immediately after also calls
> replace/reset fence internally. Although reading from the docs, I'm not
> sure if relying on that is a wise move.
> 
> Just thought I'd point it out.

The drm_syncobj_put() doesn't call replace/reset fence until syncobj is
freed. We drop the old fence for active/alive in-syncobj here after
handling the fence-wait, this makes syncobj reusable, otherwise
userpsace would have to re-create syncobjs after each submission.

>>  
>> +	ret = virtio_gpu_parse_deps(&submit);
>> +	if (ret)
>> +		goto cleanup;
>> +
>> +	ret = virtio_gpu_parse_post_deps(&submit);
>> +	if (ret)
>> +		goto cleanup;
>> +
> 
> I think we should zero num_(in|out)_syncobjs when the respective parse
> fails. Otherwise we get one "cleanup" within the parse function itself
> and a second during the cleanup_submit. Haven't looked at it too closely
> but I suspect that will trigger an UAF or two.

There are checks for NULL pointers in the code that will prevent the
UAF. I'll add zeroing of the nums for more consistency.

>>  	ret = virtio_gpu_install_out_fence_fd(&submit);
>>  	if (ret)
>>  		goto cleanup;
>> @@ -294,6 +512,7 @@ int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
>>  		goto cleanup;
>>  
>>  	virtio_gpu_submit(&submit);
>> +	virtio_gpu_process_post_deps(&submit);
> 
> Any particular reason why the virtio_gpu_reset_syncobjs is deferred to
> virtio_gpu_cleanup_submit(). Having it just above the process_post_deps
> (similar to msm) allows the reader to get closure about the in syncobjs.
> 
> This is just personal preference, so don't read too much into it.

The job submission path should be short as possible in general.
Technically, virtio_gpu_process_post_deps() should be fast, but since
I'm not 100% sure about all the corner cases, it's better to hold until
job is sent out.

Thank you very much for the review! I'll address the rest of comments in v5.

-- 
Best regards,
Dmitry

