Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A983178C11
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 09:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2B46E12D;
	Wed,  4 Mar 2020 08:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE106E12D
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583308890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRcprHlNKHf2Y4uTuJshwgaM2L8IjHdUUjSNLW2L6Ws=;
 b=bPwA8DVqIel19xIFS+Lv+tYYa3kWiC8Wg2rvyRBuIAevGcB24yAEQvFpIawPMFgIiCxccu
 BBqYLyxBz3HrNIkqegElhvCZBIJWsso/oxCfMeiaAwYG3ckzaoJfZstUXCjGNSqxvIJGGT
 ofIhqOAxfQyHVSkDefKbIaZh1H/OA7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-7VMskJu9NeKxqy4Gs6rfng-1; Wed, 04 Mar 2020 03:01:26 -0500
X-MC-Unique: 7VMskJu9NeKxqy4Gs6rfng-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8551801E5C;
 Wed,  4 Mar 2020 08:01:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B825D1BC6D;
 Wed,  4 Mar 2020 08:01:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0266617506; Wed,  4 Mar 2020 09:01:20 +0100 (CET)
Date: Wed, 4 Mar 2020 09:01:19 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v2 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200304080119.i55opxkhk4kdt4hp@sirius.home.kraxel.org>
References: <20200302121524.7543-1-stevensd@chromium.org>
 <20200302121524.7543-5-stevensd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302121524.7543-5-stevensd@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> +	if (vgdev->has_resource_assign_uuid) {
> +		spin_lock(&vgdev->resource_export_lock);
> +		if (bo->uuid_state == UUID_NOT_INITIALIZED) {
> +			bo->uuid_state = UUID_INITIALIZING;
> +			needs_init = true;
> +		}
> +		spin_unlock(&vgdev->resource_export_lock);
> +
> +		if (needs_init) {
> +			ret = virtio_gpu_cmd_resource_assign_uuid(vgdev, bo);

You can submit a fenced command, then wait on the fence here.  Removes
the need for UUID_INITIALIZING.

Also note that this function will be called only once, on the first
export.  When exporting the same object again drm will simply reuse
the existing dmabuf.  You can drop UUID_NOT_INITIALIZED and needs_init.

So you are left with only two uuid_state states.  You could turn uuid
into a pointer, so it gets only allocated when needed.  Also uuid ==
NULL can be used for "uuid not available" then.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
