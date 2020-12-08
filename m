Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B740F2D3D58
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 09:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB9BC6E131;
	Wed,  9 Dec 2020 08:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C83A6E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 18:59:18 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id f14so4155602qto.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Dec 2020 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9sSR/G0iajxP79sAMRXtsqqOVlTG6SJFKBgyvVDhRlA=;
 b=d24RgsZ2dY3yg2s9gT27ixnsxarcSd8idMtkqjVGsflu8OKBdmx+R2xZpdEfehi5h1
 wsWoyB7TEyVi0tMQrziIh9wqoEV4CHrqwMVa9ZzvVQrI7+S1uhaXDE+wZ6KBnDbu2j07
 0eVL4TO4ad0n/ffatp+MiRMFysqbMeTJAGXQ/cIkQn99iZinfNub6qPBjSQCvuQ7hghk
 eSrNrOXSKSZfu2K49CvR/viUdI9Bh2mtwJKAmk2xc9g2YQfnLv1LlMmdHR0ZB3qR3XRe
 ltHttZkYOJVdAsKDGsgnW5q1CG4jEOoBQpDftata+QUZOQWi0RhDdXNnhQbca7rY9Jbv
 GqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9sSR/G0iajxP79sAMRXtsqqOVlTG6SJFKBgyvVDhRlA=;
 b=C4rlbevJy60Zb0iFsol3xI6WfjQceCCXll3iYmFVTwK/HvGIxd2jn7yD77W7vqWUAg
 bziSLVBLPhKY0jK6cBILygdUJD8+3McozeL4GkKuGecvF7nKmr6JDuqHXwJWetzDCrxC
 JssbI2Pbcm6JSdKGWE/BaMt/v143gZnn9u8ywftl/RGlxIgCB9DkrjnSG/vyvAryjy60
 +czWa+EVWPYDdaNFj5g/L0al+0Q3CH0Yy1bzvpCykWAP/Z5cJD4j7MHrx/K8+9RgNIBb
 W0aBWziCJ8dF3yWwtEDb7ZhAmIYcwXH2TpY7HWYL0sz7Z+7Yw3OaVVm1RaaiMZ+Wzt34
 FPxQ==
X-Gm-Message-State: AOAM530KnjALbSHHyWGNCIe/SlVOJcXNXLxktGBlY5UzW/R02QGDMacV
 UE01KmUfrV9S+RSco3mw7p327Q==
X-Google-Smtp-Source: ABdhPJxsADdJkiPwe0Gy1hcj7gLbSLG1LhGiy5Oa+UIfzViYvRxyacUzGMGBsmHeM/l+3idH436LOg==
X-Received: by 2002:ac8:7192:: with SMTP id w18mr31968213qto.149.1607453957166; 
 Tue, 08 Dec 2020 10:59:17 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id q194sm5807666qka.102.2020.12.08.10.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:59:16 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kmiCh-007zxe-Ue; Tue, 08 Dec 2020 14:59:15 -0400
Date: Tue, 8 Dec 2020 14:59:15 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v13 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201208185915.GO5487@ziepe.ca>
References: <1607379353-116215-1-git-send-email-jianxin.xiong@intel.com>
 <1607379353-116215-2-git-send-email-jianxin.xiong@intel.com>
 <20201208070532.GE4430@unreal>
 <MW3PR11MB45554A727DA7940D81FE1C14E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45554A727DA7940D81FE1C14E5CD0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 09 Dec 2020 08:32:01 +0000
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
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 08, 2020 at 06:13:20PM +0000, Xiong, Jianxin wrote:

> > > +static inline struct ib_umem *ib_umem_dmabuf_get(struct ib_device *device,
> > > +						 unsigned long offset,
> > > +						 size_t size, int fd,
> > > +						 int access,
> > > +						 struct dma_buf_attach_ops *ops) {
> > > +	return ERR_PTR(-EINVAL);
> > 
> > Probably, It should be EOPNOTSUPP and not EINVAL.
> 
> EINVAL is used here to be consistent with existing definitions in the same file.

They may be wrong, EOPNOTSUPP is right for this situation

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
