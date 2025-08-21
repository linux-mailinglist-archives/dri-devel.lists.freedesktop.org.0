Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A340BB2F2D1
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 10:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6E510E2E8;
	Thu, 21 Aug 2025 08:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FMImhAAL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2073.outbound.protection.outlook.com [40.107.96.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB6410E2E8;
 Thu, 21 Aug 2025 08:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjzL4hfOAwuFjhebq4dJ8vMyg3M6Kd+cvk2kjZJQVhEiNdz2BjBdNMM/nR2Zvf6bnhyM5rBYoqr5YQdiboW57Zy6oxEgvTnzTLjTyUSL6zT7gtOft6600t+u9doiInzA7TfzZpSp2G/TnmmYlvJBL4Jr/sGnZB0xBYbcTEFp9EQRba6kaw2n0nBcbwlXXChMZEsWuLaKSXWr4Htsxv8beHCoPDYL6Q/8jWKdJeKyYG+Uw26wgFlQATu6H6LbMeMZ1iSh7psBqke6twuwrysq0Mu4YOyS0/eYZM074G3P//DK7Uv26YewoDgjBQkEaEP+picTr7jNoP+3Un3J6dRn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcjGG3+6NqNEe/uPPNKUtDx3C9+WrDbslVRi77eTBAg=;
 b=gbxI5QjjaWpZRGE6fd8Og92MGC0PHgV6VKXxq9PdYHyxBpFbeXE/sC9C8Rk4cL8/v6wTcfPYoMsydJ0MlPb+UPS29AD1WGjuGeqj0h+WZ8oNNzoeatOSFs/sKKR4uafa/zPhUUv6tB0c5oZITBJWbJ1Hj3NbhdxRv8qrlQKvtPUHK3816v/PnIBU+iHHuH0q86oILMxPWYoCU9B4gQetFciHkTg0J6zNBmpzGLRLtPTj+JdDXArNoGG3gq0o2I/XY6KbsmLYLWIH33kH9nwZqzj3ekHS9PLjbC90JjlgM0eFoNiM9FuI0zR0+QJm75uQpVRP4kdnislnXoaT5NPJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcjGG3+6NqNEe/uPPNKUtDx3C9+WrDbslVRi77eTBAg=;
 b=FMImhAALDtVq9jDTAiXY7bg/VwnyBrgjFYtvdG4GN+/ibPfFEQwZHPbJ2esftVPhyKPOpBDXlQtc8CBEJBPNnlH9U2mhC2y5Z4SyH034NsWTD23Sq/swMPaDRGPJRo29zHCL2oUIvXVJ+yeOt5uH3Li/ayc+miT54JZlKTrzTHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6493.namprd12.prod.outlook.com (2603:10b6:8:b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 21 Aug
 2025 08:51:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 08:51:45 +0000
Message-ID: <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
Date: Thu, 21 Aug 2025 10:51:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amdgpu: Pin buffers while vmap'ing exported
 dma-buf objects
To: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
 oushixiong@kylinos.cn, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250821064031.39090-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250821064031.39090-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 537c9e0b-4be1-424a-271a-08dde08ff504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTdGbENHa1Q1dWdrNFJObU5zTkdCNFBsU2ZOWlp1emcxUTIxRjBTOGRhenpM?=
 =?utf-8?B?MFhpUHlLMVU0aStBOVh3dFgxWXdjSkxuUzFZUWRoeTh1QzUrK0E4dGFueE1V?=
 =?utf-8?B?OGFxK2xSem9pT21tZTRjR0F0QVNvc0V4b2NYMlJGK1VpbjN0eDRVVWFPN3Aw?=
 =?utf-8?B?TElFeUhnVDRtcHRhczhPY0ZLQks5bXhyNGVneTJCaDJBK1d2eE8rQmxQbStl?=
 =?utf-8?B?V1M0cTdpWncvNWwxUGYyYTJtcUVYQVdhTXF6S1hpbUQvb1U3RFdJNkxIQ2xK?=
 =?utf-8?B?VGFZOTZXSTQ5VVJZaXZlckNyTFRRUDZENHBGczl6bXdKZHBBNndxZDZSWGd4?=
 =?utf-8?B?bW1JWXBoSE84ZkE3OWxlWmNCcnhVZmViQi93MlFKZG92UklRS1RPdzNqb0Zp?=
 =?utf-8?B?VFZ6OVZVcU5FRVZpc3E5c1dBQkNhSG9ZYlhsZVAxZXJvMkhSWDdaazBTZUFh?=
 =?utf-8?B?cXFoZGdyU0d6T2gxMzhyZllqZnlNeXdPdkZZNU44T3VoSGxRMGFYeHdMWEVN?=
 =?utf-8?B?bjNFbUo3QUIzNzNBc0Y5MUFYekdnd0YrS0R2OXU5WFhremFlSzYvNDBaanVX?=
 =?utf-8?B?N0w5NU5rdGJ5THBJNERIbys2ZVkzUWxtNVNPT3FaUUxWeW5xOTJ2WW5JT2Mr?=
 =?utf-8?B?MW5xY0VkZVpsa1hsZ3ZLNGx5bmlMY0l1L01lUTl5MmtzbFl5OU5ZOHlxN3Fp?=
 =?utf-8?B?OHM2THF3UnNjT0RDam1lbU9HUnErcGkvZGNCQ21IS3d4TWhraGZTVVJ6TVJU?=
 =?utf-8?B?YVFXMmhOOGRMRnR5MzFDK1YwbHgwTm5NWndCb0taOWZMVWpIT1BEOEttMllz?=
 =?utf-8?B?U1FLL2JYNjZ5c0NtZU1udzQ1NWZ1QXJFWGZGQW9tN1RzWkhqU2ZHT2daTW85?=
 =?utf-8?B?aENHVTYwNWRBQ3VaZkZLWWgxaW5sMERVaGt6TVRHclAxU092NmwxS0pjUzVB?=
 =?utf-8?B?S0EwaXFMU2lWNHRQVHc2bXRadkZHc2tVVkhQc2dpYjd3bCtCSEJaTGpkaG9X?=
 =?utf-8?B?RVhSdXY3NG85c2U1SFljd2xKck5VSkJhWFdzYlZUTVc5cGhidzUxQ1dGNnRD?=
 =?utf-8?B?azREZW4yeEJXMDFXZU52NGVxd2hwVldJa3Z3Z2VLUDUxTHMyNDV5TDREVFJD?=
 =?utf-8?B?cWpwcWV1UGswSUFyTUEvcktqNTZRQzFmcUEzdzM5Qm83Z0FqY0IwWHlhdFYv?=
 =?utf-8?B?UjJ2WVFVVDdIN0czRVlXeGRVNVhKSUpvTHNrRlRUM3RMak5IRTJxVzNEbUVC?=
 =?utf-8?B?dzhtcDBRVHE5eG12aE5GbzRiZGI1QTdza0lsdnkwQzdaY3hUczdPb3NJdkhs?=
 =?utf-8?B?ekQ3cXpybkpNTnkwQy9uUlVzbmdHNnNvWWcvMm9wVy9PSkdUeWtpcHp3UmFM?=
 =?utf-8?B?dk9yVGVYYUxnSHI1K1UvenNUTTEzNG5IeThvVVVnbVJGV2RvUk1zUjNUaEJh?=
 =?utf-8?B?Zzl2Z0lleU94K0h6Mlpxc1lEcVRSbW9obGUvZnkyeWpwejdFcXNwMUFiV0RG?=
 =?utf-8?B?SVhuMlNlNEw4R0h5RVFvSWNuWmFnekJVUWxWKzNmV3lwWnFnWUNNa3p5aEpI?=
 =?utf-8?B?M1hNd0JGeUVRZ2NMcDlrTWdWdDFmSzlqL1lGRDkwR1J1YVdZRHhKbmRJWGVq?=
 =?utf-8?B?aitqN20zc3VmL3RjUC90VGFFTnhnMDh4TGxNZHptOVlxbFUvU25EZXd0N3g3?=
 =?utf-8?B?cGhoODhwM2ZKaFQ3Qm5kWVFqdlhKcjlIbFloRFBIWDVSdG1lZ1lCZFk4V1NO?=
 =?utf-8?B?cENzVWNKVnlVaWxUQlQ5TzdrK1llMUpzTWkwbVhEeUNQakNZMWR1OFBucjlo?=
 =?utf-8?B?eSsxc0J0dEF4aHY3VTJsY0Y1cWRzczNERkI3T2xjU0ZuV0pOUXNQcXNEL0lv?=
 =?utf-8?B?cTBHZ052Z2t5S2pRdmFWRWhoR1h5UHJoWFdaYlptaVdIWlhuc1hnU3J3dG9L?=
 =?utf-8?Q?l/gq9dvfR5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk40V2NrVGZCNnF2LzFUNm5VQVpocUJIbkVUSjVzaVp2bUtiOHFBVUN1NkZ3?=
 =?utf-8?B?QXY1Z09PSDVsR2Fsd245d1haZEhhdGlUQzZ1OGVVUzFJN2VreDRTZFBXTlRi?=
 =?utf-8?B?VlZLQi9Oc0xYTG16SHB0ck9IeFg3VWV0SUlJZ3JvVjIydUxtaUN5dzNKYVht?=
 =?utf-8?B?cktkdVhOcDVjZHhLNTI1TFY1UytCSTJZOFhvQmxpdjJNMVpHaC9iK2NXQW5i?=
 =?utf-8?B?RWNHV3VkR1lZZVl5dnBCZ2VGc3c1REFMQlZvSThyVDg4RDRwS0wwRFJIYU5z?=
 =?utf-8?B?ejNTVHNXM0lSQ2NDc3N4Vlk1WlM0TnVRMm1NTEpQYVZZY2FwWi93YSs2Z0Zv?=
 =?utf-8?B?RWw4NzdEMVZmRDRkMFZWWngxNFhvcUl1MzVzU1ZjVWpXM2N2OS9xVkIweTk0?=
 =?utf-8?B?elQzOS91WE1DOXhZMTVrTTFIM0tpL2lOQzZ5aXhLZEpXbDlibkZ4M21oanNO?=
 =?utf-8?B?S2h1TkZ1VjViclRnTmgrRlN0OUZJNXV0SmxXdm5BOVJkM0QwQTd6YWVEUUJz?=
 =?utf-8?B?d2RBRGwycVhFdnFUMzM5M2xZWG1oTVdtUDFsSnlvcUhLU3dxZWZadlZNaXJy?=
 =?utf-8?B?eDF6Nm15S2RSaW1UTUZqQzBvb2c0RndBZjEwakZjdVhKR1FCdHFWQ2xsYXZ3?=
 =?utf-8?B?aEtoWENQa0tTNkJyQndVMEFmRzBVZkliR2lGM0pWU1psVHlXK1BnTWQ0MEpH?=
 =?utf-8?B?U3FGK3RCNmNndzhrNFZvdWppRmNLY3h1TWd4RHJvOVcvT29sVmtBZldLMXBH?=
 =?utf-8?B?WUZXdUQ4WUU4YS9FOWk2MXJxVHVOMVBJajNUOHcyU2RzR1N6bjFaODNpSEZl?=
 =?utf-8?B?L2VHc0dFZFVrdXBqUWVwajJOVGFMb3k1VHMwVW9wMWpMc2ljQmdJSzFEbzk1?=
 =?utf-8?B?djdJV1dzMjNwY2VtbEN3ZDZHRkxveWk0bjhENWdKbkhtdUNzOW5IcnZET3hh?=
 =?utf-8?B?ZmVIOEN4amdtMkM5WmYxZXJMNUZrc2V1alZYQzJLMDZLNXRBaDZneFhEdzN0?=
 =?utf-8?B?QnovMzdvd3M3UVE5Q0ZwRThXWTJOMnZUazhJd3kwU0RQU0tpMytna2dSVVNv?=
 =?utf-8?B?VjI4aWtvQm5IOG5Jcjh4MkViZGxtbjRHbVhabmV4b21JWk44YzNqY1dEYUVs?=
 =?utf-8?B?YmNSaDFnUWF5aWNuV3FOWVFtNHVKNW9hSHZBcFFlWEJvUTN0a2RlS3pvYzM2?=
 =?utf-8?B?WThXaEJndUF4eU0zTDlTYVlLVVprY3NoVlNXT3VRVzZlSHhyYlBlMTJjd1hI?=
 =?utf-8?B?TWxpY0p5MVpZZ1BMeUVrNFpFOXhGaVJWMDRhcHNyYlVXL1NjRlF5MXNlVzFB?=
 =?utf-8?B?U3NTQ0VPVmx1M054VHZJMzB3dnFsS0Fqa2VGMFdkdWtUQUQ1VjRUcWxUWUhD?=
 =?utf-8?B?R1R5elFQczhTMnJJYXRrTm13UEhmbE9rYlNNMEV4VDFLVDZYQUNhbWNzOElG?=
 =?utf-8?B?cHJXWVhMWlRxNjJLUlFmak5MN1l3UHpDSU5ObWV0NDJtRDIrdlQvcTJwUWdh?=
 =?utf-8?B?SEgxeHdodHFnN2hEOFFySUI4K0ViK3k2blFibmk5NWhtOGVwU3J1b1RVNExW?=
 =?utf-8?B?YkE4eGMvMUhGQWMvcGlodnV4cFhFbFRNTEhqZ3ZhYU1WUFNrKzFUcHluYnhy?=
 =?utf-8?B?UzNjS2VvYm9VVytHSldoR3dlMXJLTmljWjZ5blZsZDU2d0RiSVpoNEk2YWVE?=
 =?utf-8?B?dkJBeTFjVVFCSlkrQXpGSGliOU9JeDg3VllTOHVXMC8zTUlaSElUQllJbmUr?=
 =?utf-8?B?MERkaDZESHRyTmNKVTNtQmVWVmprTVkwR1VEMmcyVU9DU1g2dnJjSnBkZnV0?=
 =?utf-8?B?NWpXOTAwY2daRTVjVkN5c3FKQVNWRVFYaEd5eXlsazlVc1c5WDZoZjVEeFpr?=
 =?utf-8?B?dWVTbjhVbFV5bU40elEraHJySWhZakdLVVc0a2lqVVZVWGQxbnFIU3hFZjYv?=
 =?utf-8?B?dG05dzRNVkMrNE5sNEllc3NaWkZLMHRtTUE1LzFJUlJaWlV1RFg1c1BOSnY2?=
 =?utf-8?B?MmszeWJCcElCWnZzNSt4a1ZRdkl4b3UwYnpnUHNkN1pzdmNobmUvaUUrWWZz?=
 =?utf-8?B?NGdzWURmY3RMck8rMUpWTU5jTDVIYmpXM1NhZFFNR21KWGlKSFhUYitLaVpD?=
 =?utf-8?Q?DuQF0BZrrBU/1G6WpOPxiGILq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 537c9e0b-4be1-424a-271a-08dde08ff504
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:51:45.5640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZJHPEKrlUT8GLWiDIqxpNRCDvPUbMnF/+6/Ok2qSRpQeNIRPrcNQwKzpKvX/Bam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6493
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



On 21.08.25 08:40, Thomas Zimmermann wrote:
> Current dma-buf vmap semantics require that the mapped buffer remains
> in place until the corresponding vunmap has completed.
> 
> For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
> an S/G table in import. GEM-SHMEN can now import dma-buf objects without
> creating the S/G table, so the pin is missing. Leads to page-fault errors,
> such as the one shown below.
> 
> [  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
> [...]
> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> [...]
> [  102.243250] Call Trace:
> [  102.245695]  <TASK>
> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
> [  102.251805]  ? __lock_acquire+0x568/0xae0
> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> [  102.265379]  ? local_clock_noinstr+0xb/0x100
> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
> [  102.274246]  ? mark_held_locks+0x40/0x70
> [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
> [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
> [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
> [  102.333622]  commit_tail+0x204/0x330
> [...]
> [  102.529946] ---[ end trace 0000000000000000 ]---
> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> 
> In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
> dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
> mapping.
> 
> Provide a custom dma-buf vmap method in amdgpu that pins the object before
> mapping it's buffer's pages into kernel address space. Do the opposite in
> vunmap.
> 
> Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
> While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
> to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
> instead of its GEM code.
> 
> A discussion of various approaches to solving the problem is available
> at [1].
> 
> v3:
> - try (GTT | VRAM); drop CPU domain (Christian)
> v2:
> - only use mapable domains (Christian)
> - try pinning to domains in preferred order
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
> Cc: Shixiong Ou <oushixiong@kylinos.cn>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 34 +++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 5743ebb2f1b7..ce27cb5bb05e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -285,6 +285,36 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return ret;
>  }
>  
> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	int ret;
> +
> +	/*
> +	 * Pin to keep buffer in place while it's vmap'ed. The actual
> +	 * domain is not that important as long as it's mapable. Using
> +	 * GTT and VRAM should be compatible with most use cases.
> +	 */
> +	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMAIN_VRAM);
> +	if (ret)
> +		return ret;
> +	ret = drm_gem_dmabuf_vmap(dma_buf, map);
> +	if (ret)
> +		amdgpu_bo_unpin(bo);
> +
> +	return ret;
> +}
> +
> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +
> +	drm_gem_dmabuf_vunmap(dma_buf, map);
> +	amdgpu_bo_unpin(bo);
> +}
> +
>  const struct dma_buf_ops amdgpu_dmabuf_ops = {
>  	.attach = amdgpu_dma_buf_attach,
>  	.pin = amdgpu_dma_buf_pin,
> @@ -294,8 +324,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>  	.release = drm_gem_dmabuf_release,
>  	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>  	.mmap = drm_gem_dmabuf_mmap,
> -	.vmap = drm_gem_dmabuf_vmap,
> -	.vunmap = drm_gem_dmabuf_vunmap,
> +	.vmap = amdgpu_dma_buf_vmap,
> +	.vunmap = amdgpu_dma_buf_vunmap,
>  };
>  
>  /**

