Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDegLy7qiWmdDwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:07:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B6110129
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 15:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD2A10E3FC;
	Mon,  9 Feb 2026 14:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r3+5QSL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F353110E3F8;
 Mon,  9 Feb 2026 14:07:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ShF9QWOVT3q1Z8wg6ZfE9+pt9Z1iljgBBJCOyIrm9MXDDlPa2suBaeA4tED4ldOH/JN36BIwRUlO1g/cemzNsvhCeNXLKg+MrcBH8iINlHQj2pz+HssJGMNqLK2STylxY4R73xnqCe9i27Ytz1NJrq6oygbFQLhneJlIxnjsilylVtpRQKe/egzi8b48rim6PqmLIQG7EQnSkKBI39Zq6dFrUE4XN0hvNNSZT9+17rS59NhaNJY8AOH/tUqJQqJDKFpfITgrnnpUHRYT7J2zgDPyre5zisqME7sFCMRLwE1Qrgs+zY220yCXyarhi73oUQ5rUKLP/yO31WOX5E8Q/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQ0Y2ooEaudJ5kYogO2wQNt4aaYAQEcuH/LU2je12bY=;
 b=Wcku1M7ylWkrXrJCbWsNiMoEEMl061d+p7AKgLLNVdBomVW0ui9H08oiaZWRuwM6Gd7xwr37JXCCPpQ0qhDnQWKa9F/CaHwTlXcAl7tWhlP2zC2jvu9jlI6eRbGNqYx79Ia5hsJlMuTLZF7U+sXgZCzA6udt3VRoO+TbqwJqDF6s6hyZUfnrx8heokAikCi/0J3hqa5pUn6CgXNqRgjOy2+M+AFg4I7lWOiY4XH1kWW7aO5ZePgt/Ahnel85dJ+dh6jihZ8BcW7xyMFSu4XXMwUd5Kg+suo6b38pabgI54s6mWOvAFH5cZTJkwCWkG1iAIN7aExE7aPpJ11GyJD6hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQ0Y2ooEaudJ5kYogO2wQNt4aaYAQEcuH/LU2je12bY=;
 b=r3+5QSL6fEi0sZn6KoQubmLelT6g55c8Yr2se8J701GhDycpBMPVXlIPQV7ntfONJkKHw1VeA2U1Qe/KoDgF3SMyPbPR8vLGoHqXqspRi7SKTBZlL66I3VjpGwk2Hac4S7WwSJn7rDcnXhQOT0NDOVm2DT4r7GLpwzECzML7/o0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9455.namprd12.prod.outlook.com (2603:10b6:610:1c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 14:07:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 14:07:35 +0000
Message-ID: <e93e823f-8a26-42b2-9a10-50f1afd8dbe9@amd.com>
Date: Mon, 9 Feb 2026 15:07:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Fix sparse warnings due __rcu annotations
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kernel test robot <lkp@intel.com>
References: <20250616155952.24259-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250616155952.24259-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0293.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: a3138567-db65-4543-f113-08de67e492ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?emJPdFBWZ3VKTHFFUngzWWRxdWhjQ2oyanR2czFCSm5jcUVFaWtZY1NhU1Ft?=
 =?utf-8?B?bjYwM2x6OVBDZWRmbFltV014NXR1aFlkZG1yY0xabW1LczAyZFRBK2Nzd04x?=
 =?utf-8?B?d1o2eGlaOGd2cGVNdFU4SVlRbWliTnUxWjUya1pFdFE2TDFnNVNrM05sZ0Zp?=
 =?utf-8?B?blA1WTNHOEgrNWpGMWRoOTM4RUtaNDVuMFpsditEZmJlRzArYU5zSHZ2T3pB?=
 =?utf-8?B?M3hxeWM2K0tUZkdRNGtGT2hXdXc3N3VnVXVwaGJZVkF4T0lVa3ZDWlBmTVI0?=
 =?utf-8?B?UDcwWmtGaGZBM1lyTnFJbE5YdlpnVkRGUHBTVXVlSGs2dFZ6Z1psUkVPeE95?=
 =?utf-8?B?bHByZDh5NnJEVkVDZFZMV0E1YTgxbEZJS1lzTlBmamdhZHJ6QVJkcy9mNFRa?=
 =?utf-8?B?Tmh6THpnQTQrK1Voekt2Smd1WFJ2RzVER21qT1hINUJuc20rN1V1SGZmazVo?=
 =?utf-8?B?bVpXSVZaL0dJOFl1dUJCR2ljY09iVm5wK2FkNnFyeFgydnRpRXFQTjhiV2FO?=
 =?utf-8?B?NkF2Q3B4MHlTeXdnVXVibWM0b0ZNdyt6M0FWYjl1ZDJYV2tQWDZXSy9Md25t?=
 =?utf-8?B?Smg4dng2NmFpZEI0R01LbWZLUEk1cFgvYUFNbEVTL3cyZ1VCbFVpK3FLQlo4?=
 =?utf-8?B?b25HdkNKYWg0cE8vYzdVVnlrd0ZwZ3Q4Q21sSW1VbkZIcFBQb2c1TWJyR0oz?=
 =?utf-8?B?S2pEaXJTSVZhK25IeEVFYTZXejF0bmVWeGVOZ2dkcll0c25TdjNpS0dBN1d1?=
 =?utf-8?B?V1VEbWRiUGVFS0FsYWllR2VWS2Qyd002SUR5ODMrd1NPZDNtN2l5VXdMalZJ?=
 =?utf-8?B?RytsTUh3c29seWhJbjRWSjFORlNYUmZJd2xuZ3UrVVpaVlVYTGlqSnJ3cTNX?=
 =?utf-8?B?M0JrNW5DQjJnb25tMUNNaS8vOXVBd05FR3grakJVb1piUWthWWxLU2RISndq?=
 =?utf-8?B?TUxxYXVWSUVFREl4YmVRd0IwdTdHYkNrMFFzV28vNWd1Y1VvQ2N4SVlpYm1x?=
 =?utf-8?B?WGh3SXFQdXRaNjFNSktLUkNrZmZ1ZVdBWmZNcXNlNTlpUDF5NCtkK25laVVE?=
 =?utf-8?B?cEtKL1YybW1wQjU0aXM1cGEvcUErQmh1UGpLMUMydTJ2TXdJWjdrUm5LTXRa?=
 =?utf-8?B?Z2QwZG91NGhOZktSQ0cyMzNWeTJKaExVMHlCM2x3LzB0STZLQldteHYvb09s?=
 =?utf-8?B?bjFJUzNmNTVYS2F5MVQzMmt4MTkzMlpORWFGVWdJL1AyaUJFRWRpUVNuZlZR?=
 =?utf-8?B?RktRR1dlOFdGM3pvQldkNmlvRURIS09mUmFxczVkRWpEQS9hN21ld0hmUFg2?=
 =?utf-8?B?L00vM2h6SGM1TkFiZjlEdVlLT0Y2MitIdmt1NWd1Y2NiZmJxUEozdjVqenZ2?=
 =?utf-8?B?NVdXVXZjWml3ZFFHMEtRbjdsRkhHU3UvRkg4d1l2TElJclFaNXhRbGkyTUxF?=
 =?utf-8?B?dDRFMkh1VTl4UlZ1QTBqdjdKSzFUNVNhZk1MNXZ6U2NHZmxHU3g0MEVUR205?=
 =?utf-8?B?ZjdYR0FEcjZ0K2RmV0NTM29TaXBPVkcyWmRqZC9DMHpDTHQ1RmdnNEQwZnN6?=
 =?utf-8?B?RHFreWgyMzI5WUpxNmFQOHljdXhuN3RJUDFxMnJjL1FVS0tYZDJJcS8zZzlO?=
 =?utf-8?B?amh5MC90Wi80SDhPa2xiZzBZS2xXcUZob0YrN0t3VUxHV3EzcWJJRTg0cTRp?=
 =?utf-8?B?aUNQNnFFRTdGUGVPL1VrTDBiZjNvbDB3S3FVNldFU3BRMTJGcGdTL1dnZUo3?=
 =?utf-8?B?WCtBcjVZdmxsekNnNWozdWFYcnN1MGtuZ050aEU0Wmw2TDFOUWtGTHFRanhC?=
 =?utf-8?B?RW5vZm5zZWc0dlREYTBZY0NmbkZMWW12QjBzMWV0bnJOZzFhajNZcmZDeDZE?=
 =?utf-8?B?ZFVhdUk1YmYxSThsTnppa05mbk5iLzdsZGI4NTl1YnV3ZWhBbFF3TjExOExC?=
 =?utf-8?B?N1cxRjFrMk9sUy9kK09OdWovcVdidis4VHd6MHpyWE1MVzJ2eDY1UFAyejVz?=
 =?utf-8?B?dTl2R1BtOXlCTUhaZXBxMjFGSzY5K2xDMlJhTkVjL3ZHUlJ2eXh4ZmpqTytT?=
 =?utf-8?B?UlkxcHNsaXBvbkUzdEs5S1hpRVErRllsWFI5R1UxR0VseXY5YnZHQmZXZ2Rk?=
 =?utf-8?Q?IzYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3h2Z0ZQNmNMK2xiQlJoNGp5S20vUmluK0Y1b1ZFV0VVRGZ5c3J3ajkxNVlV?=
 =?utf-8?B?dWl1elJ0Y3NzejBDelpRQnQ4MXJzV01qOE5yeU93bk5XdjdFeEJZNVhZaGhI?=
 =?utf-8?B?V2NHQk9qYnU0bGYwMHlrT0dPMkpmRDlsVHB2Z1ZYa2VObTZPSlpXVFpTRjRw?=
 =?utf-8?B?SUdOM3NHNkNpVlhWYnQ5ZEs4RWhVclVDMEM0RTdMUjVKM2Rhd1M5OXRUVS9Q?=
 =?utf-8?B?Rk9QNWtLeEtkMlZjdHNleGp5SS91QjBiVkU5MzBHckd0ZDR6bDY0TXY0bEk2?=
 =?utf-8?B?Um5oSFo2Q3oxOXNmaDNjeTVJOFl3VEJ6UWJ6TWFxcTk2YXhMVXZqWk5HbXZW?=
 =?utf-8?B?SkNCOWV3WHIwSVVvbk1IOGpUc2NVMlF2encyTWx5QVVtc3crS0RZY1lMdnVZ?=
 =?utf-8?B?ODNwSWkzL2ZTVnNKWkNCUy80Yll3cWdoYS9CY2JxTjl6K25iZTJrOXhSZVBM?=
 =?utf-8?B?ZU5mN3d0c1JxczhqWGI3aHMxcGVLTlY5aFpGeDNvTTJRUk9jclhsZllLSElo?=
 =?utf-8?B?UE1wMkJheW9CbklZdnZ5WnRuK3p5NjlZSlNWZDZCVE55bFQ1TXNiUS9nQmJX?=
 =?utf-8?B?TFNNVjI1MXd1Kzk0SXdPN3UxUTIwMWtPR1V1ZCtmejRqM3oxT2tpNjBPNFAy?=
 =?utf-8?B?M2RsWURQL09rd0cwMG9sTStoUUtyMjl4ek1LVm96L3IvOUxXbXV6N0d1MTRh?=
 =?utf-8?B?K3ZsNDNPSytaRG1EZFdmdjh1c1A5dFVsSy9mWmw3eWhHRVpUa0F4SWNJQ2Iz?=
 =?utf-8?B?SlNmazlERG1rdVEwUXF3dnlwUklPejNja3pLNEM3NEl2Y2hqbm9Nemp3eS9M?=
 =?utf-8?B?U0lNUHZZRzlzckF3enlUMlI3eFVUdVp2UmtiUG80RG4vSDB4ZGJsKy9aWUxv?=
 =?utf-8?B?YjQyNHJLUWx2ZGtKVkI5TEFtRm9QUzZMckQvTXllM0ZtOVBvTXdOWEdUZ1pz?=
 =?utf-8?B?cmZxeC96OTFVSG15M1lpaHI2ODdpS05XN0cvVmhaNzVzckhMSHJZRlpBeUFy?=
 =?utf-8?B?WXcraGsvdkFaNXF2QzhwOHJvTXhSVDRyNzNwNzJwU3U5a1NOSVhMZk1pM0pp?=
 =?utf-8?B?WkU0WHZLNDZNR2FHb1h5djE3REg3Mys4bUw1SS9vOURIWVp6dUtyQlYwQ3N5?=
 =?utf-8?B?M3VpQ0Y0NGVhVktRRVJwcTh5NzR4TFFtd2F5UzVTTkprMEs1YzExdTU2c0g4?=
 =?utf-8?B?WmhnZ0tLVVpuUEJTU2xyNWs0dWkrMmxIdkViek9EeUlNRGZobCtjN1lDajRK?=
 =?utf-8?B?NlhPN3JyQkJYMXpSL1ZsR2Z1c0lyaW1WUHhMTGpNWFRBOE5Ib3hLSXhUY2RT?=
 =?utf-8?B?Ny9vVjh2d09ybmw4eUd0cWcvdHZYeHR0dFQrZjVXZ0VJYTZudDVmMHRjOXp2?=
 =?utf-8?B?NjQweG9ONTQvNGxJc3ZtSXlrQ0xLV2dwYkVTVWVLWU4yQ1g5dmVOWExTbFlv?=
 =?utf-8?B?Rm5Ec0o0aXJtMGVOcDdQR1o0aTlocFNodmhvZTgwQkxVVGZrRERSWndNdXYx?=
 =?utf-8?B?UVRhclQ0dGZINEhYZFpnSk9kbkRPUFFQSWVxZENuT0Z0cFdHZFJPQXFIYnVI?=
 =?utf-8?B?Um5sWlpOMUpYV09LWVVFSDdUdytMTlVwbmk1R0FOczhNOWFvV3VZVmljdnQ4?=
 =?utf-8?B?d1JQTlFMREhvbDZTYkxNOXFzYmdZYlhrZTVqcWcreVlNa2Z1blowNkVIcHM0?=
 =?utf-8?B?MWxZZXU2ak1MMzdBVlgxaWZmZDF2TUNBMFpQVURlc2JUaTl1UTJDOGhOeGJS?=
 =?utf-8?B?ZmJrK2ROV2grbnZkcE1DUHorSXdyYUdJTUhLYUpLMkNHb3Jha2V2ZFMvNXpW?=
 =?utf-8?B?RkJHaE9qZ216azRrT1NjL2QzU0ZpbzE5QThDNkFraXFsWldxbDd4RFluMFU4?=
 =?utf-8?B?WW1OemlaWGloeTlQRXQ0TVJzdzhyc09lZnQvSFhROHR1TWdNMnVBcUlUd2V6?=
 =?utf-8?B?a0VNMlYrKzhlYWpXNCtacUg3Y3JqdjJoUDZOVVZ2bDkwZFNnWGdXS0NtSHlV?=
 =?utf-8?B?VHdVYStvUmt4aXB3Q2psckNiMXhIYWx3VWEycXcxenJIVWdnUnp2U0xFSTFD?=
 =?utf-8?B?T1lUQzVpZnhEUHpCTThuMVJiV1M5cFlMN2RlU24vbU9GTTBpOWpSSVhPMVFI?=
 =?utf-8?B?amd0cVAxbmk3eEdpcDhtNS9Ra0g1YmxVNSsvbXNnT0pYSmg5WEVDYzA1ZUFC?=
 =?utf-8?B?UkFZUytHbVVBS0U0TmFDUzBpMFUrdk1CUnVaTzdEUWo0Y2o1L0lsWVhrYm51?=
 =?utf-8?B?aFMxT3hVRS9RNktoekp1d0thS1FjdmJLd1NWZG9DZmhLU2oyL1B0c0dwanBS?=
 =?utf-8?Q?JLHkapIeM95G6pdEH0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3138567-db65-4543-f113-08de67e492ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 14:07:35.1940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0R0dk47G5cLodvBiToWchzC5E2BxOZfIjjBRaXLuMdSoVHKFiP6B2jnNPGXyxra
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9455
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,gmail.com,linaro.org,padovan.org,intel.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 225B6110129
X-Rspamd-Action: no action

On 6/16/25 17:59, Tvrtko Ursulin wrote:
> __rcu annotations on the return types from dma_fence_driver_name() and
> dma_fence_timeline_name() cause sparse to complain because both the
> constant signaled strings, and the strings return by the dma_fence_ops are
> not __rcu annotated.
> 
> For a simple fix it is easiest to cast them with __rcu added and undo the
> smarts from the tracpoints side of things. There is no functional change
> since the rest is left in place. Later we can consider changing the
> dma_fence_ops return types too, and handle all the individual drivers
> which define them.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506162214.1eA69hLe-lkp@intel.com/
> Cc: Christian König <christian.koenig@amd.com>

Sorry for the delayed reply, completed missed this one.

Patch is reviewed and pushed to drm-misc-next. It eventually will be backported to stable kernels because of the fixes tag, but since this is not a functional bug I didn't added a CC:stable tag.

Thanks,
Christian.

> ---
>  drivers/dma-buf/dma-fence.c      |  8 ++++----
>  include/trace/events/dma_fence.h | 35 +++++---------------------------
>  2 files changed, 9 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 3f78c56b58dc..da60d4e68b89 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -1109,9 +1109,9 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  			 "RCU protection is required for safe access to returned string");
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)fence->ops->get_driver_name(fence);
>  	else
> -		return "detached-driver";
> +		return (const char __rcu *)"detached-driver";
>  }
>  EXPORT_SYMBOL(dma_fence_driver_name);
>  
> @@ -1141,8 +1141,8 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  			 "RCU protection is required for safe access to returned string");
>  
>  	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> -		return fence->ops->get_driver_name(fence);
> +		return (const char __rcu *)fence->ops->get_driver_name(fence);
>  	else
> -		return "signaled-timeline";
> +		return (const char __rcu *)"signaled-timeline";
>  }
>  EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/trace/events/dma_fence.h b/include/trace/events/dma_fence.h
> index 4814a65b68dc..3abba45c0601 100644
> --- a/include/trace/events/dma_fence.h
> +++ b/include/trace/events/dma_fence.h
> @@ -9,37 +9,12 @@
>  
>  struct dma_fence;
>  
> -DECLARE_EVENT_CLASS(dma_fence,
> -
> -	TP_PROTO(struct dma_fence *fence),
> -
> -	TP_ARGS(fence),
> -
> -	TP_STRUCT__entry(
> -		__string(driver, dma_fence_driver_name(fence))
> -		__string(timeline, dma_fence_timeline_name(fence))
> -		__field(unsigned int, context)
> -		__field(unsigned int, seqno)
> -	),
> -
> -	TP_fast_assign(
> -		__assign_str(driver);
> -		__assign_str(timeline);
> -		__entry->context = fence->context;
> -		__entry->seqno = fence->seqno;
> -	),
> -
> -	TP_printk("driver=%s timeline=%s context=%u seqno=%u",
> -		  __get_str(driver), __get_str(timeline), __entry->context,
> -		  __entry->seqno)
> -);
> -
>  /*
>   * Safe only for call sites which are guaranteed to not race with fence
>   * signaling,holding the fence->lock and having checked for not signaled, or the
>   * signaling path itself.
>   */
> -DECLARE_EVENT_CLASS(dma_fence_unsignaled,
> +DECLARE_EVENT_CLASS(dma_fence,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
> @@ -64,14 +39,14 @@ DECLARE_EVENT_CLASS(dma_fence_unsignaled,
>  		  __entry->seqno)
>  );
>  
> -DEFINE_EVENT(dma_fence_unsignaled, dma_fence_emit,
> +DEFINE_EVENT(dma_fence, dma_fence_emit,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence_unsignaled, dma_fence_init,
> +DEFINE_EVENT(dma_fence, dma_fence_init,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
> @@ -85,14 +60,14 @@ DEFINE_EVENT(dma_fence, dma_fence_destroy,
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence_unsignaled, dma_fence_enable_signal,
> +DEFINE_EVENT(dma_fence, dma_fence_enable_signal,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  
>  	TP_ARGS(fence)
>  );
>  
> -DEFINE_EVENT(dma_fence_unsignaled, dma_fence_signaled,
> +DEFINE_EVENT(dma_fence, dma_fence_signaled,
>  
>  	TP_PROTO(struct dma_fence *fence),
>  

