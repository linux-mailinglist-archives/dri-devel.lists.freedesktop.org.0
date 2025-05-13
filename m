Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE890AB5613
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 15:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D2210E180;
	Tue, 13 May 2025 13:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jQOBIxKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B2210E180
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 13:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yP6k6x/Lpv7jrHDacUc7LpFTcN1kZ1Fxr37DVr1eT/Ilw8mivWk6mTbF5vrRPL+BQBBw8btyVfHwvpSM1lFNv9tCAYfgTUOZGL0nVm2mkCOMsVW+6pzCdIm1DImnk5SmkuJpFUreHLVu83ngb+1XNzMfR4m18yuVOe1J0Xy05IBb1MsZ+IKKveWYxih/nFWvEKrMX33/Yc0S8KTOmiAAGisgL6pNg49I0AkVM4IC00TBBfqJUTbTBY2Q85RQoacKnMHiAT5ad9QgoAi4nu9E8aS+DfBzCzb2YTW5x6wSu2V1FipARDEHplkbS4s6LM2bp4Aim62rZxvDOhNUzoKlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76AL/tsc3giu4p9R3Iatnrb6YzXFUF2gnWwvZNzsXN8=;
 b=fjjc5NcAgUvJWRmAFXBNvg2ousW+rq0QTj4cVznPT+Fzh2a0hvr+1rzbSbOj7HAktRv2fFlgXdY7kfKaRAh6Ritn+4ZORyx1HOF7NHw7YAz5Ldq9MDSi3cWoJNjAzDc0kfXf+189djnpkyHMHI8sUuOrSmz+kivMx5NAzTs3Z3nYQA//CrfdKWTwfnAsOUqX02474fJ+8RzSyHLl2zFsLF1a+YcwZ2YvQMHXmnFuP88okCNwXGiIDzQpcaoDtwrCJivb/NGAtl4ZHuIZmO/vt8Bm9668YYvAyRii2xWpWeoLZIOzlQydQX0OFAyJ6YAXfQs+EznvykjTLqYqwKMeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76AL/tsc3giu4p9R3Iatnrb6YzXFUF2gnWwvZNzsXN8=;
 b=jQOBIxKoPthfb2uXyymLQGURS14G/AF3EXwsNVTAEwhElkkv5BLdcrpurM0RyLMaFtX+crRRxGGmdIZo6EhFNq/KWhXKnqVYOuS+9xTim2YX+MiH/QqkQxqGRUgqTDHCCCmVGHwLzw/FF+DMBYTF8CipuqqBU5OJJSd1E/IxEWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7194.namprd12.prod.outlook.com (2603:10b6:930:5a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 13 May
 2025 13:30:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:30:22 +0000
Message-ID: <b1f94ede-fc07-4735-8444-61a473a9d751@amd.com>
Date: Tue, 13 May 2025 15:30:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] ttm: add initial memcg integration. (v4)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250512061913.3522902-1-airlied@gmail.com>
 <20250512061913.3522902-6-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250512061913.3522902-6-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:208:e8::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: 33968b7f-f643-4fa9-9ad7-08dd92224fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3FNMGUyYnZMMGFNRFhCaTJtTUt1NDVEaXRCY1RHVmVoOUdmTGJsV3pvU2Fs?=
 =?utf-8?B?MlZzc2twc2doaW8xeHJ6dloraDZOYnZBcXdza3RKNnJId2xzRTRUOURYZ1k1?=
 =?utf-8?B?TVloZXlseG5MY0g0blZtcjVXaWNoMzBoMjIwYzh3SmRvaVFLc3Y5cUxxdGNQ?=
 =?utf-8?B?dDlGNFZsZzMyYmZZa0JGU2ZSTkpqTjhVVTFBeGNabEEvcllScGcvQUxOTkJN?=
 =?utf-8?B?YitqUnpwdjljRnM4dXA2aWNYZmJYbEo1enduMnFvaDFVYTVWdCtJMXlMaW5a?=
 =?utf-8?B?ekdIZDZPalVaZFZJOWVua0NRbncxYWRuRWtxaERod1d5UDFsbDdMR3haM2hi?=
 =?utf-8?B?WEVYbjNER1hTVUNZYW1GamkxbnBjVFRqaks2WEdkMzgwZHpSMTdERm1obW5D?=
 =?utf-8?B?aWhmOTE5a0diZ2hMYkphQlh4UmVPM1ArOVNXUFYzK2UwYWpIcys2Q2J0RVpH?=
 =?utf-8?B?Q0poNUVIWDRvQWhJaHFSd3M3b0pwWURuMWFuN1VPSGVHai9HeFJEbEdpQkNQ?=
 =?utf-8?B?czQxVGd5SGpQdVFDMDFmNmxRRXIyd1AvQzF6SkJFUThjb2x3YUxNVmcrRThi?=
 =?utf-8?B?RWJFYUJzc0oxTVg5K3lBK2twbjVkR3U4dFdWTjJrdEJaZDdzSGFvU3lMUzY2?=
 =?utf-8?B?cDFHWEpQYjgzSjViOHZrbDlpamVJZ2N0MldnWDJwaGtjekttKzd4OXEwTGxF?=
 =?utf-8?B?S0wvQm1oSmxGMXlJMHF1OEE3VmpuVmdJeFkvV2JqQVI4NFJnUTZXWEJvdU9P?=
 =?utf-8?B?WDZPSTc4VURDcGJtKy9xSFhuRGdGcmlDemlsUmhmMXdaUnI4aDZyYkpndjFH?=
 =?utf-8?B?OVZsbjdVYUg0SmJnNTNkUzNiL1ozUlBiWUZsNGg4V2phYjNIU0tKbnhDMjIz?=
 =?utf-8?B?RGxBejBkM3ZLeFpCQjdBVUJLeDkxSkplbXNWSXE5VlBxY2R6NzNEbXcxUmZY?=
 =?utf-8?B?SGd4dkFsSStzTG9OU09aMkFPMS9NSDZQS2U1OFFnN3YyNVMyaWtnYlhiSkRw?=
 =?utf-8?B?aDNnVEErVUQvV1VqODgzeUtwWE14RTBiZXNlVmVNb3ZBOEdVU3MxS0MyWU80?=
 =?utf-8?B?VmV1anNsaDdEc3BrY2xIK0tnQmFBVVBhellMM1ZmL08zUjFWUVBhK1FNZVE1?=
 =?utf-8?B?dHJLU1dKKzNmb2plZUdDVXM4MU9wVjJ0c2pEcVB2RHBGanBKbHZBQ1FycVE4?=
 =?utf-8?B?QUJoeVJmb3k1bW5QT293SkM3OVkvY29jUzc0VGFvWERJN0c4UEFyYTE2U240?=
 =?utf-8?B?NU9vUkw2cC9vZVFyY2hCQ1pFL0I1TU9CSHh2YW5iVVFRRTd5MTFlQVZIcXNa?=
 =?utf-8?B?WDA1Y2tldGtDSUxTeEN2THJjNUNTUXRnRWZEbVJLQlhkS1h0aWxMTGpkZ2Ra?=
 =?utf-8?B?NmpuUkx6c29zQ09YcHF6dmZGcGRtNVVDSzNvZThQRWRtcTFTbTdpN2pwNnR2?=
 =?utf-8?B?R05kQVdHa21BV3VBUUlaUURuckhPUm9TUUNGMmpLWEthbkFkdVVGd0gwakI3?=
 =?utf-8?B?OG1McDZlQktlOHpwTlBkbG9rdFEyc2EreXJDZ0NqNWVDY3ZYZFdoY1RYMjdl?=
 =?utf-8?B?WEFCa25oMXAvNERtNHhZRWNtenVUYVcwNjV5cENLbDdLdWhEYnNzQWI3L2ZS?=
 =?utf-8?B?aVRFb25rR20zNmpsRE9VejVpVXBpMUZSVE9lRHpsN3FmVVFUQnVKOUtHM1VH?=
 =?utf-8?B?U3JSTlRtT0tYUHJRbTZBVEhhdWQwejJJUmdsc3VlcXQyU3RuNVpiL0dOV0JH?=
 =?utf-8?B?dW1qcHZERHBaWHhiNHNIdjFrYmFQSENsVUhyZnhLVDYxc1dwMFd1SFM0N3Jj?=
 =?utf-8?B?Zy92ZEZadUlsdHZyM0FWM2t3Vmh2ZlJFZXYrcFlFWFVnN3lWVTZQMnRPUGJZ?=
 =?utf-8?B?U2Q3Z3Z3bWZiUHp6VVVaSExacjR1akpsUUtja3Z3Unpxa1AraElDTWlZRE5B?=
 =?utf-8?Q?eDxAGCM0V0E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXFyc1N0VFRSZnYvcTZmajZ5VjFUZGFjeFBBWmRxZjM1NVF6Y1hTY0hxMDlw?=
 =?utf-8?B?Y25yRFEyRitTWjVMR0xjWWFNM2hYak40SEJzc1Y3VXlRNExEMkZQLzlhZlRM?=
 =?utf-8?B?c01EVThPNERWRXVhV256bm9RMmdGNUV6NFhmak1VUC8rU2V2d2ZwRUlkbE9U?=
 =?utf-8?B?eTdWamNwekg5NmZvWUgvazVCWnFpSlA0MDFHYlIvL0l1NmRPcXVrdFMrY01o?=
 =?utf-8?B?dGRxdVFhQ1YzTnlaalAwcjFxRmFPZmpCcDBBNDdqMUVGKzdtRk5aeUozRFlI?=
 =?utf-8?B?WGptc0lhc0RPVVY5UGRpL3JqZ054cVU2QytHR0grMWN2eEdNbUlneWs3bXZU?=
 =?utf-8?B?T0JjWmtRbzREK3ZnWXNDZjRFQ1phMjRRZFhmRFpiM3h3eGJBTzB2STcwUEx1?=
 =?utf-8?B?d2dZejhsVjNEdmd0MXNiSFc5V0Z2RFNuY1Z0UFhJSWJFNXltOFpJYi9xWGE2?=
 =?utf-8?B?MTRVOGFTWGhpUVFNdER5TGVxM2N1YlJoME1Ba1pTcFViN2FmZlI0WTYxaUVY?=
 =?utf-8?B?K01UTWc1VDJDR3czK25BU0JjZ3QyUkhPeWpxeGNoUnFKWENaaXRZZ1JTRUdW?=
 =?utf-8?B?TW5vK3Y2VmVQSmxYN0Q3WVBYMHNSMlN3dGdxelFQWDYxS0tvcENEcldJc0xZ?=
 =?utf-8?B?NXBucFBCcmJlSXdOK0NUY1J2ZVdoUHArYU8yVmRzckZzWGJnUWQwa1UxNTJE?=
 =?utf-8?B?a1NVWkI5M1JyL2E0cEdIZFkxSnM1dERRdEVpU2F6TWJudk1tY1IycVQ3eC9j?=
 =?utf-8?B?WXdXMEhrUFI0R2V2QjlVQitqN3Vyb0VWcFZGY3E4ZnF6dmdOU0lMM0Z4T0tJ?=
 =?utf-8?B?WWR1VXlLck5SdnJXb1NFeGlOcmJvb3Z0ck13bmlKV3kxa28xRUE1ZGlHZko3?=
 =?utf-8?B?S0pwaC9GUDcxRUsyUlNpSmRsWlgzaGtWV1ZlbXRoVWVpVjBsb1BMR3JPbFUv?=
 =?utf-8?B?QWp2TXg5YzlLS0huaXd4TVpJUGhlZUszR09acTEyWldvbXBHM0FvTUdtN3hD?=
 =?utf-8?B?UUx0NnNJcUJKd1kxUjdpOWR6SlVGZjJPNEpaVjNkclVZSnVDRlhhUWxablh2?=
 =?utf-8?B?eENDbmtzMlNiMGMzMjBZOHRxdmE0UG1OZ3VyY2l2TlMraE9UcDB0ckdCT1hP?=
 =?utf-8?B?R0M2TmtOclN2NUVEL2VDUVVxRVU5dWRtazRRWkpBejlIaGhSblFvTXMrUTg4?=
 =?utf-8?B?VVpCWVFhRkJWaGt2UHR4TUFRMVdQSWI5YldTbWFYOU1qSmZtWTFPSnpFcWFm?=
 =?utf-8?B?ZDJEMk9WckRyeDZ5ZjdqNlRTRWU0WnFVemJuSmhtaU1wTnlmcnVhVklrdFha?=
 =?utf-8?B?V25IWXEwZGY3WW9VdnVoaEpsS1o2QlFzdEpzQXo1aXJ1SkFBemFTejFtOEU4?=
 =?utf-8?B?KzF0ZHlXdGN6dW0rV2h5QllxMkQyTUZoSDZhKzJwUmU1UWVHVXZIdGtCcG55?=
 =?utf-8?B?Wk5PMUZEQUtxL1BBcDBIKzRoMHJKQXJZZ1k2ZXVNSFl0MnpZSFV2OHh5T1I3?=
 =?utf-8?B?RUVKNC84WWt3UVJBSUlkdldlamxxT21uSGxHcU1Sd0JLVXNTZmNuTm5ncElG?=
 =?utf-8?B?dTlVZ3dRRWFWQ1o5d3UzNDVrYm4vU1BIamJzaUZxcnBGZXZOelRvY2Y1R3NJ?=
 =?utf-8?B?dDJMbmlqbXBWaEhiMWk2dldjcDhhSEJOV2JYVnBud3AvM3JvSDFielpIWU5w?=
 =?utf-8?B?QXlqenBHSFRldXk5WGxTWTUrblRxVjN5TU9xMkp1QTRHem9nMUYrRGJrMGVz?=
 =?utf-8?B?OUVXdzJ6TW1KV0FQa0VJVEV6WHp2WGZsY0sxcDVuNE5sUERxTnFyTVEyYzd6?=
 =?utf-8?B?TVhjSnArd0lnMW9OSk5mbndnWktiNGY5cFFocXVsUGJvYzBibXIxSkMxSk4w?=
 =?utf-8?B?NzJqNEdyWU5BV2F4NnZta3Z0WHhtNzV4NTNrUzliNmw1MmRHdEljVFBwZzVk?=
 =?utf-8?B?Rkx2V1d3aldpUWpDSVZkMDlYcGYydFdXcjd6akJQRjE4OHUza2NCc0U3K0RZ?=
 =?utf-8?B?VlQ1bmZTWmFzMFVSaExMN3FBNFc3NjJwRVpvRjVNK3RSLzJHOSszcEJlbDEv?=
 =?utf-8?B?NmIzY21DYUVYaGRxMGhFYUdFa2EwWlRWR2drYnBnUnlLd29HY1Z3M3JJT1Ur?=
 =?utf-8?Q?qZdg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33968b7f-f643-4fa9-9ad7-08dd92224fad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:30:22.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLK05/zfxZwcyRFEkLg1PnNdpL8cQJpy997721GPGCW2jNOeaXX/F8vw+1t6BljY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7194
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

On 5/12/25 08:12, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Doing proper integration of TTM system memory allocations with
> memcg is a difficult ask, primarily due to difficulties around
> accounting for evictions properly.
> 
> However there are systems where userspace will be allocating
> objects in system memory and they won't be prone to migrating
> or evicting and we should start with at least accounting those.
> 
> This adds a memcg group to ttm bo and tt objects.
> 
> This memcg is used when:
> a) when a tt is populated (and unpopulated)
> b) the TTM_PL_FLAG_MEMCG is set on the placement for the
> bo when the tt is allocated.
> 
> The placement flag is set for all non-eviction placements.
> 
> This version moves back from the resource to the tt layer,
> when accounting at the resource layer, if an object is swapped
> out there was no way to remove it from the accounting, whereas
> the tt layer has more info for this.

Good point, we should probably really come up with a SWAPED TTM domain.

The nice thing about attaching it to the resource would have been that you could charge evicted BOs when they are re-validated by the driver.

But that can also come much later.

Regards,
Christian.


> 
> v4: move back to the tt layer from the resource layer to
> handle swap, but keep the memcg charging hooks for now.
> v3: moves from having a flags on the op ctx to the using a
> placement flag.
> v2: moved the charging up a level and also no longer used
> __GFP_ACCOUNT, or attached the memcg to object pages, it instead
> uses the same approach as socket memory and just charges/uncharges
> at the object level. This was suggested by Christian.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c      |  6 ++++--
>  drivers/gpu/drm/ttm/ttm_bo_util.c |  6 +++---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c   |  4 +++-
>  drivers/gpu/drm/ttm/ttm_tt.c      | 17 ++++++++++++++++-
>  include/drm/ttm/ttm_bo.h          |  7 +++++++
>  include/drm/ttm/ttm_placement.h   |  3 +++
>  include/drm/ttm/ttm_tt.h          |  9 ++++++++-
>  7 files changed, 44 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 5bf3c969907c..1630ef28e5a8 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -140,7 +140,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>  			goto out_err;
>  
>  		if (mem->mem_type != TTM_PL_SYSTEM) {
> -			ret = ttm_bo_populate(bo, ctx);
> +			ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>  			if (ret)
>  				goto out_err;
>  		}
> @@ -1237,6 +1237,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>  /**
>   * ttm_bo_populate() - Ensure that a buffer object has backing pages
>   * @bo: The buffer object
> + * @memcg_account: account this memory with memcg if needed
>   * @ctx: The ttm_operation_ctx governing the operation.
>   *
>   * For buffer objects in a memory type whose manager uses
> @@ -1250,6 +1251,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>   * is set to true.
>   */
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_tt *tt = bo->ttm;
> @@ -1262,7 +1264,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>  		return 0;
>  
>  	swapped = ttm_tt_is_swapped(tt);
> -	ret = ttm_tt_populate(bo->bdev, tt, ctx);
> +	ret = ttm_tt_populate(bo->bdev, tt, memcg_account, ctx);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 15cab9bda17f..7d599d0707e4 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>  	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>  	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>  		    dst_man->use_tt)) {
> -		ret = ttm_bo_populate(bo, ctx);
> +		ret = ttm_bo_populate(bo, dst_mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>  		if (ret)
>  			return ret;
>  	}
> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>  
>  	BUG_ON(!ttm);
>  
> -	ret = ttm_bo_populate(bo, &ctx);
> +	ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>  	if (ret)
>  		return ret;
>  
> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>  		pgprot_t prot;
>  		void *vaddr;
>  
> -		ret = ttm_bo_populate(bo, &ctx);
> +		ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>  		if (ret)
>  			return ret;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a194db83421d..02aea23a34e7 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		};
>  
>  		ttm = bo->ttm;
> -		err = ttm_bo_populate(bo, &ctx);
> +		err = ttm_bo_populate(bo,
> +				      bo->resource->placement & TTM_PL_FLAG_MEMCG,
> +				      &ctx);
>  		if (err) {
>  			if (err == -EINTR || err == -ERESTARTSYS ||
>  			    err == -EAGAIN)
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 698cd4bf5e46..81c4cbbeb130 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -161,6 +161,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->caching = caching;
>  	ttm->restore = NULL;
>  	ttm->backup = NULL;
> +	ttm->memcg = bo->memcg;
>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -365,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
>  
>  int ttm_tt_populate(struct ttm_device *bdev,
> -		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
> +		    struct ttm_tt *ttm,
> +		    bool memcg_account_tt,
> +		    struct ttm_operation_ctx *ctx)
>  {
>  	int ret;
>  
> @@ -376,6 +379,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  		return 0;
>  
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> +		if (ttm->memcg && memcg_account_tt) {
> +			gfp_t gfp_flags = GFP_USER;
> +			if (ctx->gfp_retry_mayfail)
> +				gfp_flags |= __GFP_RETRY_MAYFAIL;
> +			if (!mem_cgroup_charge_gpu(ttm->memcg, ttm->num_pages, gfp_flags))
> +				return -ENOMEM;
> +			ttm->page_flags |= TTM_TT_FLAG_ACCOUNTED;
> +		}
>  		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>  		if (bdev->pool.use_dma32)
>  			atomic_long_add(ttm->num_pages,
> @@ -437,6 +448,10 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>  		ttm_pool_free(&bdev->pool, ttm);
>  
>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
> +		if (ttm->page_flags & TTM_TT_FLAG_ACCOUNTED) {
> +			mem_cgroup_uncharge_gpu(ttm->memcg, ttm->num_pages);
> +			ttm->page_flags &= ~TTM_TT_FLAG_ACCOUNTED;
> +		}
>  		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>  		if (bdev->pool.use_dma32)
>  			atomic_long_sub(ttm->num_pages,
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 903cd1030110..d7c0dd9e0746 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>  	 * reservation lock.
>  	 */
>  	struct sg_table *sg;
> +
> +	/**
> +	 * @memcg: memory cgroup to charge this to if it ends up using system memory.
> +	 * NULL means don't charge.
> +	 */
> +	struct mem_cgroup *memcg;
>  };
>  
>  #define TTM_BO_MAP_IOMEM_MASK 0x80
> @@ -486,6 +492,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>  		     pgprot_t tmp);
>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>  int ttm_bo_populate(struct ttm_buffer_object *bo,
> +		    bool memcg_account,
>  		    struct ttm_operation_ctx *ctx);
>  
>  /* Driver LRU walk helpers initially targeted for shrinking. */
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index b510a4812609..668798072292 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -70,6 +70,9 @@
>  /* Placement is only used during eviction */
>  #define TTM_PL_FLAG_FALLBACK	(1 << 4)
>  
> +/* Placement causes memcg accounting */
> +#define TTM_PL_FLAG_MEMCG	(1 << 5)
> +
>  /**
>   * struct ttm_place
>   *
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 406437ad674b..2790fc82edc3 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -90,6 +90,8 @@ struct ttm_tt {
>  	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
>  	 * struct ttm_tt has been (possibly partially) backed up.
>  	 *
> +	 * TTM_TT_FLAG_ACCOUNTED: TTM internal. This tt has been accounted.
> +	 *
>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>  	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -101,8 +103,9 @@ struct ttm_tt {
>  #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>  #define TTM_TT_FLAG_BACKED_UP	        BIT(5)
> +#define TTM_TT_FLAG_ACCOUNTED	        BIT(6)
>  
> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(7)
>  	uint32_t page_flags;
>  	/** @num_pages: Number of pages in the page array. */
>  	uint32_t num_pages;
> @@ -126,6 +129,8 @@ struct ttm_tt {
>  	enum ttm_caching caching;
>  	/** @restore: Partial restoration from backup state. TTM private */
>  	struct ttm_pool_tt_restore *restore;
> +	/** @memcg: Memory cgroup for this TT allocation */
> +	struct mem_cgroup *memcg;
>  };
>  
>  /**
> @@ -245,11 +250,13 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   *
>   * @bdev: the ttm_device this object belongs to
>   * @ttm: Pointer to the ttm_tt structure
> + * @mem_account_tt: Account this population to the memcg
>   * @ctx: operation context for populating the tt object.
>   *
>   * Calls the driver method to allocate pages for a ttm
>   */
>  int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
> +		    bool mem_account_tt,
>  		    struct ttm_operation_ctx *ctx);
>  
>  /**

