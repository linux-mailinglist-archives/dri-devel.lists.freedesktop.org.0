Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCC4B30181
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 19:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBDA10E38A;
	Thu, 21 Aug 2025 17:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MElf9B/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F015910E059;
 Thu, 21 Aug 2025 17:54:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jlSkpETQ5X9mOcxrbsg25onpcNE2eLuI7tFOrRkIiNMF4Y/YcJluAE2h68FHrxbSJlo779rsXd3QEHRe99jqf8QnJGZmgsqsKJy9ClfogzCtGYo7AHuCBSKKE9BlNkO+u1aJqrotgPHBl+5GAaDnTMaRiSZNsDtiCofbAac3dSKEgWOF9fpF4d00mC1W4cvHMgfeJ0qVSmGbJlnEkYoXoH/QseZT/5GjG0svPnfVCFmiHp1kDC7RSD7G7Ws/R77a949elMN2hlCSu8rXPlh3mw/WO7loH8EL4N6gXLSAeLjwu8amgDkHYmwPwcSxU88+sMGuqPSdrx4g+9Ydvfn7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CIwPCWCzxGUXzIz13vxxnuFbIKWDjDAxjO2Mg9dOYAM=;
 b=HvtxZT5vlgm4S4GLxOF3dh0/HMHZhr3rRwUSR5amR8VENv//Cl4HDoCtVFQl76Dax+R2UD9Y4a/qC97Li/J+sL1ij1ardK/BCcQ+x4bHS1KJqREQXXEi7pxc1Br7MOhCq99kYumZHzqAMFBGy3C2mws6P5TLLDlPK2hS+xLHT3IEAIqFUdpztIrPsayrjN+Tj+Mgsrak0VRDgsCOYifBYD8hEDEkyqg6kPQG5xBY2EqORDxFTOy8tR7IPM4Cg5cMtKK7KGDE7J8z6KOvXKyo9bN6PaVzvmWAsjyevrKJarrsdOSSD4qnacStt+RL1ixByk7iwrCOseUgSP8/HwBmow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIwPCWCzxGUXzIz13vxxnuFbIKWDjDAxjO2Mg9dOYAM=;
 b=MElf9B/7R9F6QkycOD6u9W0V5UgwwbQtajU5xVk+g8R0ZIIDLsT3vi3gzh6k6qskhYscgWr5G/zbDLEygeyQWugGCv8ClF65BM9femIOlhAqfvi4IrnbJyLc1ccy0SpGaqkX+nyovKOjwU1mKmUvmXPeEqs9SGPWQ3ZbPfDQd5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB5618.namprd12.prod.outlook.com (2603:10b6:510:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 17:54:36 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 17:54:36 +0000
Message-ID: <4eef4157-cad5-4399-9bc9-c5c2f005d472@amd.com>
Date: Thu, 21 Aug 2025 11:54:32 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 06/47] drm/colorop: Add 1D Curve subtype
To: Xaver Hugl <xaver.hugl@gmail.com>,
 Sebastian Wick <sebastian.wick@redhat.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, shashank.sharma@amd.com, agoins@nvidia.com,
 joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 victoria@system76.com, daniel@ffwll.ch, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, nfraprado@collabora.com,
 Daniel Stone <daniels@collabora.com>
References: <20250815035047.3319284-1-alex.hung@amd.com>
 <20250815035047.3319284-7-alex.hung@amd.com>
 <DC6I12RMKGXL.1L8KAEE0UBNNW@redhat.com>
 <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <CAFZQkGyXbD_x0V6KBdR4vaunF+bG+HKOYAA7y6aVWfeTQ3cLzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR2101CA0020.namprd21.prod.outlook.com
 (2603:10b6:302:1::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB5618:EE_
X-MS-Office365-Filtering-Correlation-Id: bfde3ccf-3ff0-4ddc-fd8d-08dde0dbcad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjBmTVQySDFFTW9vbWEyc0pkbmNBbVN0Mm93bHREUFpFT04yM0g1Y3prQm5V?=
 =?utf-8?B?S0dWZHY4N2dwc3NBVjhrejlCa1JtRHhUbEdpRUxsSHFQejhCaVg2VzhqcFFD?=
 =?utf-8?B?M3BKK0hTL0F0WFNDdlN4ZDJZOU44ZEpHcHNKaWZ2a05iYnJBOVhaZEZMN0VX?=
 =?utf-8?B?Z2hXUFRlU3hkNGVzTVJkeDZnZjhVVjZtYVVidlZYdDBqSDczaUZlTTB5a2xJ?=
 =?utf-8?B?RXNCZytmQ3ZGYjdzUklTdlI3eDRCditKV0E3SUxRbUpNYytFbnZvTlQvK3dv?=
 =?utf-8?B?SEVjTmp0TWxFcE5lVUdQVDZCUHhtUUNjeVYwUUZjM2VSUnRQMW55ZmY0bHBD?=
 =?utf-8?B?U3ZTM3lQVTJVS2lscUswb3ZyNEZ3ZTl2RTlyOUVrb0M0UzRlL29jWnpqa1Zn?=
 =?utf-8?B?UjliV0FqZUxhRGw0K2tUSm9UNUMyeFRCTlZxOVhDcHU5ck54RXlCUkwwL0l3?=
 =?utf-8?B?bHMyckdLam9yRnNvUHJ3WmlGeG9abWlEYkpRVFVzY1RUbzlUUVg0bjB1aCt3?=
 =?utf-8?B?blBNaitwbFVzcTB2RTRoTlMzNS9GSkhoYkwyaFRkRmV0N2NpVjIzK1pIUkVu?=
 =?utf-8?B?d1N6dnREL0h1dEJPY2g2VENlaEtNSnhlOFRVQVdSVWtSTlZ3azdDMXhzRGVk?=
 =?utf-8?B?QmxGVTE3SlJBdTR1MlpVUlF4OG05NVI2ODg5VkhKQWZPa3BqSkowcTFFMVQ1?=
 =?utf-8?B?Uy9halNGbSt1R1pQSGZUM2FISWVOVWFHTHRSTi9LbmRqaVZRQXVyaG9yQ1ds?=
 =?utf-8?B?UVNhanFDaC9KL0xwa3VDT05zMVpubVdmUElkK3B6R3VINStKSmpUaExzODJX?=
 =?utf-8?B?aW0rYmNMZkJpOUtOQ1A1T0p0MjBxc3FpeEhTMFFsb1pwckpYcHp5bVdIMVpm?=
 =?utf-8?B?RlFjSUJpU2hkblFlcTZxaExKMUlrZWUrS01wSGJBUExkNzNVY2hnM3VkdGw0?=
 =?utf-8?B?ZVE5UmtXMm1KMVY3YnFoT0RoNjBucEd5bk1MWXFYdURvMEs2blRyaGNEendi?=
 =?utf-8?B?eDNHdmNVZGhkVzhoUlJkZ3BNZ3JYNVpzNk14TkM4RTE0V29XZzJ0elZ3Mm01?=
 =?utf-8?B?aEJjaW9qamxScitGb0ZEbUJIWmZBRzEzU1pwb2UwWXVta01nU1dHQjErRm8z?=
 =?utf-8?B?RDhhRTBOcHB2QjUvK0dlb3JSTmU0THBMc3YxeXgvSVdKc0JpeVRpcldlaDRH?=
 =?utf-8?B?QTkyMkJYTUx5SllLU1p3Ynk4eUdhb01VQ2p5b2prZjZzd1NJNmRwNHlrNWEx?=
 =?utf-8?B?MzY2NmNlRlNWaUtyQmZlTFdVYTV1V0F1VWRZWkpGYUYyMU1SRHZCcFJSM0Vs?=
 =?utf-8?B?ZnRkVlpncmpLd3pMdGgyeE9yMGl4VGYxbFpLU2dVbWlySElFNFRCTGJISU1H?=
 =?utf-8?B?dmN0WE1kRVVycE9yYVJCUzMxYmhad0JnSCtGZXlrTEx3T1YrdXpnQjdQZm1w?=
 =?utf-8?B?OURFUUNvVnZyekRLeWROVjJsVXJBcGpFOHF4bTY4Z3FrWWgrSDcxM053UVVC?=
 =?utf-8?B?L204V3pMQVdFM2l5b1lkbmhOMEZpK09TT08zZHVkUnYyUXE3TVhoMVVUeGdZ?=
 =?utf-8?B?bE9BZ0VrT2g3dW51ZmNNRUFGWVpJbzBRS09rUjhNQW5kK1gxTnhXMXdJd3Ns?=
 =?utf-8?B?eksvdmV3bXhpWGpPTjVYZit4WnJ6RWFkaWtjZU5RcTR3bit3dUViU3ZXNUlH?=
 =?utf-8?B?YnZXZGd3LzA5UjErTWh4Z2tJVDRGVitrVHRpdkppK0lMUlptTXJjdlRxbWhK?=
 =?utf-8?B?SzFubldCcFZTSzl0R0Z1bEJuS0QzT2lVMnV3Slg5Z3UxdVBucXNkb0w0ckxy?=
 =?utf-8?B?YTlyd3VTWk9HYlBvV3Fsc0xOMWtKeXE1cGpRUTVGR1NwVUQwWmdTZEJwSlgv?=
 =?utf-8?B?bTJKR05Xcms0RjNBWFN0aVFMU0xUZHo0Rlk1NzVzYkl4eWh2Y0dFRjNOWWlD?=
 =?utf-8?Q?pBbuHsE14ig=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWt3SXV3bGxYVXgxVG0wbmJEUUdVKzRiWnNDSWl2U3FrQVZpVEdQdUhlb2s4?=
 =?utf-8?B?Y1VwK01VRW84WDJaWncxK1FON0dESmxSVXZ6dHhiN2pMMWxSTm5PNXF6RDRv?=
 =?utf-8?B?VlhPSWw0ejFGeXg1WGFyTTAxeERNYmtFMGxySnNaV3VQZndpQW9sNnltdk04?=
 =?utf-8?B?SjRIMmlqNjlGMWxja3lsYk9WOXFkcEtDUy8xR1pwc09YWkJ5ZisvYVQzNkJx?=
 =?utf-8?B?bzZWMmh1T0s1TWJocWZwMWc5RVRrK2lJUVh6dmhUSzlIOUwrVnhLMm4rMi9T?=
 =?utf-8?B?Szlxd3RldlNtUXM4RSsxV0J6YzZVM3NjYWxuR3JveHJ5ZXkwdVhpQ3dFZUlv?=
 =?utf-8?B?ZExRbnVodkg5NjZ6bVJzZzNlVjE5Zi80Tnp6UklyWTBCQ1ZaSCtxZitEQTdR?=
 =?utf-8?B?RFRtUEFYa0s0Mkh1aGs2UGwwazFHV2RrWElHN0xpRnZhZ0tGZTFtVXl2ZmdW?=
 =?utf-8?B?THBhbzFibkV5SGRLbVBDSVp5VmhaUEhZaGNXbmUySW1pNmtiQUl6WW9idEhk?=
 =?utf-8?B?dVk2aGZ2WUNzZWl0dFZUVDNFbXdIYzBWMkxDdlpFbi9lQTRwQkdnamExbTNI?=
 =?utf-8?B?V2xNSloyOHErVWpCVHFsZndsWU9pRkQ5eVE1SjAremh1U21VenVLaEdjVElS?=
 =?utf-8?B?bjNwQ1VnekJ2SFBqa0lsRDRPQjRNbXl6WDlsYWh5L1NiQUNqWmFZRithcmtk?=
 =?utf-8?B?WDZ5N1R6VTlEVVJ3UzJiZ1doWGZoeFdCU2huT28vd1daQnlrdm4yWUI4TitU?=
 =?utf-8?B?eC8rNzRiQ0Nic01LTTFSV2IvSm43cW9uUEJJMlYwL2VEVVFUUlNxNllLQTNq?=
 =?utf-8?B?ckFnTXlUeXlwajQ4MnFqV1JxWGR4WE1ZUW9TNkZrQVpYRmYzNk82U0wycWZV?=
 =?utf-8?B?elNEcThoMk9aRUR6em84ZGJ2TVp5bVVEMUs2cUhpalAvZ2pGbUdUMmtTTVhy?=
 =?utf-8?B?dFMxamVCNllrNk1GcngrT294YVE3WEFNZ1FaUi9tcllFSTNjbzZmWEovRm9D?=
 =?utf-8?B?QVZmTi9uTk1SdENpNmw5bXJCZ2ZySlJ0c2ZOU0RXU3Y5blI0dkIrdDRBaGtm?=
 =?utf-8?B?RGl6djIxQS85UGVNRWtmeUxlV0k3bElJMUo1RXdoRnk4dkUwMXltMWwwSkVp?=
 =?utf-8?B?YnhVK3pPOEZYK1M1Yk5Sa3ZISlRKV3ljbkU4QXl6K1J4NXZHMWNMSXBjWXpY?=
 =?utf-8?B?UXRxOUxzMVlNTVFjbTRRQnRRNFdzSENKb2tpSnVnYlBJZGNLdzYvMVcveXNW?=
 =?utf-8?B?blNuditzUW5CeTZZR25TajVOVnpXUGhSVTU0clE3cFFNQ2dkcmNxZmh6d291?=
 =?utf-8?B?bzErMWZmamxaU1Irc3RYZ3phR2wwb3hzYkNLYWowUGNKMlRrRzdTN1QzWUJx?=
 =?utf-8?B?Yzh3T0N3dVZZckRkVk55T2kxTjBlWkdRc1gzMmNDdnNBSVlyZUxrYlVEWXhW?=
 =?utf-8?B?WUxQbkhGckIvTCtqQVFpNjZMY0N2cFFlaUVzSG8zelZodXVlUkpzQi84Zlhn?=
 =?utf-8?B?d1NtbVc1VGJFcEFUeUdDNitzR0RKUUErMFNPeHEzcTBUa284eXBrakhVMHEy?=
 =?utf-8?B?dEp5b29lSk5iSE5FVnZQYUU3TWl1Z3hzR3o5VTlJNXlsN2tuRkM5MFErL0xp?=
 =?utf-8?B?YXFzSy9ROWtrUVlERzVzYjA2N0RMclR2c2dwQzhXYnVsSVNJb2lia1NrS3N3?=
 =?utf-8?B?L2hBZnVnTU9iTnBBWEFidkVLTzk0YUxMY2pjQkgzdVNMNlFCZTR4TnJvUXFa?=
 =?utf-8?B?R2dzTHRpYWpjNWhWdXpHVHhCZGFoQW4vQlcxaGZ5NEdFZERwT0FnVW53aDVK?=
 =?utf-8?B?RkNabERIYmhGM2pEVm55WVpjRGhqcG1WN2FBbCtrQWFPWkVlTjZXMjlWRFRn?=
 =?utf-8?B?UnlRZnFZOVgxT2JRWThSSW9BdjA2akt6RU5MNGJYcHJ4SlNGMHQrc0JPZk5i?=
 =?utf-8?B?TXQyeWlrc2Vxc0dzZ0E3K0hrZnBQcm1VSjRyc3VrQmNxbWdkbnJCVWlIcjEy?=
 =?utf-8?B?WDZNMU9Hd281TVIwdElmNzZZT2drOG8zbjdqYnowMEpTSkczbkIyR3RNOWlW?=
 =?utf-8?B?eTZBc3NiYkFyc1lJZG45TmppcndKZFNxTVBEa0Q3VFQyd1NhTTJlRFFZZkhz?=
 =?utf-8?Q?j3IiS6VZKGAt1ZU+zClxyVa7J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfde3ccf-3ff0-4ddc-fd8d-08dde0dbcad2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 17:54:36.4382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1Z5vkvp9IjJ8LRNUzJKIjR2IDU2laOavzyGM81XGaCJvzXwy6O1iZNUSKNJhpgCjgJq6INYz1jLXDo9gMGHjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5618
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



On 8/21/25 06:23, Xaver Hugl wrote:
>> We user space folks have been convinced at this point that the sRGB EOTF
>> is actually gamma 2.2, and not the piece-wise function. Now, if the
>> hardware is actually the piece-wise, then that's what should be exposed,
>> but I'm a bit unsure if we should do that under the name sRGB EOTF.
> Maybe simply rename the enum string to "sRGB piece-wise EOTF"? In
> hindsight, the naming of "srgb" in the Wayland protocol caused a lot
> of confusion, it's better to be explicit about it where possible.

I will leave this to Harry to comment. He is taking a few days off so I 
will check with him later.

