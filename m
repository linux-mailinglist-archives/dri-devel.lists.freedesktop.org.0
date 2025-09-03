Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5492B422D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F3510E8A6;
	Wed,  3 Sep 2025 14:00:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5d/Es24n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8563610E8A8
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:00:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4FMf6OpAuSxm1zdvnoXM/7AGo4bv/yp72VvezGjaKDczvGGJJMsZxaqzc3/D7bvKac1UpP7Re/qFTzxjEum433BaoWi3ymq25TRmhG/tlWQMlzrGs39Yko1VKTEx/9opk6mZEzXKwPJ8sxQy7NqKV9w3UhZ8qtuPMA3b7fHSnalYrwLg+cxexHy+4cx1H89sqKVIWWKqvdANP7h8Fft1JgcxkRA45LTRPziVQmfwxetNd/OHaulakfO4V4kfiZqhOyNFDZYQk64heRooHWP5aPusiwoIgcdLYChx3hiMim0daQ8WIJh1wMC4WX2yGbQahET7YbHjLq6MdGhOid4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jHNuBBqz2EMWerHyG2Co/nRTa1it6n2SGQ/pC/opkw=;
 b=xw5n7r/1A1g+66jP9+r3u72VM7b+JkyveZ+oSjyJls+S2QKSsf1COAR2Ni65FdI2+S39hSUIVNeLztnn7yXuAELwlf9oyReKRSuG1OJEH3wz/3y8ln9cmv7qU2BBu9157noyf+VGCyj6Wr7Vv3d4ZnPQ8MQWR/t9YKIsG/I2WwYfUR5eMsc5h7P5C7s7vw5mdffWttOQxyXkXtmY5wZ2G/WKc67t3p8dPkIrp+Umfes/o8QCmWvu9zlPXhIBUNNSkntSJ3KXPX52BHJ0tr7S5nn9y68qTsaxunXvRtarVtL1xvRecMEL+zgGOLBax+H7mIcNnYbhsYjU6jSKXHyuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jHNuBBqz2EMWerHyG2Co/nRTa1it6n2SGQ/pC/opkw=;
 b=5d/Es24nbKY9YIrOCLyYondVeAtbrG1uP+hL9io/ZTxsgJd4O9vUVAcgmIFBTVmvpAcZQcmPMGwG365XirfXyjCsNpLzlfRq6DF7pEp0xnczVq4ARiU0a5uf+9IVl+bn77XBMFItO2vGuUAppAthdsW3+YC1kEZFsAiPbqaJkhw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 14:00:49 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 14:00:48 +0000
Message-ID: <5d369cbd-50b6-4a99-bece-5df559fa7706@amd.com>
Date: Wed, 3 Sep 2025 16:00:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/11] drm: xlnx: zynqmp: Add support for XV15 & XV20
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
 <20250425-xilinx-formats-v5-8-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-8-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR02CA0009.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::14) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: d84d76b7-8e54-420d-8805-08ddeaf248a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3NoWnFMd1FjQjN4eXFwdmk3VFliQXhBM1R6ZmdGbVhiNitpdFIzT2lBbW9x?=
 =?utf-8?B?NEo5aTFrYi83UHEzamhCNEIvU0t3TXFNTHBpcEhvaW96MUtRSS9EMkVuQjJa?=
 =?utf-8?B?cCtKN2JBTkRBMHNtUTlMMDhEYkVpdk5TMmlHcDczOE1CcFI4Smc3eWwvRGRO?=
 =?utf-8?B?TlNCeHpXajFHSkJpcHJFQldSODJVRWRFdjJNdTNQRlg2aTN2RkpVR2ltWTll?=
 =?utf-8?B?QzJiK04xYXBZS3BvTmpla1U5UDBaSmRlTVM1cjBnalRTckVDb203a05pSjVG?=
 =?utf-8?B?cks1Y3pSK1BCL25uYTRHWmx2WG9BbWZLQkxKZ2VmWmdLYktyd3NGcS9ER3Nz?=
 =?utf-8?B?R05WZjlPaXFmc01UNUdOVXQvWmtWTDVIMExPeHRBZkZ2KzRaOVBqS29KVzhN?=
 =?utf-8?B?Q09hMitTbVlnYy9vektZNHpwOEg2aDZnK28rdzJpeUNObnlCQ3I1Q0xiOG1C?=
 =?utf-8?B?b21pV1FPME8vQjRlZ0VSVXplaXBVbWlKL2ZvcE1memR5SHR3S0psVExxbUYz?=
 =?utf-8?B?V1JRcUZIbkdNT3JHejFsMkt2RmR0QVY3VEdIWWlHa1cwQk1FZnd6bnpuWTVk?=
 =?utf-8?B?M3lNM2E5K09oR3VJUTRKbDIxSjdGbCtWYWtnL2JVbkNGL1AvSUVyd0UyUDAw?=
 =?utf-8?B?SmpqdTV2dWcyaFl2ZUN0UXRLYVJKYWlVS05OR1RwYmpzZ3AzZ25IUytXclhM?=
 =?utf-8?B?MldhN1pmcXhEOUFnQWtPVVF4WnFTR2NVYUVUTzVKNTRBaGg4amV5emNoL3Js?=
 =?utf-8?B?bER1ZmJOMGZWR05hVS9LYjRpV2xDRnRlMDVXd3U0eCs1c2ZVcXVVdFpVK2xB?=
 =?utf-8?B?SERteFV1aTN2bkRJdjZOM0RzNzhxYkdGZDg2UFM1T28rcERORFNCWFdQUjJ1?=
 =?utf-8?B?NXd2WWhuVjVqNjF0Yml5RXlFOUw1aVQ2QlV6RmxNME53RStoeUY5Mm0rN1cy?=
 =?utf-8?B?eXI2VjNBZ0ptNDJReFdSTFhPUE9Cc04zVld3QllsNk9vbjJrUDVKYmltN3lm?=
 =?utf-8?B?SDdTMW5NbUFQWHlWbWsyR1drMGd6WUhaL0VhS1NEUVlGL2hSdlIxZVFMcmVp?=
 =?utf-8?B?NFg3SVV5NGFINGpFMjhzMXhsSVZFSGZNZEduZlF3YjRCaGxwbmFWaTBPNFBn?=
 =?utf-8?B?Z3NkZTlPWkxUWjUydmZacTFOQWNKOVlXQnd0WG5aTi8rVE5lYzFLd1JBSmhZ?=
 =?utf-8?B?c1FDWnVnSWNETTQ2dU5xODB0alZBcDQ4WmdQKy9mK0gycExQVUxrcTdiMzl4?=
 =?utf-8?B?OGhFSnF2c1VmWHVtVE5EUm9SWGM3SHIrTzZMKy9mdUlGT3QybGpBYzIrcVhJ?=
 =?utf-8?B?aUsrOWRJNk9TRlRITG1weHNRK00zcUpiVWZ4eERHbGVQK3cvRVljK29TOTF6?=
 =?utf-8?B?d0UyelNBS3FockFyeXVrVWoraVpSem1wVXQxTzVDWlZGQ0tPa1M2MHkxZEtp?=
 =?utf-8?B?dCtCVEJrV1ZBUGRIMytlTG4xOTh0aVhiUEl3a0QvVGE4bnQ0LzNCUDdUSHZO?=
 =?utf-8?B?SDhkVUU1Z0NOYzlmMDhBZjlDWWNoSFpLdkh4VmpobStURG1LaFFkTUJrWjlx?=
 =?utf-8?B?Zm1aRDdEZXR4a1NPQThkdzVZekxUbVVEYW9rZk9Edmo1WnRtNU9oeE9XR1F2?=
 =?utf-8?B?QXp6VkNTWGhVSEkzN0YzVzFqc3NMRnUyT1JIQUZ4QUJNdW5sUHNIeHRGS2ZM?=
 =?utf-8?B?UFhCZXkvak02aEl4VWRidWh0N3RRVWhEc2o1T0c4eXZjelA2MWZaSDRibE00?=
 =?utf-8?B?Vzc2L2lkYWFNU0J5SFFCcGxvOHdRVDhTQkcxdWYrOVUwYm5qMVVQN2xkZGJB?=
 =?utf-8?B?UDEyZmdtaTg3SnVCMjhFZjFsZm1lYlpkVXRuY1lzM2hoQUk4bC9EMmlnRUZy?=
 =?utf-8?B?VUpEN1VHcWo2azFScG5GUUY2cDNVRXJ3ci9nU1pyQnU5dnIyWktBNThqZGJK?=
 =?utf-8?Q?fRWWTRx+gAo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDNMOGNrek1ueGMrMDh5dk9zbjVlZmVsK3hvWFZTVENSQTVETXRHc3IxWERN?=
 =?utf-8?B?QkNWak13NzBrVXNCOGR5N2hjbU1acG5YL3BiNkV3VjhKUVJkRURkQ3lwTndK?=
 =?utf-8?B?VytaWHZYS2tKemJOYzF3Zm5VZnNXb0wwSm56QnV5VXZQWUhhdnhxLzh3WnJr?=
 =?utf-8?B?L1RXS2g3VlM5QXVLM1FUY25hVUxhOWZiTXhZbFBTRTJ4MXJLUXlFclVUcWtn?=
 =?utf-8?B?aklYcmNtdmdUdFU2QVN3bG5qQTZDQkZDZzh3MHBpNkJMNWxMcCt4bUlveE00?=
 =?utf-8?B?MHUzQnoybE0zWWJwbW9uaG8rY2V1Y3QydlE5YldocWw4ak9qRk5ndHlaQ3Yw?=
 =?utf-8?B?UGxxbERPek5jUU1JaHpCeTFocHRQTkpYQzNkYkJZUEhkYkFXTVQwUEFqOU85?=
 =?utf-8?B?UXN5cTFjdmpGdlBvS1UzWS9LWkduc01VQjRqa3h1T2U2MjVrcEczeU0xU1hu?=
 =?utf-8?B?SnRpamxHeFdodWZVZXV1elNKaEFOWUZ2S0YrWlBYVjJmMW1QZklBR2xkeUpW?=
 =?utf-8?B?NW11ZG12OXVvY2oya2FKUTVSVmlITjNLS3NRMkdJUlM1L1ZQR2RvN1FuMUtz?=
 =?utf-8?B?a2czS0lxNUdZanYvSTlIUzVFZ0hqaldqMVVqbEVUNFo5RmhGS0ZuKzl4MDVp?=
 =?utf-8?B?L3R1REdRWGczUFpacitUY2QvYnYrblpRNHMwQnVnL2pOTlpRNElhYmdKdnJu?=
 =?utf-8?B?K0NQS0R4cjluczR2bDJiU200WXgyUVRnblhBT2x6YzE1KzFOZ29Fck1xeCtV?=
 =?utf-8?B?SlQyN2lvN1l5cSs3OU5scFlaYzYvYXd4WThZN1lrVUFDUUY5NEZxN21GTE53?=
 =?utf-8?B?ckNqWnV2Q05hZ1lOMmpVMDVwWGlJaFNYZG8wa1JMMXFxalc1YWpNb1RGbzN0?=
 =?utf-8?B?SDlNVVFZMUkzUzh1M0hOZEFIelIwd2tMWnA3NmJvUDhIUjY2QjBCL014QzIz?=
 =?utf-8?B?bnVqUGxzdTdScmh5OWxqSTByNld5aHBCSUpkUFFwUzlXQm85Q0d4NmFHMW9E?=
 =?utf-8?B?R0txN0oreGF1S25NUnFFL3A5WXIzd0lWOUloWFBtMUo3cVQvNUN3MS9WNVd6?=
 =?utf-8?B?RnNGVnJKTzVMUEhIQ09Sd2hCc0V1M1JVUVovMGo0N3JqWS80NDhEczRXVmFG?=
 =?utf-8?B?S0pMU0ZMaUlwbGZ0dlRwVHlqM3U2MEZNQVBmODRBREFIWFdJZ3ZvK2xueDI2?=
 =?utf-8?B?MWFJU05FdE5GalFiTURGWkpaQjJnOXR3VGsvRDh0L3YwekZBU2M1ODNhai93?=
 =?utf-8?B?UW83MHVmbmlLMHdnZ0Ewejl5TVcvYklPT1lqUUJIcTR3TW5zU0tzbFIySVhE?=
 =?utf-8?B?dkE3ZTVBclhvWXRxOGNSWGx1OE5iMHFxcCs0ZjlYOUNlRG1PL21kRUZyak8x?=
 =?utf-8?B?eXNocjdkZlpWS24yc3FrRzE4RkdKMnJtK0hJM21DWkhEYzI5NVBVSkZMRVM3?=
 =?utf-8?B?VFNuQmM5MjdLUWY4Q0dsMGJaeWZMMlk1dG45eU9oNWN4cU9NeVM3M2F5UVM4?=
 =?utf-8?B?RDVBaWkvQlBEeC9xUmtwM3RlU0h6RVllNXp3Q3ZNN3JSOGxEeXoyK1RvYXV0?=
 =?utf-8?B?SWVFRmVnMlBZc1djT1o4REJDRHVPZzA3cVpKeTVkZzVadXFQd2JjNWxjcXZN?=
 =?utf-8?B?S055QU5MSVBMVm1kMG8rVUhvMHQyOHlNV1orQTJnUTZHeDlwd0ZNRk1DRWdv?=
 =?utf-8?B?NXZ3d0lRaFo2Wk03MEVhdU1tNXIxalhlaGVSSnIwUTQwdWVmdU1BYWtzUEpu?=
 =?utf-8?B?VU5aUGpvWGl1Q21wZWxwVlc4QnowZFpUUUdTUG1zM1VCN0lHdWxRbTVuRHQw?=
 =?utf-8?B?dVY2Q2haTG53QzBzZm92aVdBcFNlUEJneDJ3bUhqMzNtaHlhaFJONDlDaXNV?=
 =?utf-8?B?aEtxVDlZdFFma2tWU2xaek5kaWNQMDE1VmZERHljWFdiS1JKYlV1a2lVNUNW?=
 =?utf-8?B?NHhWY3hOSWtNMkZEMXNXMCsvOVBrdWptOFp3MHZJL2lObDNYbk5tQzNyZzdt?=
 =?utf-8?B?UlBjaStZWklEY3VJREhQTnEyOWNSU0ZUZmplOFhzZEpBRkt0RUwwWHNrb0p5?=
 =?utf-8?B?cEhRdHN0c1lHVldkUi9md0F6NXpUckR4V0RYNTVUaVFmTWM4VWVjUEZTeTho?=
 =?utf-8?Q?C7a05A6HCsRKcj/emwiB2VFgs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84d76b7-8e54-420d-8805-08ddeaf248a8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:00:48.5613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z4DGSlDgRol+vs5y6txiY/TwL78rpI5IgN5I019Z+xu3yr1P/ZhAJ6VL7jSox2vw
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
> Add support for XV15 & XV20 formats.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index b9883ea2d03e..1dc77f2e4262 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -297,6 +297,16 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420,
>   		.swap		= true,
>   		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XV15,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_420_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XV20,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV16CI_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>   	},
>   };
>   
> 

This looks good.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
