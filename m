Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E372DADB0B4
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 14:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA3710E37E;
	Mon, 16 Jun 2025 12:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KTvZD+ud";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E764B10E367;
 Mon, 16 Jun 2025 12:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3hy1zrVs+XZF8qkc/52osaltvijieemijmKZklJdcLLcfh/qz0eV/N8svhVnuG8mhz14UTa0OQs7L5Mz1JTms8kRksi3zHSZypo4SVg6qlydHEILhFIZNpee1FfpE+J4/tkM8yRL0n9s1cOQXxUiPUfVndRLKkrzEdQjrqcbeL1+ShfI9xfAAyEsy/RP81lRwF7JrCYO8wpg5PqEEb5I4AnOrB7s/JDKJ5pwkrG+uUMlyGAeco5Tr4Ou5FpiUNlCUIoN82CHzQHC9MuhbYa0D/Zehb3zOFiIeSb9Y7MPceH9Q8uzTYl0/xFT2YMnEOaOWVOahmwAljGMxN9jjGWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4n99gy+Cvp4EJODXJGQimbfaQijXijYyy3sZMazPik=;
 b=C6Zu1pAghyxU9rkYQlvXggaBeYq2d6/0S1iKbVqUPEWQJgv/m9zRizuZU2sGs3cQLVTuvx9LgDsnoo0NIemXfGn39/FEHKuZW8zWKDNn9HPlEMv3+sahWQ1d8QRNp4i369mKjSZ8KEjOJdf8Obei3ktkd/jnD4nrlH3v7L6fTPiwos4x+lCRkVX1fvp84X3c/ABg1xcJ+wRGr8ylrU5CiRlHtLx4YuvzXc7RHvajkRBi014/HM/h6QhjuuohoZ6QVMdAt+O/WeaDiVlImrq1pQqd5+CxYXhCJhDBbvfzKbYrsGet1CTAECdNQgKoMD5i8qRQLlPyqpIitpQU5PB2Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4n99gy+Cvp4EJODXJGQimbfaQijXijYyy3sZMazPik=;
 b=KTvZD+udd5/8cw68g8BEtav3O9kcll5WHSfo5szyTP5Fx/W2EyqDLp9gVn0oA0ghpovEOHEhqFQxLTaZkHG6oZMg5QPK5mKavWHsQmx4Cw29RExzHJWGCjCkFpz5f05zwgDDeOpIbpXBFDyhxiKCV3NDV9SkiA0cSBDEzsmTjSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Mon, 16 Jun
 2025 12:56:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 12:56:39 +0000
Message-ID: <cf0e1436-462f-4d63-a7fb-d1201d100bba@amd.com>
Date: Mon, 16 Jun 2025 14:56:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: add debugfs support on per client-id basis
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
 <20250616100503.1204166-3-sunil.khatri@amd.com>
 <3ca35236-377f-4ef0-becd-ba5d22b5edd8@amd.com>
 <84af6984-bd2e-4378-a5c0-ee2356f96b8f@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <84af6984-bd2e-4378-a5c0-ee2356f96b8f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0313.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: 837d6d7d-0216-4c65-6f54-08ddacd53c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0VmZ3lXbnJZQWdWZ0k2WVdCZ3pqZUVvTG5ad3Yra0RiL3JteEZtUXdrL0ZL?=
 =?utf-8?B?UnNwTHYrcHd5OUpHQ0NXZ3JhQlN0a0dXeFAySXg1eFpoKzY4WGEvVldhR2NY?=
 =?utf-8?B?clU3VnRHRTdSVUpQVk53MlpSUHM5QVhEVGU1OW9Vanp5NWc0cUViVDFQTUtI?=
 =?utf-8?B?eGw1WExaS01tZjRWNXRrQVhMVWEyOWZXbmV2b2dGS2NBdHFhczMrckhtUktL?=
 =?utf-8?B?ZHhGSVJVcHh2NkVGL0o2cXRZRDcxVnFnSEhRakJkVVVxKzB3TDRqbEIvbEFT?=
 =?utf-8?B?UFB1VTlkN0ptck53U1JnYm9qQUxNalJBWTl1bk1FajMxSC9Da1NzTGpTbGZY?=
 =?utf-8?B?WGhwcVJGd0N2cGE3eWxOVEpOQ1M0dUJ6OXBVUUlqME5XKzlyekFoSmErSGhY?=
 =?utf-8?B?RVBWUE9MQkxpeTZERHhaZTVnS251QTB1R3VkVDkwUGRFQkxRSlpMazYzeE1F?=
 =?utf-8?B?Vk84TERyTjU5d2ZIelM0bTlUY1RDQTUzbEp3eEdhQkMyVUNuN0NHQkRZSnR4?=
 =?utf-8?B?bFlZSGZHN1NkQTJ3K2lhQ1NWOWgyczFONGVrejRROFlIT0FxTzRpQ3RrT0RK?=
 =?utf-8?B?b1d4ZTUvRnlDalZIdlRkWjJOYjBIQlNtbTBGaGpQTkpYck5mUGxaNjBHSnYy?=
 =?utf-8?B?Z3RQMkR3a1ZZcFV0NTVET0M2Q0gxMUl0RmwvQkxEZjU0akZhUzIvc2JOUXBI?=
 =?utf-8?B?c0ZuZDYxTzl3K0NQR211VHZZVlFMTlRHcmtiZjFIS1Jlb2N3b0JKa3lzaXlo?=
 =?utf-8?B?bS9BOVIyK2xSK3VMVWJHMUkyUkVvMWFyaFEvRkRCSGs1ZFRQVytSazRLSGkr?=
 =?utf-8?B?b0pra0huWWFHTS9Fa2d3S1VxWTk1ODlVRGdsQ2VzZ0s3UkVoVnZmQ01KcE8x?=
 =?utf-8?B?VzFOb2RWcVJ6ZWgwODJ4U011bHZBenlxRG5rL0VhdGFlUThaT2dIODN6QXVQ?=
 =?utf-8?B?Nk00MEgzRlZYTVlsZithbGd4MWxHQUJGaDZrUTFsRXArQjVKYmRVZGkzbW1C?=
 =?utf-8?B?K3BiWnVHQVYyRG5VQ0ZYbjUrNXNRcktDb1hTQ3N2bUt0ZWJ0RHJMWW1rSTJh?=
 =?utf-8?B?NkdjMGd4dzZDUmZ2RU0vSTArWUthdC9zYVU2b3JXRmRoNFcwRmVuR2ZkeFN0?=
 =?utf-8?B?VlBHSVM1VlVjdU03Z0pQdzkycjBZQUl1WXkzeG8zL05IQmxvNmVtNTAxSXR1?=
 =?utf-8?B?WWVJU0ZURnVoTGtaM1FUZUR3dC9QWmJ2NEIyUy9Jb1NUbTU0M3ZPUS9paFB1?=
 =?utf-8?B?cUZUelM0VXVNRHhKSEZYUzhRTEVKZGFrRS90VzQwbjVJcTg0M0Z2RnBJVEpH?=
 =?utf-8?B?cW9haDRUbGNKRk1LdWVjaUxiWWNmNXQvSVEyaDNVQUlpMnJCb09WZmE5K1Fm?=
 =?utf-8?B?bzByRG42NXFtdnMwTXpuZGdWKzZQZndwQk9KSXZEMkhXNlVxREtiWjk2dXgv?=
 =?utf-8?B?cDA5Z011M1lHZ0NpZWZpcEZ6Tm9UbXVZZm9ndDQ5V1pNUjJRc1BiQldJUGp0?=
 =?utf-8?B?cjhFRWNSQmZaWjJwRUIzUy8wTzlwOVA0MU1kSFE0Rmo2RjIyUUNheVBGVXNx?=
 =?utf-8?B?QmVXaW1SVUVPQmRKVUdpRlJEdHJGQzRnZk9wWWZYV1hWQWRXbnVyMzRpeG5u?=
 =?utf-8?B?aTVuYXBxNEM0bWlDM2p2RkdIRWN0WVpzUWIrZzhjdUwzVWdEQ0dNTmVjbVdH?=
 =?utf-8?B?cDBaVEs0dmYvY2JtbmJUcWJKVFFWY0Z3RklyZTQ5S041d3YrcGQ1NUVnOUN5?=
 =?utf-8?B?dlNVZUVDRFZBUUtFeDRSY1pJanJ2T1pVaHRjTHRZUXBFT3ZOOVh5b3I4YU9l?=
 =?utf-8?B?amtOYWhmNWx3MXcwbmRpMGRibnNRamk3ZCttNXY3SEhpQmVXclJGNU8zejJW?=
 =?utf-8?B?QkthbUplYVRuQUVGSzI0aDNEc0Jqd1BHcnhwaWRTSEl4YkVnQm9PcnRGaEZT?=
 =?utf-8?Q?JWzSBsE1Aq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEVDVStkc1hXdStSRjduS1kxRVFHT0hkMzh5TndxTjg0bDhLZVUydUQ1WWh1?=
 =?utf-8?B?NUxESk1IK0doYzZiQ2pEK2lYTUdyUUNhakQwZDFDNzNlMmlqZVZ6bWNJK0Vu?=
 =?utf-8?B?aU5pM0hkSTNuWVpUaUYwb0xhMDdNb0lCYzlLTWxhczhJZzVLSGE4dXRXRy8z?=
 =?utf-8?B?UW1nSkVCVnpJbkhwUnJTa1Fxa3RpRm1kcFBVdTdwYnJ6MWlQWnFLUDJ0L1NN?=
 =?utf-8?B?K0JUTU1MUndDU3o3Q0ZzRGdEVGxnTDlHZXVrV09UaTFVajBCRkRpM21qQlZS?=
 =?utf-8?B?K0VjbE9QWDhENmRhbG9kc3hDZGlVZmovNksraGFjVlZJUUNrM1N3VXBZUFhu?=
 =?utf-8?B?NDFxaERIUk5HL0szYTJTZi9sVU1iRzBrQ0J6QWtNSXptdC9RcHYwVmhVbDVm?=
 =?utf-8?B?YTd5TUNSbDUrOTBrcENzZEx2c2lCek51ZHFtQTJ0TjI1enc5ZFoxRm4wYkh5?=
 =?utf-8?B?UkY4RXZTSDNhaGEwcG5iN29ZbHlCNHhqZmxobHhLdEFxUCtoQldwRUNRbmFW?=
 =?utf-8?B?TlJ6eEQvMlB0QXNtM0xlcG5lTkIyeTI4c0ZmSHpTYzZMTHJIT3hpUXdhbHda?=
 =?utf-8?B?c0N5OEJycWV6ZDZYNWJUcXUwMjdGTjVpNEVlcC9iQ2ZxWHNKeU5neDhqVE03?=
 =?utf-8?B?NkxmNXRBaEJucFdzSWF5d1dNdWF3SzlTTXA4b0xUS1FhTTd5S25NUEhNcFJ6?=
 =?utf-8?B?RHNwOUtCZVdSWEVFNVdPVXA2akREZDZoeUtRREpFUDZSRS8vZUsvTElvR3RF?=
 =?utf-8?B?R3QrZWdQbkhQTGlxbnRJTDVHNnA1MWJlVE9rWTQ2K01OeFIwTG5vTEpaeEQy?=
 =?utf-8?B?a2hjb2xTR0hwSmttNGZUYWo5cThXdzlhMWRKNzJzdTQxYk5mM1pGYmxTajNY?=
 =?utf-8?B?M3RNNllPNTVlbFZ0Q0ZlZlljY3I0NG9WOFUrWEx5MjI0MlU2ZTdFQ3czS1dj?=
 =?utf-8?B?djNTYkVqNXpPcXZjWUc3eE05ektmaWZEbmZCamVyL2RoU2pVWFhRd1FUUGRJ?=
 =?utf-8?B?T2NZU3B4c3kxd3JqdkNMWUJkZE10RjBMZkVSdk1zS1A3TDhBM0FnYUVaY1Fx?=
 =?utf-8?B?YXgrWEk3UzU3WWJBK0wza2JZOWJ2OGZlNkVGK2tMcnc0VlNKLzExTjhRRXls?=
 =?utf-8?B?SU5uNkpSajFrTll0N0w4YXdqejAzK0JsQ29NVlJndVUzUzhLbmtqQ3VsY1pE?=
 =?utf-8?B?Y2JHVnBXdkJUZUk5S3dvZjdvczBuMnVjNERmdjNtNzJhQVkvVHlhTEZqMGFQ?=
 =?utf-8?B?ZHBRUG9FVHFlSko3c3czSXlCTE1JQVl0VVBmcVdnTlltNEFLdW8rYnZBOW5t?=
 =?utf-8?B?NzNLM0EzNXJEUW9ickZ6bTgvMGRlQkJ0OHRiYitZaDhyOEViZ2tpN2RjSWRH?=
 =?utf-8?B?TGl6djVvVUZiMGd5eEVOWFlmSCt0V3dVbEpGWEMvUnY4cXRDT1Ura251TVQ0?=
 =?utf-8?B?OExiVlFhZDl0eFQrMzRuY0dBWFFreXJwMlFvM2R5YlFJZzZObFpURGMrQ3Fm?=
 =?utf-8?B?bTE0cGhzWTluZ0UzN1lEZE1jYzlXNW5NUG4zMFlvWE9Nc2g2U1hKdi83VlMr?=
 =?utf-8?B?eWJFdlo4cy8wdkViRGYzU1M2aGE3amtocEZndzVSbDhBNEpuODdqMGdJS0tz?=
 =?utf-8?B?djl5cVRvNGhiSXJTNndHYXROeG11Y1ZqTm9ZUWcrb0ovd28yMnJQWFV3czlw?=
 =?utf-8?B?aWVzdW1EMll1MEtFTGMxOU5naE9VV2JCV0o3RFN3SlgzWTNyVFoxZDZacjZ0?=
 =?utf-8?B?K2NGUXhRNVJMK2t1QVZYMHJoNlowMk80ekZJV2c1TkxHcGVoQ1hPaGpsQVRG?=
 =?utf-8?B?QmhSUElxeXJUNi9OdDgyaE1GNkdFTmtNTlFTMlJLdHNLNnR4N0hFVWd4WkdI?=
 =?utf-8?B?WDV4cThVQWZkMS92OUtkNG9IU1NRWXU4NE50MFFxR1Noc0NObUJVdXpna0pR?=
 =?utf-8?B?WmFrQWtyaTdwZ0ZJOVhNcWlLR01kTmtwcm5acmdUanJXakljeWlWUkg3WFRl?=
 =?utf-8?B?bkczRHVpOHBUbG5vWXJUR0RrVXVuSUc5UXZ6YkRGeno0bUNSNzlJeUFUOVRw?=
 =?utf-8?B?amxKWFg1NFVML1FRcWpoeGlTWEg0QVdHbU95SFVoZ2pUUWFSekEwNUJmTCsw?=
 =?utf-8?Q?dFFMtwCSL1GmYztKOu+3CnGcH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 837d6d7d-0216-4c65-6f54-08ddacd53c13
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 12:56:39.4883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czkxfIaKK3aGi9vv3jMnfHkBznN0tg6Uk8n92JdkcI4H1mrf5YDUTX3zH++cxGDf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8
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

On 6/16/25 14:25, Khatri, Sunil wrote:
> 
> On 6/16/2025 5:41 PM, Christian König wrote:
>> On 6/16/25 12:05, Sunil Khatri wrote:
>>> add support to add a directory for each client-id
>>> with root at the dri level. Since the clients are
>>> unique and not just related to one single drm device,
>>> so it makes more sense to add all the client based
>>> nodes with root as dri.
>>>
>>> Also create a symlink back to the parent drm device
>>> from each client.
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_debugfs.c |  1 +
>>>   drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
>>>   include/drm/drm_device.h      |  4 ++++
>>>   include/drm/drm_file.h        |  7 +++++++
>>>   4 files changed, 38 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>> index 2d43bda82887..b4956960ae76 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>>>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>>   {
>>>       dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>>> +    dev->drm_debugfs_root = root;
>> We should probably just move drm_debugfs_root into drm_debugfs.c instead of keeping that around per device.
> root node above is needed in the drm_file.c function drm_alloc and there is nothing above drm_device where i can get the root information. that is the reason i mentioned it as drm_debugfs_root as root node of the drm subsystem itself.

drm_debugfs_root is currently a global variable in drm_drv.c, but if we move it to drm_debugfs.c all functions in that file could use it.

Including the new functions for creating the per-client debugfs directory.

Regards,
Christian.


> ~Sunil
>>
>>>   }
>>>     /**
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 06ba6dcbf5ae..32012e39dcb4 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -39,6 +39,7 @@
>>>   #include <linux/poll.h>
>>>   #include <linux/slab.h>
>>>   #include <linux/vga_switcheroo.h>
>>> +#include <linux/debugfs.h>
>>>     #include <drm/drm_client_event.h>
>>>   #include <drm/drm_drv.h>
>>> @@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>       struct drm_device *dev = minor->dev;
>>>       struct drm_file *file;
>>>       int ret;
>>> +    char *dir_name, *drm_name, *symlink;
>>>         file = kzalloc(sizeof(*file), GFP_KERNEL);
>>>       if (!file)
>>> @@ -143,6 +145,27 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>       rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>       file->minor = minor;
>>>   +    dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>>> +    if (!dir_name)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    /* Create a debugfs directory for the client in root on drm debugfs */
>>> +    file->debugfs_client = debugfs_create_dir(dir_name, dev->drm_debugfs_root);
>>> +    kfree(dir_name);
>>> +
>>> +    drm_name = kasprintf(GFP_KERNEL, "%d", minor->index);
>>> +    if (!drm_name)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    symlink = kasprintf(GFP_KERNEL, "../%d", minor->index);
>> Better use dev->unique here, minor->index is also only a symlink.
> 
> Thats a good suggestion and doable. Will update in next version
> 
> ~Sunil
> 
>>
>>> +    if (!symlink)
>>> +        return ERR_PTR(-ENOMEM);
>>> +
>>> +    /* Create a link from client_id to the drm device this client id belongs to */
>>> +    debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
>>> +    kfree(drm_name);
>>> +    kfree(symlink);
>>> +
>> Move all that debugfs handling into a function in drm_debugfs.c
> Sure, let me try that and push another patch.
>>
>>>       /* for compatibility root is always authenticated */
>>>       file->authenticated = capable(CAP_SYS_ADMIN);
>>>   @@ -237,6 +260,9 @@ void drm_file_free(struct drm_file *file)
>>>         drm_events_release(file);
>>>   +    debugfs_remove_recursive(file->debugfs_client);
>>> +    file->debugfs_client = NULL;
>>> +
>> Same here, move to drm_debugfs.c
> 
> Sure, let me try that if there are not challenges.
> 
> ~sunil
> 
>>
>> Apart from that looks solid to me.
>>
>> Regards,
>> Christian.
>>
>>
>>>       if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>           drm_fb_release(file);
>>>           drm_property_destroy_user_blobs(dev, file);
>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>> index 6ea54a578cda..ec20b777b3cc 100644
>>> --- a/include/drm/drm_device.h
>>> +++ b/include/drm/drm_device.h
>>> @@ -325,6 +325,10 @@ struct drm_device {
>>>        * Root directory for debugfs files.
>>>        */
>>>       struct dentry *debugfs_root;
>>> +    /**
>>> +     * @drm_debugfs_root;
>>> +     */
>>> +    struct dentry *drm_debugfs_root;
>>>   };
>>>     #endif
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index 5c3b2aa3e69d..eab7546aad79 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -400,6 +400,13 @@ struct drm_file {
>>>        * @client_name_lock: Protects @client_name.
>>>        */
>>>       struct mutex client_name_lock;
>>> +
>>> +    /**
>>> +     * @debugfs_client:
>>> +     *
>>> +     * debugfs directory for each client under a drm node.
>>> +     */
>>> +    struct dentry *debugfs_client;
>>>   };
>>>     /**

