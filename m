Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EE2325058
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 14:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6D6E0D8;
	Thu, 25 Feb 2021 13:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6D26E0D8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614259649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bmhocK8JvxeFvqznSPmVOrjmguqn5DklCKcUL2w9cKA=;
 b=F8L5avPDcNoCi6sCPJCJ5OCbwcfP+VtDJiEt33TflWwdP7zA39+1nQjp+qUFnsPjO9keNV
 63uGOz2TCdYwvsly8Z0iYOv+r2ee6UmNddoWN/8TEfrxH6lGV4uRJNbrK+biSYaDZDMwdt
 shX9B3fVnwBtuMBMxiWaURvFFYELUjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-YUcj0nl0NBq2qTP1Br-cZQ-1; Thu, 25 Feb 2021 08:27:25 -0500
X-MC-Unique: YUcj0nl0NBq2qTP1Br-cZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BFD280196C;
 Thu, 25 Feb 2021 13:27:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89E715D9E2;
 Thu, 25 Feb 2021 13:27:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 19A4C18000A7; Thu, 25 Feb 2021 14:27:22 +0100 (CET)
Date: Thu, 25 Feb 2021 14:27:22 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Zack Rusin <zackr@vmware.com>, Melissa Wen <melissa.srw@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Dave Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] drm/vkms: Add support for virtual hardware mode
Message-ID: <20210225132722.s2deh35qwhan5kkf@sirius.home.kraxel.org>
References: <20210224105509.yzdimgbu2jwe3auf@adolin>
 <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
 <20210225102520.uysa4muovemqi66n@sirius.home.kraxel.org>
 <YDd8qOETBy8z/qDh@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDd8qOETBy8z/qDh@phenom.ffwll.local>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 11:32:08AM +0100, Daniel Vetter wrote:
> On Thu, Feb 25, 2021 at 11:25:20AM +0100, Gerd Hoffmann wrote:
> > On Thu, Feb 25, 2021 at 10:09:42AM +0100, Daniel Vetter wrote:
> > > On Wed, Feb 24, 2021 at 11:55 AM Sumera Priyadarsini
> > > <sylphrenadin@gmail.com> wrote:
> > > >
> > > > Add a virtual hardware or vblank-less mode as a module to enable
> > > > VKMS to emulate virtual graphic drivers. This mode can be enabled
> > > > by setting enable_virtual_hw=1 at the time of loading VKMS.
> > > >
> > > > A new function vkms_crtc_composer() has been added to bypass the
> > > > vblank mode and is called directly in the atomic hook in
> > > > vkms_atomic_begin(). However, some crc captures still use vblanks
> > > > which causes the crc-based igt tests to crash. Currently, I am unsure
> > > > about how to approach one-shot implementation of crc reads so I am
> > > > still working on that.
> > > 
> > > Gerd, Zack: For virtual hw like virtio-gpu or vmwgfx that does
> > > one-shot upload and damage tracking, what do you think is the best way
> > > to capture crc for validation? Assuming that's even on the plans
> > > anywhere ...
> > > 
> > > Ideally it'd be a crc that the host side captures, so that we really
> > > have end-to-end validation, including the damage uploads and all that.
> > 
> > Disclaimer:  Not knowing much about the crc thing beside having noticed
> > it exists and seems to be used for display content checking.
> > 
> > > For vkms we're going for now with one-shot crc generation after each
> > > atomic flip (or DIRTYFB ioctl call). Will need a pile of igt changes,
> > > but seems like the most fitting model.
> > > Other option would be that we'd wire up something on the kernel side
> > > that generates a crc on-demand every time igt reads a new crc value
> > > (maybe with some rate limiting). But that's not really how virtual hw
> > > works when everything is pushed explicitly to the host side.
> > 
> > igt runs inside the guest, right?
> 
> Yup. There's some debugfs files for capture crc on a specific CRTC. So
> supporting this would mean some virtio-gpu revision so you could ask the
> host side for a crc when you do a screen update, and the host side would
> send that back to you on a virtio channel as some kind of message.

Waded through the source code a bit.  So, the vkms crc code merges all
planes (specifically the cursor plane) before calculating the crc.
Which is a bit of a problem, we try to avoid that and rarely actually
merge the planes anywhere in the virtualization stack.  Instead we
prefer to pass through the cursor plane separately, so we can -- for
example -- use that to simply set the cursor sprite of the qemu gtk
window.  It's much more snappy because moving+rendering the pointer
doesn't need a round-trip to the guest then.

So, it would be quite some effort on the host side, we would have to
merge planes just for crc calculation.

> > You can ask qemu to write out a screen dump.

Hmm, the (hardware) cursor is not in the screen dump either.

A software cursor (when using for example cirrus which has no cursor
plane) would be there.

> > Another option to access the screen would be vnc.

vnc clients can get the cursor sprite.  They can't get the position
though, only set it (it's a one-way ticket in the vnc protocol).
Typically not a problem because desktops set the position in response
to the pointer events so guest + host position match nevertheless.
But for test cases which don't look at input events and set the cursor
to a fixed place this is a problem ...

> > On-demand crc via debugfs or ioctl would work too, but yes that wouldn't
> > verify the host-side.  At least not without virtio protocol extensions.
> > We could add a new command asking the host to crc the display and return
> > the result for on-demand crc.  Or add a crc request flag to an existing
> > command (VIRTIO_GPU_CMD_RESOURCE_FLUSH probably).
> 
> Yup, I think that's what would be needed. The question here is, what do
> you think would be the most natural way for virtio host side stack to
> support this?

virtio has feature flags, so we can easily introduce an extension in a
backward compatible way.  Each command sends a reply, with optional
payload, so it would make sense to send the crc with the
VIRTIO_GPU_CMD_RESOURCE_FLUSH reply.

Alternatively introduce a communication channel independent of the gpu,
using for example virtio-serial or vsock, let the guest send crc
requests to qemu that way.  Which would work with all qemu display
devices, not only virtio-gpu.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
