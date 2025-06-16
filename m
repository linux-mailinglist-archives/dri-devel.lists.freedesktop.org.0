Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C19ADA8DD
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 09:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD2910E2C6;
	Mon, 16 Jun 2025 07:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tZ7We5eP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7582710E2C6;
 Mon, 16 Jun 2025 07:05:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSwSPpDMR6o36QVanyQ6e7P+seyjoTDc23w2wJuXTkWg4Sa2azbp4Yg7YGolrXG5hF2ibo9boihSSHQIWCtxpBKPZjTg0n294d42FuPArcI7BYo6RR2W12sRHZiyCazqu39eyukDjv1TNb6WHwQXndU2mw1XlHzfGd9+OtKjyW93/x8d1Wp1Q8nzcAJK+w0pYkOhLI3V7lze3o/6hNTozeJnqCzpCsp9FiTwoEUoJVtHEuvSmGABdfFMU0u/YVieCD3jhM7Oroe4+oJcClzq6+7+uJ4yXXG2bsxOXnuGq4fFty9SSui6L98Wp+34DUn/NrlrXe7Uy3HvYejqPitaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NZ3Wv63QEYKwJ+2TbWL/KVeKwXlVahWShGuhYKK4rI=;
 b=oWdvT2a32rw6sboPSxhVTtmCbP08yj6TRNLnxq2cQS+PW9Flby+0oqvy5Q5yNcWJOdcIpO4y7Q2+wLmh0U4sFHYQBu4i0NDqA90//cfgw3xBAb743nmq58CCDMMVVpNuRQPiD2mHmZYKlwcZZj1pGDBrLiphLZ2gghzD6eLax0Xg+0MdZgbJbAkU97Vt4HFSvZjVySUS/i7kv1eZVWLPIZAPevHfbXA2dVuF6CwYpvLElzTQTeyBSYfN5Qj8gcE1/wObRAJnhNpmv5bwLMOklEJ1cRMA0Xu2mksWEyjizAO83fFhU1bV7yTgyfGnqrUtbSnDOauq3yHICFS02lFI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NZ3Wv63QEYKwJ+2TbWL/KVeKwXlVahWShGuhYKK4rI=;
 b=tZ7We5ePvoYC3OzzwAFWdXKhCwUDVdXVcbRUTrRZKtxjjn6k4roVpudEGTEt993lvsDDYGlmOdA+ADKj9h7IHEwrZQo6rQy5WCpR4olHRvH331gavgPPR5B0eL6QRNx6vJ3XO3/SeFnDu+feI3pF9VigorcNLKhOeEeD2kE+9SI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 07:05:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 07:05:18 +0000
Message-ID: <59e05cdc-5178-4dc1-a169-b6f6ec1a2e69@amd.com>
Date: Mon, 16 Jun 2025 09:05:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] drm: amdgpu: Use struct drm_wedge_task_info inside
 of struct amdgpu_task_info
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, siqueira@igalia.com,
 airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20250613184348.1761020-1-andrealmeid@igalia.com>
 <20250613184348.1761020-5-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613184348.1761020-5-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 05ffb6cf-4ac4-46a3-7abe-08ddaca4269e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZExRN3JMRDd6TnBuN081TEdnK2o3WnFhazJFa0pzV0J5cnN3S0ZzeEVwYzEv?=
 =?utf-8?B?aUFTczNEZmJ5MzVXTFlZN2w2bWNkTnRXc3lRdGNxYXFNTENQZWNnVVdWT3Vu?=
 =?utf-8?B?QUlCK0RzT1lFdE5sdGhjVXZmTll0U1g3MzFLVldRQm5CamN6OEUrN0VZN05L?=
 =?utf-8?B?QzNocDA4K2kzb1pjc01wK3QvY1VJVytZR3BCM1BoelJ3Z3M4UlRCSG1IeElK?=
 =?utf-8?B?akVnaEwyY2wyNTR3aUtNa0JvTHU4eSs5VW9ma2loWFRJM1Vjemt4R0ZWL0s1?=
 =?utf-8?B?YUJ4dkVEYnRUT1IySHZpK2dPaSswZWRTT0dGTXJTRTVhL1pwUlEvbW1VeHJj?=
 =?utf-8?B?WVczWFJQVjNiMDNFVXdQRmE2WU1mcWp4MnQ1ZUhyYWVVSjZOVmxyNmhROUJw?=
 =?utf-8?B?cVIxcnVITFNPb0hTd0huLzlnY1FNb2xaOXhDb2d3Ri9rem05VHV4R0FKTldy?=
 =?utf-8?B?RWhoeHF1Q1I4NDU2UlA5WGg5d0RLRDU4OUw3Z1A4VkZvR1o3UDhMajFUMU9Z?=
 =?utf-8?B?S3l0azZObUtweTRvbXZxK216aVRsWWt0QzJibE90MTN3TDVOZkpRUkdPVDVR?=
 =?utf-8?B?OWlITnZwb2lubEE5TC9uQ01EdnZBa2d6ZjBvRkFVam1ySVdSWkllQnV3MU9x?=
 =?utf-8?B?TmRxdEwyUldta3A0Mm9TUkpXLy9pZHVUd3FpYnpHam5OK1BrRE9lMjRoT3Rm?=
 =?utf-8?B?WWIyWkRyeC9PVTZaTE9aRWFEc0tYMFg5UFFOMjFHSkd5aVlzVXEzeEl5UXh1?=
 =?utf-8?B?Wmk1RTEvQ1ZSOUt5U3hLMDVYNURWUElFZ203L09PTnczS1pxam42MktzNlQv?=
 =?utf-8?B?WXllTUJSNFluWXlmRGlBQTlUUjVsZUFJRlpoUFlueFRzRGRrRUNuVHJaOFQ1?=
 =?utf-8?B?Zk9SSEVGWWJ2dkJvdVdVaXl5NXFDQmZjUWdwRGNiN21veVdtSksya0NhazBp?=
 =?utf-8?B?dDVuTHc4bmlaajZOdUNBRWdJNjIyc0RHckc4cGd3R1RYNERSNnRMRktYZXlR?=
 =?utf-8?B?ZXdBdVZ6OEhKTmZ6U29TbnR4V3lmQ2JkOEx3eVluY1ZnckF3cExLTjJxUGxw?=
 =?utf-8?B?ZFdRRkNsNnp5VHc2TjloSTlvcFpEQS92L25wamJneDZEdlMxa2xIUUF0SUdw?=
 =?utf-8?B?UnE0SzNSMEkrejk4YXQ1VzM0YlhBZGxwOFZvZVZqcitjbFNxOXJ1RmhkeHo1?=
 =?utf-8?B?VGExU2pGY0JKOFVUTU05ek1lajNPMkVzc2JFZ0NQRWN6bHhHd2RKM1ZoeUwz?=
 =?utf-8?B?ZDdvcFJhN0FsazkzMjFPcVhwWnlVLzZjdThrUjdTczJUdVB5bnJUMWRIQmRw?=
 =?utf-8?B?NHBaaWtBVUtuSHJ5dHpyYjhEWStUZzdrWVVQa0dtWTF1L1dwSklFWFRhTjc0?=
 =?utf-8?B?MlFzUXNJOW04VlFFUGRENXVUSGloSWQ4eTVIZkVZMHhEYXA0cS9lMFUvMiti?=
 =?utf-8?B?bzZNYjFqTjR3TzlDeW9qSE9ZV3c5ZVdKdGtld3pON1BNa1ZiUUFwV2JjZVl0?=
 =?utf-8?B?T0R5anZRdTV0bmhUT1VMOFh3cURXMS9HT1VvQU5HQlJOWDZkaUJuTjJEUkIy?=
 =?utf-8?B?Z3Urcno3b3JUYmZHTGxZaWw0RUNuMm9UVENYZDRkOENzZi9sTEFyZjlndWU1?=
 =?utf-8?B?MlB0bHU3UEVJWHkzK3dDdlBRanVQTlY4dUVzWG8zVVdraWxIK2ZldVh0Szhv?=
 =?utf-8?B?ZDJ4WUtZNnZYOEZJaEtKMFpWWHRyZFVhL0wzNUF1bXJ3L2VicEQ5RjVqSlVC?=
 =?utf-8?B?Z3VGTUlPZ252N252SjJzRyttQWFtY0ZxL0llK0Y5T2l2VG9aTmorMkJTa012?=
 =?utf-8?B?WlZjUHdMVkFkbjRVaGp3VDlHcUlCRU5lYVlGemh1bGRpL3V1eE1WVG5RenhG?=
 =?utf-8?B?NHFUM0UwRDFvMFJKelBrVFBnN2QyZFJ1NDFuMlVtdGo0NGp1dFNaSkR2bmh6?=
 =?utf-8?B?WnptQkM0TkdpZlhick13MER3OTZxc0hkMTRZM3NZWnBCK1ZrYmQ5VVE1ZUUr?=
 =?utf-8?B?ZDNqK0tJeVNBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFlaWVQzdUxKR1Z6RktIN2VXTlRiUmZYanpFc09idkdIT2ppRXdMM1I0c2hS?=
 =?utf-8?B?SU5xL3dkTVJLcDVpak1EbGNLMW42M3dnYkMxMTNGQSt4bHpZRVZhOGlQMC9N?=
 =?utf-8?B?ZTBhajNpVUR2WWorNWtMTkdSMmJpVXZBa2NRZStsZDYrTW53UzB4N0VINmgw?=
 =?utf-8?B?b1RvN1Z6aytiWk5WMlhzYzR1TE1PYkVaUnRJN0U3ekF5QllqWVBxaFdkS0Rs?=
 =?utf-8?B?RXFHYi9Ga1gwd2xDVGlRZ21rT1RBUno4SmxHamZacmRvdHp2SjJ3blZvYjBi?=
 =?utf-8?B?T3NMYkh5WHZNamxkTHJ1eEV6VlpWRVZwQnVSVVBTYlJIa1dGT0FuQUlVb3VY?=
 =?utf-8?B?N3ZleDFiV2d5TWtDRVZtUWRJZU9jZDR5T0orbDF0d2FoTU8rRWJVM3FEbnNm?=
 =?utf-8?B?ZFh1UXUwdlFqL0JlRE93ODF2Sk50eUZGOTZ2Vk1nZ0lNUDZYcmc5cjdxdU1N?=
 =?utf-8?B?QVBCeEJlTktNeE5NWG9uZTFpODd1ZVc1UTdLM2YrazU1dWJFbkpZUk10MEo1?=
 =?utf-8?B?by9mTEpvWXpQa0VyVnNUWmc4Ui90RWpyN0dEbkxxU0ZsZWxCQk05eWhLby9a?=
 =?utf-8?B?S2FuSXl1cTVWcjlxeUJaRUFrU0FPUnN6Q2paMnJ2ZDlHS1MvK2oxOXhwMUVB?=
 =?utf-8?B?UmtBUUZLaEIxQTBPR2RGaGlpdmExMFhLdC9FSlVIMHkzcld5UFAzeWtqYkJz?=
 =?utf-8?B?LytOeElmb2dnSW1jZnkvZ3N1WmthTVk3Yk1NN09SbjMycnpUT3VIWUZVWmhi?=
 =?utf-8?B?TnM3T2Q0bkk5K05RTXJsa09EYkNKcCt6WkhVV2tSdUZmMFJhc0dZbEIzcDVp?=
 =?utf-8?B?SVU0Si9Ic3pNSkpsanRzSVBjNWJ1RCtpM0JvS3FobXRjQjk0V3dKU2Jpbnlp?=
 =?utf-8?B?U0crZDZKV3dEKzJ0cDJ4RlB3RDd4N083K04rRUU3NTA4M1h2QnNrZWNiWlha?=
 =?utf-8?B?aWxFdUdJY3hxQmljbjNqLzJ0M3o1SFBPbnFDeXNuVGNIT3JGdENQY1BVUjBm?=
 =?utf-8?B?aTVXWXNKb0w1L0llNExLK1hiYk5BeW9mM2U5M2xPUFpJb0N4TVVHR3NWRmhZ?=
 =?utf-8?B?eDQyTEl2THp2dHlTUzN4d1QzaXdENFJEWTF6aHNIbHVHckdCaVRraHRxYm9P?=
 =?utf-8?B?eENUeldhTWF0QkQraTR1MEl5Ukd4NkcyOXVKL1U1R0JHQ25naVY1RnZtZHdX?=
 =?utf-8?B?QUpaZGVtOVI3SU9RazBrWVQ0R1EyMmxabkgza2J6SnJuVkgwTk9mQUhMMWxQ?=
 =?utf-8?B?QVNtbGNjbWI3SG1jUjVwWHV6Sm1zTkljTk1hWURPV1lZTmVsNjFHZXk5MWEx?=
 =?utf-8?B?V2RCV2tJRlJnTkdkbnZ6TUtPbmVrenlWMU02Y0F6VmdrWWlsNzRZN1JmRXVi?=
 =?utf-8?B?bE56QnVJRmRiRmRodFgrK0pRdzI0YjZMdEMrdUhQb2p1U1BENW1Pa0hRMnJx?=
 =?utf-8?B?c3hsRmJtZXd2b1QwbG5BWEFrd3F3UUk1MmFNK2xGMXBCSHQwQmVqQ2VZZDhM?=
 =?utf-8?B?SDU1aVh4TUl3d3U5TyszL3dYb3oxZmxDQWN0RGZyWkZWL3dkaFdVYlp4bnJa?=
 =?utf-8?B?NFpMN0krVUJEWWJVWWQwR004UlAzZFpJZ0RBTmNYVXE3T1BxV2RXMncwTUZN?=
 =?utf-8?B?YnJQZWVHSks2TFJJMzJucTZEQlpNTG95NUZaUmJPdlg0Q214Y0lzd1QzYitv?=
 =?utf-8?B?SktkZVY3d3hDUkZOOXNqYW9PWkRKakZxenJBT2R6SEwwNWhVZUxySnBJVHdJ?=
 =?utf-8?B?SlJZMndqU1hsVjcweWpVaGxFM01vcHZUcUV1eHpJKzFKSXh4cE1PNUtOeEMz?=
 =?utf-8?B?VlhZT2dNZkpuTnBsLzZJUXdKTGdtMUkvdFY1YndpZ2dnNlhVbXNLS2lhalFl?=
 =?utf-8?B?ck4yUThwK01laTU5YkxWUzdzYTZKMERmYjVZcHdoT1c1akxJVTdVQ3lBcVkx?=
 =?utf-8?B?cW8zODhEUG50cUVWc2l0VUV1TE54L0JDMm4zZXlyUHZHemplcmwwMkoyR21v?=
 =?utf-8?B?elMySTR0QmVWeVhJQnB4UjdUUElYNklVazQyRHJOQzRiUkFmSmZsa1hnenhs?=
 =?utf-8?B?ZWd6UHh5eHhQaWdTMUF3Y1ZRMGJGZzVMTmNscFNHaGw3UEJwdnJJVll3b1JD?=
 =?utf-8?Q?TuXxxpLypt6MLsbsmKhj1GR7p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05ffb6cf-4ac4-46a3-7abe-08ddaca4269e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:05:18.0322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR06q/vZVsPRLo42/kLY55d0nPqbPli3wxiUC9iWEggAKGxYfSNkHdFcruTbnH1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

On 6/13/25 20:43, André Almeida wrote:
> To avoid a cast when calling drm_dev_wedged_event(), replace pid and
> task name inside of struct amdgpu_task_info with struct
> drm_wedge_task_info.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> v7: New patch
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c |  4 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 12 ++++++------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           |  3 +--
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c           |  2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c         |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c          |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c      |  8 ++++----
>  9 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 8e626f50b362..dac4b926e7be 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1786,7 +1786,7 @@ static int amdgpu_debugfs_vm_info_show(struct seq_file *m, void *unused)
>  
>  		ti = amdgpu_vm_get_task_info_vm(vm);
>  		if (ti) {
> -			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->pid, ti->process_name);
> +			seq_printf(m, "pid:%d\tProcess:%s ----------\n", ti->task.pid, ti->process_name);
>  			amdgpu_vm_put_task_info(ti);
>  		}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> index 7b50741dc097..8a026bc9ea44 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> @@ -220,10 +220,10 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>  	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,
>  		   coredump->reset_time.tv_nsec);
>  
> -	if (coredump->reset_task_info.pid)
> +	if (coredump->reset_task_info.task.pid)
>  		drm_printf(&p, "process_name: %s PID: %d\n",
>  			   coredump->reset_task_info.process_name,
> -			   coredump->reset_task_info.pid);
> +			   coredump->reset_task_info.task.pid);
>  
>  	/* SOC Information */
>  	drm_printf(&p, "\nSOC Information\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 0ecc88df7208..e5e33a68d935 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -329,7 +329,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>  
>  			dev_warn(adev->dev, "validate_and_fence failed: %d\n", r);
>  			if (ti) {
> -				dev_warn(adev->dev, "pid %d\n", ti->pid);
> +				dev_warn(adev->dev, "pid %d\n", ti->task.pid);
>  				amdgpu_vm_put_task_info(ti);
>  			}
>  		}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f2a0132521c2..0efd3fc7cf3e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -622,7 +622,7 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  
>  			pr_warn_ratelimited("Evicted user BO is not reserved\n");
>  			if (ti) {
> -				pr_warn_ratelimited("pid %d\n", ti->pid);
> +				pr_warn_ratelimited("pid %d\n", ti->task.pid);
>  				amdgpu_vm_put_task_info(ti);
>  			}
>  
> @@ -2507,11 +2507,11 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>  	if (!vm->task_info)
>  		return;
>  
> -	if (vm->task_info->pid == current->pid)
> +	if (vm->task_info->task.pid == current->pid)
>  		return;
>  
> -	vm->task_info->pid = current->pid;
> -	get_task_comm(vm->task_info->task_name, current);
> +	vm->task_info->task.pid = current->pid;
> +	get_task_comm(vm->task_info->task.comm, current);
>  
>  	if (current->group_leader->mm != current->mm)
>  		return;
> @@ -2774,7 +2774,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>  
>  		dev_warn(adev->dev,
>  			 "VM memory stats for proc %s(%d) task %s(%d) is non-zero when fini\n",
> -			 ti->process_name, ti->pid, ti->task_name, ti->tgid);
> +			 ti->process_name, ti->task.pid, ti->task.comm, ti->tgid);
>  	}
>  
>  	amdgpu_vm_put_task_info(vm->task_info);
> @@ -3163,5 +3163,5 @@ inline void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
>  	dev_err(adev->dev,
>  		" Process %s pid %d thread %s pid %d\n",
>  		task_info->process_name, task_info->tgid,
> -		task_info->task_name, task_info->pid);
> +		task_info->task.comm, task_info->task.pid);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 3862a256b9b8..b5c3af1c5e99 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -236,9 +236,8 @@ struct amdgpu_vm_pte_funcs {
>  };
>  
>  struct amdgpu_task_info {
> +	struct drm_wedge_task_info task;
>  	char		process_name[TASK_COMM_LEN];
> -	char		task_name[TASK_COMM_LEN];
> -	pid_t		pid;
>  	pid_t		tgid;
>  	struct kref	refcount;
>  };
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index 33ed2b158fcd..f38004e6064e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -2187,7 +2187,7 @@ static int sdma_v4_0_print_iv_entry(struct amdgpu_device *adev,
>  		dev_dbg_ratelimited(adev->dev,
>  				    " for process %s pid %d thread %s pid %d\n",
>  				    task_info->process_name, task_info->tgid,
> -				    task_info->task_name, task_info->pid);
> +				    task_info->task.comm, task_info->task.pid);
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index 9c169112a5e7..bcde34e4e0a1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -1884,7 +1884,7 @@ static int sdma_v4_4_2_print_iv_entry(struct amdgpu_device *adev,
>  	if (task_info) {
>  		dev_dbg_ratelimited(adev->dev, " for process %s pid %d thread %s pid %d\n",
>  				    task_info->process_name, task_info->tgid,
> -				    task_info->task_name, task_info->pid);
> +				    task_info->task.comm, task_info->task.pid);
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> index 2b294ada3ec0..82905f3e54dd 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
> @@ -1302,7 +1302,7 @@ void kfd_signal_reset_event(struct kfd_node *dev)
>  			if (ti) {
>  				dev_err(dev->adev->dev,
>  					"Queues reset on process %s tid %d thread %s pid %d\n",
> -					ti->process_name, ti->tgid, ti->task_name, ti->pid);
> +					ti->process_name, ti->tgid, ti->task.comm, ti->task.pid);
>  				amdgpu_vm_put_task_info(ti);
>  			}
>  		}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> index 83d9384ac815..a499449fcb06 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> @@ -253,9 +253,9 @@ void kfd_smi_event_update_vmfault(struct kfd_node *dev, uint16_t pasid)
>  	task_info = amdgpu_vm_get_task_info_pasid(dev->adev, pasid);
>  	if (task_info) {
>  		/* Report VM faults from user applications, not retry from kernel */
> -		if (task_info->pid)
> +		if (task_info->task.pid)
>  			kfd_smi_event_add(0, dev, KFD_SMI_EVENT_VMFAULT, KFD_EVENT_FMT_VMFAULT(
> -					  task_info->pid, task_info->task_name));
> +					  task_info->task.pid, task_info->task.comm));
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  }
> @@ -359,8 +359,8 @@ void kfd_smi_event_process(struct kfd_process_device *pdd, bool start)
>  		kfd_smi_event_add(0, pdd->dev,
>  				  start ? KFD_SMI_EVENT_PROCESS_START :
>  				  KFD_SMI_EVENT_PROCESS_END,
> -				  KFD_EVENT_FMT_PROCESS(task_info->pid,
> -				  task_info->task_name));
> +				  KFD_EVENT_FMT_PROCESS(task_info->task.pid,
> +				  task_info->task.comm));
>  		amdgpu_vm_put_task_info(task_info);
>  	}
>  }

