Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BDA21B00
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 11:34:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC6E10E799;
	Wed, 29 Jan 2025 10:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UnC3WMBZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6C10E798;
 Wed, 29 Jan 2025 10:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNII3qZR2Irg6l7HeqCJdEXB8KkY76MjlBlRKdaXBqL2bbpqFxay3Uu6GsEO0R0W7f4W8MFvpY/SfKmJdokQkxYsQOKayOhjsdmhiRDYCgcewectEqDbKOOysRtECoSIoVYONJ9Jxrcd42tyBqHNJJffmxw9eF98pl8ZPgoWM1Su6R+rx5nRMbh1RthU7FQhMBNEnMu+JPpdfZS89SM2qgRTN3eVn1b2iY8ku7gx5Nt5CuOiTRGhA91VhYgT1Vz3m66gn+DMta0glm7o4h5HClG/rUyQZUG5AAbidW0x+isx7TNxjAjTT6/Yycko/CfjN2S8N/xxyy4Scxw1fLQi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9ALlhjF1CPg88sJuH/LZMi3tsn6wwmQ7G+Gd2z5afw=;
 b=xqG+K09NOiuYtY7hIdaZpX8lR2hprYPJX7vQcRcGiKbmb+nCoYHQxViHEoZfP5WbGfq9KepG6NSI5PA32r9zd+W+9PHGNU8K/YEo82rR0msKPPKHeMKMu/6ho8SzCt0DJE2aJ4Sl7/HmJEffO47TzjbSj5CGKfPmGLl9tgBA5gEp/0hbIKGPf3XQQ+tvjutUYoKtOeY+2FtJcssAYjsv7USSPVrexjvdLnNlCJvByat/AnqKwn2kNligTa79JMjcRpSoRkp+NsRLL5lBkkTj4g2mI0JkajSGVhhGQB8Yvq9FHYosKiwFvF+o4D37IHCSvCaHCvtn9m8vrQ08WRLU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9ALlhjF1CPg88sJuH/LZMi3tsn6wwmQ7G+Gd2z5afw=;
 b=UnC3WMBZXEanudpVnkGKophnGg6fkaIaBFcaFrRC2aszxWSyUB7gya+C2ukh9fF+QnSiDrzpH3/vsTVXwRufxkUz+jWPelS8eZL5lLrRR6fiaB+r4UVYASkGUkIN7NOg3EWLO+3PxVpsNdow/VC71PggvO7PfLobh6X8qvw9qp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM3PR12MB9389.namprd12.prod.outlook.com (2603:10b6:0:46::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Wed, 29 Jan 2025 10:33:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 10:33:58 +0000
Message-ID: <39142118-2f55-4ecb-bc7b-50705afaf4c8@amd.com>
Date: Wed, 29 Jan 2025 11:33:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] RFC drm/xe/eudebug: userptr vm pread/pwrite
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20241209133318.1806472-15-mika.kuoppala@linux.intel.com>
 <20241220113108.2386842-1-mika.kuoppala@linux.intel.com>
 <2eadfcd7-5cbd-4f3c-86aa-7e5a50df01d8@amd.com>
 <173813781464.9444.9979122540723604978@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <173813781464.9444.9979122540723604978@jlahtine-mobl.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM3PR12MB9389:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b98c60e-5fd8-4461-b983-08dd40506fa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXRlbmxpdHZ0dkl3MzJCQUNodGNsRlF1NHV4VnVqOUhFSy9BaWV5amkwVENi?=
 =?utf-8?B?bVpBYVltR3d5K2RUbXAyRFlpYThrVk14UHNRNGJYTTNFb3hZamk5dXRjY2V5?=
 =?utf-8?B?R0JUS0t5MjVvME9kejlyeXdiOXV5c1Z0OHVYckNWTzFPdU5LRXR4aUhHQjZo?=
 =?utf-8?B?QlFVbEc4QWpOSTBqNndSeUh0NXU0bmtZMGJQQ1pXVVRmdjYvc3BMZFhOMCs4?=
 =?utf-8?B?cXJ4Q2RsTitVbmdmN2VHMUh1Q2crd0k3S2xoWmpMY0tMNWR2YzlWMmZFanJN?=
 =?utf-8?B?Ti9rVDdNTUhneiszN2R3eXMvZTJHd1kvY1FFTkY4VER3aEpkczI5TGdtZDRX?=
 =?utf-8?B?TDBjWXBDN1NCa1ZEUWhPUXk3WTEvcEFSVENJSFFUMUd5L3hHbkd3SFNsOXZS?=
 =?utf-8?B?cm0rN0l1aE5SNEVKQWxBSmxtYjI0MllFb2pqbnlVeFJocUQwNG43ZUt1dHN4?=
 =?utf-8?B?MHp1RSt2OVR2eFlXQnFQTVllOS91V0t0N0xmYlduemhxNnIxMTQ1dlFBTUI4?=
 =?utf-8?B?cGxEN3FIaVI4ZjlkaEhsN2ExYmF4TmwwVDhLanVWdXVqMEY0SUdFOGJvYU8y?=
 =?utf-8?B?TEVtRFFRdkVFWitXSzZjUldwcXdNNEgzV2trd3dGdmhwTFI0NFVZOFV1L2pN?=
 =?utf-8?B?MVlRZjFnTFFFYWgxMkJUMXNnSlEwVzJEcVk4Q2hpV2tpdmVVVjI2UzB3N2tX?=
 =?utf-8?B?ZlhORnRIMTk5cHpLVHRiWEpGTDNmdG5BSWg0V2tjVlRiZHJpanViYVdFK2lL?=
 =?utf-8?B?amJ0aENBTFlTUzA0dEpsaCtHa2R4YmFtTy9Lb0NKOVNtNVg3QmZIWjR4Q2h3?=
 =?utf-8?B?Q05UeU9TblI5OTNVY3BPbVNBTEJrakIxUlhDNXRVUDFYdXVkZis4d25NUmJq?=
 =?utf-8?B?Qk5FQXJmdjZnSStzNUpMTFVhTWI5Y1F4TXJzeFdUbm9JR2VFY0hCcFVjOWdW?=
 =?utf-8?B?VmozblV3a2ZIdE4yMHpVckxZL3dPNmJtYlZuQ1lvd28xbkJ3dElkMTlPUnNn?=
 =?utf-8?B?cGdweW00Z21Zb29ZbDY3cWlKYittWSs3SEJ5M1AwbVU2NXF5R1pXM1VvWHRI?=
 =?utf-8?B?anNRRUlDclBnQ3BqSi8wK1IydHdyREdieVdFT29oWkhoNVhaVXBkeVFCcEVT?=
 =?utf-8?B?T0hvcHA1U1J0Tjk1VHBHM24zRk9PMnBsZ3FTU2svMW5ZMWhwNkU2VlcyZndE?=
 =?utf-8?B?cmdWR1d3VlZxeE1NNWlEVzFpVVVPUGFIYzY5dDhhVUpXdjdEMFVKbDVrWi8y?=
 =?utf-8?B?cWpGZnVOd25hZkloZGRLNnhRTEFkbVdoWkdXQmdUYldDdzJiTXhCZEVQZWo0?=
 =?utf-8?B?RHAvdmtENTNvVEpITy94cTJKUTdjQ3M4ZGlsVDQ2Z0JUWHJ1UzgyQ2VWWXZ5?=
 =?utf-8?B?M2JvU2hpdG9BeGk5dEgvMzZlNlE3cFFrUzRUYXRYYkdMcmpsTDdEaDR5bHBl?=
 =?utf-8?B?KzlXWGhMU3dPZUNnUVNOeTI0R0tNckhaNHJVaUNQWkRwQm0xbmIyVE5xVkIv?=
 =?utf-8?B?bFJuUVNmeng2cEl5MjJzWTdkcDMycFl0Mi90K1JZRjZEMHp3VCtLV2dUYVhX?=
 =?utf-8?B?aVRqSXdUbnhUSFhhd0R4c3NvRnFCU25URWd6MkJuT3E4NE9CZzVaWEhKREVk?=
 =?utf-8?B?K3QxU24wS2paelBFc250U0s2b0JZNERmSndsQ2tnNzVoNk1Od2ttL3hqdjh5?=
 =?utf-8?B?VUJZVk8xTHVkakRKRDdsempnamthUTFSZSs2V3FhVGhqOGJqVGxFSGk5VmYz?=
 =?utf-8?B?Nm5nUkswZTViSHRRVDZ0L3pJUEcvamVzcklqcnhtaURTSWkxc3BqRTllaGwx?=
 =?utf-8?B?Q0NsRDZBOVRxVElTNGFxUWs2ZWlQRkxHdWovc1l6OHNmQkZDTjZ3VmF3cUJR?=
 =?utf-8?Q?YwltvQTBstuVj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFpQYzdZTmdYdjc2OERldUZWL2lWK2dXSE1WYkY4TTdrR2JNWmtjdFY1VDRE?=
 =?utf-8?B?Q3VkWjZ4SWNEd2lmTktsdzBKVDVaUmtUcWpwK2haaHNDQWpUZTRGNHdZeG1H?=
 =?utf-8?B?dkpXS21lRE9QZnNkUENjRVpESmlLbVlOa0JDNUg2R0ZTTWdseVo5aHBFUDFh?=
 =?utf-8?B?Nkd6VngzRnB3YVJYRWp1VHAySWZWYTVySTlDSklrbFBUam5xNk9rT1d2N1pX?=
 =?utf-8?B?b1NPT3IwRzVzekVnVGJCN1RlYmVHVjJWQythNEFyMGl3VzhGTFIwVVVtWW13?=
 =?utf-8?B?d0lTNWRnM2c1cmhvNmhhc2tBT1pYaWhySFo1TjBwNVZhaU1vMDMxbU9YYkV5?=
 =?utf-8?B?b3BoQmxKb2M1akY2NGZWMlVBUHhVcHFIUjRDSVlUN1k5NEkxUGlNZ3ViNWZm?=
 =?utf-8?B?cHk4N1Npa2lXaVRLeWRMYVdIbzRUNEFZYnB0WU1oRXVGRjl6dzBrUjdhN3Uz?=
 =?utf-8?B?V2dRTzQ3aWRCWENNYmYvUVUwbjUxZXlmRE9sRXZ4OWVFcXdBOUdhWVRoM003?=
 =?utf-8?B?VUFQa1JHbGVDSzl0WTZMVm9VTStOR25mRHFNaWFJdmxDYjBicnBrVVlLaEJ5?=
 =?utf-8?B?TkpWT3FmbVRhRFF0Mi95RU9TYkJTcWltSkppZEFPRk56THloK1gvQy80QWhq?=
 =?utf-8?B?K3I1THhrY3dBRTU1Z3B4ZXRHK09MMnp2dmlUYmZ0bkJnWDN6RUlkK3F3NlZj?=
 =?utf-8?B?OXB5ampDN05wSWZNd3pQN2NMcFpVSCtSL3c0VzBEbU9pY2RCYlpJM3BEb2NF?=
 =?utf-8?B?Q1lLUGtGemdDTTI2YlhMMTNIRFBzMnlraWdldVpXMnRjcjdaWUR1Q3p1bHRV?=
 =?utf-8?B?bzZoMXJRaENLb3FxL3BwRzJGU2ZUSVpmbmZod09aL3ZNaElMYkUxM2x0YTlE?=
 =?utf-8?B?QmhHelJGaC9ySXlKVVhGYWFqVE90QVNadDhjZEp1RWtDWCtuY09ndnlJQTVC?=
 =?utf-8?B?aHg3SUhhZ0x2cktxeFQ0L1kzNFkyek5CSmIzMlJFcEdyTUFSeW5BenJPdytU?=
 =?utf-8?B?WHZNVXNtNW43UzVGU1JvdzQ2TzdkTHVkOCtSb3pLdkg4Vyt6YnozQVlJNHdM?=
 =?utf-8?B?eStLelhhMHlWb0RNcVZoRG5vZiszaUdPUkVuUThaRFhqWkRNTWdRTThOSURR?=
 =?utf-8?B?Zk0vQ1NiN09NTVVFMVdNbzB1Qmt0YWo0aTY4bnB1aDJ1RldZNUkzZWJ0dWND?=
 =?utf-8?B?cWRNdlI3aEtPdkhNZjJCdmt2aGhnK3RBaytjRHRnZmdSRSs5TGhUSVBKck1w?=
 =?utf-8?B?L1FCcmsrWWIrNEVkM0l0dzlMeWgxOTMwcERIN2FSeHhDUlp0d29tdm1NWFlI?=
 =?utf-8?B?S0ZHeWN4MWRHU1grc3ZKWjVWQVhFb1orRm9qKzVJR04zTjVYcVVuUnN3TlRq?=
 =?utf-8?B?Sk5lUk9PdGw3Vll3TGJLOGN2VFY4WlJkakdDdTdvSHdaUC9QOTRpMGlGSHFQ?=
 =?utf-8?B?aFJ0dEtraGJjcHdBTlVRS0JVVFh6dUtJR3diNzN2TG1YMUxoU0h5ZG5lcjRR?=
 =?utf-8?B?Q1ZmZkFKc09nekpxVWtDN1RaeUl5VVpiSTVUMk1nbisxWDRzODdFL2N3TVMz?=
 =?utf-8?B?SkN1bE1xZzQyWWxON1FHcWZjY21FMndEd01NakUwbURzcDRyTzIvSnZjWEZm?=
 =?utf-8?B?SEU0cHZiSGFlTkMyOS9LSjEzK3VjdDFncUo1OFFaTXB1YzZOMWk1K3F2cVRB?=
 =?utf-8?B?UjZsSUpHc2d3dDVrYTh1U1J4Z0lHZ2YydENzbldkWWExckJzYjErL1V2M3Nj?=
 =?utf-8?B?LzkxSXJLR3JMT0VXTW52MWFpcStPQS9rdnIxQlJxWGgxV3gyUDVzTHpjemtl?=
 =?utf-8?B?TWtra2pCOWRSaHZuZlVlam01UndZaHE4ME5Jam1pY1BlSFhLaTNCcG01dXBI?=
 =?utf-8?B?UDhNRG1ZcGdva2YyOVVvS3VlR3BvUms3aHRSYTJYdjJHYzJhbmVCMVQ2aGNI?=
 =?utf-8?B?bWQwQWE2d3oyUUFKVGhNQzFxeTJndXpTZHlGaTZzcGlaMjk1RTNyTEpLN0Q5?=
 =?utf-8?B?b1RpbkRRNHhLSGtvYzdpMmdqZEpLVXBKaW5Ba2d1emlTb1VNMHJOK2xWNlpB?=
 =?utf-8?B?YzZ6NTBFMFJXOXF2eDFqSHFDUXhpd3BaNkZmUGkreE94YStRV2RCZU1rWWxI?=
 =?utf-8?Q?eGJfHo9bFOp1LqV0ZU9HqXDai?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b98c60e-5fd8-4461-b983-08dd40506fa2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 10:33:57.5668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkErtt13CQ2KozXC9Z47L2reC8vTkt8j8FT25VMsnAupL8fYiNiV/ZqaikQyAFyF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9389
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

Am 29.01.25 um 09:03 schrieb Joonas Lahtinen:
> Quoting Christian König (2024-12-20 14:56:14)
>> Am 20.12.24 um 12:31 schrieb Mika Kuoppala:
>>> Implement debugger vm access for userptrs.
>>>
>>> When bind is done, take ref to current task so that
>>> we know from which vm the address was bound. Then during
>>> debugger pread/pwrite we use this target task as
>>> parameter to access the debuggee vm with access_process_vm().
>>>
>>> This is based on suggestions from Thomas, Joonas and Simona.
>> Yeah that looks much saner to me. I still have a couple of comments on
>> the general approach, but I'm going to write that up after my vacation.
> I see you've had some issues with mail servers, so just pinging here to
> see if any replies have got lost.

No, I'm just overworked and have like 10 things I need to take care of 
at the same time :(

> Would be great to reach a consensus on the high level details before
> spinning off further series addressing the smaller items.

I would say that attaching debug metadata to the GPU VMA doesn't look 
like the best design, but if you just do that inside XE it won't affect 
any other part of the kernel.

My other concern I have is using ptrace_may_access, I would still try to 
avoid that.

What if you first grab the DRM render node file descriptor which 
represents the GPU address space you want to debug with pidfd_getfd() 
and then either create the eudebug file descriptor from an IOCTL or 
implement the necessary IOCTLs on the DRM render node directly?

That would make it unnecessary to export ptrace_may_access.

Regards,
Christian.

>
> Regards, Joonas
>
>> Regards,
>> Christian.

