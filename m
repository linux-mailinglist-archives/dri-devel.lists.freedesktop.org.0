Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A662A913A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8126E2A3;
	Fri,  6 Nov 2020 08:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB7A6EA6A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604651112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7EY7KZLT69FMPExC55DtbsXIf+PtOVltQz0z2/bK6wM=;
 b=HDA16VNSGzSdAvZHjrVzIMbwlZLgWJkpfNCWlKquXANhwZChdRwe0Bx0RYg09K4W+IejVX
 YFtr0rm02REwtBCaTRZTtTyfkJafhFSCUHh77SKX7lqO6bGJcRYqd8QTYA+cQWuFsya0vq
 kFQmkNyNdHd8Yl8dAJBKPMSbTpzqOtQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-ZAuNZxcGPIi5iKX0d4PmqA-1; Fri, 06 Nov 2020 03:25:08 -0500
X-MC-Unique: ZAuNZxcGPIi5iKX0d4PmqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A81186DD24;
 Fri,  6 Nov 2020 08:25:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E852C19C66;
 Fri,  6 Nov 2020 08:25:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 30F9611AB5; Fri,  6 Nov 2020 09:25:05 +0100 (CET)
Date: Fri, 6 Nov 2020 09:25:05 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/virtio: Fix a double free in virtio_gpu_cmd_map()
Message-ID: <20201106082505.oieppl6xpc3cng7q@sirius.home.kraxel.org>
References: <20201030114808.GD3251003@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201030114808.GD3251003@mwanda>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 30, 2020 at 02:48:08PM +0300, Dan Carpenter wrote:
> This is freed both here and in the caller (virtio_gpu_vram_map()) so
> it's a double free.  The correct place is only in the caller.
> 
> Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram object")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
