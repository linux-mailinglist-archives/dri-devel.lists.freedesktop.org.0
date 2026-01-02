Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9A3CEF323
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 19:40:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 668B010E2CA;
	Fri,  2 Jan 2026 18:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V57+ce6D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013012.outbound.protection.outlook.com
 [40.107.201.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDFD10E2CA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 18:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/dvASGRWa0Wtxq0QUyrW0E1P6ZrC5cdX70BgllyNU34N5KgLp+r/5yPNHT8QGE2gbmGmfLIGK3AwE4aW9P+rIVBEhmd+xdjVleb1cJleFDxNQS4RMDgnJb14Yb4D0g51uACu85OicTaA2V4tWfLhCs60FkMaI3GBH8yV3aVgAoZEP0BKYSqZlAvdQ0z+6zNJKLjnHGpMVOIq6gpU8LPW571zjygweysbUW4F09AtP8yEtrkxq6fwnuguN1a13ztxZmceh+L5ncDrZBouO4uDJf50bxo5NmciFH0jycjEn8BYiEzz/KSXuGDkQzE8EfjSe80DXGpF4RRy2oHUB1dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XklsumNaYTk5nCv6O1s3RlEP7dngRfn+ncOZHuOPA30=;
 b=OUD0TqCBQzMWfk013LzoOBDfQaOWz85tj88kWssJAhori7dLfVQRA8JY0bY8kB/zEOh/JkHPqhXFngNvmAlZdWk7e4u7qa/QrxTS7eQa1G0PVyrDT1R1Uvgn/P/8SD31La9cMpnQjY1GgeFtBPimQHxqgMHY4OicETglTk4nmx3j41pQUt489PEsoPHx+6kAhfBGFbuCTBf+1aOQgbeAaxd37Ozs1zGIQnFyXPdtm0w8H1SCraP/dBLciJ6bptuokwK9h4ChZjUXy9llgx6E9zN2KD8hEzUOxUw8mZubqaGv3zRufNDZk12fOyECFHoRZXAM2kBdwNwOh/DK6ElGKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XklsumNaYTk5nCv6O1s3RlEP7dngRfn+ncOZHuOPA30=;
 b=V57+ce6DL8FOezmoddPsVGcWq280s1U5DyLJr5o7m6wVDsglK6gxIC1jeLAKDcvKGshD+AdG7J9hBlx9YwKrbL32iaI58x2MKUMO8oCyMAmu0Z1zsBEzQMQL3ABfG3Px6x5nHiSPp1btxWj/9g1Ut6MrDi2aMsPIC3/namUvmn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 18:40:30 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 18:40:29 +0000
Message-ID: <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
Date: Fri, 2 Jan 2026 13:40:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
To: Shengyu Qu <wiagn233@outlook.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 daniels@collabora.com, ariel.dalessandro@collabora.com,
 kernel@collabora.com, xaver.hugl@gmail.com
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0424.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::24) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: bc24faf2-1fb7-42a6-d952-08de4a2e6760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFVyUFpLdDA2SERFNEhJYjh3aG85RSsrVkptRmZJU0g2bXRzZVA3WUZCd3ZR?=
 =?utf-8?B?VlRBWWxmQ2FtTlFkMHFXbU91b0lTSWszbkZWYnVFVlFFNDBORDV5M2w4RHVD?=
 =?utf-8?B?MmxOMTloRllsemxYdm0xM2x2eUFMQ2p0VVBFUkpud09aMG5SVFpaKzdLdUt3?=
 =?utf-8?B?ZDVFdkNkVGNpdFBuSkpvVDltbzZXQXBuK21nbXliQ3VGSHFJdDJGRGV1aHJQ?=
 =?utf-8?B?UTRqR2FQVUhUMTRSNjY5ZmlMWTVWalFNTWg4ZGMrVzBBeEs4NCtaTzZhaTBl?=
 =?utf-8?B?NVBOdTJGU1FCMkc3dXg3bkF0RnByd0dlSTBSb25hQlJMUEtYOU56RUlueUgz?=
 =?utf-8?B?Qko1bWRoNjZHWXFyUUhPNkpJaXhpZUxLb05VZDJiSlNJa3ZWNjlBTjNGaWVZ?=
 =?utf-8?B?SkduN0l5cjZ4ejFQQU93R2RQNnpRdm8wTEJOWHdxQjZ0VUNwbmtOV3FuN1k3?=
 =?utf-8?B?L0pmMDJpVFpseTR3UEh4N2dnWTRCWUR6STdtVm1nOHZPT2U2MDVRNDc5L1Vt?=
 =?utf-8?B?eCtPUGZkUW1iVXZXY2RCbmpvVmUrZlVNd1R1aVRLekFwTWpuOVFkVUptNGVC?=
 =?utf-8?B?R3FpVFhUYWpHcm1JZWx6SjBsM0JRNEN6ZHF6LzZ0T1BhQml1SjlPTW1ub3kz?=
 =?utf-8?B?QlM0T2RVZDROLzgvckJuQ0xPSDAwN2FRdit4OWIzcHROSlovRkMxdGJjRVRJ?=
 =?utf-8?B?cGpMNlZmSkFJQ2Nxa3ZkR3d1QWswdEVjbzBOOVFIUXdxVGZjUmxuc2FwakNR?=
 =?utf-8?B?U3VrY0hwNkxmaGpGeSs2ZmUrUDZlNE5rN3lvaTlRVWxRQmw1d2J3M05mTmV3?=
 =?utf-8?B?enE2TVViSFFuMDV0UVdTRFVHTHhVa3d6VXMxQ3BWMTNta3l6UUJHRlhNRi9N?=
 =?utf-8?B?a1JISUMrdXJZSFpsMytxOWJrd1VHTDZFbGRmazRJY3ovYytzWmhpQVFaQUJx?=
 =?utf-8?B?ODFuUjZZSiswcEl6d08wUTg2VlpXRENEMkhrN1FEbWRVMEdiMTFYRXZlRmcz?=
 =?utf-8?B?cm90eXpSWFlsSjBvbllDMUZuQnYxZGNkd1BMZ1dsd05aSEgxOXNSUW5uWC9T?=
 =?utf-8?B?bXB5bUdOM1loWTZYcUVkVXB4WHNtUGNLUWwxVzVkY1FGczJodjc4YzluVWRu?=
 =?utf-8?B?ci8vSXZOZlloU1Z2NklIRmkrTmxHbmcwTHYvTkkwLzMvazkyNkE1WVpPalQ2?=
 =?utf-8?B?RU9OUS82cUdNQXVybDBILzZEaDhOOHhTZGI3aWVSZFNyUWFwZWE5VDhXTk14?=
 =?utf-8?B?dkkyQmJ3R1FGUXlXaG4rLzAzaGY5dXB2RkJjWEYyWFpwRjNhdFR1U0VlclM5?=
 =?utf-8?B?cjdzSCtwQk9CUk85c0J4Nk9YRWNQNWdxUkRockw0cHhtV01SOFRjNEhhVHlK?=
 =?utf-8?B?b0ZLeU9XSCtZWEphY01KajJwQVVKdm9iME1ydklDN2d2bCtpeU90M3RrSm1L?=
 =?utf-8?B?bHJ3WmJQa2p0T051SjAveWhGUmp4OEQ3YzVENWlOa0puSjRkRnh0OVZLWEd5?=
 =?utf-8?B?cXZQUldlV05SRXpvR2plQ1NWRUtHc2dyMnZic1dKRVFpZkE0NllIVG9LSVdy?=
 =?utf-8?B?Z2FHVG9HV0M1RjB0czY1c3lVek8wOUt0ZFA1RzNmcDBsaHAyMUcrNHpkSnQ0?=
 =?utf-8?B?QW1NenFlY1RtbGJsK2N4djg2VVdKam1FZm9sVGJFU0htS3FlNUppVEMzMWVr?=
 =?utf-8?B?SXBudkZORnoxSURjYVB5VE9tUlkxckdndFNFNW0zMXBIN1piQkR0SC9XTGJ4?=
 =?utf-8?B?bDQwWDVzNHdVbFFCZkI2YjNIeXhsbmpKK09UZURJUHo4WE9EejB5SFZYLzZO?=
 =?utf-8?B?OGZrd0U3cit0bkw3by90cDJQeTA0bkR0aWNFeUdUMG5iRW94SjhucldnZVZh?=
 =?utf-8?B?eUROWWYyMHF0N3d2bmRETkk3SjUwaWphZkhFM29QZEJlTXpOblNKMU5QUFNH?=
 =?utf-8?B?ZWc3dFdQem85Vk5RZnpJbUhuTENiODdpWTVPd3pjaHV5Smh0V2xPVTBXVnkw?=
 =?utf-8?B?dWxLekl0cEcxM2JGTnV4KzhEaTNvc3BJZFNsbUF6SmVHUVl6ZU16UWNncWJX?=
 =?utf-8?Q?Y0iu1r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW9LV2ZZM1lFajFjRHJnV0lwOHZOYm04OFMyQ2FyRzA1ZkxDQWVlU3hqaGRL?=
 =?utf-8?B?Smc0MmlnYS9sK2ZhakZFQk4rUWV1dFJ1MjFCMUYyNkY4d2x3cWVZOEhrVEVH?=
 =?utf-8?B?VUh3bVVXWDNlcWJMMWZRWENxVVZkMHpNSVd0Rlg0dER0c1V0RnBBa3cwMXgr?=
 =?utf-8?B?bWt0WVdxWXd4ZlQrMUJsYjdWRnhyU25SM3JHKzZWSmdITjFYTnRUYU5WVFNQ?=
 =?utf-8?B?dkdURkFvUVoxZjNWREMvVlpMMGwvdk5nNWlTMExSWUNLcEpPYWlHZ0F4cjFE?=
 =?utf-8?B?Y1RuNEJaQTVUTDhCRlVNV0g5NEZuT2g2aEt4bGZnMnlTY2IrTnc3VzZBQTVk?=
 =?utf-8?B?SHNJNE5ZRjlEbkdyRGJKMm4zdHVPT21MdEZSWHRjak5RUk04OXpNY1ZwOURI?=
 =?utf-8?B?OE9jMTBSanpmWDd1RFJFN0JOZ21nNFpkNVJzQTRKYWJIZll6S2srMG12TVp6?=
 =?utf-8?B?UCtzaDE1UlI0RFN1OGc4TThTSGlkcm0vclZRd2tGM056UlI3T0NNdmFReDd3?=
 =?utf-8?B?U0xERTcySVpjbUJ6Uks5V3VWU0VUdDJFdUYvRitHOGJmdjYyeTBQYTN4WU4y?=
 =?utf-8?B?MDMxNEFuc2xrU2hWdDAwZy92dFkwdVU4TllCK1NGYkdGMkozd2xGcE5CbXE1?=
 =?utf-8?B?S0hSRDAzbm9KRU5CUzNkL0dscTl2WDd2WDNNYytGL3UyOWF3QmU2NHdLQkVv?=
 =?utf-8?B?Tm0xZ3NWOUE4VlhNY25Gc3Z3NU42M25CaHNrcWgyK2lLQXNZWEpVSVlrdEh6?=
 =?utf-8?B?RFExNTlDaWJIMkZWN1M3RzdLMFRrWDhsVHk1YWljcXRIczRLRlBUMmxkQzZ2?=
 =?utf-8?B?WjRLUzNhcTNuN0FMTDNVczZaaFRES2tSVndPTHluWG1qYmdFMXZmOGkvTFdJ?=
 =?utf-8?B?aEZoUUZaMzlnS3RDajBJR1BFa3BLbmRPQUhCV0p3SllyVDgyMGE0Mm9md2Qz?=
 =?utf-8?B?ZDBFYzlZTEhaKzhqTVZyNlMxTTMyelhweE1qUnVScTlzTW9ua2tvOWR1V1Ju?=
 =?utf-8?B?MkZqMm1ZRm1JZDdpWE9GbFg4TmpYWVd0cGN0U0c1bGQySVVyNHVFYkZiMHRr?=
 =?utf-8?B?ekVBS0lGS0pGblRxV0pJNHdCUnpIa1BXQVd6WERBa0p1MXdKZjRJMUV4YXAw?=
 =?utf-8?B?eHQraENYWnlhYzhhZTZDeVFkenkvZWVzWHg2ZVZWOHZLK2xQYkY0cDhtaU00?=
 =?utf-8?B?Ni94ekpjVWE2K3BkekJoT1FGYk13VzA2ZXl6NkRxbGM3a2E1TzNYSStwaWVL?=
 =?utf-8?B?ekJrMjJ4alM1N1Z2UWZEcWJTa2QxdVh0NnpTR2JrbTNFbWE0VTZqYSszZzMy?=
 =?utf-8?B?L0JTdTBTWGRMMFFHWW44dHpjdkpmbEFKREhVQ3B6NHI2NDBOb25STGdqYzl2?=
 =?utf-8?B?c0x5VVYyeWhlSVdqYkNWdktKS21FYm5HT3BGZGJXMHJoK05wWFYxeTFHNS9R?=
 =?utf-8?B?SHNaSHV6MURaVnIzaGlJdHA1WlBKbDNPRjNPeXQrYTlBTVd0NTUrcXNYT0dL?=
 =?utf-8?B?L1RsbVg0MExrelh6Z09sQkVxUlJDVlF5bHVMUS9DaEpUak40WnpYZFlSbjcv?=
 =?utf-8?B?eFFCVWpMVzVvUzFYby9CeXY0SWlkbEZjTllCVFh3WEZTTGpWcDJsTytHWVRn?=
 =?utf-8?B?Tlg1Y3JjK3pGWkp6S3VDYjJhUlN1UTBNZVNjOW81anVYOXlSKzVydWpETURV?=
 =?utf-8?B?dlRCVHhwRGFiQUdUUis1TzhWUGlWWVB3NStwNzIxMUNaQ1lpanRPVWxxbEtz?=
 =?utf-8?B?dlhpSmdMVWw5QU9FejEwS01nNk92djlEVHpYbkQ4eXcwZWNLQXpmK2VaTmgr?=
 =?utf-8?B?R1VyUTlyK0xNRngybDlIMEVnUUR6S0xPUDJ2U3VpWDM1K0U1WkdHaiswZ3ly?=
 =?utf-8?B?QXk4a2czMjI2dUNTVWpiQWZxRU51T2dJWXR2Sjg3MzZOQitFaHVWb0YyajJU?=
 =?utf-8?B?K2Q0UE5NYktqUlpQRlE5OXR5OU54TFlOVHhHVEtyTW4wOTA5SmNTamhROExp?=
 =?utf-8?B?dnB0WW0yQVVzVFJ5c2xNWjYvMTIyZk1RNWFMVVFpMXJiR09ZVWtpcFJ2WkRz?=
 =?utf-8?B?VTY1VVI4NjdpV1MrRGRmNE9FdTVKSXpnM3FUYkxGckRMMlBKR1pjYVlrcC8v?=
 =?utf-8?B?c2NoMGpUcjVDQWRobDdVVUozS2Voc2xkSXJHbGZOZDd0SGdQM2wrandBaXo0?=
 =?utf-8?B?V1dNNFBpT01MV3c2S2g0Zk5TYmRpRjJhUmR3c3Vkc1lzSDlVSXJ3UXI4cnNN?=
 =?utf-8?B?Mk9pK1I3b09pRThnS2RFaDR2YjRMSGFvNys2VG9Ka0hTOXhHejhXMHFob1VX?=
 =?utf-8?B?YllXWmc5R0lvQ0VqYUF6QmgxeE40d1pSQWZaYmJNS2k1RGhrU2dhZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc24faf2-1fb7-42a6-d952-08de4a2e6760
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 18:40:29.7768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8NcVQdDUBUW4x/S+S+0gIlRLeXf+2R8lhN96IHfCdxaypLcq6HpG7kWh6cUkMN0Ri0NzRs+XixugdSdI3EZXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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



On 2026-01-01 07:37, Shengyu Qu wrote:
> 
> 
> 在 2025/12/30 02:53, Shengyu Qu 写道:
>>
>>
>> 在 2025/12/24 3:44, NÃ colas F. R. A. Prado 写道:
>>> This series implements a plane color pipeline for MediaTek platforms,
>>> specifically for MT8195-compatible SoCs.
>>>
>>> The pipeline is composed of the following blocks:
>>>
>>> Inverse Gamma -> RGB to RGB Color Space Conversion (R2R CSC) -> Gamma
>>> (1D Curve)       (3x3 Matrix)                                   (1D Curve)
>>>
>>> The curves supported by Inverse Gamma are:
>>> * scRGB
>>> * BT.709
>>
>> scRGB? That means this HW supports float point format surface, are you sure this is not standard sRGB?
> 
> Sorry, I mistook between Microsoft's modified float scRGB implementation between standard scRGB spec. But that's still weird to support such format in hardware, as this means frame buffer is 16bit uint per color.
> 
>>
>>> The curves supported by Gamma are:
>>> * scRGB
>>> * BT.709
>>> * BT.2020
>>> * HLG
>>>
>>> Given the lack of support for writeback connectors on the MediaTek KMS
>>> driver, combined with limited hardware documentation, I haven't been
>>> able to verify the correctness of each curve, only that they were
>>> visually sane (gamma curves made the image on the display brighter,
>>> while inverse gamma made it darker).
>>
>> Hmmm I don't think this is acceptable. sRGB/scRGB has two transfer functions mentioned in original specification[1]. To keep color accuracy, we need someone from mediatek confirm whether this is piece- wise or pure power 2.2 transfer function, this is already done in original amdgpu color pipeline series, sRGB means piece-wise while also dedicated power 2.2 function exists.

Not sure what you mean with this not being acceptable. This is about enabling HW support for this functionality. Not every HW has writeback for testing. At some point you'll have to trust the driver devs if you're going to use functionality of the driver. We're not always going to get everything perfect, but if that's really such a worry you can always use shaders to do precisely what you want.

Harry

>>
>> Also +cc Xaver for a review as userspace compositor developer.
>>
>> [1] https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/30
>>
>>> This series depends on "drm: Color pipeline teardown and follow-up
>>> fixes/improvements" [1].
>>>
>>> This series was tested on the MT8195-Tomato Chromebook.
>>>
>>> Regarding the support of color operations in OVL for different SoCs:
>>> * it's not supported by MT8183, and presumably also not by older
>>>    generations
>>> * On MT8192 it's supported by ovl0 and ovl_2l0, but not ovl_2l2 (despite
>>>    the same compatible as ovl_2l0).
>>>
>>> For this series I'm only enabling it on MT8195 since that's the one
>>> where I can readily test.
>>>
>>> [1] https://lore.kernel.org/all/20251219065614.190834-1- chaitanya.kumar.borah@intel.com/#t
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>> Nícolas F. R. A. Prado (11):
>>>        drm/mediatek: Introduce DDP plane_colorops_init() hook
>>>        drm/mediatek: Initialize colorops when creating plane
>>>        drm/mediatek: ovl: Add supports_plane_colorops flag
>>>        drm/mediatek: ovl: Enable per-plane color operations on MT8195
>>>        drm/mediatek: ovl: Implement support for Inverse Gamma
>>>        drm/mediatek: Add plane_colorops_init() DDP hook for OVL
>>>        drm/colorop: Introduce HLG EOTF
>>>        drm/mediatek: ovl: Implement support for Gamma
>>>        drm/colorop: Introduce 3x3 Matrix
>>>        drm/mediatek: ovl: Enable support for R2R Color Space Conversion
>>>        drm/mediatek: Check 3x3 Matrix colorop has DATA set
>>>
>>>   drivers/gpu/drm/drm_atomic.c            |   1 +
>>>   drivers/gpu/drm/drm_atomic_uapi.c       |   3 +
>>>   drivers/gpu/drm/drm_colorop.c           |  22 +++
>>>   drivers/gpu/drm/mediatek/mtk_crtc.c     |  36 +++-
>>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c |   1 +
>>>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
>>>   drivers/gpu/drm/mediatek/mtk_disp_drv.h |   1 +
>>>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 287 ++++++++++++++++++++++ ++++++++++
>>>   include/drm/drm_colorop.h               |  13 ++
>>>   include/uapi/drm/drm_mode.h             |  16 ++
>>>   10 files changed, 381 insertions(+), 1 deletion(-)
>>> ---
>>> base-commit: 1783cdadb70e74a30dfee250f8c2dc13b4e61128
>>> change-id: 20251219-mtk-ovl-pre-blend-colorops-95b7b2883d95
>>>
>>> Best regards,
>>
> 

