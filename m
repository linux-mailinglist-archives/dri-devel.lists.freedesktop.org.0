Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AB237A4BC
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 12:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3816EA14;
	Tue, 11 May 2021 10:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9276EA14
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620729616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZTzDOjuD7bW4lQHT2trl7MddZkl9dAyx217HECxuLA=;
 b=T5qNfjsd7NwwWQIwWHIay+TatHX2XjgY8YJ7LienmjceyTBE2eyUMMul43mj17VMaNZmHx
 9ZQB8Bf8UMHa7yW1qFCzruc4ZIt+ivNQ76Bqtl/t2oKkngLjjiABpHSRrT0rDirZzFXR0Q
 QrXj3HKSalKnJo/SsGmyaQnNmI34M7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-z-qruNixPcWkZdamsBqEtQ-1; Tue, 11 May 2021 06:40:14 -0400
X-MC-Unique: z-qruNixPcWkZdamsBqEtQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37FD0107ACC7;
 Tue, 11 May 2021 10:40:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E190460CC9;
 Tue, 11 May 2021 10:40:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 272971800876; Tue, 11 May 2021 12:40:11 +0200 (CEST)
Date: Tue, 11 May 2021 12:40:11 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tina Zhang <tina.zhang@intel.com>
Subject: Re: [PATCH RFC 3/3] drm/virtio: Include modifier as part of
 set_scanout_blob
Message-ID: <20210511104011.dx3x3jr3i22wpjoz@sirius.home.kraxel.org>
References: <20210511014940.2067715-1-tina.zhang@intel.com>
 <20210511014940.2067715-4-tina.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210511014940.2067715-4-tina.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -420,6 +420,7 @@ struct virtio_gpu_set_scanout_blob {
>  	__le32 padding;
>  	__le32 strides[4];
>  	__le32 offsets[4];
> +	__le64 modifier;
>  };

All protocol changes (uapi/linux/virtio_gpu.h updates) should go to a
separate patch (best first in the series).  A feature flag is needed to
signal whenever modifier support is available or not.  The code needs to
cake care to not send the modifier field in case the host doesn't
support it.  Naming the modifier field "drm_modifier" is probably a good
idea to make clear that we'll use the drm modifier as-is.

A virtio-spec update is needed to document the protocol update.

take care,
  Gerd

