Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D9311A5B3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 09:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179226EA59;
	Wed, 11 Dec 2019 08:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 83863 seconds by postgrey-1.36 at gabe;
 Wed, 11 Dec 2019 08:15:52 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E706EA59
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 08:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576052151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9+eXVJvGhvjgCko5lAbFcvBiKAk1D5Fec1eKLqFyyY=;
 b=X4MIt5JXhAxwKR7f/hOhmMNlbr31Ylg9flFRNM4W5EFOL9YE0cgEmeZVLwCUItwivNvRVG
 IT4+3wowjwaY17FBbecHweqVGshdx2XZESu6yIUMpvtfEkxRiv7Nv6GpVx2h77x2TnmCjV
 8g9N80DHFIBdOcYkv6iIJQLjl7FByYk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-wgVuXbNjO-abuQ7falBagA-1; Wed, 11 Dec 2019 03:15:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0942E911EA;
 Wed, 11 Dec 2019 08:15:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DEB160BE1;
 Wed, 11 Dec 2019 08:15:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AB48E16E05; Wed, 11 Dec 2019 09:15:41 +0100 (CET)
Date: Wed, 11 Dec 2019 09:15:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/virtio: fix mmap page attributes
Message-ID: <20191211081541.ejofg4uxo6poss6v@sirius.home.kraxel.org>
References: <20191210085759.14763-1-kraxel@redhat.com>
 <e8915378-df67-e6f4-f40c-599797e16e9c@suse.de>
MIME-Version: 1.0
In-Reply-To: <e8915378-df67-e6f4-f40c-599797e16e9c@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: wgVuXbNjO-abuQ7falBagA-1
X-Mimecast-Spam-Score: 0
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
Cc: David Airlie <airlied@linux.ie>, gurchetansingh@chromium.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> There's similar code in udl, [1] which still uses writecombine for
> imported buffers. Virtio does not need this?

virtio doesn't support dma-buf imports (yet).
So no worries for now.

Why pick writecombine for the imported buffer btw?
It'll probably be correct for the majority of imports, but it still
looks like a educated guess to me.  What if you import from vgem?

I guess we should either ...
  (1) Ask the exporting driver to handle things, simliar to how it is
      done for vmaps already, probably by calling dma_buf_mmap(), or
  (2) Refuse to mmap imported objects via drm api.

> Aside from this, do you think we could handle all special cases within
> shmem?

Probably makes sense to teach shmem helpers about caching.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
