Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74068D2EB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A393B10E498;
	Tue,  7 Feb 2023 09:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31E410E074;
 Tue,  7 Feb 2023 09:35:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3VvUVtW4Ovi4Boi/pY6NUw1/2k6tFhsqYnM6VcGm8rctL1yTHKyhJIy+9IcuJkJC75Mg7QhGoDfKhr86/bVfTYI/j+Nl/HU+tEFpZX0WK+s6MwyKwyGQtLlzK0XKPoD6ANBCSmrrux1I0GuyvlztZTlVCjOJLq8rt7OdGstJeOZ57SkHTm+zY7RsymlXfJVTUB+zLou1prqWoFCwfmOnnVviUeuZ/fViwX9iRTdQ2drizg02cIT+KlYlQxCbrv389nmJ2Z1z4gKCmWsP9WdQw+EAxZyxI28DrQRZV8NQPdScjXlqSX3VX+0YsdxiEealbAzSmVdj7yvPSexPpq07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH0dWdb1HZS/LXhptnjHXHhJ6H6BPZ61QEIRZ1lVCWk=;
 b=HGy2U7R37QIqO+5oKvaW9lkSZPTigR6saEwEp7Gkf38TAyBJ4cmM1TUfnT9q3XFdPNdtayZIbUSgKanIn6RrCV+0w0AkvNmULTsXxBYl4KeIxHA6PGTLJSCSPLhiee9NAWBIi1EWgjvhWlSsHDz1P/8JtE8xqTOKbsXbsyES5opzo8dGCzQdkqLbUQjLzyhw0+7Pg4E1frx5BxLIcCjTyN0ZQ4u2oq/sZxF0knkwu03uiEqMJJIFianyvF5HJHaXtaJptLSdXtklYslpkk7/xrrtnHTu67J+8BaNuR9P0h6iyp2WL1OAeD7IiWCE/Vb7sSQMLU1HmkITc9oBSPBjrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH0dWdb1HZS/LXhptnjHXHhJ6H6BPZ61QEIRZ1lVCWk=;
 b=wiR0xB9ikhoVGgAhWPopBHOquJq9fPG+f5s0iqEy/TE1WM5eQiOJxz8Q8Z9uZt1dq6Hi8KZgiI6onWcME5sbdMZxeb+YJBGpFQXj7kWdU6QRcATzLDQShc2zNIMWeLOnvau7Fy/nWOn+ZyfFFY0uK/U93uGjrgxkWF535VQr7Ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5710.namprd12.prod.outlook.com (2603:10b6:510:1e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 09:35:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Tue, 7 Feb 2023
 09:35:17 +0000
Message-ID: <85548cd2-1bea-3c04-40b9-9abb03cb57b3@amd.com>
Date: Tue, 7 Feb 2023 10:35:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
 <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
 <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d2b0ca-ffb4-401e-0773-08db08ee9f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WusxZSQ9s5da6K3mIfBTr1Z8pBKcqNQVbcQ1bXRkIduGUGhBh+ZKSXarjnSmQYzKbpbdvC6KVLlVn8ARNwbAN2uARy3BO5Aw0DPxQKTIUin+WplpMfxXlbMmyLLHMhu5zZ/r63vXOkkdWHSCU44xSEbS2T8vHpBCjSPvCv3uDveO1cyCRI+PnaAVaqk8lCdTrg1XFsoAX74Zr29Trf/pmbTyyG32r22IUpdZJ6UjgLQfDDh93TojOWRJESQzIr+sTwTqvSe7nbV4ZB5hGd6jzpDEy4DzPplZgtXVmDcGBPotoM6F8OTZs7KZc1OeB1knrX7KtaiK+bcWeIbhpsgfVeUQkapW2HQYUN06yinbCo3mgBjyMXy+r2ur3qUj0am88Goi/3AFdi73I602OJfbE2LF0aOmHGiC7Xf9p/ZOzmBYTAR7E5AEPqGYR7zRDfjvTpajVwQ0Zq8UlQ2bc8Qtxilee23kwslmCZd/i6VamRsG38Z5mJQr01U2pBeIM7Uooslx7Srwy/8Ky96H5e6fNxuGcn4IB+OwuMLHuq3pjl3l+bcOKQ6ORzv0VzhcWrIwcyTZJR35DSYf24RTEeq/KE+eF7rZK+SmGHfyJ+ZBVpF8A3YniR1pXgYgnsD168oDURPpRaKSKfAKCsTS7h6UOVdGRMMMuA20glB+CrEsms8hvjqfVLi3LHbf6gUy39Yaqzf1A9b/MD3SO/buhJkaZbJqtN+GtD48FXWBHQgFKTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(451199018)(4326008)(66946007)(66556008)(66476007)(110136005)(8676002)(83380400001)(316002)(66899018)(2616005)(66574015)(478600001)(186003)(6486002)(6512007)(6666004)(26005)(6506007)(53546011)(7416002)(5660300002)(41300700001)(8936002)(2906002)(36756003)(31686004)(86362001)(31696002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXdUNWpMdVlUbUpXVTR0MnN6STNzaHB4UFNoM05Kc1JrcDlkTC9wZ2c3cEVw?=
 =?utf-8?B?cXU2T1dUWjFORk9LTVZnbm05LzZtVEFkSWF1S0g0bGN5R1dRMktPakh0R1Uw?=
 =?utf-8?B?dlhhM0JUOU96MHphNFJxbFcxZ1JWVEZYVFk5NHM1ajNIRnZ0N01KODY2Z2hQ?=
 =?utf-8?B?MWxPZDBCc0lRSFBtUXlvcnFhMmdtMWNXQ280V2hiaDd5cWlJVGhuMldvRmlL?=
 =?utf-8?B?K1ZmL3ZERXJKWHcyUlFUU2U1cTJFV2ZiQXdzS3k4bFBtbnY2QXdwR2lnZnpB?=
 =?utf-8?B?MXIzRy81bFlTTXBPeksxeTdSK3gwSW5iWkNsVVZHU1JvL1NjSlRjZWVXOFoz?=
 =?utf-8?B?aUxPZWhCUktlU1hjeStyWUI0eEgySGxvV2xhVmZocEIzbUNxdVc2R0VFSEJj?=
 =?utf-8?B?dVQrcWhxU01OcE4vUlZPZHZmUmdZM3NJYjlKdjhzTkU4VTZENjd5NVo4YlBY?=
 =?utf-8?B?TE1OdnBHeTNwZDk0SFd1RzJqdm5RMmhTamZPeUpRSy9ua0wrWVI4cnZkRGsw?=
 =?utf-8?B?bjYrbStxUXd2YlhEUm5DWldPNGdxeWt1TjFpT0tKMCtXSXlMdm1OeEZzMGt1?=
 =?utf-8?B?S3d4c3RUZ2xURDNmb3RZaXNTRGlpS3VkNFRTaGxKZkFhTDZFQ21CNXpRSjRl?=
 =?utf-8?B?NmpacHVsMDFsUTdJZFpDcFREeGpxSlhwK201NWpxRUxlOWQxNm91WUpFT0RW?=
 =?utf-8?B?WjVKeW00YUJ1dFNKdDEzcWd0Y3pjaWE4azNEVGU1S2liSHN0SExDbk1vRmJa?=
 =?utf-8?B?N0NYWjRlMnpRRXgzOFhPNm5xS2p5S1J3N2ttODJVVzhnQnpSVEVycllCbS9F?=
 =?utf-8?B?M3cvMXphUGd1blNOTDI0dHVhVWRteDBwcHZ4Vzh0TlVKdWhadGdXVlFGY1B5?=
 =?utf-8?B?WE5hcVpkMXIxeWtmWU5xdEpoczRodlBSTEVydzN2RStiMHJpNmtMa1RXUWNT?=
 =?utf-8?B?MlY4RXg4eVpTd2c4VDQwK05uUVlTV1BoS2xjNzdoTzkzWFNCZWF2cEJVMnpw?=
 =?utf-8?B?bEFNRTVxRW1scXU4K3FUay9wSERrY1lmenZPNUFDU3hwMDJHdlVnNmdoUTh6?=
 =?utf-8?B?SWJ6MU5YZnNNd1RxUE5jeFJia1E3aEt3V2RUUUthUlF2bWI4VWdvMVZSRDd0?=
 =?utf-8?B?TmhOM3NsS3JRV3NqeXFhWHo1NmxnQWJHZWtid0o3bFEyL3lveHRoUEs4bmxi?=
 =?utf-8?B?bk1CclZJTCt1UU1xV3JSQWtpajE4dlJFWEZoRWRYZzJyRHVkNFBORVNEeWxx?=
 =?utf-8?B?QkpZSWF0WFB3aUxQclJCT1VUOXFpT2dvWHFzV1l4LytvSHNWVmNXbkdJU2ZW?=
 =?utf-8?B?UTN6OVl5aklHbm5IWXFyYm1jaE5hTDdzS2JvakNtb2V2QVJFMVhzbWJoNjRE?=
 =?utf-8?B?YVZvY3F3SWNua0t6RDhWRFBmSUdNMFpnVWt4Qi9uV25nZ3FraW4rNmhRWHFy?=
 =?utf-8?B?Vmc3RG4xZWNrVkNBcTZSQXZRMjRjNmpNZUtFQVlTNm1IaU5rLzB0NkVZeEV1?=
 =?utf-8?B?UjU2VUt4MTNYaEZlckJzN25xNlU4eGZDWWw1K1JnQStLOXFvWUE1ZlpwblY5?=
 =?utf-8?B?eDJ3bTFNZk5PN3ErWWtWS05LZkFtbGJjS0d0eEhhTmRrVjU5bGtMUGdYWWNx?=
 =?utf-8?B?RzZteWF6WS9hMG9CMkFiWkUrSUtQMGRSM29YVUZXWjhGL3VSYWtqa243dTNy?=
 =?utf-8?B?d0prNS9TeHY5UWt6ZWNrUTBqUFJVOC9rcEM1SjJuSng0WmczcUk5UDFpWUVv?=
 =?utf-8?B?MDdiMGxiT2dEaG9GUmwwV1dYWXNtbmxhRE8zZ1dpYmZvNUZIRWYyNFpqZCsx?=
 =?utf-8?B?akM5WERRcGUzUlBCa2pxYThndTlTTk1VUEdScXJMWW9FL0dyeFk1N2FVaXpE?=
 =?utf-8?B?cFF4MHJxYS83b2tZYnpuY0t3cGpnVUk4MXc5dUUyTjRZS2Y2QkVnV1F5SVlm?=
 =?utf-8?B?RmM1dFArREQ0bGVjTDdoK29YZ1psOWNBcU5yUDA3OHBIL1kvQjZQL0tEcG9u?=
 =?utf-8?B?T3FPbkxDZTJkaEFwWEUvME1oN095QWIrcEtMaWFja2xaRlBhMW5KNERQOWpI?=
 =?utf-8?B?NHJIKzFzaWRYYjZMay9sdmhmbm44djZMOUZ6Zy8vZENlbGlybkUvNnJhdWJ2?=
 =?utf-8?Q?97/YjX97433L3q9fKfOwDZl00?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d2b0ca-ffb4-401e-0773-08db08ee9f72
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 09:35:17.5064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLiiAFMYdJaVWzv64FWHdCM3CnxhoMQsNAW4Bo4yhjmy83suY9V+Bs3M0oe2XisI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.02.23 um 19:20 schrieb Danilo Krummrich:
> On 2/6/23 17:14, Christian König wrote:
>> Concentrating this discussion on a very big misunderstanding first.
>>
>> Am 06.02.23 um 14:27 schrieb Danilo Krummrich:
>>> [SNIP]
>>> My understanding is that userspace is fully responsible on the parts 
>>> of the GPU VA space it owns. This means that userspace needs to take 
>>> care to *not* ask the kernel to modify mappings that are in use 
>>> currently.
>>
>> This is a completely wrong assumption! Take a look at what games like 
>> Forza Horizzon are doing.
>>
>> Basically that game allocates a very big sparse area and fills it 
>> with pages from BOs while shaders are accessing it. And yes, as far 
>> as I know this is completely valid behavior.
>
> I also think this is valid behavior. That's not the problem I'm trying 
> to describe. In this case userspace modifies the VA space 
> *intentionally* while shaders are accessing it, because it knows that 
> the shaders can deal with reading 0s.

No, it's perfectly valid for userspace to modify the VA space even if 
shaders are not supposed to deal with reading 0s.

>
>
> Just to have it all in place, the example I gave was:
>  - two virtually contiguous buffers A and B
>  - binding 1 mapped to A with BO offset 0
>  - binding 2 mapped to B with BO offset length(A)
>
> What I did not mention both A and B aren't sparse buffers in this 
> example, although it probably doesn't matter too much.
>
> Since the conditions to do so are given, we merge binding 1 and 
> binding 2 right at the time when binding 2 is requested. To do so a 
> driver might unmap binding 1 for a very short period of time (e.g. to 
> (re-)map the freshly merged binding with a different page size if 
> possible).

Nope, that's not correct handling.

>
> From userspace perspective buffer A is ready to use before applying 
> binding 2 to buffer B, hence it would be illegal to touch binding 1 
> again when userspace asks the kernel to map binding 2 to buffer B.
>
> Besides that I think there is no point in merging between buffers 
> anyway because we'd end up splitting such a merged mapping anyway 
> later on when one of the two buffers is destroyed.
>
> Also, I think the same applies to sparse buffers as well, a mapping 
> within A isn't expected to be re-mapped just because something is 
> mapped to B.
>
> However, in this context I start wondering if re-mapping in the 
> context of merge and split is allowed at all, even within the same 
> sparse buffer (and even with a separate page table for sparse mappings 
> as described in my last mail; shaders would never fault).

See, your assumption is that userspace/applications don't modify the VA 
space intentionally while the GPU is accessing it is just bluntly 
speaking incorrect.

When you have a VA address which is mapped to buffer A and accessed by 
some GPU shaders it is perfectly valid for the application to say "map 
it again to the same buffer A".

It is also perfectly valid for an application to re-map this region to a 
different buffer B, it's just not defined when the access then transits 
from A to B. (AFAIK this is currently worked on in a new specification).

So when your page table updates result in the shader to intermediately 
get 0s in return, because you change the underlying mapping you simply 
have some implementation bug in Nouveau.

I don't know how Nvidia hw handles this, and yes it's quite complicated 
on AMD hw as well because our TLBs are not really made for this use 
case, but I'm 100% sure that this is possible since it is still part of 
some of the specifications (mostly Vulkan I think).

To sum it up as far as I can see by giving the regions to the kernel is 
not something you would want for Nouveau either.

Regards,
Christian.


>
>>
>> So you need to be able to handle this case anyway and the approach 
>> with the regions won't help you at all preventing that.
>>
>> Regards,
>> Christian.
>>
>

