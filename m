Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2948A24B9C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 20:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B8210E19B;
	Sat,  1 Feb 2025 19:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y/7QdtFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BCC10E19B;
 Sat,  1 Feb 2025 19:43:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F855JKs3v/9C2QlEuqpeBUMNNUO0XgRGOfywUj4+MKNMNqKbvJLKaxbAyAz/Z5uzw0f7fHZeyfYbRUhClpvzoVTyl69NLdmjGkLq2YzXYAzrwMN9IAi6iwbUvBSZRdMyaT/XB2cUKauK9XFP22nq+rCopDgHHiJ3uHFKm4CUcA2tyx1v2N9aySHn6miXVFe9+KmpANzSt636A5ly03v0FidQVRakIhkeoCTg3b+G+952tzYworSthrDI3gvcgMa05qnanlmrg/dQVGaIRplqOVAEu3G3Yvd6azaWJTk9BdoebTd1BgGN+GAkDDowlKJw4Pvf4/WoAf5tukXLYjn7cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a2p9LuQpVQjcw+vmt0eSOpTbX/ZPcHW3/mfo+QOgrKE=;
 b=dP8n1/WTQfIpdlKUvhPt4pxeZeRNQ02njMMMR6LxN0hMun7YzLnArIATU8jKQNsX3IAKSX+ZaH1R7kapusv25K2vLBC5St27Ngbhd8YUtCx6Dp4S8OiT9lfl+448OQ2mAED9ZbiWaz+zJ22+/slIkhOCgCI4yT3qWqJFRUR3obj15ByIJznZbD+leoRpkeZT9UEDXzGB1LFv8EGXYPRfzTTX2nvqdbKp7zEQlQoaBQvFsG3nMSH1QiiMnvVqKWHCZ9mPS52K9g4lWn7DL9noJRb1cQFN0TAtoC+kFcAShxG8Iuk0b/chtU0+C153XAWafxV1GRyViFmHhTvzeP3Dgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a2p9LuQpVQjcw+vmt0eSOpTbX/ZPcHW3/mfo+QOgrKE=;
 b=Y/7QdtFM7VAMeW2odui7Xtt+nLAWz5I2E1RE2C7QPxm7BkrEqFIExW0S4fYXFRXbTCSRHf3UQfGNs24ijC70mHJ6sEamQCtMsFrYkZEKeybJ0jLfjrINZ9E+dCgtShb0ibt+DJtZBtIhG/T3EvY3wStZuI6hVmzXkLTl/8dFBG+xuj52xx2o2TX6YQTEG1HPOxj9mWI8Lshli+OBpjCSUFTtCzXmwiW1VOiTG4+mx0AxWlA9LF1rFyLw651di9ONikFDvl/99/Ra8mjlb8KFri9GK26l+d6pAjRlnMcmO09bRl3lSULRQH6jTlFZwWwayGnTQA4KEwgwS4GPp7HBag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Sat, 1 Feb
 2025 19:43:55 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8398.021; Sat, 1 Feb 2025
 19:43:55 +0000
Message-ID: <69893efa-fd7b-4fd9-933a-4e418a7634ef@nvidia.com>
Date: Sat, 1 Feb 2025 11:43:51 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] gpu: nova-core: add initial driver stub
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 ajanulgu@redhat.com, lyude@redhat.com, pstanner@redhat.com, zhiw@nvidia.com,
 cjia@nvidia.com, bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250131220432.17717-1-dakr@kernel.org>
 <35d74754-ed0c-4f6d-817e-86638ca2bb70@nvidia.com>
 <Z54nBHJsAzU9xP8o@cassiopeiae>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <Z54nBHJsAzU9xP8o@cassiopeiae>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH7PR12MB5596:EE_
X-MS-Office365-Filtering-Correlation-Id: 19ecf181-a259-4f78-e628-08dd42f8c36d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkp5M2R4VTdVazFiNmZtMEdkSzM3cEtFTy90NjhpZ3FFeHBrZlc4V3pOQjF4?=
 =?utf-8?B?eUVOblI4Tnc4ZFdoS1dJMStuK2t6UHZEYzVYUXN3VE1vTENDZk10Q3k5OUJs?=
 =?utf-8?B?cm5CQm9Gd0NoRXNEVWdUR3c1c0ZpOUVqMzJiVmNpYVNmdURtTUNkZ3Fzcjgr?=
 =?utf-8?B?djkvVFM0TjdTbjZ1L0Z0cDhUTmtrM1paWm55UmQ2ZEN1NUhRYTRvOTdBU2tm?=
 =?utf-8?B?N09HNlBvdTg4bmpwcnhldkJiRm5vQUhXZGVsK2hrTkh6eUovWEJrOWl1bjgx?=
 =?utf-8?B?c3pQNDZENEF5MmNhdTlmK3RZcHAvQ21QaHhCbDYyTEQ5Q3FROUl2Rm54SXhh?=
 =?utf-8?B?TWZVY1dzNHNMTFVpUURqZi9pL05hbnNlV3RoVzRMWUNZYUdGR3RCTkZYTGFm?=
 =?utf-8?B?MkJXamhnQ2dFSEVLbTkwL2l2TkJGYTlFRWFuR21ObzVvWEVzdVNmTkNZWmRE?=
 =?utf-8?B?N2x4dFdtSXRvVUdGK2lhV2YwYkNteVhoSktPT3lYTHhmN0tDYzY5Qk1aMUsr?=
 =?utf-8?B?Q2VubjBkaVRCSnByNUNZUWZ1UHBUQlBwM0VvU1RIcUlUZWU2UjFkdjdiMGNY?=
 =?utf-8?B?L2hPYVRVZlgrMXVWNzdvOW5GdHZVbVVIZ1RTemJDbllXS25nTDRYdUNwWWxu?=
 =?utf-8?B?ZUFEZ3IvYWFmWUhMdkRRdytpUWZBWFd2Tk1oMTJyMHdoVmJmUmRaY29zZ2p2?=
 =?utf-8?B?aUtwSHp3Z2s0elpyZGs0ODJjTWIyakJsc2JPTERvUUxiV0ZaZXNwL3FLMW9t?=
 =?utf-8?B?UGp3NE95OUlLWXFwUUpRZUVydVAvR1FtVEFqZnZrczJNbm9sWnBPYjMrd1Bs?=
 =?utf-8?B?dW5uZTBkVG1hYUZ4ZFF4SE9yWWFDSTQ5K2d3SXBEaWlkUno0Q3FnQ20rZ3BN?=
 =?utf-8?B?NlR2ZXFJMFRrV0RsV1BsUWxnVlRjQ1Q4Ylc1RC9aYVpSc05zdUpCWEhwOERW?=
 =?utf-8?B?ZGRlZGRrbGF1ZGJqTjhkMXJRb0VTaGVTaWdHeGJJWGVQUE1pTFNoNUVqMy9C?=
 =?utf-8?B?d1ptY1FQVG0rMmcxYmtkUTRJcVFuWG01bUx2NjdKdlZrdktCVUJhYmIyRENY?=
 =?utf-8?B?a2xaUmphc3MrN0oraVdrSHdORjZJQUk3czI3TDNxTk1kaXRUeDBWSVBXMmIz?=
 =?utf-8?B?Mm1NbmhVRmc2cGxpcDJJc2tiRURyK25ySG4xeDNsbXJyNndSYUkzU29YNGN0?=
 =?utf-8?B?STR2SkhaVkdLNXBmSmpBWW03Undnd3RWdVZvL0ZvdDN3Vml4TW0rcGFGQTEw?=
 =?utf-8?B?cUp0dFNITjdzNVUvRE5yd0lQL0ZkaW5mVWdIWmxFT1U5RUNBb1B2TFUyOStq?=
 =?utf-8?B?TUR1dC9NUmc4amsxY1hwZW1WZXhUbVA1OVdOWGRDL0ZXVFVvRC91Q1hkcUs5?=
 =?utf-8?B?VXFEU0VLOElEakhBOVYzSmhka0hNeTViNnJNMEhacjF3aVA4VkZPUjI2emxU?=
 =?utf-8?B?WXliT0FCUTBPOWVINk1CZnVoU3NUekZiUFBtQVZHNUFUMHdpemJwNlZFTjBH?=
 =?utf-8?B?RlFyK1F5YWVMNTU2WXFCcm5oY3hmTnROV2xyVHRVeHI0M3dzTnpUYWFrVGwy?=
 =?utf-8?B?bS9ObGpMQkVkaUVtKytQeWZXSDJrdUg0aWhBbThWWUgxSHN5RENGQXZJNTNp?=
 =?utf-8?B?SEZ3bWpKZDMxTFV0dlR6UDNnZHNmdVJiQUtaN1UwLzJ6aHg2c2tJUld4TWhE?=
 =?utf-8?B?eklPTUR5UVZxTndmaGRUMk11QVEvbXpzWXVTbHZFRUZtNmRsbFIvNGhtbkdy?=
 =?utf-8?B?TTZTTzluUFdsdGRYVFdldTcxRTEzNW9pMFF3MFMyMkNXMGVPZWZtc3JSRWU5?=
 =?utf-8?B?QVpaMk9oSW1xZ0JjS1pLNURETytDTVIwUVgzNk5OcXBCby8xQzZMWVdodFNh?=
 =?utf-8?B?a0pVRHZiblpXNmxjL2x1TTk2ZXh0S1BDSXJ0Z0dKa2ppWnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzQzYUY2dEVTWG1vcDVrUVN2dStZNUMvQ0JWM3E2b1hFUndVNVUzcnpXb1Jn?=
 =?utf-8?B?UEt3Y21XeVg4UXpqTTJEcjJRMzltMDAxWWowdkF6MlM3TElPdVFCVVJYWkxR?=
 =?utf-8?B?VDRBdVorN2NRZUtMKytGOVNHZ2orVE9VNlQ5cnNqaE15UTRiWGpjcGJpV1VE?=
 =?utf-8?B?cXl1VFVkSlFBemErWGpnamRlRlJWOTN6Rk9uUVp6SG1LaW1FazRMS3JnRVdO?=
 =?utf-8?B?NHJrbTJ5RXpHL2JjMldYVnVkeE5sdnFwNkJudXVIdThBajFqSHVoYkpzYkQ4?=
 =?utf-8?B?ZzFVM3ZNQWZ4cTluUGtQSmxoMnFRelNlc0RCc3JyaUQyWkxEaXdqWGowR1pi?=
 =?utf-8?B?L3JNbVZlcG9kSlI2TGVtSHZteDV4eFEvUkROTnNGYWZ2Q3JwUm51ZFR5NEFi?=
 =?utf-8?B?c0FjWGI3YnBtS0hUMFV5QjVKTGtkTGF0cGdqOTZiUmxwUTE1dUQ4ekhmY2hN?=
 =?utf-8?B?RHhWODFJelhtU3hEU09yZlY0eTJoejBkMnpQSEs3dEV6VU5mcGxwZnZyNFJs?=
 =?utf-8?B?MEdkR1NyeFlSVk5EYi83d1F3Z0hLOEk1WDBxUDA4WW1YSUcyTExLN2x0ekR1?=
 =?utf-8?B?dnVxTW1FeDRJME16QTROTWNvaU1mMU1SMU4yNGlIOGp0S1FzUkx4U2RhZDlV?=
 =?utf-8?B?TEkwYjJQSXlLOXg1MytnMC9GdlpaZndoMzBWYmVPdVlLaVBjY1hWTDdSaUV3?=
 =?utf-8?B?b3AwS1lZSnlDSVM0ZzZ3MzhmU0RLSWhXeFk5dXcxeUNvWWhlL1JLdDNzbGtD?=
 =?utf-8?B?dXVGVVhJSnJKaSs5U2wyTjQ5c05FMTNPRjB4S3l6VG9oaERUSmo1WE9EL3kr?=
 =?utf-8?B?a1RCRzZJYnM3MjRFNTBsajZOdGdPTTBaR3MzZnFpUEFqTE4yU0RDdkZVYXJK?=
 =?utf-8?B?UVJXcWxnYi9WRCthTks0RkRMcDlFMXEzTlV5SzJKd3lGdy9HdW82bWh6RVNT?=
 =?utf-8?B?T1N1dHpMeTc5M0U2V2tGOURlMCtiTzlPbVdOdzBrcUpyRnNFblJORUwrdWtx?=
 =?utf-8?B?cUl2NlY2cVFPbzArU0RPZWNRZXNIVm0vMG0xMHptNlcyWmhkVDBxOHh6a3Uv?=
 =?utf-8?B?UzlWckxsdkpxTWxONkE5cUs1cmVPeDVKSkcxZHBCOVpFM24xYndwZ08xdUdJ?=
 =?utf-8?B?aGJGbkw0N1RwUXVsVGt1UnB4UU14SEFjc2FYeERYay9wOUZ0K052QmtpQkd6?=
 =?utf-8?B?WmlqZ25wdlVxdzNCZ2poNzZUNURaQkwveG1VeWN6YWF0TElWWE9XQ2phYWNL?=
 =?utf-8?B?eXZsZjZHbk9JdmY5Rm9tU3J6enNZYlJEMkttOXZoSGdQblpQcnNVYkRneHhY?=
 =?utf-8?B?c3VDb2w2VStmQjFoUUlqWWp5TXViZnhxQ2VveVZ6UnZEdlp6eUE3RDY3RXNM?=
 =?utf-8?B?eW5Rd1NJY3dINFhzR3RFVFdKalpyRnFkTmIzMXRsRXpzc2NYOXBGZHRpS1NQ?=
 =?utf-8?B?SmhYaFJQd0ZIM2RmMkNiOVM4dkRXeEk2UjQwMnRvTnNzWVA4N0Y4V0VqVkQz?=
 =?utf-8?B?aGZScFp4c2piV1FnZUhiUTRLcFdZVHhicGlVdWZzaWY0bTVEb092bVpHVEty?=
 =?utf-8?B?TTh1Yk9ieE9iZUtPUkVlTGtWMGc0a29aeUVVRW50WktobmJnSmkwOHV1cXBw?=
 =?utf-8?B?UVg0VDlTeWF6bjR3cjF0OC9ncWE5OGJWWjArSFc4UU9XOXZZU0pDYis0S2Z2?=
 =?utf-8?B?d1NMeW1Hdk9ab3lZSGxDeHJtRFJQdThQN1JWR3E1bUtvUHRPbTN6ekZqY1Ri?=
 =?utf-8?B?NmVERS94YnZHYnBoL3ppMGNvSk1mOW81VFBoWGVwTGhYVUpTQ1V1U3NyNjFh?=
 =?utf-8?B?MEFldjdFTll1bkVzTXk2SlFaL1dOMUw3Sk9SM3Z2K28xL1V0T2dVMHlXcTNz?=
 =?utf-8?B?RWRQSXgyVmRlK0J0Z2ZUbDNnRkZ4NGZUd1RmN2hwNEltR3QyOWFBbjRjZy9m?=
 =?utf-8?B?bDhuM1cvNTVkVGk2TDE3Vk8vcUJkS3oyRm95K3BLQmtYWnUxQVl1UlVmT3pK?=
 =?utf-8?B?QzNqd1dyd3VPZjVTelZzQm5HVjFBRFFWd2tGS2p0RUpXSUcxOVk0SjIxeC9E?=
 =?utf-8?B?clUyclhPR2Mvd09mZkRhOGpDaWlKenhwMVE2cERNNzdrYzFubTRwUmcyaG8v?=
 =?utf-8?B?dXNKT0dlcHEyc3V3WVRzenp3ZzhBbFV0aXZIdW9HQk1qMEJuOGNpUG9JT2c0?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19ecf181-a259-4f78-e628-08dd42f8c36d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 19:43:55.6390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MD3FUnaShRczy6L0ipyXfZgN0zQOXDzDokcYaCAJ3NOo4/7aGp/qrMDwWZB4gT7mIiW4dV6ekknr4Zv3lzCXzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5596
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

On 2/1/25 5:52 AM, Danilo Krummrich wrote:
> On Fri, Jan 31, 2025 at 08:01:00PM -0800, John Hubbard wrote:
>> On 1/31/25 2:04 PM, Danilo Krummrich wrote:
...
>>> +/// Enum representation of the GPU generation.
>>> +#[derive(Debug)]
>>> +pub(crate) enum CardType {
>>> +    /// Turing
>>> +    TU100 = 0x160,
>>> +    /// Ampere
>>> +    GA100 = 0x170,
>>> +    /// Ada Lovelace
>>> +    AD100 = 0x190,
>>> +}
>>> +
>>> +/// Structure holding the metadata of the GPU.
>>> +#[allow(dead_code)]
>>> +pub(crate) struct GpuSpec {
>>> +    /// Contents of the boot0 register.
>>> +    boot0: u64,
>>
>> It is redundant to store boot0, when all of the following fields
>> are deduced from boot0.
> 
> Yes, I think we can probably remove it, I only use it to print it in Gpu::new()
> as a sign of life and because I don't know if boot0 contains any other useful
> information than chipset and chiprev.
> 
> But maybe you can help me out here? :) That is, share the register layout and
> field names. This way I could also get rid of those magic numbers, and put in
> proper naming for fields, masks and shifts.
> 

We've open sourced those, starting around 2017, and for example the Ampere
fields for boot0 are here:

https://github.com/NVIDIA/open-gpu-doc/blob/master/manuals/ampere/ga100/dev_boot.ref.txt

If more information is needed in this area, let me know and we might be able
to open source it, depending of course on what it is. It's just 
explaining what
the chip is, after all.

...
>>> +// TODO replace with something like derive(FromPrimitive)
>>> +impl CardType {
>>> +    fn from_u32(value: u32) -> Option<CardType> {
>>> +        match value {
>>> +            0x160 => Some(CardType::TU100),
>>> +            0x170 => Some(CardType::GA100),
>>> +            0x190 => Some(CardType::AD100),
>>
>> Is this how nouveau does it too? I mean, classifying cards as GA100,
>> and variants as TU102. It feels wrong to me, because we have for example
>> GA100 GPUs. I mean, GA100 is the same kind of thing as a GA102: each is
>> a GPU.
> 
> Yes, that's what nouveau came up with and it's meant as e.g. 'GA1xx'. But yes,
> I agree it's a bit confusing.
> 
> OOC, what about the first digit in this example? For Blackwell it would seem to
> be 'GB2xx'. Can you shed some light on this?

I'll take a homework assignment to go dig that up. After GSP and Open RM 
came
out, we stopped explicitly publishing to 
https://github.com/NVIDIA/open-gpu-doc ,
because the same information was being published in
https://github.com/NVIDIA/open-gpu-kernel-modules .


> 
>>
>> If I were naming card types, I'd calling them by their architecture names:
>> Turing, Ampere, Ada.
> 
> Yeah, that is probably less cryptic. Plus, we should probably name it something
> around the term "architecture" rather than "CardType".

Yes, "architecture" is accurate.

> 
>>
>>> +            _ => None,
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +impl GpuSpec {
>>> +    fn new(bar: &Devres<Bar0>) -> Result<GpuSpec> {
>>> +        let bar = bar.try_access().ok_or(ENXIO)?;
>>> +        let boot0 = u64::from_le(bar.readq(0));
>>> +        let chip = ((boot0 & 0x1ff00000) >> 20) as u32;
>>> +
>>> +        if boot0 & 0x1f000000 == 0 {
>>> +            return Err(ENODEV);
>>> +        }
>>> +
>>> +        let Some(chipset) = Chipset::from_u32(chip) else {
>>> +            return Err(ENODEV);
>>> +        };
>>> +
>>> +        let Some(card_type) = CardType::from_u32(chip & 0x1f0) else {
>>> +            return Err(ENODEV);
>>> +        };
>>> +
>>> +        Ok(Self {
>>> +            boot0,
>>> +            card_type,
>>> +            chipset,
>>> +            chiprev: (boot0 & 0xff) as u8,
>>> +        })
>>> +    }
>>> +}
>>> +
>>> +impl Firmware {
>>> +    fn new(dev: &device::Device, spec: &GpuSpec, ver: &str) -> Result<Firmware> {
>>> +        let mut chip_name = CString::try_from_fmt(fmt!("{:?}", spec.chipset))?;
>>> +        chip_name.make_ascii_lowercase();
>>> +
>>> +        let fw_booter_load_path =
>>> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin", &*chip_name, ver))?;
>>> +        let fw_booter_unload_path =
>>> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.bin", &*chip_name, ver))?;
>>> +        let fw_gsp_path =
>>> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chip_name, ver))?;
>>> +
>>> +        let booter_load = firmware::Firmware::request(&fw_booter_load_path, dev)?;
>>> +        let booter_unload = firmware::Firmware::request(&fw_booter_unload_path, dev)?;
>>> +        let gsp = firmware::Firmware::request(&fw_gsp_path, dev)?;
>>> +
>>> +        Ok(Firmware {
>>> +            booter_load,
>>> +            booter_unload,
>>> +            gsp,
>>> +        })
>>> +    }
>>> +}
>>> +
>>> +impl Gpu {
>>> +    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
>>> +        let spec = GpuSpec::new(&bar)?;
>>> +        let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
>>
>> lol there it is: our one, "stable" set of GSP firmware. Maybe a one line comment
>> above might be appropriate, to mention that this is hardcoded, but new firmware
>> versions will not be. On the other hand, that's obvious. :)
> 
> Well, I guess we'll have to probe what the distribution provides us with and see
> if that's supported and sufficient for the chipset we try to initialize.

Oh, I think we can leave it alone for a moment. We're working hard on a
firmware plan to make things better.


thanks,
-- 
John Hubbard

