Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F73338077B
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 12:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2356EE47;
	Fri, 14 May 2021 10:38:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5D56E0A1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620988719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WX0D+xswpC19A5dUSRvorG3RPFapQlr1rrgyu6fP5is=;
 b=ADMNpMsChcvHjpq3Cp1ZfifIDm0RZuUghup/jMxDIlxi5Om2pIcb86T5awkmbjLph5IdwG
 hdI0iU7UnhiTfzR2f+TGXkUOYRWKvWaoHAnbvw33zbLmgqdPpxFZrOh9Tf0KsMJEqQG1Z/
 jxEAlIe10IVkMRW65R2ruaHT2ZAZL3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-nX7pKzPpMBW34lsDOFkToQ-1; Fri, 14 May 2021 06:38:37 -0400
X-MC-Unique: nX7pKzPpMBW34lsDOFkToQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 843511854E24;
 Fri, 14 May 2021 10:38:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E0D19C59;
 Fri, 14 May 2021 10:38:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 861731800396; Fri, 14 May 2021 12:38:34 +0200 (CEST)
Date: Fri, 14 May 2021 12:38:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Message-ID: <20210514103834.vvfgjvfnc2hphr4f@sirius.home.kraxel.org>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
 <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
 <8dc2bbd037964224bcc6609fd47b5698@intel.com>
 <20210512064410.infyhtac2bc35xr4@sirius.home.kraxel.org>
 <2ce75952e24349e5a787919a55169779@intel.com>
MIME-Version: 1.0
In-Reply-To: <2ce75952e24349e5a787919a55169779@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 12, 2021 at 09:18:37PM +0000, Kasireddy, Vivek wrote:
> Hi Gerd,
> 
> > > However, as part of this feature (explicit flush), I'd like to make the Guest wait until
> > > the current resource (as specified by resource_flush or set_scanout) is flushed or
> > > synchronized. But for a different feature I am thinking of (explicit sync), I'd like to
> > > make the Guest wait for the previous buffer/resource submitted (available via
> > > old_state->fb).
> > 
> > For page-flipping I guess?  i.e. you want submit a new framebuffer, then
> > wait until the host doesn't need the previous one?  That is likewise
> > linked to a command, although it is set_scanout this time.
> [Kasireddy, Vivek] Mainly for page-flipping but I'd also like to have fbcon, Xorg that
> do frontbuffer rendering/updates to work seamlessly as well.
> 
> > 
> > So, right now qemu simply queues the request and completes the command
> > when a guest sends a resource_flush our set_scanout command.  You want
> > be notified when the host is actually done processing the request.
> [Kasireddy, Vivek] Correct, that is exactly what I want -- make the Guest wait
> until it gets notified that the Host is completely done processing/using the fb.
> However, there can be two resources the guest can be made to wait on: wait for
> the new/current fb that is being submitted to be processed (explicit flush)

That would be wait on resource_flush case, right?

> or wait for the previous fb that was submitted earlier (in the
> previous repaint cycle) to be processed (explicit sync).

That would be the wait on set_scanout case, right?

And it would effectively wait on the previous fb not being needed by the
host any more (because the page-flip to the new fb completed) so the
guest can re-use the previous fb to render the next frame, right?

(also when doing front-buffer rendering with xorg/fbcon and then doing a
virtual console switch the guest could wait for the console switch being
completed).

> IIUC, Explicit sync only makes sense if 1) the Host windowing system also supports
> that feature/protocol (currently only upstream Weston does but I'd like to add it to
> Mutter if no one else does) or if there is a way to figure out (dma-buf sync file?) if
> the Host has completely processed the fb and 2) if Qemu UI is not doing a blit and
> instead submitting the guest fb/dmabuf directly to the Host windowing system.
> As you are aware, 2) can possibly be done with dbus/pipewire Qemu UI backends
> (I'll explore this soon) but not with GTK or SDL. 

Well, I think we need to clearly define the wait flag semantics.  Should
resource_flush with wait flag wait until the host is done reading the
resource (blit done)?  Or should it wait until the host screen has been
updated (gtk draw callback completed)?

Everything else will be a host/guest implementation detail then, and
of course this needs some integration with the UI on the host side and
different UIs might have to do different things.

On the guest side integrating this with fences will give us enough
flexibility on how we want handle the waits.  Simplest would be to just
block.  We could implement virtual vblanks, which would probably make
most userspace work fine without explicit virtio-gpu support.  If needed
we could even give userspace access to the fence so it can choose how to
wait.

take care,
  Gerd

