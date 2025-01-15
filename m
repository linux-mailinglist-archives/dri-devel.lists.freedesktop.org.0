Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C787EA12447
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 13:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C2710E4F6;
	Wed, 15 Jan 2025 12:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OgJ/ck+D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45810E4F6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 12:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmEIP2uo9JOXcQtX66F5EsBExuQJVXeeSwg5lUXuKa/kZI36qzeBph7AZhoUx2Sn1+09PqWpj48GjYT3t/biS3rttPuvcdHbZZXl2webnElEOFVhaC4JWVHgGHGsjLCsylWQPOWjowSxhdBNeKsfjnF4iE2UB4hhbuHmiKd03ugKB82lTipA55WEAGvHbxcpuXgfd03bX5r791DJ7A7ALNtNaoeY4+q718QqDZDl8Ua7bSfYcJqMVv5XzQA4mrzcyY3dfxfKpC1tlFfNODonjYEn3c12LTQpszWAHIGPvQAYRUaY/P9qS0mG5GZQxrp3ydH2pcZIfW73HJEh0G96nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+grxgvoEkZ8sdWFnl8g3i0oJpuP0Tv+OdeOPmRzvmk=;
 b=xiC3C6FO9xb0uCfVSRmoKT7omte9bQbsiftwPHpJ9QMnG/DVg6zckLuZ3QofLlwJSe0kYfjhBnDJPuRr0eZHeJO2M1BxkI9gNifMqzBLKtngenWDs2Pbo7gEL24SYemTobyO5Pmkd1bt5m1AX6a/ixso/YTr4Aj8ChLQMTyf8vhwa6N2V3tN/C97dHWv4bm071O7Yr/+2GhUjOTOnb2A9fET8aZ9uSKqDhwjIED9ArvcF2ikwjcmBfTMW/E+CrdCemIeP8OkpUc4u0KZ+96VSBkR1gYS9HjnoKDAKyqbccsKAKUT8CqjOoOKdK82rPGAE0zqxeu9OFRecT6MQBX5cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+grxgvoEkZ8sdWFnl8g3i0oJpuP0Tv+OdeOPmRzvmk=;
 b=OgJ/ck+DnKB6KlfXILGDW39dNscKbByyFR9N9/v3B/SNJhZBf+Mo9hi0LW6HbGvUThSO5aW4cGiRXNjSLUR40kHdyKc7gO2bm+Iea8RNyhF//FbF0dULlBAiXXzbasHGuATMbN6qTWSjIkoN9uvacqF4GzpsczjLOShAvq3Bkpc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 12:59:32 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 12:59:32 +0000
Message-ID: <e3e5f799-3ef7-4353-9ebc-e240a9d19ff9@amd.com>
Date: Wed, 15 Jan 2025 18:29:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/tests/buddy: fix build with unused prng
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
References: <20250115124941.155990-2-matthew.auld@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250115124941.155990-2-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0211.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::6) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: b42938c6-f87e-471a-f61f-08dd3564742c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei81VS9aUWRnb3RHd2ZESSt3eFA1dEJ2N25ueEwrWGRlcGlaaHBYK0F6ZDM0?=
 =?utf-8?B?TW1WcWIxb0g3VXA2TjN0dHFtMHU4ZHZkQWNsWXJONVF4MFllcWlEQjY0Z1Uw?=
 =?utf-8?B?cmdsTzBMNHZzV3hmZHdTeVQ0WlUxWURSd0ltMXM4STZpYW5pS0xCUXlYY1BZ?=
 =?utf-8?B?Vk5DeHloKzI3MkNBU1k2eE9mQWtUUk1SNWxPQmxpeDZnQVdiK2lENFN2MnBN?=
 =?utf-8?B?VTdndkFCTlMwRlFka2dsR0RGeFNLZWVlUVp6NlU2L25PU0NJL3NSRFJXRXkr?=
 =?utf-8?B?TG1Mc1JSdEQ1MXAydTBaQ3VadHVxVXROcGNEbGxqa0R6Z2w0UmNuMDk4Yk5B?=
 =?utf-8?B?WE5JbWFieUtkbXI0M0pPdG5WdkpGZnZDRlJRSjZ6OU5sZW1ZT0lqYkhseGlE?=
 =?utf-8?B?ZzlMMXhMeW0yaGRWRExSbDJ1MENZRFN2WTVZUFdrb2lJdmxVRUNMTVZOQTlM?=
 =?utf-8?B?Q09Kd2hpbHlOQ0lXQjFaN2wwVEtaMDNQeWpudFNPQno2bGRNRzJUSktxaHVY?=
 =?utf-8?B?djZOcnlvRnNvMDljUXdPVmlMbkNkQnJQWHY2VVNGUFhIUDlnZStSdTkyK1B1?=
 =?utf-8?B?YUZPQlFaS0hlYyt2SnFIK3dkVDhQNkxNd3BPZGlEQXRuQno3ZnJ1Q280eHUy?=
 =?utf-8?B?UkFINTZ4eHRKNHNZb1hRdjh4Q29jMXJRYU1QUHF6aFEzbEV2WWRmN3l2Lzg0?=
 =?utf-8?B?NU01aUVxT2ZCMUdMOVZXSEROSGttcVBVakZGbEFXMWtpNmlCMnQ0TExTTi9Y?=
 =?utf-8?B?bTU0S3IzMzRESSs3WWxZWEYxMU42ZmpRT1hDZU9YdHF6MVNsVDd2blFOQ1pS?=
 =?utf-8?B?alFTNUx5SVh0RURjbW9aV240QmZvbzlyRlZ3RGQ5Q0NNRE1GWmRheWkydFBT?=
 =?utf-8?B?ajVUVnR3Nks1MzMreE9Obllvc29TOGt2RHRpRjdzdWoxeGliT00xZ3VFUWFm?=
 =?utf-8?B?MzhGNUVYb1dqNnZzTm9nVzVHTENOSWVxNzNsUnlOQ056czJvT3JpZUdkaEFP?=
 =?utf-8?B?RUMvMlI5elh4cGNQY0kwUlNvTU0za0drVzJEUmtzdnFzZElQSitLakpSdjhQ?=
 =?utf-8?B?bXp0TFVvSjdPb05ZT28zUDhsU3ZwN3ZOYzc4MWNUWjBWQUd0U2NBYXJ4RlZF?=
 =?utf-8?B?SUVpbEt0ZDhuUy8ya3JjZW4vNGZZdmlpaWMzY0ZJMC83dm10aGtnVTNmd3hN?=
 =?utf-8?B?bzNPT0ppL2ZuZkRhQ3RpOWxEZWFwWVMxNG5TNkpTUHZxY0ZwTGQxQmxBMVc2?=
 =?utf-8?B?TUtnU1gwWnBRZ2RyZXhpSEhURUZKTVNXbnViTitQZ0M2VmF1VkNXczJkU2VV?=
 =?utf-8?B?OE03ZW1oVVVmL2k3cFppL1d1SWY3NXNKdVZ2N2JmNzhjRFNRZEdiZklDclRY?=
 =?utf-8?B?Q3M5VFA4VFFjMHVCeXR5c1JrNCtFdGk0VGdIeU9YeVhMZUo5NmZKSDFjOCts?=
 =?utf-8?B?bElaSEh2WEF1YW1MbzhPcGllbHVXQStHSFNWZjh2WXFOQ3drci81dEZPdkVq?=
 =?utf-8?B?RjNybWUybU5RWG9NY3JzbVF3L1lCVExxVlpJYVBRcHZ1VmY1UG1va09tMzRN?=
 =?utf-8?B?OHlybGFiRU5uK3BCa3Y2Vkc2bTNmWldwL2RSNmRkSWw4T1N3VDZ6WGFxRGhB?=
 =?utf-8?B?dzIzcU12aDAzTFJJc1B3dEkxdmhZYnZzTm4wRjZKa3RJSGFCNmF1S202RnlP?=
 =?utf-8?B?VjAvSGF2OHp4STNpSVZISllsTEtQd1FUMFpsa2hodmRqaERDL252WHN5MHdo?=
 =?utf-8?B?SjdrRmlvTW1JWTVUZnlIaHVONXMxUmtMUVV1Y3Z6bFJ3SDYyTzhqSEdPb0RK?=
 =?utf-8?B?SUJzYnk4b3RScVM1a1MvbUtpSFJSTURIb3RuRFFhZ0hjRWRqeU8rUkdzbDJy?=
 =?utf-8?B?bmVETy9XS2lWU0RjdWVYK0YxeWhTZk9NM0k2bUhlUjltOFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZitWMEFMR1IwbDc0V1k5TmhDY0RpOFlwMC9CSFVjTndLcVBpNmZoUzhUKzc0?=
 =?utf-8?B?ZFdERU54TG5kTjJqRExtYzNJMlJiYmJEY3EzMGFIWnUrelNkaExBNDJUZFhw?=
 =?utf-8?B?MllaY3Q0enpINU1pRVcwNStib2hYYWV6ZW9jMXFQV0x2eWFvcE9QaFBSYjVJ?=
 =?utf-8?B?VXNJV0xmWXprVnpGbFNqdFJQV2NWYk1RbGJvTVlXMU5MYzloTm1VTFB1S0dY?=
 =?utf-8?B?MUtzNlRqUmxFNGhxTERvdjdiTWFPWjhTVWowVFhwcDdWS0ZaL08xbXpKVWpO?=
 =?utf-8?B?c0pleU5JZGxvWDF0SExsWWEyU3BYNVh5VUcrQlI2czFIU3Q2TTV5V2tYMGVx?=
 =?utf-8?B?NVBVS2Mzc3dJdFZRQjZVY3BFM2J1TWNVdjMwSTYweEdkbVpNNkxLQlVuYUZM?=
 =?utf-8?B?ZmNtZmNBNUpiSjJLSzU3SktLOTVOdVFvL2lyYUJnZzNQVHpkTU83disydERy?=
 =?utf-8?B?eEpNbWhiY0tPdjhYSlhSWHBwdjdlNklmNk5iSUVYOGxGTE9wdERTaEcxQU9r?=
 =?utf-8?B?c1QyM1pDTFlSd3kwSmY2M25iaEVselVuUFEzeFJEVld4Q1NwOTBtWHNuZk1C?=
 =?utf-8?B?Qm84eGIrVmdxYVhvNnMrejFsYWNUMEY4YURNS3NTc3A3N0FOWURET3ROMGFZ?=
 =?utf-8?B?dTRGK1h4Y3VtOTk0UmZNenRJallGUWJZelhUc3g1NzFCdExrTHhpcnZUOHJP?=
 =?utf-8?B?c2dPNFRLUktuUHFBbUNGZTM3eWV2VFc2cWVjbHBtUTFsUjFVV1hPTmE2d05O?=
 =?utf-8?B?Q0x4U2NVdnpLUEhnTXk2SkhMSXAwemxxWEdSZ05xQ3lPb2VIb2c2TXpWeHlR?=
 =?utf-8?B?T041dmxGS1E1Q2prNGQyVDQ5R3pkUmpDdVlockFwcDJnbnRVeUI5djFWdHU1?=
 =?utf-8?B?eE5Edm1LL0dyc285Z2tlcUJldDB0bW5NaERhdWJQYllKZ3dhUGFQUGNqUFdC?=
 =?utf-8?B?SDVkTC9EbWRlOUxSci9OSUhSSVR1ZFBCQjZPYzIyYnF4bzZlVWhQR2ZoU2g2?=
 =?utf-8?B?M05vK0xway9tRVVhM0VsaG1CazFlVGlSbExVZVArRFRNWlM0bHNVSVg5OWlM?=
 =?utf-8?B?UEhUZUNiR1VtVnJZdmJ0Z1I0OE9xNkJhdEJkU2d1RmpxeVRHWnp6aGpVeUxE?=
 =?utf-8?B?dGViNWNFREhJZkdINkY5WXJTVkk1L3l6V1JCMHA2Zjk1eUFOa3RqdmloL0Uy?=
 =?utf-8?B?bTRVenlFV28wRTFGN2hQRzhuOUpVcEY0N3Q3WVk0SUg2ajEvVHFVZXNoTWFR?=
 =?utf-8?B?UTdwendlM1d3MDh4dTJheTEzcWVsazB4TmZCeWZHN1RMQmpTTldFbGw5TmN6?=
 =?utf-8?B?b09MR0Q2L3duN0xLbEdCZjdLbVlGaDRLb2tZZnRnaXVnZmdXSVlJL2xJOURQ?=
 =?utf-8?B?S0JhYjVUaVVQb0k3NXFQaTN4VUNERDAvUnpVdk1JQzEzQW5wWktSS1hMMlBC?=
 =?utf-8?B?blVTNllTNmdpTlRtM0hQOWMvZXcyNXArbW56b0dnZ2M2V3hxem9jRHNsUFZl?=
 =?utf-8?B?Qy8wdjBSQkJxcW9yMWd1N3R3UTkzdWJNSG9YVWhweExVTUdhZ2t0dXZLcjB1?=
 =?utf-8?B?UU9sVVV2K1p5dTAzVVlSYTdvVHl3RldHV21nSm5wQ0hMdnVWOU1SbkhCcnNW?=
 =?utf-8?B?Z0tPYStwU3JudEwzZGNUdWRwZnpkWGhMVDBKb1plMHE5MlB3TGhPR3V6RTZH?=
 =?utf-8?B?RCtUeVpEa3RtWWRWUmtOa25nL3ZSOTNlKzJ3aUkvdDdMbVpPUlI0RE1uT0Jn?=
 =?utf-8?B?bGVneWlxTmY0ZHpPbW0ya3JLZzBIU0dWc1M1emYrdjVwM3JZWmxNdzNBWTRa?=
 =?utf-8?B?VnJsM1VNR2hJTEk0MUs1SWtqeHlkalNlbXVWZjZuK2hocFkyOU1NSjI2ZTRY?=
 =?utf-8?B?Wm9Ya0RnNm1sWUhFbzVJSEMyM2pCdFpOTGhJek9nK3Z3djlhMHdYNUhubHF6?=
 =?utf-8?B?STJlNVZlNTJadXl5cUlSMCtnaXpuclJWTUVhZTJIenRXajBHNGJ1WlBIdlBz?=
 =?utf-8?B?RWNLOHZOL3M0aU1VWTc0TWg4RG42QVQvM2RQVDVMejBkMnpxbVN3UHMvbVNY?=
 =?utf-8?B?U2RFazZ2KzdWcFBadnZGcG52aEYvam9veEt1Ym9HSVBnRGttd1MreVpEN1NS?=
 =?utf-8?Q?fck3H+CByuHWcg86/hnSYWnuS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b42938c6-f87e-471a-f61f-08dd3564742c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 12:59:32.2262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hq5UJ/zNCBASowWO9IGxJYNydzUZuVUgmzyLpAg6IbdO3mRG8R68WpwWBd6ZQ5Rk++IqAk9V6MGl7T3IZxLeXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

Thank you, I was going to send this patch out.

Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

@Jani, Thomas - Are you planning to merge this patch into drm-misc-next 
and try re-building drm-tip?

Regards,
Arun.


On 1/15/2025 6:19 PM, Matthew Auld wrote:
> We no longer use the prng, which leads to the following warning:
>
> drivers/gpu/drm/tests/drm_buddy_test.c: In function
> ‘drm_test_buddy_alloc_clear’:
> drivers/gpu/drm/tests/drm_buddy_test.c:264:23: error: unused variable
> ‘prng’ [-Werror=unused-variable]
>    264 |         DRM_RND_STATE(prng, random_seed);
>
> v2 (Thomas)
>   - Add Closes links
>
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Closes: https://lore.kernel.org/dri-devel/875xmggvcs.fsf@intel.com/
> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Closes: https://lore.kernel.org/dri-devel/3f816555e6913fdbcb254523f65c98088d70581b.camel@intel.com/
> Fixes: 8cb3a1e2b350 ("drm/buddy: Add a testcase to verify the multiroot fini")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/tests/drm_buddy_test.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 4b5818f9f2a9..7a0e523651f0 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -261,7 +261,6 @@ static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>   static void drm_test_buddy_alloc_clear(struct kunit *test)
>   {
>   	unsigned long n_pages, total, i = 0;
> -	DRM_RND_STATE(prng, random_seed);
>   	const unsigned long ps = SZ_4K;
>   	struct drm_buddy_block *block;
>   	const int max_order = 12;

