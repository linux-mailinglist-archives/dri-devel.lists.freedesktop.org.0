Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BFA8A072
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 16:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411EC10E7A0;
	Tue, 15 Apr 2025 14:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A71FpUQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA15510E7A0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744725662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=igmdI0kSDqZsvsPzw7Io9AH+cSfi52O12B3FfuJtqjg=;
 b=A71FpUQBhVAdb/Uv5bDgvnEwZTrgc01xu1APZOqRdtp056cG8/nGk2+r78cEU3erclI8nF
 KWhRMTjYvrjtE0X0W3onbqec4R23iLpCjqOafvrrq5BVejcF0gGYlbscguyj8BTS4VAuy3
 nMOzPqdg5B9mrdzwSYdijwKap77EbEw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-Zw4651IWMXqev2JePH03eQ-1; Tue, 15 Apr 2025 10:00:56 -0400
X-MC-Unique: Zw4651IWMXqev2JePH03eQ-1
X-Mimecast-MFC-AGG-ID: Zw4651IWMXqev2JePH03eQ_1744725655
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43efa869b0aso42338655e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 07:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744725655; x=1745330455;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=igmdI0kSDqZsvsPzw7Io9AH+cSfi52O12B3FfuJtqjg=;
 b=pK8gZ3Sz0GLA9+zbtLRpq9so9BWwZqkzWxP8WcIV6OtIvlUMS9rb4QVeXK9+KGC/11
 he6OYRanJWQKerLJzKsxUTuaG3Ao1bLQ59+9jr+syV0zAU6O6rX1ucUw44jA4YVol6gK
 2cKxLF54dPoq45W4Ea4ASIW39NgTkAE7P9XFCI6wc5gTG95BdJeCd0f/zD/234MDdVmh
 nieEzn73BIUHVRKLEJrelNSj3czfDhngbzL3RU+uyKhY3+IWoHVtGGnu0oZzVujgGf0Y
 5tjzZEuXVLym6sYYftqBG0kRff6FDjqxPvqto5twD7Ajynl/3OTvyS5f3Kl/Gmlwl+Pp
 sflQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/2XYRjfZ3sOia9PXYuSGCgpDnnIEiwE9t/g6qJFpYbHPTAui2N42ZX1HYvrjwZKfzD8LJvkk6hKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGJ96UunzbPonmY5RfwauIUPcARiU4eRxQBB6Lp+T9UnsGx58y
 3yvWouxvy0sAl82IfOEHp+I/01HLd77CKKHuVCZirk84pOsixzMOLUpuyXgHoWdAHTSkBrJALaW
 FkD0HuZvk0mNMZCfSzVkUnIBfF5wG+fzrIJmjm23xXmEC4Xnj91rVuyWxWeiA75dNXw==
X-Gm-Gg: ASbGncv2SxcUUG1LxGjgLwbAFaB8NQMo0QUhXQm0SoRZksXkIIoD+sIxZur8YkY09f4
 t0RYx0I+Hm0S108NnyIn9mtTnjyBxPL6ccK1UXnwvWKiJLXjK2TF61dVNXlTpxQ5rw0Ga9/YNcd
 OUJ5/RwqsYShwrcDVvfzft9kAn4Z8KrD4z+p6YllKRwNEvp2zviYHmkbaBjLmUT5yNn025xX4x5
 ZC6ygofpFuZ0FgMgG7biQNFtuGSjNPbAbRV6ZanT5XbWMuY9y3221jbLtFRt/kTqtDs0VXzH+rB
 T5XIuQ==
X-Received: by 2002:a05:6000:2911:b0:391:1652:f0bf with SMTP id
 ffacd0b85a97d-39eaaea8c84mr12562743f8f.33.1744725654622; 
 Tue, 15 Apr 2025 07:00:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv6jlDturxPui6Vb2bbzQw+TvvK2bK5gTukcWi0U1ZLkB+XYbqUougrxO8tQDqdyASZrd5Fw==
X-Received: by 2002:a05:6000:2911:b0:391:1652:f0bf with SMTP id
 ffacd0b85a97d-39eaaea8c84mr12562649f8f.33.1744725653855; 
 Tue, 15 Apr 2025 07:00:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c8219sm207637185e9.21.2025.04.15.07.00.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 07:00:52 -0700 (PDT)
Date: Tue, 15 Apr 2025 10:00:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-kernel@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
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
Message-ID: <20250415095922-mutt-send-email-mst@kernel.org>
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
 <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
MIME-Version: 1.0
In-Reply-To: <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hlN8Gzt3YZhAqgfNRvKIgCSboXN4mAvuAkBuBBGGmwU_1744725655
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

On Tue, Apr 15, 2025 at 01:16:32PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> > +{
> > +	/*
> > +	 * drm does its own synchronization on shutdown.
> > +	 * Do nothing here, opt out of device reset.
> > +	 */
> 
> I think a call to 'drm_dev_unplug()' is what you need here.
> 
> take care,
>   Gerd

My patch reverts the behaviour back to what it was, so pls go
ahead and send a patch on top? I won't be able to explain
what it does and why it's needed.


-- 
MST

