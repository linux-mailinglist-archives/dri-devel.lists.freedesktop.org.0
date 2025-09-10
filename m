Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B14B52178
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 21:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 874FF10E9D6;
	Wed, 10 Sep 2025 19:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hLJ9BDDK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2063.outbound.protection.outlook.com [40.107.95.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6694610E9D6;
 Wed, 10 Sep 2025 19:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdWUoz67J4qHpyxz7zl90KtXTzdjB1CIWOzEYfbzTYnFzCN2L/XGKTCLOuSsjkgrP2ERwbej5G2EmuYBvM3bdTqMZvU4ZIa4LJanhoVvCRLs54mbGGWnq42wtMrQBRVpKSUjgDNtkN8wbfcNEwd7jASzWuEtu32sw2NQFdGzcQk024USsUm0RHG2HkXJzxBpits44sobbaW3y6AKDYzzn7W5hKTTeJIHTYZOxTPYTMLRXsl8HtPekvsVi6AaVgDg6Vt8++N0iDkeLf6Vg5abbhqpdKrY3ZKLOvdHO49CUj1kdAzerZtVoMUvLSKlqLaRxtS/+2xz5xQNHvwSzXP+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lLNreJB+7/1o858ttLXDul9AK4zlD+/T8eBq6+/+zg=;
 b=IxHtw/gZkyLfpINGVxI9DSj/F2XTgVK7ExDe2Q81FkWJLwJ1emtIUxv+sj8sTON8d/1kLJYn5Z9nz0qexKcQ+SXxXJj5ccwgyweOyGxHseW1BpnxoWTEwMOLMTQGxvbdnJ/g7ABQOknmRgCDodx/1ZGbYC8nYsXXKJ+4kO9oMgBWgzBur7sAWqod2T1YeMz8xSIsLAtEickdy/ASfDpXo4B1hsKm4+b4GH0Lno2a/klEeG2JiMlzgjWpUC3DP/U5v+HK1eiwQ1VDqX8fKLXaUjZ4P8L7EvCXve/ed1KC9CT0Xw5CaM3k5gnt42tgRj7uOlpVkNJAFXauuBBFIPvHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lLNreJB+7/1o858ttLXDul9AK4zlD+/T8eBq6+/+zg=;
 b=hLJ9BDDKM3FXIEqbCAFjZ4qIrs7uvfRu7k/MFKHr2Otq2RYEeA2PNFZQPx6SQJil5GSmNIIeyqn2TgAwufLaijTh42mtz5muvLyNJ3I4q1dsALkY29532LB5ggIXkxJXNV9cxJdOmaVYHXqiuzNPKdebCjiq4sCs2u1uWJNB8HA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 19:54:28 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9073.026; Wed, 10 Sep 2025
 19:54:28 +0000
Message-ID: <c51f7e55-04d1-474f-9fcd-028fe3201aba@amd.com>
Date: Wed, 10 Sep 2025 15:54:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/14] drm/amd/display: create a function to fill
 dc_sink with edid data
To: Melissa Wen <mwen@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250618152216.948406-1-mwen@igalia.com>
 <20250618152216.948406-12-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250618152216.948406-12-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0312.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10e::24) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: ff726e53-0de1-44f5-0a89-08ddf0a3d9bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3F5R0daMlhUcGpUQW5vKzQ3UVY4bi9RbEV3WSttQ1lCUGRObDNqdW94ZTJu?=
 =?utf-8?B?dzhwZXpZclF0MEdSTEpRTzlsc0hMYzR1dW9Na1NHd2wvckduaFh0VGtkOTd3?=
 =?utf-8?B?cTBvb1hGR0Z5ajhCTXpCaHJobHFlSVlKRVhVSEF4ZFdYNTRtZXhLSFRKYTZP?=
 =?utf-8?B?RmhsWkx5VmJhOHpSaWJUUFFmRmhQRHpSbTIrVTR2eWFTTk9hencwc0oveHZQ?=
 =?utf-8?B?Qmp4MXBjR3RNYmR3bjd1Q2xBOGJmc25mT1lGcXFDTG5nb2NsN2hyRkI4V29w?=
 =?utf-8?B?dVBuc2EwSzVZSFIxaHI5YThtTmVNNmhBSUFsUk9rREhFbjdQSUNEMDVGMjRv?=
 =?utf-8?B?Q2JhY2x1TE42em50NU80aEpYYkNDS2Y3SXhId3NobDhrZ00vckd3Mkxlb1FQ?=
 =?utf-8?B?YVdxamM3QThyM1dLUmJPSXk2L2xtWXBWTFJ4VFlvK3ZNT2tBWEpLK0tuSURC?=
 =?utf-8?B?ak9lKzJia0F0RFA5YXY4N0gzUFJNc052NllPd2I3OGxiSHpMS251a1ZjRDRx?=
 =?utf-8?B?Qmh2QVR2QmtibzByYnpPWExJY2hiZ0hSV1N5U04wYlpsRTNUVm5QaDg0VnQ0?=
 =?utf-8?B?VksrclNQN1ZXNXB2UU5LcldMcFdRV1VHaUp6WitHbkxpTE92QlpLTlBDdk9j?=
 =?utf-8?B?Q3Y2QmJOcUNkZkwrRGtuYVF3b2pmdFVCOERlNloyelZTQ0dRaFR1aXFKa0tJ?=
 =?utf-8?B?RUVGRG0vcmxFbGMxVElKSXRld3lJL09hSVFmWVRZTFV4aHBpU1hRc1IvYndL?=
 =?utf-8?B?T0kvdWZZU1dqeWFFellIMmlUdkxvbjNqWlNDRXFvcE84UjdWT0VUT2hiUElz?=
 =?utf-8?B?RlRiYjdVSHZZUUFLRE4xeG9zSVYxN2pTV2dSNHRBT3Q2dFFOYjVpUWlhZU1M?=
 =?utf-8?B?ZEtoRTVzR3hhVTRlVHJkYmVNcVA0ZHVRRi9wc2ZNMXprNVEvQWlHSXlxaWtX?=
 =?utf-8?B?Q0RnLzNwaVF2WU43LzdLVEZzRWZHVWlnQm13dFMrOFp4RnZRSmxIQ3lkSWZS?=
 =?utf-8?B?TUlZZ1hEZWUyN3N1V0FtcVR6NTJmSkRLUHNCbFJmc1NWdFhtb0RFTHRidVJ6?=
 =?utf-8?B?VGNXWkFLeWZ5WFcybmt2Mmc2a0trZVFCYjFUcjUzejhHMmhhUnM0Mi8wcS9t?=
 =?utf-8?B?NGFwbXJPOFFLR0RDTkFDTVZXanhlZml1VlNxTmx2Tk1jUWRVTVZ3TCtaV21C?=
 =?utf-8?B?ODQxUnI1Y08rNGhLVy9zSFNUbzFJN1FtYjB2Vy9aWDNpOHh1YnBoODFDdzFn?=
 =?utf-8?B?VFZxaU1DZVBPK1R3K3l0WExQZHFRUFRZWFRjOVA5NGFHS1JYUW9ud2o0RFkv?=
 =?utf-8?B?MXVmQ3R2RWVUOXQ3aDVaZlNaZGZ4a0MvY1ludGh5YXJhVzZpMjJBVzNxbXV6?=
 =?utf-8?B?Wnh5WnB4RkM3Ri9aM1BIR0JBYWMrNjlkcURzTnNDTFB0MkdkcU0zZzU1UE5T?=
 =?utf-8?B?TTBWN25NU29GVHczZTZkSlN0N1ZwVlNYanAwVjkwY01rdElwRFMvVXRwaUJo?=
 =?utf-8?B?V2JLV21IVlRGd1JpL3ZiRHpyS3Rac3gvb3JCNDd4MWpnS0diQjVyL05MYWlL?=
 =?utf-8?B?SHo5UFdKdE9JYzIwTzZyK3RBeXplTk1XQzlaVlZ4WEdMWWdyRkNNSHcvSXMz?=
 =?utf-8?B?Skp6ZlNTZjhwY1RGSi9xR3JVQktLK0t5dTg4ZFJlei9GSk16cFlRYXo2c2x4?=
 =?utf-8?B?MTdNTC93Y1BwdEZLdE5IbHNhL1FSM1UramJwM0g0ZXZRTUJublhQS1gyRXha?=
 =?utf-8?B?Mk5zY29UVXpKZ0VRdk5Gb0lXUTB4dFY3UHJaeHRRNnBSSkJ4TnA0aWhxVkFS?=
 =?utf-8?B?amQvSFpTNk91bFNtK2x1cFQvNzZlNHRyMlZFdkY0b1lHM0RiSW5CRTZUL2kr?=
 =?utf-8?B?SHZLQ3orN2tWZThXWHBJOUlpQXp3R2NBV253YWJjVW04cklhMkRKUkl3NWtY?=
 =?utf-8?Q?bT5sf97MJU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RitZbVNhNjhmR1dmTStkY0QzbFhaL25HbVNjWXIzUXZRUmhJblJHVmsvN0VX?=
 =?utf-8?B?YUl6aFFteml0Zkc4UmpDUmVycS8zcXdyR0F1YUZNeHhrS3I5LzJpQWdLNXNi?=
 =?utf-8?B?ejJqVjZJVkhvVVlFY0lDalErcTk1bjhJR1dXZUZDSmVmYlNGaVVNaXo1Rk1Q?=
 =?utf-8?B?UzJrT0NKd0M1ejN0TzJOWjFVd2FNSWJqS0kveW5CYUZwK3lPVEhrMW9rNEti?=
 =?utf-8?B?V00zMmovalMrdXN1amYzSk9XbEVBU3BaK2F6VFhPWEhSWHNWSXpFUGhQdUl3?=
 =?utf-8?B?R1ZZMFM5WDJuZVloUjhFM0dyY3lwaDBWY0FoeWtlV2pKckFOeFVZSUZSZ0tW?=
 =?utf-8?B?Rk9UaG1DVUw0OTBPV2RuTWdQSW1wWm51aGwwWFFzckprdDU4Z2MvVTZnUFlG?=
 =?utf-8?B?YWZVWFVIeE1XU2s1Ri9UYnIxTjY2elNHejA5ZDUxWWlTYVVwSjFnTlFCRWpP?=
 =?utf-8?B?N1JyM3cwRHFURlpXc3ROdWRkcDNGYU9DN1VWTXlLbnNHWUEwNE9hZXI3Y28z?=
 =?utf-8?B?M0ZaZVRLOThJWk9wbHFzb2NhSlBTbFBmaUdnK0lHeU84MVptVnN6VHI4QTF4?=
 =?utf-8?B?VFZrVjFQL0Uvc2Q2U0NTckc2NXcxWkdUMG5CS0pjT2plRk1CNTFnMlQ2UGV6?=
 =?utf-8?B?Tk8rRldIVHRYS1lWRE9UUUlEQVYwYVZ6d2lSbzQxWGliUXNyRFZWU1o3eUtk?=
 =?utf-8?B?MDZXTlk3SmRudlZUYVdoZnJzNDZDRTRiYlhRRGwrZE5MV3ZaWmZVVUtrRk03?=
 =?utf-8?B?NDEyN0ovem1YOXNhNWd3enQ1cjJEaGNEVTdRV0dsT2t6emJXQkJHYWp4Tnhs?=
 =?utf-8?B?U1VtMVgwM04rM1k0V1Vick1vOUlwSFAxa0tiVTFWaHN1b2s1OUlsUHMzcG16?=
 =?utf-8?B?N3Jrc1NEbjkxWTNtWDRzZzR2dFZYL0tTMStMRm5Td1NodVhaV0xCSW9hZHE2?=
 =?utf-8?B?R1E0TW9jb3d0d2hLM3lMdEUrbXRWR3JIalZMNHBFbkNuMVZvVHphZVc5R2Rl?=
 =?utf-8?B?bUtQRnNSaHdIZ21lMmlmcTlqbHE2QisxcVAreHhySU52aVBvbGdwZ2U5WGhB?=
 =?utf-8?B?QU03STU2bnR5TmlTeTNFdW90bjdvL1o2YzJuTmlyaGx1TmVZV2VQZXVLa01B?=
 =?utf-8?B?ZDBvbnd0NjA3OVplbUdGWFAyTnZqamxlR2NHYm0vcG9pUFpWWUpDZ01WeGw5?=
 =?utf-8?B?ODZYTkRSQndvc2dVNmJCZTBoTW9EekVWUVZsRE05Skd3V2hnWVhlTSswZFFF?=
 =?utf-8?B?MGh2Q0VRK0pmUmUyZWdlR0RTa1NTZFNVQUZwNDdrRGFXdVN0SFExVm1Xdk5U?=
 =?utf-8?B?ZUJLMTdocGxGKzdmSGdWZG5DaHJRdVg1MXVOWjFFSys4VGpabUJBOGtEOUJ4?=
 =?utf-8?B?Tko1Qmg1Vys3RFVZeGpiSVBuYXhNNGM4aXJ6bDB4MkZVOWt0UnRjTWQzOFNi?=
 =?utf-8?B?Y0hIVlpGSjd6VXNhWDZLbzdMVUpkNUludTFYQ29FUVBBa25taldIMmdNU3pF?=
 =?utf-8?B?Y2YwQnArVG5xWndUQ3RDeEFHclpnWENIRk1xdjd5dWxwckdCNzdndFBnSlRE?=
 =?utf-8?B?cEpES2EvZ1pyQ3laQ2ZSN0VnS3dicVRGOHRsTEN4YU14eFVqSmVaYnQ1Vk15?=
 =?utf-8?B?bmpGZHdjS0t6amVhRzlqUWFVUjV1SmhDcmplVVZFa2JSWm5aVUFGT3g2TW53?=
 =?utf-8?B?Y1VKTVFYYTRVZWcvUGJ0cE40SVVhSkxQd1lTV0c0eGMwOW5BTXJUdmI2YnpR?=
 =?utf-8?B?UWZPWmMwdk5ubm0veFZvNGVGd21lUDJVNTQ1Z1RhdmMrVUFkYXFQUUkxb3Vy?=
 =?utf-8?B?YWpKYS9IYmQ1YkZ1WHFtMi9vOHRQSHN2TWdKcEJoWUNyaGlpQStQVFJKRGdr?=
 =?utf-8?B?RDJJZmNhd3I1ZUl4WkQ2cFFKTEtHSTBBelNjTCtUbXVESXNadEN3WEhQSmVR?=
 =?utf-8?B?TTI0dERyMFVWYWJaNlNGS2x5SHRlYmRUVjVEV3p4TnRqYnp5WHFsVjcxQWd3?=
 =?utf-8?B?WStMZ0QvOVpiU2xSejd4RTVJeFNLUlZ6bXJTQmQ2OHNCQWZxU3NqcllzNVN3?=
 =?utf-8?B?SGQ2VHlUTllnVFpvOWtuV3dZMmJGOFY3cHJFOXRBaStSblFTTDhsVnVlazRK?=
 =?utf-8?Q?sjBnsjHc+snZndMJhIaP+oKjF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff726e53-0de1-44f5-0a89-08ddf0a3d9bd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:54:28.2552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ji+xVBXC2OdZUYDubIImI8bBv81IwcBE3sKJ/vMGDbak4ldteU4BITc8c9c53P+cY25ERK4jjGpYBCeDvtuN2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598
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



On 2025-06-18 11:19, Melissa Wen wrote:
> From: Rodrigo Siqueira <siqueira@igalia.com>
> 
> As part of the effort of stopping using raw edid, this commit move the
> copy of the edid in DC to a dedicated function that will allow the usage
> of drm_edid in the next steps.
> 
> Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
> Co-developer-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v3:
> - remove superfulous cast (jani)
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c      | 8 ++++++++
>  drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h      | 2 ++
>  drivers/gpu/drm/amd/display/dc/link/link_detection.c | 3 +--
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> index 3f8295a68a72..b4ccc111fa08 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
> @@ -17,3 +17,11 @@ bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>         return (memcmp(old_edid->raw_edid,
>                        new_edid->raw_edid, new_edid->length) == 0);
>  }
> +
> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> +			     const void *edid,
> +			     int len)
> +{
> +	memmove(dc_sink->dc_edid.raw_edid, edid, len);
> +	dc_sink->dc_edid.length = len;
> +}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> index 7e3b1177bc8a..f42cd5bbc730 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> @@ -7,5 +7,7 @@
>  
>  bool dc_edid_is_same_edid(struct dc_sink *prev_sink,
>  			  struct dc_sink *current_sink);
> +void dc_edid_copy_edid_to_dc(struct dc_sink *dc_sink,
> +			     const void *edid, int len);

Same comment as before, please put the definition into
dm_helpers and rename the dc_edid.c to amdgpu_dm_edid.
and function to use dm_helpers_ prefix.

Harry

>  
>  #endif /* __DC_EDID_H__ */
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index 957d74ff1294..891d35274f69 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1401,8 +1401,7 @@ struct dc_sink *link_add_remote_sink(
>  	if (!dc_sink)
>  		return NULL;
>  
> -	memmove(dc_sink->dc_edid.raw_edid, (const uint8_t *) edid, len);
> -	dc_sink->dc_edid.length = len;
> +	dc_edid_copy_edid_to_dc(dc_sink, edid, len);
>  
>  	if (!link_add_remote_sink_helper(
>  			link,

