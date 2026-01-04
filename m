Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5458CF07C8
	for <lists+dri-devel@lfdr.de>; Sun, 04 Jan 2026 02:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12AC10E14C;
	Sun,  4 Jan 2026 01:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U9bEmwvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246B210E002
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jan 2026 01:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767490998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JOHCJ6ws2PdEVpdMzUbfxY52ykfjA/AadGdfIrG4o2w=;
 b=U9bEmwvHPK8Lk13UVDsT7YluTsNWUi8kEqL4pw1ZjIQJbC+fL4XaG6LrXLkAUyRt7w+Irg
 T7u2Wts0tHBoenJMe7xCVHHH99cS/pUJno1ZVDflB8fyCw98iBdK1QtkSQmKPm/D1v9oXP
 dSsxDjWQhmq6KlM4RPo6qVbMq9hyi8A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-8xYrOUkAPh6aSHp3iCO0tw-1; Sat,
 03 Jan 2026 20:43:15 -0500
X-MC-Unique: 8xYrOUkAPh6aSHp3iCO0tw-1
X-Mimecast-MFC-AGG-ID: 8xYrOUkAPh6aSHp3iCO0tw_1767490993
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 62C001956080; Sun,  4 Jan 2026 01:43:12 +0000 (UTC)
Received: from fedora (unknown [10.72.116.132])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 36773180044F; Sun,  4 Jan 2026 01:43:00 +0000 (UTC)
Date: Sun, 4 Jan 2026 09:42:55 +0800
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
Message-ID: <aVnFnzRYWC_Y5zHg@fedora>
References: <cover.1763725387.git.asml.silence@gmail.com>
 <74d689540fa200fe37f1a930165357a92fe9e68c.1763725387.git.asml.silence@gmail.com>
 <7b2017f4-02a3-482a-a173-bb16b895c0cb@amd.com>
 <20251204110709.GA22971@lst.de>
 <0571ca61-7b17-4167-83eb-4269bd0459fe@amd.com>
 <20251204131025.GA26860@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251204131025.GA26860@lst.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

On Thu, Dec 04, 2025 at 02:10:25PM +0100, Christoph Hellwig wrote:
> On Thu, Dec 04, 2025 at 12:09:46PM +0100, Christian König wrote:
> > > I find the naming pretty confusing a well.  But what this does is to
> > > tell the file system/driver that it should expect a future
> > > read_iter/write_iter operation that takes data from / puts data into
> > > the dmabuf passed to this operation.
> > 
> > That explanation makes much more sense.
> > 
> > The remaining question is why does the underlying file system / driver
> > needs to know that it will get addresses from a DMA-buf?
> 
> This eventually ends up calling dma_buf_dynamic_attach and provides
> a way to find the dma_buf_attachment later in the I/O path.

Maybe it can be named as ->dma_buf_attach()?  For wiring dma-buf and the
importer side(nvme).

But I am wondering why not make it as one subsystem interface, such as nvme
ioctl, then the whole implementation can be simplified a lot. It is reasonable
because subsystem is exactly the side for consuming/importing the dma-buf.
 

Thanks, 
Ming

