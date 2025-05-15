Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73FAB819D
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D016F10E7CC;
	Thu, 15 May 2025 08:56:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mPuV3QI1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C99410E7CC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMLty+9bXIQXxiEnOOyWRth3v5sdH/LafhPbMFui4UlE9/PoxOQcj09sWplKZYcD+BjdOkihoPrDTDDT7mmB5rFv7Hhr1bOK1JxH/GYLpc4qCyRqIPx1V2nclnPQ5KiySOghkqUFLz4xExXQRoy/kYsGO77o0NZFOgY0VXBksFH67REdryunMUIq1wnjpP7NzuGYKAxilEq00vPwIpZE4BrzI0EB6giV2k0uW9I5PqU5C/xAf6I2d8DjbkTBI6heIM/tXa7JAJJwo7eyZhl0tD9FuYqxWmMBPSua9eNkMOZn2YXWuJk/IAgbFHS7CLcycyvEQhF2vylPqcnS7BGymQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzbzA0ORovEpClVGUXNu8uk27uSlKROxe1AvBtr1dgk=;
 b=G1AJi1fbguAVqEtmbpMwW+ZPofjZittE7zswNGplTbGcl5jfuwcFMhWCR8nBowv7Qk+0CkQg8+RHSg6wfSbtIFWgD9fvW5KXPFwbqGuoqiFv8T8FehVMUmKEAoOoQVq62KVQRUlmPG0oKWJGZsC0gpyfdmOHdj8IPsM0ngP2sxmQhU0qmEPrw2IRHmkBuGTNpXyI8pWqgCGO1uG+UuTpnrkP7ndNkunTnTw7Ql9WxzX+V2S+2ZXVBLI0EC3CzdOMf8VzAXLljSGOtyfZhr4RGoa7sVJAFTzDdTUpYAUVlt7Ogm2dlGMhMPR9ZbYbBADrYxFOZlK/IkoViW7rTj/g8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzbzA0ORovEpClVGUXNu8uk27uSlKROxe1AvBtr1dgk=;
 b=mPuV3QI1e4vgnTRvifKUvCq4A2r0Whiq+4de+dUuibZ29h433YJMhTAdzsIyMTVfaCo6iGhq9dqRjRDG/o1T9c7Vh2xXnwuLP/gUcG07ZEGkhl+N84F/11Dt+6EaoicOU8Q7RXE4WRegDHDuGkuJ79s3hCQ7ja3Cc2ZEsjQznlE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 08:55:58 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:55:57 +0000
Message-ID: <b0953201-8d04-49f3-a116-8ae1936c581c@amd.com>
Date: Thu, 15 May 2025 10:55:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [rfc] drm/ttm/memcg: simplest initial memcg/ttm integration (v2)
To: Dave Airlie <airlied@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250507175238.GB276050@cmpxchg.org>
 <CAPM=9tw0hn=doXVdH_hxQMvUhyAQvWOp+HT24RVGA7Hi=nhwRA@mail.gmail.com>
 <20250513075446.GA623911@cmpxchg.org>
 <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txLcFNt-5hfHtmW5C=zhaC4pGukQJ=aOi1zq_bTCHq4zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:208:329::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: fb45c259-b05e-4c37-e27a-08dd938e4eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDV0T1dmeGxBcitkeG82MGgvdGtCQ2o3ZXFIengvcVJKd1l4eHNZdUE5SEtR?=
 =?utf-8?B?ZTAxSVBleGpZa05NSXdUZFd5YVVPampOMVprYjBPZzdtamZQa01SMjQ1RjY1?=
 =?utf-8?B?OFlCcjd1UklSellWcFMyYklJbnJaMDRaWkJMSWdTMm1RVlRoNmZyWElOdzRW?=
 =?utf-8?B?V0xwYVFvTXhyU3pSZW9iV3hmVnhGSmNFWm4yRUltSEVhMzViaHl5S0lwYW5D?=
 =?utf-8?B?RSttejNGZEE1dWFuNm1ycWhiV2t3czlmV1N4S3V6WHJFSDJONXZhL2VmaEJu?=
 =?utf-8?B?SjhieWlKSEFLSS9lTVhTSmM1N3hUTTBKQTUwV3ErSzY4N0QvRGRZRnRPV2Za?=
 =?utf-8?B?NGJ0NUUwTDhlRGZjMjlabjI5ekIwTWRkbzkybDN2cEV0a0ZlL0ZMSjF4b01i?=
 =?utf-8?B?eWxJK1pmclY2R3F4NzZJV2pRZml1bDNDejc4S2tBelErZGk1T2lkcmpYUzM3?=
 =?utf-8?B?RGZYYTB3NEhjN3ZwK25CRE5VVllsUFBIeFpXbHovZnl2ampoSFBpNTJ4ZEkw?=
 =?utf-8?B?VjcvZmVyVnY4ajRaSEMwTVB0NjRMOTR2eUhDc1lTRlNjNGg2T1MvKzMyWG56?=
 =?utf-8?B?VWwyRElyRjA0OW1hTzcvL0E5RDU1UVFYS2Nnb3hLcTVvOEFSdlNqbms0WEph?=
 =?utf-8?B?a0RuYWZQNENJVE1TRXloMDYxTktHQUx1ZzFIZmY1MWdSdW11WFVxazl0Yk1n?=
 =?utf-8?B?bXRTYlNmamRaa2loWloyMlZxeGN5QWFRQWNBQ0RUa2pSSmFVcHppYTdEekps?=
 =?utf-8?B?bHc3dzZwdmlnSXZRMitURGFTeXB6ZWVKVHJOSXdJNEo0N3FRVVlGQW5qYkxt?=
 =?utf-8?B?YmtKc0pnUmIvODErdThYQWJveGVnZ3BMMi9pRTUzRENvaHNjOGNJRWRhU1B6?=
 =?utf-8?B?Ulg2UWM3UlZCREF1Vmpva3lhVVFwenNXOEtiRUMySno1Z2pyUkFqZ1VYNUVV?=
 =?utf-8?B?MjNIL0M2My9RN0o0eGdyTEtJNVdJdGUxN3dHcGdpWVFPU2E0MnZhTFpoM2d0?=
 =?utf-8?B?RVAybGI0UTJGamZBMlRDVGZmWDNTQ25INTJBRE1SYUpaMUJpSmJiQXlLYVRh?=
 =?utf-8?B?V0o3VDdlYkNTOUhjNXNBeGpzRFduUHl4OE94ZTc2ank3UDJndWpLUlBEN3A0?=
 =?utf-8?B?aitNOXNNY00zUTFZM09FQUNJenpsdkh2VGtmY2toRXBQazczTHVWdmN6dHRn?=
 =?utf-8?B?bVgrcWM5eWNPbitKTVlOaUJ5dGtiZlhYVFUySlFGcFZSSjRyVUJWUGpkUWx2?=
 =?utf-8?B?SVJqMTFFdXl4dytBQ09JN3U3SDFtUFprZjRRdFhuQ21MVmxocjlaMHJia01V?=
 =?utf-8?B?UlA1MmkrRklYVDcxdVZFeUh4a2tRdW9BckZIRU1hcVdUbkk3N1dPNkdhbVU1?=
 =?utf-8?B?L0psSjlwTkNkOG1oOEdRS1FLN2Q1dGFwRFYyL0RuVForOTRnZkx0azF6Y3RK?=
 =?utf-8?B?eFpKcWd0RU5wdjBSQzFnbkc5SEFiY05YcXgrcW02dHFZNjJSMnFyd05iaUYx?=
 =?utf-8?B?Z2ZVdU1IazRQV1hEWnk5YjB3Q2VWNkJXbXFwNENTdzhBTkJTU2hQbVAxV2to?=
 =?utf-8?B?R1VGOW9oa0hkeWF1QUhNWWY2cXVPSjRJM2JXRENzVTUvVXFyUjhNRlMxS095?=
 =?utf-8?B?RVMvWVVNUFJVUlZiVW52UU00UW1Fb2kyVjNhWVdrOWg0UUNPK0Y5UHFhN0s4?=
 =?utf-8?B?RXF4aEtJL1RmRTNGS2IvaXREQ1VqUFhmN1NsZVBPZ2dJQTZmTmNsZy9qMTVu?=
 =?utf-8?B?cVBuWTBYSDVXS3FGQzl6Z01vOTBIcHh3aUF0ZkRWeDlJbzNUTFA2c3haTEN6?=
 =?utf-8?B?MlhEMzg0QW1aR01QYU1mTWVZZElnMnpyWDhPdHVmV0dWY0ZnUEZ1cW1WM0hH?=
 =?utf-8?B?K2l2WnNIR0RmT3BwaUR6Rll1cDlsVnRMZTgrNDZycUloWkxGcjRnSXFtVDV1?=
 =?utf-8?Q?e6dV7bv3898=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXk1QVlMTEViK3MxQWdGUlZDMU9NY0luTjhFUFN6bnBLYnNqdnd3aGM5WUln?=
 =?utf-8?B?emxBQWg0QXp6T0YyaytBUGUxSklXUVgxaFhuMWdKTTAxc29mdzhxNXUyRHJn?=
 =?utf-8?B?S2ZEQ0o1aHJIK1YrTmVvUGM2RzB0OU5kQWdCck5GRzZ4QzBVMzdJRFkxQ01x?=
 =?utf-8?B?NkVPaWdzZ0RwSVExK242Sm1NQ0NLMis5WVoyenNjYWhBc2U4YXNkZkNkV2tw?=
 =?utf-8?B?U1VXdTlnOFJqandDYWRub0plVFNadFNZYUJxY25zdmI5eUorUHJlcjgvQjZ2?=
 =?utf-8?B?bmJ3dFZ6V29JSjhaNHZkejlLZkk0N2l1OTk4Zk5iQXlVZVA4V2J0akVabU9N?=
 =?utf-8?B?WjdxUmdqYzZ1L0tjbEZGUGZPYnZldStMN0ptYTdLLzZ1d3VYelZFNWdodytv?=
 =?utf-8?B?L3FNQ2pDRUs3MDV2SldLWEFwdlFYMXc2SDJHVmx1aEdhaDRndkNpZTV4aUdZ?=
 =?utf-8?B?eUJsV3ByVDNuTGo1ekxmQlczZytMbTBtUEY2THI5YitpNHdMRHcxbXBOYmJr?=
 =?utf-8?B?ckVYVlpBZWlUM2ZEUXRHNVNLcmw4UkNvNVczS2hKeXVKdGJGZ01ScTBJYW9O?=
 =?utf-8?B?bkZndFpnWjRVc1NGUTNCVDkxcHRMOWVNTFdLMnFxQmgxVGRDMFEvR2tBUkpk?=
 =?utf-8?B?blJPRldaVWlJN3ViYzJVQWlDbFB1Q0RWQ3JSdnkwWGx2b2J3aUhaTHJVeXNi?=
 =?utf-8?B?RUlDU2t2UVFDdUgveGQ3dFlVMnNtRW91R0ROZUcvYlJjc1pRTXpDWWxkQm1n?=
 =?utf-8?B?eUs5V3pmanlpcUFnVFRvZUN5QzJFRE1zWnhRQjQ2RDRZVmJBZVpSR2dxRlZt?=
 =?utf-8?B?U2NGdEIwOVo0c3pDbmNqbW1RY0pnT20zRlBjWk9ZY0FFa283MWtyay9XcFRZ?=
 =?utf-8?B?KzVZK0NJWFhoMHIybWpzMG94VWlxV0Qrb2dUd0o0ZmVGVENJeUsyaHRXczhI?=
 =?utf-8?B?alZ4MUpNZVVXVzRqNlQzcTZGMCtkS1d6WE4rRU5UdUdiVWZDZkNnL3dPeEc2?=
 =?utf-8?B?eE9lZlpxVHJQaldsWldHM3J4N0xDbjNnR2UrUkxUVUVUOEJwSzFvNnhTb21D?=
 =?utf-8?B?OTJkdlZRVzFoQ1cwZ2Y5dzJnL2VDc0dxaG1kNVgyY3hlN3ZQTTV6Z0F3U2I0?=
 =?utf-8?B?VERlbUdLcHluVnFJQlBKd1hkczhvdWpyUndWMStWeFkrc1RQVmwzSXFTT2lv?=
 =?utf-8?B?Z3JXd3Q1TnQ1MHhyTm8xMlcxOW1TMTl4Q2ZnUnAwSnMwekJ0cXd0QnVFWE9C?=
 =?utf-8?B?aHpibS90STFQK0MvRDc2b3cvWXgwK0x1K0cvTEVYN2lBMUlnU2owN2E5MkpU?=
 =?utf-8?B?aHIralNpT2J1eDJWbGd2eSs5SEp4aFBndndCY01JSThXYTd4bWQ2T0taaUc5?=
 =?utf-8?B?cDJ4RkpCNHZkdVZaOVdhbFM2VFVEZzZhNzUzU2d6bmdIR2FuZXRmVlNyVnN3?=
 =?utf-8?B?L3lmYnA0My9VSlZ5OENaSDJKYlpYeWh1Mkl5aFdCYmVDK3V3SEcwdTdYWE9X?=
 =?utf-8?B?OXJEclhEbkhIejNsd2tQQTI1WDBEME1lUXB5REpxTlhWVmk3Q1A0Z1hJTThI?=
 =?utf-8?B?SWlXVDVGVkhTeDZud1V2bWZXbnFuUm1QcDJtWElHSEk5NlROSlVhTnRVdzNw?=
 =?utf-8?B?c0lKems3V3lkYUpMSXR6NG1XTHVYTGJ2czBZNGgwR016aXJlMXhORUdmVGo0?=
 =?utf-8?B?NFlmSzVIV0poQ01mRWIvRjZHQUN5Y1ZMYVBZWGFOc2hVMko1MW95KzVmWnkz?=
 =?utf-8?B?ayszc1E4aVM0Q04vTVZwSWtubFU0aFI0T25mRXJYMVpjbU9mc01jMUpzZTY4?=
 =?utf-8?B?TTlLSUdaOGpRTS8xNk1ISFMwSTk3czFvSVJFTmc1ZThQZmFyNmJ2MXc1blRR?=
 =?utf-8?B?dmdlUlBzOFhLMHE1bFJsQkZlSVJCRjJ6Y3pjTmRLeUoxQnZ5UjVXU2NIZ2Vi?=
 =?utf-8?B?ak12RGFnTkR5dE56SzBrUFErTlFyZWVSS3pxeWZBVTErbjVCbDBXZXBiNm5D?=
 =?utf-8?B?MWhKU2tnL3hGck81OWVYSldlVmJuaDQ0cWZxY09qTlpPZTdrVVNsd2VUbnlL?=
 =?utf-8?B?cU9VbVMyb3ZycnFaK1I4cytTNEVDRk5DczNGRWt1d0hGVndmcWxrYnk3ZVVN?=
 =?utf-8?Q?Ktdx8h3ONj4TgjEp1q46v8DJl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb45c259-b05e-4c37-e27a-08dd938e4eab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:55:57.2582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZaASyJTCrbvJcCZLqNuP8BLZuduwiXWBHXD7wuRgLxVNdD+rzL8fDN+88iQ5D/x2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408
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

On 5/15/25 05:02, Dave Airlie wrote:
>> I have to admit I'm pretty clueless about the gpu driver internals and
>> can't really judge how feasible this is. But from a cgroup POV, if you
>> want proper memory isolation between groups, it seems to me that's the
>> direction you'd have to take this in.
> 
> Thanks for this insight, I think you have definitely shown me where
> things need to go here, and I agree that the goal should be to make
> the pools and the shrinker memcg aware is the proper answer,
> unfortunately I think we are long way from that at the moment, but
> I'll need to do a bit more research. I wonder if we can agree on some
> compromise points in order to move things forward from where they are
> now.
> 
> Right now we have 0 accounting for any system memory allocations done
> via GPU APIs, never mind the case where we have pools and evictions.
> 
> I think I sort of see 3 stages:
> 1. Land some sort of accounting so you can at least see the active GPU
> memory usage globally, per-node and per-cgroup - this series mostly
> covers that, modulo any other feedback I get.
> 2. Work on making the ttm subsystem cgroup aware and achieve the state
> where we can shrink inside the cgroup first.
> 3. Work on what to do with evicted memory for VRAM allocations, and
> how best to integrate with dmem to possibly allow userspace to define
> policy for this.
> 
>> Ah, no need to worry about it. The name is just a historical memcgism,
>> from back when we first started charging "kernel" allocations, as
>> opposed to the conventional, pageable userspace memory. It's no longer
>> a super meaningful distinction, tbh.
>>
>> You can still add a separate counter for GPU memory.
> 
> Okay that's interesting, so I guess the only question vs the bespoke
> ones is whether we use __GFP_ACCOUNT and whether there is benefit in
> having page->memcg set.
> 
>>
>> I agree this doesn't need to be a goal in itself. It would just be a
>> side effect of charging through __GFP_ACCOUNT and uncharging inside
>> __free_pages(). What's more important is that the charge lifetime is
>> correlated with the actual memory allocation.
> 
> How much flexibility to do we have to evolve here, like if we start
> with where the latest series I posted gets us (maybe with a CONFIG
> option), then work on memcg aware shrinkers for the pools, then with
> that in place it might make more sense to account across the complete
> memory allocation. I think I'm also not sure if passing __GFP_ACCOUNT
> to the dma allocators is supported, which is also something we need to
> do, and having the bespoke API allows that to be possible.

Stop for a second.

As far as I can see the shrinker for the TTM pool should *not* be memcg aware. Background is that pages who enter the pool are considered freed by the application.

The only reason we have the pool is to speed up allocation of uncached and write combined pages as well as work around for performance problems of the coherent DMA API.

The shrinker makes sure that the pages can be given back to the core memory management at any given time.

Regards,
Christian.


> 
> Dave.

