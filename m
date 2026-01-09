Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB02D06CCB
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 03:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEEF10E002;
	Fri,  9 Jan 2026 02:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LVTKDf/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C011810E002
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767924684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=09fZuRtKBthvUPFZRfmDU+5G5cxlC+xjTolnVnh0EhI=;
 b=LVTKDf/HaWrjfx7phLferX+Qj5m+dBz8cAdm0QxQPevy/Mm7baMmdRDnscLs3DgfGVL5zb
 JJxcSVol8o/3HnWZtr/typ5zFdtRNJFNjF1HckAvuMiggMbx8jyEcJ6PTdhFIpnswh1t3H
 dWHkFm8WvgsHEvNlCmP+xDCm/puwZhk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-A_n-5HUKMWaEy_K0o4HrYg-1; Thu,
 08 Jan 2026 21:11:20 -0500
X-MC-Unique: A_n-5HUKMWaEy_K0o4HrYg-1
X-Mimecast-MFC-AGG-ID: A_n-5HUKMWaEy_K0o4HrYg_1767924676
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 5CBA9195608F; Fri,  9 Jan 2026 02:11:14 +0000 (UTC)
Received: from fedora (unknown [10.72.116.172])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E4C1230002D5; Fri,  9 Jan 2026 02:11:02 +0000 (UTC)
Date: Fri, 9 Jan 2026 10:10:57 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC v2 01/11] file: add callback for pre-mapping dmabuf
Message-ID: <aWBjsa2RZ_uaO9Ns@fedora>
References: <74d689540fa200fe37f1a930165357a92fe9e68c.1763725387.git.asml.silence@gmail.com>
 <7b2017f4-02a3-482a-a173-bb16b895c0cb@amd.com>
 <20251204110709.GA22971@lst.de>
 <0571ca61-7b17-4167-83eb-4269bd0459fe@amd.com>
 <20251204131025.GA26860@lst.de> <aVnFnzRYWC_Y5zHg@fedora>
 <754b4cc9-20ab-4d87-85bf-eb56be058856@amd.com>
 <20260107160151.GA21887@lst.de> <aV8UJvkt7VGzHjxS@fedora>
 <20260108101703.GA24709@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108101703.GA24709@lst.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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

On Thu, Jan 08, 2026 at 11:17:03AM +0100, Christoph Hellwig wrote:
> On Thu, Jan 08, 2026 at 10:19:18AM +0800, Ming Lei wrote:
> > > The feature is in no way nvme specific.  nvme is just the initial
> > > underlying driver.  It makes total sense to support this for any high
> > > performance block device, and to pass it through file systems.
> > 
> > But why does FS care the dma buffer attachment? Since high performance
> > host controller is exactly the dma buffer attachment point.
> 
> I can't parse what you're trying to say here.

dma buffer attachment is simply none of FS's business.

> 
> > If the callback is added in `struct file_operations` for wiring dma buffer
> > and the importer(host contrller), you will see it is hard to let it cross device
> > mapper/raid or other stackable block devices.
> 
> Why?
> 
> But even when not stacking, the registration still needs to go
> through the file system even for a single device, never mind multiple
> controlled by the file system.

dma_buf can have multiple importers, so why does it have to go through FS for
single device only?

If the registered buffer is attached to single device before going
through FS, it can not support stacking block device, and it can't or not
easily to use for multiple block device, no matter if they are behind same
host controller or multiple.


Thanks,
Ming

