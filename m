Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F853E417
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 12:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7355810E55F;
	Mon,  6 Jun 2022 10:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F2410E55F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 10:35:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnIM1tR7bhzqxGv2LyFxreVoLvmllLWlsgz7zuGK8KYT2MGZ1gKWvD8KnOKw27U4JcTgeTLDnwyFtcTn2/wPz9Y11GcP7HFHM14ZZX6p5Ow4LaqWrOjWUljg1BcgJcF4TSh4k0cKhECPHrpjAOxGBzIHzxmC0EQ1oy1UJ397H0rogwIAAAx2C6yj+qUQj1fjXFrwenFRgeE85k6Ltp2q4y2EtgNqxFYYLhyp9pIhEC6zxlPaUO+JR7AoQe7yBr2FwzhmxwiHwhFYE1auW3RSsc9EDS4iRnLJYO7DVN4uLdV516gq/8d3OVDZ6v6qy8vh/icBP835eQladaY8ey7aFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6qvdH7KYYSAr4KnHFfaGzdgzMhS3bI4+ueC+slVD3M=;
 b=m0qcuQbsr2AqepqzgpybEXRlU1NCzP6LY+XXgOLEUSexy1CRKwWOrribI6chZawa/BJWhnqZodv7FselphudVFoZ+gd+VF4nZP9iePQtez/gxh04HAlFTekvbLIhavUTz4W09ETLwr0VC81t5tztiDRJLZlc2+Guwy13caTb9lpi32IUW2Ku1gzIBN5ZYTNofGlKPDjE4zv/Ostn/2djpjBNStomsJzQ37R/ynglG7nhmaQWt9Xg+ddEVSTOiVPdHLANZJz8S3rNnzdS/BwuKzNE015S6V5+dhPd50Imn1hTrnSwUqyrrKSikun+AJ4NoYBoeAeVdqTd8eTNTDqhDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6qvdH7KYYSAr4KnHFfaGzdgzMhS3bI4+ueC+slVD3M=;
 b=XPajHSyW1b2G8JaDf5NjpupuMC1O3gKENzwVhe3Yv0vXbKGTwHi4dSC2Bg+M+G13+cYO7qB5ZjEVd5BhMsW1Et4WJEvQhkjk37PH+QglVss0ea6btNHXS9O7nZXeIcYQN+jVgw0HTvObw6QahlAQcG0+n+VOc34Tzm77+Lgs1Tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3119.namprd12.prod.outlook.com (2603:10b6:208:ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Mon, 6 Jun
 2022 10:35:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 10:35:14 +0000
Message-ID: <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
Date: Mon, 6 Jun 2022 12:35:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
 <bd850268-8324-79cb-854f-b0c843f9581b@amd.com>
 <CAP+8YyGuU_fBMLkSuqBMk7uy-F=BAaopWS-Vxi=-E0P5LGbsRQ@mail.gmail.com>
 <ea49dfd3-3c20-c330-3412-5b48481331cd@amd.com>
 <CAP+8YyGgam6Hr40PS_Rc7Dg=S2dLJdce=87=wNt2B0yAyPEPOw@mail.gmail.com>
 <237f28b7-258e-8b6c-f7b3-93f0db9676d3@amd.com>
 <CAP+8YyHnR=eQZMkxn=RpdzYF69y-54ri2pFrTj8DJuRTtwrDaA@mail.gmail.com>
 <7cba4b1d-724a-3c32-2546-015fa069342d@amd.com>
 <CAP+8YyEMDNR_5=uGf8BEV5DCovr-Z_ZDWS2E7-7zqSFGG7bdKg@mail.gmail.com>
 <6c7e8167-fd72-ef7f-c390-8750c61bc411@amd.com>
 <CAP+8YyGRf2XRoaw9aZhwFBryxccYTRrpSLVh8X6WG02zO5ed0A@mail.gmail.com>
 <4d30fb54-be88-7913-74f5-fa998c28f033@amd.com>
 <CAP+8YyFKOM1qztPBNGk4nzsaX7Dq8-cwg0h_GUgz6sUxBZLhEw@mail.gmail.com>
 <98c1ea95-2b1e-36dd-6706-b3667f0f5f47@amd.com>
 <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0558.eurprd06.prod.outlook.com
 (2603:10a6:20b:485::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4eb6f48d-8c1a-4832-66c3-08da47a83d8d
X-MS-TrafficTypeDiagnostic: MN2PR12MB3119:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB31196A1C464D2CC2885B454583A29@MN2PR12MB3119.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjOA0BPSaG4R2i6ku1g+bSD+BkV90DfU0w6NjRy0k1gPjdZKMdxTisRRXNTwxrVhqsj1idkrQpKXWcI1PKcJcR1hdK2OkgbxZPxLOQRamEISQS54IL6M2acJkZTLlXr81r++nnZ5/G4seFzn8mGmbX7MOj23XHGrSdp9WNlmumP9wK6VTUXVpOnKIy7vZO9WVGLxYB1rn2IdZzoBJ/IawvuI2xURseFOhCBWmMOFi7FIO4cPQmuEu5LdfzitDDL6HQPxDL0idSpHx7WOjFOjqtiig32vTR82SyrpVmSaIqEtl9uNWzyAVZ6Bd1F5augBHregBLeYQhWWn2eM+IMcFzJU8uItV3zNqCxq3BTMygZ57afQfXpYOJjVPOFI3ZsuKHPAa9m50TO4JT4+UeTsinBX9EdNgla2AwbD2dPDt2gMfZjxx6TANaSV/NuocrsVRl+09x/vn80ps2NhTza80I+k057KhT4itJmDm/QQpUz2aaiRYTcDAj/00LsiGyCAq/5mg3sEBiRNA256RoGqXm+pCuBOws6vLxPfU9GpuLf+1st5ag6ko3uRECXA8vfieYzFecHKJghZIdOklGssNKKHUHgb20NB4Z1VvAeXKCGrq5QHPMDULoiBsuFO6aCZnhORK5+V/KRhZt1GwkKy8gePdI0J7AyeakOxRr21oSjWXZcNpy1j0jx74dF9we5AlqXXJdzcGZhFcJlAzsaLxxMHJzpVoujBKXnNJ8CnDZaO/r7r/DzU9W8L/1jhCrkl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(4326008)(66556008)(38100700002)(66946007)(8676002)(53546011)(6506007)(66574015)(66476007)(8936002)(31686004)(5660300002)(54906003)(86362001)(6916009)(36756003)(6486002)(2906002)(508600001)(83380400001)(6666004)(2616005)(186003)(6512007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWw0WXZ4bjdKVEZpSGlqNlNuWlVMcnpZLy9jaEdSbXBDV2FrSVFXRytxUHF4?=
 =?utf-8?B?Ykx0eDloRC91RGh6N2JYMnlpcS9Kc0JScUpQWXp6RWdxM0hKZ3FZZlVoSGpa?=
 =?utf-8?B?R2lUQkQyNURFY1RGZStqemhuRUNZQjIvNEVOTW9DaHE0WnZ5bHVGd2hwR3FE?=
 =?utf-8?B?cEczR1ZHUnZnWEpVYmdkNUdwNXVnMk9VYjlzZ3FWU2IwemZmOUpveDE2WVAz?=
 =?utf-8?B?Qmh1T3dtclIzd2JVS1NuTy9pMWVPbFhYMmFVVlhIOTNiRU1aU0dhYVc5blpr?=
 =?utf-8?B?ZFBBZHdTdGF6Y1JYYnRidGo5UjA3QWVMcG1RbDhtUnpBbnM2TVMzaHcyakVP?=
 =?utf-8?B?WW1Hc1d2c2NpRmRDSjRGSnVqRHBFY2ZlaWttZGdMU0VQbjdsSmJjcEY3M1Bn?=
 =?utf-8?B?U0FMSWUwemRrazAwY2RmenlscmtRUVAyQ0VMWGNhVUp4RSsxRGZkOS96UjI3?=
 =?utf-8?B?K3E3TEp0SUxHbzlOcEZ6amJwRER6WUt5TGJobE9xSGRaNThDZVpzemZHaFJ1?=
 =?utf-8?B?N09wK3FCaTFHSkZTa21UekVZUXc5N2JrNTBrK2FaRmNXVGZRQWxyUU5sZDZx?=
 =?utf-8?B?UlRrREpNL1AyMjMrZFdFSWI4NU1sRCsrNHFmY0k1ZkV4Y3hRN3NPUngzby9o?=
 =?utf-8?B?RTg0N2ZMTGp0L1NJd2VvbUZvY1RYTnFXVjd1eG5ock1ZdTBvZUIrTnlDVnRv?=
 =?utf-8?B?UWVZdW9uT0xGTTUvWk4wbFMrWUhUeWVLc0NFMVFmM0R5UWgrbkVYRkxBTUNk?=
 =?utf-8?B?c1ZKSDdHK3NURi9uUEJodjFFeTVFRmJkNkJLYVRwRE1Zb1lyWWp5TDFBbDk3?=
 =?utf-8?B?dkFRc3ZwckZhOTVrb0RBWXRHdDNFdHJMQThqYXVVNm5Td0RKbkk3eWE1ZEhE?=
 =?utf-8?B?d3p2cVpnR2kxbGd6NlRyU3ZKckhlS3VHajdsN1VyU1RQeE1HVk5VMEp6cTFR?=
 =?utf-8?B?Z1k0bHpyRGNIQVltZFdNZ3lTenZWdWRRNEkvOWlrY0JKbTU1Y0pTKzlRTTNr?=
 =?utf-8?B?MVkxL2Z2M3hzNndOZWFQZTEyUnpIZXVYWmtoME9JZWo1YmluUDdvdXhaV0ZT?=
 =?utf-8?B?OFZ5VGY1Zmp2NWZGL01lRmFPTGVXdENyeFF4TktEdmcvV0FCbUVFK3JnQlVr?=
 =?utf-8?B?QXlKMnpOSmgrS0REdDh0K04vdnNnZktWUVl1YzhXN2hUUCtkOHRXMUJGTTRT?=
 =?utf-8?B?K2J0RkZOYnlLWnJDWnJPcGJtNUk4MUZOcXBDMEpVM3hZQVJlbUd3MWJwenhv?=
 =?utf-8?B?V2svV3NqU1Y1MS9ER1ZRdzBaU09KSEZITUk4Y2s0Vy9ZOGtrUG5Qa0JIWllT?=
 =?utf-8?B?TmtGUlR6ZjM3RWtMUTZJWCtJc3lNb0haWDVWWTk2b3huNVJ0TVYrOFFvb1JQ?=
 =?utf-8?B?SlhaR1NQbnJiWG9VYnJUL0dCOVhka0RBbWNyVDdJQkwxSlBYN1Z5WHJNcGpV?=
 =?utf-8?B?MGxJKzE3TFZlMGhPc0tmMFJOTkRWZldwMHJyak9zbU4yN3FQSmJOa3ZZaHZX?=
 =?utf-8?B?VWVSdVRFNXhLVHY3T2NlbllOM1FvZEE2SE96MHlvMTBlUEhDcEJzT0lyRW4x?=
 =?utf-8?B?amtmS2xYYWhkbW9Bby80cHdzQmh1emtaT2xpT3M3ZWxyNU0yUllMWmxNblNo?=
 =?utf-8?B?R2hlQlV2WnJIL1h6c29Bekl0VEtpSnhDeVJIdS80K1Y3K21EN0s5dmpBMXVh?=
 =?utf-8?B?WTQxZVdJUEswZTFJYmZvMGxLY2QzZG0za1pFeGdMcGE2TTgyZ2duaDc2S2xU?=
 =?utf-8?B?V0tCUkJOdU9scU14WWFkbDhiS2FDMStJcEQ3b2l5Rk1jOG1YR2JRMmtQQTYr?=
 =?utf-8?B?Q1NLc2xTb3JLQ1htUFp3YWE3cWdMOFNxV3NCdjM0QURaLy9MeGJ2ZHh2NmVr?=
 =?utf-8?B?dWRyazBheHlQUnVqMXhkQWdSb3l3RTRIZWVISGR0WldTMnVZYWJoWDZ3d25z?=
 =?utf-8?B?Q1dTZzJqcW03Rm9TY0NFMEdNNllrOEEwWDVET0Nvc3YzYWpEYjdybk84VEtH?=
 =?utf-8?B?K0ZBa1h3eUJmVEhLMTBpcHNEcVVRYjJPemVNZkxaSmZsQjdhamFzUjBta0N4?=
 =?utf-8?B?aFhlSWRmQWxxaWZTWEk3SmhrK1pad3loVENXMXBmbXI5UGtvR2FJZUZlcXFL?=
 =?utf-8?B?WGJzN0pGazB2YlZkVHcwamVPK0tPYUtuRDhEclFPekI3L2R2VFdmSTV4SVhT?=
 =?utf-8?B?NnlJckJaYU83Uk9xMFM3SXhhYWh3aEpOUS9ueFYyWHN6MzNEWXFTSjNOSytn?=
 =?utf-8?B?UVpqSUZZb3owejliT1NwbU1YTVNzZ21SR0ZHODVJL2l6QytzL1RRaU1XTEl3?=
 =?utf-8?B?STJ0OGVydlBacHAvOWd4amZRby93TnJrMTNHRU5UTWtON1pNajQwaWRqdTYr?=
 =?utf-8?Q?nvuyib13xVQrPTqxrQWvPmXQwCUjOUPF3s12UWxwn/blS?=
X-MS-Exchange-AntiSpam-MessageData-1: g9UusoU4h+wfng==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb6f48d-8c1a-4832-66c3-08da47a83d8d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 10:35:14.1132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ii0SOCRsLTFI88HeYfh/hHJxoydvnuAjp8gnOeMp2bap2wm+r9CPSQcKkY2ZlNjb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3119
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.06.22 um 12:30 schrieb Bas Nieuwenhuizen:
> On Mon, Jun 6, 2022 at 12:15 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>>
>> Am 03.06.22 um 21:11 schrieb Bas Nieuwenhuizen:
>>> On Fri, Jun 3, 2022 at 8:41 PM Christian König <christian.koenig@amd.com> wrote:
>>>> Am 03.06.22 um 19:50 schrieb Bas Nieuwenhuizen:
>>>>> [SNIP]
>>>>>>>> Yeah, but that's exactly the bubble we try to avoid. Isn't it?
>>>>>>> For this series, not really.  To clarify there are two sides for
>>>>>>> getting GPU bubbles and no overlap:
>>>>>>>
>>>>>>> (1) VM operations implicitly wait for earlier CS submissions
>>>>>>> (2) CS submissions implicitly wait for earlier VM operations
>>>>>>>
>>>>>>> Together, these combine to ensure that you get a (potentially small)
>>>>>>> bubble any time VM work happens.
>>>>>>>
>>>>>>> Your series (and further ideas) tackles (2), and is a worthwhile thing
>>>>>>> to do. However, while writing the userspace for this I noticed this
>>>>>>> isn't enough to get rid of all our GPU bubbles. In particular when
>>>>>>> doing a non-sparse map of a new BO, that tends to need to be waited on
>>>>>>> for the next CS anyway for API semantics. Due to VM operations
>>>>>>> happening on a single timeline that means this high priority map can
>>>>>>> end up being blocked by earlier sparse maps and hence the bubble in
>>>>>>> that case still exists.
>>>>>>>
>>>>>>> So in this series I try to tackle (1) instead. Since GPU work
>>>>>>> typically lags behind CPU submissions and VM operations aren't that
>>>>>>> slow, we can typically execute VM operations early enough that any
>>>>>>> implicit syncs from (2) are less/no issue.
>>>>>> Ok, once more since you don't seem to understand what I want to say: It
>>>>>> isn't possible to fix #1 before you have fixed #2.
>>>>>>
>>>>>> The VM unmap operation here is a barrier which divides the CS operations
>>>>>> in a before and after. This is intentional design.
>>>>> Why is that barrier needed? The two barriers I got and understood and
>>>>> I think we can deal with:
>>>>>
>>>>> 1) the VM unmap is a barrier between prior CS and later memory free.
>>>>> 2) The TLB flush need to happen between a VM unmap and later CS.
>>>>>
>>>>> But why do we need the VM unmap to be a strict barrier between prior
>>>>> CS and later CS?
>>>> Exactly because of the two reasons you mentioned.
>>> This is the part I'm not seeing. I get that removing #2 is a
>>> nightmare, which is why I did something that doesn't violate that
>>> constraint.
>>>
>>> Like if an explicit CS that was running before the VM operation  runs
>>> till after the VM operation (and hence possibly till after the TLB
>>> flush, or otherwise have the TLB flush not apply due to lack of async
>>> TLB flush support), that is not an issue. It might see the state from
>>> before the unmap, or after the unmap, or some intermediate state and
>>> all of those would be okay.
>>>
>>> We still get the constraint that the TLB flush happens between the VM
>>> unmap and later CS and hence the unmap is certainly visible to them.
>> So you basically just want to set the sync mode in
>> amdgpu_vm_update_range() to AMDGPU_SYNC_EXPLICIT even when it is an unmap?
> Yes, with the caveat that I want to do that only for
> DMA_RESV_USAGE_BOOKKEEP or higher (i.e. if we submit a CS with
> implicit sync we get the old implicit behavior, if we submit a CS with
> explicit sync we get the new explicit behavior). The rest of the
> series is basically just for enabling explicit sync submissions.

That part won't work at all and would cause additional synchronization 
problems.

First of all for implicit synced CS we should use READ, not BOOKKEEP. 
Because BOOKKEEP would incorrectly be ignored by OpenGL importers. I've 
fixed that this causes memory corruption, but it is still nice to avoid.

BOOKKEEP can only be used by VM updates themselves. So that they don't 
interfere with CS.

Then the second problem is that the VM IOCTL has absolutely no idea what 
the CS IOCTL would be doing. That's why we have added the EXPLICIT sync 
flag on the BO.

Regards,
Christian.

>
>> That should be doable, but then you don't need any of the other changes.
>>
>> Regards,
>> Christian.
>>
>>>> #1 Is rather easy to fix, you just need to copy all dma_fences from the
>>>> page table dma_resv object over to the BOs dma_resv object in the gem
>>>> close handler. E.g. exactly what you suggested with the dma_resv_copy
>>>> function.
>>>>
>>>> #2 is a nightmare.
>>>>
>>>> We can't move the TLB flush at the end of the unmap operation because on
>>>> async TLB flushes are either a bit complicated (double flushes etc..) or
>>>> don't even work at all because of hw bugs. So to have a reliable TLB
>>>> flush we must make sure that nothing else is ongoing and that means
>>>> CS->VM->CS barrier.
>>>>
>>>> We try very hard to circumvent that already on maps by (for example)
>>>> using a completely new VMID for CS after the VM map operation.
>>>>
>>>> But for the unmap operation we would need some kind special dma_fence
>>>> implementation which would not only wait for all existing dma_fence but
>>>> also for the one added until the unmap operation is completed. Cause
>>>> otherwise our operation we do at #1 would simply not catch all
>>>> dma_fences which have access to the memory.
>>>>
>>>> That's certainly doable, but I think just using the drm_exec stuff I
>>>> already came up with is easier.
>>>>
>>>> When we can grab locks for all the BOs involved amdgpu_vm_clear_freed()
>>>> goes away and we can keep track of the unmap operations in the bo_va
>>>> structure.
>>>>
>>>> With that done you can make the explicit sync you noted in the bo_va
>>>> structure and implicit sync when the bo_va structure goes away.
>>>>
>>>> Then the only reason I can see why we would need a CS->VM dependency is
>>>> implicit synchronization, and that's what we are trying to avoid here in
>>>> the first place.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>> To get rid of this barrier you must first fix the part where CS
>>>>>> submissions wait for the VM operation to complete, e.g. the necessity of
>>>>>> the barrier.
>>>>>>
>>>>>> I'm working on this for a couple of years now and I'm really running out
>>>>>> of idea how to explain this restriction.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>

