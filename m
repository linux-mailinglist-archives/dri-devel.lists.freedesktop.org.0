Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB481B5A4A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 13:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7376E417;
	Thu, 23 Apr 2020 11:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BD26E417
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 11:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587640694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTeCVFGaNrjlWImxUn9OdQ72/+Scj8kDooRDhWIxaB4=;
 b=gy8+MjWCqDGMd+Np/jcr7mcje488mEZ1rsqBd7ghadtz7kcQEoh9Xp6ipO8ruLs6c5ApHl
 GVu4ZQ9SlMt5qg/EwbKfvwQfQAfEgjfx+AhUg3vcSconXJEvJDlx3bKlwJXb4i33dnJaB/
 YF0zdR+VLKV5O5wLAonNdTrkdQ0x1qc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-uIVxnMIaNfqGahaCNDL2tQ-1; Thu, 23 Apr 2020 07:18:12 -0400
X-MC-Unique: uIVxnMIaNfqGahaCNDL2tQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5343B107ACCA;
 Thu, 23 Apr 2020 11:18:11 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83A9763B86;
 Thu, 23 Apr 2020 11:18:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id AD8C21753B; Thu, 23 Apr 2020 13:18:08 +0200 (CEST)
Date: Thu, 23 Apr 2020 13:18:08 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
Message-ID: <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200422144055.27801-3-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 04:40:55PM +0200, Thomas Zimmermann wrote:
> With limited VRAM available, fragmentation can lead to OOM errors.
> Alternating between bottom-up and top-down placement keeps BOs near the
> ends of the VRAM and the available pages consecutively near the middle.
> 
> A real-world example with 16 MiB of VRAM is shown below.
> 
>   > cat /sys/kernel/debug/dri/0/vram-mm
>   0x0000000000000000-0x000000000000057f: 1407: free
>   0x000000000000057f-0x0000000000000b5b: 1500: used
>   0x0000000000000b5b-0x0000000000000ff0: 1173: free
> 
> The first free area was the location of the fbdev framebuffer. The used
> area is Weston's current framebuffer of 1500 pages. Weston now cannot
> do a pageflip to another 1500 page-wide framebuffer, even though enough
> pages are available. The patch resolves this problem to
> 
>   > cat /sys/kernel/debug/dri/0/vram-mm
>   0x0000000000000000-0x00000000000005dc: 1500: used
>   0x00000000000005dc-0x0000000000000a14: 1080: free
>   0x0000000000000a14-0x0000000000000ff0: 1500: used
> 
> with both of Weston's framebuffers located near the ends of the VRAM
> memory.

I don't think it is that simple.

First:  How will that interact with cursor bo allocations?  IIRC the
strategy for them is to allocate top-down, for similar reasons (avoid
small cursor bo allocs fragment vram memory).

Second:  I think ttm will move bo's from vram to system only on memory
pressure.  So you can still end up with fragmented memory.  To make the
scheme with one fb @ top and one @ bottom work reliable you have to be
more aggressive on pushing out framebuffers.

Third:  I'd suggest make topdown allocations depending on current state
instead of simply alternating, i.e. if there is a pinned framebuffer @
offset 0, then go for top-down.

I also think using this scheme should be optional.  In the simplest case
we can allow drivers opt-in.  Or we try do to something clever
automatically: using the strategy only for framebuffers larger than 1/4
or 1/3 of total vram memory (which makes alloc failures due to
fragmentation much more likely).

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
