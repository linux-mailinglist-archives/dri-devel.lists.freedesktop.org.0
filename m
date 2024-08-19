Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67FE95657F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 10:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB3BE10E1F0;
	Mon, 19 Aug 2024 08:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Xl9Xvzc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B4B10E1EC;
 Mon, 19 Aug 2024 08:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjQ8j1JQFvSyqfFZ9lDcSEe+xc9cWRTTWxi7CHDJT6CGBK0Yb5fcdClPJN4xoZaeK7lDyQ1YWyCRVjfb73hE/qZX2vFz+VV99vBHVQwwu8s7MMtloczcIizE9WWZIL0yTipMaFhRQPccd0MuhRlFNtY2XvUwHwn3Or3WiYz+DbAhb4DYtaJh1uJQr1oy8PZuI3qTteWtL4sBFdIaGlQuOfpDG1dyWJmWeuVLXwZpgNrMKitEoe46kT6ARp6GWbjB72rEQBEO01BFrLJ4SXGxq+DWfrcTFyUUkFFHHWHyPzx2NJCevt7O8IDB3x0WR+B08Hm2y84zHEpyf+iuVx9CGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ELVC0rh6nVNheMrn4kmhIIe7EmmoyZygm/0xHM3e18=;
 b=wW11H4n/jyVvUvvwtImga4f9X65cZV5eA9qCoi4lJ+h68Z476RUaXeq08vOKCLQmNhea0/9zG6eO8CLz5Y5+Fb6wF63yj1u0qP/UkNNuKVkbZPaUHYBapPabtzEO/bvP0EzIlNZIwVM7HK+cCAj+LaJIpatdFmyEjaawTDK5btfIW6b91L/JIKNyF4lpNWjqOmqAB7tHlw2LNqIbD9Ww75Ju4eQvRF//Kj6eWoOu+RCz7CtGashdBhXCzrF3txuk/MD7b0PZ/A0DX3SaXbwOoqgOu9UEGdUbP4D/vMopD04DCMWPamHIvWaj8PRFrFmAXIoQBTuaRX4BI2WafEatjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ELVC0rh6nVNheMrn4kmhIIe7EmmoyZygm/0xHM3e18=;
 b=Xl9Xvzc50B+4y7MJ/qxrnzXSjgoD4xliFdGp3c9EAVn+mzIKD6qyxqJuzv8FgR7UYuj8ERRWZxcKAyXgKtCm/Xxi9/TexbiOXSP0mFiNCn0TojO9Qa1fGpBs5oj3NPuZe9ge3xEAE/LDj3sf7rCN8oKagsaVfhjZY67jBCTSpoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 08:24:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:24:02 +0000
Message-ID: <aec97449-b33f-4be7-bcd1-ef1cc8e47e75@amd.com>
Date: Mon, 19 Aug 2024 10:23:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Glisse <jglisse@redhat.com>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
 <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
 <fb530f45-df88-402a-9dc0-99298b88754c@amd.com>
 <e497f5cb-a3cb-477b-8947-f96276e401b7@fintech.ru>
 <1914cfcb-9700-4274-8120-9746e241cb54@amd.com>
 <cb85a5c1-526b-4024-8e8f-23c2fe0d8381@amd.com>
 <158d9e56-d8af-4d0f-980c-4355639f6ff8@fintech.ru>
 <a80ec052-72a3-4630-8381-bc24ad3a6ab6@amd.com>
 <66f8503f-4c36-4ac7-b66c-f9526409a0eb@fintech.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <66f8503f-4c36-4ac7-b66c-f9526409a0eb@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: ac9ef8c6-d654-411e-74e6-08dcc02847ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm16M1FzVUozRm9VTXk2U1VITFk0czZTbEFsODUwa2RxNi8xTVZKQXNucHYv?=
 =?utf-8?B?em56TGU4RkJjbFNESWUrTDBGWWR1czZnYUhNRzZIeWtiUG5ndmZPcFBBL1Ur?=
 =?utf-8?B?c29pYmt6N0sra3VmTG82QWVKWDA5YW94ZDVmYUVBY0NSdU9RMytHYzdWa0k5?=
 =?utf-8?B?NXFZamNGUyswdUVEbXpqVkFVZUZBUG9ScVVQN0VTSHNZYktpYm9pQ0hZUEF5?=
 =?utf-8?B?ZHpwL25xcUVBMFlDMXhSQjV3cG9VMVJ6Qk9xU0tCSVFqT2lJTDJNdkRiV2Zo?=
 =?utf-8?B?U3l3SzE0eXFUR2xmTmpFanpUS2tQbFZGMGJ6b1BIN3ZFWmNvVTM2anNRSzUv?=
 =?utf-8?B?aFBCVkFnSjhJZzRWeXNibUFsSTRlbEtEM2pxYWIzekY3V04vd29HY3Mza1hB?=
 =?utf-8?B?cWIvRkw5d1hEaE1OZElJRmtZR2JCRGwwcGdHTEtqdVlwVk9IR2V3bjZCc3pR?=
 =?utf-8?B?eWxnamJueTJMeDl1cHdjckd0TGplNmsvQmRXRm9tUVc3YTJvdnNXZ0ozMXd3?=
 =?utf-8?B?K2pJeWg2ZVorY0IxclJodDQ4S3ViWjFSSUIyS0plLytlWDVmMElKUCtoYUNp?=
 =?utf-8?B?T0dmWGEwbU5EY2FTNkFScS8zbElsOFhPNEo3b1BGRGlQRXR4NjRyWEZpQWto?=
 =?utf-8?B?b0ZLVEJmNEY3WHFhbWNFUDh4YUFsdHVXOXNkcklMY3ZyUFIwNksvb1FpK3Fn?=
 =?utf-8?B?amFQY2JHUktRSVR6a1dSdjZRc3k5ZCt1T0QrT2F5bHN3VEU5WVliek9pRm1y?=
 =?utf-8?B?SHJxSEpXNkhwR3RibXdKUGJPZEJHdVBGbU5LRytpdVhEU3pNTjcyOGFOR2du?=
 =?utf-8?B?UGpNQ1pDSFN1QlhDSlU4MU1jMjlQWWlmMXBwTVh4VCt0U0RKZlJnMlVPV2gv?=
 =?utf-8?B?Q2FqbEJub3R3UEdCWDFCREdENUZmQndOZ1czZkZKVFZJOWdXSUxobStLVC9X?=
 =?utf-8?B?L0htZk9wMXhzdStmNkJLMDZSWTl6Z2hzLzllQkFYeUFQWnFjbFdMQzFUb3ZY?=
 =?utf-8?B?RCtkdDAwS3lvdmxGcFN5QlBucjQvZlZJaUQxVm5ncUNrVk5uTC9vanR6NytH?=
 =?utf-8?B?VWFLOXpyQlVqYzdaK01hVng5R21JSnRUZGZ5cmRVcjh3NzcwWVUzbCt4bURu?=
 =?utf-8?B?cXpmNW0ySUJ1ei9JcmwveDlMK2hoUVJDaWJlODZDRk0xRFc3aDNTcWl6RXBl?=
 =?utf-8?B?UjI5SjBQWWNNOGFUSHpna2dCYnNpakN5UkJ2UngvTGFoeXNaR0RYR1JqcDFZ?=
 =?utf-8?B?YXFqdTZXZVBZRjJCYmZkc2ZKd2M1QzVpS1RNOWdwRlVHZGdmYmZ6QkVmRzBp?=
 =?utf-8?B?UU41UzhuNS9hMm44NEFMWjFpRVlmK2ZZTCtEcCsyRjFmR3oweHhQbWdvYTRn?=
 =?utf-8?B?eGpxQnVudERSWXhYdWlqQzZrbThwMmhUNHp4YTRGSW9pYnNzMGtNUXY0Vllz?=
 =?utf-8?B?R1RNakdDTlByTDhyaDdNWUo0VTR0WXltdTRJTzA5b2ZIR2NVOEpWVWpYVzFB?=
 =?utf-8?B?eVEwRkNNdm9IdXEwU3E3ck9jWjZlaVd6RG1neGNSK0lDVkNmRHRaNVNvTjZ3?=
 =?utf-8?B?WGVJd0s1QlNTc1hiR0lUb0NYY2Fpc2gvZGdPZnlONTFKK21zQVhNZG5sUTRP?=
 =?utf-8?B?OTE4eC9nUzlxVDRVcW1NQVVJYldvcUpjVFR4VjNSWC9ObERKMVk0UnRmTzdI?=
 =?utf-8?B?aFFua2lRbnJicmZRWUYvVm1wOGdiUFZzZjRVMXlMa2d1SkpWcDUyQnA2dFVB?=
 =?utf-8?B?b01ySGRMQ1FOSVJHZWpQb25TSXpuRjYwS1l5RjJZWkRsZjY0MW1TTjh3M2hy?=
 =?utf-8?B?ZVhwZjdFTUxSZUdlSmI1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akFaQ1hEUHVHM3Fnbjh6dUxLWkZBUHZrNUpRdVozdzM2WWtMalN0TWI0RFhk?=
 =?utf-8?B?UnRCTG5mMVN6T3ZDV2xRWjR2dFZ5WTgzbWdtV0dZd0tUQnNWYU14VmNnTjlD?=
 =?utf-8?B?STdFMlF6bnYwY3A3MWh1dUZqQzQ0STJxV0ZDSCtkT0RMa0hGUnFCdWM0VXpB?=
 =?utf-8?B?ZUZ6U3BaQUZyUFlZRm9ycDZESzdNZnZVTnB2NjY1WnZNWEwzc3B5SXN6c0hk?=
 =?utf-8?B?MjhkUEFCQXpQUFZJT0p6N1BKWE1WM0FpMSs4cjlXbi9BZHV4U1pnYjg3RkF0?=
 =?utf-8?B?Q3YzZDVNSzhwUDNUalR6VTBDMzlHK2dYWFNOQ29lOUZpdXV2a2xTenNWcGxn?=
 =?utf-8?B?bkowMnA4amtsVXJmVC91d0toTW5uSjJ5RUFjRUV4QTYwMHI0em5oVHVzNmVU?=
 =?utf-8?B?TEZQZjNBRjlTUjhDK3pERFpZM3JRSEZmUzIyczNoS3Q0K1Y4UkpmYzBKcWpm?=
 =?utf-8?B?aEVWaGRlZDZMNmFScUpmclZoM1pkRDBnWE9KdFAvYkRHZldxSWk1eFFLeEk5?=
 =?utf-8?B?dGtBYlhWU1FuT3p1bG8wUnZPVlhBVk1ubFpFTnhvNG9oa1dsNGVXc2VCRjBh?=
 =?utf-8?B?aVJjM3A2WlpTd0RQOW10Y2h5YWtPeTFUbUl2K21TSVBDbk9KS0RvSVA5M2dw?=
 =?utf-8?B?cGlkRERWaGtsTDhUOXlSMzhyMm85S2FUL3BSM1JKcEhyVHJpMjRlQXd6Z1F4?=
 =?utf-8?B?NzFzdTN4Nk1tNUxCVmNFcU5KVWRFSlFGYUR6Y0JlaFBUT210WG1ENUdzNmtD?=
 =?utf-8?B?eVphZTRTZ2s1U2FBUFhId0xoTENwRTZETkNseENiRitZWDM3MHA5YTlyQmlT?=
 =?utf-8?B?Zk4vQ2Vva0t6cnltaGdTcDNsV29qWXVjbWVoL3Ywb1dnTlhJMStBcjhuOENn?=
 =?utf-8?B?eWZpOWdjbnNuK2twbHc0SWNFV3BrRkR2Z295Zy93UHR4SktIbHFEOTc3eEpS?=
 =?utf-8?B?aWlIeEU4UklmU1NDQlZocUVDbXZLczYvRHFFTkNCQUhVSmVKTWNnekZzb2Js?=
 =?utf-8?B?WkIxOS9PZzF4VkF4QWEwVWgvT0tFbE1OZ0Q4OVZrWDFjcEx1dnBqWDhDZ1dF?=
 =?utf-8?B?RWpnK05XMUp4NU1aNHUzK1JQQklKZHE0andzZmdpSEp3OXBGcWxPeEFiNFp6?=
 =?utf-8?B?SnlwTnF2dkR2TFJMQ2pjQkMyMlJ5UTJwblVDdG1SOFdCaUZwYkJITmtnbnUr?=
 =?utf-8?B?MXZYSEkxM3BFYW5Bd204OWtGeUo0RndkdUNXVlFJK0FWZkl4WWF1bFVBOXIx?=
 =?utf-8?B?Ylcra0hDS3puKzNpNVdIRFpXd2ZYRmtxNmlzNVUvOUJPZkl6TTZIb1Y1dnpn?=
 =?utf-8?B?TVpVU1l4ZFVsOHdkemlkMHlCT3RsS21ENCtnRXVTRmwwbDU1UWxxajU0N0RU?=
 =?utf-8?B?T3cwekFNT2JYR2VBSUR6eUdMU1I5Q1VWVERVazNHdGdkM0RYUk5pYmhFY0ly?=
 =?utf-8?B?OGFiVHhtR2MvdllDV002RWNoWStjdzBQeUo5UGIwWkxLbG43Z2E2bE9zR1Va?=
 =?utf-8?B?eXpxUFR0MFlYTzkzMnRHK0JwT3JZZmgvRG1JNjNnMnB0b0cyaVZPN3lielpk?=
 =?utf-8?B?ai9tUHd0U0FMeC9PU2dyTXkrbk9FcmZxYUFIdDZDSEhTQ0Y1WjNUNE54SnZy?=
 =?utf-8?B?VElvbG4vZUpZSnpLTStQa0FYMit3b28wZXloa0F3bUVWWnlWb05Qby8xcFhM?=
 =?utf-8?B?eHlTUGx2YlZaUTZoaTl0VDgvS1lvbVJ1ZDBYTkVIMjhpeFR6TmxhQUQrS1h5?=
 =?utf-8?B?QkxUeDlJRS9qc3FYYjFqeWRadHh1Q1ZtQnFCeTBlUmZvSkVvV09JZDNqVndp?=
 =?utf-8?B?T3cxTk9lamUveFZ6bitFamdacU9sM3UvMlFBanFrNjhQdUtDSU9Ic2ZEY3gr?=
 =?utf-8?B?QWs5ekYwcjJ6Vk1uOHNJbU5GYjVzYXhHMjJvc04rWDdWaktZR0pkMGdPd2Nm?=
 =?utf-8?B?ckI5RjZDemU4LzQrMGdNaVZlMHJramdXN1E2eENiQm14aGdxLzRrRXZjVElm?=
 =?utf-8?B?UDk5YTV3ZG5pTlJjOStBeHpXYitTZjVKTnhlVDFHVEo4Z3VJT3VtQURQMUZM?=
 =?utf-8?B?eXRKZER4NEhpaG9rMFF4emNmZEhqV2tqV0ViVWdSUVM2dlZZbGpKVXJyaXYw?=
 =?utf-8?Q?Q138=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9ef8c6-d654-411e-74e6-08dcc02847ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:24:01.9096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZX2jobFuSkxfIsiwmf5WvPGgAd22DW5rq65kDCeLWiWBtXxpdjtxRu0IYpZH01Cw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349
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

Am 05.08.24 um 09:34 schrieb Nikita Zhandarovich:
>
> On 7/30/24 23:56, Christian König wrote:
>> Am 30.07.24 um 19:36 schrieb Nikita Zhandarovich:
>>> On 7/29/24 11:12, Christian König wrote:
>>>> Am 29.07.24 um 20:04 schrieb Christian König:
>>>>> Am 29.07.24 um 19:26 schrieb Nikita Zhandarovich:
>>>>>> Hi,
>>>>>>
>>>>>> On 7/29/24 02:23, Christian König wrote:
>>>>>>> Am 26.07.24 um 14:52 schrieb Alex Deucher:
>>>>>>>> On Fri, Jul 26, 2024 at 3:05 AM Christian König
>>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>>> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
>>>>>>>>>> Several cs track offsets (such as 'track->db_s_read_offset')
>>>>>>>>>> either are initialized with or plainly take big enough values
>>>>>>>>>> that,
>>>>>>>>>> once shifted 8 bits left, may be hit with integer overflow if the
>>>>>>>>>> resulting values end up going over u32 limit.
>>>>>>>>>>
>>>>>>>>>> Some debug prints take this into account (see according
>>>>>>>>>> dev_warn() in
>>>>>>>>>> evergreen_cs_track_validate_stencil()), even if the actual
>>>>>>>>>> calculated value assigned to local 'offset' variable is missing
>>>>>>>>>> similar proper expansion.
>>>>>>>>>>
>>>>>>>>>> Mitigate the problem by casting the type of right operands to the
>>>>>>>>>> wider type of corresponding left ones in all such cases.
>>>>>>>>>>
>>>>>>>>>> Found by Linux Verification Center (linuxtesting.org) with static
>>>>>>>>>> analysis tool SVACE.
>>>>>>>>>>
>>>>>>>>>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni
>>>>>>>>>> tiling informations v11")
>>>>>>>>>> Cc: stable@vger.kernel.org
>>>>>>>>> Well first of all the long cast doesn't makes the value 64bit, it
>>>>>>>>> depends on the architecture.
>>>>>>>>>
>>>>>>>>> Then IIRC the underlying hw can only handle a 32bit address
>>>>>>>>> space so
>>>>>>>>> having the offset as long is incorrect to begin with.
>>>>>>>> Evergreen chips support a 36 bit internal address space and NI and
>>>>>>>> newer support a 40 bit one, so this is applicable.
>>>>>>> In that case I strongly suggest that we replace the unsigned long
>>>>>>> with
>>>>>>> u64 or otherwise we get different behavior on 32 and 64bit machines.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>> To be clear, I'll prepare v2 patch that changes 'offset' to u64 as
>>>>>> well
>>>>>> as the cast of 'track->db_z_read_offset' (and the likes) to u64 too.
>>>>>>
>>>>>> On the other note, should I also include casting to wider type of the
>>>>>> expression surf.layer_size * mslice (example down below) in
>>>>>> evergreen_cs_track_validate_cb() and other similar functions? I can't
>>>>>> properly gauge if the result will definitively fit into u32, maybe it
>>>>>> makes sense to expand it as well?
>>>>> The integer overflows caused by shifts are irrelevant and doesn't need
>>>>> any fixing in the first place.
>>>> Wait a second.
>>>>
>>>> Thinking more about it the integer overflows are actually necessary
>>>> because that is exactly what happens in the hardware as well.
>>>>
>>>> If you don't overflow those shifts you actually create a security
>>>> problem because the HW the might access at a different offset then you
>>>> calculated here.
>>>>
>>>> We need to use something like a mask or use lower_32_bits() here.
>>> Christian,
>>>
>>> My apologies, I may be getting a bit confused here.
>>>
>>> If integer overflows caused by shifts are predictable and constitute
>>> normal behavior in this case, and there is no need to "fix" them, does
>>> it still make sense to use any mitigations at all, i.e. masks or macros?
>> Well you stumbled over that somehow, so some automated checker things
>> that this is a bad idea.
>>
>>> Leaving these shifts to u32 variables as they are now will achieve the
>>> same result as, for example, doing something along the lines of:
>>>
>>> offset = lower_32_bits((u64)track->cb_color_bo_offset[id] << 8);
>>>
>>> which seems clunky and unnecessary, even if it suppresses some static
>>> analyzer triggers (and that seems overboard).
>>> Or am I missing something obvious here?
>> No, it's just about suppressing the static checker warnings.
>>
>> I'm also not 100% sure how that old hw works. Alex mentioned that it is
>> using 36bits internally.
>>
>> So it could be that we need to switch to using u64 here. I need to
>> double check that with Alex.
>>
>> But using unsigned long is certainly incorrect cause we then get
>> different behavior based on the CPU architecture.
>>
>> Thanks for pointing this out,
>> Christian.
>>
> Hi,
>
> Christian, did you get a chance to go over hw specifics with Alex?

Sorry I'm just back from vacation. Give me a week to dig through my 
mails and talk with Alex.

Thanks,
Christian.

> I'd really like to get on with v2 patch but I can't really start
> properly if I don't know what (and how) exactly to fix.
>
> I am also hesitant to split the fix into parts and I'd rather do the
> whole int overflow mitigation in one set.
>
> Thanks,
> Nikita
>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> The point is rather that we need to avoid multiplication overflows and
>>>>> the security problems which come with those.
>>>>>
>>>>>> 441         }
>>>>>> 442
>>>>>> 443         offset += surf.layer_size * mslice;
>>>>> In other words that here needs to be validated correctly.
>>>>>
>>> Agreed, I think either casting right operand to u64 (once 'offset' is
>>> also changed from unsigned long to u64) or using mul_u32_u32() here and
>>> in other places should suffice.
>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> 444         if (offset > radeon_bo_size(track->cb_color_bo[id])) {
>>>>>> 445                 /* old ddx are broken they allocate bo with
>>>>>> w*h*bpp
>>>>>>
>>>>>> Regards,
>>>>>> Nikita
>>>>>>>> Alex
>>>>>>>>
>>>>>>>>> And finally that is absolutely not material for stable.
>>>>>>>>>
>>>>>>>>> Regards,
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>>>>>>>>> ---
>>>>>>>>>> P.S. While I am not certain that track->cb_color_bo_offset[id]
>>>>>>>>>> actually ends up taking values high enough to cause an overflow,
>>>>>>>>>> nonetheless I thought it prudent to cast it to ulong as well.
>>>>>>>>>>
>>>>>>>>>>       drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>>>>>>>>>>       1 file changed, 9 insertions(+), 9 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>>>> b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>>>> index 1fe6e0d883c7..d734d221e2da 100644
>>>>>>>>>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>>>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>>>>>> @@ -433,7 +433,7 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_cb(struct
>>>>>>>>>> radeon_cs_parser *p, unsigned i
>>>>>>>>>>                   return r;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> -     offset = track->cb_color_bo_offset[id] << 8;
>>>>>>>>>> +     offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>>>>>>>>>           if (offset & (surf.base_align - 1)) {
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not
>>>>>>>>>> aligned with %ld\n",
>>>>>>>>>>                            __func__, __LINE__, id, offset,
>>>>>>>>>> surf.base_align);
>>>>>>>>>> @@ -455,7 +455,7 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_cb(struct
>>>>>>>>>> radeon_cs_parser *p, unsigned i
>>>>>>>>>>                                   min = surf.nby - 8;
>>>>>>>>>>                           }
>>>>>>>>>>                           bsize =
>>>>>>>>>> radeon_bo_size(track->cb_color_bo[id]);
>>>>>>>>>> -                     tmp = track->cb_color_bo_offset[id] << 8;
>>>>>>>>>> +                     tmp = (unsigned
>>>>>>>>>> long)track->cb_color_bo_offset[id] << 8;
>>>>>>>>>>                           for (nby = surf.nby; nby > min; nby--) {
>>>>>>>>>>                                   size = nby * surf.nbx *
>>>>>>>>>> surf.bpe *
>>>>>>>>>> surf.nsamples;
>>>>>>>>>>                                   if ((tmp + size * mslice) <=
>>>>>>>>>> bsize) {
>>>>>>>>>> @@ -476,10 +476,10 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_cb(struct radeon_cs_parser *p,
>>>>>>>>>> unsigned i
>>>>>>>>>>                           }
>>>>>>>>>>                   }
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d cb[%d] bo too small
>>>>>>>>>> (layer
>>>>>>>>>> size %d, "
>>>>>>>>>> -                      "offset %d, max layer %d, bo size %ld,
>>>>>>>>>> slice
>>>>>>>>>> %d)\n",
>>>>>>>>>> +                      "offset %ld, max layer %d, bo size %ld,
>>>>>>>>>> slice
>>>>>>>>>> %d)\n",
>>>>>>>>>>                            __func__, __LINE__, id, surf.layer_size,
>>>>>>>>>> -                     track->cb_color_bo_offset[id] << 8, mslice,
>>>>>>>>>> - radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>>>>>> +                     (unsigned long)track->cb_color_bo_offset[id]
>>>>>>>>>> << 8,
>>>>>>>>>> +                     mslice,
>>>>>>>>>> radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d problematic surf: (%d %d)
>>>>>>>>>> (%d
>>>>>>>>>> %d %d %d %d %d %d)\n",
>>>>>>>>>>                            __func__, __LINE__, surf.nbx, surf.nby,
>>>>>>>>>>                           surf.mode, surf.bpe, surf.nsamples,
>>>>>>>>>> @@ -608,7 +608,7 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>>>>>>                   return r;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> -     offset = track->db_s_read_offset << 8;
>>>>>>>>>> +     offset = (unsigned long)track->db_s_read_offset << 8;
>>>>>>>>>>           if (offset & (surf.base_align - 1)) {
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d stencil read bo base
>>>>>>>>>> %ld not
>>>>>>>>>> aligned with %ld\n",
>>>>>>>>>>                            __func__, __LINE__, offset,
>>>>>>>>>> surf.base_align);
>>>>>>>>>> @@ -627,7 +627,7 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>>>>>>                   return -EINVAL;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> -     offset = track->db_s_write_offset << 8;
>>>>>>>>>> +     offset = (unsigned long)track->db_s_write_offset << 8;
>>>>>>>>>>           if (offset & (surf.base_align - 1)) {
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d stencil write bo base %ld
>>>>>>>>>> not
>>>>>>>>>> aligned with %ld\n",
>>>>>>>>>>                            __func__, __LINE__, offset,
>>>>>>>>>> surf.base_align);
>>>>>>>>>> @@ -706,7 +706,7 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>>>>>>                   return r;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> -     offset = track->db_z_read_offset << 8;
>>>>>>>>>> +     offset = (unsigned long)track->db_z_read_offset << 8;
>>>>>>>>>>           if (offset & (surf.base_align - 1)) {
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d stencil read bo base
>>>>>>>>>> %ld not
>>>>>>>>>> aligned with %ld\n",
>>>>>>>>>>                            __func__, __LINE__, offset,
>>>>>>>>>> surf.base_align);
>>>>>>>>>> @@ -722,7 +722,7 @@ static int
>>>>>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>>>>>>                   return -EINVAL;
>>>>>>>>>>           }
>>>>>>>>>>
>>>>>>>>>> -     offset = track->db_z_write_offset << 8;
>>>>>>>>>> +     offset = (unsigned long)track->db_z_write_offset << 8;
>>>>>>>>>>           if (offset & (surf.base_align - 1)) {
>>>>>>>>>>                   dev_warn(p->dev, "%s:%d stencil write bo base %ld
>>>>>>>>>> not
>>>>>>>>>> aligned with %ld\n",
>>>>>>>>>>                            __func__, __LINE__, offset,
>>>>>>>>>> surf.base_align);

