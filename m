Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341279F314A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 14:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8441310E57A;
	Mon, 16 Dec 2024 13:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iMNs5DvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D221310E57A;
 Mon, 16 Dec 2024 13:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kH9DdS2NM2qug+gHe7vkMKWOz+bLUHU84qqaH72LEFmgzyTv/RwdnzjDlbb8kr+gprRAVhdNh6MqRtK3uu5erlrVutNkQomzI4pJE9RmmZnLkwCrvOWUZEWax/gt8R1kzZnP8WV+NuZRgKa3ApeTAGHKG2p94c/Z0xjdj36M0up7TBxNSPBDUa6GDnVH4BKtBBT6hkYfAXO6J/fRxutLSmMDiyPv94yf8O/sZi0Gtm67Aj61l3MSZrK8K5Pzzi0mG7SBSV+xHUroNsP+B58fejbwXrnToB5xNKGjIxYQXw4v1Qfsr7960oNqUbBl54O5AtZ8AFUswOoMilsyDn0MCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cayR9V1+G7dMhA1LGvV9uogd4xqAPuqXXbIpPzGVklw=;
 b=texE7gUP32VblK8mAzPgl3ZQTS9GQ8Zf78z60JOFikg4W7gm5/C2XMvL5i1mlnohIusDTIxxH/wBPC0wEuhE+GSY7mzjx4jys0VN4MXhOVxTGu+QPCccpbXbIMBaoBMfHYWlYoCGQuLpE6FxUsUouDiSwtfiAAW/dD/746o7LlkktLB2qidnLaIbLvv4tf8p4fpid5VY6EL3uxPG4Q6fsaD5rCwKMRKhZwwzVoXtfX8dExEkfpPCGVYg6vv6BQjRbElFM34pkZz8O0Z5sAAPUQ0DKbg7Q1ooxsvPFncksFXr/8T/dZ013/w+thMvYEAl51V0CIQq6gWU8ykp5iMJUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cayR9V1+G7dMhA1LGvV9uogd4xqAPuqXXbIpPzGVklw=;
 b=iMNs5DvJDd0sH3yEMWUaE2Jq1hDrV3OnyZdH33LS4W6asDFaqWeEmogI5pc9shdVU7Xi/Xq8YlO20Vb1KKhpAe+7GxOuGpWsbRdP+HNPeWWRnE6VLH3WlP40/XgLy+TOtUJ1Cwyq2bbKuZLCr7hzHbXUTqlV77/O1TKZY4aIGls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 13:10:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 13:10:54 +0000
Message-ID: <84b6dc5b-8c97-4c8d-8995-78cf88b883fc@amd.com>
Date: Mon, 16 Dec 2024 14:10:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/amdgpu: Use device wedged event
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>
Cc: airlied@gmail.com, simona@ffwll.ch, Raag Jadav <raag.jadav@intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212190909.28559-1-andrealmeid@igalia.com>
 <20241212190909.28559-2-andrealmeid@igalia.com>
 <d9f2583d-da79-4532-90fc-85028e977ceb@amd.com>
 <c7c498f0-2ee3-42f5-9b45-c87e52ffc3e4@igalia.com>
 <Z1xGe1X_XzB00J1Q@black.fi.intel.com>
 <ed83b0a1-62d1-48e5-ac7b-478be3043733@igalia.com>
 <28d7dcd8-ed3f-4e52-b7fa-c348a827085d@amd.com>
 <7c64746a-c1f6-46c6-a97f-cfd87e9ec3b7@amd.com>
 <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5f7dd8ac-e8cc-4a40-b636-9917d82e27f5@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2e6a90-2052-4677-9531-08dd1dd3129a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFA0ek56NzlOYWJCUVpZL21USFpoNmEwWHlvNFNhcytTWWtRVDJEb2ZwU1c2?=
 =?utf-8?B?OUpnODZhWDRmcDFoYkZBVzVZaThnR1R5Z1BOZnJ1R0dTUlNoOEtTUlFqclNq?=
 =?utf-8?B?cXR0VzJ2bC9hOS92cS9TQXdUYWZtelVFT0VIR1RSbi9ZZmcxVVhWdlNhUFRm?=
 =?utf-8?B?bVZDczBESnVEcFNJLzF4c3c4OWtUbVRpdm1mclZKZERxWi96OUNRTGtFNmJW?=
 =?utf-8?B?T25hSFZENno2WEYzUlRoK0Exdi9yYWc4ZWtIYWhBR0RlU3FCSlY2TnNCdkhm?=
 =?utf-8?B?ZUExQWxvRVN5NG5IVzNWSnRRTGxETGE3MGNJNzlpOWpEbVJHSWFIU3VlRWRw?=
 =?utf-8?B?cDNrdjJaQ3RZM0pNVTUrTWxURzVPUU5ZWDJQZlNJSFVrc1BvcjNzMWxGbklY?=
 =?utf-8?B?aTR1NERRbkExak5WVlFtdEJjVEYxZ0p0a0xmbDVENXlKb1ZaclNROS8yN1M0?=
 =?utf-8?B?VnMveS8vSTQzNXl3OStWN2hGTnNUQ3hUVE1CVlkxeWdRbXJPTWRSTGFlOUxn?=
 =?utf-8?B?MU9rbmVBSUpQMnNYOEd6QUJmQlFmejVWbEtqaHhrT0YrVFI1aHdXWTBQWWlx?=
 =?utf-8?B?QlM5U00zRnFEaENhSjhFd0ZaUTl6Y29GWkRqYnoySXdyTmJNSkxnWEtHMlEz?=
 =?utf-8?B?TENvemNLZGV0SFZvUEVyQnU3aHJZeS8vM256akd4U2hTb1U1WjIyUUk0L056?=
 =?utf-8?B?Mkc1NWdodU8wWjVCK2RkdkJyd1dTbkgxc21ZeXp1cXpYeXEwZnU4WmRyWDhu?=
 =?utf-8?B?T3J2cTROdVNQVCtqV25sQ0F3TjBSeHFrcld4UWlKb3FpcVFUS2JTaHhXL21H?=
 =?utf-8?B?MnBJTjJTZklDM094K2I2NWZKdXBKZGxIT29lM3dpdDZqUTkzUnB3YTY3a0Rk?=
 =?utf-8?B?N3Y4NmtueXBGamJLZ0dNVDNzcUhHUnNRSlZ2Q1E5K0pQSVVHZHpSQkYyZEx0?=
 =?utf-8?B?SDVLU2lkbERJWHpBUzE3cHZDeDdLdnMyNUNPU2puRkV1bmNJY2FSRVVKL1Vz?=
 =?utf-8?B?RFpBUnZjekR6b1l6WnRvUk83ZHlLc2hGUzFqcmYxendCdDFzRktUYTlweUl0?=
 =?utf-8?B?MzE1QzZRREwxankwNWRtYzY3N0ZrNDlBd3M5VXZsQnIwUXhOSVJjREtJYkxs?=
 =?utf-8?B?Mko3d3V2Nk55SWpFTG4vM0tLeThmQjJQY2d6NDU3RWZuQTMwYjdrNnF5UFZt?=
 =?utf-8?B?OWl2Wi9ycXc4enFHWGxsL3BSTkQ3SVoyUVBUd1NucFlUSjdpWHN1RzJrdUlN?=
 =?utf-8?B?S25ydmVoUEloWllJQU0yUTlVSTNtK2NnY2JIVTBSYWJUQUxJNE1qUzRpMGY4?=
 =?utf-8?B?WVB5dVMxMTYyeE92YXZlNnBTNktoTWs3OGhoUmI4bjBza3FHbWtHRDVwUVZo?=
 =?utf-8?B?d2ZSTHowcFpwYVp6UnBZU2JGK2R0N2M4aWIrUDFnUE9CU0ozaDc2QmpaMlJx?=
 =?utf-8?B?RnkvRkVqUzFLUFR2Wmo0WnYzRkdqYXRMRFZJeHFGSFgxbzhVSFNZMmc1dEFI?=
 =?utf-8?B?K0VwbC9lQnYyRmJCUVlWSStXRFhJQjlZaWZtcWZwN2NsRFl2M2xQdGVNMHY1?=
 =?utf-8?B?Z2U3K285SFRDTm1wWncvN0RjdVRMRm5mQlcvWlJiN2ZTSTUrY2NQNklLdmpP?=
 =?utf-8?B?SFkzYjV1ZGtQOXNrWFFpTnZTcERxakJxeHRHL1QyYnNCY21pRXU2WDVpV1Y4?=
 =?utf-8?B?TXJlTEp5ZW50Z1FUNkpMdjBTV2VVQUd1L1dwUkQ4ekZvMHRpS2NMRFRHM2Np?=
 =?utf-8?B?dkN6Y3BXOTd4a2crT2ZZWlQ3TWN3aGRyYmZoTFllN1E0THFxaUZBVWZheTd1?=
 =?utf-8?B?NXNzcGJrK3pCczZDNEdKL1BEemh1MEgzWnRGUnIzM0VnZm1CNW9OZGlNMmNl?=
 =?utf-8?Q?l2Tv+xX9YR6Ec?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3FzWFltS3JZYmRISlNERXhYUnZRdGh2VStVK3VTczFlTEpQMmFBbElMeFBN?=
 =?utf-8?B?aGtmb0FtMWxvdmR0Z2ZHT2FYbi8wdlA3Mng1cnBLUWJObmVzVzc2WXNBZEdM?=
 =?utf-8?B?aGQ3dTk0T1ZFZy9adEMrQkhDV3JGT0Z0QXBvelk2ZFFYYzBCNWxDVlpEeWdC?=
 =?utf-8?B?QmFoTm1SdC9QUWJzS085RDA5R1UzZWt6aEJ3WkxxaEtRcDJDeXhqL0NLTnF3?=
 =?utf-8?B?cm9aa01SVk5HekhLOTF0a3A1ZzBYQ2pYdVFqQjFqVFB5bjNwMEJFRzdla1R0?=
 =?utf-8?B?V29PZVNBR0VDZnphMWRNK0JmRW9NdVJHRldsY0kwbGNpMG5FakpoME5YY05B?=
 =?utf-8?B?ZTNGVjFtUm8za0wrdEFsY1I1elRKYTN3U3AzZlBnbU5lVnFJRnhIamh1amUv?=
 =?utf-8?B?bEFsa0RwWkxGV1M4b0YyMitzaGZCN3VDVjQvczM1aXl3WitIZHhXMUZwbVhx?=
 =?utf-8?B?bVE5YjlERmZCWDJGWHE2ekpqKy9BcG9QRVVOVXAvVmp6Ykk0dTRHMUxDa0lo?=
 =?utf-8?B?K0JwekFjUGNaVWtWTEljZWdNZmIxemF2SC9ZMmRvMW5mbmtzdzZqb01DRDZU?=
 =?utf-8?B?ZGRRcDNwMW1TOTE2cVp4ZWc5aUNMWnNWR3YwT3hFd0hMRHI1OUR3bHRVSzR0?=
 =?utf-8?B?L24xcDF2ekNpdklaVk5JZlFsdC9EOWFSeWlOby9rUjcyaDNTeEhqWG9oS3p5?=
 =?utf-8?B?eFMrb3NweDJ3SkVjS0x1WWc2SVhra0ZFY2pTTnJiSllQc0ZIbVZINmxmTTB4?=
 =?utf-8?B?VXc0amJaV0k2RXI2WVNqRCt0S3hwanlycnRkc25tai90M1hoakU0Z0ZxU1hN?=
 =?utf-8?B?K3lLUzlCNmh5ZUxBdXRFKzBqRWlya0grUDVlMmkxR3NOOFZmRm5LTUlISU5z?=
 =?utf-8?B?Wlh3OEFURm5BUDNSVWNkeHE5S0F3SU5BM2JkUXlRN0FMdlJpMU5vUk1tVk9m?=
 =?utf-8?B?L3pYamF6RDJrY1ZCNFgrWlVvVTRVcGNwemtSVDBDZ1VzVDYzNmZPRnF3VFl0?=
 =?utf-8?B?TjVrbk9FdjVqT1ViWXd4RUdnNmZ3TzU2bEUxOXdlQkFpNlkwbEVlaUNRZEN6?=
 =?utf-8?B?Z1pmZkR6eG00eVNMcU40VkkvRzIwbWk0eWJiZlFSZ3I5UzVSN0xEOVJ1QXA2?=
 =?utf-8?B?R3lkVk5sNTRJSjZhQkI1LzM0VmN2aEIvdVBRT01CQmhvV2dBeC81Tk54Lzh2?=
 =?utf-8?B?NkxDdytsWXZwN3Q1WWJYNmh4aWZYVGdsNFpIQ2YxeTUxcE96c250MFZiSFdL?=
 =?utf-8?B?bU9tcTRvSlhPclEyaGJLRG04V0NvNVFmZzY1RWdhUElta08wc0E4TzlXbXBy?=
 =?utf-8?B?dDNwL2Vsd2NoMTQvL2tMVWhLckJNNTJxN3hqM254Um5LMFFQdS8zL3lRaHJ6?=
 =?utf-8?B?alpaRmZVRy84VG16RS9rT01DVHladktxWHBTOFRiTjJDRDdZdGVRM3V5Rmov?=
 =?utf-8?B?Q0hBQ3R3QlFVVXdoeGVSMk5JRFBDTElhRHB4NzlZV21qQ096L1JJaWM4dENV?=
 =?utf-8?B?YUtjR3J3eW1jRjRWR3hUU2hqKzNkRjFJT2wveU5MblRCWk9lYTBuMFdhdjRF?=
 =?utf-8?B?TnZUSlRpZ1JKdTBNeUdleWluT01zUVpZU045VXNWaFczVGxZeWo1NFdzRWNa?=
 =?utf-8?B?OCt6ajB6dWNOSHU5VklWVG1jRUdrYlQ2Vjd5dXAwRmo2ZXZhRGVsVU1xdERE?=
 =?utf-8?B?ZER3WHpmaSt3TWNESTlqRUpuTkNuS2tZQ0w3QXRZZDFtZXVuc2IxY2ZlYXor?=
 =?utf-8?B?NXBrTkhJeDMybnVpejNyZDFpVVRpWHdHZkNzb0tXQ1Q1b21FSVg2cWg1R1oz?=
 =?utf-8?B?Z1d5QU1qNm83K1RpL21BZW1QaTB2Y0hSRElaL04yZWZjVXVqVWVVcklyNnlk?=
 =?utf-8?B?dXhteWtaVW5yWnFEdWd0b0ZhdVAwWmFoYmVBVFUwSXg4blVVdVVoZzZKbzc0?=
 =?utf-8?B?OUJBR1FQVyt2MjZmWnM2QXhGT09EajdLdnFoSHBnZzBaVmx1VjlOT2VMbk8x?=
 =?utf-8?B?VWM1OVNkdklxa2NRNFpUMFBmcXlocjFKUzlJZTNmRFhyNXZRWUZubnRvNDBH?=
 =?utf-8?B?WTZrNGF6U2VYNzViczJ0TVdDTUk5WCtUaW9MZlBtQTQ5SlNGeXZmZkJDVDB3?=
 =?utf-8?Q?u4pphKftWhxl2tgoHG/MmaE4y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2e6a90-2052-4677-9531-08dd1dd3129a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 13:10:54.5356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bX3Q7xptZgLfRIt0gtdbE8WPzWSciddnycBszuqmNKFlqi0Xto4ga36auMV2VOKJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
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

Am 16.12.24 um 14:04 schrieb André Almeida:
> Em 16/12/2024 07:38, Lazar, Lijo escreveu:
>>
>>
>> On 12/16/2024 3:48 PM, Christian König wrote:
>>> Am 13.12.24 um 16:56 schrieb André Almeida:
>>>> Em 13/12/2024 11:36, Raag Jadav escreveu:
>>>>> On Fri, Dec 13, 2024 at 11:15:31AM -0300, André Almeida wrote:
>>>>>> Hi Christian,
>>>>>>
>>>>>> Em 13/12/2024 04:34, Christian König escreveu:
>>>>>>> Am 12.12.24 um 20:09 schrieb André Almeida:
>>>>>>>> Use DRM's device wedged event to notify userspace that a reset had
>>>>>>>> happened. For now, only use `none` method meant for telemetry
>>>>>>>> capture.
>>>>>>>>
>>>>>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>>>>>>>>     1 file changed, 3 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> b/drivers/gpu/ drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> index 96316111300a..19e1a5493778 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>>>>>> @@ -6057,6 +6057,9 @@ int amdgpu_device_gpu_recover(struct
>>>>>>>> amdgpu_device *adev,
>>>>>>>>             dev_info(adev->dev, "GPU reset end with ret = 
>>>>>>>> %d\n", r);
>>>>>>>> atomic_set(&adev->reset_domain->reset_res, r);
>>>>>>>> +
>>>>>>>> +    drm_dev_wedged_event(adev_to_drm(adev),
>>>>>>>> DRM_WEDGE_RECOVERY_NONE);
>>>>>>>
>>>>>>> That looks really good in general. I would just make the
>>>>>>> DRM_WEDGE_RECOVERY_NONE depend on the value of "r".
>>>>>>>
>>>>>>
>>>>>> Why depend or `r`? A reset was triggered anyway, regardless of the
>>>>>> success
>>>>>> of it, shouldn't we tell userspace?
>>>>>
>>>>> A failed reset would perhaps result in wedging, atleast that's how 
>>>>> i915
>>>>> is handling it.
>>>>>
>>>>
>>>> Right, and I think this raises the question of what wedge recovery
>>>> method should I add for amdgpu... Christian?
>>>>
>>>
>>> In theory a rebind should be enough to get the device going again, our
>>> BOCO does a bus reset on driver load anyway.
>>>
>>
>> The behavior varies between SOCs. In certain ones, if driver reset
>> fails, that means it's really in a bad state and it would need system
>> reboot.
>>
>
> Is this documented somewhere? Then I could even add a 
> DRM_WEDGE_RECOVERY_REBOOT so we can cover every scenario.

Not publicly as far as I know. But indeed a driver reset has basically 
the same chance of succeeding than a driver reload.

I think the use case we have here is more that the administrator 
intentionally disabled the reset to allow HW investigation.

So far we did that with a rather broken we don't do anything at all 
approach.

>> I had asked earlier about the utility of this one here. If this is just
>> to inform userspace that driver has done a reset and recovered, it would
>> need some additional context also. We have a mechanism in KFD which
>> sends the context in which a reset has to be done. Currently, that's
>> restricted to compute applications, but if this is in a similar line, we
>> would like to pass some additional info like job timeout, RAS error etc.
>>
>
> DRM_WEDGE_RECOVERY_NONE is to inform userspace that driver has done a 
> reset and recovered, but additional data about like which job timeout, 
> RAS error and such belong to devcoredump I guess, where all data is 
> gathered and collected later.

I think somebody else mentioned it as well that the source of the issue, 
e.g. the PID of the submitting process would be helpful as well for 
supervising daemons which need to restart processes when they caused 
some issue.

We just postponed adding that till later.

Regards,
Christian.

>
>> Thanks,
>> Lijo
>>
>>> Regards,
>>> Christian.
>>
>

