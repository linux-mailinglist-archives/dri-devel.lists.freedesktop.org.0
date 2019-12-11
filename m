Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A480011ABDD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 14:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F666EB49;
	Wed, 11 Dec 2019 13:18:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54666EB49
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 13:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576070316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2N/bBwWcHDSxRKQdSq6NZCU6mWtdHnd96mKLJxL2OHM=;
 b=cFHO0OTLO4KpKU5O5AB0rhoYeIymkHzIee3gv0GqKbkbyE/2x+zi552w7/2IGOZG4D17vc
 B1SoqGvPPz4W1gbf8eCfa4nW+MjSYbjt6n1vrIdQ6s7J7kJhnyg2iNvdI9+yKWflyJno9o
 DTUaXDFlOgs/mCi/4+7Rzf17tyJIAZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-pjXuj2LDO8GVkc_Sq06EOg-1; Wed, 11 Dec 2019 08:18:33 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEF3F18044A7;
 Wed, 11 Dec 2019 13:18:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9286D19756;
 Wed, 11 Dec 2019 13:18:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7F97716E05; Wed, 11 Dec 2019 14:18:30 +0100 (CET)
Date: Wed, 11 Dec 2019 14:18:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, gurchetansingh@chromium.org
Subject: Re: [PATCH v2 1/2] drm/shmem: add support for per object caching
 attributes
Message-ID: <20191211131830.iz3a2o4xzmmkjsp7@sirius.home.kraxel.org>
References: <20191211081810.20079-1-kraxel@redhat.com>
 <20191211081810.20079-2-kraxel@redhat.com>
 <0b64e917-48f7-487e-9335-2838b6c62808@suse.de>
 <ed9142da-ce10-7df2-8a85-ba9ad0c26551@suse.de>
 <20191211123635.GY624164@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20191211123635.GY624164@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: pjXuj2LDO8GVkc_Sq06EOg-1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> btw on why udl does this: Imported bo are usually rendered by real hw, and
> reading it uncached/wc is the more defensive setting. It would be kinda
> nice if dma-buf would expose this, but I fear dma-api maintainers would
> murder us if we even just propose that ... so it's a mess right now.

I suspect for imported dma-bufs we should leave the mmap() to the
exporter instead of pulling the pages out of the sgt and map them
ourself.

> btw the issue extends to dma access by devices too, e.g. both i915 and
> amdgpu can select the coherency mode at runtime (using e.g. the pcie
> no-snoop transaction mode), and we have similar uncoordinated hacks in
> there too, like in udl.

Hmm.  Ok.  I guess I'm not going to try solve all that properly just for
the little virtio fix.

Just curious:  How do you tell your hardware?  Are there bits for that
in the gtt, simliar to the caching bits in the x86 page tables?

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
