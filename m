Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33533C53810
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 17:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB0110E0E4;
	Wed, 12 Nov 2025 16:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DNFElwir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEEE10E0E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762966145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vau743XOutCT7ZaDBV7vi7WPKrVykTyysCrhrB+GhO4=;
 b=DNFElwirBtpd8TwsnrK6sqLwNZixeGHZ25uxyOfUbB+2KIKIuvFtizXPuZAHqsuesqJE1m
 /3OaKAjAlVUWg7bWRqPJybUipI9+VzuAWWnq/nMXLiUf/bwlNNtWiV7Ulhddvkjwv1Bu+8
 ZSeX/kGC0g5RhtCfpqcspI7IwvPpl5s=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-ZfcFOlT1MyuwoXchm09xjQ-1; Wed, 12 Nov 2025 11:49:04 -0500
X-MC-Unique: ZfcFOlT1MyuwoXchm09xjQ-1
X-Mimecast-MFC-AGG-ID: ZfcFOlT1MyuwoXchm09xjQ_1762966143
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-63f9c4e3701so1601169d50.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 08:49:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762966143; x=1763570943;
 h=to:subject:message-id:date:mime-version:references:in-reply-to:from
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vau743XOutCT7ZaDBV7vi7WPKrVykTyysCrhrB+GhO4=;
 b=uiIrCCr1CKr4QvDfy57TJ8gtDbjtjaiy3J0aHvJ83mZyescaLpKkWK7nJN6BRKrkIR
 Tte60hPYFVyHbiPuGwI2tnuIL7DJ5A2xIhWjjyyxSgzNWkF9tfPfBNtnE3BZyKCPsnS6
 QoLyZ1DN7o17etXErCiWmCka4LsnnZg8NV/5/Nw0o2qnVzyXqG7A72bZgBxIXfG8uQru
 GD04IBDtZZPg1516hA/idpavnEJ6Bc01zSpkEt0QU7h2MH7WlOaVUiCrNEpIaVx7Mo2X
 mH8Otji57nnNBTl9NT4PArF2uMud2HUkJH/8lGVlKEJDD2VT67kWEeU7lxX8Eic+rBLB
 lFvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4hiqQgLWSKFCLAE47N1V/CsbUPIJyFtq1MMJNK8iOyFkXbLLsozQxmT47QR6qoIXSBkB4Eum3RZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVb2CADENAQ53hS5MSdRckDRx+m+62yhKeHhMKx0ZdVqZOqglz
 AiVDzC+Nbr5ioh46of3jWD3vGvfBgVD5snRWjcMU+1b1wYc2nw76j0odwmD9o4dcFDRViwrW2Hd
 qqse5oEWRRiahAE1uGIG01R4M92/s786ii/fFTd0+tcW8wlzDkO65sUD/nEBgzMAD8zglkDcmDL
 5BmCZVQvuX/vD/Q9eO8PVnIRWDuPop/vkbeTRJcnCCAwXh
X-Gm-Gg: ASbGncubVi/esXkmydOtwMCYEUi8c7ZM7SP+IUOa8GtPAygBcWdbCrC4qGjBiF3crZ7
 6bM7YRnLY/a7wcw3hwVpRfoPNgQzippJIvKaXBIbWIfftWC/8Lyu2Q2MQ76f2QC94eEtrS+4BJi
 COEecsyACwEVPZLOvxnPxO7EWzjeIzcwlpW3h5BS1cMjGhINC5JHomTcWr0GMa9hmBsHhmobYnp
 cnQUJjsEocJFWIKbA==
X-Received: by 2002:a05:690e:42c6:b0:63f:7da8:6b8f with SMTP id
 956f58d0204a3-64101b3c87emr3056767d50.54.1762966143626; 
 Wed, 12 Nov 2025 08:49:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmvC2Azip+GS36nKybduxfa97rWHb0V9T2GYDrBXHG+e2gKAEKaLd+WmmO83FeDXeTSFKsNYVIue/h2ojcATo=
X-Received: by 2002:a05:690e:42c6:b0:63f:7da8:6b8f with SMTP id
 956f58d0204a3-64101b3c87emr3056733d50.54.1762966143267; Wed, 12 Nov 2025
 08:49:03 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 08:49:01 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 08:49:01 -0800
From: Sergio Lopez Pascual <slp@redhat.com>
In-Reply-To: <855ebbf1-0b02-45b5-8fa9-b50c05793e19@collabora.com>
References: <20251110125213.12633-1-slp@redhat.com>
 <20251110125213.12633-2-slp@redhat.com>
 <855ebbf1-0b02-45b5-8fa9-b50c05793e19@collabora.com>
MIME-Version: 1.0
Date: Wed, 12 Nov 2025 08:49:01 -0800
X-Gm-Features: AWmQ_blkfmU4xkkhUO-M_WcjqEKuzPzp8_FWp2cGDYKHwbAkWUXG2xTRkwnWvs4
Message-ID: <CAAiTLFUbJ-YpV8+05PofXpmgOu=gNmUh9L6xgj_w80_mf7z8Tw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/virtio: support VIRTIO_GPU_F_BLOB_ALIGNMENT
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CL_mQJhKysMX_QITlyBh8Dv1XH2BKUXNcS6CeN4nkZ0_1762966143
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

> On 11/10/25 15:52, Sergio Lopez wrote:
>> +	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_BLOB_ALIGNMENT)) {
>> +		vgdev->has_blob_alignment = true;
>> +		virtio_cread_le(vgdev->vdev, struct virtio_gpu_config,
>> +				blob_alignment, &blob_alignment);
>> +		vgdev->blob_alignment = blob_alignment;
>
> Shouldn't blob_alignment be max(guest_alignment, host_alignment)?

virtio_gpu_config is the minimum alignment required by the device/host.
If the guest requires a higher alignment than the device/host, I would
expect that to be found by a different mechanism, as it would happen on
gpu drivers other than virtio-gpu.

Sergio.

