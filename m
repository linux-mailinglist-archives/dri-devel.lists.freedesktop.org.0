Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D130127B6D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 14:01:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62756E056;
	Fri, 20 Dec 2019 13:00:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75A96EC28
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576846856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xeUreLt6va9L8SCH3nGSjnsigirIJ1dymwMuYGQ0eIA=;
 b=NcQOfR11QuPp6kxffQd2TfkSQYi9QxwyD2nT1CBQQ+srrqpbWhwkgA7Mzi1aIgLDEPBd+r
 uWziCK+aXV8WSedAH/HDbcz9vyNuXXfcKbbiCu2VNNeLyfHDdCADOtnWLokzkLDR5LiMDx
 Bv0XpxoWAy+b6unHePofHkrF7CJ2wOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-x_iIbmquNkeT2-BPzY-dDA-1; Fri, 20 Dec 2019 08:00:45 -0500
X-MC-Unique: x_iIbmquNkeT2-BPzY-dDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF8728024DB;
 Fri, 20 Dec 2019 13:00:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B59CE70383;
 Fri, 20 Dec 2019 13:00:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 638F69DA5; Fri, 20 Dec 2019 14:00:25 +0100 (CET)
Date: Fri, 20 Dec 2019 14:00:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Frediano Ziglio <fziglio@redhat.com>
Subject: Re: [Spice-devel] [PATCH 4/4] drm/qxl: add drm_driver.release
 callback.
Message-ID: <20191220130025.maasx7xfb7rtadgd@sirius.home.kraxel.org>
References: <20191220115935.15152-1-kraxel@redhat.com>
 <20191220115935.15152-5-kraxel@redhat.com>
 <57755373.16738363.1576843760950.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57755373.16738363.1576843760950.JavaMail.zimbra@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 07:09:20AM -0500, Frediano Ziglio wrote:
> > 
> > Move final cleanups to qxl_drm_release() callback.
> 
> Can you explain in the commit why this is better or preferable?

It gets called when the drm device refcount goes down to zero.
It's needed for a proper cleanup in the correct order.

> > Add drm_atomic_helper_shutdown() call to qxl_pci_remove().
> 
> I suppose this is to replace the former manual cleanup calls,
> which were moved to qxl_drm_release, I think this could be
> added in the commit message ("why"), I don't see much value
> in describing "how" this was done.

The call is part of the shutdown sequence for atomic drm drivers
and wasn't present in qxl for some reason.

> > Reorder calls in qxl_device_fini().  Cleaning up gem & ttm
> > might trigger qxl commands, so we should do that before
> > releaseing command rings.
> 
> Typo: releaseing -> releasing
> Why not putting this in a separate commit? Was this behaviour
> changed? It does not seem so to me.

Yes, I can make that a separate commit.

No, behavior didn't change.  qxl_device_fini() is simply broken
without this.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
