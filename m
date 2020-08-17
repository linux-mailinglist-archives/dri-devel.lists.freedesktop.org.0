Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43C246240
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 11:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73189E63;
	Mon, 17 Aug 2020 09:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A0C89E63
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 09:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597655761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CnKL378IV+wY20SBkSkZD9FCOzYdKcrFl3qGCbP8k90=;
 b=TQGiWdWZEuQb5ZyukCcwycU6rqsASYDjIujaRz9g83bDuNpcQ4KbEXobrI0zZBJVftCzTI
 Zsa59xhhZ/B+iTWHsU50sO8OBDyHcbgTKo7LlUIcVH341AghIA1+4qFxY2rTcbCc1iWqdP
 qlXyJ5mZrA54ze4mrCiDGnlj0i2xDyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-YA-RI1cYO5yS2F68mbxZkw-1; Mon, 17 Aug 2020 05:15:59 -0400
X-MC-Unique: YA-RI1cYO5yS2F68mbxZkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F8861014E15;
 Mon, 17 Aug 2020 09:15:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com
 [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C89575C63F;
 Mon, 17 Aug 2020 09:15:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E4F019D17; Mon, 17 Aug 2020 11:15:57 +0200 (CEST)
Date: Mon, 17 Aug 2020 11:15:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Subject: Re: [PATCH] drm/virtio: Revert "drm/virtio: Call the right shmem
 helpers"
Message-ID: <20200817091557.yknhdgti6yo4jawc@sirius.home.kraxel.org>
References: <20200615230500.551-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200615230500.551-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 04:05:00PM -0700, Gurchetan Singh wrote:
> This reverts commit d323bb44e4d23802eb25d13de1f93f2335bd60d0.
> 
> Fixes a double-free regression:
> 
> [    4.357928]  drm_gem_shmem_free_object+0xb4/0x100
> [    4.358983]  virtio_gpu_dequeue_ctrl_func+0xd9/0x290
> [    4.360343]  process_one_work+0x1d2/0x3a0
> [    4.361581]  worker_thread+0x45/0x3c0
> [    4.362645]  kthread+0xf6/0x130
> [    4.363543]  ? process_one_work+0x3a0/0x3a0
> [    4.364770]  ? kthread_park+0x80/0x80
> [    4.365799]  ret_from_fork+0x35/0x40
> [    4.367103] Modules linked in:
> [    4.367958] CR2: 0000000000000018
> [    4.368857] ---[ end trace db84f7a2974d5c79 ]---
> [    4.370118] RIP: 0010:dma_direct_unmap_sg+0x1f/0x60
> 
> In addition, virtio has it's own set of dma-ops so there's not an
> obviously clean way to transition to shmem helpers.
> 
> Fixes: d323bb44e4d2 ("drm/virtio: Call the right shmem helpers")
> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>

Pushed to drm-misc-next (will cherry-pick into -fixes once that is
rebased to 5.9-rc1 or newer).

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
