Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4086324F2D3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Aug 2020 08:56:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59116EC7C;
	Mon, 24 Aug 2020 06:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79226E0CD
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=Behx2+G7awWW4jnBTF/jygxIW6A3yPzIrp17SFRqVqc=; b=hjDRi5edBluxfwJnws6LF5Hqkx
 ZTKxJ5/rFm0fWjLxc1LSoVcwFKhALO56BKFsn4ngrPkIq8OlHByhYY0FGaR3mhQpuAJTuuAd63XWi
 GAI1447k0v4cDPECfEt18s7zRZeJbICKeiWX9/JLUtty2adx1yjslFZEngLy2QI0XPukqp9SldhxD
 LE/RScFZZs1TsMgBjY+lZz3B2sdCF1yaPf+6ga352d7BO3RJitBRGgBBSt9hCLD32gF3OdWQ4pQL6
 BR0Dsmy9FZ1ECXYEj6f5qR02okh9uKDFgplRV5SkYzgqzqhFH45n9yYlM+6Pl7GOqpAb85b8HfVzT
 mIu2PylA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9UPf-0000QB-Lx; Sat, 22 Aug 2020 14:22:31 +0000
Subject: Re: [PATCH v4 2/2] staging: android: Remove BUG from ion_system_heap.c
To: Tomer Samara <tomersamara98@gmail.com>
References: <cover.1598023523.git.tomersamara98@gmail.com>
 <a39407f84031eaeed5e65a7aab515a079edf5fcc.1598023524.git.tomersamara98@gmail.com>
 <3eba90dc-128f-49da-41a6-81494653d535@infradead.org>
 <20200822093421.GA6631@tsnow>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <39092d50-d0fc-d142-1775-4b40194b02f5@infradead.org>
Date: Sat, 22 Aug 2020 07:22:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200822093421.GA6631@tsnow>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 24 Aug 2020 06:55:41 +0000
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
Cc: devel@driverdev.osuosl.org, Todd Kjos <tkjos@android.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Riley Andrews <riandrews@android.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>,
 Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>,
 Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/22/20 2:34 AM, Tomer Samara wrote:
> On Fri, Aug 21, 2020 at 09:25:26AM -0700, Randy Dunlap wrote:
>> On 8/21/20 8:28 AM, Tomer Samara wrote:
>>> Remove BUG() from ion_sytem_heap.c
>>>
>>> this fix the following checkpatch issue:
>>> Avoid crashing the kernel - try using WARN_ON &
>>> recovery code ratherthan BUG() or BUG_ON().
>>>
>>> Signed-off-by: Tomer Samara <tomersamara98@gmail.com>
>>> ---
>>>  drivers/staging/android/ion/ion_system_heap.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/android/ion/ion_system_heap.c b/drivers/staging/android/ion/ion_system_heap.c
>>> index eac0632ab4e8..00d6154aec34 100644
>>> --- a/drivers/staging/android/ion/ion_system_heap.c
>>> +++ b/drivers/staging/android/ion/ion_system_heap.c
>>> @@ -30,7 +30,7 @@ static int order_to_index(unsigned int order)
>>>  	for (i = 0; i < NUM_ORDERS; i++)
>>>  		if (order == orders[i])
>>>  			return i;
>>> -	BUG();
>>> +	/* This is impossible. */
>>>  	return -1;
>>>  }
>>
>> Hi,
>> Please explain why this is impossible.
>>
>> If some caller calls order_to_index(5), it will return -1, yes?
>>
>> -- 
>> ~Randy
>>
> 
> As Dan Carpenter says here https://lkml.kernel.org/lkml/cover.1597865771.git.tomersamara98@gmail.com/T/#mc790b91029565b1bb0cb87997b39007d9edb6e04.
> After looking at callers we see that order_to_index called from 2 functions:
> - alloc_buffer_page called from alloc_largest_available which 
>   loop over all legit order nubmers
>   ( Flow:
>    alloc_largest_available-->alloc_buffer_page-->order_to_index
>   )
> 
> - free_buffer_page takes the order using compound_order, which return 0 or
>   the order number for the page, this function has 2 callers too,
>   ion_system_heap_allocate (which called it in case of failure at sg_alloc_table,
>   thus calling from this flow will no casue error) and ion_system_heap_free
>   (which will be called on every sg table in the buffer that allocated good,
>   meaning from this flow also error will not be created).
>   ( Flows:
>    ion_system_heap_free     --> free_buffer_page --> order_to_index
>    ion_system_heap_allocate --> free_buffer_page --> order_to_index
>   )
> 
> Of course if some user will use this function with wrong order number he will be able to get this -1.
> So should I remove this comment and resotre the error checks?

I think so, but that's just an opinion.

> Btw, this is the same reason that I dropped the error check at ion_page_pool_shrink, so should I restore here also?

IMO yes.

Getting rid of BUG()s is a good goal, but usually it's not so easy.

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
