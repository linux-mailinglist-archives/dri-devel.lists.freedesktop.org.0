Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E1715D42C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11AB46F8C8;
	Fri, 14 Feb 2020 08:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B6D6F8C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581670656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hcSjZSHLEnp5ZLdnGZuQU+ROR/fBtg18iFgXLEAHrB0=;
 b=Y+26kEEor5Qn+3LZPON6IcQyu1ZLkI64AL1WJ81+LqdvRFu7n/oiHgxKXj5fuf043WIoip
 R2J0DYUO4zHVVvJ8RRmo4spiFykc+3p1UVsRw2Kqg40I+DFbEei9WrMBAwewKdIysVJ8Fs
 No4NjWxfQ9F5Ywk+K8t+4rQkiPEhq1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-o3cQdsa8OY63VP8hprtgPg-1; Fri, 14 Feb 2020 03:57:31 -0500
X-MC-Unique: o3cQdsa8OY63VP8hprtgPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8561801E67;
 Fri, 14 Feb 2020 08:57:29 +0000 (UTC)
Received: from gondolin (dhcp-192-195.str.redhat.com [10.33.192.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DD215DA88;
 Fri, 14 Feb 2020 08:57:25 +0000 (UTC)
Date: Fri, 14 Feb 2020 09:57:23 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: fix error check
Message-ID: <20200214095723.0c489524.cohuck@redhat.com>
In-Reply-To: <20200214080100.1273-1-kraxel@redhat.com>
References: <20200214080100.1273-1-kraxel@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>, smitterl@redhat.com,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, "open
 list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Feb 2020 09:01:00 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

> The >= compare op must happen in cpu byte order, doing it in
> little endian fails on big endian machines like s390.
> 
> Reported-by: Sebastian Mitterle <smitterl@redhat.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_vq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index cfe9c54f87a3..67caecde623e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -222,7 +222,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
>  		trace_virtio_gpu_cmd_response(vgdev->ctrlq.vq, resp);
>  
>  		if (resp->type != cpu_to_le32(VIRTIO_GPU_RESP_OK_NODATA)) {
> -			if (resp->type >= cpu_to_le32(VIRTIO_GPU_RESP_ERR_UNSPEC)) {
> +			if (le32_to_cpu(resp->type) >= VIRTIO_GPU_RESP_ERR_UNSPEC) {
>  				struct virtio_gpu_ctrl_hdr *cmd;
>  				cmd = virtio_gpu_vbuf_ctrl_hdr(entry);
>  				DRM_ERROR_RATELIMITED("response 0x%x (command 0x%x)\n",

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Endianness continues to be fun.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
