Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1AE9D7A14
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 03:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA50510E100;
	Mon, 25 Nov 2024 02:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="knt0YtML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3A110E100
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 02:27:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732501627; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fJpivCCVoYfEfffjpL5apbvH9/uGwDpZrfE1Z95icqqsOh3sr6NLOXUjbhMt0p49ceePTw9flsVshEQFGWCrELPHymLWtQxdrF+I4cf+lth90yT95jfUKUr5Rt6ciswQnfPqGjISGY5mMeHDTZDlr3x0JNtp0hRmzISOQejlvDk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732501627;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2nk6VSWF+Iuc9RGMA/OqxVUYgtDe0wGGIq2xy5toCOw=; 
 b=ntHwh4YHAk+ltg6f7AAqWE6Kqrc1vmOb3DL3HODcHZGEJQ4EbONybNtZ3BOxXsrMVZYGejzfKQLSSEO/kZNsPPOLyimtXIRGG3GgeENOab+S130pg0uhOGD7R1UtfdaT+tsk7lxxtfgA/GIN1vXXHMDS/O2RAIdo/tsxGdLOJjg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732501627; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=2nk6VSWF+Iuc9RGMA/OqxVUYgtDe0wGGIq2xy5toCOw=;
 b=knt0YtMLsB5Wn2ILz721uHiTxSOBY9AcO6z19mNZH6z96I8Gam24DpmYQVZCj+2Z
 2U5zS8UVv/kySLWBgyhGsuAUYtuz806P56cOgdg7ykW2rtLIuEQ6AkdXc2Fuw1GaiTM
 MSzqZ+3GNLB2gzAvCzrp6K55Qvata4cozwiXyKGQ=
Received: by mx.zohomail.com with SMTPS id 173250162485169.82787247272529;
 Sun, 24 Nov 2024 18:27:04 -0800 (PST)
Message-ID: <4ba9da71-535d-4579-907f-8ff2ccc505e5@collabora.com>
Date: Mon, 25 Nov 2024 05:27:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241113084438.3283737-1-ryasuoka@redhat.com>
 <f31a8d1f-73d5-424e-ad09-2ae39712e230@collabora.com>
 <ec721548-0d47-4c40-9e9d-59f58e2181ae@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <ec721548-0d47-4c40-9e9d-59f58e2181ae@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

On 11/19/24 13:21, Jocelyn Falempe wrote:
...
>> In the virtio_panic_flush() below,
>> virtio_gpu_panic_cmd_transfer_to_host_2d() is invoked only for dumb BOs.
>> Thus, only dumb BO supports panic output and should be accepted by
>> get_scanout_buffer(), other should be rejected with ENODEV here, AFAICT.
>> Correct?
> 
> Yes, it's correct

Please fix in v5.

...
>>> +struct virtio_gpu_panic_object_array {
>>> +    struct ww_acquire_ctx ticket;
>>> +    struct list_head next;
>>> +    u32 nents, total;
>>> +    struct drm_gem_object *objs;
>>> +};
>>
>> This virtio_gpu_panic_object_array struct is a hack, use
>> virtio_gpu_array_alloc(). Maybe add atomic variant of the array_alloc().
> 
> We can't allocate memory in the panic handler, but maybe it can be pre-
> allocated, like the virtio_panic_buffer ?

We certainly can allocate memory from any context using GFP_ATOMIC flag
for the allocation. You already doing that in
virtio_gpu_panic_queue_ctrl_sgs().

>>> +static void virtio_gpu_panic_put_vbuf(struct virtqueue *vq,
>>> +                      struct virtio_gpu_vbuffer *vbuf,
>>> +                      struct virtio_gpu_object_array *objs)
>>> +{
>>> +    unsigned int len;
>>> +    int i;
>>> +
>>> +    /* waiting vbuf to be used */
>>> +    for (i = 0; i < 500; i++) {
>>> +        if (vbuf == virtqueue_get_buf(vq, &len)) {
>>
>> Is it guaranteed that virtio_gpu_dequeue_ctrl_func() never runs in
>> parallel here?
> 
> Yes, in the panic handler, only one CPU remains active, and no other
> task can be scheduled.

Awesome. thanks for the clarification.

...
>>> +    ret = virtio_gpu_panic_resource_flush(plane, vbuf_resource_flush,
>>> +                          plane->state->src_x >> 16,
>>> +                          plane->state->src_y >> 16,
>>> +                          plane->state->src_w >> 16,
>>> +                          plane->state->src_h >> 16);
>>> +    if (ret) {
>>> +        virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
>>> +                      vbuf_dumb_bo,
>>> +                      (struct virtio_gpu_object_array *)&objs);
>>
>> The virtio_gpu_panic_notify() hasn't been invoked here, thus this
>> put_vbuf should always time out because vq hasn't been kicked. Again,
>> best to leak resources on error than to have broken/untested error
>> handling code paths.
> 
> agreed

Please change it in v5.

...
>> If there is more than one virtio-gpu display, then this panic buffer is
>> reused by other displays. It seems to work okay, but potential
>> implications are unclear. Won't it be more robust to have a panic buffer
>> per CRTC?
> 
> The drm panic handler call each plane sequentially, so it's not a
> problem. Having one buffer per CRTC would just add more complexity.

Please add a clarifying comment for that to the code.

-- 
Best regards,
Dmitry
