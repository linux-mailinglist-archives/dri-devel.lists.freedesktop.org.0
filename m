Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39EC5AE76
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 02:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BCB10E21B;
	Fri, 14 Nov 2025 01:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P2pfErw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A1710E21B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 01:24:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5IL2b4UsXLb4+rv//ls0sWXN6gZxLB/z+MlnUQK3fUR5O+29uCgHPa1UmLUFSuIahHuw65EwT8c4lH1yJn+qwDhXl3/dzxGEADt0GcEd8XHTteCF6PxyeKGLB6Tk6r2AoNHEAP/ugoPQReb8Hi6CEeENACZFXFHj/ALOnusieGB0ABtmtDh3MhzUL4zwHJf84CHbsHhXynl7oxdPFGL8ilLwEhRHHSlmCzDuVdamDgSDDUx1auMIFqg7BjbxNAQcsgz/l1Dou7EoPzMAL5IvQR76q4etchb3bGTj8WjWuv/WnYOYnYFYj7/HbwUOUoEqm9PYkTzyPprVOJi4fla4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooRmFueGoOYGN6E4IZs4ppsf6l/QSftRiyCKXERqvH0=;
 b=Ixs+iBai7Ryft49DI48x3ODLhBc9m5bqwxaTGsUSf7VUArGC+H4O35I5+PKM5RtjyQaaZA3rNFrDr0HkRaypLHuVcXxBi8nvfxiMN6fGwgaq0xRGhEApjocluvVvt/X2b8EoWgT3sF8DeCOnQzpq9DNg23Odekb2tCsoR57Nsd8RQlx7dcXqr7b0eMzoDoL2P7e02cYLyjqGK2k/HCEgi2bZm6a+yFSGcLZ98srl14Iyk4uIsy+3+2tAKnKySN97GYMRMj1cpIK2UyKySJII+xU09dezeEKPTYRhksziN69oWrmOd45HIR7ujq2KPnOOiM9Dy5/NlZSbEtWFIdJ+7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooRmFueGoOYGN6E4IZs4ppsf6l/QSftRiyCKXERqvH0=;
 b=P2pfErw1tO9vL8tbP3hSwMMqKA2FDIN/c6z4z20adQnA9iPFNHWezwcARUGHbxmGwGdXNo4L3zzbPxpJVFGgrnpY1MDpd5qWhrbksgZpIeIjBdnhE3KYLxApsU7wwZA2NPKzQbGkVsJPBafYLh2UI5ONyqMDdIhIOJ6gqfzivyqXX0klhyBSAH3ZC0cFC9abAtViwO7fJT2dBF80i55ZjetzTcfj4DmlJ3EwrBavbArBHTo7rFCU3Hw7KShfeSu9URzYs0ANzDR+nQmpHLrOmMf4LXW/zPHBX/8J6a4PBLLPEAoanuyPYL5DzhjbR/vrligjmy8537xP8t4EDqE6Ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 01:24:24 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:24:24 +0000
Message-ID: <406bad47-1637-4891-b418-31f510382384@nvidia.com>
Date: Fri, 14 Nov 2025 12:24:17 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix override of entry in
 remove_migration_pmd
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251114012153.2634497-1-balbirs@nvidia.com>
 <20251114012153.2634497-2-balbirs@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251114012153.2634497-2-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::22) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f4d1544-c97f-4ff7-2b06-08de231c8bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkE0cjFMUUFFM29yVjgxSU9MZmw1dUIrME5MN2NyNHR1bUQrSzVqTC9yRUE2?=
 =?utf-8?B?aVBRNDlUZHZKWlBOM05Rc3RWeEZHNFhDZDZpTE5RRm4yMFpiRlJNZ1pycmxn?=
 =?utf-8?B?ZXpSQWdjTDlWbElVeEpuakY1ZHBQWHMxM0RYNGpiQlZOK0tkdmtjRllUNGly?=
 =?utf-8?B?THF0Wjl1cUUyZEg1VDJwTU85bi9zaUxVa0JwZHhta3htamRuamR0b1pzM0Rq?=
 =?utf-8?B?b1BvWFhtbVJydjV6TkdpNFNIa1VuN29keCt5Vk1sUzVTd3Frd0FWNHlMMkVZ?=
 =?utf-8?B?SGE3OHBXMDRtdEw4RVhnVHFEaFRVZFpiUVYyaWhUWmhnWXNmWHprSjVKakhq?=
 =?utf-8?B?QkZzWkNvejdNaDRMNUlDUjVSNE5tNE12QUtnSHNZN0RqWTJCU0VHeUxPYVAr?=
 =?utf-8?B?SVh2VWt0ZWN0NElOTXlXSURqY0RJOTZWbE4xeUlPZit2bUNwS0pid3ozaXlV?=
 =?utf-8?B?VGVEb3ZKTTI3TlduMmVoQ29Pc0tyUWxpZC9rQVFteitqckpZV1dnbVJDU1FG?=
 =?utf-8?B?N2hUSEIxVW9ZUDdHRmVOQUlEUDFNMHVma0t1c3NPc3lRbkUySVk3K2RrZ1NZ?=
 =?utf-8?B?MHNmZjlxSHlxclpKcUdFOGFYR3N5djFEZXQvVS81OU16azRCTXZGN1YyV0cr?=
 =?utf-8?B?R0VuYW1yTzhBRk9mMUJWNWF4bWp2RTliQ3RZVGVYakF5QjlaS1lnZzMxR3lx?=
 =?utf-8?B?cWVRM0NwUkljZDJ4RFVUc3FLM2s1OU9nYmc5VUVobGU3MW9vK3NZM283U0FG?=
 =?utf-8?B?Yi96d1owS3o0VEVKMjBTMUcvZWNaVGZqSDBrNkdvQW0vN3NxOUpaRmkwSkxX?=
 =?utf-8?B?NzZlTzYveXhwdEx3VlNIY3lra2k3NHQxNWpSVVpOMUpRR3hQTkZpQitmd2N4?=
 =?utf-8?B?TXF1dUhSaWd4dWdqbGFYYXFPeDM4eW1ycTlaMFJuZ3JzV0crV0w3UEVCTkh6?=
 =?utf-8?B?ckVWMTBZcjlHZ1ZYOHloTThGbkpVanVSQjgweXgvNGJoQzJVekg1TktTTHBs?=
 =?utf-8?B?N0Vob1pPZW1kYWZ0aFZWREtOR0RjK01CekxmSGVTNGEyOTZMK1h4U0xRTE83?=
 =?utf-8?B?MVU2cDJ1RHExN2Q3MDFQRWJGKzJabHI1SFlHYWtXOTZpcHowZG9MTzdyZFA5?=
 =?utf-8?B?cGNzK0luNmVzdXVNYTRsWDlHb2VEdy9VSjdXRXB6WGErVmZYcEhsTit2MDU1?=
 =?utf-8?B?RzlESzg0QzNJS0p2WE41R3BVSS8xMnc5YWZPSXVONTJta1FDSDlCZDVUNXkr?=
 =?utf-8?B?OTh2TzNONjc3aEJITnI1LzNPanhRazFUWkNDWC9OZVIyUkhYSmkzT0tzTHQ2?=
 =?utf-8?B?ci9LZU1GU0E2R1lZZHNUakhpLzJ1VHlKSERNMGw5R1MwYXVmNWdSS0tXLytv?=
 =?utf-8?B?S1ZRakJHWFdLb0Q0VFpZc0w5UmE2WHArWXNubUp0eU1yOVBiTjhJWHl1MmtV?=
 =?utf-8?B?MmljU3U2cEFXYWZNeWtjcFBueXpKQVVJVFNzSFpmZVRiS09CdWM1Slo2cFJJ?=
 =?utf-8?B?elptSzNhclRJRVRiL1J5bUdoSXBMNzA2L0VBc1FVcXZJSzFkWUxQS0xvTkxj?=
 =?utf-8?B?c0haV3F6eGRpdUpVZmhQbVRLa3Bxd2xja1NzaTNHT00vdFhQTzVEMmYwWU5l?=
 =?utf-8?B?d1BoZzdXOTdYQVpQYXpHQldrUTgyMjRhRlc1dFdTMitpTVNSMFVLMWxRTzlC?=
 =?utf-8?B?c1BhUUw2VzJ5M2JVb3J1NDNIVzdWU0RxY29zSGxWZFBJcmhnbWJ3NEQyYjJM?=
 =?utf-8?B?bWl5Yk9NTlFPZm9xTUd4Vm5HaTlkczFoUWp1NCtDNmdQaVcwQVBUbWxGWnZB?=
 =?utf-8?B?VTZrdEcvQXpoSVEraUl6OFBuaVhxYTFhMjlPMkx1Nm5HQ2tCQjlZZ09NcGJv?=
 =?utf-8?B?SUd6UXBaczNrU0tadzhxUGcxMTVZVFhXSWRCWERyVDRLOUJnbjNObkE0WjlC?=
 =?utf-8?Q?Qi8DW4YngZ6mhSujN7UZLjYcSaL5jtGU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1JZa3RZc255dTVVVmVma2s0MEo1SUNLdUxzaE8yazNkbXFZSWRPY3UvT3Rn?=
 =?utf-8?B?UXBnM0dHQTFKQVhnYkxVZ3h0QXBBck1xeHRUZjhDWkZEQVN1VGtZa2NQUkNX?=
 =?utf-8?B?K1lQd1NJSXFGSWdqbG5rV0VQWHE2QzY5dzdSUEFBME4yUUVTb1lybmoySmxK?=
 =?utf-8?B?N2N4VDhZOXN1UmhTNkhhRS9IYUY2S2h2WXQzTGQwZlZmWkRaS3BpZDZlaUdk?=
 =?utf-8?B?NTdXbWZoZ0lIUmdCWStONUN4QWU3ZDlqWXdEWjFrbUJqRWpNcjJ4RFh2V3k1?=
 =?utf-8?B?RjNoVExlazJoeEwydmRDM0FUY0VSTUE2NnhoUm1SSi9SbWthMVpJYnZtT1lH?=
 =?utf-8?B?QjAvM1pZbGllUURqM1pOMHAzWjRpUmtpNEV2QXMvamhremdBTkV4ZzhJeWIz?=
 =?utf-8?B?c2RmeXRZL3pQRHp5ZmNkaUxHSEs5VlZ5VFk4SGR6N0lvNWEwbnhzbk0zbjJk?=
 =?utf-8?B?MVZTREUrT1F5TmQwUHBzSE9YZlNyMkg3ckFzSGgvcWhmWTFnY1pKT1BGbEEx?=
 =?utf-8?B?YTluZGxQcS9CUGlDNWYxRVVzQlJKNWhMblpOUFFzVFNURjJubjZocnBTVm83?=
 =?utf-8?B?SkdrT0FWUmhhOFV4b21idVVHQ1dpVnBrT2xZN2VVb0NOVWVseFVkaFFqVzR6?=
 =?utf-8?B?eGUrdnNtbUZmSXhRc1Z6Tm9VSVByd3pMSERBWUZvL1JXMmJGL3ZpWHJ2U1BZ?=
 =?utf-8?B?YnNqL2VuVm1hT256UlNVTVNtMnE4eWoxVGl1ZnUwNTlpdkhwcWttenF2ZVZG?=
 =?utf-8?B?V2xhTU0xZWZmMklTMEJvUjRLYzNpa01rNmRhRXZEeHdXbEp6K1JKRG94bXA0?=
 =?utf-8?B?a0U1ekJXODZwbVl2SDQrYWRpcEY5dFZIMk1CSS9BTHVxZkRTd2JyQ1oydTh5?=
 =?utf-8?B?cy90RWsxOThLc0VYZHpQTGpwa1l0U2ZveUFGRk1WMGZHMlhyaElEaHN6Z3dX?=
 =?utf-8?B?SUQ1d0hVUFNZNVF1SkhJUXpCcjgxNFg3dExLZ3N5NENCRm4wR0dNNmg2V3Y1?=
 =?utf-8?B?SWhEdjRTN1hNVklLYXNBb3gxMUtyNjJpUFpHVkdEdXVmTll3UVl5aXVVM2Uw?=
 =?utf-8?B?bnBhZjN4aUhJL0JiUkFMeDNITEZnaEwzTFFKL3hWRWtMZ1pJQUFOUUNjaXBP?=
 =?utf-8?B?N21mUzBYdXhiTFVBREdnWExTQlZ5QURWZThVdktPUWJJR0ErWHgzNlV0dFpJ?=
 =?utf-8?B?b2NGQWpCRy9MNVBzQmd3aWdDV21DMm9QREcxcFY0VUNwNGJlcmowN2VaTnZZ?=
 =?utf-8?B?YjlrV1M4WnZuOFExY2NLZDJzSFNJOHFJWmhsd1VadUloWTN6ZUV5UlBjSlND?=
 =?utf-8?B?Q285WnI2bGFEbnd1RVdLZmFQZERSaWFKMnVKRGZsVE5GRllZdVJ1bVV1akdQ?=
 =?utf-8?B?V1krRUpsRmFTa3JMdnIwU04wU280YjV6cGZEUXovcGV3UHgzVFZLZ09GaFZQ?=
 =?utf-8?B?NHhPRDVFeVBrR3ZxYStlQmZRZnplYlNaRWZwTVdOM1RKQjlDY3NrTzEzMHQx?=
 =?utf-8?B?cEZRSFNTUFVhMXdGTWR1Sk00RitTc1lOZThERnNvZTN0Q0dDR2FRck1OYlls?=
 =?utf-8?B?VlZBa0RrZHg5d1lmMmdBalZEYVlpS3A3UFkrUE5PczFtMXg3cDViUy9YZnd1?=
 =?utf-8?B?MHdnaVdxSGxSSHVXYy8xWnJsWjdsblRFZ2pkc1ZhVEo2WEJwVGVHWEFEbTg4?=
 =?utf-8?B?RmZQNDlaVjJ4d0s2Z2lkREFMY0cycCswdGJFanI4QXpkWjY2M0lneUlSMGlr?=
 =?utf-8?B?VDI4Qkp6a1RPVThSbWFLZFkzcWVVRXUwRWk0QmZkS2NuNnVzdXF2WUJuaFRN?=
 =?utf-8?B?N0ZabTZGWk1LellRY3g1d20vUDgwY3VlUlpuOTR6M012TDlHVk5OcW9KRzNy?=
 =?utf-8?B?VTJxSHBueEdNd1daaml6OEN6bTVQL1kvRnVYL3YwcmR3dk9CYXBCRmpoNjVN?=
 =?utf-8?B?U3JKVURiRUxmVXpucWZFb0EwOS9vQUhaeXdLQm1WQUp4eHlIdnptYXFhaGtE?=
 =?utf-8?B?d3k5Q240VjNlNU1HY2ZFZlBNRThXV2ZnVGFFajRqaHpXeGY5Y29FaTJwNnZN?=
 =?utf-8?B?VDZ6MUxjNDN4SU1JSVBldE1KMkR1YXE3VXpaQkxCZW1mN1JSTlFvUUl6ZHZ2?=
 =?utf-8?B?TnVGSFpXVFpuY0VadGdILzExR25VTEdyWDJmN1Bod0V5am91L3BBSVJUZ25W?=
 =?utf-8?Q?1KcSbGGrHgOik8Pd86uuLA5HvTCtJ7pGaSwmRI4tGu35?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4d1544-c97f-4ff7-2b06-08de231c8bcb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:24:24.5572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDkgBpZZB5dXcO/9E3JOjiHg+PnLenE8nzx3DVoJKRoi6Mmc7fFr1fEfQKbQywYyNt0H9ye8g//BWdgTWuF2iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769
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

On 11/14/25 12:21, Balbir Singh wrote:
> Recent changes exposed a BUG in remove_migration_pmd() where the
> migration entry was being overridden when the folio is device private.
> 
> Use scope local entry for creating the device private pmde. Make the
> pmde writable if the migration entry is writable by moving the check
> is_migration_write() prior to creating the device private entry.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttilä <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/huge_memory.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Hi, Andrew

This patch fixes a bug in mm/rmap: extend rmap and migration support device-private entries
in the thp device-private series.

Thanks,
Balbir
