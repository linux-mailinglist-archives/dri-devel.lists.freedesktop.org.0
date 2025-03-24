Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9EAA6D324
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 03:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D615010E1E5;
	Mon, 24 Mar 2025 02:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AmgJQyZS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5B610E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 02:45:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZNb65+rKlV9L09s209YEoNMc8v2ZyoN6kdM7umfBClTd/9CqTLRYJpkKCiykmh3xjXmkMfNR6wylcRV8kWm+A5eUrVL7ohAqDWnOfSVQdVXzJZhb1R1wlmRx0PICH60rgzlFb+ANZmUA4cQ+mUEwuCsdPrl/nIm9iBExGybPTRNVnciaKEgAJbudSg0yMP0JCDfB0ydhSf8iH6pj6rF/g/EaRr0pfluaHNyS8j2/5wf+9L0er8Fkx22YT96AHv4PnvQHQIE9d7d8HBwIjrXaA3bm1Tnxk1p3M/36DYJ4htKby7q6LIKuLQIRp3vm+Id98v0FPMO0ZqAt5iWkDzcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I16SiHGi5dHuAhQB7zuTvc3dNO4OkV7obqop/jWnSmU=;
 b=bD/o4p8YVhg29Vt+CLswV1a0OGInl3SsprEnvJHPUw6fPB9qUY1kz6fpKXh6Jns1ldnpqm5PVqmivscXt0ORpm25/vNOJXMcIXt54ZIGAMm8vBl3ZOJn2JRmcS5jNPdNIWKmpEVjvmz9/T0CMB5Ay9u98J8wWiOYjcrQBMKWWAOIH1V9mdSJ4q0QzfVdprhQAEGJNuTrZ1UIOrrA2MY7OpkhaTxQI+EaLUW3CxDzExdLajnp+dHlS957569Sku+IYLuJHRvJnMX2hMY5LppXlG91ngRC414K8dIpr7JPpM2y1b1naAfZk8cjgveX6666moScX63nqOBaFxi/NnbS4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I16SiHGi5dHuAhQB7zuTvc3dNO4OkV7obqop/jWnSmU=;
 b=AmgJQyZSaKPhRSs4Q0seLaBV/CNbn5hyArTv5yM+/66OBZkz9dsWA/FzGPsrv+WGasRxulRKDPKAhQDOMbvh+bfRwti6HjdER8UsuT5aYRzGxA76tdESrjm6/3yyarFucBv4VoodTG/STNAuH0P2xtaMdrcDCDqewKyk1+cNRv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CY5PR12MB6155.namprd12.prod.outlook.com (2603:10b6:930:25::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:44:59 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:44:58 +0000
Message-ID: <d1cb3ade-997b-45c5-a197-4e2ab88f9835@amd.com>
Date: Mon, 24 Mar 2025 10:44:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] virtio-gpu api: add blob userptr resource
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20250228053650.393646-1-honglei1.huang@amd.com>
 <20250228053650.393646-2-honglei1.huang@amd.com>
 <cd9f85a5-0d99-4007-bba2-d792ac9d84da@gmail.com>
 <c2d1334f-6f5a-493f-bbf0-3e92789f128a@amd.com>
 <CAAfnVBk-JJKxJXAstwmgL4=EM15RHfVm4NQST+p3nE4xi2220g@mail.gmail.com>
 <e7614b27-e9b4-49a8-831b-0acd33911336@amd.com>
Content-Language: en-US
In-Reply-To: <e7614b27-e9b4-49a8-831b-0acd33911336@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CY5PR12MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: ea87a5d8-2480-49c9-bf24-08dd6a7ddda2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TC81eHNNbzhHVzE4Q09OTXJSNWRGVFhPQ0hyMHlYMTZsNmhSR3VLUmhOWkpk?=
 =?utf-8?B?cnpkcGlub095YmkwejdERnlHSjhwbkdsUkJhZ1RSblVVTkFJektDWHJnRHZ5?=
 =?utf-8?B?aWdCeTJ3SnQ3ZlpaZnBvSGdZS2lRZDZEc2tKRzkyWTY0UWxoU1ZmWis1Rkdu?=
 =?utf-8?B?TzlBZDhZSGdyN1duOTk2NUpPTjYxZm5QR1JETTBhenJodW54TFJzbVVCcmg4?=
 =?utf-8?B?Z2lnTmdrMnJETFJKUmgvQ04xV0pNZEVlTDVRRUM2cnQ0azBicTNWMHR0MWFw?=
 =?utf-8?B?MzBmS29ibnY1ekhLQnZ6WUdKaDZldWJYVWd3Y1M4WUtFWEg4ZVp1RXlHMTNy?=
 =?utf-8?B?ZjJBZlRzbDFxSEUyYkVqcG1meG8vbUg1NkJid3g5MzlVdlVzSVp5ZUp0cGZB?=
 =?utf-8?B?L0paemFaNGZnT1Vqd2NHY09mTlBxSWNVM1pRdlhZRERsS3R1LzFuTnNmOVVx?=
 =?utf-8?B?bGZIaDFlQjZqakRibkNjYklUekRXL2NVVFhzZk5uTmhuZjFUMktFbGdhVFZ5?=
 =?utf-8?B?cGJjakJ6dUI4VnpPcmFKQU1WdkZFWVNHd09oeE43MS94LzFVSWJxeHpOMHJm?=
 =?utf-8?B?K3Jic1VuTVJvVnV3K3dFT2RVOS9UNmVsM3VKSmUydGQ2bkYzQnJ5UnVIZXhh?=
 =?utf-8?B?RDhFbUtsNHJCVW12Q01pMFRrakNyUndtdmR4aDgzWFF6T2IrcFN5bndCTDZF?=
 =?utf-8?B?d2NuWnFvK25hRDlzRnZ5MTB3ZnlRTm9rZXNmQ1pDV2FianAyM2g3U0I0TlNB?=
 =?utf-8?B?NlB0YWVoWFk3SzkrQ2RkcGJxWHhwWEVlenM2NDBoUGIrOVcwTVhRUFg0WTBG?=
 =?utf-8?B?RkMwY3FXV3NLUXlyQ1VHSEhaeDhMRHhtaWdJTjV6THAvcnlKRzlhVTlscG9Z?=
 =?utf-8?B?YzNjSUhvYzkxOFhISGpMeFlxbzZjOWpyK1VOTkVCZFpOZk9wUkhtWmN6dmRG?=
 =?utf-8?B?K2tFTk5GZ3BjTGFubVZaUEtKdm5rWlBadjRrOEtudlhUa1RYMUJSY09QOVoz?=
 =?utf-8?B?S2lzMGtqWG9FNENxdkR1TnBYTTgvVzFHc3NxTEZhbWJHSUFleWRIZWV1aGFv?=
 =?utf-8?B?WVVWRG9pUlV6NTY3UDdJUG1jMzVUUDZkanZxUjBFN2JGNndlQW5kN0g0RE10?=
 =?utf-8?B?cGZtOC8rbzc3aVRHUGNnZGxjU2ZHS1BicGdvWnRqVURqNXo4NFlIVEZuU1Ru?=
 =?utf-8?B?Z3c1UzFvdDdDN2R1OVpYdjBVOCtscS9WOWpicllMd3JQaGpSc0pkdmpZdnFP?=
 =?utf-8?B?QlBuNTl2STZDOGNkQ0crcE9sN09CSkJqRWVnYjdhOTVzQ1ZtdlV3aDVaYnYv?=
 =?utf-8?B?SFB4WHR6c3ZRWGVCaVpDWTJVNm5uWTFXNVpvZG1tdjFSZ2xWWFdLUzRQeE5X?=
 =?utf-8?B?TXRZSmhsaGlxb1R6S0Q3VklzSitKNmdXNnJ1UnpnNW56SlZPSDNMaDhkbXhm?=
 =?utf-8?B?aTdWUVQ2blFiczkwckkyVTR4UEVtKzd4aHRFWnBOV0ZqZXJVR2w1SVJEVThK?=
 =?utf-8?B?YmNXQ1lOUllraG1EZm82WGlNZzRKeW9yRUpzVDh2WGF6TXJJQlNpUUJLVnBJ?=
 =?utf-8?B?SlYxUVNuWWNCV2dFQTZBOVJOVHBsb0ZJOVpBazhWWGN3Wmw2U0V5amQ0cGlr?=
 =?utf-8?B?Y25BOE5qamRQNUtnZ1o5NEdCVnQyWDZFK0tqME4rUGZJbG9sUDUzTm9HQmlR?=
 =?utf-8?B?RVN6SjYxY3lGeERaZTVoaW56eEJCNGkzNUFOSUMvaG50OXhvYVZvcGltWFk1?=
 =?utf-8?Q?kHVU8VCaFOvcBIYNKbOLbgCMf2AuOf6tzubbW//?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk9PTnpaK09nWnV0d1FaaExORzBTSUJhZHNaTW5Oa3dMS2tNN2dxSkdnVUhX?=
 =?utf-8?B?QzdPMnlrOW5LaTNJTVA5VXNpaWpaLy8ydFUxZmllZFF6dkpWVGlpQnVwdkNY?=
 =?utf-8?B?b0RRUEE3ZUdvR1JaZHFQRlIwNXdkUGZ2QnNSU0hLRVBXcnp1eFF4VUw1djRs?=
 =?utf-8?B?ZnJzNFVZWlBCb3lPMUpKUWhpdm5VMENqR1ozQkw3SVI0MU1odU9FOUQwRGM4?=
 =?utf-8?B?TVhrc1I5WXh1cDNadTRTV2RmeFpRQmtSTXNVR3pTc0JLdXM4bW44SnJZZ3RY?=
 =?utf-8?B?U25sSWZHcmVjYjFWS0ZIR05kaFpQNlltcy9LdDdTUFBjbG5aUjlOREVUcGJr?=
 =?utf-8?B?ejIzWXBTRDFaT1lKUy9iM2QvbmlMU1pNYTJjak1nUzhQeUV0VjFpZjQvYlNM?=
 =?utf-8?B?ZjlzMzE2d0RWY1V1QU5namNHUExsUVF3ZllQTi9SSFRUb3J2SmVLNjhTOTRJ?=
 =?utf-8?B?T0lpTFdWSTNsM3dOV1cwTmdEMTRwUVlGT1pqS1V2RDJHU05mTUl3UXJnc1RP?=
 =?utf-8?B?RDJhTWU2aHY4WSt2VDQwSGV6bWFqQitwbCtMRDEwZG4xMEtEdWNZQm5pYVYr?=
 =?utf-8?B?RWdCY0p5WHZUbFF3Wkc0Q25scitXTzBTL1I1bW55N3Rnc3NrUFVNRU1OejdL?=
 =?utf-8?B?TTNlUTVvdUdxc1Y1TWdCRUV6UlUvaWZGdGJya09VSTVnd0MyUnZ1eHdicnVO?=
 =?utf-8?B?NkVDc1lWRUxKdndTbWxVOExrNitQanAyam5jaWRSTEtMcnFlKzY3Wm04TDQr?=
 =?utf-8?B?SytWSDIxZjJpUExHQUtla2J6anNxY2VkbFUvOHJVa0hqYVpiRDVxNG0yaWo2?=
 =?utf-8?B?NXhDVVlzbVdtTTVNbXdjQkN0b01WY0wxNUxkZE1YMzZFYkd4WDY2YkZTNE9N?=
 =?utf-8?B?VHllTi9IK2JBc09xVmlRM1NNSE1zdHpHQ1A0eHIyWFBOQVowRFl2S3hkZ0FR?=
 =?utf-8?B?WWRReUNFMVZQcHNuaGNPUGM3eENLMzNQZEFBOHBOcVBNby9BMGNHSmlYZDVi?=
 =?utf-8?B?NEZnWHdReXkxeUE5MklUcVdNVXB1ZzRCYUs3QWxESGl0K3E5K0hGN0pOQ0dW?=
 =?utf-8?B?dElLWEw5M0NtOHhFZDNyYk10OEJTRDEvUnhGQ2VvWkhtbWFqVm5KWlVUb2JY?=
 =?utf-8?B?SHhYQjd3c3ZoamFCWXpoUEJBdmJOZmJhZDZ4cDBSVGlPcUlNQmdONVZBUk8w?=
 =?utf-8?B?Q0pEcGRGaEk2azlha2U3Si9wODh1VnFRa3hKRUZiNkNSbEExaVc5ZUttQjRN?=
 =?utf-8?B?WVdQRDZ0b1BIU28zaGpOU3NJSzhMSzArRUpsNEsxLzVxY2wweXhEd2VJMVhj?=
 =?utf-8?B?NFA3UnVCVmNmRTUvVzZMcEdRbUNhYVZDaUtVdFJRV1FVRjJJb1hTNVZ0bE9s?=
 =?utf-8?B?azEvR1czY3RoU0RKWVlCcHFtQ01mOGlIaHJVMXQ0SHVHZyswUE1Nc2JzdEJR?=
 =?utf-8?B?SzVCMzBURlJMbVpxWXpKWklYQ1hyWlZxeVU3c1NFMHJGR05TRFVkK2xaZzZz?=
 =?utf-8?B?Sml6NUtyVGp6TkEzNG45bEFyMEpuZEUrd2hqNDFzS1dSU0VtUytlYWE0TS9u?=
 =?utf-8?B?NzlOYU9CdlYwWFJvZDA3RmRvR0k5SGRLQXNHaEJxcWdwVE41dzFCTnVrRUlO?=
 =?utf-8?B?MkJEV2FuTlhTWUJBVTBjOUY2MFhCYTBXWVkzMXdoU3VwQVR1TWJQTmYyczNX?=
 =?utf-8?B?L2NWMHZOMXd6ODNlVTZ6VUNsWjJZWWN1SWxFM3JEOXJBbjlGQzE0SUVQVFhW?=
 =?utf-8?B?Z3Q3UUxIYVhvMWNhelRRTTgwUmtmbjVQTDZGckxoVDRjdlJDUWMvdHZraGpO?=
 =?utf-8?B?NUlpK1BOSThZZHVTZkxnd2VadjloMnlZQlhKSzlOSVpqTkVNb2hDWGxRdXhI?=
 =?utf-8?B?eHlHTGIyb1owM2ZnQ3ByYlRyaldsL3pGVDAvU2VtTDd1SklLeTRQSS9MTUxv?=
 =?utf-8?B?OXNJcTR4NlUvVFQ5aWlMaFVpa3pkU3RQMVk5SjEyNkpEODdvdFl4NFFBT0FO?=
 =?utf-8?B?RWhaTVVSQUZrQTVKOVFzcUoxaFh2M3kvck9vRGNrVXVhSDc5eDA0ellvVytm?=
 =?utf-8?B?MFpkRWVWT0l1R3dOMEVmbEM5SDNsQVh0aGZOSkdEeXhEY0RXOFlQVTZONGgw?=
 =?utf-8?Q?IFT8c44TYFGzj+7v3Hz5sRgSv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea87a5d8-2480-49c9-bf24-08dd6a7ddda2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:44:58.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbo+mbiGgaP3BQ3r2PV50MfdNshnw8QK8A1DbuIPSI2ZnDnBqErbzx2qEUqqWI/zqRzVD3NQ8Iba8VgAH9BgsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6155
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



On 2025/3/18 19:25, Huang, Honglei1 wrote:
> 
> 
> On 2025/3/18 9:37, Gurchetan Singh wrote:
>>
>>
>> On Thu, Mar 6, 2025 at 2:52 AM Huang, Honglei1 <Honglei1.Huang@amd.com 
>> <mailto:Honglei1.Huang@amd.com>> wrote:
>>
>>
>>     On 2025/3/1 5:21, Demi Marie Obenour wrote:
>>      > On 2/28/25 12:36 AM, Honglei Huang wrote:
>>      >> From: Honglei Huang <Honglei1.Huang@amd.com
>>     <mailto:Honglei1.Huang@amd.com>>
>>      >>
>>      >> Add a new resource for blob resource, called userptr, used for 
>> let
>>      >> host access guest user space memory, to acquire buffer based 
>> userptr
>>      >> feature in virtio GPU.
>>      >>
>>      >> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
>>      >> in this series patches only HSAKMT context can use the userptr
>>      >> feature. HSAKMT is a GPU compute library in HSA stack, like
>>      >> the role libdrm in mesa stack.
>>      >
>>      > Userptr should not be limited to HSMKMT contexts.  Userptr can
>>      > accelerate shm buffers by avoiding a copy from guest to host, and
>>      > it can be implemented using grant tables on Xen.
>>
>>     Yes, I totally agree userptr can accelerate shm buffers, but I 
>> currently
>>     don't know if there are any other projects working on similar 
>> features,
>>     or if maintainers have any opinions or better ways to implement 
>> them, so
>>     I temporarily limit this feature to HSAKMT context only.
>>
>>     I am waiting for everyone's opinions, please provide your thoughts.
>>
>>
>> I wonder if you can emulate userptr using udmabuf on the host-side?
>>
>> Essentially for the guest, it'll be a malloc'ed memory, which means a 
>> guest sg list.  We can convert the guest sg-list to udmabuf using 
>> well- known mechanisms on the host side.  I hope amdkfd can operate on 
>> dma- bufs too?
>>
>> I do such a feature that would have a more generic utility outside of 
>> HSAKMT contexts and not rely on Xen-specific grant tables  ... 
>> checkout VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE in crosvm for an 
>> example.
> 
> I think userptr can be emulated by udmabuf if the sg list is from guest 
> user sapce and not moveable, amdkfd can operate dma-buf, and the userptr 
> feature can be achieved by partial functions of dma-buf as far as I can 
> see.
> 
> But the udmabuf need managed by UMD, this will result in some 
> performance loss, and we are planning to implement virtio GPU userptr 
> using hmm_rang_fault, udmabuf solution may be completely different from 
> this one.
> 
> I saw the feature VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE is used by 
> the crosvm in beta branch, but I can not find the kernel virtio gpu 
> part, how to access it? Maybe I can try or help.

Hi Gurchetan,

	I found VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE has been added into 
crosvm 4 years ago. But I can not find the corresponding kernel 
implementation, also can not find in chromeos kernel:
https://chromium.googlesource.com/chromiumos/third_party/kernel/.
	And it seems like the VIRTIO_GPU_BLOB_FLAG_CREATE_GUEST_HANDLE only 
support the system memory according to the commit message, but I can see 
the virtio has plan to support guest 
heap:https://github.com/google/crosvm/blob/dee7838993bae90cad49d5595b958cfe4c28b58d/devices/src/virtio/gpu/virtio_gpu.rs#L1056. 

	Can I create new virtio gpu patches for adding heap supported virtio 
gpu udmabuf?

Regards,
Honglei

> 
>>
>>
>>
>>     Regards,
>>     Honglei
>>
> 

