Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1B596B267
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A01310E66C;
	Wed,  4 Sep 2024 07:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VmRolwsW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABB910E66C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725433811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AqXFL8n+dIt4khrh0GH2lSLGcp3WuiAgJkmy4j+JgOg=;
 b=VmRolwsWsxY3mRIa3J+tEcJ6IP5DrCvLWc5Y+zU5yF+AbZCHEb/U1dPZv3Gk+aZZpvSVr8
 lLH6JL/IaEanmgV+SM7tfJ3RUp38AP03XpsHDURyLTwoSCQbcMCKNo8NIEgIgaWC2r8d49
 rpEIUjIqporFsdc3LK4widY3Wrjrco8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-9QkQgp4WMpOZavV647xCRw-1; Wed,
 04 Sep 2024 03:10:08 -0400
X-MC-Unique: 9QkQgp4WMpOZavV647xCRw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 10D631955D44; Wed,  4 Sep 2024 07:10:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.114])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2AF171956048; Wed,  4 Sep 2024 07:10:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0F4FA1800639; Wed,  4 Sep 2024 09:10:04 +0200 (CEST)
Date: Wed, 4 Sep 2024 09:10:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: David Airlie <airlied@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 1/2] drm/virtio: Defer the host dumb buffer creation
Message-ID: <pbp4kpu2wh25fu54huu62cuydlw5qhhp2r3akx6e6ipff32rrr@yra7qtiub5jr>
References: <20240903075414.297622-1-jfalempe@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240903075414.297622-1-jfalempe@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

  Hi,

> -	} else {
> -		virtio_gpu_cmd_create_resource(vgdev, bo, params,
> -					       objs, fence);
> -		virtio_gpu_object_attach(vgdev, bo, ents, nents);
> +	} else if (params->dumb) {
> +		/* Create the host resource in virtio_gpu_user_framebuffer_create()
> +		 * because the pixel format is not specified yet
> +		 */
> +		bo->ents = ents;
> +		bo->nents = nents;
> +		bo->deferred = true;
>  	}

else {
	return -EINVAL;
}

I think this should not happen, because non-dumb buffers are only
created with virgl being active.  Nevertheless we should catch this
case and return an error, maybe even have a WARN_ONCE() there.

Otherwise looks good to me, so with that fixed:

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

