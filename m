Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CE357F1B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 11:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908FE6EA3F;
	Thu,  8 Apr 2021 09:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E456EA41
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617874069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A5IvCnxW0jbdn7IvPVBmPlvnrFHeuHXMc9iT0QRe8gM=;
 b=S06wloffI90P2/gX8Qn9GWd62OLSaMsAQKZc/YTAHlwQPKZgOB6MmSH/52bogRwbiMiDRa
 4jpjQ2DFSAiDTX3RMMdy8vogXvP9kEnwfuhzjVeoOGEfaLjbZvEb44+CDF3bPfFAgEalg8
 H3NpJCtz8lW/O1PitGieDvIYQwVEr9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505--XFVfEn2N5-1N9XforGjpQ-1; Thu, 08 Apr 2021 05:27:45 -0400
X-MC-Unique: -XFVfEn2N5-1N9XforGjpQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BA1283DD22;
 Thu,  8 Apr 2021 09:27:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BBD46A045;
 Thu,  8 Apr 2021 09:27:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F32AA1800604; Thu,  8 Apr 2021 11:27:40 +0200 (CEST)
Date: Thu, 8 Apr 2021 11:27:40 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v2)
Message-ID: <20210408092740.c42sp32hku5d66ec@sirius.home.kraxel.org>
References: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
 <20210406203625.1727955-1-vivek.kasireddy@intel.com>
 <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > +
> > +       if (vgdev->has_resource_blob) {
> > +               params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
> > +               params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
> >
> 
> This creates some log spam with crosvm + virgl_3d + vanilla linux, since
> transfers don't work for guest blobs.  Two options:
> 
> a) Add vgdev->has_virgl_3d check and don't create a guest blob in that case.
> b) The interactions between TRANSFER_TO_HOST_2D and VIRTGPU_BLOB_MEM_GUEST
> are a bit under-defined in the spec.

Indeed.

> Though since you don't have a host
> side resource, you can safely skip the transfer and crosvm can be modified
> to do the right thing in case of RESOURCE_FLUSH.

IIRC the VIRTGPU_BLOB_FLAG_USE_SHAREABLE flag means that the host *can*
create a shared mapping (i.e. the host seeing guest-side changes without
explicit transfer doesn't cause problems for the guest).  It doesn not
mean the host *must* create a shared mapping (note that there is no
negotiation whenever the host supports shared mappings or not).

So the transfer calls are still needed, and the host can decide to
shortcut them in case it can create a shared mapping.  In case there is
no shared mapping (say due to missing udmabuf support) the host can
fallback to copying.

So I think crosvm should be fixed to not consider transfer commands for
VIRTGPU_BLOB_MEM_GUEST resources an error.

> It makes a ton of sense to have a explicit udmabuf-like flag
> ("BLOB_FLAG_CREATE_GUEST_HANDLE" or "BLOB_FLAG_HANDLE_FROM_GUEST" -- want
> to host OS agnostic -- any other ideas?), especially with 3d mode.

Why?  Can't this be simply an host implementation detail which the guest
doesn't need to worry about?

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
