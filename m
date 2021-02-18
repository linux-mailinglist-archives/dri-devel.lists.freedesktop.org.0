Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3F31EADE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 15:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AFF6EA0E;
	Thu, 18 Feb 2021 14:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6266EA15
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613658195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B0Np6RmIQw2V0BL+Pl69+jda/IWr90txxGD9/gHBjqQ=;
 b=IY12YJnlpy73B6PYZH0pH9RSrqxuPCXyFDRT1a6z30kBxKSxC4k8ySmkJm87JTsHgy+3TA
 E2uJOc/9jhysExhH5vyKkIkcQBWKzqv6x91MvXHcoigaEDu30/tpGYjCwhQ5kMBw7ZOvix
 eiPLnVIL5wk1GBb8L7lVoNxAPkVf56w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-MrPlxZAFN1-CBrxEqE7XnQ-1; Thu, 18 Feb 2021 09:23:10 -0500
X-MC-Unique: MrPlxZAFN1-CBrxEqE7XnQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D26980197C;
 Thu, 18 Feb 2021 14:23:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD0019D9F;
 Thu, 18 Feb 2021 14:23:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9A48118000B7; Thu, 18 Feb 2021 15:23:06 +0100 (CET)
Date: Thu, 18 Feb 2021 15:23:06 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 10/11] drm/qxl: rework cursor plane
Message-ID: <20210218142306.zlogw344is46q3yl@sirius.home.kraxel.org>
References: <20210217123213.2199186-1-kraxel@redhat.com>
 <20210217123213.2199186-11-kraxel@redhat.com>
 <6a5581b2-8e62-1310-d42e-abfa301edc88@suse.de>
 <20210218115044.7tsi2szbdlw6lvdi@sirius.home.kraxel.org>
 <2d7a649c-bf1d-aa41-8d3c-af9746b94bc0@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d7a649c-bf1d-aa41-8d3c-af9746b94bc0@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > Well.  I suspect I could easily spend a month cleaning up and party
> > redesign the qxl driver (specifically qxl_draw.c + qxl_image.c).
> > 
> > I'm not sure I'll find the time to actually do that anytime soon.
> > I have plenty of other stuff on my TODO list, and given that the
> > world is transitioning to virtio-gpu the priority for qxl isn't
> > that high.
> 
> Well, in that case:
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> for patches 9 and 10. Having the vmap calls fixed is at least worth it.

Thanks.  Any chance you can ack 8/11 too (only patch missing an ack).

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
