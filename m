Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C7452D99
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F87E6E9CA;
	Tue, 16 Nov 2021 09:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2065.outbound.protection.outlook.com [40.107.96.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8F6E9EE
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQ+s57qerT9Nm9ePuzgeony0CfFC0c0Bf9CYChMbzNHUq7bCBbDNaleDM1HkCZ4QGN919hg4g2Wah4Vxdh+lmC4qpge3pNG2Lmqvi2+5tRUNe2UwDbALPDkgQAw0NctIT0aZISe6nUwATKTjzYEGz1XeCtJNZ7bMT5P2pYyIuRGow2saYCj3Z8a+y+yQpsDynG2sieWULhWtmyACW2/uaAT7tsIOUr3bYgDtP+QyLF0f15SNeewv5y6dXzdWegesOCMXPR2lFmhpI/DftktcH9nafZbyFRZWdHCgERTX+lhxhzHyQTkh3DbfYjgk4CCCoAhQWvHgaA84avGPdwyGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgkdSOD5MgTqlcDKCfRcm92YLyJ9BuOOdK8V7io0dHw=;
 b=mJaon8jrGXds7FN3VeMynGHQ3dS8KRccHI7a5CQAfuFHGRUdpNTjLtX6q0ELQGZ3KpgMfipBsoPxP/IM3AdWMJmc80BaHzcUkmNMsi9VT2LtiNRVqO1mn4sWM8c6hD9o86fz9+p/wShKTncieP986LzIu88PvmC23lgPsEOfeoUTWW8U7owWbpb9ptx960/SFuIcu5TK6F5ichNgy7Zo/GrwOAAAj0KO9OCtyUTkIL4yJBuvgxQNQmJbGY+WVuWjcSc4NDOruBWGI7Kl3HGXNP0A4pTaaNEi/KHzhTKojzOt2yv1aHqup/KSRs0NXUITJoNzGQ2SIjhzs7la0y3f6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgkdSOD5MgTqlcDKCfRcm92YLyJ9BuOOdK8V7io0dHw=;
 b=rajhXiHWFGtlgam36pSDCCHgfydJr7AqrRJjrG5j3AjLKVk8c88eP9qJjGxDYJpahtO2ZjWCzr5MKH+QvMfRLjA5rRfwEmrh3Cnfy0/yt8H/AWslyC6UXiX/HpRfPS40tbTEEX7JdpBu4rUsdAunZ0fzBnjsKOwH5v0vVf2RABQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1775.namprd12.prod.outlook.com
 (2603:10b6:300:109::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 09:09:51 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 09:09:51 +0000
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
 <61aa563096a20dca80b4cc48037998b932c2e4fc.camel@vmware.com>
 <48dbcca4-a47b-28c5-9163-5a1e8960639e@linux.intel.com>
 <a5a987cd-493f-a089-d3d6-5c4e2fb171e8@amd.com>
 <52b8c310-ebab-a68e-a2f2-62a56b5216e3@linux.intel.com>
 <112af1da-87ff-ee03-9461-e23173e84e86@amd.com>
 <ddc99a8c-0887-9fc3-718e-98963723415c@linux.intel.com>
 <5609a30f-2625-9b27-6ad6-4c6d73fb10f6@amd.com>
 <7196ce91-5897-3088-e7f4-f9c5b04152d9@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3cd2f3e4-5e56-dcf5-0bf6-462f19269c88@amd.com>
Date: Tue, 16 Nov 2021 10:09:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <7196ce91-5897-3088-e7f4-f9c5b04152d9@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM8P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::20) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM8P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.16 via Frontend Transport; Tue, 16 Nov 2021 09:09:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96fb2480-5884-4963-7306-08d9a8e0d88d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1775:
X-Microsoft-Antispam-PRVS: <MWHPR12MB177507CED81B3215A5A643B683999@MWHPR12MB1775.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: InERrFU1bnSUeLcqgQvWPUwFYRY9QFoPp+nAYjhuBwaVWDKn7c6KdvYuHWjkWx7N96KEYjgnC12YRhqIPkRN+2wGMoM9O9dcQZfK3wfiuaisQX9yNE9Y0dNGXV3QwE/Y41yy60rMAky+PZacg4rPwFuuYjfqD5Q0eb81XrKNH5VhISudld/pnAZZT54iI0NqLbueg2W0ohKEN7/4T3c0tzg2+ZA/pGQTFsHpnEtbCQ/6joqGUoQXqYyre2wmoF3mjulH6BrII6Z2L/6LjMeAK0tg+22bYjBbDLCcdXrNHgs5eXP23roVUvpLUGvPqOujBkGItpY3CG7WtQQfpDZkFAuhOH1+Gdvci2m9RAPS/jAqnzqjhf0puKlEi5nznJETBwjfA024F5eFIGg1ugFDE0yo057/nfgn2Nx7Xqz1pmeXhicUUzcp+q9Kpc4tYb0wae12N3MkmUMqvCUtr/XoeJOcGRHPZcPJQN+lswbfqzVTMV0wSd7t9CGydPwPmXp1g1tBei/19nDNUFtuLf4bonnaJNcx6R2H8HY2/1LiluEsMutjjt9nG71qc79nxHyRjo8RYG06eFrRwU7WN495tC+oSV7K3Szxa9mvGYeaqUmaOfDrRcg+RrKWVyk/a18M4iZyNF5qHluWsO8slaIihsggkhMLRw5iG39iwPWEXUx9RB6Y3RbM23HYGUNXkGphI5lY+bgvJF+sbxQ+xWXaXGEyOEYxONsdxvvYk0GDwwgHeb03mTdwYbkMTFT5oC8r
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(86362001)(110136005)(5660300002)(8676002)(16576012)(316002)(66946007)(66556008)(8936002)(956004)(508600001)(31686004)(2906002)(186003)(26005)(6486002)(6666004)(53546011)(2616005)(83380400001)(36756003)(38100700002)(66574015)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFphZDFFVnZZaS9GNEM5Slg1Y1BZdDY4VDhDVldHb3lIODhhTXRUc3IrUXZP?=
 =?utf-8?B?TlhWaGVLMjc1Qm1lZWptU0UvN1hybE5TMTVVa1UyeHN1THA2WVhrWHpEYVdi?=
 =?utf-8?B?aEgxVUVNbmZha1BtM2xON3p4NDFoNzdsNW9WbW9NQ2g2VlNGUlIyYUVUY3VL?=
 =?utf-8?B?eEEycGxvR0ViSW5YNDlqQWIyRHVpczQrTVROdk42Q3A5TDc0RVN5TFJvOWJ1?=
 =?utf-8?B?YVQ3VmpBdlRzMUgyUHhPeGZ1NUV2cE1DekxHVkFidUE3K3BVSlBFRitRSUFW?=
 =?utf-8?B?eE9zejRNMFRjN2tIY09HVDlsamIyZEZNL0VWWjJlcktKTlJDNy92MTV4VVRy?=
 =?utf-8?B?eDFrOE9FUXVCRnllTTY5R3djWTdkbEM4Vll1dXBQaDZoZWpGNE5TMzlIRDE2?=
 =?utf-8?B?bXZ0bm0yS2d2bXZ4NnNWcSs1Ynd1U3hUQzBnM1JsN25RcWRWSTJwdVAvN0NL?=
 =?utf-8?B?SmhHblNueTY4YTlRYzE4M0FVUTJoWEY0T1B1cTlFblZURUJxMkJpVTJrcUQz?=
 =?utf-8?B?RzRSdUJKRUxSZW5ZK3pZRUNhNjY1RXFhTjJOdklnK3gyMFpBdkJkd3ZwNjJI?=
 =?utf-8?B?L1NkNWVmOFA3S01VeFFqcGlZMmRGRHp2Tk1FYVpleHhqNjh2K2RKQlYvMUU4?=
 =?utf-8?B?OERNazYrak5LTHRNQkY2eWRnK0NLMmFhNzFaM3NTNkM3RHdZS0duSkRqZkVV?=
 =?utf-8?B?ZlhOc0FLRzY2MUNCbkhPNVRiZE5TcXl0QlJTeDVRTjhjRTQ4SUwwRWFwMGZl?=
 =?utf-8?B?Zzk0bG5mdlMxZVd6TGdoM0VMV0lGcmI2dFhGQjV6cjRhd0JGTHBoL1pqdytp?=
 =?utf-8?B?SzVaUit2Wkt4ZzJackNMM1FlcTczYTN3ck8xcXJZWFhpS0ZqUWZTR1ZxMEtP?=
 =?utf-8?B?SXR4cUV4UmhHaXBUUUUrRjl4c3ZtNWhaSWswUmJ2R0lyKzBKTnZqWVV6ZVVL?=
 =?utf-8?B?YUJnZHpxcWI0M3RZWTVvQWQ1TWRMSjdNSlEzRmRia2NUd2wxbzhoM1dRUTRt?=
 =?utf-8?B?c1cwQnFYL3drWEhEdXg1SDFDdTRNSmVMWmgzRHBrUVBqbVJiUGpFTmVPK1R2?=
 =?utf-8?B?eUtlSmJUL3RVY3E1TmpUYlJCTXE0d2JiRUNaTVNqTW93dUJqamhnUlRXNFZv?=
 =?utf-8?B?QWt5YXczdW4xWk5mY1YxMFhhaERROVpWUjJ5Y1RhK2hDNjBOdFRobVdBS1Vx?=
 =?utf-8?B?U3B4ckxKeTc5U3ZEd2xoYWFCSE9lbGNDV1BBbnpOTEROMnlzbGpsYUtUbUJU?=
 =?utf-8?B?aWhmdW13OXJDZXFxOHN3cEUwUEE4SnV6WnZSek1mN2s2cERxbEtHSW1wdmkz?=
 =?utf-8?B?eEIwTzJOVUtueE15MnkycFFkR05LWHZrNFlzWUJtd2tiYmNBWTIwNC9BemlL?=
 =?utf-8?B?cU8wcDNhakI1eGJFelNaL1VHbGJpVkdCMjlGcDIvVGU0aWxyTXlVd1MzVGNJ?=
 =?utf-8?B?UUJhOVBZQ2hDVUM5K0ZMdTlLZ3YxeGhQVnNEOU9CcDl3MHlRWHhhdjhSek5a?=
 =?utf-8?B?b0F5aEMyV0lVSjkwVGpmNnczOGluallMb3JISmlwQ09CbmxSTWZZOExqeUhD?=
 =?utf-8?B?WmxWVjJ3TlArZ2lNaTQ4SlBmMHRKSWZwQ2t4SXNJdEE1Y25NYmNta1NqeXlo?=
 =?utf-8?B?TFNWOGkrWTBKWklNelpWK1FOVVhveGlhdnZDWUVpR3dKWXl6d3QzNStWYzBm?=
 =?utf-8?B?QkhIY3l5cjAwenJ2Y1A2TGwvamlqU094SXBza1I0OGJkdFRvSk9YVWU3ZDNp?=
 =?utf-8?B?ZjdxN2EvaEhsMVVZeVRxQ1cveWNiWnAweXZKMGljZ3p6WkRGVjlSTFE3dWRV?=
 =?utf-8?B?enQ1Q3cyeW5DSDFqcWFCUS8vQWI0aU5jT0c1YWpDN2pXbzFWZ0J1Tm9vWjhD?=
 =?utf-8?B?ZEJ6SGZXU2ZzUzljQXg0dHVrd2g4QkNRM2tRYkp5NlBRZXFlanNBbHZNUWky?=
 =?utf-8?B?aHo2SzJ3TE82WXBwT010SEtMRkJaVGppYm9nU0dRU2VTZXJPNjhZQlN2VzdS?=
 =?utf-8?B?WXU2WmdSN2JnZmVjZ2twaFhvVXNPMG12b2MzM1hmUUgwb210YVM2WnFtRkxy?=
 =?utf-8?B?dTlKUnZNWExGTVZHK2xpTXNLVHlLTVdoaFZYcXZuUVMyQ3IzYlhnZmR0Nldp?=
 =?utf-8?Q?isL8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96fb2480-5884-4963-7306-08d9a8e0d88d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 09:09:51.1574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aiKUNXeynDyWQZ9KY6GF4EoXwU5qpzAtWEX/DCsmfTjYYZo5cdju8wNCiaQ1uXK3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1775
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

Am 16.11.21 um 10:00 schrieb Thomas Hellström:
> On 11/16/21 09:54, Christian König wrote:
>> Am 16.11.21 um 09:33 schrieb Thomas Hellström:
>>> On 11/16/21 09:20, Christian König wrote:
>>>> Am 16.11.21 um 08:43 schrieb Thomas Hellström:
>>>>> On 11/16/21 08:19, Christian König wrote:
>>>>>> [SNIP]
>>>>
>>>> Well my long term plan is to audit the code base once more and 
>>>> remove the limbo state from the SYSTEM domain.
>>>>
>>>> E.g. instead of a SYSTEM BO without pages you allocate a BO without 
>>>> a resource in general which is now possible since bo->resource is a 
>>>> pointer.
>>>>
>>>> This would still allow us to allocate "empty shell" BOs. But a 
>>>> validation of those BOs doesn't cause a move, but rather just 
>>>> allocates the resource for the first time.
>>>>
>>>> The problem so far was just that we access bo->resource way to 
>>>> often without checking it.
>>>
>>> So the driver would then at least need to be aware of these empty 
>>> shell bos without resource for their move callbacks? (Again thinking 
>>> of the move from empty shell -> VRAM).
>>
>> My thinking goes more into the direction that this looks like a BO 
>> directly allocated in VRAM to the driver.
>>
>> We could of course also make it a move, but of hand I don't see a 
>> reason for it.
>
> As long as there is a way to provide accelerated VRAM clearing if 
> necessary the directly allocated view sounds fine with me. (Looking at 
> amdgpu it looks like you clear on resource destroy? I'm not fully sure 
> that would work with all i915 use cases)

In amdgpu we have both. The AMDGPU_GEM_CREATE_VRAM_CLEARED flag clears 
the memory on allocation and AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE flag 
makes sure it is wiped on release.

Wiping on release is sometimes faster because you don't need to wait for 
the clear to finish before you can first use it.

But thinking about it once more it might be a good idea to have move 
callbacks for empty shells and freshly allocated BOs as well, so that 
the driver is informed about the state change of the BO.

Regards,
Christian.

>
> /Thomas
>
>
>>
>> Christian.
>>
>>>
>>> Thanks,
>>>
>>> /Thomas
>>>
>>>
>>

