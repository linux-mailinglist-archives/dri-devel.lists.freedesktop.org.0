Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5407A97306
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0622E10E16A;
	Tue, 22 Apr 2025 16:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FZD6OZhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326D810E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745340551;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrsd/3p7dvdW/2Y1idz3MOxsrZjO4oXnRPdIb4aDyus=;
 b=FZD6OZhB6PUKbnyJ8Sx/oQhiW4OJcg0RhWK3eQOao1iVUbGsj2hVgcoshj0ExRBOUNM5iQ
 ocBZ58GRZNSXSnXhTamL2hhEF+769icgcV+0CPAPSxIkwKBvUpLiRfTaleagwe3H2UdDD9
 NjnakHJ+x/5cjMoZJh+i49IaaqJo2co=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-wJOhQhjnOGCx8I63H-AnZA-1; Tue, 22 Apr 2025 12:49:09 -0400
X-MC-Unique: wJOhQhjnOGCx8I63H-AnZA-1
X-Mimecast-MFC-AGG-ID: wJOhQhjnOGCx8I63H-AnZA_1745340548
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43d734da1a3so25711455e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 09:49:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745340548; x=1745945348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zrsd/3p7dvdW/2Y1idz3MOxsrZjO4oXnRPdIb4aDyus=;
 b=gS559zRPgLjukAbC1o2WH5o200liegir1cUVlwdwCUCIVXDsR9kdnpOudXRujuMEKW
 pY0VxscELq+v/BPO7GB0h9wc4/nHonwxN8g8OKwHNtANkyYmaen6Qamc6TC+VMk5alCA
 TCWpDlBLmXfKRJK+KkaKR1FHfz+8kjfSulWrE2RvJX/wHm90cscZWkgGnlXSkyTfwp5g
 ml1ubUfg5uM56bqlatmNu9EwHi3W2f4B1dXq+LL6YlzoUhaFiifpH974gmX1tcsaFkhI
 ziOcT4+83ZD63pY/S3pXpCyKfe1zHA4Ahr3aqMG4jP3DGStMt19Uagm+FpDiHWp0/zXt
 XKXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlBQ+NsRKcGs/GrALq2dVh7EdFicrR2h8IOgjc6miISUl8daPXei9zVbixwlfz5tlZTWWRwApbLco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrBHahljOHe3CH50pbbzPwBtDWwlXScCs58AFt7V1BQMdBqn8/
 bHyuiRnWhOpxPTT7GqKB7QcNkiHhmp+Hx1n3qW5glqFfwnrt4mvAQHMRRH2r4CLlGEjhQ/WCyer
 veodiHOxciN6DCynj4LVETenJtyvW2CF6VSGh0ggcKpA+abmCFfDeNX/V9rvqed1fjg==
X-Gm-Gg: ASbGncspLVf6GIgNvNj6xERXhNVNiJ3Jnh1J7zLOgmpuEtqdFfZWoPar7eLb67psgg+
 bxOtTQSaY7zhh0iSyg17ugoEZ9NgMvT8d/HpziimRhmBsk7uz+9B4W+T3apwy4fnjZkTT3UOswz
 nXrKcvr8cpgimdlw3uhNaGX3goNu2GH5TVnH9D7BnIGV4JXi0C6oN32WTGXHq6J5YonILbQOeTs
 GT7v7aE/19u1PXSLnxp9OzoMb4Ft8iCwULf6yBlqURIbO8xBGcCIQvpIv26ZUAtxWslGdiB6jDS
 WNe5VYqCC4Cjo2OFH0xc14cHsqc42zywz5MtMpoJGVz0/xjiUZJnpvw+uoc=
X-Received: by 2002:a05:600c:1906:b0:43d:fa58:8378 with SMTP id
 5b1f17b1804b1-4406ac11581mr132427945e9.33.1745340548371; 
 Tue, 22 Apr 2025 09:49:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL0BTg1501d7TjC/8u5Gc8ZzZQofR/EdbhGN5AMF4Ozt8Ub8BwgAm98X6mqgEsGUZkPjE5Lw==
X-Received: by 2002:a05:600c:1906:b0:43d:fa58:8378 with SMTP id
 5b1f17b1804b1-4406ac11581mr132427685e9.33.1745340547956; 
 Tue, 22 Apr 2025 09:49:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5ace47sm178502985e9.15.2025.04.22.09.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 09:49:07 -0700 (PDT)
Message-ID: <5aede4c4-5dfd-4ec1-9fd8-a5d6700678bd@redhat.com>
Date: Tue, 22 Apr 2025 18:49:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtgpu: don't reset on shutdown
To: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Eric Auger <eauger@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
 <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
 <20250415095922-mutt-send-email-mst@kernel.org>
 <lgizdflxcku5ew2en55ux3r72u37d6aycuoosn5i5a5wagz6sc@d2kha7ycmmpy>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <lgizdflxcku5ew2en55ux3r72u37d6aycuoosn5i5a5wagz6sc@d2kha7ycmmpy>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oLjfP-R8fOK9nx_LgagvBd7PZvzoxl-7OGNwoyN6qxk_1745340548
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Reply-To: eric.auger@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Gerd, Michael,

On 4/16/25 3:57 PM, Gerd Hoffmann wrote:
> On Tue, Apr 15, 2025 at 10:00:48AM -0400, Michael S. Tsirkin wrote:
>> On Tue, Apr 15, 2025 at 01:16:32PM +0200, Gerd Hoffmann wrote:
>>>   Hi,
>>>
>>>> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
>>>> +{
>>>> +	/*
>>>> +	 * drm does its own synchronization on shutdown.
>>>> +	 * Do nothing here, opt out of device reset.
>>>> +	 */
>>> I think a call to 'drm_dev_unplug()' is what you need here.
>>>
>>> take care,
>>>   Gerd
>> My patch reverts the behaviour back to what it was, so pls go
>> ahead and send a patch on top? I won't be able to explain
>> what it does and why it's needed.
> See below.  Untested.
>
> Eric, can you give this a spin?
>
> thanks,
>   Gerd
>
> ----------------------- cut here -------------------------------
> From f3051dd52cb2004232941e6d2cbc0c694e290534 Mon Sep 17 00:00:00 2001
> From: Gerd Hoffmann <kraxel@redhat.com>
> Date: Wed, 16 Apr 2025 15:53:04 +0200
> Subject: [PATCH] drm/virtio: implement virtio_gpu_shutdown
>
> Calling drm_dev_unplug() is the drm way to say the device
> is gone and can not be accessed any more.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index e32e680c7197..71c6ccad4b99 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  
>  static void virtio_gpu_shutdown(struct virtio_device *vdev)
>  {
> -	/*
> -	 * drm does its own synchronization on shutdown.
> -	 * Do nothing here, opt out of device reset.
> -	 */
> +	struct drm_device *dev = vdev->priv;
> +
> +	/* stop talking to the device */
> +	drm_dev_unplug(dev);
I have tested this patch on top of Michael's v2 and I don't see any
splat on guest.

Feel free to add my

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
>  }
>  
>  static void virtio_gpu_config_changed(struct virtio_device *vdev)

