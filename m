Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C38934FAF9
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 10:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 218756EA19;
	Wed, 31 Mar 2021 08:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8F86EA05
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 08:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617177603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=45sJ9S4Q1vaoHTtSVWh3T+mXLQSWcTe7LD2KDBkrHN4=;
 b=e72PQYq4gE+/6z5mUgaMvufBOzNdixagFpv2Vr+55/RrcpWrgamLx7heYrOTU3ubHYZVNa
 WtTdrYxMIQltHmKJ2b0442kjAwF32lL6encQASsIXoN4IhUtnufBg59dOArnpNGUzckL9Z
 aBauf13xpB4SaSabgbMDDJ154r0Rc/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-j9qkkGViOdem8c0DW-I5GQ-1; Wed, 31 Mar 2021 04:00:02 -0400
X-MC-Unique: j9qkkGViOdem8c0DW-I5GQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2722D8030DD;
 Wed, 31 Mar 2021 08:00:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2672179E6;
 Wed, 31 Mar 2021 07:59:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 507431800842; Wed, 31 Mar 2021 09:59:58 +0200 (CEST)
Date: Wed, 31 Mar 2021 09:59:58 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/2] drm/virtio: Include modifier as part of
 set_scanout_blob
Message-ID: <20210331075958.ax4rqedbebnoad6x@sirius.home.kraxel.org>
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
 <20210331030439.1564032-2-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210331030439.1564032-2-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
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
Cc: dri-devel@lists.freedesktop.org, gurchetansingh@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> -#define MAX_INLINE_CMD_SIZE   96
> +#define MAX_INLINE_CMD_SIZE   112

Separate patch please.

> --- a/include/uapi/linux/virtio_gpu.h
> +++ b/include/uapi/linux/virtio_gpu.h
> @@ -409,6 +409,7 @@ struct virtio_gpu_set_scanout_blob {
>  	__le32 width;
>  	__le32 height;
>  	__le32 format;
> +	__le64 modifier;
>  	__le32 padding;
>  	__le32 strides[4];
>  	__le32 offsets[4];

Nope.  This breaks the virtio protocol.

We'll need a virtio feature flag to negotiate modifier support between
guest and host.  When supported by both sides it can be used.  The new
field should be appended, not inserted in the middle.  Or we create a
new virtio_gpu_set_scanout_blob2 struct with new command for this.

Also: I guess the device should provide a list of supported modifiers,
maybe as capset?

Note: I think it is already possible to create resources with modifiers
when using virgl commands for that.  Allowing modifiers with virgl=off
too makes sense given your use case, but we should not use diverging
approaches for virgl=on vs. virgl=off.  Specifically I'm not sure
virtio_gpu_set_scanout_blob is the right place, I think with virgl=on
the modifier is linked to the resource not the scanout ...

Cc'ing Gurchetan Singh for comments.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
