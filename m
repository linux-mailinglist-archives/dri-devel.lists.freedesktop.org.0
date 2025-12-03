Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FAC9F0EB
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14E710E7BE;
	Wed,  3 Dec 2025 13:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xZiQbN2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3922110E7B3;
 Wed,  3 Dec 2025 13:05:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/rCt9me0Qn1/7bAwEyZ2zgHcG20tbnjFxEGMs3sRX5HU52qMDO9bupTBk31B/u2a/RWB9AVAYx9LhwXL493TQp2hrdBYDmRySMUAUCYy/HadgYwmIisnA0VknNOBg303WG8nUK2FA34bgzvNKTcelRehWLW9BawCf7YtHdxBcf2sk0O4pL/N9Xjrqp3BElLflrsiR0u3yftCISylD7HxkFH7D6wk9bw1bo2NWG/HHpN3vy1+WmvFipgzw8vkElprq0WIjDWz1Y9A/qFUmmq9FLyBhdnFMeaB4hSTr84+qeupEyxLmy4iCFS72EC/lFTeJ9zqCUfUd/6C+pCOWmqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hi/XTqBV14VcvOh/07yWF9EHue4LZhWsJ36iRMlEM7s=;
 b=DwqTKAquqJ8gLkdF8bOcZi/3texh3SQq8z/lPjjU8L6cxUOxw74OqJc1dJdSOn1IWMO6HWWjNpTBwGGVAy8sS13jfCoiQaNz+BPGZ0vHtvCLZt/86wT+r+hPvZgor5OWTXpDyxsfAlTfyi1MJQNcu+rTpMaNEioKoSYEvyR8vW5xVuyIKoT6B0diXwNI3cPQt8MBBOfK28RnGbcc2m22SHXvubVkkRzxoxkl2Pyv3xP4ALlwVSql2if0tvSdwTr5a61wlPlGnsrMvyCo1bhwxZ8R+zyOEymRhPUhVt9yi01lDbI018256antlFNiuI4z4LtAtu71exbhSesbQJdv7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hi/XTqBV14VcvOh/07yWF9EHue4LZhWsJ36iRMlEM7s=;
 b=xZiQbN2cbyErwNz1bgEXIQSzq7WiMGFtBG+7bPjJwkxYQTTzVUelNliWr55NBAJJQP5EKmGtsFAyL8//DkDR18l2THL75v++/+PDUVWGDgwDcidgm906NsvZ+EUrVggY4jEaehsWXxNfesiyGpCIvQJwrpy6Y9STT4J2XsJ905c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:05:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:05:36 +0000
Message-ID: <bd53e91c-111c-4cc4-b97c-7e03e000540d@amd.com>
Date: Wed, 3 Dec 2025 14:05:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: 990c0010-f804-4fe2-bdce-08de326ca6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUkvR1dPeGN6cE1QWXBwdkFPMWpDNGRPdCtqRlVhUXN3K2VZeXBndmx0Z1Vx?=
 =?utf-8?B?QU1qRUZLcDhuZ0wzWHRpZERiUGtDZXFxdzQ5UHV6RnZ0RW1Db2dqc3ViK1lx?=
 =?utf-8?B?cG1GM0wxbW5uYWpxMS9SY3Jjc2N4Vk5yYy9ON3BxUFpHZzNjL0dGRkExY0dV?=
 =?utf-8?B?Wk9kQzZWTk1NYWtOSUtHRUdHRVdBaHNHMzA5d3kreUkzaXovKzZIYXR0NmZN?=
 =?utf-8?B?ZU85RlNhTkx4YkN3NkszK2Q3YkVISnh0TzNuUFN4UjFOaWdTQloyd1NHTlJt?=
 =?utf-8?B?czhHKzRwaDh1OGZTam93dE9yTzI5SGtySWJiS2Qwd3c2aGM1M0pxVlliRzNG?=
 =?utf-8?B?MVRHOEJHM3I2RVNlN1VPZFUxY25XV1hyV0x6aEttTU94TG5Oc3dOL3JYekNh?=
 =?utf-8?B?ZDZwallDcTgrMzV6ckR4eEhFYUNPSkxpZGZJZ3ZlUkhuRDQzZklTUVRJeVI3?=
 =?utf-8?B?ZTUxVG5HaW9YNm9PVW91bG9LSzA4aVFzeitOTGZsMXBFdHoyekpnd3BwU2lB?=
 =?utf-8?B?TzNaZFB6dUFEUTNMSmZTbDJXeWtoOTdYeVY3WHNXREQyTGNhNXk3TU9mNXVl?=
 =?utf-8?B?aER2VzREY1ZvVmpvcDI2dmt0NlZ2eWpRVUtKeTFHTm5uY0ZvelBocXNZcmc1?=
 =?utf-8?B?TWJ5NlZxK3l3Z0RhU215OUNPMzNOcGMrUjB2QTV6NXZ1SGM5VnRzU1JLQ1FX?=
 =?utf-8?B?MWg5LzRTM3lMYXRlaFlGbjh4Zk9qOHlCbjNwSE9nMVJmRFRDWjM2bW1BMjI3?=
 =?utf-8?B?M2l3Zi9sQTdFandjdEViMW1WckJhWHYvY1d0MmdyclcvRGJlaHlSYkF4bnZP?=
 =?utf-8?B?Wk4rSEdlMHd5MlRUdU5jcXhyMzYxUGwyV3lIeDNIcEUvdjF2endWdk9RUEkr?=
 =?utf-8?B?ZmI5Z3pzZk1zRUZaTWVlQXNxRkxSdVJMdXkwSllLTnU4L094K3RyMk1udzh4?=
 =?utf-8?B?UVdtSnhtd0swemM3NEtJSXR1YkhyMStEbzB6VnN3RERyeDcxcFhWbm1rbzFu?=
 =?utf-8?B?QjVzVmxTNmNMbEl2OXJUTERvQStkNHNIUEZsQS82WHZhWmNzbEhEbytsd3pQ?=
 =?utf-8?B?VEx3MllvZVE1blpjcVhabHZ5M0o4UWNJMDgwcVZGQUhmcXA1T2lMbFYzUXdP?=
 =?utf-8?B?NDFXandIcml2K2lsZHN6R2NXTXVMVStjcTEvK2FoSlpDdmNVOEJ5alJjTFcz?=
 =?utf-8?B?UjJHdncyNmp4RkowMmsrYjdCR1hBZm53L0k0aXc5cWlCYU15YWxyd0QrWTB5?=
 =?utf-8?B?OVk0UzJocVMwaWtLeHAzMTRVdmJaS2dNanYxSm03Y1pPUWVLODRjTnV3ME8z?=
 =?utf-8?B?VnhiNllEZzdmYzhyV1ErUEpvK1Y1QTB4SDV3ZklOVFYwQitYUGRmYVVJR280?=
 =?utf-8?B?VVpNTWtmamtiNlpHYmVRNWJhakdTTzAzbHM4WmxBcjNRWHNVV3BMY0g5bHVH?=
 =?utf-8?B?SkpuVE5aN1plQ25YbW40TEFuMS9GYVhYTU5UdjFWdk1BT1Q5Ri83cjFmTjJz?=
 =?utf-8?B?Z2hIYkZjZ1oyY21mdWNLQmtiTnhqMUQrY1JiSlBQdVA3ZGlWemVqamhOc1BN?=
 =?utf-8?B?blpTcHc4dFdZN1hVeGZPMlpwczd2NUhjeFUyM3JKNXUrRTdHYnpzaFNheTJR?=
 =?utf-8?B?ZEZkOSt2d3gwZHJWd0Z2aHZUSTRCZnlacUVTQm94L2t1N2VoU2RMY2lPVll5?=
 =?utf-8?B?TVJvbVhuSXVZUG9CdCtKWk9xYStlekhBVnQ0em5yL0dRQU9VWmt0eHhJY21O?=
 =?utf-8?B?MU10akFNKzdkWjdVSFZEMzVZQzJtd1dhdENmempST1ZBOUpxbm9LY20wZzdj?=
 =?utf-8?B?SXExL2krek5CL1ZHTWZQcjl4Mmx2TnpNQ2FUL1lCcHhpaFVHK245Rk96bXRW?=
 =?utf-8?B?R0dBNXJYVHN3dlVwMlpEL3MyaXhYOEJQNm1kZmtRWk85WWJlYlNjUGZ2akox?=
 =?utf-8?B?bGRpSE90L1d6TkdvUHlka0xZbmp2SWk1S0Jnd2JXRnZheUZrclR5ZzBvbmYv?=
 =?utf-8?Q?GbCaR2wgIpPsUX9PsetsXdn+85fDTk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHdmdVhmT21lYmtBTXZoeHZSUG1JZVJQQm5zeHpxajlXcGorQlRCQzBwT051?=
 =?utf-8?B?blFseWV4YWNhVmt3Uk8zT2JUTTUvWFBWK1cvQ3MxcHkyNndFRUhvT3BVM2Iy?=
 =?utf-8?B?RnZzQkpXRE40UzdFcHlJdGpWaE53d3pXSlA0K3NqNENsU0wwbU8vVGFzRkYz?=
 =?utf-8?B?RElHR0hSNlNVZkdDR1F3NTJ0OThGNFFzYTNJd3dLaU9KMnFXbTcxMktLYi9x?=
 =?utf-8?B?YVpldHYydG5oSFVZc3JYaXJTWTBERnVoMk4yVXFnaUcrV1ArOGg4Zjg1NFcy?=
 =?utf-8?B?OVZsZ2VEaGxQMEduOWE2Wk9JOWFRMGpGZm9IUTlUemJKK2Y4Q0hCYXhjM01C?=
 =?utf-8?B?bzllNHd2NjRuYldnUmg2dGlkak1hVEM4dkNERXhaM2l2Tm9xR3JvQjlMdkt3?=
 =?utf-8?B?TXVBSVpmc1I4UCtZdTZwNjNKdDE2L2NNcVZ5YTFucVVTZW1IYUM1dVRQTDBU?=
 =?utf-8?B?bzhpby9YUVB1c3M0VnY1L0F1RmYxVU15TEdhYXNqVWkvMWJreU1LSi85cnVP?=
 =?utf-8?B?L2piOU80YktrRDBTRldCcnhBelRCMmFMbzVkWmNkcGRLT3cwL3Uxd2hKZndn?=
 =?utf-8?B?em41WGkzR3FUU0h2NytVVkNiZUdsN1NiKzNWSXpQekNRU1hnZ1NFcUdJS25I?=
 =?utf-8?B?aFo1RkJ4dUFyc1JaNVZvZjhtdWVKaGNUZEk4eUpweVcvdkZ0OVZwZTFIL1JH?=
 =?utf-8?B?Q200WWxHWDdRaFg1K01aTHhJTEJsdUg1SzJBSUxhLzlvald6dHYyVjgxTzRU?=
 =?utf-8?B?blg0c1pYSjhwUnkyaHVvT0tIR0RsOWcvMlkydFk2RVVoN2lwQVRRSmdFeTcr?=
 =?utf-8?B?NDdzVEUwRDlNUnc2Q1R3U09aMlBlQTFtZzBVVXlyam5uZXJMZVZoNy9xU2o0?=
 =?utf-8?B?emhXTEh2Z0NSdmd2d3B4MjZObjUrZGxSdHJWaWJ1Z2szdFNXTHdFYVlKYUJG?=
 =?utf-8?B?azZNKzRZMEpPQWIvNWR2c1NnVktJOHhrOG1IRXkwRTQ1NUdCS3ZRUUhYSU9M?=
 =?utf-8?B?Qmc2YmNwSXg1eStLcW56MzFCR3ZlUnJyeHV2NDU5S3htTmhYQ3QzZ29lbXNw?=
 =?utf-8?B?MCtpUXViUFlqUVp2NXJlRTZpTnZlb1U1K0pmbXorQy9mT0xqNU9MWDdLVHd5?=
 =?utf-8?B?azV1RG1nOWVDVmZQWVJUNUw1RHBtN3hEMTBsZWdOZHVSZUZJZmJ1V3NjS1R1?=
 =?utf-8?B?Q21HUHJDN0hkZU9DL0tVWlZXTXNVYm9Ya3RCY3Q2V1JtU3kzRmJHc2hQOXBk?=
 =?utf-8?B?NVQrY3RQRU9RQm0xNEQvaG0ybDhzMFYyZXhNK080SFJoYk9DaXhNeXBTMXB4?=
 =?utf-8?B?NDFnNFR1ekptZFlpSmxnZzkvQVhzYndNWmpRbldmK1pUdnFINGtFQ2xEM1dl?=
 =?utf-8?B?Z09ERWcyWlR4U3BJOHFXTlplQzV5VlpoaGVaMllCWTlkQkFIUlBEMmN3a0Y5?=
 =?utf-8?B?aVY0K2xySTl0LzdzeUFCa0J6bG9zZmE4aGlJMVArak04a3I3ejVEVXBGODQy?=
 =?utf-8?B?VElUYzd5eHh6cWJqMGFYcmxtb0oyZlB2T1dXT21hWWxnVmpWZFY2Snh4L2JK?=
 =?utf-8?B?VmxseU1kWHFpK0lOdEc0WUxaKytCK0dKSmxxV2dKZ3RzNkdxbGhOWWZwK2pI?=
 =?utf-8?B?OXZGS0xzZFhZUGVjRnJaSk9zUVJHNkM3emhMd1E1akVIQjBjS2d2S25IUFV1?=
 =?utf-8?B?b0FLeTNZdFUrTFJYd3dXZmRQcmZ0eFJoMWRPeUtVZ2c0VGZmZS9lMm9rTjRo?=
 =?utf-8?B?RWdydlNVbkUyaXB3VE5uQ3lnS1VFWkhYV2Z6SzFXekZSbzNiVFluNjkyaWNR?=
 =?utf-8?B?Vjk3Y2tVdWx6b3A3UUFxZ0NxTk9obG9DbDRJak1nYURreGVTVStGRXNmUVhB?=
 =?utf-8?B?RXlyYmFUUkY5cGdCeHB5NENFN3FWNDFMeXlXeTRLOWZadHp6aFV1ZDhoSHhK?=
 =?utf-8?B?NkJWeDZPeldpWVNZVmlMQ3RNQ0tLL0hqM2tBSEc1TTlPaHJid2FqQ2piTVRa?=
 =?utf-8?B?NEVsQ2FNbTJpdWZodGRHUFpkM0xVTXM4VEhkTENaQXVOeUlqcHJnOEYrRnkv?=
 =?utf-8?B?Q29oUXhiMGt6NmNxRWkzZWt4Tys5a0NOTHdseXdKV3lHRDM2ZWtoNVROajdZ?=
 =?utf-8?Q?qxaruquIUHKIpW+WONMqAvUMb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990c0010-f804-4fe2-bdce-08de326ca6a4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:05:36.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9DpPVVGcgEbqXKH6oHma0W+dcF43HahcMPb5UR4bZ8CYswVsrYnnxWgH6gce1Nl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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

On 12/1/25 11:50, Philipp Stanner wrote:
> The overwhelming majority of users of dma_fence signaling functions
> don't care about whether the fence had already been signaled by someone
> else. Therefore, the return code shall be removed from those functions.
> 
> For the few users who rely on the check, a new, specialized function
> shall be provided.
> 
> Add dma_fence_check_and_signal(), which signals a fence if it had not
> yet been signaled, and informs the user about that.
> 
> Add a counter part, dma_fence_check_and_signal_locked(), which doesn't
> take the spinlock.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

As discussed let's stick with this version for now, it's technical correct and all cleanups can come later as general coding style changes.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c | 44 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma-fence.h   |  2 ++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 96d72ffc0750..146de62887cf 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -445,6 +445,50 @@ int dma_fence_signal_locked(struct dma_fence *fence)
>  }
>  EXPORT_SYMBOL(dma_fence_signal_locked);
>  
> +/**
> + * dma_fence_check_and_signal_locked - signal the fence if it's not yet signaled
> + * @fence: the fence to check and signal
> + *
> + * Checks whether a fence was signaled and signals it if it was not yet signaled.
> + *
> + * Unlike dma_fence_check_and_signal(), this function must be called with
> + * &struct dma_fence.lock being held.
> + *
> + * Return: true if fence has been signaled already, false otherwise.
> + */
> +bool dma_fence_check_and_signal_locked(struct dma_fence *fence)
> +{
> +	bool ret;
> +
> +	ret = dma_fence_test_signaled_flag(fence);
> +	dma_fence_signal_locked(fence);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(dma_fence_check_and_signal_locked);
> +
> +/**
> + * dma_fence_check_and_signal - signal the fence if it's not yet signaled
> + * @fence: the fence to check and signal
> + *
> + * Checks whether a fence was signaled and signals it if it was not yet signaled.
> + * All this is done in a race-free manner.
> + *
> + * Return: true if fence has been signaled already, false otherwise.
> + */
> +bool dma_fence_check_and_signal(struct dma_fence *fence)
> +{
> +	unsigned long flags;
> +	bool ret;
> +
> +	spin_lock_irqsave(fence->lock, flags);
> +	ret = dma_fence_check_and_signal_locked(fence);
> +	spin_unlock_irqrestore(fence->lock, flags);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(dma_fence_check_and_signal);
> +
>  /**
>   * dma_fence_signal - signal completion of a fence
>   * @fence: the fence to signal
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 19972f5d176f..0504afe52c2a 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -365,6 +365,8 @@ static inline void __dma_fence_might_wait(void) {}
>  #endif
>  
>  int dma_fence_signal(struct dma_fence *fence);
> +bool dma_fence_check_and_signal(struct dma_fence *fence);
> +bool dma_fence_check_and_signal_locked(struct dma_fence *fence);
>  int dma_fence_signal_locked(struct dma_fence *fence);
>  int dma_fence_signal_timestamp(struct dma_fence *fence, ktime_t timestamp);
>  int dma_fence_signal_timestamp_locked(struct dma_fence *fence,

