Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC48C9F6DD
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 16:24:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536A210E85E;
	Wed,  3 Dec 2025 15:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Uwkh6FsV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296A810E7FC;
 Wed,  3 Dec 2025 15:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndm1PYWOO2kz8GqdxKggNNTvO8VtWtX72+/gS1IHTgnpY9dafxST9m822OzGbPqiUKh6Xc+m2mNuYwwGk9E+6O++P8Gv03txmbLMOwZ/NXvjBmn4ns2A0gUklfQrnVg9fNN+tDFcBpTNEr9yxoDbWtE509z6/aNv/eOuayxZ78fb6GRwGJG7qHxsXfKsp7Es0z/wCET6CXjbuUpTUnmQmQC8j6o2VSklHjH7kU5azqU7xuICg9lDoSIdveAH3Kh+I8bLe/hAkxcgDCbzu53AACpCXAzvMSIuDZrfof1Gsbh9ywLU5BGgSuU9vkaYNJG4XEaTcOAjWMYn4+fZNBtVQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yI9OZYjoqbOiOmzHhXXYlNyEpbI4/HzDGRdWcdk2m2o=;
 b=X4H8FTHonFOMiAurLwsG4SVSYOLpBJk+LzYau3TyHTAU4+UCFwrWR2vB3h4PaFs3lB9LzKvg22NN86xgNZrZAAyFwGDVNNJoC9uwB5YKKZXqVuhobb3cycoTUbzb0JxLxey3hs+pPxLeKqzRHolkyTFJEy+IdWXhlUb8hlvxvelNgje5YPyYxz9Nl5dxnWVd622DXvGGX9uiIOFCzoInm2PujL4JgIqBqUX0leXOZ1ioMi7OO54kozMFZ228kYfqe5KOwhNT4Y/UY/ljjJqp4JOgO9KL5SlKQQpzEezsiYeuM7MuNNcCNKKGKCWtECSaBetwLC1eLbAf6+n+6VLxSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yI9OZYjoqbOiOmzHhXXYlNyEpbI4/HzDGRdWcdk2m2o=;
 b=Uwkh6FsV+ZXzk8hocz1z/X/kgCXU37ItAAVjCBjs8LvcuqrJAZYVbLHnaKhLfLZ0Fc7oMnbyKeeoMbv2quznUdMzozwvL8yMe6BTXRWK6n/ynwGk7MRx9srlcgJMo+2Ch/WbfHCCZZrjdNIjTn5fdXzurSNj6K+jNP2l/U+tvWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7292.namprd12.prod.outlook.com (2603:10b6:930:53::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 15:24:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 15:24:37 +0000
Message-ID: <d7b6efe8-5343-45a7-b16e-441da15145cd@amd.com>
Date: Wed, 3 Dec 2025 16:24:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
To: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
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
 <e67b12d1-111f-484a-8374-4152d3b9f328@amd.com>
 <a4655788feddd883f70aa374e4315cfaee59a88c.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <a4655788feddd883f70aa374e4315cfaee59a88c.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0614.namprd03.prod.outlook.com
 (2603:10b6:408:106::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: d8098eb5-c4fb-4547-3739-08de32801207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDVCS0I1N21HNHpJWW9tSkdEVlhRM200ektycUhkWFBmbnJYakJUbWJxUHpO?=
 =?utf-8?B?TkFCOWM5N2hZN0xHSGQ3SHNFM2t4Zmhwd1NuNmMrSDAzOExxWDBBcWhwdEJP?=
 =?utf-8?B?VmFKOFRIRmtwY1RtRk1hZjhIOHpRS0owUk1BNldVaHMxSE5md2pkRHVnOWFO?=
 =?utf-8?B?cnFFOGlyUU5FK29SMnhWenUvWlZ5aDBvYTk2S2ZEVDh1S1B4SkF2Y0ErOTNh?=
 =?utf-8?B?TFVHYkcvOG5wS2p2aXlGdFl3T2hLTVJSL3pJT2k2YWxaazZwRU54UWtDbjh3?=
 =?utf-8?B?aGJTQUtyM09JN25BNy9TNTZRSkhHb1hDMzdRcis1TFo1MngxZnkxd0F6M0Jn?=
 =?utf-8?B?VEtROGVTVGJ5aC9kRURMckZXamlYUkU1ZjdZWTFYS1lCZ25BQit3SEhLV0ow?=
 =?utf-8?B?QWlmczNsNGZ4cEFEVVpQYmdRdWUrWFdVSjViTHdobHcraW81LzZNak9aRjZo?=
 =?utf-8?B?b0tnQXJPYVFEMjAwbERyb2pvTndsM0VkU2NLQ1VJRWVzVHRSdS9WcE85UnNI?=
 =?utf-8?B?YVRkMnlseVExVG9iOS9pOGUyS3AyZFlNMkV4ZXhzc25uLzFSN2s2MUw4NVVU?=
 =?utf-8?B?NWU2N1Nkc3p5eEFMRFN4K29JN2pKSU43MEZuNldYWXJMcG8wMm9qQnVIYVp5?=
 =?utf-8?B?RGdvK1V4dzlBZlo5OWVud2hkYk9qT3o3dktiOWNHNm9HM2V1TTBOall2eUJV?=
 =?utf-8?B?aWlwcVc2ZVVNRFlkYko1SEYwaUwrelAwdkJuV2N4QVJjZTZpWk1YdWtLRXhI?=
 =?utf-8?B?SU5lZ2RFdTBGRDhZRjRLK04rb0RmTEN6T2E0di9acjNseW91VGJWUlRpVjcz?=
 =?utf-8?B?cEg2NWtaZCt0bFNsSVZmYXZiUlRtNjBZM0hUVDFrdWlpdkxiUVAxdUVTQVBr?=
 =?utf-8?B?cEVtNTFrWTdSL3JkOFAvSzNRejU2SHlpeFhRbzZxM05WeWR2VU1ObW16SGdz?=
 =?utf-8?B?QTJSeTcyNjJaM1BJVUdQOHlhQ2NuSE04S05MbVNyc2FsSnIyS0pWQWVNSWNN?=
 =?utf-8?B?L2s5TEduUExIVk54U3lCcEdwaCtDdWFYbmU4VXQ4cWNCbEw1djdKYkpQY3Q5?=
 =?utf-8?B?czd0ei9DbHA0WkV0bmoraXh0cjc4SHlnUTJ3ajJjaE1sWXVvTXpnRUhYR05l?=
 =?utf-8?B?a3gxVGZLdW5EV1JsWjhWTlZ5cWNHNmh2MGtsZEpQWXpKaTE1S2tIdDh0ZUtU?=
 =?utf-8?B?bTdEcTd6YnhzT1oraUgxdU1aeUZGa0JkeGlLTkxhbWgxSmliM1AyZlBTYVha?=
 =?utf-8?B?UkZaOStWalBLaGx3V0YvRkc4bVBMMnlyVEdsTVc2OGxhYjlsQjZDdTZOSDdw?=
 =?utf-8?B?dGhxV0JHRlp5SUJkYlQyUUlDWG1SZldYTWc1eDRlVGZJWlhKMGlKbVpiTk9s?=
 =?utf-8?B?THg2TGN4TDlDRkZyMUpTcFc3WlY3Nno4TFpwdHRicjA3aU5tL1VkTjJoeEtV?=
 =?utf-8?B?dVNRUXNFNitsekZ2ZFdhQjRVak5jazRrc0ZUTkxaTEVWM2RmT2FDVWxjL2Yx?=
 =?utf-8?B?U09QZ2doRFUvelFSRnR0Nk5ycnJMOEI1dEU4dkg2emRTM3Z0OStDT0RKa05l?=
 =?utf-8?B?Q0FoeE9QWTdTcFdOQW9xWU11N2NZak5icmVwdUlXQnpvN0VMd1BzdDZ5eGpj?=
 =?utf-8?B?QWs4dnI2UUNmTFhqb000ZTZVVVVhUS9wZHhlR0tEY2JIWGNWa2NrL2k5aEdH?=
 =?utf-8?B?TFZ4OW1ZVGZhdGJnR3MrbC85b1FWcU5CTkhuc3h4RURCUVZnMngwUVA4aFh3?=
 =?utf-8?B?WWgyaGgxRWRMTEJ3YklJd2IzVDhzL2NkMTY1R1Q4WFNqY0lodDJpcnFxREZl?=
 =?utf-8?B?M0pxNU1YNFBleEd6M1NMQWNGZDBiNEx4dlA1R0YvR0F2UzVRcVcyNmtjMEc4?=
 =?utf-8?B?VWM2STEwSjZ1b1k4YXJsQStLSmRENzhGRDJPSkFiMGJSSzBiT3ozaVN6aUJx?=
 =?utf-8?B?U0xRc1M1NXNLNVM5a3dHR1BJL0gzTGNscmZuWVhvc2R4MTdSeTRnN0dvczN5?=
 =?utf-8?Q?uBKdCSUI/Ob++//osnKLMTdCJeNqJk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3dSeDJEKzlQc3Z5TnRRQ25DVUZ0aWtweTYrUEgzd29BRXI4YjVvVzNBeS8w?=
 =?utf-8?B?UU1LbGNrVm52Z1lZazIvN0plVHQ4dWF6NDNoalgyRVFlc3dodW9iUjlHZ3Jt?=
 =?utf-8?B?cjZxUUhHaDVrN1F6U2FiYUM0ZVZkSExreDZLTXFIOVNpaWx0Z2J2TFMzK0g0?=
 =?utf-8?B?dHFzM2ZZd1Z0b2xGRU9NTll1M1ZPcFFEbFlhdnJSSTNuSEthbFltQWlhNXoz?=
 =?utf-8?B?TWFMSEs4bXNNcHYycmFnS3R1NUR4T0phR2I3L2NXeGZ0QUJGdkZDVC9ZYXhx?=
 =?utf-8?B?RWJTWWpCbW5TWktOMnk1RThFWE5HTFNGTHpHZXQrK2c0dTN1bzVpQjM1d0xz?=
 =?utf-8?B?SHpmck1DWmp3TnJET2IyQmdmOUNBWGZwbHZpRkF6QnlINEY5eC8yajh5UUhH?=
 =?utf-8?B?ODBkYzdEQ0tnb244cVBlSmRreDE1T3A3Y1pXd3BwSGhZVEtFQjczcHdweW5a?=
 =?utf-8?B?WE16VDF2S3NTWThkTy9HU0NqNm1zdjlSSGhlUXVySk9xVHNZaFBSOThSWmVW?=
 =?utf-8?B?MGN4bW5CUncrMnpkOWEweTR0dG0rcWNiZVNLZ1k1L3pweThMMGxMN3dXZ0w4?=
 =?utf-8?B?SkduSFRYSncvMG9XcHBjckZ6K2s2RUgydFB4cTRWaEZWQTV2VDR1R0grbWhi?=
 =?utf-8?B?NlVNMTJyelQrQUJpTEhxbUhibWtENnRnRm1VbGhQN2E3c2RZVFBMNnU2cXpt?=
 =?utf-8?B?bGtZZzJXMGhZWGJoZUNWRnR4d3FXNFJGNGVJbVViQ3p2N2dWQ3M3YUpIcmZ1?=
 =?utf-8?B?aU4yK0dFTmFZM3lnYXArcFh0OXRlajdMMXV5bEdwWXo5Z0xZODdJN2VKWFJU?=
 =?utf-8?B?VVBwdFJ4a0ZNN0N4ODU1SXpFaFhhK3dYUHNYK0F5d2NtRTl2UVdHcGlXcUE1?=
 =?utf-8?B?dmwyVFc3TWJWUlAxdWQ1bERpUVlUVGhPWldoRUxueG84dGlPOVR0cnZJbEE0?=
 =?utf-8?B?dnUzNm9BR1h3V3JGQ1hHYXFtRSs4bmxaVGt6cnkxNStMaDlHbFkxbGxDbzEv?=
 =?utf-8?B?Y0FVUVRLalphaWFTMzBsaE03YWovc29wSFZSWUwzMlBrdHdLUDVZSjNGN0N6?=
 =?utf-8?B?a2J0RDlvK0hlOHg0WHNLcG13OVEwUGVuTU9MbHFtTzgxdUNITnNaTUxLQVFa?=
 =?utf-8?B?WjZXa3FIcFdkVVBaU2dYeW5BREpVYjJJcWlaTVFEOS9TR1RWVHNkL0ttOVV3?=
 =?utf-8?B?VDNjeEtOQVd0M24wTGI0anExbnZiMk1BOVFCU3FOekY4RWhKeUZQZ3owMVh0?=
 =?utf-8?B?Z3lJYTRoLzRNU2NhTlFnWWtZNGZSbVY3VncwNzEvaDlTaUwwNUIrdzFuN25J?=
 =?utf-8?B?VG9td0NvRVpYQWZrQ3V4dWw4Z3dIYXBXNnRmbXZhcndhKzl3ckxPeHB1ZDJG?=
 =?utf-8?B?M3kvR3ZMT1dKMjUwbk9xQXM4YnUvZTFYQ3VkaWVUWkFsZW9MOGNXM0cwVWRV?=
 =?utf-8?B?MjRWMU1rMVYyUGlubWFBOC9PTzU4b1RPUlZLVU1uTGtoVmRRKzJVb1RRVGh3?=
 =?utf-8?B?RGpUMHROREQ0cU1JR0Mra3ZUUjhNWjFTS3BxcUd3bGV1VDgvNGtnY0l4K3l0?=
 =?utf-8?B?d2JwaHpIV1lNMFZrRk1KY2R0Ui9mQTFWVnNWSEdzelVkcW5PTFp6TjBrVlEx?=
 =?utf-8?B?SDdscFpPZVV5ekEra25xbXhFMEZhM1pLT1RmNE9WTERZVXVNSGRQNG5MZjNp?=
 =?utf-8?B?V0t0VGxvVEZMZFdnV1poTHU2cUxRa1ZoVFhRRHQyV1poMlVtRHBWNDBCcUEy?=
 =?utf-8?B?QVNZYVM0eGNZV2FMdDdkdytacTBMeTBYY3FYbGZEM3VkUWVtRU1ZQmRtN0dv?=
 =?utf-8?B?N3dYVzlyb213YjBhbHg4ZHJ6b0I1S2JmUmhBNnM1bG5ycEpDUTUvYmpUenE4?=
 =?utf-8?B?QmV4NWR3YXdIOFdkOGRQWGlvdDFnNGFoYkthZFdUYllLUVBZZnA2aGpQaUZv?=
 =?utf-8?B?U0pRTHh1Q2pQNXpLL2EyRlZxVHl2ZkdYQ3M3Q0tjSlB4MktTNkJKVk95YkVH?=
 =?utf-8?B?dFRDY2taL2VBZ1dPcExyTkhqUk1ZU1QxaVRHZWZWS2dLdHdUZDR2ekR3bmdo?=
 =?utf-8?B?TE9vQ3plenVuWms3NDZRR3FoMmgxRXppd3J2ZDFsRmhleUIvS21saHJoQks2?=
 =?utf-8?Q?bY9xem6HRn/PMeZEU+2xnUq2/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8098eb5-c4fb-4547-3739-08de32801207
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:24:37.5072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z9/gt0jRGRzOSUZ5hoUnaygxQSngcmVfjmZOWNcyhWPmtVKZ4dhh4//GWzW8vmNO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7292
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

On 12/3/25 16:18, Philipp Stanner wrote:
> On Wed, 2025-12-03 at 14:15 +0100, Christian König wrote:
>> On 12/1/25 11:50, Philipp Stanner wrote:
>>> There is a new dma_fence helper which simplifies testing for a fence's
>>> signaled_flag. Use it in xe.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>
>> Acked-by: Christian König <christian.koenig@amd.com>
> 
> This series would then be completely reviewed, it seems. So one could
> push it. Question is just who and where, and what to do about the merge
> conflict with intel.

I think as long as it isn't a major merge conflict push it to drm-misc-next and make sure that drm-tip had the correct conflict resolution.

> Matthew?

Should have the last word on this when it's an XE merge conflict.

Christian.

> 
> 
> P.
> 
>>
>>> ---
>>>  drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
>>>  drivers/gpu/drm/xe/xe_pt.c         | 3 +--
>>>  drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
>>>  3 files changed, 5 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index cb5f204c08ed..06736f52fbaa 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
>>>  
>>>  	xe_exec_queue_last_fence_lockdep_assert(q, vm);
>>>  
>>> -	if (q->last_fence &&
>>> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
>>> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>>>  		xe_exec_queue_last_fence_put(q, vm);
>>>  
>>>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
>>> @@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
>>>  
>>>  	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
>>>  
>>> -	if (q->last_fence &&
>>> -	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
>>> +	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
>>>  		xe_exec_queue_last_fence_put_unlocked(q);
>>>  
>>>  	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
>>> @@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
>>>  
>>>  	fence = xe_exec_queue_last_fence_get(q, vm);
>>>  	if (fence) {
>>> -		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
>>> -			0 : -ETIME;
>>> +		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
>>>  		dma_fence_put(fence);
>>>  	}
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>>> index 07f96bda638a..1ca2dec18e51 100644
>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>> @@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
>>>  	for (i = 0; i < num_syncs; i++) {
>>>  		struct dma_fence *fence = syncs[i].fence;
>>>  
>>> -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
>>> -				       &fence->flags))
>>> +		if (fence && !dma_fence_test_signaled_flag(fence))
>>>  			return false;
>>>  	}
>>>  
>>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
>>> index d21bf8f26964..1c9ba49a325b 100644
>>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>>> @@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
>>>  	bool signaled;
>>>  
>>>  	spin_lock_irqsave(fence->lock, irq_flags);
>>> -	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
>>> +	signaled = dma_fence_test_signaled_flag(fence);
>>>  	if (!signaled)
>>>  		dma_fence_set_error(fence, error);
>>>  	spin_unlock_irqrestore(fence->lock, irq_flags);
>>
> 

