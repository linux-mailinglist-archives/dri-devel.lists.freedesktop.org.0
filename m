Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984C2CB6CD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 09:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FDA6EA36;
	Wed,  2 Dec 2020 08:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9916E9A4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 00:39:25 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id 4so1839167qvh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Dec 2020 16:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uqFnA4wlIT9Sy7S8bA1zmlv7ZeBGWwkq7YIi+6/Fl7M=;
 b=eosQAu2h9055luOQLikH91uBAk1IZRYNH2FBpVUNBk3cIAzEr2iNx1WVdSEvkNhnC+
 vQrQAKnmUbjRjqEgOokhJlbpdGzIzqXWHOwE90vWFjDZe7vVoHPVkfXG7ysGahxbj8ST
 Cbxje4qi4tD4m6NxuwtGlADjLvXOm2jT25GaCaxaIrrvKeZTDmgWk8LGQlgzAt1VyEjz
 kMWios7ott+E5MY1U4wIKvyhr4ZrCB+zdLBcpecnbJL4ViQj82ToZftwJL2e5+odl5Q9
 Ta66UcnHpf5NWYsGwhDSHShCp8+SubMxjQ+db8u0jP7geEyrdOfReXIgczufYiCyj2t1
 J5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uqFnA4wlIT9Sy7S8bA1zmlv7ZeBGWwkq7YIi+6/Fl7M=;
 b=aRZzPyacxQPjMwtxv0rH+9NWgnR2BfU/28+bVzR0C0Xj5t2HjX1AYceGwHC+JIxLDk
 +PUF7LhwURe32fbazq6bM3GXOA2ivSJLPg2AuGg9PWPfNs28+V4yIk8Uka+D2Ov5lmfL
 jiajeYm4hcNYICrTbbhHwElg+uZ0VfyzckBaLpYCjiZsy5FuuBNRTS9+LlZnBIrCQbbr
 YytLuDWPdifyLDOdSTJBlb3Iyd594lNkRVDZKPPy4+WNTGj+o3c/9kdBhz6DAAnCuWqL
 0mUI3bvn9twJXsxgNuaXc/XNOszcmih5NJevw4yMWZ+nbPo7l1qct7COL0JU0ts5Zfqo
 GBdA==
X-Gm-Message-State: AOAM530vR70pXU31SYqL6QAbrfaEErbTMQHq97DO861RiwXMjWkFctQN
 h70car4Du8wh91JcMotjhyE2DA==
X-Google-Smtp-Source: ABdhPJyZ+D1oBjr6GvYx10q3kexS42dlrJyY492YKNNXXdAAqN0ekmKqh97rzBrzrurkVHG9wS5vlw==
X-Received: by 2002:ad4:5043:: with SMTP id m3mr6088503qvq.45.1606869565176;
 Tue, 01 Dec 2020 16:39:25 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id z73sm129097qkb.112.2020.12.01.16.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 16:39:24 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kkGB1-004cmh-S8; Tue, 01 Dec 2020 20:39:23 -0400
Date: Tue, 1 Dec 2020 20:39:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20201202003923.GI5487@ziepe.ca>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130160821.GB5487@ziepe.ca>
 <MW3PR11MB45556C1BAD4AF795DF0F783EE5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB45556C1BAD4AF795DF0F783EE5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Wed, 02 Dec 2020 08:19:47 +0000
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

On Mon, Nov 30, 2020 at 05:53:39PM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Monday, November 30, 2020 8:08 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
> > 
> > On Fri, Nov 27, 2020 at 12:55:41PM -0800, Jianxin Xiong wrote:
> > >
> > > +function(rdma_multifile_module PY_MODULE MODULE_NAME LINKER_FLAGS)
> > 
> > I think just replace rdma_cython_module with this? No good reason I can see to have two APIs?
> 
> rdma_cython_module can handle many modules, but this one is for a single module.
> If you agree, I can merge the two by slightly tweaking the logic: each module starts 
> with a .pyx file, followed by 0 or more .c and .h files.

Then have rdma_cython_module call some rdam_single_cython_module()
multiple times that has this code below?

> > Here too? You probably don't need to specify h files at all, at
> > worst they should only be used with publish_internal_headers
> 
> Without the .h link, the compiler fail to find the header file (both
> dmabuf_alloc.c and the generated "dmabuf.c" contain #include
> "dmabuf_alloc.h").

Header files are made 'cross module' using the
"publish_internal_headers" command

But we could also hack in a -I directive to fix up the "" include for
the cython outupt..

But it should not be handled here in the cython module command

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
