Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B5AEE1B0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D4C10E479;
	Mon, 30 Jun 2025 14:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dqEc1K6M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4B989ABE;
 Mon, 30 Jun 2025 14:58:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC0JiSaK/mQKgOMFRm3I9jyTAaQZcHy+Ccbyg7jr5SBlYALwNQqEVsqtz0z5bT3xDF6u2Hsznm4o6TnXN6PiXaex0koQ15cg+qGc2UoFoZ72xyD5n0UePGTvCYusRFUj9e2NBVr2MHPY2ZE9BTW3d4lbGc9oCG1vYYty0CwBkJ//0C4UectAthFEGuV8bLHcMLsNpzlOgjKGzNZDAhZrd2Qb0599eLx2TAfMNRLUZt77jNlLC8q8lxLDa8GZ/NJgbsMjdwnU2+kJRs8VjBU5gCZXl7DqLmVA/V3/QoQFRZ8kB6MOXEmxVbaLW8/JK78VY3PeQR1qpy0AHg07U2GAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvtb4d3Xj8YjzHPKFWNudhMBvla7X4D30+z/vAJrgr8=;
 b=LO2e7wVVnhWVKP/9/fRtZQTcciCRnhqwkdsDh1iM8fTOCIqP19brV491dxdLqJ++XeQzXLC3NDfAhhUVan0SADM7hbj2j5bh3TqyD3Vu0c8JccfiCHcL1P3JK3STFDia7rzBOMczs07YysdDkteJ/TugsdzcwJzrM0AdIluDN/vi41qFR1uZjaGw5O94zr0tsXsx3fr0LiRdO176StqB2jRUStApbDeVcTN8my6y3EJypsMSC5WnGru6BSTi3865hKIztDULgOjrBfktl/5n+9hwxDO3/+eINl+jzBQ5x3BITAoTiwjMCVaweKlj1+VtP9lKbVK0Tsveq25MncwFfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvtb4d3Xj8YjzHPKFWNudhMBvla7X4D30+z/vAJrgr8=;
 b=dqEc1K6M+NkxgZBPWXTbB+hQU9UWDGXhAj0/bAutI67G2tS0/yc23zgTmAHGwfK2Bywi3cOrqasd+A2NQxAU6A4i9j9KFyFKDvzWuycl1HSOhC/jnpo+qE0yYvDurKSOlj0VliE2rX3qKgN/JqDlhTce3fu56W/4fSqkFMdPz5w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Mon, 30 Jun
 2025 14:58:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 14:58:52 +0000
Message-ID: <c90e389f-d737-4151-a6b2-5131e13820a8@amd.com>
Date: Mon, 30 Jun 2025 16:58:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: "Khatri, Sunil" <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250627094921.911009-1-sunil.khatri@amd.com>
 <20250627094921.911009-2-sunil.khatri@amd.com>
 <d94574be-4054-40d0-98e7-36c32c1ca556@amd.com>
 <8bad0398-7e4f-4611-8b21-cfbdbe671429@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8bad0398-7e4f-4611-8b21-cfbdbe671429@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:208:32f::30) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f171d72-0983-4a64-597b-08ddb7e6a079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RU9ObTRyd0lGUE83WlAwWDcxUXgwYVNwdWpaR0dSWU9CeXl1OUpScnpqSDN4?=
 =?utf-8?B?NkNSM1REZFJxb003aDl0djE5VGtKbEFtM3lJVzAxVUFXV1J0QzJDcG5Balk0?=
 =?utf-8?B?dllaZmc4TEkvaXBQUlN4L0dtaDhOK0NpclRmQjhQQlBqelh0enFoR0VZbGdP?=
 =?utf-8?B?Wm9TQ3VQK2NPeVhoVzV0SUdFQVhYUVVtRC9CMTBleUJaOTRkd3o3bnVhVWRx?=
 =?utf-8?B?Y25oWkM2MEVqazZZckREa3dBSlp1Y1AzaEVXc2JwZTNOVkFVVXp2eksvTndi?=
 =?utf-8?B?cjRqN2tPTyt6L3FkdGtZL2ljUWlGeE5TWEJjbTBseGxuT2pWZTdidE1UNEpE?=
 =?utf-8?B?NXFubENjRzg4c2M5QmJNTVRlanp2b3ZmYUN2SjVpckcyWVRKMXI2Sk15Rkkz?=
 =?utf-8?B?Q1pseTZmU1dFNmpicUFGNXp5VXVmR0R4Qk4zay9ibk8vZVh0OXVubmcwVHBS?=
 =?utf-8?B?S051MTQ2THFxZnRqNFlLVU9Odk95TU1UR1VJUXFrYjM5WXhyUnJJa2doUVVQ?=
 =?utf-8?B?KzFJRFZMeG1SUHZzVEd0bW9Ld2REb3lMS05YeVF5R0lmazBQTmNlc1VGR2I3?=
 =?utf-8?B?YytKa1JzcG1raUFUV1RCcTNndHlyc0RCK1RYRU54Q2U2cEtpZU5Mb0llWmlF?=
 =?utf-8?B?NUUzUkNSYi9QNTQyNUo4NU01SElsWHAzRHk5bVgrRzBTKzRZRjRja3JCdW8r?=
 =?utf-8?B?MTJaQkYrRFllVkxUREJHa05HelBaQTRYaEtFOGxZUGUzUjV2YjliSW5oK29W?=
 =?utf-8?B?S3JBVVpxSnlGcGJSa09PczJ6ZWtyeWVzdU9OMkJ0UGVEWGF0c0RBMnNoS01N?=
 =?utf-8?B?cllqUkg3V3JKak5KM2ZQVy93YmFhT09DMDV0MkV5dlZ0aE1rWXdZYU5mZDQ3?=
 =?utf-8?B?clhLQ0gyeG84QlJwQXRHR2VkOFNWWXpLRVJ6Z1hHeGJYVWs5RVd5cEpCb0Vz?=
 =?utf-8?B?YkFIQUpLVm5OQVBLb2lPY2lhY05CdVE1SjBqVnBTQzQyUzVtYkpKOUNRRkJC?=
 =?utf-8?B?cEdONXkwTGxqb1VOT1V4OUlFYTc4L1kwS2xrRm9RdE1RQXQzMDRhdHRIbGE3?=
 =?utf-8?B?NVZYc2VVRndMVnl2RFJidDJHelJ1MjkydTE2YmVlN0JnekhsMTRmV3dWU1Fq?=
 =?utf-8?B?ZVVSV0dsNDljZ2E1QXhRUUtqMWRKV2NGNERDSUxocHpHMzJGTjRKeHNFWHhm?=
 =?utf-8?B?U1c4cEZoWVdvUFZtNG1EK0RJNlhpc3ZEaTA4RGlaekEzM3IrR292ejVNWVNJ?=
 =?utf-8?B?a3Z1TWVrbHV3S0FXZWQzMG5xRXdyR2dVUDd0S2FkcUJzK25RNmh6WW5TN3hG?=
 =?utf-8?B?Y0R3azZrY1RPQWhuVXVBcXM5TTNCWUFzcVpRUlVEZUhvU1MwMVltVjA1TXU0?=
 =?utf-8?B?c1k0WVpWN0RnUTBnb3JUWlhEZVp3aXdkOVdhRjFLdngyVnZDZko4dkZBZ1Ur?=
 =?utf-8?B?ZmZEamQyRHhoUFpBMzZBQy9hTXM2V2ZyWm8wbVRoVlFBdFZpV1ZsRzhHQmxJ?=
 =?utf-8?B?UUNYdkUwQTJGOFo4eXF6elEvdVdCc01lci8wbEp0YkN2eDJqZlAvR3dIMSt3?=
 =?utf-8?B?dVJaeVBJRnNPQjVzR0pGWWlsV21jM3RtTWhPeGYxczZQTFY4YXZaUVZLclNC?=
 =?utf-8?B?ak5ua28wdVB2YjM4bjNDUi9qejd4ek5zME81diszcjRuc0RORnJPSzVzUHdD?=
 =?utf-8?B?a0IzZDdiRTN5cHRyNE1hMTJ4Z05xQmowTTYvcjRuMFl2YkZZeE51Um9XYmhO?=
 =?utf-8?B?UzQvcEEvR2Zra0Z1UGZCSWFvUFIrbDNmbWsrbGQzVzV5ZzYyMUhMVy9DOXVR?=
 =?utf-8?B?SjZOWm5QUXhGRTk0SGF2eHlnbDlqdWw0Ykp2anpUOU8yS3J4OTNZTVg3ckRZ?=
 =?utf-8?B?aXJ5QVBRbE1MNm9ZNlJJZFk5RDZzN3BmUmpySVJRVGNyZGVRNFFYVnZqVHR3?=
 =?utf-8?Q?gckC8TD0f8Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFONjJDc1haM3RlcHVPc3BHSFFLRW1UemFOK2NmN2NRUDVOTkthTFFWSEdU?=
 =?utf-8?B?dnRScXRmY2dsWXBjOUhVSzNQSjFFY1JNR3pNc2JBWGtUMUtsOUd2clE2eG93?=
 =?utf-8?B?L2NTMGNSN1YyeUYyMWxoTVBCZkZlMm5XQmlDdGN1aWZseVFMOG5NNWVwSS9B?=
 =?utf-8?B?R2xTQ3hBeWxsSVorMDBab0paNFN4RGV4aXNNK21XODg4Ny9kMm9Nc0N5MEE3?=
 =?utf-8?B?cEw1Q0hzS3AzRjZCTjhqcEdtTUN0OGduNTgzTllGZ3RNS1hmbEtJdFNNME56?=
 =?utf-8?B?cVBoSjYraHlnY3g1bEpWaXlQT2JXejdrbUpJWmJFVkxDMExvbFJ0bWFZaDVS?=
 =?utf-8?B?L0FGU0JMWGkyS2IwbSt0di9XUGN3R1BDTkFmVVh5ZkhnNVhNVjJBWmJFT1Nx?=
 =?utf-8?B?R0RIRUt6d0ZoSmxuUWxZbWZtaFc2SFlZMkIybWdsekhyczQ4Ly81Z1ZJS3Fr?=
 =?utf-8?B?SEtqTm1KRGJkOWFjWThKRkRyS3ZhRlFNMDcrZmM4eWlPQlFIZzUwdm1BYkNq?=
 =?utf-8?B?S1JyWnNnbGpZUXBBSWtBS2lLQkN6VEdsRkFwS1Z4OUp5V0IzcTRtNGFqZ1Za?=
 =?utf-8?B?bmNzZFUveG1DRS9DWXRydjFBTUVmbjFTa2laeWNiNitzelZRRTZiMW5CZTBs?=
 =?utf-8?B?Sm5TRW9TcFNidkdZTTI4N09jUFlocFVTM0ZOU1BiZ3lUd0lhSFBPWjFJQlVI?=
 =?utf-8?B?b1pPSGNkOXA2c1FIajBBdXc3a2o3czFjeXV2ZGFYS3dnMUtja1UzcDBRSzk0?=
 =?utf-8?B?V2xtTTJnNFlXYVhUbit3VXdUbHRZNzUva0poVnY5Y0dIU2dVMGF1RE1IS0xh?=
 =?utf-8?B?ZEsxNGpQaENFTWpCTElhMThaY1VVSm4wR1dKQnl2eW5ReFBzdHhZNVpMOFJy?=
 =?utf-8?B?NnM2dzZ2VjFMTDlZSjBPU25mVTMyK005RjdSclRtaXdpYmZ5Skhaa29JdlNL?=
 =?utf-8?B?VTRQUzVSNVhHVEhnNjFienNPa2Uzb1Q2WXRxZVE3cEpSNDJxajN0V3BqSGRk?=
 =?utf-8?B?cDc0QVZmZlAyMUYzV0o5ZEVRMTdNNjA4aEpQK3lad2c5WTllQ0pYN2JFdGlZ?=
 =?utf-8?B?SEFDZjl3TnFRMk1RMUF0SHZSYWRZOTY3ZURYcHFBSks1VzBoMngyYmFYY2ow?=
 =?utf-8?B?MUFrT3I1S3RiUUpOTnZkanpVVnpqZGZzSHUzUFdLajlpY1VUclhFdkNXS3FP?=
 =?utf-8?B?cHVDa05Jbk40RmRaSVFOKzViQ1ZjZjk5OTNWY2E4dGpiOTk5RVZGYUxTeElD?=
 =?utf-8?B?Mk9TTTF4NE5OaVY2eEhhQWNBMmtKQUJtQ0xhZlNiUU9KdmZ2aVNKZkFmdEFv?=
 =?utf-8?B?b0drLzYycDFNbDByZm02dVZDMUx1aUQ5MmI1Umt0Zy9JK3RXN29XUzFDbHl6?=
 =?utf-8?B?dVpiRWVVTVc4aTQzVnpoWmpNWm1oL0k5SFdYaEdOVU9hYWsrdURhV2Z2T3FG?=
 =?utf-8?B?ZnFYdkgxZ1JHSzlBT0RaYnNBZ2hwS05FVHdnVTZBczZsQ1dib3RSY3paOEVk?=
 =?utf-8?B?YkFXV3pua3RiV1p6TlhqQlVxV3crazF4akRVbTViVmdpRGVTaDlNQndHTTd3?=
 =?utf-8?B?dEp4bnIvK21xdDA2Q0VraElacWxwd1duTGVRQmtyTWxBaEtCRE9nQzYwRU5N?=
 =?utf-8?B?amdqYmhGOHNqZFVuRHRVZjNFUm03elJXbUdFSXlybDdVTndrRzdpanZPTWZG?=
 =?utf-8?B?ZjVMaHc4a1lnY1lZNC80ZG5oOHgxTHo1SU5RSnc2S1lna1dNYkZKZk1HdDhX?=
 =?utf-8?B?NStTZUIwREhWeUxKTWtJNmdTd2pZcUw1THpKZWVKRlNwbytKOGRuM1FpZVY0?=
 =?utf-8?B?WXhvMmlkcTJMa25rcVViQkpRRUpaSVRVbXVqdGVIN21HWUlOYUZXWWx1N0xX?=
 =?utf-8?B?a3FUL2hOZVhDYmxWaWhyK3V6NUg5NVc4SU5VMFFpbm1OaWVDQ1FHa3hUT0R5?=
 =?utf-8?B?NkJ6TW44ZkoxRjZmZVkrMDNDVzhudE10NlVtNUJGeHNnUzBOMCtYSkJWeGpF?=
 =?utf-8?B?Ty9MZ1pSdUJCQlhUK2RLMi9aSWpZNmlteHUxNGlhN2tjTElIODJnM1Z4V0RN?=
 =?utf-8?B?ZWxtd2E3OEFnZ0szdm8xZEh6dTA5WHlxUndlTEQvU0pSbUJ6YUp6bW1SKzA1?=
 =?utf-8?Q?GX5WjpoOr6lVZVewd80zDDHYx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f171d72-0983-4a64-597b-08ddb7e6a079
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:58:52.1209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01D9qV6HLXhonn4YZ46ySwLYerpPAJgFHTDIsbRbBWbT8iHSnu+xV74sILW9SHWz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
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

On 30.06.25 15:34, Khatri, Sunil wrote:
> 
> On 6/30/2025 5:11 PM, Christian König wrote:
>>
>> On 27.06.25 11:49, Sunil Khatri wrote:
>>> move the debugfs functions from drm_drv.c to drm_debugfs.c
>>>
>>> move this root node to the debugfs for easily handling
>>> of future requirements to add more information in the
>>> root directory and one of which is planned to have
>>> directories for each client in the root directory
>>> which is dri.
>>>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_debugfs.c  | 33 +++++++++++++++++++++++++++------
>>>   drivers/gpu/drm/drm_drv.c      | 19 +++++--------------
>>>   drivers/gpu/drm/drm_internal.h |  6 ++----
>>>   include/drm/drm_drv.h          | 19 +++++++++++++++++--
>>>   4 files changed, 51 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>> index 2d43bda82887..5807dd64d28a 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -44,6 +44,9 @@
>>>   #include "drm_crtc_internal.h"
>>>   #include "drm_internal.h"
>>>   +static struct dentry *accel_debugfs_root;
>>> +static struct dentry *drm_debugfs_root;
>>> +
>>>   /***************************************************
>>>    * Initialization, etc.
>>>    **************************************************/
>>> @@ -286,16 +289,35 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>>   }
>>>   EXPORT_SYMBOL(drm_debugfs_remove_files);
>>>   +void drm_debugfs_init_root(void)
>>> +{
>>> +    drm_debugfs_root = debugfs_create_dir("dri", NULL);
>>> +    accel_debugfs_root = debugfs_create_dir("accel", NULL);
>>> +}
>>> +
>>> +void drm_debugfs_remove_root(void)
>>> +{
>>> +    debugfs_remove(drm_debugfs_root);
>>> +}
>>> +
>>> +void drm_debugfs_remove_accel_root(void)
>>> +{
>>> +    debugfs_remove(accel_debugfs_root);
>>> +}
>> Those two can be removed together as well I think, apart from that the patch looks good to me.
> If i got you right you mean to club
> 
> drm_debugfs_remove_root and drm_debugfs_remove_accel_root in one function drm_debugfs_remove_root?

Yes, exactly that.

Christian.

> 
> Regards
> Sunil Khatri
> 
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +
>>>   /**
>>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>>    * @dev: the device which we want to create the directory for
>>> - * @root: the parent directory depending on the device type
>>>    *
>>>    * Creates the debugfs directory for the device under the given root directory.
>>>    */
>>> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>> +void drm_debugfs_dev_init(struct drm_device *dev)
>>>   {
>>> -    dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>>> +    if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>>> +        dev->debugfs_root = debugfs_create_dir(dev->unique, accel_debugfs_root);
>>> +    else
>>> +        dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
>>>   }
>>>     /**
>>> @@ -322,14 +344,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>>           drm_atomic_debugfs_init(dev);
>>>   }
>>>   -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>> -             struct dentry *root)
>>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>>   {
>>>       struct drm_device *dev = minor->dev;
>>>       char name[64];
>>>         sprintf(name, "%d", minor_id);
>>> -    minor->debugfs_symlink = debugfs_create_symlink(name, root,
>>> +    minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>>>                               dev->unique);
>>>         /* TODO: Only for compatibility with drivers */
>>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>>> index 5d57b622f9aa..68f50d915153 100644
>>> --- a/drivers/gpu/drm/drm_drv.c
>>> +++ b/drivers/gpu/drm/drm_drv.c
>>> @@ -69,9 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>>    */
>>>   static bool drm_core_init_complete;
>>>   -static struct dentry *drm_debugfs_root;
>>> -static struct dentry *accel_debugfs_root;
>>> -
>>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>>     /*
>>> @@ -184,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>>           return 0;
>>>         if (minor->type != DRM_MINOR_ACCEL) {
>>> -        ret = drm_debugfs_register(minor, minor->index,
>>> -                       drm_debugfs_root);
>>> +        ret = drm_debugfs_register(minor, minor->index);
>>>           if (ret) {
>>>               DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>>>               goto err_debugfs;
>>> @@ -752,10 +748,7 @@ static int drm_dev_init(struct drm_device *dev,
>>>           goto err;
>>>       }
>>>   -    if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>>> -        drm_debugfs_dev_init(dev, accel_debugfs_root);
>>> -    else
>>> -        drm_debugfs_dev_init(dev, drm_debugfs_root);
>>> +    drm_debugfs_dev_init(dev);
>>>         return 0;
>>>   @@ -1167,10 +1160,10 @@ static void drm_core_exit(void)
>>>   {
>>>       drm_privacy_screen_lookup_exit();
>>>       drm_panic_exit();
>>> -    debugfs_remove(accel_debugfs_root);
>>> +    drm_debugfs_remove_accel_root();
>>>       accel_core_exit();
>>>       unregister_chrdev(DRM_MAJOR, "drm");
>>> -    debugfs_remove(drm_debugfs_root);
>>> +    drm_debugfs_remove_root();
>>>       drm_sysfs_destroy();
>>>       WARN_ON(!xa_empty(&drm_minors_xa));
>>>       drm_connector_ida_destroy();
>>> @@ -1189,14 +1182,12 @@ static int __init drm_core_init(void)
>>>           goto error;
>>>       }
>>>   -    drm_debugfs_root = debugfs_create_dir("dri", NULL);
>>> +    drm_debugfs_init_root();
>>>         ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>>>       if (ret < 0)
>>>           goto error;
>>>   -    accel_debugfs_root = debugfs_create_dir("accel", NULL);
>>> -
>>>       ret = accel_core_init();
>>>       if (ret < 0)
>>>           goto error;
>>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>>> index b2b6a8e49dda..d2d8e72f32d9 100644
>>> --- a/drivers/gpu/drm/drm_internal.h
>>> +++ b/drivers/gpu/drm/drm_internal.h
>>> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>>>   #if defined(CONFIG_DEBUG_FS)
>>>   void drm_debugfs_dev_fini(struct drm_device *dev);
>>>   void drm_debugfs_dev_register(struct drm_device *dev);
>>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>> -             struct dentry *root);
>>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>>>   void drm_debugfs_unregister(struct drm_minor *minor);
>>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>>> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>>>   {
>>>   }
>>>   -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>>> -                       struct dentry *root)
>>> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>>   {
>>>       return 0;
>>>   }
>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>> index a43d707b5f36..a02bf4885b79 100644
>>> --- a/include/drm/drm_drv.h
>>> +++ b/include/drm/drm_drv.h
>>> @@ -566,9 +566,24 @@ static inline bool drm_firmware_drivers_only(void)
>>>   }
>>>     #if defined(CONFIG_DEBUG_FS)
>>> -void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
>>> +void drm_debugfs_dev_init(struct drm_device *dev);
>>> +void drm_debugfs_init_root(void);
>>> +void drm_debugfs_remove_root(void);
>>> +void drm_debugfs_remove_accel_root(void);
>>>   #else
>>> -static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>> +static inline void drm_debugfs_dev_init(struct drm_device *dev)
>>> +{
>>> +}
>>> +
>>> +static inline void drm_debugfs_init_root(void)
>>> +{
>>> +}
>>> +
>>> +static inline void drm_debugfs_remove_root(void)
>>> +{
>>> +}
>>> +
>>> +static inline void drm_debugfs_remove_accel_root(void)
>>>   {
>>>   }
>>>   #endif

