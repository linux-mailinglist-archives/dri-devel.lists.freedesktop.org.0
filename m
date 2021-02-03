Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B8F30EE74
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 09:33:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13AD16ED09;
	Thu,  4 Feb 2021 08:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FFA89AD2
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 17:56:56 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id 2so410618qvd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 09:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J1HhI30b58fysvdWOivIB7OV9/EQ+3BS+Aaq7uAwxG0=;
 b=GK9u8JloLApwPgelE9I8CpPnbDqHIvSCIuKhg1ahJkqsGTzXhtfdNpxVTGPvblNamD
 kIemMFRktQx3yacvQ+AVT1qS6V1OB0wHtRqOtTd00z54FjB9tUcJ4vz4ry2lPRw3oK5I
 PwJS9lOGVgDTzDAUcNfo3r1w4AKJBoBZJ2j+FlXl2OHxpTcH4yob7lTGlM5kuDUU2i6h
 ab2UqFMI7o+UrfLlkN2SZKNqk/4VdjxA1gPrZL+J4+PhZLQ0l36gudDmqmvDFqci1T5D
 jZY6GPL2kHrm2xx+OwPdZf8m/gBydfzD7yr1bqGuEDL/tg8MrkdTPstWceZMuzX1iNvY
 XHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J1HhI30b58fysvdWOivIB7OV9/EQ+3BS+Aaq7uAwxG0=;
 b=Ecp+aRzpSmbg3CWYiXvXw4tyIfeJUy2lImOaVkF1uFpNV6nmRFAtmG8qtQm7wIhna8
 Ml+tHll1AwW6hSNm9nBzwFgwtaRc0Fnkq+PrLF6rt94pykbVPD1aoM2+2K6/mxkHRuct
 92Xn6js/4iSxeP5wp+h1hS3tFqoEIfElbvawk83r+z3G7iNgxhQII+Yl+wJ6dBGpbq1h
 eMP+jap6rpb/YxXGik41sOUg0TNL+SWa4U2ucpGdjysrfYDGHFw/r6JL8W4xK5YameBW
 vt608mc1AOHmFd7lKtjpV7ys8esAivVTxETmFzK7gkKrG+BCyf5hm5El+3com4xSmTS2
 B66Q==
X-Gm-Message-State: AOAM532DvkiXIFwWmxpOVqD4Mvuvy2+8NwCjSkHOpRX7DOusx4O/6jcf
 JEf56EvS62B/J7Iet+ITy07Q/g==
X-Google-Smtp-Source: ABdhPJwhXxgxv9QS34Ar2Iv4pzvwPjB5Gmthi3e4YRqnvrv7TC/fHJkwKXSMxuipr6Ho7ORS2TTicg==
X-Received: by 2002:a0c:8365:: with SMTP id j92mr3713290qva.19.1612375015844; 
 Wed, 03 Feb 2021 09:56:55 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.115.133])
 by smtp.gmail.com with ESMTPSA id b13sm1784301qtj.97.2021.02.03.09.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 09:56:55 -0800 (PST)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1l7MOc-0034o2-K6; Wed, 03 Feb 2021 13:56:54 -0400
Date: Wed, 3 Feb 2021 13:56:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
Message-ID: <20210203175654.GR4718@ziepe.ca>
References: <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
 <20210201152922.GC4718@ziepe.ca>
 <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
 <YBluvZn1orYl7L9/@phenom.ffwll.local>
 <20210203060320.GK3264866@unreal>
 <MW3PR11MB455563A3F337F789613A9940E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CAKMK7uHAD5FbDPeT2cD03HjHhvmMMG__muXqo=rTjd=htSMhtg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHAD5FbDPeT2cD03HjHhvmMMG__muXqo=rTjd=htSMhtg@mail.gmail.com>
X-Mailman-Approved-At: Thu, 04 Feb 2021 08:32:37 +0000
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>, "Xiong,
 Jianxin" <jianxin.xiong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 06:53:19PM +0100, Daniel Vetter wrote:
> > > rdma-core uses cmake build system and in our case cmake
> > > find_library() is preferable over pkgconfig.
> >
> > Only the headers are needed, and they could be installed via
> > either the libdrm-devel package or the kernel-headers package. The
> > cmake find_path() command is more suitable here.
> 
> Except if your distro is buggy (or doesn't support any gpu drivers at
> all) they will never be installed as part of kernel-headers.

pkgconfig is OK, we use it for libnl for similar reasons, I just don't
like it to see it used gratuitously as it can cause more problems than
it solves

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
