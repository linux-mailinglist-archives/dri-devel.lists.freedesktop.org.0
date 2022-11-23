Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB10635D62
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 13:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE210E1F8;
	Wed, 23 Nov 2022 12:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2D110E549
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 12:46:30 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id i9so2759724qkl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 04:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vHSuZN4AhWII4Tion5kFnCBewGFiwsSNV+ZIjchf+f8=;
 b=OWqc+/Hcjy1lIN4itSKeUt1Kcn+4uEhyp7axNuC8sBdmRDxXEr1/45JaFAlkEs+ANC
 TTzox7M2rFR6joSL/dcTy/ayQ8/phDoQeWBmeyKWeFkHysVtMOruUYasTM+0EYVpVBTU
 iJJYzUW4aIhktj/Mn0/YtwGPsitoADuYiRaIdCj4+Ifq9+PRR5vjOD0PqtFu1VnIoEp5
 qbvtl/Al85v7h5rs6UtSs4Ie6avliszVZ2ug/lrB5SPZb7L8ptPkjy5Ui9BPfpfEIca8
 20LOtxII2GHAjYH2KE3XX4AZsrbcUetO5EM2ayOptn03TFfYmFrecMcMsQI2P6Hg2l1r
 KAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vHSuZN4AhWII4Tion5kFnCBewGFiwsSNV+ZIjchf+f8=;
 b=N62fl8T0WNfl+fSGoDpP60E/jHS+BwK9SNdY4xycvdoOgKT3Scy8nu3lNOHrbKQ+WT
 INmiUIkKHgUe+hVpSboK8yR7t1k9jLVkPOfuByTQm+rb+X6jzyFBUsdlzGQ8uAx0xeZ4
 f5vHqZmBZENSuIx7w3B0/J3pWecjz7Do9v9KgIgoGwK0YbI/q0pPxaQswQHag3vaWd/C
 uf+K87q6IBCJwUDrIzCt9FTnkkyBIVwMwRDUFXNbTqxCNJhSA/6QBOqYNe3s+tGwi2ca
 CLnIPHLZlZ7gL9HVDzfC2Yd/1IO3Du393vvw34+v2ylV9Qmm1wUsEmq75YlvCkFT0kSE
 PwHg==
X-Gm-Message-State: ANoB5pn5zqBodVGG/uA5GgWkFovg0hZr7i0+DRih3yVEX/MHudYND0or
 PKqjgXt0HuuiQyGUaBkK6QYaoq1YlYtE8g==
X-Google-Smtp-Source: AA0mqf5Pm6Gy/kcLjlysVCJSGWeOxmxlzXEFr3h2NLg2kKMpx3KAmbZGLymStChcFWZp5XFVCFIotQ==
X-Received: by 2002:a05:620a:7eb:b0:6fa:aa59:ef9d with SMTP id
 k11-20020a05620a07eb00b006faaa59ef9dmr25280510qkk.108.1669207589794; 
 Wed, 23 Nov 2022 04:46:29 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 r5-20020a05620a298500b006ecf030ef15sm12216462qkp.65.2022.11.23.04.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 04:46:28 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxp91-00AJCh-Qz;
 Wed, 23 Nov 2022 08:46:27 -0400
Date: Wed, 23 Nov 2022 08:46:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y34WI9SZdiH/p1tA@ziepe.ca>
References: <Y30PDdsvHIJo5YHR@ziepe.ca>
 <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
 <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
 <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
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
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:

> > Maybe a GFP flag to set the page reference count to zero or something
> > like this?
> 
> Hm yeah that might work. I'm not sure what it will all break though?
> And we'd need to make sure that underflowing the page refcount dies in
> a backtrace.

Mucking with the refcount like this to protect against crazy out of
tree drives seems horrible..

The WARN_ON(pag_count(p) != 1) seems like a reasonable thing to do
though, though you must combine this with the special PTE flag..

Jason
