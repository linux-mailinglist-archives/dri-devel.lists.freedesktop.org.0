Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1330D49E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 09:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E42E6E9CD;
	Wed,  3 Feb 2021 08:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9055E6E9CD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 08:06:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFKyI7ITqPi1c2Lh1oHWlzGlp29fH7qHFHflQLPJ2W64baMO9YJK0g5SgSyYaOgf8yD1nIHsPPMT7o7yRV9YSzHjATz4piL6aEvvTiRxsO3O5X4Kizlsv1nWR4NPfqFrvYqa46e1AuVUGKdQh8Jdv+2+JHUTFlE70x1JhxQLqVQGzMa81MUJ2lmkfV/v/vLQ9LV4aSJHqJf3I6f8vYuA7tnQ0aL6jZkzhCrqCUxcs1xeXVKKRc45b16gum1ix2hWdAHmvyFHZt85jHvMj1lNAETjpesHMgQubkPpTqPf9U+lFW/XKMDJspto5VR3JDa4zKt/Lxc02MoAkpCFukwhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8CeD//g3xEEY+xtR5NSL5rmoGxSpgvSTVlSIold9HM=;
 b=YyUM21kjusPHq4Fy96HYvP1Z6N60YOziuQ2CNY3VKnQYAZhSZaYMAstvXVU8+VFISEd+5DPfX36dBzpgF+OCiCISkocn/HRCY5rCumcaBBtkgVEnnTjCHYM68djQWXe609Ap+kTr7g29ro1hYvwxMG1DcNg8/fk9NjbOvNUim1pCqd2XqquNxAPTzeWWpx6WzKyhTuowE17yXBe28YTNQuNQOyIpUAv1kIagMAve7vMA9eZmUSzLVZczNM+0UEzM2kI8qsB4eXHEK/gokDvkt0ZVfCAou407FwnXj/DbR5Q74YFKHsAnp2ZvWfXaOidfZdgxwRE/1ZOBQ2GmUgo0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8CeD//g3xEEY+xtR5NSL5rmoGxSpgvSTVlSIold9HM=;
 b=HM0CjR9JPZD7NlgKtt88Q2WPH5IO58T92wKMQVuj9zt2zgwhhf0ej1yEJMC0L1DrG6HpK7b7cWeOOcTZ8SYwIg/lIVZWf5O7in/vpTFbhV7c+sMcC+zb+XJ/rxdxqatqLq9ozkwQb9ckGSTw5cb6GXHIQhFteb/FDRGzS0NINmk=
Authentication-Results: android.com; dkim=none (message not signed)
 header.d=none;android.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (10.255.86.19) by
 MN2PR12MB3840.namprd12.prod.outlook.com (10.255.239.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.21; Wed, 3 Feb 2021 08:06:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Wed, 3 Feb 2021
 08:06:05 +0000
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: Map system heap pages as managed
 by linux vm
To: Suren Baghdasaryan <surenb@google.com>, Minchan Kim <minchan@kernel.org>
References: <20210203003134.2422308-1-surenb@google.com>
 <20210203003134.2422308-2-surenb@google.com> <YBn+yWIE9eXbgQ2K@google.com>
 <CAJuCfpHCCD6ruxQAZP8pTZxz44F7pDKY59QznxFv0nQ+-9VaQA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1ea3d79a-2413-bba5-147e-e24df3f91ce0@amd.com>
Date: Wed, 3 Feb 2021 09:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAJuCfpHCCD6ruxQAZP8pTZxz44F7pDKY59QznxFv0nQ+-9VaQA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Wed, 3 Feb 2021 08:06:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 189a3e28-837a-494f-d0b3-08d8c81a8e19
X-MS-TrafficTypeDiagnostic: MN2PR12MB3840:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3840CC7322A157ABA3043B4F83B49@MN2PR12MB3840.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zq5djfQMdsAyOoZE0F2X20KBgZ5i9Madmu/lnsa2ioccPSo+HkYb93JNTSzQT0L6yahZFo+oPQn39ecm96p3yrieGeuqyFM7aY29Y/NQu6HseGwrBpDdZTGd1GRe1Dh+wom1XVWchR6BeAager7Lf250kh2A6x6FtrclkqhXprlovrRbzYThzEcHfb/Tn6exIYhfePDddv9pTKtycGSGsnAI7o51m0+ZUTqjwTJVg/7nLf/DkBANOYIQ66/8Ssqz8mQcvYhA158NukTQWZFGGMqH1vLQiJPCCYsnof2Rz6KC6T73cI+NRESBZi3aO353s1QeBC5G4/fQgl5JigQDE5PB4D+lPOFhedOzDz7hpDv+XUKkABorLX+jB0uY0/gsTgm12XYgDE0578FCjKnCVr++rYKw7dQbLTdMHfzbVaBvq3i5snrw+lKaeZXwheTwiijxBRnQ25uwSJxzXGsjs2EshmaGPEVP++v1WD6M22/qCVgMRdJHt5kDX0RubKvvwI8f+PvDOULT/aNbIARFugQHmvwjMWn2KA6cXwMpEO+tkiRl1civqXhD5dLRcQmA89c5iAV4mnyDVAmF5Wh7FtEb0QN480X2Efs0Kagc282qLdohCN5fWCwfCOQscV4O6+WT2Wudo2tPPwhfk8G/tKc3EQ2h8Szah6fNuBJ2hXrzZK52FfMQi/BipUX5hYrk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(6666004)(16526019)(31696002)(53546011)(186003)(66476007)(86362001)(5660300002)(316002)(54906003)(110136005)(7416002)(31686004)(6486002)(45080400002)(2906002)(478600001)(966005)(4326008)(2616005)(8936002)(66946007)(36756003)(52116002)(8676002)(66556008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Sjk0RHJHRzhoWFNnT1BoSFBMR2VQb25IeXpJSzIwVk41emh0MkYwV2xJcHFz?=
 =?utf-8?B?VE1GU3FkcW81V3diQVZ0a2FDOC9RQ3FKeE01WHI0MVFqNFBxM3BxallTYTlr?=
 =?utf-8?B?OE1mS2YrM1dnSGtNcGZkVWNyQktaN3VEcjViZ0JESFFKQWwwV29DOEZrQzRa?=
 =?utf-8?B?UnVNazBOZzFGQkVFNkpVcnp2aHQrK3F4NzV0T05LckhXME9SbktoRnY5Rzdn?=
 =?utf-8?B?ZmNtaW9MQ1B2Z1BPRXVFaTIyV21iK0pFYWpPTEppWG8zamZzOFI5TXhTalRL?=
 =?utf-8?B?RmJXa0ZUcTVub0pmQ21RZDRsRGpSdVFKeFBEWTgrbnVKT084bXNnVWlvelFI?=
 =?utf-8?B?ZWhyVU8xVEkwWEJUNHZoNUJXVW82cDNaR2t1ckg3Y0pGMUducVJ3VFlwMVF4?=
 =?utf-8?B?c283UDBkbjhVTm1yeWZMaFl2NG4rdGZFOERyZHFibGVzTmkveWdYNmN1K0Jv?=
 =?utf-8?B?eDkrdTFCOWNXWDh6NFBETEFydjJtVmRYWlR4NTNsS0RSc041M3JOT1JvNFJV?=
 =?utf-8?B?TGNDbGtNa3ZZeGZ5RGtqTmlRS3VWL2puN3hKN1JjZklvenBLbkxuZTk0RTV2?=
 =?utf-8?B?Zm5FckRicjdXR3cxeVhOZmhCbmJnZ1hLYXNLUHZSNTFLRFdSM1B5MU5hWmRk?=
 =?utf-8?B?Sk5LTGo5SSttL2VSUWZLaW5uSkJqU2VHZmRCL0UzbTlLRk9HNEtNSjM0NmFv?=
 =?utf-8?B?VG5EcWV1bTZmSmpUajY5SjZua3ZGWVNSOUN3WjBFZk5FWDBhOXdJeDNSRUJ0?=
 =?utf-8?B?MkhNSGhUbFpHVkxJV0s5bDV4eElmbDExbFpqejduc2YyWnlmSWJoL3JlSUlL?=
 =?utf-8?B?cjIwVDBEeFNERFFrbmlra3ZuUjVpQytQRWZTdDZXYVkwSHUzWmlHVzFmQldK?=
 =?utf-8?B?eVlkaGpQY3pXVlFJYWFLamhZOVZHTEdGNHVFanRQeFlLRG56dGVMdHkvRkc3?=
 =?utf-8?B?T1gvSjg4VmUzaWJIdHBtNWFURnZoQmk0SGZ2ZUJ5VDdBTmNYayt0MGtUVDg5?=
 =?utf-8?B?Y25nNnd1K1NSL1BuWTQ1ak9hN0FOSFVITXE0N3l0ZXNFaEVEcDM5Sk9FUVBS?=
 =?utf-8?B?djRubFgvV0hWU2ZpMXovV09sY041UlBKZ1NweHBLb2dKalVqZFJVelFER2t5?=
 =?utf-8?B?OElkNi91dUh6YUt5R3plRDNCd1dveDcrV3hXOTFuTWJwcGl4WlJEa1ZCMU43?=
 =?utf-8?B?b1hQL1BpMmdaMzJNeHNsRWZYWHR6eU80dVY0V25SM1cxNy9QUWdKN0NxYVFF?=
 =?utf-8?B?STk4N2E0SWV2V3lLeDZlVVJJR0VaZFB2cm1OMUh5UWZCL1ZpSlp4RzdRWksx?=
 =?utf-8?B?SThyRU8rSkpZaEZ0VXBDVTBNdDNUNThaSHI4T3pDVkt6L3FRWEMxRmlyT3ZT?=
 =?utf-8?B?enlZeUhkQmptU0lyYVdyNGRBZVNKQk9TMGZ4OEVMcEdkYTYwanVOUGRuS0NJ?=
 =?utf-8?B?dk1RRHZ1WHpmcHVpSURaaThRbkEzV0FSU0JPejNYbEJSTVdOWTNaSUI3NE5N?=
 =?utf-8?B?OUpOTWJ4clp3WHlNajRzd2RsRnVlR0ZoVmFhT2piYzZRa0lkZUJEOHZmZHN4?=
 =?utf-8?B?b051ZHpZUE1aOVVSeS9sY0NCZWNFMWhyRklvaDlTZUVPOTUxYlU1ZEtWdTVL?=
 =?utf-8?B?Nk5sVXN1dkZxbjNoK0lDck95eXpSTzNnekdhd2dtWEM5V1M4V05Pa0R0UHlL?=
 =?utf-8?B?V2dNN3VtN0FBamNObnI5MXgvYjhGenlCTExXODJLb0ZCcWVGWVlFU2gyRlo2?=
 =?utf-8?B?cisvc25TMk5SWXk1THkzMTZRS2N4dGpudDZsUDhCbHQ1dzJxS28xVVBaQ093?=
 =?utf-8?B?VUx3UFdTK2xOM3g2TytOTklOaTZ6UWEwU0RFTnZpVDk0L1JOemNsQnpvd1Nv?=
 =?utf-8?Q?W7YVtXuC7fG03?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189a3e28-837a-494f-d0b3-08d8c81a8e19
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 08:06:05.5304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVKY6FGP9DhQgU76gqH0t+7inF6HhvL+8D3r0C5rFHpu8m+SUfNCc13ZVcWL5Kro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3840
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 Sandeep Patil <sspatil@google.com>, kernel-team <kernel-team@android.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Christoph Hellwig <hch@infradead.org>,
 linux-mm <linux-mm@kvack.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, labbott@redhat.com,
 Robin Murphy <robin.murphy@arm.com>, linux-media <linux-media@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.02.21 um 03:02 schrieb Suren Baghdasaryan:
> On Tue, Feb 2, 2021 at 5:39 PM Minchan Kim <minchan@kernel.org> wrote:
>> On Tue, Feb 02, 2021 at 04:31:34PM -0800, Suren Baghdasaryan wrote:
>>> Currently system heap maps its buffers with VM_PFNMAP flag using
>>> remap_pfn_range. This results in such buffers not being accounted
>>> for in PSS calculations because vm treats this memory as having no
>>> page structs. Without page structs there are no counters representing
>>> how many processes are mapping a page and therefore PSS calculation
>>> is impossible.
>>> Historically, ION driver used to map its buffers as VM_PFNMAP areas
>>> due to memory carveouts that did not have page structs [1]. That
>>> is not the case anymore and it seems there was desire to move away
>>> from remap_pfn_range [2].
>>> Dmabuf system heap design inherits this ION behavior and maps its
>>> pages using remap_pfn_range even though allocated pages are backed
>>> by page structs.
>>> Replace remap_pfn_range with vm_insert_page, following Laura's suggestion
>>> in [1]. This would allow correct PSS calculation for dmabufs.
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdriverdev-devel.linuxdriverproject.narkive.com%2Fv0fJGpaD%2Fusing-ion-memory-for-direct-io&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb4c145b86dd0472c943c08d8c7e7ba4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479145389160353%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=W1N%2B%2BlcFDaRSvXdSPe5hPNMRByHfGkU7Uc3cmM3FCTU%3D&amp;reserved=0
>>> [2] https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdriverdev.linuxdriverproject.org%2Fpipermail%2Fdriverdev-devel%2F2018-October%2F127519.html&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cb4c145b86dd0472c943c08d8c7e7ba4b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479145389160353%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=jQxSzKEr52lUcAIx%2FuBHMJ7yOgof%2FVMlW9%2BB2f%2FoS%2FE%3D&amp;reserved=0
>>> (sorry, could not find lore links for these discussions)
>>>
>>> Suggested-by: Laura Abbott <labbott@kernel.org>
>>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>> Reviewed-by: Minchan Kim <minchan@kernel.org>
>>
>> A note: This patch makes dmabuf system heap accounted as PSS so
>> if someone has relies on the size, they will see the bloat.
>> IIRC, there was some debate whether PSS accounting for their
>> buffer is correct or not. If it'd be a problem, we need to
>> discuss how to solve it(maybe, vma->vm_flags and reintroduce
>> remap_pfn_range for them to be respected).
> I did not see debates about not including *mapped* dmabufs into PSS
> calculation. I remember people were discussing how to account dmabufs
> referred only by the FD but that is a different discussion. If the
> buffer is mapped into the address space of a process then IMHO
> including it into PSS of that process is not controversial.

Well, I think it is. And to be honest this doesn't looks like a good 
idea to me since it will eventually lead to double accounting of system 
heap DMA-bufs.

As discussed multiple times it is illegal to use the struct page of a 
DMA-buf. This case here is a bit special since it is the owner of the 
pages which does that, but I'm not sure if this won't cause problems 
elsewhere as well.

A more appropriate solution would be to held processes accountable for 
resources they have allocated through device drivers.

Regards,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
