Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F148A89BC3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 13:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56A510E73A;
	Tue, 15 Apr 2025 11:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ga/Jhs0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B354D10E73A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 11:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744715802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kXgMou/l/Hcg5M+ECqP6mWwiyHOFu0lEK+Kiw7ZYzGM=;
 b=ga/Jhs0R3C7+eY9Jm2LSdP91ZI8s4NXkGkuo25pNQ6Tfp57m+zM5TD7CEWIBj5I90H6sVL
 ptzYuNbcprHKYcAylBQT4TiVtSqm4UH0p5LEvbTPrk/J4bJrnNeodzHhe08JDbPR0cFy6j
 Ru06OQ4MUTtaEG5cxopZAi2U0TuE5v0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-_YdZTtXoNc-uIJIP4uXnbw-1; Tue,
 15 Apr 2025 07:16:38 -0400
X-MC-Unique: _YdZTtXoNc-uIJIP4uXnbw-1
X-Mimecast-MFC-AGG-ID: _YdZTtXoNc-uIJIP4uXnbw_1744715796
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 01192180025F; Tue, 15 Apr 2025 11:16:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.44.32.216])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CC78B1801766; Tue, 15 Apr 2025 11:16:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 3B22D18000A3; Tue, 15 Apr 2025 13:16:32 +0200 (CEST)
Date: Tue, 15 Apr 2025 13:16:32 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
 Eric Auger <eauger@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
 dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2] virtgpu: don't reset on shutdown
Message-ID: <ge6675q3ahypfncrwbiodtcjnoftuza6ele5fhre3jmdeifsez@yy53fbwoulgo>
References: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8490dbeb6f79ed039e6c11d121002618972538a3.1744293540.git.mst@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> +{
> +	/*
> +	 * drm does its own synchronization on shutdown.
> +	 * Do nothing here, opt out of device reset.
> +	 */

I think a call to 'drm_dev_unplug()' is what you need here.

take care,
  Gerd

