Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BED153ED4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 07:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D9E6F9D2;
	Thu,  6 Feb 2020 06:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6865D6F9D2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 06:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580971424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XebUo49bNGViZWk1x3tbVzqCjVaBGOH4dpQ4jrfUf70=;
 b=fMJlLNz7UjJs9ukXLHmBC25sJeDXeF0tLtH5sMcN3HJOOEInWZDUAZvTTh8OCEiW9oYDX4
 MMUw26Aou8cQUyJx2pcKRjIKlswo1MVsdyY+reaZ0hvDL1ofLo6Rt0UAKsvN638YkVSyNK
 yeR22i3WMV+l8fKf8KW9JM/lq02tniQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-nfSFAOAsPsGxoUg6EfvKSg-1; Thu, 06 Feb 2020 01:43:42 -0500
X-MC-Unique: nfSFAOAsPsGxoUg6EfvKSg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E93A21081FA0;
 Thu,  6 Feb 2020 06:43:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA945C1B0;
 Thu,  6 Feb 2020 06:43:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C9639D7F; Thu,  6 Feb 2020 07:43:38 +0100 (CET)
Date: Thu, 6 Feb 2020 07:43:38 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH 2/4] drm/virtio: resource teardown tweaks
Message-ID: <20200206064338.badm6ijgyo2p5mmc@sirius.home.kraxel.org>
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-3-kraxel@redhat.com>
 <CAPaKu7SCk_3yeTtzFTTU_y-tyo8EDS7vR8i+mk829=0D-UjLQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7SCk_3yeTtzFTTU_y-tyo8EDS7vR8i+mk829=0D-UjLQA@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > -
> > -       drm_gem_shmem_free_object(obj);
> > +       if (bo->created) {
> > +               virtio_gpu_cmd_unref_resource(vgdev, bo);
> > +               /* completion handler calls virtio_gpu_cleanup_object() */
> nitpick: we don't need this comment when virtio_gpu_cmd_unref_cb is
> defined by this file and passed to virtio_gpu_cmd_unref_resource.

I want virtio_gpu_cmd_unref_cb + virtio_gpu_cmd_unref_resource being
placed next to each other so it is easier to see how they work hand in
hand.

> I happen to be looking at our error handling paths.  I think we want
> virtio_gpu_queue_fenced_ctrl_buffer to call vbuf->resp_cb on errors.

/me was thinking about that too.  Yes, we will need either that,
or a separate vbuf->error_cb callback.  That'll be another patch
though.

> > +       /*
> > +        * We are in the release callback and do NOT want refcount
> > +        * bo, so do NOT use virtio_gpu_array_add_obj().
> > +        */
> > +       vbuf->objs = virtio_gpu_array_alloc(1);
> > +       vbuf->objs->objs[0] = &bo->base.base
> This is an abuse of obj array.  Add "void *private_data;" to
> virtio_gpu_vbuffer and use that maybe?

I'd name that *cb_data, but yes, that makes sense.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
