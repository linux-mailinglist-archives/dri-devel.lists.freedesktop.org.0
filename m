Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF901BD5F5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA396ED08;
	Wed, 29 Apr 2020 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908B6ED08
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 07:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588145118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezHzM1WqhrbfQUQvKy+SsCUnl9GoSrQXjybrZhM9bL8=;
 b=O6uAYyXxKProtL4dkC+PMFAuWMp9qe+3izrl6wWbw2TwKX1iX3ppqFM+d+Y17lokvv7JOQ
 +9nc/gq9Sdt0/mnHsLVE4ZzEZSosxm2CbT8hlQsyDQIbFeSvqAb9qNaMELoT0fnQFKz7So
 iGhVhTEu93O5nQA8QRW3mYMykj/TuLI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-5pHPdKXjPpODCBASQONvew-1; Wed, 29 Apr 2020 03:25:14 -0400
X-MC-Unique: 5pHPdKXjPpODCBASQONvew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5026D835B41;
 Wed, 29 Apr 2020 07:25:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B67D5282C8;
 Wed, 29 Apr 2020 07:25:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7367C1753B; Wed, 29 Apr 2020 09:25:00 +0200 (CEST)
Date: Wed, 29 Apr 2020 09:25:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] drm/vram-helper: Alternate between bottom-up and
 top-down placement
Message-ID: <20200429072500.bp5qkquyc2hc2emp@sirius.home.kraxel.org>
References: <20200422144055.27801-1-tzimmermann@suse.de>
 <20200422144055.27801-3-tzimmermann@suse.de>
 <20200423111808.fbh23br7jrkte3ih@sirius.home.kraxel.org>
 <da7bb4d1-852e-6372-cc2a-938561220483@suse.de>
 <20200423135709.3yuafqt3xouka4jp@sirius.home.kraxel.org>
 <b9315d4b-0f3e-712b-8a26-0ed5e3ac6f68@suse.de>
 <20200424093849.tiyukod37qeztaxb@sirius.home.kraxel.org>
 <2cbafd95-22cf-5471-9ee4-807b152828ec@suse.de>
MIME-Version: 1.0
In-Reply-To: <2cbafd95-22cf-5471-9ee4-807b152828ec@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: airlied@linux.ie, sam@ravnborg.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> It's not that easy. Current cursors n ast are statically allocated. As
> soon as you add dynamic cursors into the mix, you'd get OOMs.

Well, with the split you can simply allocate dynamic cursors with
top-bottom to keep them out of the way.  It's not 100% perfect, the area
where the cursors are allocated from has a bit less free vram, so the
split effectively isn't 50/50 but more like 49/51.  But hey, still alot
better than what we have today.

With two static cursors you can allocate one from TT_VRAM and one from
TT_PRIV so the remaining free vram is the same in both regions.

> If the framebuffer BO goes into VRAM and the cursor BO goes into PRIV,
> pinning the next framebuffer BO during a pageflip would send it to
> VRAM.

Oh, seems my idea outline was a bit to short.  The plan is *not* to
alternate between VRAM and PRIV on allocations.  The plan is to add both
PRIV and VRAM to the placement array when pinning the framebuffer.

ttm can simply place the framebuffers as it pleases and where it wants.
Due to the split it can't do a big blocking allocation in the middle
of vram though.

If you are going to pageflip you should have one framebuffer already
pinned (the one currently displayed).  If that happens to live TT_VRAM
ttm should be able to make room in TT_PRIV to pin the new framebuffer
you want pageflip to, and visa-versa.

ttm will only evict unpinned BOs if needed, when running with smaller
framebuffers ttm will happily keep more than two framebuffers in vram.
All fully automatic without vram helpers having to pay much attention
to the allocation strategy.

> I'm preparing v2 of this patch set. It'll get static cursors out of the
> way and make the feature opt-in.

I think with the split model there is no need to make that optional.

cheers,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
