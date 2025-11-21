Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361CDC79C03
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929B810E8B6;
	Fri, 21 Nov 2025 13:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0d6nO5tC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011063.outbound.protection.outlook.com [52.101.52.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FCC10E8A4;
 Fri, 21 Nov 2025 13:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIlQFXmY8kI2X9xh2eiKU6dcKwS5U864aN/6zCxALI+LyQLMBX0YLLPvIqFCLjBSEf61hNXUjLfU4yZ+vRXwDm1V9iUnYKC8o01jcnHMpog7QIDm5133EXF8uXB2WlxQ1kZhhqjlCRpj1ARZbrwhRbqJ7us/572rM7em16ukaTpGFqQciZTwJRitoxNPBqm7BkHPfQrH0nIOGsXM8kvCTl8cygoJFUOsk94kQ0W6CeIviw6/8t32TsUaI+wfJheWXZg5cXsoErK4kwlzkz/k84a7kfCcKVa9n1dEvl4JxZCSDTPPwRfTwD6QCJ8WsDBXDDOjehDUL4pg+GQSAs7U+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujU0idW1IsUpXfBC3lKyddpywIY0JZyR+pZwGlkjXFg=;
 b=CkX1+nLdCooQSI+H2nhm5/nwWPGs9+u+HCLSOsaNGf6RS5Ux/3Vdibfs+OmnC51ppFosuJm9pjseLmIUVgSYmwjqolCga64lGTB71FONvZFsDkyGhzF/6j92QAcojEaMZfewcl1v6Lkpbv5+uG34zNGYU2u0EDAMxJepADPY91bwDZ8Gov5fSSVNkSuR14JmG2327YNIgXwUkDvdtelzIdaiOpw+4F+1GTNgQwsoQ7yOCiu6tDV/V/TQ2xeGXNGpLpfTTgKjiE9UTC/tvRZ30mW601Cyd30zvN0fA59fY34GN4L9L3WJiMGJyLtN4jEuhS7+DyEckWCJqySwp8waVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujU0idW1IsUpXfBC3lKyddpywIY0JZyR+pZwGlkjXFg=;
 b=0d6nO5tC2L3Nn3jZXKdKxuzRkztZl0mJU1X9m7sjARcGKyvrqC3Bu3PqLPDV63sLAn9h1B6dLTewc78A04hpW2GgXFgOpfF9eA3A2ulIqhGvtPhFsNBHQUpXyKJWmUHjd4quD0bMDqlcyuCpLOKCmdPkXTrUzYyv8dambAvql7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 13:53:42 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 13:53:41 +0000
Message-ID: <cb13dd25-82b6-4d8d-a8f2-a9a31ef2e73d@amd.com>
Date: Fri, 21 Nov 2025 08:53:32 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 xaver.hugl@gmail.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com,
 sebastian.wick@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0208.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::31) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab9f99e-98e6-480a-01b7-08de290560c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBlNDB1NFRkbjRiRXA0bEEzZmRScnl3bGhLaVVHMXE1QlEzM0FwR0c0NFp3?=
 =?utf-8?B?ZXVCUmFYUURVbmE3SWt0ek04bmx5UVFwTG45Z1dHZEtkR1dha0ZIaUxWQlda?=
 =?utf-8?B?NUhoYitJdWlocHBVSW9JUkJhUk5wY0VFSzhsSUFKaDRCM3BFbVFSMFgvZnIw?=
 =?utf-8?B?Y3VLdkZTcXhPQ1pjbnJnbFp0QllNdlJpZlMwL0VFMkRTZ3dLQnJyMEJHKzhW?=
 =?utf-8?B?VzR4enloQlhzUEZxOTNmY2Zqc29RcERJRVdUWmxIQWltaURBb2U3OHpsemN2?=
 =?utf-8?B?YnNEdlh4cytjMUNHd3oxMXp5SGdHMm5aT29oTWtqWHJrNVZ4OThZNWJPOHIy?=
 =?utf-8?B?ZlFET3pocmdHRGNkeVVoOVNyaTdkc2JSc0U2OHNtTzFSbEZaSTJaMkR1UVB5?=
 =?utf-8?B?WncvUEltbW01TUJTdnprUS9ORm93SUplb2dSWUcySDhUcnc2d01DeWM1OHoz?=
 =?utf-8?B?ZjF0RUlPYnhEL0FvS1RhNmpCUWVJTWdkSm5PSTFDMVorY2duVHpMMlFmVUdF?=
 =?utf-8?B?WVhCTEgvMjk1dU0rNVZlcUwxeXNxbXoyelloL0Z5K1Q4dnkrem5mOS9UV2Jn?=
 =?utf-8?B?eGx2K01OOEorcmFoU0paZnFzdERWUHNZbkVvaFJmSVYvd20vT0dkc1NIVERm?=
 =?utf-8?B?ZjZGdy9raVA1cFZ3MGhRR0ViejdkbGNEQU5GTlNQamxKMG5oaUorUEJSb3gx?=
 =?utf-8?B?TityMTc1azY3ejlpUURvMVJpT2ZxbEhMNStFSGt4MkRjbWEvcjRoRVdUajZF?=
 =?utf-8?B?SFI0ZStMckNBdG0zYTZyNSt6TnZpb1RxUGRmUnIzUWRkcDBGNC9wTTFJcUw0?=
 =?utf-8?B?akdNNXQ0L28rN2swRExhbDdNTTJpOGVBRjMyWkE4ajdEVCtheURIVWppOFlW?=
 =?utf-8?B?UVlYdzhlVWdvTVplbTZjbDZ5WUYrR3RrY1gvWGF4dmUyMWpORko5QitYdkZV?=
 =?utf-8?B?QWpOQXNORU1IckhoNFQrb3FBcXlxMTRsamNTdVVwb1hRT1k2UUtzVm11dlZm?=
 =?utf-8?B?SXdsWGFyTU1TM3hINDY5UXpjck80U3VCVW1YaE1NTjg0c1RlNXNZMElFQmxz?=
 =?utf-8?B?VS9EYnR6ME81bWNwQ3pDUjIydzV4U0tZblhJUjRWNzJ2blF2WVBJWEZ5bXk1?=
 =?utf-8?B?a0k2aEZoN1hVZ2NTSnlSMzNVbjdYZGNScERJU0xwM1JDbjZhUnBKRDJvOEkv?=
 =?utf-8?B?bFhrdmU1UklwaXFmcmw0RS8yazVWTjNxZHJMU3l1RHd2R2gwTzhvaERWWGcv?=
 =?utf-8?B?d1ZRZ1MwMjdaY1Q0TW1kRG5MclpUUE9ZZDAyYzdLU1JacmxNS2lCMWd2cEZ2?=
 =?utf-8?B?QmVrRHl1Q0l6aVBvbUFUZk5Da05OUWtuMWR2aThrWE9YRnFyYjV5K0c1QTRJ?=
 =?utf-8?B?SjNSYkQ2UlpLMWxiNy9nRi8wbFU3aEFoZXFqcTlwSGttT1BWYTZDK1Vubmts?=
 =?utf-8?B?UFJpYVJUN052bWRERjRESEJObTIydktuWWp0REluejA4QWpzeXJnSzdiNnZT?=
 =?utf-8?B?LzJoM3dIaEFkUi9uZ1ptVEdaSUZmSlhpam15Mk1hWlREMG1RclVXZmllWjBz?=
 =?utf-8?B?WHVDcUZOdE9rcTNjSHM0T3djRExWQ0pwYUxHY3hzQ1hlRWZJZ1d1UXY0bVNT?=
 =?utf-8?B?dytUekNWUnhNeVlLTzRVbVQwZ3M2bm9zL2pyRFFEeW5tSzg5ZWRGMy9CZHV6?=
 =?utf-8?B?ZmpNY0FibEtRUUFlVTFDdHViYXBnVkRkWUhxTmV4NEpCaE1QN0tOTDN3Tk9u?=
 =?utf-8?B?ZTlmNDh3dlZSNWl3cFRKK0Zld1o5RUpEVHg3eHBEMTI5ZGQ0dE1yd2RvejFK?=
 =?utf-8?B?VHdvckpIVVErT0NzWlJaTDZzRFZsV2drT3hTbXo5dkdHRE91cGtSOU5aV2dY?=
 =?utf-8?B?TmJqWU4vUmJBdTkwRDl6Z3dic0Z6QUZ2OXlNaVNtdFFwVHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmY0b2hYT01IZ2VkMXFORmJYVXNHOExBZ3dCY2d3Z1dyWnhPWGQvMXNaZTBH?=
 =?utf-8?B?dWhEaS9yRVBHbm5PZW9pMm1nV1lza2gyTzh2TW4wYUt0M3ByQ3l2SEtQMXdB?=
 =?utf-8?B?bGRVcEhadlUzc3NOV0h0T3VYbENjQVRGV0gxakZXRkVtRUpjNFI3NHR4SWtK?=
 =?utf-8?B?a3BpeEFNTHJEUXZEa2xDWXF6STcwcUVvYnA5WW9OVmtyUG1OY29pbUdmUFoz?=
 =?utf-8?B?c0FmeldITUNqT0ZnVU1TdnJHL0NodDAyOFBsQWFHcE5QWGkwYW1hSnJlVC82?=
 =?utf-8?B?UjdZL3gxS1k3QVZsMG51ZnJSVGF5K3VrTnl6T3Z5emNJcWp1SkxsRG1qb1Fu?=
 =?utf-8?B?UTBrMStWVDZSaDliRzNJaHNSbnNVeitEaklmZUJUa1p2bWltTjdPajBTS0xp?=
 =?utf-8?B?UFl0WGZNVHFQbC9pRmEvemMrTmVsSmZmWXc3ajZjdHpsYlFSZlNLUE1uL1hW?=
 =?utf-8?B?SldQNkxzQ3dtWVdrMnlrMFZOd1FUR2tyaUJEMXFobThoUXh1RHA0d0I1YnBi?=
 =?utf-8?B?SU1wYTZmMXRsR0tDTzRLVjdJODB1bTFnVlVZYk1ZMm9ubVIxMjEzbUpPbGta?=
 =?utf-8?B?QmxmekFYVXE3RXYrZXpDV1Zrdk50MlB5Y1NWQmgwYU5qMW9WNlhJTUxxQmRU?=
 =?utf-8?B?Z2pta09aYU92ZlZpWlpiRHcyeUNzVEx1QnN0SG5oeWhVWC9SNzIxcFR6NklY?=
 =?utf-8?B?ekhDb2R2cFZSdWJCYVBBL2FFTXRJSmkzUzlHWURTS1cvcFVlVjUwVGFEZlJW?=
 =?utf-8?B?OHZyTUlBbUNlSE11ZG9CUG9Ta3gvT1c2SXpSdWltUEZkUkNFQmowR3JLZldy?=
 =?utf-8?B?QUphbUx6T1l5NjhRdE1kSlptOEhubUQ2T0EvYmJmTzRSTDdoOXEzbTRCV2pO?=
 =?utf-8?B?YXN4eVpFWW5hNWcyRTl4TVVXaGVFVTVVUzNRWmV3UkFEU2syZWhvK1kzcjBx?=
 =?utf-8?B?ZW5ldVdLVzBZRjk0Vy9FUWNoT0tmaHA2MHZQNGE0Qi9ueklrVCt0SXAzbVIx?=
 =?utf-8?B?ZGowaDNpQzNQOTIyUnY2Ui9yS0JmY3c2Tkt4QjJ0T2pMTFdyUkRsdDJMRDY0?=
 =?utf-8?B?alM1NXp5dUd4b1lHNEdoUEJUdlFJR2R3MFZIYXZEV1BEKzVRUlJ3Tm1rTUpz?=
 =?utf-8?B?bEFvRlhMOEIzTTVuR1I3dU12dnhiK29TSzR4NldqOVV6ZWN6M213VU1Cb2V3?=
 =?utf-8?B?SDBjN2xTQ2k3dVBIMU9GeDFhZ0lJQWVwR0NkRE1VTktMTW1SOU5sYjlrWUta?=
 =?utf-8?B?Z2pFMi9pSEFQSTNtMXFHQSs3bU1JZFAxWHN5VG5mZ0g1dDl4UUJJVlc4SFRm?=
 =?utf-8?B?Qi83MVFkSXc4ZFBDSXZ5TXNldlhDNXJDUzdTdDNZWDZ1SWJUdFNyMjY3WUtq?=
 =?utf-8?B?TUxsV29DQnBlVnFuU0xPUDIzUDBuT054NHB2UFMyekFUZnd5WDNHNDc4NjNy?=
 =?utf-8?B?MXc3UnVpYVBKajJFS21iN2l5Sm91YnpTSTlPd1hGVkp3QlBuK2xPaHQwWUM2?=
 =?utf-8?B?TWlwNThuL09NQVFGMUdKS1BNdTVKTFdhazdXSGlYZHVsSDlRdjA3SUZDZkRx?=
 =?utf-8?B?MlR6WHVySGU2dkVOd1d0NUl4NXRvWHg0MmQ1UGk3NVUxcUFLeW8zVlpiZC8r?=
 =?utf-8?B?OVhzWmhWVnhkNXJyQUVsU3QreXFacHl5TDA0SHJmYlJQU3FNc21XbTVPdGZG?=
 =?utf-8?B?Y3RndkN4OThvajZpRXhkeWVCTEQ4bUFXQkpqWVRzb2daeGxJS0l5WFk0WUlC?=
 =?utf-8?B?TjdXeWpNazIrNHMxZ3VKT3ltdkFJRjVRYStaQVE4bjJNdHRrUWhLbUlzTTFn?=
 =?utf-8?B?Njlpd2hKbmh4d3RwYWI1YWhrejF5THZESGtiVFpHZVBXY0VWS3Z6SC9wRE9Y?=
 =?utf-8?B?OTVpT0lFbGFaTEZzVTNtc0QrTkExWW5VN1lDd0crZlJRSFJtL3NwdW9JQmt3?=
 =?utf-8?B?UUQ4NG8yUnNQS0NaSm1MT0NOQWREd29UemRjNTA0RWttSE81TW95TGRhdUdm?=
 =?utf-8?B?eWMvamRPVFFGMGVHWndiWkdZOWtGU1dPQ3BoUUx5dTdqd0dTOHh3M2dhbWtB?=
 =?utf-8?B?d3hRYU11UVJJaE5qUjFMOGFjVHNBVXBQNFVIdnJZYkkwQlZud25PSnhmYkRF?=
 =?utf-8?Q?LNDnFsJ/otVY29lFmiMo/ILb5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab9f99e-98e6-480a-01b7-08de290560c3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:53:41.0247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rDtQGXd+NbNfQS1FmtQX8IWQdtJaHuS/5HR0bRVXQY/PRI8PyBraqJnjU5JDPqDNHsbETA6U+BZ3ytdgZnzBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098
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



On 2025-11-21 04:13, Louis Chauvet wrote:
> 
> 
> On 11/20/25 20:11, Harry Wentland wrote:
>>
>>
>> On 2025-11-14 19:01, Alex Hung wrote:
>>> Both kernel patches and IGT patches are reviewed and the API is stable
>>> for a few revisions. Does anyone have concerns if kernel and IGT patches
>>> are to be merged?
>>>
>>
>> Xaver, are the kwin patches ready to be merged?
>>
>> I'm planning to have a last look over the kernel and IGT series and merge
>> them to drm-misc-next next week if there are no objections. I believe
>> I still have committer rights to drm-misc and Alex should have IGT committer
>> rights.
> 
> Hi,
> 
> I have commit rights on drm-misc if you don't have them anymore. I just need confirmation that I can apply amd patches on drm-misc-next.
> 

Thanks for the offer. I might take you up on it.

Alex D., any objections to taking the AMD patches through drm-misc-next?

Harry

> Thanks for this work,
> Louis Chauvet
> 
>> Harry
>>
>>> This is an RFC set for a color pipeline API, along with implementations
>>> in VKMS and amdgpu. It is tested with a set of IGT tests that can be
>>> found at [1]. The IGT tests run a pixel-by-pixel comparison with an
>>> allowable delta variation as the goal for these transformations is
>>> perceptual correctness, not complete pixel accuracy.
>>>
>>> v5 of this patchset fleshed out documentation for colorops and the
>>> various defines that are being introduced.
>>>
>>> v6 addresses a few comments from various reviewers.
>>>
>>> v7 simplifies 3D LUT and addresses more comments from various reviewers.
>>>
>>> v8 fixes typo and errors and address comments from reviewers.
>>>
>>> v9 refactors cleanup functions, fixes typo and errors, and addresses
>>>     comments from reviewers.
>>>
>>> v10 add 32BIT RGB (drm_color_lut_32) to 1D & 3D LUTs, addresses comments
>>>      from reviewers, and fixes typo and errors.
>>>
>>> v11 change names from *_lut_32_* to *_lut32_* and fix RGB 32bit
>>>      extractions.
>>>
>>> v12 add gamma 2.2 to 1D curve
>>>
>>> v13 add two vkms patches
>>>
>>> VKMS supports two named transfer function colorops and two matrix
>>> colorops.
>>>
>>> Amdgpu advertises the following pipeline for GPUs with DCN 3 or newer:
>>>
>>> 1. 1D Curve EOTF
>>> 2. 3x4 CTM
>>> 3. Multiplier
>>> 4. 1D Curve Inverse EOTF
>>> 5. 1D LUT
>>> 6. 3D LUT
>>> 7. 1D Curve EOTF
>>> 8. 1D LUT
>>>
>>> The supported curves for the 1D Curve type are:
>>> - sRGB EOTF and its inverse
>>> - PQ EOTF, scaled to [0.0, 125.0] and its inverse
>>> - BT.2020/BT.709 OETF and its inverse
>>> - Gamma 2.2 and its inverse
>>>
>>> Note that the 1st and 5th colorops take the EOTF or Inverse
>>> OETF while the 3rd colorop takes the Inverse EOTF or OETF.
>>>
>>> The 3D LUT is a 17^3 tetrahedrally interpolated LUT but the mechanism
>>> exists for other drivers to describe their own 3D LUT capability.
>>>
>>> This mirrors the color pipeline used by gamescope and presented by
>>> Melissa Wen, with the exception of the DEGAM LUT, which is not currently
>>> used. See [1]
>>> https://indico.freedesktop.org/event/4/contributions/186/attachments/138/218/xdc2023-TheRainbowTreasureMap-MelissaWen.pdf
>>>
>>> At this point we're hoping to see gamescope, kwin and weston implementations
>>> take shape. The existing pipeline should be enough to satisfy the
>>> gamescope use-cases on the drm_plane.
>>>
>>> In order to support YUV we'll need to add COLOR_ENCODING and COLOR_RANGE
>>> support to the color pipeline. I have sketched these out already but
>>> don't have it all hooked up yet. This should not hinder adoption of this
>>> API for gaming use-cases.
>>>
>>> We'll also want to advertise IN_FORMATS on a color pipeline as some
>>> color pipelines won't be able to work for all IN_FORMATS on a plane.
>>> Again, I have a sketch but no full implementation yet. This is not
>>> currently required by the AMD color pipeline and could be added after
>>> the merge of this set.
>>>
>>> VKMS patches could still be improved in a few ways, though the
>>> payoff might be limited and I would rather focus on other work
>>> at the moment. The most obvious thing to improve would be to
>>> eliminate the hard-coded LUTs for identity, and sRGB, and replace
>>> them with fixed-point math instead.
>>>
>>> There are plenty of things that I would like to see, but they could
>>> be added after the merge of this patchset:
>>>   - COLOR_ENCODING and COLOR_RANGE
>>>   - IN_FORMATS for a color pipeline
>>>   - Is it possible to support HW which can't bypass entire pipeline?
>>>   - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>>>   - read-only scaling colorop which defines scaling taps and position
>>>   - named matrices, for things like converting YUV to RGB
>>>   - Add custom LUT colorops to VKMS
>>>
>>> IGT tests can be found at [1] or on the igt-dev mailing list. There
>>> have been no updates since v5 and rebase on latest main is straight-
>>> forward.
>>>
>>> A kernel branch can be found at [2].
>>>
>>> [1] https://gitlab.freedesktop.org/alex.hung/igt-gpu-tools/-/tree/amd-color-pipeline-v12
>>> [2] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v13
>>>
>>> v13:
>>>   - Update vkms test Makefile (Louis Chauvet)
>>>   - Include two vkms patches (Louis Chauvet)
>>>   - Remove redundant ternary null check for drm_color_ctm_3x4 blob (Coverity Scan)
>>>
>>> v12:
>>>   - Reorder header files (Louis Chauvet)
>>>   - Add header file "vkms_drv.h" to vkms_composer.h to avoid compile
>>>     errors (kernel test robot)
>>>   - drm_colorop_cleanup is no longer static (Nícolas Prado)
>>>   - Rework cleanup in vkms_initialize_color_pipeline (Louis Chauvet)
>>>   - Add drm_colorop_pipeline_destroy in vkms_destroy (Louis Chauvet)
>>>   - Remove outdated commit messages (Pekka)
>>>   - Initialize the variable 'blend_lut' to NULL (kernel test robot)
>>>   - Change lut_size to size (Sebastian Wick & Xaver Hugl)
>>>   - Update comments for bypass_property (Sebastian Wick)
>>>   - Update lut_size to size (Sebastian Wick & Xaver Hugl)
>>>   - Add gamma 2.2 (Sebastian Wick & Xaver Hugl & Pekka)
>>>
>>> v11:
>>>   - Refactor vkms_color_test_lerp() to parametized tests (Maíra Canal)
>>>   - Sort include file alphabetically (Maíra Canal)
>>>   - Skip color_encoding/range_property in drm_mode_object_get_properties
>>>     when plane_color_pipeline is present (Harry Wentland)
>>>   - destroy function takes drm_device *dev instead of drm_plane *plane
>>>     (Nícolas Prado)
>>>   - Fix undefined errors by EXPORT_SYMBOL symbols (kernel test robot)
>>>   - Fix comments to "2nd op 3x4 matrix" (Nícolas Prado)
>>>   - Update outdated "drm_rect_test_suite" to "drm_fixp_test_suite" (Maíra
>>>     Canal)
>>>   - Update outdated MODULE_LICENSE to Dual MIT/GPL (Maíra Canal)
>>>   - Create color pipeline on supported hardware only (Melissa Wen)
>>>   - Update names from *_lut_32_* to *_lut32_* (Simon Ser)
>>>   - Include help function drm_color_lut32_extract (Uma Shankar)
>>>   - Remove redundant is_legacy from __drm_lut_32_to_dc_gamma (kernel bot)
>>>   - Fix RGB 32bit extraction from LUT (Xaver Hugl)
>>>   - Handle errors in __set_colorop_3dlut (Nícolas Prado)
>>>   - Merged enable condition for drm_crtc_enable_color_mgmt (Melissa Wen)
>>>
>>> v10:
>>>   - remove duplicated "is useful" in comments (Melissa Wen)
>>>   - guard "dm_plane_init_colorops" function when !AMD_PRIVATE_COLOR (Melissa Wen)
>>>   - Replace DRM_ERROR by drm_err
>>>   - Creaet color pipeline when >= DCN_VERSION_3_0 (Melissa Wen)
>>>   - Relocate amdgpu_dm_supported_*_tfs check (Melissa Wen)
>>>   - Support 32BIT RGB for 1D LUTs (Uma Shankar)
>>>   - Support 32BIT RGB for 3D LUTs (Harry Wentland)
>>>   - Fix typo mutliplier to multiplier in subject (Melissa Wen)
>>>   - 1D & 3D LUTs are no longer immutable ((Xaver Hugl)
>>>   - Fix 3D LUT kernel doc (Leandro Ribeiro)
>>>   - Check dpp.hw_3d_lut before creating shaper tf/lut and 3dlut colorops (Melissa Wen)
>>>   - Disable CRTC degamma when color pipeline is enabled (Melissa Wen)
>>>
>>> v9:
>>>   - Update RFC documents for 3DLUT and fallback behaviours (Simon Ser)
>>>   - Specify colorop function names by _plane_ (Chaitanya Kumar Borah)
>>>   - Remove redundant comments (Simon Ser)
>>>   - Fix typo in commit description (Shengyu Qu)
>>>   - Move destroy and cleanup functions earlier (Simon Ser)
>>>   - Move DRM_COLOROP_1D_CURVE_BT2020_* from middle to end (Simon Ser)
>>>   - Chagne "bool allow_bypass" to "uint32_t flags" for better extensibility (Simon Ser)
>>>   - Return a value in __set_dm_plane_colorop_3dlut
>>>
>>> v8:
>>>   - Change VKMS config names (Louis Chauvet)
>>>   - Remove deprecated function "drm_atomic_get_existing_colorop_state" (Louis Chauvet)
>>>   - Remove null check in drm_colorop_set_next_property (Simon Ser)
>>>   - Remove MAX_COLOR_PIPELINES in drm (Simon Ser)
>>>   - Update kernel docs and documents for DRM_COLOROP_3D_LUT (Simon Ser)
>>>   - Add comments for dmr_color_lut (Louis Chauvet)
>>>   - Fix typos and replace DRM_ERROR and DRM_WARN_ONCE by drm_err drm_WARN_ONCE (Louis Chauvet)
>>>   - Fix incorrect conditions in __set_colorop_in_tf_1d_curve (Leo Li)
>>>   - Add DRM_MODE_PROP_ATOMIC to drm_property_create_range (Simon Ser)
>>>   - Change "1D Curve Custom LUT" to "1D LUT" (Simon Ser)
>>>   - Return error when __set_output_tf fails (Leo Li)
>>>   - Return -EINVAL when drm_color_ctm_3x4's size mismatches (Leo Li)
>>>   - Set initialized to 0 and return when drm_lut3d_size is 0 (Harry Wentland)
>>>   - Rework tf->type = TF_TYPE_BYPASS for shaper (Harry Wentland & Leo Li)
>>>
>>> v7:
>>>   - Simplify 3D LUT by removing lut_3d_modes and update doc accordingly (Simon Ser)
>>>   - Add destroy / cleanup functions when color pipeline initialization
>>>     fails (Louis Chauvet)
>>>   - Fix checkpatch errors and warning (spaces, long lines, {}, and etc)
>>>   - Change lut's size from drm_colorop_state->size to drm_colorop->lut_size
>>>     and from size_property to lut_size_property
>>>   - Update some kernel updates and commit messagesa (Louis Chauvet)
>>>   - Squash "drm/colorop: Add atomic state print for drm_colorop" and
>>>     "drm/colorop: Add NEXT to colorop state print" (Simon Ser)
>>>   - Add missing MODULE_DESCRIPTION (Jeff Johnson)
>>>
>>> v6:
>>>   - Eliminate need to include test as .c file (Louis Chauvet)
>>>   - some doc updates
>>>   - cleanup if colorop alloc or init fails in VKMS and amdgpu (Louis Chauvet)
>>>   - couple other small improvements in VKMS, such as rounding (Louis Chauvet)
>>>   - take ref for DATA blob in duplicate_state func & fix refcount issues (Xaver Hugl)
>>>
>>> v5:
>>>   - amdgpu 3D LUT
>>>   - Don't require BYPASS
>>>   - update RFC docs and add to TOC tree
>>>   - add drm_colorop and COLOR_PIPELINE kernel docs (non-RFC)
>>>   - add amdgpu color pipeline doc
>>>   - define SIZE property similar to drm_crtc's GAMMA_SIZE
>>>   - various minor fixes and cleanups
>>>
>>> v4:
>>>   - Add amdgpu color pipeline (WIP)
>>>   - Don't block setting of deprecated properties, instead pass client cap
>>>     to atomic check so drivers can ignore these props
>>>   - Drop IOCTL definitions (Pekka)
>>>   - Use enum property for colorop TYPE (Pekka)
>>>   - A few cleanups to the docs (Pekka)
>>>   - Rework the TYPE enum to name relation to avoid code duplication (Pekka)
>>>   - Add missing function declarations (Chaitanya Kumar Borah)
>>>   - Allow setting of NEXT property to NULL in _set_ function (Chaitanya Kumar Borah)
>>>   - Add helper for creation of pipeline drm_plane property (Pekka)
>>>   - Always create Bypass pipeline (Pekka)
>>>   - A bunch of changes to VKMS kunit tests (Pekka)
>>>   - Fix index in CTM doc (Pekka)
>>>
>>> v3:
>>>   - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>>>   - Remove need for libdrm
>>>   - Add color_pipeline client cap and make mutually exclusive with
>>>     COLOR_RANGE and COLOR_ENCODING properties
>>>   - add CTM colorop to VKMS
>>>   - Use include way for kunit testing static functions (Arthur)
>>>   - Make TYPE a range property
>>>   - Move enum drm_colorop_type to uapi header
>>>   - and a bunch of smaller bits that are highlighted in the relevant commit
>>>     description
>>>
>>> v2:
>>>   - Rebased on drm-misc-next
>>>   - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>>>   - Incorporate feedback in color_pipeline.rst doc
>>>   - Add support for sRGB inverse EOTF
>>>   - Add 2nd enumerated TF colorop to VKMS
>>>   - Fix LUTs and some issues with applying LUTs in VKMS
>>>
>>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>>> Cc: Simon Ser <contact@emersion.fr>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Melissa Wen <mwen@igalia.com>
>>> Cc: Jonas Ådahl <jadahl@redhat.com>
>>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>>> Cc: Alexander Goins <agoins@nvidia.com>
>>> Cc: Joshua Ashton <joshua@froggi.es>
>>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>>> Cc: Aleix Pol <aleixpol@kde.org>
>>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>>> Cc: Victoria Brekenfeld <victoria@system76.com>
>>> Cc: Sima <daniel@ffwll.ch>
>>> Cc: Uma Shankar <uma.shankar@intel.com>
>>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>>> Cc: Hector Martin <marcan@marcan.st>
>>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>>> Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>
>>> Alex Hung (18):
>>>    drm/colorop: Add destroy functions for color pipeline
>>>    drm/colorop: define a new macro for_each_new_colorop_in_state
>>>    drm/amd/display: Skip color pipeline initialization for cursor plane
>>>    drm/amd/display: Add support for sRGB EOTF in DEGAM block
>>>    drm/amd/display: Add support for sRGB Inverse EOTF in SHAPER block
>>>    drm/amd/display: Add support for sRGB EOTF in BLND block
>>>    drm/colorop: Add 1D Curve Custom LUT type
>>>    drm/amd/display: add shaper and blend colorops for 1D Curve Custom LUT
>>>    drm/amd/display: add 3x4 matrix colorop
>>>    drm/colorop: Add multiplier type
>>>    drm/amd/display: add multiplier colorop
>>>    drm/amd/display: Swap matrix and multiplier
>>>    drm/colorop: Add 3D LUT support to color pipeline
>>>    drm/amd/display: add 3D LUT colorop
>>>    drm/amd/display: Ensure 3D LUT for color pipeline
>>>    drm/amd/display: Disable CRTC degamma when color pipeline is enabled
>>>    drm/colorop: Add DRM_COLOROP_1D_CURVE_GAMMA22 to 1D Curve
>>>    drm/amd/display: Enable support for Gamma 2.2
>>>
>>> Chaitanya Kumar Borah (1):
>>>    drm: Add helper to extract lut from struct drm_color_lut32
>>>
>>> Harry Wentland (29):
>>>    drm: Add helper for conversion from signed-magnitude
>>>    drm/vkms: Add kunit tests for VKMS LUT handling
>>>    drm/doc/rfc: Describe why prescriptive color pipeline is needed
>>>    drm/colorop: Introduce new drm_colorop mode object
>>>    drm/colorop: Add TYPE property
>>>    drm/colorop: Add 1D Curve subtype
>>>    drm/colorop: Add BYPASS property
>>>    drm/colorop: Add NEXT property
>>>    drm/colorop: Add atomic state print for drm_colorop
>>>    drm/plane: Add COLOR PIPELINE property
>>>    drm/colorop: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>>>    Documentation/gpu: document drm_colorop
>>>    drm/vkms: Add enumerated 1D curve colorop
>>>    drm/vkms: Add kunit tests for linear and sRGB LUTs
>>>    drm/colorop: Add 3x4 CTM type
>>>    drm/vkms: Use s32 for internal color pipeline precision
>>>    drm/vkms: add 3x4 matrix in color pipeline
>>>    drm/tests: Add a few tests around drm_fixed.h
>>>    drm/vkms: Add tests for CTM handling
>>>    drm/colorop: pass plane_color_pipeline client cap to atomic check
>>>    drm/amd/display: Ignore deprecated props when plane_color_pipeline set
>>>    drm/amd/display: Add bypass COLOR PIPELINE
>>>    drm/colorop: Add PQ 125 EOTF and its inverse
>>>    drm/amd/display: Enable support for PQ 125 EOTF and Inverse
>>>    drm/colorop: add BT2020/BT709 OETF and Inverse OETF
>>>    drm/amd/display: Add support for BT.709 and BT.2020 TFs
>>>    drm/colorop: Define LUT_1D interpolation
>>>    drm/colorop: allow non-bypass colorops
>>>    drm/amd/display: Add AMD color pipeline doc
>>>
>>> Louis Chauvet (2):
>>>    drm/vkms: Pass plane_cfg to plane initialization
>>>    drm/vkms: Add config for default plane pipeline
>>>
>>> Uma Shankar (1):
>>>    drm: Add Enhanced LUT precision structure
>>>
>>>   Documentation/gpu/drm-kms.rst                 |  15 +
>>>   Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
>>>   Documentation/gpu/rfc/index.rst               |   3 +
>>>   drivers/gpu/drm/Makefile                      |   1 +
>>>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
>>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 768 ++++++++++++++++-
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 208 +++++
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  26 +-
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
>>>   drivers/gpu/drm/drm_atomic.c                  | 170 +++-
>>>   drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>>>   drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>>>   drivers/gpu/drm/drm_atomic_uapi.c             | 159 ++++
>>>   drivers/gpu/drm/drm_color_mgmt.c              |  43 +
>>>   drivers/gpu/drm/drm_colorop.c                 | 600 +++++++++++++
>>>   drivers/gpu/drm/drm_connector.c               |   1 +
>>>   drivers/gpu/drm/drm_crtc_internal.h           |   1 +
>>>   drivers/gpu/drm/drm_ioctl.c                   |   7 +
>>>   drivers/gpu/drm/drm_mode_config.c             |   7 +
>>>   drivers/gpu/drm/drm_mode_object.c             |  18 +
>>>   drivers/gpu/drm/drm_plane.c                   |  59 ++
>>>   drivers/gpu/drm/tests/Makefile                |   3 +-
>>>   drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
>>>   drivers/gpu/drm/vkms/Makefile                 |   4 +-
>>>   drivers/gpu/drm/vkms/tests/Makefile           |   3 +-
>>>   drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 417 +++++++++
>>>   drivers/gpu/drm/vkms/tests/vkms_config_test.c |  47 +-
>>>   drivers/gpu/drm/vkms/vkms_colorop.c           | 120 +++
>>>   drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
>>>   drivers/gpu/drm/vkms/vkms_composer.h          |  28 +
>>>   drivers/gpu/drm/vkms/vkms_config.c            |   7 +-
>>>   drivers/gpu/drm/vkms/vkms_config.h            |  28 +-
>>>   drivers/gpu/drm/vkms/vkms_drv.c               |   7 +-
>>>   drivers/gpu/drm/vkms/vkms_drv.h               |  12 +-
>>>   drivers/gpu/drm/vkms/vkms_luts.c              | 811 ++++++++++++++++++
>>>   drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>>>   drivers/gpu/drm/vkms/vkms_output.c            |   6 +-
>>>   drivers/gpu/drm/vkms/vkms_plane.c             |   9 +-
>>>   include/drm/drm_atomic.h                      | 111 +++
>>>   include/drm/drm_atomic_uapi.h                 |   3 +
>>>   include/drm/drm_color_mgmt.h                  |  29 +
>>>   include/drm/drm_colorop.h                     | 462 ++++++++++
>>>   include/drm/drm_file.h                        |   7 +
>>>   include/drm/drm_fixed.h                       |  18 +
>>>   include/drm/drm_mode_config.h                 |  18 +
>>>   include/drm/drm_plane.h                       |  19 +
>>>   include/uapi/drm/amdgpu_drm.h                 |   9 -
>>>   include/uapi/drm/drm.h                        |  15 +
>>>   include/uapi/drm/drm_mode.h                   | 134 +++
>>>   51 files changed, 5014 insertions(+), 94 deletions(-)
>>>   create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
>>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
>>>   create mode 100644 drivers/gpu/drm/drm_colorop.c
>>>   create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
>>>   create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
>>>   create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>>   create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
>>>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
>>>   create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
>>>   create mode 100644 include/drm/drm_colorop.h
>>>
>>
> 

