Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F70BB422E1
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5AB10E8AA;
	Wed,  3 Sep 2025 14:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I90r8IFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BD310E8AA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBe7YIgpEVkqaHLDyGX4DSce+M06mql8MWvZz4bbgT7u2z03rxKfbVwhS4JlVVIxKmDj4PyVHuEhbMRgmhEUJ+zByGL85J+q+KPxU+NBr4Jr4EWwHKtysqHvtgnwDRxoFgGt2fnOLF7A4TQG4diQJG2QKwbkLyfSJP/zEst+UEPjuAOary8MKolezY4mfzx5qyAAfNrUljXpqh62K7M3kykv+puFrbNDiuh6nDKhgbedetFXDrVxp/ucvdzZ7ETWfGXegqNXy/23jWb5gOfe5VGJ1IH9sipVAAXgD7iX99LwCBaiP+EiliveZa70KWG5GvKQ33etQmcQMiH35vnTQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3ZU34ScHjDppS3jFMXq6El24hP6FOyJh34xQFMxl5I=;
 b=QFG98kH+ABNhdE3wDwrRHWBm4iAhpGQ0+1LwuTbTpHpm6oAfrZ44ctmKK+h7WIsDwJg5mivLJ/PXsVEbBWw8luVZ9aJ0YdF4+50QhLi2EgL9EWBVvM85GnYB1CP1ZnCkk6pPs2caSjGjy1t6KswiFlH6kyRBz74YwxivnFRS+sz6gWnDUbxLxKJFilIMfkRmo5R/ODKuyT3qxznMR+1LUnjyf03S9U+bN3V1CezKb8tteMxQugR64n6XbLudxgJsp+f61MT67yUhzzmUc+YkbjaVhaTuxW0Sz6ZdqvUwpXbn9dmyPoEp6C5AcoP5JHX1JGTbO9x220QHdSjURK9BzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3ZU34ScHjDppS3jFMXq6El24hP6FOyJh34xQFMxl5I=;
 b=I90r8IFbXv6YHIKetCZe1huwN4oUP2lwgWN4LRUj1i5a2TF/oKMFFqrA2gqHZCbqAB0U7gEIFx0DK9oZbFC0JHBE2UmtG5bvGMwIHk5fxIZzrRbusa6UXEtZOIeupFo/ZNQT+Q78T+Y49FageLSzz+GlPl4JFN9FL3/IvN1jriU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 14:01:39 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 14:01:39 +0000
Message-ID: <8f4fda7e-38a4-440d-9464-3facb10742a2@amd.com>
Date: Wed, 3 Sep 2025 16:01:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] drm: xlnx: zynqmp: Add support for XVUY2101010
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20250425-xilinx-formats-v5-0-c74263231630@ideasonboard.com>
 <20250425-xilinx-formats-v5-11-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-11-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::38) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|DM4PR12MB5986:EE_
X-MS-Office365-Filtering-Correlation-Id: 34caa164-90b6-4531-e5f1-08ddeaf266fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1FMdkdKZkdnQk1BY09FdGd3VTJMN2tVL3VnUFRmUFBoeTMvdkQ1MnRtVFVO?=
 =?utf-8?B?S29yS3NDVWZzOXpuUkpUYW1nOEd4dXFPbVkxVjd3M1I0Y2IrbGlzVVQxNVc5?=
 =?utf-8?B?ZEFPaG0wV21vOExVQzhDU1ZzTk12K1o3aC9TZFRxMGp0eUYrMUdtMWI5TjJY?=
 =?utf-8?B?WEVxbFMyeEFZemF5UUF3eSs0aGo1a2lyMlNwbFp2UUpLK0tEcXZrQmEwb05E?=
 =?utf-8?B?cHJCU1VZRnNZcmtVMnphblh2MTlqNEhnZlVQdDJPeGh0YnRPc2l5S0tESzd6?=
 =?utf-8?B?TFBRUmVNOWpZNkVmR1lrUG5lT2tUUGIyUzkzZklLekZWdGt1VXhEZGRVNWRI?=
 =?utf-8?B?TDRoeEhCK016WjhkZVpKc1VJNWI1VTVweVhUNU5sRkZvMlhic1R6a09tckhD?=
 =?utf-8?B?M1owOVZVaEJyV1I4QkMyaXhWOHJUNTAwd054SkN0SEFwNWRzNkE4VStSNWx2?=
 =?utf-8?B?YUczclhiMDFEWEh2WjN1dUVlUCt3eVF6dVFGQlJvUmZyS0VtUTdjdTF3UHZp?=
 =?utf-8?B?aEFlbHBkcSt1OEtKS1F5a09DaHB3NGt6UFdOTnFud0RJQmVnRFlxQmhrdTBx?=
 =?utf-8?B?U1FGb3JlREhSUUszOEtrZE9oSmdEeGIzOEJuMDhrMnQxRW9KYUxvek5ucjMx?=
 =?utf-8?B?Wk41U1Z0anJ1b1N5Q0VvN2t2c1lPWmVjWWQzVVZKdjdxZnZRZ3k1NlJNeTFK?=
 =?utf-8?B?U3ZuMGFXdnZXU0RCeW9RTEp4c3BMZ2JpZVZxRUx4b0tWN3FIcWxNZmxxVjh6?=
 =?utf-8?B?NXNIb25La1ZwVVZta2ZpbnNaRFRXUUlLcS9wUzBxRFdreHhQOWdBWjcvejFG?=
 =?utf-8?B?NFJoREZPejRLWHBKYUcvWkJYdzkzaFdMUlRrL3VoN0t3YUg1KzdmWEdiWWo4?=
 =?utf-8?B?U3VQbUZYV081czAzS1d2M29uUjFKdGhrb2tLYW5RaWc4dWNGQzV2YUN1MkE5?=
 =?utf-8?B?d3NDbWVNTldsRENjQjBHZjRzMEMveTVwekxqdktCMGwxWjU5QzFBZjZQbXo2?=
 =?utf-8?B?dzB5RjlXSU5TSmF0Smt6NzQyWXRmZUxaMHFEU01sVEwyUFhWU3pQRmJnb1ly?=
 =?utf-8?B?SmYyamN6TnREQk5QcHNMWEYzRlhvUkhIR1dNeEE1NEM1ZGRwYk9kaG5TMDF2?=
 =?utf-8?B?dHB1S0NRWm9ZU3U3bDRkNGFqOHhXMTVhbEdnTFRrZkhndGVTZHJvd0I0SSty?=
 =?utf-8?B?MUNMeVJWZ3BRdWd6S3c0eVgreXpxb1RwNzJKTTU1UU80NXFBWFBZQjNDdGlz?=
 =?utf-8?B?QWJlQzZGQjJKMzVBd2N2Z3doS0ordWowc001VWFDSjNwUThVOHFIZGEyNGIv?=
 =?utf-8?B?VnFYUHVXSHo3amY3UERYZVAzMExTRjYraWVESGRUNWxYUC9FZE1KcC9WNHNu?=
 =?utf-8?B?SklTcjl0QzR0dDYzSEUzeTMyQ1o4dElOdllTbnc1YnUyNmozWFJycU1VMlJD?=
 =?utf-8?B?LzNLUkR4NjZlaTErZTZPNTBwSUlWdzNpSHBxYXF4M3hobmhQRU9XS0t3SzZ3?=
 =?utf-8?B?QzlYaytNakdsZVVpTmtoWVNvclRhbDVQUUFzL2ZzcXRXUTN0RlRRclZFL2JH?=
 =?utf-8?B?V2lBelNvalZVRldTYS91M3V5VHlQQ1B1TFFJQVhVOUdxOTB5UTJTcG1VUFVC?=
 =?utf-8?B?Y0o3UHlxd3VEb2JTTmdENHRvb2FLNDJmU2xSdXgyV3JXdkE3dCtsL0pnNFRM?=
 =?utf-8?B?YUVCKzhta2x0c2pzZFdtUXZ4SDRjSmdNUWk1cFRXYzFRcmhmQVlLNUsrZlha?=
 =?utf-8?B?ZWI0UVllb0QxOEU1QU9kcGhtSXcvUnVGZUNUUDdZM2p5MHM0RXkrRWZjNzFa?=
 =?utf-8?B?NDBQMER0Q201VXQ5WHVxVzlrc1RFbXJVeVdzN1NVaXozVGlsZjJqQ2V3YWNw?=
 =?utf-8?B?KzhqUm4weVJxTXBlY0xIUDJCeVdiWEl3YXlWbnNKcVFKb3FJK0lOTG93YUxh?=
 =?utf-8?Q?Pifb+YATUSw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R09YTE5YUEozcGFVSnVtYUxna2ZHdGVaeGJsVXZJdTIxU1RQL0RWdDQ4bUs3?=
 =?utf-8?B?OGpabElNdUJkMEdLTFl3cEpTMS9oSlNrdnJBN0Foc2lyL3VFVlBuR2RudzBN?=
 =?utf-8?B?dUI0WkFQaGxNWU5JY3ZnaDllRDMybnFYajA2VGFpVXk0MlI4dkIwb3JVN0VT?=
 =?utf-8?B?OGpBaXRabktETEN5TGtDcEhlVzZnbEp2ZGFrOXQ0bStzM0oreFlEUUYrdStm?=
 =?utf-8?B?M3pjVnhUUStRcU1PcEhrZnIzcElOVFlwU0dld3ZnRndiU2xCMUNRcGQrazBK?=
 =?utf-8?B?Ymo2a0lpNG5pL1BvUGl3ZDgzSFlGWHY2Z1JpQkVNZ1p4RlJHREhzSE9ZQ1RL?=
 =?utf-8?B?aDVKSXpOd3p2ek9tUzJmQ3hxbEdrV2NPamRJRFhiY0JRbWdMMExKaXBKc2E0?=
 =?utf-8?B?YkRhQVhtZ1JzWHd1M1RBVmJaZXRkVk5HSlVsYmtvL3E3My92M01pT3ZlZk44?=
 =?utf-8?B?ZFp2cnFUbzBma2dyc002dGZlbzVBMkRQRHBiajNtQ2UvUUdKUFZYRzdyaStU?=
 =?utf-8?B?LzNVWmtuVDVOVmRObG1NdlJmbHRDUllWWVZqSTNxbW01dExhRUJyLzExTVVq?=
 =?utf-8?B?WVl0NXRKL0ZVTG1OSk9ERFJ1emJFMGdlU0hKcGFzNUxXaUNndkp6RmYzNkht?=
 =?utf-8?B?TmVIWWpiN2lJMmlZOGVXVzUrOVJ2WExWRDgwRnQ4TlhtRHBlNjFPTGFvVTg0?=
 =?utf-8?B?RFlPREVjRU1wdkZFOW5pL3ZRSm04aVk3K0YxOWlTeHhkblJORkt2eDZZSWVO?=
 =?utf-8?B?cllFU2k3L25paVFqbEVPNS9JejR1SUhqNi9qekd6eEpQd1QwTVFNNjRUMFV0?=
 =?utf-8?B?WnRYTGZyZmFTcHpPTXMwRUJ4M05iSDdJRXVncmJKQ1NCdEV0bGd1dTFRd09C?=
 =?utf-8?B?REh2aVJqNTZZMlplYVUzb2d2UVEwS01YSGpldmkxVktLLzhDczA0bXVSVHl1?=
 =?utf-8?B?VWtWTFQwakM4dXBPOGlISVR2VnBxeEpTcVdaa2tUYy9PWFNMRW82b1ZXVHhP?=
 =?utf-8?B?azhKRGxzaG9INUt2VTBwYXA3OG8xVGFLOTdkdkl0Z3FNM1ZJT055aTNMejBN?=
 =?utf-8?B?WTZpSUtGMGpvMzU4VG1xalR5VmRuTXRKN2E5cnJOZDBHRnh0MFUzdkFLc3NN?=
 =?utf-8?B?V2ZFWE4rZ2orVm9TTCtCTGV2THEySVRhZ3hkU0liVUgvbDFtR3dEVHVFY2lt?=
 =?utf-8?B?d2UyZU84VU9sMHF6Z2ZaZis4ZzFEVTlaeERtZXFrczBmY2hMYXFhbkVEUGZD?=
 =?utf-8?B?aDJpMkFHTSt1djRoNnN6M0hHK011bUlBMnFHT21kd3E3OEg3WFZxWkFYemly?=
 =?utf-8?B?R2t2TzYybi82WnFOTDBDdTk1VzRuV05MdHBicHNMenF1SkNlUGRydytDQm5j?=
 =?utf-8?B?OHNCaEVlTFYxWTJIa010TW1YQW90OGRMdTJCbDRqVWp4QnZOMjZlR3ZOSzQ2?=
 =?utf-8?B?c3ZNeDRlejFGRU5SeENYQzBoM0ZoRjVlcjgwSHlDZHRPODBvVTRWa093dlpC?=
 =?utf-8?B?RmxOaXVoQ1ZhbTQ5UXhjcjJ1WTQxd25Da0hnWFhCZmNWRHRRUXJkY2dsdXd1?=
 =?utf-8?B?enhhZmdqbUVNS0w4UGlaaG91ZG9PZHJDTWFYbmh5cXdyZnRjRnZTeHl0cjZS?=
 =?utf-8?B?RHAyc0l3Ty9EUE9tZEtIdG91NU1rWkZBWVZlZFVuclJRS3BNZi8zSFZDWlZV?=
 =?utf-8?B?d2Z2YlZsaEUyRmxnTHJFNWV6WS9jMktjNTNHYzVDUGozalVyWkhzZjgwaHhO?=
 =?utf-8?B?dnZlQ3BGdFdiMUJXNitKYU1FZFFKb2I2RGtBRnVVK1ZFdnp4YjNaYjllemZD?=
 =?utf-8?B?d0pFSklBWjVCUFFWUVRmMFB0cHZRRWhybDMxRTREVUsyS0p5UWxnNVR5NE16?=
 =?utf-8?B?QXZMaFBSVnM4UE92VWw2dHo3NkdLZHA5RkJSWmMxditDclQrYzJiOGd2K0Q0?=
 =?utf-8?B?MDlRa3dwYkZoUExUTHJZMWRiTnlNcHlWa1hHVXRpTHpMT0Q1NmVicjh6eXU4?=
 =?utf-8?B?Y29YZnVCU0xRclZ4b1JvQ0RHRWU0VzZDdUc1dnZxU29USTQ3OERVS1Y2UENy?=
 =?utf-8?B?bHJyMXp4ZENSNkxRT01ETmZ3R3Y2cy9XWm1YNVVqZkRsSWpoVWI5Rm5hb2RE?=
 =?utf-8?Q?MqGPU6n9QGqgVpds2fA+56A/U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34caa164-90b6-4531-e5f1-08ddeaf266fe
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:01:39.0379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9JuMfUyhwzbv4/4ol0hBMob/zUOYfUCs4TqIrsTaLlV5tjBhhSo0OgYTML5I1YP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
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

Hi Tomi,

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add support for XVUY2101010 format.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index b7cc7a7581ad..f548f375750e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -322,6 +322,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
>   		.swap		= false,
>   		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XVUY2101010,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YUV444_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>   	},
>   };
>   
> 

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
