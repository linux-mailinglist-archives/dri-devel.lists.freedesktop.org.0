Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0129A1BDAD6
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 13:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525CE6E466;
	Wed, 29 Apr 2020 11:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472E76E466
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 11:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588160409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mqMgQo5IcYAB9Ei3ggszTVdUwAn8W39aKOIR9CnuqI=;
 b=Y8KDe8L8jcHmN2jpsQDtf3/DAGhSUsMI+Xld7OFmLGQkcdodGCpEv2ZjexNeOSRanWj1BB
 Ka+wMTa3RS6h7emnmxpy0i+hYsrggBlEETlsAzsN0y7rlyIczm/6wSGumkOKHMARJWyF0p
 EajK+pXAxQw8RT8yoaVfo1f9W8SNL2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-kggWqf7OMTmb1_CVmQuQ8Q-1; Wed, 29 Apr 2020 07:40:07 -0400
X-MC-Unique: kggWqf7OMTmb1_CVmQuQ8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48474835B40;
 Wed, 29 Apr 2020 11:40:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA04660BF4;
 Wed, 29 Apr 2020 11:40:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B87B31753B; Wed, 29 Apr 2020 13:40:01 +0200 (CEST)
Date: Wed, 29 Apr 2020 13:40:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vasily Averin <vvs@virtuozzo.com>
Subject: Re: [PATCH] drm/qxl: qxl_release use after free
Message-ID: <20200429114001.k4yhfssob7l6otnk@sirius.home.kraxel.org>
References: <20200429082837.uedcapxmennuc5a2@sirius.home.kraxel.org>
 <fa17b338-66ae-f299-68fe-8d32419d9071@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <fa17b338-66ae-f299-68fe-8d32419d9071@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Caicai <caizhaopeng@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 12:01:24PM +0300, Vasily Averin wrote:
> qxl_release should not be accesses after qxl_push_*_ring_release() calls:
> userspace driver can process submitted command quickly, move qxl_release
> into release_ring, generate interrupt and trigger garbage collector.
> 
> It can lead to crashes in qxl driver or trigger memory corruption
> in some kmalloc-192 slab object
> 
> Gerd Hoffmann proposes to swap the qxl_release_fence_buffer_objects() +
> qxl_push_{cursor,command}_ring_release() calls to close that race window.
> 
> cc: stable@vger.kernel.org
> Fixes: f64122c1f6ad ("drm: add new QXL driver. (v1.4)")
> Signed-off-by: Vasily Averin <vvs@virtuozzo.com>

Pushed to drm-misc-fixes.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
