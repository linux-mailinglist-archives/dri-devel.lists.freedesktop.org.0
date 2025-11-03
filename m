Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30630C2DE1C
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 20:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DE110E45E;
	Mon,  3 Nov 2025 19:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r+Nt/9rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013007.outbound.protection.outlook.com
 [40.93.196.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B423C10E1AE;
 Mon,  3 Nov 2025 19:21:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hptGP8HqEnNQ4ul7FouC9KwYJKtTcJltDHldzgobORtf89iEHI1wiAospbbIkS+INl5h3aDtI5yAMX2Ss6UqhQEQyRurZSe/xqhh8gN4lGYbToekZmo/KxG2DWzGBwaIqXcD8gybcSsvFIUlIMVaMpk1KmAEmi4izG/V2ytCmKrlMEBRZ8cIszdd36tyTR3gu2s0F7b572rWrgSFI40d1EpyM9F0MMyGdpQKaSUOY2N/OyzyxMhtuSo8tM8oP+jHZFc0m0bFi+G9X69SlSaSZg2MCfHKlxyPt7FZx0+QVuA5WQqPU+pGbNXkcyyx+lpE173VmRrOEnbyLtq04FDdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XkRmv2Z8PfoSUE353r6UQ5BTshJFdBmBR/2amC0Opg=;
 b=giSkm/P8Og6UmMacARzeErUKbj73qsK0KCIBcw5FL+TFJM6mHp1+0bAZfgOilAgACnm/uuEs/Cdx3b8FSitymvpB53XXddMo6VQS61dB53F5E5C44+NENQpoZeEQQ51IDL7IWiIODML5VB39q3M1GrPo6bSq3iANoYAB7RVUJaYBPbZc1UgfS7UjUiUmx0v3uN7FOgbfE5NrFv85gpYiKTovOtTILNf5WXTG/QUqSDG3JzSMXwk7fxZeDaxACztsR/Zw4rqHP3HVvUAhfrfdkV/SLoi/Yv9SwHXGhEi1udOKTZviHa0yZo5qw8gumV6aQRrYoZzoRWucbPrCPfHwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XkRmv2Z8PfoSUE353r6UQ5BTshJFdBmBR/2amC0Opg=;
 b=r+Nt/9rkurdzFQ753jl8SnWs0GC40A2hWMi43ijMi2yE0FL+ki8O3+2dpWC5O9Dtbsn6rcijd/+GhNX1IqeM/1rWsKjOhA3YW0xEoa3RTqJg2QmwhdzeeH2UpULHcmYsiOfG5TOZuR5LxQyKwgangoYS0MqNiBS6ZKFTylbv/drnEa40WbOOUcUQx9DMpXAakV2s1l0AEcFIGl6l3vmODkWf9TEigjM1qIQrNeFv5QT7SsNs7ZYmrKdZSNiZ44lpzFTykppP5dArMNVyQhYl/HQrMdyfHFNEWNVhdSyTTdl3I/NcO6lb1U9r0JzhqsjBxjHoSv4hNaYLSZCmTYIktA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 19:21:33 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 19:21:33 +0000
Message-ID: <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
Date: Mon, 3 Nov 2025 14:21:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 1682a71d-95af-4a58-103e-08de1b0e32e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0s2SFhnZGlGUjd0UzZZSWtRN25FVTEzbmFPQnVWSUhvZlU1Sld3V0xDbTNQ?=
 =?utf-8?B?bXlEM3ZVWHRPV1BpcjN4UlQwbGFIZXNraXN2ZERmN1dORFg5d09IZkhRRVp6?=
 =?utf-8?B?b2dZbFVZR2FVR0hYNkErc3F0QnpzeGNEU2NPRnI2aEZuaFYvdWR0ZnViRWs4?=
 =?utf-8?B?a3RtNHNqbnA1aXhrVzZGNGpqZnJELzdRRm0vUGZQbzlKVkViUjhqS0pjTGF0?=
 =?utf-8?B?M2cvU0djc2FaNE5SWStkcjlnekpXN3h0cnBnREwyR3lhSVRSWmd1aWpYSC8y?=
 =?utf-8?B?Z3ZSZVNXU3orZDdkdHZqMkpBYysvK0kweUo2WDBGZlVYdUZrNFU1MTJNeHZJ?=
 =?utf-8?B?Rzh0OGQ4N1IvdGNhcDlZYndUQ2tjRFVka0xGelJBUFlCZFNNeFVQRmp1Z1FM?=
 =?utf-8?B?dWd3NEFDZnFzbVJ2Q1ByUDdodlc1VWQ0VXI1SjJMcTNjRnJocjhOSTlYYXk1?=
 =?utf-8?B?QWxnNjAyU0l6UnpzSTZlTFQvd0lZT0I4dkNYUDBHQkpMc2VMSGc3cmhRZkJH?=
 =?utf-8?B?RW5pVG9EZktiRnY1TDJwZnRVUXNkY0dOT0k5b2dzK1lWTWFDUnlNV3pJa1dY?=
 =?utf-8?B?QlJHZmxmVXdhRis4UzJ5cUxEOVlsUUZsRUtjUUNBVXhvMWc1SWpnYzljMVhM?=
 =?utf-8?B?dlRKdy9CRVExc0ZtZFQvOGJvRndLU1VBa3A2VmdLSUZIT2pUOWgrTzF1Zms0?=
 =?utf-8?B?NS9zQ0R3T0ZKTk4rUGhWcWdIeGR6eDFSblpZR0JCTjlaRFhscE1XSHNrTDJ1?=
 =?utf-8?B?dVNudUIzTnltTmxnRHlnb2ZUWG9vZFF3NlBOSHRuL0JKQjVCT20zNGhIbDlx?=
 =?utf-8?B?c210dy96MnpVLzFud2IxSmpvbnZzbjlkZ0EvMHRMaVhDVnFnL0UwV2ExSndh?=
 =?utf-8?B?eVhpdVFiOVdJRDFRK0dSNmQ3L0RwQmFwUCs1S3lmMFd6YUNqQVRBSlYvWW9Y?=
 =?utf-8?B?Mk9oZEI4azNRbGRLMlpwM0JnZk51THRzZnhOeUFDbEhzRkNaRjF2SytqU2Z1?=
 =?utf-8?B?elJvRytSQzlQS3V3b2UwclNMandTeE1hOXdFZEJJN2g5OWFxTWhnUEk4K1Bx?=
 =?utf-8?B?MVhjWnBHUE1HRlNaYUMzMHlmczE5bTQzRnhteFNXdGVhalA2cXZEbVJuSmUy?=
 =?utf-8?B?SEVDQTRaTU51Rm15VjFuRFZPem91cENDampLeVFOZ0dXYW5TUnBpV3lHY2NF?=
 =?utf-8?B?enM3QzI5L2NZWUpsUTdqdGg3Q0JIMmpmWGNMM1A0d240TzVRT3NNOE5Fdmsv?=
 =?utf-8?B?Q2FOQUFzaDdOVGR0d01zeXQ2Y0s5L2ZycnhVZCt1SjdDL0Y1dnUzYlJhZGY2?=
 =?utf-8?B?cVRFd2lnbUN6ekJYVkpEN3IxNFp2QkdjWGVyVkRFMjVLaXUwd1RRYk41SU15?=
 =?utf-8?B?NnJDVzUralFSMzk5MVE2cC8vamZBZEd3YlVJU3BUd3ZtZE9kUTl5Z3llY2pB?=
 =?utf-8?B?N3VySXd4TmFmT0laL0NSR0lqNHd3RnovTGd2ckRiZTVKU0EyL1NtRGFKVVNX?=
 =?utf-8?B?emwyVGJFQzRYZklFLzVRLzBGeVBzb0JEQzdQb1h2bkg1WXlVNU51QnN2SVht?=
 =?utf-8?B?TUxOUjJZemxvL2dwbXNpemtYNDB1Q1Fva1RYa1VPcU1yT2k4bitJbkhuOXox?=
 =?utf-8?B?TTFpd2hMUVIySFN3UlBDMW1wVE1YMG5QMUhLdlVMN0NFaEV1RkJDV3hPbDhI?=
 =?utf-8?B?R3lOZjB3ajdPNDlDQmtZVk5ESktOQUVjSnJQeGZleENXeXNONjl3d0RVODZs?=
 =?utf-8?B?SzlPVVBHT2lLYzRZdFdSRVgrTThGeUhSaWdpUTBoQ1dieEgzZlhqMUV1cFlr?=
 =?utf-8?B?Tkd2QmZJSCtNWGhlRzZ1dklZNFJPMEI1MkhSY0c0UnJrZWFNTkNpQWtocTlX?=
 =?utf-8?B?dGhENHRpbi80QTh4cHpxWkg3MkFzWkRxVVRoK0hlby9YYWhjbkw2Y1JneUhn?=
 =?utf-8?Q?R0AlCm3luzs7GzPaEMt3+xsDh6QRnQJC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pWSkRmWkU4ai9lWU80Tko4SkdVWWJMYTJLaU1IU2lILzRoMk5KTktnVWZp?=
 =?utf-8?B?UGlHRkduRWZ3NWg1a1dlWE5uU0tkSXRwQWlMYWlwZlNWR29rSWN0bFpqZzhy?=
 =?utf-8?B?QjZwVHZOdkw3dDBFWmRsbnp5RXhUR3BUU1B6NTQ4MDhOQTZFU3VDTDZGU3k2?=
 =?utf-8?B?bktyWHhIR0RaeVVsSEN4ZXlySU9zNTc0Z2V6NXFJUEQ2SnJiZDREZStnUlFT?=
 =?utf-8?B?enp6M2lqZHU1NXRpSitKbG53WUtXNkUzTlMwY20wamc0MEFHaEtXamVlaWln?=
 =?utf-8?B?WkNOb01LNUlLSWZKbnFpQjBNbEovbWxveTBqWUFNQVZJcHA3SStZUllWUVFW?=
 =?utf-8?B?amhZU0I0aVdJdHBtVGdXbFNiZGgvdDZlZmhqeXN2RGpqVGU3WHQwd29Cb1o4?=
 =?utf-8?B?NFBrdVVlQ2ZkRGhqS2Nkckw3SkVaVWs0N2VkbE1LYWQrTkdMNG10TVFmZTE2?=
 =?utf-8?B?L3BGbTVRckk1ayttUVpoWHlZbUdYOFNRQnpVbUo1cUlLMlFXdTdtRCtVTllq?=
 =?utf-8?B?LzZvS09lbXlIY05IbU5CMkhoVmRPY3J4U2dTOG9sd2Z0V0RTZDlreUNtZFhB?=
 =?utf-8?B?cUhpM1VRb0FmVnlOSzYvbGpiaER3bURKdkhPbmV4dVp5dk4xTXpBS1dxL1hO?=
 =?utf-8?B?ZVRRK0ZNcGtnMzc2a3MzOXBheTRlbEZsbzFOYmNiQ2c4b2drVFpNZm9jVENY?=
 =?utf-8?B?ZTRlL2doQ2hma05FVkZqaEY4em1nMm1FTXdZdnJud2JSdnVJVWtKWWFkNHJa?=
 =?utf-8?B?MjZJcWYwd2xCVUxWNjJrZ1ZoV3p1QjlYSExrS0xYYkhQKzl5QUF2cGc1Z3U1?=
 =?utf-8?B?dysySTQwRkFxc2hSZzROM3hkSzVSNHVmNktlR08vajlxQWZJSkMvSU1yRVlR?=
 =?utf-8?B?ZWRZdEMxRXp3Z0M1VVR4UkdIQUxwUXowQWV5YW5qWHNhZTFsem5QMEJMR2Mr?=
 =?utf-8?B?RlRBVU8rSDA0VzBGMHpCYnl0VE5kakRNUmtvQ0x3QkRmdzlsYzRsTUMxaTFi?=
 =?utf-8?B?SVlXN2xUUEwzQ1Y1bTNVUVllOGRLWFgvaUs3Tk5KdS9mWmpmcWkzd0lueG50?=
 =?utf-8?B?OW1GdEw1cjdtNTVGakdOZnQ1Sy9DdEZ2anVSd0E5TjdmSUZQN1Z6QkVYQ2tV?=
 =?utf-8?B?aTMyYmhRY21lUmJSdHFkYmhRS3lzUFN4dXA5d3lXKy80NEVNYk1SQTBvZ3lj?=
 =?utf-8?B?RW5MbGErcy9pcG1HZmttcjRadlk5a0xBaFFRc0pzMjdiT2E0RnFDNWdxRFV6?=
 =?utf-8?B?TmhiNzNkVmVjbEdwQnlUSHBKVDlXcXh0eVhadzJ6dXFrTXAwTUN5NmRJMlhm?=
 =?utf-8?B?MWR6R2F0Z2x0TjlEMjJaNXBvMTRSRmNlN1N5K0dFcEpBQ2l3aFRsTDNkUVRS?=
 =?utf-8?B?Z2ZmeFRDcjVPTldzdWY2L1VmSytvWENFMEg4MDMrT0VDUFVHTUlacTRIc1pT?=
 =?utf-8?B?bGkwelJSbTh1bThjSlNGZDYvOHNyczF1L1QvS3dtN1RwcFdKd0JGS08rYTln?=
 =?utf-8?B?eFU5bjdKUjA1dFVVNEFpdHdmSVRvMWRpSGx6R1d5WjdxS1loWjd5V0tMNS9r?=
 =?utf-8?B?bkViQTVVRjdCMmxLcHZXNW9YdFRSbHZoUWZ3cldGRHBmanYwUXpreHBxUksr?=
 =?utf-8?B?Ni9zYjhjTEt2eVhvWnkwTkdKdkYrQS9GdDR1YTJSODhONG9VekdyaW5aR1Yv?=
 =?utf-8?B?Vk10NHZoUzRpMWF1RkdIVHZTb0JMakZKcjZGODFCQWlJcjFuTXBQajU1MURB?=
 =?utf-8?B?UUdwQllWL09lRXQyQUg0Z0dEdlZXd2NmUW1zYnZJY3Z3U0xxRzFuUkhhSDlJ?=
 =?utf-8?B?VGdKUDFBV2JMSGlmN1k2MHU3RVZzdU8wbmovYS9sSVlzVnpVazR3allNNS9G?=
 =?utf-8?B?UUZKMGxQMzRsYzFTcCtmRHpyU0MrYzhGSDVINVVMdnVaNHRkUlBqUGEzWDc0?=
 =?utf-8?B?cnhwYnJOQjM5N0hIVU9BZUtCclRVWk1RNC92UHF3WWJXOE9SSFRDWnpTWWVx?=
 =?utf-8?B?VzdKeXgzQTNKRElkaXB3L1BwYUgvRUFzMjJ4UXpTTlRNRGtvajE2OSswRUF0?=
 =?utf-8?B?UEs1WGp6bnQzY1AvSTA3QkZubHBkRXgxaEhsZVl4Vm5uYjMvVjkrdm9vNXJQ?=
 =?utf-8?B?N2tqVU1FeWQ2V1RUNFhhcEp3MGx3WE5PL2h0cXZVUnpOZWZEdUNmUFJ1SEVq?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1682a71d-95af-4a58-103e-08de1b0e32e6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 19:21:33.2734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +b4lwL5U9NQ2AQdo3p6Uci3nd4pjLk5xbGfAwMKXc8mnbri8db5m2KZ965mzX/OV9o+kTDWqk+X8MkagkFdYFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230
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

Hi Miguel,

On 10/20/2025 5:30 PM, Miguel Ojeda wrote:
> Hi Joel,
> 
> A few nits below (I do sometimes this kind of docs review to try to
> keep a consistent style across all Rust code).

Thanks a lot for these, I studied all of the suggestions and agree with them.
May I also suggest to add some of these suggestions to the kernel rust coding
guidelines document, that way others new to sending rust kernel patches don't
miss it (example not adding a period at the end of a markdown doc header.). But
I will make it a point to check all my patches to make sure it confirms to the
suggestions.

Also a lot of your suggestions are related to how it looks it rustdoc, so I will
try to build rustdoc and see what it looks like as well, to get an idea of when
things in my patches could be improved.

thanks,

 - Joel


> 
> On Mon, Oct 20, 2025 at 8:56 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> +//!     .set_table_frame_number(new_table.frame_number());
>> +//! // Call a function to write PDE to VRAM address
> 
> Newline between these. Period ad the end.
> 
>> +//! ## Given a PTE, Get or allocate a PFN (page frame number).
> 
> In headers, no period at the end. Also, is "Get" intended to be capitalized?
> 
>> +//!     // Call a function to read 64-bit PTE value from VRAM address
> 
> Period at the end too (more of these elsewhere).
> 
>> +//!     if pte.valid() {
>> +//!         // Return physical frame number from existing mapping
>> +//!         Ok(Pfn::new(pte.frame_number()))
> 
> Early returns where possible, like in C, i.e. to avoid indentation on
> big `else` branches.
> 
>> +/// Memory size constants
>> +pub(crate) const KB: usize = 1024;
>> +pub(crate) const MB: usize = KB * 1024;
> 
> The docs will only apply to the first item, so this probably was meant
> to be a `//` instead of a `///`.
> 
> Or you could use a module to contain these (and then possibly `use`
> them outside), and then you can have docs in the module itself, but
> that is heavier.
> 
>> +/// Page size: 4 KiB
>> +pub(crate) const PAGE_SIZE: usize = 4 * KB;
> 
> `rustdoc` would eventually render the value and the non-evaluated
> expression, and in the source code it already says `4 * KB`, so I
> think repeating the value isn't needed, unless you mean to show it is
> really a multiple of 2.
> 
>> +pub(crate) enum PageTableLevel {
>> +    Pdb, // Level 0 - Page Directory Base
>> +    L1,  // Level 1
>> +    L2,  // Level 2
>> +    L3,  // Level 3 - Dual PDE (128-bit entries)
>> +    L4,  // Level 4 - PTEs
> 
> In this case, I think you meant the other way around, i.e. actual
> docs: `///` instead of `//`.
> 
> (Also, unless there is a particular reason (e.g. it is a big table),
> please generally put comments on top of things, not at the side, which
> matches closer to what is needed for docs.)
> 
>> +    /// Convert an Address to a frame number.
> 
> These should eventually be intra-doc links, but at least please use
> for the moment backticks when referring to Rust items like types etc.
> 
>> +    /// # Example
> 
> We always use the plural for these section headers, even if there is a
> single item (e.g. single example).
> 
>> +    /// ```no_run
>> +    /// let va = VirtualAddress::default();
>> +    /// let pte_idx = va.level_index(PageTableLevel::L4);
>> +    /// ```
> 
> This will need some `use` lines -- not needed now, but just as a
> reminder that these will get actually built eventually.
> 
>> +    /// Get raw u64 value.
> 
> Intra-doc link or at least backticks.
> 
>> +    /// The valid bit is inverted so add an accessor to flip it.
>> +    pub(crate) fn set_valid(&self, value: bool) -> Pde {
> 
> This docs string sounds like a commit message.
> 
>> +/// Dual PDE at Level 3 - 128-bit entry containing both LPT and SPT pointers.
>> +/// Lower 64 bits = big/large page, upper 64 bits = small page.
> 
> It sounds like a few of these details should be on its own paragraph
> to avoid having them in the short description (title).
> 
>> +/// // Call a function to read dual PDE from VRAM address
>> +/// let mut dual_pde: DualPde = read_dual_pde(dpde_addr)?;
>> +/// // Call a function to allocate a page table and return its VRAM address
>> +/// let spt_addr = allocate_page_table()?;
>> +/// dual_pde.set_spt(Pfn::from(spt_addr), AperturePde::VideoMemory);
>> +/// // Call a function to write dual PDE to VRAM address
>> +/// write_dual_pde(dpde_addr, dual_pde)?;
> 
> Newlines before the comments, i.e. between "conceptual blocks".
> 
>> +    pub lpt: Pde, // Large/Big Page Table pointer (2MB pages) - bits 63:0 (lower)
>> +    pub spt: Pde, // Small Page Table pointer (4KB pages) - bits 127:64 (upper)
> 
> Docs instead of comments.
> 
>> +    /// Check if has valid Small Page Table.
> 
> Missing word?
> 
> Thanks!
> 
> Cheers,
> Miguel

