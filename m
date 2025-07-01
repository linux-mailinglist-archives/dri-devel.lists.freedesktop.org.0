Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73CAF06F1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 01:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E9110E6A2;
	Tue,  1 Jul 2025 23:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CjF/sm6f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66E310E686
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 23:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYvz90lPkhLSEvXw0RP9PbB7WtazOLlZJG2BDX02wgsWmJoBneM03ESwUiYyoVyZfDpzRFnoUb/54qmlVUp8CdKfhgP/EDlj/US3oDorDAEOsMvAEtIoajtFHr1MHtDWefNnEodkwPmpl06g9ZudXkZyofIl0Z6ELpEIt4MwdxtJ87Rogu+rALf71DLKXMrOc70mNO88X88NXxH4+c999F3FrJhRtY3Ga9hTyAWN6yvYP2fVR0Qm6ESgvBNkBR61PBER7xy0tj26rct31LrBiQcSIMwOrs94+c7KBy/LlxDtcyue01XVXvT9ggI5b62jH+QAcpFfTyrZEDDIAHGHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0/gJ2/2FlKa2QDB8aJoMxe6r+/GTjKi9n/g3wc/RRE=;
 b=xF8lkZVHN6a+XcoSeX2fyeFlP1Ysqi9lqSB+9FoV1K1Kb5ls+HnSEuqFi7S/ZxIKcbwV/3xo52kDhHPkpTTf41qzalvDRXEA4rTmP2O4nlGMLlRyykT9lTK7zsf6RPxdKRrqfsCZMZONstOtRV8aFBJn5x8ScC+owHRVyIgckE2PtRQwTmsrxW54GkuuxCSe4Bas2f0QzMt36OSnmeTGxrZsP+VVgMRpxgJhvMZQC1KSgP2N9Tkb86B3Ru0y2vwIbxPCHlgDeu5Xv4QUcodJNlR04/VqDM3XAWngNnSRihzZemM0tPdQUjq1qkWa9rfaiIFk55r3dD0tR+wvMVLkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0/gJ2/2FlKa2QDB8aJoMxe6r+/GTjKi9n/g3wc/RRE=;
 b=CjF/sm6f5ZFdfSNxE4iJooAFEa/QhzDqkhd5Jcz1QPaVZJOqViuDROGnvrZEuw+10kXai9us8h9O8dYCVVdIdRnVvJjaoS/EF9NFho0ATU8G/nYE23kla66COROZCEWPktOCA1A5uvDvoiEtWNeGvh5y2ep/3B75CVGG/exT+wSBo+PNcpcXpb+DB3fm6cab3wCKx+9uM9CP+mQFGsbngTPY93nQJGlW30WJgSqakHL83z32YLc5NA1yTx7yyGkBUpDWPt2apNv0zKhSW4TZvuWH1Wxl/BxvNtjoCLmqU5T2mN6E/4FksjZQRGWDQ/qhMVOfFxLN6F4TacGWO6bu6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB9145.namprd12.prod.outlook.com (2603:10b6:610:19b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 23:26:12 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 23:26:12 +0000
Message-ID: <58944930-7017-4610-9831-d4b97cbfe10e@nvidia.com>
Date: Wed, 2 Jul 2025 09:26:07 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: drm/ttm/memcg/lru: enable memcg tracking for ttm and amdgpu driver
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>
Cc: Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250630045005.1337339-1-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: c65b778a-9227-4e06-c62a-08ddb8f6aa96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWJQemxIa2xEN3lCejREbE1VVU5sc0w0QUx3Qkg1eE5oTXBkaUdzNnNLSUFp?=
 =?utf-8?B?T2d6bS8vN3FXTXc0MER4MnRiWllCanV1TmNmU2g2MHNWYVhEdXZqZEd2NlNo?=
 =?utf-8?B?cEhrZUYyckZjT29CMzFjcWtjMXN0TXJzWUxJVDdEYjVsQUlRS3l4bUVaTUdr?=
 =?utf-8?B?Z3ZqYVc3TmcrZ2tPUTE1Ykd6OFJOUUJlSFE3QUVjYmUvUURjVjlKb1BXQytp?=
 =?utf-8?B?dm1uNmhKQjZNS28vRi94QngyMjhneVoxSTZoSmNIczE5bkpkYldNK3BpOGl3?=
 =?utf-8?B?cVk4Y09OOGFmWWhqTFNGYWJmRTFpZFhWTXRUdUwvVzIwdk1TYUo1WkZwUHdM?=
 =?utf-8?B?NExibGNuWEsvQ2F5LzhESDh4UUdFRWZod1RrdDNOUlU4K0dGaVpWTDdURGdM?=
 =?utf-8?B?ZTQwVmVMdTRhRGZHQkZDcExCZFBVS0FrM2hZOStHSTFTQTlpdzhsZGUxaTh4?=
 =?utf-8?B?ODRMcFJ2MnUzdTVEZ1ZtSDFEUVFiMU1rWnZwdGdmMTBDMUhjUW91Qmt6eGh0?=
 =?utf-8?B?NkpOcGh4RmRGN2x1Y3pOR1I4dWhUTWNBTlhEcFpvZkt2OUdNRzUwMndwM2gz?=
 =?utf-8?B?eHJWL3pENFBMMGdLcU9wYjVKYjdzK0NLeWZoQUVqVWFvWW9tRndTb3d6TTN5?=
 =?utf-8?B?eXR4bkVad2NaaHFLbkh0bWhIS0VjWXN0aEhodzV1WXVJU0FzVCt0TnhWV0tI?=
 =?utf-8?B?cUtXZXdPa2k4SnI4WWNLK2luUEp3dkpVekFPTFhaS2FQa2gwMktPUTV4MHg5?=
 =?utf-8?B?UkQrYmxFMG5jM2RPd0Njd29TNUI4cTJBeUp4eXc5ZXNzQ012ZUVaemdTYjBY?=
 =?utf-8?B?dXdlallMNzllRjZuNWRoRjFNZ3pJNTFqbnUyeC9xQ3NMdTl1aGFqZ1U2QmFZ?=
 =?utf-8?B?STQ0aDFXTWF2NEJPb0lSejBTQlp5OFlJRkNkaGovSU52OHJvb0g1THlWWWdJ?=
 =?utf-8?B?dnlNRGN1S3lwTmJKeUZqUWZ1WGllN0E4WkdXb1JMaTQ1cERmOTR4RndKYVYr?=
 =?utf-8?B?ZjA4MERaVkdJK0FCMmRsWlVPYTg4SDFHNmQ5bDNYc1lybmhRcktaN3RuSUNW?=
 =?utf-8?B?djhlSGd3VGhBNXlybVVtUVpIanNjZk8zQ3U0UGhmQnhzaHcvUDcxVVRmRlJI?=
 =?utf-8?B?MEYxc0xHdGY0UXBWV0tLTE0zakxQaUJNWW1qZHdLYktGei9MalMxSzF0enFF?=
 =?utf-8?B?OFdYaVlYYlVTYU41R2hPTTlEV3FrUXNEcGhFYmx4ejZ6bHp5bTRaYTlOWnVC?=
 =?utf-8?B?OVFSNFZPN01BcnlHeTZodGlPaGpadEp0WXYzNnY4VTRSNWx2ajBSOTB1Y00r?=
 =?utf-8?B?YXZ1RGFzb0ZmeWhPVkhnSkV4Q3V3L3hFVGZrRGxsK1RHMFJlRDQyeC9oVHVk?=
 =?utf-8?B?MGhWODhyL3pCbUMvVlVRZ0w1RVR6Q2pvcUxHZFhxWVVwODRhcGw1QmFkWkNZ?=
 =?utf-8?B?bUV5eDJ1VVZ5enhCMFlmSUhUVmZrL05Ua2g3TEtrTlROSG55NEtFb0prdDI4?=
 =?utf-8?B?eTlkRDVIR1F0SWxWSWd5Y2xSMmZwa3l5dG1ZYlppaDhVTTZNTlRvUEM3RU5w?=
 =?utf-8?B?ZXo1OE1aN0pYUUIyYzdlUENXQTJjcTJURjNIek5ZRGVVTkRiS3ZEeEI0SW9T?=
 =?utf-8?B?Nmo3V05RN2laSFNCMmtUanlNY1FQLzY1eCtQRHN1Rlh1dWJteUUxRHZYVTV4?=
 =?utf-8?B?bmVyNnJFekJUOGJpcDN0Y1NKdGZpZHBySGY1bm15UE16clcxUHJyZE1XYytL?=
 =?utf-8?B?YWpDb2QxMWV3d05MeFV4bzF4cUV5TmpRRzZPemFHcG10MFlyR21xeWVSTGpi?=
 =?utf-8?B?Rk1mUEZkR1BCczloOEowNkcvSzg3bVR2dnU0N1NjbGVjQVJtbVdIaWI5WVhS?=
 =?utf-8?B?aEEzcVE0b3Vxc09GdzhvQVI5MURHYlRRb3NoYzVLQzZacCtDc1RCTTkzSXo5?=
 =?utf-8?Q?tZsJFGQa9Ys=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0ZpRlhKSWJuS28wb0t5cllrSFNsYko3dzJRdmJ2MW14a1pRTHVDdjUra2Jm?=
 =?utf-8?B?cVZoM0hpRDRaYzJYaG5lRmFDaTJXaGcvS0lLc28vM3VlbUhnVWFQQkNqTEg3?=
 =?utf-8?B?ZHYrUlpGRkE0QWlzOHQwc2d0MmE2Z2VrUVplN1U4d1BFemd3Vk13Y0JHV2h2?=
 =?utf-8?B?bmFhR0l4MEFCMXQxbEhiWWxOQTdTWVRWdTRvVGpLR0l5VjAydEI1UXAxTk5o?=
 =?utf-8?B?RlNSVDVlTVhKNjYyM2FDVFlUVW05anQ3YWdZUE4xamROZ3ZPWUYxODdSVmtU?=
 =?utf-8?B?K0V0TlhXTXAwOWtzY1dEbThCR3NBZDBSY3BRakV4L1luTUUxYjVzaFBHWmlE?=
 =?utf-8?B?VWxGWjBQakNXSXU4MHlWNS9MWFdOTEZGTHRxZlFFclZuazFnYVJsRzA4cXZ3?=
 =?utf-8?B?ZSthOGhKdjY2WFdsbytLc05FVTR3WlN5aDNnbTNJajB3M0UzY0NhYzYxaTIz?=
 =?utf-8?B?dFljZzRVQzdjZFFNeUhWV0Jub1pNZmVNUjZ2ZW4yZ2xFb21vUW5wYlExYjVz?=
 =?utf-8?B?QWpYWkc5MFJZSHBNK2k4d1hoc2pFOGxZOGR0RittMm9ReWQ2RWpKQmsxbDNP?=
 =?utf-8?B?S2d5UHg4Q2ZMMkd0ZUR6VlMwMityTGVUa3lWb1R1VW1GWDU4R2pqa3lDREoy?=
 =?utf-8?B?TkhmTDhzTmgzZG95ZnUvcE5Xa3lsYUdPVXZZQ2NoRzhxS21oTkRpT0thcXBx?=
 =?utf-8?B?UmZIWkhFTjZsa2hNamp3N2ZJeEIvRVFiM2VQQmgxblNOS1MwUmhFR0dlOTNT?=
 =?utf-8?B?dkRrUkRsZllnV1BkYm1TYWt3Zkd3cFFFUHZRaDc5VDlFZnN3aFZRRCtRYVRx?=
 =?utf-8?B?dG02RlJOcDhBQ3c0NTg1S096RVUrUDRFek1vNXh5Zm9XREhRQUJwWmVCdzAx?=
 =?utf-8?B?TUgxOGMybEl5U096aVZ6NDFUTjRQbUhROFphZ0Z3dWpJeXBldk1hT3hGQTVD?=
 =?utf-8?B?b0Y4TWFFOG52ZGwyelVRTmFSTXNXRkFuMkJiM3VvTFNmQ0xMU0xMUFF1ajho?=
 =?utf-8?B?QzJnZW1MN3FmMy9VSFBFZHlBQlorS0c4b2g1TkxZSjlBSm1xbUl2bzBKNGtP?=
 =?utf-8?B?emxac2Fwbyt4enBGbmR3TUR6STVtZXZCcFpzR1Z2cXhxZE9nZkhON05zT3hK?=
 =?utf-8?B?TU9rRUtpOVYxZ3R6dEcvSERFVUhXRFZkTjVxQjJWZldSUlBDNFRIRjhRZGJL?=
 =?utf-8?B?YmVuK2VYMDl2amIyMFNDemtGNllrWkhQSW0yc2d1YU5kQjFOcXF3TmpwNWhk?=
 =?utf-8?B?QlZKNmVHcDVIZDhEanhJdlJYZmZXY1RPL0RnOXRud0lnR0N3MWFvcEs4eFph?=
 =?utf-8?B?MWVWN3RMTVZiU3Bac3VBWVFMY2h2dEZ4OWxPSGdXNCsrT2kwWklBZHlmTUhT?=
 =?utf-8?B?K3ZaODZaMTcxaE9FbFIxeUswaUM4ZzNrZ0xucVNwbnZUNXpmQ1ZBb2s2bHM1?=
 =?utf-8?B?UDBIcWwxaWgzUEUxNWMxbG5ndFN1QnY0U1VTK0QxSkxVTUx1dnZKdEpXY2pD?=
 =?utf-8?B?K2xmRm94dnFxWVZkUXA0VEtJdC9HekxZeTdidmdUQWhoTHdpSiszZllOZkJt?=
 =?utf-8?B?TVo4Mk1LMXVXQkVlSjhETHpUTW9mSGlyV3hZWlNyblp5T2h6NmY2bkJEMk82?=
 =?utf-8?B?WUR4UmMraFFtNVNkZjhuK29va0Nva3NtMS9LNWRwbXJySFNiM3daeERsMXN2?=
 =?utf-8?B?ZDFOWGxrTlJtOExYc3dObE1sSW8rdTR3eHc5Wkk1SVd6Uk9rSHZja0haNXI2?=
 =?utf-8?B?aWhWUXpteWViejVHTEZNRDduUFp1dFVNVjlrR0cyT1hSdG9Mbnp1Z2pKUEUx?=
 =?utf-8?B?STRlbkV3a2NpMFgrWHBsdFBLaE5NUHcyK0hVcmxGWVJsTTV0VG53ZGhKeFkx?=
 =?utf-8?B?b2JQOHpOb0pEM1hUdThBRHN5WkhtanI5Q096Ymc1NGZucVU5OCtIUlJlTzJS?=
 =?utf-8?B?eWZtbld0aW1HZWFpRldJYm1LU2NBTDN0d1h2WVZ0UThmQmtjZlN4UUg1V2xo?=
 =?utf-8?B?TVlKb3pYcDYrYTduUmllNXo3U1ZtWGlvMWdxOWlqdmtDWWZ2TnRoOHBzVUp6?=
 =?utf-8?B?bFFEek9LL0xjcHRvRVA0RFpaNjlXdVhXMXNIdnBHWXNOYVNkdWkwMXhtZTUz?=
 =?utf-8?Q?eKii4fk8tcTS+V+lDKSU/NmiV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65b778a-9227-4e06-c62a-08ddb8f6aa96
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 23:26:12.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZc7d1CXK0qkjgzxAoEzBPMjORkUwRR2otyv+JS85Cz4DoNmPgYvxnkOh7uJUBvIW7nVU9I6eAwKzDdI1bNTjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9145
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

On 6/30/25 14:49, Dave Airlie wrote:
> Hi all,
> 
> tl;dr: start using list_lru/numa/memcg in GPU driver core and amdgpu driver for now.
> 
> This is a complete series of patches, some of which have been sent before and reviewed,
> but I want to get the complete picture for others, and try to figure out how best to land this.
> 
> There are 3 pieces to this:
> 01->02: add support for global gpu stat counters (previously posted, patch 2 is newer)
> 03->07: port ttm pools to list_lru for numa awareness
> 08->14: add memcg stats + gpu apis, then port ttm pools to memcg aware list_lru and shrinker
> 15->17: enable amdgpu to use new functionality.
> 
> The biggest difference in the memcg code from previously is I discovered what
> obj cgroups were designed for and I'm reusing the page/objcg intergration that 
> already exists, to avoid reinventing that wheel right now.
> 
> There are some igt-gpu-tools tests I've written at:
> https://gitlab.freedesktop.org/airlied/igt-gpu-tools/-/tree/amdgpu-cgroups?ref_type=heads
> 
> One problem is there are a lot of delayed action, that probably means the testing
> needs a bit more robustness, but the tests validate all the basic paths.
> 

Hi, Dave

memcg is designed to use memory (rss and page cache) as a single entity in a way that users
don't need to worry about the distinction between memory types and need to think about their
overall memory utilization or discover it with ability to overcommit via swap as needed.

How does dmem fit into the picture? Is the cgroup integration designed to overcommit or limit
dmem/both? Is the programmer expected to know how much dmem the program will need? May be this
was answered, but I missed it.

Balbir Singh
