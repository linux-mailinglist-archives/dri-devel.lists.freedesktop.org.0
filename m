Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C2637B651
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 08:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223616E102;
	Wed, 12 May 2021 06:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1CD6E102
 for <dri-devel@lists.freedesktop.org>; Wed, 12 May 2021 06:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620801855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GExxMX+BzSb97gshgrWDDFUBk1s2hT511N1V5qZH5ls=;
 b=BOmXm4Yfng389FJcDI1vgzALyR4NcrCjgVYLo0pfzeCQHcK3mYmswbo/sSts16ilmNUOv9
 +QR+knA4kv3N0j2Y97ubUR6I9pE4mGrMoy80LimHcNbB3Mc/vkYwahD0iE1oh1zvQeqhIq
 3l0URxLsQbk2pCYXtDWdQkrcWxDwl1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-edOz8qfKNAyHQGVN8NxUNg-1; Wed, 12 May 2021 02:44:13 -0400
X-MC-Unique: edOz8qfKNAyHQGVN8NxUNg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 910B2107ACE4;
 Wed, 12 May 2021 06:44:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BFC47013C;
 Wed, 12 May 2021 06:44:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C919018003AF; Wed, 12 May 2021 08:44:10 +0200 (CEST)
Date: Wed, 12 May 2021 08:44:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] virtio-gpu uapi: Add VIRTIO_GPU_F_EXPLICIT_FLUSH
 feature
Message-ID: <20210512064410.infyhtac2bc35xr4@sirius.home.kraxel.org>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
 <20210511102958.46ybk2q33vg4iayi@sirius.home.kraxel.org>
 <8dc2bbd037964224bcc6609fd47b5698@intel.com>
MIME-Version: 1.0
In-Reply-To: <8dc2bbd037964224bcc6609fd47b5698@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

  Hi,

> However, as part of this feature (explicit flush), I'd like to make the Guest wait until
> the current resource (as specified by resource_flush or set_scanout) is flushed or
> synchronized. But for a different feature I am thinking of (explicit sync), I'd like to
> make the Guest wait for the previous buffer/resource submitted (available via 
> old_state->fb).

For page-flipping I guess?  i.e. you want submit a new framebuffer, then
wait until the host doesn't need the previous one?  That is likewise
linked to a command, although it is set_scanout this time.

So, right now qemu simply queues the request and completes the command
when a guest sends a resource_flush our set_scanout command.  You want
be notified when the host is actually done processing the request.

I still think it makes sense extend the resource_flush and set_scanout
commands for that, for example by adding a flag for the flags field in
the request header.  That way it is clear what exactly you are waiting
for.  You can also attach a fence to the request which you can later
wait on.

take care,
  Gerd

