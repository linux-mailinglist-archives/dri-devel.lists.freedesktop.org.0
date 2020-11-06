Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821BD2AADFC
	for <lists+dri-devel@lfdr.de>; Sun,  8 Nov 2020 23:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C186897AC;
	Sun,  8 Nov 2020 22:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9552A6E059
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:39:55 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s14so1595140qkg.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6V7clZhQAMmnpPbxTHFIjFjrz3TNWvnMnGpi4wE2kog=;
 b=MiFjd5eidEgSuTk8BE49VDLRwB7dT/rglcAHo/tv2MrzUsEcSfp/RlJMO4pm/8KFRo
 1HFmNj2EefwqoF5hjflh1bWjprMMl3dJmqz1+4hWR5RyuP6CmrMY/NsBoLlBbPvv1tTA
 VlybEmOkkputMcxJe7TteoW+K3Kd6yl+Hrxk4HhcX5h/codWvjQRD3XCmRPYuBpQbFvk
 jh5u4+mf3qk1AUxQFP6V2L++epigln8ZMwocqp049+jTG6BqvF3hnxTIw8Ud1JQRxD5i
 HTsTals+r5mzd5AzidPO27e2JKBjjrsKwCQCWGko7A7Y6JgK9urIzuXwRo7cTLwfvscc
 fTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6V7clZhQAMmnpPbxTHFIjFjrz3TNWvnMnGpi4wE2kog=;
 b=PvY8ax2WZVt/ZZBdHpXhfJmDWR2horOC1NMTzzhIhfgTs29xP4kmn6Aa8hb35OOXyK
 +zxyehkoBPHaNlWFYTIVCmVL1KnckBoI0YDIxfdPupWI1uTF4ARG+WQ016sjRxnjKlre
 lcs1MLnugqyi3k2Qe3TEMw/sedXV0MVTwZNXgc8R7AunIF+HRaLGT6zk+lXZzck67Xho
 uhBzPJOMdCn/DNCAe2f6JpSe9sZMH838Y3+kHS7KW5fFQO7X5eDI3OuTekbHGqK4e/4O
 ylAcQczdtgqc+/jQeUYXf9dZ1dqdovBpVlfShm0B+ljHsJrgzfZHbAZ2Kkdi0r/5qjps
 fGJg==
X-Gm-Message-State: AOAM530PBGoBi5PMkMNIO/9qM4bWsPm43NVYSXIgw1a1mv9NYf7NpKZ3
 DeyY5u/mek3o1827i3NB383NmQ==
X-Google-Smtp-Source: ABdhPJzw3rNWYSOmevoJiZrNrxTU6VHvIn17N4say8BwYnm+neSM8U/WKJVyk+gduYJ8DKnqX9aLsA==
X-Received: by 2002:a05:620a:5a2:: with SMTP id
 q2mr2296229qkq.335.1604680794855; 
 Fri, 06 Nov 2020 08:39:54 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id 22sm759249qtw.61.2020.11.06.08.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:39:54 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kb4mH-000xgU-5p; Fri, 06 Nov 2020 12:39:53 -0400
Date: Fri, 6 Nov 2020 12:39:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201106163953.GR36674@ziepe.ca>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-2-git-send-email-jianxin.xiong@intel.com>
 <20201106000851.GK36674@ziepe.ca>
 <MW3PR11MB45552DC0851F4490B2450EDFE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45552DC0851F4490B2450EDFE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Sun, 08 Nov 2020 22:49:24 +0000
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

On Fri, Nov 06, 2020 at 04:34:07PM +0000, Xiong, Jianxin wrote:

> > The user could specify a length that is beyond the dma buf, can
> > the dma buf length be checked during get?
> 
> In order to check the length, the buffer needs to be mapped. That can be done.

Do DMA bufs even have definitate immutable lengths? Going to be a
probelm if they can shrink

> > Also page_size can be 0 because iova is not OK. iova should be
> > checked for alignment during get as well:
> > 
> >   iova & (PAGE_SIZE-1) == umem->addr & (PAGE_SIZE-1)
> 
> If ib_umem_dmabuf_map_pages is called during get this error is automatically caught.

The ib_umem_find_best_pgsz() checks this equation, yes.

So you'd map the sgl before allocating the mkey? This then checks the
length and iova?

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
