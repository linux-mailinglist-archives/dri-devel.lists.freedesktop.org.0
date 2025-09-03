Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D53B422DC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 16:01:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094FC10E8A9;
	Wed,  3 Sep 2025 14:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ur8YJvgc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F282910E8A9
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 14:01:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rk8ncEW3Gg68iAP8Ju/23SKsKOhbe09YAjimCzzFVisy0MZ91uaQW18BuXv9NAct7DgETXPLZ/3HOMKrKUMnNoXzb/Zf/AQRxtcR1DbZA8WsLDJ2tzk0uRlnSRiTZPqf3b33sLcNBtQdi9vOD4AGfQOMD21jaQTsw8lWAXYGRrWJcoQiWqCLAuz568y4EsW+3RURkHEVla6mFCROpyzbYN1JmjKizeQf37mGjk1cllgm1mZf6ry5S/YkzBhmFYmtx2eaIXoR0+W2M+NcqnMYOVwR/ey20TwRF329a1VArkIyGDoY36ZAYhFffyp8rlYuOMPCH4gK7XqYSQDzMBfgvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enJ3cSM38wyFtTVCtu2xGfxcbOkAsC6cnKEcqVTjNxM=;
 b=HTdygvWW/kt5TFj2lGmNXWBlbNl9HBVdswmCbA57ql50CmCmvK1w6bJ8M5R8UQrEjwTdvB3rzVb7b5TwE9pWQ5vCbYtWMRBkmSVN+zEIB7REYSDCki5bOHfJewyWCX+h244u8Xst6/i7v5dFFlQUVXIWPddc/0roUptEXv8kEqEmc7zC4lIKc9EvobltJlZKDFDAuZ/v8uOJ2l+c5lgA83E77mwd0FaRgC3PY0zdQ8Q7GzYcL6CyEYDlS7zfm2XMYTeGhMY9VcTI0NKrJMBHcKmXCBsQsSAQI/TxJxFUdJQ9dEdELXWs3Uh8Fw/YWw/kzIjFF3MnpPqJcmdKirrWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enJ3cSM38wyFtTVCtu2xGfxcbOkAsC6cnKEcqVTjNxM=;
 b=ur8YJvgcFlTD1IDzTh94/T5k2r6OOnkDaoj6Zvd1Yk8WaqoSSDQ3+dcweZdtYt1OLQyeqTh2XSlqNGmq2uWfCXN8GY/LMGv/QGhDK9mRA+lk+ymQccINRP8lV/cDJerWBlS4PRX1lLfme5GY+2nguMK8+GUYHA4eFuwaL3E2n0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by SN7PR12MB7154.namprd12.prod.outlook.com (2603:10b6:806:2a5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Wed, 3 Sep
 2025 14:01:26 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::1ac7:adec:34f4:86d1%5]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 14:01:26 +0000
Message-ID: <f168e6db-be8d-43d1-b92c-5463ee5568af@amd.com>
Date: Wed, 3 Sep 2025 16:01:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] drm: xlnx: zynqmp: Add support for X403
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
 <20250425-xilinx-formats-v5-10-c74263231630@ideasonboard.com>
From: "Sagar, Vishal" <vishal.sagar@amd.com>
Content-Language: en-US
In-Reply-To: <20250425-xilinx-formats-v5-10-c74263231630@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0164.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::14) To BL1PR12MB5969.namprd12.prod.outlook.com
 (2603:10b6:208:398::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5969:EE_|SN7PR12MB7154:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fed57e-4f75-4a1e-f77e-08ddeaf25f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNMbVY1bUxwc1BwQS94OUs5YTRGdXJpZmk2ZUR5WFhKRVNjcndXS0pZbzFI?=
 =?utf-8?B?QUZSTXBUZC9BbGFMbWxndkxvVUszcDRxSmZoeEV5VGpUTnhBMmZtYXlTWG5E?=
 =?utf-8?B?MWJGY3JwY0xIeWkxSDJ5ZFdZNTdsUlJ3dW51dyt6OG1VRUd5Sm0zYUxNU3ZK?=
 =?utf-8?B?RXI5d2J5OTVjWTJ5ZGxuSStqSzZTKyt6c09mTmlsMy93d3BoSDk1eVhDb3ZE?=
 =?utf-8?B?TWF6dmMvSlFBTGpoSmZjbkw0a3lwc2d3ODFTM3lKY1JzWEtBejhFZVVCT0RY?=
 =?utf-8?B?Snh4NnA1QVpzY3A2c1N4WkloV2Jib21WcVhBdGJHb1pydWJiNkUrOXYyTm1Y?=
 =?utf-8?B?TEY0RGFURDhxL08wb3ZjZE1yQU90TFFSbXo4NzlHaEsyaUtvZjliaHlGeWNR?=
 =?utf-8?B?ay96MzBFaFlFekJjRUdFWkx4cDA5T2I3akpZTmxRcFlGeHBBODNmMW1mckJS?=
 =?utf-8?B?T0MxV21IS2lyRk8xVlRlTzY1K3dxMVJqRkM2SEpuaXBmR0VyQjVGU3R2ZGdY?=
 =?utf-8?B?M1UxVDJjcTRTVTVFWjBMdUk2cy85Tm5yRDBOWE9DZWpwcEZ6a1VFa21wS0lZ?=
 =?utf-8?B?LzVzSlMvTkRjd3V6NXRha25ZU1dXcXM3bUFhZ0NwZWluMFRoWTE5Vi85ODlW?=
 =?utf-8?B?cjN5Vm8yQ29ncVdFTDlGRGh6MjNkZFhYOXQ4M25vZHRhTnh6VnlyNEt3OURK?=
 =?utf-8?B?L2d0T09PRnJPcWpOUkM2UTVuTDlTY2hYQWlsVUxSRG9obnNnY0RGSDlZRlpV?=
 =?utf-8?B?M3NnWHBmUFBkY040OHU5bmJqNjFaYTZzd0hOK1k4VFI5MHFsYVFkVHREcWpu?=
 =?utf-8?B?eklBczdVUFJJTjVQaXhHMG1oQ01KNFEyY2dyTUZMNTdWS2kvYXY3ZlV2cWlL?=
 =?utf-8?B?RS9lZlFSbHBxa3ozN1ZDY2ovYUdBbkN1NGtWbllyL0taNVJiVVBoRU90S1o0?=
 =?utf-8?B?bnZRZlNhOVJzZmYxRmg1UjJMZE96dnZ1NFkxVkdOSktQZWR4azZKLzVRV2lH?=
 =?utf-8?B?aUhmWlVpU0VWeXljMnZFenY0RC9vcG5KUXJYdFN1L01RWStjdXZYeUJ2R3ky?=
 =?utf-8?B?a2RrTlk5enpaSE1VSE5GUjEyYWZNc2NpWEs5ZllQUUM2VFR0MVExWCsxNjc5?=
 =?utf-8?B?UUV2QWV4ZjdCWFpkN0xFMkFnNFlUUG9SRlE2akIydjE4TjBUMjhtOFZ1N3JY?=
 =?utf-8?B?UmROYU5jRndPN2lSZlRReEFXYXpKc2l6TVIvazBFUnhFSG5QUVdFWlVCdEtF?=
 =?utf-8?B?NVUySGtSWXFVdjMwUmtudDJON2dTRGZIMGY1TVJucVFSZWtTTFJnb3dXRW9K?=
 =?utf-8?B?SkZaZ0tFb2V5VFNkZ0FKaC9UU0hUT2FaZzZQOWl0S3N2TWNlYXZSdkRDTy9I?=
 =?utf-8?B?UDdZRDBpRGk2SExNMUlZbE9PNkR4cXlGaDVZckoxdjNHVVd0WVlQeXRFZElx?=
 =?utf-8?B?N0o4dENablpjZUg4QkpCeWhveHVzem1uRmxFTmZyazdxOU5XSW1qeER5UWFW?=
 =?utf-8?B?NzdLaFV3cUxMYmY0WERGQ2FoemFoU2lJTlB2MURrQTlqSzdzRGhjU1IxV01U?=
 =?utf-8?B?RCsyaGNnaEJHY2taQ095ZE04ajF3NFJOSS9GcVFTenRyb1p4Q09RWTgveVZ6?=
 =?utf-8?B?VEE3ZDYyYm0za1Jab2JxWnE2QnRvdi9XSXJlaHIrTGFRYjZuaTFadlpxd0VP?=
 =?utf-8?B?YWRuNmNYT1dia2xmZWVZSUltUGJKaVJvY2F1OFhLWG9YOUVLeU5NWkJHNEJZ?=
 =?utf-8?B?UGxVM0tmanUwcHlEQjl0enZaL3JIK2RmOHk1dEFKdkdzYUQwOXpoTVNxUnpl?=
 =?utf-8?B?dUYyMjIrMFFBcFlzckF4S0xQK05taFFYTXhCRUtCYjZ4VUNtNVcwQkRxUi91?=
 =?utf-8?B?dGhvOTFlTDlaMzg4SDliWDdDek5ZeDE3VDZQRGhtUVcrTWNQZWhXc2M1NEJy?=
 =?utf-8?Q?r7LfLq25LII=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25vVFkvbUlvNzl4N25GQXpjaTdYQVJRWUgvYnRzci95MDRhckt0RjBlR2xV?=
 =?utf-8?B?anY4OWQrZ29HTUgzVkszeWd3UFlDWGVIMUdJTFc0aG8wWHk4NW4yTE9SY0xQ?=
 =?utf-8?B?VTQwTS82aENralFrR1U5K1JBVXJnM0tXVVkvQXo0UHBQMFM1WjVWUDhOWHdB?=
 =?utf-8?B?TWVvYTVTN0ZwUlZJek5GWHA5NGdYcWVXbVMrcXZFazVOMGR4clE0bTlEMXNv?=
 =?utf-8?B?VVZaOXhPRldQNEFuVFBrTFMrVHdEVWJGREFsMHVrUlNTcEJPZHpydkdYdTJz?=
 =?utf-8?B?akdQY3hxOWZmVHZodnJMa1ZibVllcDNaQzQwbVRzY1A0YkVXRk5lUExuQWVt?=
 =?utf-8?B?TENqWEN5dC8yS0JUTWVKemdTTGJhT2RQZ2VnRm90dFVVN2p1S2tMRFpxMGFR?=
 =?utf-8?B?anFwMmNpMUhvUWRUN3NjYTNFaFlWQi9XQzNrdzdiVUxLN2FRRklGc0dENVhD?=
 =?utf-8?B?YUt2RlZJRDFjd0ZsRll0aHpQcnA0ZDl3Rk9xYlVmb0tuUGxrUkFZMUdkU0tl?=
 =?utf-8?B?Z1FNQ1hRZjJZRE9VbUIyeHFFVXN2VzlLTElBaU1ReEIzNDdleUQ0S0s4ZDZL?=
 =?utf-8?B?VS91cWM3RHREL3QxdFlPbEtyNjRldWozWC9pczNGbnZBeHlnQXp2YzlYU1M0?=
 =?utf-8?B?MVZ4UnkxMk9lUVQyS05ZeWpBM0ZvNHd5eXpXOEtBL3BIcThHdmtLSm1EaVBy?=
 =?utf-8?B?UEJocmN6WUQrT1E4MXU1d2JucURvOUpWZXh3Z0VBc1dpODIzK3B2cVVsa3Vj?=
 =?utf-8?B?bHo5YVdDZVNYck1EbnJOQUxORVA1ckp3UDNMUmMzMFdPVHN3Ulpzdnp4SDRy?=
 =?utf-8?B?TXdSZitUS3VnYS9vWmhQNy9jaXg2YzFya2lINGk4bFVDcGtJQ1RmaURRNUhR?=
 =?utf-8?B?My9OV0tYdHJwTldsbXo0U3hncVZOa3RoZzFhYU9RNGhlcDN6L1dmdmcySy91?=
 =?utf-8?B?ZDZUREtORVU2YmFzUWRhVUVTWW83aElla2VySisyMVZOd1J5dGFHUVdQb3lQ?=
 =?utf-8?B?Vk96azloOU9pWVVOcXUwa3VTazloUW12bmpSejBWKy9VTzd1SEJwT3pwZVk0?=
 =?utf-8?B?SHdlTGV2Nk4wQnpjYUJiWWpBOUNsM1l3bzJ1YkNTQ1dML1lGZCt4OXRCM0VG?=
 =?utf-8?B?dEtnWFR1dmFaZTErMXhDUitxMkJsVEVxQlg0SGsrNkFHblNHaDI2WmdxVCtX?=
 =?utf-8?B?WmJ6OUp0cmlUNWs2M1VNWFZhQktnWEZMdi80Yk42UDNFSytLdExtZlVQeTNU?=
 =?utf-8?B?RnNVclNYWExUdXkwQUJPM1Z0Ym4zcSt1Z2s5dDAyNFM4MldSNWVIbWxoanhV?=
 =?utf-8?B?a0FZY2N0VXJPemhuQnp3d2pQd2RVQ282Z09jeU1NcXdWcU5PeDE2TExRUEs2?=
 =?utf-8?B?YkVRd0dUNnF1TXdLdGdLRFFBYWNETlFPSGpuU1BtbUlJN3JBdS9Tby9LWVNT?=
 =?utf-8?B?Y0srbENuSjdSQWpIeThRQ2hITkVpajk5clJLNk83bVVNc081dnJpdTZrb1BN?=
 =?utf-8?B?b2RIbndkcGxkZ0FBUnhjUVpsbzEvbWxWR01BRWVnTHBVdUwrbnpGa01mNGp6?=
 =?utf-8?B?ZzFCb2h3clVhOVNhNlVNYlBOUkE4OEtuNG9LcnBKaWdlTVptUjNpbEpUbkRG?=
 =?utf-8?B?aFVmZkZHYXMrV3BBZGwwNzZNeGFBckpORGJmKzJ3TFdFZG53T2w3QmRWZHFW?=
 =?utf-8?B?MWRFOUlYNHl3cWxDZ1l1eTIzUWlpV1dBaTdFWUd4djlXQmFmU0Q3bW9zTHBm?=
 =?utf-8?B?MVR0aGFNNXpncC9pa3dEYmIydjVLeG5sUnkvZXd0TU5DWkJvL21obXBNUXRk?=
 =?utf-8?B?ZVZFRDlid1pmOGdRSGRPalFTWGFJTjJGQmEwbmxqVll0emMyc20yVDViS0U1?=
 =?utf-8?B?a1huRmVSVDliOFFJclR4NDNPRC9FbkJrVnhoS2cyUG1IdUZxaklnbzhlakJm?=
 =?utf-8?B?TVR6blpvTnQrcXR6S3RrNGNKaHlWZzNyT2VhTVRxcnJ3eW5iZFNzSWh5YlVR?=
 =?utf-8?B?cHQvcHBuY2Zka3RwYTlHcnBlMHpNZU4xRTR1WjJBZEoxeS96U3FsaUV0MXBu?=
 =?utf-8?B?K0VaWTYyQzlPSFFlYzhOM0dJTzZIK2J4SGxxeG9QY3M1SUNMK3Y4aURFak92?=
 =?utf-8?Q?RiC0hlQwAN1tNUItwZOWp6AV6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fed57e-4f75-4a1e-f77e-08ddeaf25f90
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 14:01:26.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEpU8ZUL7OXhKuHeFNmYf3oMmpWScm5waYeHEBuyuptMsX/INaX2QVfkfi3xvbwe
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

On 4/25/2025 1:01 PM, Tomi Valkeinen wrote:
> Add support for X403 format.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>   drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index fe111fa8cc13..b7cc7a7581ad 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -317,6 +317,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>   		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
>   		.swap		= false,
>   		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_X403,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>   	},
>   };
>   
> 

Thanks for the patch.

Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>

Regards
Vishal Sagar
