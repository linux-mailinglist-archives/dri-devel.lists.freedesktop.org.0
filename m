Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E0D00A39
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 03:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98DA10E2E5;
	Thu,  8 Jan 2026 02:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GjMdeRnn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E68910E2E5
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 02:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767838784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e58AvOofkAZMERAjCRNSCzg+OQ2/rgznWXJZC9l5yys=;
 b=GjMdeRnnRyRPQlmwXruumHLfkUVW9G+M1UcPNIyhpZEShaoJ0e1uvdoa8SHmH65tCQfF2d
 mQhPK9iAYcT/3R0yY67Dl2h450j63YCmERQE1kErs0jFQU6azeYgmmrmGJCz85bZge1Uff
 Zx1TeDxbiebEzBnmm3rbzuiOJEMWTLE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-C5u5R4y1Mv68vhPM4j7ZUg-1; Wed,
 07 Jan 2026 21:19:39 -0500
X-MC-Unique: C5u5R4y1Mv68vhPM4j7ZUg-1
X-Mimecast-MFC-AGG-ID: C5u5R4y1Mv68vhPM4j7ZUg_1767838776
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C016D18005A7; Thu,  8 Jan 2026 02:19:34 +0000 (UTC)
Received: from fedora (unknown [10.72.116.164])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4FDBC19560A2; Thu,  8 Jan 2026 02:19:23 +0000 (UTC)
Date: Thu, 8 Jan 2026 10:19:18 +0800
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
Message-ID: <aV8UJvkt7VGzHjxS@fedora>
References: <cover.1763725387.git.asml.silence@gmail.com>
 <74d689540fa200fe37f1a930165357a92fe9e68c.1763725387.git.asml.silence@gmail.com>
 <7b2017f4-02a3-482a-a173-bb16b895c0cb@amd.com>
 <20251204110709.GA22971@lst.de>
 <0571ca61-7b17-4167-83eb-4269bd0459fe@amd.com>
 <20251204131025.GA26860@lst.de> <aVnFnzRYWC_Y5zHg@fedora>
 <754b4cc9-20ab-4d87-85bf-eb56be058856@amd.com>
 <20260107160151.GA21887@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107160151.GA21887@lst.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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

On Wed, Jan 07, 2026 at 05:01:51PM +0100, Christoph Hellwig wrote:
> On Wed, Jan 07, 2026 at 04:56:05PM +0100, Christian König wrote:
> > > But I am wondering why not make it as one subsystem interface, such as nvme
> > > ioctl, then the whole implementation can be simplified a lot. It is reasonable
> > > because subsystem is exactly the side for consuming/importing the dma-buf.
> > 
> > Yeah that it might be better if it's more nvme specific came to me as well.
> 
> The feature is in no way nvme specific.  nvme is just the initial
> underlying driver.  It makes total sense to support this for any high
> performance block device, and to pass it through file systems.

But why does FS care the dma buffer attachment? Since high performance host controller
is exactly the dma buffer attachment point.

If the callback is added in `struct file_operations` for wiring dma buffer
and the importer(host contrller), you will see it is hard to let it cross device
mapper/raid or other stackable block devices.

Thanks, 
Ming

