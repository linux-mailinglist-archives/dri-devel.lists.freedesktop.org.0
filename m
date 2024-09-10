Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5E9973B44
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CB610E2FA;
	Tue, 10 Sep 2024 15:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h9WgBh/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6720C10E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Npuk+0n2Pb/gUkX5yaDAMxOissVMMTn8c0Kq0dKcKMLvn8m1CNDnSRULyrWStwukVNQK6NgDmXrHedejZWgSBh0NabyNORTB+G1LNPWbXIjC1jzyDmoX9eFLpi0xhmfd6qV7nbih/3EiUQ55tkLFDYYsXm97foGHd+LP3+85xBP3d5GdPiMNG5pcUwRSL5thOz7Qe3NDLoQJJnbocLaopyBwJmdcyWKtkkmrhiZ9wl2Yofx+2gc0pntphJf4PsaDRe+ljlA+Gmseksy2xBsTuJQBe0KFWj/tU92dZvAC4PEjDPTXSRzxkDMTlSVpRp00ZMqUHolZTZGJS+G3buAW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiZu5BE/BCetUzjlcfOxYsjHc1W6c2PYnwYJX1VCsaQ=;
 b=w9/T44vWflFuLA80lfqRH9GDhcHfjzoC3gm/dVDe6xy6k5rcnQv6cvyZrdWldLC2n3JmV+z+zMKJpA4MobpRUINProNz3SL40XCURmUZ3hRibj3NLGEhP6BKIuGcBVyWCZzLPlI2/mGqvGFapkZJ/U3SevUX80LS5TSCtIqTVPhVpzUSm3y9Efk5rusd8q6tai8Czdn2gmTZQJAmqc2PXOxSMn9+2xeuZH78fpbiRkko9ACAt0OHrHtmPnIvyTzJEK1pg7qGp9APpB7rQeJ3kgf4eeO2eSg4LQN91yFZrIpzTlpOQ6xTLaIoLp6D7X2KqgDIZ7T+82HPwvkpSJjiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiZu5BE/BCetUzjlcfOxYsjHc1W6c2PYnwYJX1VCsaQ=;
 b=h9WgBh/C2OSiKSzGyQOEXq8wxkF8WQKj7CUO/zvnskEYTHtaVktgSEuTfpsK1wFv0wPkkfjL1BdO2AGZhIG77gBNahkEhrvbL2+KrljRWgjEqLVWCo3c3ssBATwCqSmHDJXrTgV4T9VpbRbuUSBAyvfOLAmhwUEg//1A6W32Qys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 15:17:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 15:17:03 +0000
Message-ID: <88b7e403-5910-44ab-8f42-fc183beafc67@amd.com>
Date: Tue, 10 Sep 2024 17:16:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Simon Ser <contact@emersion.fr>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Xingyu Jin <xingyuj@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240909205400.3498337-1-tjmercier@google.com>
 <c970dfb2-078c-4bf1-8b50-6e535cf4adf7@ursulin.net>
 <7aef07b2-9859-40a8-ba5b-22aba68c2d9c@amd.com>
 <CABdmKX2JRi-7x_pkSrkuwjzzjDnDQyMEcZmfWrn2AXLuOHQ6Qw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2JRi-7x_pkSrkuwjzzjDnDQyMEcZmfWrn2AXLuOHQ6Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6e13e9-5817-43dd-0c4f-08dcd1aba01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUpVMTBaS2NyNHY2WlNNVGFKOHRMeUZpTXR5T01GZllJSlZ5aHlTRnBmcVc4?=
 =?utf-8?B?MWNYU1FiVXRNbFdzeG9iZzBrM3pOUEVJd1l0bnhCcWVhR01aNkFhWlN0a0tY?=
 =?utf-8?B?L0QyQms0dEJxRnBiZmpuSkZoa3ExWDdraUNBaEI0R3VPRGU3NFdiTnNuam5B?=
 =?utf-8?B?VnBma3JvNG81SkluY3Q3bUUzVjY2MEtRY0pOV3ZiY1FTbVBjdkhhRkNLR1V0?=
 =?utf-8?B?cjIyRTFXK24rd0o4WEpEdXQ0akhLN0EweFdueXJoZU1SNGp1azNSZVZMWmNw?=
 =?utf-8?B?WVZ1VWVXb2d0SmV5c1R0bHRFR2xnRjJhZDhCdUVpRG0wN2lZaDlFRWEranlZ?=
 =?utf-8?B?cVlYQ1QwSUkzeWVGSFRXWlo2cEM2eWNST0dxTGxKNGRLYlRtbDFDVzk5TElB?=
 =?utf-8?B?TGhwek5FL0thaWg1M3pvSktKSkpTcWJlaWZISzRmdGl0R1MvZmpReWJwR1d3?=
 =?utf-8?B?d3RTMTJCU0JLczRad1lUbUkwbTVCREQ3aHFEK2lkdE9oTE9IUDU3b3F2YS9Z?=
 =?utf-8?B?NkhQa2pHVUxpMEFnUndxVnl6eWJXR3VCSHJNNkYvTGxRZEE2RVNJVG9ERFQz?=
 =?utf-8?B?MnlNR2ZJeEdHbnorSmxEQ3FwTEZrNTJNN05SNW1xMkVXSENnQmQzemVpMDZ2?=
 =?utf-8?B?TlBpNFV2QnVqMCsxVkJsVjExbGtzU2VRZFAyRmNBSjVvN1l1Z0xNallxZzFJ?=
 =?utf-8?B?RGN4WlhORkErSm5lWTB0TnhwcWdZQ3pKV3JPSEVJa20rMGtvSk5ab0JDNWVy?=
 =?utf-8?B?clFnK1pRUVlWZVBLeTJVZ2ZwajNKYmpLbDBjS0w2SGxlUmQxMk9wMkNjdzBY?=
 =?utf-8?B?aGNSMTRVKzd6WHpSMmJwYUY1T0xqa0Q4amF1TVl1U0ZEQ09MTHl4Y1JOYzN1?=
 =?utf-8?B?M3ZtVS96Sy9SSUJNU0tZYzdHam9sbU15Ujk1ejRBdVYwREVVQUxva0RpTE1Q?=
 =?utf-8?B?cHVUYkpGN0JTNjhGRHZ1cWhTajE4eVAvUlRiK0QwUTY3bHpua1JFNHpiTjk3?=
 =?utf-8?B?c0ZTYlpWeTNjUWlBZ1FyZ1dFaUFqSjlxdnlrOWk1L1dxeXlWZ29LcngrVnVE?=
 =?utf-8?B?SVlhSE5YWXY0c2tYZXRtUk40SzUvOGZycVBZRU1ZaXFKVDhwYWJVWGppNVNR?=
 =?utf-8?B?Ymhpb3FkQkpmdnJidk10YmFhUVpUazNXVUw3dHNtOWtQYkpTV0dvWEtRSmd2?=
 =?utf-8?B?ME9Wd3ZVVFl1Nm80WnBQTGhjSFJaZkpVNjlpZnk5R0I4UlJQK3JCaXZJT1ZV?=
 =?utf-8?B?aXRpQzFOamxNNitUM2dZZ09vNllLSEg2V1ZaWjgvTzNqa1gwK2pqTjBjR0R3?=
 =?utf-8?B?S2JDZnRFME5OcURCWEVqQ1NvWWZJa1crc0ZGYVpQNGUxUGgzLzlzZDRZNzh6?=
 =?utf-8?B?cEc2V3RwelpvWWYraTNIUUhCdXcxZmlmWCt0OHNUMFRkdzcxZVBMbUN3ZExN?=
 =?utf-8?B?cE80WnNYV3ptdjRhV2lydktSOVdDbnIxeTM4dWRrRzNEM0IwZVlHc1Q5UXVo?=
 =?utf-8?B?UDdtbHk5aVRmcHdrbEFxSlVhQmJzem5qZW1SRXYvYUpOSXJJVzE1alRHNDJU?=
 =?utf-8?B?OHYzWmIxak12TEVTdGV3dHN3Mm9EbnpZVXNNUjNlOWxaQVBVM3hCTVFaR0M4?=
 =?utf-8?B?bVAxUTAxM20wSUg1UTVZSXZBKzRFMzh3TnFMWHBGTWYyNkJxa0hMY3kvZmoy?=
 =?utf-8?B?bEdaNFloRlpUcTZ3YU0wNkpsdkthOVM3RVJ5bjlDa1NQVnV1KzBTVGozQUoz?=
 =?utf-8?B?Z0dPb2pmR3l5cnRvRUdLOTdQY0JuVENuWXUwc3VWaDFWRTVCdTI5M3ZiV01U?=
 =?utf-8?B?VThmSm5PaXAvRksxTURzUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUVHNDIwczhlK2xncDJGbVk1UVk3bnZPcEE1TjJWZXk0eDJnWWkzVDVrblF2?=
 =?utf-8?B?bHEvNldxV044Sk45bG1FNkUxTlNKODVwWERvU2NmS2VWcmc5K3dGUXZmZEpT?=
 =?utf-8?B?UFBqQUZ3TEx3RU1rRnhBOFJXd3JQY0FpNnd5NlBtQ0MrdCtsNTZyTnoxbzVL?=
 =?utf-8?B?RldsNGRPYkUySXhDT0RTVlloMk96RllkRHdiOG9DV1o5ZkY3eWpid01wVVFz?=
 =?utf-8?B?UnFSZHg0TklHajVlYUhFWHo0R00xUC9PTXY4NEFOQUhvVHlaQjNKejhjb1Uz?=
 =?utf-8?B?YVJrSCt2ZFBJV09MeHN2cEpkcDBqMmRsWGpieFhuOFpCRHl3V3pWNWRXMHRQ?=
 =?utf-8?B?Z2hGYmwzS0xxL3diSnJqYUFlUmFuMGhPTE0zNTNKVTh6NElXMVE4L2g0aFRD?=
 =?utf-8?B?dW85WXBEMW93UDFCeEZUdHpKdTRwUWFWTFhwd3RCWnZFVHowb1lyT05VRGl1?=
 =?utf-8?B?TDJvcWtGRTEySjlvZWtVSGJ1YnRRRXpwQVlZclUxdFVXeTJIY1A0dHJIOHZR?=
 =?utf-8?B?NXJxaWEwK0dYUFV3V0FBQjY0SXF3SDNCaEFHTEd5Wms0S2d2ekh0K3kybXI3?=
 =?utf-8?B?QnRqV3VzZXBjYkNVR054VHpYVUJEY2tGM1NBV1FFeTR0WDBJTW5hM3pCVGoy?=
 =?utf-8?B?MVJ5UTRSdlk2VkxMc3FFa3pmZ0thVXduVHdXd1piSDlLN3lUUngzRlRnRDlH?=
 =?utf-8?B?eXMxVmNUanlORUxVeDZlNFFwSUpmVUk0WVZQU0FucG44VFZ5WEZFUDdiRFlC?=
 =?utf-8?B?U2FJY01JS1U1MGdLNnhpUUg5N3hLbElZV0tjZ0NIL3pmSDNUemxpOHNnRmVI?=
 =?utf-8?B?eDhkbTl1bExTSlNvUTU2NGROWVJ0Nmh5aE9XTzhlaStqdUthNHFXbWs5V2Rk?=
 =?utf-8?B?eEt5dzNGRHVPQit4WTZOUGttVDRsTFdYTnpwMlhFU1hXWm5JRUFxajhtTUZs?=
 =?utf-8?B?NnMwdnVjcEwwT0xOVC9DeWZnWUkvTXFRbnlUcFZBUTcxQmZqa0cwRzNmV1VV?=
 =?utf-8?B?NWUrN0FzdFdHdTNuTGtvd0hGWEJ5TTdMTTh3NnhtOXRNbW9sNTFUM1RZenBK?=
 =?utf-8?B?eGxBUlpvSi9TTUU1dHNCK3FwR1Rxbkl6RHVpek05T2lZMDVSZnlnUXFnYi96?=
 =?utf-8?B?L3dVcVNZM3puRXRwT1BMZHNjUTFRZmR3L2JZVUE3eWJhdUMxdzA4VVo1VXJn?=
 =?utf-8?B?d2diU3VsdUNKWUF2SlhrdWJtK2tFd0M1ZzhQeXB2MGFWcCtleElTc2FVTUFG?=
 =?utf-8?B?SWlwZjhvRWJHZ0RBTTQ1SlpMRC9RRXh1cUNSVGJvZlpqYTVXOHg1SjNRK3E5?=
 =?utf-8?B?dGRVVkM1UjRKRDFRUzhqSGFDakxzWDhjcDRrWHFYamxZUmwvc29HOHF5cnhp?=
 =?utf-8?B?RlpEZjdIajlmam9IM0gxdmpWbnByaDVhRkZDRW5qVmM5MHZpSHJPQXlOcDly?=
 =?utf-8?B?bnR4RHV4d0RzZWRUeGVUL2JSV2tUYitlWDcxZTFjZDEwRCtTNzhBNTFIS0g4?=
 =?utf-8?B?U25NTXhzZitXY0IzOW93dFFiNGtBaTVvZ3J3RlZjZmQ0RnJ4VzN3a1RhMFRl?=
 =?utf-8?B?anQwRDRvSzVNTDRzRFYxMjZ2WkZNVUFWeWozaGYxNlNRS0tlekthRTA1L3g4?=
 =?utf-8?B?Y0dKa3FNOHplREw0NkI2dk1BNnFHTmJsTkhoUjJvVk1hamxvZHU1UDQxWlk3?=
 =?utf-8?B?L1ZPak5YWmVmUm5NMmVaV1o1TERwZUtOUHQ3Znl3c2lITzlnbVgrTkhkMm5O?=
 =?utf-8?B?eEZxZTZVaENBT1pVM2wrRkowWUV1YSs2QllHWHVHNVlkVDZkY1c4Zk5Dd01X?=
 =?utf-8?B?RHZkallNRFRRWG1Gd09TWDRnOFNCcGZhZHUvVWRDb0UwL2dVa1FwNTJjQ0du?=
 =?utf-8?B?TmRDUVVmRWp5UjRxYmtobjZQSG1JcHJkZUtLR21jaHVML3JZT2dLSGRKa245?=
 =?utf-8?B?M08xZExLN3ZNM0gyQXV1aVYzeGQ2bElIY1BqWUJiSVlESWNNbi9pQWlhNHM4?=
 =?utf-8?B?TTQ4SldleWs3dzJyZ2JkU0dBOEdGUDNwdzlVK3YzVkVpNnFaS3U0b1ZTMWlP?=
 =?utf-8?B?a3dya1BjYmVsdi80dEpBbWFOVlVBRkZWMThxRElYM3pqYmk5V1dLd0NCTW9V?=
 =?utf-8?Q?Fdbc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6e13e9-5817-43dd-0c4f-08dcd1aba01b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:17:03.7962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlahinr+eQ2i/a6TA6OMyeCtjOQ8Rz9YVtsRiy1FKgiYbU//e07dng/DnQO8rHEO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475
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

Am 10.09.24 um 16:47 schrieb T.J. Mercier:
> On Tue, Sep 10, 2024 at 12:30 AM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 10.09.24 um 09:26 schrieb Tvrtko Ursulin:
>>> On 09/09/2024 21:53, T.J. Mercier wrote:
>>>> A syncobj reference is taken in drm_syncobj_find, but not released if
>>>> eventfd_ctx_fdget or kzalloc fails. Put the reference in these error
>>>> paths.
>>>>
>>>> Reported-by: Xingyu Jin <xingyuj@google.com>
>>>> Fixes: c7a472297169 ("drm/syncobj: add IOCTL to register an eventfd")
>>>> Signed-off-by: T.J. Mercier <tjmercier@google.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_syncobj.c | 17 +++++++++++++----
>>>>    1 file changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c
>>>> b/drivers/gpu/drm/drm_syncobj.c
>>>> index a0e94217b511..4fcfc0b9b386 100644
>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>> @@ -1464,6 +1464,7 @@ drm_syncobj_eventfd_ioctl(struct drm_device
>>>> *dev, void *data,
>>>>        struct drm_syncobj *syncobj;
>>>>        struct eventfd_ctx *ev_fd_ctx;
>>>>        struct syncobj_eventfd_entry *entry;
>>>> +    int ret;
>>>>          if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>>>>            return -EOPNOTSUPP;
>>>> @@ -1479,13 +1480,15 @@ drm_syncobj_eventfd_ioctl(struct drm_device
>>>> *dev, void *data,
>>>>            return -ENOENT;
>>>>          ev_fd_ctx = eventfd_ctx_fdget(args->fd);
>>>> -    if (IS_ERR(ev_fd_ctx))
>>>> -        return PTR_ERR(ev_fd_ctx);
>>>> +    if (IS_ERR(ev_fd_ctx)) {
>>>> +        ret = PTR_ERR(ev_fd_ctx);
>>>> +        goto err_fdget;
>>>> +    }
>>>>          entry = kzalloc(sizeof(*entry), GFP_KERNEL);
>>>>        if (!entry) {
>>>> -        eventfd_ctx_put(ev_fd_ctx);
>>>> -        return -ENOMEM;
>>>> +        ret = -ENOMEM;
>>>> +        goto err_kzalloc;
>>>>        }
>>>>        entry->syncobj = syncobj;
>>>>        entry->ev_fd_ctx = ev_fd_ctx;
>>>> @@ -1496,6 +1499,12 @@ drm_syncobj_eventfd_ioctl(struct drm_device
>>>> *dev, void *data,
>>>>        drm_syncobj_put(syncobj);
>>>>          return 0;
>>>> +
>>>> +err_kzalloc:
>>>> +    eventfd_ctx_put(ev_fd_ctx);
>>>> +err_fdget:
>>>> +    drm_syncobj_put(syncobj);
>>>> +    return ret;
>>>>    }
>>>>      int
>>> Easy enough to review while browsing the list:
>>>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Looks reasonable to me as well.
>>
>> Reviewed-by. Christian König <christian.koenig@amd.com>
> Thanks!
>
>> CC: stable?
> Yes, I think we should. 6.6 and 6.10
>
>> Let me know when you need someone to push it to drm-misc-fixes.
> Anytime is good, no rush for this one.

Done.

Christian.

>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Tvrtko

