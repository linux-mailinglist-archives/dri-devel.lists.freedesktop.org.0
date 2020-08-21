Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAC24CE5C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Aug 2020 09:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02A16E038;
	Fri, 21 Aug 2020 07:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B85C6E038
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 07:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597993311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yIGSYjFFLTVb50eqymJwc16CIZ3D03wNNhMqT2v4fFo=;
 b=FigV2A/21aDfSHrwshBbRk57mDM5UJlKJOYwBcHPw7+zLK5v3yuz6sFrsAI0+nCN1lZ6aO
 acDeqzKdj9AqcfwPOGXEgQOvfIFdK10orAlD9ThGKMtB4pqSVzWjXI/8liIkLN6ID37c/B
 IOLoc/wlQZYM/rCcvLwIXzxszGqJlO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-bmWLZW8UPxSpNitocniUOw-1; Fri, 21 Aug 2020 03:01:45 -0400
X-MC-Unique: bmWLZW8UPxSpNitocniUOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B14FD1084C91;
 Fri, 21 Aug 2020 07:01:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 489C95DA7E;
 Fri, 21 Aug 2020 07:01:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 36D4E241; Fri, 21 Aug 2020 09:01:42 +0200 (CEST)
Date: Fri, 21 Aug 2020 09:01:42 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 2/2] drm/virtio: Remove open-coded commit-tail function
Message-ID: <20200821070142.iwobpibai6aavpl6@sirius.home.kraxel.org>
References: <20200707201229.472834-4-daniel.vetter@ffwll.ch>
 <20200709123339.547390-1-daniel.vetter@ffwll.ch>
 <20200709123339.547390-2-daniel.vetter@ffwll.ch>
 <5cb80369-75a5-fc83-4683-3a6fc2814104@kernel.org>
 <20200819132408.jnqjhdgd4jbnarhh@sirius.home.kraxel.org>
 <8a80b434-c8ed-daa3-753b-dd2ec89b9067@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a80b434-c8ed-daa3-753b-dd2ec89b9067@kernel.org>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 08:32:51AM +0200, Jiri Slaby wrote:
> On 19. 08. 20, 15:24, Gerd Hoffmann wrote:
> > On Wed, Aug 19, 2020 at 02:43:28PM +0200, Jiri Slaby wrote:
> >> On 09. 07. 20, 14:33, Daniel Vetter wrote:
> >>> Exactly matches the one in the helpers.
> >>
> >> It's not that exact. The order of modeset_enables and planes is
> >> different. And this causes a regression -- no fb in qemu.
> > 
> > Does https://patchwork.freedesktop.org/patch/385980/ help?
> 
> Yes, it does.

Any chance you can send a tested-by & acked-by for the series so I can
get it merged?

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
