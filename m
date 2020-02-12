Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94515A47E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 10:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDC7898C7;
	Wed, 12 Feb 2020 09:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C93898C7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2020 09:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581499249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DzmJbxskk6AlcHsD2V7eyusyF086fPjD2IYe+QvfO+A=;
 b=QBjSfRt62jDCOmdmZZDX/oGvknf8ensaGEC/CFjmqZ6dxIdSoOS6U0OUb+ZSQqnFkipAoc
 IeFG6Zlq/yFFwQQNRvIXNB71Od/5cJn2wtt2iPTqDKoOo3irW3bIxlDa3njIy5XyZTZiVf
 mv9gGze0hdHORYbpHCCqqiagqA8Lu1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-qLzioGbBOXmvZhndA3JKZQ-1; Wed, 12 Feb 2020 04:20:45 -0500
X-MC-Unique: qLzioGbBOXmvZhndA3JKZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EF19107ACC9;
 Wed, 12 Feb 2020 09:20:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE63D1001281;
 Wed, 12 Feb 2020 09:20:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B751D9D6B; Wed, 12 Feb 2020 10:20:42 +0100 (CET)
Date: Wed, 12 Feb 2020 10:20:42 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/bochs: add drm_driver.release callback.
Message-ID: <20200212092042.wnolwagpiucyw25m@sirius.home.kraxel.org>
References: <20200211135218.22871-1-kraxel@redhat.com>
 <20200211141956.GC2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211141956.GC2363188@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

On Tue, Feb 11, 2020 at 03:19:56PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 02:52:18PM +0100, Gerd Hoffmann wrote:
> > Call bochs_unload via drm_driver.release to make sure we release stuff
> > when it is safe to do so.  Use drm_dev_{enter,exit,unplug} to avoid
> > touching hardware after device removal.  Tidy up here and there.
> > 
> > v4: add changelog.
> > v3: use drm_dev_*().
> > v2: move hardware deinit to pci_remove().
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Btw I checked around whether there's anything else that obviously needs a
> drm_dev_enter/exit, and I spotted the !bochs->mmio check in
> bochs_hw_load_edid. That one looks like cargo-cult, there's a single
> caller in the init path, so either mmio works at that point or this is
> dead code ... slightly confusing.

FYI:  bochs->mmio actually can be NULL when running on very old qemu
versions, the mmio bar was added in qemu release 1.3.  All the register
access functions in bochs_hw.c have a fallback going to ioports because
of that.  So there is a reason for the check, even though it is highly
unlikely that mmio actually is NULL these days.  qemu 1.3 was released
in 2013 ...

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
