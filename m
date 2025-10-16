Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE88BE1FF0
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 09:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B24110E97C;
	Thu, 16 Oct 2025 07:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ONHXFeUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144D610E97A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 07:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XjR8sLGIGmRMJn5zsVjxbrqZWbAoV0Dm6sYDbdBVMj0vfa0DvUAzoqIBPWFbYFRABnTooML3jbsPFWeGiqOvbwgeuXZEfgEHeBGjgI9ZwMdHEb25a8fyKW5j5uY5hyLR+jS939EyjvzQpWHzMGasFLJgIS4y+WsbjFWAjQoCplZ3tTMama5lI9Xgk7brqs6INEs+tVymIBLwZ3QFLWC5x1xw43mfoOPBmbfw+OeUfhtCMbREpOogINtdLHjRoeVVWjqkiQjHpwYPbas88NZdf1JqIfqV0wMe8/vbBJmui+J16C6rpCvGwlWDMqYUzT6hdBrcCLgK7qN2noz8Ew+g4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcPXhhW3/KJJgNLHjK7KSno/raNo7zQvOERO5c1o75g=;
 b=Bq/UebvsEMl7bgwGNmH/ljtF6e0ECZayGXa7Yff9SBsfuZXpfvRBtssUWmqPQLCHkM647vpygRFj2hvXO5Z4x4EOGFq3vx/UN+DmS0rbaGXKtn/c1tQmEATjbZBqymX9JuHMGK5oqE+ArfQjEYmlsIVNJmGb0h7D4/a4zjkQ+x6D951n06DWu77cafuqDxzR2Vs2d8YAD7one9ra3Skr4sc/84aCbX4RDqyXPFVz9vy5FWaarMD29eSDU4ReaBoHYShqcIiC/2UpKTS7u+DO6++74crzSCa5hDzq6MOT+2DLifIJK65c9MKMnSseQKiPkN4KmOz2PWL9IsBsp6Hl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcPXhhW3/KJJgNLHjK7KSno/raNo7zQvOERO5c1o75g=;
 b=ONHXFeUgYJ/SOmCvpBjF+tODoVwPArj+4KjgvhxbXQNQ9dX68nGPc5UzOBOmyuNYfJnik8pE7/wuCrx0CJmhvhaAC4sT80bQnBk4o+OjsJKWwqECkWPmHP6sE5XySytby5BkirMZd9Bb/IrjGgahdPuV5FAqc9Wh918Y708pB5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 07:48:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 07:48:26 +0000
Message-ID: <1ad4fb55-cde2-48cc-bd94-f52a3017759b@amd.com>
Date: Thu, 16 Oct 2025 09:48:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] mm: add gpu active/reclaim per-node stat counters
 (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Dave Chinner <david@fromorbit.com>,
 Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20251016023205.2303108-1-airlied@gmail.com>
 <20251016023205.2303108-2-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251016023205.2303108-2-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: e6982c59-1b20-4778-892c-08de0c8863b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVhlRy93b3BZcE9HaUEzdWRWZStZRU03aTgzMFUySFh0eXJrcTFYYjNSaUxw?=
 =?utf-8?B?VHN3ZUpzbXI4MHJnbUd2ZEJ4QXNtSUVVa24wR0xIUEs0dGkwMnFXR2FRK3pz?=
 =?utf-8?B?Sk1LWXI0M29wdWY4UXpFbHlrK013SjZmQndUaTNiZ29LT253QW56Umw1SzBa?=
 =?utf-8?B?cW5WcTgzeUorY0lpVk9ZM3hvSTRFKzZMTnVtTFcvSFFzUUExN2NMcmp4Q2JO?=
 =?utf-8?B?cFZsUkNhRWVPeS9wSzQybjBGdTBYUnkzOEFVdFhBMGZJQm90NjZ1dVVRY3Bo?=
 =?utf-8?B?QUl0VzU2OHZsUlhsajZOcUE0eSt6cVFLNkQ0TGRLUW9mdE1Rd0hZNXNyeldv?=
 =?utf-8?B?WmQxUmlvSHJhSnNQTVpHY0R0cGE0dHZ5MUp1K3dCTkxCZmdrL2o0U3NLQnFs?=
 =?utf-8?B?NW0zblg1eDZXdTFPSkhrQnljSTJZWnJkVmxmUXQ3WDE0ODZyWDBjVG1LVytM?=
 =?utf-8?B?Q0dxRGo4VjVhUHpmTys4RnNsOTl2RlJKL2YvUkV3K3JHRlJRUWhTLzhRd3Rn?=
 =?utf-8?B?N2RqWU9OSGhzOXczaS9GY1ovekcxTmEwUVhSOXkyUFJLV245WitoVzJJek5t?=
 =?utf-8?B?QVYxdzA5TjZTWWRYZEQvSGVLTGpDTXVzOGNrUUE4UEN5aVFRUFpLZVV2T0JP?=
 =?utf-8?B?SDV6WGZQeTlqYjNzaDZyNGJEQ1lERDlDdDhDeWdtZjE1YW9NR2MvYVMwKzhi?=
 =?utf-8?B?eVVpNWp5cWN3VnI1R2tWYnRtQ2FiQ25iT0g3NlFQOHVkcC9yOWZ4d1Z6WjE3?=
 =?utf-8?B?ZGpzMEtyYXhZUy9xbGU0czhlTXc1blExS1FzamJHdDg5MWxrZnd3aUlBTGlF?=
 =?utf-8?B?OXFrQUIvMXNEenBFL0xsc3g4Wld6NWVMWG5CTkxHUXJPcmsyb1ZKYm10TTNO?=
 =?utf-8?B?S0h2S0VSeVNmQVFxVzZtZUswcEZTMjhxQm9Bb24ySUJwVERuRTZOMVJKVE5x?=
 =?utf-8?B?WmxXWmQ0OUFZTFZFYjRZaWY0aEt5Mlp2S3dyOGJqR1hxc1BERm9zL3ZNK1Bz?=
 =?utf-8?B?eDFVWDgzTld5ZHlaVW1UWFdFWEwwKzAwZDZOUWtnU2tTeXNVMXIxYkFDUHB2?=
 =?utf-8?B?ZHZGSXUwRFFYRkZ2b0hpSUVKVmFZQnJwRVVjdG43QVQxWjBjUTA3SnNnMkVQ?=
 =?utf-8?B?b0xqNGNBQjUrWnJROWhzMWZ2eFZUZmZvTk9ydzF3SUZaeWorMXBRanNjbU14?=
 =?utf-8?B?Qi9ZN0pOMGJ2Z01oUEFkaEpPQjgrdWNEWUlKZVVzV2JMMUVVcE1qajM1T2FY?=
 =?utf-8?B?NkFJcjJnaEo0NVdxZWxOeWpLRitZaHdlY3hWbUhSZzN3aGpEYkpIVFFubjNz?=
 =?utf-8?B?aks0L3g0NkRCUGZxaWlwOVJSL05VbWdaODh5c214UnRpSGNCTDNJVzdPRVpj?=
 =?utf-8?B?UDVqaTZvTENUKyt5U2F2TE1MUWRQM3hZRVdVZ1dvS3VBWE8wTXdESUx0U3Ro?=
 =?utf-8?B?MDE4c1RiSEg3MWFyQXNuR3JWRG9uYzBNYTNDK0NEVlVUQzE0S3ZtRGwwQ1Vm?=
 =?utf-8?B?UFVyaWJKSE1lZHUyRzhGYXNhMERkbEMrWmVLTk0rV21XS3RWaHBNZlNqdk9W?=
 =?utf-8?B?eVlNTUduWWlRamYvclJ1aldTVi9sd0lIWG9vWDJxd3lOeWs5T0swQzlRako3?=
 =?utf-8?B?T0xocGcwUGE1RjdqeGFMeVVQRXlZdk5JQmdWUFBCUVNkalNUamtKaS9lcFM4?=
 =?utf-8?B?dGtrUGJwWkNmTk9qbUk1S0JIQmhqdHJRVXN2YVVlWS9IYnM5ODI0cU9uc2pX?=
 =?utf-8?B?aU1GQmR3TVVvTUpTTEwrdm5xN2NSUG1sWDdiTGxzVC82djBVcHVPZURNZHJ1?=
 =?utf-8?B?UDMycWdVRjFSRGNobS9XWEZvQWRnbjFqLys0VGk4UkEyeFdubmJFRmVmWlZl?=
 =?utf-8?B?YTBTTzFMcWdIMHZWcWlqRFExalNRWk1sMUVHdnMyaCsvMFpiVkpzeEhVWTIr?=
 =?utf-8?Q?yZdgZMkdQHVaPpuaCo7w/6aGjNdHLN1b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFl0ZDBZSFdjLzBDYkRPdXc1ak1HWmpEUklFclBJZnJ0T0JuMi8yOFpQdlJD?=
 =?utf-8?B?VUQ2dllBVnlOUUo5YStZM051SDlpeW5SQVV6dkEvcnB2MmJIS1ZoUHF6Skd4?=
 =?utf-8?B?cldPQ0NTTjRrYWV1aHlTb2NONmg3eC9vY1Myck1GNUh3R0ZpcEpROXpTOWNx?=
 =?utf-8?B?anhFK1VhVXNaOEFDSEFjeG1jQ1lLN2lCQ1J4ZGxMVmdUUjZObmJZTHRmZm1U?=
 =?utf-8?B?S3EwUWJiTnp0S1Vaa09MMXdkUUZ0R0xGQlJyOEMrTkJBOENOTDNOanBBQnNz?=
 =?utf-8?B?d3RCUWtqTGVhSWY5NElFNGRtWit2Yy83cDV1bkdSUlBad2M0TmIzYk8rMjN5?=
 =?utf-8?B?a095U2JoUmt6V1FKL05zSUovd3R0TkJ6RFB0K2pVeWc5MlAvR214dFNMRVFl?=
 =?utf-8?B?bEhqNkZLZk90S09kSFFkYUVQV1E5Q2ZHNWhBYm9vQi9ZdEJnN1dRa0dJRmxR?=
 =?utf-8?B?RGpIR0tCcDRpMXdjWG80RU0xT202M3ZiMlNJbVN1RlBGd1c1K1lDbGJkaGZ1?=
 =?utf-8?B?VzQzLzVza0Y1a1NnOVlGa3FuZkdjVWdvY2E1UW1Lc3JGem4xazdMRjY5SVpo?=
 =?utf-8?B?WkhibjNIbVBMT01mOWZzUWUyRmRtQUE0Zk9pUkJpdnVXa1ZkRVdISngyQVJl?=
 =?utf-8?B?MmFaVEJlV2Z5dzNXNWs4ZmxPL0cyQmlPNm1WWlNueGVrNFZhaHZVMUhvbjNT?=
 =?utf-8?B?VkJTaHlQalZnMy9xU1JLYWhVSGtSM2lXc1BLZ3dnaWllUEtZSDFrdHJyMms5?=
 =?utf-8?B?VkxaTkgxZm9OUXZJc0pqWFpTYlFQYXdJd3NxUks4Z2RkVS8yOFBCOWg4QTR2?=
 =?utf-8?B?b1crcG1MOWFadXZzc28rTDliMnVwUDYzWHJCRytZcDdaRUtVbUZHd1pTZWpl?=
 =?utf-8?B?YVJudmgwT2lZcVg4RzBVTEp2Wk5BNjBYRHV0dWJtaDhZUFU4aHFrSXFVNmVz?=
 =?utf-8?B?bzBHNCt5NndmTkw5THpONXJiMUhET3h0clJ6UHRoT1BYVkdxZE0xVnlSU0dy?=
 =?utf-8?B?RHkxeXFUNG05cmdjN0Z4WXg1WkZYMmRoVHdLUStsNDM2VFQ4ZUVWUVo4STR5?=
 =?utf-8?B?bmRWbUw0N3duUVhucWlKSkxNUjM5RlBtUEZZYzVLZ3JoTE93SmJHRlZPcFpk?=
 =?utf-8?B?aWptbklGV3UxYXN0c1NnOFl5ZjFwdnFnZ2Jua0VKZ3pRYTk4Mkx3VStqbmZY?=
 =?utf-8?B?amhPOXRBU01CY25UWUxMR2toZlZQQlFyZC9oM1FXTHZRbGpJa3BLT1gvZDA0?=
 =?utf-8?B?WllZVjVUSlhxTU5NcFNEemxHSU5jeUlRenVxS2lQRjdDckowUnF4SGhVMEc2?=
 =?utf-8?B?LzV3ZzJuUWdjZjltLzhxYk1oM2pXUmpsNVBpaExpNlYrdklaZ0FDWnB4R1ov?=
 =?utf-8?B?SzUxemRZWDZkbFlEcElWNWFmSFFPRW43R2JJK0JTQ3hNNGJrbnBXOVFUb2pC?=
 =?utf-8?B?eVBvU1F2T1pDVnMxb0xpTkhwcmdCWENQTU9vdXJqL2RkUjRDUkQwdktwSHVP?=
 =?utf-8?B?S2VzQXg2am8weVYxYUFJdDdtVjJEWkJVdHhOU0J4K3lQTEZhSytmWjRJWVZs?=
 =?utf-8?B?Vkt4SmhZV25UQzQ0WGRoMzE1N2lUUUVYVjFHMEVHK2djbHF0aGZRdU9BQ3Mv?=
 =?utf-8?B?VzVqTWhYZVZOalY0b1Jyblh6ZHVMUktBb1hLSm83MzlHbmxidUlGTG91eWRF?=
 =?utf-8?B?QWRhdGhLa3E4OFVFdXNhWmQrK3RXSlVTTERjQ1dhQTVPcmpCWEZ4UHNibzVs?=
 =?utf-8?B?YXpGdGhxcXZFNE9lWTVzYjkwZktRd3dqTTlqcjVqWmZvRXVBbThHMnZZUnlZ?=
 =?utf-8?B?eng2dXJxY2g0b2hTYjNPTGIzTkRjM1lRcjVNR2VqUEg5eUNZWFJaSHV0RnFn?=
 =?utf-8?B?cHhJK29kYjBxQnFnV244cnl5WDhPZVFkZVNCUVpndlBwMCtKTUdpMTBzOEJO?=
 =?utf-8?B?K09qa1FkSW40N0Vjb2NvbFkydG1WRXlhTUV6YmV2c1dFMGlwTmxHSVRJQS9D?=
 =?utf-8?B?czBNdTA3QzRCYWZHZy84amJWdVlnMCt3MUhIdUlTYWEzSUFRNzIvQ3JZVVZZ?=
 =?utf-8?B?aTVFQ1lnOGFuOFdvV2g2dXNzRnA3cnE1L1pkeUhRTDEzYUhHeFF5N1pERWNl?=
 =?utf-8?Q?mY85U7DxD36fS0Wyqk8ZLLnwj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6982c59-1b20-4778-892c-08de0c8863b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 07:48:26.5070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ptbOBLmi6Fe+mxyXXs22UZdbK+ywIazelb7Je+e9SgI/9BFR6o/Ufh0BRfu8nJ3+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582
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

On 16.10.25 04:31, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> While discussing memcg intergration with gpu memory allocations,
> it was pointed out that there was no numa/system counters for
> GPU memory allocations.
> 
> With more integrated memory GPU server systems turning up, and
> more requirements for memory tracking it seems we should start
> closing the gap.
> 
> Add two counters to track GPU per-node system memory allocations.
> 
> The first is currently allocated to GPU objects, and the second
> is for memory that is stored in GPU page pools that can be reclaimed,
> by the shrinker.
> 
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: linux-mm@kvack.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Acked-by: Shakeel Butt <shakeel.butt@linux.dev>
> Acked-by: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> 
> ---
> 
> v2: add more info to the documentation on this memory.
> 
> I'd like to get acks to merge this via the drm tree, if possible,


Today is the last day before my vacation, so bear with me that I will only have time to look into it when I'm back.

Christian.

> 
> Dave.
> ---
>  Documentation/filesystems/proc.rst | 8 ++++++++
>  drivers/base/node.c                | 5 +++++
>  fs/proc/meminfo.c                  | 6 ++++++
>  include/linux/mmzone.h             | 2 ++
>  mm/show_mem.c                      | 8 ++++++--
>  mm/vmstat.c                        | 2 ++
>  6 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> index 0b86a8022fa1..76e358274692 100644
> --- a/Documentation/filesystems/proc.rst
> +++ b/Documentation/filesystems/proc.rst
> @@ -1088,6 +1088,8 @@ Example output. You may not have all of these fields.
>      CmaFree:               0 kB
>      Unaccepted:            0 kB
>      Balloon:               0 kB
> +    GPUActive:             0 kB
> +    GPUReclaim:            0 kB
>      HugePages_Total:       0
>      HugePages_Free:        0
>      HugePages_Rsvd:        0
> @@ -1268,6 +1270,12 @@ Unaccepted
>                Memory that has not been accepted by the guest
>  Balloon
>                Memory returned to Host by VM Balloon Drivers
> +GPUActive
> +              System memory allocated to active GPU objects
> +GPUReclaim
> +              System memory stored in GPU pools for reuse. This memory is not
> +              counted in GPUActive. It is shrinker reclaimable memory kept in a reuse
> +              pool because it has non-standard page table attributes, like WC or UC.
>  HugePages_Total, HugePages_Free, HugePages_Rsvd, HugePages_Surp, Hugepagesize, Hugetlb
>                See Documentation/admin-guide/mm/hugetlbpage.rst.
>  DirectMap4k, DirectMap2M, DirectMap1G
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 83aeb0518e1d..c606b637f3f2 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -523,6 +523,8 @@ static ssize_t node_read_meminfo(struct device *dev,
>  #ifdef CONFIG_UNACCEPTED_MEMORY
>  			     "Node %d Unaccepted:     %8lu kB\n"
>  #endif
> +			     "Node %d GPUActive:      %8lu kB\n"
> +			     "Node %d GPUReclaim:     %8lu kB\n"
>  			     ,
>  			     nid, K(node_page_state(pgdat, NR_FILE_DIRTY)),
>  			     nid, K(node_page_state(pgdat, NR_WRITEBACK)),
> @@ -556,6 +558,9 @@ static ssize_t node_read_meminfo(struct device *dev,
>  			     ,
>  			     nid, K(sum_zone_node_page_state(nid, NR_UNACCEPTED))
>  #endif
> +			     ,
> +			     nid, K(node_page_state(pgdat, NR_GPU_ACTIVE)),
> +			     nid, K(node_page_state(pgdat, NR_GPU_RECLAIM))
>  			    );
>  	len += hugetlb_report_node_meminfo(buf, len, nid);
>  	return len;
> diff --git a/fs/proc/meminfo.c b/fs/proc/meminfo.c
> index a458f1e112fd..65ba49ec3a63 100644
> --- a/fs/proc/meminfo.c
> +++ b/fs/proc/meminfo.c
> @@ -163,6 +163,12 @@ static int meminfo_proc_show(struct seq_file *m, void *v)
>  	show_val_kb(m, "Balloon:        ",
>  		    global_node_page_state(NR_BALLOON_PAGES));
>  
> +	show_val_kb(m, "GPUActive:      ",
> +		    global_node_page_state(NR_GPU_ACTIVE));
> +
> +	show_val_kb(m, "GPUReclaim:     ",
> +		    global_node_page_state(NR_GPU_RECLAIM));
> +
>  	hugetlb_report_meminfo(m);
>  
>  	arch_report_meminfo(m);
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 7fb7331c5725..8455551b93f6 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -260,6 +260,8 @@ enum node_stat_item {
>  #endif
>  	NR_BALLOON_PAGES,
>  	NR_KERNEL_FILE_PAGES,
> +	NR_GPU_ACTIVE,          /* Pages assigned to GPU objects */
> +	NR_GPU_RECLAIM,         /* Pages in shrinkable GPU pools */
>  	NR_VM_NODE_STAT_ITEMS
>  };
>  
> diff --git a/mm/show_mem.c b/mm/show_mem.c
> index 3a4b5207635d..fb99465616cf 100644
> --- a/mm/show_mem.c
> +++ b/mm/show_mem.c
> @@ -254,7 +254,9 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
>  			" sec_pagetables:%lukB"
>  			" all_unreclaimable? %s"
>  			" Balloon:%lukB"
> -			"\n",
> +		        " gpu_active:%lukB"
> +		        " gpu_reclaim:%lukB"
> +		        "\n",
>  			pgdat->node_id,
>  			K(node_page_state(pgdat, NR_ACTIVE_ANON)),
>  			K(node_page_state(pgdat, NR_INACTIVE_ANON)),
> @@ -280,7 +282,9 @@ static void show_free_areas(unsigned int filter, nodemask_t *nodemask, int max_z
>  			K(node_page_state(pgdat, NR_SECONDARY_PAGETABLE)),
>  			str_yes_no(atomic_read(&pgdat->kswapd_failures) >=
>  				   MAX_RECLAIM_RETRIES),
> -			K(node_page_state(pgdat, NR_BALLOON_PAGES)));
> +		        K(node_page_state(pgdat, NR_BALLOON_PAGES)),
> +		        K(node_page_state(pgdat, NR_GPU_ACTIVE)),
> +			K(node_page_state(pgdat, NR_GPU_RECLAIM)));
>  	}
>  
>  	for_each_populated_zone(zone) {
> diff --git a/mm/vmstat.c b/mm/vmstat.c
> index bb09c032eecf..b4df2b85739f 100644
> --- a/mm/vmstat.c
> +++ b/mm/vmstat.c
> @@ -1291,6 +1291,8 @@ const char * const vmstat_text[] = {
>  #endif
>  	[I(NR_BALLOON_PAGES)]			= "nr_balloon_pages",
>  	[I(NR_KERNEL_FILE_PAGES)]		= "nr_kernel_file_pages",
> +	[I(NR_GPU_ACTIVE)]			= "nr_gpu_active",
> +	[I(NR_GPU_RECLAIM)]			= "nr_gpu_reclaim",
>  #undef I
>  
>  	/* system-wide enum vm_stat_item counters */

