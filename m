Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEEFB384BF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 16:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAA810E138;
	Wed, 27 Aug 2025 14:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HjIMsAYg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43210E138
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756304283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sgUfxBOpWvR/1fknE7QCUEeu1XgrhJGIUSMRhQLyKfY=;
 b=HjIMsAYgnxtWKHHiQpftFTDe7hKzRRfUiZbe2HOf6sRl2f5yfTs4iyzr0QbmfPy9PxWm0x
 5+P1eT0wGY/tC7iLYy5PL6xVA+chLRaiZD2XEiFB7zbpDChb5P7iglrdyBfV69jpNZTwyG
 /GizUv3z28LTK5v/XsideVWA6oMSnlk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-PKWMhPB6PIaBsDApUft3FA-1; Wed, 27 Aug 2025 10:18:02 -0400
X-MC-Unique: PKWMhPB6PIaBsDApUft3FA-1
X-Mimecast-MFC-AGG-ID: PKWMhPB6PIaBsDApUft3FA_1756304281
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a1b0098c0so47356305e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 07:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756304281; x=1756909081;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sgUfxBOpWvR/1fknE7QCUEeu1XgrhJGIUSMRhQLyKfY=;
 b=mqjANbyXK6a+FBAiSRPXlfAqPAICj7KQCdOiODcwZU5KEK5K5FIljPWpjCEsPa4HGf
 nV5q5im8L1gm5yze6GJZwqrZaXfh4jzmig9uaODDypvSBwRIpHZUga52/yBbLccacW/U
 9E3sTILqwH+KS4PGxvxeCweuuaNMblbCwyByOJLe7wdf5to2U3vjqN83uaBd6nJ8xnHx
 kThRe8Ulg8abP2+oczxkoXkdiWZp3kMvvHUHjCSJ26AEXLXsRiPo17Hqznq+9Ghcocu0
 /RHOI3LAkulY1vrIiD+dnKeeSwGvn9cecxIPe+owLar721GBPbtqgMLKQPRNP6xZ1wys
 i55w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP1ugPDrNI2gmGYDAP8h8tWNsScQ8N9LybJhv0Ugni0PvMy3NI5G+ecQW0joQ4MxQZEvcDSRRXCr8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVwxg7vYEB2gTh9C0+TIRoQzaQLuiydeM4k42keRESQ3UDH0wW
 b0QPxnfsrxHYpY+7kFgL3Xdp9sM0z7bdWo8bdrOeNRmaqAYjX/JNePJVXz4VZcZonmp/lEArScE
 cH3auoaMzV0DV106xcx6a42ld3hrRq0uLn6MiOXGow6q3FpYmril8I5KcCnbseVgZHsUajA==
X-Gm-Gg: ASbGncuDq53wGo9PhZ6jripwlB8uIFRjFLI+QMros3Oo1hHnCFyVjtuq2Q/M30i6HkN
 XSmKvoHJxqA9hQNLINfgmO2ZlORAxXGEJYnHjc0+4MawsLCC8A6b6VCgNLYY3IP/CZl+kDCGCJY
 4KY1qSEZAu7FyMnQ0FD+e2+pJT3pTfVtCfUQdNd7H1DrzokEuVmKsKLjLaB7HNTllnq+U0c/68r
 bgXVM0zL7rrMADfP+H0nD+GUXgWkUyaXpqwlp5qC2ArnxDndC436CtJHgqay4seCjnp6HghOSny
 eqnHNSr8F78zISPmjAUh4XPTzFnfrfg=
X-Received: by 2002:a05:600c:45d4:b0:458:f70d:ebdd with SMTP id
 5b1f17b1804b1-45b5179eb97mr244030755e9.16.1756304280881; 
 Wed, 27 Aug 2025 07:18:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbZR9PVQfnxpyO9iPgY1rrQVw+ltDuzZUlf8dML5LjizH06Bt+gcbs14ArI6vFUc4IVe70XQ==
X-Received: by 2002:a05:600c:45d4:b0:458:f70d:ebdd with SMTP id
 5b1f17b1804b1-45b5179eb97mr244030425e9.16.1756304280434; 
 Wed, 27 Aug 2025 07:18:00 -0700 (PDT)
Received: from redhat.com ([185.137.39.233]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ca6240b4ecsm10592154f8f.43.2025.08.27.07.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 07:17:59 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:17:55 -0400
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
Message-ID: <20250827101732-mutt-send-email-mst@kernel.org>
References: <20250827081231.1878248-1-honglei1.huang@amd.com>
 <9ecf015d-d96a-40ac-a7fb-50e46c4f6e00@collabora.com>
 <20250827093320-mutt-send-email-mst@kernel.org>
 <c38fb2bf-15c4-4cee-be0e-59d998cd03ac@collabora.com>
MIME-Version: 1.0
In-Reply-To: <c38fb2bf-15c4-4cee-be0e-59d998cd03ac@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bc9i7zn_cbwzDLEg0wpHDY_DDD79vooyEIcsOU2TKrQ_1756304281
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

On Wed, Aug 27, 2025 at 04:51:37PM +0300, Dmitry Osipenko wrote:
> On 8/27/25 16:33, Michael S. Tsirkin wrote:
> > On Wed, Aug 27, 2025 at 03:52:05PM +0300, Dmitry Osipenko wrote:
> >> On 8/27/25 11:12, Honglei Huang wrote:
> >>> From: Honglei Huang <Honglei1.Huang@amd.com>
> >>>
> >>> Commit 206cc44588f7 ("virtio: reject shm region if length is zero")
> >>> enhanced the validation in virtio_get_shm_region() by adding a check
> >>> for a zero-length shared memory region.
> >>>
> >>> It is performed before the underlying transport's .get_shm_region()
> >>> implementation is called. This creates an issue in the virtio-gpu
> >>> driver, where the `region` struct is part of a larger structure
> >>> that is zero-initialized by drmm_kzalloc().
> >>>
> >>> Consequently, the `len` field is 0 at the time of the check, causing
> >>> virtio_get_shm_region() to return false prematurely. This prevents the
> >>> host visible memory feature from being enabled, even when the device
> >>> supports it.
> >>>
> >>> To resolve this, this patch bypasses the inline helper and calls the
> >>> underlying vdev->config->get_shm_region() function pointer directly.
> >>> This ensures that the region's parameters are checked only after they
> >>> have been populated by the transport, aligning with the intended logic.
> >>>
> >>> Signed-off-by: Honglei Huang <Honglei1.Huang@amd.com>
> >>> ---
> >>>  drivers/gpu/drm/virtio/virtgpu_kms.c | 6 ++++--
> >>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> >>> index 7dfb2006c561..ed5981248302 100644
> >>> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> >>> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> >>> @@ -174,8 +174,10 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
> >>>  	if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_BLOB)) {
> >>>  		vgdev->has_resource_blob = true;
> >>>  	}
> >>> -	if (virtio_get_shm_region(vgdev->vdev, &vgdev->host_visible_region,
> >>> -				  VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
> >>> +	if (vgdev->vdev->config->get_shm_region &&
> >>> +	    vgdev->vdev->config->get_shm_region(
> >>> +		    vgdev->vdev, &vgdev->host_visible_region,
> >>> +		    VIRTIO_GPU_SHM_ID_HOST_VISIBLE)) {
> >>>  		if (!devm_request_mem_region(&vgdev->vdev->dev,
> >>>  					     vgdev->host_visible_region.addr,
> >>>  					     vgdev->host_visible_region.len,
> >>
> >> Hi, virtio_get_shm_region() change has been reverted by [1]. Don't think
> >> anything else needs to be done.
> >>
> >> [1]
> >> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250827&id=ced17ee32a9988b8a260628e7c31a100d7dc082e
> >>
> >> +cc Michael Tsirkin
> >>
> >> Might be only good to send a stable kernel PR with that revert. I see
> >> patch available only in linux-next, while stable kernels need to be
> >> fixed sooner.
> > 
> > sooner than what?
> 
> Next 6.17 kernel release. I see patch in the linux-next branch. Often
> there is a -fixes branch for patches that go into RC kernel, but I don't
> see one in your vhost kernel tree. Will the revert land into 6.17-rc4?
> Everything is good if yes.

Should go into rc4 or rc5, yes.


> -- 
> Best regards,
> Dmitry

