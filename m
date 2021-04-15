Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEEA3612DC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 21:20:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E012F6EAB8;
	Thu, 15 Apr 2021 19:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D040E6EAB8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618514439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CvpRqi5jGMrmijnPGQZkntMS3EsXhFky90lDqKKQCU=;
 b=BgKQaJZvDdKUX4ziVNUZJQNTFc0MXsukDXE7BpqXC6Vu9EMYteLugtCPnFLAvHilIW37BW
 w5Eu2GAetp02SPjZvKplO8wEuQ9HKGSYJ5q/s2jhaWS04xHR1QA2PEJQHHFdQgqSO9lJXm
 ER6rOQQIhPfkRPRxh4NkjPP1RHssgyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-6p05y1-QOHG4jhT6-4vN-A-1; Thu, 15 Apr 2021 15:20:35 -0400
X-MC-Unique: 6p05y1-QOHG4jhT6-4vN-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24F3E195D563;
 Thu, 15 Apr 2021 19:20:33 +0000 (UTC)
Received: from redhat.com (ovpn-117-254.rdu2.redhat.com [10.10.117.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 269B510013C1;
 Thu, 15 Apr 2021 19:20:29 +0000 (UTC)
Date: Thu, 15 Apr 2021 13:20:29 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: linux-next: manual merge of the vfio tree with the drm tree
Message-ID: <20210415132029.3055578b@redhat.com>
In-Reply-To: <20210415130855.GR227011@ziepe.ca>
References: <20210415164734.1143f20d@canb.auug.org.au>
 <20210415130855.GR227011@ziepe.ca>
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 15 Apr 2021 10:08:55 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Thu, Apr 15, 2021 at 04:47:34PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the vfio tree got a conflict in:
> > 
> >   drivers/gpu/drm/i915/gvt/gvt.c
> > 
> > between commit:
> > 
> >   9ff06c385300 ("drm/i915/gvt: Remove references to struct drm_device.pdev")
> > 
> > from the drm tree and commit:
> > 
> >   383987fd15ba ("vfio/gvt: Use mdev_get_type_group_id()")
> > 
> > from the vfio tree.
> > 
> > I fixed it up (I used the latter version) and can carry the fix as
> > necessary.  
> 
> Yes that is right, thank you

Yep, thanks!

Alex

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
