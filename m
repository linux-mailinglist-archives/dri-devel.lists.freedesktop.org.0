Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808DBADB3E7
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 16:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6B510E3B3;
	Mon, 16 Jun 2025 14:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jyq9fFee";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB90B10E3AF;
 Mon, 16 Jun 2025 14:32:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHqdpzqbXyyUuQsWqY2PxIMGQyk2yv/O40lfyM1jaViaPa71jk8LGmHRosRAWxT+i/Nc5zVFQFguM0i9yN6HAOXG6jV7ZtAFMEVA+4XAZxfREn8FSsCZLwgtLwSxd87s7MULolh4AYyu83Bdtg1ev1ODqnyYzbjoSp+Sfc2idQ54Iz6UT3k5uVv6I4f8Rp1+8Bm8QqCxBl0qwOAAzU2hxF7O02YKCbDebTybBa7rgfIwg62KG0QREI0N2NhBagLk4fJNs+rQ5s0EIIaE11fMsDqjjmb8yUY4FbMwQEFl+Bjx3Q/xgvPJfdHxQ++vIrSln9PVCrBEx91MPy7z+XMIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io2Wb2iJnGDgbVct+c2k4gTjrk5UKMMqZrJGUUoSN8w=;
 b=Y3nI50USTbSq6yQo1fYP6q33uIOjoXRq2RDxR8D0Z00+UnUrDlnnPFlTzCSUu56dZ7cqWVUIlyZOtUL4d0hXlcCEQJk64aaVQWPTgzmJZ4+DoSqlDXQ82BgRfL5v32of2alGiXYj4mqaldD11pFpWvCwPQm68JABk2QzzJz07a9ws/4ntn1sAL/pe9P/SKfmf7U5941TDtQtT+SqAUqI6QwtrTiVYstwevNA0A9bquoC+7NVXXGuIHzO2/+X5uYehhcyS0ux9jkThqycXjus3EknxaBQ2XaOqvGePanuvsqLFQFyyNF59F6DnJcItMaoK41SppFIzvX/mc1OmAli1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io2Wb2iJnGDgbVct+c2k4gTjrk5UKMMqZrJGUUoSN8w=;
 b=jyq9fFeeypmz0xIxbPQcdcsGQo/rddTDkb0qeOd/7/ZXQs1v2kd0cd6A41gli6CH/gRE4QMXFLDfd2GLpAhuI5CVUMTuCfvyQVFlqAQAhtPSKxLTpcJcgqqXdl3GuiNuNtMj6PzAeI04wMOUdONcngeNDlkiGp+O3vni03ehhws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Mon, 16 Jun
 2025 14:32:48 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 14:32:47 +0000
Message-ID: <463e48d0-fdbe-4cd1-9b7e-086adf8b0b3b@amd.com>
Date: Mon, 16 Jun 2025 20:02:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm: add debugfs support on per client-id basis
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250616100503.1204166-1-sunil.khatri@amd.com>
 <20250616100503.1204166-3-sunil.khatri@amd.com>
 <3ca35236-377f-4ef0-becd-ba5d22b5edd8@amd.com>
 <84af6984-bd2e-4378-a5c0-ee2356f96b8f@amd.com>
 <cf0e1436-462f-4d63-a7fb-d1201d100bba@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <cf0e1436-462f-4d63-a7fb-d1201d100bba@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0023.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::17) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: d572afa6-9706-488d-d4b0-08ddace2aa22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXorU2JOUzVzcGNsa3VINk5WemdaZWZZL2ZrZFBSdHVoMnVqeTZwMk9qSGNB?=
 =?utf-8?B?QWkzZGVCbXNKeGU2ZFQ3MnExbjRRdUxjSUplU0psY0NxMmpGR25sZEJPYTNC?=
 =?utf-8?B?SUpoa1pDNUk5MkVPQjd6emdNVFFQcWU0cVJ3eTd4dnlDcjV0TkZndXo3VG9D?=
 =?utf-8?B?cGNyS1krTmFCMlVqUmFRekJZSWdyUHZMMUNGVHpQcCtQOWFWZ1lxUnpSeG4z?=
 =?utf-8?B?ZWtMQVQwUUVST1lpVndjVFJXalppOEJSaHpqTkdXWDNvN3R1R01VSHk2Q1ho?=
 =?utf-8?B?SVpUL0g2T0orRW5FTDhzeWx1Y3krVHFwOEN1Ukt1dDRaUU9NS3hxSFozcEs1?=
 =?utf-8?B?Uk1uNnNMYkRadWl3MmV5Q3VzR3VMRVMvc1dyYzJETVNNY0ZsekUwTXRidy9P?=
 =?utf-8?B?UmR5emhmS1hDeWxUS0pLOGErT2NFQnlVeklCYXZjREZTRkQ3eGxLUjNXWHRj?=
 =?utf-8?B?SXRCSkFRR3JpdDJSaTlWYXlqQlVCd1MvU0pjaHhBMlhkRXpPZ2gvWlhXMldr?=
 =?utf-8?B?L3ZsMm1KbDBHcHF1c1VkVlA0a2piRWgvZVR1V2hzdHdmQTZyTjBSd0xwWUVC?=
 =?utf-8?B?QlpraXhITkt5ZnFZT1hFUHBpc2NETUtaL1RlTEdVb016T1crZlc2VGtRUnJn?=
 =?utf-8?B?M09oQm1tY09saXNyMHZGUjNNYkV3UG53cHNLaVZVaE1hMmFLR2pja2VWeXVU?=
 =?utf-8?B?Umw1OHM4SEhWU1c5RDZjbjZtNHhuN05VMk9UQnkxYytPekJEa3lNOGNOYnpX?=
 =?utf-8?B?TDhZN3BWOEh6V1lMd3NiaXFPdHZKS1ZNRTJQTUFRMmx1ZDJZQ3F2NUxjSWNk?=
 =?utf-8?B?YlRjY0krT0gwMjI5SmtwbUNPL2RjM05rVUJENXU4dWQ2SDhGaEpzeEk0VVRO?=
 =?utf-8?B?S3lVNHB0dDZtOVA3N2lvUVFkbG1qandmb3NIdnFha2R2Z2JoMDZrSDUyNW9F?=
 =?utf-8?B?cDBLa2NnT1RBei9NM2JXUnJrM0xxU015UXNtdDNsUVBkK2ZMZHFQOFc0RUJD?=
 =?utf-8?B?OTFpUE92d0xzYlFyOXhBMkxGK2Y4bENUVWpOb2U2K3BQSXRoK1VJWDJxMDg2?=
 =?utf-8?B?ZVdCUzd3SXBkY3hiUjZ3d2ZLY2dBNjFEWXFTSTF4RHVTSkY1Q3RMaEpMWW5X?=
 =?utf-8?B?UE1PUDdvUkpiNlJTbUg1UEpFTzZRQjZGcW4rNUF2V21lVG9NU1Z0cWkwanBD?=
 =?utf-8?B?WmY5THMrUy8vZVVFaXpCQW1ja0lPdXBra0R0cUQ3bUwrY1I2MzdjWUFqbVlX?=
 =?utf-8?B?UzErR3ZiNXRYQkRVQkhKbXI0OE5pMlRuMjNDSnowcWFLRHBkQkdNREtmMGU3?=
 =?utf-8?B?T2hibFA1OFpTRG1wdE5jWUNiK01VQnllZWZNbVYxLzRMSVVDeWtGb3U2eEk1?=
 =?utf-8?B?MXNUeG1ldFRzalVnL0sxL3IzRXE1aFlXcTRHaTllTk14bE9NdlFRNHJVTi9k?=
 =?utf-8?B?cjFRaXQxbWFBL3lFbE1Cd0pEV2t2T0NnT3ArZEpuUEloQ05wQVpiZGN4Wld4?=
 =?utf-8?B?SFg4V1VIYmZXNFFyR05TZGVITC9kYnZhTGs0TFVGdXRtdnhGcTVpYmZ4c0NG?=
 =?utf-8?B?NmVMSG1OZTNVanZ2T0Q0Q2FQZ2pxNGZHUnozTlVBWjhFSHlhL3I2YkhYNFFT?=
 =?utf-8?B?VUR0MzhVa1ZOY0M5YnIvQzZFRDVPZ0ZsS2xQNndEZFczU0dtNnBvck0xZ21C?=
 =?utf-8?B?eHRQdFZjeHM4QnVaSWhBeERoV01kc3FKS3BERWh0QWhqWVhYRDd6MWtZQW40?=
 =?utf-8?B?UDNTVlJTZ3h0RDFUZ1NMTzBrTHNFVlR6MjY0eng0RlJ4TVg3WGw5NUltN3dv?=
 =?utf-8?B?eDZWZndHMHNaay9XUEUwWjhxMXBqbmIrVEZZRm5HYmk2bW4vNzdad0VVVzBo?=
 =?utf-8?B?WVMzYU9wY2VKT1ltOG1yakdESXh4cW4rcmtrQVZGaWRwVkRQS0tWTVlTZzB4?=
 =?utf-8?Q?hZ+DPe4DH6E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21ablNGVDRCaERzTGdvRkdUNUphdFM5dDFDN0x2LzlMQ2krUXZiamU2dUFF?=
 =?utf-8?B?R21yV2ZaTk5VOUhzSmRzMERhRkhHU29uVzcvQWsya0xXeGNncDdZQXFFa25L?=
 =?utf-8?B?bnpUTU0wMFFaVDFaZkZoWmE2TTlpWU8xRTIwOXp6ejZBTFpaSzduRUs1aDM4?=
 =?utf-8?B?ZWw3ZFVjY1dnSGpJQXpBWHdCeUpQbzFiTzIzOVVtbDdheEVTTlI5dE8wUGQr?=
 =?utf-8?B?YjlsWGRzeStKY3NWWEZzS1FRNjI5Qys2TzJBdmFadE0xblVLNC9RdnBSaUJ1?=
 =?utf-8?B?ZUdEdDRCTjlHUWEvMkdDQ0Z4d0kxelE0WkVJMGx0R3MzT256WElmM2ZxMjNV?=
 =?utf-8?B?VTRxYW1VblJkWk84T3FnZXVBNVZHSzdlUm4wWGF3bS9PbGd6WHhMSGxlWVVT?=
 =?utf-8?B?ZjRHa0tLZ04vVzhzd1NaTktwRVlhSWYxN1ZkWXlNWEtKbnV4d3Y0dityVjBl?=
 =?utf-8?B?cFlwVFdBQTBHMWQ0TDFDc0dsSUFsM1dSc3FMSUsydDVMcWZTUDA4b3pUQUtY?=
 =?utf-8?B?dHVvNEpMK2k5VHRiR3lGTWtoR3JpNXZDWnVsNmN6d053bFdSYkl1UDZYVXB3?=
 =?utf-8?B?LzFUM0g1aElVOUkzZTY2MmMrS3Bmb2JXTCtubVovSk80bFdlVlNaYjRIaTFz?=
 =?utf-8?B?MWpxTG9tUmJRdEFOam5OSE5ab0lnOXp6alVlMlQ0cThEc3ZoMzgzTVU1OVVo?=
 =?utf-8?B?TjZqNmNnNjVieW1xOUlOTDMzc3JHSktwQzJBdzJ0ZTVuQUJycnRDZDV2RTR5?=
 =?utf-8?B?VHl5dHpUaDUwRnYrOVNmTGFzVkRxcWVjOHJDc2svZlpOcTFHVmR6dVdzcGxq?=
 =?utf-8?B?Wk92eXVDL0pjZ1A3UTlkT3pwOUpkcTNabWZ1Z0RwaDBQWGZXREtDdENRYkRp?=
 =?utf-8?B?dERYbi9CMTA2R1V1UzFQT1NCZGN6cHpGK1gxL3BSRUxHazNGaEUvcWlkVDRM?=
 =?utf-8?B?TDR4Rnl5aEtxMlRKdmh4T3FseGY1bGN3QjRrdHF6SWNhT1MzL2pDWlJGTFBq?=
 =?utf-8?B?RlA0M1pVUFFSeFFGWXl5Rmk2YzBhWFY4ZFlUV1d3VlZjZjlKbmdNWkIrWkNZ?=
 =?utf-8?B?L2pKNFh6RkU0UkRIZVNZcUdmTWZzN0JDa0RzOGR2dktuTnFCNldCTU94ZnU4?=
 =?utf-8?B?elVaMlNBbkFXSTRweHdTbEZ6d2FxeUozeU1hTHBDZzZOMTQ1VkxwS2JzSW1a?=
 =?utf-8?B?eWwycVFxMTg3MEVldXlrNGVsY2x6aDBpT2hRZHkxQjJUS3FMWGsyU093S0Vi?=
 =?utf-8?B?ajhRVzgxWFNlblRBMGthanVTb21DY1ZPcklFSDkzVjRFZ0pBMEcxemhaaFN0?=
 =?utf-8?B?RUpCcXlXNCtCZXh4VTZrMlA5NVlqY2NGd3RkMW9EVTE3alJVaVB1QmxkWlRx?=
 =?utf-8?B?czk3UDZIMW9rTjlUdGRtdE0vRmRDYlpOajRKOFVuSFRzbGdFVS9Edzd5QzlN?=
 =?utf-8?B?NUVTeStQdjI0bmt5WE9zQmdzOXNTb3FnZVh1MGlWVU1wMjNjK2o0YmlFcFNz?=
 =?utf-8?B?WVd5NHNkOFZXMFFRcUVWZUVoanNUY2hWL0dZeXhydisyZUkwSno5RjdjTHpu?=
 =?utf-8?B?TXRpN05XYjN6UkZ6K2pXTU9BVkx6UnY2YlF2SGdBTTZ4V0VGSGFJRU1ENFM4?=
 =?utf-8?B?ckpEVzQ2VHVwYlVzd0wrN0dpS3VQZSt6eWNIZ1R3MDFQakY4ZXFvZ2FNd3E4?=
 =?utf-8?B?Q2g2bVExcDZQbzJSWG9XbXJEVkNrVThJM3RRT0pLTFgyTWpobXJEZnhxSzZT?=
 =?utf-8?B?bVR3c2NMOG44VGlwbjZIQkFrSUNLMkR0bW1taTlqZXFxN2FwRkxWSG5WYU8w?=
 =?utf-8?B?bzcyMW9jQ1VuL0Q1RC9PTTFHcC9OQXk4Ri9aKzJhWHZ5TFFUbnhyNjYyWHY0?=
 =?utf-8?B?YnlUZVZxL01ZR0dxRkFsOG1rZEFQamU0RE0vVE5wVmRJM0xncHpQSExlbXE3?=
 =?utf-8?B?RDB4SGliZE0wMVNjMm5GYjlyeDZYODROa0k3RDE5aVM3K2NUV05xeHNER3VM?=
 =?utf-8?B?cDJvUytQUzQ2WHBZdElYU2wzVEtlV3p3UEtpdGZ6NE4vSkw2UDRyMFBFclhE?=
 =?utf-8?B?YkpOVCtNMVhxKzh4WXBxS3hnYlhkUTYwN2JaRGhIeXQxc3dtVzc1bFJDekVK?=
 =?utf-8?Q?HKQ4I69lGdstHK4nFDLq5JX47?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d572afa6-9706-488d-d4b0-08ddace2aa22
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 14:32:47.6853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9vuILktpCHGB4RuihkOCVbAwxbd23B/dyIRI6PRO5X6h5JnAP3yGTkwEb3foRgeknzRblzfQ1LRnY0smYJe6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569
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


On 6/16/2025 6:26 PM, Christian König wrote:
> On 6/16/25 14:25, Khatri, Sunil wrote:
>> On 6/16/2025 5:41 PM, Christian König wrote:
>>> On 6/16/25 12:05, Sunil Khatri wrote:
>>>> add support to add a directory for each client-id
>>>> with root at the dri level. Since the clients are
>>>> unique and not just related to one single drm device,
>>>> so it makes more sense to add all the client based
>>>> nodes with root as dri.
>>>>
>>>> Also create a symlink back to the parent drm device
>>>> from each client.
>>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_debugfs.c |  1 +
>>>>    drivers/gpu/drm/drm_file.c    | 26 ++++++++++++++++++++++++++
>>>>    include/drm/drm_device.h      |  4 ++++
>>>>    include/drm/drm_file.h        |  7 +++++++
>>>>    4 files changed, 38 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>>> index 2d43bda82887..b4956960ae76 100644
>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>> @@ -296,6 +296,7 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>>>>    void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>>>    {
>>>>        dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>>>> +    dev->drm_debugfs_root = root;
>>> We should probably just move drm_debugfs_root into drm_debugfs.c instead of keeping that around per device.
>> root node above is needed in the drm_file.c function drm_alloc and there is nothing above drm_device where i can get the root information. that is the reason i mentioned it as drm_debugfs_root as root node of the drm subsystem itself.
> drm_debugfs_root is currently a global variable in drm_drv.c, but if we move it to drm_debugfs.c all functions in that file could use it.

The global variable drm_debugfs_root is global variable in drm_drv.c and 
a lot of function there are dependent on it. So no matter where we move 
the variable we need to have a reference of dentry in drm_drv.c too and 
drm_device is the only thing that is being used in drm_drv.c.

eg:
drm_core_init is using it and there is no structure there to use to have 
a reference to this node.
drm_minor_register also uses the same root to create the device nodes 
and we cant move all the code from drm_drv.c so we are stuck again how 
to get the reference in drm_debugfs.c

I am trying to explore if its possible but if there is anything you 
could suggest appreciate that. What is in the current patch is we have a 
reference of root in drm_device itself like drm core is parent to every 
drm device, could use a different name like parent_debugfs or something 
like that.


Regards
Sunil Khatri
>
> Including the new functions for creating the per-client debugfs directory.
>
> Regards,
> Christian.
>
>
>> ~Sunil
>>>>    }
>>>>      /**
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index 06ba6dcbf5ae..32012e39dcb4 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -39,6 +39,7 @@
>>>>    #include <linux/poll.h>
>>>>    #include <linux/slab.h>
>>>>    #include <linux/vga_switcheroo.h>
>>>> +#include <linux/debugfs.h>
>>>>      #include <drm/drm_client_event.h>
>>>>    #include <drm/drm_drv.h>
>>>> @@ -133,6 +134,7 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>>        struct drm_device *dev = minor->dev;
>>>>        struct drm_file *file;
>>>>        int ret;
>>>> +    char *dir_name, *drm_name, *symlink;
>>>>          file = kzalloc(sizeof(*file), GFP_KERNEL);
>>>>        if (!file)
>>>> @@ -143,6 +145,27 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>>        rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>        file->minor = minor;
>>>>    +    dir_name = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>>>> +    if (!dir_name)
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +
>>>> +    /* Create a debugfs directory for the client in root on drm debugfs */
>>>> +    file->debugfs_client = debugfs_create_dir(dir_name, dev->drm_debugfs_root);
>>>> +    kfree(dir_name);
>>>> +
>>>> +    drm_name = kasprintf(GFP_KERNEL, "%d", minor->index);
>>>> +    if (!drm_name)
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +
>>>> +    symlink = kasprintf(GFP_KERNEL, "../%d", minor->index);
>>> Better use dev->unique here, minor->index is also only a symlink.
>> Thats a good suggestion and doable. Will update in next version
>>
>> ~Sunil
>>
>>>> +    if (!symlink)
>>>> +        return ERR_PTR(-ENOMEM);
>>>> +
>>>> +    /* Create a link from client_id to the drm device this client id belongs to */
>>>> +    debugfs_create_symlink(drm_name, file->debugfs_client, symlink);
>>>> +    kfree(drm_name);
>>>> +    kfree(symlink);
>>>> +
>>> Move all that debugfs handling into a function in drm_debugfs.c
>> Sure, let me try that and push another patch.
>>>>        /* for compatibility root is always authenticated */
>>>>        file->authenticated = capable(CAP_SYS_ADMIN);
>>>>    @@ -237,6 +260,9 @@ void drm_file_free(struct drm_file *file)
>>>>          drm_events_release(file);
>>>>    +    debugfs_remove_recursive(file->debugfs_client);
>>>> +    file->debugfs_client = NULL;
>>>> +
>>> Same here, move to drm_debugfs.c
>> Sure, let me try that if there are not challenges.
>>
>> ~sunil
>>
>>> Apart from that looks solid to me.
>>>
>>> Regards,
>>> Christian.
>>>
>>>
>>>>        if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>>            drm_fb_release(file);
>>>>            drm_property_destroy_user_blobs(dev, file);
>>>> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
>>>> index 6ea54a578cda..ec20b777b3cc 100644
>>>> --- a/include/drm/drm_device.h
>>>> +++ b/include/drm/drm_device.h
>>>> @@ -325,6 +325,10 @@ struct drm_device {
>>>>         * Root directory for debugfs files.
>>>>         */
>>>>        struct dentry *debugfs_root;
>>>> +    /**
>>>> +     * @drm_debugfs_root;
>>>> +     */
>>>> +    struct dentry *drm_debugfs_root;
>>>>    };
>>>>      #endif
>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>> index 5c3b2aa3e69d..eab7546aad79 100644
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -400,6 +400,13 @@ struct drm_file {
>>>>         * @client_name_lock: Protects @client_name.
>>>>         */
>>>>        struct mutex client_name_lock;
>>>> +
>>>> +    /**
>>>> +     * @debugfs_client:
>>>> +     *
>>>> +     * debugfs directory for each client under a drm node.
>>>> +     */
>>>> +    struct dentry *debugfs_client;
>>>>    };
>>>>      /**
