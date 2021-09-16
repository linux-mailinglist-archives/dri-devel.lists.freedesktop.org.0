Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB0040D2E8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 07:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5189E41;
	Thu, 16 Sep 2021 05:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BE989E41
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 05:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631771453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fjvMsgtSgd9kdpgfQ0wGpIJ0Wdr3T0ksytJT7zLYu40=;
 b=bVDf9l/G0yyxmONZKZTHcEh6LzGToPRTMbnGfxq+KZCgyKaGvl1nBf9QDC5VyOSzCuJ3FW
 2fFJSwn6j49evo8ZZAELG1LUdtKZVfyl/pxgGegZJBV0ECYHhb5Nx9sXtvUxoWPhbLoDO8
 m1gpICB7vANi7dRugMMj/5AnPs+GPdc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-VGWVq2JWNR2Kps0dKmPPGw-1; Thu, 16 Sep 2021 01:50:49 -0400
X-MC-Unique: VGWVq2JWNR2Kps0dKmPPGw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8390B802936;
 Thu, 16 Sep 2021 05:50:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D8E19736;
 Thu, 16 Sep 2021 05:50:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7490B18000A9; Thu, 16 Sep 2021 07:50:46 +0200 (CEST)
Date: Thu, 16 Sep 2021 07:50:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org
Subject: Re: [virtio-dev] Re: [PATCH v1 08/12] drm/virtio: implement context
 init: stop using drv->context when creating fence
Message-ID: <20210916055046.jppdym2g7mhdxcbv@sirius.home.kraxel.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-9-gurchetansingh@chromium.org>
 <20210915055350.sgfadzktcl5bngtq@sirius.home.kraxel.org>
 <CAAfnVB=z80_cK_Z3Gkk1WXUopkuPiF67QNrD8O8StmijApYqcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfnVB=z80_cK_Z3Gkk1WXUopkuPiF67QNrD8O8StmijApYqcQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  Hi,

> > I guess you need to also update virtio_gpu_fence_event_process()
> > then?  It currently has the strict ordering logic baked in ...
> 
> The update to virtio_gpu_fence_event_process was done as a preparation a
> few months back:
> 
> https://cgit.freedesktop.org/drm/drm-misc/commit/drivers/gpu/drm/virtio/virtgpu_fence.c?id=36549848ed27c22bb2ffd5d1468efc6505b05f97

Ah, ok, missed the detail that the context check is already there.

thanks,
  Gerd

