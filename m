Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29846B00336
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 15:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A1310E8D3;
	Thu, 10 Jul 2025 13:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yvoy4QEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F7010E8D3;
 Thu, 10 Jul 2025 13:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTui5bJIia/FuiB0O8QOYG5h0Bz2MdAnnYV+UL+RiSRBvldUz4UTMu6hhRsTqjcCBkKpfGn8ILp2qj7pc0tTy3X7RWyZWuVcRwZkobreGurQq4eVmL9RCvQ8w+/FDddlpivv24vgaX2pOUVMR0IUrqYQWAN+FAAdb9VtD5aP9DK57EviTWANdkZoeIviuCcQHutTVURI8B+EUz/uCA6TtpzgTZzdxvfpBPfSO5HqGwYUCVm8Aeob3trtRZGLrOCoKjdIayruxVaBbM1pUBApV3SKkX02yaqmobl2k+LqBnC8FtCu8xAVhB/TGi3ukWMrroLOUCk+TXuwMQd1ptIoOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28QOJv73w02ATHPA2Av1SnqjfinVSSDGXO0BBfqK7lY=;
 b=c/TkcHnoXjlYrQAMRSTyRthKf+8xjoVXt0i7ZdqfHsxWDj1gxul95QKZM2I935qaZKcZl8NNi+qvFb15++u5adBwSScHU1S36G2klYJK9vEG9khCA+xmwScCk7BezDYQqCZrf6OA62IZq95FwQwnGcczFaaX9Y0AkYosJ6MJsKarBwDxH0mdZK+ebjCTJy66l6zEg5ZAUxO580hsx8bCPVwj1V68ITSEIQCpzss/I3YeTxvzE2dHuT0dVxmIOxmcvVa5lR4Lsmv3aSRWV2L7XE16ZgJ5toI9T2gwPM1TRI5Fr40KWD9DxMx/s15QWO34CMe/DYwD2KzSH70W/OkLVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28QOJv73w02ATHPA2Av1SnqjfinVSSDGXO0BBfqK7lY=;
 b=yvoy4QEhdx6lc/WxrTgZHp4poqHP4SU2Pk8pLv+TthQ/h2VfDdu+Hd55Fcx4bPNh3uSABIWHCFimI8T+MXP9uK4aouUY7LCJvF87TZmXIhAWtoilpyBBs1JjJRxj87TUrKRIilOJORX1wOg/hccma0nJByVQ+oHEAWzQak9qJ/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Thu, 10 Jul 2025 13:22:38 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Thu, 10 Jul 2025
 13:22:38 +0000
Message-ID: <8d579b3e-b2a4-4209-876e-99deceaceb48@amd.com>
Date: Thu, 10 Jul 2025 18:52:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: mario.limonciello@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
 <20250710062313.3226149-6-guoqing.zhang@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20250710062313.3226149-6-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0127.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::17) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 485c0c46-3fb1-4613-1896-08ddbfb4d6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVdVYXFXdzFjdDRQdzNnbC9iTVVzUzJvNXkzRWxqN1liQTAxLzhvdlUwbmxy?=
 =?utf-8?B?UFdTY3Q5UEVmWFJWdW4yeU1rS1pVMUk1QWhBUGtyNGUxUFVvNFpmL1JiSW1v?=
 =?utf-8?B?N0FZNTZxT2JDckhSelB1Y2VudTRoVnpab2lCOWFEa0hFaDI2QkEvbFRmT0tT?=
 =?utf-8?B?M0JMSG1Qc0hyWjBuQ0I2V1JVaUYrTkhPTkJqSE9WNmNtcGFTMWFEVld4ZE52?=
 =?utf-8?B?d09mOTlreGptU0NtaGN6TVZKdXlFZmRkUk4wdExHMmxiOWo0ZzhST0I3NEVO?=
 =?utf-8?B?TEs0aUlxNU5FeVY2M0JJMWZ6dnNrekpCSEpqSzUva2huckQxZGxMaFhYbVgx?=
 =?utf-8?B?WVl6Zy9kazlHUHFRZzdiVlZmYjdoMjlpbWM0SVNOZitWb0Q3YUxGYW9Vd3Vs?=
 =?utf-8?B?RTkzUXpJVUs0RWFRLzJ2N0JUdUhtUGl1cEtqWTVNeHZhelRjSzQxQWgrcmtW?=
 =?utf-8?B?V0RSbnFjYmhHd0RrbDVwc2EzUnBmaFBlWkpwV2tPL3kydVkrVkZRY1VrUGY3?=
 =?utf-8?B?WDVKZkVQT3RvQ2g5aXJLaHk1YXVYbWxKMVVUd2g4bFc2cWYrek1kVWozUjV2?=
 =?utf-8?B?ZE96Kzg1Nk5QQkxrQ2RReUFqY3lhWnQ1V0xnREhQV20yR1lDOFhpbXAra2J2?=
 =?utf-8?B?aVhZK1NxK093MFN6aGpZS01KajRiOTBXckpDa3pPMHY4bzFXbHROT2duWTFo?=
 =?utf-8?B?S1hxL08vOFo0RUpReGVjZ05nTm1wbFdGcmdxWVpIV2RmbmdGWlVkeDVnY2p5?=
 =?utf-8?B?eU9yYmVjMG52TjFyQUpra2NpK1B0WVdkSG9Hai9vV1hiaU5iTmEwVEM2UklC?=
 =?utf-8?B?QzZqNmtLajNNbXpBVmlET3BZRE9HVUkxRnVhSmFJazlnM05mREkzQUd3VkZz?=
 =?utf-8?B?R25FTThXc1E4cGkyZmVFazhrNlBFbk5hQzZBRHF1VVp0bUIvb3VLdlg5MDcv?=
 =?utf-8?B?b0NId1FuUllzVFZ4TUtqTmM0WTZkV0grTE5sTVFBKyttdmE5RDMvY0ZId0t4?=
 =?utf-8?B?VzB6SXVTMHVaUHluanVsNnl5Wks4Q1FqamZTeFBDUlVLTXJxcnhsSnBhMy9y?=
 =?utf-8?B?ZXQ3Z3dHN2NyOHZVWlE5eHZTNHdPamk1TGZ3bjJVTFhFQUdlTEJVSU51NnlZ?=
 =?utf-8?B?ZTU3L0FKL3FVQmRoRlo3UUxMYThkbHlzQ0dyWGNHMERhOUxtSmNUVlZiTERL?=
 =?utf-8?B?YkdWdTNOWTcrUGZ3NmVyaTJJOVpGUVczOXduWmZJT1hreFN5dGx6b0RFS0RR?=
 =?utf-8?B?amtCU3pmalBlZmM3ejhlTXVGL3A0QU1DYkZFSlMrRDYzYkxRQTVqdlRBQUtX?=
 =?utf-8?B?NFhqbkxqYXpqYmZ1bktvaFhJdkVYV2FsUkFjc1BmdGxmR0hsVzhHeFMvWUJC?=
 =?utf-8?B?eWkrWnRVbDRzT296SHVxcEhaVDVwaFJNRWZQdzNsd1VEenpVWXNkc05EcU5t?=
 =?utf-8?B?clpXdWpxRXRlczRyUm94Nm1JME0rcmpNdEhrRlJpRUFYYmg5UHZwdDZDQTlw?=
 =?utf-8?B?ckJKNU1tRlVuN3RzLzhBSW1MMXZUakVTM3YzOG9iT1A5czJSd2pKNllLWHg5?=
 =?utf-8?B?WHJNWGhsTjhFZEsrb2NuNjA1ZHVMbVVPdC8rVTVZd1dKY24zNkJUV1hvVldT?=
 =?utf-8?B?N1FJOWMzNStGb2M3VTVzRVdPTjkxZ3luN1kvcmZ1QWV3eTVFRW0rYzFUN01X?=
 =?utf-8?B?ZkpCMTVZb2YraXVVZnl2UXVxUWF4emhVckNyWGFDS2VYdWpoK0JINDY5ZEYx?=
 =?utf-8?B?TVBqbU5oTVZlOFAzMTJ2R3IweDFOZGtidEJMaFdpRlB3VDhBWnQ1R0FoS3Fx?=
 =?utf-8?B?clNTWnVYbkczeTQ2bDVqVERnV2pWdGlEMzQ5N0JFaHh6RE1HM2I3c1Z0M0lJ?=
 =?utf-8?B?a1MxMy9SU0hVV3FCdXFOc2dZem9ha05rNVl0NUdtZmFreVB3ZUhldnVKbzJG?=
 =?utf-8?B?Q1plSVpxVURJZnI4Z3YzNkF0MllQMkJoQlMzTWJlU0RIUmJGejlPUTY2OUE2?=
 =?utf-8?B?QnFhSHFCMjlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnBic0lubjhYUWxOSnJrNWVyVHYvOWRuSG10ZUVJTGhqQUtteTdtL0hCdUhZ?=
 =?utf-8?B?cFdoZE9lVU9aa21OWWFxME8raTRCaWg1R1pReHFidklwSEF4SEpER0pRelFm?=
 =?utf-8?B?TWY0aGIrTkRzOTNuSURGeFRNRnZEb0pNeXhGdmZOSEFqaVZRUmhrRTBUUFI4?=
 =?utf-8?B?MHRnL3Zmbkp1RGp1ZWo0djY2R0F6U2o1eGpraHpIMnN4bEVOdkhBWWN4V3JO?=
 =?utf-8?B?SmdiL3RuWDBiaXkxNlR2eGw4MVh0MjJONWx0ckVIL1dGdld3ZmxxTHRUQzNZ?=
 =?utf-8?B?eE9tMkVPdE1ZRk9rYk92VDBHWUpmUmdFOEFLY0xMcWxNQkpUdFM3ZXh2RkpR?=
 =?utf-8?B?c0dicjkrV0w5RitVWEc2Q0h1cFB3dFRnUmdVZWF1UVpxU0hIVXNpQ2V5SEdl?=
 =?utf-8?B?M1J1cHlSbmRlZE1SVG5mZnc4ZC9FcHpadUROZGJwU0Q1TjZQS2V6cFRVWnV5?=
 =?utf-8?B?RjVoM2xISTJyNFlLMjFCZ3diemVid1Q1VUM1REZ3blVXV2JBTGliQTB4cStt?=
 =?utf-8?B?VmRWd0xCTHFpZlhVOVdxVUJ1M3VmMEsvSy9MUHVaa01ERFJPaWJyelppZU1Y?=
 =?utf-8?B?eXQzSFd4UVZpUitSdnhoQzFsbkMzQVBWUWQzcy9PeWc0VnNYMzNtRjlWbm81?=
 =?utf-8?B?c0JTelBkaVp4ZUJsQ1g2RDZMbFp0WkwxdUJIeHEzanA2VkRFeVRvWVVycVYy?=
 =?utf-8?B?ZWN6eUJpV0xWa1VtS2NNcFpiK3RRWG5CSkQ2SklGQm5BWU5ZVkFPN0RSaGdy?=
 =?utf-8?B?WUdlOHM2akFma2FBdjl4T1JrSXFRdExLR0FNVE9PMGM4YkVDOUpOVFdXNzRS?=
 =?utf-8?B?THMwNVdab0p6VXhtUWNmNHkxN0M2ODNoMk5UMDFWWXVKNEFyYkNIenQ5ZDdV?=
 =?utf-8?B?cWs1SkdlWGpqdU91V05KdEljZFpmVjFxMXVyVVpkeGtlYkJYYVNMTkZWNzZR?=
 =?utf-8?B?MzVVWEFpeVdqSnBCMTRIUmVrWnNiNE1ScVVkb1B5K3lKbVZTN0Y1NWVLMW4y?=
 =?utf-8?B?MWhycU1WUzJVTDc5UEx5ZElHSmFOSkNFWko4MDhVd3dFSUMyY3NtdzN3NGpO?=
 =?utf-8?B?aXhtcWJ4akpXZU1XRWxLZWNBdnZjRjlKQVJqMzhoSVFBczV1VnhXcWJaVnRS?=
 =?utf-8?B?ZWc1VC8yMkZEQURnVEtHQlBoUmNQbjZneDY4dkF4RzVRZWFlNERuanltZjJP?=
 =?utf-8?B?ODAzZHl5NHVwOUN2cnFrcitQSjMycU1KWDJxaVlxY1VkNTJGY0xabThvUHZJ?=
 =?utf-8?B?Y29QUmxGZyt0SjVYK2VsSnlnWkRwSkN4VWZRazdQZCtLMUNNallpVEtuUHVp?=
 =?utf-8?B?NnVGNDk1b0h4cElmYVVXdVVCZkY2UXBLZ3NKS2FBVDNSSnBUOXZuTVJBSXlM?=
 =?utf-8?B?enVKVllJaDhvRlRwWUw2dDA1WjE3M1BZQ1REaFJON2tPbHBJMHdFNEZCNlly?=
 =?utf-8?B?Q0sxZGpwajh0Y3pHRFN6ZngyaWlZU0tQZnAvYWh4UDNYUS9NM251ZzJ0eWJQ?=
 =?utf-8?B?VUZ2WjZtNWwwYXpaMEFhdWg3S3dOT1Z4dGJTL1pGOGg4TnZjZ0llZkxQU0l5?=
 =?utf-8?B?V0svZGtFL09FYnk4OVc1M2xtWDRVMnY2QUlseUNGcHZjMVZQeklGRytRNk5a?=
 =?utf-8?B?aHh2ZTR0Y290U0VDTzM0OFFjWjd1ZmJiS3MxZm1WMDRqRHFJaXFiY1RFL3Rr?=
 =?utf-8?B?c1VrYVZxLzRUL084MkJIYjhiU3oxTi9sY3pjbWVJRVBiTmtzV0FTYTFoVmEy?=
 =?utf-8?B?NjFFRUY1bWN2ZDFGdzBHN2lmeVc2TnczSkVHc2JvY1JyMFdtcUNnVTlGR3BV?=
 =?utf-8?B?RFhsaWYxU2FScjNtUmpUVFR5VGJ0MmU3eXBpeXV4Nzd0VWo3bEJZditDY3Jy?=
 =?utf-8?B?NXBqbVJoUlJDbkt4Y2h4dW9wKzRRR2tBWkRyYnY4NWNnbjBsMTlYWXpyRW1S?=
 =?utf-8?B?VXhWcURteElaY1F1eVpBWnpJWXdVUVRISGRLbm5xS0xaWVRMdjh5T3VYZWJr?=
 =?utf-8?B?T2o3TStDYnZTaHRhWXlqbVQrK0l2Z3hlQWRhQXJnZ2swbzBHL0psRXhvOGZw?=
 =?utf-8?B?SDdta2xibUUrTkc5S0VVZHMvOTlRZWpmMXU2emhaeGFmczRyWXR3ekFFYzBD?=
 =?utf-8?Q?rk0VZJyPC7sfu9+KtlgxJfJyX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485c0c46-3fb1-4613-1896-08ddbfb4d6b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 13:22:38.0866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wja0RoTrRwnUTIrxFXhY8iMHiG1AVxNwT967DPUm3/S94p5GdPqpmdAbt5ybM98B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814
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



On 7/10/2025 11:53 AM, Samuel Zhang wrote:
> For normal hibernation, GPU do not need to be resumed in thaw since it is
> not involved in writing the hibernation image. Skip resume in this case
> can reduce the hibernation time.
> 
> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
> this can save 50 minutes.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 1c54b2e5a225..021defca9b61 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>  	if (amdgpu_ras_intr_triggered())
>  		return;
>  
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return;
> +
>  	/* if we are running in a VM, make sure the device
>  	 * torn down properly on reboot/shutdown.
>  	 * unfortunately we can't detect certain
> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device *dev)
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
>  	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>  
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return 0;
> +
>  	/* Return a positive number here so
>  	 * DPM_FLAG_SMART_SUSPEND works properly
>  	 */
> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>  {
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
>  
> +	/* do not resume device if it's normal hibernation */
> +	if (!pm_hibernate_is_recovering())
> +		return 0;
> +
>  	return amdgpu_device_resume(drm_dev, true);
>  }
>  
>  static int amdgpu_pmops_poweroff(struct device *dev)
>  {
>  	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return 0;
>  
>  	return amdgpu_device_suspend(drm_dev, true);
>  }

