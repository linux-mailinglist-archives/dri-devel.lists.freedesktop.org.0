Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4722C26C188
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 12:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808036E3A8;
	Wed, 16 Sep 2020 10:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317466E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 10:14:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ze2rx7g3mh9/29oaT/ZlRra3HtD2JaAT3LihPzB1+fxYuTezJ096wHuF9lTRiEOQ8SV+Qx8RZjFDICnlwlr2hlE7GzClgtdVVOVpjTE9IeQZneASTUylnczgXLxEKZjS/X0HV7m8Awj9ibCKJ43SAoDrSmVOBitx3JUbuxPJi+aO6A60j7TsK8aY/zhEp9bKLasFUaxnGsncLdP7KQ14JBe3p5Liz4fDsbC5BVZPsxrNhlTIYaY2crN6pejCevGWHcEiArXnn21wUSNJcPS9qR0eSJjODTlTYPOEdk3boImVoCwHbR2u2xpLrx9gXlcObIUMt0flang3GSL1l2LIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfeUFb6U2H6zazfyJmE49VbWw7FrghWVSS5zZqtpfyY=;
 b=D/FkBwRoSgmCDW02Ibc73OWCtMxy15rYTsgZOFGqitNJbQ8lqQ9XCbB4pXoC1IsLW/n4+9nDmQJEicN9dI50CJYjjAF0s4v1BcgcRzrRghB9IB+YGc8SV0F9CDRydoaTTaSziPIaeRv20TKmcpZbyh9UGBO3e7jzEB+1piY8ipK1KCUWWpBAFsBeZwgL8YRcByezC+tj1YIUgEuHdoZFtKD5NXX/L4cs+JN5KJ9b+/mft6OzQWM9Gb+uaM9UmPOTB9+WzB7LDftLaz0H/P7BBzEnYYAsLsosiSD3zEUXQl5u0QZdveY9UFw4J29LwWT+2mZ//algore2lMqvZMishQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZfeUFb6U2H6zazfyJmE49VbWw7FrghWVSS5zZqtpfyY=;
 b=0oSm8HflAIj3Bua8Y+MyIjxJNgB9/7uUHiuvkOzaZA4Lnsjp+jE1Px7DWEQXqUhpaWCdLr3+QtYZua1oVyB+Z9FiwehQW8cM8x6VqkHDttEtwhW5Jr+KHABvVWbQWxmWYDfAps+li7GWu9L/IuyVDtvvhkkmlErkJleMvz6pPw8=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3950.namprd12.prod.outlook.com (2603:10b6:208:16d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 10:14:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 10:14:50 +0000
Subject: Re: Changing vma->vm_file in dma_buf_mmap()
To: Jason Gunthorpe <jgg@ziepe.ca>, akpm@linux-foundation.org,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20200914132920.59183-1-christian.koenig@amd.com>
 <40cd26ae-b855-4627-5a13-4dcea5d622f6@gmail.com>
 <20200914140632.GD1221970@ziepe.ca>
 <9302e4e0-0ff0-8b00-ada1-85feefb49e88@gmail.com>
 <20200916095359.GD438822@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fc8f2af7-9fc2-cb55-3065-75a4060b7c82@amd.com>
Date: Wed, 16 Sep 2020 12:14:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200916095359.GD438822@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.19 via Frontend
 Transport; Wed, 16 Sep 2020 10:14:49 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e176f4eb-77a3-42f1-c4a9-08d85a2958d2
X-MS-TrafficTypeDiagnostic: MN2PR12MB3950:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3950DAC5F71B822F5A647E5D83210@MN2PR12MB3950.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjBM/ibW8IDJixvDZe/Ml+FEKv8U9J7S8k6XLl3csMHBXNGa3vU3QgkfXDZQ6IyewUMiUhJNQ21NvWoZtuUoecZY/xNwhyAARP/1r5nSvOooDXdRBXpNDe2eDpmDqwgyZug14RgEPxLX3jfHjdSBE3dhcIQJNAsda1gF/OviWhaIWMCEX/JL/rO0PTQ9QLbCSeshHqc51fsTXS++/2lHOLwdy3E/a1g1IuwKsAV7cLIsi8lnV1Z3UN+MJaSsJJOyNx+08oJQNE+N1lU+Q92DKoqQ7FRvfkySNHUalZV9lVGat5LZ55jGyy0LzIxKTpwewOddavJzheH4tanY35PSI8u63rfObYGCzND9LmkZMLd1lxyJuruuBZBgxLUMNjuj9/jpcGyX9CnFqXJtk0qlI7M8R8QoAyBCi6VnR/sO8IkBkg1UJOd806bRVHz8sVO+bfIjSoE1qcUKo70BE5AUzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(316002)(6666004)(6486002)(86362001)(186003)(16526019)(478600001)(2616005)(8936002)(31686004)(31696002)(8676002)(52116002)(33964004)(36756003)(2906002)(66556008)(5660300002)(83380400001)(66476007)(166002)(66574015)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: B5DGFzpiwBubGoRoTtebkdg/zAq1qieRIx/A95wXwN7VXcHb5pLW1x6hDlp8di5jyGHkWDO4XbYn9WoyHpiBbPdbZlIKsgJ3H3QW3NZTWFeFajtjO8LumYcRl2Emt46b66v9iPn7TRf1IRwwrPda0TO8V+7Au2WZSah0QaBthQh+GTXAmXiaciTUJXe9mRQDEENbPu6hn/WAIhndgrJmbXO42B4KQyadh4fw2yCJjnDz3BFkxl2UkF/dzs+7o1pqq3TnfubrG1rl3sCd3tINx0S5okz3/zmgM/3SgKuNdtHI4VJ5jEukLqgKR5Yljmm0gxx0AvmSnBNoQopcuwYd9mbPKxAcY5596I04S1XClf2SlYL0YoATkg/RmsOwUU6RKMrp6dYfrnMW1A+zGCneZsSW7xaMvGOsegzcTkxYn5sRe7/gnxbp5lkmMTwAkBquwflZ2lHqgmuQGlkRwT7jK8/Ac0pu4qe1fdMqE+BVsMejKfs5rDR7BYm3ISd+C07EDn0LwrHo+6rzLPA+mfphYLxeUSDbaDnVhduXqrMNq1x28qxXLmIrCrgToDQAp0mpw6i6O+2LWY1KasytFQ/Vh/QB9EOr2T3GF+mYlw2xW3fssHKH5DR7GV3EQHT/pXM3K53nt+MCzA5jCzgyz+MZQrbmqg+Um1J5Xui7GfIMTqvo5SrJI7Srs4wzcWX7dsqwygAsCdyx3vaAbbiKpkZOJQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e176f4eb-77a3-42f1-c4a9-08d85a2958d2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 10:14:50.7669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YSexevSaY4GlZymo45klP9ZHRqgDq/NLf9BAdBnW9IQU46RZvF4ohNlPPufhqyD1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3950
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
Content-Type: multipart/mixed; boundary="===============0060388683=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0060388683==
Content-Type: multipart/alternative;
 boundary="------------73E1BFB6D8B8C6B7178B6E38"
Content-Language: en-US

--------------73E1BFB6D8B8C6B7178B6E38
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 16.09.20 um 11:53 schrieb Daniel Vetter:
> On Mon, Sep 14, 2020 at 08:26:47PM +0200, Christian König wrote:
>> Am 14.09.20 um 16:06 schrieb Jason Gunthorpe:
>>> On Mon, Sep 14, 2020 at 03:30:47PM +0200, Christian König wrote:
>>>> Am 14.09.20 um 15:29 schrieb Christian König:
>>>>> Hi Andrew,
>>>>>
>>>>> I'm the new DMA-buf maintainer and Daniel and others came up with
>>>>> patches extending the use of the dma_buf_mmap() function.
>>>>>
>>>>> Now this function is doing something a bit odd by changing the
>>>>> vma->vm_file while installing a VMA in the mmap() system call
>>> It doesn't look obviously safe as mmap_region() has an interesting mix
>>> of file and vma->file
>>>
>>> Eg it calls mapping_unmap_writable() using both routes
>> Thanks for the hint, going to take a look at that code tomorrow.
>>
>>> What about security? Is it OK that some other random file, maybe in
>>> another process, is being linked to this mmap?
>> Good question, I have no idea. That's why I send out this mail.
>>
>>>>> The background here is that DMA-buf allows device drivers to
>>>>> export buffer which are then imported into another device
>>>>> driver. The mmap() handler of the importing device driver then
>>>>> find that the pgoff belongs to the exporting device and so
>>>>> redirects the mmap() call there.
>>> So the pgoff is some virtualized thing?
>> Yes, absolutely.
> Maybe notch more context. Conceptually the buffer objects we use to manage
> gpu memory are all stand-alone objects, internally refcounted and
> everything. And if you export them as a dma-buf, then they are indeed
> stand-alone file descriptors like any other.
>
> But within the driver, we generally need thousands of these, and that
> tends to bring fd exhaustion problems with it. That's why all the private
> buffer objects which aren't shared with other process or other drivers are
> handles only valid for a specific fd instance of the drm chardev (each
> open gets their own namespace), and only for ioctls done on that chardev.
> And for mmap we assign fake (but unique across all open fd on it) offsets
> within the overall chardev. Hence all the pgoff mangling and re-mangling.
>
> Now for unmap_mapping_range we'd like it to find all such fake offset
> aliases pointing at the one underlying buffer object:
> - mmap on the dma-buf fd, at offset 0
> - mmap on the drm chardev where the buffer was originally allocated, at some unique offset
> - mmap on the drm chardev where the buffer was imported, again at some
>    (likely) different unique (for that chardev) offset.
>
> So to make unmap_mapping_range work across the entire delegation change
> we'd actually need to change the vma->vma_file and pgoff twice:
> - once when forwarding from the importing drm chardev to the dma-buf
> - once when forwarding from the dma-buf to the exported drm chardev fake
>    offset, which (mostly for historical reasons) is considered the
>    canonical fake offset
>
> We can't really do the delegation in userspace because:
> - the importer might not have access to the exporters drm chardev, it only
>    gets the dma-buf. If we'd give it the underlying drm chardev it could do
>    stuff like issue rendering commands, breaking the access model.
> - the dma-buf fd is only used to establish the sharing, once it's imported
>    everywhere it generally gets closed. Userspace could re-export it and
>    then call mmap on that, but feels a bit contrived.
> - especially on SoC platforms this has already become uapi. It's not a big
>    problem because the drivers that really need unmap_mapping_range to work
>    are the big gpu drivers with discrete vram, where mappings need to be
>    invalidate when moving buffer objects in/out of vram.
>
> Hence why we'd like to be able to forward aliasing mappings and adjust the
> file and pgoff, while hopefully everything keeps working. I thought this
> would work, but Christian noticed it doesn't really.

Well to be clear I'm still not sure if that works or not :)

But Jason pointed me to the right piece of code. See this comment in in 
mmap_region():

> 		/* ->mmap() can change vma->vm_file, but must guarantee that
> * vma_link() below can deny write-access if VM_DENYWRITE is set
> * and map writably if VM_SHARED is set. This usually means the
> * new file must not have been exposed to user-space, yet.
> */
> 		vma <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma>->vm_file 
> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vm_file>  =  get_file 
> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/get_file>(file 
> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file>);
> 		error  =  call_mmap 
> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/call_mmap>(file 
> <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file>,  vma <https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma>);

So changing vma->vm_file is allowed at least under certain circumstances.

Only the "file must not have been exposed to user-space, yet" part still 
needs double checking. Currently working on that.

Regards,
Christian.

>
> Cheers, Daniel
>
>
>> Christian.
>>
>>> Jason


--------------73E1BFB6D8B8C6B7178B6E38
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 16.09.20 um 11:53 schrieb Daniel
      Vetter:<br>
    </div>
    <blockquote type="cite" cite="mid:20200916095359.GD438822@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">On Mon, Sep 14, 2020 at 08:26:47PM +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 14.09.20 um 16:06 schrieb Jason Gunthorpe:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Mon, Sep 14, 2020 at 03:30:47PM +0200, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Am 14.09.20 um 15:29 schrieb Christian König:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Hi Andrew,

I'm the new DMA-buf maintainer and Daniel and others came up with
patches extending the use of the dma_buf_mmap() function.

Now this function is doing something a bit odd by changing the
vma-&gt;vm_file while installing a VMA in the mmap() system call
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">It doesn't look obviously safe as mmap_region() has an interesting mix
of file and vma-&gt;file

Eg it calls mapping_unmap_writable() using both routes
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thanks for the hint, going to take a look at that code tomorrow.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">What about security? Is it OK that some other random file, maybe in
another process, is being linked to this mmap?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Good question, I have no idea. That's why I send out this mail.

</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">The background here is that DMA-buf allows device drivers to
export buffer which are then imported into another device
driver. The mmap() handler of the importing device driver then
find that the pgoff belongs to the exporting device and so
redirects the mmap() call there.
</pre>
            </blockquote>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">So the pgoff is some virtualized thing?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yes, absolutely.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Maybe notch more context. Conceptually the buffer objects we use to manage
gpu memory are all stand-alone objects, internally refcounted and
everything. And if you export them as a dma-buf, then they are indeed
stand-alone file descriptors like any other.

But within the driver, we generally need thousands of these, and that
tends to bring fd exhaustion problems with it. That's why all the private
buffer objects which aren't shared with other process or other drivers are
handles only valid for a specific fd instance of the drm chardev (each
open gets their own namespace), and only for ioctls done on that chardev.
And for mmap we assign fake (but unique across all open fd on it) offsets
within the overall chardev. Hence all the pgoff mangling and re-mangling.

Now for unmap_mapping_range we'd like it to find all such fake offset
aliases pointing at the one underlying buffer object:
- mmap on the dma-buf fd, at offset 0
- mmap on the drm chardev where the buffer was originally allocated, at some unique offset
- mmap on the drm chardev where the buffer was imported, again at some
  (likely) different unique (for that chardev) offset.

So to make unmap_mapping_range work across the entire delegation change
we'd actually need to change the vma-&gt;vma_file and pgoff twice:
- once when forwarding from the importing drm chardev to the dma-buf
- once when forwarding from the dma-buf to the exported drm chardev fake
  offset, which (mostly for historical reasons) is considered the
  canonical fake offset

We can't really do the delegation in userspace because:
- the importer might not have access to the exporters drm chardev, it only
  gets the dma-buf. If we'd give it the underlying drm chardev it could do
  stuff like issue rendering commands, breaking the access model.
- the dma-buf fd is only used to establish the sharing, once it's imported
  everywhere it generally gets closed. Userspace could re-export it and
  then call mmap on that, but feels a bit contrived.
- especially on SoC platforms this has already become uapi. It's not a big
  problem because the drivers that really need unmap_mapping_range to work
  are the big gpu drivers with discrete vram, where mappings need to be
  invalidate when moving buffer objects in/out of vram.

Hence why we'd like to be able to forward aliasing mappings and adjust the
file and pgoff, while hopefully everything keeps working. I thought this
would work, but Christian noticed it doesn't really.</pre>
    </blockquote>
    <br>
    Well to be clear I'm still not sure if that works or not :)<br>
    <br>
    But Jason pointed me to the right piece of code. See this comment in
    in mmap_region():<br>
    <br>
    <blockquote type="cite">
      <pre>		<span class="cm">/* -&gt;mmap() can change vma-&gt;vm_file, but must guarantee that</span>
<span class="cm">		 * vma_link() below can deny write-access if VM_DENYWRITE is set</span>
<span class="cm">		 * and map writably if VM_SHARED is set. This usually means the</span>
<span class="cm">		 * new file must not have been exposed to user-space, yet.</span>
<span class="cm">		 */</span>
		<span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma">vma</a></span><span class="o">-&gt;</span><span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vm_file">vm_file</a></span> <span class="o">=</span> <span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/get_file">get_file</a></span><span class="p">(</span><span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file">file</a></span><span class="p">);</span>
		<span class="n">error</span> <span class="o">=</span> <span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/call_mmap">call_mmap</a></span><span class="p">(</span><span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/file">file</a></span><span class="p">,</span> <span class="n"><a href="https://elixir.bootlin.com/linux/v5.9-rc5/C/ident/vma">vma</a></span><span class="p">);</span></pre>
    </blockquote>
    <br>
    So changing vma-&gt;vm_file is allowed at least under certain
    circumstances.<br>
    <br>
    Only the &quot;file must not have been exposed to user-space, yet&quot; part
    still needs double checking. Currently working on that.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20200916095359.GD438822@phenom.ffwll.local">
      <pre class="moz-quote-pre" wrap="">

Cheers, Daniel


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Jason
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------73E1BFB6D8B8C6B7178B6E38--

--===============0060388683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0060388683==--
