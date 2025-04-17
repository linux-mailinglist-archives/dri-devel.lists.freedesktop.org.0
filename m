Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F8A91A7D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:19:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDFB10E0FE;
	Thu, 17 Apr 2025 11:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="auFo6PQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032D810E0FE;
 Thu, 17 Apr 2025 11:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2IqwYhj1pwSObm4pqy855jXoEJJOeHoGs3iqfb6OXbDaBiNE2Oclk9GJFDtn0qVqmxnnHk4pXaceQ8UyXGUgIfF8UN23FTohdWqKlHUuS+sHSCnH1CkRs1hN08DwOIfi7UdzkgEZc7i3BGOOuGyuHxZj4ZGknv2FivkDvzO5ybBkR65MS/uI5kJAn0SjcwcrX/2fMJGCK2d66WgV4qD1i6ZvpKilt+XnTrXBlWvOdsN7aSgeIlaHEa4sQy2W4HSN0ze7pA1P16IWzNL5HLosv04VZd9mAUXRh9la+scTFSYd2Y3b3LgX74Ce+QLUFmGeW00TmZvGhnRJHcj7hqmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGDerxxUkXd3U3RtuM00IhRdV64Qi69tsIdEfI/5xaQ=;
 b=KedF0N5f4B4ojOSN2lvCoqjPRfNpzAxgyp2/JciBEIEkjS1kTlFiTtGsCfKUqu1XWO/kVCXIZMaWlfXWpHWSkVfeD8bgP86Uki/zzQcJJIy7YpogpbNGsvuOx3Fz2fumkFdbGgtxhWiSB942QjCXniFgMYJd1yWgmk3nQAxOHMxyTvoXKIJNdzBpOJvkD7xcqgApwmKHHmEZ9UCdbC4V8Yvr2XwaKWB9yH1Dt+Xb+XGXx9Suh3qFoUli6mAqwzlUOkE6h6qieQZJXhMmzp50unGWsQ6rWE+hBB48FdToLDGi3bUYaD/FOAI+dvns8NEu8gA5jyW7C+5QJ09Bka9nuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGDerxxUkXd3U3RtuM00IhRdV64Qi69tsIdEfI/5xaQ=;
 b=auFo6PQpsWxp946piLn2d6aZgN1Qn+xiE6m6OSztNlcjkVwlcSBsmI7y2vd5h2mrlh/sA2xUR2SiLoLMdxPBjW1FYjuALxdlMj0/M2q9unmLEMTYQRa5YRsGXCTN3RcHgNiY97Qzo1v0ddpu+s0Y0N3/uoI4evAYT4J+9quBJOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4176.namprd12.prod.outlook.com (2603:10b6:208:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Thu, 17 Apr
 2025 11:18:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.8655.025; Thu, 17 Apr 2025
 11:18:54 +0000
Message-ID: <2ec09b8a-25f3-484c-b81c-f6478d9743cd@amd.com>
Date: Thu, 17 Apr 2025 13:18:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250417091355.2240384-1-sunil.khatri@amd.com>
 <874iynp1uw.fsf@intel.com> <05d7ba43-28ff-4c76-9b63-782b8df0f9f6@amd.com>
 <871ptroxkl.fsf@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <871ptroxkl.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4176:EE_
X-MS-Office365-Filtering-Correlation-Id: df002c43-32eb-41a8-91a7-08dd7da1a369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RENCc3pPd1lDYmk2c1RJQW9QWVJqUGFaMUhvZEpKbXRQYU1kbEE0UldKZzRQ?=
 =?utf-8?B?T2VzS1R3UzRVMk9ZcjlJdkNxeS9rTFo4V1RZSWlaVGRkQ0I2d3lST0ZhaXZS?=
 =?utf-8?B?amQ4TjdHZ2ZTUGY5aDh3S1BqNWFhUGFUNEdsaFNndzBWNTVwd2wwbzVua1ZH?=
 =?utf-8?B?eGFkTysxbjlPVEt4aUNSVUtkS0tsb21Pc0l3NXVNUjJGdkJQUlhxS1lYRGE5?=
 =?utf-8?B?aG5lbUdjUEZLeHd4QlloNnNSd0lEZHpRc2J3Q0N1eVV2K2luUTlCaFhhbEl5?=
 =?utf-8?B?RDNtMFI0bHFSc1RORWdWRUlQNlNkYU5XbTZOVTNydDdJVHhZNTlYT0E1Z2Zs?=
 =?utf-8?B?ZlFIMWFOaGx1SElJeVN0cExGcWpya0l2bDVpUUtZcmZINHM4ZVgrWGlPb25m?=
 =?utf-8?B?MWJkejIxNnpUZ2NMNGNoU04wTlo0Wm03R1JldVJuSTVVclM4QzQ4VmpXcGw3?=
 =?utf-8?B?cFdnbmw2cjNQTDJ4VFNPaDVSNUdTS2RyUGZ5MWh6VmUzcCs4bXZKUW5UK2c0?=
 =?utf-8?B?ZHI2UXVGQWpQNVpBVGtPczF3bUlURk5ZSTZuNTN4dDJMZkIzNFVuSE9mOWNy?=
 =?utf-8?B?azYyVnQ4blVheWxzdWp3UHV0TncrV2l1WnNkS2JPanlnRlkreVJaeFg0Mzhk?=
 =?utf-8?B?RHNXUk1ISTV4aDVLdjd0NU5BZ3ZJZEtQelZyZ0c4cU12ZUJVcFlSem1zTDdv?=
 =?utf-8?B?QjlCOWNJM29zKzNnY0h6UGE1dUdCQnVkM0lJdkJpVmkzU3hPVmJiZVRrVUtv?=
 =?utf-8?B?UEt2eVMvUGg1V01xLzVYNGJ3VmxIc1MrWWxOV081OEJaVm5ZeHJjRnVFVGFQ?=
 =?utf-8?B?MjZpVG5rMGpQYnozbklLSm5KQmpwaUVNT3JNZ0l3WUlLVFcvaEFjeDg3ejl4?=
 =?utf-8?B?RS9yOVlqWWZZM2ZOZUNUa1BmdU5PTFJrQXZYQ2dxM215OEsvd1ptUi8xUndv?=
 =?utf-8?B?bkVUamtrWkE3QllRbkZXZlRnd3IzNXFLS1lsT0tDSDNWbDZPOGNCZXZQbERY?=
 =?utf-8?B?cFhxemxmU0hVTDdwNTRHcUd5MkxaakI1RlhJOStHaXpRYlExUldNVjIvSktt?=
 =?utf-8?B?RkhHQWFHTGxxVUhDakdJa0ZBZE5PRi9LRjJEdk5GbytaUUFmSWpoeEMvNTFS?=
 =?utf-8?B?eVk2TFhKdFVUMm12STRsU0ZGMVZWNUJYU0FIUVVJdFVXSjU2WGhJdUw0c0l3?=
 =?utf-8?B?eUdHRGpsR2VhbUxRa0FpZ3FuZkpKalFIaHZBOGMzdzVOb3dsRmdtWWwyeTJk?=
 =?utf-8?B?ZSttMlVZUzNjc3RBSEs3ZkpobnkwdDVPNjZCdndaR0Y5S3VZUC93OWxCQlZQ?=
 =?utf-8?B?MkRjdDRETFVycCt6UmZBOFUveFY1MXpJbHRtd3dUR29qMmNWZExmOGh2eE5V?=
 =?utf-8?B?bXRqMCt6a2NKMmxOR3VZS0ZHVlF2WG9BNGtoWWhLOHFRYWlpMDczVzBBeWRC?=
 =?utf-8?B?bmNDdnQ3ZWNlNlkrVnVKdDRPL2FjbGEwMnp1M0QvTGpkeXdxTXI4ejJOdTJT?=
 =?utf-8?B?VDFkbXoxb0E4dC9sd3Q3dE1DZlFJUlVxTm1VNzRWVzNKU0c0UjVGbmlVUTV3?=
 =?utf-8?B?YXZ4MEF5ZTVsSFdoVkd0ZXFKOGJIVGtxVnNTS2p1S2lwekJvL1hMb0JScVpt?=
 =?utf-8?B?ZnRZYnhTOUkwdmdpYTVueE1jTXB2MHB4enE5ZzQxMWg2aERpc2lYUXFxRG1u?=
 =?utf-8?B?N3g5NnRvejlpbmh4NlA1MDNyVUVZWTd2MEJod0J4OElYYnJMZHBSNDBWMHZ0?=
 =?utf-8?B?ODdVT25qOHNzWVZjdUtxbERZSFMyL0szcWVwdWtJTTVEZDJGa2RRd0c3ZEVF?=
 =?utf-8?B?UnBURVB6S0Y5N1I1R3YxNk1DTUF1cU9jdXBETXIyU0V2c2x2N2hyeEh5bVVh?=
 =?utf-8?B?d0QwaXJrQnc1M243K3IweE5wcDJHbDhnVktHaEJBQ2VQSnM1Rlpib1VheGxm?=
 =?utf-8?Q?CuGbsnFlU0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azlyR3c0VjhVUlYrb012TVc4aXB3SlhqWmhvR2dTVE1TYnErcUs0UWxETnp5?=
 =?utf-8?B?UVJ6aEtvMEdsL2xBUkN5NkJWWmVreHRVT1Nlem52SHl0YWFDT2dacytOM0ZS?=
 =?utf-8?B?b1ZLS3F5Q1AwOE12Wmxad2xFMGFTTGd6VEYyNmdKbVdxcHZNeFZIRE9LNzV2?=
 =?utf-8?B?NWZ0OVBNTnF5d0hJRlZWVDNOMUFacUdkb2lkL1MyOUhaSE9Nc1ovYUNqMmor?=
 =?utf-8?B?dUtPQ0RQOVpta01OUFNIS0tKU2hReCtKWUNMcTd1NUtTY3MyVlY3NWczNHUw?=
 =?utf-8?B?NHhxVlp0V1UvMEpCWUZqYVZqMHZIVjJBZTBTeE1HKzZUWWdOR3ZmQ0VWMkM1?=
 =?utf-8?B?UzdzSDZ5YVVnWFlmdTB2YXVuYUgxR1NBUndpb2R6M2w4Zm9lMnYvV3V4TUVj?=
 =?utf-8?B?ZldUSzh2NkVlZEtQcTBNQW5WMlhTYVBSdkZQU05rT3Q0SGhzVmJJL1pRRllX?=
 =?utf-8?B?SHVrQURGSTVVbS9RYXE1SzF2d1lubmdSWVR6aUNkZDJHUlV4ZG4rZjBoc1Qy?=
 =?utf-8?B?em9NNWx4MnRTTXRtdUgwS1J3NzlwZXNFNG1EY3RVS2N0Y21aQWI3SE5BWnBV?=
 =?utf-8?B?ZVMxdEhnTlZwUTl6NEU5VTd3SjRZU1JEZjFXdjMzMzBHN0xQQXdVaFpKbm4x?=
 =?utf-8?B?a25VcisyeHZITWQzbXd5UVBHUGtIcHFUNTBKV0ZvcmpaY0xqa3ArbkRLL2dJ?=
 =?utf-8?B?K29ZSG1zMWltd3J3VzU5dElaZlNBRlp3Slc2Q084M3VsMTdmeXhkSmhvakMx?=
 =?utf-8?B?TXdpcmw0emJtQmhBNVRUajdsQisvTXMyb3o0NkdmanMzWHJrUjJXZ1pnUzlm?=
 =?utf-8?B?ZWo0UmU4ckxidjlHNkh4S0FrakVvOWtNZkRkZ1dibFFyN1lzQ2NUWm1LT1VG?=
 =?utf-8?B?ZEtCSmlPVWRkY21TVzlsM2NuR2JmUlpscTU4Uk5zd0dzb09lWlQ0VUpJRXdz?=
 =?utf-8?B?RlJXMEJlZkxPMFJ2V2ZJYjg2S0NFU0ZwVmJ4OElzUit6OHZGZjFjRjRkc0hh?=
 =?utf-8?B?VU0xOFBON1RPc21DK29jb0l3RU9pSkJaZEJWVHdjUjM2N2k3UExKZElBS1RX?=
 =?utf-8?B?RFhDWUxnN1dPelFLOTV0bDBXTzA5cGdRNjBTdTVtd0xiTytWRG44MEVYdU96?=
 =?utf-8?B?aEFINGlOZlNHY3FSR0RhbjlnTlBrNnFKWUIyd0NpYWh4QWgxL1FEWDlKdUFq?=
 =?utf-8?B?UlZMYUZJOXRpQkNUOWpXV3lTRUJna1BNT3dFKzhMRExHclhUNHpCOHljck1v?=
 =?utf-8?B?bzViYU9TZ1pBcGtUZ2I0WW1TcUJaejYxSTB4NWFXTTUwNC80cVVuSXJ1cCtR?=
 =?utf-8?B?NkFRTy9xNTV0WlVIVE5KOXRYdW5HZ0dVVSszYWMzd3JuTUhsMGJXSkJHRUdr?=
 =?utf-8?B?Sk5YWW1DUVVnS0JtLzJPQVpZc0xKMC9Db3FPRGh3MGhIU2F5L0ZXR2d4MG4w?=
 =?utf-8?B?dmRMUzBVVW14MW93UTFheS9USlArTkJ6K1R0QUpnNGNncUVwejBnZGJmM29y?=
 =?utf-8?B?Rzlhc0dzOGNuV01zSG9PNEFRUG1LeVEydzlUdVBZeW4zcFBKVU1PRUlMaWJG?=
 =?utf-8?B?eVBRNEZhWHFIdHNNRFE1ZDVRZFRQVEUreDJUeTRyRisvc2orajJkdG1aY2hU?=
 =?utf-8?B?U1RVSUg2dDhNUk1La3JwdzkwVy8wbzRJd1hraDlHQjNQMkxnWnV5NkMvMVEv?=
 =?utf-8?B?ZUJqSWRFVXpSazllQTlvYU1IQVlheXYrRUU4WDlZbUpYRDhqNWJtTkFmS0Fx?=
 =?utf-8?B?aGVORHNmWEFkeHFSUkp0b1llNDc3aFVnRHo4SVl3TmNON0R1d1MraitKbi9k?=
 =?utf-8?B?TEQyUjRFOUhzM2grU1ZLQVEzNXoydXZQb2ZPR0MybDMyTTV3NzRNZU5Kb2FT?=
 =?utf-8?B?RW45SUtDLzd0OXlxcG50cW1JRHNhY1lPc3ByVFFmaEkyVUlUd2dvSStaTEQ0?=
 =?utf-8?B?VTZ4cXlNVnZ3TVp0cHB5Y0VQZzJsQ3R0RWp5SUl1UzJRck5idklMQktYaDg0?=
 =?utf-8?B?ZjBGV1hkbE4yRnovS0xrTldKVzFBOVJjTDFVSFg4REw1L0cybFBrWXgwUnBr?=
 =?utf-8?B?aWR4aVM3UEVMTGZxRC84Rkw4K1RQbVFZT1dEZjhSb2JvbXlWbENwM21pRnpH?=
 =?utf-8?Q?XK0g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df002c43-32eb-41a8-91a7-08dd7da1a369
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:18:54.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duqcDV146JZ7NQc0J1wNemmMxrANrZwgfdpilHTlf4QOBUHYA+yGA75NQ/MQ5cQZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4176
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

Am 17.04.25 um 13:07 schrieb Jani Nikula:
> On Thu, 17 Apr 2025, Christian König <christian.koenig@amd.com> wrote:
>> Am 17.04.25 um 11:35 schrieb Jani Nikula:
>>> On Thu, 17 Apr 2025, Sunil Khatri <sunil.khatri@amd.com> wrote:
>>>> Add a drm helper macro which append the process information for
>>>> the drm_file over drm_err.
>>>>
>>>> v5: change to macro from function (Christian Koenig)
>>>>     add helper functions for lock/unlock (Christian Koenig)
>>>>
>>>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>>>     remove drm_print.h
>>> I guess I gave all kinds of comments, but in the end my conclusion was:
>>> why does *any* of this have to be static inline or macros? Make
>>> drm_file_err() a regular function and hide the implementation inside
>>> drm_file.c. That's the cleanest approach IMO.
>> That won't work. The macro is necessary to concatenate the format strings.
> I think you can handle them using struct va_format and %pV.

Oh, really good point! I wasn't aware that this functionality exists.

Going to discuss that with Sunil internally.

Thanks,
Christian.

>
> BR,
> Jani.
>
>
>> But the drm_task_lock() and drm_task_unlock() functions shouldn't be in the header. Those can be perfectly in drm_file.c or drm_print.c
>>
>> And we should put drm_file_err into drm_print.h instead of drm_file.h as far as I can see.
>>
>> Regards,
>> Christian.
>>
>>> BR,
>>> Jani.
>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>  include/drm/drm_file.h | 37 +++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 37 insertions(+)
>>>>
>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>> index 94d365b22505..856b38e996c7 100644
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -446,6 +446,43 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>>>>  	return file_priv->minor->type == DRM_MINOR_ACCEL;
>>>>  }
>>>>  
>>>> +static inline struct task_struct *drm_task_lock(struct drm_file *file_priv)
>>>> +{
>>>> +	struct task_struct *task;
>>>> +	struct pid *pid;
>>>> +
>>>> +	mutex_lock(&file_priv->client_name_lock);
>>>> +	rcu_read_lock();
>>>> +	pid = rcu_dereference(file_priv->pid);
>>>> +	task = pid_task(pid, PIDTYPE_TGID);
>>>> +	return task;
>>>> +}
>>>> +
>>>> +static inline void drm_task_unlock(struct drm_file *file_priv)
>>>> +{
>>>> +	rcu_read_unlock();
>>>> +	mutex_unlock(&file_priv->client_name_lock);
>>>> +}
>>>> +/**
>>>> + * drm_file_err - Fill info string with process name and pid
>>>> + * @file_priv: context of interest for process name and pid
>>>> + * @fmt: prinf() like format string
>>>> + *
>>>> + * This update the user provided buffer with process
>>>> + * name and pid information for @file_priv
>>>> + */
>>>> +#define drm_file_err(file_priv, fmt, ...)						\
>>>> +	do {										\
>>>> +		struct task_struct *task;						\
>>>> +		struct drm_device *dev = file_priv->minor->dev;				\
>>>> +											\
>>>> +		task = drm_task_lock(file_priv);					\
>>>> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
>>>> +			task ? task->comm : "", task ? task->pid : 0,			\
>>>> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
>>>> +		drm_task_unlock(file_priv);						\
>>>> +	} while (0)
>>>> +
>>>>  void drm_file_update_pid(struct drm_file *);
>>>>  
>>>>  struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);

