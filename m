Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBF0C160D8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F1D10E611;
	Tue, 28 Oct 2025 17:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rcLDVuoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1B010E0D7;
 Tue, 28 Oct 2025 17:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkeQrgc6oeJekCtHuJbVCSZX7U2cpqYKj8w/vba8YAghD2tFlJ3/AAoFivcyJ1gvgQ+Xf4z3TEIshkiswD042US8MebZC6HTqV8zA5CdG/EHFGCmv/aVgI73lB0nqCAAiQ06gh9vr/rTEhPodJPcvFW3VaZPJ2KtqcKuW8iFsZoENnwUBmVLP0+CXzccUwQaU5u9IVbunGMuysy/ntP3g+EFf5WUXD4dlDo5JbDYbdHz+jJBNvSzYo3Ec/tOfuM0Nhbk9GyWMTcipGaB3qsDAv/Rm1G/uJk2zCUtkj+tH3Al23k4KR+iwre06/zNDN0xMksRnbZ/ePIQ5Swf2cU4Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4n68TRcX2UffFvOiuQ17asKgvI8ZSzg4qgnuf5YnYNY=;
 b=SnDqjVIp7kpYoZ5AL+nyZhDE4jQd//VM5CFC5g/bSS1cWYW4SxNJlRCPeZNNMi9y+EBIjybnXc72ZlXF+K+j1XtRSzVMdbeC9tJIoX3fpDjr9yCXYDfm2IR1jO5UHAKlWh6CzBRof6Zpn3KHGn8wSD/NxS27sAxXZkGmZFajNA+bIk9uIz7NRAujdh8SxhpcTIkF+FkKNkbD0SiVWIE6CRwweumvnXGy5/0jDe99Fq8GCWWMAbpI6zWz/PCriMipZqc/sGHa4oHD7jRa4dRHJIQBhcpesNgSwXT2RDE2UruoAL8Yu79Mr1U51O7+YnwGWbBWzp9FeiJhpqfxV2dA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4n68TRcX2UffFvOiuQ17asKgvI8ZSzg4qgnuf5YnYNY=;
 b=rcLDVuoVpdU8dMHGNvDcKH+O1fx8ASdteJubLOt1yq2DdRB9frk8xUzw3yoDmVt5H9oKgfgfPsdz29d6IvwtmGfcAkhVwfgF1m+6Sw8bd23MZhjFnUu+Ns2XugLEntCfgA3Yt7//PZhI1GLc4mDJL2CF8jHx6jS2DelOd5POxYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 17:08:36 +0000
Received: from PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a]) by PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a%5]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 17:08:36 +0000
Message-ID: <8197d961-4f59-4324-bba9-e6879b405673@amd.com>
Date: Tue, 28 Oct 2025 10:08:30 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/22] vfio/pci: Convert all PCI drivers to
 get_region_info_caps
To: Jason Gunthorpe <jgg@nvidia.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, David Airlie
 <airlied@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
References: <19-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
Content-Language: en-US
From: Brett Creeley <bcreeley@amd.com>
In-Reply-To: <19-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::18) To PH0PR12MB7982.namprd12.prod.outlook.com
 (2603:10b6:510:28d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7982:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 242a6d57-dc60-42de-51f1-08de1644a1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW8reEI1VDVnUG5YbjVrOWJkeWpTNTZaT3R0eDY0dCsyMDVSUmdhUkcrUGVq?=
 =?utf-8?B?S21Xd2N1eFRhQmwyUTdIVDZNVzJRN1pnaGJocEd3azB6c0tHcTZnUXV6S2Z1?=
 =?utf-8?B?RGR4YU5IUDNIVnMvL2l1RnFOYnpjOSt5SmRiZkVRTzZzY3o1NHRzMXdQUEc2?=
 =?utf-8?B?Wk1laFFXTEUxTTI2c0pqMG80MWVHSTErSjJWcWZnbTc4VlkzcEVGZXRrNXFJ?=
 =?utf-8?B?NCt1eGFoWDBpczJoYmdXT2JtVVpUQURRaGlWT3ZjNnM0T0dPd2RCcXI3RVMy?=
 =?utf-8?B?SkpZZWhucGlzYUQ4RG9pUHVQejNRWWM1cW1UQVNMQWtBYkNobk9WQ1RJcUpE?=
 =?utf-8?B?U2svcllBT0ZUTEt6eElpNjlaVllqU3ZpRDdpRkU4U0RJRHdxeERwdzRLZUhM?=
 =?utf-8?B?QmN4bEtIQjNTV0Z5b2gxZ2lyQk9SVGhoNnFDWmVoZSs1SzFtejJhSC93Nm9a?=
 =?utf-8?B?RDlxa2QrMlg4TVRXQnBDZHdwbjRxZTNhREQ3enBDbEFDcW9rVkM0aUxVVUww?=
 =?utf-8?B?SjZjUStkUWZpZEFVMXEvVDJqMy9jUU93Y1FadlJ3c08waHNOQlVLUllBMy9u?=
 =?utf-8?B?OW52VFNZSStmT2FBSGFuRHRWdTZEcmU1cEc3dmJsZTc4bm9wV0IxNlNtVTJ5?=
 =?utf-8?B?OTlDbW53ZmQveXpOOXhmc0pkOGFwNlJ2Q1VVOFR3blNGVTJpeHcySEZOWG4r?=
 =?utf-8?B?V0FpNHc1OHF0VGM0Nk4wZGhRUGo4RFhBZzYwZUU2OGgrQ2wySHFwbUIya2l2?=
 =?utf-8?B?bDZxanNscmNwVnV4bytrSWt5V3pvWHdqOFNJVG1MQlZGK0Y0dnBmZ1liY09x?=
 =?utf-8?B?MUIrUEloMHlHL1FIQXZTdXJCbGxQd0FzSWV4TU1UbVRGbUxQbWNZcWZCd0w5?=
 =?utf-8?B?UXZHUS9uWUZKZWpYcVl5VE1oRkkwOGl5RjdxT2pHcW1lRnNFcWhDZkVRcVRP?=
 =?utf-8?B?NXJyakZhYXN6bnhBMjZocG1JU2VDUW5LYlJNQy9vTmdPbndHR1d6TkxQVHp4?=
 =?utf-8?B?NWliZS8wKzVMK3BZYlU5Y2UvSWNGUklCbDZHb0NXT3lLNVN2NHhOYTRqV0Nr?=
 =?utf-8?B?NFlmUGFoM3FocFlTbnpLT2QzUWM4Z2cvcVo3SVNPS0FSNzFxRWpUSU9FNnlv?=
 =?utf-8?B?REhtY092cU9lenNsSnhncnBDVS83Mzdkd01xRFlLeVE1MEo5Y0NjbVBmRTRV?=
 =?utf-8?B?dE5vZ3hSUTF4RUgyMUZWeWE0bktNQ2EveHJsRXJPVE5kWEl3RUU3M2FuN0xP?=
 =?utf-8?B?ZnNQV1FzN1hGV2FMaElBL2d4UGpVNkJFdlRtRkwyTTVLWGdYL2ZoWmllYWdW?=
 =?utf-8?B?dEQ3UDhTdW5SUjZBaFlYemQ5NnhYNHl6NHIwdVlqTWtKalpYSmRnRm8zSnlT?=
 =?utf-8?B?KzRQKzJjeXZ5Y2pycnh6eE9FcllXQzdFWTVUS3NwQXR4MlVOam9RMVhWaUFo?=
 =?utf-8?B?NFVkc0JhZ0JnaHdMZTFERXBRK2tIMksranpaVEVCM0lwYXkxRlM0UC9sNElI?=
 =?utf-8?B?ZCs5VXEzNUl6MnJ1UEpVQXViR3JCMS9lUUNVWXhnby9QYzVIaGhMbE5MYzVp?=
 =?utf-8?B?ZFRsMUU1UGloK3Q5VUZSaGxxbUhHaG5Jenh5MzExeEQrOFRVQlBQOElOL04v?=
 =?utf-8?B?b2dBSHlLbSthRnA5dksvRk01dEhxaENWSU9RUllObTdMbmpvMUFmM3kwbk5z?=
 =?utf-8?B?dWd6YjArTVM4bVpSSGQ0U2NsTm1TLzRRL2p0MTR4YVd0bHNhWlFLTW1Ga2hv?=
 =?utf-8?B?YlN6UGhmaU1EUHNYMXMwNnBic3RNblAzMWYyYnFBeDJRS04yS1c2dXppYkdC?=
 =?utf-8?B?WEQ3Tk9Dc3p2bTkxVUpZOWFDMFR6aDFYMnFKRURhYnFPV2xWYmJobS9hbnpr?=
 =?utf-8?B?dlpRYzRDUEpBUUN0eTk0cmVOMlArNjU2YTVnU2c2RStwUnhxVFZrOHE5dkxJ?=
 =?utf-8?B?bzcvNUFvUjBUWGRhNnRxK2QwOEwyVUtlMW9PNlVLT1BuNDY3UVkrVXNLdWFi?=
 =?utf-8?Q?LjIHXv9RQMjadOv1dw6bDuX6uqDqQA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB7982.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1hxekFYdVhGV1k0MmJaalZyVGFMNi9QUWZ1eUdiQ0xGenBGMDZ6RGpPMGkz?=
 =?utf-8?B?c3JaUWkrYWFPWHRiVnNUV3JlRzZ2R21xT3QyUy8waU1tSU01NlRDajZPS1pk?=
 =?utf-8?B?OWdNYWpUeVIzSEJ2eTJHY1RvcEZScGZtMFQ2b1FTTjlYMW42WGF4Y2NkdkUr?=
 =?utf-8?B?WlViTGFsWi9xdTg2ZWk0TkRvY2UwVS9OT0FlVzJkWEVkWXVUOTFsTHNLZUhw?=
 =?utf-8?B?REF4WHU0SVUzUkZwRWtEaUY1a1REbEZxaGFLeFI1WGtCdVRsVE9XTzlvK1pO?=
 =?utf-8?B?MDRYa1podUQwWFNIZXduTk50U2llN3ZHZ1pIWE1jZWt5R0FNbHlZV0tZN1hQ?=
 =?utf-8?B?dEZRL0xMc3hWTWtFNkVORU1Fb2p4UzltY1JRM1lUc3hIM1JhWU84WnpTOUZi?=
 =?utf-8?B?c2M5ZnJBeXlTQjV3azVtQlZzeWlMYUhpK0Ura1lXWjlFZGc1RGVKVVBMbzlx?=
 =?utf-8?B?Tk9jbDJkZ1U3N1hEU2FxWmpwenVmRE5SNElQcnVhZDZ4YmljcnRsMFF4TU1N?=
 =?utf-8?B?YWpBRGtHOTRCNURna0k5aVY5MkRUdHNzV1lxOE9FRnBVbGdXMmFQVVNOZ2ZE?=
 =?utf-8?B?azhON0VFMkZ6REh5enBwdEdMYXhiY1JNNzY2RjR4R3VTNFR0Ykl4Si84YTcv?=
 =?utf-8?B?RWlocTNRd3RIU3hzTDR6VSt5V1M2U1orb2VvRFhVazAvVWpENzFqKzFZVU9u?=
 =?utf-8?B?TkJ5ajBjRW9wZytZazA0OW03a0VhVlBiWEtYQldkN1F2V1Y3cmRCZUxGNUZY?=
 =?utf-8?B?SDZTY0prN0lDbVpmUnlaVEdVOFNHQ1FLVGpXTUNpSklaWGVlRDMyWjZYUlJm?=
 =?utf-8?B?S1lWdWQxUUtSRFBlcUlrVUNwaktWZ2s3K1lhVWd5ZkRCQ0hsakNNTjhLNW43?=
 =?utf-8?B?cGlZalJXUXNKNXV0TmlXbDNDVUl1bVk2dUN0QjV3MndHWXpBOUpwaytYTmxp?=
 =?utf-8?B?SFlRcTg4WUFzMFNkY1hnb0NMQk83S21Qc2gxODlQQ25GaEcxM0hLSzNvQ3Qx?=
 =?utf-8?B?UEpWVmhjdE9UN1kzU041TGtVcm1xYlVjc2NGNDl3eVdMekg2Z1cwazZQZVZX?=
 =?utf-8?B?b2puU2hzRllRREE2d1F2Z003UllxRUpaYlFxS1pJZVVMR1JWUURyVHBma2lF?=
 =?utf-8?B?MjA4eHFpbDdKZmFySUNsNWdaQURvWGFyVVM5cTRxTFQ0eTVxOHprdFZ4d0d4?=
 =?utf-8?B?Mk9DeWtaT0tIY2dnVi82bTNWazlxSVpZR2FPWVc2c3UvWkR2eDBKUHN3cis1?=
 =?utf-8?B?cUpJL0pjcjV0WDIyQndQaUJ1WGEvYlpqMFRzeEZtOWc1MFh0V0x4YUV2TmFJ?=
 =?utf-8?B?eU9rb0VKM1k2aHgyaUV2NDFtS01DK2hCUW5sU1B0eVIydk9EdWZwMHAzYlVZ?=
 =?utf-8?B?eUc0TlY1N3NHYk9NVGsxdnlGdkxvUS9oNmpFV1doUVNYeXZ3NG5ocThHVGdj?=
 =?utf-8?B?ODIxNnJkRjNZUWE3bm9ZQmJiMGhyVXRiNXZUd1I1ZCs5ZmloUm4zVVk0WHla?=
 =?utf-8?B?eE1OeW5UZXNRN2d6M3FSMitjdlpqV1FWU1lVblZLaG4yTnNqRktYK2FPUWIy?=
 =?utf-8?B?TG83M1RPUVdLK3FDTTMyZVIvTkRlYVVFbjc4ZFZveHo5QWxZcDREWmZ5UlJy?=
 =?utf-8?B?MnZBWVF1ZzJDMTJJcUlRREJvREF1TVdZOCs1cFVNVFJ2c0swWmFBZnkrc0No?=
 =?utf-8?B?bkV3cFdsOEFDeGlkZVU1ZHBoemlNSEo4MXJzczRXek1lenJkajErQ2x0Z3Ey?=
 =?utf-8?B?ZEJqM1FTWHdrc21qaDhQalBpa0o0ZUhydlR5VW1LTGppQ2YzNkR1NnN2MDhw?=
 =?utf-8?B?QUZyay83Zkl1MWxiQjA2a0lMcDJoWUhvcWhROUVSRzFiVGtZZDJEaHo1YmtY?=
 =?utf-8?B?MzI0V3kzQklaSGdRWEo5SkxNblB2S0VMQVd4bTRQeC9XOGp4WS94WEpydStI?=
 =?utf-8?B?ZmM0MEg0SkZXM1QrTlhNWUNXL2lwUnpPdUp1TGZQeGVmSDBvRm1qTEpVelB6?=
 =?utf-8?B?SFpsLzMvVmtEL3IzWjE0eEdINmJKbS8rZmVZNXN2S2Z1bzlUUi9zV3BHdS9z?=
 =?utf-8?B?K3I1Tmt1N1NkU2wwN0FXS3Y0a1hLK3JJZ1V0clpjd2NhYXBoT2s1UjFpZzI2?=
 =?utf-8?Q?Kg7ii+J+UsXRuJJVaAIhoJJaw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 242a6d57-dc60-42de-51f1-08de1644a1a4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7982.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:08:36.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zJsaiHMh0spV9gGE7jB0Oa54Php4I5u9pW10MCMOe9voqrg2BA1J+NAGPNbI4VnRAMyyewnmCdR9vr4W5wBFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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



On 10/23/2025 4:09 PM, Jason Gunthorpe wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Since the core function signature changes it has to flow up to all
> drivers.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  30 ++---
>   drivers/vfio/pci/mlx5/main.c                  |   2 +-
>   drivers/vfio/pci/nvgrace-gpu/main.c           |  51 ++-------
>   drivers/vfio/pci/pds/vfio_dev.c               |   2 +-
>   drivers/vfio/pci/qat/main.c                   |   2 +-
>   drivers/vfio/pci/vfio_pci.c                   |   2 +-
>   drivers/vfio/pci/vfio_pci_core.c              | 103 +++++++-----------
>   drivers/vfio/pci/virtio/common.h              |   3 +-
>   drivers/vfio/pci/virtio/legacy_io.c           |  26 ++---
>   drivers/vfio/pci/virtio/main.c                |   6 +-
>   include/linux/vfio_pci_core.h                 |   3 +-
>   11 files changed, 80 insertions(+), 150 deletions(-)
> 

<snip>

> diff --git a/drivers/vfio/pci/pds/vfio_dev.c b/drivers/vfio/pci/pds/vfio_dev.c
> index 1946bc75d99b49..be103c74e96957 100644
> --- a/drivers/vfio/pci/pds/vfio_dev.c
> +++ b/drivers/vfio/pci/pds/vfio_dev.c
> @@ -195,7 +195,7 @@ static const struct vfio_device_ops pds_vfio_ops = {
>          .open_device = pds_vfio_open_device,
>          .close_device = pds_vfio_close_device,
>          .ioctl = vfio_pci_core_ioctl,
> -       .get_region_info = vfio_pci_ioctl_get_region_info,
> +       .get_region_info_caps = vfio_pci_ioctl_get_region_info,
>          .device_feature = vfio_pci_core_ioctl_feature,
>          .read = vfio_pci_core_read,
>          .write = vfio_pci_core_write,

LGTM. Thanks.

Reviewed-by: Brett Creeley <brett.creeley@amd.com>

<snip>
