Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A60A94EBDD
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 13:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6426510E1B0;
	Mon, 12 Aug 2024 11:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g2a5QttJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8097C10E0CD
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 11:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pmLdnUzf2SejL25jStLQFbafKW0h5q7+7Ex6s/I6MSUQPEZaA7CvuxjMP2SksR21Nqj7ZLPnlzkIsnWRVKnOkv/IGoQfdWXFBGxQOppCpq8Z417zKy/ZXmdQm/YV/5dz7NoGUrtzxH3oCHGHr2NRMRG9AaazUEhBYONuKcTEmWxIYT/MUSjQiRudwAZpV/G0ZU7OqF3qRxHKVZBbZROMuWm+xbp2hOwy5LZ4yWBrkJ2CsNjhbRkRBG29Ae+ptcOppxj6SfyzcJel8idLsMnfGoj0r3HXD//Q+EHg4HfPVzYxeoHPfzMJnKfWrP+dqhEI8pJFkNQm/8O6iew6iVAczw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1OHwEPZKHmte4QnTXcCS8h1dKW8DuONIY4cromOH7I=;
 b=EJ0yPxQk9TdO5bhU8pL/QzaRe68tgsttIZJx0lVAYAhFx3blRQ6J0kzfAyY+pYxucxUnVZo1iVApdq5aKyGfK8BArU0OI2amU/tJRo7r7QVOhyvDh8Bs0lH/QONC/SS7J12s0XagjwDqnNkBWYbkwMg4pgxJLbDmnFec0YAvT8WPzXRz1+1kLxAlrqPRlCK400MLRfZPN7FTC9VHDQ4USd9nvRIFiqoj8Mg6CxtlZ5gL8plUbFBJmUV5D7S5OAtYpLyohy3ztNzau2ijHLwRssmtoOfy1D14IjqntN1fBM97Bv1cjg2MQ1ML/blNQA80H2Mk8DFQkRoPiYfqR3HqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1OHwEPZKHmte4QnTXcCS8h1dKW8DuONIY4cromOH7I=;
 b=g2a5QttJiggR+0m/KLmAtbFYxmkG7/2uEcAhz18Qi74giU6QNglluve4/NSjguNRh8mgAjvBj6Or8TX9rO+paQpVhSgyAHgRGZjJY2h/C3M/Dw393pkvWiv2358dHv6u8Z5rZHQUJlQs38H2PNt7LWiYa1UMOWnd8yzCdrultgc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 11:33:14 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 11:33:12 +0000
Message-ID: <d08af207-22f9-478d-bb17-28029338263c@amd.com>
Date: Mon, 12 Aug 2024 07:33:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/edid: add CTA Video Format Data Block support
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
References: <20240731214941.257975-1-hamza.mahfooz@amd.com>
 <87sevowv97.fsf@intel.com> <97fc4462-b1b7-4fff-9901-15c8db56fc21@amd.com>
Content-Language: en-US
In-Reply-To: <97fc4462-b1b7-4fff-9901-15c8db56fc21@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0346.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::16) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 608e10ab-c1c3-42b3-ab8f-08dcbac28c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZktKeTAxcklYUlZDWjkxRWZyTHJ2cGR0RFdSclBmTUpHRkU3NTBXZFAwOFVK?=
 =?utf-8?B?ekt0NWwyaXdUK05UMElXL0pPdFJxa2JSRHFlUERHQUFiUVhUS3pQaXl2U3U2?=
 =?utf-8?B?U0VPMzc3dDQ0VVp3Vk9PNlM1cWMwZi9tNEdvQlFzdDlwaFpGL0p5aUxoOTR0?=
 =?utf-8?B?bXY4bWlXd2RnaW5DdWhzNnA2NEVGUk15MnFNU05ZYWRCZnFzZnlrNWFjRlpL?=
 =?utf-8?B?RzRQcjYrRlo5RVdCNWlVRG9yb3c1SE81OFJWUis0Q1AwUVhXRUJ4Slo0OEpo?=
 =?utf-8?B?aFZHanZXMS9Gb0xmamd2bHRwVDlKM1ZORXVCdDVLL3VIQzBYTWo5TWR5M2lX?=
 =?utf-8?B?THBNeUp4RUVLdFdaRGlDT1BZaEpoZ29OeFZsaDQ5U1JRNzE4Qm41c0VSc0M1?=
 =?utf-8?B?bklmNkNOZldoMGpFUUVMNFVpVmMrdE9yaFIrM1JQUm1HT3JvT3AvcW9uNnZS?=
 =?utf-8?B?UTBUY3RkeFc1TzFyV2FTTExsTWhUOVljVmhBM1dKNHZkMkRIblVWN3BUN2dz?=
 =?utf-8?B?Q2cvSHJVZ09YNmxOdE90cnlrM09SSHR5cXFOYjJienFxelhTT29ydUZQQndk?=
 =?utf-8?B?dDIxeFBjcjZtbDRaN20wRWFoUVV5bUdQejZnN3M5a3pUWHRhbU1nd2NrMUVD?=
 =?utf-8?B?TmR2Snk0VmxkQ3NFTEtSMitlMEJ6OUZNWmhDWERQMjBmdi9LbVJnV2lCT2VW?=
 =?utf-8?B?U2wvRHZXZnBSUVRMVHhFZmhESVdDak1VYXpmQ1pzdEJqN0JqR25SeUZaNWFj?=
 =?utf-8?B?TXM1bjhFczB1WmxWcFhqWFFlTVhlck54Y0NvNlVSMVBUZVdDRkMvUzM2NlJm?=
 =?utf-8?B?WTdCc0M2WHFDd2lSV2g3bFU0ZE16bHZaa21VNHUvbXpaMlJjQXZVejVyV1Zy?=
 =?utf-8?B?aWttZTE2M09hOFgvVEpIaEF0NFpsN1ExakVzVG5lWmVQby9HVlk5TVpBLzJJ?=
 =?utf-8?B?dEFrbU5kUFZ1ZVNDbnJMTmNXMTlxWmNiYUNrS3RsdUxqaEQwTFV1b2ZXUzZI?=
 =?utf-8?B?KzM0YjB3Q0lodldqUEFPT2FncE10ZDNncSthYUZJWkhLbm5TbWdHWnlwU0M3?=
 =?utf-8?B?dUcrZTgrOTFMOUxzVzdrc08wS1VWNloyT0pPTVJxUVdKVGVqb0hKT0FIYTZX?=
 =?utf-8?B?U0JtbEZYZzFOVElha0RwT1BEcGNFSG1DZ2NKdW9jK3ZKaGdmS0ppNWYvSmdE?=
 =?utf-8?B?WmpjTXpCTklNRzFVUENkazEza3p3NitON2hBc3BDTHZBVTVYaFNrQW1rNjFX?=
 =?utf-8?B?UUtvYUt2cDhkbUp3ZS9DbFYxUzFRUllwWkZROWplNHZ4bU5LSFBzMzBTbGto?=
 =?utf-8?B?NkRyeDZSWGp0YU1RcGRuT0dMaDNmd1FGN2o0WHNtRkh4VXBtUjl1SVlCU21T?=
 =?utf-8?B?L2ZXbXphNW8yOVpOUU5PMjZreHo2eHNMSnN3eDR3TC9jWisvUStEdTQ4Mnd6?=
 =?utf-8?B?WlgzYWZnb1BmRWJyaGNOaDNEYkM5WTh5VHpSQjBMZmhjR2wzMnphYWhrbk9B?=
 =?utf-8?B?VXFtUlhsSjhveGJUZm9BTmhLV0wxTDVIVWgxdEtMcVBvWjdJSzJzUFZ3Q1RU?=
 =?utf-8?B?UStWQ2tWcU9qOXlCMEVLYTg0MFJZdGhIMEhGeXQ5S04yQWppNmgyUGZRdWg1?=
 =?utf-8?B?NEVBcUI3cmVLZ2U4VHprMmJNMUVDRkFDZDUwWDRvRFltSGpiTVZxemJEMUdV?=
 =?utf-8?Q?lPXb3u7VxLGDQqPQvV4P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmpyUnR0cFBoMHM0L0JYWU41ckVNdlFZS0RlWGcxaDh5eGg3UDFGUWZ5T3N3?=
 =?utf-8?B?QnFjb0VjeFNFaXhpQ1lkZ0dYdEdjYkZLSEpvdytHaHBmd1g2eEE4VlBLdnd3?=
 =?utf-8?B?R1pJN3hXMGRnTDhzUnlENDNFNm1RRkVEQzgvVFdQbmdTTVFrUFNWN3RndWN6?=
 =?utf-8?B?UzJQZ2xqbXRBbU5DM3J4NndVemk3OUNuQ2lGTXZRZ3ZtSVk1c2dlTGNJNG5U?=
 =?utf-8?B?a3FqWlhUTTJpcVE1NEtRWVFGcmJoY0lJZEE3eVI0VUkxZllIenJabDRzTmdP?=
 =?utf-8?B?bi9XeEhIa1p3SGZEVHFSbHJrdmJTNm1pbmFCZS9Ib0tlTkRYcXc3RW5BYjhs?=
 =?utf-8?B?Um02amtUK0REOWF3RXM1MXdSZDF4MWViaGgwRmVlSjJWdzBxTWttYVB2RlRE?=
 =?utf-8?B?eUxXYlRDL0JSVWtmdWlxT04zL3ZueGRTRkxGUGJtUEo0amgzT2NqaVllYitt?=
 =?utf-8?B?bzRCS0QyQ3Z3dFp5U1RXbWVlMFhnZ0VTUTNyK05oa0dPNit6czJ0T2cvQ0lD?=
 =?utf-8?B?WndUUTdZOGJQc2NpYVh3RldJemZOLy9sQzFva0p2R2d2TlFaQUhPdkg0anIr?=
 =?utf-8?B?cHhwTnpzV1duOVZ3SElWY25DeDNoMUI3NnYvby9NbTd2UktkdlRnaTRsQ3Ix?=
 =?utf-8?B?Sy9VbG9UTDVhbWhwdlRoQ0tGTkg2cFJkNWY2SUFpL0dPYXRIcVF0ZTBRQjBt?=
 =?utf-8?B?NkxzMGI1U3FyeG9PQy9zc1ZBNW5EbGF2R2xjbjMrOWdGSTJpRDljajh3d21w?=
 =?utf-8?B?SW4yUlhsbGs2WWRxcFQzMDQzSHBiUTZHTU1JV00veW5yQjlUT3ZwZERiSUJo?=
 =?utf-8?B?ei94NldjU05VQmcwV3o4Mmp4ZW9sYXdxNWFwNnd5cUtHTjh0V0NTR0F6WWY0?=
 =?utf-8?B?TytwOVFta0k5eHd3Q0NDMUdLYlE1a1gzaURPMVBGUmNnMDdiTFF4MW53YlVq?=
 =?utf-8?B?YkQvSlZiS2NWWUxVVVpLRndXUUhONXpqWUdrYlZJWG85cm55aFNxRmx5eUtN?=
 =?utf-8?B?TURGV0RRSCtoRk94NVJpT0RKbjBSR3ZDS1hTNjg5K3hoenFaaTR6T3ZMdWFk?=
 =?utf-8?B?cjFKMEVzSks3TlI0dU91VmJIVklQNEZDMGJwbDA2OWRYNm1mVnJnQkNVaW96?=
 =?utf-8?B?NXFiekxRK3BFTkswcHBUWDVsS2kzSXpnZTlBVXIxa3JqWnN3U0VDQ0JhTzZG?=
 =?utf-8?B?enArUlA0eXBJQ2N2Tk5BcUVTUGdrTVp1Zy9RMjVOZFFhUFhJYkVWQmsvN1I3?=
 =?utf-8?B?U2IxT2gzeDRTNVV3dWMwbE5yYlcrZ1RMVWZ6c0ZqMTQrY0dtMzRvanRReTF6?=
 =?utf-8?B?c2IxV1RMWmIzbkNaUEN0T0pRT3YzOXhNaEx3bjdSWkJtdWN3bER1N0IvOXNS?=
 =?utf-8?B?N08xL2pLQmFud29zRHRwOTNXdWlQZ0lsN1ZpazZZMEk0dXMvdERwVGtPN2NO?=
 =?utf-8?B?dkRQVFIvRnBMWGVweWNjUDMxcHR0YlVNbGJkQXBCcERqRjNSNXNsZS9xVStB?=
 =?utf-8?B?czZGLy9NNTJDQ3lscWc3MWQxalJnVW8zZFI3OGRDUys4UGpGSURzKzRSZ3N0?=
 =?utf-8?B?YUJnTXAzU0tWdlp2S2dNSjJXTk42b3V3RTI5cGFnNUdrenFIYUZQTEdoeTNZ?=
 =?utf-8?B?R2RSTkY2SE1odnVLdUZ0Q1hKUlk1SmlqQUljLysyUUQ3NWJBRTZaV3BvSUtm?=
 =?utf-8?B?Z0FRdGIwTDgrNXVOT01tQ3dhVGcyQkVrQzBRZmFmZFAveldYNDY4TlhNWnhO?=
 =?utf-8?B?YlJ1RlNOQTIyNXNQSnlhdGE4RGVEbW9tb2VsNXNzVWRYU25JV2xkdVBzeGUy?=
 =?utf-8?B?ODRRdHcxWHpJZG5YanU2MFNDTGg1SlNxVEJKcEhFZlJxWWF0QXZkcGpnMHpX?=
 =?utf-8?B?WWJXUHp3bHVyOXJFdlBTeW5RNlR3U3dwcVd1L0JBWDE1STBxNWZWMjhyYk1H?=
 =?utf-8?B?bnVIa2FzT3hPUGFzS3laMVJKNXQ2UzhMNGd1a01wSzRlK0sxc2Eza2tCbHl0?=
 =?utf-8?B?TXhPZjRrTzRPc0NGd2UzZi85TDR4S3ZxdU41ZU5nWDk4dktJV2hSYmlCMDNF?=
 =?utf-8?B?RTgvaXh3VXF0YysydFZhVjBMaXZTeEJVd005bmJwajRsVUtsN2sxVC9SeXRy?=
 =?utf-8?Q?10s80AvPQCa6dSQsggV+McdQI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608e10ab-c1c3-42b3-ab8f-08dcbac28c74
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 11:33:12.3781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGoi3yhvkDWugSpeNFHQraFvTVrYi16srz4fK0uHuKDGLiRN+X6vjKvcwEIEjGndKWdvAZztfRXSLZhSQeIFHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927
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

Ping?


On 8/2/24 11:53, Hamza Mahfooz wrote:
> On 8/1/24 03:35, Jani Nikula wrote:
>> On Wed, 31 Jul 2024, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>>> Video Format Data Blocks (VFDBs) contain the necessary information that
>>> needs to be fed to the Optimized Video Timings (OVT) Algorithm.
>>> Also, we require OVT support to cover modes that aren't supported by
>>> earlier standards (e.g. CVT). So, parse all of the relevant VFDB data
>>> and feed it to the OVT Algorithm, to extract all of the missing OVT
>>> modes.
>>>
>>> Suggested-by: Karol Herbst <kherbst@redhat.com>
>>> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
>>> ---
>>> v2: address comments from Jani
>>> ---
>>>   drivers/gpu/drm/drm_edid.c | 456 ++++++++++++++++++++++++++++++++++---
>>>   1 file changed, 428 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>>> index f68a41eeb1fa..f608ab4e32ae 100644
>>> --- a/drivers/gpu/drm/drm_edid.c
>>> +++ b/drivers/gpu/drm/drm_edid.c
>>> @@ -31,6 +31,7 @@
>>>   #include <linux/bitfield.h>
>>>   #include <linux/byteorder/generic.h>
>>>   #include <linux/cec.h>
>>> +#include <linux/gcd.h>
>>>   #include <linux/hdmi.h>
>>>   #include <linux/i2c.h>
>>>   #include <linux/kernel.h>
>>> @@ -741,6 +742,93 @@ static const struct minimode extra_modes[] = {
>>>       { 2048, 1536, 60, 0 },
>>>   };
>>> +struct cta_rid {
>>> +    u16 hactive;
>>> +    u16 vactive;
>>> +    u8 hratio;
>>> +    u8 vratio;
>>> +};
>>> +
>>> +/* CTA-861-I Table 11 - Resolution Identification (RID) */
>>> +static const struct cta_rid rids[] = {
>>> +    /* RID 0-9 */
>>> +    { 0, 0, 0, 0 },
>>> +    { 1280, 720, 16, 9 },
>>> +    { 1280, 720, 64, 27 },
>>> +    { 1680, 720, 64, 27 },
>>> +    { 1920, 1080, 16, 9 },
>>> +    { 1920, 1080, 64, 27 },
>>> +    { 2560, 1080, 64, 27 },
>>> +    { 3840, 1080, 32, 9 },
>>> +    { 2560, 1440, 16, 9 },
>>> +    { 3440, 1440, 64, 27 },
>>> +    /* RID 10-19 */
>>> +    { 5120, 1440, 32, 9 },
>>> +    { 3840, 2160, 16, 9 },
>>> +    { 3840, 2160, 64, 27 },
>>> +    { 5120, 2160, 64, 27 },
>>> +    { 7680, 2160, 32, 9 },
>>> +    { 5120, 2880, 16, 9 },
>>> +    { 5120, 2880, 64, 27 },
>>> +    { 6880, 2880, 64, 27 },
>>> +    { 10240, 2880, 32, 9 },
>>> +    { 7680, 4320, 16, 9 },
>>> +    /* RID 20-28 */
>>> +    { 7680, 4320, 64, 27 },
>>> +    { 10240, 4320, 64, 27 },
>>> +    { 15360, 4320, 32, 9 },
>>> +    { 11520, 6480, 16, 9 },
>>> +    { 11520, 6480, 64, 27 },
>>> +    { 15360, 6480, 64, 27 },
>>> +    { 15360, 8640, 16, 9 },
>>> +    { 15360, 8640, 64, 27 },
>>> +    { 20480, 8640, 64, 27 },
>>> +};
>>> +
>>> +/* CTA-861-I Table 12 - AVI InfoFrame Video Format Frame Rate */
>>> +static const u16 cta_vf_fr[] = {
>>> +    /* Frame Rate 0-7 */
>>> +    0, 24, 25, 30, 48, 50, 60, 100,
>>> +    /* Frame Rate 8-15 */
>>> +    120, 144, 200, 240, 300, 360, 400, 480,
>>> +};
>>> +
>>> +/* CTA-861-I Table 13 - RID To VIC Mapping */
>>> +static const u8 rid_to_vic[][8] = {
>>> +    /* RID 0-9 */
>>> +    {},
>>> +    { 60, 61, 62, 108, 19, 4, 41, 47 },
>>> +    { 65, 66, 67, 109, 68, 69, 70, 71 },
>>> +    { 79, 80, 81, 110, 82, 83, 84, 85 },
>>> +    { 32, 33, 34, 111, 31, 16, 64, 63 },
>>> +    { 72, 73, 74, 112, 75, 76, 77, 78 },
>>> +    { 86, 87, 88, 113, 89, 90, 91, 92 },
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    /* RID 10-19 */
>>> +    {},
>>> +    { 93, 94, 95, 114, 96, 97, 117, 118 },
>>> +    { 103, 104, 105, 116, 106, 107, 119, 120 },
>>> +    { 121, 122, 123, 124, 125, 126, 127, 193 },
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    { 194, 195, 196, 197, 198, 199, 200, 201 },
>>> +    /* RID 20-28 */
>>> +    { 202, 203, 204, 205, 206, 207, 208, 209 },
>>> +    { 210, 211, 212, 213, 214, 215, 216, 217 },
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    {},
>>> +    {},
>>> +};
>>> +
>>>   /*
>>>    * From CEA/CTA-861 spec.
>>>    *
>>> @@ -4140,6 +4228,7 @@ static int add_detailed_modes(struct 
>>> drm_connector *connector,
>>>   #define CTA_DB_VIDEO            2
>>>   #define CTA_DB_VENDOR            3
>>>   #define CTA_DB_SPEAKER            4
>>> +#define CTA_DB_VIDEO_FORMAT        6
>>>   #define CTA_DB_EXTENDED_TAG        7
>>>   /* CTA-861-H Table 62 - CTA Extended Tag Codes */
>>> @@ -4981,6 +5070,16 @@ struct cea_db {
>>>       u8 data[];
>>>   } __packed;
>>> +struct cta_vfd {
>>> +    u8 rid;
>>> +    u8 fr_fact;
>>> +    bool bfr50;
>>> +    bool fr24;
>>> +    bool bfr60;
>>> +    bool fr144;
>>> +    bool fr48;
>>> +};
>>> +
>>>   static int cea_db_tag(const struct cea_db *db)
>>>   {
>>>       return db->tag_length >> 5;
>>> @@ -5306,34 +5405,6 @@ static void parse_cta_y420cmdb(struct 
>>> drm_connector *connector,
>>>       *y420cmdb_map = map;
>>>   }
>>> -static int add_cea_modes(struct drm_connector *connector,
>>> -             const struct drm_edid *drm_edid)
>>> -{
>>> -    const struct cea_db *db;
>>> -    struct cea_db_iter iter;
>>> -    int modes;
>>> -
>>> -    /* CTA VDB block VICs parsed earlier */
>>> -    modes = add_cta_vdb_modes(connector);
>>> -
>>> -    cea_db_iter_edid_begin(drm_edid, &iter);
>>> -    cea_db_iter_for_each(db, &iter) {
>>> -        if (cea_db_is_hdmi_vsdb(db)) {
>>> -            modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
>>> -                            cea_db_payload_len(db));
>>> -        } else if (cea_db_is_y420vdb(db)) {
>>> -            const u8 *vdb420 = cea_db_data(db) + 1;
>>> -
>>> -            /* Add 4:2:0(only) modes present in EDID */
>>> -            modes += do_y420vdb_modes(connector, vdb420,
>>> -                          cea_db_payload_len(db) - 1);
>>> -        }
>>> -    }
>>> -    cea_db_iter_end(&iter);
>>> -
>>> -    return modes;
>>> -}
>>> -
>>
>> Is there anything that really requires moving add_cea_modes() down? You
>> could just add your new stuff above it, right?
>>
>> Again, I'll reply with further comments when I've tracked down a more
>> recent spec...
> 
> You can obtain the latest (complete) spec from the following link btw:
> 
> https://shop.cta.tech/products/a-dtv-profile-for-uncompressed-high-speed-digital-interfaces-ansi-cta-861-i
> 
>>
>> BR,
>> Jani.
>>
>>>   static void fixup_detailed_cea_mode_clock(struct drm_connector 
>>> *connector,
>>>                         struct drm_display_mode *mode)
>>>   {
>>> @@ -6018,6 +6089,305 @@ static void parse_cta_vdb(struct 
>>> drm_connector *connector, const struct cea_db *
>>>       }
>>>   }
>>> +/* CTA-861 Video Format Descriptor (CTA VFD) */
>>> +static void parse_cta_vfd(struct cta_vfd *vfd, const u8 *data, int 
>>> vfd_len)
>>> +{
>>> +    vfd->rid = data[0] & 0x3f;
>>> +    vfd->bfr50 = data[0] & 0x80;
>>> +    vfd->fr24 = data[0] & 0x40;
>>> +    vfd->bfr60 = vfd_len > 1 ? (data[1] & 0x80) : 0x1;
>>> +    vfd->fr144 = vfd_len > 1 ? (data[1] & 0x40) : 0x0;
>>> +    vfd->fr_fact = vfd_len > 1 ? (data[1] & 0x3f) : 0x3;
>>> +    vfd->fr48 = vfd_len > 2 ? (data[2] & 0x1) : 0x0;
>>> +}
>>> +
>>> +static bool vfd_has_fr(const struct cta_vfd *vfd, int rate_idx)
>>> +{
>>> +    static const u8 factors[] = {
>>> +        1, 2, 4, 8, 12, 16
>>> +    };
>>> +    u16 rate = cta_vf_fr[rate_idx];
>>> +    u16 factor = 0;
>>> +    unsigned int i;
>>> +
>>> +    switch (rate) {
>>> +    case 24:
>>> +        return vfd->fr24;
>>> +    case 48:
>>> +        return vfd->fr48;
>>> +    case 144:
>>> +        return vfd->fr144;
>>> +    }
>>> +
>>> +    if (!(rate % 25)) {
>>> +        if (!vfd->bfr50)
>>> +            return false;
>>> +
>>> +        factor = rate / 25;
>>> +    } else if (!(rate % 30)) {
>>> +        if (!vfd->bfr60)
>>> +            return false;
>>> +
>>> +        factor = rate / 30;
>>> +    }
>>> +
>>> +    for (i = 0; i < ARRAY_SIZE(factors); i++)
>>> +        if (factor == factors[i] && (vfd->fr_fact & (1 << i)))
>>> +            return true;
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +#define OVT_PIXEL_CLOCK_GRANULARITY    1000        /* Hz */
>>> +#define OVT_MIN_HTOTAL_GRANULARITY    8        /* pixels */
>>> +#define OVT_MIN_VBLANK_DURATION    460000000    /* ps */
>>> +#define OVT_MIN_VBLANK_LINES        20
>>> +#define OVT_MIN_VSYNC_LEADING_EDGE    400        /* us */
>>> +#define OVT_MIN_VSYNC_LE_LINES        14
>>> +#define OVT_MIN_CLOCK_RATE_420        590000000    /* Hz */
>>> +#define OVT_PIXEL_FACTOR_420        2
>>> +#define OVT_MIN_HBLANK_444        80        /* pixels */
>>> +#define OVT_MIN_HBLANK_420        128        /* pixels */
>>> +#define OVT_MAX_CHUNK_RATE        650000000    /* Hz */
>>> +#define OVT_AUDIO_PACKET_RATE        195000        /* Hz */
>>> +#define OVT_AUDIO_PACKET_SIZE        32
>>> +#define OVT_LINE_OVERHEAD        32
>>> +#define OVT_HSYNC_WIDTH        32
>>> +#define OVT_VSYNC_WIDTH        8
>>> +
>>> +/* OVT Algorthim as specified in CTA-861-I */
>>> +static struct drm_display_mode *
>>> +calculate_ovt_mode(struct drm_connector *connector, const struct 
>>> cta_rid *rid,
>>> +           u16 vrate)
>>> +{
>>> +    u32 max_audio_packets_per_line;
>>> +    struct drm_display_mode *mode;
>>> +    u32 htotal_granularity_chunk;
>>> +    u32 resolution_granularity;
>>> +    u32 vtotal_granularity = 1;
>>> +    u64 min_pixel_clock_rate;
>>> +    u32 htotal_granularity;
>>> +    u32 max_vrate = vrate;
>>> +    u64 pixel_clock_rate;
>>> +    u64 max_active_time;
>>> +    u64 min_resolution;
>>> +    u32 vsync_position;
>>> +    u32 min_line_time;
>>> +    u32 min_line_rate;
>>> +    u32 min_hblank;
>>> +    u32 min_htotal;
>>> +    u32 min_vblank;
>>> +    u32 min_vtotal;
>>> +    u32 htotal;
>>> +    u32 vtotal;
>>> +    u32 h;
>>> +    u64 r;
>>> +    u32 v;
>>> +
>>> +    /* step 1 */
>>> +    switch (vrate) {
>>> +    case 24:
>>> +    case 25:
>>> +        max_vrate = 30;
>>> +        fallthrough;
>>> +    case 30:
>>> +        vtotal_granularity = 20;
>>> +        break;
>>> +    case 48:
>>> +    case 50:
>>> +        max_vrate = 60;
>>> +        fallthrough;
>>> +    case 60:
>>> +        vtotal_granularity = 20;
>>> +        break;
>>> +    case 100:
>>> +        max_vrate = 120;
>>> +        fallthrough;
>>> +    case 120:
>>> +        vtotal_granularity = 5;
>>> +        break;
>>> +    case 200:
>>> +        max_vrate = 240;
>>> +        fallthrough;
>>> +    case 240:
>>> +        vtotal_granularity = 5;
>>> +        break;
>>> +    case 300:
>>> +        max_vrate = 360;
>>> +        fallthrough;
>>> +    case 360:
>>> +        vtotal_granularity = 5;
>>> +        break;
>>> +    case 400:
>>> +        max_vrate = 480;
>>> +        fallthrough;
>>> +    case 480:
>>> +        vtotal_granularity = 5;
>>> +        break;
>>> +    }
>>> +
>>> +    /* step 2 */
>>> +    max_active_time = ((u64)1000000000000 / (u64)max_vrate) -
>>> +        (u64)OVT_MIN_VBLANK_DURATION;
>>> +
>>> +    min_line_time = max_active_time / (u64)rid->vactive;
>>> +
>>> +    min_vblank = max_t(u64, (u64)OVT_MIN_VBLANK_LINES,
>>> +               DIV64_U64_ROUND_UP(OVT_MIN_VBLANK_DURATION,
>>> +                          min_line_time));
>>> +
>>> +    min_vtotal = rid->vactive + min_vblank;
>>> +
>>> +    if (min_vtotal % vtotal_granularity)
>>> +        min_vtotal += vtotal_granularity - (min_vtotal %
>>> +                            vtotal_granularity);
>>> +
>>> +    /* step 3 */
>>> +    min_line_rate = max_vrate * min_vtotal;
>>> +
>>> +    max_audio_packets_per_line = DIV_ROUND_UP(OVT_AUDIO_PACKET_RATE,
>>> +                          min_line_rate);
>>> +
>>> +    /* step 4 */
>>> +    min_hblank = OVT_LINE_OVERHEAD + OVT_AUDIO_PACKET_SIZE *
>>> +        max_audio_packets_per_line;
>>> +
>>> +    min_htotal = rid->hactive + max(OVT_MIN_HBLANK_444, min_hblank);
>>> +
>>> +    min_pixel_clock_rate = max_vrate * min_htotal * min_vtotal;
>>> +
>>> +    htotal_granularity_chunk =
>>> +        roundup_pow_of_two(DIV_ROUND_UP(min_pixel_clock_rate,
>>> +                        OVT_MAX_CHUNK_RATE));
>>> +
>>> +    htotal_granularity = max(OVT_MIN_HTOTAL_GRANULARITY,
>>> +                 htotal_granularity_chunk);
>>> +
>>> +    if (min_htotal % htotal_granularity)
>>> +        min_htotal += htotal_granularity - (min_htotal %
>>> +                            htotal_granularity);
>>> +
>>> +    resolution_granularity = OVT_PIXEL_CLOCK_GRANULARITY /
>>> +        gcd(OVT_PIXEL_CLOCK_GRANULARITY, max_vrate);
>>> +
>>> +    do {
>>> +        /* step 5 */
>>> +        min_resolution = 0;
>>> +        v = min_vtotal;
>>> +
>>> +        goto loop_end;
>>> +
>>> +        while (!min_resolution || r <= min_resolution) {
>>> +            while (r % resolution_granularity ||
>>> +                   max_vrate * r / (h & ~(h - 1)) >
>>> +                   OVT_MAX_CHUNK_RATE) {
>>> +                h += htotal_granularity;
>>> +                r = (u64)h * (u64)v;
>>> +            }
>>> +
>>> +            if (!min_resolution || r < min_resolution) {
>>> +                htotal = h;
>>> +                vtotal = v;
>>> +                min_resolution = r;
>>> +            }
>>> +
>>> +            v += vtotal_granularity;
>>> +
>>> +loop_end:
>>> +            h = min_htotal;
>>> +            r = (u64)h * (u64)v;
>>> +        }
>>> +
>>> +        pixel_clock_rate = max_vrate * min_resolution;
>>> +
>>> +        /* step 6 */
>>> +        min_htotal = rid->hactive + max(OVT_MIN_HBLANK_420,
>>> +                        OVT_PIXEL_FACTOR_420 *
>>> +                        min_hblank);
>>> +    } while (pixel_clock_rate >= OVT_MIN_CLOCK_RATE_420 &&
>>> +         htotal < min_htotal);
>>> +
>>> +    /* step 7 */
>>> +    vtotal = vtotal * max_vrate / vrate;
>>> +
>>> +    /* step 8 */
>>> +    vsync_position = max(OVT_MIN_VSYNC_LE_LINES,
>>> +                 DIV64_U64_ROUND_UP((u64)OVT_MIN_VSYNC_LE_LINES *
>>> +                        (u64)pixel_clock_rate,
>>> +                        (u64)htotal * (u64)1000000));
>>> +
>>> +    mode = drm_mode_create(connector->dev);
>>> +
>>> +    if (!mode)
>>> +        return NULL;
>>> +
>>> +    mode->clock = pixel_clock_rate / 1000;
>>> +    mode->hdisplay = rid->hactive;
>>> +    mode->hsync_start = htotal - OVT_HSYNC_WIDTH * 2;
>>> +    mode->hsync_end = mode->hsync_start + OVT_HSYNC_WIDTH;
>>> +    mode->htotal = htotal;
>>> +
>>> +    mode->vdisplay = rid->vactive;
>>> +    mode->vsync_start = vtotal - vsync_position;
>>> +    mode->vsync_end = mode->vsync_start + OVT_VSYNC_WIDTH;
>>> +    mode->vtotal = vtotal;
>>> +
>>> +    return mode;
>>> +}
>>> +
>>> +/* CTA-861 Video Format Data Block (CTA VFDB) */
>>> +static int add_modes_from_vfdb(struct drm_connector *connector,
>>> +                   const struct cea_db *db)
>>> +{
>>> +    struct drm_display_info *info = &connector->display_info;
>>> +    int vfdb_len = cea_db_payload_len(db);
>>> +    struct drm_display_mode *mode;
>>> +    struct cta_vfd vfd;
>>> +    int num_modes = 0;
>>> +    int vfd_len;
>>> +    int i;
>>> +    int j;
>>> +
>>> +    if (!vfdb_len)
>>> +        return 0;
>>> +
>>> +    vfd_len = (db->data[0] & 0x3) + 1;
>>> +
>>> +    if (!vfd_len)
>>> +        return 0;
>>> +
>>> +    vfdb_len--;
>>> +
>>> +    vfdb_len -= (vfdb_len % vfd_len);
>>> +
>>> +    for (i = 0; i < vfdb_len; i += vfd_len) {
>>> +        parse_cta_vfd(&vfd, &db->data[i + 1], vfd_len);
>>> +
>>> +        if (!vfd.rid || vfd.rid >= ARRAY_SIZE(rids))
>>> +            continue;
>>> +
>>> +        for (j = 1; j < ARRAY_SIZE(cta_vf_fr); j++) {
>>> +            if (!vfd_has_fr(&vfd, j) ||
>>> +                (cta_vf_fr[j] < 144 && rid_to_vic[vfd.rid][j - 1]))
>>> +                continue;
>>> +
>>> +            mode = calculate_ovt_mode(connector, &rids[vfd.rid],
>>> +                          cta_vf_fr[j]);
>>> +
>>> +            if (!mode)
>>> +                continue;
>>> +
>>> +            mode->height_mm = info->height_mm;
>>> +            mode->width_mm = info->width_mm;
>>> +
>>> +            drm_mode_probed_add(connector, mode);
>>> +            num_modes++;
>>> +        }
>>> +    }
>>> +
>>> +    return num_modes;
>>> +}
>>> +
>>>   /*
>>>    * Update y420_cmdb_modes based on previously parsed CTA VDB and 
>>> Y420CMDB.
>>>    *
>>> @@ -6831,6 +7201,36 @@ static int 
>>> add_displayid_detailed_1_modes(struct drm_connector *connector,
>>>       return num_modes;
>>>   }
>>> +static int add_cea_modes(struct drm_connector *connector,
>>> +             const struct drm_edid *drm_edid)
>>> +{
>>> +    const struct cea_db *db;
>>> +    struct cea_db_iter iter;
>>> +    int modes;
>>> +
>>> +    /* CTA VDB block VICs parsed earlier */
>>> +    modes = add_cta_vdb_modes(connector);
>>> +
>>> +    cea_db_iter_edid_begin(drm_edid, &iter);
>>> +    cea_db_iter_for_each(db, &iter) {
>>> +        if (cea_db_is_hdmi_vsdb(db)) {
>>> +            modes += do_hdmi_vsdb_modes(connector, (const u8 *)db,
>>> +                            cea_db_payload_len(db));
>>> +        } else if (cea_db_is_y420vdb(db)) {
>>> +            const u8 *vdb420 = cea_db_data(db) + 1;
>>> +
>>> +            /* Add 4:2:0(only) modes present in EDID */
>>> +            modes += do_y420vdb_modes(connector, vdb420,
>>> +                          cea_db_payload_len(db) - 1);
>>> +        } else if (cea_db_tag(db) == CTA_DB_VIDEO_FORMAT) {
>>> +            modes += add_modes_from_vfdb(connector, db);
>>> +        }
>>> +    }
>>> +    cea_db_iter_end(&iter);
>>> +
>>> +    return modes;
>>> +}
>>> +
>>>   static int add_displayid_detailed_modes(struct drm_connector 
>>> *connector,
>>>                       const struct drm_edid *drm_edid)
>>>   {
>>
-- 
Hamza

