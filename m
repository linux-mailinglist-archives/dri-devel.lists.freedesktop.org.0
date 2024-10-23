Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3807C9ACAA0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 14:56:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8048610E7D1;
	Wed, 23 Oct 2024 12:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LbO0IQMR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D00D10E7D1;
 Wed, 23 Oct 2024 12:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9vncTZ/Gj8G4VxK9YPq0cYHwZvnQ5nFBRSsuOMBFPyz6p8Lm0ylHWzgQTiofTpKOxjLPQJFayP1TRWAnHzGn1d1e7bw6SSyRxLlptn6LKKdKCnnwJBe4GNbyELZM6xE9ohJjk0hExTb7Dcgvw0MknTTuCJ9lxi5EpB0jprgi2M+ZvI9VM2Id9Xjj/nAY6GZh0Zfyz+yft8u49h/+XU+6JrHt60bVZepkE838ysQ6pAr3gVJUYh4JvvXdN/qAvXLfj6F66WslCbi0Dd0TiVkFaSUAwF4IutY995Tw+xAteYBx1iPl/nIRE2Rnq25JC4qTIeEzPk4EeX3gE+d8EYwag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/aX1ZjHbg8vrtvRAArA/wt+5asXJBfgcrgZRfCaf88=;
 b=A9qs1lzollozjPa/afAqgcSdb5YYfqg/RD7wiO2IDIkSk8KKVIbTGQACDKEIjoY+yeMX0ExWJB0nHbQC+wnkfkXb+LeAvcVPjFJEcoUGJ/LSFm6AGiVD7NzGDH2Jqq51BRre8uK6yjEzEM4Io+JZbNounou+xSS07Noti+m9iKxy2ZqhJLw18TnDkTAg/aqBBS/wY9aEzYgUhGJO8cwnfDPB/Bh8qPxVpT+kqiZAei0h3W4Fjw+0yHVaBnhXuLLQFHyDdp6dB5zuE9uGTQ2FZjuwDiBcY5MnBfSXf6kiQpjC7mg+GxEQBCdl+0Lbs4s9rEeixypq4G3KBcr+ASimvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/aX1ZjHbg8vrtvRAArA/wt+5asXJBfgcrgZRfCaf88=;
 b=LbO0IQMREyA/izE0W8ZrHWco3Wxw0DZNsnMFXe4EYdM8oED7Codf9EPePPTE5Tt4ZzEiUs6IcI7K6/OKrwGrFv6qt7WfNa4jB/YSfKyTdd/ShF3k2KdPS3BKvkyh9WZDdmDaBx/VjEt4jpUTb+9ocLhqC8ggida9Md/A5TDzf/s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7688.namprd12.prod.outlook.com (2603:10b6:208:420::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Wed, 23 Oct
 2024 12:56:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 12:56:33 +0000
Message-ID: <c80eb8ff-3965-4036-b763-20c4c2550e04@amd.com>
Date: Wed, 23 Oct 2024 14:56:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
 <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
 <53382fc0-0686-46af-9285-0cd6aec314ae@amd.com>
 <cd2b57c6-1947-4dbd-bae8-ecdb2b42de72@igalia.com>
 <47e4b79b-2c08-4ee8-b472-5482bc159856@amd.com>
 <6d324aca-76fd-420b-9bae-6c0984e659e1@igalia.com>
 <7503c3fd-deea-4eb9-9324-ab4f13f70332@amd.com>
 <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2141a4f4-bcf4-4419-8756-fb5afd6c7f3a@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: f8af45ea-5a60-47db-e2b4-08dcf3621f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zlc2cUlaVndKV1lZQmgweTdPczZDZzRmRnArajgwV0ZLKzFRd3g4RW1MeDA2?=
 =?utf-8?B?ZFRqcDNueG4xVnZ1VGg2cnpZcmZaSU5SUVAxUWZDSS9vZzZQR1JLeUJRUWda?=
 =?utf-8?B?d1FheE82c2VONmhVRkUxM2VqNU9aNFNlelJrUWpPUVRNbERhaFBDcDBZZ0RT?=
 =?utf-8?B?cEdmWmJkYlFzY1piT0p6L09BUTJmSjQyYmQ4amVjb0N1T2pKU05WMW1BL3NG?=
 =?utf-8?B?cHFaa2tkeVJXYUVkMklxclZsWU1Od2k0aFVCdTRnM3kxSm5GVFN0aXI2L20r?=
 =?utf-8?B?SXF6U1VBUWJlUFJqWGRRY1dEQ3VsSFR5SjhDNGhyK2R1eDNMclFTNjY4eVo2?=
 =?utf-8?B?OWtJR20zOXZQbXlwUDltS2ZDREdnMlNkc2szczBUaWhhcTU1b3ZzSngzYi8v?=
 =?utf-8?B?c2ZXdTRPN0kwTkpNMEJLWXpqL2hjQVdiaHB6bWFaYUdYZXBtOHpsQlA1OWt2?=
 =?utf-8?B?aUV6bDQvck5ZNWNXcXFEZERLU1MyUFZzVzZqWFI3NVZaaWtTT21aMDd1ZUlv?=
 =?utf-8?B?SVFZSm9vSWUwajdLb0xaZTJlajNCeG5MQXVEMURjYi9LTWJSckhwSldGalpm?=
 =?utf-8?B?Z2ZpOXRQcW5KQTBkcXRQRlRjcDMvNGNQVXJRYTcwTnp6WjloNXlPbW5NVXFW?=
 =?utf-8?B?UC94anB5ZmtnQU1yNTkvZUJjSzVMZk1hcXc0UlV6WUUrYW5BUjZoUmpPb281?=
 =?utf-8?B?V3dMMUYxYTNsNFFDSUhXWlpKbzhBc3hkNEpVdGFQQmQ1NmFpZUJvek9PTHNW?=
 =?utf-8?B?QlhOc1NCRlNpbTNUdkhYa0ppTG9kMkV2VUVTek1aQnY1QjYxNndJYW1WREdp?=
 =?utf-8?B?RnZqaDRubElqMXhwbmoxMEllNS9BYWlVK3prN1FxZWFISm9DSVZRUmxoT094?=
 =?utf-8?B?ankyajF0Yk9Xb3VnMEpJU2pINEw3R3did0xDZTBuVVVJS21OWmhXTy9vRDBC?=
 =?utf-8?B?TStIdnE2RitMNXo1OFZuMFAvQXJjT1BNSEhReHQ3a2FmQ0ZZYk5pMjNoWity?=
 =?utf-8?B?RFlxQk8zRm5xbTk5VENGZWphQjI1UytIZ1ZUNzM1VUl4SFpjTnA3U2xRMlVB?=
 =?utf-8?B?cEM4ME52WmZObXhMLzlpdTZYMUd6WlBxRWlVdnJqOTAxdTBwLzJWQm4xWnND?=
 =?utf-8?B?MHJRbXJXWk56dGhCT0lYQS9iRVhleHFsTFpFOFJVRnRQaDFnSG5mdEowYzJh?=
 =?utf-8?B?NktLVGRQVGZ6VWRFTzdWSy9kdWR4ZFRESzlpckJoU043Sjk5eUtpSG44T2d3?=
 =?utf-8?B?TnRRenluYTAyRkJhem1DR2lodGRCNVorRnpyRVc0Z2dEeHU4amVOdmtNcXdJ?=
 =?utf-8?B?aGl6WVBuRDFCbThYREwrRDc4dnB3ZGxHT09adldKWHgvYnUwTmh2ZERSM2wy?=
 =?utf-8?B?a2N4UTJ3aEErQ2gzOTdpUThMMEhyL2RGcjNJZUpMY3kvWnhzWXhCbFBpa2t2?=
 =?utf-8?B?cFp5SDhnNWUvWHViZGwzQS84c0hteGVHbnUrZ1pobEdPdnNaNUkrTTlhcEcx?=
 =?utf-8?B?em5oUU1mQnRFMTErSXE2UXJXNGc4ZTJ3NVBXMS9UUHl6amhVdDdxNTVockww?=
 =?utf-8?B?T1hLUFNUVDAwRkhHeW42TkNYOXU5WGY1eUZEYmhxVk4xd0lYV3B1QUpDSG15?=
 =?utf-8?B?SVRXU21aNXVXcU9zN0xVdldLRXNoZk1YY0VBNEYyMGp1bkQreFRJRVV0a0o2?=
 =?utf-8?B?dGVFMWVQRmRsVDVWWU5mcGh6aXNDNGR6MllGUDlhek5UWmtMZnhKYTBzUkV4?=
 =?utf-8?Q?M5Ym763kijfmAx4F36RM0/DY0HsPBO3co86EVb3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGtNWVMrK3dRNE5vdzRheENwSXlVWk5hbE50c1o1Mk1OS1VkeGhKeUl4L3Vu?=
 =?utf-8?B?cFRCOTdUUTJmVG9zNnhuV2RUblVSeHg4UDJLT3g2MmJVWFVFUDhhZGY3ajJF?=
 =?utf-8?B?ZHVoUVVyMklkYUlLbjhDREN0UEJvTFVRdXhwMnAvUmdpVGZQOFNWaXdPb1Mr?=
 =?utf-8?B?dzZyZlJwcWpkeUR0RzNIa0g5Yk1VVm8wQnpCZEFUYktndzA2VEZPdDRFdFh3?=
 =?utf-8?B?NzJWTWZOczFmb0NER25sWTM5cUxSSHU4Vi83Y0Rjb05rdFB0cnVPeGU1UTc1?=
 =?utf-8?B?N2xWZTBoQkdXa0E0c0xSU1UwY2VJRjRIeStmTlcwTTRHWnRmTEUzalpKVm1T?=
 =?utf-8?B?LzVTNHhnbnpmdVlkc0tSQkVpQlNUdTJhOG5RS05PdU1Dd2d1VTRIcWE0dGEr?=
 =?utf-8?B?MFB4T0tGUXhMSWdFSU9GZXhtclg2cHp3NEN3WnZvYk5FMVpzTEZudzkvTVI1?=
 =?utf-8?B?Y0g0bGR3SE9tcEcxZ0NXeWw2SkdFZDA1Y09SRkdwWXlNWmNwNVdoRnJUTGhD?=
 =?utf-8?B?c2FpeUMxM0dlUlFSS2FPNlA3U0s5bWtHRlZwZzR3NjVzbHdRbGVWUFJNZXFv?=
 =?utf-8?B?TEVxN0R2eTlOTzExTWNzeDJ3dmp2ZWJ6cVd5RVFVcEVmSWhySmdKNTlaY1di?=
 =?utf-8?B?bHp0M0F5Nlg1Y0hFaVl1Y1BrSmVJZ2IyelI4dWtYQk4zN3I0cUVna3AzSVJU?=
 =?utf-8?B?OFExUE42OHVJREF1WkVxQUROTFc4bXR6ZFVTNktQM1pleFB5TkI4Vzkzdms2?=
 =?utf-8?B?TE9aWVZ3ZmJ5SXYrbmlMNjZEenJwU0hzVXYxM3RlOStSeDlqZ3NGaDFncXFK?=
 =?utf-8?B?SDJsQnVhNXRJM1Rhcm43VDcwKzByN3RVbkthSzRmUHcwVTJGN1ZvemtnV0Nv?=
 =?utf-8?B?K0dtWDYvenphTldESnFTWkZjMUZqbzd6MGdaTTNpWlh5WmFMQ01hTC92ODBl?=
 =?utf-8?B?ZkRvZyswSGNacWJnbTRMd20zNEZOdExZeHBpWWwrclM3WGlMK1RsYUUrMUpT?=
 =?utf-8?B?RDIrSUN3eDRZVitnZE03bjArOFZjb3U0NjUzS2ZTdkIwTHNKbFAyZkJyT2cx?=
 =?utf-8?B?TVBlakhGRnRzcjhCVFlxTndZWU03Vk9ySVZXZytONG0vYml4YmhjZlZsVlF1?=
 =?utf-8?B?bHBKczNrbThkWWoya1IzdmVGZnN4UG93MnJRZkZWUVlSOWxXRXhUcWVTVFRp?=
 =?utf-8?B?aVp4SE10Q2kvcVRMdmZFVzZTN1oxZVMvWnNWSm5DVmI0dmlTaHVCUWdXT3RN?=
 =?utf-8?B?amM1d2V2bWxVdGdCZkRmakhoNFliem9UYm9RenpzTmxNZVNUeHpJRnFBL1k5?=
 =?utf-8?B?elNrSlNJdkZSR2FDeXJXM3RiRkRFRXR1ekFjZGtxQWJzVWh5S1lHcVJoRTM2?=
 =?utf-8?B?R2xHWmlMWXBIU2NpVk94c0NPNVFDUnpHRm1pRWl4S3crcGQ1b1VyL1I5Ukw4?=
 =?utf-8?B?Ry85ODlFU3p1cGFLczJyY1ZuSVhGaE50T2p6VG50SUIzUGE1ZGZRSnlFZmJL?=
 =?utf-8?B?YUdvdFBjMFBYTE9STENvdDhmQ21DNTk2MGJ4ZWVsemU5WUlaMjJDaWh4bDZs?=
 =?utf-8?B?ajlWSjRtSEtkODBLUUlubnZIa29WVWZwOVdZOU5TOC9uOWN6NW9sVkJIcTVK?=
 =?utf-8?B?TlZ5cFlSejhpaWJsWEpTNEllZE5USk0rVUlrRllkcDJMOGZuQyttZngxZFUx?=
 =?utf-8?B?SmpLOFB5TE90WS91cGJYOHRhTzJ5MGpRWEJxK1JJRk1zVU0yRVFaeTVIcm1T?=
 =?utf-8?B?M3JyN2MrVUxiamR1WmM4RTZBNDkzUTRLaFcwRzRlK2Z3bU9zRWpUWWZxbHZz?=
 =?utf-8?B?ZUN5VDdwcXd1Q3ZhS3NUQjRsSW8yakNocGxRSFB4dW4vNXRFVVBIYlJ0d3Bh?=
 =?utf-8?B?SDRmNUVBbENkSC9sQ0tEUVRmL0FLYXA5SjROMEFrRjBzUnV1ODl3VTgwQm5Q?=
 =?utf-8?B?OGpjdzFaZXhzYVBRSFhRUDRzOFNDZ0xDeSs4S1hsTkczU3ZHRkkydzVyOGlV?=
 =?utf-8?B?ZVkrUG0yY0d0Qmxwd1gybnh2S3h6TVd5bk5xbHljWG5Ca3dmRFdSaENhMFI0?=
 =?utf-8?B?b3dvd2IzOEcydVB3am9lM1FINVpPV3NoOGE4VFovcWVVVXNYeXV2dGs3enhj?=
 =?utf-8?Q?siumwdG/LHjl7eBrS+fzolKRZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8af45ea-5a60-47db-e2b4-08dcf3621f2e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 12:56:33.8513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dgGwyCQ/za5aR8pWhJHm71kQY8B0h1Jjfl0cBZ0p3HI9qZt2Ji/vOBCXA9DQEUh0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7688
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

Am 23.10.24 um 14:24 schrieb Tvrtko Ursulin:
> [SNIP]
>>> To fold or not the special placements (GWS, GDS & co) is also 
>>> tangential. In my patch I just preserved the legacy behaviour so it 
>>> can easily be tweaked on top.
>>
>> Yeah, but again the original behavior is completely broken.
>>
>> GWS, GDS and OA are counted in blocks of HW units (multiplied by 
>> PAGE_SIZE IIRC to avoid some GEM&TTM warnings).
>>
>> When you accumulate that anywhere in the memory stats then that is 
>> just completely off.
>
> Ooops. :) Are they backed by some memory though, be it system or VRAM?

GDS is an internal 4 or 64KiB memory block which is only valid while 
shaders are running. It is used to communicate stuff between different 
shader stages and not even CPU accessible.

GWS and OA are not even memory, those are just HW blocks which implement 
a fixed function.

IIRC most HW generation have 16 of each and when setting up the 
application virtual address space you can specify how many will be used 
by the application.

Regards,
Christian.

>
> Regards,
>
> Tvrtko

