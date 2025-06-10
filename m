Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE1AD3955
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963E110E563;
	Tue, 10 Jun 2025 13:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hyL+nHh7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D53510E563
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749562465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JaThg5+r5uhS87jz3/gzU48kE9fYSYuQjTKSX+XLaXk=;
 b=hyL+nHh7jTDTEE7wSwT5g0dflJmAth8X5LKyZ2Reo/paG/UKvvb2dHML+zL2i5susO8+wb
 e5RN+j5/VYiuNKiQBMPabQPOcaRG+SRos56IGn5dvGO/oqd7nFfDO9WFMW0Q3bT2ZoaoeA
 NIHgK7OYnI4FDuOi7kT+Y8z6nlIm7Y4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-bW8Z6JlzMYC0VfoyW6n7wg-1; Tue, 10 Jun 2025 09:34:22 -0400
X-MC-Unique: bW8Z6JlzMYC0VfoyW6n7wg-1
X-Mimecast-MFC-AGG-ID: bW8Z6JlzMYC0VfoyW6n7wg_1749562461
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-ade32b5771bso303019466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749562461; x=1750167261;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JaThg5+r5uhS87jz3/gzU48kE9fYSYuQjTKSX+XLaXk=;
 b=TPSR2J04NbAcumApObTLs3GbG3plF2FgaXRm9YntcuAwnS6kGaLlNOpE1yRJDkwbXL
 LyBraWxR57R5Dc9hAuVt7Rd7/OQx4StPjw2sx1hqul2XyMB4sH7U1BmXOQbMX+ewjmxu
 +0ZslBLvjBum5IX2B3dwhDCHaDrTa+NwcBswTUZ0M7uyUqSaU40NAdzs8uF1i1NLe1yS
 BuDBhqpBaDZr4lpZAyeURMoWCoBrZ09l5JmQgxcIHRdpzKO3P9cftLo9ykFcIQUJDnu9
 7IbKb5sO4/OFbsf0xYrKM1B9RS/8UnTI0lpo94sQTXhobF6zbxxC67AUcrGl4ygwCb9C
 8ePw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbUovD5lyoCxjyHCwf5NVg7u/4Jo4DvNrl+NumShF3RLHWxg69zJR9eBLLIoaY05ili5tsYZXodDw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMy7hJnka5vO7OxKrCR/Mndduq2uDDxkSUECBuS2HIMxvH5PbX
 mtcUq75B6lxRDUZ7AOr0QXFumbkgs+cP+GwCHN/3iVQiXddIyYJwUD60A4BiDtb8UWxGwQijjwi
 Hg3pdqdD+BPcCj8AhranHheVOA8O7bTai8lJGYdEWa6W8RXSFi/G/szCIt6CVQHeeVd2MAA==
X-Gm-Gg: ASbGnctbUxX5iS4KIThX7ZVmCwvwaZ7bTaiJDEq/Ot60Qr7HQ4SYMmDuu+e6EM7+C9j
 6+BOkYrfjl7JftrCbvQBJH1f3nLW6siHgds3EtcNKHdamTcOHwmrYiA8Pb4wRN3t/Hy2BGs9w3V
 dtmWZudXzWVFCN2/3OaSIkXQYhvstmbqsPziRE/t1fpKbAjdZh1THomMggXyXO1m0Oy9c3qcNbR
 tBPU7hPfukqmG+Ng7Ti30BiFBG/Qp05uP+QBk9EAP51wsDzuGzAmNjKY4NBQDKmg51d6TdYhVul
 BLfK0YQXzbB8baZU31QVpAGyUQgT
X-Received: by 2002:a17:907:9627:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ade1a9161d5mr1556452266b.9.1749562460784; 
 Tue, 10 Jun 2025 06:34:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVQJ9XKVtgWAPBPx92DgJukt6mEoSr0j96sE8wez5IFUYtTCsIHQA0fNWr/TED56i/nhFt1g==
X-Received: by 2002:a17:907:9627:b0:ad2:4fa0:88cd with SMTP id
 a640c23a62f3a-ade1a9161d5mr1556448066b.9.1749562460153; 
 Tue, 10 Jun 2025 06:34:20 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.220.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1db57856sm727888966b.63.2025.06.10.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:34:19 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:34:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] virtgpu: deallocate capsets on device deinit
Message-ID: <4si3wc7jhfcyukrepw3wi6zmylqf7b5ilnlxfpbbexcijcvlnz@3r2zcpxne275>
References: <20250505-virtgpu-queue-cleanup-v1-v1-0-810923da2b1e@linaro.org>
 <20250505-virtgpu-queue-cleanup-v1-v1-3-810923da2b1e@linaro.org>
 <5271820d-7afd-45e5-8103-b7d4fc818278@collabora.com>
 <c3ae2790-20d8-4220-848e-7b02b185e893@collabora.com>
MIME-Version: 1.0
In-Reply-To: <c3ae2790-20d8-4220-848e-7b02b185e893@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uJWQy3dnuxmZFORyTtzT19MuaPCiYh5I6bjQjf1_81Y_1749562461
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

On Mon, May 05, 2025 at 07:22:35PM +0300, Dmitry Osipenko wrote:
>On 5/5/25 18:58, Dmitry Osipenko wrote:
>> On 5/5/25 11:59, Manos Pitsidianakis wrote:
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
>>> index 7b3c4d314f8eee692e2842a7056d6dc64936fc2f..a8b751179332b9ec2fbba1392a6ee0e638a5192e 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
>>> @@ -286,6 +286,10 @@ void virtio_gpu_deinit(struct drm_device *dev)
>>>  	flush_work(&vgdev->cursorq.dequeue_work);
>>>  	flush_work(&vgdev->config_changed_work);
>>>  	virtio_reset_device(vgdev->vdev);
>>> +	spin_lock(&vgdev->display_info_lock);
>>> +	drmm_kfree(dev, vgdev->capsets);
>>> +	vgdev->capsets = NULL;
>>> +	spin_unlock(&vgdev->display_info_lock);
>>
>> Isn't this lock superfluous?
>
>Wait a minute, vgdev->capsets is allocated using drmm, hence it's
>auto-freed when DRM device is freed. This patch shouldn't be needed.

Yep, good point. I mean the patch is not wrong, but I think we can avoid 
it.

Thanks,
Stefano

