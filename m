Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AD4A76BEB
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 18:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BAC710E45B;
	Mon, 31 Mar 2025 16:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SwZgf4Nv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B730B10E458;
 Mon, 31 Mar 2025 16:26:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SbfMyVTuDwV1Q543OHnl6NrxtYTkV+rH6qUZZfDt4wvcMysHlkeGxhxatQlLOUHqqMykuXfA9O2Uu4aztkqNVw9Lg6eih2UdyFCTsim2FSdVJr0PxUObUkgG6bMMHLaJruOd/SJfKIBrgA74SyTQ5RJwONSPiCw1bLdJLYtEP+6RboDoBW+RlLcjqIQTUbnwsXi98MNPY8NUBcvVqXze3VMqawcEEUCqfaGfjnoK7lnVM7ZATxh540d5xIkvscX3/wDR45VKYc6QfvQS5Ukl1NglcR2slF802sA4F+mqhmY7v3JHVmyklO9FXrtynqrVI4bjSFcQ8fKq+yoaZPrY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uqXt6/2N4HPgj6ZCMAJUwQ8cJ3jKFAEgQLOBw+KeHk=;
 b=HytZ6hylZQW//UJwFoPxrqvqQ50EvpOoxUrxlrLAZSPXaScC82tkYU3B957lNbEuvl+3tqnN9avCsDqi8HzzHjYUuvD7x4qEpfEq9cSOsKnhAQHJudzD3DJJ+8QCBjrO6XCX1go/9SFIlIPcJR2rpscbblaF/I+LKpGLWaK812QtlaiMmhM64igj4V17mPXsBgW3TCEwlNnnvNBaqHmqS1DVgxdYS3Dw7EsiobsPGkmCBdTAbDP55q29rw4ohY39XnoeWvQUgFtQvTEU8hR2fsxc0X5DN4FvWZ1MLPygjeOy9AMNKikGQsJKSsuAJ3chmrSFHvoT/UYYsoKdbNEFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3uqXt6/2N4HPgj6ZCMAJUwQ8cJ3jKFAEgQLOBw+KeHk=;
 b=SwZgf4Nvy9RssnGTKoJ5jbl90Lncz9RsK/Kzcnc2DJXIQGYfNhIplqyfhsrc3f5kK8WxNYp4hjKgEP88sSkzDXLg1e73S0rBpobA87HVtjTsMbf3NOW+WCyNJzGO+m8VPLGRPCBxrerepo2Hfxa07jVJjz+6FqMtUvcgjcMiTW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:26:33 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:26:33 +0000
Message-ID: <a6489110-4e76-4977-a0d5-586e3b99ab0e@amd.com>
Date: Mon, 31 Mar 2025 10:26:28 -0600
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
 <9984f8e4-3f24-49d0-a7be-4f746dfbb4cc@amd.com>
 <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <TYCPR01MB8437D229F3DFFA7CA6CA02D198AD2@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXP288CA0028.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::40) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SN7PR12MB7370:EE_
X-MS-Office365-Filtering-Correlation-Id: e476740d-6010-4616-039c-08dd7070cd05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFgzTHpvKzZ6aEttbmVXYVlsdTFqWFR2T0VoeHgwR04yZDVmQ1dmU2hnZEV1?=
 =?utf-8?B?UTYxZ3hYVUcrL3BacG5nQzZNeWdaMTg5Z1phWGllV2htNzdRME8zRksvUnVq?=
 =?utf-8?B?alBpRXlldnR1bE13WGRLYWNWTEYvME1JWVMvWXZtVm4rdnd5cng1NFRMLzZt?=
 =?utf-8?B?b0hPVS9aVmk1Z0dzZVhCN0tLVndRMzkxTzNSM2RSVytJVFp0WXA0bWczblVB?=
 =?utf-8?B?Z3NGaVFSS2tSTDdJRElSaTFYNE85UUQxTk9XaVVUNmI3eUlpRk5lWDMvb1c1?=
 =?utf-8?B?Rm1tUi80UTAzbVNZK3BMcUpXSndLZFZNNlpTSzRCdVJrSGdJQytzNlV3ZThY?=
 =?utf-8?B?N0hGSGdVbzEwNzl3aEZhdzRPK3E5Y1lMeCtUdWlJVEFJZUk1em5HZkxCdEdF?=
 =?utf-8?B?dmtzTTlzSGtnRllQaTFscGYwN0hyb1RTZXgwY2dZTEYvc1ZpdVhqYXFUS0Q3?=
 =?utf-8?B?S0hlbkE2VU82cjd4NjZnS25RT3U5dXo5eHUwL0RhUlRKL1N3QWFHNXkxRCtk?=
 =?utf-8?B?SXVqTzkvN2ZVMGs0YTVxak5HQ0UwZ3AxTUEyKzlvcC9sNGVjWFJpbEV3QlV1?=
 =?utf-8?B?a1lEWDBaRnNKdytEU21KYmwxS2V6SG9VdTlpVkNoSUJ4alNlTTdvOFA3aDFw?=
 =?utf-8?B?cjFyNXAxVjBnaG96cWJlRllBNGFRVzRYc3haQndoRXA4ZzFRVTdRRmVnK3d3?=
 =?utf-8?B?ZUNJaGpidkRsdmlWVXNaUERldTh2c0d3VjIwbHdsdTliV0xWRVBoMzFtNUI4?=
 =?utf-8?B?b3ZxaWZvL2IyUUNUNWRBQVhMREE3NlhXK25yZmlDdGtmZ2VGSUsvb2llRVZr?=
 =?utf-8?B?U1BCdDJrTmVzS25IRDdOb0FoazR2WFJ4WW9QdmlUQUlFcCtxcWJlbGVnWm51?=
 =?utf-8?B?RjErNDdQRjh4YTFScW1weldxdzhXMTZQNTNRckJHTUZqUExPMURuWGhvOE1U?=
 =?utf-8?B?VXNESTlJVGtrZ3lqQTBpdlYxWmJLUG0yZUM2OFJKa2ZCdmFaRnA4bENLMVBi?=
 =?utf-8?B?anZsbCtnV25CV1JuTGNuMnVtakEzeEhZRlp2eVprWGM1bFQrbEJaZFBqeVdD?=
 =?utf-8?B?YzIxcDJCSStkSXNsS1NiR0EwRnV1elpEdkNwT0ExVmdTSE0yRm5VbUx4V0lK?=
 =?utf-8?B?TXF6ZEkxNEExQTB0ZWVHZGZXZlBrV1RXMGtCWFNLZjRBUEJtQmxNSWViYnhy?=
 =?utf-8?B?bUlUbHdUOWhLVXp3R1J3U2h1SmprMEdzWVB2cy9JbVNkR0Y0ZUVGS0l4aXRv?=
 =?utf-8?B?UmZ5UUd4QTVaaUR6RlN1Zk05V2tDVjB0Qm5TYktrUm1ZajcvMHByT2YxVXdX?=
 =?utf-8?B?QmpWQmVLTjhLRHczMkpic003QnloRGxTdGdoUzg0d2RrMk5NMHh6YmswY1dr?=
 =?utf-8?B?b0RKemdiR2NtM0VsRTFLN0JYdDA2elZkQmxBWEZIRHpXbkZCUHZqVGtHYTEv?=
 =?utf-8?B?MWUzTTlvQmJocFV6V2JZSzRkWHNEaWZWTWd2VmdUci9NamNHZXlvVS9sN0JT?=
 =?utf-8?B?d0VEeTRIUGorUzBqTWNWTGEreld0VmRYV3kyejhySEQralZGYVJLOXhaaVBW?=
 =?utf-8?B?R01oeFdpQmhhdlhJNGp6QkoyQXJjb0hlRnd0eXFybW93UGtmODl4OVU4ZG0w?=
 =?utf-8?B?T1BKMzVoSmllcThPN0JoaE5oWXpmaVZ1cngxQlgwWDdIUm10N2lad1VFWEh0?=
 =?utf-8?B?Zmplb2ZQQ2lsYUJKVVpSbFoyQ2xOb3IwOUtDNllNQ2VmWTBrTGVPTGl0Q1h3?=
 =?utf-8?Q?GRGNbypIea5GMB2tl2yJ1KphffJABHhNS4OHovt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDZSeXAxTmt3RklSK2g0WTdYTDZPbklsNkpFRXRFSkV3QlJZUFB3Tkh4ZkR0?=
 =?utf-8?B?WXMyTFZjSWd2VzJVMnZLV2VyUHZiZHZYR1ZobGpNZVl2M3RxUjE5bE9TRDVr?=
 =?utf-8?B?aFBoaVNYMEJMd1FOSFMrZm5BZ0NqZmgrd3BYa0xLUjhYT2ZpK0w3Wm4vYXUw?=
 =?utf-8?B?LzErU3BVRzIwek11OGFyS2NLendvWGpmeTR5S1k4akRKVVVrVGZTVm1TU3A0?=
 =?utf-8?B?UUU1WGVsTGFnbUNYWTlld1FnNG5yQkRjQmZEY3VNeStKRjNvMkJJaXF5YVR3?=
 =?utf-8?B?RkVrZVJhLzFNV0YvOFd3NGd5SWZ6TWQ2N0F6LzVET3FVdzNPNktKc1BXVTlK?=
 =?utf-8?B?d3ZmQ3FVVGlreFptem9VcmJockhmMXlGMmNreXRKbDZ3c0luVFRYM3MvdkRo?=
 =?utf-8?B?c1RXbWlqVDhUbkdTQzY5ZDk0OUxjNW1OZGx2WFNHK0VWNEQyQUdrRVVQdlIv?=
 =?utf-8?B?MjVhd3dyZ3QxWktUN2wxUXR0RXBiWHFmbGFXc241dEV2cm1BYUg2K25DMnVV?=
 =?utf-8?B?eDNVb0FhNXFaQktVRzhEUjhWdDJaQURrc0xXRnViV1ZzVXBqcEQ1M1NaMWdn?=
 =?utf-8?B?cjlZTWM3UFo3aWZoQjZXQ05hVCthVTBuTjNCNnl1RFJraXplNm1jeXZBSHh0?=
 =?utf-8?B?OWhMUDdJdkFsRjJoYlFQbWZSNHlNK0p2MlNONllRdkxIZEszb1VlRU5aN2tG?=
 =?utf-8?B?LzJHQTlaRmh2THdIUHRTRTVrTGpYc2p4UnlxYzB2YkIxdDUvaG9BNUxmVXNr?=
 =?utf-8?B?WitmK1BBQ2dGbjhWdnMvSm9wN3JSczJpSXN5RTlBR3FqYnJoVUtWZ3Z4dTUw?=
 =?utf-8?B?MHVqNU1kMnRnNjNsd3k0OTdUN2VUWkR6L1hGT05Nb2crckFsZUdnUEVINEV2?=
 =?utf-8?B?bTBIMnlFSjdZamRuRHpvUjBraE02M3FNck82NW82dnVrd3crdERZRHVTUHNT?=
 =?utf-8?B?d2luTkFjbS92QTNzcTJoOGhjNmNrWTcxWEcwcE1qbEx4elQ3cStwRG80QkFs?=
 =?utf-8?B?WTdIemIralloajlKKzlTQm1mbmNyelMvWnU4c1JHSm1XallrV0tvVW56WEpl?=
 =?utf-8?B?dC9KaCtUNUlDR0l3Sy9vTSt3UWlJK2pkdU1JeXlReUE5SVVEYld6dUZxVkZS?=
 =?utf-8?B?OW1MK0Rjdkg3THQwcXROOUtLa3M2M1hGeWhyWjJuZ0VucTdmbmpGRUNkWnFX?=
 =?utf-8?B?NEhpYXJyQXhVSENCWldHaVQ2cHRiWjhtK05iMjRTbWlpbnE2OGlUOUZIMTQ1?=
 =?utf-8?B?TUV1c29ZODhic3g4UC8rcWpDc0NyTVE1enVQRW1uNWZzeDJ5MldhRWtOUDRN?=
 =?utf-8?B?MkEzU29iM3NRaERicWxaSGV2ZUJmeFgxVWY2bG9rbnNrb2tjelFKa3hDeFdT?=
 =?utf-8?B?TFRzQzhDNDFaSlpvd3k3emZGQyt5TlpkbmtZSnlyR3dRZ2JndEpXQzhiRjFU?=
 =?utf-8?B?YU0yRkRKV2JiZGJ5L2s2bXowNjdJM1RQcEFrT3VvM29yaUtUN3VYU2Rmdm5M?=
 =?utf-8?B?aytxSkt0TVg2RmdlamlrMGRGWWxJb1p4VjYyakcvc2V4UjhVRm1UWUd4ZWx3?=
 =?utf-8?B?NHo2WnNrdVc5RjZnREI5Zk1OSmYwUVpBd2N3OE1xeUk2NzhvcXVVTEY2a1Vx?=
 =?utf-8?B?T0xOUUdZdEFaMHBrdmh3WE85cjNwdTNabDZpQ2pROVB1aXRFU25GQlltUElj?=
 =?utf-8?B?ZmJIZWllelBoZHVLd1o2d0tWRFcxWWJnUkdFMWN4QTIrbWFyQVA5Sm9KRElD?=
 =?utf-8?B?OW0vR0Rjc0RicGFERkx4bXdvY3Y1YTltN2xZbHJGZGEwVlhHYWhyb0NEUzJM?=
 =?utf-8?B?MTQwcjVBdUtiemR6M3I2ZjQrbmJTZkoyWjZoOUIrKzNvK2RVWEF6bXE2V0Ur?=
 =?utf-8?B?Sk45L2VOZkJYOGVnczh6MFg0L25acXpjenBHcWlnVVJ6SlFraGVVN2ZOMlpN?=
 =?utf-8?B?andyQ0hEbFhLRjl4dzluV1FTbnlvN1BnTUhPZUpBZEczdjFKSGI5bVdHMkV1?=
 =?utf-8?B?ei9iRnlUTTdxZlRYMjJaQjI2Ky8rUG9HY2pCa0NhelRnSElVMEd0c1NJeDJE?=
 =?utf-8?B?RVp4d1l1QUpTTXZHbXZEWEZTQ211L1NOaXFVOTBPNFFXUGFRbkFTbTFwVHpF?=
 =?utf-8?Q?tLpgltKdFr2CgqnRIwSE5mnCJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e476740d-6010-4616-039c-08dd7070cd05
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:26:33.6687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSDMCRuJV9tTe96rp3b+0qizzLE5xATuaqJcp0K41TtBPlgQbzUCDFfgXtl9BhsW9TiIJbdzk6Qto7QG+GIlAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370
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



On 3/31/25 10:12, Shengyu Qu wrote:
> So currently we have to hope the compositor won't use 
> DRM_PLANE_TYPE_CURSOR planes at all.... Why do we still register 
> DRM_PLANE_TYPE_CURSOR in the driver?

I am not sure what your question is. A compositor can choose or skip any 
hardware features, but this discussion is out of the scope.

> 
> 在 2025/4/1 0:06, Alex Hung 写道:
>>
>>
>> On 3/31/25 09:43, Shengyu Qu wrote:
>>> Hi,
>>>
>>> Thanks for reply. So currently we have to apply color conversion on 
>>> the background plane of the cursor to do some color space conversion. 
>>> What would happen if cursor and background plane needs different 
>>> conversion config? Or we just give the cursor a dedicated plane?
>>
>> This scenario is not supported on AMD hardware, but software cursors 
>> on other plane types won't be affected.
>>
>>>
>>> Best regards,
>>> Shengyu
>>>
>>> 在 2025/3/31 22:28, Alex Hung 写道:
>>>>
>>>>
>>>> On 3/30/25 06:59, Shengyu Qu wrote:
>>>>> Hi,
>>>>>
>>>>> Do we really need to disable cursor plane color pipeline support? I 
>>>>> don't think we need to disable that if it is supported, since there 
>>>>> might be some user-defined colored cursor icon.
>>>>
>>>> This patch applies to AMD hardware only: https://elixir.bootlin.com/ 
>>>> linux/v6.13/source/Documentation/gpu/amdgpu/display/mpo- 
>>>> overview.rst#L101
>>>>
>>>>>
>>>>> Best regards,
>>>>> Shengyu
>>>>>
>>>>> For some unknown reason, seems my mail is not shown in the mail 
>>>>> list archive, so I resent it.
>>>>>
>>>>> 在 2025/3/27 7:47, Alex Hung 写道:
>>>>>> cursor plane does not need to have color pipeline.
>>>>>>
>>>>>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>>>>>> ---
>>>>>> v7:
>>>>>>   - Add a commit messages
>>>>>>
>>>>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +++
>>>>>>   1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>>>>> amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>>>>> amdgpu_dm_plane.c
>>>>>> index 9632b8b73e7e..b5b9b0b5da63 100644
>>>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
>>>>>> @@ -1792,6 +1792,9 @@ dm_plane_init_colorops(struct drm_plane *plane)
>>>>>>       struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
>>>>>>       int len = 0;
>>>>>> +    if (plane->type == DRM_PLANE_TYPE_CURSOR)
>>>>>> +        return 0;
>>>>>> +
>>>>>>       /* Create COLOR_PIPELINE property and attach */
>>>>>>       drm_plane_create_color_pipeline_property(plane, pipelines, 
>>>>>> len);
>>>>>
>>>>
>>>
>>
> 

