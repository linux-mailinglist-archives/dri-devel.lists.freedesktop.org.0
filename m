Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2EC95EAC2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 09:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5C910E079;
	Mon, 26 Aug 2024 07:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e9TDfVYL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC410E079
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 07:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724658448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cW5lvmzflYFNRkWrRmvy0V+YAbvTqYSh8nq13SP1Sa0=;
 b=e9TDfVYLKRX0NUjoyvDIBYkvN3HwvKkwgkZqZKmT6FMDU83R68+ksXfsI3H5hciTELQ+7+
 eVuZkR44oBsUC91hFWIH9TDLYkY+m0S9Id9sE07aBeZcY3iRPs3FvCdvjF7Ru/EhCoTs7L
 QzlHpt5LNUvB6zbyVPfXmlNt/DrfDlU=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-cxejlwpKMjmu2NiKQhOrKg-1; Mon,
 26 Aug 2024 03:47:23 -0400
X-MC-Unique: cxejlwpKMjmu2NiKQhOrKg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96C751955D4B; Mon, 26 Aug 2024 07:47:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.20])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9FD641955E8C; Mon, 26 Aug 2024 07:47:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 463251800631; Mon, 26 Aug 2024 09:47:18 +0200 (CEST)
Date: Mon, 26 Aug 2024 09:47:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
Subject: Re: [PATCH 1/2] drm/virtio: Defer the host dumb buffer creation
Message-ID: <vbswvnfsjil52qnz25q4pp6qitceyuacr4lm5t6bddqgs5jzv3@i4mrwchoxvqz>
References: <20240822172338.698922-1-jfalempe@redhat.com>
 <mlqofcqa2yki43bkcl2kq6wfwchmkisnybbadd32khln5tv4ux@u4xuf6gumcqa>
 <6496591e-fa98-49ed-b85e-c76734c25568@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6496591e-fa98-49ed-b85e-c76734c25568@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

On Fri, Aug 23, 2024 at 05:35:39PM GMT, Jocelyn Falempe wrote:
> On 23/08/2024 09:04, Gerd Hoffmann wrote:
> > > +static void virtio_gpu_deferred_create(struct virtio_gpu_object *bo,
> > > +				       struct virtio_gpu_device *vgdev,
> > > +				       const struct drm_mode_fb_cmd2 *mode_cmd)
> > > +{
> > > +	struct virtio_gpu_object_params params = { 0 };
> > > +
> > > +	params.format = virtio_gpu_translate_format(mode_cmd->pixel_format);
> > > +	params.width = mode_cmd->width;
> > > +	params.height = mode_cmd->height;
> > > +	params.size = params.height * params.width * 4;
> > > +	params.size = ALIGN(params.size, PAGE_SIZE);
> > > +	params.dumb = true;
> > 
> > I'd suggest to simply store the complete virtio_gpu_object_params struct
> > in virtio_gpu_object instead of re-creating it here.
> 
> The struct params is much bigger than the struct virtio_gpu_object, so I
> though it would waste too much memory. Using a pointer would add an
> alloc/free pair, and a potential source of memleak. And as we have the
> required parameters in struct drm_mode_fb_cmd2, I found it better this way.

You have to sanity-check the size then.

take care,
  Gerd

