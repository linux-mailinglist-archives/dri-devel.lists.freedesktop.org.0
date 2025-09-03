Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E386BB422DA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D727C10E8A8;
	Wed,  3 Sep 2025 14:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="stbi0X4t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05DA10E8A8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEISLt3alkaBzoc2PEpHAJalt8chE6pz4cswMZgCtU8DvWth3V4i0/kSxB6LpRE/+Yb6aQJwVXtDL6uJtHBTkItCXx79VsKaoajvwuXnmhiumW0GQW3g7+wafY1wJgoqGuqOi8k7QQvW64kbo6yP0c9je06pgEYZHbvOtZ5xO0zjt6e8R9H1Jv94DolO5792CR0B0VFjnSARhSSgEC4DO07AXhEBP2jJ62w3oQOoxyetP0CLH+hz2sxLYqIUhbsybLG3qK4jiY7fhAhjtLQkXJPUJmvf1JIStzRt2YpcfDlxYI7f0U3LaQaRPpPRi3Chf2Iwc7wJqYyie+FNbP1TWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRURdmOHhD+62mlOnr/51Us25pnSqp+z0Zx8hyylsb0=;
 b=ZbMmYFJtd0CV9j4JWP1UzJiVs5Si/IBx2pF82/eI0yh/q15a8jLrk9a3evMtHifST1u8G2V2NJwCU8HpcDbdubJZnAE9d37W2yY+m+rSN5mfdnzbYIaezEj9qRUIZMfW8LezzZ/7QV3GIOckSDsvQLRvkTLe64r/kBeACFzy3/qrobG1fqMjbhBTNqXAAkd/kAyY7YNm0aT244vYIrXE3Fjwvim5ZYDJ4wOLiBsy0/3ESyek2mSAzOfEg5yRu/Mo3zTQv/v8A2RrEmcgMFL24E+imQ+EhPn5J1+mIRxIEyqSE9sheIUcslVBZ473bEi9M4eneeQhBAASIHB0YA6snQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRURdmOHhD+62mlOnr/51Us25pnSqp+z0Zx8hyylsb0=;
 b=stbi0X4tS20Vesc6P2JFOgLx54Dl8bQGNjr242JppfZkk8RcvrqeBqa8O9su4M+Hi3URwb9fPzTj57mufByWhW3zpcDg0ZzV3eB6nvmUSEa/iK3UykHQSHeGqRiNIa23hWz4g9lREgDJnXYQ5Fc3ha7sjoiSG5VI3dF1RIfl6EU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 14:01:08 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 14:01:08 +0000
Message-ID: <f377f304-395c-4c51-ae03-df76da3344b2@amd.com>
Date: Wed, 3 Sep 2025 16:01:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
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
 <20250425-xilinx-formats-v5-9-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-9-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0190.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34d::19) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdc6627-991d-472c-46bf-08ddeaf254ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXV2bFo5NHNSNmwwUmM1djI3eWV4anFiSU5rYmQxTkhySitaSTZzTHZ2QXJI?=
 =?utf-8?B?RFNzdldvcU1tc1pWTDFEenpRYVpCQzl6aVZVMXk1ejNBRzFNY05aMkdMU3cv?=
 =?utf-8?B?U05rM2JaQTRSVHRZM1REamdLa0lsSnRlR05CR3VNSjlBS3piM0l3aW4xNjZ5?=
 =?utf-8?B?OU5aRHpUbnpJa3pEK0FtOGhqR2hXUVZ6REJzL3FqRXEvREt4ZE1ZMnVyUUI2?=
 =?utf-8?B?SSt6WXFrckwzZTdmMlJMRkRxalltVmNKSHFCL1g1TlhTNCsvdGo1ZHcrQVFh?=
 =?utf-8?B?S0NSeDV2d2pqdnlTbTRkVkQ2ZERBWVp3cVdYaE85SWhVRGVtRjdpMy9ibU9l?=
 =?utf-8?B?WnRnV1lzWGJBRFdhNnpYaEdpK0tkYjN6SnBCTEx4VjhOWENOa2p5NVBTbzJo?=
 =?utf-8?B?eDBCZUJ4aThUM3lrQzNBRUJLVERsNldSQjdweWs0aElVTXdyUXhSTk5hWFhQ?=
 =?utf-8?B?NnBnQmlVUkpSdGRDeDdKQ3FYRGUzalQ1NlFkMTFZc25QcTNJVW1tcEJVcC9m?=
 =?utf-8?B?VDhwczZONFl0U1RaQ1Y5dVV2dHpGRHlmNmc3YnUrcDI1MGNJTGpEVDU5U0Zp?=
 =?utf-8?B?VEkvNXNKQllvTEU3b1d2eWV6S1VyVzg4OWVHbzdtSlI2eGhPWEZrVEsra0ZP?=
 =?utf-8?B?UE5FOWZXS1ZPTjB5c0h2MnVSU2k2S2djTTRqMU9GWjExWno0VjNLMGlLZTA4?=
 =?utf-8?B?azk0Zy84NFdlUmJuUkMvNVBMZEhQNjkrM3RVTktDdGdBY1B3RmlmL05NOGtJ?=
 =?utf-8?B?VXVPbkNmZVQxdVFjMk5Cd1pSbmFrT2QrMSs4MDBhb2NFY1hxL0pZN0YzbUhq?=
 =?utf-8?B?ZTI0SmdOR0Vna2drTHhPaHJ4dHFBd05CdjEweVhGekRtRFNnekxtc1VKNlJ5?=
 =?utf-8?B?dDlNdy9oRDJFcFJLOG16RGR3dEpaakhnVE82eEhEV0lkbFFPQnZMN2lVMmZu?=
 =?utf-8?B?WjVoY2d0NnVIblhCSTZ2R2pVY0dPSks3ZlU1aUVzU3QxdzBjK2tqSVBBaFhi?=
 =?utf-8?B?cm1hTExlUGhUN3YyWHVKMUtwa0VpVGRSdHFUK2FWdEllVjZQTkEwZVJubUtV?=
 =?utf-8?B?aE5pMitCditTalEzQ1l4YjFnT0pCaE9sOEtkeFhsbXJGZDhhUHNSOUszMkI0?=
 =?utf-8?B?MWNEdkdBT1lwWkIwSnhoTG5NN29ZdzMzRmhXZ1l0bGhmRzM5UDJPamxBcVNq?=
 =?utf-8?B?MDh2THJFTFo4Y05tTFdIKzFYcHpaYTQ4NnpxWGRUdEFld2djaGhWMGZKWlpJ?=
 =?utf-8?B?WVVkK2ZQTVkxMlFLOWhpd1N0NjBrczU3dWR3NTZodUxxbkhuelowNG51M2dl?=
 =?utf-8?B?ZVBmSG1oWGwwYUo5WTBtRWc3QTVZekhKRmVTZjd0MkpFWjRYZkxxc3JiaDRG?=
 =?utf-8?B?dnh3WGtRdmgyeUVOSkVXNlhKTm42Y3k5K2R2eGZiZFYxSHdYSnpGL1NpaTNT?=
 =?utf-8?B?cytlZmxYUXpyM0hvOWRhTW5USGpoUjZ5Ly81QXc1WVRPeFphREMzMisyc3Bu?=
 =?utf-8?B?R2JQQ1BQbW1BU3VLWUdlSXNxOUZ6ajYzZkVhZDEvZ0J0OW5iMytDQkZNeVkz?=
 =?utf-8?B?cy9HL05FSDk0T0s5Y05NMXp0Y2kweVpYbzJmbDFTM2kzNU5zUjQ4TS9xNUZU?=
 =?utf-8?B?THNDNGs1OXgvSXN2OGJyZDZrM0QxMU5YM0tsTmhiU0JlcHZxeHNJeG9tS2lx?=
 =?utf-8?B?SDhZU050cWxZME5aU3kxbUxrZHoxby9LQnFkbTJNT290RUtrbkdCa3ZYcXkx?=
 =?utf-8?B?ZzRjL0F0M3Q3Vk9YazlsMGs1azdEK0k3TEsvVUhuRkVuMm1XNEgwYkRpZDlB?=
 =?utf-8?B?MlpwU2ovWHZRVnV2S21lNjBzaEpvajRIeURLSVgzRnFlRWk5N3BwSCtOMG9Q?=
 =?utf-8?B?cHdnaS9NSXRqOFdvdDZXNldOVkRKdlJtbTFTKzlVK0t6NlZoTzArVU1CTmJ2?=
 =?utf-8?Q?Vf1MAEvDD1U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2xWUkN3aWJ6YkdubmR1bjBFYjV5MXpXYmtvdFUvMmlhK3B6QUFYdm8rb1Zt?=
 =?utf-8?B?bXNVVCszeFZCMWl2WExpYWRHbTB4K1R6SG1EWHVoMU5BcjZXbHQrR09FZkJU?=
 =?utf-8?B?VGI2SHJXNjFBcTZwSUZCbTlBMWk1RTM2T2xFNXc1dGNRQ0x6MTlkZnZYUmRt?=
 =?utf-8?B?bTVBVkJVOTlXUDNmM0daR0lSY2krZTVxQXFQbUd2bXlNV3I3Y0lyZEdPWE0r?=
 =?utf-8?B?MDIvVDJQaVQ0RnZ1T1lVQzZwWWxqcXBiT3dpdVhkZHdneGJVQmUyQ1FBd3JT?=
 =?utf-8?B?bFNIL0JVU012RUZXSnBrMzFuY051TSt2YmwvL2N3STUralMweVNubVZwQ3dG?=
 =?utf-8?B?NmY4MW1nNG9SYTFoL2hHRkY0ckVXazFiVENCZ3pudWlGb0VHNWpTaUh3eG5D?=
 =?utf-8?B?ZEVFeXk5NHBIb3lMTmdLZ2ViWGNLdUMzdnF2Q2ovcFBjZVAxM3RhR3VLUTJD?=
 =?utf-8?B?SmFIMnluL2FneHVwNVVXVlhUaXBtVm9PaWZudThxRUlTcnk3N3Bvdlh1U0hz?=
 =?utf-8?B?c3d2TWZseC8xeVErTStCWGdiVCtPcDZkNFVnc1hyWTRCQlNiM0luTzZCeDUy?=
 =?utf-8?B?RDMxMHNjTmI1czM4a3liaFdpT0tuUkl5WFR3aDM1VExSQ0ttcmJXOHB5d1do?=
 =?utf-8?B?RE5USHZxZ3UvMmJyRWl3OWZoSE5JZFVieUNXaklmWGdrWThKTFJocmlZQ0Fo?=
 =?utf-8?B?Vm51MWNZMWg4L2xOaU9YSjl4NjFUYk5nMGZDVWF5a1J1V0M5cnUzTUJrZnU3?=
 =?utf-8?B?MlFpMHNRZjBHanZnRXl3L2hsekVteFZvM2dtcWEwYUw5akNBbkpCaUR5TzJ6?=
 =?utf-8?B?WXhXbC95WmM4OEJNSHFKbkt6SFRjU1FJem5oVERrM0pDeGZ0eGY1WC95TzNJ?=
 =?utf-8?B?VTFia2lDaWVGbnlmbzNiMWc3TFZRbGxwUDVFNVB0OE9TdS8xWXJtRE5RN2Jy?=
 =?utf-8?B?TWp3ZXFhbUNubFdxVFRJMURERkUvQytwV0dESlhNSTlxOC8vellNOGcyTkhJ?=
 =?utf-8?B?cEZFYXFLU0d0S1NGZmV1dWUyMzF6MnR4TzUxb2krekh4S09oTEc3QjhwYXVM?=
 =?utf-8?B?dUZtVVh3SGk4QUJSdjdFUnhXcnF1K1B2bno2VTZrUG9lb1IwQjRkZXhuQnhW?=
 =?utf-8?B?YmZsRDdzYXJjQW5wVTNNL3RrZjNTQXlvRmxjcWtyb2t0T1owQTZ1WjRoSVB4?=
 =?utf-8?B?Mkk2UFJ0d3pyQUp6N1ByT1RYMmk1Z2pmdnRpbGZ3VWIxUUZaa0tuaWFURDBi?=
 =?utf-8?B?c1pjNWRLdzFRWlZGWE1xQlp1dHdxNUtmZXVNaUlZcGh0bVA2bGIwTUJtVXdT?=
 =?utf-8?B?VmF4S0ZJTnphNnhYUjVZZ2xSODVDaEJrcXhDQVN0dlN2RDFEYURRUWJXN3JP?=
 =?utf-8?B?ZGVUVFRFWUhEUWk1YUdjbWxSVWpnVms5M2xWcjlSaTdQT0pJbkxCMTdUSDlq?=
 =?utf-8?B?c21IVGRiaVVZNDhLdnh5SzF0WGtxN0tINkVmUmFFS253cmYweTRLQ0RYWWNv?=
 =?utf-8?B?aXVRWWErRVp5eS9jR3EvYjlnMnVUbkpNL2VmSmhjVHdWaUREQTRHWTlCSGV3?=
 =?utf-8?B?bVB2blZ5VkpOWmNyS2JFYTI4M29DZDBpMkpSUndYMG1vSmhUcjNyMEtkQWpG?=
 =?utf-8?B?dmUwWHdpTjI4YmlOaVIvb3AyNVBYZ0lMdk02QXNhamE5MjF3V0VzQVR2TVVu?=
 =?utf-8?B?MDMvd1FGWmdjOGlXZXVHLzhBTmdtSE5FY0c4OHBMZUNyekduYjdEeFFRN3VM?=
 =?utf-8?B?VElQVXhPb1FicVdRVzhjZkF2NENxSG9GYWpNOUUrSElKaGV0TUtaU0RYckR2?=
 =?utf-8?B?ZE1hOWlPNlBWMXMyeTFJajJ4OFgwSmNiQ2hCR2Z0ZnlhQ3JUSyt4Y29maEg1?=
 =?utf-8?B?VGNLVUFUdmxXSUkxOXIrOWtmTHZXWklaalNkc0ZSem1qNDVzak5mY0QrTXU5?=
 =?utf-8?B?VEV6akxFUDNRWjZiTXdtWU1MU0RwZXEwdzBBZlRIOWNBVnM5YUE0QW9Gd1hM?=
 =?utf-8?B?WGROV3NFRW1pNCtiUE1KTWRMMDRZNUp4dUg5aS95MkNxZllCeUhla1M1c1B4?=
 =?utf-8?B?Q1diQU5MRkVtb0tvdDYveTFELyt0UnBQelJIeVRkZ0NJQW1xUzZibkNPMklu?=
 =?utf-8?Q?Ogj50HqRl01lKfHnsymGA0wiJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdc6627-991d-472c-46bf-08ddeaf254ad
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:01:08.2853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28SepwWU53yOpMupU2ex878RTmINNqtZGnJ4g7PtdK2DSmvokngw33Ymk5A3xyJa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7154
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

Thanks for the patch.

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add support for Y8 and Y10_P32 formats. We also need to add new csc
> matrices for the y-only formats.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 1dc77f2e4262..fe111fa8cc13 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -307,6 +307,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
>   		.swap		= false,
>   		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y8,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MONO,
> +		.swap		= false,
> +		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_Y10_P32,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>   	},
>   };
>   
> @@ -697,6 +707,16 @@ static const u32 csc_sdtv_to_rgb_offsets[] = {
>   	0x0, 0x1800, 0x1800
>   };
>   
> +static const u16 csc_sdtv_to_rgb_yonly_matrix[] = {
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +	0x0, 0x0, 0x1000,
> +};
> +
> +static const u32 csc_sdtv_to_rgb_yonly_offsets[] = {
> +	0x0, 0x0, 0x0
> +};
> +
>   /**
>    * zynqmp_disp_blend_set_output_format - Set the output format of the blender
>    * @disp: Display controller
> @@ -846,7 +866,11 @@ static void zynqmp_disp_blend_layer_enable(struct zynqmp_disp *disp,
>   				ZYNQMP_DISP_V_BLEND_LAYER_CONTROL(layer->id),
>   				val);
>   
> -	if (layer->drm_fmt->is_yuv) {
> +	if (layer->drm_fmt->format == DRM_FORMAT_Y8 ||
> +	    layer->drm_fmt->format == DRM_FORMAT_Y10_P32) {
> +		coeffs = csc_sdtv_to_rgb_yonly_matrix;
> +		offsets = csc_sdtv_to_rgb_yonly_offsets;
> +	} else if (layer->drm_fmt->is_yuv) {
>   		coeffs = csc_sdtv_to_rgb_matrix;
>   		offsets = csc_sdtv_to_rgb_offsets;
>   	} else {
> 


This looks good. Feel free to add -

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
