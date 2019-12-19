Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380C125AFC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 06:51:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F00D6E188;
	Thu, 19 Dec 2019 05:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0146E188
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 05:51:48 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dfb0fd60001>; Wed, 18 Dec 2019 21:51:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 18 Dec 2019 21:51:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 18 Dec 2019 21:51:48 -0800
Received: from [10.2.165.11] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Dec
 2019 05:51:47 +0000
Subject: Re: [PATCH v11 04/25] mm: devmap: refactor 1-based refcounting for
 ZONE_DEVICE pages
To: Dan Williams <dan.j.williams@intel.com>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191216222537.491123-5-jhubbard@nvidia.com>
 <CAPcyv4hQBMxYMurxG=Vwh0=FKWoT3z-Kf=dqES1-icRV5bLwKg@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <d0a99e75-0175-0f31-f176-8c37c18a4108@nvidia.com>
Date: Wed, 18 Dec 2019 21:48:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hQBMxYMurxG=Vwh0=FKWoT3z-Kf=dqES1-icRV5bLwKg@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576734679; bh=sCXlmkq8dxoo2tHizwzufCVV/oUf7NWxJHJ14roWTmw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GK/0OEzMPk1mXpB/B4W5MjyKB4KjAD7QACyt/PluTqMpD63escvQAFpT8GgKashz/
 zjYVekQ9+jMFWBNLeBd0fSneuL/0IcIp4C+grDhfKeP4gGgfiF1yVdsXHIqTikTNBn
 TjGaizVxBY5MAKFT0ZuOTKaGbWetrkck9KS2raRunh97qgKrmKFpIg4PPwbiRz76za
 exoRNucmh5b5u8c4Keiv+48zYJosbfMH0xFWea2gmmlHUZQmtMFnoE6IBRYKWSfpwI
 AlXqgbv15vIdEK38umLQ7xsD0bruDuQcBNHLMX9Mt0huC0EASH9bq+0C+xF+Z7vdfg
 E3ondtFacFVjg==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma <linux-rdma@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/18/19 9:27 PM, Dan Williams wrote:
...
>> @@ -461,5 +449,5 @@ void __put_devmap_managed_page(struct page *page)
>>          page->mapping = NULL;
>>          page->pgmap->ops->page_free(page);
>>   }
>> -EXPORT_SYMBOL(__put_devmap_managed_page);
>> +EXPORT_SYMBOL(free_devmap_managed_page);
> 
> This patch does not have a module consumer for
> free_devmap_managed_page(), so the export should move to the patch
> that needs the new export.

Hi Dan,

OK, I know that's a policy--although it seems quite pointless here given
that this is definitely going to need an EXPORT.

At the moment, the series doesn't use it in any module at all, so I'll just
delete the EXPORT for now.

> 
> Also the only reason that put_devmap_managed_page() is EXPORT_SYMBOL
> instead of EXPORT_SYMBOL_GPL is that there was no practical way to
> hide the devmap details from evey module in the kernel that did
> put_page(). I would expect free_devmap_managed_page() to
> EXPORT_SYMBOL_GPL if it is not inlined into an existing exported
> static inline api.
> 

Sure, I'll change it to EXPORT_SYMBOL_GPL when the time comes. We do have
to be careful that we don't shut out normal put_page() types of callers,
but...glancing through the current callers, that doesn't look to be a problem.
Good. So it should be OK to do EXPORT_SYMBOL_GPL here.

Are you *sure* you don't want to just pre-emptively EXPORT now, and save
looking at it again?

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
