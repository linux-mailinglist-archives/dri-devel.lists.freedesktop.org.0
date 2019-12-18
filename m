Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D84124167
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C126E24D;
	Wed, 18 Dec 2019 08:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717126E24D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576656838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V9cLip3UNjak0tIFgWYSbaNAChvr0G0J18FZyJz2CGc=;
 b=S8kOx+esAWoyuOiSk8yhrCZWyBafnk3trFENl+GZbC7aQqk3LIpbFuhEVMzHZi0MCs4ziG
 PLYZtRKz3M9o6oA5Wtlqt3Thkg3pRyDyxTC9UqAMVU14lCnRPrMnOwORyT3fCysfQRsqFn
 ARiRZIczcMroYc/psTA0RpcMx15mD4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-n-eeZ0RPMluBt-Wlrf98TQ-1; Wed, 18 Dec 2019 03:13:51 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BFB8024D3;
 Wed, 18 Dec 2019 08:13:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39916384;
 Wed, 18 Dec 2019 08:13:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6CBD7EB9; Wed, 18 Dec 2019 09:13:49 +0100 (CET)
Date: Wed, 18 Dec 2019 09:13:49 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] udmabuf: fix dma-buf cpu access
Message-ID: <20191218081349.zfjguiqrpbj4aivm@sirius.home.kraxel.org>
References: <20191216114207.g7afikcr4fssgx72@sirius.home.kraxel.org>
 <20191217230228.453-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20191217230228.453-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: n-eeZ0RPMluBt-Wlrf98TQ-1
X-Mimecast-Spam-Score: 0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 03:02:28PM -0800, Gurchetan Singh wrote:
> I'm just going to put Chia's review comment here since it sums
> the issue rather nicely:
> 
> "(1) Semantically, a dma-buf is in DMA domain.  CPU access from the
> importer must be surrounded by {begin,end}_cpu_access.  This gives the
> exporter a chance to move the buffer to the CPU domain temporarily.
> 
> (2) When the exporter itself has other means to do CPU access, it is
> only reasonable for the exporter to move the buffer to the CPU domain
> before access, and to the DMA domain after access.  The exporter can
> potentially reuse {begin,end}_cpu_access for that purpose.
> 
> Because of (1), udmabuf does need to implement the
> {begin,end}_cpu_access hooks.  But "begin" should mean
> dma_sync_sg_for_cpu and "end" should mean dma_sync_sg_for_device.
> 
> Because of (2), if userspace wants to continuing accessing through the
> memfd mapping, it should call udmabuf's {begin,end}_cpu_access to
> avoid cache issues."
> 
> Reported-by: Chia-I Wu <olvaffe@gmail.com>
> Suggested-by: Chia-I Wu <olvaffe@gmail.com>
> Fixes: 284562e1f348 ("udmabuf: implement begin_cpu_access/end_cpu_access hooks")
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
