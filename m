Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3338F43D1FF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 21:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB016E560;
	Wed, 27 Oct 2021 19:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9256E560;
 Wed, 27 Oct 2021 19:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTpCU3XpR4NcTsYdKFnCXd4zeq/udHodm5HQspO3D06WG4vT8Je3WbfWeC2TjqfSkCEiQMSdqNW/ZjK1iaMav6TIKz1L0gRhYxkapGkymgqsoB1wERIycD4tfEKbe1G1XWr7n+glb4RU0O7k9P+TdI1inf4TMRFU5ASKEgqifeAQ4SahcC+LiWsMe6dfymyE4WJn8UWs80sxHCa+o4BXhgf15LR0cP6++KaS62bIZ+g1nlHTuE7HvJE59NhcMUYHv+i7ZW7JZXMcsHViPJpWufZ/Mrief1prdNtTmwAKfac125WWCH7Q7zMF15hMPShsaMjSYTysDXZjcJdMfPr/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgXEVlIBxN4R4QLOBGcHY1UudXUgBNaxKPFuPxasXpY=;
 b=S/ro3hrJvsN3nZIbJ2gqteebdEN6JhzZwJjeS9PHRtF9Wbc8sC6HCihb7vvhxHmM/ZWULieLsn8miuqoSoVtMqW2iIzH2XGpEnKG/wNWzXovxCjpTYpF88EVR/wMv0XUYS5d8dI+HwTIb7d1WqfMazGjtZrGGo2IRJ7cVR1/uIY7+ZptSziuE3ZZHCGJ87DRq/cD+yPi3Iu+gO9g7AwGZnElEB7G7v4sGPpjIr97NTPiVSntmW3IpIEoS8pOCbyZf25P7AjgNlmU8rDFqZUJwr/miYWPX1ZXtFYhbU9YPdjwxdWIpFNPh+m2B5O3I8pvHpsVHde+WIa77aGIARiiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgXEVlIBxN4R4QLOBGcHY1UudXUgBNaxKPFuPxasXpY=;
 b=nBNyzlGMJwIG62Pz0072WTxZaYqanzv6gBfx1r8M08FRkwCzNLJDGRf242ZiESK0VgXDeFjlz4GFxktZ5euvJUta1H8hGNY3uApIWyAGsBu9J80yLOzasUrMlp5337DgkXZl9HnVPyc0ApbCSOrAslhxbbaeS1uS40xg/Z9Opa8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1943.namprd12.prod.outlook.com (2603:10b6:903:11b::7)
 by CY4PR12MB1189.namprd12.prod.outlook.com (2603:10b6:903:38::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Wed, 27 Oct
 2021 19:58:49 +0000
Received: from CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::28c0:a6b8:eb2f:5a79]) by CY4PR12MB1943.namprd12.prod.outlook.com
 ([fe80::28c0:a6b8:eb2f:5a79%9]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 19:58:49 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
 <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
 <5c70c6a9-8867-506a-1e7b-32f85589a070@amd.com>
 <c5fc1be1-eaec-a57c-79ee-9a63123ed9a2@gmail.com>
 <a1f594de-e326-6150-c787-35a4fde648d7@amd.com>
 <ca590ce0-ea1c-0d40-f157-2e3b5c657b01@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <f1a7093f-1872-3a8a-820e-ada11b1293bb@amd.com>
Date: Wed, 27 Oct 2021 15:58:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ca590ce0-ea1c-0d40-f157-2e3b5c657b01@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT2PR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::8) To CY4PR12MB1943.namprd12.prod.outlook.com
 (2603:10b6:903:11b::7)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:9448:e1a0:ef19:2ba6]
 (2607:fea8:3edf:49b0:9448:e1a0:ef19:2ba6) by
 YT2PR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13 via Frontend Transport; Wed, 27 Oct 2021 19:58:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2f8f8cf-21eb-4956-74ce-08d999843165
X-MS-TrafficTypeDiagnostic: CY4PR12MB1189:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1189F8C83B643B599D3E19BEEA859@CY4PR12MB1189.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o+ezBJ7p20ebZsXEI8BEpdq11BOsA4ws8DghM4GiMQMktw7UG2PnEkfobt01zqf8qZ4dg9EOcOPXWn+flyDMeJ5Lh59AwV1q075VtC+jajAMJ/GeeQyBKWPBkdxTBBbcTuNxYL3H83ECHLGB7jx45sPoj5eKjh25t3W7yVCtPSc3QnVHOIcrBpOlKgipMT6Da4LRpGVQ4bbcPm3lBtAnA4sugRYylj7upxcLArNsK1LhvhxRzgA+YFFC8eUPc/rqB4eJu0PYUVDex1xt41h5q1LpzFquvsqJmhQWWunj93KFwNjgEjaYR8ThtGFibF0Atc859AKrEAQbHow1XTHXSs7jEJRpkiGrqisZhJm4TaL9hBO7yiiQUvHEf8r/JBA6zEyJV8o2BX53AI3Mm42LXaJFP/UQwpHW68KFCPQdGPPQ/Qq7brbLywPmrlJLFW2jJ27GRwc39jQX7Dn0jbME5743/CzcNUPy6qQQjYryW1Y1KY4cfLUfqA31XuS5JT7fBn/3a28iUeaJK6ifYqpRPZslTsC8rE6opxYewtxU5TmZXyl3WMDKDvkkpcYwa7ELCrNUCr4whXCVOE6ok6i42tAVO05XuEekcaVZJArzJxMJPr27EIz1vAnc2/YgqxK2hDSBkWJlb/knQyfhlKdZVekU1Rpy9jvWHVJZfPtAQdxqtSxtFwWZ6DZbm7mgzTkJg+pkgONTIifMezUjrgoFesN5klzeqYUJ0bJgWmOu5JVdI8MwPbhkmS/pUC/o7aLJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(110136005)(8676002)(31696002)(4001150100001)(44832011)(2616005)(6486002)(66946007)(83380400001)(86362001)(66556008)(508600001)(36756003)(53546011)(31686004)(186003)(66574015)(66476007)(38100700002)(5660300002)(316002)(8936002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MU5Jc3hxY3ltVDgvRXZJSUhFNDdvQi9DNVBvK0FzS2FQY2xMU2QreGVNNW1P?=
 =?utf-8?B?NjFuODU3ZFlwVkFXaHNOQ3NSZlR5d1ozY2w2cmlZVjFqUDgydUJoWUo0ajNT?=
 =?utf-8?B?SUR1a2JMallDeDBqZzNCc1RrNnlmdGlTK04vazNaTU4vNDZ3SGNWQVdnc3FQ?=
 =?utf-8?B?cUFvdzNOWnJGZHJCbzNmMStCdXU5Q0lhUjdLRlN4K3BjcllkVko1TDQvL3hz?=
 =?utf-8?B?bWFtZkhveWJ5WithdzU2ZW1VU1JBekRtOHIwa1FTZHp6MW5ueWhuSHlNTW9O?=
 =?utf-8?B?S1dMd2NyRXRUV1EyZkY2NXRnN3YydWpRTEVPeS81SGJEeXRmQzJ0UjlxSncw?=
 =?utf-8?B?MHNYRDRVako1UXBCWnZPQnNCZm1QQTNXYTNKaUhBZW9sL01EVEFmbEowdDNz?=
 =?utf-8?B?TzlaVWVaRkd4bkgwaGt2Z0NsWjc1Vk1SZkRQNGJuSi8ydW5GYVl2WVRNaVp3?=
 =?utf-8?B?NVFQcnpLVW1PaGFTUjh6S0lqUjV3cUNQZ0NsTzVPcnJHcEtLeXcycnJQbFQv?=
 =?utf-8?B?c2ZvVFlBbFBweW1YRkRBeU9qQlBhUm9WeWI3UUQ2Vm1PdGQrWUNDYmIzNFZu?=
 =?utf-8?B?S3dQanRESC9oUkpRSW1LM2Y3M3FXb2ZZOE45Uk5wVnUrSzlVM3RlNFg5Tm15?=
 =?utf-8?B?b3IzZXJ4WHVrNXRyMWhSNEJiazJqbURJNkx3bDdYMWxraUQyUFRSWFF0WCtJ?=
 =?utf-8?B?cldjNk5TL0o4ZGd0V2NpNUVwSjdwemZFOVdZQzBWZlgxY3hBelkxanJQa3cz?=
 =?utf-8?B?NnZmZFA0NGcxOUxIeGFNNHRDbUE2b25aV2U1N3llODd2b29JZUxZU2VoS0ti?=
 =?utf-8?B?S2lzSFNHc2hQZXphU2RlRmtYMWZFTE9mSVRWQjVLZHNpM3dOWnFsUFZmSmIw?=
 =?utf-8?B?aC9uYnZaK1pDa1MwVkRCbDRXRnFWcU1PVUJUWDArbzBmK01uUHpCbWN1V3ov?=
 =?utf-8?B?K24za2pjL21BSHd0YWEydW4wY3pwQWMrdmtoQ0d3TTJndHpWb29wa0FQbld1?=
 =?utf-8?B?LzFSOVphSTZxSjFUdzFXNFhLRVdVM29ISzJTWmkwVW5PdzJhUHBkQUdRam9L?=
 =?utf-8?B?UDBTL1lPVGw3UzM4b1pQdjc1d0pxbnM1N29HWFBnM0t0QUV4L3A3c1ZCQ3VE?=
 =?utf-8?B?S3MvNzI2VlJUemhldzkzTW8yeitIcEw0eFpCOHExOXRqYlVWcEYxaDNIZS82?=
 =?utf-8?B?bGUzWkExc1U4NXpEMURnM0xwQXhuaDJZMFVzcm9GZ3MwS2xLRU5vZ3lnKzYz?=
 =?utf-8?B?dldoMFFtSGNraXkwTmR4UUJiNUdLa2lrWEYrSFpJNDhQVVVYSHlvR29XclJy?=
 =?utf-8?B?bVB6Tk1EL25nb3BUOGFCTmNVcDUrdHFRTlptQzVRNVFFOFpnbFFRYkYwYmE5?=
 =?utf-8?B?T0s1eVg4cVJLT1V1OEVvS0NJWEVWWVQ5ZmJvaTlvYlpnRHlINFBJYkQrc3Ju?=
 =?utf-8?B?TXJzQm1IMDI1NysvbkIzbERjNTRza28xd3YwSEVBMkE3OGZ4S24vOU9oUkw5?=
 =?utf-8?B?dDRaR0ZzUW1YcUs2Nzh0di9QYVovYXl2UTFsaTNUTEFtWi9RekowL28vYmFi?=
 =?utf-8?B?YncxOWhpWlFxU21icWRDdmxYM3JoSmJqclJNVHZyd0lVN0JORFo2TnN4SC9V?=
 =?utf-8?B?RjcwRjN0d2dZLzBxTFlMZ3VXemo5VzZLOHBaeUZtMlhKbkVMdEdsWEphczdQ?=
 =?utf-8?B?cXR4cUZZK1NpNCtPZDRqZnhxSVBSOVZ2bGZRZUczMUdHWFlrOHBQcGZuZS90?=
 =?utf-8?B?ajY2QVozVEdSSUU0eVVYNFdHK1NDRUtwc2lFcmhyUXduaFlWQWFjZ0lFanlp?=
 =?utf-8?B?QjVKb1JsV21uYzFrVGRYTVBoQ245VlVEc2xMMFdwR3VNM2RxQUpweUhWSlVo?=
 =?utf-8?B?WUZIeG1hRkhPTXUreUgxMnNIMjFKODU1NSt4eldxZmpSVi9uSnZ1Y00zRytW?=
 =?utf-8?B?K2pxRTJDRTJ1QVpFak5BajRKK0dVeS9uTHU2Y2lydW8vRGFwclUrdlp5RVRa?=
 =?utf-8?B?cWVIcTRuc0I5MytoZGNLbDlOWlVYYzk0cGtOdDNTS2djZUl1MS9OWDlwdVhx?=
 =?utf-8?B?UXFZc3lqa3NNVEE0NHBYVjY3RjFJK3ZjNGVhYmRRZXlKaTAvL3JBT3g2blFY?=
 =?utf-8?B?WXdBNjFkcURNVkZWeXlBNUZjUncyRVBRdkw4VlBsNFcxN2RHWDVteG5mSjho?=
 =?utf-8?B?clg1Tk8xeVZtMmdVUmxrL1AyMStwOWp3MTRocHFJNzF0NXc3QUdOdFlKL0o4?=
 =?utf-8?Q?lDPSZ18e/I/F5uPk5tkVcmrUeQDqpAVweusb2QacoI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2f8f8cf-21eb-4956-74ce-08d999843165
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 19:58:49.5550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: na6iDWDxDlTLyb0X/q7QSZVZudREx8i98Sn9O/TxLBuI4pxw1dFPYi8budzMhrHpOx8lkPcdrstrt1N+N4Spmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1189
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


On 2021-10-27 10:50 a.m., Christian König wrote:
> Am 27.10.21 um 16:47 schrieb Andrey Grodzovsky:
>>
>> On 2021-10-27 10:34 a.m., Christian König wrote:
>>> Am 27.10.21 um 16:27 schrieb Andrey Grodzovsky:
>>>> [SNIP]
>>>>>
>>>>>> Let me please know if I am still missing some point of yours.
>>>>>
>>>>> Well, I mean we need to be able to handle this for all drivers.
>>>>
>>>>
>>>> For sure, but as i said above in my opinion we need to change only 
>>>> for those drivers that don't use the _locked version.
>>>
>>> And that absolutely won't work.
>>>
>>> See the dma_fence is a contract between drivers, so you need the 
>>> same calling convention between all drivers.
>>>
>>> Either we always call the callback with the lock held or we always 
>>> call it without the lock, but sometimes like that and sometimes 
>>> otherwise won't work.
>>>
>>> Christian.
>>
>>
>> I am not sure I fully understand what problems this will cause but 
>> anyway, then we are back to irq_work. We cannot embed irq_work as 
>> union within dma_fenc's cb_list
>> because it's already reused as timestamp and as rcu head after the 
>> fence is signaled. So I will do it within drm_scheduler with single 
>> irq_work per drm_sched_entity
>> as we discussed before.
>
> That won't work either. We free up the entity after the cleanup 
> function. That's the reason we use the callback on the job in the 
> first place.


Yep, missed it.


>
> We could overlead the cb structure in the job though.


I guess, since no one else is using this member it after the cb executed.

Andrey


>
> Christian.
>
>>
>> Andrey
>>
>>
>>>
>>>>
>>>> Andrey
>>>
>
