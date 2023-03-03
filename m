Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8006A91B2
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 08:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECF410E032;
	Fri,  3 Mar 2023 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335E310E032
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Mar 2023 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677828432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Au2NkNrNK1UjGjHlvSvRzl5tANm09oMF2vYOqqREeHg=;
 b=Z/t58rc5eB+DPfyHdeZrEwVVHQqt/8Z9Xc3t4RO9OXmS1PHmXmTP2pIXhXX2jd7jVOn5vT
 XRJrj8KJXTglV77LamRDIk+mVJNXngKO26T3YquzoY9R7IzeJ39kquCO/pLgqoHnacffvG
 +tl6NJjfji6+tyNOg1z8u9cvvxpvxmQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-lliOLg0vNIuyRkidgYjJqw-1; Fri, 03 Mar 2023 02:27:08 -0500
X-MC-Unique: lliOLg0vNIuyRkidgYjJqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEC503C02536;
 Fri,  3 Mar 2023 07:27:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F632166B26;
 Fri,  3 Mar 2023 07:27:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AC9B2180061F; Fri,  3 Mar 2023 08:27:05 +0100 (CET)
Date: Fri, 3 Mar 2023 08:27:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v6] drm/virtio: Add option to disable KMS support
Message-ID: <20230303072705.55fbvt4c4uu4i2i7@sirius.home.kraxel.org>
References: <20230302233506.3146290-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302233506.3146290-1-robdclark@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryan Neph <ryanneph@chromium.org>, David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 03:35:06PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add a build option to disable modesetting support.  This is useful in
> cases where the guest only needs to use the GPU in a headless mode, or
> (such as in the CrOS usage) window surfaces are proxied to a host
> compositor.
> 
> As the modesetting ioctls are a big surface area for potential security
> bugs to be found (it's happened in the past, we should assume it will
> again in the future), it makes sense to have a build option to disable
> those ioctls in cases where they serve no legitimate purpose.
> 
> v2: Use more if (IS_ENABLED(...))
> v3: Also permit the host to advertise no scanouts
> v4: Spiff out commit msg
> v5: Make num_scanouts==0 and DRM_VIRTIO_GPU_KMS=n behave the same
> v6: Drop conditionally building virtgpu_display.c and early-out of
>     it's init/fini fxns instead

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

