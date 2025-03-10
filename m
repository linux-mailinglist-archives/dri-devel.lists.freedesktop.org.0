Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F33AA596CC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:56:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8086410E293;
	Mon, 10 Mar 2025 13:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O+vEBaS5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEB010E293
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 13:56:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD2ead+Ke1K5wSJ43gsNvynbt9hp/LZYleVXydXkLDS6oCjfw/wrySAhcp8Icf5vEvopEeWc7C4ExHEfjQSRGM/rRv/wINia87qtsmQDEqnlmUuX84JvZI7qV18in99RurRR0qDAaNPzy16O4F7d/6CUk61BoOOWtaEdBY0tK13FiQ9eYcI//QzeUOaVg4WYzgEFFwt9bOkwbfUIpYqIIjRyJnbZSut5mrBfeutTPf+QrnZLsyI4KnT2XuPHQwil2UTA8xjZ11tanZZlVUAqiqs75xxRlhsNZ0wvdPWgDZqR0iwkzfeQZO4gS3eTDcH+xeRm/YS6yWV7Pl5DrKfAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9KALMJltXF0fYgk3JRe+Aj1UR9rNIWHDzxHphxdVQ4=;
 b=HV/Cab+0xLoc+gtj2Wbw6kK+898seVfw6klNyXMXVPSEvWVEgCdgqNfNz/wwXKyPUFfUaODy4v3nAoCYGn1PtFQ3k+/6Z+9Tu5lK2cKwXlBt6sEzoGVtePhio3+akfwPA+uehJES7I1uRBeb1ydYfKOdrm4V9T2QjW9sxSFPXzrXyyNJPORXyYJBeaHBzFYvsat+wB+Q31beL7mGEGef0JzxNLVafTiz97i+hnbcbfC2PnYxewoYzO+/NBxyClA7Gc6SfmAUPrTKCkgD4WkAcLmsNYPxvhmDWCJKTvecJT9FrumExBLGmYzW3EgLsvoYXV2SJNM1mucd9w3s+bq8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9KALMJltXF0fYgk3JRe+Aj1UR9rNIWHDzxHphxdVQ4=;
 b=O+vEBaS5w9YmWLsDH7ILJKGNxcOjcBWsbzpX9QKrC4tKeo3NUAsBR4jEGl3qGF1STn3Og1pgSR3yJzbFM+pNiQGVu8hSpWZIRKmOGK9VE9O798PRzcugpLJ43+eGVL1c2PHnIvEXVxMqX9ei58kXh6ArOVhqTwwI+cKPZrggDbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 13:56:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 13:56:30 +0000
Message-ID: <d78c8f6a-7487-46ac-a5ab-3a36fea31e2c@amd.com>
Date: Mon, 10 Mar 2025 14:56:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm: Provide a dedicated DMA device for PRIME
 import
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 admin@kodeit.net, gargaditya08@live.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org
References: <20250307080836.42848-1-tzimmermann@suse.de>
 <Z8r1Ymc0RzoHEUpG@phenom.ffwll.local>
 <864f2d0e-083e-480f-b15a-263ac5f11360@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <864f2d0e-083e-480f-b15a-263ac5f11360@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: ca278aff-f7b3-462e-3a0c-08dd5fdb5c22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmQyQ1JrTUEra1JDS0lFTG0xOVFLZGJHRTQ2UjdUQ0xCUVoxcDA1QlRzOVR2?=
 =?utf-8?B?QzFpMkVMOEF5TXl1RTI1RURoWlYrY3B3dzJxVmRRcVpNajI2SXpGYXE3ZTkz?=
 =?utf-8?B?bXFJU0c4UEJ4V3cveXNVSzRWMkxDNmF6aXYyOEhxRzZYVmx0U1NtOEw0MVBQ?=
 =?utf-8?B?Z0xKaE9uaUlBUWRkN1F1NWFNUXZGYkc3M0ZaeGlVd2x1OHpaTHIwOEM0RUNw?=
 =?utf-8?B?MnR0S2FOcUl0WS8ydUlWdi9FQnZpVlhia3RrRXZGUThLSmJvUGRhZUdZbkp1?=
 =?utf-8?B?QVhabHgvZHRROFVuVlUrZVhIbFhSNWtWVnQ0WENDb2hBQ21lY1ZaTGxEMGd5?=
 =?utf-8?B?SVNqaWdWNTg0UU92eUEyT2FYSjNBMTIxMFlZR2JkMERFWGttMzl3QjdnQ0Vr?=
 =?utf-8?B?RzhLYXlBYkR5elNzV1NsNDhiUmJsekxySTgwMDdRWEtkUFBkdHZ6K2NteW03?=
 =?utf-8?B?M1dkMEdkVGF5SHZoUkV1OWw0RWN5bkVGdUtuNDY3T2I5RWtQOHZXcnBuWTA4?=
 =?utf-8?B?NUswU3ZuMlphR0hGSFc5MkNic05mdjlUbGRlczF2dzlaSFIza2ZSaHRKa1ov?=
 =?utf-8?B?M3dlMTdMeEdtMndTOVg2L0cvbzZVeUF1cUxEbnlGRGZaTWxla2RjVGwzQlVJ?=
 =?utf-8?B?UC91dFdPcUFMQzNpZVB4eWNkOWwwNjRBM0IrN2ZRbHhhY1NPMWFHdXRqb3Zw?=
 =?utf-8?B?b1FEWS8vR3h6dHVOcTgzNHFnMjl0akM0Y3h3ekZBTlZiWENyTGdKaVFabTBC?=
 =?utf-8?B?ZzBIUlljZ2w3a2VSY3N6MUZDYUt3enZjaWFySjVEdnBhb3hkS0FzVVh5OE9C?=
 =?utf-8?B?b2hNakE2c0tXa3VEMWxGNWZOWXdoR0dtT0RJKys1VE9ZSzBpR3FlcytEM1ZK?=
 =?utf-8?B?RFpoaWFueWpxRXc4bkMyRjhFeWRhb2x1RjZ0bmJuSms5aks0UVZPdVJmOVpl?=
 =?utf-8?B?TWlaNlp2Zzd3RUVZclE5RE1UeTNZN2tUUEFDR0lKQ3F1eTBvekZhUlJBUXN5?=
 =?utf-8?B?YUdJWjRGR3B1QWVwb3FkbXRkZk1jY2QwVzlKYklXTVhtdDYyQWdrWWlBOEdk?=
 =?utf-8?B?SGhvN1NGTTNoZzRoWE9XcEtJQ292TUYyT1FSdWwrNU9mYUlKcU5rWmp5WnVG?=
 =?utf-8?B?dGc1WlJ3RDV0WXlQeHk0MEI4WTZHc3dhSXdBTXNkOHU3RUZ4ZFBuZXltem44?=
 =?utf-8?B?U2MvQjFjbzJ5UDZWVnNLSWE1WFVzaytvS2ZSVHhuUFFOb0N5aVVMVDdyOExH?=
 =?utf-8?B?RVNDbzBVeHBEOStOQ0tQaWs4a2dqWlhnN3k4eGdjdDhMMWFaNGE5bG1uVWZV?=
 =?utf-8?B?SGdEdWYrdXV1ZWhqQ1dpWGkrbG5VYkpLSzk3ak5IY3NMRnZZdldHT0dudnBG?=
 =?utf-8?B?RGJVZldLc0J3ZXkvb08xeENNbnlIcUh1ZEl1ZDFVbnBJUGhBdE5Eb2MxdHBw?=
 =?utf-8?B?M1o1c1F5cGxVeHpsSCtBZmxlUTI0Qm5xS0l5WmJzNGxXREEyeGQ1L0FtQmFu?=
 =?utf-8?B?bWpRWVZxbHFHcisrL256ZHJId0ZnQTBpQUNkTGh4Rjkwcy9NTHluaHgzakU1?=
 =?utf-8?B?anFrcldMSVdmL1ZocHJrdjh3RHBKU212U09ldENJbU5SdVRxSzlNdUFnN3pG?=
 =?utf-8?B?em1ZbENFQVRvcHNqUmZiNkJJQ2dXM3llb3RNb21qbzdLUGsxY3p5b295ZVNH?=
 =?utf-8?B?SkhVU2cwTDhERDdzTGpncjUvK3ZFRWJ2ZldSd3VpTnpWZWdmNldDcDdnZlFO?=
 =?utf-8?B?djVHZTI4U1ZKRUg3SGVUWkZxNXRpUmVWdURoQko2dE1IdjFEVkRhdVpNemZN?=
 =?utf-8?B?TEhhZUV5WWQ1RWZzN3RpR0lQOHZTU3V6N1NITVp4LzRaUDA2emRSaXQvTkRz?=
 =?utf-8?Q?YvSUvmQgNaKZ0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEVJUVptZzdBaWVQOTJMNG93dGpMNmpKcklkVllTLzBMd1pOYm1UQTd3OUxu?=
 =?utf-8?B?S282blZoL2IrQit2WHhFN0VjdmlzM2JLT3dIS2NpMkcvK1RoWlF2bUc3MHNF?=
 =?utf-8?B?K3Rmd2RWRjV0bHpiY09paEFRS0FxMVE2b0pJZ2pkbkRLWDA4TElEVkFmQlMx?=
 =?utf-8?B?bkh5cGpIY1NOc2Rxd0VYbE53d1FDY29acGtOU0VwT0w3QXRvMU5sTTJXSldC?=
 =?utf-8?B?eE92NGZ1UFYzcUtNV1crV1JnL1dqdmQ3Z01zd0dGMldzb3NINzZ1MU1BK05F?=
 =?utf-8?B?Tk9QTkh4bk1qNlhmMVRGdmNaazByM2grcEpxdm04dHhXODBIVnJ3SlVQN3Ji?=
 =?utf-8?B?dUl6VTVCTjB6dFlaTWUrbjhuek5mdjN0aG4wcUxuRm40OHJ5c29vM0xseG5K?=
 =?utf-8?B?TU04S3N4d3dBOS9VeWZ5VGw4RGZ1K0VLSFA4Y296a1dBODNDcTVaYTVaZEFk?=
 =?utf-8?B?UzROd3ZXUVFqSGRhbFFIUjlSRW5QZk5UNEl5dHJQeGVPVnNQbTB6QVZWdU5p?=
 =?utf-8?B?b25ZZy8rWC80MnE1OXdOQzNwUVV6bElCNURrTGRKZ3phelorRWdZOURyVWY3?=
 =?utf-8?B?OTJmQ0pSak54bGZ6VkFEUHVQQmJ5OFdPYW5vbXByRHQwMDI1RXpUazJpMGV0?=
 =?utf-8?B?L0hFQm5NV0U4V1hJT0JOOUY4Z29ITDRXNHFCZGhyK3FER0FYdUpxSStveE1W?=
 =?utf-8?B?SnBHUTdkRDI1V0xtTG5ZRTBNeXNDbnF4SEZUMFpyVEdoWjEyYWtkK1ZYV01Y?=
 =?utf-8?B?bmpzK2RkTzRISUdzUk5GQTFzM0dEYUlweXlvUWlXL2NlZ0ZLQ3lJVFJYcGQ3?=
 =?utf-8?B?b0J2MG1JWGM3MnZUaG9tc1JFdDU1SkpBT1Y0ZzRySXg2UnBWUytlR3hWK0xL?=
 =?utf-8?B?TlFEVGg3ck9TTmE5ZjJ0UlRzc0IyWU42YzdyY1VCZkM0WUtmTkwxMzVEalpl?=
 =?utf-8?B?bGxEMmNZS0J5VWo0bkZ0WHdFSHZlSU5iMnBaVzMzS3NMN1FVRmhUSU84ODlL?=
 =?utf-8?B?T2RRK1dIeVFWQzZiSUt5MkU2K0hFMFlmbDJqUkdkN2VnSy9CNVZFUnBCR1JE?=
 =?utf-8?B?c1h3L1E0cEoyMHdNUWkvNUFpNSs0WjR6aEp2aTBhRTlVVDMzRXlOQ29JeS9K?=
 =?utf-8?B?MUdSUmp4K3lrYS9lUlN0QnhvRTg2VzVrakVVSlN6TGc3NkYxMHFxODQyL2hl?=
 =?utf-8?B?dTFtODFwYlVDUkFRdTl5ZWJqMXd2RFpDUzVhK3lHK2o5bEo0TThITW5TT1B4?=
 =?utf-8?B?V2NlblBZaTZpbktWMlNMUHdMSVRTRzBmVVBFN3JlWkt3K1lpeXRDMUNCTElz?=
 =?utf-8?B?OEtKNWlMT1FESERsR0tPMjRrTThuYUlRc2d0TEsxa0lidjRMYTY5UVdVN3o4?=
 =?utf-8?B?ZGYwWVVNUTVlV0lLaUJLY2Zhc085TGZsbzUvRWFmOS9NUzBjSHpyWDQveUVY?=
 =?utf-8?B?dEJiMzBoZlc1MS9RMGdPZ1hmNU9oR0h6Wm9ZN2FWK0hnUFpqbERHYzF4ZVZI?=
 =?utf-8?B?d1lhWWJFcjhlcHV3dytBMkNOeTRjZFFDK3VpQU5KaEljRGsycUZpY1A0ckVV?=
 =?utf-8?B?SnZJTWlpbzFmUmtzQjBQU3NtWU5RSVJsd3ZQNzNySTBPOWVtR2lYUjBOWFVn?=
 =?utf-8?B?QVY2NlZOdmFKSWJxSDdNVHRzV3BQeHA5UHJ4c0wrN0kyU3VvYTlVcERrbnFr?=
 =?utf-8?B?VGlpSXN0ckgyTUVRRWhhd25oQTA1TjBDWjRYajgxTnNVVGUySmQrUVBUdWNr?=
 =?utf-8?B?YlF1aTdCTGxFclR6WXpFekZNM1kyTit6Ly95bWwwcWhtMmdLc1krTGJUeDJn?=
 =?utf-8?B?NVY4bGxCN2pabXhZRVlaQjlvRmwwd1VydWpQVmJtU0dpMUh1YnVaT05nZTRF?=
 =?utf-8?B?S1IxZUZ6ZEc4T0MxcGl4Q3hmTWwrQmF4TmxEOWYrNmx5bHRBVFpMenorZE5H?=
 =?utf-8?B?OHRpdGZkWGpkYjViMWpTQytJV3BEcHVHL0svZXE3dnB2bktBS3laK1VOcWpk?=
 =?utf-8?B?TjYzUWR2TmdFZ1prdDJtUTFxR0tsNjgzeUFZTXVsRlcySGFpT0lqUnNHVGdi?=
 =?utf-8?B?emlxelVJZTVLTC9oRnRKSEpIQS9BZkFGd1R0a3NxZC8xOE1CREVpTkFiYjk1?=
 =?utf-8?Q?tsxjpA4qwR9sXecWrjM5jpH+M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca278aff-f7b3-462e-3a0c-08dd5fdb5c22
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 13:56:30.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJTioXtRjoqVUoXxyB0+UyxwPPBdtJjIq3NC4ZJA8rIsfWyhUZiV4KiyBIxdOYq3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603
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

Am 10.03.25 um 10:50 schrieb Thomas Zimmermann:
> Hi
>
> Am 07.03.25 um 14:32 schrieb Simona Vetter:
>> On Fri, Mar 07, 2025 at 09:03:58AM +0100, Thomas Zimmermann wrote:
>>> Importing dma-bufs via PRIME requires a DMA-capable hardware device.
>>> This is not the case for USB, where DMA is performed entirely by the
>>> USB controller instead of the USB devices.
>>>
>>> Drivers for USB-based hardware maintain their own workarounds for this
>>> problem. The original idea to resolve this was to provide different
>>> PRIME helpers for such devices, but the dma-buf code internally assumes
>>> DMA functionality as well. So that ideas is not realistic.
>> So dma-buf without dma is doable, but you have to avoid dma_buf_attach.
>> And that is a lot of surgery in the current prime helpers, since those
>> assume that an attachment always exists. But dma-buf itself is entirely
>> fine with cpu-only access through either userspace mmap or kernel vmap.
>
> Right. That's roughly how far I got in this direction. The field import_attach, set up by dma_buf_attach(), is currently used throughout the DRM code and drivers. Hence this series and the other one that replaced some of the uses of import_attach. Once this has all been resolved, there will be a few users of the field left, which might be uncritical.

Mhm, if I remember correctly the DMA subsystem used to use the DMA mask and other parameters of the parent device when a specific device couldn't do DMA by itself.

I do remember a lot of discussion about that for the DMA-buf tee driver.

Going to read up on that once more. Could be that this patch here is not really necessary.

Regards,
Christian.

>
> Best regards
> Thomas
>
>>
>> I think as an interim step this is still good, since it makes the current
>> hacks easier to find because at least it's all common now.
>> -Sima
>>
>>> Let's instead turn the current workaround into a feature. Patch 1 adds a
>>> dma_dev field to struct drm_device and makes the PRIME code use it. Patches
>>> 2 to 5 replace related driver code.
>>>
>>> It will also be useful in other code. The exynos and mediatek drivers
>>> already maintain a dedicated DMA device for non-PRIME code. They could
>>> likely use dma_dev as well. GEM-DMA helpers currently allocate DMA
>>> memory with the regular parent device. They should support the dma_dev
>>> settings as well.
>>>
>>> Tested with udl.
>>>
>>> v2:
>>> - maintain reference on dma_dev (Jani)
>>> - improve docs (Maxime)
>>> - update appletbdrm
>>>
>>> Thomas Zimmermann (5):
>>>    drm/prime: Support dedicated DMA device for dma-buf imports
>>>    drm/appletbdrm: Set struct drm_device.dma_dev
>>>    drm/gm12u320: Set struct drm_device.dma_dev
>>>    drm/gud: Set struct drm_device.dma_dev
>>>    drm/udl: Set struct drm_device.dma_dev
>>>
>>>   drivers/gpu/drm/drm_drv.c          | 21 ++++++++++++++
>>>   drivers/gpu/drm/drm_prime.c        |  2 +-
>>>   drivers/gpu/drm/gud/gud_drv.c      | 33 ++++++---------------
>>>   drivers/gpu/drm/gud/gud_internal.h |  1 -
>>>   drivers/gpu/drm/tiny/appletbdrm.c  | 27 +++++++-----------
>>>   drivers/gpu/drm/tiny/gm12u320.c    | 46 +++++++++---------------------
>>>   drivers/gpu/drm/udl/udl_drv.c      | 17 -----------
>>>   drivers/gpu/drm/udl/udl_drv.h      |  1 -
>>>   drivers/gpu/drm/udl/udl_main.c     | 14 ++++-----
>>>   include/drm/drm_device.h           | 41 ++++++++++++++++++++++++++
>>>   10 files changed, 102 insertions(+), 101 deletions(-)
>>>
>>> -- 
>>> 2.48.1
>>>
>

