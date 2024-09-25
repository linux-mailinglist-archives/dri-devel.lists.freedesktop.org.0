Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8A986552
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 19:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517A10E84D;
	Wed, 25 Sep 2024 17:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aFu+oHK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E5310E845;
 Wed, 25 Sep 2024 17:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jempwdXzC2YrkKQaGZ+XMisX2BEo9pVNVOFElRJiFmJjyGG90BOBB4cxgZqJU03lrjC4R7WCFWkZpOeBumEKj2KDTmIf8TlQtKLsHesO7EtFvNC6puIQ+Y5xBWU2uZyTKRl1U9tySVhtnjv4Y2oa5du+HEAU0fUsvF5WPM9z9Dpr4+lhZCQQapo9OW7LsPRQY093I2GgF7vW/dwNp7W5iF862634VSH2qssc6Zl9Elcl7kxPVUdFN8weO/J/APbQttcLnI/3KmTomcXsQo/+dqlVkygfdfltZV26eDbds8lLjiPe0Lru0TYNwBr5CRJdcJH7GK/DvTNLSAt1JZl3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efAz41krnawzq8VJCvVUXARLT8D9K/g3rG+aD1I8gYU=;
 b=comPsrA/R4tJiPSATDnWfvy8yPgO46OWMkFPQOd1AXkZIke2CSjKj7ZuLO1c3PeBGU5RIQfm1hRmiD5ihYnJJrP2iqFODvvV5fHFNzhSP9o6b+INZnj7/Qrer7c5NMgY6GM3WdOg2bXVZcx89STIBy6HAbO7tmc3CTS5b9iSkeWibnPTF9su1NhDNeypdrmm5/Pb3IC8C4F2h9PLrInSF8zNPhwrhgjTSUg29OM/fPiA7mwFVD+FsbBjGyzQmQC9k1n/hIusyVEZIs+OJYb3eiaEY0RBioLD9WkCjBlQdPX5S3q0aW8LSRwHT8xM0TKLwkBDG51dUBkwX+PoTORC2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efAz41krnawzq8VJCvVUXARLT8D9K/g3rG+aD1I8gYU=;
 b=aFu+oHK2MwblU9VfEoP9Ic+ObddA6ARqgmiToPM2uDfEW+dBcwfCUXjUCSol5iG9XvGlEpuHW8Ua9t5+FZ9d/bIRAP3PGyPprWEsGFo4cRBuFQ11Fbj50by7tMU7fu6awf1VMSba89WO8NL1HLG+JzQj7Scl//ImWETG2V08x8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Wed, 25 Sep
 2024 17:06:40 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 17:06:40 +0000
Message-ID: <5bbaeac3-7916-4e75-9c92-b93e2cd78ff5@amd.com>
Date: Wed, 25 Sep 2024 11:06:37 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/10] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-10-mario.limonciello@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240918213845.158293-10-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::14) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3240e0-2cec-46e4-408b-08dcdd846c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFFoTE91RXNSVFZrem9VUlY1NG5iclFCbVN5S3BURGorYUdFS3N6cGFrN3hz?=
 =?utf-8?B?bU1BMnJtdG9IaDFDWk5jVlJuZStJbng3Wk56MldTdWZIMndKVGtaczB0SVFw?=
 =?utf-8?B?UmZjbm1tYTA5MmNMR0hycTd5TjlHS1VqNElnTExBZWd0NUo5QzMzanFJZEVs?=
 =?utf-8?B?ajNnaUdRelRBOGJDOGNUL200bWowN1R2S3BoU0MyUnVpc0lYMFlJMCs4cmxu?=
 =?utf-8?B?K0Q0OW1sK1R1czhsSnFlYkdENy90YkhnME92Nk80TVBZWlNJT0lNbmRNNC8v?=
 =?utf-8?B?V0M3WnZYS041OFBjVm1KeFB2N2cvY3dmL05pMkNzVWpqQXYveVJxdVU3MUF6?=
 =?utf-8?B?Y3lYM1FxWDBNcFN6bTQzRXZ6K2VONDY0U2ZVSXIvRlZmbjJOcUlkbkZxaDlo?=
 =?utf-8?B?SFBOQmdUNWNhcGhXNDVySWtWZzBtTVpVS0t6WlF2bFJYRjRTRy92dUZZdklo?=
 =?utf-8?B?amE5d0ZxM29WSTNzcDJUdUpCYzhKa1A0QkZPb1gzVTJIci9DNFVJMm9RRmtm?=
 =?utf-8?B?dEgxdnlONkFMb0tDNTB6TUFjTlBqY05EaHZJUG1nVkZMU0RucUJqVW51bDNK?=
 =?utf-8?B?MmZKRDJpNDJQU3RBTnpnM3d1Ukxja3llaVhSNkhyOXR4Y2gzMCtrOUhxZGJa?=
 =?utf-8?B?N2hqYjN0N3o1N0Z6bExhd2JKRk5DdkxpdXNEOVh6S3laSSthNXBnWGdzM3U1?=
 =?utf-8?B?ZEpZU1UwZ0JvZnFXbTZRTlk3MFpvL29PQ09uUjhhUFNzd0xyOUd3aWNSSTVu?=
 =?utf-8?B?WURMQTZTM2RwRzltZmZBVFBuOWkyRmIrRitQWUcwRkc4OUhkRkg0M2M0Q3Fi?=
 =?utf-8?B?aDRrbU41Wm9FZVZFZUt5WnFRV0k1dHJhanZGMlNNMWloT0F1QkRCWUFGTG1E?=
 =?utf-8?B?ajNUV1lKeUtOUDlQdXM2am5kS09DSVgzcXk4NU1jbzE1T0dVN3A5MDAwVUpP?=
 =?utf-8?B?TFRhd1Zjd1NIMjh5T2hzOGV0K1ZWNXA2MmtCTmZHVDd4dk9za3RBWU1pOWpt?=
 =?utf-8?B?QnBIMVZJeGwvYjV5TlZpeWdpcCtFbDhoNUhYVG9hZng2UHRwblM5djY4VmNi?=
 =?utf-8?B?UXBocTdNNk1tQ3ZzcjVWbFNmZzZHOHZTYlorWTNudDlYM3ZOcEhETFI2SXdk?=
 =?utf-8?B?Y1VLQllVNzEvZ3hLZVk4MkNTakROTmJzNjhnVWdMK2hmVVFmSGVTVk14WFZx?=
 =?utf-8?B?ekpid2FRMy84M3R3ei9hekhCbjNaZitXdk1kT0dRak44cU1kRFU3c0k1V0li?=
 =?utf-8?B?cXVqcXZiclRqSWRvNG9td2lDQTZ4Wldjb1NRUU9pNHZNMzBMY1dnbDhSN3Vx?=
 =?utf-8?B?aCtRT3lCUDhoNUJtbnZCMkd2WVZTYVpDNTRjd1R3QXNBZ2w2bGxJN2JONFFn?=
 =?utf-8?B?QU0wS2owNjcxOTdCN0F0VExuNWJ2MVFFRUJJekVCMXozNWFqTUxtUkIxT1Iz?=
 =?utf-8?B?ODduc1NYdUwwNFJVTHJWTm51QWh6b3ZYZnhFdzdVa0lSZmUwSFB0QWkveHlI?=
 =?utf-8?B?dVlsRGpadjNiWFVLOTBoSmJVWkRxTkk1QlB3dFEwd1JENHpVMlRGWTYvN1dk?=
 =?utf-8?B?aWRNTWo1Zk5iUkhYaXp0d3o4NjlCeXg1UHcwVWxtcjlVaE5rVnAzUDNOK3Bx?=
 =?utf-8?B?OHZrUGEzUkN4TnVyQVh6Q253YU9LY05ycEc2dkxNL1IrRzA1eU9MYWNXZEEy?=
 =?utf-8?B?RDRPVnpOMHN0bmFQN3pGQ01pZ2dBalExSXpzbGtHTUVSRTVBNFdIVHpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0tlWXNjUzRkdU5kN05XQVlDYmFoKzNTZStiaVpKRE5US3lXQ2t4VDlZa2U5?=
 =?utf-8?B?VHBZQnhITzg2YUp3cHVLdmRod3BNWERWcGJXZVRjWURPZXVmNzJYVUVGK1Bs?=
 =?utf-8?B?Z3FPQno2eDAxaGk1L1o5bXVVL0VYQ1dQVzFLZ21MZUZWQk41N05zZ0NheVFZ?=
 =?utf-8?B?ci90TU1WRGcxbmppK2pIcmNmNWowSzhIOW5DV3pqZGlvTUk4WDRzU3dwdmF6?=
 =?utf-8?B?MURBUzhZUEIwSmN6cUxqb1ZrRnVOZVdWMzIvM3R5WFhlVTg4bXRSaWc0cFIy?=
 =?utf-8?B?aXduYnFKaDUzVjBFNlY1bnJHdkVEYWw4VklSS0VyZkNreXd5Njk2T29Yb3FZ?=
 =?utf-8?B?bllEUlU4b0h2ZGRCTS9BMFhMcngwcy9qbmNwdXduaDJSdFRyTmIzOVhpRkNO?=
 =?utf-8?B?VmpsTTJjZmpGbHdQWmRFTmQ3MitXVVVpWTYxS2h6R05ZWWJ5SWlzN3Y3T092?=
 =?utf-8?B?Y0hkNEgyQnByVFhmZmhGaU1ndGFna0M5SWE5Vy9yc0VjMERNajlYdUg4WXNE?=
 =?utf-8?B?OS9WbHRZWUNJK2oraDBsUkJKWDhPOUF5K1ZWWlljaHhqY0k2NktEWDRCL1JR?=
 =?utf-8?B?blBSU2hwSjVSeU5kdXhRKzY4V05ZMXEyVW1xQ21nVDhqKzNyK1dDdEQ3TGt3?=
 =?utf-8?B?aTNCdEI3cW5QR3pnV2c2WnN0ZWZZczVkb3NFSU9wRUp2S3ZnTWJVbGEzRG9W?=
 =?utf-8?B?TGNSRjVFbWtvRkk2ejA2bjN2L0Z1Rngwb3ZPcXF5SzNpWEpYZVdHQXh1T1JO?=
 =?utf-8?B?T29iVlFVbzBTUVJDVkhLb3I3WFh3MWVzOU8wZmZqaFlWZkVqMWdtVlNXVFVp?=
 =?utf-8?B?SGtFOTdHaWhmVmZ4SjJURC9rQ3dob3RFK09xOEpoN3Z5dlZTMSsxUWRKYm9w?=
 =?utf-8?B?VWpBclNYNG9ydzRHbCtoTHRJQ00wSGJ1WTh2RDBlMm1pYWVsQkY3ejBmZlRY?=
 =?utf-8?B?TVAwODBncFBsVnlEK2R4cmxvZ3NISUxVYVBXS2VUUzNKc2U2OXNIYXd6MXY5?=
 =?utf-8?B?bFFnYVRLUStLckN5YW4vOHpXa2t6N2FvYUMzd2htN3ZDb2hVUDE2VFVic1J4?=
 =?utf-8?B?R2d1WVAyZFRxWmt3OUw4MngrbkFVaFVsWGlyZG1Fd0gwdDRvT3RGWHpZOE5U?=
 =?utf-8?B?dWJRV1MwNVNIVWNVMXlQeElYb2YwUHZhZm9SSHdEem1hT0x4bS9CcGt2dnVh?=
 =?utf-8?B?Z2VPa1NoRU9LQTY2ak5hWTI3d2Q2dWRjRjIyQzJPM2lVN2I0blVBd21xZWdy?=
 =?utf-8?B?OFRVWnRwZ1c2bEpDd3cwbFc5Y014Yi9uWmwwYW1ESzdvVzlkWTlwQnR1Z1dI?=
 =?utf-8?B?Vk1lV2RLb1djTjVpdno4MGRxTENmN2tINlJIUysva1pqRFN5Ykx0czF3Sjg5?=
 =?utf-8?B?NjIwNWpvWmhnbHQva0EybmxWdTJCQkdUVVVyS04zSnFvck94NVVFNG1sRnlF?=
 =?utf-8?B?bzlaTlAxVDVVQnJ6SXJqbkdxRUlsMnR1R2tGMzlXSncyeVJQeXI4TGg4b2kx?=
 =?utf-8?B?VzJUTUNvS1M4cDFBZWxLSzRDdU5seEUwRUw2Y2IwU3RVL0VPK29SUUNhbUov?=
 =?utf-8?B?d3BpOHVlMkxvZ0VGZmhISUNMR3F1dnpVTmRCMm9YOEVjM2dqTUxBcExDazll?=
 =?utf-8?B?V2pSMkUvay8wTWhia25kRXVPM0FBU05yZnVRYlNvVHlvVGVNMU1VQXYvRnhk?=
 =?utf-8?B?VzNobG52RVF4bHc5UU1jM00xOW10MG8zd0RwNjFDZ1pBcllsMFJJN2JXL20z?=
 =?utf-8?B?dGtNTDJTQkNTVmNKdUVDVG4wbEVmZndwQmlidmZBeFluNS9QNThGT1p2bVlz?=
 =?utf-8?B?dFJBcWtBdXNGQzNaRlVidExRL0ZhRmJjeWd3RlduYTQzK1dkZ0U2UXlPNXhN?=
 =?utf-8?B?azVvck9YdlJraUk0bTY5WWllMEhMUm1CMFRrS0FaRnJ0KzJqaEJtQVRmWGNC?=
 =?utf-8?B?NDliTHlGOFZ5Ky9FUWJFTjExNTJGR2N6d092emYwSDhuVFZoSXVwM3dkQzJs?=
 =?utf-8?B?WU5FU3ZSRlpzK2dBUTRPbEZpRkRHL2lxcHhSTkJXWHhqcVpTZGRNMElwV05j?=
 =?utf-8?B?bk1TRFhFUDZobCtDYkpIZlNDOWI1VGxpNHhVYkE4Z0pZK3o1Q00rMUZ6ci9F?=
 =?utf-8?Q?tytsYyFZhrfh6hKvhprxFJfBk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3240e0-2cec-46e4-408b-08dcdd846c22
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 17:06:40.0514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 97h1j+kRjzPAq+jHnoKGZf9Kb19knvecH16POJ4bRV+07B/clXKyjWXXtD4NEimH1flo9a9NTe5h0o7DQcNlVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519
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

Mario and Melissa,

This patch causes a regrerssion on 7900 XTX in an IGT test: 
amd_mem_leak's connector-suspend-resume.

Is this patch necessary on this series or is it independent from other 
patches, i.e. can it be dropped from this series until fixed??

Cheers,
Alex Hung

On 9/18/24 15:38, Mario Limonciello wrote:
> From: Melissa Wen <mwen@igalia.com>
> 
> We can parse edid caps from drm_edid and drm_eld and any calls of
> dm_helpers_parse_edid_caps is made in a state that we have drm_edid set
> to amdgpu connector.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 30 ++++++++-----------
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
>   .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
>   4 files changed, 16 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bd8fb9968c7c..bf847ac55475 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7123,10 +7123,7 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>   		memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
>   		memmove(dc_em_sink->dc_edid.raw_edid, edid,
>   			(edid->extensions + 1) * EDID_LENGTH);
> -		dm_helpers_parse_edid_caps(
> -			dc_link,
> -			&dc_em_sink->dc_edid,
> -			&dc_em_sink->edid_caps);
> +		dm_helpers_parse_edid_caps(dc_link, &dc_em_sink->edid_caps);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d43ed3ea000b..8f4be7a1ec45 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -83,32 +83,24 @@ static void apply_edid_quirks(struct drm_edid_product_id *product_id,
>    * dm_helpers_parse_edid_caps() - Parse edid caps
>    *
>    * @link: current detected link
> - * @edid:	[in] pointer to edid
>    * @edid_caps:	[in] pointer to edid caps
>    *
>    * Return: void
>    */
> -enum dc_edid_status dm_helpers_parse_edid_caps(
> -		struct dc_link *link,
> -		const struct dc_edid *edid,
> -		struct dc_edid_caps *edid_caps)
> +enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
> +					       struct dc_edid_caps *edid_caps)
>   {
>   	struct amdgpu_dm_connector *aconnector = link->priv;
>   	struct drm_connector *connector = &aconnector->base;
>   	const struct drm_edid *drm_edid = aconnector->drm_edid;
>   	struct drm_edid_product_id product_id;
> -	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>   	int sad_count;
>   	int i = 0;
> -
>   	enum dc_edid_status result = EDID_OK;
>   
> -	if (!edid_caps || !edid)
> +	if (!edid_caps || !drm_edid)
>   		return EDID_BAD_INPUT;
>   
> -	if (!drm_edid_is_valid(edid_buf))
> -		result = EDID_BAD_CHECKSUM;
> -
>   	drm_edid_get_product_id(drm_edid, &product_id);
>   
>   	edid_caps->manufacturer_id = le16_to_cpu(product_id.manufacturer_name);
> @@ -920,19 +912,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
>   		if (!drm_edid)
>   			return EDID_NO_RESPONSE;
>   
> -		edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
> +		/* FIXME: Get rid of drm_edid_raw()
> +		 * Raw edid is still needed for dm_helpers_dp_write_dpcd()
> +		 */
> +		edid = drm_edid_raw(drm_edid);
>   		sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
>   		memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink->dc_edid.length);
>   
>   		edid_status = dm_helpers_parse_edid_caps(
>   						link,
> -						&sink->dc_edid,
>   						&sink->edid_caps);
>   
> -		/* We don't need the original edid anymore */
> -		drm_edid_free(drm_edid);
> -
> -	} while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
> +		if (edid_status != EDID_OK) {
> +			/* We can discard the drm_edid and retry */
> +			drm_edid_free(drm_edid);
> +			drm_edid_connector_update(connector, drm_edid);
> +		}
> +	} while (edid_status != EDID_OK && --retry > 0);
>   
>   	if (edid_status != EDID_OK)
>   		DRM_ERROR("EDID err: %d, on connector: %s",
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 2e4a46f1b499..4e1776b5f0d4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -61,7 +61,6 @@ void dm_helpers_free_gpu_mem(
>   
>   enum dc_edid_status dm_helpers_parse_edid_caps(
>   	struct dc_link *link,
> -	const struct dc_edid *edid,
>   	struct dc_edid_caps *edid_caps);
>   
>   
> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> index d21ee9d12d26..94c911742dd3 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
> @@ -1413,10 +1413,8 @@ struct dc_sink *link_add_remote_sink(
>   			dc_sink))
>   		goto fail_add_sink;
>   
> -	edid_status = dm_helpers_parse_edid_caps(
> -			link,
> -			&dc_sink->dc_edid,
> -			&dc_sink->edid_caps);
> +	edid_status = dm_helpers_parse_edid_caps(link,
> +						 &dc_sink->edid_caps);
>   
>   	/*
>   	 * Treat device as no EDID device if EDID

