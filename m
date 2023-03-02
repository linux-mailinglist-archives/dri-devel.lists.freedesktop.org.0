Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A645A6A7BCC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 08:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E48810E386;
	Thu,  2 Mar 2023 07:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43E910E386
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 07:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677741936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iUNoRnZ2khkkla6l3VKfRN3P5S1CmE7QZ6Fs397Sj+8=;
 b=MyGfiTMRhhEp00ztezTabxQAwlS3YkKUTC9NYdyYruuICClZXWW/V3yvZbB2WOqcUN9nwr
 2eoWRTZKnE2YjXl35kRwytAMY5sYm8BjuYtA0SF2Hd/cTjRzeKUe1CeHPAIW2KzrJA//8T
 CKMmNNZGznHZoDIyLNPg1DmbnuGCT5Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-Es-Toy1WPRu27aB2s7YMkw-1; Thu, 02 Mar 2023 02:25:33 -0500
X-MC-Unique: Es-Toy1WPRu27aB2s7YMkw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E787538041C1;
 Thu,  2 Mar 2023 07:25:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 986A7492C3E;
 Thu,  2 Mar 2023 07:25:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3CED71800084; Thu,  2 Mar 2023 08:25:31 +0100 (CET)
Date: Thu, 2 Mar 2023 08:25:31 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v5] drm/virtio: Add option to disable KMS support
Message-ID: <20230302072531.375i6xetk72nis75@sirius.home.kraxel.org>
References: <20230301185432.3010939-1-robdclark@gmail.com>
 <6eb2cde8-f548-73ba-6091-131c1848690c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eb2cde8-f548-73ba-6091-131c1848690c@collabora.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 12:39:33AM +0300, Dmitry Osipenko wrote:
> On 3/1/23 21:54, Rob Clark wrote:
> >  /* virtgpu_display.c */
> > +#if defined(CONFIG_DRM_VIRTIO_GPU_KMS)
> >  int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
> >  void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev);
> > +#else
> > +static inline int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
> > +{
> > +	return 0;
> > +}
> > +static inline void virtio_gpu_modeset_fini(struct virtio_gpu_device *vgdev)
> > +{
> > +}
> > +#endif
> 
> In v4 Gerd wanted to keep building the virtgpu_display.o and instead add
> the KSM config check to virtio_gpu_modeset_init/fini().

The main point is that the code workflow should be the same in both
cases.  The patch does that for virtio_gpu_modeset_init() but doesn't
for virtio_gpu_modeset_fini().

Return early in the functions (and drop the #ifdef here) is how I would
implement this, but I wouldn't insist on that, there are other ways to
solve this too ;)

take care,
  Gerd

