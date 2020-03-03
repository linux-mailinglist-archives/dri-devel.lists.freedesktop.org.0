Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA0F177357
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 11:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F006E9AF;
	Tue,  3 Mar 2020 10:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 648D26E9AF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583229685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTd5NDHMUSVuf/ugLcITAyo69rj+nd8ODP5uU/a8J1M=;
 b=MJWanF3Fczlg8nGb45rqJjwzbt7vnNRbQodz88Tx91fYUDSRIc1Xc7M5evL/l2SEjeCiFD
 HIB3jcweB8Mh+at/DZS+iViIBFMh0BZ1C0rxas0q/1xEj4XoTVqbwfZ3LALpnM1S2oB/fV
 dA5JgrXEcI82U5YjjVUVxGPltoZUQUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-e6pDA2f_PuWrNOebknOXvg-1; Tue, 03 Mar 2020 05:01:23 -0500
X-MC-Unique: e6pDA2f_PuWrNOebknOXvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF6641403;
 Tue,  3 Mar 2020 10:01:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5610260BF3;
 Tue,  3 Mar 2020 10:01:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5EC3C17449; Tue,  3 Mar 2020 11:01:21 +0100 (CET)
Date: Tue, 3 Mar 2020 11:01:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 2/2] drm/virtio: make sure virtio_gpu_cleanup_object(..)
 only happens on shmem objects
Message-ID: <20200303100121.ueqfyfecvmzqt6gw@sirius.home.kraxel.org>
References: <20200303014010.418-1-gurchetansingh@chromium.org>
 <20200303014010.418-2-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200303014010.418-2-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> This function won't be useable for hostmem objects.

> @@ -526,7 +526,8 @@ static void virtio_gpu_cmd_unref_cb(struct virtio_gpu_device *vgdev,
>  	bo = vbuf->resp_cb_data;
>  	vbuf->resp_cb_data = NULL;
>  
> -	virtio_gpu_cleanup_object(bo);
> +	if (bo && virtio_gpu_is_shmem(bo))
> +		virtio_gpu_cleanup_object(bo);

Its not that simple, the virtio_gpu_resource_id_put() call in
virtio_gpu_cleanup_object() is needed for all objects.  We also
must free all objects.

I'd suggest to move the virtio_gpu_is_shmem() check to
virtio_gpu_cleanup_object().

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
