Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79B574B5E4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 19:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7821410E010;
	Fri,  7 Jul 2023 17:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E2010E010
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 17:35:22 +0000 (UTC)
Received: from [192.168.2.30] (109-252-155-235.dynamic.spd-mgts.ru
 [109.252.155.235])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 62B096606FDB;
 Fri,  7 Jul 2023 18:35:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688751319;
 bh=fbQQPQr/8rFeg9bxr/mrw1taMZlzE2ELkuyrpyjdPkE=;
 h=Date:Subject:From:To:References:In-Reply-To:From;
 b=Tkp3PlHARZoT68DrYkRKhX/rzUDVYrO9/Ocdxv/4GpGa1X7PklamFzi6feN1BpGja
 Ri41cTac0wzhCOBiNPC0VLWC4c8cOp25bTRcAIkFwTGTo88sUqNCGjKQmUBrpLDYKG
 etdBQY7QeubgOxpz+LkZpKslrvYBkpZtiGbbxhysVi9EPYSiBOD3x+Hg+ThIOPix4P
 yA3dyVU+R4zMIOTbDDx027zcONk5nwLprvZZN4x1sOCojDjUMoJvRcYLbWe/VVGi8g
 n8JnJzAsUX8PWWFP4rj8FEiOAi+IrRGFea6xv/oPm59ADuNxi3grx37y1IwuWASQbc
 w8HGxo4exegag==
Message-ID: <0a581623-1241-5bc3-aed9-c355053131bc@collabora.com>
Date: Fri, 7 Jul 2023 20:35:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v3] drm/virtio: conditionally allocate virtio_gpu_fence
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>,
 dri-devel@lists.freedesktop.org
References: <77c241ff-b3b6-d399-59db-0291dc9d2812@collabora.com>
 <20230707154337.620-1-gurchetansingh@chromium.org>
 <2be0ec9f-5e40-1b23-48ed-e284e97a93d1@collabora.com>
In-Reply-To: <2be0ec9f-5e40-1b23-48ed-e284e97a93d1@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/7/23 20:04, Dmitry Osipenko wrote:
> On 7/7/23 18:43, Gurchetan Singh wrote:
>> @@ -161,21 +157,27 @@ static int virtio_gpu_init_submit(struct virtio_gpu_submit *submit,
>>  				  struct drm_file *file,
>>  				  u64 fence_ctx, u32 ring_idx)
>>  {
>> +	int err;
>> +	struct virtio_gpu_fence *out_fence;
>>  	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
>>  	struct virtio_gpu_device *vgdev = dev->dev_private;
>> -	struct virtio_gpu_fence *out_fence;
>> -	int err;
>> +	bool drm_fence_event = (exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
>> +			       (vfpriv->ring_idx_mask & BIT_ULL(ring_idx));
> 
> Previously, when VIRTGPU_EXECBUF_RING_IDX flag wasn't specified, the
> fence event was created for a default ring_idx=0. Now you changed this
> behaviour and event will never be created without
> VIRTGPU_EXECBUF_RING_IDX flag being set.
> 
> Could you please point me at the corresponding userspace code that polls
> DRM FD fence event?
> 
> It's unclear whether there is a possible userspace regression here or
> not. If there is no regression, then in general such behavioural changes
> should be done in a separate commit having detailed description
> explaining why behaviour changes.

I see that venus does the polling and ring_idx_mask is a
context-specific param, hence it's irrelevant to a generic ctx 0. Still
it's now necessary to specify the EXECBUF_RING_IDX flag even if ctx has
one ring, which is UAPI change.

-- 
Best regards,
Dmitry

