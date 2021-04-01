Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079D350F68
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 08:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DC66E0B7;
	Thu,  1 Apr 2021 06:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3F76EC77
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617260010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LHAVwjBwtUSuc/zdLQ16dA3yChcpVz+t628IKe/5mcQ=;
 b=iuZAjGa+35hYtR6NgNlVzObGk4C50Ii5KAGR7zleFifiUpk2nYe6FGzln/7yxHENWGEQJl
 kjZM4PWd1wvgE5M3RMRqnFjt8YRMlsr8yJ5InkqaHDzjz9xRn/IgZZxOTOjn6CVFAyTVsv
 5owu3wyuuxUIrLxDdRIhNo0OKRPjFr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-B3xTsBeZMTeJAk1JILV7aQ-1; Thu, 01 Apr 2021 02:53:28 -0400
X-MC-Unique: B3xTsBeZMTeJAk1JILV7aQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8160190B2A1;
 Thu,  1 Apr 2021 06:53:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-142.ams2.redhat.com
 [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83A1A10013D7;
 Thu,  1 Apr 2021 06:53:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A99A718007A4; Thu,  1 Apr 2021 08:53:24 +0200 (CEST)
Date: Thu, 1 Apr 2021 08:53:24 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/2] drm/virtio: Create Dumb BOs as guest Blobs
Message-ID: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
 <20210331074149.jdvbdbvyilzfk6ua@sirius.home.kraxel.org>
 <db7373214e15407fa0203cf10dc996e7@intel.com>
MIME-Version: 1.0
In-Reply-To: <db7373214e15407fa0203cf10dc996e7@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > No.  VIRTGPU_BLOB_FLAG_USE_SHAREABLE means the host (aka device in virtio
> > terms) *can* create a shared mapping.  So, the guest sends still needs to send transfer
> > commands, and then the device can shortcut the transfer commands on the host side in
> > case a shared mapping exists.
> [Kasireddy, Vivek] Ok. IIUC, are you saying that the device may or may not create a shared
> mapping (meaning res->image) and that the driver should not make any assumptions about
> that and thus still do the transfers and flushes?

Yes.

> Also, could you please briefly explain what does
> VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE mean given that the spec does not
> describe these blob_flags clearly? This is what the spec says:

This matters for VIRTIO_GPU_BLOB_MEM_HOST3D resources only.
VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE indicates the guest wants map the
resource for cpu access.  When the flag is not set only gpu access is
needed.

> And, what should be the default blob_flags value for a dumb bo if the
> userspace does not specify them?

Just VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE is fine for
VIRTIO_GPU_BLOB_MEM_GUEST.

> [Kasireddy, Vivek] With the patches I tested with:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg09786.html

Saw the series, not looked in detail yet.

> I noticed that if we do not have res->image and only have res->blob, we have to 
> re-submit the blob/dmabuf and update the displaysurface if guest made updates to it 
> (in this case same FB)

flush must call dpy_gfx_update() or dpy_gl_update().

Oh, and make sure you use qemu master (or 6.0-rc).  In 5.2 + older
display updates might not work properly due to a missing glFlush()
in qemu.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
