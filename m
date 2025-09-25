Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE33BA04DB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65210E96B;
	Thu, 25 Sep 2025 15:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AjstX7gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010014.outbound.protection.outlook.com [52.101.85.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEC910E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:27:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLZDtCKIGVU3p8Yw/u3+lu/07RyReBLePNqjYovx9m/HBToeV+mS+fV+Pog30+oMXam/HNt1zxkipgEpxwiYzdMCQrtb/Rfrchk1QnjqIt5Pb1WdPdkYgZMviPArOad2C+icSUF5iap+dJI06xJXiBP5pGIuY3hQsvr+i2+uRSOcu1GKSzPYnKUYk1C88B0ZDCjize5q2+aZxbhsg/BEGL8DWIsgh0i/fX9DKfH7hYKX6M2yUtLzhSFJnC1Fs6GA1NzCtE3vquh0cK2BI5lTs+ZSxSKPqPgZ1cedBkMSx40w7dPlqfggomLyYLp/VzAocjIyzLzci17nvCivb53uHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msBaqe8V9S5Lx45j7lw6tGBteG9ZpwVzb4/oMm2edlc=;
 b=Fp3LxsqdIMbV4El8cJpVWMYO6+9oVn/hdcWK9H2CNmE5U2h6d1f0ft6NrHOgvhUyVv9ne4Xdtl4NpJGnHJJ4eS/PC8D3ZqGJH3IAVcZuzC0rNHfMS3D9yaSDdrScT8Jwo0eduACIGDzlZNJgk9q/QudS/LwFzelB/vkRwNTj9fl5+VeyYNOcJ+Qcwt2vRVTwJo6wRNl/4VQUD3YCz1os5inJ1Tc+XnKt3JBdifKo/3Svib0lB7pubnGb7mWak+x6mMZheLKYpLtaJvn4e+91VXWNBvkQN4p1Mcwf4+hPfpb1BoQfkun1T+OX8BZU0LUBFcrM63imP8vwAN3rve1fuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msBaqe8V9S5Lx45j7lw6tGBteG9ZpwVzb4/oMm2edlc=;
 b=AjstX7gf9D5YIofMFOtSe9LW/A3jIhBKUBDMeSd0n/Txg7FvrqfoWBKrowUupRxZ7kXjhQcriDv6ey+jjIW8jVDZTe/KtPFuzV4nOp3QHStLYa4riIeIRMBOh4RM9QNUAMrmTMXazBrLAZ6JClVKW63G5hEMdGoCXRvN+f0tveT1BJcz9/8Un7CV5Bvujd3ZZHeNl174Ndguw7kJTVyrpu+iThwnRKiwFynY/EaY6WzcZFV5oUx+BAS0OroJOCs3jW5DvfDek7LZtYl2V0CmJ2kutRh0TU/xyW/41sJ+Jt3g0O0536xcoTsHS9p73RxFaLTZ1EVozPHlmj09dt5Lsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW4PR12MB7240.namprd12.prod.outlook.com (2603:10b6:303:226::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 15:27:42 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9160.010; Thu, 25 Sep 2025
 15:27:42 +0000
From: Zi Yan <ziy@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, Balbir Singh <balbirs@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
Date: Thu, 25 Sep 2025 11:27:38 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <7E859D31-9C00-4B08-84C8-2EC34D2B06FE@nvidia.com>
In-Reply-To: <tz2rrz626f7667i2wtwb4pegqm4ga7sr2xfpzipy6y5qchxycb@acx2unx27zsi>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
 <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
 <891b7840-3cde-49d0-bdde-8945e9767627@nvidia.com>
 <c7a2ad6e-68cb-4689-b72e-6e7ebfcf5e64@redhat.com>
 <4534DB6E-FF66-4412-B843-FB9BC5E52618@nvidia.com>
 <tz2rrz626f7667i2wtwb4pegqm4ga7sr2xfpzipy6y5qchxycb@acx2unx27zsi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9P221CA0003.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::25) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW4PR12MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e8b91e-1a8d-4175-38bf-08ddfc481182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1BkT05WT0MySjdjYmJkN0JUWWRoMnF1RFFGanlQOXVlQXFRVnJmOWxSQ0k0?=
 =?utf-8?B?WnNoQ0luYUJLeXFIRkJ4aWVSSDJTUHZEN0JHZWZneFJKWkpkK3JSWFlKOGNp?=
 =?utf-8?B?anNVQmZMVStpdjJacmJrbUlXQ1lZL0hvTERFbjhOOTl0Q0NYU3VWMkl0eE4r?=
 =?utf-8?B?emczUU95UW12M29XU0xkamJHQUlkM2QwSldBcnJqSFd1U2I3TzZCclZzMUZl?=
 =?utf-8?B?OUkwdDdWbGxVRDJKZ3VKZWoxWERSb3ZabG9BZVhpMFUwTW1ZT0VsV2NNNWJZ?=
 =?utf-8?B?ZmYrVkdsYzl0VUNUb3ZVVkR5Z1VtRHdNYjZFcWdiMjdTOHFkdG1GbENWYTZI?=
 =?utf-8?B?VXRQdklFSGlJMytjbFovK2lybXlSWTB3Yno0TFJYSHA1Z3RjaCtFeUxESE9P?=
 =?utf-8?B?MFVTOFBkcUZrRTJ1TTdxQVBNd21mNkFvSTdPNnVpa3M4TWg2N1NzUm9MQ29y?=
 =?utf-8?B?L1R4UWVhT000OFBvWnlOaktma1JkbUJJZWRoK0V6L1RacmVBNmhBZ1RMZVlx?=
 =?utf-8?B?VUp3dkxlQ0M2WWVNUkRIR2p0RHRxdStUV25PZ25sNnNBcytkdnFxQVhXVVJK?=
 =?utf-8?B?a1M3M0FEMzQ5WVkycGZtUWdJclZzNENGRVdYZzRWbDIwNVRuS1ZEU2FsRmZp?=
 =?utf-8?B?c1VZd0VPbnl3dVNLcnJHY1V2S2xqSERwRTNNMEJ2cGJpM0JkYU1QTm1CTHQw?=
 =?utf-8?B?RlZOdVhsM1VlVjYzcE9OTkJ0cklpRkdsZ1lPQktMbHh2V3F2by9tZXgwbHp2?=
 =?utf-8?B?aFlMc2tVTHdRMUhrdXRkYW1Pbm00WDJaNlZvYXRleGlvN3FVMVdUSzc5bkw4?=
 =?utf-8?B?b0FWc3lqNXFEY2UxTkNQUDdWR1l0dHhVYVFsLzRiaWt6Z3B5NG9XK3d1WCt0?=
 =?utf-8?B?alNCWTREQ3RnOFRlWmpxMzRQT2pJNVB3b3FRWWJEdVptT0Q5ZlRMN3pHLzdw?=
 =?utf-8?B?d3hrclN4Umx5a05DRTcxd1FMVnlIOGwzbEE5M0V5djViM0l1TUpLNUR3WU1P?=
 =?utf-8?B?SnBOUE1lVjBXQloxaHdBUWt3TmVFcmFpamZjazFqSmtZczNPNGhON3VOa1Fm?=
 =?utf-8?B?Y2ZqcFdlV1A4K3JuSU5MQU5GOHJqOFRubFRsU1ZuUENWUno3TW12QksxbEhM?=
 =?utf-8?B?dzlGTXZOT0NadEpTWXRJaDdRb09DcEZnSGNwajhqRW9rNFZWWjFnMVlZZ1dw?=
 =?utf-8?B?Und3MFlTRzFZbE5vNllBUG1manc1ZGxET1NqcjVrTFBGWnlGRERzSUg0Tk94?=
 =?utf-8?B?c3lZM25XUUZYYmFqU05jSzlnbmExdnZ4RVFSVTBiQUxaOERPYjVGU0tHUWF2?=
 =?utf-8?B?M1QvYXNtaFEzYW1PZ2pzN21LQnF5bCtPTUl5Y05MdjN0eDd3bVRnMlNxaTJD?=
 =?utf-8?B?NWpDaFVVaXJNYkYydUI5SU9IRFZyUlNLYnBSd0p2QVAxNTNEWEwxVnNvTFFH?=
 =?utf-8?B?WGppUHNOMlp2dmh2b2p0TXV5R1htRDJNaVRlOEJscXI5UEc3c09uZ2txZlpL?=
 =?utf-8?B?N05wMHpBZlQ4OVYrQm84VStkR21FMTVxV2VYR01SZC9NR2tQcXVqRmJIK0Za?=
 =?utf-8?B?UFBYdmJscVNHaEVScDUrSmdQbmwyUGl2N2wyL1BkL0ljVjVrTW5tNytNSlpo?=
 =?utf-8?B?V1kvL3NiWkoxZjk3YWZJT2h6djZXNUNkQWRGWDlLY0ZVZkhMRklGVCtSM3Ni?=
 =?utf-8?B?R3J1T0hMY1FiU0habjlyUjVldHBLTDZXL0ZmaWRoS2cxL3BSVjlpdVJIbnh2?=
 =?utf-8?B?eDlIeUhhaHYreUFxYVU4NnZMQTBzQUJUazdNZDlvc1M4SDlLQkVETW9ZUFBU?=
 =?utf-8?B?QUZSTlZUcUJ6QmdodlhNaHgwMXNBeUZlY1pVNjNmL09xd3A3UWhQUnExcUZI?=
 =?utf-8?B?aWJzZ3dGNTNObDJFaWVyMTFSQ2htZGZtYlpMeUtRQnpTS1p3QzErNFRmZTQv?=
 =?utf-8?Q?fs/ks6HOwto=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNXTitZa3F6azhaL205dVU2MG9JNHUwSlJGZ2tNTzE3bkRSRjY2TTMzb0VY?=
 =?utf-8?B?YzFNV2pPQmdmVFRNNmJ1TWpvWWFHbWNyVld1TW01eVJuU2JIRldTdjlVNDBF?=
 =?utf-8?B?Qnl5TDBhUnJRZ0t4OW9nelhBTll1VE93V1QvVTdkemN6RnZYblNadTU0a0Zx?=
 =?utf-8?B?YklhN0pCSGVpQ25PSXZ5MXh0TEVWU3JQM1JGVDJkbnY4cjlnTVMxek56M2xt?=
 =?utf-8?B?eVN6Yk1HTkcxcVlLeWxOSkF1ejc0eU5ianJMNmNIMmVYc1NrNmJQS2oyMkRn?=
 =?utf-8?B?MWhSUnVkTmxWZGFTR0tOaHhGYXZhV2JQNDVQOE5MUEdvYTZhbzlCZEtiQjIx?=
 =?utf-8?B?djdUNFFZSEJTaG1pRUlaSjFYWE9NL2t2SGZmY1Q2T29JN3dmNmhvVzFjSFFI?=
 =?utf-8?B?NEhqNmpaVTdzZm9oRVQ5WVJhRHZRTmd2WlNLVndQTFNuMjhSMXhudHlwK05M?=
 =?utf-8?B?MHp6UDlQRjFQWlM3QUFLeXdTOG84VlllZVlJNWFVSWd6bVFZS05WdHlOTnFa?=
 =?utf-8?B?Zm84dHo0NFVtemlnT211b2Ixd3Voa01NS0x4enJuY25vTkxLV0hwTUZEM3JD?=
 =?utf-8?B?ejQ5U3JYY2ducEpadDJJUjE0OUEwWFVPUkZaNU9JcnJuSWRpUjJYSFNRbmtD?=
 =?utf-8?B?Y1U0cGVMbFkvZVlsdlRLTWJsVFU0Y1RBSDVmLzlCc1REWTRhWm9wdnJnWElD?=
 =?utf-8?B?eWhsQTZmQzdXcCszUWs5WXZEeFdGaW5zSEE5cjVOMXEvZlV4d0h3VEYrVmNy?=
 =?utf-8?B?cUhVSDdnQ1UzcjlCeCtyWGtnMjdlS05EVGNQUm15NnRWdUlRK2lWdGUxWWFK?=
 =?utf-8?B?THV4d3poVUF5Nm56eGhzZWdLQ2xWV3dXSDhkcmFhTHo3OTR5Z3lPN296RWda?=
 =?utf-8?B?VUZzZE5WbFBSYmZKQzc5emJvS1YxTitjRklNSGdUMmphZGc3L2FzQk43OTRP?=
 =?utf-8?B?b1p4dXhJRjFoQTdCRFVDZWttWUZBblIzUWhUWnNjbk13ZHFVSHZPanZBTkVF?=
 =?utf-8?B?WUZpTkdmcGNVMC80Z3E0ZVhQNDJPN2RSemVCbjJZSUo3eVYzczh0ME5jMyto?=
 =?utf-8?B?Mm5KTG9HODlCbno5Qy83YVBjVWRNeXRML0tyRjB6cGVLOEJxS1pPTHpyYVd0?=
 =?utf-8?B?aHFWdmhwVVpqalllZ0xaVnhQV1lteHBLdDNYVWt6V1JyYzJsUGJlbXM0Yzlr?=
 =?utf-8?B?akFETDFFOE81eWYvVGhTRnZTU0xNUVlYTVo5U245S0pGaTFYTUN1YlBjQlFH?=
 =?utf-8?B?U3NhWFVBMmlhTjZaRVh1Nm1rdVFxTDNKREZJMVE3VjZEd2xlVWNKWVZscmFL?=
 =?utf-8?B?eWNrQmpEb0lYSUNneW1tTUQ3eTBnRWt2RnJYR2hzMlpyS3l0Qm9wbVR6MER6?=
 =?utf-8?B?YmlvM3AwM3h3Q0tjbTZUSy8rU2Y0YXNndDNjdFVVczZ0d2xHQnRIejFkSU8x?=
 =?utf-8?B?TkVjWWdYQW9XQjZlLzR5eWRxd0dnWWZvTVF1akxvY05zL0tZSzQwOGpkZG0x?=
 =?utf-8?B?aTYxN2QzU2VKOXV1QVBsdkNibjduYk90blZNbU9xdS90Z2pGRFErMTM2U0tr?=
 =?utf-8?B?bzN4ektsTVNrdWtxVXRVQ2dXNno3MTVPNVRrVmJobkUySVVMNFZNYUg3RFBZ?=
 =?utf-8?B?SFNaOG5BdmFyeUlxaFFWM0psRDNPR2JDc1JXSmxUNEtNbm94d2hxSWczWXht?=
 =?utf-8?B?WHREVGhvU2JIK3BFUzI3Wks3c1JleU9oN3RQTEN2M2VSS3lnNGNlSG1XWi9m?=
 =?utf-8?B?SnBwY2tnaUlmUzZyRHR2M3J5YVZpSjdtQ2VTZExkWnVkU0hOMU1hSmg1b3lW?=
 =?utf-8?B?R0NMVHV5ZE5wbERXbzdqQXBWR0VZV0xzSEZ3MEFCRit5emhUQS9Na3hEdkFp?=
 =?utf-8?B?TnFabEoxNyswN09UbnQraEtzc1RKYTRzOFRiV2UxU0FjanhqTU5Zc1Vmc3A1?=
 =?utf-8?B?ajVWZ3dTaDhuZjNjR3dEaTdhQUE5SmN0SXZEaS9TTlpPQXVmUzVtODFkeWdq?=
 =?utf-8?B?ZitGU1JTNFJ1NFBQSnFRQUFpdWpLUU5yWUtJZWM0N2Y4UVV6NmQrS0hoeUtZ?=
 =?utf-8?B?ZWw4NURrUzVqTXowLzZiUzdiNG8yWHlsRHRHZUJyenhzMW1leVJKS0xJbXZ2?=
 =?utf-8?Q?LRK3nHqBwMf1CnrYLlxDPKDbo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e8b91e-1a8d-4175-38bf-08ddfc481182
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 15:27:41.9746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woznbHDlNs/vo/Qvb3h0KGKbSka3u2TZkgHcWdfehLOgwuBMiCFaRbpZD94IEGOa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7240
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

On 24 Sep 2025, at 19:45, Alistair Popple wrote:

> On 2025-09-25 at 03:49 +1000, Zi Yan <ziy@nvidia.com> wrote...
>> On 24 Sep 2025, at 7:04, David Hildenbrand wrote:
>>
>>> On 23.09.25 05:47, Balbir Singh wrote:
>>>> On 9/19/25 23:26, Zi Yan wrote:
>>>>> On 19 Sep 2025, at 1:01, Balbir Singh wrote:
>>>>>
>>>>>> On 9/18/25 12:49, Zi Yan wrote:
>>>>>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>>>>>
>>>>>>>> Add routines to support allocation of large order zone device foli=
os
>>>>>>>> and helper functions for zone device folios, to check if a folio i=
s
>>>>>>>> device private and helpers for setting zone device data.
>>>>>>>>
>>>>>>>> When large folios are used, the existing page_free() callback in
>>>>>>>> pgmap is called when the folio is freed, this is true for both
>>>>>>>> PAGE_SIZE and higher order pages.
>>>>>>>>
>>>>>>>> Zone device private large folios do not support deferred split and
>>>>>>>> scan like normal THP folios.
>>>>>>>>
>>>>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>>>>> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
>>>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>>>> ---
>>>>>>>>   include/linux/memremap.h | 10 +++++++++-
>>>>>>>>   mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>>>>>>   mm/rmap.c                |  6 +++++-
>>>>>>>>   3 files changed, 35 insertions(+), 15 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>> index e5951ba12a28..9c20327c2be5 100644
>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct =
page *page)
>>>>>>>>   }
>>>>>>>>
>>>>>>>>   #ifdef CONFIG_ZONE_DEVICE
>>>>>>>> -void zone_device_page_init(struct page *page);
>>>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int ord=
er);
>>>>>>>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>>>>>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>>>>>>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap=
 *pgmap);
>>>>>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned =
long pfn);
>>>>>>>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pf=
n);
>>>>>>>>
>>>>>>>>   unsigned long memremap_compat_align(void);
>>>>>>>> +
>>>>>>>> +static inline void zone_device_page_init(struct page *page)
>>>>>>>> +{
>>>>>>>> +	struct folio *folio =3D page_folio(page);
>>>>>>>> +
>>>>>>>> +	zone_device_folio_init(folio, 0);
>>>>>>>
>>>>>>> I assume it is for legacy code, where only non-compound page exists=
?
>>>>>>>
>>>>>>> It seems that you assume @page is always order-0, but there is no c=
heck
>>>>>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) !=3D 0, fol=
io)
>>>>>>> above it would be useful to detect misuse.
>>>>>>>
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>   #else
>>>>>>>>   static inline void *devm_memremap_pages(struct device *dev,
>>>>>>>>   		struct dev_pagemap *pgmap)
>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>>>>>>> --- a/mm/memremap.c
>>>>>>>> +++ b/mm/memremap.c
>>>>>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>>>>>>   void free_zone_device_folio(struct folio *folio)
>>>>>>>>   {
>>>>>>>>   	struct dev_pagemap *pgmap =3D folio->pgmap;
>>>>>>>> +	unsigned long nr =3D folio_nr_pages(folio);
>>>>>>>> +	int i;
>>>>>>>>
>>>>>>>>   	if (WARN_ON_ONCE(!pgmap))
>>>>>>>>   		return;
>>>>>>>>
>>>>>>>>   	mem_cgroup_uncharge(folio);
>>>>>>>>
>>>>>>>> -	/*
>>>>>>>> -	 * Note: we don't expect anonymous compound pages yet. Once supp=
orted
>>>>>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>>>>>>> -	 * PG_anon_exclusive on all tail pages.
>>>>>>>> -	 */
>>>>>>>>   	if (folio_test_anon(folio)) {
>>>>>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>>>>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>>>>>>> +		for (i =3D 0; i < nr; i++)
>>>>>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>>>>>>> +	} else {
>>>>>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>>>>>>   	}
>>>>>>>>
>>>>>>>>   	/*
>>>>>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *foli=
o)
>>>>>>>>   	case MEMORY_DEVICE_COHERENT:
>>>>>>>>   		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>>>>>>   			break;
>>>>>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>>>>>>> -		put_dev_pagemap(pgmap);
>>>>>>>> +		pgmap->ops->page_free(&folio->page);
>>>>>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>   		break;
>>>>>>>>
>>>>>>>>   	case MEMORY_DEVICE_GENERIC:
>>>>>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *fo=
lio)
>>>>>>>>   	}
>>>>>>>>   }
>>>>>>>>
>>>>>>>> -void zone_device_page_init(struct page *page)
>>>>>>>> +void zone_device_folio_init(struct folio *folio, unsigned int ord=
er)
>>>>>>>>   {
>>>>>>>> +	struct page *page =3D folio_page(folio, 0);
>>>>>>>
>>>>>>> It is strange to see a folio is converted back to page in
>>>>>>> a function called zone_device_folio_init().
>>>>>>>
>>>>>>>> +
>>>>>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>>>> +
>>>>>>>>   	/*
>>>>>>>>   	 * Drivers shouldn't be allocating pages after calling
>>>>>>>>   	 * memunmap_pages().
>>>>>>>>   	 */
>>>>>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>>>>>>> -	set_page_count(page, 1);
>>>>>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 <=
< order));
>>>>>>>> +	folio_set_count(folio, 1);
>>>>>>>>   	lock_page(page);
>>>>>>>> +
>>>>>>>> +	if (order > 1) {
>
> Why is this only called for order > 1 rather than order > 0 ?
>
>>>>>>>> +		prep_compound_page(page, order);
>>>>>>>> +		folio_set_large_rmappable(folio);
>>>>>>>> +	}
>>>>>>>
>>>>>>> OK, so basically, @folio is not a compound page yet when zone_devic=
e_folio_init()
>>>>>>> is called.
>>>>>>>
>>>>>>> I feel that your zone_device_page_init() and zone_device_folio_init=
()
>>>>>>> implementations are inverse. They should follow the same pattern
>>>>>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>>>>>>> zone_device_page_init() does the actual initialization and
>>>>>>> zone_device_folio_init() just convert a page to folio.
>>>>>>>
>>>>>>> Something like:
>>>>>>>
>>>>>>> void zone_device_page_init(struct page *page, unsigned int order)
>>>>>>> {
>>>>>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>>>>>
>>>>>>> 	/*
>>>>>>> 	 * Drivers shouldn't be allocating pages after calling
>>>>>>> 	 * memunmap_pages().
>>>>>>> 	 */
>>>>>>>
>>>>>>>      WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1=
 << order));
>>>>>>> =09
>>>>>>> 	/*
>>>>>>> 	 * anonymous folio does not support order-1, high order file-backe=
d folio
>>>>>>> 	 * is not supported at all.
>>>>>>> 	 */
>
> I guess that answers my question :-)
>
>>>>>>> 	VM_WARN_ON_ONCE(order =3D=3D 1);
>>>>>>>
>>>>>>> 	if (order > 1)
>>>>>>> 		prep_compound_page(page, order);
>>>>>>>
>>>>>>> 	/* page has to be compound head here */
>>>>>>> 	set_page_count(page, 1);
>>>>>>> 	lock_page(page);
>>>>>>> }
>>>>>>>
>>>>>>> void zone_device_folio_init(struct folio *folio, unsigned int order=
)
>>>>>>> {
>>>>>>> 	struct page *page =3D folio_page(folio, 0);
>>>>>>>
>>>>>>> 	zone_device_page_init(page, order);
>>>>>>> 	page_rmappable_folio(page);
>>>>>>> }
>>>>>>>
>>>>>>> Or
>>>>>>>
>>>>>>> struct folio *zone_device_folio_init(struct page *page, unsigned in=
t order)
>>>>>>> {
>>>>>>> 	zone_device_page_init(page, order);
>>>>>>> 	return page_rmappable_folio(page);
>>>>>>> }
>>>>>>>
>>>>>>>
>>>>>>> Then, it comes to free_zone_device_folio() above,
>>>>>>> I feel that pgmap->ops->page_free() should take an additional order
>>>>>>> parameter to free a compound page like free_frozen_pages().
>>>>>>>
>>>>>>>
>>>>>>> This is my impression after reading the patch and zone device page =
code.
>>>>>>>
>>>>>>> Alistair and David can correct me if this is wrong, since I am new =
to
>>>>>>> zone device page code.
>>>>>>> =09
>>>>>>
>>>>>> Thanks, I did not want to change zone_device_page_init() for several
>>>>>> drivers (outside my test scope) that already assume it has an order =
size of 0.
>
> It's a trivial change, so I don't think avoiding changes to other drivers=
 should
> be a concern.
>
>>>>>
>>>>> But my proposed zone_device_page_init() should still work for order-0
>>>>> pages. You just need to change call site to add 0 as a new parameter.
>>>>>
>>>>
>>>> I did not want to change existing callers (increases testing impact)
>>>> without a strong reason.
>>>>
>>>>>
>>>>> One strange thing I found in the original zone_device_page_init() is
>>>>> the use of page_pgmap() in
>>>>> WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << ord=
er)).
>>>>> page_pgmap() calls page_folio() on the given page to access pgmap fie=
ld.
>>>>> And pgmap field is only available in struct folio. The code initializ=
es
>>>>> struct page, but in middle it suddenly finds the page is actually a f=
olio,
>>>>> then treat it as a page afterwards. I wonder if it can be done better=
.
>>>>>
>>>>> This might be a question to Alistair, since he made the change.
>
> Hello! I might be him :)
>
> I think this situation is just historical - when I originally wrote
> zone_device_page_init() the pgmap was stored on the page rather than the =
folio.
> That only changed fairly recently with commit 82ba975e4c43 ("mm: allow co=
mpound
> zone device pages").
>
> The reason pgmap is now only available on the folio is described in the
> commit log. The TLDR is switching FS DAX to use compound pages required
> page->compound_head to be available for use, and that was being shared
> with page->pgmap. So the solution was to move pgmap to the folio freeing =
up
> page->compound_head for use on tail pages.
>
> The whole percpu pgmap->ref could actually now go away - I've debated rem=
oving
> it but haven't found the motivation as it provides a small advantage on d=
river
> tear down. Basically it just tracks how many pages are allocated in the p=
gmap
> so drivers could use that to determine if they need to trigger migrations=
 before
> tearing down the pgmap.
>
> The alternative is just to loop over every page in the pgmap to ensure th=
e
> folio/page refcounts are 0 before tear down.
>
>>>>>
>>>>
>>>> I'll let him answer it :)
>>>
>>> Not him, but I think this goes back to my question raised in my other r=
eply: When would we allocate "struct folio" in the future.
>>>
>>> If it's "always" then actually most of the zone-device code would only =
ever operate on folios and never on pages in the future.
>>>
>>> I recall during a discussion at LSF/MM I raised that, and the answer wa=
s (IIRC) that we will allocate "struct folio" as we will initialize the mem=
map for dax.
>
> Sounds about right.
>
>>> So essentially, we'd always have folios and would never really have to =
operate on pages.
>
> Yeah, I think I mentioned to Matthew at LSF/MM that I thought ZONE_DEVICE=
 (and
> in particular ZONE_DEVICE_PRIVATE) might be a good candidate to experimen=
t with
> removing struct pages entirely and switching to memdesc's or whatever. Be=
cause
> we should, in theory at least, only need to operate on folio's. But I'm s=
till a
> little vague on the details how that would actually work. It's been on my=
 TODO
> list for a while, so myabe I will try and look at it for LPC as a healthy=
 bit of
> conference driven development.
>
>> Hmm, then what is the point of having =E2=80=9Cstruct folio=E2=80=9D, wh=
ich originally is
>> added to save compound_head() calls, where everything is a folio in devi=
ce
>> private world? We might need DAX people to explain the rationale of
>> =E2=80=9Calways struct folio=E2=80=9D.
>
> Longer term isn't there an aim to remove struct page? So I assumed moving=
 to

Right. But my current impression based on my code reading and this patchset
is that every device private page is a folio. To form a high order folio,
each device private folio is converted to page, prep_compound*()=E2=80=99d,=
 then
converted back to folio. Based on what you said above, this weird conversio=
n
might be temporary until the code is switched to memdesc.

I am looking forward to more details on how device private will be switched
to memdesc from you. :)

> folio's was part of that effort. As you say though many of the clean-ups =
thus
> far related to switching ZONE_DEVICE to folios have indeed just been abou=
t
> removing compound_head() calls.



Best Regards,
Yan, Zi
