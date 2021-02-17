Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8776E31D735
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 11:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C42E89993;
	Wed, 17 Feb 2021 10:02:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32EE89993
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Feb 2021 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613556131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QeuHq6die/zShonildOwEbHDnzqFu2EW3FQb2PhiPf4=;
 b=g2XyyaFPkAuyyv/5Bmp2g3tI5zsdEsyEybIScOLRX0/yXQP2qWfWCFF9AsZSN1JaqUhVsb
 tG6C1sgIdPkAbimaFuwO4J9ecdeZ00GgFNX3AGUHX+bqTY58gMoDzzNKNhi7qEn3LqRPEq
 f7y67WTiLo0MVIeBR8mKp/oDJ3NOaHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-Yk5OhdPTOE2Z34o6RFtEug-1; Wed, 17 Feb 2021 05:02:09 -0500
X-MC-Unique: Yk5OhdPTOE2Z34o6RFtEug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14902192CC42;
 Wed, 17 Feb 2021 10:02:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA6265D9C2;
 Wed, 17 Feb 2021 10:02:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2A57A18000A2; Wed, 17 Feb 2021 11:02:06 +0100 (CET)
Date: Wed, 17 Feb 2021 11:02:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 09/10] drm/qxl: map/unmap framebuffers in
 prepare_fb+cleanup_fb callbacks.
Message-ID: <20210217100206.fh5422uz4gnixyif@sirius.home.kraxel.org>
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-10-kraxel@redhat.com>
 <5baf096f-b1ee-46ba-5ee9-1c829b96e088@suse.de>
 <ab21d782-2627-7a68-8fab-0acfba416c86@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ab21d782-2627-7a68-8fab-0acfba416c86@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, Dave Airlie <airlied@redhat.com>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 16, 2021 at 02:46:21PM +0100, Thomas Zimmermann wrote:
> 
> 
> Am 16.02.21 um 14:27 schrieb Thomas Zimmermann:
> > Hi
> > 
> > this is a shadow-buffered plane. Did you consider using the new helpers
> > for shadow-buffered planes? They will map the user BO for you and
> > provide the mapping in the plane state.
> > 
> >  From there, you should implement your own plane state on top of struct
> > drm_shadow_plane_state, and also move all the other allocations and
> > vmaps into prepare_fb and cleanup_fb. Most of this is not actually
> > allowed in commit tails. All we'd have to do is to export the reset,
> > duplicate and destroy code; similar to what
> > __drm_atomic_helper_plane_reset() does.
> 
> AFAICT the cursor_bo is used to implement double buffering for the cursor
> image.
> 
> Ideally, you can do what ast does: pre-allocate/vmap 2 BOs at the end of the
> vram. Then pageflip between them in atomic_update(). Resolves all the
> allocation and mapping headaches.

Just waded through the ast patches.

It is not that simple for qxl.  You have to send a command to the
virtualization host and take care of the host accessing that memory
when processing the command, so you can't reuse the memory until the
host signals it is fine to do so.

But, yes, it should be possible to handle cursor_bo creation in
prepare_fb without too much effort.

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
