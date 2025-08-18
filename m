Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CE5B2A1D1
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 14:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0904310E43B;
	Mon, 18 Aug 2025 12:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lSDnxItp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B24B10E43B;
 Mon, 18 Aug 2025 12:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c+J+mB1C/fSh7UJBybwS6YLrSQwdR/B3A2UYk5WjEyN2Lvt/mAAjm26QiipjmlfI39A6R28/MpYVnH3O5g4sylGSB2XU84uVlUXureC2GhexDRveHie4MuRX8zv6P0TR6appRrtamS+RDaLmkh5bcHzk/UBALUIhV77dh1E9tDfV/XV/kWqxdna9xsgW5cjGpuZBL3KvY6W3NdDJn5AnE5KhBAQQ6dGIrpnXjmy8dUE2tcV+h1kJEo6JwcRqpryhsCCf0Mtj2ytvUirW3ym1wi2E6bqIJpKpJdO8aOq/eKjAiyw0plNEPlXm4ElcwSd16RBjYF+Nlvlj3kjYaVMnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQ/gsfFS0c3uUivH5NKAhmDFAfXklvyd6tkZTjQFm08=;
 b=rm3AZwrwus+B09CAfHw5fZ5ruBMEsnGrd7UaqeeA/VTQIpvAurSn9tQEKHJvvw6jau4eIpLk4XZ6w+IJ5Lcljsqosnq/ikyS0AnovXmw5k6+uu73dDF5tje2KXPewswq42hBG6QM+vfAcdQisk+AdavNvJz1hekvHOcrWeRhXIP06muD9JW2ZmKCzLyigekcGHBaIXw0ice2/BZQKa3FHZjw0J6dK390rVIfap90AIJfasSHBnciMeNRN1loZ2tWxJDFBDS02F2q+ZoBdFR7oFdc6Pt0rtQswsdI5Dru2t5StlX6QzmR0DrrtagRZtjexlAmbjf/qRWx2kYBOdDkCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQ/gsfFS0c3uUivH5NKAhmDFAfXklvyd6tkZTjQFm08=;
 b=lSDnxItpMjoettiL1RLIPnTPiuBOFWznLGbPfZEo5lm5hMkVe5b7lbObiiPZZ5Kr5FeOEZj5KTph1f42mpbzTvdEpsVXGWf+UYg5yMlRRYR/hBdyc9AXoR5Pm+t/9DroBcKM2nUHLAYX10wL1LQ+1x+vx1ryd1kwppDUQmfXW74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6768.namprd12.prod.outlook.com (2603:10b6:806:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Mon, 18 Aug
 2025 12:40:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 12:40:55 +0000
Message-ID: <6f409954-2e01-4e87-b8b7-5688bea837f6@amd.com>
Date: Mon, 18 Aug 2025 14:40:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Pin buffer while vmap'ing exported dma-buf
 objects
To: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
 oushixiong@kylinos.cn, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250818084148.212443-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250818084148.212443-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6768:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b2923f7-6e1d-42ac-f399-08ddde547945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkFHc1FJdVJUbzlnVjJEd1Btc1I2TmN1a3p6dzdPQjRpNWZMZE1kdW1Mb2Jz?=
 =?utf-8?B?ZFRMNUVjY3N4RngrRGdzYU1JbTUxNUh0WGx3eUxZamtPTmhWZGl4aUZaWG40?=
 =?utf-8?B?VktDVGNyenN0ZTB5VW1TaTZrSDJyY0lWWm84d3JmNnBOMHlFTkxUZjlyT0pj?=
 =?utf-8?B?enVEMlBvWHpsZHpQY1RxUkRTSjVuNEVoaW9hYzRnZFcyTnoyaDdGaWY5V1JN?=
 =?utf-8?B?VGdMZmdzQXJmaWhBM2Q2UWdOemxRQ1BUWSs3eEtEZ280dXZNOHVic3NERTBp?=
 =?utf-8?B?Y25uZ0V3bUs0bm10bTJUdm5EVHptd3pYRml5STY0Y3MwZDJrMkNPT0RPKzB6?=
 =?utf-8?B?V3JMQ1FqaFBGd0k5M0lIK1RFeVBCd2tBL1BMMi9DMzhJYno1c1FUcUNjYTJ4?=
 =?utf-8?B?UklTREpJRC82c3JXVW9VUWFESzE4Z1RrMkcwcTl2WmJQQjNCQUo4cGZFT0hN?=
 =?utf-8?B?NEdKRGlFaU5rSkJuMDZ6MyszMEhNclF2NWs4T0Q5NWVLVkhvcDRSdHNTTVFC?=
 =?utf-8?B?c3ZKck9sam5GKzFBMXpDSHFEb0o2aW8rcEtCMmRpaDJWL1Uxdk0zOUp6bTh4?=
 =?utf-8?B?Y1h4SjdBZXRuakx3dzIyaUh1eEFRVFZ3dDR6dm1vdWxXblA5M1FjNG9NZWMv?=
 =?utf-8?B?RVhCY0xyWlZFMGxoRExqSCtYZ0JGd0E5eEpGOUFDdENVUUNTdGZocndyM2kz?=
 =?utf-8?B?cC9GZWFkT2xnUHd2QU54OTVWWmEvaDhRb250SmFnb0NjOUhiZStlS1I3NHIv?=
 =?utf-8?B?QzJ1bit5UnhPbnJ3ZWlXR2hrN3JDcStQaTdtYmdNMW9aQ0xORmN5WW9uTHdS?=
 =?utf-8?B?MkMzZ3JwZlBYa2YrYVhtSllkdXpGQUc5dmFtMHVITm1sVjhIeEJBcnpBa2VW?=
 =?utf-8?B?T3BRMTFURVVJc0twUnZsK05BL3hWczdVRzF3a0ZLR3JYaU5Gck5jcndJbkVz?=
 =?utf-8?B?S0RKMFNuUHhqVzdzWTVhYlVadjlUcjQwUFBubktmb2h4eEtrUmNZaEZUcDlY?=
 =?utf-8?B?SzFqK2NiZUExQlhlbTV6eGVtcmJ4anNWNzNyVjZjNzNOS3VRTlJtVEJ6MW5C?=
 =?utf-8?B?SThJQ0hhei9VRXV6RzEzSFRBcFNyTFJLemtmdW9ZYXpLSklkU3RtQ0pLWm50?=
 =?utf-8?B?eThvOStaSDlsTm8zTG5Oa3RoVk9sUWdRRFBYWkdyTXczbTBQOUpYR3JISFN5?=
 =?utf-8?B?RFBrZUEvMDJCdE02Y012S1BKSDN1VnNUSXhXRitua2pOc01lOWdKckhGOFNJ?=
 =?utf-8?B?bmhKY2x6MTcyMTZSYll1Wnh1L1dqMXBySC9rQ2Q1MzBxaUJXSlVnWHV6Ky9z?=
 =?utf-8?B?MG9kQmdiREU3LzMvc3JVTUdOa2h1aHBNRXpPd0duMGNIUFBDekhRNWkxanda?=
 =?utf-8?B?NXQvZHpXTVBGSEhRYlh2N3JHYXNDUCtxa0hIVW0yd3UycEswOElzaEpLKzdp?=
 =?utf-8?B?b2dDMmVUSHBpNDJ6a2hmTHp0RmRxYkdpYU8xdVBQWUxDNjdZbTJqaGFPaG40?=
 =?utf-8?B?cEVGU3VzeFRHRDFKQlZDWWMzUXh0TmF3d0RsNE9TaGZuZ21aakh4U1loalNU?=
 =?utf-8?B?REZ6ODVJazdWaDRJZHNZT00vT2ZMaFZHbUVnVXRoVDZ3eFNTVU1mVWgyMjY4?=
 =?utf-8?B?QzVsLzhXSXVFK05VVm9rSzBOUG5laVFqUjN1ejVNYVFna0E0MHJvZ2FRaERX?=
 =?utf-8?B?M3dLYk53VE5ZK3lDUElFOHk5dTBta2FDZm02QjhxeWJsNzFzNlBNWFFHK01u?=
 =?utf-8?B?VFVFVGZudzZzMHM0S3RZd1pqYU5sdzZhb2c3VGlWZnZjODhwazlzT3A5VDM0?=
 =?utf-8?B?UURwcFh4OEhrUUlaclowVjZkQVBVaktORjlYS1gzZStpNzlJdjdBekJsMFp6?=
 =?utf-8?Q?5YG4LJIF3HTdG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGxOZzZheUI5R3NueDA1YngrM2VzeWdtazZLVmdFZGFMWmpMT0pxZFhmQ0NQ?=
 =?utf-8?B?eTNlbE8xZWVtVkEvRnRXWlo2Y2FXbmhqKzRWWjhhdG1rUzkvNTZjc2xnOEtB?=
 =?utf-8?B?R0ZZdlIyOVlqM1dEZGRQcDU2dHFWdWVPenByZkNiQlVDZFZ5TVg4SVRaMkcx?=
 =?utf-8?B?UnIvSmFuVEllSzRrQ3N1cWFNSmZvbmdPaUlPMGcxKyt2b1l0VWhoY3ZhY1l1?=
 =?utf-8?B?SVZDTGdzcm9QVlJKWG0yYlJ5WUZUUWQ2ZTUwZDBFL1NCWExnR2p2VzF0MExM?=
 =?utf-8?B?U0NtcnF1RmdoRnlnMW0wQ3NjUlZBTERVVjhYMTVFVnp0QnY3SXpQQ3ZPZXVy?=
 =?utf-8?B?NGhDVmc5ZnlWZ1FzSU1zeTI5MUtFdEs5WmxnaHVFK0V3SFlxZ3ljRU5nNFA1?=
 =?utf-8?B?N2cvWkQ0RGlnMHJnVkZLWWdBM2VweUFRVFV6Q1g4S01Qa1VRNmczWWhmUUFk?=
 =?utf-8?B?RUxKR0xGenRteUVleUF6VGcramFkTW9ydGlhOTd1WG1JWTF4dlBmdXN4a2pD?=
 =?utf-8?B?akdNRkUzMFMybEdZbUxJMGEwYzMwYXFFWk1nODdiM3VaeGZjeU0wTlErcFRk?=
 =?utf-8?B?NWZOT0ZkSm9IcHdJT2d0dGV1bnNzNEVIdlRoWE1XYUdoekhSRHduVSttSGZ3?=
 =?utf-8?B?RDI1R1NSdWgvTmxLVGdRQ2R6Q3VLUy9GcDFzb2UxR29KREhDWkZoNTJRekVq?=
 =?utf-8?B?OEJaVnZZQU5leWFRa2l2ODJjSXgyY1VselZ3VEZJYkhKSzFZQ1dGZ21JZTJk?=
 =?utf-8?B?MFFJNjM2K1J0OEY2VVpub3Q0WUUvRzNHbE9ld211QkExQm0xKzBDVVJqTUp6?=
 =?utf-8?B?ZEs4d01nU0FPK0lpUGJ3S1hHRlFkK1RuNmJKdlpRSlBUVDQyNnozd05VSFgr?=
 =?utf-8?B?TUpLaVo4bnNQeTdpa2orWlFpdFBrUVpId0ZwazBqMGZFdnY3VzVYdnVjcnM4?=
 =?utf-8?B?SkVnY3dtbDI0azFkNktOM01wUU1lQ0szMnRpRE9MWXAzN1RXMi9uS1pLS2pn?=
 =?utf-8?B?WFdYTzBrdmZXc2dKTll0b3F1TDJDbW9ZK3FEcFhwVzBoMTNIKzc1REVZZEJP?=
 =?utf-8?B?aENsQ2t2bWtwTUdUQUpmZVZHemNHVG5yRVV3WFQ2emE4WGgzQ2I4MzhjeGF6?=
 =?utf-8?B?U28xUkR2eGhHYmR1MTdkWDhTNU43dXFaOFlsWHB6ZnlxMjhxTlRWZlF6OUVk?=
 =?utf-8?B?RW96cFduKzMzL1AyY2JHRjlFQzZEejNRVDY2T3QrV2J2Q09aWEJxSUZ3cGk1?=
 =?utf-8?B?cVh1a0srVGgzVUFKM0YwMEVudzVmbVJ6MS9Rd2o5aXJCMWIxVW1yb3ZoTlZN?=
 =?utf-8?B?cmZSWlRHb2lhMm55SDcyWHlWSnVBaWpER0Q3TG5EYXFKd21kUm8zOFJNdkEz?=
 =?utf-8?B?QnJybkpnTVlYVE0zenZzcnhkWVo0cm9VNjNST3hZd1AzNlIrbEJ1N3FxVW9o?=
 =?utf-8?B?a0xMMkNLbGVRMzlsYjI3TXQzaFYyQ3FrUkMwV3I1TFJVYUFXLzc1dndYMlhy?=
 =?utf-8?B?VEkwSkpxbmR0dkZ4aXZjNXVmM3JzWFN3Q3JrUEtJQ2c2aXl6LzdsUzVnZ2oy?=
 =?utf-8?B?dlFmRnI4WDNkZkJFSXlJUWs4STM1bXFHamFUb25VZFE5dzZjdmVBbmdCb2Zq?=
 =?utf-8?B?VG4wM2hTSzg4MGxySkxTbkthWUZrSHU3ZHI5SFVxR0ltRXF5UDNOWjRSZUZK?=
 =?utf-8?B?c003VU45WFQ4RlJ1cVp5ei8yTHFuSEQxZ0craDIwZEQwT0NrWWpBNDEzcEE3?=
 =?utf-8?B?Y3kvVnJZWUhpdDhmMnRaK3NrM04raUFZRWtRS3BlWkl0YnJRMkJVSmlOTkda?=
 =?utf-8?B?M0RiZWVrc0JvWkhtR1hoN3FZUE1yV01qSXZyWGd3VVpTa0lsZ2pYWWd4QkZG?=
 =?utf-8?B?YWNadEpJUm9vQWVxbGQzOVB5NmdGL1FreFNueEJMMWdoclNieXhaN2J1WkY1?=
 =?utf-8?B?akRsejdmQmZjaXY1VFRPRVhWeWRuano5L0M1Ulg3R0ZJbzlDb1IrMFdySW9K?=
 =?utf-8?B?d1krQUNUREhDemVxdi92NHNkbEltWVRoWXlsQlBoMUp6OVJOYTdlei9md0hO?=
 =?utf-8?B?eFo3QXpqbzhTVUFLQzA4VGtKak9DQ0VnOTk5ZFRNQlNoR2dLek5yRjlkMFIr?=
 =?utf-8?Q?X39FMmwC9Ur2FB4fiG73Ej/Wl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2923f7-6e1d-42ac-f399-08ddde547945
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 12:40:55.3228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: arUt+UrG/Lv3110t3BGqaxSQav2MXIYITiLXcanNkdraL9BBWLk6Huuu3UxTrraL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6768
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

On 18.08.25 10:41, Thomas Zimmermann wrote:
> Current dma-buf vmap semantics require that the mapped buffer remains
> in place until the corresponding vunmap has completed.
> 
> For GEM-SHMEM, this used to be guaranteed by a pin operation while creating
> an S/G table in import. GEM-SHMEN can now import dma-buf objects without
> creating the S/G table, so the pin is missing. Leads to page-fault errors,
> such as the one shown below.
> 
> [  102.101726] BUG: unable to handle page fault for address: ffffc90127000000
> [...]
> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> [...]
> [  102.243250] Call Trace:
> [  102.245695]  <TASK>
> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
> [  102.251805]  ? __lock_acquire+0x568/0xae0
> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> [  102.265379]  ? local_clock_noinstr+0xb/0x100
> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
> [  102.274246]  ? mark_held_locks+0x40/0x70
> [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl]
> [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x10 [udl]
> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
> [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0x200
> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
> [  102.333622]  commit_tail+0x204/0x330
> [...]
> [  102.529946] ---[ end trace 0000000000000000 ]---
> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> 
> In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
> dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating the
> mapping.
> 
> Provide a custom dma-buf vmap method in amdgpu that pins the object before
> mapping it's buffer's pages into kernel address space. Do the opposite in
> vunmap.
> 
> Note that dma-buf vmap differs from GEM vmap in how it handles relocation.
> While dma-buf vmap keeps the buffer in place, GEM vmap requires the caller
> to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf code
> instead of its GEM code.
> 
> A discussion of various approaches to solving the problem is available
> at [1].
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping its sg_table")
> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0511c702@suse.de/
> Cc: Shixiong Ou <oushixiong@kylinos.cn>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b153e21@suse.de/ # [1]
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 36 +++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 5743ebb2f1b7..5b33776eeece 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -285,6 +285,38 @@ static int amdgpu_dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  	return ret;
>  }
>  
> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	int ret;
> +
> +	/*
> +	 * Pin to keep buffer in place while it's vmap'ed. The actual
> +	 * location is not important as long as it's mapable.

Yeah, exactly that won't work here. Most of the locations are not CPU accessible.

You could use AMDGPU_GEM_DOMAIN_GTT, that should most likely work in all cases but isn't necessarily the most optimal solution.

Regards,
Christian.

> +	 *
> +	 * This code is required for exporting to GEM-SHMEM without S/G table.
> +	 * Once GEM-SHMEM supports dynamic imports, it should be dropped.
> +	 */
> +	ret = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_MASK);
> +	if (ret)
> +		return ret;
> +	ret = drm_gem_dmabuf_vmap(dma_buf, map);
> +	if (ret)
> +		amdgpu_bo_unpin(bo);
> +
> +	return ret;
> +}
> +
> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
> +{
> +	struct drm_gem_object *obj = dma_buf->priv;
> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +
> +	drm_gem_dmabuf_vunmap(dma_buf, map);
> +	amdgpu_bo_unpin(bo);
> +}
> +
>  const struct dma_buf_ops amdgpu_dmabuf_ops = {
>  	.attach = amdgpu_dma_buf_attach,
>  	.pin = amdgpu_dma_buf_pin,
> @@ -294,8 +326,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops = {
>  	.release = drm_gem_dmabuf_release,
>  	.begin_cpu_access = amdgpu_dma_buf_begin_cpu_access,
>  	.mmap = drm_gem_dmabuf_mmap,
> -	.vmap = drm_gem_dmabuf_vmap,
> -	.vunmap = drm_gem_dmabuf_vunmap,
> +	.vmap = amdgpu_dma_buf_vmap,
> +	.vunmap = amdgpu_dma_buf_vunmap,
>  };
>  
>  /**

