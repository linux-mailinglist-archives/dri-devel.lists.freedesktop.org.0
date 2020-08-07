Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB36523ECFD
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 13:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3A96E0D6;
	Fri,  7 Aug 2020 11:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D75D6E0D6
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 11:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596801432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4OTRM6GItp3LnFcS/b/Uhe1XhDIzGwsKYalbI9Dy4T8=;
 b=C+J9s/vwZFAVYhxdXJUa/fP9i/dV8qCG4Y5bizH23UN+zM7WHJhDrVse7TAbij3wrTOZjU
 XNhmXKnktC9HOIggl5U3y66lhfVOe+veNAMs0Zv/f3t1sVunhAx5O1oLGbwiXUPZsjp8mt
 lVOLuC2TKDeHDwRH0kaIJUIIzSyj0Dg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-x7C4o9zANwWgQB1b1vy1gw-1; Fri, 07 Aug 2020 07:57:10 -0400
X-MC-Unique: x7C4o9zANwWgQB1b1vy1gw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85A3880BCB2;
 Fri,  7 Aug 2020 11:57:07 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC92F87A7A;
 Fri,  7 Aug 2020 11:57:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BEDD7B1A; Fri,  7 Aug 2020 13:57:04 +0200 (CEST)
Date: Fri, 7 Aug 2020 13:57:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Xin He <hexin.op@bytedance.com>
Subject: Re: [PATCH v3] drm/virtio: fix missing dma_fence_put() in
 virtio_gpu_execbuffer_ioctl()
Message-ID: <20200807115704.4epnok7vxwdmemns@sirius.home.kraxel.org>
References: <20200721101647.42653-1-hexin.op@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721101647.42653-1-hexin.op@bytedance.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, Muchun Song <songmuchun@bytedance.com>,
 Qi Liu <liuqi.16@bytedance.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 06:16:47PM +0800, Xin He wrote:
> From: Qi Liu <liuqi.16@bytedance.com>
> 
> We should put the reference count of the fence after calling
> virtio_gpu_cmd_submit(). So add the missing dma_fence_put().

>  	virtio_gpu_cmd_submit(vgdev, buf, exbuf->size,
>  			      vfpriv->ctx_id, buflist, out_fence);
> +	dma_fence_put(&out_fence->f);
>  	virtio_gpu_notify(vgdev);

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
