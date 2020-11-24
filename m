Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 454612C3AA5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0916E863;
	Wed, 25 Nov 2020 08:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2AC6E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 18:33:49 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id d5so7791913qtn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 10:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=odsbBeKSImj9d1Vv8raolHLvpmJrGUmkgBM9p8FNK3Q=;
 b=eLNZNZCQTAwNvP7xEmrTUCN5f1NDlDsjafaUM/HJUMB6EjXbHZ+bA1SNfHOcw83nD9
 ydyiFsplhGd8UN+pgnqim7lF0p6YxMhutezg55zTYcmVER4aXpTDApV0zsQ06T62pwwC
 hyOIl3cegy4mKfbIKMa2SC/5g0HeRUiqVO6On6jHP9EZbAckGKCaOkpFDqnlppjuTG/O
 BD0sdqpHptRUeecGpLSB5G9gJb+nJ2yztm/Fhf54ou5nz3bGH7T5x0JsVFWhA8hnUaLg
 dtbDcbcj+b6AjiblM4cU3e10jV6xM6azX/DlLqbgQ7e+dSro0Q0rlmHosPjSIVASBhXs
 K/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=odsbBeKSImj9d1Vv8raolHLvpmJrGUmkgBM9p8FNK3Q=;
 b=Sjr8Vqaw0YkR2CdeUExSCsBOOoRIt4QD/TQOW8f+6aUxkRcpkKRdQhMuvX8DOEymp5
 LeuS3SXXlbQeVAJF0rqR+FyqoCzVJpXBWasmLx2+kLnZxokLZN8KQtdF4pca915dklHG
 IyV3coyyaeTvq991Xk3AQShLIBFXNUmvvdH3sJXPkCpIuuz8bD/eIDGrmEqwZ/6NfPf/
 RhPyvwNbyUvJeOHODTZ6fnkVW/HKp0LbI15tkLfijZZwXvdshqjgMcvYSwHu2GQYj3jD
 z/IquUru52/qVAJID9ejNbwLi9WdKpIWGYA+qIB9tp7u8Ddt9l6Eqjwg1+BJ9tA2Kcyi
 nYtQ==
X-Gm-Message-State: AOAM531JMWPBAMPNGe5VkoloUSFOrqzpG2t2oTVpKbsrFsrMVCPdhCRH
 WG9hSHcVND0hDRrJl8vhEtutuw==
X-Google-Smtp-Source: ABdhPJzRkSGH4VGPVgluncPI5g1/7rvX0PdC+isyGXnvguOnIEpGZFiUrpVdGdfAGhO/9EaeK4vWEQ==
X-Received: by 2002:ac8:34ea:: with SMTP id x39mr5691723qtb.26.1606242828227; 
 Tue, 24 Nov 2020 10:33:48 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id i9sm13437558qtp.72.2020.11.24.10.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 10:33:47 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1khd8M-000tkv-TT; Tue, 24 Nov 2020 14:33:46 -0400
Date: Tue, 24 Nov 2020 14:33:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v11 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201124183346.GK5487@ziepe.ca>
References: <1606153919-104513-1-git-send-email-jianxin.xiong@intel.com>
 <1606153919-104513-2-git-send-email-jianxin.xiong@intel.com>
 <20201124093352.GB29715@infradead.org>
 <MW3PR11MB4555410B8487CA3B6627E463E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555410B8487CA3B6627E463E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Christoph Hellwig <hch@infradead.org>, Doug Ledford <dledford@redhat.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 24, 2020 at 06:24:43PM +0000, Xiong, Jianxin wrote:
> > From: Christoph Hellwig <hch@infradead.org>
> > Sent: Tuesday, November 24, 2020 1:34 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>;
> > Leon Romanovsky <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter,
> > Daniel <daniel.vetter@intel.com>
> > Subject: Re: [PATCH v11 1/4] RDMA/umem: Support importing dma-buf as user memory region
> > 
> > As these are mostly trivial wrappers around the EXPORT_SYMBOL_GPL dmabuf exports please stick to that export style.
> > 
> > > +++ b/drivers/infiniband/core/umem_dmabuf.h
> > > @@ -0,0 +1,11 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> > > +/*
> > > + * Copyright (c) 2020 Intel Corporation. All rights reserved.
> > > + */
> > > +
> > > +#ifndef UMEM_DMABUF_H
> > > +#define UMEM_DMABUF_H
> > > +
> > > +void ib_umem_dmabuf_release(struct ib_umem_dmabuf *umem_dmabuf);
> > > +
> > > +#endif /* UMEM_DMABUF_H */
> > 
> > Does this really need a separate header?
> 
> The symbol doesn't need to be exported otherwise it can be put into "ib_umem.h".
> Although the prototype could be put into the file where it is called directly, using a
> separate header file provides a cleaner interface.

It is fine to put this single symbol in ib_umem.h

Thanks
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
