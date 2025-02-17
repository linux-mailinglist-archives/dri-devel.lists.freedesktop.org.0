Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BC5A37BFF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7518B10E104;
	Mon, 17 Feb 2025 07:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EBmE5F0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTP id 28DD110E104
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739776779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vlfl+lmHhnb3eDe+iFkolSYqaJktZfayJNrM+qurEz0=;
 b=EBmE5F0BS6y/QANt7Kw5K902fkWGjBGZiFPlfzssLeQ1CRvE46XApwkjv8ocLVKLlNyOmM
 QuGyPvL8kaSGb3k2G58wfg3EE12ZlXZXSpaEH2Ph3hknywIn0jEkSsVJtQiP3WYdcRY6nt
 IChs8dH7iSlfMaBB3cJFyhmYlDQbosM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-7cnFa3-JOeyX4wxp67XcJA-1; Mon, 17 Feb 2025 02:19:38 -0500
X-MC-Unique: 7cnFa3-JOeyX4wxp67XcJA-1
X-Mimecast-MFC-AGG-ID: 7cnFa3-JOeyX4wxp67XcJA_1739776777
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2fc404aaed5so6098833a91.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 23:19:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739776777; x=1740381577;
 h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vlfl+lmHhnb3eDe+iFkolSYqaJktZfayJNrM+qurEz0=;
 b=YFdBY8GE9xF+M2DeaZ9F/476yGO0KFR8hMmJx+UWi7NeJiQ8ddodw1/Fh71zVQ3KNn
 r9VaWBdkkwTadn17+ysYoL4FFjCZMKIFIk/75LSn6GUoTEfh/qOavh0RvXJYGei4yotl
 /dW5484tGwJ/SPwzz4sQoFpyikSDetJ0eeybLxfu/wFjIwZqVsHqM1RhWtuvKRmiIAuX
 r6cFBNtcOgVx4yCU3/B3Hw01U2q3Z6lh373/+fKUuA/lqMlA2JV8gOrcp1OV0lawheCW
 /UMb/SeeqIVxe32oLTrARvsANUl9B0CEPxj/R+q3cpMw2eVlxm38pocS/V18rS9MZwNM
 tmAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxokqNHtE3tA9GA/WPhLbRfL81zF7/Ol69H3N0yoAgRNvkEexL0+5Pz+uJuAOqq1keFCi3eOPIJG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpzhUlS8MDoLKgJZua5UBuqiItGiOhPZwJc9UMZoQcgG1f9Mq1
 Oc9EGUM0SJDbmJStBmsFr1KSMjdMuemHevhLMrBjFDqfJ/r1KDo9OAJJg/0HFj5Si/2AZiQ67xP
 zigxrzXSh3iQFQHjGrlz4Lt0zRjPQSgEyEsQjpSXUxDrlNWzBJRKHWVstl8dYZDvr9ZkMgz6+ib
 uhsox3UTT3NFA6Qq8lXR+Njpzy9x152pIGsqWdXw+N
X-Gm-Gg: ASbGncuNwawnSvneWcL4uC3HS+3oDd+nG00JvzZtKMGcS3VMTbUfakfYDg2bcHNzNHH
 XWEjXzwdSdbc7yy42PSD+9Mz7Uyd2cXi43M3utoolZF4n15B33e+eagQLO5wW57fa6FgAB6UHlo
 ThEd8Z6W3ZTUgkYo1Zai4=
X-Received: by 2002:a17:90b:4ad0:b0:2ee:a4f2:b307 with SMTP id
 98e67ed59e1d1-2fc40d14deamr14187520a91.4.1739776777307; 
 Sun, 16 Feb 2025 23:19:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqqYNFvrv7otKwk8EcZ5/jMtgR2Ep8+aemJnqKzPb45Yu2FPbMWq7EQ9gKvlZNIOHRf6FoesIjHYgLlK7NWSg=
X-Received: by 2002:a17:90b:4ad0:b0:2ee:a4f2:b307 with SMTP id
 98e67ed59e1d1-2fc40d14deamr14187493a91.4.1739776776856; Sun, 16 Feb 2025
 23:19:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 Feb 2025 02:19:35 -0500
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <f6d6de4d-1b87-4a53-a2eb-0d9ddfbc4311@collabora.com>
References: <20250214-virtio-shm-page-size-v2-0-aa1619e6908b@redhat.com>
 <20250214-virtio-shm-page-size-v2-5-aa1619e6908b@redhat.com>
 <f6d6de4d-1b87-4a53-a2eb-0d9ddfbc4311@collabora.com>
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 02:19:35 -0500
X-Gm-Features: AWEUYZkmTZoXk7_Rz3zTEPLKhoc079NRhM3R6YYEKHGPH952bEMjXNC96qKluPM
Message-ID: <CAAiTLFU3UhQyHzpPQKQpJcp_vpOrWdDU7Gv_ng6Vbm0B_+Lv9Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/5] drm/virtio: add
 VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE to params
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Verkamp <dverkamp@chromium.org>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, fnkl.kernel@gmail.com
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: whkOUdgcfqruvr2lw9pGBGR4LJ6I8i9cCw5uWzYbtWs_1739776777
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

Dmitry Osipenko <dmitry.osipenko@collabora.com> writes:

> On 2/14/25 18:16, Sergio Lopez wrote:
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> index c33c057365f85a2ace536f91655c903036827312..4b49635b4fe1d4256f219823341cef8e5fa8f029 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
>> @@ -117,6 +117,11 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
>>  	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
>>  		value = vgdev->has_context_init ? 1 : 0;
>>  		break;
>> +	case VIRTGPU_PARAM_HOST_SHM_PAGE_SIZE:
>> +		if (!vgdev->has_host_visible)
>> +			return -EINVAL;
>
> Nit: virtio_gpu_getparam_ioctl() returns EINVAL for unsupported params.
> While this is a supported param, but there is no hostmem available.
> Hence, should a different error code, maybe ENOENT or ENXIO.

Good point. I'll update it to return ENOENT in v3.

Thanks,
Sergio.

