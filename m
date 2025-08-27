Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649BB383BE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 15:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BC710E101;
	Wed, 27 Aug 2025 13:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IsDBBTaO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA8510E101
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 13:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756301615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K8z/3KgzEoz0nXpB3RNGuEeKXFHUG30ORWT5Yv+ILFU=;
 b=IsDBBTaOE4E9eqSJyiSSylROrCclRrSY/jaltKcw6QiXrl2fOgbF1RXXb6NB4nBU47B5Zn
 akaWFVdwU5nc4EdJMqIxsMZH4yep3oZ4aKkBZpx4bDlqB0TzmSTW/xLKAMuAxO/5NqZYgn
 lklDvxVvGKB5CDoKt8otYViiaku+qos=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-l6RKIkwMPEONqiV_D4IVyg-1; Wed, 27 Aug 2025 09:33:33 -0400
X-MC-Unique: l6RKIkwMPEONqiV_D4IVyg-1
X-Mimecast-MFC-AGG-ID: l6RKIkwMPEONqiV_D4IVyg_1756301612
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3c79f0a57ddso2381587f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756301612; x=1756906412;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K8z/3KgzEoz0nXpB3RNGuEeKXFHUG30ORWT5Yv+ILFU=;
 b=FCXJ8/DO5emuDArldqlS0exS5FwMWhQfaMU+EVrgTPjI+Tg6XAAiInN3Qg+OpHuHlC
 rBeXvLygKJfainmuWDpZNzFeAzYMEIasZK2tKWPMMvPOYyi4XfVCQLFWnGJa2poTu+Y5
 OhfB4fj9NWzDkddepB5zJIVBrcPBC1HIb+kQFa6i5xpPfv2gqPzw4KPPMWVlHzh2agGI
 YVeboWiBH1qV2s3Srvb8Vbq2/9t+d7wta7sM2hnaXQlECx6C9Pocst6S5NxsXMRowoi9
 JJB6OEmvNBTk2xJN+gCs8QC0QcgcAJMr92Bo/RmNFXYVMbmduPihFf+zClCLHuvvpcDr
 0F9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW5XUN/T/WRxzaSmpqeSS53XpGgZURyqfSf69kBV7DEf7VAW3OJKQUUfwJE1WmW9m8mCAuUVpsBNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweQERuIJo8q+sVBFqqAtxyxipiqe3m/3qGhjfJWO3qSH+f+JDN
 GvhG5I7tgXt8r1lKwnW1AlIFGTsX6Qu1JLnt0CgGiX9ITkIZWuLl6RA5UsDVwyRlb2I7mOwfCD4
 gp+Z2Tv3Nlgyl7v13t8K4plvbvOBclO5qWAKmRzyXZVaMs8OPIOW1vJhsOxOWUFkN7+y/bw==
X-Gm-Gg: ASbGncs/64MLf2/wlKqqLSHMxgprSM9V99VgU5zlPCibiZQQn9Anz77FzXGIx/XMSA9
 5HjjoreBcL7DKEpiX19u6miSV7GdiFJAs8j3VEY/9llfJWNYwXPgjAR8K9xNSKiC3IiiEZZESTU
 U3/J2B4byxEmhmyEWxd18XdBOZhqNQ2hE8/ymmMdWWZyN9UV9CylyUAhX2a98ivmKfhVePaT4EZ
 FtiZ5i7a8VtM7jEZ2xoLR1DIEoh52ycHYwsKVwh28M6KKeAhHdG9gndVgYlZZBqaUxEMMG/+Td2
 QpNtnoMOsfeSlgOGHJyXw4wGtnbx+Pc=
X-Received: by 2002:a05:6000:2281:b0:3cd:4ff9:c487 with SMTP id
 ffacd0b85a97d-3cd4ff9c926mr847042f8f.45.1756301612376; 
 Wed, 27 Aug 2025 06:33:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpXWIRKQBLCST7L7FbqSdMsqrTEd8mC9YrfacqJgmW7hhmhY+MtE22/oJUnVDrsWnKorEEVQ==
X-Received: by 2002:a05:6000:2281:b0:3cd:4ff9:c487 with SMTP id
 ffacd0b85a97d-3cd4ff9c926mr847017f8f.45.1756301611871; 
 Wed, 27 Aug 2025 06:33:31 -0700 (PDT)
Received: from redhat.com ([185.137.39.233]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ccac1b892bsm2973545f8f.67.2025.08.27.06.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 06:33:31 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:33:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Honglei Huang <honglei1.huang@amd.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: fix host visible memory detection in
 virtio-gpu
Message-ID: <20250827093320-mutt-send-email-mst@kernel.org>
References: <20250827081231.1878248-1-honglei1.huang@amd.com>
 <9ecf015d-d96a-40ac-a7fb-50e46c4f6e00@collabora.com>
MIME-Version: 1.0
In-Reply-To: <9ecf015d-d96a-40ac-a7fb-50e46c4f6e00@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sKUJEyIjpVLdp-eCFO6ruvoeFQznFyCrVxHHymRPUtU_1756301612
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

On Wed, Aug 27, 2025 at 03:52:05PM +0300, Dmitry Osipenko wrote:
> On 8/27/25 11:12, Honglei Huang wrote:
> > From: Honglei Huang <Honglei1.Huang@amd.com>
> > 
> > Commit 206cc44588f7 ("virtio: reject shm region if length is zero")
> > enhanced the validation in virtio_get_shm_region() by adding a check
> > for a zero-length shared memory region.
> > 
> > It is performed before the underlying transport's .get_shm_region()
> > implementation is called. This creates an issue in the virtio-gpu
> > driver, where the `region` struct is part of a larger structure
> > that is zero-initialized by drmm_kzalloc().
> > 
> > Consequently, the `len` field is 0 at the time of the check, causing
> > virtio_get_shm_region() to return false prematurely. This prevents the
> > host visible memory feature from being enabled, even when the device
> > supports it.
> > 
> > To resolve this, this patch bypasses the inline helper and calls the
> > underlying vdev->config->get_shm_region() function pointer directly.
> > This ensures that the region's parameters are checked only after they
> > have been populated by the transport, aligning with the intended logic.
> > 
> > Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_kms.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > index 7dfb2006c561..ed5981248302 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> > @@ -174,8 +174,10 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
> >  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
> >  		vgdev->has_resource_blob = true;
> >  	}
> > -	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
> > -				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
> > +	if (vgdev->vdev->config->get_shm_region &&
> > +	    vgdev->vdev->config->get_shm_region(
> > +		    vgdev->vdev, &vgdev->host_visible_region,
> > +		    VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
> >  		if (!devm_request_mem_region(&vgdev->vdev->dev,
> >  					     vgdev->host_visible_region.addr,
> >  					     vgdev->host_visible_region.len,
> 
> Hi, virtio_get_shm_region() change has been reverted by [1]. Don't think
> anything else needs to be done.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250827&id=ced17ee32a9988b8a260628e7c31a100d7dc082e
> 
> +cc Michael Tsirkin
> 
> Might be only good to send a stable kernel PR with that revert. I see
> patch available only in linux-next, while stable kernels need to be
> fixed sooner.

sooner than what?

