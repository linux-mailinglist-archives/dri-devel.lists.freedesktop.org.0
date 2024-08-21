Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D395993D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 13:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498D810E8D3;
	Wed, 21 Aug 2024 11:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fLQsFMr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B2F10E8D3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724238788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/SDEBiyKRt2AqbyfyUW10WSpqwacT1LCU6PVt4AZSwU=;
 b=fLQsFMr/dNEHWS9LucIyNkqugHs81yf/FJ2pOGPPewqCtPsyyg1vToAbNSMYFBTQ99GAQc
 svIKDkwI0Dw7ZEtuQEULvaAgEGSUB1vOIJ37B6jF08rFqMeg2IbdP0cxltWMarsHR7AZMf
 0OpvLIFTucylmH7+BY7roWgrt9f2AL4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-449-t639QBg8Nm2YgEOIhDQ69g-1; Wed,
 21 Aug 2024 07:13:02 -0400
X-MC-Unique: t639QBg8Nm2YgEOIhDQ69g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 316EF1955BFC; Wed, 21 Aug 2024 11:13:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1AA17300019C; Wed, 21 Aug 2024 11:13:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D8E3A18011E8; Wed, 21 Aug 2024 13:12:57 +0200 (CEST)
Date: Wed, 21 Aug 2024 13:12:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 virtualization@lists.linux.dev, Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/2] drm/virtio: Use XRGB8888 also for big endian
 systems
Message-ID: <2734s7h2c4tbtwzdlijbf7u3fvdcqtlcdipamsf4pf6jgx2slt@aq5bm3fuqgkz>
References: <20240820090908.151042-1-jfalempe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240820090908.151042-1-jfalempe@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
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

On Tue, Aug 20, 2024 at 11:07:40AM GMT, Jocelyn Falempe wrote:
> Mesa doesn't support BGRX8888, that means most wayland compositors
> don't work on big endian guests.

So you are doing a hard switch from native endian to little endian.

While this should be fine for modern userspace API (aka ADDFB2 ioctl) it
is not for older APIs (ADDFB ioctl, also fbdev emulation) where only
depth=32 is specified and userspace typically expects a framebuffer in
native byte order.

Ideally virtio-gpu would support both big endian and little endian
framebuffer formats (simliar to bochs drm driver).  That probably is a
somewhat more invasive change because the DRM_IOCTL_MODE_CREATE_DUMB
doesn't tell use the format which will be used.  Possible options I see:

  (1) Be lazy on creating host resources, i.e. call
      virtio_gpu_cmd_create_resource() not at DRM_IOCTL_MODE_CREATE_DUMB
      time but later when the resource will be actually be used (and
      specifically after DRM_IOCTL_MODE_ADDFB(2) ioctl so we know the
      format).  Needs additional state tracking (whenever the resource
      has been created or not) in possibly lots of places.

  (2) Support changing the resource format, i.e. in case
      DRM_IOCTL_MODE_ADDFB(2) is called with a format different from the
      current one go through a destroy-and-recreate cycle for the host
      resource.  Might have tricky corner cases (resource being in use
      when DRM_IOCTL_MODE_ADDFB(2) is called).

HTH & take care,
  Gerd

