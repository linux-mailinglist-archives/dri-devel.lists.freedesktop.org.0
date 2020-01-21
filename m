Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 577681436D1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 06:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814AA6EBA6;
	Tue, 21 Jan 2020 05:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F7C6EBA6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 05:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579586035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sCaBPZeEJdT4Pf0kOk3x5es44UV2mktFJpDyLiBTSXo=;
 b=iNo4/UbHDrIf+NefCSUUB8vD2WqRFkzJcb7tQQLHKtmfgq7uowybyjNpwutyarDwp7kUDj
 47c+j6baA/LypBG5g6043qxwJVyNHHgQqZKKW1AOL4RO7TVTlVd/LqnMlV5ttlGDs4Tf7u
 S6pGO8YcxoMMbwssLZ3z5zLhryrifF0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-oRE6kHfxMxCgz2UXM4ClGQ-1; Tue, 21 Jan 2020 00:53:51 -0500
X-MC-Unique: oRE6kHfxMxCgz2UXM4ClGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34ECA800A02;
 Tue, 21 Jan 2020 05:53:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2D718433B;
 Tue, 21 Jan 2020 05:53:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AFC6516E36; Tue, 21 Jan 2020 06:53:48 +0100 (CET)
Date: Tue, 21 Jan 2020 06:53:48 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: wait for references go away
Message-ID: <20200121055348.s4anrveo2z6avin6@sirius.home.kraxel.org>
References: <CGME20200120100025eucas1p21f5e2da0fd7c1fcb33cb47a97e9e645c@eucas1p2.samsung.com>
 <20200120100014.23488-1-kraxel@redhat.com>
 <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d143e43b-8a38-940e-3ae5-e7b830a74bb3@samsung.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 marmarek@invisiblethingslab.com, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > open.  Which can result in drm driver not being able to grab resources
> > (and fail initialization) because the firmware framebuffer still holds
> > them.  Reportedly plymouth can trigger this.
> 
> Could you please describe issue some more?
> 
> I guess that a problem is happening during DRM driver load while fbdev
> driver is loaded? I assume do_unregister_framebuffer() is called inside
> do_remove_conflicting_framebuffers()?

Yes.  Specifically bochs-drm.ko and efifb in virtual machines.

> At first glance it seems to be an user-space issue as it should not be
> holding references on /dev/fb0 while DRM driver is being loaded.

Well, the drm driver is loaded by udev like everything else.

Dunno what plymouth (graphical boot screen tool) does to handle the
situation.  I guess listening to udev events.  So it should notice efifb
going away and drop the /dev/fb0 reference, but this races against
bochs-drm initializing.

> > Fix this by trying to wait until all references are gone.  Don't wait
> > forever though given that userspace might keep the file handle open.
> 
> Where does the 1s maximum delay come from?

Pulled out something out of thin air which I expect being on the safe
side.  plymouth responding on the udev event should need only a small
fraction of that.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
