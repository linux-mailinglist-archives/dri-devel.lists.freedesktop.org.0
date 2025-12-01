Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78CC97939
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 14:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D07710E3F8;
	Mon,  1 Dec 2025 13:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="J3aJZC8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC6110E3E3;
 Mon,  1 Dec 2025 13:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5kWBtYfl3v5zO/mHScBQOunHgVTJYobsi0lW4ARkMFTFaEKO4WftwrL6SsbhCpbhZzUnuLnIlk4gAW8g589pfNE+pDNuuHw79iTRKKfXysZdmx93AQ83QMjRFUUPrZN/iwih13OCtEXSuucUjiyxBo0dRxT/AxQnyY6xpuA+XJyIIO8nUYI1JUU31CVtZ+r5+VKqgBA53CtR/VzX5z28IHwOXR/0+0vpBgGU1THIY1Yt83k7PVnuGL7+pB/mLIERXCf202yKRZGypoKSiBdRHDCiq/2Kn2aRWvNrf7jPtuIA6p2nTs8O01tha1pJIAjpA+qBSVN43cMGHeAobtNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lojJqS+bMiFqy7xf3LTQ/ud6lgD9jDkcNe/RJiqcClY=;
 b=ZsorALqLVKU+d8gbB2mzfVj99M4yQ2e0ovixm3NvTySjHuoYRYk1siUcc2x0ppYO+vCAtqbjCzEplFuUagCDKS8adEtDEXvcjOqPmYJSPuH75j+CqI+/GiOYiiR24v+25LG2lzLsqsEoXT57EoivdO+VtL2bQm2fcNk0KdMDX1agG9ooZ/aGnJB+TYZ7dh3PI+UzFpx0RlCUxr4tDX0UdybardliHUf/jXuJTKpXOPq4DtE/HJAjRW6auR9+DNn4AyjLd1uVeR74qldpZIfRiTskR4MAQ9rwn7dF7xmnGQiCH+9uMoEIbaGPXTxDpxZHxmS/P/sPSf48TjYsqGrdGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lojJqS+bMiFqy7xf3LTQ/ud6lgD9jDkcNe/RJiqcClY=;
 b=J3aJZC8g5Q8ev1xjFr6nkyt+TX8FK3bC1OhXH5i4+IPb9Y+gkaf72XXuREqs8TkNW9pSEsWSnKQPbzJyl7lFA+raK4cJT0doFRwDGjiZJS0AVpYKiYyPlQEsC1c8E/UvVNJi118sXaPtuRAOdgeAUGmpj7DnRFOD3PLfN8ttyW0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6145.namprd12.prod.outlook.com (2603:10b6:a03:45c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:23:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:23:30 +0000
Message-ID: <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
Date: Mon, 1 Dec 2025 14:23:21 +0100
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
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0456.namprd03.prod.outlook.com
 (2603:10b6:408:139::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 68886683-3ac5-45a9-f6ec-08de30dcd17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0pYbEgxaXh5bGc3ZndaTXlSQkVuRzZtRDBSTEpWRWY1TzRCc1dHZGVrL2lT?=
 =?utf-8?B?MDhES2t6UTRWVGVnazkzVzRaR2MyTUdpTnBjTFNsR0JjOHNjTCs5QVJ1RVJq?=
 =?utf-8?B?WDlZcjZyT1owMCt1OHdLamJUazJiMlc2OXBMQkdrTlEway9CQTArVkNQS01H?=
 =?utf-8?B?NFE5Qjc2UXpSTmtDN1ZGKzVzZThSZldUY0JpK3dZSmZqOXlVRTQvanVRZTQ5?=
 =?utf-8?B?SUV4MmRSaHJkTENnNkJWb1FZSU94bVhCNDVBcU0zdCtkZUtobnhpbW5JZGtF?=
 =?utf-8?B?MEtIT0h4T0FGdVdMbEFGVldwMG1mZTVEUjJHTFZVdUpaVkowaFZhcE5jNXBY?=
 =?utf-8?B?emN4R2E5UUFRandSVEduTnhwR0ZiemtPdDB2V0tyRmlobGVCclEvL3JsMFNj?=
 =?utf-8?B?T0srMDJxNktuMGwzekZSblRLRUp0Y0lOSHFBaXM5WUc1eVhwQ1AySFBFdWxj?=
 =?utf-8?B?TmQrQVRXeERPNmIxbllaU2dncm5od3ZZL1dYbUQrY0JCdWNFOGpudHdVbGJX?=
 =?utf-8?B?ZGo2VlRjb056MUxGTUJCcWY5L0lsZlJ6eEtyTktuQm9TSlhoWEVzTlQ2aGRQ?=
 =?utf-8?B?RWZvOHZwQlJLM0RuWVMycGdNRDRlTkJhUnQxQVBydEg4OStXL2JTamlJb3Za?=
 =?utf-8?B?NUE4R1ZCa0NySXdHRHRzcVhYNFBMR0lYckQvZjlLVEpDVnM3K0NCZ1ZRd1E1?=
 =?utf-8?B?RDZPc1dFZWZZUis4TDlRbnF4OEFtOHI0c2IxT09VeFg4VzhwWnhCWGF5VE9F?=
 =?utf-8?B?UU1EN0V0VllMTGFHQk5UNHJoZDZLSTZPVkcwNThKQTQ3blFqbUd2OHkxVTdT?=
 =?utf-8?B?dWJRRE9jYUVkamJaQ29MMGhhYkJoNVNHQkFiUkxVcmVOYVYrQWxHS01KOGRm?=
 =?utf-8?B?ckp1YkJtRXYyRnpuMHlWNForekRPU2NlQmVxMVFMeHpyVkcvUEFzSUxKaUdV?=
 =?utf-8?B?QzVXaVF2MWh0REhvS1d5dE9xeGhDaStaSjduK1pTWVpkcEhhdmJ6Vk5MZUlx?=
 =?utf-8?B?bmRyZ29pdlpKYkJrNUdRa21vSGs0bS94Q01SbTdrWEVwYnlWR0M3V05WUlhS?=
 =?utf-8?B?OEYvYlJ4YW0xVExTVEwrMWFLMzUyYUVYYWtuRHNCVzNtOE9HdFF4R3M1ZGlO?=
 =?utf-8?B?alNkR1FWamtIQ2RMUXNvaFBsSFQ4UFZKdUV1OWFqSWRubnJqbExZMENvQ3BM?=
 =?utf-8?B?ekloaXVEMkljTElXbUQwaEdrZDhsNGsvVUtPb0poRDBxWnRpMVpTUVFieGdz?=
 =?utf-8?B?NVk5blQ4YVN2Q3VRT1BZenZZb2dkZDNCMTA2TDV2VFQvWVpNVzRLNXNVbElV?=
 =?utf-8?B?UHZNWXN5UVY3TUNuNXFTa1pqQ0Q3R29ycGFWSU8yREdIN2w5MEVKdCt1TzZp?=
 =?utf-8?B?eERxbkdDOFpDOWhUanpYOWtWempIbDFyYU5HMXQyd3pvck9QZmwyQmpic0dm?=
 =?utf-8?B?TjVSdG1XTDFaYnNNWm1zS3N2cTI5T3FweVJYWnM3NWJNWG9tbUZ5bHgwaXVE?=
 =?utf-8?B?YlVEU0ExU3lHT0dVVUpLMyszWjNtTUxJUExKS081d2FXSWEyUWJEK1ZxMGdP?=
 =?utf-8?B?akdYc2pLVnVJTXJjY2dTdGZIZnpNOHNQa0NpRmhkazFrVWZ1RU5KQVpUMDZ2?=
 =?utf-8?B?d3JnTGdSYUpETEM4eFJia0VQZ2xnSHJlTVl6RGN6SlpZQXNLNHVneDN0cER2?=
 =?utf-8?B?WEgzN2FaaW5rMVFoMWtZdytuZjd3UnVhL21MNW1kODh1dWdSb25pMDNvZUx4?=
 =?utf-8?B?eTFjTGdneTZDRTBDZGw1YUZrNGtXZGJNUzBMaUxEejBaKzEzRXBvR2hNVkhE?=
 =?utf-8?B?ak55dFBSdytnN1dYS1gzdjVrZUNuUVo4NVhwWlQzVXBDOW1RVXBBcHhsdEVa?=
 =?utf-8?B?RmhPNFc0OENsZHgrM3BsaG96eVBrV1dHWiswWkZDQ0dtNEtoTzlVa3NIYkFr?=
 =?utf-8?B?SitOWXhXRDl4VVAyaEx0WFhRQkYyc2UyQlJxMmFWdmpZK2tMaE81L1lXU3J4?=
 =?utf-8?Q?uQGNNiaSV+55BTWofXFTa66i9qIcrM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDc1ck5RVzEzNmVNMUxoaVBLcEtMdDdZZlpjdEVudVkwMDhwbm9IejR4OTJC?=
 =?utf-8?B?dWxwSktlVWwycnc0WFBsVGp4MXZ6d0dVTlgxOWdZTFkrSmdFUGpDeUFnUEd1?=
 =?utf-8?B?NVNwS3lHdy9iQ2ZpNGxTUjFEaEoyZktZaEJJMWdwU2tVM01CNWpOKzlvcTBm?=
 =?utf-8?B?dWF6YW85UWEwenQ2dDRBVDV5dlU5T0lqQ05HVVBOTGs0ZElmbVVaUytrQWRa?=
 =?utf-8?B?Vm1PRzNrclhFYTRncmlTUnRuTDBhNW1LajF1UnQrenJ4NWZ2Sko3ZEtYNDB6?=
 =?utf-8?B?bkp2MTl5bW4rWXdMRmJNdHNJRHprQmhRZkJ4V2xCMEJyUzNQNzhzRnRzVU5J?=
 =?utf-8?B?bzZnSzlXVlMwNEpleUN4dFkzSVQyTjg5NmI5Z0J5Q1Z3NVp2a0xoTVppMTRw?=
 =?utf-8?B?L1VjS25GVVFMcXExMVJCYXJGSjlIejBCVndaeTZuTE1yK2RpeitBTU9vK3Fm?=
 =?utf-8?B?ZDFrL2c1NXg1WUQ4NHlpd3FCdi9EOVZQdDNMaHFvSGZWYzY4Y2lhR2xsTEtu?=
 =?utf-8?B?NDR2RHpETWtzeUJjNDBCMnlUSEUvcnNuMXBEVlpOZEZYQ3ZPOG1GOXJCVUVD?=
 =?utf-8?B?STZEOTZRQm1Ld1I0ZUhLc0RUcC9pUzVLZzJLRHdJOERmR1pwTE5RQ1duMFB4?=
 =?utf-8?B?NzF5dm1pRjdWQlltZzdPdXk1MG96Rmp1KzdjV0RYdzdkRmxwTXZJWXpBekRN?=
 =?utf-8?B?V2FCQks0MWlzUktJWFh6aEpFK0hhSmpNNXB3dXhBWFZwV0VwVDZSU3JkM0NX?=
 =?utf-8?B?eGw2UWo3VHErWnd4Sk1Vc0ZEZEFMY1ZpcXNCSEJhd2o1SVdrZ3NzdlY3ODl5?=
 =?utf-8?B?dXA5ZnhjbWc5SjBXRmNBNjdibGZIaUNJSUNTaFM2NnNGaWxwTFQvVEdUR2dX?=
 =?utf-8?B?RXlaa3FkckFEdGxJN0dJSXRqdStlRHZxRjlURTY3VUg1VDFmTmVCRElMTzdl?=
 =?utf-8?B?Ui9kNTJXaEI0WG5PeFhKUDVIVXlpTSt0VmpxQXNLTElPZURpUGFOSW1XSXp5?=
 =?utf-8?B?TDI0Y2Z6VnFqQWs1VS9YQU5tT1d6NTNCbzR4Z0tnQXBRaC9WMU4zOGNTcmdL?=
 =?utf-8?B?UndPcEQvWjF6OWZLUkZKb3VkZGE4bzQzZld6dUxueTFwanBJUVdYSE1tUmtE?=
 =?utf-8?B?V1BWcjV1OEVyMi96NW5EbE5UNjdyb1c3aTMrUWRiaWV0LzdjSzVyRUhHZ3JI?=
 =?utf-8?B?OFlhT3MxaHN6VVRwbVhJcGp1aE40dXRVVmNqcjh3Rm5NSER2UUdzZ09ZcWpN?=
 =?utf-8?B?c3puM1BSWVQ2cjJNbDJYanZ6Lzg4NnYybnBlcmJ5K1p3TDErRy9wMmtJeDJ5?=
 =?utf-8?B?OW1nNCtETkhhc3k2S3lHbWRUUkJDUEo1QkI5bVAxalRFa1ZBOVJMcmJ5ekpB?=
 =?utf-8?B?T0hKSDlQeXJmVWp6dVYvMFhMWjQ0cEN6aW5tOFRUTEc1WmE5ZlgvcStaeUhj?=
 =?utf-8?B?bWJrQ09vYlNNNlF0YklLNUw5Tnk5THNiM1hQNklHWXRuNVpaY1phMW9NU1Iz?=
 =?utf-8?B?OTJESEQxWkdBK3FjRmR3cGRTUnRIb1AyUDdMS3lNa0lJbmY4YWZYc0x1cSto?=
 =?utf-8?B?Vk5QaGhrV3Zxc0pYTmxMUHM3WmgwL0xiRzJpTDluUzY5Zm5ENWVrdlE4OG5M?=
 =?utf-8?B?QjhINGxaMG1pQ0JzelNKaWxYVjdGSUNuQVBFMWFPSWZHclVueGJjbm5XQnQ5?=
 =?utf-8?B?QmszODRhc2cxMS84cFdMb0dFRk5YSC9LZXRjY3drRDBDckNvcGFBQWhzWDgv?=
 =?utf-8?B?VEJuMDdZSE05MGRaSUQ0bFd3QWZWVHpqS0FER0M2THNnVVdoVHJHN1gzQWZG?=
 =?utf-8?B?MHMxRENlbHBrZ0J5YThtMUs2dndIa2oyMFpjQnAxaUxSTnp1aDlBODRTc3hu?=
 =?utf-8?B?N0t2VnFmMGhHc3JjTTUrK29vTCtpTVJCcm4wdVZEVVlNQlJzaW5qL0svQy9n?=
 =?utf-8?B?SjBYUXhaaTZHZ1pkVWErYmxRMWtWMVowY3FoSHd0d2ttWFc1VjNjODNSc244?=
 =?utf-8?B?NzQ1YTBUaVNCSSt1K1E2TWcyUENxVE1NelBwR09OYy9HL1BZeEMzUWdsU3lJ?=
 =?utf-8?B?a3FXUTA4VXBZdWpTMEZqV05IUktWSGdpYW5lRE0rL29UbkdNSGJ4a3NnT0dm?=
 =?utf-8?Q?TSJLMA2XvHk4e87m1poU2x7Dg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68886683-3ac5-45a9-f6ec-08de30dcd17d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:23:29.9992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufsm0fs770OGI7Wzy+YL0vll9oZkIGnVmdZW6sTeTP2ppa8tRZHJAuEVedbiY3sp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6145
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

I'm seriously considering to nuke all the unlocked variants of dma_fence functions and just make it mandatory for callers to grab the lock manually.

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

So I think we should name this one here dma_fence_check_and_signal_unlocked() and drop the postfix from the locked variant.

> +{
> +	unsigned long flags;
> +	bool ret;
> +
> +	spin_lock_irqsave(fence->lock, flags);
> +	ret = dma_fence_check_and_signal_locked(fence);
> +	spin_unlock_irqrestore(fence->lock, flags);

Could this use guard(fence->lock, flags) ?

Regards,
Christian.

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

