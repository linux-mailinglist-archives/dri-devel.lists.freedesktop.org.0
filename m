Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30788B09C68
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5894B10E91A;
	Fri, 18 Jul 2025 07:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U55y7TYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2087.outbound.protection.outlook.com [40.107.101.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272BE10E905;
 Fri, 18 Jul 2025 07:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxhZS71fwdE47ABomwozNOpE88kNO1QTErGNuQjliEddZ0L1ymZeU3X60emeRlG/1nbTQxmsLmQk16SaZZV5awWsZMfJsC5FVqCy9tAXZNF4pKHCQ2zW3VQxltgMNJ6ksPumMnUvcbZczNaAvZXV3HBKU2wQ18ie73AYaCEguP8fpPNBJRD0I5ljbwamPJ4TjeZnzBqCejFmzO36nCReI/XJU+Ak43O3/ln+n5Rt47IhgGW9bxugLuDA2f5m9paCzmD2hgUimgEJi9uJamNIAccC6TYxBFVXDTRwbMD0dTkwvLL/JTK65RLVba0f6Jbepv+yB2+BVhyla8cufQXiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7Xa85fEZpV1Gkgbb9xiARmhS8mi2UgrhTBJRSzqq7k=;
 b=ultzOHYEj3xHWwS/UAJ1wNhxCd8sAghpjjhfTCaDaH07/+7EVfu/cVE8jgJHPsevdhLP/7E2BR72PsNnvjO7fVnFZEd6n6A2FWd7AiBS/Q4Bxn2Gpk6G/m9EbGXTSf+Ga+cXg9uUZ/U2MDAyBRMKJYtEnVFai6eatQpSxmHULbZsPBHC0If6TwkhWC33Snlf9sA/ThSGa7ySHrGysyRf38FNGOSIFmoGpVuJdg/ZLm7gVcr28QwjJWpObLhXZ+yKbuzyNbc3RTiLW2FJH/RH54GEevf15vc4ORUbkDbDZMFIpB5O7rwdSTTC3tNQXsKVuIfNE8tNOUC8PwwYDhVFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7Xa85fEZpV1Gkgbb9xiARmhS8mi2UgrhTBJRSzqq7k=;
 b=U55y7TYyZ1UgEMebUiqsTIXwC48DR1+7Fh1V5sRASzJ4oUre9v2dqf2Ra8hiS2/GrNAEmULbSBbuYJoQX3IWXA2ii49SEI69tSoiuCMkaDYQH36NuLNrJyb92AuSrKAYdzyEVlZxnVgoy3JGwHsuTUs7o6M2Xx3pkRWn84lKveeD9WJvr43cANtZGBKDRfY/IASrW3xoxth3ySNyT9Y+rMftxtj0ZUYfv0NgHw7/+si5byE8xY7Xv2pIlSKW9ms/6Y+JfSDfVODpGH69+OQnxxSE17v7OSWnCW0mXKkLIMRycNjTC3v++2DCZJpgFRx2SzRlnWKHyErHdD2AHSri/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:13 +0900
Subject: [PATCH v2 08/19] gpu: nova-core: register: fix documentation and
 indentation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-8-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: fd999b3e-6145-41b0-f381-08ddc5cc7451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm5qQ3N2SWg3N1FqT0VJM0lHSnJGQTF3OHdjZnBvazRpN2VseXhPYzZSWnMz?=
 =?utf-8?B?eEZaMWYvbGkwb1Q2TDVtVGJETHJ6T0ZhWkdibGgwZWlxM005Mm11amIxQWli?=
 =?utf-8?B?c1dxVG9yOHQ5V2ZwbVZYakZHWDYzWGZqb1hqTU82NjFpRnRkTFJrRUtoUmlo?=
 =?utf-8?B?TURhWDhlRFMyNUJaUVBNcFNKc0xyK1pWSUF3NHFTcVR5ZElPaUcrTG5sbTFz?=
 =?utf-8?B?dUszalkyakJ3d1RJUEo5TGh4RzlLSldWZTBzV2N1c1pLSzJ0UEw1UG5pWDJw?=
 =?utf-8?B?WmZMTVo1MGZtSkxFOHRyTFJuUVA2S0NxSHk4S3RURWp2c0ZDRnFEd3h5VCtV?=
 =?utf-8?B?YmRiVXBYMG5ZT1RSak50UW9qNHFIbFR5S1Q5WTdPeVNIblh3NTZ5cm51SXZ6?=
 =?utf-8?B?RHhZbDZ1MzNoUTcwN2dmQ2hNRTIvcG9adVZReWI1TVM2N0dZM1B6NDh0MjQ0?=
 =?utf-8?B?VTgwVjRMQ0lBd3pTUWVCdXpGNkduckhVYnB4dnB5NWlUdENFQmVreFlZN3NQ?=
 =?utf-8?B?MmhKckV0LzRoL1BydlpFamNuci8rOE9CbDRhL0Q2UHJ3L0lWQlpiOVZPKzJQ?=
 =?utf-8?B?cXhOYmEyc0VmaEhNWG0wdUpJbEd0MjJPbTd6RXF3YnZFeFdaQzdmMmNQQ05y?=
 =?utf-8?B?SHFreFA4VnlTVVVWNEhhSHpuK0poTi9Bc2lVSFdsd0loNy80UXRMZlNCelNk?=
 =?utf-8?B?OTBWTnhtSHlzMG0xeFZMT05vbEU3K0JBdVRKZzV2WDB5Y2JGakNyZXlabzRj?=
 =?utf-8?B?TE9zaXQ2OG1ERmpXYmxBcWtCUDJnTlpveDMxWncxRU83aTRlR2owZGtUQnZT?=
 =?utf-8?B?YkpGM0xIeXZxNitDMkxqWEl4NUl5QjVoVGxvdEFGMXZuSWdXSjVsN0hOZnRj?=
 =?utf-8?B?VTduMk5aNGtTUjE5VHR5VW5yVlZhb2FLeTFvRVNIOVNzeE92dEgxTmtVTmsr?=
 =?utf-8?B?YmRyakRKM3A1TkFYZHZ0bmxHb0Z6Ry9mLzNWQTFJM1F6QW1RMjE3bVJmVHMz?=
 =?utf-8?B?N2xmcWJFRGp3Wm50c1FsdEUrS0F0Q29VUWNmUUh0MDFiekF3cytHVG5ueUxj?=
 =?utf-8?B?N3lkT1QzbTlZZFh4VDh0bEdCeTh1bXNUbWZZUnMzMUVYRzViZ3hOMW1FWFJj?=
 =?utf-8?B?d1I5YnYxanhteEFaNjg5RDBYMCtJRi9ucUNPaE02dUNpRWRycExzWHNNL2RD?=
 =?utf-8?B?WUdZcVRDWUg3QlVaSnNZWk1LY291elhKZWMvOVV6QlhWL3RuK25JQjc4ckhw?=
 =?utf-8?B?ajM5NjY5RDQrdlNFRUJoVFFMa1UxN0xSMzdHQXp6enp5bUhrb0JYRFlNd2Vp?=
 =?utf-8?B?SWJWd0svREgrelQ4bS9WbmJqMkxtc0pMbzhsbThPOXAvMmVRMmUyMG93c2Vi?=
 =?utf-8?B?RVpaRitBS3VOUHdldlgyRXdscDlyUmRpUHBFSUI1enpzVExDNU9EeHJ1M0d1?=
 =?utf-8?B?cENuK0tUY3hEMDdFWnZXSGRUbUIzSE5ZK3pZWmk1cGNjbWFiaHYwUm9OZkVI?=
 =?utf-8?B?SFlRMzhGK05nOGtQRDIwLzluQ05KMnlMSEZQN0IvUDByUVEvSmpac1pHQ3BU?=
 =?utf-8?B?akZabWJZN3RRQUdKSTlHanc1MGlOSWdnQzFPS3VhcG5NL0dad3RXU3RTOUEv?=
 =?utf-8?B?dHFnRGIreTFPQ1dlbmhYVXIySEc4aTNuSEhRNGlDZHRiL01VUCt1S2ZtaDUw?=
 =?utf-8?B?dFlteFVLamZrdnVVclp0NHcyTWk1d3AxdFB0RW1ZZEJ0MHJXTEZrWHI5b0U5?=
 =?utf-8?B?ME51d2RFTDJNTlBEcXlrTmRuc25QdllzWTBEVnZubG5Pb3ExeUJ4d0Vod1Ez?=
 =?utf-8?B?SXI1SVptekxBUWs1aWlibjQwU0c5bjV3TVpkU1pzTWphUGk0aTQzejI2ZW1H?=
 =?utf-8?B?WFArU0VKdXdlS0plNU5sTzFsb1BOQUZkb0NuZnNVWVNpK1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZIMmIxbm9QMXhTNzBzU3ltMDl4d1FuQjhHalV3bm9heXpFc0Y0VmwxeStq?=
 =?utf-8?B?Y0VPZ1d0dUIrczdLYUtRUUdGekdlaDJHMU1NdmxSTnppV0NtWXErblFXMkhz?=
 =?utf-8?B?RWN4OHhQMGpSQkJYaHM2cDJObXp4VXQzeFZhQVpMY2ZHcDE0OGdDYXJXbEU3?=
 =?utf-8?B?SmJaSjlIdEFLbC9ZVk1wRlQ5R1FaaE81bGZVa2ozYnVJQ1hsUFczaFFiU3dn?=
 =?utf-8?B?Mmd4ZXA0SWJENmgrUXpSRDNtd1VpakxKdk9SRW1wbEsydlA0VElSWUtXQ1RQ?=
 =?utf-8?B?aFB1MVdDdXA2RXhLb2xvcUNQOGFnU0xvTm9vdHRFRmticms3VmJhWHRGRmxP?=
 =?utf-8?B?UzlVVHRWbVdXMSt0MXNJMm44bW1uMGhJMVNkWW9BK0gzMTRvSlJHSlBQNEV5?=
 =?utf-8?B?M0w5cWo2ZDhpeVUxYko5akdKaXcxTm41Q1NNNDQxOXk1RTNFWm96WUk3UldX?=
 =?utf-8?B?Tmp0N2VwVzdCbGRKTDV1ck8wdU9zdFdOUDdVZ1lzYTd5S21pOGlIYnVvejlx?=
 =?utf-8?B?ZnlmOEp3TFpSMW14d2lDdGlUaXZ5NDNFaGV5amx5MjNpMzhhemJDNEZ3NTJa?=
 =?utf-8?B?WTdzM2VBcHBpZ0NsU2RtRld0ZWVDYzJKZ2p0eEgyb0NpajRYNzY0SWxZZ0cz?=
 =?utf-8?B?YngwSGVRY0RiMTE3TUNwR2U5a1JYUCtHOXorOVpmZDlLRWdVRXovUzhsZERh?=
 =?utf-8?B?SElUbHR4MVIwdVhydnJJa25yL2c1ZHZZbzNSeUxaTzFJWjJFOXVlT05MWHFT?=
 =?utf-8?B?UXVrU2lOTDhJTjJPbStiN0pKajRwUkJoRUV2dkhsQ2VYWVdyTHJsSVBINmF0?=
 =?utf-8?B?T0E1ck02R09TbEdZSTQ0TEs2aHVEUkpIWjNSa2hhR3VBOGdZVXROV2hrSWgx?=
 =?utf-8?B?eW8xaSswdmdTZ3U5Q2t1bXhHWk85K1hnTStZM1h1WnhocE5teWRqOVRDdjRy?=
 =?utf-8?B?NnN3UWFpbGV2ZVBkdEw3eEdrN3JpNEhjQTZEY1p4NG9oWFZiS0xSRGl3eXAr?=
 =?utf-8?B?RUU2S3BhR0ZXdWJaZDhRUjNnM0pTcTdxOWhHbjJqeExJbkJFTjBRVURKbjd6?=
 =?utf-8?B?eVNTVDhZdXk3K3N2bkppSE1VcTkvQXFOcjROa29oRUJBbXVLMDZyNmtuMlh5?=
 =?utf-8?B?S3ZnbXNlSTdLVVd2dE4vSXJLbk9aU0owU2EwTUNtZjIvZi93Y3ZKbE9MV3ZB?=
 =?utf-8?B?WUZKUVo4enlVREVNdjlVWlFiaFZaV3pJOTAwblJmaERoKzVweGZ0YUtCYkcv?=
 =?utf-8?B?aENFNU12WGtzUTUwK0RNSmlPaU9helRnSGZha1ZTOVNOYW5xaXJOVEVRWnBa?=
 =?utf-8?B?a20zQ0U5YVhiMGxkTi83aUNObjBEeDYyaUQxd3dOVmNZQmMxOER3Z0ZYM3Rx?=
 =?utf-8?B?ZE5Ua0YwczF0YWU5TFhVSTEzOTJEaW9kc2YxUFFDR3gvY24wT21yM1FudDVq?=
 =?utf-8?B?SER5Q21uN0dnbmxMU3lET2N6ajV4bElTRzF2ZXFVUUJSVkZpNHRjS1k1YnJB?=
 =?utf-8?B?MUJpYzRkSTJ1SUdBN3hVbkhKbHlxdzg1U245RHk3ZzNJSFdsN2pSYWNjZU9u?=
 =?utf-8?B?aEJxNmRxWGdhR0lPMUdSTXF6MnlMSFAzR1hYT05Ia0FxZnh2ZzFCbytOcGJ4?=
 =?utf-8?B?RllnSEp1UGJqaUNpamxzeUNHUXhFaUx6dU04N2VJb3l6dkVseW5QMk5NellU?=
 =?utf-8?B?ZTg1M3JDWlYrTjErN3hrcm56U2hVYlpWRVJyT2Q5YW1ReGYrYS80S1FSVVJm?=
 =?utf-8?B?K0pHeE00K09QYlJ6bUI2YmVJOTRZVUxuWXNtY01ydUtWakpUdEgrOTFHelhS?=
 =?utf-8?B?Q1p1MTFPUGdqTzYyM2ExTU1uemtNVjlJdStUMktMcnhNY3FWN25OcWZMbWtQ?=
 =?utf-8?B?UzFtaEtqYnhSOU9QMy9ub2hDVWszMWVFK1VxOEdtWllMK2RCZEpQd3FwcThB?=
 =?utf-8?B?TDA5T1N0L3ZUdWZUOEg0d3BSY25PVThLdmNPQm90WndMcG5BZnF1aUdBZlhl?=
 =?utf-8?B?MDYxempjbkw3NG5UNHZHeFJoZlVkZmFzQmZ4Vkl3eHczcWZlUEttK3FNb0lE?=
 =?utf-8?B?dmJYMUdqUlBwYVg2QUNkRGc3T3NQWnV4eXVFT0RVUm1wekxVOWl3WW4xUzYv?=
 =?utf-8?B?MTRKaHhGSnlueWg2eVM4NDhEUmJyamZnZXBtb2c2T3U5QlpwVEhLaEpFc1Yz?=
 =?utf-8?Q?EZdm8sI6BQHqKI+yR3fang3b9+1SLpB9N0C/dsViCVnH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd999b3e-6145-41b0-f381-08ddc5cc7451
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:47.3127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDjhmcKr9P0xMDKnoNXO9EWuPOx5kb39bebCL7+dBfeb7KCVcylv26mmnwwOUc+wvcIYHLtphB5RvGGgCfI2ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

Fix a few documentation inconsistencies, and harmonize indentation where
possible.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 34 +++++++++-------------------------
 1 file changed, 9 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 4da897787c065e69657ce65327e3290af403a615..32fbd7e7deb9edeed91972a373a5a6ac7ce9db53 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -87,44 +87,28 @@
 /// providing its own `completed` field.
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
-    (
-        $name:ident @ $offset:literal $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $offset);
     };
 
-    // Creates a alias register of fixed offset register `alias` with its own fields.
-    (
-        $name:ident => $alias:ident $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    // Creates an alias register of fixed offset register `alias` with its own fields.
+    ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address.
-    (
-        $name:ident @ + $offset:literal $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ + $offset);
     };
 
-    // Creates a alias register of relative offset register `alias` with its own fields.
-    (
-        $name:ident => + $alias:ident $(, $comment:literal)? {
-            $($fields:tt)*
-        }
-    ) => {
+    // Creates an alias register of relative offset register `alias` with its own fields.
+    ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@common $name $(, $comment)?);
         register!(@field_accessors $name { $($fields)* });
         register!(@io $name @ + $alias::OFFSET);
@@ -259,7 +243,7 @@ impl $name {
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
-    // Shortcut for fields defined as non-`bool` without the `=>` or `?=>` syntax.
+    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
         @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
@@ -310,7 +294,7 @@ pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
         );
     };
 
-    // Creates the IO accessors for a fixed offset register.
+    // Generates the IO accessors for a fixed offset register.
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]
         impl $name {
@@ -344,7 +328,7 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
         }
     };
 
-    // Create the IO accessors for a relative offset register.
+    // Generates the IO accessors for a relative offset register.
     (@io $name:ident @ + $offset:literal) => {
         #[allow(dead_code)]
         impl $name {

-- 
2.50.1

