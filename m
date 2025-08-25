Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3504B3495D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 19:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D40410E520;
	Mon, 25 Aug 2025 17:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EIOIXtc8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB28510E520;
 Mon, 25 Aug 2025 17:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n62sDbmIM6w8dOGZXl/XRuEIZG7h7SoU8f+5/v9lsHPAjmGcjFxfh+71o4E9hwTKaHgX9LIP7Nfpysbusv4lYwNDbjIEJU/9bqVgJHWJ8AWtiFFtdt638kBMRRAWcBc5sdjnpS1vW2ZTP4fEO5LNx8po1mFYCNWU2aFpOyy4EXxJMAezh2/LHm5xvZ+2w6O1RvwnBkWLK3++rzJXgEjKjQ1snf99yfSwzbfJITFdQtDkPjnmh6CmyzLqHs1KSFQLc2BRrzmmWKFhobnmH4B3/1vytQyAlZVWD5Y0qoBes2Xub6Z1gzVvjrUrJ1DsPj6dmASjoCzztIljQT3tdKzsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQQVRIv1sauuH7ud0NmUwx8tH0mSAdowIGLJwlyPF3Y=;
 b=l56Wq+fBzvHeaRNlAi0tI7zsikh7lK/7BrUTZwih9vTMIoUcq2JUjCgh8fKU9bsK/z5Zd4TQX+mxyTsqYtXuzvbK/vYHKct/qkwCEOv+iFkL1QixMNEmSwIk4z7QHo5/NnBommfeeYbmMKvFWLAKluYio1gJPpVoklo/4WIoqBXFy+usm0ylAWSUOBh/53fDjSp20ESNtLpVFbU3rSx6UuaeNWacWDMs/jfUchmr615STbdLa4xJdmseVFZH1YoCLq9vcE/P9d3ofm5mMyBdOhsaaEaWa/RNClJLfCV8EptgoHIuLSvbLHwjZ6tRMPEpga7ML6fO6kFwj5bbcxdnXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQQVRIv1sauuH7ud0NmUwx8tH0mSAdowIGLJwlyPF3Y=;
 b=EIOIXtc8Ll9zpE4cCgLd1TpDg94UU03rG7SyVUNYpR4RvMjSleBGnuaDGY8nD+sPFMbBsMBxeuMV1kx7qqtxelMsnq0s1p7oLjbPVaTwNQQkHshCsTE2YcTSD7igYCNbP9VyieWe6giTAfDhX/Y9Bj1AU53Ap0hxBFfRPB1l2FA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 17:53:11 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 17:53:11 +0000
Message-ID: <a411d5f9-8764-428f-9ffe-33d0fb2639e3@amd.com>
Date: Mon, 25 Aug 2025 12:53:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] drm: panel-backlight-quirks: Convert brightness
 quirk to generic structure
To: Antheas Kapenekakis <lkml@antheas.dev>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250824200202.1744335-1-lkml@antheas.dev>
 <20250824200202.1744335-3-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250824200202.1744335-3-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0089.namprd04.prod.outlook.com
 (2603:10b6:806:121::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 1023182b-8bf9-40c3-ffb5-08dde400420f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjVickpaYVFlZnJTT2RhVWUzRjRFYXE1TjdPL243YVlNMDdNL0FXYW5ta25p?=
 =?utf-8?B?eTlWemxad2ZBZWhhZVc3a2Z1Z3V4bW1yb2N0bmEyTDhsR0JFWG1OZWhIc3pC?=
 =?utf-8?B?NkxJSHd6L0c4WkhPUHpld29tK2VMZ1lMLzgxVlp0aFlidSsrZHVrTU5RZnFP?=
 =?utf-8?B?U0ZDUU80MGRqbGE1eUdqakhzb0xGUks5cEhxczJtSWNLbW5ESmNNbEtOc3dR?=
 =?utf-8?B?SjBrRFJkNGtMMmRkb3l0TnM4OVFZN0VUekI0anQ5RHkxWW91S2JJOGhhb29Z?=
 =?utf-8?B?R1V6TytsRENMbXhUOTlsMXlKMS82N082dXg4SDdBWExIakVSNFJpR3RBT0gz?=
 =?utf-8?B?YkJMeWYwSzhrS0MxQ2NKZURydEtOV2x4UmcvOUlEQWhDd1V4VkJUekNaVnVj?=
 =?utf-8?B?b2VlSExCaHlQV2w2ZTdEOHQ4Qm9Jbm45ZG5NcjEwKzZFOFJBNERwdXBxcTFG?=
 =?utf-8?B?MjhtNnhEK1RDWnJkYUo4Zkd4OGVvT2YzOFo5cmprUk5hZmZ6d3B3b2pDYzk2?=
 =?utf-8?B?bm9uaXVwUnUyU09oQlBiYTYwckViaUFaSnZyL3E2U054M3Y3bzR6QXd6Y2ZX?=
 =?utf-8?B?clczZkQyZkxlaXJuNi9qd2M1Si95Yk9jcjNvajFiQmZRelJTa0lSR05HdERS?=
 =?utf-8?B?MkFOeUdna2YwYVdHZ2ZIN0w0VUpjZk5Hak8yR3A1Wnl3Q1MwdCtxMXZIMC9j?=
 =?utf-8?B?MTBabk9EN05TcDhsbDJkK1dOMytKZlNTa0dYTUxXcVdqL3c0aDVFbDRJZkp4?=
 =?utf-8?B?cmVTMTJod05pWFltbmhHRVRZbHhuOXhSRXBzbUtEMnBOcmc1MUJFN1FCSHVJ?=
 =?utf-8?B?TjRIaXNzSnRIcncxUVZjNnlxOFRPczI2ZXhoWXNrYkJTdEYvekY4L1piWTFL?=
 =?utf-8?B?N0dzRWw0Wm1oY2gvVnloT1lCcDBiT1JvRkxYRTA4OGU5YlJoM1lNeVZLMFBB?=
 =?utf-8?B?V1YvVGg0VHdUVHJFL01rNm01d2lIYUMrd2E3UFpYeVpkc2RraEVIMlh1NVZu?=
 =?utf-8?B?WjFnTlJtcUdGT3VlekNGNFlMcm5OdWFyTU1lR2pRazZWNVE4dlcyZUZxVUZK?=
 =?utf-8?B?MEpPMlNUT3ZkRE5ZNGhxekQ5WVp4VDFlbU9FUEtVejJ0cmFYQmI4SWxCbVVj?=
 =?utf-8?B?K2VWVEszTExJQURnZUd6THdXT0ZRcVVvYnhGc215eHUwaG9mZFZqb1VheFli?=
 =?utf-8?B?bnJ1UE5QQktoakdBTGovMk9nbXJsZ3EvdGRiRUYrV2U4ZUpZZTNTTEVxTDZV?=
 =?utf-8?B?QXNSV3BFVVdIS0ZlMlhIVkJoM2pIYTdETzBuWlJHRE1JYVdVMWhoQUxISEhX?=
 =?utf-8?B?ODFNeWZObklYc1crcnI0b0R3bVBxNFZxcVVoL3RMQXRzb0lrMEkvcmtsN0VK?=
 =?utf-8?B?TDA3V01kL0U5V3MrYTBvR0JaSlVPMDFIdytkLzQrRThUemR4UjNnbW95K1VR?=
 =?utf-8?B?QlAvQWhLS1BlWjg1UEYwYm45VS9Ka0QyUEx4QVZPOW5Ha2tRYjJ6aXdlNkd0?=
 =?utf-8?B?YjVDcW1KZDIveU5sbk51QkhjV1pNSHFwSFE2djU5bjl3OGkzbGcweEdRbW5S?=
 =?utf-8?B?bTBCVWxwL3VmYnJqYk5ucnlmQ1VFTjFubVpuMHdPVHRmYysxZEI0TDlQMXp3?=
 =?utf-8?B?bmRIY3BzSWZyTmNmYW1ENzVxUnRYMkdrb0hiWHMrNmMvVzhJS0hEcTZ1ZHU2?=
 =?utf-8?B?b1lHNVpzRnkvbXN3WXhJUFZNUkVjRlZFVit6MVE1WGx0Q0R3UXlXRzVXaUNl?=
 =?utf-8?B?aWY2OFFpbklTRkEzYXlnZzk1WTRtc0doK05XUFlwTGMra1Z4RE9hWnZKYXNi?=
 =?utf-8?B?M3VIdS9mZHU3U1hWSG9SRUU4Y2NlcWtiRktvelNGcnhvRDFMb2ttTGptRkNx?=
 =?utf-8?B?Z3o1ZVJiRXpMWmxZWU1jY2FESVVhdTBkSmpDUWlYdWpNclphZkxLUU1nOFgw?=
 =?utf-8?Q?FQv+K1JOtVA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlhHNnh6bEhtWXZFVzVrOVZFd1plQ20vQ2V4TkExRnVvMGxZS2VONjNYamtt?=
 =?utf-8?B?eVdTMXZaWkdZeUs5TjZNN1lEY3V0WTFlMHV6ZUJvQTZaSEhDMW96OVFxTWJW?=
 =?utf-8?B?MmNJK0dFbHZ5eGNaU2V2bnhIWTBCRHVQUjM2WG56RzZJbnhsamV6ZnFKa2ZL?=
 =?utf-8?B?aEFwSURPM1BBQU9qUzA5VXdBYzNUQTFsSXdxeGhWZ2wydmx6ODJadnNXT2Q2?=
 =?utf-8?B?VW10bVF5bTlxbWpDVUh2elJraHNkYUd3TlhJNVFhR1RVRko1RlFJS3FEcExl?=
 =?utf-8?B?WU1YTWZzSjN0RTc2OHRabE9EVnpTSXRGb3dXUDlJQnRYZTJHTHJkTFpPVDhU?=
 =?utf-8?B?THlSSW1XRWJvWU52VC9uOEE0dnl5RllJbjRSTURYWXBCODhQUGNKcnlRb0JY?=
 =?utf-8?B?aWVFQmw0TE9KSHgySUtDbnlISU1xd2dRZjNYTlFmRGlidENFZVErd3JTTzRw?=
 =?utf-8?B?MkJGWlNwZmFmNTdDYTMyS3NIa29XbjlLWEZiMjk4RGZJd2tWbkEzU2JKQmU0?=
 =?utf-8?B?NTQ1eDA3NFVHTGt4ZzVuTEVyZXRsYzNyRXVGL0tGK1I3Y0Q1V1laMnZRVGU4?=
 =?utf-8?B?WTIrTkV1K1l0UDFCMks5WnJia1BBV3lSSGMvdFR5ZUxxYWJ4ZDNJZkdrcGtY?=
 =?utf-8?B?VjFleEQyT0lSaE00VXlyQm1JMXFLT09zN0xHOTZORmZmckdPbnlRU3lsNUJK?=
 =?utf-8?B?QVZ4aFNaWTh0V1ZCZVNsTFYwTHA1SFBNN05QV2Qra09KeWJ6dWVFZkVxakRM?=
 =?utf-8?B?aUFjcGdoVkVCUnZEZDJWeDVJMEZhZkk4cmpDVVNHanVNaWFVKzVoZWFPUDJV?=
 =?utf-8?B?dUpNaThoVXZ4YldpcFU0N0wwN054dzkwNkFMN1BrL1pHM2haSEVJOVNLbGVU?=
 =?utf-8?B?VWMwYS9pMXM2RGpVVlJORlF4VGRLeXVjZC85cnM0R3JmWmY3RXo1ckJJMjVh?=
 =?utf-8?B?dHI3MlZtQ3NCWkM5RVl0Q3NLVzJXMWJrakxkSTQwbEdGUDhNaVhHMkQ0Tm1V?=
 =?utf-8?B?V2RFVDVDZVlUSDdzRHBVKzFnR0JTcW0zN3lqRHk2eC91KzdvUGZ4UTRMVHBN?=
 =?utf-8?B?VHB3aE1WRzNUZTNMNmVjdVpBTVJwVU9pMlZJY1d1UWRXRkgxSXFpb2ltZUxi?=
 =?utf-8?B?RXVlclNLYnZub0VXZmxadkdyQ3RaS2NuaWNmWXNwZm53NmtPWENPZXVPaHlI?=
 =?utf-8?B?eDhwVGtmVVRQeW0wd3lNTzROUys4SktkemhEbjVFanE1aTR0U2JhOWliQ3Iz?=
 =?utf-8?B?cjJYVVhRTERWck1lTlhXOW1DT1ZlOWtOckRMamxPR1N1ekIrVzQyMkZNZnE4?=
 =?utf-8?B?Y1BUc2FqSVhUM0MyV3R1L21BRFJXOHpFUXlxcU05TmZQdlo5d1F5Q3NTMjJw?=
 =?utf-8?B?MERseG1FODlXM25BYmplNDhWVHV1QmlhVjh0QXFZdTBtUnR0Y08ydFVrR3Ez?=
 =?utf-8?B?WjJQc2hFb3N1VDJ1TnB0UkdnR2RaV085UEh0MWVaL2RHMnFkNUVwK242a2pX?=
 =?utf-8?B?K0JUK295d25lS1AyRHdXZUhoOWd4NjcrWGRvWGFaaTJCdFpYZGZ4WW1xNW9v?=
 =?utf-8?B?eEw2VG83YmFhbk53czNNMk5CZ2dFS1JHMWpCMTkvNzBNTnNhU3BGZGE3ZlJB?=
 =?utf-8?B?TVNjWnRVbkZrOHU0Q3ZGQWFTZTZRUjBDVEUwSGtIUUdzK1RYQ0FpV0ZjcnNa?=
 =?utf-8?B?OGVQbmNlU1NEb1dUQWNjSXpOOU1wblA4bENIaGtGZFZYVEpBZk1pY3NCcmY2?=
 =?utf-8?B?WVNKVVZtRUVlVXhpaUJsaFBKNjJ5d1duOTFtekF2di9PQnJuSzB5MXEzQWV1?=
 =?utf-8?B?QUhObTkvQjlmVWozejltdmIyUjU3R0d5UmxCRlhBVnpnSHF4SFVZc2ZvSEZI?=
 =?utf-8?B?bU5tZUo0L3dYY2pXcHVVUDlzSTV0b0hpSDZDT2l5ZWhIMS9WV2dHMHVlRWJE?=
 =?utf-8?B?NTQ5R1FldHpKOE1MRlhEUWFpUU5kSzhjRUs3LzhqaFQ1cTh0SVpObGhSQUhk?=
 =?utf-8?B?bGtnTTZwS05tdyt3QU1GSG5EU1JrNi9CWVJoLyt1WjBWcUIwRUtoa01ia3hu?=
 =?utf-8?B?Tm5LUTVBZ0lsSVVBT1cySHI3d1NkVElvMW9hd2lTYkZhWkpEQTRuZ2VFWUk0?=
 =?utf-8?Q?dW1Zmpf6tT62fp5zwSlvSxckC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1023182b-8bf9-40c3-ffb5-08dde400420f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 17:53:11.7500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shtyN6U3xWfYay71/6DpacQGP5G2m7CmC0aa43XPKCMOPp5hKYkdknKiyEDOPrLk3TDqK3eX/merEQpwpdzR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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

On 8/24/2025 3:01 PM, Antheas Kapenekakis wrote:
> Currently, the brightness quirk is limited to minimum brightness only.
> Refactor it to a structure, so that more quirks can be added in the
> future. Reserve 0 value for "no quirk", and use u16 to allow minimum
> brightness up to 255.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

'Conceptually' this idea makes sense to me if we do end up having a need 
for new types of quirks besides minimum brightness.

> ---
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 ++++--
>   .../link/protocols/link_edp_panel_control.c   |  2 +-
>   drivers/gpu/drm/drm_panel_backlight_quirks.c  | 41 ++++++++++---------
>   include/drm/drm_utils.h                       |  7 +++-
>   4 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index cd0e2976e268..4ad80ae615a2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3612,11 +3612,11 @@ static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
>   
>   static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   {
> +	const struct drm_panel_backlight_quirk *panel_backlight_quirk;
>   	struct amdgpu_dm_backlight_caps *caps;
>   	struct drm_connector *conn_base;
>   	struct amdgpu_device *adev;
>   	struct drm_luminance_range_info *luminance_range;
> -	int min_input_signal_override;
>   
>   	if (aconnector->bl_idx == -1 ||
>   	    aconnector->dc_link->connector_signal != SIGNAL_TYPE_EDP)
> @@ -3656,9 +3656,13 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
>   	else
>   		caps->aux_min_input_signal = 1;
>   
> -	min_input_signal_override = drm_get_panel_min_brightness_quirk(aconnector->drm_edid);
> -	if (min_input_signal_override >= 0)
> -		caps->min_input_signal = min_input_signal_override;
> +	panel_backlight_quirk =
> +		drm_get_panel_backlight_quirk(aconnector->drm_edid);
> +	if (!IS_ERR_OR_NULL(panel_backlight_quirk)) {
> +		if (panel_backlight_quirk->min_brightness)
> +			caps->min_input_signal =
> +				panel_backlight_quirk->min_brightness - 1;
> +	}
>   }
>   
>   DEFINE_FREE(sink_release, struct dc_sink *, if (_T) dc_sink_release(_T))
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
> index e7927b8f5ba3..a1f37267b85e 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_edp_panel_control.c
> @@ -201,7 +201,7 @@ bool edp_set_backlight_level_nits(struct dc_link *link,
>   			return false;
>   	} else if (link->backlight_control_type == BACKLIGHT_CONTROL_AMD_AUX) {
>   		struct dpcd_source_backlight_set dpcd_backlight_set;
> -		*(uint32_t *)&dpcd_backlight_set.backlight_level_millinits = backlight_millinits;
> +		*(uint32_t *)&dpcd_backlight_set.backlight_level_millinits = backlight_millinits | 3;

This seems like a spurious change that was perhaps meant to be tied to a 
new conceptual quirk.

>   		*(uint16_t *)&dpcd_backlight_set.backlight_transition_time_ms = (uint16_t)transition_time_in_ms;
>   
>   		uint8_t backlight_control = isHDR ? 1 : 0;
> diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> index b38b33e26ea5..702726c20ccc 100644
> --- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
> @@ -8,23 +8,23 @@
>   #include <drm/drm_edid.h>
>   #include <drm/drm_utils.h>
>   
> -struct drm_panel_min_backlight_quirk {
> +struct drm_get_panel_backlight_quirk {
>   	struct {
>   		enum dmi_field field;
>   		const char * const value;
>   	} dmi_match;
>   	struct drm_edid_ident ident;
> -	u8 min_brightness;
> +	struct drm_panel_backlight_quirk quirk;
>   };
>   
> -static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
> +static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks[] = {
>   	/* 13 inch matte panel */
>   	{
>   		.dmi_match.field = DMI_BOARD_VENDOR,
>   		.dmi_match.value = "Framework",
>   		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0bca),
>   		.ident.name = "NE135FBM-N41",
> -		.min_brightness = 0,
> +		.quirk = { .min_brightness = 1, },
>   	},
>   	/* 13 inch glossy panel */
>   	{
> @@ -32,7 +32,7 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
>   		.dmi_match.value = "Framework",
>   		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x095f),
>   		.ident.name = "NE135FBM-N41",
> -		.min_brightness = 0,
> +		.quirk = { .min_brightness = 1, },
>   	},
>   	/* 13 inch 2.8k panel */
>   	{
> @@ -40,12 +40,13 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
>   		.dmi_match.value = "Framework",
>   		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0cb4),
>   		.ident.name = "NE135A1M-NY1",
> -		.min_brightness = 0,
> +		.quirk = { .min_brightness = 1, },
>   	},
>   };
>   
> -static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,
> -						  const struct drm_edid *edid)
> +static bool drm_panel_min_backlight_quirk_matches(
> +	const struct drm_get_panel_backlight_quirk *quirk,
> +	const struct drm_edid *edid)
>   {
>   	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
>   		return false;
> @@ -57,39 +58,39 @@ static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_bac
>   }
>   
>   /**
> - * drm_get_panel_min_brightness_quirk - Get minimum supported brightness level for a panel.
> + * drm_get_panel_backlight_quirk - Get backlight quirks for a panel
>    * @edid: EDID of the panel to check
>    *
>    * This function checks for platform specific (e.g. DMI based) quirks
>    * providing info on the minimum backlight brightness for systems where this
> - * cannot be probed correctly from the hard-/firm-ware.
> + * cannot be probed correctly from the hard-/firm-ware and other sources.
>    *
>    * Returns:
> - * A negative error value or
> - * an override value in the range [0, 255] representing 0-100% to be scaled to
> - * the drivers target range.
> + * a drm_panel_backlight_quirk struct if a quirk was found, otherwise an
> + * error pointer.
>    */
> -int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid)
> +const struct drm_panel_backlight_quirk *
> +drm_get_panel_backlight_quirk(const struct drm_edid *edid)
>   {
> -	const struct drm_panel_min_backlight_quirk *quirk;
> +	const struct drm_get_panel_backlight_quirk *quirk;
>   	size_t i;
>   
>   	if (!IS_ENABLED(CONFIG_DMI))
> -		return -ENODATA;
> +		return ERR_PTR(-ENODATA);
>   
>   	if (!edid)
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
>   
>   	for (i = 0; i < ARRAY_SIZE(drm_panel_min_backlight_quirks); i++) {
>   		quirk = &drm_panel_min_backlight_quirks[i];
>   
>   		if (drm_panel_min_backlight_quirk_matches(quirk, edid))
> -			return quirk->min_brightness;
> +			return &quirk->quirk;
>   	}
>   
> -	return -ENODATA;
> +	return ERR_PTR(-ENODATA);
>   }
> -EXPORT_SYMBOL(drm_get_panel_min_brightness_quirk);
> +EXPORT_SYMBOL(drm_get_panel_backlight_quirk);
>   
>   MODULE_DESCRIPTION("Quirks for panel backlight overrides");
>   MODULE_LICENSE("GPL");
> diff --git a/include/drm/drm_utils.h b/include/drm/drm_utils.h
> index 15fa9b6865f4..82eeee4a58ab 100644
> --- a/include/drm/drm_utils.h
> +++ b/include/drm/drm_utils.h
> @@ -16,7 +16,12 @@ struct drm_edid;
>   
>   int drm_get_panel_orientation_quirk(int width, int height);
>   
> -int drm_get_panel_min_brightness_quirk(const struct drm_edid *edid);
> +struct drm_panel_backlight_quirk {
> +	u16 min_brightness;
> +};
> +
> +const struct drm_panel_backlight_quirk *
> +drm_get_panel_backlight_quirk(const struct drm_edid *edid);
>   
>   signed long drm_timeout_abs_to_jiffies(int64_t timeout_nsec);
>   

