Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C38533F7736
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 16:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B086E245;
	Wed, 25 Aug 2021 14:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2061.outbound.protection.outlook.com [40.107.212.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DA76E243
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 14:25:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlY/QVWvJI0tBW/C3e1eUR9W67AvItRDM0kNa/cLRcrj4r7v9bju85gwSmw/p6VHG1g2jmVRN+jGcR/iPMAi+3QFu4iCH3cLtD5vmt1Pb0UV5trDyw0WCiHQDaxKQB6LX6OTcRRy1NOYv2J1hqCKdwJq2KyAwtZF8Pih7dWxSCx0Sd4lkGAPYlg7gyD9uceUw/6n6uMkSvzzlODikMsAORBYCfHu8zeY89nw7rdb/5uGKuTPhdxH69fLaijM4Q0iAq0VK/m5Zw+YPZUM886n/LLJQNs1Zg3+lHyI5zCmpnUBkTV5Pc874uyFLYx1NXP6+gXJBF9yq2qI0FWX9cuOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJJ3lnjdJMe+RI8POQKxEthOdLBx5s/8mpDp5gZc0O8=;
 b=O9TAd7lG5icMXHVeK7EySuZgDoR4i6YlnL734tYFU+Om6MG0bbzOOncyESAgEyusYJ+2/l0FOyqHc7ChMEpVYPBqBHzI+XK4qXDRI2LFNITysQfMlU3WfMoDQfPY236JeOZnQJAKzw+3ob1e6W8qtOviCUBQ23VOC+Ggr+0I2cF5ua7H0zswReMkSh/1lAD7lT3PFKJnJHNpH7rYHtnkxIwW16Dv47BZhWBr0tBIGamJ5JPSwDqj6kIT1ckz7ByZjlIBUApJpmWhR3FEA0tVzxAHJt0dIHgN5rEZQjpxX3HXdv6knjjdF0nfbu7miGISqcmmDX5v0g0KVfKxLIBSRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJJ3lnjdJMe+RI8POQKxEthOdLBx5s/8mpDp5gZc0O8=;
 b=pf7VRv2jPNy2PrgGELKUjSz+gVoSWFuHLDHeG9g1tELFkDe5mRaFqq2mlzOozXzqkq1zRIAouGYCfwRwEjHJ3gZUCOdu8nSpPC7UOKcZ5rr0b2z0NpQgYyPLSCQG1YNERGjHfM1O1xhYmq7veH7cbc/FydzcWa7OzwvRzIwbug4=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3936.namprd12.prod.outlook.com (2603:10b6:208:16a::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 13:51:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 13:51:21 +0000
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Gal Pressman <galpress@amazon.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Doug Ledford <dledford@redhat.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>, Leon Romanovsky
 <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
References: <20210820143248.GX543798@ziepe.ca>
 <da6364b7-9621-a384-23b0-9aa88ae232e5@amazon.com>
 <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
 <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
 <20210825123802.GD1721383@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9c9ebc3b-44d0-0a81-04cc-d500e7f6da8d@amd.com>
Date: Wed, 25 Aug 2021 15:51:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210825123802.GD1721383@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM9P195CA0012.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:de26:aaa6:84e1:c609]
 (2a02:908:1252:fb60:de26:aaa6:84e1:c609) by
 AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 13:51:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd845d52-2f0a-4add-3449-08d967cf6bc5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3936:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3936DCAEE16856AA9172E89D83C69@MN2PR12MB3936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6N1vrdSkJ933w6UZHcngj60lvCVvgqOChqqzuhr/1Zp5yDhOZuZIvEg+IyhQJzeEmcfaQHnJCbQ5AvWAOwpHlZG2aC70aEj7xMYgztXMx34yoVtj9bKxDa43cLn0sLpS5szVFaXqY2mFPRWtDm+kNv639gWAZ5kY74UT30Zj9dvEiBexjKcL2eFHY6S6OjDf/EOqKRMiDL5pY8p6k3fsmHvZLAHryCrodVuU2PCyF4KJZJtmKU34XgDZAMkANHE5xgaOMruuQOEJqXAy6Cz3Y/MtK/6y6mPNcuqUC1616mZ2GxfWhGwpUzZ7dzfXQLEYpkq2VKLl4/hOeQR3MwWp1JfmaTtH+Ma//DKHheF/gCfeK/HroQOfFPrL+94AFvHwKEP3bR+mulyyBZarlSN7KUvFvj1P3p22HVM1wm5rB4rv1ZUoBkXGjuyGYEpbZbuRNwF0vwX1L50jRarWClTCXbDDNxD3byE34SIzEn++dzXiExQ6MFGve3VuKvwgndhSZycnyvvvDO7CYP/oxHL7RClECNOtD0+lv87INf7v4mC9OEYL/JUsf8hr4V5gExxpNI6OIOKBXo+T8jZvqyhlinogIOkZ4EVsvWP1gLPyN6Kc8jgndEizF0bOoykb+nBOiZ8PFwA+JPPWLqIeAcAwRSP0MJMzMNEYd/xhNa9H6cczyNqh38oo1mMDgKo8q3q0jK2H8+GrbfXeLkUsxTBoJ0E8+v0+rZARPIDM0pXqFRjBZoQyLd5Za5wkQ5iMX8NX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(66476007)(66556008)(8936002)(186003)(7416002)(8676002)(6916009)(66946007)(38100700002)(6666004)(6486002)(316002)(4326008)(2616005)(54906003)(2906002)(66574015)(478600001)(5660300002)(86362001)(36756003)(31686004)(83380400001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnFKVG8wU2gvUDNUelBoZy8yVVVBc0NVUTFaQlB2c1dYRXpIY2t4ekIxN0Rp?=
 =?utf-8?B?K09GQWpCYzV4aVFuYklqazNWZTJubGZmV1JvNUdZT3MxZXJ4MkR0amVpWDVH?=
 =?utf-8?B?ZnhLNGJIMmlxTmpmNjg0ZWJkWHVmWFExRGVXT0FrbTdzRmdINnhTTFU4cFpn?=
 =?utf-8?B?VEVGOXIwRG81ZEdxOGFJUVNzeTJ4YjZiMldENUxZWm5ZbDFSeUt2eG53a2ZL?=
 =?utf-8?B?MVp4OHUwYm9JK2orN3Vydm50QndiZWFhWTNscW03bkgwd09YU004UHhXa0tz?=
 =?utf-8?B?Zzhyd25EQTc3K2Rka0F3ZUE1UGtrOWR4VGMrOHRlZlJLdWo1T2ZpdWhRNjVX?=
 =?utf-8?B?NTg4SGNLeG1JWHFtSXdVM2hLVjhweDhTNExqV0NoTE5lOXJPK2VaWUJZV0ZC?=
 =?utf-8?B?aVVOK1U3eTZyaGwxUE4rOVNsS0l5eDlYYUU4a0ZSYWptaGRWam8wOGdoSjFp?=
 =?utf-8?B?dzhZd1p4TGJBMGNHZUdUSU9Hb3BnMHc3M3hzZDJrZytKQlV6NXNDK3dwSFpV?=
 =?utf-8?B?b1Vjb0FIT3lDa2VWeE52cXdFU1Y5Nm1jTE56QkZKMVljbXdLei9mUDMyQ3gr?=
 =?utf-8?B?cXZjeUVYcXpnWW1tUXJJYTAvcDJoWFprSFQ5NlkxWTlsSSt1YmFmZTZZVWZs?=
 =?utf-8?B?bnZyaWtQWVNZSmVYaWpsZzVIbVVjYzMra2Mvc0ZSdldUeG5wV1lWNHRlT0hu?=
 =?utf-8?B?aUVJRFIvR2NwenNJYVZaMklzNW5qZjlqMGMvSGFYMVJMZ1BRQVd2TktOa0dh?=
 =?utf-8?B?OGZrdXN3MWl1L2FMZnFsNXZmYTFxZTcrU3NOOFJYZGtYdktSQTkrSWY3RjBI?=
 =?utf-8?B?NURiVXRJL0JzVWc2VFV6M3ArdWN6YXlxMWhUMGgrZ3JKQVB2Z2RSK3p4ejlS?=
 =?utf-8?B?NUh6UmhvN3gvdzdjVWwrT1V3NktYSU9RSis5bmR2U3hvVEpScmhiOXZmdXJP?=
 =?utf-8?B?Ry9BUkc2SUJ4UStqR0ZQZENnQnl2d3R0RitBTnRnWHRNZVJVckhjaSt6MVNB?=
 =?utf-8?B?ODdnYW94ZklFeEc4SDFBTHB1OUVjajBOb0QwbVBRQ2MzWjJkSFpaS1pWb1dh?=
 =?utf-8?B?VlJFTjR3SWtuVURmbVdzNEFKT09VV1RaUU5paDdQeTQ3VTQraldVT01PdGJV?=
 =?utf-8?B?MS9TV3dzN3l4b0lLYVJHbEJpWUlha1VtSnFxL0FXQ0RFS1NLUmpIMFBQWWNG?=
 =?utf-8?B?U0xuclJveG42NENKVHliWWxnRU02ZHY2cVRnSmtvR3NwejNERmJtL2ZWOGUv?=
 =?utf-8?B?a0REMDNTUzR5Y1puSkE1OExheTRQOHYzN0ZIQWpMQytJa2xFc25hL0xqdE1O?=
 =?utf-8?B?djRuVVVpMnhsbVJDcXdqQVBtaU5RRGVyZUp2SWljRHcrcFNBMjVyQ2JpYi9N?=
 =?utf-8?B?NFdOWnpsMU1ZanZEcWN2UUdnR1MwUzVVcVhTN0Z6b3FLZlBHdVdKQnhaQllh?=
 =?utf-8?B?aEwzUGo1a1NVR1Y4bHdIY0J6S1orUkxkQ2l0akJlRFlVV1N4cDFIbE1YNE9S?=
 =?utf-8?B?UnpWbmNCZTJDc2FPSk5zNVBDTEtDTGRld0ptQWV6cnRGYlhMNzE5WGxpMXBl?=
 =?utf-8?B?ZVU2cWVqazdiWDExU1lCOFdUekNBZExwSWhMN1FhWjhWakhYRWljUUUzaU54?=
 =?utf-8?B?VXFCOHd3M0hUVHpQR2lYdVFVYkt0dUxra3F4WGovZUIyU1dMNlY2aTVua3Rs?=
 =?utf-8?B?emdMaUdiK2w1a3UrdERFdEpZakxCd1hOZGlGVW8yUEwvYytNL21SQ1kvRHNX?=
 =?utf-8?B?NDdzNTJwMWhyak4zbHVoaGhFSlMvNklGUHFKNWtRRDVPaG1JY2RRQzJObE10?=
 =?utf-8?B?ei9uTGRWbUt4KzE3Ri9rTThSRVFadXhsTmErcmtCOWZzd2JMeDYyTlZBL1dB?=
 =?utf-8?Q?5hChwIF6J9lAw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd845d52-2f0a-4add-3449-08d967cf6bc5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 13:51:21.6501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhgBAxrGRr2lJOZeKWCDnWGGpywbGg6W8jINSyV0YXW0nOIzG72tH9vkb2RN+EQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3936
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

Am 25.08.21 um 14:38 schrieb Jason Gunthorpe:
> On Wed, Aug 25, 2021 at 02:27:08PM +0200, Christian König wrote:
>> Am 25.08.21 um 14:18 schrieb Jason Gunthorpe:
>>> On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian König wrote:
>>>
>>>> The only real option where you could do P2P with buffer pinning are those
>>>> compute boards where we know that everything is always accessible to
>>>> everybody and we will never need to migrate anything. But even then you want
>>>> some mechanism like cgroups to take care of limiting this. Otherwise any
>>>> runaway process can bring down your whole system.
>>> Why? It is not the pin that is the problem, it was allocating GPU
>>> dedicated memory in the first place. pinning it just changes the
>>> sequence to free it. No different than CPU memory.
>> Pinning makes the memory un-evictable.
>>
>> In other words as long as we don't pin anything we can support as many
>> processes as we want until we run out of swap space. Swapping sucks badly
>> because your applications become pretty much unuseable, but you can easily
>> recover from it by killing some process.
>>
>> With pinning on the other hand somebody sooner or later receives an -ENOMEM
>> or -ENOSPC and there is no guarantee that this goes to the right process.
> It is not really different - you have the same failure mode once the
> system runs out of swap.
>
> This is really the kernel side trying to push a policy to the user
> side that the user side doesn't want..

But which is still the right thing to do as far as I can see. See 
userspace also doesn't want proper process isolation since it takes 
extra time.

Kernel development is driven by exposing the hardware functionality in a 
save and manageable manner to userspace, and not by fulfilling userspace 
requirements.

This is very important cause you otherwise you create a specialized 
system and not a general purpose kernel.

> Dedicated systems are a significant use case here and should be
> supported, even if the same solution wouldn't be applicable to someone
> running a desktop.

And exactly that approach is not acceptable.

Christian.

>
> Jason

