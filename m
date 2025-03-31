Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64035A76B98
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F85F10E454;
	Mon, 31 Mar 2025 16:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A0oCljZL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95F310E465;
 Mon, 31 Mar 2025 16:06:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9DKgU+mN0bpMqGZdSOZKUan5GF0BZAtYcRkcBcWHc7u1Z4VckjDPbordWwEOm+FBMfgmenoS7dmCShWU8zitwAYYCZVplgPYPqrrSGPrC9+rW+LhMLOs4oSthf4V3ib2y7xWBb1BW4dQPfY9nmvzPG9yQ6bPzOVYg0qR2MuL2c3kBMcUBpLGg9F7dkSv4X18d2tplZoRY5MulwzmXu1GxBy1aUDG9QmnDl45RFDBwyPcJDUy2RgfXEwoDk193yBJeOhBG2GNTp1KRdEACQ86fAFdBrt/Q42mo+j5muNZshN21C6rlNVxYqw8vaxCnF0KwW6OFvkWiDuJeVHnk64CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB/RB2kJW/S9kFxCVmNvkVBcjpIoZ01bLkhgrzCweQ8=;
 b=md5AgdNl7kaOH6PxYIDxhf3+rduRwJo7kUKgXnpLjiMsBbdsW+d9NFDsqhniJwdwjCKAka64S77IsWp8GBH/gB3tTbyXek3weWohahU23lvT0Kpdxri3bRINOlhOqrSQy+90cUX9fN8yiqbKwtPRg6lgM8ApiivszCvSnzd/beLoCypx5kfODpzD2IAAkX9IlhLXLtLmIvMjSVip+vefe/fhbQBp2nL73z6FGUREc1A7VaUq/GPAUaoItwxRAC1a5+rHe0mvIsN21W3q6iLJBISw5OSLO+LKVcywQzgfsHHBwXF5ePRdGHLD4x4qGqaYBtDPXVXvHyKUwZNp8sngpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB/RB2kJW/S9kFxCVmNvkVBcjpIoZ01bLkhgrzCweQ8=;
 b=A0oCljZLE+tmtNYqjgXr7KPwXu1zhYr1wydLE4aGMOqlJU4R8xTs+rL8vwB9q4VyFaotcmHJtxzNKKuLDt2A+GV3qUgN7V3c4ite9yOh7a/REPbniBEggIrS3W5WemC0O/06qc0as7j6Aia2+8E3RdpQaAvli0R5Z7vWFDVsh5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Mon, 31 Mar
 2025 16:06:39 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:06:39 +0000
Message-ID: <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
Date: Mon, 31 Mar 2025 10:06:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 24/43] drm/amd/display: Skip color pipeline
 initialization for cursor plane
To: Shengyu Qu <wiagn233@outlook.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 uma.shankar@intel.com, quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, marcan@marcan.st, Liviu.Dudau@arm.com,
 sashamcintosh@google.com, chaitanya.kumar.borah@intel.com,
 louis.chauvet@bootlin.com
References: <20250326234748.2982010-1-alex.hung@amd.com>
 <20250326234748.2982010-25-alex.hung@amd.com>
 <TYCPR01MB8437BA1D5FFC25AE63F731D198A22@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <0add5ab1-0717-42a8-8994-a381b635040b@amd.com>
 <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB8437ADBCD38143B223E9384A98AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0228.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5f3ada-832f-4214-cee3-08dd706e0519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzZHOEtkaEdUOGdMSDNPVmV3M2NCelIyV3NKU2o3OXIwdU15Ty9Zay9MSmVE?=
 =?utf-8?B?eVVsUVlpaWVMdllLUnBEcmJnV1NWMW0vVnZLTHBaampMM0VUZ2ljZ3Q3S0Q4?=
 =?utf-8?B?eHpueWhBRDdkcFkrZGFhZDlQMThGdXRQdEc4Z0lrZk1peXVwaDJXdnBRdmwz?=
 =?utf-8?B?MFY1UWhub0Y5WUt6MXFSWGdjMDQrSDBoNktXbGtrR3gydHNtRnRaY09FUU9u?=
 =?utf-8?B?WjJUb2pMQm5UdjVkandjanFudmpSSkZrRllLVnkwNWVUVi8xRWhDcUVRZDhE?=
 =?utf-8?B?aHk4VWFhQzZOVWtBTmx4ZnVWVGdDWHpKeS9TTWFoMDJkdTVINkFNRUJxbEFW?=
 =?utf-8?B?SDdQOFl6TEM2cUZ2aEp6QWRtTklJUDJ1WnI4UjZMa1NNY1U0Qk9MK3FlK09m?=
 =?utf-8?B?TldEMndDTFpPUWo2S0Z1QjJ1N25BN2dBbjRsUFFxQjZwazNjbE1VY3RBRld0?=
 =?utf-8?B?c25xUk15d0dndTNhMlRaOG5lM2JzR2loK2RMOWc1RjNXVXZzN0dScTdYNWVZ?=
 =?utf-8?B?cWtsN3VTQUVVTHBMeGRUU1NiZEMzNWRxayttZk1pYUxDaWR3MVovMGZGOXFa?=
 =?utf-8?B?d3ZobmQ4ZDJ3ejVTM2ZmcFo3eDdGT29FM0ZuTXE2enBQY1h2UlZqWjE3YW93?=
 =?utf-8?B?YW1hTHhCL0dyRnhtUWEvOVlmTE5kL2JRK25DODFmMXlyRDJDYVVJZ2N6SWpy?=
 =?utf-8?B?a2lqRGJPK0Zod1V4VnYvdzJpQlFQbE4zUkUwN1FDR2JzRGxqR2IrcnNCT3Y4?=
 =?utf-8?B?VnhYZDJXdm1uWGNKQmxUc0pYb2NSNWZydVp5QmVPQ2FMRUZzdzNsUERLZUIv?=
 =?utf-8?B?MDAxR2FDbUJHeVBFaHZ6WTZ1WHRyQUxUK0VZZDNlRkxqVzl1ZTlEbHpYRGZP?=
 =?utf-8?B?WmFUMWNJNHNzYlh1UkVpbFg4UGpRK0tIeElPMDhNWURFTGVXaGFoMUtYTm14?=
 =?utf-8?B?bmxpS3cxbEs4WVMxZy9jT2lFSmcwbGtxN2tTZWtQOGZ4VXVpL0pLK0pvTFFM?=
 =?utf-8?B?WTZjSWc5VXRmL1VwaGQycTcvSllGUmxTYW5tNG55Tm5XVkdFaGZJOGZ6WnEw?=
 =?utf-8?B?d0VOdFpUbmR1Y1hQUk5VVHFMa0daRzhnaWpQaWorYzZ6MVJmMVIvSXFnNWRm?=
 =?utf-8?B?QnZuMFhsbkxsaVA1NERyR2ZlWThJNTA1RGtkaWd5aGllZExxQlVBalg1cnJ6?=
 =?utf-8?B?MTNmQ2lyOEpVOVlXWjFuUlFSNWp3WkxYZzAwMGJPeTJvaXYwdksxbDhMK0cw?=
 =?utf-8?B?M2taU3piWUtWa3FTd0tHZ2ptRzZaZkQvT2tOVFhYWlhMRlFteTRvS1Z4Y3pJ?=
 =?utf-8?B?Q1ZiNUx1dTFIVjZFTkh5c256bmNKbzZYcHRubTZid1YwMmc5d1g2LzE5Q0p3?=
 =?utf-8?B?alRKWm82aHZzK1M2b1gvTDNmcnhRdzdDSWMxakxuQkpsRk5mUWkrM2lQR1hT?=
 =?utf-8?B?RXByM2E1aTJJeEs1ZEg5NXpyVXdSamJQeVgvV0JJNVU2ZjJYNG9ONk02eGdS?=
 =?utf-8?B?V2pUOU0zMVgxbk5ISFpsbEgvU216V1BGRGZDOWhqbFU3OWRUMGlJdmtBa1Jo?=
 =?utf-8?B?RktLMEwrbmJyd3JhcW9zWWUwNVZmVC8yeHFpRjdlVmluanVwOHFaVzZPR3NV?=
 =?utf-8?B?VFJ3L1pxV05OcU5Gc2pwOWI5V29tT2NMeHMydTVWNVlqS3FYYXNRenhiQU1s?=
 =?utf-8?B?TG1DOTB4WHk2UWg4cThCQ0prRGFJVzRhbnZVditFeitDWHpGbGc1aGxOQklT?=
 =?utf-8?Q?mzExN3nR/ko415YOBYCv/ofkDqywx4Cf5Z+9hl7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nmxmci9GZnYyYVlJODlZcVdOeHFyMWt2VXZEdW1qeG5XQlZSc1l1Smhpc29P?=
 =?utf-8?B?SXNKancvSk5lSzRFUExtclYzQW5vYTZOQVpnWVZHUHZsZHlKV0FZZXk3dzE3?=
 =?utf-8?B?aHplM2NqMEJSSmdRSGQyU1lHMUcxb0dRTGlzajloUWY3MHRIY2pUVndBQ3pL?=
 =?utf-8?B?bDh4Vm5KWXJxb1phdHJXT3BRZHF6bGxkUUZCZjA5a1ZSQmh4VmJ0aXc1NmV0?=
 =?utf-8?B?SGIweDUrMmhrTlhPMHJUVGlGZWlIeDRMdTdWS0s4NjFqbmlRK2Jtb29uSE43?=
 =?utf-8?B?MHE4K28zbzV2SEllZkZGYXFjZGRRenJQN3l6L3lwdW5zT2hEUGVXQUdFMU5B?=
 =?utf-8?B?UGlRTXRkT3JNSitDcUt1clNRdXZ2TU5pV3dHVXpUSkcwMDdmNE9RUDBIUUFU?=
 =?utf-8?B?cU9EMmRwTXNwRWpHQmFzeUovR3dRczV3VEdTU1ZyeDZSZWk3UThWWmlWV01I?=
 =?utf-8?B?ZVE5NkhLWkpGMHZaYS9VRkk5TklhSXF3M1FFdHN5U043TklETUtneDlmUW1D?=
 =?utf-8?B?ekJCQlhSVTFZMWh3NFFpVEZ4YmxqR1g5MC9wQUxLeWlLMW84ZTVRQ2NBcVl1?=
 =?utf-8?B?TktyN0lrUUVjeWEwT3RlY1FrL3BoRUVPY2w2em5kOUIrVFQ0Mm9ZemxpTVFQ?=
 =?utf-8?B?ZVluT1pkRjd6YjdxRG43QzZocDdoTXd0SEJuWEJpRmRiTmxxNVV6d1BUTFV4?=
 =?utf-8?B?UjdBWnlEOHVWOXlETVlhWWhkRk5kcUdCMjRkaXR3ZTY4aXA5UWRha0RGcUhS?=
 =?utf-8?B?NFk5d1BnVUtUeVdEK0JiL3VJY0dwUnUrMm1mNnpOUkRYWUFLTll1NURpZjNl?=
 =?utf-8?B?NzdzMElSV1dlcVc5VTdhWEZERjcrOGdxclA1WUFJKzZneEV1NzZwWFppZkkv?=
 =?utf-8?B?TUVVeE8rckRZMStXUWpBNElHRm1GVTVaNDU5WlRocGhrRWxTZHpnTUZSc00z?=
 =?utf-8?B?bU01RExBdnh4bnoxNGI0VDZpSUQwczl0MStqaUJpSkQ1c3N4OG9jbldLclJj?=
 =?utf-8?B?c0RBQTB3ZFdNSngySlZXS3ZJVmE2U0VwWEtidzZ4bGpTNUh6UHlIck5kNTBN?=
 =?utf-8?B?blZJQldxeCszbi9UZEswMlBqeURYb2ExZ0pTdzNJRmoyVGlsZjh6VTJNZEhj?=
 =?utf-8?B?Y1VoTGVheWpscmdKMUFTT1hXSHlTRW83N3c4Z0kxb3RtN012eFlpS2FmbGFa?=
 =?utf-8?B?NzVoU2NVYnR4UUxHSWxGRFBMS1JBQXVJemMxWUJOTVFUZTNVU2Z4RG5IZnNp?=
 =?utf-8?B?aFExcFBhRWpVdTdxNUFmSzhUMDI5eTdFcnFxYnV3dm5yVWtQckxQU3BtR29O?=
 =?utf-8?B?bXBNbHhLZUg0KzBWWlBXQ2NIdXNXZmtQSjU3NG1XOGV1a0hTbXV5Z3VUdmZ4?=
 =?utf-8?B?YXFOL1JadWI2Z3lMVUFxek9aaUYwcm8wRjFrbEYyZ09lTDh1enJkMUVnWm1Y?=
 =?utf-8?B?eFV1cFllYVVqTWlGZCsxUGdRK1ZrVitFTXZ0bk9yOHBiUU1lR0k0K0hGMFBM?=
 =?utf-8?B?em5qTmFPWncyMkRYMFZnWXhhVFJia3hJSE94UndOMFRselFxRXViLy9Mam1K?=
 =?utf-8?B?aUFhZy9ndlA2QnVUVTVFYlE2Nm1YcFJ4cE12QVQ5TzRnL0xTMjIxcXhlQldu?=
 =?utf-8?B?SkJWc3Z2dTQ0c3J5QlRuRXpmNXhHcFdEMTBuV1pCeFhtTG8vN0ozSXZaRHIz?=
 =?utf-8?B?WktIM0N6TEM1TjRTbzN3ZDJVZ2NaSE5RZUVZRHNKUlZVZUxBeVhoOHlOUWtk?=
 =?utf-8?B?VjJOSjc4QW1xM2NzZFBHdS9mMEVmQkxVTkdFM216ZE56QVpoQjFiaWFpS05F?=
 =?utf-8?B?NzJJN1pNYVJid2tLaGp4clRiRlJnVncyMWJNLzU3MXdiK3FxamRBN216aG50?=
 =?utf-8?B?aHFKeEhJcFZDSkM0K1JKZ29rSGhBcjROK0l6bjBqZElpUDY0M3piR3B1NHFB?=
 =?utf-8?B?Y25mZm9jTmVtTjZFM3h5Q1pmdTdZL0Zhekk0c2c5MkFtOFBiM3J6MnlIMytB?=
 =?utf-8?B?VXk4aWtKMkFNTE5tTE8wWTBHTHgvZ01rNkhvNlNUem4rR3lFR2VHbFZDM0Rs?=
 =?utf-8?B?YTNYTlBaK0NlMVNrN1drc1RYZlhCMktxQjlJSkhJQW43N0dqU2N0YzA5Ukw3?=
 =?utf-8?Q?JYPct7iy7OIiBsHOJ/si1GYFR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5f3ada-832f-4214-cee3-08dd706e0519
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:06:39.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MnPWaZliVzH4N7ZZLdjT/TjQI5NtR1ArFrNu7E6MJAiU6aiRNGHUtcSScLpTzxMg9x7ZKxh7iQ0JDyBRWfWbrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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



On 3/31/25 09:43, Shengyu Qu wrote:
> Hi,
> 
> Thanks for reply. So currently we have to apply color conversion on the 
> background plane of the cursor to do some color space conversion. What 
> would happen if cursor and background plane needs different conversion 
> config? Or we just give the cursor a dedicated plane?

This scenario is not supported on AMD hardware, but software cursors on 
other plane types won't be affected.

> 
> Best regards,
> Shengyu
> 
> 在 2025/3/31 22:28, Alex Hung 写道:
>>
>>
>> On 3/30/25 06:59, Shengyu Qu wrote:
>>> Hi,
>>>
>>> Do we really need to disable cursor plane color pipeline support? I 
>>> don't think we need to disable that if it is supported, since there 
>>> might be some user-defined colored cursor icon.
>>
>> This patch applies to AMD hardware only: https://elixir.bootlin.com/ 
>> linux/v6.13/source/Documentation/gpu/amdgpu/display/mpo-overview.rst#L101
>>
>>>
>>> Best regards,
>>> Shengyu
>>>
>>> For some unknown reason, seems my mail is not shown in the mail list 
>>> archive, so I resent it.
>>>
>>> 在 2025/3/27 7:47, Alex Hung 写道:
>>>> cursor plane does not need to have color pipeline.
>>>>
>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>> ---
>>>> v7:
>>>>   - Add a commit messages
>>>>
>>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c 
>>>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> index 9632b8b73e7e..b5b9b0b5da63 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>> @@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
>>>>       struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>>>>       int len = 0;
>>>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR)
>>>> +        return 0;
>>>> +
>>>>       /* Create COLOR_PIPELINE property and attach */
>>>>       drm_plane_create_color_pipeline_property(plane, pipelines, len);
>>>
>>
> 

