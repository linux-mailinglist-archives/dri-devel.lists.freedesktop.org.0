Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078F788C6CE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8B610EBB5;
	Tue, 26 Mar 2024 15:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rYeFn2Qd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2137.outbound.protection.outlook.com [40.107.96.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC12510EBB5;
 Tue, 26 Mar 2024 15:25:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPIPHB0e9WUR0r3jxEKnbQZPm6wmOq9pUIrzZRiSJNTz2H+s+sGJgkOT3F7dB2mx3UWYZ992FILDvFcv3O1oRyhAjIKPpGgvsnLOdXXk/U54rvidXDGPnBEer0aqwrqAQkKE9zBR/gZPAoOil5+veEV8JpxhsXHrLS9TVTB+GmkDDFOhts6+UidIgjWTjIJZD2jdPAcn7JJUBsx8h5/lt0+HIbW+rb+Y50cOTKrZnSe/0Czwr/6VRy1GMwjamPc8F4+868D5coV6cDy/nVo4h20ydZ3hC11Nj+Yg7LFLEja4OKkO7+BIj7LcphIShPjHAQXdjuxzKTGwCMBzH7XY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRsPxOmtBLzXGpzZvrIdd6XnMKYeT3heM1hi+TjER68=;
 b=WwU+OvMsQDYkumS2p8OEiwkR39wcuOQvYGxyRVSr+1A2s6nZWgvGur+HvStiJwmtUZ7GmLhh6zXsx0+0cuoCeuerugq7IJpLZhu3U/no/x6Yy4MIfoiNmevvaQKe9a7DT4DknZHVFGUfXxPFuHShLCX/mxxN4bPOGLldtu5yRsxrmJ/IHcaoF9FY2w75UpriGASiVM37sXHTQ8UVFatq60iY2SbHs9zFXpS5nSUQBSTH5vaZIk6Webf5Wk01JrAZpAfDD/htO9GMbJ/tONrHdIo1JMom4yFS1IBJXCalwCDiDmhx5HOerCNfPl9c75+f3LPV2BydY8ufWktvfgFafw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRsPxOmtBLzXGpzZvrIdd6XnMKYeT3heM1hi+TjER68=;
 b=rYeFn2QdBvlc2DZzf7yK3LaE3N/7lCDsVd66BYrCo0ftF0oRCdGtk0fralQdGeB72H2NZmy5Wzg60yVvFlwHEwUo7zoD/+OrObr8gzkECmRZN7RZCVl7S6n2RifvAc2BTiU5xUV47I8FQ3R6mqJJpAiIxesyfIiuEDg5+V835eE=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by IA0PR12MB7625.namprd12.prod.outlook.com (2603:10b6:208:439::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 15:25:16 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b%5]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 15:25:16 +0000
Message-ID: <19a39ab2-ef75-cf2c-939b-7dd09dcc5b13@amd.com>
Date: Tue, 26 Mar 2024 16:25:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240307221609.7651-1-hannes@cmpxchg.org>
 <c411dce6-faaf-46c3-8bb6-8c4db871e598@gmail.com>
 <20240314170948.GA581298@cmpxchg.org> <20240323145247.GC448621@cmpxchg.org>
 <c8efae98-3cf8-c21c-bfa4-d5998ab92a0e@amd.com>
 <CADnq5_OGSLpLLEJqh86_SAZcqv-Cv6AmZJRZyaFtSmTHJ8ybxg@mail.gmail.com>
Content-Language: en-US
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <CADnq5_OGSLpLLEJqh86_SAZcqv-Cv6AmZJRZyaFtSmTHJ8ybxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|IA0PR12MB7625:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aYonrzXUX263prEqYGmDSs78PSsypt6OIoADy7q2oCiqkX/FALQI0w7/1W4hmVhEWgIIMvW/r31L7K7jQXGuTinsql2G/+tZTYb1htZO7jgoYNw82Wq2q/JylE5FjZBCIY1zcss3qW+ru3TmWaUPzRs8g1IFFEgfen5YPnBUsnThXXw/II9oxFJfE9AzCm4GYUYWJYelR8PiDju9WdEbbJ9MFB+xFAJL5ccmsNeGuKM6NTjBxR7D+JREuV2kyCyzssttaqKrk4Aesvf5if+Oc5S1ZqZDsyKPjefvu+Mzfj2dlzZQ9mj7PI4A6VtkjUCMRGxRrW4UUtl3sDPEIBmi4U1EnwH0jXcUAYphuzDL+fye27wMehzZOmuCrvEl9MZk5OScUW71uKPK1ClNM49khVcwNOcF60nmOg+eY1QudPq9JUvXexkp8Pv4BRpiDp3+KnQWodDR3eD40zpeiKa8oq0PWLaZVRZAkwlVxFUBlP0jseHAtkxiFg5Dl4NJ0m3/y5BH3IMtv5I34jzIBf9uYhjs39j5GG2KY2Nw8/NY82g6sG5z1ieIrMKpevH87F8lkxiLZNvyK0nZAonRmekUXmUW9Vq+BS4tH30c58Ot+HS64TNi6yckV1xrZ12nmcJEgrKL7JqqKTRUQxkQiQLqcIwwhZGUhY68XQ5hVQA4Hwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NURaL3E2TlpuRlcyQU1mWmhwNkt5K25SY0xuRzAveG9nbytTSmhXYmZxb0lz?=
 =?utf-8?B?NjdhOTRIQmRBM2lENFNxZHplazE4b1FvUktOcy9ERFE1THRXMEJMUFc1WlBF?=
 =?utf-8?B?NkF1L0RES00vODhlTVh1T1VVVFBvWnA1bkl1eHpXRDIvT2k2MS92T3A0MFgx?=
 =?utf-8?B?YnJTM0QwVDBodytabnBFV3Nmdkl5NGtSQVJxQ0tOUlBvTit6S0ltMjhnajVz?=
 =?utf-8?B?bjQ3ZnVORUpQVkdpQjJ0cFh5SHl1M3crUnFaWlZ6RXF6TzNXOExKcWNBa0xi?=
 =?utf-8?B?aytSNjRhQ25RV2ZtcWw4SWZQc3BubWJ4eGRSQUtwTldyRW5YZlhPRUp6RHdN?=
 =?utf-8?B?MXFOTHI5NUt0ZkVyWVFZTnF0U2lSL2FsUk8xRUxNdzNsSUkrV0N6TVJRdnBZ?=
 =?utf-8?B?WUJlOXQwMTIwdG8wNzJTVUwyNjloRzl2QStBajJwU3VrNmJleUZmckFOTVRk?=
 =?utf-8?B?V1JiT1VsZTFLMVZMOE0zU0sxR0tzdDhLVEhscnlnUktQa3QrWEJCbGNYSmUr?=
 =?utf-8?B?ZjVmQ0ZoRHRKRU5MZzdoeU96YmF6Smx0TGQ0VGRIakxjajVoQUIyL3piY2Nn?=
 =?utf-8?B?NzBRWDVueUlnTkg2c00wY1dycTJqZ3ZkeTdQek5sZmQ3MzZqYUdxdDUyMmtE?=
 =?utf-8?B?Q2xyOEJNWW91OXZrSEZmODdBWmMwaEZDaXRCZEpuWU1EcW9PVFNBMEFvVW94?=
 =?utf-8?B?ZGNUZXBtdmIvaXhiMklGNytDRDhtZ2ErWWs5Nm9aQzlJU1NBS1ZlbEJrNWtM?=
 =?utf-8?B?aHpOamVqOGErUVNqRXZTUU5CTDVWR2UzSDRTU2I4MDFBZ0JIdnlQVkplUXhi?=
 =?utf-8?B?ejg4MFdwekUzNS9Pd0E1ZkNkbGR5TTB2M0E0Z0htZHFxdXR2dEtvTjBYamh5?=
 =?utf-8?B?cDBTV1JJRk56NU55UjdDVUkwa1VZVHR6WmV3WUtsMEdkWlRyWHZLYWVyOHBX?=
 =?utf-8?B?Sk4yRVdkM2k5eVpsL0NnZmtzaGh4TXRLK3RXSzNXNUNJSHp3TitOMmovQlQ5?=
 =?utf-8?B?cFZ4bC85UVZETlQ2cDhleXBnSmlwMThqVTZ4YkhkaHBtbStBNWhFdDVyRGVT?=
 =?utf-8?B?cXBQck11ZzhsZTJmYzhDcEZpdlhzWkpMNWxmbk5PZExVUFBWcm9LSEszdVFQ?=
 =?utf-8?B?QmpuWGY3ZnRSSXBRTEZSRUNyYU10bU5WTXFNTkNYVTBSdDlqMUw0R1FhaTVo?=
 =?utf-8?B?M0F1eTRaQmJDR05XK0xGc1d4dVVQamJ4WFl5VWVJTjlncDV1Z2t2ZUhlQmx4?=
 =?utf-8?B?YjNvcjRCRE5rbWdZSWdTTDA0U2FKekpZMWNXVkcxZ2ppYVVJWHVmMVZkVEd5?=
 =?utf-8?B?SjhpQzluRGVCNFU2ZUVSTmZqR3pMRVRpY2dMbTQwU0lQTUhUTXQ1NndMa09i?=
 =?utf-8?B?cmZLbFhqdWYwV3NoaXQyWjVPd09YSndvNzkwMWhWNVdmYjNCOXhnREZLYjVI?=
 =?utf-8?B?MTRnLzJudjV1d3ZCWkZCV3owNlhLOVZBSVJubjNadVAvQ3ZiVVpzREQzT3VU?=
 =?utf-8?B?bUhpNWRzUk5Ea2hsZVdZZVpnVWxmdW4yRXo2ell3ZFJZbzk5c1h3enBSQXhH?=
 =?utf-8?B?alVmdWtXeXFiRWxLMWlYR2p5MS9zd2czNVBYL2tnKzRTMHZ5dFdFcGtKNktW?=
 =?utf-8?B?cFNHdFlaMG43VXFOcFNBS3hRYjgydEY3UmNXMkZpNGRER1B4TVI0cEw0Mi96?=
 =?utf-8?B?UHV1SG1LSFZLamx3QlJmT3JjTm0rWnZmYnpDV1k2YSsvalFxYjdPR3dPNnUy?=
 =?utf-8?B?Z045MlI4Sk1HSFVhR2tiL3A0d1JHcG1tbWk3OFhLdDdEdEdKcnVDMjhKMS9O?=
 =?utf-8?B?elhYVU9xTWZVN2FUaTB0dStzUit5OGlTWElnK3lNNVRXV1oxeXNVNkpIMWxv?=
 =?utf-8?B?UWxzbGVtWnVnTDRBSjVjTkk2aUovbVFlWnducnJpa1dCVE5OYnlrUTV6aXc0?=
 =?utf-8?B?VnozUHRDR1p4WXVoRGZ6Slh4aUpnV1A0TEptdDFjT1I4RThuY2k4dWpPYnlv?=
 =?utf-8?B?c3d2aFlQM2R0eWo2czc2NWVZbXZkYjVRQkw4NmZGOWEyMk5aTzdpTlQxUnM3?=
 =?utf-8?B?R1hJS2c3QW1sVEc3amJBY2N0MFk3bVlWOXhFU2gxUmhaMFQ0b2pEUExHSVht?=
 =?utf-8?Q?zRPQ8uF2LsXHI3hh0drkofWPU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f8d09b-9663-4dc5-7be7-08dc4da8f02c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 15:25:16.2362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2XCi38XaTpj7IxBa86zrlFzAgbTIea0XMWjW+OgfixspWv9qhC+EzCPGQXcbvR2HOBIBVGoEmp8sA7WwggMvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7625
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

Thanks for the patch,

Patch pushed for staging.


Regards

Shashank

On 25/03/2024 00:23, Alex Deucher wrote:
> On Sat, Mar 23, 2024 at 4:47 PM Sharma, Shashank
> <shashank.sharma@amd.com> wrote:
>>
>> On 23/03/2024 15:52, Johannes Weiner wrote:
>>> On Thu, Mar 14, 2024 at 01:09:57PM -0400, Johannes Weiner wrote:
>>>> Hello,
>>>>
>>>> On Fri, Mar 08, 2024 at 12:32:33PM +0100, Christian König wrote:
>>>>> Am 07.03.24 um 23:07 schrieb Johannes Weiner:
>>>>>> Lastly I went with an open loop instead of a memcpy() as I wasn't
>>>>>> sure if that memory is safe to address a byte at at time.
>>>> Shashank pointed out to me in private that byte access would indeed be
>>>> safe. However, after actually trying it it won't work because memcpy()
>>>> doesn't play nice with mqd being volatile:
>>>>
>>>> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c: In function 'amdgpu_debugfs_mqd_read':
>>>> /home/hannes/src/linux/linux/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:550:22: warning: passing argument 1 of '__builtin_dynamic_object_size' discards 'volatil' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>>>     550 |         memcpy(kbuf, mqd, ring->mqd_size);
>>>>
>>>> So I would propose leaving the patch as-is. Shashank, does that sound
>>>> good to you?
>>> Friendly ping :)
>>>
>>> Shashank, is your Reviewed-by still good for this patch, given the
>>> above?
>> Ah, sorry I missed this due to some parallel work, and just realized the
>> memcpy/volatile limitation.
>>
>> I also feel the need of protecting MQD read under a lock to avoid
>> parallel change in MQD while we do byte-by-byte copy, but I will add
>> that in my to-do list.
>>
>> Please feel free to use my R-b.
> Shashank, if the patch looks good, can you pick it up and apply it?
>
> Alex
>
>
>> - Shashank
>>
>>> Thanks
