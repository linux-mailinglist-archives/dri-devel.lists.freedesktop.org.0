Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4146619F14C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 10:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4EBC89C1A;
	Mon,  6 Apr 2020 08:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18CE789C08
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586160380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ylWquo2AGzDmVpZOhmgLdkn6LoBRG8fV5dTAEgjmlbU=;
 b=Ng3w+qReOcloNLQQ0JPixuxXMMKOae1akRXoEb2J01muWWI1pZigQkmQdobhDAyjIQaY+6
 uUsZhC5i6116oLiiPJLKkzBHm1MSGmkSamSleusL9x0jUwAMTv7meZEn0OXmbzF5nG3VGZ
 pYjkZO23FUzhzr9uuBgFFoCJK8WLZpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-G1bArSXsOne7i05MQ5n15w-1; Mon, 06 Apr 2020 04:06:15 -0400
X-MC-Unique: G1bArSXsOne7i05MQ5n15w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0650D14E3;
 Mon,  6 Apr 2020 08:06:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-60.ams2.redhat.com
 [10.36.113.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BA4E5DA81;
 Mon,  6 Apr 2020 08:06:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 69F1816E2C; Mon,  6 Apr 2020 10:06:12 +0200 (CEST)
Date: Mon, 6 Apr 2020 10:06:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dmitry Vyukov <dvyukov@google.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
Message-ID: <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
References: <00000000000091056b05a2999f1e@google.com>
 <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: David Airlie <airlied@linux.ie>,
 syzbot <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 09:07:44AM +0200, Dmitry Vyukov wrote:
> On Mon, Apr 6, 2020 at 8:46 AM syzbot
> <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com> wrote:
> >
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    ffc1c20c Merge tag 'for-5.7/dm-changes' of git://git.kerne..
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=1690471fe00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a1e2f9a9986236
> > dashboard link: https://syzkaller.appspot.com/bug?extid=d3a7951ed361037407db
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> >
> > Unfortunately, I don't have any reproducer for this crash yet.
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com
> 
> 
> +drivers/gpu/drm/virtio/virtgpu_object.c maintainers
> Now we have both mainline and linux-next boot broken (linux-next is
> broken for the past 40 days).
> No testing of new code happens.
> 
> >  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> >  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230

Ah, that one.

broken patch: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
fixed by: 0666a8d7f6a4 ("drm/virtio: fix OOB in virtio_gpu_object_create")

Both are in drm-misc-next.  I suspect the fix was added after
drm-misc-next was closed for the 5.7 merge window and thus should
have been submitted to drm-misc-next-fixes instead.

So, what to do now?  Should I cherry-pick 0666a8d7f6a4 into
drm-misc-next-fixes?  Or should it go into drm-misc-fixes instead?

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
