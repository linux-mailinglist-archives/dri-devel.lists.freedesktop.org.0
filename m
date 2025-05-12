Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4DAB3166
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 10:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8B110E317;
	Mon, 12 May 2025 08:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C4bJkmp6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F0810E15F;
 Mon, 12 May 2025 08:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk/4LK/I+RgW7dTRvJE7Kg4h128Q2/0xbLyO+z4QnMp00covUv8SQ9EC91071vWSVKht3h9u0TLaYNUz6pJn3Qf5kBQ9wT3Aqn9GctY/65qNxJFzYPrPVB6YgXD+LENWckykBar+nSk/TX22ql7HSH44r5T7ZWBUyfZAFrDGLlXXBNSsIYmqKNpjj4Cp+B5kUZCKjHfRFsT11EvcgwHXYQG8Z68LWiLUrQJFMEGczuqucsutFMPggXWXSLTXwEgzj/m08VWsSuFuHNc40G6XgyqpQahfdpsCRq/0AfKXAXBzZXK+kO5lnmv/F7c8lOtF05SKO/NDV8ZC7/+fBCQyxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHRjfwFMu783zyrC3Vz+mHr7F5i7h3e08DxC8hWxNNw=;
 b=AfNs2cFPHpn2lmFMzVvoZDYfzrm6mxoHjcZ56H2cPQTvJJuLGIPcsRkdH+Rils3hdcSA7qAXIAiTKRaY7TLhxiV0zcCzwSS0G0cJEKYYIYGW8cdfst5lTOAR6AVQCw40hWgiY0EvyTaP7uM1/76K+NdXEkJW1bLx0hf+OduPJU4SsqmukVDKKa2ay2gpP+OL/TO6nf4qPeYHAXB/SqDRHnpbVoVXG0qwpeRH09dn3KOLwXOnE6rbHuJ2uKPMBWwMdPrZ3mRQZNuVdZz0RR8YAioLmFaTCjQLQ18MaXwLMEE/Bi1qYKCWMfkhA0Q02lwcr4KKtEngUtc2hGVCp/jDnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHRjfwFMu783zyrC3Vz+mHr7F5i7h3e08DxC8hWxNNw=;
 b=C4bJkmp6oAwZH0VBKaJpVCYSjljMHGgyUnWJV0zksKgqap2Nytsc7vwAxd3LEAX4nRsEKFya4r1nfDGas05E8qRsvAa+PaFfQGDN+Spwns1cA8MAutgH36H4FTQ9+5iwh/jNO1uiIT6Z9x1kVujIEii7jYstNoMGdSTEkiiDmCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV2PR12MB5751.namprd12.prod.outlook.com (2603:10b6:408:17d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 08:19:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 08:19:41 +0000
Message-ID: <f75f6d26-ac93-48cb-a9e2-adffe0af1ed8@amd.com>
Date: Mon, 12 May 2025 10:19:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 04/13] dma-fence: Move array and chain checks to flags
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel-dev@igalia.com
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-5-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250509153352.7187-5-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0420.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV2PR12MB5751:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bf64af-ebd6-44fb-5013-08dd912dbe6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFvaUFVUC8vZTJBZ0wxZ1lLS1Z2bVdQN3JJYTB3TTdsM2c5NlBvL29VNFVN?=
 =?utf-8?B?eE5KbjVTbXEvOWRzdEluWUhDOUg2M05pVmw5VlBkdGpvdXZZUTcxTytVNHdw?=
 =?utf-8?B?dTdDR3pwTDFsL2tLZnBHTWJoajB3M2t4S2J1aTRZM0pVT2dLL0t4c3hQV1pw?=
 =?utf-8?B?OEdmMWVUVnpSSHluNWxJSHpuR3E0NnRPdWJKMU4wM0VLYjY2L3dCNW1qd1RB?=
 =?utf-8?B?MmhXWXFsNmZRQUJReFUva0RYdlR3QkhQL2E0b1E1cTB1SDFCYkpHYzlqZWNT?=
 =?utf-8?B?MGxUM3JTcXYrcDBnbU81dG04Z2c5L0g4Rnl0Z0M5N1BXSjRuOHlEd3ZYZm82?=
 =?utf-8?B?a0wxa0duRWFjK2VIamR1Y3V5SmsvRklQRkZoRmpaTkR3S242b01tdTd3YjFu?=
 =?utf-8?B?M1ZpUzhHSDJEcDg1b0hHdlliZlpaMHlJQkFsWWI1K2svQkRiM2loS0M2VmlV?=
 =?utf-8?B?bDRsQURwRzlQNUhiZzNhWUFSVk51SEtDQ2JqTE5iV3VSWUx6TGdWRlRGR0pi?=
 =?utf-8?B?alNQck0vOTdCWFhxUE5wNXc1YzF5QU5MV3ZqTndMQVFySlZpeTl2cGZEb1hD?=
 =?utf-8?B?Vmp5bDllc2VqR1Njb2dJQUtoT2ZjY3lFUEF0TEoxcVJpblB0NFVBMEhqVU5F?=
 =?utf-8?B?bFlSVXZocHVWekVVU1g2T3U4eTZqbVcrOGZxZFUwMFBHekRhRmtoY0UxTG9Y?=
 =?utf-8?B?YldreitwWmF2Y3BkQ0NTVnR5WTUwTjNQdXdvRXRYMnlyOS9teUVXVkdYSzdN?=
 =?utf-8?B?Y1FsNmxMRXNpL1l2b0x0ZUJtWGlNQ2NUeFcyOC9YZDlKcERneXNzd1RlTHBk?=
 =?utf-8?B?OUU5MHBVY0o0d0hqTE84bnRVWnFTNWZwK2RMRGZZSlF6aDZnZWhvK0pmazh1?=
 =?utf-8?B?ZjlUdlExbFNwT0hvYzhSNkxpcW5yb2tGdHBXMjQ0ZkkrdWlnUm4zeDhZalJW?=
 =?utf-8?B?OHFoV1N1M0U2L3lEQ3N5TTQyQkFBZXNWU0R1bU5iWkRuS0lxYlVNUDlKU0ZI?=
 =?utf-8?B?NE5mcUMvTHArMHRZbHJMckZIT1lWanJRT09USkdaNFYrN0VPSHdzbGNldkJh?=
 =?utf-8?B?cWd1U05jNFgwaXg3THFSYU1iTU1ITXYrdGl3b1dud2tWMk5oOGZoVmFpYVpR?=
 =?utf-8?B?d1Q1REtYYy9aOHRFRzMzVXZrNU5rd2FrUmpYeHhGcGFPblBiOFFnczcxUzFI?=
 =?utf-8?B?RE84azBTZkNEV095QW5OTWNqekVXQ0pHUjNUMkpFTzNocFFxS01yRldKQmtt?=
 =?utf-8?B?RHRtQlVoSy9PVk5EZ21YWmZoR1FUNURIN0pyL0JOY1lWVGRJS0VMeE54Yzht?=
 =?utf-8?B?NStwSHRvdlU4VDc4R0ZWUCs5QjNCMjFQMDBhbktWNW10cDRGU3JtdkVpWHky?=
 =?utf-8?B?OUw4c2pUdnJWaVNYellVNU93OTNBdUZVeUc3bGxCYjg1ZzNlRU1iYnpQSlFG?=
 =?utf-8?B?d2ViSm82OGtHeng2bFZqamc4WG9VcllndktwUGZudWF5RW1mamFWYVpRVlh6?=
 =?utf-8?B?dytncTdDaTRTNGFXb3VkTHVBZVpWd1hicXFXRVo3d3oxUzRFZXptVXlaYi9x?=
 =?utf-8?B?a3M5bWZTU0sxK1I5MmFYWTVrZTRXckxweEdyZHZpQWkrTm9iRW1WVmIzS2xB?=
 =?utf-8?B?MUFHQ1g5b2pGQk9HWDNYQzRxeHhuSHJzNHFJZWRyRkZlQTRTU2RGVHFSN1p6?=
 =?utf-8?B?bVpSemwwNlZNOUhnZE5heFRoWWhVU0M4ZTVSTGd4L2FseFBjeENzT2J0NVpH?=
 =?utf-8?B?MS8zNERMc3pxYisvOUdscGFqSWlWOSs1ei9YYnRZYkM3dTM1bmIyUmYwdDVV?=
 =?utf-8?B?Z3VOVXUvM050cWFVYlNTazhSRW1QNWhBdWdnNlowc0NoeE91VmZHVG1sUVFL?=
 =?utf-8?B?TGo1emFDWTRxVW9JdC9Yd3FTUzk2K2RqWkxlYXNDTExBTVZOdnllME5QZzdV?=
 =?utf-8?Q?rL8rNOt9/zA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NpaE9sQ3ZvdEpDUlNWRitCTzZSVGdiOTNlTVlBamZKNkZWOEppSmRnOENX?=
 =?utf-8?B?M2ZDR0dkOXgzZVYvWXE5ekFrdjNsbjVBRWNSdUxEOVY2azVVM0tMWjdHNzFW?=
 =?utf-8?B?eTJjU2k0UHN3S3dsVVJVRTcvUW1samxaejFaSUFDbTd1K2lYMFlwNnByaUV1?=
 =?utf-8?B?L2FJZ1N4VEpIYWxTOWtQSTcyQjBJRmZaTGQwTTlxSkd4QlRCckZkZFMrYUcx?=
 =?utf-8?B?a2VXcGZQQncwbEVXS1ppc09QU1FpYWk5YjZybDdHMWxjWmpXUGx6a3lsUmVL?=
 =?utf-8?B?N0NSaW1FMlJPNkhqNXBVTm1lM2ttREJ5eGk2VC80VyttdEQwZXF1RURnZGdl?=
 =?utf-8?B?U3B2SEo2MkxLMzVBdktaaUpZSS9NVHcxZmRLdGQ3LzJlTHN3U0d6aUNlbktv?=
 =?utf-8?B?aDg3ZExhUjZuaDVmS0hSdjdSRjlKY0dSSDh4WmliaUtheDI5WmtKbmpYRGFO?=
 =?utf-8?B?dGMzalFRQ1M5WEtkeUtmNTA1K3ZyaHhPRUpWTXNBOFZlcjFoR3R6S1BjdUR4?=
 =?utf-8?B?eGk4VjhvL0NhUDVSODQrUGRiYmllRS9CVlczMklnM2lwWGxhN3kwNzBIYUg0?=
 =?utf-8?B?REZjb1RtajU0aGlnbk9rekFYMEZxS0oxanh1K0tVelkrMW4wY01RTUl6Wjg3?=
 =?utf-8?B?RVAvc3VmK2N5bzl4cEdKK21VaU91ZzdzTEluaXZCeGJCdUtLM1FpLzZSa0V1?=
 =?utf-8?B?dkFWVDV4S3g1ZEhVc3FPa2FHU3prcHFWLzFLS2N6cGk3SXJrSmlVQ0Nkclhr?=
 =?utf-8?B?OHNyZUpaQjJxbTVFSlZGQytML2RxMzJxQ1QyNUxJQkM0RzFSaW1pNjU1NnZV?=
 =?utf-8?B?RzdVbHBQYS9VdHF1U3Z1WkQ4UHRLYVVPNENlYmxMZEdVN1R6bEJOMHZMN1ZX?=
 =?utf-8?B?Mm16SHRZN1BHOEc3VytsRUQ3Z2srSGhPaG5kb3Y3NlAyb2p6RllUbmFoUGpB?=
 =?utf-8?B?QXFEQzhJTGwwZ0tLYjBaWDB6bHcyN2pFODhvM2lqaWlLQWVid2h1OTEvNUo5?=
 =?utf-8?B?Z3p4Mm42SUtQZjJUNlFDM1hrWWZMY2hNV25WNzd0VVFJd29BSDhMVUZEWEJ2?=
 =?utf-8?B?V3BDZTNpU0xQUWR0RDNuUWhUM3Q5dWpMWnhrbmFKSFFyZm1pSHBRZHZhQzZs?=
 =?utf-8?B?RVQxY2lMbjdPbzU2L1ZyY3pkS3NlRFhHUVBtM0dEbU9OTnFpRDhvMk5DOEcv?=
 =?utf-8?B?dlNWVndvZHEwZHVnMVRiUHJQZTcwSHhvRVpSbmVXejRSelRXN3loMnJYbGhr?=
 =?utf-8?B?c1duQzZwVWhkeEppNzFxSDVQS2svSFRhTFlwMGhZbVBiV2VMMU5zbGdiTG5L?=
 =?utf-8?B?azFVUTAzUE5NY1B5VUliWnJSR2xhR3RqTzZGL3RacVpMSEpQd2Q1ZjVEVy90?=
 =?utf-8?B?aVRaQ0VZdGMrMzNlY3dPdkhUSDZyaUovVG1Hem9FekU1V3BrUCt1M011S2hQ?=
 =?utf-8?B?OG16SUtuSllORVlvQjgwNVVRMmJXN28rSjlQNk1kZmdlSmhiZ1pwVVo0YzR0?=
 =?utf-8?B?RkdoeWs2TTdQdndDaE5vbDhlOHNTWXYxVmRtOUJaWmUwM2Y3alpqcTlRN3dH?=
 =?utf-8?B?d0JpQ091a0I5VUxiQUpackdiNk5ucGlleFgwKzRqZ3lhdmZNWlFoeHZHNlpN?=
 =?utf-8?B?MGs3S1B0TDV3eWE5VWpIR1hKcmtmcGRPQjZORmFBcTZqSy94ZUdxa1pEY0tY?=
 =?utf-8?B?WkNvWDFDOWZJdXVKM1dwOFNUeHN5OExhaGE3OEdTRlhOSGhjbVl3M0lLcVBV?=
 =?utf-8?B?SkI5Ti8ycnVmRXc5Ri93bi8yRTZ3UkE0akJpRmtSYTh3RkNHUGpMRXF3MEJo?=
 =?utf-8?B?SDZaS21mWkhBY2RLOUh0ejVZdUpNNlBpdjNic0o3eEdOeG9STDBKTXBEdmFW?=
 =?utf-8?B?VHo5YUZ1YU9aVDlNYmtOaVpJV2hCUlpUV3A2MXlDSDRGYjFPeGNrK3lITHFo?=
 =?utf-8?B?TThnRmRSdEtNYjJJckEra1hvNytWb2tOMkpwMnZ0aTdHSXBFQkdWN2NKMytB?=
 =?utf-8?B?YTI5K2VwZWs4TTU5MFBvQkZJTTF5NXIwb0FsMTBQdmVoeFZrbnJVeDRlVkc1?=
 =?utf-8?B?bncxY0ZTcjhhOGNKcHBRTm91cG1rODVHeTlWbXpDeVlwQ2lGeUxDQnlvRUdE?=
 =?utf-8?Q?SfQFwp5ABNksBD5K/0q/Tsmuu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bf64af-ebd6-44fb-5013-08dd912dbe6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 08:19:41.3125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vtzgj4KqyoI2iiRGQ6CDPs/u82s7qXDWBlnQ5ArExN3wcOAEe795bpkaIKS+0h1B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5751
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

On 5/9/25 17:33, Tvrtko Ursulin wrote:
> With the goal of reducing the need for drivers to touch fence->ops, we
> add explicit flags for struct dma_fence_array and struct dma_fence_chain
> and make the respective helpers (dma_fence_is_array() and
> dma_fence_is_chain()) use them.
> 
> This also allows us to remove the exported symbols for the respective
> operation tables.

That looks like overkill to me. We don't de-reference the ops for the check, instead just the values are compared.

Since the array and chain are always build in that should be completely unproblematic for driver unload.

Regards,
Christian.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 2 +-
>  drivers/dma-buf/dma-fence-chain.c | 2 +-
>  include/linux/dma-fence.h         | 9 ++++-----
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
> index 6657d4b30af9..daf444f5d228 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -167,7 +167,6 @@ const struct dma_fence_ops dma_fence_array_ops = {
>  	.release = dma_fence_array_release,
>  	.set_deadline = dma_fence_array_set_deadline,
>  };
> -EXPORT_SYMBOL(dma_fence_array_ops);
>  
>  /**
>   * dma_fence_array_alloc - Allocate a custom fence array
> @@ -207,6 +206,7 @@ void dma_fence_array_init(struct dma_fence_array *array,
>  	spin_lock_init(&array->lock);
>  	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
>  		       context, seqno);
> +	__set_bit(DMA_FENCE_FLAG_ARRAY_BIT, &array->base.flags);
>  	init_irq_work(&array->work, irq_dma_fence_array_work);
>  
>  	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
> index a8a90acf4f34..f4abe41fb092 100644
> --- a/drivers/dma-buf/dma-fence-chain.c
> +++ b/drivers/dma-buf/dma-fence-chain.c
> @@ -225,7 +225,6 @@ const struct dma_fence_ops dma_fence_chain_ops = {
>  	.release = dma_fence_chain_release,
>  	.set_deadline = dma_fence_chain_set_deadline,
>  };
> -EXPORT_SYMBOL(dma_fence_chain_ops);
>  
>  /**
>   * dma_fence_chain_init - initialize a fence chain
> @@ -263,6 +262,7 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>  
>  	dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>  			 context, seqno);
> +	__set_bit(DMA_FENCE_FLAG_CHAIN_BIT, &chain->base.flags);
>  
>  	/*
>  	 * Chaining dma_fence_chain container together is only allowed through
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index ac6535716dbe..5bafd0a5f1f1 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -98,6 +98,8 @@ struct dma_fence {
>  
>  enum dma_fence_flag_bits {
>  	DMA_FENCE_FLAG_SEQNO64_BIT,
> +	DMA_FENCE_FLAG_ARRAY_BIT,
> +	DMA_FENCE_FLAG_CHAIN_BIT,
>  	DMA_FENCE_FLAG_SIGNALED_BIT,
>  	DMA_FENCE_FLAG_TIMESTAMP_BIT,
>  	DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
> @@ -632,9 +634,6 @@ struct dma_fence *dma_fence_get_stub(void);
>  struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp);
>  u64 dma_fence_context_alloc(unsigned num);
>  
> -extern const struct dma_fence_ops dma_fence_array_ops;
> -extern const struct dma_fence_ops dma_fence_chain_ops;
> -
>  /**
>   * dma_fence_is_array - check if a fence is from the array subclass
>   * @fence: the fence to test
> @@ -643,7 +642,7 @@ extern const struct dma_fence_ops dma_fence_chain_ops;
>   */
>  static inline bool dma_fence_is_array(struct dma_fence *fence)
>  {
> -	return fence->ops == &dma_fence_array_ops;
> +	return test_bit(DMA_FENCE_FLAG_ARRAY_BIT, &fence->flags);
>  }
>  
>  /**
> @@ -654,7 +653,7 @@ static inline bool dma_fence_is_array(struct dma_fence *fence)
>   */
>  static inline bool dma_fence_is_chain(struct dma_fence *fence)
>  {
> -	return fence->ops == &dma_fence_chain_ops;
> +	return test_bit(DMA_FENCE_FLAG_CHAIN_BIT, &fence->flags);
>  }
>  
>  /**

