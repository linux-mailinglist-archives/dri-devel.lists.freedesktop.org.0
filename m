Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D683BF65C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D3C26E879;
	Thu,  8 Jul 2021 07:38:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE4F6E879
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 07:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYoH/c1tiPA2EKIQIURz3+sNI390A9Df3cQo9VVU13NzPZA1asUDozarUjuZjXhMli7GnjaJInpKNa3875LKpe67v4Dx7dzxbDPg3UNHG4OBMa1xxoBaHJ3HV4mbOB5D4nIQ/5WzOkc7H2lJqgsMfWgFqCKfmvwdzvjB2iBwtXHKYst0qcAvaHl+VKRmW663oie1n0tdwRZiEhB46hhB8UxkCb/yV1n1zb1zAy0PQqIdR/ztPtnpuJiObelfFR21nEJQDbw0jmoP9RDFGNKBE+BG+magAY6jTqutwpWj2sGc0fR2Re5WmnMpA8AesDSKL6xsvlFg9iwaHVxUJhYzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMO1kMg1XjTq+X+UYxazKejnuvisMJ8gy0SeMKIAegs=;
 b=TSsOnKsJyQune7VWB1Z8DBq4haqTscjmboQSachVfkhzo8D+nptDv/sYDDWEC4GhJs7zsmYRs5S2QvR09yaQF+80VLpSMOA+k/F/xjNNZ1BlfLLBXQCwlG+Oh+QzTZO6FQNV3wGPbbAM4Yovs7856UchJFywpI3yYZDWucHM479IPCnjiYuMkChYHHKoHSjddbaEcWIvBY7ABlzmxRgoQ7AZHtv57iaxm2ZhiG6Ru+XsU87oth/SIBFWVVnOUGMllwewB4b+JxomKN9TVf5BOkGRSsUgoVLTcLqEwGhSk9yEs/dd8Xqub6nKs1svbgeLExJNZk5g2cuTvVnme6vb/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BMO1kMg1XjTq+X+UYxazKejnuvisMJ8gy0SeMKIAegs=;
 b=h8LNI0tMuvMD8blnbSRW3RrfDEOEUnZ2hqlo01MBiXm7wyEV4zyEgWnIRoTPgDzPl95oq3L/JR0tTrFbCixAoo13pWXFA6A0i/xQsrvdNDnkKJ+JDdPOuSj2BbEziUveT85saraE59fa53S8/mHQv2xYWmQ8eNAT3gzyaW3KbKw=
Authentication-Results: kvack.org; dkim=none (message not signed)
 header.d=none;kvack.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4897.namprd12.prod.outlook.com (2603:10b6:208:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 07:37:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 07:37:59 +0000
Subject: Re: page pools, was Re: [PATCH v9 1/5] drm: Add a sharable drm
 page-pool implementation
To: Christoph Hellwig <hch@infradead.org>, John Stultz <john.stultz@linaro.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
 <20210630013421.735092-2-john.stultz@linaro.org>
 <YOVL1f4m+8ly9fyM@infradead.org>
 <CALAqxLUubzuLkFxmWjfPQHaFU8EkWuGo7nDhfkgi4wPGHnBoVw@mail.gmail.com>
 <YOZ9JZlwkjyDGti5@infradead.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <798f5d1d-b64c-8c73-bfe6-701893820ff0@amd.com>
Date: Thu, 8 Jul 2021 09:37:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOZ9JZlwkjyDGti5@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.10 via Frontend Transport; Thu, 8 Jul 2021 07:37:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48bb7de0-f498-4360-da6c-08d941e34e98
X-MS-TrafficTypeDiagnostic: BL0PR12MB4897:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4897D4E620F5D6D5147D084683199@BL0PR12MB4897.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7A1LkSEDESTA/jbLk0xHnbe49n1De6MTk+6NsuptzwNTEAEph263DBVoAMpaIHDhaRf9FOo9aJPRhxZwp7GWT6oAVmcf3/ma0ufWTIBcM+vyjpkuGNYwRedWV1cc/7fMnxPihoFhy2CJdCwrDdjiSXAjui0sSUh8bzfdZA9fFg9F5DcSDa7NkPWNqiZBLwKA1IFGqMVeVvigPYqyc6D97EzrI+xmDoAzDay32HRe7Jxn8xKb5xIXP9rWUq6lStV613G8tPEtWCM1r/dJeVHzdnsTmUDGrynjCKxI3OLpQqo2t0D5GGT6S98BScMQ8fSyfjKiY6sGMF6LWcDSIFTl03o0NZTHKu7Y+qmL3MPbtu0mKZxI55vlM52qaFvSCBz0Yw9XuFsj9U98c6tA+2CwldKU8aVnksqMIzL+HqtZUwr8EzbizfUg9QFp29xh7O7TMPvNsPLn0dZep1jdxZ4/6w83ycdXrxon0+J5BrmOWYgl8QeeUMsfOXTj9dsDluEKrtPweWNnMs105qYXsGadinFABITwYqCDo2rq55EvLvpS/mrYAlyX6Ugrz0BWZ8hJcDbpIHlp8KeQ3J66JMEZeN9rMY8qA9twXma/r3E+PGcqnmZIt65A1MncnmsfWl5Q7j4WQA16/MBy3xTbmmX5HcLsHS2JclVQ4UJXDraxC2oYPMpoUXqFRGR0c9qI0JbFXm8BnhZkGLSYyXr+UXbntHU+mC2YhUMeRcLmyDMcpsCCNcqw/UWhiHqhRbY5j0B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(8936002)(66556008)(66476007)(38100700002)(31696002)(6666004)(2616005)(8676002)(4326008)(316002)(31686004)(54906003)(478600001)(110136005)(7416002)(6486002)(66946007)(86362001)(36756003)(186003)(2906002)(4744005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtvQ05YYW1yMXJJUzZrVlJMVHpTL0x6c1VJS2R0d203UWYxMytwdVh3RFFV?=
 =?utf-8?B?QjdGbkxsbmF0UVMyMWN1cmg5eDNyRnpKanpmT0VZNFdlemY3MDgwNmlCaW53?=
 =?utf-8?B?dytOTnFGZmRqWkhEbGx3eGlJZkRINVJSRGsvdTRWUm5STDRFNXRFL3dvMXZT?=
 =?utf-8?B?bG1FdnhhakZNZ1ovSEFLWnhORjlLZTFvNzIrV3R1NnJianh5VFhkVUxGTXQ4?=
 =?utf-8?B?cmE3ZG0yWlRVejNUK2R5bUt3SjJ4OFptRml1SG1DU1FoQ281TTFlWjBIMXcx?=
 =?utf-8?B?QlhZcno2aGdFNUVUcTM4Uyt2QzFodGdnVXVJaGcwcUtwaHFqZkU2MjhTeFJu?=
 =?utf-8?B?Vk94UXM2Y3laQXd2azdFSzRERm5vdWJzN01ueVc5VnRuOGErbzhWeWNybFg4?=
 =?utf-8?B?ZkdDNENSelRKcGMwamY3R3lFYXZaREZ3UHRhdG5PQlVQb0o3aDdWOHl1L2p3?=
 =?utf-8?B?TUVCaExrU3RKVE5BRXR1VTdFZGt3eUlVWjZ6M2k1VXFpQ09tWUYwNmpYeFdC?=
 =?utf-8?B?T3ROWlhBMU1vUFVsc0c2dFRxVFBaVFo4bFhWVFdIOVRLUnIzRWUrVURWdFlv?=
 =?utf-8?B?NVB4VU9hbWs4N1gyNCtCWXpXR1RaSFM5ZksySXd2Q2dsbEdpc1kwemxkY2lU?=
 =?utf-8?B?cU1CSDVoTVlSM2QrT2Z4MVpwZnI0UkYxaFFtS1dUTmh3R2xWUnJ4bWd6UDhQ?=
 =?utf-8?B?SFo1bDB5c2EreWpRNnloTFN6VFY1NVE3ckhWNzIrRFNvY2RSMkxqaXB3MTI5?=
 =?utf-8?B?WnhDMTVBZTNFQjFkUFFKRlVOekZkR3dUdm9HRWM4Ny9IWEpIVGt4ODI1OVQ2?=
 =?utf-8?B?RGl0amhodzdOWTdaNG1vaUpwMlRKeXdoVXNzL1Y5ZnRwUFU1cEZnMWZwWXRs?=
 =?utf-8?B?cnllNVJsMDNkYU9QekE4S2dsTU93dzZxNTAvNHg0cGcwWWF3ZkNZQWk3Myta?=
 =?utf-8?B?WHNNc0Uzc0FRNERoYVV4RmYrMFJuOUJaY1FiVUZBa3NIY0JhYXA1UGMzR2U4?=
 =?utf-8?B?RmdJSElwRURaSnFEdVg0dmlLR2tvNkNYY2VtY3k4VE13ZGRwUkNOZzBpK3dl?=
 =?utf-8?B?c2ZvRzdDVVk0V2tydHJaSnlRUGNoWjAzd0Y4Unp6MXdUd0FVZHVLTS9xYVh1?=
 =?utf-8?B?RFRkNGdnSmVWRWQvWjVGaDhTM1BoVGRxa3drTzkrTktNcnh5UmNIY0c4Nm1j?=
 =?utf-8?B?MmlSV0w1RXNyVVdqd055ZEhORzNDWWhsYnFrM042NjAzU00vcU40N1F4T3o0?=
 =?utf-8?B?RzExKzRESExsTDBHSlIvWWFJWjBmcStMejJuUXFGdmRLQ0FHdjdQNXJkY0Ix?=
 =?utf-8?B?bkxZL3J3OHBGejJhQXpQd1cySGNjV3ZRSGg3RDArZlAwOGF4OUhTUXhmdVFJ?=
 =?utf-8?B?NGQ2OGxNKzBLaUtTR0hsQ1Vlc1VsUi9wdjRRYXlKeGR1VmJicmRJeDFVUW9y?=
 =?utf-8?B?WStlRXQ0bWwvSmpGOWxtZnJFSlpWZWQzM2VaazVvMmZRSlRleWFHVVpPSlll?=
 =?utf-8?B?L0NMcXhkUk9WWks4aG54MGY3bHEyUEZ3c3BuOXdPQXlTaG5JTFJFUWFWc3NR?=
 =?utf-8?B?WEdrU0Zqd0djaFZJSVZyNjhzL0Y3YTlUazJ2SFFHWC9MTE1TdngwMGwxOURQ?=
 =?utf-8?B?ZzhuZkV4OVpvU2xOekVRSXV5L2dNWDI4a09UaFBWRnZ2VU1JSnlQQmVBMXBy?=
 =?utf-8?B?dFVxT0xjanBXZGdXT085WDIzTWQ3clV4SjFtL1RWcUZBdEp4TEUxWnpHb2o0?=
 =?utf-8?B?emdlNnpKS2J2WUhqbXpnbm5OckZWOFJuYVkrN3NkamRBM01MUXFycE8vRlVo?=
 =?utf-8?B?Tkt4dkdJUzR2RU1vbG4zQmYxb2xqaDdsRVRESzRyaElqMXJCOFlrWk5QZnBr?=
 =?utf-8?Q?DqpqifLONl2XA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bb7de0-f498-4360-da6c-08d941e34e98
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 07:37:59.5619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +09IUgizJvH0pK6ASmIdu6wXs+FQL+1voQTYzWfsPEwW+MGWVkQYnRqO8DTG9N7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4897
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, linux-mm <linux-mm@kvack.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Mel Gorman <mgorman@suse.de>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>, ??rjan Eide <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 08.07.21 um 06:20 schrieb Christoph Hellwig:
> On Wed, Jul 07, 2021 at 12:35:23PM -0700, John Stultz wrote:
>> So, as Christian mentioned, on the TTM side it's useful, as they are
>> trying to avoid TLB flushes when changing caching attributes.
>>
>> For the dmabuf system heap purposes, the main benefit is moving the
>> page zeroing to the free path, rather than the allocation path. This
>> on its own doesn't save much, but allows us to defer frees (and thus
>> the zeroing) to the background, which can get that work out of the hot
>> path.
> I really do no think that is worth it to fragment the free pages.

And I think functionality like that should be part of the common page 
allocator.

I mean we already have __GFP_ZERO, why not have a background kernel 
thread which zeros free pages when a CPU core is idle? (I'm pretty sure 
we already have that somehow).

Christian.
