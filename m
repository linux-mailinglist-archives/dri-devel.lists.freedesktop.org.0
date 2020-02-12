Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0792A15A4EE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 10:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FBC6E330;
	Wed, 12 Feb 2020 09:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBC26E330
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581500151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Co8sI2fabCgvVIAdRsnaywT6jDF6jkLMvIt7c5U+e2k=;
 b=HOsohDmKIpWVXo3nTz1n6nbguz1/epD8I/8KMiwh0nY0drVtNy236X+FzzHBhKMS5V9aCc
 2g2zNqUx5gBJv0QVvFxOMeO2Y4A+Z4JjeW8Oi4lj60oYzjtf5gijaroTXqHNKMZOFvW91D
 IpTMmVtVrRLNJZSDiVvxWmInjq2QSS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-KA2V6KLsMOaMd2oUQYkYQQ-1; Wed, 12 Feb 2020 04:35:45 -0500
X-MC-Unique: KA2V6KLsMOaMd2oUQYkYQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5C68017DF;
 Wed, 12 Feb 2020 09:35:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ACBE60BF4;
 Wed, 12 Feb 2020 09:35:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 937FE9D6B; Wed, 12 Feb 2020 10:35:43 +0100 (CET)
Date: Wed, 12 Feb 2020 10:35:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, olvaffe@gmail.com,
 gurchetansingh@chromium.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/virtio: add drm_driver.release callback.
Message-ID: <20200212093543.qg4j2nk5wxlii7wr@sirius.home.kraxel.org>
References: <20200211135805.24436-1-kraxel@redhat.com>
 <20200211142711.GE2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211142711.GE2363188@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 11, 2020 at 03:27:11PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 02:58:04PM +0100, Gerd Hoffmann wrote:
> > Split virtio_gpu_deinit(), move the drm shutdown and release to
> > virtio_gpu_release().  Drop vqs_ready variable, instead use
> > drm_dev_{enter,exit,unplug} to avoid touching hardware after
> > device removal.  Tidy up here and there.
> > 
> > v4: add changelog.
> > v3: use drm_dev_*().
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Looks reasonable I think.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I didn't review whether you need more drm_dev_enter/exit pairs, virtio is
> a bit more complex for that and I have no idea how exactly it works.

virtio uses two rings to send commands to the device, one to move the
cursor and one for everything else.  So pretty much everything ends up
calling either this ...

> > @@ -330,7 +330,14 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,

... or this ...

> > @@ -460,12 +460,13 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,

... to submit some request to the (virtual) hardware.  Therefore we
don't need many drm_dev_enter/exit pairs to cover everything ;)

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
