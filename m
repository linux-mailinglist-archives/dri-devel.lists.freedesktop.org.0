Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD65542E761
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 05:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F5B6E21A;
	Fri, 15 Oct 2021 03:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B742A6E21A;
 Fri, 15 Oct 2021 03:45:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+GaMyM+jkaMLT/j8sKgShirrCIhZ3t8KsdXats/GOiPwL+2/yIpLJCs/3DpOLaoqsDaoazqMqKypW3wJPlSm7QKm6itTdDVgfeN7bXcb2dNwq0HuBoDu/831e6DC3TEGjofY1oWZQVqxJsv5ajE+r3EsNw3KshO8jeiPYVFXSND83eYDTtj0y7xG+2iXs1kpNoWtInDy8h5mmEH0wLLR1lXLP2cuqVJuB8Lvlf87eTF8M0QeiydHpmrdMlksS2Sp6rfXb4NfToCJ3P5J2im/G/bGxfxwXggz5WB32V2zGwC4fVnRZXuF2L0DOdYVt48i+dARvZCRNo4AECt3jtsmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUthTYcpuV8BpUCzxKEXfzKBMrpaR8XcWGVMDC+NOYE=;
 b=aYfSSW057/99EkNiGRTcMIoe/6ktHnvI1mlAjYLUWGzn95C/UBjgzScrsR+Lo2FxI9rqAgzDVLXam/zvRdleLgx4TjSvKBnREeql6Qe1XMpzN2E/Y094II803EdNuDT6sEJvuTdfrFqExiTGhzTRMRO9J1LJOkIXrFajCLQCCk3mmw+5WB0P7IoZ5aBpwocv2QYFBSS8COrCeSsdurWqzLpNt4euJoIwz0c5+MG3jAeVXktbe73oUhjTyvdSMpapmzAIPwoToBG9pXmfVeGcZj2IiHARc5tzE/5TYoMEqQts+l0wMLkaIMvy40WE/UB+X5O0VUYtf4nhF92w1dbnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUthTYcpuV8BpUCzxKEXfzKBMrpaR8XcWGVMDC+NOYE=;
 b=Yg41wCTr1LKIfk5dAbfMc0ryO0iB9U8BCLEYKewJGYZnC3AjcXuDPO4FmjBVz6yEH7AWcEYGk6onoajSIhkaeG7FgqB/PyFJeGj2ue2SUQDgo+QJNthokwdt1ZzrUcfCJz+BHi+u7JFte6DWKJ5vyg4L96vaznfhoWw1+G8Ip64=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4430.namprd12.prod.outlook.com (2603:10b6:806:70::20)
 by SN1PR12MB2366.namprd12.prod.outlook.com (2603:10b6:802:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 03:45:54 +0000
Received: from SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::c3f:b81f:a077:5d5f]) by SA0PR12MB4430.namprd12.prod.outlook.com
 ([fe80::c3f:b81f:a077:5d5f%6]) with mapi id 15.20.4608.016; Fri, 15 Oct 2021
 03:45:54 +0000
Message-ID: <fe418973-5086-e13b-2e58-c786dbdd9d0f@amd.com>
Date: Thu, 14 Oct 2021 22:45:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v1 2/2] mm: remove extra ZONE_DEVICE struct page refcount
Content-Language: en-US
To: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: akpm@linux-foundation.org, Felix.Kuehling@amd.com, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 jglisse@redhat.com, apopple@nvidia.com, willy@infradead.org
References: <20211014153928.16805-1-alex.sierra@amd.com>
 <20211014153928.16805-3-alex.sierra@amd.com>
 <20211014170634.GV2744544@nvidia.com>
 <eafbccb5-f94b-0ddd-bb46-7ee92ed36ee8@nvidia.com>
 <20211014180132.GA3567687@nvidia.com>
 <b8b57851-674a-956d-0d7a-779e601bf6d8@nvidia.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <b8b57851-674a-956d-0d7a-779e601bf6d8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:806:120::13) To SA0PR12MB4430.namprd12.prod.outlook.com
 (2603:10b6:806:70::20)
MIME-Version: 1.0
Received: from [172.31.9.47] (165.204.77.11) by
 SN7PR04CA0038.namprd04.prod.outlook.com (2603:10b6:806:120::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 03:45:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52e58202-8b59-42dd-e5d9-08d98f8e4a1f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2366:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23663A17ED8FE5AE9A107B4FFDB99@SN1PR12MB2366.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mg5DnhxhX1NX76gysWumpS/u5bONUW9zFHhOpq2Yz9CEdwM/kcITQqu6ioHXRvb4xWhwfJc61Ig8YYD5sUExxW8t4iuGo4AX25ivHCqxFv5pNGTbZQK0H9PnJfO4S4tIp56iGegtz6mEUtKcwHbpqp8t7xQHX7t1fpyxebIpe1YlKmicKB9wdvOhkcIhIZGT2vevY2Co4K+0APmLnniNDB7ic8X7dXYY4KI4E2TJ2B/8EVVzplpOTU7TnstYMTcAX8izz9t8uJJXvE9arPRoMzJOOTgDOKXi0fzmJlqCztNlzBK/5c0/JcwVuds1XBvpqrLSTRdaYCbgTBD0ebSQwMJFIqzXJX6s/xT1fscPGAWgvbvdOCpV9qzEfa30MPMkUufzRAYE1fzMCqa9ZAVXNDXFDmSxbYg11+9V9vrRsv2v0CsWMiL8K3ew98j0RRkxb/IUNkqzYTx7ju3w5jfakFqdjg9O8cejzBNehLCNu/ebU3wzCSSrtykItRPjSeM2dSvQLNECEZjd4l66O77u6ycCBrIShhm/jTWgqsseyeoe7QSNBUK34Hhb0ygQjak5PRFfvPfDUZ/FAwPQpKms+yfDcSs70+n3S+hLHy8Ab9zX1dX3bkBHK6cS4kfJ9w+pqGoXAENOpQOx09cuWFRvqDYsjIy6fsZKD1Ir30ZlAIwnxmFgj7L7UwcFe2hcnNrPq9j7gAbQekHduB1M+UBFMGtbXgpjqr562Pl+oCdixJU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4430.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(86362001)(5660300002)(316002)(66556008)(66476007)(2906002)(956004)(8936002)(8676002)(6486002)(66946007)(31696002)(2616005)(110136005)(4326008)(26005)(7416002)(186003)(31686004)(16576012)(53546011)(508600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlNITXZOTXVacnlFMy9kWERyVXRpS0REZ2dWNW05all0NHU3VzJWMmh3Snp1?=
 =?utf-8?B?b0JYbUw1NWtTRElDRy9jcktNMTMyMFJrZVMwTTZBZEQ2S3loYnJOaXVsMThV?=
 =?utf-8?B?anVKdG9vVDRDR0lKVWZqSm43ZkxwNk9hMVd5WjJ0OG81MWFGTEY2WDhMYjdX?=
 =?utf-8?B?SFE0d0JlNFFkK0tKN2xyYmlBWDhRZ0VtVldsbkNNWmUyYzE5VlE0aElPdTE0?=
 =?utf-8?B?N3Q4MTgzQmwvQkQwWnMzcVBhUXdla2pBVkJkRStRNU9qM015VDR3aHlJeUxI?=
 =?utf-8?B?dG5yUmRNM3hrOUJWcGZGV1MxWTF0SWpBclJPNW1KbTMzTHJVaDRaYkUrOFFl?=
 =?utf-8?B?bnA0OUFMMVhaSkp6SWcvS2Z0a25tTk5VbjkrRTF0SUptVGVEaGxCcmIyUlBR?=
 =?utf-8?B?ZWs0R1NDL1VJY3N2RS9DQjkrQS9TQVFpSERxdkFzTDNNUWdmQkNkUkVBY3ZJ?=
 =?utf-8?B?UFFmbjN6NG5MN2lIcDhqaWpTKzU0Nko1Q0VVSlEvU25pZlBrNEYyN29zNjdS?=
 =?utf-8?B?dHVZZk13MDFXL1RvQTdHVFlSdXZNSkN4Umh6UURISjB0NVpBNyszZWFyTHIy?=
 =?utf-8?B?Vy8rUHBWdzMyWis0UTFIaE5aMm94bUhVSHVzR3g1anY2M3lJejNIeWREUHNF?=
 =?utf-8?B?MklSSEhuZmZIV2JiVERTcnIzT1FVQ3B1dU9reGx0b0tmUWpHWlFBNkhPeHVU?=
 =?utf-8?B?TU9vUXdqNlpwSTJTZGltOEpCS2NZWEJRbWVaWi9vSngyb2ZHU0RaSVFWaDlK?=
 =?utf-8?B?c3gxbzZYUzQ1ZHliOVUrWWpVdmdEeEU0RHlnbGhMZTRpendqZko1MGpnS29L?=
 =?utf-8?B?eUxOa3FvYVg1YnV0OXpZelh2VjE5VXh3eXV2VHV1OUNqRDJSSVRMMC9nbjIw?=
 =?utf-8?B?c2ptVElodGNPdUtmUjVwMW5zT291YmdUMENlVGhkWGJTS3cwSU9wazJlbDEw?=
 =?utf-8?B?ZEdkTEozNWNFaGdKU3hyOUxyMHBlajVDZ0luellxYXIyRjhwYlVPV2VmNTZ2?=
 =?utf-8?B?QkVoODc1ZWtBUm55ZEZNWmlBVjlNZ3ZrRkJnR1czQW1RL09zWks5bWZYN2c5?=
 =?utf-8?B?MER6blM3UHJOQ0ZsMnEyVXZScEdBOE96d21nY3pjejVJVVFQNFRrREE5d25K?=
 =?utf-8?B?UFpGV0FDSHBoNFZIdmFsVmVwZm5lTk03TmQ5bWo1ZlI4U1FINUF0MWpUbEdp?=
 =?utf-8?B?dXM3aVVGRWhMMEFIL2xsSlFNdDU0d2lDK1F3U0dyZXVlYXovZXYyVG9aNUti?=
 =?utf-8?B?eDZXYU9BK2FYc1Y0aU9SZUMwNzViUHNYQ0ppRWg0TSs0R29YMWdqVWk2ZWNF?=
 =?utf-8?B?cXZEQnRjK3NQRU9LVFRHOVRpTm02YXJGMllmZHNIdXp2Kyt3RGpCdFUwZ3Uz?=
 =?utf-8?B?K2p0bkh1R3I3eUZaK1BHTnBIT0xHRDZrcjdoMTAxN1d1QmtUSGY1S3FoMVdF?=
 =?utf-8?B?bzFiUFIzNmt2c2xyTTJXODB5UEVZZGpwL3psZVBtdWdWK3dxbzFiZ3hvakV1?=
 =?utf-8?B?by9oMkxZazB5b2w0Q2NNajg1c2lQQXBtc0Yrci9VYjhWWjNsSEVXQ01IQ3la?=
 =?utf-8?B?VEVOblVJL0Z6T3R5dXJqNzI5YzM3cCs2RDRna05sUEhXZi9JSTYrdUpYRFVJ?=
 =?utf-8?B?UFFlYWZZRTRPaW11a0wzZGp5cFpOdEdLWnVqYkYvWUFISE9Sd1NHM2hlZ2ZZ?=
 =?utf-8?B?eUhjblQrU2lOUXRNanVCVHN2NTcvOHJjb3J2aDhRTmI3dXNqT1VoN1RyUkFE?=
 =?utf-8?Q?/C9fdcSznVheRjWRVS8bD+i5Rgy1CDtpSSX+DM8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e58202-8b59-42dd-e5d9-08d98f8e4a1f
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:45:54.3827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J20kBa6HcNNRKmxosRc8EipHbysH6PRh8iy+VQdYjalHdU4hR+UvmzYMqU0yUqbhgPMmsSB9RSe3wx4R0+0z3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2366
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/14/2021 3:57 PM, Ralph Campbell wrote:
>
> On 10/14/21 11:01 AM, Jason Gunthorpe wrote:
>> On Thu, Oct 14, 2021 at 10:35:27AM -0700, Ralph Campbell wrote:
>>
>>> I ran xfstests-dev using the kernel boot option to "fake" a pmem device
>>> when I first posted this patch. The tests ran OK (or at least the same
>>> tests passed with and without my patch).
>> Hmm. I know nothing of xfstests but
>>
>> tests/generic/413
>>
>> Looks kind of like it might cover this situation?
>>
>> Did it run for you?
>>
>> Jason
>
> I don't remember. I'll have to rerun the test which might take a day 
> or two
> to set up again.
>
I just ran this generic/413 on my side using pmem fake device. It does fail.
I remember we proposed a fix on this patch before try_get_page was removed.
@@ -1186,7 +1153,7 @@ bool __must_check try_grab_page(struct page *page, 
unsigned int flags);
  static inline __must_check bool try_get_page(struct page *page)
  {
         page = compound_head(page);
-       if (WARN_ON_ONCE(page_ref_count(page) <= 0))
+       if (WARN_ON_ONCE(page_ref_count(page) < 
(int)!is_zone_device_page(page)))
                 return false;
         page_ref_inc(page);
         return true;

Alex

