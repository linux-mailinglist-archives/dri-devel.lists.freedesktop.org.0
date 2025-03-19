Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E160A68E7F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9BE10E50D;
	Wed, 19 Mar 2025 14:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gbz1BsMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CED710E50B;
 Wed, 19 Mar 2025 14:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fb9qp1MghgvuDeigPkahif1aP4U8TLZBUnt9VN6qO5/7jelnjrIOvazUKPE8BFFljSBkHkFG+GEa1ksn1Ot0MVFjzMgweU//s/j23OtCWZwjU+DPw6BUzZHa4Ym/0amSZXP0966I4a71mH5vawHETtlz3deEvaQ0cC2oInFIboNIN3qbXRVeaQl02ct5pdDkD8GrDhgR2xqk3qfyEwwCc5uPaAFxoNKZ9dlmw7Hb/MzC0M2NjjjMgOppwOYgZ9hXgtDktQUSiJdL8C+x8pu7CJYSfklvS84tcVPkoKUfHimse95SamiWi6Ae9FUI1RURE14pVdj6x4ntdphcgNS4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zzHqYQeUOx6qXp9WQj6aBMvRbv+UUGUmv1HvS3oC50=;
 b=sdunjY1RJyTi6ivS0BFnBfkxKnXZCSKNixNxbryO7rqpqNCCIGqKr0E4a+fQTv0mIJOBMdlXN2nNQFYAJDwRJfHqqCdJtmXDPWPV8AzZtat9dUQw4sl2edUOQ2pj+vX/ztZC+Fa8sZflWx1FJnBPfK5B9tXMtWEO1JN4R2ZA+gvDgZ1UttFoQlyKl8c5FlL4oFsvBjwVDEMGYOShdfmAPmEI/nM5DeQabkCk5EZXl2m59HQOjMFBzr7DHpgrV2U2s5dxftJ/4Tp8zL3NdWAm81zBbjdIRWXf3TzkaQ74YqnghkU5KUteGSDFQk1oqhPrOsBUfoJCd7mv2Jyhg71pYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zzHqYQeUOx6qXp9WQj6aBMvRbv+UUGUmv1HvS3oC50=;
 b=Gbz1BsMGyTz9Uc2vVShvt5OyXHJoTLkCdUvzPPghv2FkUG5sy5BW6fA+8c7OdR9lbXlXzsfi+6KrMsu9um8RCHdhTMGxBqDX0UyHWUJcn2ahgeIidT2/02XXvoj7nRFbSSK3uobhzqJv3UMhNyl87Nyr+ZK+i3lNzCcSjk4jm+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9239.namprd12.prod.outlook.com (2603:10b6:a03:55e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 14:06:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 14:06:57 +0000
Message-ID: <1f4a534f-8883-4793-b191-60c2773f6217@amd.com>
Date: Wed, 19 Mar 2025 15:06:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: prime: fix ttm_bo_delayed_delete oops
To: Danilo Krummrich <dakr@kernel.org>,
 Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: nouveau@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lyude@redhat.com, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <Z9GHj-edWJmyzpdY@debian.local>
 <00e4d9c4-ecfc-4784-b603-12db04cda806@amd.com>
 <Z9q-ggKKgTsvW-Rz@debian.local> <Z9rA0G2urlVHFOSx@cassiopeiae>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z9rA0G2urlVHFOSx@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0439.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: 30099a12-c0d2-410e-46cd-08dd66ef4f9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVRCaTdQTko0YnZqYmxQeE9uOS9wWUUyLzFVaHp5Wi9Sbml6MXdLTzBWNDBy?=
 =?utf-8?B?U2RVTlF4dExYL1E2ckh2WG83QTRhUWE0dWRTK1I3RTFwcDFqMVQwQVM0OWFt?=
 =?utf-8?B?eUU3UzJVZ3AvTnhBdjNuZzgrQnhMeEYwNko4RS9KbnlENjcwbUludEJCQm1X?=
 =?utf-8?B?Y01CZE40MGxpc295MzZubUpyMCtmaVJMV0gyWWo1WHk5MW53Q1hQZUp1UGRK?=
 =?utf-8?B?ejk5WVh3LzZIU3pzN0dNWkQzVG1oMXZneTJWSlBKNzR3SDVtWGV3MlVnYlVZ?=
 =?utf-8?B?THc1RHpNaGdmWjR6REV3czZxdjU2dGQxYkdtc2F4bHJKSGREV25lT3hBKzZQ?=
 =?utf-8?B?WHpxQit5Z01hbG9jejVNM2F0a3ZMeGVleXY5VUJnUm95Q1JXODNhRW5ZTHNm?=
 =?utf-8?B?VElxdHA5NE1ZanhQSitlUEpyakZSNkM0U0pPTGJzOG84QzNFbVFoVFNTcEYr?=
 =?utf-8?B?VGRTT1l5Nm1UMjd6Y0NJN0IxSVB4NjQvTFFWcElvYVppMGhpcEpIVXN1UGZQ?=
 =?utf-8?B?dmh6WndVVEwydnJaZ3IzSE9wMDB1aVZiblR4Q1pGNDVobnduN2JVRUZYZTUr?=
 =?utf-8?B?dHpJUUZqUXhUNXBMUjAxTzIwUGc0eEwrWERpUU5TUFRXWG5pQ1gzTlFEaFdm?=
 =?utf-8?B?VWNNa09hU1p3QzBxYWxUa0dzWDE1Rk91alh5MGdrUTJ3M3dwQ1AxMU94SmxV?=
 =?utf-8?B?eFlJQlhzaG1FWnpCK3cwR2d2bzlwRlFaUjBZS1NNNU9IejRHMzJpMFFxa3k4?=
 =?utf-8?B?RVZ0MDVpd3Z3U3EraldQNlNGd0dDN2JvWGI0ZDZOTHM3cG9FVFJLckg4U1ZT?=
 =?utf-8?B?STAxTHA1VWR4TWdHSXFNVkZqYXZNU1R3dWUyWUNMdXJuYStXYldYUTI1VWlq?=
 =?utf-8?B?V29TT0JKNVhvdDY5eW5rRWkrS0tGMDNRYjVUTzZtczl3ZEZtNGswQjY5YWFR?=
 =?utf-8?B?alhtZnBMT1dzNDdXZ09mVDZEZGdWczlXMkl4ZWtCdGlMazA4bzgwdDAyWTJ0?=
 =?utf-8?B?N0ZVWmwxK0NQSElUTFZhZGRMdzF4TDBsVmNzMjBkc003T3FOdFVFZ2dVeFFl?=
 =?utf-8?B?TUNjVUJoQTRibVBFZWJoSUdzNk5hOGNJREFGNHVLdGl6WUxiTUNBK3VKU2R6?=
 =?utf-8?B?Mmk1ai9XVkt1NFRGRmsxTGlsRnk2WlBNVHdpUStEUkNLUHJqU2FaSmJ6Z3Q2?=
 =?utf-8?B?dlhRbzJwditjZ2ZUUGdoZThXUC83TzNXTHFhVS9BTnFiUFJwc2JENm5YZTB0?=
 =?utf-8?B?YlJEaTlLOGlibVRmVFZ3b0Z1Ty9Tam12ckpoV3A1U2lDZkNGb1E0Y2daTGhs?=
 =?utf-8?B?YzJCYWRkSTc1V3NPZFQ3VzNjc1pQYzIxbHFJSEcrTHFYTjlQeDJwUDVkOStT?=
 =?utf-8?B?L3YyT05jU2lnbzFIRVJUZzdaRG92c0hibU9keklmVlRkbldhYmZNaXcrOVdo?=
 =?utf-8?B?dE5QRzBibTk0ZExJTGR1NHl2bW9LTEUrT1B2QTBua0oxQzFIbk9na2NMb041?=
 =?utf-8?B?aTVJN3luZVlIa1A1YlZ6SmovNXlaSWpnWC9YMG9TTVNUS2hGQVRXSnRZQjFl?=
 =?utf-8?B?M1RrUkZjRzJ5MFpuVXM2K3RsMkJGeGJNdmhqY2RsS09UQnBYSEJkOFdTUWt3?=
 =?utf-8?B?RmRCZDBYeXZ1aG1peUJJODdvMXRqNVNFTDd2ck1zSEtvcVh0VUlGcGRNaFNP?=
 =?utf-8?B?a2NOcDNsaFVlOXhlVU9hS29BUkZzeUd2Tmh3YTFHZloxSnpWWFJnUEp1bHgr?=
 =?utf-8?B?d0M0YkdVWnlGMWJ0OVBqSUlyOHFxSVhDa3ZJTXlyTmdlK3VkVVBHaGhpYjZH?=
 =?utf-8?B?ajdjRkpmVlU3SE82MDI4QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzRhTGt5ZS9Rb1loRThjd3VSTVduWjZtVUJEQStpN0haSVBucllGK1VOZkNX?=
 =?utf-8?B?NWdWU1Bhd0IzeStLOGVwU1lGalNjUG1nZkxKZVFPNEFWRTlHaEdaWEU1b1FW?=
 =?utf-8?B?RGQ0M2FwdGI3S0lMOVVOVzJGL0pxNHM5RDJWQklydXJFanNOV2U4WFhLektF?=
 =?utf-8?B?WERBK2MwT1pjT0lBOEt6ZlV0Mk5KY1kyODdHcWEwUDRTSER1bnlBWEx4Ungr?=
 =?utf-8?B?SE1yWG9IUFhnUWlaVHVENFlaMjcwcXVlc3hwZ05VRFF4cGN0UFFpMFJuU0dG?=
 =?utf-8?B?cGhWT0k1aDF5U0VZaDNpUnI0aGZvdnJoMlBGaVc1R25Fd3VoRXg5V2tIQVdr?=
 =?utf-8?B?TWx2YUV0TlNzT3hZakM0ZVgzbmhQcnd4ekJSaDBwOGptL3RRN3IxeUFCMCtY?=
 =?utf-8?B?b3BMYWU3VjN5SE84RG5KeUk2eFBLYlJCa3B6Vncyb2VLblVuMmNUUDZMYk44?=
 =?utf-8?B?ZDR2US9LNC9zSlZ1SnRGeHZTQ0ZURzFCVWFaUU9KS09HME9STVJJVUVVendE?=
 =?utf-8?B?Y0pQcHpUQ1RKdHVCaDYvbnFJV0ZBd1AwRDJWanBmOUNwSFoxZGVCUGFYWmw4?=
 =?utf-8?B?YURnN1pZNmdzOFdLMHVmQi9DRHpzQ0Z3dGs2UlhvMXkzNW04a2ZVMXhJUEJK?=
 =?utf-8?B?RGs5YVgvb20xakxMTUlIMmFUOHpwRUVYNlJsSEVEM0xvQ3ZsT2VtVllKNERP?=
 =?utf-8?B?MTVzTGlSMy9nSTYweTE5UkgvRHFVcnF5ZW4xVHd6alE4TDhGQWtGb0gvdkpn?=
 =?utf-8?B?bVg0d0tVWGNJa0YraEU1TkV1UmZxb3c2eGVXVUt5T1RoYkZmcU9XQ0FncndC?=
 =?utf-8?B?MGdObkxlL2VSanZNRXlxalhBNWd2RUpjQ3M4Znc1YlFXc1M3VEt0RE1FLzJW?=
 =?utf-8?B?WXllRHFLWlh5M2c0azBxa3ZONFZKOHB2dGJYUEFQN0diY1J5OXVFY3NmWUpm?=
 =?utf-8?B?TTZNc2JIeGxrVlN1Nk9PVlA5c3dyYk9ZU2E1dElJT0pSci9ncFVJVytTVi9m?=
 =?utf-8?B?YTVzaVZXMTdIR293enhNallzTUhhYmd3dm05MERFajBZckVQRXdOTGRpcTVQ?=
 =?utf-8?B?VXNiYnU1RmRFZkgvZ21qV3Z1WDFRcHlwcldnUnRheEhjUUZmSnZOQ09sZUhh?=
 =?utf-8?B?c3FyOXA4TzJmVDFuM2lFcXJNR3FDVGJhVDVidHoyYmYxSEVieUxpbGN0d1hF?=
 =?utf-8?B?OUsybiswR3FveFVoUEFHN1Vwa2JxVDIzL3EvZXBWYmVuZEtNNG92QzcrN1ly?=
 =?utf-8?B?Ry95VUV3ZmowVURLaEFXQXU0dHBibVI3b1o0Z2dMdk5mOFd6MloyL2d0Uzhr?=
 =?utf-8?B?RjJkWWlLM1lnWEwva252WHAreW12L244R0NrbklHaU1ua2FDSXlmUnhaeDRU?=
 =?utf-8?B?Ti9iSTc4SkxkZG5nTitpSEkzNWlaT1BOcTRhQnZMQ0dsZjFIbS9iVlBHckty?=
 =?utf-8?B?QmJkT0JBUXY3cVpSaHlCZWI4MEYxSTJKRnIrNUdQejNsTkJ2TUZXNzZmZm9T?=
 =?utf-8?B?aU5wOW1BYWpGWnJ1LzJjeHpGaXlUa3BmcldCTDVrVXJYdU1LVTMrV3R3RDVD?=
 =?utf-8?B?V3huK0huMGVsUk83eGhHM3hVYkl3NUxkb0RMQmoyQU82QXRMOFdMMi9wb1B0?=
 =?utf-8?B?VVplbytZbHhhT3V3VEs4QVVZRmg2Z1pKWW84Q1RuM3hzd1dhNUY3NGtrZDRh?=
 =?utf-8?B?NjZzR3E4ck81d1FQeWt1aGU3QUo2VmpURG1kaEM1TENpZWsvV3plNGZnbXNy?=
 =?utf-8?B?N1hmWDJsNFIwK09OZHpzVzNIcFprd1BKUjNzSGxqZFZGM1BIbWh2ZEFWQnRl?=
 =?utf-8?B?MzgzWFpoRWZFZnAveTVNNU9SZUowdHk2M2JsaGJyeFFiOVpBL1NwdkljU2Y3?=
 =?utf-8?B?VDBtWjVIditWVW0yZmcrVUt3dDE3ZTlxOFczRlBDNFRTRXBwV0U2aFl2eTFL?=
 =?utf-8?B?UUhxVi9XV1JPZWs0cEtQRmt3dzlUM0JUaldmQ2JQU1BDWENqTnk4U2pxcFVI?=
 =?utf-8?B?dC83RlhURU1ibHhBV2Z1RForQnNia2ZZSWJQZFpYdENYVnQ5UVIxNGZYMUl5?=
 =?utf-8?B?NDhOa3F0RUY2T2NJbHJlbWN4bG5ZVUxCRjB6OVJxck1kYTl6UXRiM280OGRv?=
 =?utf-8?Q?COmyyLEb/OA3Ea6QNbRiWhQLk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30099a12-c0d2-410e-46cd-08dd66ef4f9d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 14:06:57.7038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARjxzkX1OibnZ8GvfjhAKIoapaq9B6BcYk6Yvhr1sVa9P9oitEqN6cyv5VrLWaPW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9239
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

Am 19.03.25 um 14:04 schrieb Danilo Krummrich:
> Hi Chris,
>
> Thanks for the fix, few comments below.
>
> On Wed, Mar 19, 2025 at 12:54:26PM +0000, Chris Bainbridge wrote:
>> Fix an oops in ttm_bo_delayed_delete which results from dererencing a
>> dangling pointer:
>>
>> Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b7b: 0000 [#1] PREEMPT SMP
>> CPU: 4 UID: 0 PID: 1082 Comm: kworker/u65:2 Not tainted 6.14.0-rc4-00267-g505460b44513-dirty #216
>> Hardware name: LENOVO 82N6/LNVNB161216, BIOS GKCN65WW 01/16/2024
>> Workqueue: ttm ttm_bo_delayed_delete [ttm]
>> RIP: 0010:dma_resv_iter_first_unlocked+0x55/0x290
>> Code: 31 f6 48 c7 c7 00 2b fa aa e8 97 bd 52 ff e8 a2 c1 53 00 5a 85 c0 74 48 e9 88 01 00 00 4c 89 63 20 4d 85 e4 0f 84 30 01 00 00 <41> 8b 44 24 10 c6 43 2c 01 48 89 df 89 43 28 e8 97 fd ff ff 4c 8b
>> RSP: 0018:ffffbf9383473d60 EFLAGS: 00010202
>> RAX: 0000000000000001 RBX: ffffbf9383473d88 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> RBP: ffffbf9383473d78 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: 6b6b6b6b6b6b6b6b
>> R13: ffffa003bbf78580 R14: ffffa003a6728040 R15: 00000000000383cc
>> FS:  0000000000000000(0000) GS:ffffa00991c00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 0000758348024dd0 CR3: 000000012c259000 CR4: 0000000000f50ef0
>> PKRU: 55555554
>> Call Trace:
>>  <TASK>
>>  ? __die_body.cold+0x19/0x26
>>  ? die_addr+0x3d/0x70
>>  ? exc_general_protection+0x159/0x460
>>  ? asm_exc_general_protection+0x27/0x30
>>  ? dma_resv_iter_first_unlocked+0x55/0x290
>>  dma_resv_wait_timeout+0x56/0x100
>>  ttm_bo_delayed_delete+0x69/0xb0 [ttm]
>>  process_one_work+0x217/0x5c0
>>  worker_thread+0x1c8/0x3d0
>>  ? apply_wqattrs_cleanup.part.0+0xc0/0xc0
>>  kthread+0x10b/0x240
>>  ? kthreads_online_cpu+0x140/0x140
>>  ret_from_fork+0x40/0x70
>>  ? kthreads_online_cpu+0x140/0x140
>>  ret_from_fork_asm+0x11/0x20
>>  </TASK>
>>
>> The cause of this is:
>>
>> - drm_prime_gem_destroy calls dma_buf_put(dma_buf) which releases the
>>   reference to the shared dma_buf. The reference count is 0, so the
>>   dma_buf is destroyed, which in turn decrements the corresponding
>>   amdgpu_bo reference count to 0, and the amdgpu_bo is destroyed -
>>   calling drm_gem_object_release then dma_resv_fini (which destroys the
>>   reservation object), then finally freeing the amdgpu_bo.
>>
>> - nouveau_bo obj->bo.base.resv is now a dangling pointer to the memory
>>   formerly allocated to the amdgpu_bo.
>>
>> - nouveau_gem_object_del calls ttm_bo_put(&nvbo->bo) which calls
>>   ttm_bo_release, which schedules ttm_bo_delayed_delete.
>>
>> - ttm_bo_delayed_delete runs and dereferences the dangling resv pointer,
>>   resulting in a general protection fault.
>>
>> Fix this by moving the drm_prime_gem_destroy call from
>> nouveau_gem_object_del to nouveau_bo_del_ttm. This ensures that it will
>> be run after ttm_bo_delayed_delete.
>>
>> Signed-off-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>> Co-Developed-by: Christian König <christian.koenig@amd.com>
> Then also Christian's SoB is required.

I only pointed out which two lines in nouveau need to move to fix this.

All the credit to figuring out what's wrong go to Chris, but feel free to add my SoB if required.

>
>> Fixes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
> This is a bug report from amdgpu, but I understand that the same issue applies
> for nouveau.

The crash in amdgpu was caused by nouveau incorrectly dropping a DMA-buf reference while it was still needed.

Took us a while to figure that out, we could update the tags in the bug report but I think at this point it's unnecessary.

>
> If at all, this needs to be
>
> 	Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3937
>
> Maybe you can add a brief comment that this report applies for nouveau as well.
>
> Please also add a Fixes: tag that indicates the commit in nouveau that
> introduced the problem and Cc stable.

As far as I can see it was always there and was added >10years ago with the very first DMA-buf support.

But adding CC stable is a really good idea.

Thanks,
Christian.

>
>> ---
>>  drivers/gpu/drm/drm_prime.c           | 8 ++++++--
>>  drivers/gpu/drm/nouveau/nouveau_bo.c  | 3 +++
>>  drivers/gpu/drm/nouveau/nouveau_gem.c | 3 ---
>>  3 files changed, 9 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 32a8781cfd67..452d5c7cd292 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -929,7 +929,9 @@ EXPORT_SYMBOL(drm_gem_prime_export);
>>   * &drm_driver.gem_prime_import_sg_table internally.
>>   *
>>   * Drivers must arrange to call drm_prime_gem_destroy() from their
>> - * &drm_gem_object_funcs.free hook when using this function.
>> + * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
>> + * hook when using this function, to avoid the dma_buf being freed while the
>> + * ttm_buffer_object can still dereference it.
>>   */
>>  struct drm_gem_object *drm_gem_prime_import_dev(struct drm_device *dev,
>>  					    struct dma_buf *dma_buf,
>> @@ -999,7 +1001,9 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>>   * implementation in drm_gem_prime_fd_to_handle().
>>   *
>>   * Drivers must arrange to call drm_prime_gem_destroy() from their
>> - * &drm_gem_object_funcs.free hook when using this function.
>> + * &drm_gem_object_funcs.free hook or &ttm_buffer_object.destroy
>> + * hook when using this function, to avoid the dma_buf being freed while the
>> + * ttm_buffer_object can still dereference it.
>>   */
>>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>>  					    struct dma_buf *dma_buf)
> Please send a separate commit for the changes in drm_prime.c.
>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> index db961eade225..2016c1e7242f 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>> @@ -144,6 +144,9 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
>>  	nouveau_bo_del_io_reserve_lru(bo);
>>  	nv10_bo_put_tile_region(dev, nvbo->tile, NULL);
>>  
>> +	if (bo->base.import_attach)
>> +		drm_prime_gem_destroy(&bo->base, bo->sg);
>> +
>>  	/*
>>  	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
>>  	 * initialized, so don't attempt to release it.
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> index 9ae2cee1c7c5..67e3c99de73a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>> @@ -87,9 +87,6 @@ nouveau_gem_object_del(struct drm_gem_object *gem)
>>  		return;
>>  	}
>>  
>> -	if (gem->import_attach)
>> -		drm_prime_gem_destroy(gem, nvbo->bo.sg);
>> -
>>  	ttm_bo_put(&nvbo->bo);
>>  
>>  	pm_runtime_mark_last_busy(dev);
>> -- 
>> 2.47.2
>>

