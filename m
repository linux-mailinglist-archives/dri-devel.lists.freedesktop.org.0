Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D22C504B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 09:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6741A6E879;
	Thu, 26 Nov 2020 08:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9DD6E0FD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Nov 2020 00:00:08 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id z188so141519qke.9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 16:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aKREM2LgpMemUitVe/ytv0SNKTIU13b/oPWuoX/JrCo=;
 b=UttOmsa4CIydIMlhmsf+mpL72ekN6XdJOKccupwa26yJabJffqzdKBszOdiAbyFnGb
 ycNvKmzKgO/6k7UOTismxzLPG6MKyJbVL5m2nXz60k8IZs91HAkIMmU1uydZP7woxuG7
 l4OEfrFRVONn5MZPaTjaF20xCPoTqyDOzK6n/GUx/cSR5CQfkIyFr/upm3oAOylDx5JM
 l/zDPZx6C2KT3uUV9+zFmcgPMSRoOloe9DmysxoEzrKgEo+s++Kc0svlJbDfURC4v+Cq
 ub/7SuADkb1ureevd8MfjBism6Dar2B6r6YV25fT8w2YFI83MHU4Dz+EbP9ZWRIaRAa/
 sjXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aKREM2LgpMemUitVe/ytv0SNKTIU13b/oPWuoX/JrCo=;
 b=ALk+RFeOv5BvwHn4ZkKiHLLSuJekVm2Ud+1YFlWWiFE7M3Tt1Y+YrLcSuN+fmNIEXo
 dla+A3BK0ZaUPpM5qV7J7ti4bKu+MnrNGAVuc1DcPL/eJSA/oV4N5qhqTh23GlZSVUcL
 dEcvwZ1KQ4U+UHk6HpmGFOX+clC2inNYDYhhwf0MbpFZWyww75duycdEAVs9lHsxMO/y
 BdxUIeqSlmCAxTyOkY3mKGISQwG6/yI6xXMl49JDMcYSAV7QuAgArybUwIQnf0opTcyZ
 LOk8SKwSA3xy9nyzEjh5DclDaoCcRJGJ0ztVuhAdjCM78PWlMMnBI0heEtk3afLds4x2
 AA/w==
X-Gm-Message-State: AOAM531IsWa6QfaYgeWdRGz34ixyIOEsayzw33vpTExxZ1Hhnq9pJszZ
 RQTqaL+J47qK5gERkxIWWUUpIA==
X-Google-Smtp-Source: ABdhPJy1oVswPNBIIEJRUXD9FYrqhWOv9OYbhoFw/mv9TlO+58lJs34Ve3mm23XrkxmRLPwP8foi1g==
X-Received: by 2002:a37:65d2:: with SMTP id z201mr565748qkb.403.1606348808101; 
 Wed, 25 Nov 2020 16:00:08 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id m62sm889145qkb.91.2020.11.25.16.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 16:00:07 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1ki4hi-001QF8-L6; Wed, 25 Nov 2020 20:00:06 -0400
Date: Wed, 25 Nov 2020 20:00:06 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
Message-ID: <20201126000006.GS5487@ziepe.ca>
References: <1606153984-104583-1-git-send-email-jianxin.xiong@intel.com>
 <1606153984-104583-4-git-send-email-jianxin.xiong@intel.com>
 <20201123180504.GA244516@ziepe.ca>
 <20201124151658.GT401619@phenom.ffwll.local>
 <MW3PR11MB45554AAEB1C370A78EB87816E5FB0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201125105041.GX401619@phenom.ffwll.local>
 <20201125121456.GM5487@ziepe.ca>
 <MW3PR11MB4555A91A6CF5D23AD538EF34E5FA0@MW3PR11MB4555.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4555A91A6CF5D23AD538EF34E5FA0@MW3PR11MB4555.namprd11.prod.outlook.com>
X-Mailman-Approved-At: Thu, 26 Nov 2020 08:24:08 +0000
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

On Wed, Nov 25, 2020 at 07:27:07PM +0000, Xiong, Jianxin wrote:
> > From: Jason Gunthorpe <jgg@ziepe.ca>
> > Sent: Wednesday, November 25, 2020 4:15 AM
> > To: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Leon Romanovsky <leon@kernel.org>; linux-rdma@vger.kernel.org; dri-
> > devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig
> > <christian.koenig@amd.com>
> > Subject: Re: [PATCH rdma-core 3/5] pyverbs: Add dma-buf based MR support
> > 
> > On Wed, Nov 25, 2020 at 11:50:41AM +0100, Daniel Vetter wrote:
> > 
> > > Yeah imo makes sense. It's a bunch more code for you to make it work
> > > on
> > > i915 and amd, but it's not terrible. And avoids the dependencies, and
> > > also avoids the abuse of card* and dumb buffers. Plus not really more
> > > complex, you just need a table or something to match from the drm
> > > driver name to the driver-specific buffer create function. Everything
> > > else stays the same.
> > 
> > If it is going to get more complicated please write it in C then. We haven't done it yet, but you can link a C function through cython to the
> > python test script
> > 
> > If you struggle here I can probably work out the build system bits, but it should not be too terrible
> 
> Thanks Daniel and Jason. I have started working in this direction. There should be no
> technical obstacle here. 

Just to be clear I mean write some 'get dma buf fd' function in C, not
the whole test

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
