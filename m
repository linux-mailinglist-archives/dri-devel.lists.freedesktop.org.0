Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBB4BD3D32
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 17:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDE710E143;
	Mon, 13 Oct 2025 15:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="j8SjoKLS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010017.outbound.protection.outlook.com
 [52.101.193.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C919210E143
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 15:02:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsB1AKAMj6OmcS9COx4k/Atk2aJ7XdsXoXyxtX2kaxwDj5ZEpHyGgnlihcpRn1PMF1qzZvAREyiIZmeiTWhUHLB/uieMELcqVjrWqqGPe6CJq885TI9Pex52BbZZZ1zaR5Iwe/TyF10+iMeWS0crGoIPYvQk0T2oT7Ynsw5apcySZdtW3GvkDzwxW69ACFxL5+KlW/UHjKP65/UosOPApG6Kq5HI4lZCErHXXexUp9q7XZ0fVn+4tYdwUGI+sG0wKiKANuDanZtOV26FHwDzV411G4/7UQp3aKcI0nqeE78MeZKw4CpOjsbUL6fHCpnxPvwd3en/g3v1E4JWUQGLyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/QiR9t0SZiUp2bTwWx15C7MKrWoX3YqEqwsnO3UaVw=;
 b=oO802QaNzYWrdzQXdJCbPbnIb434tO0QI8gdBARSf+3lrjcgEthdyu+EuNtQGnNWkQlPKHPo8clibstNc6G5rc4lUlrY5GzpwxQjwPMH4O3sFRUvG8ss7PlQLrcbEsh+IBVewKobGkMeTCbHUT8tMJa8lfqT5yZVitMQYX50261NZ7ZS4Sw5rLoVPU6ZHKncGuKoujuuL4XTcIM6mJn7w55eWp2RViGxYFMw6DruH6M6DvpBrQc+nEzk2bAooe8aUZDsHhB5wQaZ0m/N+xsp8WciqRkgfR3wPsJfp6vl0M6QoOJl84DOcW6RCdQ/XvLD6i7mhwpIpuTBuPtCJds7Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/QiR9t0SZiUp2bTwWx15C7MKrWoX3YqEqwsnO3UaVw=;
 b=j8SjoKLS31v2twbo+TW/pXRmZ9TNSlvDkgQlsycN+UZK4HD2AXmQ9xvbnvv2DJGhQlkUVXnnkKrlGcXKjVEHY5ljTed49w53kFhxsv2jM8gstTzsIGB/qgTf7d+UGfY+jb+TPby9AXd2WdFEVaClors92YO+9dcGdXFOclQeUQY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6475.namprd12.prod.outlook.com (2603:10b6:208:3bb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 15:02:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 15:02:29 +0000
Message-ID: <bbabd9fe-5a79-482c-b277-5547797c240c@amd.com>
Date: Mon, 13 Oct 2025 17:02:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: improve sg_table debugging hack
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "simona.vetter@ffwll.ch" <simona.vetter@ffwll.ch>
References: <20251006134713.1846-1-christian.koenig@amd.com>
 <20251006134713.1846-2-christian.koenig@amd.com>
 <IA1PR11MB64187AF0DC0A4A63D9930F54C1EAA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA1PR11MB64187AF0DC0A4A63D9930F54C1EAA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0436.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cbb8386-d466-46ef-9f48-08de0a69873a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1pXQ1pVY2hoaVJYR2R0d1VzcWJFdXVIdEdJZCtKTWZiR2swbDA4MG5xM0ww?=
 =?utf-8?B?TmZLWjhFUTVaemp1K05lc2g4YVpKa0pDdXdJZjkvNWdqWVZ1SlhSSGFaMUxM?=
 =?utf-8?B?L1V0aThmUDVEL0h0S3V6RFdRSThzcXJ3NUJuTXBMdWVIckU0NWtjNndHVGU5?=
 =?utf-8?B?dlpOQ05SbzVvNnRlZnlIOXRuWGEyckt2WWNDRXNzdmtaSjVObEJsWDlCemlv?=
 =?utf-8?B?NENHb2NqVzFLQlQ4NG9Reit2cm9ESGZ2b25sOVJ5S1hWSTQ4Y1lmUG8yS2Jk?=
 =?utf-8?B?V2RmZ3lkSnc3TGdVNDNwQVgwa21JT0xWOFJHNmdVbVVqVm9LR3ZVcm1UbHUx?=
 =?utf-8?B?VVdVNWc4c2FXblFlaXowOFZTcldzNStXTDB2UHdBUUtnLys5Yml1eDRGNndK?=
 =?utf-8?B?RkQzL0VnTGFWcWFUZCtWVENmVkNNeVVuNjRTRDhVbDhtOFV1ZjlZb1pud0Vo?=
 =?utf-8?B?bUpUYjVJUk1BYVlWOG11UkM4dDFaencwQ2lueDlGem1DNTdhY1I0bnZGS1E0?=
 =?utf-8?B?c1AvTVNmbUFQMmtoVVJjb0laWUJBNXlvVU4rc1hCbkg2WjRMWnJSb0IrUWtr?=
 =?utf-8?B?SzVFSDlYK09aUUVZU2U5My83S2crc20veXBKSElvOW1JYndzWExCVVRoUTk0?=
 =?utf-8?B?RC9MOVhpN0NpZjI1K0pNbzkwZEdySHkzdmtpRkMydEhDR1V5RGpVMDVzZVBN?=
 =?utf-8?B?M0lFME5hekpieSs1dXdXVElVc3lVRGhUTHNKYW5EemxaUW5DQVFvaks3ODgy?=
 =?utf-8?B?VGx4TTRPcVhnTFl5YUpHNmJLeTBFNGdqanJTYXc3VnlnV2hzS0FsclNPVjdB?=
 =?utf-8?B?OU5zR2FSbmZON2NNNGxaajk4cGRibkt2MDJaRVNBSzJUbmlHZ29YY25WOWta?=
 =?utf-8?B?Ly90TGxGK3JYQ01BbWFWR2phRUJhbW9nTm5kWHFwblRjbHF0Mk5uQ1RmQkhk?=
 =?utf-8?B?ZUJQOEtRbS9sR0dRN0NoaGs5ZTBrVEhvUWdJUHEwdjYxSHNXUGVocEdGdFFq?=
 =?utf-8?B?RzdPdmV6M1IzWlVyS3FlRFc0N24xYUFOS0VtRXM5ekJkQjQ5VkhNQUFsbjdu?=
 =?utf-8?B?M2UrNkhzd2hNVytCMTdYN0p5YmpvYVNCSkVXOExJallYVEVJeXBkT2FvRGsw?=
 =?utf-8?B?U0xJYU96YVdJRlFYQjRPVDVLSWxTSzdCeE1aVkppdjJIdTc4Sm5LeWFpb3Fo?=
 =?utf-8?B?MDZROHJENkFyQVBsWGY3TEdpOUZSdXpQVVNERXBNSE5EK3FXTkwzOS81VzY1?=
 =?utf-8?B?Ylg0TGNyR3JPNFhEaE9mU3N5eWRlUjJ5R3M5cG9HdVdrTDdtTC9kYVBCYTJ4?=
 =?utf-8?B?RFV4S1FSZHJldTIxbTJPanNzcGJGRW9QYkxDQ1lxWnFQTmNmdWlkVFp3UU11?=
 =?utf-8?B?UVpma013TWNyVjNTL1M4UE44T012L3NlYzVOa2lxVkRhY2hFRGtwTk91UGV1?=
 =?utf-8?B?VTlHNS9icWt0eDFoVUdpczRNVWZrZVNibFR0Wm5sa0hrUVlWYVFsa0JyamxF?=
 =?utf-8?B?Q2pPZ0g2eSt3YTVMQmFEUms1VFkrWnExK0d3dEprMUtLTFZBZ1VyaDdMQ1lC?=
 =?utf-8?B?NzRVczZsNFZUYXR6U3NCZUN1MzgxV2N6TEorMGJvaVpMVHAzNUQvSVd5ZkdI?=
 =?utf-8?B?dE1waHlnaTJDNm9jOU5YNkEyTzVFUlhnR1F5TW5VdE5sUUk4ekp6eUJoWmda?=
 =?utf-8?B?WFByYzg1LzZ0dU02NnpjWTJ5UTZkR0NyOS9SYStsZ0VQbzh2VzBOQXFhaUt3?=
 =?utf-8?B?THh6ZEp0QTBqTGJaOTJKY0thL2pSZVpwaGlDZUtRcDc0Unhzbm52QVBTcGFM?=
 =?utf-8?B?M2d6Z3UxbTd4V0lSamFINmdVdCtTMHB4cVBUS1Q1bFVsNDRLcnIwYWRrbmpR?=
 =?utf-8?B?aWZuQzdLbzRnclk1K3BTcE5rMU1KQjBscGswazJPN2hTS2dDem4vK1E0YlhF?=
 =?utf-8?Q?w3ipSHPiy1UNX8L5HvIFcQM/vZycN9mW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZSM0Q5VDRRU2RmNHd0dFltWmZROUpnSlhlTzFneXBXRHk4cGI4OWp0R240?=
 =?utf-8?B?dkJPK1l5Ukp6RlRVTUk3WjVHZDZveDQ4VTA5dmRzUVBpd0JvdUFqOW8zNDZW?=
 =?utf-8?B?OUxrckZZTEFVbnlCTmlHaDArU1piQkR0VXVSU2lDUFFWVjkxRHNFYmFUbFJL?=
 =?utf-8?B?ejlyampPeWJsd1l4Z2wydVhhS0x0Ty9naG91dlJSQTR6enhMQklvWmVPdzdE?=
 =?utf-8?B?Rk4rT3RMMm1vVHJEcFZ3K3AydVQ5c09SWDJqdHR3d1BGYW9GUEoyR0w5UGhw?=
 =?utf-8?B?SitCV1JlNE13dGtnMXNxbWtMRzlOcGJSU3JlV0c0eVl5WExYeGNSNmxNL0RN?=
 =?utf-8?B?YThrakVDL1pDVE5qUStZeTM4WEhoSTBTQUZUV1dqamgrZGFWTGFjMXVQc1Bs?=
 =?utf-8?B?UTFEV3RwUTNtc0kyR0dGTFRNRE42OHVpOWM1S2dIQXhMZDdxdTR0Snc1YWpG?=
 =?utf-8?B?WkFrUlpxckZTYlNIb0pGcUZRZ01xd3FLcExYdE92NHlwN3hGTWNFUlZuNCtM?=
 =?utf-8?B?MG53alpsMEhpUmdUazZHYlFwTUJIR3JWOFYrVkdjeTNmWXdseUpyd2hHY1BE?=
 =?utf-8?B?WUNiOFZMQnJ5ekQrZnZLL0t3djdJNWJ0bEt2WEQyY05mRVNHNTlPd2JtZ0pI?=
 =?utf-8?B?OWU3cEVoM2o2Q1VQWFo5UENqMGRScGY4U0M5OHR1NmZUeTJ3OUV4T204azhh?=
 =?utf-8?B?b2hZb1dOQlRKc1BOZzdYN1B5a2FyOUxuZktrRVB3VzNVZldvRnV2RldtUVVu?=
 =?utf-8?B?M0xqYkRuTGRSeWhLZ1hlKzFyVk56K3dzU0gwQUZNMFFEMFE4K0wyb2YzTm1I?=
 =?utf-8?B?WVJJNkhmYi9sbUl6TktEc2dNL2hQTTBHd3hoQWNLempxTFNvK0Q1QjBrUEpB?=
 =?utf-8?B?YTg5T0ZuRWtNUHRxNjl0MU1XUkUvWHdhZVhXY3A5cVhaQlJlZ1dVc0JsMm5v?=
 =?utf-8?B?U2t2SjYxekhRcjdHN0tYUThqMi9aNVhjeUdpL1hoLzAyM3kwc1lKKzdhajlK?=
 =?utf-8?B?MEc3WXNVeGVvWVdZUHNTSWNZMTVCQnREdlA2SjkrTDVnSjBYS2dpZE5WVVFp?=
 =?utf-8?B?c1M4RmlaV0thcm5kVk9MWVovbk5MTHVROC9qWDh6VzlFTmprUVRCVzR1Vmh0?=
 =?utf-8?B?bTYrM2tMbXNDYithSG5ya2Q2OUxaUXRDZW1UNHJuRFE2V2pmRktQYmQ2Z3Fz?=
 =?utf-8?B?ZnZsOWFiUkgzSzRmVUtuM0dEVGdiSm5IOXR6ejUxNlhuZzV3dExOSzgwdXIx?=
 =?utf-8?B?K090U21hZVhtSGlZV2kvQ203NXZYbWtkdTU3d2NRM1lrUGY4bVNPS0hqb3VU?=
 =?utf-8?B?bW9WdG5MT0d3UE5VZnM4UEJ2TjgwQXpGdUNxckFHcEtZL0xqTXVzL240dXB2?=
 =?utf-8?B?a0RlUGRPUVljY3lwY1pxZ0p0bjJPVzBSZG84clltRCtoYWI0d09QdUJ5Zk5l?=
 =?utf-8?B?UE1CSG5FSWx0K2FQb0R1dlFhTldoaXhUSG9qOFo0YldXUy8wbGdPdUZONUsy?=
 =?utf-8?B?L1JhT1VDRmMwQXZ2MGhGeldwK05DRlNhTHNscFBtSzNJMGgvYWZFRUl6K2Vy?=
 =?utf-8?B?WURGK3gyc0pLK2Fqdi9XZVZpSHQzWk1QN0twMHFsVmxuOHltOVBFSXVhSDRo?=
 =?utf-8?B?ZW1ZKzU5TitrNllFZXpJNWdPaEtrVnFXVkh2QnB0amVvWE5DRUdzK29BS2kr?=
 =?utf-8?B?M0NkZG9SNUxLMTNqaGhHZ0xBYmJURGsxaHQ0Q0gyVFlYSjFFMkpuSmYyOGlG?=
 =?utf-8?B?WGh1RmxwMmR0N2JHcGRoV25MNTkrWlU0OERzemVmc29MaUJRYVdLRFp5Slps?=
 =?utf-8?B?R3ZhVlpqUm9KZDhvVHpvenVUeHV3S3VDSEhIelB2YmxzeVg5Y0ZqTStkUUR3?=
 =?utf-8?B?ZWpZNHpieGFWbXFPMU5NRGx1amdEbnZoRDFlWVI0MTkvbG90dXdXRVJGM1lh?=
 =?utf-8?B?OGNqeHFvckRCODVENzNNZnN5eXFvL1hIZzc4c0IwMmx2LzBwdkR2MjVJQ2Js?=
 =?utf-8?B?R2Q3dzRKY3lHT3F1R2twZ0xlbGJTZHB5ZWJPZUkycnZxc3FiaHBLalNZNTF0?=
 =?utf-8?B?WEg5cEErT1crMVJZMWZNY1pLNkxPT3IvZFhQL3NCbnAxbGtzNkhpTTk3eVpF?=
 =?utf-8?Q?8PGRJrbAaa2R6l+IBnnRQsAw1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbb8386-d466-46ef-9f48-08de0a69873a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 15:02:29.4498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8xzkKb3SDj2SXArHckLc3DY1dHgXHKgZdZrLeK6pD9ZEVRwbEBT9kWY2DOauvvY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6475
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

On 13.10.25 16:48, Ruhl, Michael J wrote:
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Monday, October 6, 2025 9:47 AM
>> To: sumit.semwal@linaro.org; linux-media@vger.kernel.org; dri-
>> devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org;
>> simona.vetter@ffwll.ch
>> Subject: [PATCH 2/2] dma-buf: improve sg_table debugging hack
>>
>> Instead of just mangling the page link create a copy of the sg_table
>> but only copy over the DMA addresses and not the pages.
> 
> This made the issue obvious.  If I abuse this now how will I know I am doing
> the wrong thing?

You get a crash when you try to to convert a page link into a struct page pointer and then access fields in that struct page (the pointer is NULL for most entries now).

>> Still quite a hack but this at least allows the exporter to properly
>> keeps it's sg_table intact.
>>
>> This is important for example for the system DMA-heap which needs it's
>> sg_table to sync CPU writes with device accesses.
> 
> So the mangling actually breaks a usage?  I thought that the usage was incorrect...is
> the dma-heap using this incorrectly?

No, dma-heap as an exporter is using it perfectly correctly.

The problem was (or rather is) that some importers turned the page link into a struct page again and then tried to modify that struct page, e.g. grabbing references to it or similar.

That turned into tons of problems when the exporter used device private pages and didn't expect that somebody messing with it.

The only property importers are allowed to access in the sg_tables they get from dma_buf are the DMA-addresses.

This patch here is a first step to replace using sg_tables with something else like xarray of DMA-addresses or similar.

Regards,
Christian.

> 
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>> drivers/dma-buf/dma-buf.c | 68 +++++++++++++++++++++++++++++++-----
>> ---
>> 1 file changed, 54 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>> index 2305bb2cc1f1..1fe5781d8862 100644
>> --- a/drivers/dma-buf/dma-buf.c
>> +++ b/drivers/dma-buf/dma-buf.c
>> @@ -828,21 +828,59 @@ void dma_buf_put(struct dma_buf *dmabuf)
>> }
>> EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
>>
>> -static void mangle_sg_table(struct sg_table *sg_table)
>> +static int dma_buf_mangle_sg_table(struct sg_table **sg_table)
>> {
>> -#ifdef CONFIG_DMABUF_DEBUG
>> -	int i;
>> -	struct scatterlist *sg;
>> -
>> -	/* To catch abuse of the underlying struct page by importers mix
>> -	 * up the bits, but take care to preserve the low SG_ bits to
>> -	 * not corrupt the sgt. The mixing is undone on unmap
>> -	 * before passing the sgt back to the exporter.
>> +	struct sg_table *to, *from = *sg_table;
>> +	struct scatterlist *to_sg, *from_sg;
>> +	int i, ret;
>> +
>> +	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>> +		return 0;
>> +
>> +	/*
>> +	 * To catch abuse of the underlying struct page by importers copy the
>> +	 * sg_table without copying the page_link and give only the copy back
>> to
>> +	 * the importer.
>> 	 */
>> -	for_each_sgtable_sg(sg_table, sg, i)
>> -		sg->page_link ^= ~0xffUL;
>> -#endif
>> +	to = kzalloc(sizeof(*to), GFP_KERNEL);
>> +	if (!to)
>> +		return -ENOMEM;
>>
>> +	ret = sg_alloc_table(to, from->nents, GFP_KERNEL);
>> +	if (ret)
>> +		goto free_to;
>> +
>> +	to_sg = to->sgl;
>> +	for_each_sgtable_dma_sg(from, from_sg, i) {
>> +		sg_set_page(to_sg, NULL, 0, 0);
>> +                sg_dma_address(to_sg) = sg_dma_address(from_sg);
>> +                sg_dma_len(to_sg) = sg_dma_len(from_sg);
> 
> Is the indentation correct here?
> 
> M
> 
>> +		to_sg = sg_next(to_sg);
>> +	}
>> +
>> +	/*
>> +	 * Store the original sg_table in the first page_link of the copy so
>> +	 * that we can revert everything back again on unmap.
>> +	 */
>> +	to->sgl[0].page_link = (unsigned long)from;
>> +	*sg_table = to;
>> +	return 0;
>> +
>> +free_to:
>> +	kfree(to);
>> +	return ret;
>> +}
>> +
>> +static void dma_buf_demangle_sg_table(struct sg_table **sg_table)
>> +{
>> +	struct sg_table *copy = *sg_table;
>> +
>> +	if (!IS_ENABLED(CONFIG_DMABUF_DEBUG))
>> +		return;
>> +
>> +	*sg_table = (void *)copy->sgl[0].page_link;
>> +	sg_free_table(copy);
>> +	kfree(copy);
>> }
>>
>> static inline bool
>> @@ -1139,7 +1177,9 @@ struct sg_table *dma_buf_map_attachment(struct
>> dma_buf_attachment *attach,
>> 		if (ret < 0)
>> 			goto error_unmap;
>> 	}
>> -	mangle_sg_table(sg_table);
>> +	ret = dma_buf_mangle_sg_table(&sg_table);
>> +	if (ret)
>> +		goto error_unmap;
>>
>> 	if (IS_ENABLED(CONFIG_DMA_API_DEBUG)) {
>> 		struct scatterlist *sg;
>> @@ -1220,7 +1260,7 @@ void dma_buf_unmap_attachment(struct
>> dma_buf_attachment *attach,
>>
>> 	dma_resv_assert_held(attach->dmabuf->resv);
>>
>> -	mangle_sg_table(sg_table);
>> +	dma_buf_demangle_sg_table(&sg_table);
>> 	attach->dmabuf->ops->unmap_dma_buf(attach, sg_table, direction);
>>
>> 	if (dma_buf_pin_on_map(attach))
>> --
>> 2.43.0
> 

