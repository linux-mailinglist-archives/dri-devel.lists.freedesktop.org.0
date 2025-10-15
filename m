Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDD7BDBDDA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB16F10E256;
	Wed, 15 Oct 2025 00:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Owj/lLEc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012029.outbound.protection.outlook.com
 [40.93.195.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4219D10E6B9;
 Wed, 15 Oct 2025 00:10:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvSfKigoNDtiBWp/hb2/zUfu3y1XYPIMSOc2wrx+YVz/etrgn7LcAh5bp4KfMtQqoXNOYbemd9fBt9Knl5Ox1lLPso0MwUVjv/gnao4NplTYnjz4QFHD8J6Y1i6Lu8RLNz1nawnvcPq8ldLwwVVIQh1rjOBIyB80tz4LoFatsAjIll08l+GMb6rh0kKNC2WQiH2lLLHuwfoLCHFK2LPmdY8CViVlila39uG4V0v06xY3h9430qVKR38WjN4Qj9H+1TNKcIEobVk3rKlk9wA6UfohHPQnq9MoyMLzyDYyoSLuHei3kowOvdS7KGItdtaOjagx5ni6tdz11/sPgG0HpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iT+0dYrjvRHaxVmgk+Hjop7HWlNdxHKqVFIO6yDt1Fk=;
 b=mFJePUkswRW3zB9Isd5jQwvIJ4iT8vlKYYgwx1z7oJWDvzsNQF27snOiXYSBaR9hYG6ixO+Ydj9oe4TF8FW6UUnAmPHi0BbpFKV3ojzL6gZ8keBaAvxz/hmZUVWUjuH6xTo/GVQ9sA1FZiyRjfR6bEySag2LS5zLibqOdkSD4EdMGAvoBsWtDDzH/8hdIsEEBPlCP6Pfg22d9Yn2T/uYHJS0+SJmcxfrwiZno34Z+tT/85F6x07NhrtDyF29ULBlQLsmPUtGhOTPh9Zl91C2GppSwK2W5x1D/Mo9zgsaLvZuUnG+vxf8KP9WYWQoNtfGBaZztqAWMqbnJGWUtfAJXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iT+0dYrjvRHaxVmgk+Hjop7HWlNdxHKqVFIO6yDt1Fk=;
 b=Owj/lLEcY8EeknZUIuHvcZL3YeNcMUch8JJKE7hsjlAc5F2jfskbdiTED8SeNRuTUUIgB0Dv0e5lEMRpgDePfAgTo82b5pQFL/heGglp+v3aH6bF3IA8Uc+WL7quvBH9alOLZ2BeL4pXS0FTNe89CuAcdJXyFmD80Y8Zg9ppOithm9uK3TLENKK6Wq0DMD1EgysbpvH/Q0aaW2it9m2YZPe/J7ccZJIQLJLbxe/Bn4dmadjGj/q79hLZ7ufKePBrFdDPhFBj8Yt1qTLvT4Bp2DUVGCV7ePHyfAx4qiBVqCqNKSWxt3f6oq2iXdnhRHBK9O5T2gICRY6BhfqXfIsiUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 00:10:25 +0000
Received: from SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a]) by SA1PR12MB6701.namprd12.prod.outlook.com
 ([fe80::2be0:c316:443d:da3a%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 00:10:24 +0000
Message-ID: <739f05b1-a72f-40df-bcb9-28f33aced5ff@nvidia.com>
Date: Tue, 14 Oct 2025 17:10:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: define NVIDIA DRM format modifiers for GB20x
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-2-jajones@nvidia.com>
 <1cbcceed-6e95-4f20-8666-1c8f40154e3b@kernel.org>
Content-Language: en-US
From: James Jones <jajones@nvidia.com>
In-Reply-To: <1cbcceed-6e95-4f20-8666-1c8f40154e3b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::35) To SA1PR12MB6701.namprd12.prod.outlook.com
 (2603:10b6:806:251::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6701:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: cda96100-45fb-4e77-8676-08de0b7f3cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFZNTG5pZmNpbjc3cHk3akl0TDZibWtRamJJZXJycHg1K2JOVFdUcnlPcTVj?=
 =?utf-8?B?VWNqWXlJc2FYLytQRW85LzJkck9kbmdRMVZoVDlkRUZ4ekNiVnZreU9HSVhV?=
 =?utf-8?B?eEZ4RmpZT25qUC8xWVhvMTlFWVdIZ3ZWa2VrYmV5bWxDV3NZejYzVXB2ZGgr?=
 =?utf-8?B?aHVlZVBTMkZGL0FMcFFUQ0tqU1lIM2thT1NRMFo3N2hDRENBbldyZGdEUFlP?=
 =?utf-8?B?eGIrWitFa0hXTzh1bmxrRitjN0VOcG91WVNUREs4K2VVLzBsakFYeG1hV1p4?=
 =?utf-8?B?TVBoMEpyUHRjMm4wUHllbkVzQm1aY1lOb0hTUnlLemExQ0JNU24yVTM3Sjd3?=
 =?utf-8?B?ZzB6RlUxK0NQVnVUMDl1eTIwZmovSWNPM21jMDVtdGFwbitJcDJPSGYwZ1lL?=
 =?utf-8?B?S2F1WU80eG0zYi9LaE1UejJyR3I5bk1Dd0dsQTFJWWh3dWhWdVVtdEp1Z3FL?=
 =?utf-8?B?U0dDYThzNXFOZjRrZGRnSVJwMFVuT2djQ1NHekN1UlZhc1g1SjY1K3BMdUQr?=
 =?utf-8?B?T0wwNnFpTXhEU29oNFpqVlduTWZFRjJ4am9yQTc5cjVWcnh6N3RRbkVURTRJ?=
 =?utf-8?B?azYyUEw0NkN6cXhCcEY5eFpYOEFZd01CQlBMMWp0OGFlZmRKeUcvQkExRjZk?=
 =?utf-8?B?WnE3NmZGUFlXNXBrRG5ZUWRwK0Z3UzNNZ2FJck0xOWZOaEVzQ1lVelRJVmh3?=
 =?utf-8?B?RkhMYmNNYzUyMFhoM0Y0QVVtYjZqSm1ncVhGMWtKTEU4Y3d0dWE4Y2ljSWJZ?=
 =?utf-8?B?WlpWZ290MTFMYUt6dzFHQmxyazdlcTUwMk1Zc2ZBNWFaMDgzT293b0tiWnNR?=
 =?utf-8?B?TVdqMHBhbzhQNVhSM0dPNW9Sb2EwRDVLUW1UNkJlaklmQzh0blFvVzNDUk9R?=
 =?utf-8?B?eEJsY0tkNHRXb0pENmw4aTdFTlNYUGtEdE4zRnZKYkloQjBSTFo3cjVPK0R6?=
 =?utf-8?B?V1c3am9QaDZ3V1o0cU5pSlU2azlKMGVmUDdnTVVYVVF1UlUvTVlpcURCZzJz?=
 =?utf-8?B?Q0V2QW52YWZZMEpoTG5xUHA5cDlob0FNVGlQTmZ5NGduTk96TzRXMnlaUDZR?=
 =?utf-8?B?MVczRUVXYXQ3YTF4V3BteWRPS2pwL3Z5VFl1b01ZOENDZS9oNzBTVEVPb1Ez?=
 =?utf-8?B?aFM0NFd6cFd4elZGbjdHaE5IaFFaMDROSENuNEsyWVZUQThrT3IyTW5BQlZQ?=
 =?utf-8?B?WTNObzliMVh3MlJhUDRpWEVvS0NsREdlenl4VEc4VHhBT29ZS3Vhb0w5eCtq?=
 =?utf-8?B?VXlBeEI2Z1FwSkxMNW5GNEI3M2x0QzBTQkJiSk5VdkZudlFqbi9Lb3B6Q3pL?=
 =?utf-8?B?cU5WbVZSSkpkbStrMWxLYmtVdjNKRWk3aVVYaTNsSWVScjczTkpMRkhSYVc3?=
 =?utf-8?B?M3krdkMvMElaWlVaTlpxOUFSbmQ0RkRZeVdGd21ONjhqR1R3dmVNM1dkMUMr?=
 =?utf-8?B?UUlsUDVGZTZNQ2JEZUEyUkpqb1dTT0QwTmN6WENhM1pYVTZsSTZKSG54NlRq?=
 =?utf-8?B?bUNGM0VEcUlDMmJFZlhtTm0wYnBnOTJDS1loaTdFWnhBY2p1Sk1ubXhRNERC?=
 =?utf-8?B?UExJaHJWOWxpOWRIVWVtMUJWdk10ZmNxc0hrQy9CRWszNGRmTU9ZKy9GS0JB?=
 =?utf-8?B?R3VkNmgwV2JEQTBTQlNEMTN1Yk9PMlZNQWtRZkNVS0dwckwvc3lXRmpwRlZB?=
 =?utf-8?B?Q2V3T1FGQy9ranhyM2crWG5JQmFkOEpobzF4NDdwSkM1T0IxaUw3aUpadEt1?=
 =?utf-8?B?OXRZdjhxZFp2cXVobmdMaU5VczZqNkRDRGNycUE3Q0s2cHFsYngybFRzTnpw?=
 =?utf-8?B?YTNxeGtxSjhPdjlVUGJhYVVkNDRHUy9EdTBYSERDT3BwaXB2c0NBcmxyVHc2?=
 =?utf-8?B?ZytIMXhRSUZFWmpIS2M1UTZxVm5WYk41VXd0VVZBZE50N2JnKzdIUlY3anda?=
 =?utf-8?Q?/JbNwp43i29eRGiTm8w+vC00mXQDDGBW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6701.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azdLb3FxM0dIQVNqVFpSMU95ZmxpaEdpRmtKMWkrWVUyZUdMZVVvYlQyU0hZ?=
 =?utf-8?B?VWF5ZS8rWWVZSi9OdC9qWGM5MUFrL2pVS0R3VHY1RFZCSDVZenpZZDgwWlJX?=
 =?utf-8?B?VXV0L09mQ2c5RUM1TDIzWk5yZ05SRzN0L2lNZTZNNmYyZkIrTFV4MG0vQU55?=
 =?utf-8?B?eVYyNDc4L3FPRDBDVWwrcUdFZUNFTEhnT1cxWk5uQi9MSXFBbml1QVgyWWFq?=
 =?utf-8?B?em8zSzIrZVV0SEtoQTlvTFRXWVNRazh3SmxoUEVocmlYdy9BbEhNZTlTcnFB?=
 =?utf-8?B?d05VN1hvc3B3YVhncEpLYk1XM0ZsUHJadlJjV3A2ME1oQy9Hb1V0eVZDbmhP?=
 =?utf-8?B?WCsraGU1T0Z6WHhEMVY3K0k2T0syZjJWUEppVVM4cGpyNnNBS09TM3h6UG01?=
 =?utf-8?B?VzNOSkEvYXlHeE0xZVBtQnR5VFM4V1NCQm5rMXVpaFRtOUFGcmc1cU5uUmpo?=
 =?utf-8?B?YytoQjVXYm5vVUhzZlNTS1NFM1VPWTdXYjRUbWRBVnRzVnd3UTJCd1MwZjcv?=
 =?utf-8?B?STBYeSttNzQ0ZHNpZ3JXS1lZU3pyeSt5NEpQN0RvMmprVGhJQVVZK2tIcGdD?=
 =?utf-8?B?MVI2MFlYb3NzWWhlcG9JVlZpcW4xb0wrYXltYUdHVWR0Q2loV0ZXa05QYXJa?=
 =?utf-8?B?dzNJdnVUUG5Wdm9sWlRhT0NiU05POXZtMEJScCtUOTQ1dDd6bmpSOXlwSzBQ?=
 =?utf-8?B?dlJwc2xJY2lpNHhXKzI5UlZKdko0VmV1SnJxVUZ0ZFhVRWRsNE0xU1RjVEh0?=
 =?utf-8?B?QlZmS0xSQ0RSSi9jUWNGOW1KVURPWnZUSXVwVW1vNGVuSFd4UUtnUFRtNDFU?=
 =?utf-8?B?cld2dlpxeDc1MmZTdDNWd3p3eTBSTUxLM1JraE9XTlpQU2NEMmRiZmhDS2gw?=
 =?utf-8?B?THpTUms1RVVpMU0xdkExZ2pYd1JES0cxakx4V0hZNFdjakZYU1JGeTFLVzdw?=
 =?utf-8?B?eWpkSlIycUpaZVpHVmpqb05PNFRzSkdVcUFFT1F2Nk5WWTVYMUw2MkJxeU9V?=
 =?utf-8?B?OUpNV05lYStlZmYxWCtzM2w3L0cyTU9reUpzM3NBNENUL01iczBjd1JJTkNq?=
 =?utf-8?B?cE9OUHpJMmR5clg4R1lxVnhJdjhueEh6TDNPbkdzRHMzUzl5TDBJQXJjT3dQ?=
 =?utf-8?B?VXcrTnZWN0xBUVBCNDA2U0pCc0hMamowN2VhNHRtNWFZZlZ6UytkVTBOa2FV?=
 =?utf-8?B?Qnpnd1ROMmZHVzkwNlBxV1JhbUdLZGpFNTRiZnd0WGlydzZqNUhPOHFzTHN6?=
 =?utf-8?B?cjlPOUFaWnhzeXJ4b3hwOVFGY3FiZEs0YkVMaXFzL0pxbjNLTWJNSUVTcUI3?=
 =?utf-8?B?WUo5dUJOSzhjeFJLMjcwVUplSjYwOC9TM0FrRXVTcmpLS2xPYTB1YU1oSS9D?=
 =?utf-8?B?dkN1ZVRmYjA1dnhneXB1RjR0RTFqdU90SGh0eEE3ejdSelRjZ1g2ckJPT01O?=
 =?utf-8?B?eS92alVsNjBrQ0t1TnhWRWp6UGovSFNrd2FxWFpVUEs3a01uMW1vRXBKMFI2?=
 =?utf-8?B?d1FmOUt1TG5IdlZoWXdEczkvY1BUbUVJZDE4YWF0VU1LNmUwcDZaM0MzcS9C?=
 =?utf-8?B?eHdZTS81bXc3YlV1NFRxOGIrSlhncThXR1YwRFdiL2dRajhYY05KRFVBR1h5?=
 =?utf-8?B?eUVPZlNBSytBMUhOd2M3Snp5ZWxzT3ZWRmFQcGVHdmdTTmh4d1dDUWIveE5S?=
 =?utf-8?B?SU9aUkJVdnFrV3ZlTkdTWkVXdU5nb05zbXBvcHRHc05jaUR1UUhucEpzN2Fl?=
 =?utf-8?B?djRaMmk4OElLWjdYT0lFYkExcnVXOWNwSmhxcTJ4QnZ4aC90dmk2Um81YjRW?=
 =?utf-8?B?cEZBYVZkcUZQNnlhYmc3aXp5cmlmYmdTRXBFbjVrM2tkSWtHNkVvdGR5dmh3?=
 =?utf-8?B?WFJyKys0RjVVRVR4dS9pSGRmdjZwTW1Qd3VIR1BzQkQ3M1Z5WisvZWJXRFg2?=
 =?utf-8?B?Z0xzZzFlTjc4Ni8rQm90d0xvNlZra0dVNVBnSXpWYXNLNmJ1Z3J3bnVHRUZ3?=
 =?utf-8?B?b0FqMkpieDRQcnJuYlVacTBPUW9hVnl4SmtUVGh2c0NIY2d2V0QwMnhPWUcr?=
 =?utf-8?B?K1BlcFEzaUl2R2lwaG9yaXR6Z2tOM0Rqd1Z3QmJtSzJNRDhja2xDODhKRUtW?=
 =?utf-8?Q?7sl3cSVA4tQKHBMpU9CfDSxub?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda96100-45fb-4e77-8676-08de0b7f3cae
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6701.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 00:10:24.6360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTUWKSc2hdA2+AQC6J+spvNScPTO6VlHmXUf6Gwue0PmdneENJE+8D720j4ts8aVorG44gNvFEbCWuw3kPgXkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
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

On 9/2/25 06:41, Danilo Krummrich wrote:
> On 8/12/25 12:00 AM, James Jones wrote:
>> The layout of bits within the individual tiles
>> (referred to as sectors in the
>> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
>> changed for 8 and 16-bit surfaces starting in
>> Blackwell 2 GPUs (With the exception of GB10).
>> To denote the difference, extend the sector field
>> in the parametric format modifier definition used
>> to generate modifier values for NVIDIA hardware.
>>
>> Without this change, it would be impossible to
>> differentiate the two layouts based on modifiers,
>> and as a result software could attempt to share
>> surfaces directly between pre-GB20x and GB20x
>> cards, resulting in corruption when the surface
>> was accessed on one of the GPUs after being
>> populated with content by the other.
>>
>> Of note: This change causes the
>> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
>> evaluate its "s" parameter twice, with the side
>> effects that entails. I surveyed all usage of the
>> modifier in the kernel and Mesa code, and that
>> does not appear to be problematic in any current
>> usage, but I thought it was worth calling out.
>>
>> Signed-off-by: James Jones <jajones@nvidia.com>
> 
> Having a second look on this, isn't this (and patch 3) a fix as well?

Sorry, it was just pointed out that I missed this email. Apologies.

I suppose they could be considered a fix for 6cc6e08d4542 
("drm/nouveau/kms: add support for GB20x"). Would you like me to send 
out a rebased v2 with a Fixes tag?

Thanks,
-James
