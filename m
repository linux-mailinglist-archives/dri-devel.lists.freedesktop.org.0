Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFC9A9F81B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 20:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDA610E674;
	Mon, 28 Apr 2025 18:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E/J3NzNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A4910E674
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 18:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cjr0APyWd6H0z5XBixR/0xt5FDY66M7WUiSoDaOGkyepFDvgtVl8/f7OZh6kz/U9yaXRqDf8bH6+rYPzIg/AHRetn2h+PHL70TEDs21/1ORMBpn5fwchMg7sN4S8sSyxizxJNGer/VIAsH+fEvfJaMAukOizStwSQIu4FZ+8vlIPOZIDcPNoCEZ2rOem+xUO89QqkcC/yCE/3iYP+o9VyTviwISPnKnIicnCeOWh99nBHAWz25HI9cL8G80FznBQ4twlQgQgGCEOT3r9zACShrbX/uDneKSvgTebipWKpDbkMx1V+9HAuek2BUmI/2W7TUZ3b8mfsv1bA0R2Q0QduQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlMi/3FUO8WUNTK4IF98zqRjDLCEsMfIvqnsU0jjCbM=;
 b=qbcyR1LOkzyHpxo9bHggTdxuZ4MUSwz+MNb2PSw4NuBFTdZH1Z7aH7Vl6zWvDXnrDDcJGyrXLBIrRytE8Yz8k7lhzFBnmDvVO9Gl7EmOiKm1QP42LPk3ENhbnzLsIztnzWiwghuoaWEfszBSh1ozNmoq/kEO7o99wGIIpnF1XrzsyFYtthLIZITIA/fpMv6nw6VLzRgrUQnzQBZn58j6dzXfE6ioaSsfrWclFyykZrbM0UeGg8qfjO1LESELAKtScaBspIaZ3Aj2P4doP4JJAtzbamsAh8zUWPRjE3ZjIeWPESxPp2SG4c06DJ9W4NDIfZZwIAykR1ZLUJkgYKpvNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlMi/3FUO8WUNTK4IF98zqRjDLCEsMfIvqnsU0jjCbM=;
 b=E/J3NzNaj1gqXaE2acADp7KJwNSc2Et0pTtzQQ+t0owWcYRwEylnNAqphZLKFqwDP6aMLKb5874Z27fFg6zb10TO6lqGhX/hy55ULIfRpDet8Kp5lCHUE0RR8UjJESl3v3TBZzLImdTMS5fdyAXXG0nWygCV6dtD2zgUpx9N7bU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 18:11:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 18:11:28 +0000
Message-ID: <32422e33-01be-4651-a75e-d98718d86fd5@amd.com>
Date: Mon, 28 Apr 2025 20:11:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [PATCH] drm/fdinfo: Protect against driver unbind
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: "kernel-dev@igalia.com" <kernel-dev@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20250418162512.72324-1-tvrtko.ursulin@igalia.com>
 <PH7PR12MB5685C40A8B0058293A9A8AE783BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <9b3e27d6-724f-4fca-8214-3a3bd7053995@igalia.com>
 <dfc4a23b-00eb-4835-9683-154c5d7f516e@amd.com>
 <9a82376d-a650-47ec-83cb-dd481741f8bd@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9a82376d-a650-47ec-83cb-dd481741f8bd@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b9::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d86e55b-2666-4c5b-c214-08dd86801869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHJsb3VOdUVia044Ym0yeWFGQkhFUzhDd0o1dVZCVUhabXNHUFZLU1B1amFR?=
 =?utf-8?B?enlyTDJSTE1lNTdPQ3l4WlJQYTNNWVdFdUdyNjNENm0veE1MNUJrTGFCcmhV?=
 =?utf-8?B?Vm9rbUx2UFNYRENCaHVYU2p0Y2NQSlhTTXBMNXhuVUtnRWdRaFNmamlPU3Ey?=
 =?utf-8?B?UGc1M0Vld2dpTk9HRDB3Q1RrUHBXb0tZaDExOGV3VkRoNkpmSmdldzRMRTJZ?=
 =?utf-8?B?QStyOWNRbUNUM3lDdGJTRkZvbE5HS1JqQUErenJvRkErbUdOWCtibEw2Z3hm?=
 =?utf-8?B?UnJ4N2NPY2pOVDVQNjNUTXcyZTZzK3ZJZU9TUVNjNDFDZzU3TTU2cEhHdDJy?=
 =?utf-8?B?dnpEYjNPRjFjaUFjV0NPU1dSU2dBL2x1aXRxQm1HbEl4WTArV0hmZUZlSHV4?=
 =?utf-8?B?YjhqWUFhUFlPaTB4c3pveXc5U3VDV01kOXl5bjBkOFM2aFZEWFdxSkVONDBX?=
 =?utf-8?B?NU5YYU94bW5tTGJ0cHlOTXJBd3liNjVpRDdHUlFRRVRDcXZoVFRYRysyVWZn?=
 =?utf-8?B?ZFloVG5yT1VyejJqY0VvVzNRZFZrOGZZTG9SU2tzZjBuMHFYcEtDRlBWeXR3?=
 =?utf-8?B?ZmJtTjdEd0VBWlUycDdKc0ROYWxyZUl5MlRraGZOdWRVZ0pXUlZZZk41YXMz?=
 =?utf-8?B?emlIZWY3cFBrSTR6U1F3RnhtVXRQTlJmcnFPVW9YUkVvQ2hKRXAvMk90Y3ky?=
 =?utf-8?B?ZldJaUJzSkpxYndCdXpQeGdVbDB1dU5vZDBDYTJZYmVPVENqN2lFRjJxbm4v?=
 =?utf-8?B?TDM4WW14Sm1yVGdHMVE0SThDTTdsOVZOL3g2dkltRmFZODdsaEN1VUZCakpo?=
 =?utf-8?B?aGRGQ1NxeDdySmJRNUtBTXFScDhvaitva3lsWXRna3dBZVlCWVR6dU5sN2lh?=
 =?utf-8?B?aGU5WXUybWR1NDJqdzZHaHNueGt2V2F5YW9nS1JRRTJEUGM4NE5reHpiT2Ix?=
 =?utf-8?B?RGp6MWFqbWxsMWZvMkIrZmNTNXV0YjRtdmFscWU5VHQyanRkMkRYUFV2eGJH?=
 =?utf-8?B?V3ZON3kxTUxLc0NGNXQ5eWE5d0dZc3ZRZlpxS0FGaXh1TWdLUGFUQ2Q3YzdS?=
 =?utf-8?B?QWtGenUxQ2lXVTYwUUppanZNdVhJYVprWDJ0anVZdzhxdTdLcWJEOGVRRWRL?=
 =?utf-8?B?VnB6NEgxR1BGQW1heXdJdGJPWXk5OEdFU3VxVi9wQnlqSTVPMEcyd29GMnRQ?=
 =?utf-8?B?d281NlNUVzBGN3p5VVVjRVRhbnR2dnBGS0k2SERsdEtnQjlsbVNBdWlnaXdw?=
 =?utf-8?B?L3RkdG9RWVRZb2tKZGZOa1NSZmU5UEhoSFpZSGZ4b0Y1K01ZOTFOa2VnbE1r?=
 =?utf-8?B?NDNBU0ZBK09PZklrM1VOdmZ3U3dTSDZQRFdHQm40blRpVFpBMjl2NFQzUWFp?=
 =?utf-8?B?OHo1UFlsRjExMW5RUGpnYnNnZXd3Nk9zUng1Z0JtdHVGSm5yWWVVUG8vSXpR?=
 =?utf-8?B?ZGx1ZmR5cStDRGRZbnBxSHNkZ3NJSmFjTDF1WkhVRjZtT09hb2F5RXdWSzlM?=
 =?utf-8?B?N3kvTGxjbmIweldqaDFaUzRodlp5bkNqZkR6YTdlOUhSbXRQVjM5clBGbjBN?=
 =?utf-8?B?ZDlWeXJReDJIRDIxUHZkSEw5aTR0eUFyNnloVVRYRUx6UUhBeVJFVkZrTkVS?=
 =?utf-8?B?QkF0NkRUcVJ6eTBkcUZuMmZvU0J5anZJeSs4TWt4SjA5WkRMVzlhZ0J0dHND?=
 =?utf-8?B?TE9QZGZQbm0xMjltYW85YlZLcFlKdndHaG1tWVF2Qy82azh4UGo3MmdRdWZJ?=
 =?utf-8?B?a3ZRaVFESmN6a1dRcnVQRmxNYVM4MGRrMDZYL1JHaUpvRHZxc0RoSGJJbU40?=
 =?utf-8?B?WHFUUmpZK3BSSFQyaW10b0hDOC84czUrRXhhMGZPakNETThDZDdyb2hUZDNI?=
 =?utf-8?B?Rmd2ZnBISXYrdVZ1TjVZaFg1SzZDVE5Nc2c1VGNKWWozc0paN3VJS1JQTlNh?=
 =?utf-8?Q?zZ5uVuj2F/E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJwVmJUT0t6Q3dMZ2lkeVhkRHRRZ29zMTFDMXVhc0ZkWFNveTFMemprYk5w?=
 =?utf-8?B?U2d0TitTejZadGdQQmxnYkEvc1pCVXFzNTZLSi9VYnc4bHBOTGdzVkZ6SkJ4?=
 =?utf-8?B?bWJpR0s4aU01SzBrUFR6Z01lTGdXZzc3R1QvQjJ5U3RYaWswcnQ5Qk54THpZ?=
 =?utf-8?B?Um1xak1jU3BaVGtmSE5pdzhJSTBBYkxuK0FmaFZpbUp5U1FiR3BTRVhRdVpa?=
 =?utf-8?B?Zy9MTnBmZTNsS2dUdWN6YlZodFZralA2Vk1TSUhOTFVBNEtQL2ZycU9hdi95?=
 =?utf-8?B?WTVPSTJPaE1WODd1T2lLU1BuOUQ4Znk0RHVGOXplck9FaC9TaGNGRitZSmJN?=
 =?utf-8?B?RVVHMXNtK1YzRUZsdDBINCsxRGpGSm91eWpxekJFSlJOdStUKzJzdXdqM2NM?=
 =?utf-8?B?cGhJVlBNakJ6SEFnMnVaeHh3NGI1RjZXdHpvaFNjN3AwMXFRSms2ZjUwOE1w?=
 =?utf-8?B?MlVyU2JqZkpmb2FKQlErY0RyaHo5ckdMTmowbG5pNHpNTDI0c0dVaUdnNE9j?=
 =?utf-8?B?TlZrRzIzUDZQR2hrOTI0MFZWcEliUHI0a2VhWGpnUm01bXBHcGNXN0ZPOVBF?=
 =?utf-8?B?K3Nyb0NLVTBMa0FxelE0M2tJUVNQK0QvUStHcEhmSCsvdkVidkdDb0lORUJo?=
 =?utf-8?B?UVhlWlVuTEl3bCsyVjZuYkVKZkhKRjZaOHFnREN2dTg5Y2xjY2c3OVRJbDVQ?=
 =?utf-8?B?UVZVdHErWHg5U1JDL1VYK0hsU0g2YUxKVEpjNDRwYzZtcytWbXhIdVNPRWZY?=
 =?utf-8?B?bXRlMXc0MXRmK3NJMlFmNnJjaGt0bXptS3FkZ243MG4yZEFqWXhacXBOYTVG?=
 =?utf-8?B?QUtSSVVhVllTem1rL3d4bkIwMUVYOWFkN1JVbGo1NjgveHNwR3BQazFWTjFy?=
 =?utf-8?B?ZTFQSWZvQVc5SWJ5Y3VEYy8zZ1ZZa2pER1JjTGJVN3ZnanU4Ynk3b1dyL01l?=
 =?utf-8?B?cWVUODV4MUZxL3JPOUMxbXFYQ1RQVzhmZDRUNmdmT2NhRm9rRmduRDZtZXA5?=
 =?utf-8?B?YVI4MWFta2tldVZjWlBZTzF4RldreUZ0WXNkSXNlYkNMTmQzQXMvRjBCYlJi?=
 =?utf-8?B?eCtvS2YwYU1PMCtRL0ZEcFVxYmlqWXVDdFAvQmxKZWNYWk0rMzlrME5uRVZL?=
 =?utf-8?B?aTk4QlcrN2RLakIrRmdOdzJiT2o1OTFHbTJWUWxSS1ZWSDZWekxIM3Izd2ov?=
 =?utf-8?B?QTl3bzc0emY3Wi91b3V3emw0b1VFMGFiWkVma09Mc01MWmFtZjR5Y2ZlSXNL?=
 =?utf-8?B?VWRtODV3VDVsQTRWbG8yMGhua3kvRk81SXI2R3I4WFRCa0lSbThSeVpsa01u?=
 =?utf-8?B?QnppcWtSYjRDV1o2MDhwRnRaWkhYT0lucnRBaTlxU0F3UU5JSWVDVDZSa2Z0?=
 =?utf-8?B?MEtIS3RDTmQ5dEF0MTdvWmFhbFZrQkZMaDBaeTROZ3B1U2ZkL3dMMkhRM0Vv?=
 =?utf-8?B?WXViUDF3dTJ3ZlYxZm41ekVXem5XUEd6bTc4QXd2eWE5SlNFYmNsWFJjRVNE?=
 =?utf-8?B?SFUzdTJMeXhXcmtmRDNQc1pqaUdzNkNEcnkyMkkycVpNRllteGdwRWJxQXVV?=
 =?utf-8?B?RDRpY1VXRktMcE5hVUc0TGpNdGZicHBJK0d0UnFRL0cwUm9NU0VqZmljVFBO?=
 =?utf-8?B?OVNLbFlpUVFzY3pocnliM2Q0OHFyazQ5RCtaWi9PZjNKZnZmY2Y0U1UxdUJU?=
 =?utf-8?B?ZnRUQitaeW13SGRmc2hWeEZIV0xPV3Z5cklycVBFQksrOFZkZUFVUXhiTm1i?=
 =?utf-8?B?ZHdOa1RHTTFLekNGeXpJZFV3RW95NmxWR0ZRaWlKbXA3WjZnWXJyWnh3Sk1M?=
 =?utf-8?B?MWpHSG5kZGxYRFViY2QzTDNKa2J0eUd3RWVzY2lzYXNuaUJFUDF3QzMwVXlB?=
 =?utf-8?B?TmtMbEU1bEtFNDlNNTJzVitpLzhxZUZuSXlRa0xDWW9IWVp4d3pvTEcwWm4v?=
 =?utf-8?B?SXZUWWxzYjlrb3c2ZktjK3dHUjRnSVI1M3pHdVFGVnp0ZXpZdUxRZGhZVnhq?=
 =?utf-8?B?TlpJUE9uSmtuWHZkbzZ6d09yWWVMWkNtNHlNaHZ5V1dGUXVuNjZHdFBTMS84?=
 =?utf-8?B?VGlxbmxtR3lyZnkvUU9aZXpybUpFZWNSTjQyTlliOUlTQS9oL0h0RFc3dUoy?=
 =?utf-8?Q?p9Ol+dHtM4f+kZe8/BsCPv446?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d86e55b-2666-4c5b-c214-08dd86801869
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 18:11:28.1936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZEIRFH/ZOMQfOrqWi/PU1AmbDHIkOpX0lvP+kem6gcTzMpeIfEQk9Oaa0K5C7dB5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

Sorry for the delay, had a few days off last week.

Patch was pushed to drm-misc-fixes a minute ago.

Regards,
Christian.

On 4/25/25 16:58, Tvrtko Ursulin wrote:
> 
> + Thomas, AFAICT you are handling drm-misc-fixes this round - are you okay to take this patch with Christian's rb?
> 
> Regards,
> 
> Tvrtko
> 
> On 23/04/2025 13:57, Christian König wrote:
>> On 4/22/25 17:10, Tvrtko Ursulin wrote:
>>>
>>> On 22/04/2025 10:20, Koenig, Christian wrote:
>>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Thanks!
>>>
>>> I could also add:
>>>
>>> Fixes: 3f09a0cd4ea3 ("drm: Add common fdinfo helper")
>>> Cc: <stable@vger.kernel.org> # v6.5+
>>>
>>> With a disclaimer that the problem predates the common helper. Not sure if it is worth it for such an edge case.
>>>
>>> I was planning to merge to drm-misc-next, but if I add the stable tag it would be drm-misc-fixes right?
>>
>> Yeah even without the CC:stable tag that is clearly something for the -fixes branch I would say.
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> ________________________________________
>>>> Von: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Gesendet: Freitag, 18. April 2025 18:25
>>>> An: dri-devel@lists.freedesktop.org
>>>> Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian; Lucas De Marchi; Rodrigo Vivi; Umesh Nerlige Ramappa
>>>> Betreff: [PATCH] drm/fdinfo: Protect against driver unbind
>>>>
>>>> If we unbind a driver from the PCI device with an active DRM client,
>>>> subsequent read of the fdinfo data associated with the file descriptor in
>>>> question will not end well.
>>>>
>>>> Protect the path with a drm_dev_enter/exit() pair.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_file.c | 6 ++++++
>>>>    1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index c299cd94d3f7..cf2463090d3a 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -964,6 +964,10 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>>>           struct drm_file *file = f->private_data;
>>>>           struct drm_device *dev = file->minor->dev;
>>>>           struct drm_printer p = drm_seq_file_printer(m);
>>>> +       int idx;
>>>> +
>>>> +       if (!drm_dev_enter(dev, &idx))
>>>> +               return;
>>>>
>>>>           drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
>>>>           drm_printf(&p, "drm-client-id:\t%llu\n", file->client_id);
>>>> @@ -983,6 +987,8 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>>>
>>>>           if (dev->driver->show_fdinfo)
>>>>                   dev->driver->show_fdinfo(&p, file);
>>>> +
>>>> +       drm_dev_exit(idx);
>>>>    }
>>>>    EXPORT_SYMBOL(drm_show_fdinfo);
>>>>
>>>> -- 
>>>> 2.48.0
>>>>
>>>
>>
> 

