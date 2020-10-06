Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFA28596D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 09:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA2F6E8B5;
	Wed,  7 Oct 2020 07:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0D6E4EC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 18:02:46 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id v123so17641507qkd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IMVs6pYP6d/JH2UQFKjNBBJvHP5ZySPzw+vwCQQZk3E=;
 b=Q9yZXIgw1Z8brYzywOU+NTbJr0RIEdkmGB9rnXIKLY10UJpuxteU80zjy2yZb/pJ+N
 DwDltyd6k63ppNLYv1qcBX92ji/NIACQqkFxfufiW8TR5CF1PKeiL9lGiz1fcbp+x39r
 QtG+vnjW7SqSa7hPdkQAX85GVGuWL3Diqo4XyC5LzOnqDGue2YCjVS2OlPOvA0gnczlu
 KJD9/Ce20nc7zp+4Mo1g001ngTDO7oZHCUPqiec761QXQiyduKwQ78rzMQWTtzCKjzyM
 n+thwXwsDE87+SB4N9GVIeDa9ZWqSgaiaovi7QJjW8F0Z6LPeXOEfqP3CifxDDUEZe6Y
 9vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IMVs6pYP6d/JH2UQFKjNBBJvHP5ZySPzw+vwCQQZk3E=;
 b=OUMIdFUijxh0gtJBD9sSln36QYokKdM/SjMJWgas5EiKk0uEMir8bk776Uc4K678Z6
 LVhoQNQoZw3wLfL3bih7BTPiLIMCDvbOJmhxjIDAN2gwYmBCsCIJ90tmYNu56qVzDi4t
 /esZog840qTsihmx79fhzyCoMLIBJ3jIXpXi7Cfk7K0SU4QoWYaoXN0JkhYLdGj321lf
 HWLdlLGk04FdsGcjR6a+EIZpE016NK4AJCjNwGHw5NOV+H3mVH+UpqE5Q2O7wKg3fubE
 Ss0CSFFJ765npidhkYq/+slYjmfEhkP+FweBYuFXkLW7l+vqqICaqik/cTVVST0m33ox
 +FlQ==
X-Gm-Message-State: AOAM5323zDZVB//miq2jT1JB2u0+/hwUoDLiSPTlS1GRxXchuALBRjNQ
 LDsht5ILluTq/8fZKc2+sRejrw==
X-Google-Smtp-Source: ABdhPJwI8moAHpeup6ss9nWh+yNHyqpY+GdlISjjWS24npzay6ZqhbIeHm9O4hBKuOXaL/lBlsct7g==
X-Received: by 2002:a37:a84d:: with SMTP id r74mr3290088qke.411.1602007365803; 
 Tue, 06 Oct 2020 11:02:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id j9sm2784712qtq.36.2020.10.06.11.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 11:02:45 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kPrIS-000cYy-A0; Tue, 06 Oct 2020 15:02:44 -0300
Date: Tue, 6 Oct 2020 15:02:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH v3 1/4] RDMA/umem: Support importing dma-buf as user
 memory region
Message-ID: <20201006180244.GJ5177@ziepe.ca>
References: <1601838751-148544-1-git-send-email-jianxin.xiong@intel.com>
 <1601838751-148544-2-git-send-email-jianxin.xiong@intel.com>
 <20201005131302.GQ9916@ziepe.ca>
 <MW3PR11MB455572267489B3F6B1C5F8C5E50C0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201006092214.GX438822@phenom.ffwll.local>
 <20201006154956.GI5177@ziepe.ca>
 <20201006163420.GB438822@phenom.ffwll.local>
 <CAKMK7uG1RpDQ9ZO=VxkNuGjGPqkAzMQDgi89eSjDoMerMQ4+9A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG1RpDQ9ZO=VxkNuGjGPqkAzMQDgi89eSjDoMerMQ4+9A@mail.gmail.com>
X-Mailman-Approved-At: Wed, 07 Oct 2020 07:22:33 +0000
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 06, 2020 at 07:24:30PM +0200, Daniel Vetter wrote:
> On Tue, Oct 6, 2020 at 6:34 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Oct 06, 2020 at 12:49:56PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 06, 2020 at 11:22:14AM +0200, Daniel Vetter wrote:
> > > >
> > > > For reinstanting the pages you need:
> > > >
> > > > - dma_resv_lock, this prevents anyone else from issuing new moves or
> > > >   anything like that
> > > > - dma_resv_get_excl + dma_fence_wait to wait for any pending moves to
> > > >   finish. gpus generally don't wait on the cpu, but block the dependent
> > > >   dma operations from being scheduled until that fence fired. But for rdma
> > > >   odp I think you need the cpu wait in your worker here.
> > >
> > > Reinstating is not really any different that the first insertion, so
> > > then all this should be needed in every case?
> >
> > Yes. Without move_notify we pin the dma-buf into system memory, so it
> > can't move, and hence you also don't have to chase it. But with
> > move_notify this all becomes possible.
> 
> I just realized I got it wrong compared to gpus. I needs to be:
> 1. dma_resv_lock
> 2. dma_buf_map_attachment, which might have to move the buffer around
> again if you're unlucky
> 3. wait for the exclusive fence
> 4. put sgt into your rdma ptes
> 5 dma_resv_unlock
> 
> Maybe also something we should document somewhere for dynamic buffers.
> Assuming I got it right this time around ... Christian?

#3 between 2 and 4 seems strange - I would expect once
dma_buf_map_attachment() returns that the buffer can be placed in the
ptes. It certianly can't be changed after the SGL is returned..

Feels like #2 should serialize all this internally? An API that
returns invalidate data sometimes is dangerous :)

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
