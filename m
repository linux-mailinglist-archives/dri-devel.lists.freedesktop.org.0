Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E307143AA59
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 04:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27B66E20C;
	Tue, 26 Oct 2021 02:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 159FB6E203;
 Tue, 26 Oct 2021 02:33:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDvQIBVAUp3O7sNkZApiFYHI3NDZb3JlTuSK0DJfywVOHxVuVoGKqyoyK3VnLiGBImorRkFu5oazupMfIZaBDoy4KAI4I57k4mDQhF3/cF3J/2EUpZoCl6A/Xt+G+11KHUVbCQZSaWnGyBjzIbh+vpKtFiJeDrrO4Ar4zkq6sdmVPj6cEujJSFPkS60u+tBUll9fDKzku5qI9tpWHsbIiPigQWe9hu53UG6052bY5joGcRw7/OYoPSxtwnE4piQ2waAqYiic8UPNiP2KDglbSCoaNumEB/ZtI2xPNz7Fmp3FG5d+bXLJ+/m6Jnxr+mz+KzxWSkuvhTSgGWoKxZiawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro5xIfWCUbFa5Y+Tx6B4WtJ1pIbFMAjeAfwJgi4Prqc=;
 b=O1RKX2TN5TOIYCEGJ35cw6CXEvR26qtw/dJe9F6Z0QnMLRqvc1+0Fm3HPevzLfaBIsQ7MPS1xfBMmL+OT92G2Mc9n+ojLlWRq+iKeHPTRMVetwnJVzPs2akqyIAdLsPGnIXxGdmt21w2pIFxJ/VEUdZaX9Lh7ASx3SeFmMyWf3UDJqGFmKtAsEyZX8PC1ktXR42aHC94wUb/BwvyRBYgKOSX7QQiyGgFjfca2U2/AvMOwBJFLFV8GJTP9nF46K0QvMPtJcJQXCNEX5+72Q0W1tGrSchiuwHS8rtFs4clRAVVA5MBnGCxRrLYgfoOmufAorda4+DyFxXBKCHN5meelA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro5xIfWCUbFa5Y+Tx6B4WtJ1pIbFMAjeAfwJgi4Prqc=;
 b=gs9TWIPSV9EWSX5Biq8LtlRgE+raiDiCpW+WMxPpfeJXIFpRe7PVhgqftAQAo6ltNC3zdzFkO/nwn2f8kql8Lc1u4Lq+rnPK9V6UQ5VZSVOqRKXog7epP0QTVwlUtbB5IQruf/5dntOQSA+9+YB69pQKfLExglAFtrQTmPZOQnw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3194.namprd12.prod.outlook.com (2603:10b6:5:184::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Tue, 26 Oct
 2021 02:33:28 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::3153:3d7b:e216:74c0%11]) with mapi id 15.20.4628.018; Tue, 26 Oct
 2021 02:33:28 +0000
Subject: Re: Lockdep spalt on killing a processes
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
Date: Mon, 25 Oct 2021 22:33:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::30) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3edf:49b0:1a2a:305a:43bc:a534]
 (2607:fea8:3edf:49b0:1a2a:305a:43bc:a534) by
 YT3PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 02:33:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83ec739a-6d3e-462f-aa9c-08d99828fe12
X-MS-TrafficTypeDiagnostic: DM6PR12MB3194:
X-Microsoft-Antispam-PRVS: <DM6PR12MB31943C5C1527DCBFCB8E155AEA849@DM6PR12MB3194.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ioCklcVnc3vRZt62qPTY8GMXX95sDx/bYDfUy/jsdi+GJZ9qTWYPmvr13o0oSAJt3AtKH1r/g0oLpe2RScwGmCA2hdN1dXGw4SqS+l68rBFxEV4bdxWVIv0KgqFAA/W1k4OfHlshr/ocEQwttknKQ507lbyPQUoGqbi5YH6QBNTLya8dmWvk8QNDAavNpeJNJR7eZEaIYU5lJ8DpJYuVI3ySzVHQxF3iWuUtyzxbtg8xSKkDGwGkOvnfrahQ0S5msPwJRtieYRAFMUk6Jvr1GoQvA9cTrBx0jyTEYKs+kDbjG9+qbS6wmTf7FVlFWT2pOQPXMOKF49FrN3tmOysYfcrCyHL6rTpK1PkET2M1vOpBadfEZ1xIUExYixNzZYXxfBX8thW9ZIyPLzBfGxxs4QJ8oPTAEVGX74cAqFMGutbpZRk7gfxcF2gl5aXFBN95dJ8ACNNiPO4ZvN6wK7Ou58Pexobak5S3+xzSKvjdsr5gCeGMyMJuBhnCcBHkthsoiejwakwgvPRQYwhh8DmgEOGH1Wcm8c07A38mTuw991oJyrKhram7AfOaZxseZDrlnawoZibUHUEB89RC1AnKSP0ePyrr17VwDZNhTMel6zvuvrpiFCFIGSCvzKdksqNQDkNkpNF304BAE6pq50dn2ucvLlnfIZgVdObV8SSD7lynXbHTnUMTiPtGa0UDEhdZRAcgf09xnsP4yeuEiyJL6bchoaML2TcQwHe0G6nhXyXr3xLCbxZR76HnWeCeak+QjYc+XHQzBfdnH8/kYYHeBTJzjAI2mtAMS9d2exSE0EX2LsyQhvoI87AHJTWVkmfC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(38100700002)(86362001)(508600001)(45080400002)(316002)(53546011)(110136005)(44832011)(66574015)(36756003)(31696002)(186003)(4001150100001)(8676002)(66556008)(5660300002)(2906002)(2616005)(966005)(30864003)(8936002)(31686004)(66946007)(83380400001)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YURWZHZLbG5tNytLbFJWYmNrUGxETGdoZTRkRUF0bnF5dnNSYXpYTHJVOXRE?=
 =?utf-8?B?WFRBSlVkZVUvTEZiK0NKTlNxV0g0NGF2Q1JxeWJkRjh0UDhqQ3paNTVBS3g5?=
 =?utf-8?B?bDk5bC9Hdk5ER1BIckM4enhDODBML0ZrWXg2eXZOdGRyK0lYQUZ5Ny8wNW9s?=
 =?utf-8?B?VHBzMTJEMXF1WW84MzdKZFhBdnhVVWZ0MUFUMUxORWd2MmQzRkJUNStaQWM0?=
 =?utf-8?B?RlRBeVZxZ2U3Qy9McytNUVZITGx3ZEZTZ2NmcDExamNUOThGVXQ2b0pYTzJG?=
 =?utf-8?B?WXFwVnd5djJ2RGtrTi9YUk9WNEsyZStXdDhFTTI5NURjcDY4Yjd2VkVLcU1N?=
 =?utf-8?B?NTVvZnRMdWdLMkhxdUQ3L0dmcW1JejR6RXUxNkU3UEdFaDB5cVAxV0d0c3Q3?=
 =?utf-8?B?V1VGbFZqbGt3d1NlM1VqaVcySE4weHE3b0xoZStNbjFXTVRsandweGpIb3lV?=
 =?utf-8?B?MXFtTVBpWVE2Y3hCOGJjcmJQUmtHeEZuZHp2NlFWU0hReWN1ZlpucW5Ja1NW?=
 =?utf-8?B?K0JNamViVTFBSGZWdGhZVU5EdFhNT3FJY21nM0hRVk5rWVBWSW5QbVZ1VnFm?=
 =?utf-8?B?QkxtTTU5b2NNS3E4QlRSSkFkTUJjOHNsL1BRMER6bDR0VG5hNGxxZEtCSlds?=
 =?utf-8?B?TGRIclppNnFzWE1XNkswNmhVeDZnemNJMm01MmwrT3NHK0RQNEVXZzlTWm1x?=
 =?utf-8?B?a1NGM3dQdktJYkZxUkphazFhZk51MVdhMzN0QnU5WWU1TXp1VHdtZldGMmtw?=
 =?utf-8?B?VTErb2N5KzVxbThjRVhnZHl3VzBhakpBRllmTkJtQ01BZUxkUWcvRmd6QVZa?=
 =?utf-8?B?R2pCN0hUcXBFVytldEIvU1ZsK0ZWemUrOGtlTjRrbGdjeHJnc0FHZENTZWg2?=
 =?utf-8?B?VGUwc080LzdQUUpFNjZJVTNZUWg5N21JWUxFbDQ3aThjSUI3OWltbWpub0la?=
 =?utf-8?B?ek5vODErTWFvejhSemF6bkpPS21QWXZPYmM0ZitZRmZZZkxXNDZhM01seTJa?=
 =?utf-8?B?aWhPU2d1SFc2REliRktJWUU4MmdUWmNEN1ZQUHZPd3BmV2R1dXlwK3pnQ0hU?=
 =?utf-8?B?K3N4M0VhQ28rOGFhSzFQQ2VNcWx4OWw1YlBoR0xORGtIUkEwdStKcWIzYXFO?=
 =?utf-8?B?RjFGL0Q4YW5IdVlFU2dmcGMvZW5hU2xzMGpwcEpVUGxaSklYWFMreVRodXBk?=
 =?utf-8?B?RGU1d2cyWmtob0VEU3RmSUhTdFprVkxDcVloeHNnVEt1aCtmdk5vL1VyNDZE?=
 =?utf-8?B?bklKampQeG9Zc2NOSmk0TE1oZG9PWlZqdUZ5Y0ZmZWlWYlVyTWJGT1BCeXR4?=
 =?utf-8?B?cGc3dXdDSUhZb08rWnd5ZGU3UUo5aE1peHAzaXdZRmVkSjhYQkZJbk8vVFFT?=
 =?utf-8?B?cXEvQUVrVElzc3JJQlhNM3QxV3ZEcWprYkRVb1NIRXNVSlBEdGF5S0dxTko2?=
 =?utf-8?B?L3g5WE9meWI0dDNZbHNWTmwzTGY4ZFVLQUVRbS8walhxTHpnOFZ6TmM3VjFm?=
 =?utf-8?B?VFU3Smo2dWxSYzArM3IxSlZNVGM5NEVWS0dRQUF6b0hnSXJpbWhoUzRFVG44?=
 =?utf-8?B?QUJmOE9lVmFOQ1EwbWVPUGdydC81cUpsUUxadC9XZUVqVFNKc3QvVGF0VVBY?=
 =?utf-8?B?Q2c0QzZsdENrT3hOK3Vhay9MbU9uZVdWZ1BmRnZtU1JQWFhhUVVoME5sVEhL?=
 =?utf-8?B?c1djUnQxMlFOWmM1alRPUndjMzV2RGdXOXFTWlZjRktZbFpDdlA1eDVtbFN4?=
 =?utf-8?B?S1QydjEzYndWS2hSN0NYdjhncm5XNjhLb2JEKzNkb0t4WFBWZlB6SENLQkpz?=
 =?utf-8?B?bm5JV2pBR2gvb3NnaVV0VDF0NEZ0aUhvZXREZmMyMEVVWkZmdmJHR1Z5THZD?=
 =?utf-8?B?bHF2bFplaHErdkdLT210ZlV2Q1FtTjIwaGtacmZQdWhCWHc0SkpSMjFyUGdZ?=
 =?utf-8?B?MGFsZVVDR1owclZ4SmtFZXdFa3NGM3RUc0RmTE1uY1ExMEtVQzNHUzc1Q1NY?=
 =?utf-8?B?VEdEUFgvWXNBQXc0ejBlYUVaQzU2VTE1L0gwbndYWnIvVU02cC94dHZvTDlG?=
 =?utf-8?B?UzVmcUhIK0wydWpGK2x2bktZTVc0UHV1b2dFdXlkVXVhdjhzcjFOdTUxeHpz?=
 =?utf-8?B?TVh2T2xvL0VJZFVXSE1pTmxVMVdBamVSeTlic2lzTTEybDRDOVZHV2R2WjZJ?=
 =?utf-8?B?VEVLSy9RQUhyc2lIbDVoblNQMzJvQ3VTV3phZmVJUFRieDBBcyt2OHY5dHpQ?=
 =?utf-8?Q?4VPgWwB9sHWpQufJDVRDVMk4gILpdxmBJbTTk7PvRY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ec739a-6d3e-462f-aa9c-08d99828fe12
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 02:33:28.1584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Dkh73G+YCmgLtED/E3Cb9tJbEKm5RcNlcoC6W8VAHnLlf59Q9RoJr2TBmJBfntS80pwZzyfVu9Y4pXZmUQHUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3194
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

On 2021-10-25 3:56 p.m., Christian König wrote:

> In general I'm all there to get this fixed, but there is one major 
> problem: Drivers don't expect the lock to be dropped.


I am probably missing something but in my approach we only modify the 
code for those clients that call dma_fence_signal,
not dma_fence_signal_locked. In those cases the drivers are agnostic to 
lock behavior (or should be at least) since the lock
is acquired within the dma fence code. Note that if you are worried 
about calling the callback without lock then same exact
concern is relevant to using the irq_work directly in the fence code 
since the irq_work will execute at a later time without locked
fence->lock (which is the point of using irq_work).

>
> What we could do is to change all drivers so they call always call the 
> dma_fence_signal functions and drop the _locked variants. This way we 
> could move calling the callback out of the spinlock.
>
> But that requires audit of all drivers, so quite a lot of work to do.


As i said earlier - if we only modify dma_fence_signal and don't touch 
dma_fence_signal_locked then our only concern should the users of 
dma_fence_signal.
Let me please know if I am still missing some point of yours.

Andrey


>
> Regards,
> Christian.
>
> Am 25.10.21 um 21:10 schrieb Andrey Grodzovsky:
>> Adding back Daniel (somehow he got off the addresses list) and Chris 
>> who worked a lot in this area.
>>
>> On 2021-10-21 2:34 a.m., Christian König wrote:
>>>
>>>
>>> Am 20.10.21 um 21:32 schrieb Andrey Grodzovsky:
>>>> On 2021-10-04 4:14 a.m., Christian König wrote:
>>>>
>>>>> The problem is a bit different.
>>>>>
>>>>> The callback is on the dependent fence, while we need to signal 
>>>>> the scheduler fence.
>>>>>
>>>>> Daniel is right that this needs an irq_work struct to handle this 
>>>>> properly.
>>>>>
>>>>> Christian.
>>>>
>>>>
>>>> So we had some discussions with Christian regarding irq_work and 
>>>> agreed I should look into doing it but stepping back for a sec -
>>>>
>>>> Why we insist on calling the dma_fence_cb  with fence->lock locked 
>>>> ? Is it because of dma_fence_add_callback ?
>>>> Because we first test for DMA_FENCE_FLAG_SIGNALED_BIT and only 
>>>> after that lock the fence->lock ? If so, can't we
>>>> move DMA_FENCE_FLAG_SIGNALED_BIT  check inside the locked section ? 
>>>> Because if in theory
>>>> we could call the cb with unlocked fence->lock (i.e. this kind of 
>>>> iteration 
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.15-rc6%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fttm%2Fttm_resource.c%23L117&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cc8a4525f94c244bebbd208d997f19242%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637707886075917091%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=YBq%2BNkDuYKERc8XJDWTfeM%2FSknpuCBHQYgN8Uo5PFv0%3D&amp;reserved=0)
>>>> we wouldn't have the lockdep splat. And in general, is it really
>>>> the correct approach to call a third party code from a call back 
>>>> with locked spinlock ? We don't know what the cb does inside
>>>> and I don't see any explicit restrictions in documentation of 
>>>> dma_fence_func_t what can and cannot be done there.
>>>
>>> Yeah, that's exactly what I meant with using the irq_work directly 
>>> in the fence code.
>>
>>
>> My idea is not to use irq work at all but instead to implement 
>> unlocked dma_fence cb execution using iteration
>> which drops the spinlock each time next cb is executed and acquiring 
>> it again after (until cb_list is empy).
>>
>>
>>>
>>>
>>> The problem is dma_fence_signal_locked() which is used by quite a 
>>> number of drivers to signal the fence while holding the lock.
>>
>>
>> For this I think we should not reuse dma_fence_signal_locked inside 
>> dma_fence_signal and instead implement it using the
>> unlocked iteration I mentioned above. I looked a bit in the code and 
>> the history and I see that until some time ago
>> (this commit by Chris 0fc89b6802ba1fcc561b0c906e0cefd384e3b2e5), 
>> indeed dma_fence_signal was doing it's own, locked iteration
>> and wasn't reusing dma_fence_signal_locked. This way whoever relies 
>> on the dma_fence_signal_locked won't be impacted
>> an who is not (like us in 
>> drm_sched_fence_scheduled/drm_sched_fence_finished) should also not 
>> be impacted by more narrow
>> scope of the lock. I also looked at dma_fence_default_wait and how it 
>> locks the fence->lock and check if fence is signaled
>> before wait start and I don't see a problem there either.
>>
>> I attached quick draft of this proposal to clarify.
>>
>> Andrey
>>
>>
>>>
>>> Otherwise we could indeed simplify the fence handling a lot.
>>>
>>> Christian.
>>>
>>>>
>>>> Andrey
>>>>
>>>>
>>>>>
>>>>> Am 01.10.21 um 17:10 schrieb Andrey Grodzovsky:
>>>>>> From what I see here you supposed to have actual deadlock and not 
>>>>>> only warning, sched_fence->finished is  first signaled from within
>>>>>> hw fence done callback (drm_sched_job_done_cb) but then again 
>>>>>> from within it's own callback (drm_sched_entity_kill_jobs_cb) and so
>>>>>> looks like same fence  object is recursively signaled twice. This 
>>>>>> leads to attempt to lock fence->lock second time while it's already
>>>>>> locked. I don't see a need to call drm_sched_fence_finished from 
>>>>>> within drm_sched_entity_kill_jobs_cb as this callback already 
>>>>>> registered
>>>>>> on sched_fence->finished fence (entity->last_scheduled == 
>>>>>> s_fence->finished) and hence the signaling already took place.
>>>>>>
>>>>>> Andrey
>>>>>>
>>>>>> On 2021-10-01 6:50 a.m., Christian König wrote:
>>>>>>> Hey, Andrey.
>>>>>>>
>>>>>>> while investigating some memory management problems I've got the 
>>>>>>> logdep splat below.
>>>>>>>
>>>>>>> Looks like something is wrong with 
>>>>>>> drm_sched_entity_kill_jobs_cb(), can you investigate?
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Christian.
>>>>>>>
>>>>>>> [11176.741052] ============================================
>>>>>>> [11176.741056] WARNING: possible recursive locking detected
>>>>>>> [11176.741060] 5.15.0-rc1-00031-g9d546d600800 #171 Not tainted
>>>>>>> [11176.741066] --------------------------------------------
>>>>>>> [11176.741070] swapper/12/0 is trying to acquire lock:
>>>>>>> [11176.741074] ffff9c337ed175a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>>>> dma_fence_signal+0x28/0x80
>>>>>>> [11176.741088]
>>>>>>>                but task is already holding lock:
>>>>>>> [11176.741092] ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, at: 
>>>>>>> dma_fence_signal+0x28/0x80
>>>>>>> [11176.741100]
>>>>>>>                other info that might help us debug this:
>>>>>>> [11176.741104]  Possible unsafe locking scenario:
>>>>>>>
>>>>>>> [11176.741108]        CPU0
>>>>>>> [11176.741110]        ----
>>>>>>> [11176.741113]   lock(&fence->lock);
>>>>>>> [11176.741118]   lock(&fence->lock);
>>>>>>> [11176.741122]
>>>>>>>                 *** DEADLOCK ***
>>>>>>>
>>>>>>> [11176.741125]  May be due to missing lock nesting notation
>>>>>>>
>>>>>>> [11176.741128] 2 locks held by swapper/12/0:
>>>>>>> [11176.741133]  #0: ffff9c339c30f768 
>>>>>>> (&ring->fence_drv.lock){-.-.}-{3:3}, at: dma_fence_signal+0x28/0x80
>>>>>>> [11176.741142]  #1: ffff9c337ed172a8 (&fence->lock){-.-.}-{3:3}, 
>>>>>>> at: dma_fence_signal+0x28/0x80
>>>>>>> [11176.741151]
>>>>>>>                stack backtrace:
>>>>>>> [11176.741155] CPU: 12 PID: 0 Comm: swapper/12 Not tainted 
>>>>>>> 5.15.0-rc1-00031-g9d546d600800 #171
>>>>>>> [11176.741160] Hardware name: System manufacturer System Product 
>>>>>>> Name/PRIME X399-A, BIOS 0808 10/12/2018
>>>>>>> [11176.741165] Call Trace:
>>>>>>> [11176.741169]  <IRQ>
>>>>>>> [11176.741173]  dump_stack_lvl+0x5b/0x74
>>>>>>> [11176.741181]  dump_stack+0x10/0x12
>>>>>>> [11176.741186]  __lock_acquire.cold+0x208/0x2df
>>>>>>> [11176.741197]  lock_acquire+0xc6/0x2d0
>>>>>>> [11176.741204]  ? dma_fence_signal+0x28/0x80
>>>>>>> [11176.741212]  _raw_spin_lock_irqsave+0x4d/0x70
>>>>>>> [11176.741219]  ? dma_fence_signal+0x28/0x80
>>>>>>> [11176.741225]  dma_fence_signal+0x28/0x80
>>>>>>> [11176.741230]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>>> [11176.741240] drm_sched_entity_kill_jobs_cb+0x1c/0x50 [gpu_sched]
>>>>>>> [11176.741248] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>>> [11176.741254]  dma_fence_signal+0x3b/0x80
>>>>>>> [11176.741260]  drm_sched_fence_finished+0x12/0x20 [gpu_sched]
>>>>>>> [11176.741268]  drm_sched_job_done.isra.0+0x7f/0x1a0 [gpu_sched]
>>>>>>> [11176.741277]  drm_sched_job_done_cb+0x12/0x20 [gpu_sched]
>>>>>>> [11176.741284] dma_fence_signal_timestamp_locked+0xac/0x1a0
>>>>>>> [11176.741290]  dma_fence_signal+0x3b/0x80
>>>>>>> [11176.741296]  amdgpu_fence_process+0xd1/0x140 [amdgpu]
>>>>>>> [11176.741504]  sdma_v4_0_process_trap_irq+0x8c/0xb0 [amdgpu]
>>>>>>> [11176.741731]  amdgpu_irq_dispatch+0xce/0x250 [amdgpu]
>>>>>>> [11176.741954]  amdgpu_ih_process+0x81/0x100 [amdgpu]
>>>>>>> [11176.742174]  amdgpu_irq_handler+0x26/0xa0 [amdgpu]
>>>>>>> [11176.742393]  __handle_irq_event_percpu+0x4f/0x2c0
>>>>>>> [11176.742402]  handle_irq_event_percpu+0x33/0x80
>>>>>>> [11176.742408]  handle_irq_event+0x39/0x60
>>>>>>> [11176.742414]  handle_edge_irq+0x93/0x1d0
>>>>>>> [11176.742419]  __common_interrupt+0x50/0xe0
>>>>>>> [11176.742426]  common_interrupt+0x80/0x90
>>>>>>> [11176.742431]  </IRQ>
>>>>>>> [11176.742436]  asm_common_interrupt+0x1e/0x40
>>>>>>> [11176.742442] RIP: 0010:cpuidle_enter_state+0xff/0x470
>>>>>>> [11176.742449] Code: 0f a3 05 04 54 24 01 0f 82 70 02 00 00 31 
>>>>>>> ff e8 37 5d 6f ff 80 7d d7 00 0f 85 e9 01 00 00 e8 58 a2 7f ff 
>>>>>>> fb 66 0f 1f 44 00 00 <45> 85 ff 0f 88 01 01 00 00 49 63 c7 4c 2b 
>>>>>>> 75 c8 48 8d 14 40 48 8d
>>>>>>> [11176.742455] RSP: 0018:ffffb6970021fe48 EFLAGS: 00000202
>>>>>>> [11176.742461] RAX: 000000000059be25 RBX: 0000000000000002 RCX: 
>>>>>>> 0000000000000000
>>>>>>> [11176.742465] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
>>>>>>> ffffffff9efeed78
>>>>>>> [11176.742470] RBP: ffffb6970021fe80 R08: 0000000000000001 R09: 
>>>>>>> 0000000000000001
>>>>>>> [11176.742473] R10: 0000000000000001 R11: 0000000000000001 R12: 
>>>>>>> ffff9c3350b0e800
>>>>>>> [11176.742477] R13: ffffffffa00e9680 R14: 00000a2a49ada060 R15: 
>>>>>>> 0000000000000002
>>>>>>> [11176.742483]  ? cpuidle_enter_state+0xf8/0x470
>>>>>>> [11176.742489]  ? cpuidle_enter_state+0xf8/0x470
>>>>>>> [11176.742495]  cpuidle_enter+0x2e/0x40
>>>>>>> [11176.742500]  call_cpuidle+0x23/0x40
>>>>>>> [11176.742506]  do_idle+0x201/0x280
>>>>>>> [11176.742512]  cpu_startup_entry+0x20/0x30
>>>>>>> [11176.742517]  start_secondary+0x11f/0x160
>>>>>>> [11176.742523] secondary_startup_64_no_verify+0xb0/0xbb
>>>>>>>
>>>>>
>>>
>
