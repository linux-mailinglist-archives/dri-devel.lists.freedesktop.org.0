Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD14D43C854
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59426E532;
	Wed, 27 Oct 2021 11:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD6D6E532
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 11:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635333125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58QM51QiB3u8Solaxwp2laDRegtT860kcTO5RWMrF1E=;
 b=Sa9Y7hhUHuNc8hahPF7HRuLl5avu+/Kg8auz3FjUJdUP3jZsZzUIwZKBa2nkteux51TB4f
 nxhabNt7LluHG0Dl3It1vn3xao35EH65lM+NGjVHATCwzQUp4ULqXCieXau02Dmrgi8yjq
 Bbu6NOArYfysz1wFpRCOo7v/lFrqNwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-EjqkAlj7P9WErJbDSjA96A-1; Wed, 27 Oct 2021 07:12:02 -0400
X-MC-Unique: EjqkAlj7P9WErJbDSjA96A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEF1C1006AA2;
 Wed, 27 Oct 2021 11:12:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-241.phx2.redhat.com
 [10.3.112.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B83D95F4EE;
 Wed, 27 Oct 2021 11:11:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DC9521801AA7; Wed, 27 Oct 2021 13:11:57 +0200 (CEST)
Date: Wed, 27 Oct 2021 13:11:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Maksym Wezdecki <maksym.wezdecki@collabora.co.uk>
Cc: Maksym Wezdecki <maksym.wezdecki@collabora.com>,
 David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>, 
 Chia-I Wu <olvaffe@gmail.com>, gurchetansingh@chromium.org
Subject: Re: drm/virtio: not pin pages on demand
Message-ID: <20211027111157.m5wppq52jzp3la3s@sirius.home.kraxel.org>
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
 <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
 <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
 <20211021115212.dk2kl2vbl6qotjwa@sirius.home.kraxel.org>
 <CAPaKu7TfEtikdg2HEt2_PH7=zPbk=d9wfosDjNmr1AU6CC6sMw@mail.gmail.com>
 <d1b610f3-6a73-eda1-a35b-3efc85cbb582@collabora.co.uk>
 <ff1f2f85-2f14-af01-3f57-ed5abb4e8a49@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <ff1f2f85-2f14-af01-3f57-ed5abb4e8a49@collabora.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ Cc'ing Gurchetan Singh ]

> Can we follow up on this issue?
> 
> The main pain point with your suggestion is the fact,
> that it will cause VirGL protocol breakage and we would
> like to avoid this.
> 
> Extending execbuffer ioctl and create_resource ioctl is
> more convenient than having the protocol broken.

Do you know at resource creation time whenever you need cpu access
or not?  IOW can we make that a resource property, so we don't have
pass around lists of objects on each and every execbuffer ioctl?

> Blob resources is not a solution, too, because QEMU doesn't
> support blob resources right now.
> 
> In ideal solution when both QEMU and crosvm support blob resources
> we can switch to blob resources for textures.

That'll only happen if someone works on it.
I will not be able to do that though.

> I would like to introduce changes gradually and not make a protocol
> breakage.

Well, opengl switching to blob resources is a protocol change anyway.
That doesn't imply things will break though.  We have capsets etc to
extend the protocol while maintaining backward compatibility.

> What do you think about that?

I still think that switching to blob resources would be the better
solution.  Yes, it's alot of work and not something which helps
short-term.  But adding a new API as interim solution isn't great
either.  So, not sure.  Chia-I Wu?  Gurchetan Singh?


While being at it:  Chia-I Wu & Gurchetan Singh, could you help
reviewing virtio-gpu kernel patches?  I think you both have a better
view on the big picture (with both mesa and virglrenderer) than I have.
Also for the crosvm side of things.  The procedure for that would be to
send a patch adding yourself to the virtio-gpu section of the
MAINTAINERS file, so scripts/get_maintainer.pl will Cc you on patches
submitted.

thanks,
  Gerd

> 
> Maksym
> 
> 
> On 10/22/21 10:44 AM, Maksym Wezdecki wrote:
> 
> > Once again with all lists and receivers. I'm sorry for that.
> >
> > On 10/21/21 6:42 PM, Chia-I Wu wrote:
> >> On Thu, Oct 21, 2021 at 4:52 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>> On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
> >>>> I get your point. However, we need to make resource_create ioctl,
> >>>> in order to create corresponding resource on the host.
> >>> That used to be the case but isn't true any more with the new
> >>> blob resources.  virglrenderer allows to create gpu objects
> >>> via execbuffer.  Those gpu objects can be linked to a
> >>> virtio-gpu resources, but it's optional.  In your case you
> >>> would do that only for your staging buffer.  The other textures
> >>> (which you fill with a host-side copy from the staging buffer)
> >>> do not need a virtio-gpu resource in the first place.
> >> That's however a breaking change to the virgl protocol.  All virgl
> >> commands expect res ids rather than blob ids.
> >>
> >> Using VIRTGPU_BLOB_MEM_HOST3D could in theory work.  But there are a
> >> few occasions where virglrenderer expects there to be guest storage.
> >> There are also readbacks that we need to support.  We might end up
> >> using VIRTGPU_BLOB_MEM_HOST3D_GUEST, where pin-on-demand is still
> >> desirable.
> >>
> >> For this patch, I think the uapi change can be simplified.  It can be
> >> a new param plus a new field in drm_virtgpu_execbuffer
> >>
> >>   __u64 bo_flags; /* pointer to an array of size num_bo_handles, or NULL */
> >>
> >> The other changes do not seem needed.
> > My first approach was the same, as you mentioned. However, having "__u64 bo_flags"
> > needs a for loop, where only few of the bo-s needs to be pinned - this has
> > performance implications. I would rather pass bo handles that should be pinned than
> > having a lot of flags, where only 1-2 bos needs to be pinned.
> >
> >>> take care,
> >>>   Gerd
> >>>

-- 

