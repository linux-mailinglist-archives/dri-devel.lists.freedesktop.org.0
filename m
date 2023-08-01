Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE7C76BFB6
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 23:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A2910E442;
	Tue,  1 Aug 2023 21:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDB210E442
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 21:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690927078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/5jP/Uu+OO6juLyXLyEuCWWvaHANLE401zJH/WXu0vI=;
 b=W3p9eFHIA23d04oQxzFAM/BNZA4vBWTJ47zH5QZYx/rG1K7VCk7J5ylzs8T8hgeyXh5eb2
 teUicFVo0MDL46cZgIgjYmbfx3e8k51KdZ7hQjnuit47nFj3+LtSyATwsHtzO1u5g8qttr
 gxmynvAxmd4qS185JEMqEGOKnMYYfAQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402--cHXI1WPMDCEliKi_k8hJQ-1; Tue, 01 Aug 2023 17:57:56 -0400
X-MC-Unique: -cHXI1WPMDCEliKi_k8hJQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-76cb9958d60so44261685a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 14:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690927076; x=1691531876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/5jP/Uu+OO6juLyXLyEuCWWvaHANLE401zJH/WXu0vI=;
 b=IEQD3dQCB0ivIUiw1GenmboKKLjAG3OW8Hmv0LbchxysXzoG57Ns47V5mPdGl7AkKb
 f6d7JTluSZOlYSzCXd7D5/GoGuFgLlxPJCi+NTqWj/BRxR+5Dm1DK9HpQe2R+zh7R36T
 WtxrriZdO0QIluh3IcXwq0A9sodMLtno2yl9p0Wu6jp8H3XxrzbAI9cmxybqdtRu9v4b
 D1dOPDJgaOt1hdoLS38euwmo9ZApKs969HoKivaIfsQe59gUBcxIjwI4yxMx3xHpwXpX
 GUY90lgsowvo8ueJozyoAIB1Spn87qOvQ4ONF7RUT7n77esx92Cblib2HxvCr96WB4Hp
 /17g==
X-Gm-Message-State: ABy/qLbGN+er8OPVKbxsFY1W3uiWYpoeE9KtVnKU4mzyikBYyDmmObjv
 f2nC5UzIO4ajngfvY1TqzScQciYFTaBH8d7FizJv0rsihTFrTy6jnVkKA+PlYgfK/NW1KPwXo4w
 ERKa3ke0Yq2np8Le/NRoj+1RVlKK2
X-Received: by 2002:a05:620a:430a:b0:767:346c:4b37 with SMTP id
 u10-20020a05620a430a00b00767346c4b37mr12848381qko.7.1690927076146; 
 Tue, 01 Aug 2023 14:57:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFazEvf4bQmOL9hX+Oa0KAgFYC+ldTguiGGQJvZBm9XGzTkuKrWjBnYqk48Nd5hj5M/jsxZAg==
X-Received: by 2002:a05:620a:430a:b0:767:346c:4b37 with SMTP id
 u10-20020a05620a430a00b00767346c4b37mr12848363qko.7.1690927075876; 
 Tue, 01 Aug 2023 14:57:55 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com.
 [99.254.144.39]) by smtp.gmail.com with ESMTPSA id
 pc22-20020a05620a841600b00767cbd5e942sm4481519qkn.72.2023.08.01.14.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 14:57:55 -0700 (PDT)
Date: Tue, 1 Aug 2023 17:57:53 -0400
From: Peter Xu <peterx@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Message-ID: <ZMl/4Z1b6ooeE/Pk@x1n>
References: <87pm4nj6s5.fsf@nvdebian.thelocal>
 <IA0PR11MB7185EA5ABD21EE7DA900B481F802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZL5+CiZ6w4RdAt5u@nvidia.com>
 <IA0PR11MB7185D67DD07FEF0C92789D7AF802A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <75e3a74a-68f5-df-9a49-a0553c04320@google.com>
 <CH3PR11MB71777432A63D3FAAE7E70F22F803A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMLk8aMmpkK7ZCsW@x1n>
 <CH3PR11MB7177832A92B4F550BF816E0CF807A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <ZMfp3q/9osOV4wFO@x1n>
 <IA0PR11MB7185B093E86CB35EFDFF17EAF80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA0PR11MB7185B093E86CB35EFDFF17EAF80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Alistair Popple <apopple@nvidia.com>,
 Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 01, 2023 at 07:11:09AM +0000, Kasireddy, Vivek wrote:
> Ok, I'll keep your use-case in mind but AFAICS, the process that creates
> the udmabuf can be considered the owner. So, I think it makes sense that
> the owner's VMA range can be registered (via mmu_notifiers) for updates.

No need to have your special attention on this; my use case is not anything
useful with details, just wanted to show the idea that virtual address
range based notification might not work.

[...]

> What limitation do you see with the usage of mmu notifiers for this use-case?
> And, if using mmu notifiers is not the right approach, how do you suggest we
> can solve this problem?

AFAIU, even if there'll be a notification chanism, it needs to be at least
in per-file address space (probably in file offsets) rather than per-mm for
a shmem backend, so that any mapping of the file should notify that.

Isn't it already too late though to wait that notification until page is
installed?  Because here you pinned the page for DMA, I think it means
before a new page installed (but after the page is invalidated) the device
can DMA to an invalid buffer.

To come back to the original question: I don't know how that could work at
all, the userapp should just never do that invalidation, because right
after it does, the dma buffer will be invalid, and the device can update
data into trash.  So.. I don't have an easy way to do this right.. besides
disabling ram discard just like what vfio does already.

Thanks,

-- 
Peter Xu

