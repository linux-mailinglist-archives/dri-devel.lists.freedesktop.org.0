Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C295971929
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 14:19:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995DB10E4C3;
	Mon,  9 Sep 2024 12:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uTBdz4Vx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB15110E3FF;
 Mon,  9 Sep 2024 12:19:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJJO+qiZID8DM11N5Gqqyv1p/aibGdB40V6lSeOiBjl5IDhnXH1XHINf5l2SQRS3dIsUK4CxwEODezmeQRg7wxNTgDMVbgQA6gZO/HZ2ILBXPTT3/JIkDvsmsk/Ovb8l7MxdzhWUD96x5yVlgb3EwUOkw+H4JMMO0eeAuOKiSRE7owvbLuGt3cUtNtAGl8RGtxqTIewlATY/xMN/T0fPGPAsaxuyN3/ukKr8YlFXmtouTlB6uJJ2kga8VWbYCz9SUIheaX+FzKDop1PdeuBARbEC1YwFnDh6KYv7LNAy0mZnsPZC0dwKTkxOq0AroDiXmuz91AaNOPxuQMUcePZGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhNtIUOhOBwQmURlfLiXgrBhXt0RuJ0vz6acmMuCbLs=;
 b=O0xGFII0JkjOhki+dp6bqQSSpDU+jL1q1h9WsEQ9R8IOsidWvdVCWZOqVWdgbeFc2ExvbodDSgHxe1U6vXeVrGYAlSWec4RYrzA5Y6ouDnKcYXHM/+yeRBvlj00+ijha/TbtbJZScJgtfNwBhDWTzpuHsJIvCFCLzGH5uhl3LnlNmeT6Naieo7gL+Vxk/hM+lpg4Ad3nCqVK4PYF5Fv6vL0+HY2QMTXAez5Uv9Cpdo79uY2TBgfkmBr5QDrfT7I+oatx02bqHEooSFz/PwnxV/RH+DRibkecWb7DQJoHuRRq/tPhkC11hB97NEmUeLgIVrcFGUHiyw0irWpZglXDkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jhNtIUOhOBwQmURlfLiXgrBhXt0RuJ0vz6acmMuCbLs=;
 b=uTBdz4VxzetOnTS0pTEYzsZKlBGVjAv6G7EVId4FUa68xxZFkTB4Liivn1q6DWM3dAGZsepTaoKlsw6J7bOnD6kDNJxldvQg/rgPsHyge9afyDpf2ggZVRRmwh2ChZWfjQPxMNigQsWr/CbZ+W8MqY2n/wxOLVZI/i7+VtGt/dc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Mon, 9 Sep
 2024 12:18:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 12:18:58 +0000
Message-ID: <fb9556a1-b48d-49ed-9b9c-74b21fb76af4@amd.com>
Date: Mon, 9 Sep 2024 14:18:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/4] drm/sched: Add locking to drm_sched_entity_modify_sched
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 stable@vger.kernel.org
References: <20240906180618.12180-1-tursulin@igalia.com>
 <20240906180618.12180-2-tursulin@igalia.com>
 <8d763e5162ebc130a05da3cefbff148cdb6ce042.camel@redhat.com>
 <80e02cde-19e7-4fb6-a572-fb45a639a3b7@amd.com>
 <2356e3d66da3e5795295267e527042ab44f192c8.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2356e3d66da3e5795295267e527042ab44f192c8.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: abec547b-d2e0-4c16-b53a-08dcd0c994d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UCsxaHhyOEQzYkxUb0xyVjNQbVYyTGhkaTNWbWFoTlYyL2QvbjYrSGU5eWtu?=
 =?utf-8?B?MTl0VkJidWd3bDc0ZVZVTzhTeHUxdXlVU2RManlVMkdtUnQ4emQzMnJXM09F?=
 =?utf-8?B?dmEwZGxMN0FacjlOY2c0c20vblFSV2ovU0JhSHhCeGxzU3dnQ2ZOa1RYUVlv?=
 =?utf-8?B?Mk9RRHkveGRGVEtSTFRMQVVTWlZxK0FjV1hQN0RuRG1OejhlaFpiKytGSmIz?=
 =?utf-8?B?N1FEd1ZNdzBZOG13blpVWVlsOEdIT3BFQW5XRnVjd0pjcHVLUWpaQ3cxRzgy?=
 =?utf-8?B?VDdUUE9yU25EeXVQMXhlcW01bFcwd0FBQkQzdGxOQ2ExZi9QWFludFVHWWpO?=
 =?utf-8?B?UTFoUE5iL2tpQzF6bnNSUXdwNkNCdXZNSG5ScTk0RjRnck1xdVRsTnVybjlP?=
 =?utf-8?B?NzB2S1hTTkJFczczTDNRWnkvMjVxUUd2aVpOSXpVelVBWE1kcWY4SzF1dnRa?=
 =?utf-8?B?SjZ5aE1YTkt4U05uVkRwRis5R1Rlbkt0Y2hnay8yRWJHY2pGK3BYbXN1VXV3?=
 =?utf-8?B?aTlrQjZJUlpkbTFiQ1d6eUlQNHpjQUFqTVN3b3RDZGtGUjJiZlNRcXJYazIr?=
 =?utf-8?B?cklpdXVCTDRhQXdKSmppSm1TMlJDOER5N2h3WVpYV1g2VFZvam9NQmoyTWov?=
 =?utf-8?B?OU9vcDF0cFBqNWR1akRBMlJ1c1hWMUZtREkzV2EwdkN3NVJWTVN0YzBSOWt5?=
 =?utf-8?B?cFUrRWdFZHcyaU9WN1pIZ29pcy9HNXpwZXRVazVNT0tESUNnSzNHS09Zd1BG?=
 =?utf-8?B?SytuandGcDAzQkp1VE15U2ZyTWFZUUVWNEVTcFh2bE96Nlk0dVhSVTdhemcr?=
 =?utf-8?B?WTAxNFVtZklEdk53YThrMkRybXdYSW9WUW9XY05vQmU3VW9CL3J0aXFHb3Ny?=
 =?utf-8?B?dDc0dGRTNGJUejVZT3dqZVByaXdtNWJpUllWSzQ4enpObWh1QkZJMlBmUi93?=
 =?utf-8?B?cXZsb1BhdDFDZzA2eWdpRGxZSXdZRlBZbnNaNmIzSldFR3RVOFFjekF3cG5h?=
 =?utf-8?B?S2Rmb1VqUG1zQmxGZUc4M1BjZSsxSkwwa2lsc2UvclhFY3ZwOVRDRmNNQ1VS?=
 =?utf-8?B?Z29SMDJDL1ppSUFycnJOUFdRb29KSytjdCthMUpveFczTUNIeWRRbk54QVQy?=
 =?utf-8?B?REVKVkU0SzZtV2FEZUVjMW1xWUJUU3JQQW1mRkVZN2ZyanlDL0U4eFE5Vko3?=
 =?utf-8?B?ZG51RWtlNnN3U3p3aFNyZnhDdGR3YTVMRXJRYjhzM3c3MGExUUloUmxHNGU2?=
 =?utf-8?B?WWpWOFFxd2owYTVDelFDWEtYaTNmczVodm44eXllYzJGKzc5SGpQblFEQlB0?=
 =?utf-8?B?dWhhRzZQS1BZdDFNTDV0OERycDE5MVh3ZC8vM3FkbGRsNWRKWHV1NzVwVnda?=
 =?utf-8?B?OFVxSGloVDFwaVVUZ0pIT1JPQmFMcmozb0MwUU1yQ05KejJwSUtCSEV6c01K?=
 =?utf-8?B?WGhjeXlBTklhd0lBdUNkc0pucG5kSFhyY0t2eHpOb2lUWk16d0ZTbS81NXRH?=
 =?utf-8?B?azZ3Q3FyTytlUGdaeHdLZ0JrV202VzFRMFdXbHhkczRNdm1WdDl5T1ZOT1Jv?=
 =?utf-8?B?M3FQdEpVQlo4SHRYc21tb3UxaFhjajZJb25JLzU4VVFaajMwSk9xaHROZS92?=
 =?utf-8?B?VGtvbkRtcDVKdVViRy9jZ1Q3VlMzN2MvV2JwUlFmOXhYVGNJRjhXcnFnRVNv?=
 =?utf-8?B?YVh4OWlHOEQvVFBrNWUvVXBSWW9UTXN2eitudm5WU1NTUjlIMWpPN0RWTXQy?=
 =?utf-8?B?NXFHQlBSalJBYlRNV1JFSHBjRGpjMlpkZ0RZTzJpS3ZyQUM1SzQ1dEZ6L2FL?=
 =?utf-8?B?RlU5aTJoUjY2SFdnSVZ1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFNqcWxxbkM5aHp6SDhaYUp0TnMvelcyWitPN0ZSc3QzK1h3SHpPTG1JMCs5?=
 =?utf-8?B?aG1UdU9YOE9LTGZMZ1J4cWZEU0N6OW50Q0o0c1IvWXlEVkFJSyt3V0Iwa2RL?=
 =?utf-8?B?NGVWcXhFWlo1RXp6UmMxODQ5ZXZTVkxtRzI5S3FMajhtdGZ4aWJRTFQvc0xX?=
 =?utf-8?B?ZDZDaGxFVjZ4bys1NEFCVkhBdC94T3NYN24zNEI3TXh3ZGZZRmZmYmpZSjFs?=
 =?utf-8?B?Nkg2RDRNSmFSN2UxTjRzbEVRVGw1WFp5YXZWb1dhYktTU0tJV3JNZFNlWnVG?=
 =?utf-8?B?cXhWaUxGVFBlaUp2U2pld1hqdll1a0xwRDhoOUpkSXZCWGVmZHNxeXdXNG1t?=
 =?utf-8?B?elR5MkFmcml6ZEU2cnJIL0xZY1BDMEc2cStuUHdZbm4zbTFMR05LUWZ3V25m?=
 =?utf-8?B?N2JHc0FnQ01pNnVGVkMrQ2hETk1QbXNzRHlKeEZCQjZhejVKME5MVWE3TS9O?=
 =?utf-8?B?NmQxbTFETUVxSXdSUWY2NXZSWVp3NE8rdkdJbTBSVXFUSWZ5Nyt4Q3lKNW5C?=
 =?utf-8?B?c29nb0lLblVPdGVXVG9hVjhMOVVNU3J4UmZ3VHVEaEFXWHo4cVN3eDdrZ3VN?=
 =?utf-8?B?WlBKUlEvUUhSOWFjSEZUZTNlTk1OUmE1OUhhRUlhSnpEVUFZWUNDODYxUFAz?=
 =?utf-8?B?NXR6dzBjanI2dU9ncWxQSjF3akxSWU1wMUc2Mm56QlNyNkZTci94ZS9kZkVv?=
 =?utf-8?B?RGwvSVdSUzN6WFZtZ3R1b1FGZlZLMitjSnNXUFlmdTRCRjlNRktna3NJVjdk?=
 =?utf-8?B?Tk5PQThpTi84TXJZWERzaWpwNjZoVkNqZkVvRkJUNlZCekFhZXNoTUdWTlhh?=
 =?utf-8?B?WmhDVS9yS2tpR2Z6RC94eU1OVTVFVVpyUGxzNUhLZFE2TTl1a3hFQS9QU1dB?=
 =?utf-8?B?NDA2MjBnSVVSS1NOa0o2S0JDeituMGRLZnh6M1dDdmxZb2J0ZUNhZHpqY1Vy?=
 =?utf-8?B?MWtMNWVaZnpNaTZnRGN2QVRBOTV5V1JUYWxtTlpLVi9kQnFSTnF3b0VieVJB?=
 =?utf-8?B?Vng5S2V5UURYcHRPVzlIODhuaHN5eHBQeTh3N2hEdGxXaW5TNHA4cy9PakpY?=
 =?utf-8?B?SGpSWEVMMlVZOEprM1A0eDRld1dTdUNtaWwvN3Z3NzdvTExMZEpUNGhjY09G?=
 =?utf-8?B?MnBhWklYVUU2Q3NQRDk1dzJ3TlNwK0dKVjhRcFloTEdoM1U0V0dhMEUwTnpR?=
 =?utf-8?B?VjNFOTYrU01kbzUwV09iaTZzOHQ1MWlkcWRYUDFMNkw1bE56dGZXRldxaU9r?=
 =?utf-8?B?T0FtSzgvZS9uY0ZuTFJDcXN2SHM2cXJrdFNOMGNSbnBlbFV2MjZ3blhIRGk0?=
 =?utf-8?B?WmREYjlQcjAzYmFRZC9kWVhoVktZdmxzT1JNTndScE9EU2tTSkhTMXRrYXFv?=
 =?utf-8?B?dzU2dUdQWEoxWkNvV2o1clhiL0djaG9yVnpQcmFaVWtRcXpkZTljeGlURUNY?=
 =?utf-8?B?THNwaEM1Y2dNc055UFZ2d0FYZnlOam9lWTFmdnl2SWV0bXVWSUFNdnU4Q1RV?=
 =?utf-8?B?ZklXWFcxckR5K3Uwb3AvVnBlR3NCZWhCNkx3TWZwTm56REl4NUptU083R2Zm?=
 =?utf-8?B?UndYaGppOXJyOWg3UU5GdEpNeUFYMCtvQzQ2b3RMdTZNa1grUU5RNm5LcVVL?=
 =?utf-8?B?RFBnTWZOY0Z1ZjJCUlIvOCtZUXY0NGVYM2NxSjl5cUx6RDdwOUV6S2xuNGVi?=
 =?utf-8?B?Mm5BbDZVc0FpSUdRdTFZS3VyR2JMcjVTOXpYd0hKaEN5RkEyN0ZUZVlFMG0z?=
 =?utf-8?B?U1ZEQXh0dFlCL0hUbEZ1aDdMYlllRGZ5V3VQVElZNFcvYmt6bEFIUllpTjlK?=
 =?utf-8?B?ak5raldCcmxBY3FBWkoxR3l3d0dwVG5qeHNTd21WTitFRmZOYUJEV01nTUZ3?=
 =?utf-8?B?RVFRM1NZUVNoWWlKenBGT1VjdWJvQnZCMWFyV1BUQzE4ZGdPM1k5c3g2OHlN?=
 =?utf-8?B?b3RIbmFWeUdiNC9ubGRVTEo0OUo2anV3Vmpib1ZwVUNoN2VVbjRhaFJDaGlD?=
 =?utf-8?B?VkpibTU3ek81Z3NuNkpyWWp6bHE3Vi9sVWtvUlRmSVdacnJ5eFBrMUVLclVW?=
 =?utf-8?B?TlVWQzdheVlrd0FETWlxWTlVZDZsOG9peTJlYlcvNWZYSkZkZXJvQUh3c2tM?=
 =?utf-8?Q?9a1k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abec547b-d2e0-4c16-b53a-08dcd0c994d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 12:18:58.6178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O7IfyrkEUcIBCD6X3U8n7jngSNZcZU1UyAGQpNmYgtfSUapOQNwGPLmZUoor0Xe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
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

Am 09.09.24 um 14:13 schrieb Philipp Stanner:
> On Mon, 2024-09-09 at 13:29 +0200, Christian König wrote:
>> Am 09.09.24 um 11:44 schrieb Philipp Stanner:
>>> On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Without the locking amdgpu currently can race
>>>> amdgpu_ctx_set_entity_priority() and drm_sched_job_arm(),
>>> I would explicitly say "amdgpu's amdgpu_ctx_set_entity_priority()
>>> races
>>> through drm_sched_entity_modify_sched() with drm_sched_job_arm()".
>>>
>>> The actual issue then seems to be drm_sched_job_arm() calling
>>> drm_sched_entity_select_rq(). I would mention that, too.
>>>
>>>
>>>> leading to the
>>>> latter accesing potentially inconsitent entity->sched_list and
>>>> entity->num_sched_list pair.
>>>>
>>>> The comment on drm_sched_entity_modify_sched() however says:
>>>>
>>>> """
>>>>    * Note that this must be called under the same common lock for
>>>> @entity as
>>>>    * drm_sched_job_arm() and drm_sched_entity_push_job(), or the
>>>> driver
>>>> needs to
>>>>    * guarantee through some other means that this is never called
>>>> while
>>>> new jobs
>>>>    * can be pushed to @entity.
>>>> """
>>>>
>>>> It is unclear if that is referring to this race or something
>>>> else.
>>> That comment is indeed a bit awkward. Both
>>> drm_sched_entity_push_job()
>>> and drm_sched_job_arm() take rq_lock. But
>>> drm_sched_entity_modify_sched() doesn't.
>>>
>>> The comment was written in 981b04d968561. Interestingly, in
>>> drm_sched_entity_push_job(), this "common lock" is mentioned with
>>> the
>>> soft requirement word "should" and apparently is more about keeping
>>> sequence numbers in order when inserting.
>>>
>>> I tend to think that the issue discovered by you is unrelated to
>>> that
>>> comment. But if no one can make sense of the comment, should it
>>> maybe
>>> be removed? Confusing comment is arguably worse than no comment
>> Agree, we probably mixed up in 981b04d968561 that submission needs a
>> common lock and that rq/priority needs to be protected by the
>> rq_lock.
>>
>> There is also the big FIXME in the drm_sched_entity documentation
>> pointing out that this is most likely not implemented correctly.
>>
>> I suggest to move the rq, priority and rq_lock fields together in the
>> drm_sched_entity structure and document that rq_lock is protecting
>> the two.
> That could also be a great opportunity for improving the lock naming:

Well that comment made me laugh because I point out the same when the 
scheduler came out ~8years ago and nobody cared about it since then.

But yeah completely agree :)

Christian.

>
> void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
> {
> 	/*
> 	 * Both locks need to be grabbed, one to protect from entity->rq change
> 	 * for entity from within concurrent drm_sched_entity_select_rq and the
> 	 * other to update the rb tree structure.
> 	 */
> 	spin_lock(&entity->rq_lock);
> 	spin_lock(&entity->rq->lock);
>
> [...]
>
>
> P.
>
>
>> Then audit the code if all users of rq and priority actually hold the
>> correct locks while reading and writing them.
>>
>> Regards,
>> Christian.
>>
>>> P.
>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Fixes: b37aced31eb0 ("drm/scheduler: implement a function to
>>>> modify
>>>> sched list")
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: <stable@vger.kernel.org> # v5.7+
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 58c8161289fe..ae8be30472cd 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -133,8 +133,10 @@ void drm_sched_entity_modify_sched(struct
>>>> drm_sched_entity *entity,
>>>>    {
>>>>    	WARN_ON(!num_sched_list || !sched_list);
>>>>    
>>>> +	spin_lock(&entity->rq_lock);
>>>>    	entity->sched_list = sched_list;
>>>>    	entity->num_sched_list = num_sched_list;
>>>> +	spin_unlock(&entity->rq_lock);
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_entity_modify_sched);
>>>>    

