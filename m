Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCEC9F181
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7F810E7D4;
	Wed,  3 Dec 2025 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RP11vFtA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011008.outbound.protection.outlook.com [40.107.208.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3300F10E7CF;
 Wed,  3 Dec 2025 13:15:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxUh6x+mBjFHjNhrxvX764LOyDyg4C3Z63cLWnQLz1+rDGvzpGerN21xsLlo58oAQ0VosSg8LdP+jreHU99VznnnL/jFxTNDoS+KuYdTYQvOw58Y/uuuECBvjIa8v2QDL5HSVHfUldLLDEaSnm5Bf9cQgJeB05bNczUChetqqNdPgtn/CHBlUE4r+844KhOt1+4dkbKteaIxI0QyT9rTyaxVq4iro6bjLP5rQt255Q5iMUI/z/i1cLZNf35R+hLl5zKbHRZK5oj9XKYk8L6I/ozSXoq+yVamd79nVU+hoJoLcRPw8x1T7sIPDqJfhL3PjzRGMrorGNT0cgxMdbHe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCZhMYfcvyGuIaFbRrt8GUJwulHsd2VezmNZsQ8haTU=;
 b=GMs9GeHlXggL2Otuz9oc36aZdZFKgjXZ7nR5Y9vnpZq5UEg3/i045bt/yNPbBVsFYx8r4qfrcBjWtWsxaR+PDNaX6GTl4eXNQdfq48J08nLT6G89RGtMcmGxB15Wx2Xm8LIgr/OQqP5p81m+OVGD9Y/L0Cw70fVPGLNmLdjWCbECZNQ4rgVSsYJN8rprh/eUx2E9N8esIz0lmIa6uz4ZN1CB2qjmmdXwa2f6Ys1AuiufqbVf36sfYxpPYcH5ReAhuMF/tN7p8LodAxz/iij+mgiZxUI86aV02efqqbVMhhA/IGAp/sDVRUjSFm6MAnMCcLp3WwIwB77lNP6/t0kr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCZhMYfcvyGuIaFbRrt8GUJwulHsd2VezmNZsQ8haTU=;
 b=RP11vFtARTJQmUpsu5EBvaby3pUA3uZGkW9ikZQY5JtU/fsvMDR8tO38GOSOz9JPbB+C7u/3vx8rZXI/VYSs9yWytKEXjEprNIHgv9xldPD8yNHqAr5cdDeQL2akDLBbSQKJWV2wiNr0P0AxSAZvkUZLiM6Kjbo1GfO1xEzm4Q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB4479.namprd12.prod.outlook.com (2603:10b6:806:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:15:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:15:15 +0000
Message-ID: <e67b12d1-111f-484a-8374-4152d3b9f328@amd.com>
Date: Wed, 3 Dec 2025 14:15:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
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
 <20251201105011.19386-10-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-10-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB4479:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7689f1-77f7-4b72-7e72-08de326dffaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2htS0pDV0JXelZVSkJ0YWMrOUFRd0orSTg5KzhzR0ptcnB2cnVIL0dBbkJ4?=
 =?utf-8?B?R0h6Qko5eUsyRTVySFI1TkRQS1VMa1ppL3pUNUEvQ0JWWTVDMU9DaE9wK1RE?=
 =?utf-8?B?MFQwRUVLenRXTXh4RVloT2NnT0NuWlFzNWkrcktjQ2ZXQjM2bFV1Ly8zZngy?=
 =?utf-8?B?b0tTeCtMamI1MzhrMXkySVp5bmZ0Q0U3WWM5SzdaUDU0bXhTWHZkTnJoZWF0?=
 =?utf-8?B?UDhPRWFWNVUxVU5OMW1HZ0FNQVFmeDF2VDFQdERaeHhHTXZLS3FpZVVwRFZ4?=
 =?utf-8?B?L0o4N2pWbktxcEFrL3UvdCtybUgxRlNiK2pJZDA1VEFiMEVUUTJQWjRicHpR?=
 =?utf-8?B?UjRsSWcySWRHOGVONmpOMGw3allTMEk4ZFIyNW9HWXNaRTBTMXhMbDArMFFO?=
 =?utf-8?B?QktQN2dyYzZZMEEreUVLVngyayt0MGc5YlJnam5HL09zWTVVWC9GUEF3KytM?=
 =?utf-8?B?M1FjTjVyb2s3endoejFRWmk2UHlPMHpBRWN4QlVhVUNUcmd4MmxXaStCR1BE?=
 =?utf-8?B?Q1hxalVIZWZoU0g1eDVJYy84Rnp3ekFpcW80ajNJVzRlb1hyK2FaNDFUcjRw?=
 =?utf-8?B?anhRSkVMMW5qM0dBUElRRy9CRCtYYzNlaUpuc3JVQzA1bzBYblRIbm1uelRV?=
 =?utf-8?B?R24wTDJXRHp1ZGVMdHNCS0IyelBIczhhMmVKa3U1bVNzaEFvTkR1NS9zZmU0?=
 =?utf-8?B?R2VDWWZWbmYydjBIYlFhYnhmM3hnV0lLWk9sOXdDVmhIb2tNTHdqazRpM2xi?=
 =?utf-8?B?RHNZdnlkOXdBeHB6SnMxWTgycDNBV2Jzaml2ZzNiSTl4NlBlcWtIT253VmRS?=
 =?utf-8?B?bDVlYnppVnhhM1gxSDZsUi90clhpM0Q1ODFHL01RSEFFYWNNdkJNV0orRmQ3?=
 =?utf-8?B?b3pJTVlKZlJKZVozbVJIMnNHY1pTZkc4a0o3NzdjZFVSRlcwNmJ3ZlhOYW5G?=
 =?utf-8?B?TjVFVlNIQWY4engzNk83R1pQUytZL3dNNGxnVG5BQUE0QlFjMEdLbEg2Ni9T?=
 =?utf-8?B?dytTZFduZWxlS05oU0hjYk5hWVFVUVlKMlhQa0tPdTBjajlBMnpzSExwaFB0?=
 =?utf-8?B?U1pwTnRTV05xSzdVZ3QzTVdGRzcwcnc0bm9SMXBmY1Zlb0pNRjdvMytiVVRa?=
 =?utf-8?B?RVdVMHBmMWE1TDVpeTJPWlpVWFhsMTVtNUxYT2NHbkJnNG5pcmxKUFlHczFp?=
 =?utf-8?B?QU9HUmQ3MTAvVDgwVXFxYlZnSTdpK2ZCWDJBUFJDZEtPY2lLaThXN3ByY29t?=
 =?utf-8?B?Y2RMbnUxVTdZTnZRckpPRUZIbHRwcTJiWUFjSG9jWjFHRllnYkk2QUI2bmtU?=
 =?utf-8?B?VEhLc3NmNUkvMTlSUkVUS2JmYm4vV3puZCtRVnB5cWtMS2NwUTdRV0hGaTlQ?=
 =?utf-8?B?TDJhR0owQk9wSmQwenNmSG5IeUVoTTR6elpuakZsRDd0ZmtXS2lYREQrbUZx?=
 =?utf-8?B?aVZMQmlLSnlYdFBmK3hmUmphbWZXejlJUE5KM0x1a2RoS09HMytwNTFXMGJw?=
 =?utf-8?B?anoyOXJrZ29XaCtvRytSaWJhSGdpRE1iekxVZ0FtWTBMSG9YRXUzTVphdUVl?=
 =?utf-8?B?blpHMGtmN3N2N1I3REpDM3hqNHJtSjRGWm56UVFlblEwcFRLenhTbTlhem90?=
 =?utf-8?B?OVhoWFhBeDA1dWtKQ2F5TTFRZUUrcFVYVDJRdzRabnBvbDJuTVg0aElqNHNG?=
 =?utf-8?B?N0xPZGdEcDA0cG51U0dUdXB5TXBqeldmMXVUQ2h1amRVbS9Pa2JhNzRwMnZ0?=
 =?utf-8?B?bGtYbUI3TFZsV3IwNjNjcUllbkhQck9ncWk1YWJaMW9hd0pBZWcvUVVIdjAw?=
 =?utf-8?B?MG5jVEpzYjcvYXdhcjZ1bXZpUmlnelRuUFB1ZFlDS1BXRVA2NE5qSVhselE1?=
 =?utf-8?B?Qm9HNlE4NUprR0k2dkFWNzVmZldzM0ZCa3EvZzNDMjdNN3paSHg4enpxcm5M?=
 =?utf-8?B?Y243UVZqQW1rbE14NXVuZllXNERZTFNRTW01NVh0RVk4cWVNa2pzQk8ydHg0?=
 =?utf-8?Q?UkU6KWnjOclyGt5lGNzxD6fEX7yX2U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2ZKb1Y2cU90a3ZnWW1vK1A0eGp5bW9qMTdZdGlaVExMblhVeHAzQzdwSUpB?=
 =?utf-8?B?VCt2MFhDUmxWSVFQT29rcGF5dkVwWHQ5R0lHejNWMjdld0xLZTZHWHRCalh4?=
 =?utf-8?B?QkZwNTJERi9zRnFvdW1UNnF2a3F2TnQ4UE8wZ0Q2TDMyaTRaWHBKblhSakFx?=
 =?utf-8?B?OXgrMVNYaGdoVFk2RmtDMTZaYlJkK1BGSmpBV3BMclVaOERXVXEzL2ZsY1Ax?=
 =?utf-8?B?SG1jSXpXdEpYYkJvb2JjQk9QeHFOWHByalFJSU40elZTaW9wUEtoMUVUZWtn?=
 =?utf-8?B?Ny9UdlBCdjdwY1gzUFpXMzYyMm5XR3ZVZDdUSnlBYTFvVC94cG84ZGlvdGd3?=
 =?utf-8?B?a05VNFlvOHRrWlBFQXJ0eWRlWlI2UDhwQnZDaW9YNU1SMnhsb1FGcmNCcW5a?=
 =?utf-8?B?UWJzUW9pOVdEMmh2WWlsNUNkTUVXQXJvcXY5OUt3dExlZkZoeXphNnI5TWpn?=
 =?utf-8?B?d0h1NmJNcnY5RmxENnJjTkFBVEJGWHNQdFJBMjhndWhqb1Y5NWk0SXM4ZGFV?=
 =?utf-8?B?aUs4YWVpUjl6UUs0RHUvMVZZemw2NkxneDViN2NCU2dKYXpEMmNPOEc5ckRZ?=
 =?utf-8?B?NlV0YUNMMnFFYTMxb0NSL0RaL2Y5RkRTWTJGQTBGeE0zMnFPZHZrT1RqMXJN?=
 =?utf-8?B?aHdXU2JiYmVWTy93ZDZoTllreVNVM3R1Rnl6R0dTTFVKU1B4SVppZlBnZXVo?=
 =?utf-8?B?cURyMnRrbk92Qk1OdzRoSEdYeGd0VzFVaDdONUtwYk13dTUxVDFFQTdJUWRp?=
 =?utf-8?B?TGFkOVF0bVkvMkNoOXZzcmlFSEZMaVlMT1ZMR21FOGNsbW1LcXU3dUtiTGFl?=
 =?utf-8?B?Rjl4NW5qVk1LSDdaaHFBWWlnT203clozdmNGUWFYN3dWeFNBdDhZS3lIRzNw?=
 =?utf-8?B?Q0xJRmJPZWFtQXNuekl3aGxrYmxvbXpVVy9BQ2ViTUU5d3VrOVRnbWFtRW52?=
 =?utf-8?B?YllJd0FMOEo3Nm5tL0pnV3JKRStkM1l3NjJyNFFKODF6Y08zRnRWLzh0Nldi?=
 =?utf-8?B?Ymt3S09LeFdkUkpFcytUL3VLeG9aeTBhajhlcEZSSWVTS0lNdUhKbG1SZnlD?=
 =?utf-8?B?Z1BsSzczUjE3a3ZtU0E2czlUVkNHNmNGN0lrMzVjSHgzUHV4RmFXRWh5SGdk?=
 =?utf-8?B?UGlDd1pYRWFmblZtN0tqQmVSVU5DNVRBNEZkZEtVK1lPVnQ0S25qeEZkNllz?=
 =?utf-8?B?VEFaRzhGYnViNHBzTFRKMmtZRHZaamRYMkZxMi9ybmtTUWNLK3FEMW9UdlBn?=
 =?utf-8?B?U3NYbXg3eEI4U2ZPUUI2QVlsUkpsSlhXaFFuU1lYVXR2OFlCK0FLdEM3ZmRp?=
 =?utf-8?B?TE40RlRkaWFjNEhkTzNuWVR4QzRFaXVrYysyYk5IKzd3eTZZVnBidzhHb1lp?=
 =?utf-8?B?aXovQjhWN1RJUHN3WGNnRVFYRk50YVo1a0hsNy82YXZlSlJJdTR0SVpaSm04?=
 =?utf-8?B?MjFoazY1Y1k5RHBvUk1PalNYWWNJYjFZcDF4SDhwdXlrVm05bG1zY3ErQ0Va?=
 =?utf-8?B?WC93V2NTYmU5cEN1Rk1QZEw2SFZvanpNMTRtMVhzYmpYdVdoOFJNSzFpc2ZK?=
 =?utf-8?B?Ky9hZGlIOU9FUnprMTlCajM5VmF2Qk1KRWQwZE9Md0p3TTl3WGlhYUJRNERh?=
 =?utf-8?B?SEo4MkZwT2g4LzR4YXBqdGQvUEh2cVN5VTJuazBQcVdVY0w2Y3lFeG1VN21o?=
 =?utf-8?B?d05vK3JPSWZwbDFEZFNFdjZhaGxXdGtndFJ5bDBKcFh4ZTg1bWVraHlpWlA0?=
 =?utf-8?B?VHdsODlEMmJpejRZN1BjUmJiMTRmamNIUmUwK0ViRDdyWDQ2NDJRZitrN2J0?=
 =?utf-8?B?T3BYUkhRZzVOMUIxcFl3bjZTS0s4R1d0QmRrSjVYV0JVd3JGaFhuU0lKS21o?=
 =?utf-8?B?QlVhRXZBekhMNDJZQUlnNytOY2E5cnRWcUhnZHhLdktOdUo1cTlGQjNiZVo1?=
 =?utf-8?B?VGg4YWV4L1V4bFBLd2FZdjBVZU1iZUkxK3cwZUVZOFJHVWhReXFaZ1NNcE1m?=
 =?utf-8?B?c2RKckdReGhUMDA1NXhRc1NGdWdnU1U2NC9UdC9HTHQ1TG1VaDE3aEpMQUVX?=
 =?utf-8?B?dHhpWDQ0UjNLemdQc3ZtVjcxRkJTcndoVFV0RGRkZ2V6d0JjSGFPU0xKK3k3?=
 =?utf-8?Q?h9Kg9EDjaU1EgSZ7rFMlbyC2m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7689f1-77f7-4b72-7e72-08de326dffaf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:15:15.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08ce0fRk9T9YNgB2HvEqtVsBal41Kkfs+uD4KeSr0f6uxvHLcUCw5kdICbeAq8H3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4479
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
> There is a new dma_fence helper which simplifies testing for a fence's
> signaled_flag. Use it in xe.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
>  drivers/gpu/drm/xe/xe_pt.c         | 3 +--
>  drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
>  3 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index cb5f204c08ed..06736f52fbaa 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>  
>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
>  
> -	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>  		xe_exec_queue_last_fence_put(q, vm);
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
>  
>  	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
>  
> -	if (q->last_fence &&
> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>  		xe_exec_queue_last_fence_put_unlocked(q);
>  
>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
> @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>  
>  	fence = xe_exec_queue_last_fence_get(q, vm);
>  	if (fence) {
> -		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
> -			0 : -ETIME;
> +		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
>  		dma_fence_put(fence);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 07f96bda638a..1ca2dec18e51 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
>  	for (i = 0; i < num_syncs; i++) {
>  		struct dma_fence *fence = syncs[i].fence;
>  
> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				       &fence->flags))
> +		if (fence && !dma_fence_test_signaled_flag(fence))
>  			return false;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
> index d21bf8f26964..1c9ba49a325b 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job.c
> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
>  	bool signaled;
>  
>  	spin_lock_irqsave(fence->lock, irq_flags);
> -	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +	signaled = dma_fence_test_signaled_flag(fence);
>  	if (!signaled)
>  		dma_fence_set_error(fence, error);
>  	spin_unlock_irqrestore(fence->lock, irq_flags);

