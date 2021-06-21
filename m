Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B2C3AEADB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F6C6E170;
	Mon, 21 Jun 2021 14:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CB06E170
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:12:19 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id l2so10712761qtq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8oJQZs0I5J7jBEQyNRVEZxX4UpsM7b71jbLdhb7hAG8=;
 b=FvMNMxA3fW7M2xLUZMwKYbvWPDaZY4pFbcNZf8cAZEsq+AvHkkjdBFOY2pviHteDwO
 C4Wu0SMltMsKCjOubP50lFxgNeNMSaZYEKEX7+OBgiaxrMgCwsV2iK7lgX8/+KZlk4J4
 aF5ixG7g2CBXbZTlvfOQubAF3wyQTRyw74T4Hf0/YCR0yoYa7w3a6op9w4hFlDeDVvyE
 l/inPVDU6NWf0eU0BOoi/ztftjOhg9DHQyzvWKPkZf5nnfR7X6d4ilITeIR/5CPUHzeR
 Y5yxMVmbjISlSpxOsRA2pU1pIKL7Nm9mg1e4mEqnBLS+F4tdRuCspUjlf0CxKRwGVOjA
 H0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8oJQZs0I5J7jBEQyNRVEZxX4UpsM7b71jbLdhb7hAG8=;
 b=qnQhzBdspRvKT2oGiVnUG1hJnLHhPqKvA/v8Zo6t3QUC+QhFjtuWqdwBjScDKYNdLy
 2API71n8rMAbPl2a7AaEMUY4gr/Zwl9KwjiAtxD8ySZrhnJRYD98E2FAVc9j3LUpfv8H
 QnhrRe6j5haAIiCj0z+oeYx5uuf6DQHmKhXtlllUZSoSFKlX/yXTpSbt2fiAiqFHU5aL
 Uqx6eTqJWd4SzjMnejxTuhCt6tlt86Iczzp+BnagPcKT4T6bgcXuaGHXyWNIviSaUgk/
 fUKLjzIEXGmIgZppaFwW/atggBKT0rQc+ayCPWWOiyBbwVM73mc70CbemQd8UusHXEZY
 71bA==
X-Gm-Message-State: AOAM533l0JReElYo2tr7EhxVU6d04NYdU3/fGjKfdW0vUZQTNpTmFRRD
 O64kqlpkbGzCEwP9acCIFgAaYg==
X-Google-Smtp-Source: ABdhPJxB8jGNP0gwOLDPKvz+lnw80kFEjkxZj8vO8hWTPyGaIbP4EFePcOB/Ss3vtT0IcT6gYom4xg==
X-Received: by 2002:ac8:5508:: with SMTP id j8mr10071894qtq.134.1624284738855; 
 Mon, 21 Jun 2021 07:12:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id r22sm10570497qtm.82.2021.06.21.07.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:12:18 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lvKev-009WcM-8s; Mon, 21 Jun 2021 11:12:17 -0300
Date: Mon, 21 Jun 2021 11:12:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/2] habanalabs: define uAPI to export FD for DMA-BUF
Message-ID: <20210621141217.GE1096940@ziepe.ca>
References: <20210618123615.11456-1-ogabbay@kernel.org>
 <CAKMK7uFOfoxbD2Z5mb-qHFnUe5rObGKQ6Ygh--HSH9M=9bziGg@mail.gmail.com>
 <YNCN0ulL6DQiRJaB@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNCN0ulL6DQiRJaB@kroah.com>
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
Cc: Gal Pressman <galpress@amazon.com>, sleybo@amazon.com,
 linux-rdma <linux-rdma@vger.kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Oded Gabbay <ogabbay@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Doug Ledford <dledford@redhat.com>, Tomer Tayar <ttayar@habana.ai>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:02:10PM +0200, Greg KH wrote:
> On Mon, Jun 21, 2021 at 02:28:48PM +0200, Daniel Vetter wrote:

> > Also I'm wondering which is the other driver that we share buffers
> > with. The gaudi stuff doesn't have real struct pages as backing
> > storage, it only fills out the dma_addr_t. That tends to blow up with
> > other drivers, and the only place where this is guaranteed to work is
> > if you have a dynamic importer which sets the allow_peer2peer flag.
> > Adding maintainers from other subsystems who might want to chime in
> > here. So even aside of the big question as-is this is broken.
> 
> From what I can tell this driver is sending the buffers to other
> instances of the same hardware,

A dmabuf is consumed by something else in the kernel calling
dma_buf_map_attachment() on the FD.

What is the other side of this? I don't see any
dma_buf_map_attachment() calls in drivers/misc, or added in this patch
set.

AFAIK the only viable in-tree other side is in mlx5 (look in
umem_dmabuf.c)

Though as we already talked habana has their own networking (out of
tree, presumably) so I suspect this is really to support some out of
tree stuff??

Jason
