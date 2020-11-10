Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A532AEA95
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4400C89F71;
	Wed, 11 Nov 2020 07:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87C289B67
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:27:59 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id f93so8630926qtb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mL4lHv4v6f7ZT4BJN8nX+avMz3HLjn+2qjGZAHM9Z+o=;
 b=NMsQyGZRP8MA81MNTiqD4NmvGrh4bo/w7mpW0Del/iZHZ769dPT6nPSfLNoTlShC0V
 fJNxo5Orw31ladk9afZ+RlXucSDYYo+cqFvjo5r7jcwE5hYwDNDc34Xt9GqAiEGszqJy
 HVfpgEbvUXXUlx15YcVyFuSmolf65MxRNBbN/joq686WTKE4EHoAk3SZ0YJ+O+Yvjf83
 tqfhkDlIiMfjV46YViu4C5B0xr/B1ZGfPubgrH/ecEaYA7zAKX5lGScZrPXCcehj/7oz
 olrobO5nom/dyIj7+SxHIWaKX4qrBqs5nBbTs4iEVYkPzDr3Abjt3YSTckUXWZ364FCi
 +Kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mL4lHv4v6f7ZT4BJN8nX+avMz3HLjn+2qjGZAHM9Z+o=;
 b=PxN/y0w/3QQBbLyqxmOiNFp3ygtgdxyQ6zo57oGGbZcu6aH+pXoE/tq1bFmZTGFNhC
 LLr+z5CrfbdKBbGqlsgNB32vUngifBTPiO1WPTPGsx5q26wpJ7QzLxqlOGb5WIoS7fSS
 Qt9bxz/bdmTGuOKrjM6zkrqPp9mdue2XQWhNLVn4fq7NHw3794/snDfpEReUCgg99i/R
 1dffYEKB314ZCouP3iDt3VG2k32DWDdbaIkEoPI7meWIZV+ZPw/ySPRXlQyZB+bmaz0x
 /Yf43uyDtUMy6CrIzz1SFs3IwoT3yk/W35aVpzVCYUzLHKmKphyFOixj1GTiD5KmHAIK
 tiyg==
X-Gm-Message-State: AOAM533+UMAvDIYTu5dGEAYq/NrF+8Ql2o8r4NwgztBMHb112Zf6QTa0
 j3J3DvxQlTYmVpN39sLWRQkkTw==
X-Google-Smtp-Source: ABdhPJxh9+6ksgH2lz+e9lvXOPrbzU81X5xD8AgBcSFWVDxLuvjMedgLvA+MtOTKtFH6hCzrYj8XJA==
X-Received: by 2002:ac8:7b92:: with SMTP id p18mr18057108qtu.105.1605018479024; 
 Tue, 10 Nov 2020 06:27:59 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id g11sm8255376qkl.30.2020.11.10.06.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:27:58 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kcUcn-002QwA-KP; Tue, 10 Nov 2020 10:27:57 -0400
Date: Tue, 10 Nov 2020 10:27:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v8 1/5] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201110142757.GM244516@ziepe.ca>
References: <1604616489-69267-1-git-send-email-jianxin.xiong@intel.com>
 <1604616489-69267-2-git-send-email-jianxin.xiong@intel.com>
 <20201106000851.GK36674@ziepe.ca>
 <MW3PR11MB45552DC0851F4490B2450EDFE5ED0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201106163953.GR36674@ziepe.ca>
 <20201110141445.GI401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201110141445.GI401619@phenom.ffwll.local>
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 10, 2020 at 03:14:45PM +0100, Daniel Vetter wrote:
> On Fri, Nov 06, 2020 at 12:39:53PM -0400, Jason Gunthorpe wrote:
> > On Fri, Nov 06, 2020 at 04:34:07PM +0000, Xiong, Jianxin wrote:
> > 
> > > > The user could specify a length that is beyond the dma buf, can
> > > > the dma buf length be checked during get?
> > > 
> > > In order to check the length, the buffer needs to be mapped. That can be done.
> > 
> > Do DMA bufs even have definitate immutable lengths? Going to be a
> > probelm if they can shrink
> 
> Yup. Unfortunately that's not document in the structures themselves,
> there's just some random comments sprinkled all over that dma-buf size is
> invariant, e.g. see the @mmap kerneldoc in dma_buf_ops:
> 
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf_ops#c.dma_buf_ops
> 
> "Because dma-buf buffers have invariant size over their lifetime, ..."
> 
> Jianxin, can you pls do a kerneldoc patch which updates the comment for
> dma_buf.size and dma_buf_export_info.size?

So we can check the size without doing an attachment?

That means the flow should be put back to how it was a series or two
ago where the SGL is only attached during page fault with the entire
programming sequence under the resv lock

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
