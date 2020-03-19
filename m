Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D21118B1EC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 12:02:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529546E270;
	Thu, 19 Mar 2020 11:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D116B6E270
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584615757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wv0CIJUyl8keYTWgcuAGZ94Xhx3biDTfmG+KzaIIjzY=;
 b=Z35VKlFhVBqxLyCfBzP7jz54Ryns9E4tDd2xm+Tu4koDAKWDTsSuSz8rlTEgJA2E2e9K7m
 Zc/dcw+/McxxrNe1RcuA3APHFGVQ5vds8xvFWo82nsVh3pK7UgKrwYoxLagThzVZ9Al/Hg
 I6wN20bTo0rsxtjOVP2IHS8/RqDTFlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-1-_FJnZKOjStqy_fyQIQYQ-1; Thu, 19 Mar 2020 07:02:33 -0400
X-MC-Unique: 1-_FJnZKOjStqy_fyQIQYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A93E18C8C02;
 Thu, 19 Mar 2020 11:02:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 239CB5C1D8;
 Thu, 19 Mar 2020 11:02:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4973E3BD; Thu, 19 Mar 2020 12:02:30 +0100 (CET)
Date: Thu, 19 Mar 2020 12:02:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH] drm/virtio: fix OOB in virtio_gpu_object_create
Message-ID: <20200319110230.rxezuk3ex5fbov3f@sirius.home.kraxel.org>
References: <20200319100421.16267-1-jslaby@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319100421.16267-1-jslaby@suse.cz>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 11:04:21AM +0100, Jiri Slaby wrote:
> After commit f651c8b05542, virtio_gpu_create_object allocates too small
> space to fit everything in. It is because it allocates struct
> virtio_gpu_object, but should allocate a newly added struct
> virtio_gpu_object_shmem which has 2 more members.
> 
> So fix that by using correct type in virtio_gpu_create_object.
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Fixes: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>

That was fast.  Yes, exactly this.  Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
