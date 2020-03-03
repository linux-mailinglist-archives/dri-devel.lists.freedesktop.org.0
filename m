Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C68177330
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 10:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0F16E53C;
	Tue,  3 Mar 2020 09:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A66C6E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 09:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583229414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+sIW/sN4YO+XlskqgK7oeZFYXwdwxFuk8WSkCG0QPs=;
 b=GnqjqdMDgK1rzOkU5fr9juVsdFE5lAWmcFcTYibxuWGqvKaltbKbAA9sJi8dJnTPWDE2Wh
 cUmIg88WaWJR+BROCblPE7i9UqKs0mrZOoCKamcp6Rp/oLmCqO/p/+jbWlwXxIRi97LuhC
 9PO6tCFipr5iw9Fdb8glFwRb5YoQQjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-MjhZEZ2CNRePiOtSNJbkkw-1; Tue, 03 Mar 2020 04:56:53 -0500
X-MC-Unique: MjhZEZ2CNRePiOtSNJbkkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C613107ACC4;
 Tue,  3 Mar 2020 09:56:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CFA35C1D6;
 Tue,  3 Mar 2020 09:56:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB63517449; Tue,  3 Mar 2020 10:56:50 +0100 (CET)
Date: Tue, 3 Mar 2020 10:56:50 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH 1/2] drm/virtio: factor out the sg_table from
 virtio_gpu_object
Message-ID: <20200303095650.2q477cboekzfsrsg@sirius.home.kraxel.org>
References: <20200303014010.418-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200303014010.418-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

  Hi,

>  struct virtio_gpu_object {
>  	struct drm_gem_shmem_object base;
>  	uint32_t hw_res_handle;
> -
> -	struct sg_table *pages;
>  	uint32_t mapped;
> -
>  	bool dumb;
>  	bool created;
>  };
>  #define gem_to_virtio_gpu_obj(gobj) \
>  	container_of((gobj), struct virtio_gpu_object, base.base)
>  
> +struct virtio_gpu_object_shmem {
> +	struct virtio_gpu_object base;
> +	struct sg_table *pages;
> +};

mapped can be moved too.

> @@ -600,10 +600,11 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,

> +	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);

Should we pass struct virtio_gpu_object_shmem to
virtio_gpu_cmd_transfer_to_host_2d (+friends) instead?

hostmem will not need transfers ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
