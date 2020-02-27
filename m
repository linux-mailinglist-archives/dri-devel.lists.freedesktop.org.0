Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB93171892
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423DD6E88A;
	Thu, 27 Feb 2020 13:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352D56E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582809710;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2w6PduuGzWBIJqAtGt1TzV/EmMXU0UJHklEBPBn7KWM=;
 b=QQ3i858uKz49Cg8JNaJRc7UmpaJCQPbqrE2rrQXElspfaIUpzISW7e8mtFU0Dzd9VVB/UC
 j6/FF8n0hQopK4ou155HMTtEl6hW8p1jNFjwUtf0QP8I5TQIsrT3Hqj1qrpyXCWeaM37TW
 lbNlvlcwwHxYmb3rgEs8M4SbXD6kQQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-qVqUkJBaOM6F-5_AL0sljA-1; Thu, 27 Feb 2020 08:21:43 -0500
X-MC-Unique: qVqUkJBaOM6F-5_AL0sljA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5BE18A8C85;
 Thu, 27 Feb 2020 13:21:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F92060BE1;
 Thu, 27 Feb 2020 13:21:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4EC7B1744A; Thu, 27 Feb 2020 14:21:37 +0100 (CET)
Date: Thu, 27 Feb 2020 14:21:37 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>
Subject: Re: [PATCH v5 1/3] drm/shmem: add support for per object caching
 flags.
Message-ID: <20200227132137.irruicvlkxpdo3so@sirius.home.kraxel.org>
References: <20200226154752.24328-1-kraxel@redhat.com>
 <20200226154752.24328-2-kraxel@redhat.com>
 <f1afba4b-9c06-48a3-42c7-046695947e91@shipmail.org>
 <20200227075321.ki74hfjpnsqv2yx2@sirius.home.kraxel.org>
 <41ca197c-136a-75d8-b269-801db44d4cba@shipmail.org>
 <20200227105643.h4klc3ybhpwv2l3x@sirius.home.kraxel.org>
 <68a05ace-40bc-76d6-5464-2c96328874b9@shipmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68a05ace-40bc-76d6-5464-2c96328874b9@shipmail.org>
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
Cc: Guillaume.Gardet@arm.com, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 gurchetansingh@chromium.org, yuq825@gmail.com, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > So I'd like to push patches 1+2 to -fixes and sort everything else later
> > in -next.  OK?
> 
> OK with me.

Done.

>> [ context: why shmem helpers use pgprot_writecombine + pgprot_decrypted?
>>            we get conflicting mappings because of that, linear kernel
>>            map vs. gem object vmap/mmap ]

> Do we have any idea what drivers are actually using
> write-combine and decrypted?

drivers/gpu/drm# find -name Kconfig* -print | xargs grep -l DRM_GEM_SHMEM_HELPER
./lima/Kconfig
./tiny/Kconfig
./cirrus/Kconfig
./Kconfig
./panfrost/Kconfig
./udl/Kconfig
./v3d/Kconfig
./virtio/Kconfig

virtio needs cached.
cirrus+udl should be ok with cached too.

Not clue about the others (lima, tiny, panfrost, v3d).  Maybe they use
write-combine just because this is what they got by default from
drm_gem_mmap_obj().  Maybe they actually need that.  Trying to Cc:
maintainters (and drop stable@).

On decrypted: I guess that is only relevant for virtual machines, i.e.
virtio-gpu and cirrus?

virtio-gpu needs it, otherwise the host can't show the virtual display.
cirrus bounces everything via blits to vram, so it should be ok without
decrypted.  I guess that implies we should make decrypted configurable.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
