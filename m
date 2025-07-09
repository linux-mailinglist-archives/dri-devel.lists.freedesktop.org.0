Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2924BAFE3CA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB889B30;
	Wed,  9 Jul 2025 09:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vdh8fbOO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5ED89B30;
 Wed,  9 Jul 2025 09:14:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9zJP1ZNRnac5qPEaYPajaT78M4EzVkBgbedRw0ayDC1HBhUonwQ2P4J44qvuuj4Y62Bd/FgpPA6XhJXCWXgS6bkh9qCGoVqDXYHa2F/UDQ9UzynAgwBy89ejAqmaREcz3MZdJxBdQedgr/wZO+67siQOFxoCIT+FApCXAEvMPel9ElVl3FI6pYA+fmQ4xOk46YlznGQdfYA1gVWTWeuKfczz19gEgO7EQPE2Ak2+z/uIhc6DKnjRlBNUnbKKUoZd9+NCUSwWAPVkpK5NNpTGgcNcwa52XK/8B5LEmWO+4D1o/eAk6j20jy95D0IWYG5MtfdnlwGzks3a2FMnvsPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p74tVXTHTRuw+eB0/39qIFF0/amZXlokYFw4dqG0Leg=;
 b=rCtqJ6eJS7uRyMpxSCFlyODghrKSPcm61VxlP/utMYyHgHSfgPdk8idhhYU5PBmEuF5YS/9y/1W2eGO/840t2nQ9SPH4sL6XVu+3Ha+U9tKSGkTh27Lx7IL0JO580qmWNVz1Mr9pa87dqetKEO4GZykyS3YrRwh3abWUADXfdHoPMw8K+aOE5eh+G/cGjpHtdGWeSqujS1Z38mQBqiTLHs4ATwo8PnpvfRpBEWmd+YKYfLc5VIuQMRrScIA/LWAcRNCJocQ2jbGfEdhHZneEJ0MqPlrfxwhK3LpQH4O7JLbw7pE0eN3NZ/e3tNrw4bd9rMTxYtaua0tREK1OxHGSPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p74tVXTHTRuw+eB0/39qIFF0/amZXlokYFw4dqG0Leg=;
 b=vdh8fbOOe6O5DMx1nXP9AAE9oUmMvdQs3hoxxhwjEKDYZHKegViFznLxxIcM9wnC2d7exzZj/XxUR50NJIxcM06JOa9b2q1ruKv12j4BcgT+xgLaiD6afEk9hgb754CkHwvchaNjLt6DM2u1RhujHKXTN6MQEsOcBMorCBZ9TMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYYPR12MB8704.namprd12.prod.outlook.com (2603:10b6:930:c2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 09:13:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 09:13:57 +0000
Message-ID: <a72d9d65-d05c-435c-8387-600797725998@amd.com>
Date: Wed, 9 Jul 2025 11:13:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm/ttm: add new api
 ttm_device_prepare_hibernation()
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 rafael@kernel.org, len.brown@intel.com, pavel@kernel.org,
 gregkh@linuxfoundation.org, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: mario.limonciello@amd.com, lijo.lazar@amd.com, victor.zhao@amd.com,
 haijun.chang@amd.com, Qing.Ma@amd.com, Owen.Zhang2@amd.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250709064404.839975-1-guoqing.zhang@amd.com>
 <20250709064404.839975-2-guoqing.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250709064404.839975-2-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYYPR12MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c755ce3-3223-4636-c564-08ddbec8ef1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHVJcFRmK2xGNWF2dm9uZUNkK3gwSEhjaFN0UFZ5d2tnbStRS2xnVnZKdmwz?=
 =?utf-8?B?SHdnRlFVWUpheVZqRkNhQjRHSzROb0xjV0NBeTloQUU1SkxjOHplNHNKRldj?=
 =?utf-8?B?ZEJZUTNmSnpUWXQ3QzQrdDNvM0hmQ0xVUFUxc0lUaWRteVh5ZGdrNFlvUW51?=
 =?utf-8?B?YlpSYUlTQldnQldUQlRQUE5RM0xscnVnSWNZV1h2RVV0QUlEUHUrRDBlNWJL?=
 =?utf-8?B?L3NRTmpzVWxIVHUya3dPK0hFZDcrYUg3bDZCTkhpU1JCQjB5bnVqWkk2dUpF?=
 =?utf-8?B?SlBsQys2RHg4U0w3RnVZL0hWY0lNc1BNUUU2V2FtK01icFJVU2hUQnVCUzhi?=
 =?utf-8?B?WjQ5UTNSNy9HZUZLSUN6QWpJa3FsMUN0YUczbERTMVFFZDB4bU1ia3RLOGpZ?=
 =?utf-8?B?UTlhU1N0YnAya3JRNUhLQXlsRzNJVk1NUUJnQWRmRHhka0ttd29vMzlnS2sv?=
 =?utf-8?B?NVlXb2c3eDBuQnBkQWpjdUdnSnFhZkdTTDhrRVprd3pzRUlHUlNhZGZicEcr?=
 =?utf-8?B?eDNEdyt1SExSdHpLbjhKWWxnMVVhOFp6Sm54Q0NGN2tJYnRSSWNwZEdjRlNS?=
 =?utf-8?B?Uk52N2d1dExVajA3b3VJUzlTMkp0UERzQVVxZ21aTHZUdkVmMFdnNHVhYThW?=
 =?utf-8?B?RVZrYXlsaEc5WEZ4bjRCelpLMHdYeC9QVU0vczdhclZVaExhU2NYaHRkc3Iy?=
 =?utf-8?B?S21HcUhrS003VWlTbWcrZjQxQlJHdWdzdGs3SG9JSHJucnptamtHTW9VOUZB?=
 =?utf-8?B?QWl3SHl2ZjZISmgzeG9wdElEaXBtQ1QyZHBPbjhqTnAyTUtVSHpSd2UvNjNL?=
 =?utf-8?B?SnkxSDJ6RDA1T28xa01XUmFUNUZ5QlFZbm9hMXE5S0M2WEI4YS9oYVZCQ3R5?=
 =?utf-8?B?Wis1VXE0OURFM2VKd1IyWXhyd3RsZTc3dUNBbDZ4KzdveEtUejN6N0dGQU1w?=
 =?utf-8?B?N013THpUckVNeUd1SmJ0UlNnaWEzeWdXVmVROWh2ZFFEZjFqVExScXFlSnNZ?=
 =?utf-8?B?K2FBRExzenJ2SStibFZkOERRY3A2c3I2YlJ0aWQ0Y3RRWlcxVWdvTExBcmg3?=
 =?utf-8?B?aUF0Y0pzNW5KUVdEUFRkVGZLeWhZa1BLUGljQ2ZscXllbFVPNDArdEFaUmxZ?=
 =?utf-8?B?cFFLOEZZUm9YUHlTZU4reFJWSTdxTkRHNllqNGpKUzdmOFNNbG1ya3p6VnE1?=
 =?utf-8?B?ZHpWMk81aUpTMzhtUS9mNmRiVzlLUlg5bUFSTW9GM0xmalk0d3BicEFvVmVD?=
 =?utf-8?B?d2w4NnZTSk1mV3QrNW5LdCtmNk5RSFgwZmZnQzhwR20yS1F3TFZhSVRybFY2?=
 =?utf-8?B?UWk4L0l1cFdpUDh3RlR5SmpIRVc2d3VuZmwrMngwUVBxOHQwb2F2d2tlM3Iv?=
 =?utf-8?B?VVRiRndLQ2g3OCtHc1RKWEVRMDYzeDBJZ1BWTlFrRDY5NngxNVgxS2c3YjdS?=
 =?utf-8?B?aGZZdW5NVWd1bnFReGNVSlNMYTBmN1NXUldXNnZESXlWRUJmK2EyK2p0SFIr?=
 =?utf-8?B?anYzMEo1UDh0cmFNTGFDVGJabVp4MzdWbStJakF2Vk1XYS9EQUxNN0xqUzBt?=
 =?utf-8?B?YXlpQVIvSVFRanJVa09RemtkOFlaWVFpZG9sOXBTVU9MV3RCU21ycDNVN2Fp?=
 =?utf-8?B?SVpHUjcrN2M0TGRBaE44ZWU3SisrVkRYM1B4NEMzYmYzRmF4MVVWbTJNczB3?=
 =?utf-8?B?Z1VsaVZZUC82clFkMjJ6RzQyNnV3TndxY3ZHT1N2T1A4ZXpEODhrZlMzWDU3?=
 =?utf-8?B?OTJsbnVvUnBpMzI2NjMwS28vK20rdzhHMGE4Y00wYWkrd01xUmJhcG5wdStq?=
 =?utf-8?B?Uzc3bGxVOEhCNWdtUXlubmFKZ09zWnNXbUZ5bUpZTDA5V25nSFMwSDROUUdz?=
 =?utf-8?B?K0pQY2hCZDdSRE9NSGFjSitVbjF1a3JKenRrN2tQcDZlRk5DTTVFejUrSFNE?=
 =?utf-8?B?NHhqM2hjYVVQay9MM3NoWDByRSsvVy9iRGYzcFlkZDFHelh5b2JHZHhZVzlU?=
 =?utf-8?B?NVVZd1RhQ0l3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGpybmszQXQ0UXE0ZnNxVmtmbzFEdDN2eWtUQk1aWkNEL3cyaWNlSGkzUS9U?=
 =?utf-8?B?eFNrU3YrUmU3QmdDejBiNktBN2hMZjlnYUIrVWdDVGJUNCt2aEl5ZnBMekdy?=
 =?utf-8?B?SjRIcVMwRmlKY2QzOUtsUXg5b05IazlzT3U5M1piL2RqaHZDUHhZTXcwMkRM?=
 =?utf-8?B?RGs1RGJVYkEvcEdDZ1BqdDZwMnZJS2ZFUUhrY09kYlNsM0ZjR1k4a0lYSmw4?=
 =?utf-8?B?dGp2U3FZSlJKMUttNXdpRmQ0QURTTlFiZ29sT3pxRUdzaGg4aktlZm5PNFlL?=
 =?utf-8?B?aUJTSEJYL25JKy9zdE1KVFRhZm1FOFNLSXVHN1k2SllQTDh2NjIrLzduTnBK?=
 =?utf-8?B?SWhtRTdvUFZ3UTRJWVdVc2JtN0V4VW1MOVN6TzI0eERjcnRSK01Zemc3Tnls?=
 =?utf-8?B?NFE1Q0U5cWI0REM1ZTB1KzY5WGx1N3ZTK0pGSVhxbkh4SUxsR3QrL1dySVBm?=
 =?utf-8?B?cUlWSVZVZDNTVEo1Rk85bWZSeTFQWlZhcmJQUGNpK1NQeUhUdnZzeXh3bVZV?=
 =?utf-8?B?eFkyNWRBa1g3aVFlVzRLUUhPZzFOQyt2UU5Ndnl3ZWN6WlVZNmNSdk9BY0xw?=
 =?utf-8?B?NnhvdlFUcjhWRHlPK0JyUXk1MjBRaWx1RTFMK1VmamthRFRGdVlKdXRETzdH?=
 =?utf-8?B?WUoyWWhPbEtBOE1PcGg3bUk3Qzc2YUdyM0FaSVQxZVdBSWYzTmRvWlZpdy94?=
 =?utf-8?B?NFBVeHBMeldabFJweEJhcmNLb0N5b284c2VUS3RRK0Z3UzBNK0RkcllueUw3?=
 =?utf-8?B?VTNJMFAvcUtHYzdLVlBNZnp6b1JEam9rQW9CUUxZbzJiM2Z3UGlucFFqdnNy?=
 =?utf-8?B?T3h6cThUaUpzNmI2NTJ1cm9ZK2xpVU1YQ1RpYzNJcDVISitwZ3RxOW1rMk1I?=
 =?utf-8?B?ZzhGTVdjYmhLY1hMTzFqb05HeXdER0dPVklTMjZvMUgwN09YY0VYNEQ0djdJ?=
 =?utf-8?B?bG80Q1hhcC9DZnlJbk9xcTNKNlVlV2xJVDFkZDdoRXE1RnIrT1BRRVRVRURB?=
 =?utf-8?B?N0FGbkxDWkpqYVZ6NFo3VGRXUTJjK21WSVRYY1BUQmpPMnZJRDlNeUdJSk84?=
 =?utf-8?B?MlBZa3lpU2x4Zm84RDBzdjAweXZUT2trdDl2UU5oMlBqRWY1eTBtcXoxcTRH?=
 =?utf-8?B?ekEwWHorTEVpVytWRFZpQTM1bzFraFlPSXdHaHVBYXdteHdBTU50Qzh2UU5a?=
 =?utf-8?B?WWFMblZONmdLSklETWhWQkRQT0gyRVpodThRNGw2RDZwc1J3SmxOTW9yUnpo?=
 =?utf-8?B?QURzN2JGenJRNGl4R2pPcEtpRXdxeWxycUlYa1VqTzRpcWVGenZZdkIrRVZn?=
 =?utf-8?B?dkRwVEN4c1JBMTF0U0x5Zmk5N25jR1lHYmxEL0lnK01LZ3U2THEwQ0p5cENH?=
 =?utf-8?B?VjdhR2xCWTJvdFRkYzdHQzdqOWRPNGlnNU9Ba0dRd0o0ME5wRnJCdzdnZHpV?=
 =?utf-8?B?WlE5Tk1LaWtnVjJuT2g2SzBIZ3U3K295Q0Nubk1yTnkvbHVxT21HWUNEOVVN?=
 =?utf-8?B?UlpXZU11NUVEMVBPUmVqM3k5dUZtTCsrVTRheTM0bmNIck5tNG9kWnpqNThw?=
 =?utf-8?B?TkJJRWF1d3JweXlSSndDdjhJUjFteFFMRmU5QTUvbjZQdWZSTVdFcGNsVnZm?=
 =?utf-8?B?MTdZTGZGeEpldGlpQ1ZQRkk4bGRrVWJBTXB6OExES0VrVWxPa0NJKy81bytz?=
 =?utf-8?B?Z3ZUazJ4QUpWZS94U09OU3gxNi9CZWNMRDhHL29Vb0JmVyszd2RWMmxBM2c3?=
 =?utf-8?B?UW1YeXJLNWdtUEZzYVlKQ1RPZGxHdklqUzRzQytmRUN4dHg3TzBRNzBFKytD?=
 =?utf-8?B?aWV5MFlzYU1EZ0lUaXpDQlQ3RnI4bHIyalV1aUtKM2xFZlR0WDlmNHhpUnZ0?=
 =?utf-8?B?UWJ2NVFROXBnKzhRRXVuMVJIQ1lZZkIxTStzN1RFU3dka1hKVWI2M1RxTDBU?=
 =?utf-8?B?L0tIOERZYS9JZVQvQW94Vm41NGpDQmlrMWtJNlIwdmpkWGN4OUJIZEM1aXdR?=
 =?utf-8?B?cTJQNDkzTTFheUNlQmtRbWFGUEZ3NWNFWjd3dCtiZTQwcUpZVGdTOXkwalh5?=
 =?utf-8?B?bTRuaFZoOVgvQlZZdXVSNHlxWVVWZ1ovVmhZNVIrVmdtZzZ4NzVTZTZmMjVB?=
 =?utf-8?Q?CmS0fN93ymNPAk7e9edWoaVuW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c755ce3-3223-4636-c564-08ddbec8ef1a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:13:57.4186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBZVUyU8ymUrcQNaxK1KJov6ZUa1ls+caxvdKM9r/bLkj5op1q6vhJUVsyZIZ1zy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8704
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

On 09.07.25 08:44, Samuel Zhang wrote:
> This new api is used for hibernation to move GTT BOs to shmem after
> VRAM eviction. shmem will be flushed to swap disk later to reduce
> the system memory usage for hibernation.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 23 +++++++++++++++++++++++
>  include/drm/ttm/ttm_device.h     |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 02e797fd1891..9c9ab1903919 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -123,6 +123,29 @@ static int ttm_global_init(void)
>  	return ret;
>  }
>  
> +/**
> + * ttm_device_prepare_hibernation - move GTT BOs to shmem for hibernation.
> + *
> + * @bdev: A pointer to a struct ttm_device to prepare hibernation for.
> + *
> + * Return: 0 on success, negative number on failure.
> + */
> +int ttm_device_prepare_hibernation(struct ttm_device *bdev)
> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +		.no_wait_gpu = false,
> +		.force_alloc = true
> +	};
> +	int ret;
> +
> +	do {
> +		ret = ttm_device_swapout(bdev, &ctx, GFP_KERNEL);
> +	} while (ret > 0);
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_device_prepare_hibernation);
> +
>  /*
>   * A buffer object shrink method that tries to swap out the first
>   * buffer object on the global::swap_lru list.
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index 39b8636b1845..592b5f802859 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -272,6 +272,7 @@ struct ttm_device {
>  int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
>  int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>  		       gfp_t gfp_flags);
> +int ttm_device_prepare_hibernation(struct ttm_device *bdev);
>  
>  static inline struct ttm_resource_manager *
>  ttm_manager_type(struct ttm_device *bdev, int mem_type)

