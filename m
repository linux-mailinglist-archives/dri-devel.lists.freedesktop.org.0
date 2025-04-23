Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F04A97F7E
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 08:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B0D10E1E5;
	Wed, 23 Apr 2025 06:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YtvnDUah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1308710E1E5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745390714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJQr5daKI6/1i+nwgHlDoYSZzm+JP1wEk08aCiKUf8w=;
 b=YtvnDUahU/NIwm+jAMKeVlRp1kxa+PIRtpYrXvqAt+sXFgHRJgMmO44CU6A8T/ptHFlOMs
 +iyk/aCXGJ3RXN6WO21sq8lGnxkcSwOnlofl56c7bhQyRkFlERhazW1klDifFJMeuECXzq
 kynOOvA+s9zsG/6Dk6dIX9YfQcC5WiQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-DHPdHZY0M_eBIiGeT7q_wg-1; Wed, 23 Apr 2025 02:45:13 -0400
X-MC-Unique: DHPdHZY0M_eBIiGeT7q_wg-1
X-Mimecast-MFC-AGG-ID: DHPdHZY0M_eBIiGeT7q_wg_1745390712
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ced8c2eb7so43549045e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 23:45:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745390712; x=1745995512;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJQr5daKI6/1i+nwgHlDoYSZzm+JP1wEk08aCiKUf8w=;
 b=Xf9OENWROjjfi4dkzAZ3m4m8OGwaFryTTuWj2E21924y8yPCMIwjSJmtXe98uFTQgj
 FOBlpMHYPptq9WiFDBdNkwUd0NcmKstUQXb/knvfrq1kFKD0fL3rgGyHBSks06Gouh90
 mLLEulyUN1NI/k/T6Y56m8syDxlv9Chk6k0CO9rhkNQsINA8GQip1O0E9ciVf+bGKwdd
 13lf5rde0giyNd9ReE/xNhKek1v4bEdzxzkMQEfRClGiGjOUCwsMK3h13MsIQrQKB3CC
 4aEh4fBy1Y88wDqWNz6wshkExG52f6C78Lq8MrSMuwCkYypzO9A1MN/7PXXC6NZ/9N2X
 RA7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4KV5x1Ue4JbCvJMAbckmhY7EBo6IPrnZmOl6S9S1bASncGUEBynW4CFypVsPa3NCYuZeL1RCLA44=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2NKDP4cMPasowx/1Bmp2Zf0pCqhzyzIlL70T+rYJWs6irtnY/
 dao0heZcZ3hRz7lkCRE7QO9JqZEf1oXE2TGbhTfOvXFizosDZGSpFVLV+Gr4cgUwpu+v9myQjez
 fQTybr/7S9vkn9R7G2nTbZz3zA6rims6Flj8GU8rQscfwQGmRBf0wIzAfmgiwrveRzg==
X-Gm-Gg: ASbGncvbJqVDGca5MJfYHJY0LI8DdCQ5+j6ZztW6jzdsk4KbsiCc7GjjkCdj+wze4an
 9kMKfLtR9xObRw2RU2aV3QtE45Iq50dsEPwJSN75NpiE0GAa3am9OKOafJJ2Xp40EjYL/cceGnL
 8vNO/Up+4++NXrv4kcUT9RmmXX396XsAZmQw1zHWAiNxDx5kUXatp9qw2oK0hZJoGVFk8feq58t
 nhB+YGfyEUhqdDo1YU5/XnVWY1XsI3deu3JHJDen+CVJ5Ix7I7y0t8/1I9GeonnFOCeKbhzjfFx
 jSLYVA==
X-Received: by 2002:a05:600c:3487:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-4406abfab7dmr152587705e9.24.1745390712289; 
 Tue, 22 Apr 2025 23:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESPeBSydPIH0zVAjW7EqTg1hmkncqgVOAhXdcSWQ91oQ3uYj81WGlTIQYk3qbwlXLCw+komw==
X-Received: by 2002:a05:600c:3487:b0:43e:a7c9:8d2b with SMTP id
 5b1f17b1804b1-4406abfab7dmr152587385e9.24.1745390711947; 
 Tue, 22 Apr 2025 23:45:11 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d4707csm14014875e9.40.2025.04.22.23.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 23:45:11 -0700 (PDT)
Date: Wed, 23 Apr 2025 02:45:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 Eric Auger <eauger@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2] virtgpu: don't reset on shutdown
Message-ID: <20250423023922-mutt-send-email-mst@kernel.org>
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
 <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
 <20250415095922-mutt-send-email-mst@kernel.org>
 <lgizdflxcku5ew2en55ux3r72u37d6aycuoosn5i5a5wagz6sc@d2kha7ycmmpy>
 <5aede4c4-5dfd-4ec1-9fd8-a5d6700678bd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5aede4c4-5dfd-4ec1-9fd8-a5d6700678bd@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xQWjqVHTfSF1PF8i8N2RPMu86T0dHFC4Ou7tcRTtPwc_1745390712
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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

On Tue, Apr 22, 2025 at 06:49:04PM +0200, Eric Auger wrote:
> Hi Gerd, Michael,
> 
> On 4/16/25 3:57 PM, Gerd Hoffmann wrote:
> > On Tue, Apr 15, 2025 at 10:00:48AM -0400, Michael S. Tsirkin wrote:
> >> On Tue, Apr 15, 2025 at 01:16:32PM +0200, Gerd Hoffmann wrote:
> >>>   Hi,
> >>>
> >>>> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> >>>> +{
> >>>> +	/*
> >>>> +	 * drm does its own synchronization on shutdown.
> >>>> +	 * Do nothing here, opt out of device reset.
> >>>> +	 */
> >>> I think a call to 'drm_dev_unplug()' is what you need here.
> >>>
> >>> take care,
> >>>   Gerd
> >> My patch reverts the behaviour back to what it was, so pls go
> >> ahead and send a patch on top? I won't be able to explain
> >> what it does and why it's needed.
> > See below.  Untested.
> >
> > Eric, can you give this a spin?
> >
> > thanks,
> >   Gerd
> >
> > ----------------------- cut here -------------------------------
> > From f3051dd52cb2004232941e6d2cbc0c694e290534 Mon Sep 17 00:00:00 2001
> > From: Gerd Hoffmann <kraxel@redhat.com>
> > Date: Wed, 16 Apr 2025 15:53:04 +0200
> > Subject: [PATCH] drm/virtio: implement virtio_gpu_shutdown
> >
> > Calling drm_dev_unplug() is the drm way to say the device
> > is gone and can not be accessed any more.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > index e32e680c7197..71c6ccad4b99 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > @@ -130,10 +130,10 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
> >  
> >  static void virtio_gpu_shutdown(struct virtio_device *vdev)
> >  {
> > -	/*
> > -	 * drm does its own synchronization on shutdown.
> > -	 * Do nothing here, opt out of device reset.
> > -	 */
> > +	struct drm_device *dev = vdev->priv;
> > +
> > +	/* stop talking to the device */
> > +	drm_dev_unplug(dev);
> I have tested this patch on top of Michael's v2 and I don't see any
> splat on guest.
> 
> Feel free to add my
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Eric Auger <eric.auger@redhat.com>
> 
> Thanks
> 
> Eric

Thanks, Eric!
Gerd, do you want to post a patch officially?
I just sent the dependency to Linus, maybe mention this for the
maintainers.


> >  }
> >  
> >  static void virtio_gpu_config_changed(struct virtio_device *vdev)

