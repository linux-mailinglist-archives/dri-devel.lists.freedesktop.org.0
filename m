Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A72A7B92E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 10:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AF610EB8D;
	Fri,  4 Apr 2025 08:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ptcgaVxZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C41EB10EB8D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 08:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUrGS8id5ZKuYdlr9Gr6LVCphU1RXKVbNiFfFxfRQQ9zWSos26nRstXkiENmcidbpkQkUAoo6w6qFTd6zUcvj+p0juDwYrObjJ4R+5qsbcdBPMD4DMOf9yuXMv9nOA+BiZIXSoNy16GZ7X6OF92T8errz5oLm/hTZcofnnZovd4obAtRQILYhpWkujGd5V87HpXrXEv2QSon7iSewozw255wxXFQ6jVj/hVJT4WphRwH8vXjlRklYmCZEe0z5O3bIjkj/Z53u0UAA4XL4ZFeAMYKxDU52lRKu2GsvL5AEoDb9AiaqlbLTPhPO79S8x8MFSJRs3OkisvbVAZcQdlBoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QDC9U91G6SOURJBFk8ZZtDFeWtvU9AnpAAE9fve4PDg=;
 b=L1vYac5ZKlcLIdcQJ/rkOXAWD0pBwmldXFE64x/eosnHdwL8MBR0Ek+ltVvO8KitR1SghyREXVptPyICCQcu4ZKBOkPUkceSIZ3gDIlVrxn7D0bvDAv+rbcYpNn0s3YJCO7KPWU5AiY/EJXGPsrk6E4oooPL6vife5h1Q3xJmwmP/GPbOUwwobF/Z91cxPKLryfJryzT7KxA6QpUBMDxio0m1wWjiAu5TuwNVC1EXnyvYBjvfnWb+CQDi5mUnCTHi3muyeStfKWs80/D/r+Yw/imZGEkYUmkNOtCPxwTcBB+A7cQ7hJSyztai5LHTMiT2l7zYl+VNpp38mp5LKQJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QDC9U91G6SOURJBFk8ZZtDFeWtvU9AnpAAE9fve4PDg=;
 b=ptcgaVxZUINN6Rzzj+Ivry448Ev5HmSSOIXnBYY1qhLm2hRdZoblde1vDfYCbf8RIfdgIfrHSjrEeq6OKgPVXXpR3P2d8EmfXAzcAGWCWE/bjPLL11VY8j6wSYEUKWqWlEAW5dkA7w5u7O/kvyzGkXD2uGJdWC+S3rP0s9lkzBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9053.namprd12.prod.outlook.com (2603:10b6:930:37::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Fri, 4 Apr
 2025 08:47:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8583.041; Fri, 4 Apr 2025
 08:47:13 +0000
Message-ID: <202c3a58-97a3-489c-b3f2-b1fd2735bd19@amd.com>
Date: Fri, 4 Apr 2025 10:47:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Airlie <airlied@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Tomasz Figa <tfiga@chromium.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
 <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
 <e08f10da-b0cd-444b-8e0b-11009b05b161@amd.com>
 <CAPM=9twgFt43OKqUY0TNopTmibnR_d891xmV=wFM91n604NUCw@mail.gmail.com>
 <5ed87c80-6fe3-4f8c-bb98-ca07f1db8c34@amd.com>
 <20250403-quick-salamander-of-charisma-cab289@houat>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250403-quick-salamander-of-charisma-cab289@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9053:EE_
X-MS-Office365-Filtering-Correlation-Id: 251ad719-98b2-4299-6250-08dd73554b3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFQ3UGs0R28xYjlVV1ZkNHh4N2krSnV3cmNueFgyNS93S01KeEZPMFlraHNU?=
 =?utf-8?B?d0FLV2pUQTl6QjNYNWhCVkYyV3RmTVh1enNhNWJoMkRJU2FGQlB3eXR5dWhI?=
 =?utf-8?B?U3RoQXd0TVVrUTFnWGY2NlY1NGR3Y05iajliblMzcFJBKzlHK2dUWnZnT0V2?=
 =?utf-8?B?eVVtVzdlZzJQYjlFdlkwNVBaczBoNHVpNjFPRFR6RGZYcTBYMDl4MVZGL2ls?=
 =?utf-8?B?WWg5bmtVT0VESlVYRWN6NXR0ZW5KaHI5d3dZREdoMnZLc3Evc0h4NElMOVJq?=
 =?utf-8?B?R3dIdnZiOWRqSUlTamFYcDBnZllKdFRXVnN3bXhkMzFTbmZSQkt2LzJ6eTBF?=
 =?utf-8?B?Y2J5K1JuN3Y3ME1sVVRkc05wa0VSWHVOSVBDa0RSc1NETUpQdm1VTi9qVU5S?=
 =?utf-8?B?TEtmL2ZjeU5PaDRzWW5uLytnSmdWRStPNG1pekNKb3c1VTNzSis4bDBZVk5P?=
 =?utf-8?B?L1FWL1RDem1LcTB3SWR0UnRJekJORjZkb3BEUDZsQ3ZST3MrbVNQYkgySXFI?=
 =?utf-8?B?dHhGcTRScFhCL0p6ekhqcE9IR3JTWUtVWU1KRzdmcDNraE9kam5pbitLbUJl?=
 =?utf-8?B?NHVpT0xzc3lDZVJCK2FSMmpTNWNoU05EV25nMVlwSlYrbU1kT0Q3TTNzRXYw?=
 =?utf-8?B?dFZoR09JL0thTmQyNWg5WGtPQzVqeHpxM2Nvbkl4TTZHVWM0T0RmbXdUYzlS?=
 =?utf-8?B?RE4yOEE5ekFHQ3AvVEFMcWpGcnY5YXA1V1h0NFBEQ0hua2VmNG5uK25GRzNv?=
 =?utf-8?B?bFBRbldVUnloSzlDa2JjYS9BVHJEZldndEYxVlZaTENSRTdNbXBtRkZpeDNu?=
 =?utf-8?B?T1MzVVZEUEF1c1diSnp6SitZMWZiL1hLeE1kKzFTb2xrVE5hcTZkL1NuM0pZ?=
 =?utf-8?B?L0JhMWF4OVRtMzViRmVwWmhwT0pIM3craHRhU05zNkJ1RXFzSGhLR2FVcFJP?=
 =?utf-8?B?aURZeDJNTGt2STlnc0RjL2tmZEVuS05XWEZBdHE3Vm15UGxPZ25JR05PemZL?=
 =?utf-8?B?QzE4MXF6d2NJQS9RZnBMSHJyOEJQdUpFVEhWMnJ5Z0txR3I0dTlYaEFjOSsv?=
 =?utf-8?B?c1NhT1ZVcTFsb2FEdHRiUlBFWkE0K3EvVVBNeGFrMlBBUDIwVHV3RW5TMWRt?=
 =?utf-8?B?MmxQSUVLWmIwcmhSR2RNSnE2ZTdqWVNnZnVFMnlEdHVyY1lQQzlnWHhldU9z?=
 =?utf-8?B?cXNxV0wrWEtJQm9CbnhMUVlOYXdVRU1rWXdxb0ZXY0Y2b3dOUDhBM1c2V0s5?=
 =?utf-8?B?OFpGVWV1SDVqaHlxbXY0M0NhdlRwUTd1Znl3azA2aXVHT3RHRkI2UHMwbkxj?=
 =?utf-8?B?eUFCUHRaSzRRVUlwZDVDK0NIZXZQMmRGb0M0QUV3ODhtOVhpWmlUbm5UQXMx?=
 =?utf-8?B?aGpaS3NLRnBDcmZMTkl0bWdPUW5PaEpUU3pzdGc4K3FWSzJTVitpeCtDc0FP?=
 =?utf-8?B?dmFDaEtaWFZnMzVxQkpaM2xUcWxaU0xGaXVhWVBiREoyODkyVHFZNzFmUEli?=
 =?utf-8?B?ZEpkZnBTZi90czNZMlRMRHJ0SVpRK0x5b2svdDNDK1hpWVBzQUhWcEZLVWUw?=
 =?utf-8?B?VXc2Q3VUYURNWGVvaGxrTUhIYmNRMi81dE1NQVhtS25adFdhRmFITVUxSGd2?=
 =?utf-8?B?Tk51ckdObVo1SWNvTmxQUm90UGQ1a3psdE9rcng2TVRMZmJUMXVOSGxyTjJ5?=
 =?utf-8?B?N3Zrd0t5WkI5UUZaUXU1S1B0Q1ZmR0ZUOXE1YUV1a1RZNXNweXFUM2FqYUl2?=
 =?utf-8?B?T3kvR1k4SnlaTlJjTTZza0IxdTd3azJ3ZzdDM3B3MXA2UlVtMnJnRWRXZjAr?=
 =?utf-8?B?enFVdkNUUlVSWExNOG45aHU1TUpESDl5QUxIbzBxa1RHNDRzYVRRd05xb2dy?=
 =?utf-8?Q?QkNU23a9priN4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zlo3K29FeFFJZ0ZhUGxzYUp6OGxYdTYyZm9JMGI2Z2haL2IweWpQS2ZpY3Vm?=
 =?utf-8?B?L1BwN3UrNHFOMEVJV05pZElmYmQvWjBrWUg3a2I4NjM0WXhyREVIYVg5UUU0?=
 =?utf-8?B?VmZJWklmRzBXeGovR0hmZXVSb1dsTitmZENLamNjM0FmNHFLR1I3S2pSTzl1?=
 =?utf-8?B?UFhBY1F4QkRla3ZoTDZIeGNNNElIWEl2Qy83dTBZd1NTaVdFV1VXWC9WS013?=
 =?utf-8?B?SDg0TzR2OU0ySk5kQmkreHdBb3JYRkNTR3QzRUQxQk5TbWtYL2EzVUhpZklU?=
 =?utf-8?B?MUNvS29FbXRTS0srcnVCclpJQTlTMHdTblZUL1RLM0ZFNkpMY0xZNkkyZXdz?=
 =?utf-8?B?d0VPVEFvVVIrVTJkN25lcFJQOW1TRDB1OUluNndScFZWanYva3dyUjY4UG1B?=
 =?utf-8?B?d3o2ajNBMjA4T282L2wxc2NxaVdTVG1ObTRUMnpMWlNNL3BXZGp3aWVJSkti?=
 =?utf-8?B?VEJUa3R5MjhJbmh0WVVyQUFyKzltbXpldXFHTDNUUzAxZXd6cU1jb2VFVU1N?=
 =?utf-8?B?YS9iemozRkJta0ZyMnZsK2g0c3VicGJ6aXdtanV2N1FrSElNRkNBeXJBLzZw?=
 =?utf-8?B?TkNSaVdBbkIxeVVSVUZwd2RJRTh2ejNka3lnS1NZM1ZodkFrSkpMZVQ3dUlM?=
 =?utf-8?B?V1JFYmp2TkVCZlhZREVmZkZwNkxVVW9WL3hMWUkybU1MMHFvdE8zVXNHeFRq?=
 =?utf-8?B?RVBYdTdZYU9MQWZwM0phdC92bU80Zk43RitoTG5ieTlRcmNWZWpKNkZyUkYx?=
 =?utf-8?B?NytWcDdnNVFHdURIQlpjRjFWQ0U1bG1jSGswU0RKcDZmc1VSdFpzRTRyM3ZP?=
 =?utf-8?B?NWpxVU5JcEI4WmJZMHFqWUJRSDBIVGRySGlPZDNnOHptNldHdnlNSEd1Rm05?=
 =?utf-8?B?VkYyRSt3NlJOb3JWNE1Ec1I4ZFNjbkt2NExHZVVEZEJ2T21QUmRGRWlMY1A0?=
 =?utf-8?B?d0UvU0xvdGN2dFFUbkxYOUZrT2hNZUN5OFZIQzd3OUpuRk9Cc2J1T0JENUZP?=
 =?utf-8?B?dm0vQUdRc2ZoSzdtZkhocW0rV0hyTmloU0gzYWNXM1JvWTEweFZUMEF5OTJt?=
 =?utf-8?B?QlF6ZmRvWENvaUc0aXNDR1lZaytWZGduNzdKem5hTGRYTzMyQW4rMUpkOExS?=
 =?utf-8?B?SzJ0dnBGUUtRQTc5UXk3M0lRWjN0V3dPSmQ0a0NqR0V4VFFGSExnRjdLK3ZB?=
 =?utf-8?B?YWVvZGEyVlN4VUhmV2RUbHJlVFRjUkhoVjlTYmJDQW05TS9kU1gyK2hLczM1?=
 =?utf-8?B?bmQvaTlRVmNyOEttczhMQ3VFTm5uWFZOUFJOaFdPbE9xa3czVnQrM0NxK1d0?=
 =?utf-8?B?bGRVZVEyTWdsYzMranNOTCtqamRrRXFKeE9kWnZHRFE2b3ZXUUM0c3lURk9h?=
 =?utf-8?B?U3QwWEpscDNNUGdhcnlLd29KdUd0WndHcjdGNkFwd0hONlE0RlZEa2dDQmxF?=
 =?utf-8?B?SDVpUEEwVkp2djlhN3N2REtTYmJlc21JUlNiSHFvZndGTTRBeDhJd1NnY1R4?=
 =?utf-8?B?bTI4NmQwTjlLaUNURnZVeDd0Vm1DV1BiWFZsSEcvTU85d3dZekM5Y3pxbkFL?=
 =?utf-8?B?MU5MSEtabXBQdnUyczl4bXd6NndLc3VDT1pkSE9jNGtTa1Zra2RzRFhCelVx?=
 =?utf-8?B?QnltdGtuOFJQVmxUWEczNTBVTGM5d01OdmdBS2pHWmFheHJIUFFSQldqWThE?=
 =?utf-8?B?ZStmUnpvOUJ6RE9RalZjMU5hcE4wdExLR0Fqc2hvY1k1azVyTy9VK3NtQ2RM?=
 =?utf-8?B?MWFhb2U3Q0c1U0ZYTjQ1RTJxZVk2ZHZNRFY3QnNpeGxtNHhkUCtkS1BZZVdG?=
 =?utf-8?B?MGVCZE8wQTgvU0VtSk1maWRtcEMvcnVFWjJIazFXa3l5QUFCTHRLUllHU1dM?=
 =?utf-8?B?ME95enFrU3Vzb0dLekJ6WUU4am95UHVyUXlmTU1KS29FVTlFK2hrT2tlTzF6?=
 =?utf-8?B?SDl5NzdxclIxNWZDZ3F2akp3bGxuK1Vxb0M5M2RUbDkycUd0Sks4OU84c3VY?=
 =?utf-8?B?blhwVWllK0JIbW5PdTJQTTRZSHB4Q2JyL3FmYmwvcWx6YnBDR045aXJXVUd3?=
 =?utf-8?B?TUZwMHdHWHNqRTFIWVc1NisrZWdyV3Eyd1FqbTk3VmV3R2tJdzllZXFiL0Mr?=
 =?utf-8?Q?iaRvu3gGWG9b7barguubZgYTf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251ad719-98b2-4299-6250-08dd73554b3d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:47:13.0304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdU8xAEBFWr8XiDlMZ/39FVMYwOXeecuoFmHYN2ukMrD+EMy0WvYhpL7GYcaK8pH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9053
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

Hi Maxime,

Am 03.04.25 um 17:47 schrieb Maxime Ripard:
> On Thu, Apr 03, 2025 at 09:39:52AM +0200, Christian König wrote:
>>> For the UMA GPU case where there is no device memory or eviction
>>> problem, perhaps a configurable option to just say account memory in
>>> memcg for all allocations done by this process, and state yes you can
>>> work around it with allocation servers or whatever but the behaviour
>>> for well behaved things is at least somewhat defined.
>> We can have that as a workaround, but I think we should approach that
>> differently.
>>
>> With upcoming CXL even coherent device memory is exposed to the core
>> OS as NUMA memory with just a high latency.
>>
>> So both in the CXL and UMA case it actually doesn't make sense to
>> allocate the memory through the driver interfaces any more. With
>> AMDGPU for example we are just replicating mbind()/madvise() within
>> the driver.
>>
>> Instead what the DRM subsystem should aim for is to allocate memory
>> using the normal core OS functionality and then import it into the
>> driver.
>>
>> AMD, NVidia and Intel have HMM working for quite a while now but it
>> has some limitations, especially on the performance side.
>>
>> So for AMDGPU we are currently evaluating udmabuf as alternative. That
>> seems to be working fine with different NUMA nodes, is perfectly memcg
>> accounted and gives you a DMA-buf which can be imported everywhere.
>>
>> The only show stopper might be the allocation performance, but even if
>> that's the case I think the ongoing folio work will properly resolve
>> that.
> I mean, no, the showstopper to that is that using udmabuf has the
> assumption that you have an IOMMU for every device doing DMA, which is
> absolutely not true on !x86 platforms.
>
> It might be true for all GPUs, but it certainly isn't for display
> controllers, and it's not either for codecs, ISPs, and cameras.
>
> And then there's the other assumption that all memory is under the
> memory allocator control, which isn't the case on most recent platforms
> either.
>
> We *need* to take CMA into account there, all the carved-out, device
> specific memory regions, and the memory regions that aren't even under
> Linux supervision like protected memory that is typically handled by the
> firmware and all you get is a dma-buf.
>
> Saying that it's how you want to workaround it on AMD is absolutely
> fine, but DRM as a whole should certainly not aim for that, because it
> can't.

A bunch of good points you bring up here but it sounds like you misunderstood me a bit.

I'm certainly *not* saying that we should push for udmabuf for everything, that is clearly use case specific.

For use cases like CMA or protected carve-out the question what to do doesn't even arise in the first place.

When you have CMA which dynamically steals memory from the core OS then of course it should be accounted to memcg.

When you have carve-out which the core OS memory management doesn't even know about then it should certainly be handled by dmem.

The problematic use cases are the one where a buffer can sometimes be backed by system memory and sometime by something special. For this we don't have a good approach what to do since every approach seems to have a draw back for some use case.

Regards,
Christian.

>
> Maxime

