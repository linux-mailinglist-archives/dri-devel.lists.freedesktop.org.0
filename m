Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9792A8E09
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 05:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECD46EDFB;
	Fri,  6 Nov 2020 04:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6F36EDFB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 04:08:20 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa4cc360002>; Thu, 05 Nov 2020 20:08:22 -0800
Received: from [10.2.49.167] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 04:08:11 +0000
Subject: Re: [PATCH v5 05/15] mm/frame-vector: Use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>, Christoph Hellwig <hch@infradead.org>,
 J??r??me Glisse <jglisse@redhat.com>, linux-samsung-soc
 <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>, Pawel Osciak
 <pawel@osciak.com>, KVM list <kvm@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>, Linux MM
 <linux-mm@kvack.org>, Kyungmin Park <kyungmin.park@samsung.com>, "Daniel
 Vetter" <daniel.vetter@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Dan Williams
 <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
References: <CAKMK7uEw701AWXNJbRNM8Z+FkyUB5FbWegmSzyWPy9cG4W7OLA@mail.gmail.com>
 <20201104140023.GQ36674@ziepe.ca>
 <CAKMK7uH69hsFjYUkjg1aTh5f=q_3eswMSS5feFs6+ovz586+0A@mail.gmail.com>
 <20201104162125.GA13007@infradead.org>
 <CAKMK7uH=0+3FSR4LxP7bJUB4BsCcnCzfK2=D+2Am9QNmfZEmfw@mail.gmail.com>
 <20201104163758.GA17425@infradead.org> <20201104164119.GA18218@infradead.org>
 <20201104181708.GU36674@ziepe.ca>
 <d3497583-2338-596e-c764-8c571b7d22cf@nvidia.com>
 <20201105092524.GQ401619@phenom.ffwll.local>
 <20201105124950.GZ36674@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7ae3486d-095e-cf4e-6b0f-339d99709996@nvidia.com>
Date: Thu, 5 Nov 2020 20:08:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201105124950.GZ36674@ziepe.ca>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604635702; bh=Zxaf2o6Bf8KCt8GGVyqkabRsYvK65I+alpkY1bpXUj4=;
 h=Subject:To:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=XUcqFVIT6wpyCLo/7MIMA70nfnEAQlMnvxS6BpI49u8niHEonhjOFRr5jpKAiDgSb
 NruirMHJ0lklnJPVstdxDDpsNeDoRzXNbc/ZwNiwsnyeDHnXN2zye8BykFo4BmM8pn
 eb+ONcJpKqq41slnim2JQO2fNKWYRjv2D8SW2MtwUNBsIi33cxfub4Kh3D4Qd5ngz+
 xrhVX4XmfgwdyAZcB6p78K3Qsl/oPr5iUR4d6pKEmurex3ZAnsYGQ2ya0g2Vdsm1vi
 TmzogOYW7iQNIRy5mgIxCPwKcT0KL2pFOmPHkECsQklCGjQEZmxD/3b/wK/ZG9ox5k
 l2KSFxiaOUvow==
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/5/20 4:49 AM, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 10:25:24AM +0100, Daniel Vetter wrote:
>>> /*
>>>   * If we can't determine whether or not a pte is special, then fail immediately
>>>   * for ptes. Note, we can still pin HugeTLB and THP as these are guaranteed not
>>>   * to be special.
>>>   *
>>>   * For a futex to be placed on a THP tail page, get_futex_key requires a
>>>   * get_user_pages_fast_only implementation that can pin pages. Thus it's still
>>>   * useful to have gup_huge_pmd even if we can't operate on ptes.
>>>   */
>>
>> We support hugepage faults in gpu drivers since recently, and I'm not
>> seeing a pud_mkhugespecial anywhere. So not sure this works, but probably
>> just me missing something again.
> 
> It means ioremap can't create an IO page PUD, it has to be broken up.
> 
> Does ioremap even create anything larger than PTEs?
> 

 From my reading, yes. See ioremap_try_huge_pmd().

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
