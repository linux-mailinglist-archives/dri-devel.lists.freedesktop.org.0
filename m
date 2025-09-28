Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA92BA7157
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 16:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393B510E12F;
	Sun, 28 Sep 2025 14:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5fChDvu/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012060.outbound.protection.outlook.com
 [40.107.200.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6263B10E12E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 14:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SKL2lJs1B6khOVOmkXCOFIla6my9qXBGY/GabP0faJyJilu8jYRAdqRU19E4bW37HWavEXwAEI1kXHecG8+JtFz3idrXDqZsz848GWgCEQriaRsq8N2pvdQmP7RSB7km2rjZWFuAD5nMjTbAJ96MjU8vRBeFDnHlxx32P7Ng8RfUPfydwthpD9osMjvOZ+jh7Hu+XVUZqOzFMS3KrZSqCA5SBZHY8BBDXGmGy2quJx4N1yBzD6Jr2s683apvgBUO17LrUQc0KYquiJTB2Nk1dAkK73qnqritwa422rnIndRNNHe8gZcZV4PQddhqx1apBRVXFU6Ydb+0x3o7LdyJYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gC/6693iwwJ3CV7c4bWmOMVa6N00w8vT9i0wSgno9Ec=;
 b=yXqOQDZqfgG1/TNmBSRyKq/p+3zPMXI9kmFJNeo3JQAzrOX8DWPhSJHevYmJ9fDQw1s1VNFBrjAFg954ALCTc3cKskWXeENuczrnjF92iBvqBGnGvwcb82OddGQbsX21Cmux5YdlT8lg7XFdtY5h64Ad13nh7zn5LbG6RSPtnd5l2vFCPfiDmmcvxGj+itReSEOok3KDGM9derWKzeKyhQXyJJ0I/4d3o2fjC9hH9wW7NXmGzP6sdnbeQ9iaIs4GYoXjnolmWJvIHwv85nTrmLiJp5DmaEk+59XWxc8pdTlqHIcrCRh7vReQWTYx492htVaKOVuNHSo/vQ50YUo8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gC/6693iwwJ3CV7c4bWmOMVa6N00w8vT9i0wSgno9Ec=;
 b=5fChDvu/yfij5Zb3tRusdkk2chESXbSXWf/Me1RVZF7tioWDE8GX4fuzZm+/AWAH9yrLegccgnmdaciVDSEAhd0svjZlbMZBm5wfTka9kefZdXgLNpo72RZLHvsiLlmUwIh62lsWO8VadD+ysdtSXeoWo4izk/MXPFXNn7MVVGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Sun, 28 Sep
 2025 14:01:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9160.010; Sun, 28 Sep 2025
 14:01:03 +0000
Message-ID: <2b562fa8-6312-4464-8c8d-26d13fbad673@amd.com>
Date: Sun, 28 Sep 2025 16:00:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vgem-fence: Fix potential deadlock on release
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
References: <20250926152628.2165080-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250926152628.2165080-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:335::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d94f57d-3ac5-49e0-4d72-08ddfe9775f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkRBQ3VnV3J4VEUrRVdtMXpURmc2SnByVnN4RytZTWs4OXpkbnAzMllHenpC?=
 =?utf-8?B?U0pMZ3dEY1ZsZXNLQUVZQlA3dExtSkpsSFYrUXZiMGhwWmlCeWhlU05JRk1p?=
 =?utf-8?B?SUtPd2IxcnRKWjRPTTNOTktoUGd1ZnVqK0ZpYWhmbVY4bWQya2RKYm5uYUwx?=
 =?utf-8?B?UENQWUczK3cvcnJ0aFJ1S2pYdW1HSVFjdjVpeGFoNnJWTlljaVhHN2tvMFYz?=
 =?utf-8?B?Q0UwdGNOQzNVOHRZYXRib2RsMTRXcG4rWDc2NWdsSGFQU3NrZHkzby9UY2J4?=
 =?utf-8?B?VzV1dFpoTENUM1h0K3drTzA0STBoSzVYY2JUbkVRMHNsSnkxUThmcFNXRnNV?=
 =?utf-8?B?Wm9UOWNCcGJIRXYxZEROMExpR0FKMk1jN21XSjlZN3BjRWovQVVmeG9RVUx5?=
 =?utf-8?B?dGpoUlpLTnpEYlA1TkpmTU1qTDV4cUtVZ25jUEdYZkYvZUovRVIxc3kvc29Z?=
 =?utf-8?B?bGdVRDBNay9UTVErbTZTMDlNRTF2NmFHQlhsdFlIbVB3ZitjLzVlV3hUNkVv?=
 =?utf-8?B?U3hTbVlTOU1QZGQ4Nk5xWGFHMHhmenZtMGJ6Q1JrVjZBQ01UZ2NIZDc5alJj?=
 =?utf-8?B?b296RCtVQks3TmpCeVdzSXR2NjhzMXdsODNLZlZsZ3pKdStQRnc2bDdWVTBa?=
 =?utf-8?B?V3J4OUhqSWxSbThFT01lK2tDa3VMWmI1bWp4M3NnclAvTjRBd0lLdEEzb3V0?=
 =?utf-8?B?a1FBTWF2M1ZHODR1R09pRnNGRS9pSU5FVEVjR0tZekVTNExrdGFBd0thVUNo?=
 =?utf-8?B?YWM3SFdoNGNSVU94TEdXaHc4SEJ6b1orcG9YOFlPbnU2Vm9xRno1TDVSVEpH?=
 =?utf-8?B?Skdwcm9rWi94NGVMQWxyajNEZlRRMnE0WGpYeFUwNE5idmxVMWVpMHpPUUVa?=
 =?utf-8?B?SWpzeS95dnZxeFJHMmRqS3J1b3ZBem9PY2JVMkwxSUowRE5FYjZOSlg1NEFB?=
 =?utf-8?B?SE5lSnZQa3NER2pRZnFwclVpTlgxcm10cFNDSU1pbFpDcE9hSTc4RUNuWjJ2?=
 =?utf-8?B?d0daUkRYWXFkSGRlbjdtdHpWZ0RlT0grOHdvZGFOak1Ob2JCL2NBRzFHNFpp?=
 =?utf-8?B?cmE3elB5aHlCcEpqbXlhM0tnQ0MvRmJSU1JjTmpyTCt5ODlZdTI2S1gwcnRE?=
 =?utf-8?B?R1ZBRTN5YjJMeFZ4eHJTQy9oVmp0N3U1Q2hQakVUUnBleFpBeHZtTlFaN21k?=
 =?utf-8?B?dW5tMTAyYW8wOHdqV25qUW9BZW92RFBsQUkvSlViVHk2MHFCL1psR0ZRcWZn?=
 =?utf-8?B?eWlxS3ArQnU1Y0h0cFY4RjVjWkl6ZXBmVG4wcUt1K01WaUErNjV4c05ySWdJ?=
 =?utf-8?B?L1FoT2hLTHhsTzA0TnN6ZXB1Y2lQRStrenMwZlVsWC9TaG5aYStkTVg3ajhJ?=
 =?utf-8?B?U01TTXZobm9CYUg1Q1hhWlZrR1Q5TngzS2VQeE5vQTFpSEUwL3hYMkVVTzN0?=
 =?utf-8?B?dGU1TE5MbWNXcnRPVmcvTm0xdmI2VTN2eUdZSTcrRlJPbFR6c0dySFRKTTd1?=
 =?utf-8?B?WTJNT2dINEladnZxZU9sWU1sWVpDcVhrdWg3cFJrVEVZQlJLSjRkbnRCajZD?=
 =?utf-8?B?Zit3aWhRQzZFamw0YWFydDdqTjdrNEt5Qm9KQ3V1SEhlU1JKY0lrMVpWdEtx?=
 =?utf-8?B?bzFtQmRJeWw3M0VVQVF3dU9TQnRPTUJBT3JQcWpRZE8wcWcwWFBxZVloUnRI?=
 =?utf-8?B?VFl3L21FMXc5NE9oS0JQbUg3UEIybnRwRXFQMWNNeXBETjEvYnFoa28zbFdu?=
 =?utf-8?B?RWRWbDNSNXlMRVNPV1ZDZllBOGUyaS9mNkxuYU9mOVU0WmViZWFuZndUeFAr?=
 =?utf-8?B?aUZsY2JOMU5kdXNMVDZqQnhlTFdQNnZMSHVid0gyUndUalpaS2d4dUMyU1NM?=
 =?utf-8?B?Y25hSzgwOGNRTjVSVmg1VWRjNDIyaXdYV2paZHlhRGRDa1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2ZHYnljdVYyT255bU11NGpoY3R0SHViOWlJaDdqbEZyRkhpcUJ3QTJDUjhB?=
 =?utf-8?B?Q0prWUJVaVMzUWMrby9MVGtrRzYybkw5ZGNqYWtpMnIyOFNJQzFVYXZucGNW?=
 =?utf-8?B?NlVVVElwVlpVQ2ovbUJKakxzSndRMDNCMGloVml4YnJqaGRmL1NrU2Y1Q0R1?=
 =?utf-8?B?N2xFTklqTmEya2xVaitraEhzK1VoQ1QyWWMvQ3k5VGFzUmxpQkQwb0QvS1Z2?=
 =?utf-8?B?WFJ5RDVpOUozNUU2dEpMRWlmd2xUVTlhSEpralBLR3d6Q0loUlBOaDNOOEpH?=
 =?utf-8?B?TGpOSTBDbEk2ZUwvUXRObGZhWG81MVBXNk94K0dneVBtTkI5N1MvZTNHRUhn?=
 =?utf-8?B?NjlQY04rY2JWdTN4OWVPcDlvNStwd3lyS3BVZjZLek9FM1dib2pQZnJkWFM3?=
 =?utf-8?B?b0FreEJjRmV1ZUFYNVU3a1plY1BySkJaUVNJUjlPcFRtQVBQRGFpZHc3WmVI?=
 =?utf-8?B?U0dwSll4UHNSTHQyVGZnMGhzSFVHWUNvRklQODlvaDZ1WGlXKzE2VDJyWXk3?=
 =?utf-8?B?TXBWY3pCRmljSFlSdzJrSUt1dEdXUVNidlBNZFQxR3BXTnpzeTBFUEdkcUty?=
 =?utf-8?B?ZWFmWHpCK09ORkluNmNZZFBzekVTM0k4aWVxblZqMFVrSjN5NzdFVmg5dVBF?=
 =?utf-8?B?ZFlzTlZVZ0plaGZJTHI3MnYzZzY4RU1VdzR6ckJPd2x6WU9LVFcxSk5xTVE5?=
 =?utf-8?B?Z0VVV1o1cXlMd3psUTZCNFlQZWdydTB6RTAyWVRxQk8zWnRnOXRrZUhjZjIz?=
 =?utf-8?B?c3J0UHN4Z2I4WkN5dUlDOUxwUnZZUExvY2hVbERLQ2l2QkZwM0s1dlE5b3dy?=
 =?utf-8?B?cWxVV3BqVHRSei9TcFBBOElDbm90SkdSbEkybU1nYTlMM0NWc0QvYklRL01Q?=
 =?utf-8?B?VmI2QWUxOXk1a2NIeTZLV21yYlJRZmpzbDhiVGFCejlpSEVUd21BTW1xYWZQ?=
 =?utf-8?B?cTJSVittRzFUWEV5Wjg4MDFqMW0zbUh5aWx5QWpXQ0hicUM5dGhwZFkrVk5h?=
 =?utf-8?B?Wlc5VGNFUXFwSmZkOVFFdnBZSG10aHlocG1iTnlwcVB0a2VBUjBjbzd5V3pK?=
 =?utf-8?B?algwTUROTFR5NzR0TTlONHJOcXllYVhRcGlZeWU1bmxXcVY1S2hUckxuZTRs?=
 =?utf-8?B?amg4aFpUZzNvYmRBemdPS29VQjBPRUR5d3JNaTdqTmlobHlUYTZibUU1WlJa?=
 =?utf-8?B?UGdaK3RNZW5RZHBJSXRTT2lhMGxNb0UreUdQZUN1L1ViaEJCSWFNcmRuaEcr?=
 =?utf-8?B?YWF6S2tqOTIzdDNYbmZobGlCR0NLQ0RYU3laSWIyeXJHSWdFeFQ1bjltK0xH?=
 =?utf-8?B?T1FuRnQxcG1XdkF5eWhxNHg3YlBZaWVrRHRrSHBTS2RXTkRVSDJLYjREUnBN?=
 =?utf-8?B?M05qMkhlSHU3M3hNWUhteVJvSm9wMFRHUy90UWdKbmFBa3NsZEtRZVkvQ2lQ?=
 =?utf-8?B?ZUZQaGVEQ1Y4SU5GQXFsRVg3MXhkNHJSOUJqVVVyakRJSDhaMTZBNEkxVUJW?=
 =?utf-8?B?VG1tOS9KRWlkTGhPdWlSS3IrRm9HL3lPRTJhbkdNVFNEcTY1NDF2YzY0cjdN?=
 =?utf-8?B?UUgwbmc1cGptUFRHcndNazVqNWx3QVlLRitLazB2QklDRit5MEdMRTRXTFRF?=
 =?utf-8?B?dlFqUHlVdTk2S3ZBREtGdlZtQzBLeEQ4a0dCcU9KR0RMTXc5Z3R0Skcza0pQ?=
 =?utf-8?B?a3pnUXhEWWtaQWIweGFQOFJ0RFZEY3JQZWwyeHFYVEpmTEJVaTFBODgyVWdE?=
 =?utf-8?B?SW5GN3NmWDBTRmFYWjRzUjJOMFgreUVJVXJGcEgzYWt2SVN0Ty9IYmMyQTgv?=
 =?utf-8?B?bS9KRzRWNzVnUmZYVFhZR0haYmYxV1lKam1HYVBHVXdOZVRiVUE0QnM5Rmxo?=
 =?utf-8?B?S3pwek5rWnNKU3dUbnFZMGZMRWtCY2ZCMktNdTkvTWpDVWVIRDcvOFl3QlM4?=
 =?utf-8?B?OTlqN1ZXR2F5MzQvWS9QZzVzL0hSQTJ6VGpHQ3BIUjNKVGY1UGlnYTl6TjlV?=
 =?utf-8?B?SDl3d3NrdHhOSVc3VEZ5OWR4bnRaWGpaZTVyZFoxV2pvUkxFU1JQeUdEeWRU?=
 =?utf-8?B?RVllT2RHRzRWbkRPNGRkbEhHaEhGVVhpWnZIbGl2RjhmckhUcjNCK21IQnFP?=
 =?utf-8?Q?5dRo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d94f57d-3ac5-49e0-4d72-08ddfe9775f3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 14:01:03.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZtMg5lRjdX5In4cvUna7h3md4fce/sRDdcs6LxjD3wOgYmv2a6fIyf20jOv0J4K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888
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

On 26.09.25 17:26, Janusz Krzysztofik wrote:
> A timer that expires a vgem fence automatically in 10 seconds is now
> released with timer_delete_sync() from fence->ops.release() called on las=
t
> dma_fence_put().  In some scenarios, it can run in IRQ context, which is
> not safe unless TIMER_IRQSAFE is used.  One potentially risky scenario wa=
s
> demonstrated in Intel DRM CI trybot, BAT run on machine bat-adlp-6, while
> working on new IGT subtests syncobj_timeline@stress-* as user space
> replacements of some problematic test cases of a dma-fence-chain selftest
> [1].
>=20
> [117.004338] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [117.004340] WARNING: inconsistent lock state
> [117.004342] 6.17.0-rc7-CI_DRM_17270-g7644974e648c+ #1 Tainted: G S   U
> [117.004346] --------------------------------
> [117.004347] inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
> [117.004349] swapper/0/0 [HC1[1]:SC1[1]:HE0:SE0] takes:
> [117.004352] ffff888138f86aa8 ((&fence->timer)){?.-.}-{0:0}, at: __timer_=
delete_sync+0x4b/0x190
> [117.004361] {HARDIRQ-ON-W} state was registered at:
> [117.004363]   lock_acquire+0xc4/0x2e0
> [117.004366]   call_timer_fn+0x80/0x2a0
> [117.004368]   __run_timers+0x231/0x310
> [117.004370]   run_timer_softirq+0x76/0xe0
> [117.004372]   handle_softirqs+0xd4/0x4d0
> [117.004375]   __irq_exit_rcu+0x13f/0x160
> [117.004377]   irq_exit_rcu+0xe/0x20
> [117.004379]   sysvec_apic_timer_interrupt+0xa0/0xc0
> [117.004382]   asm_sysvec_apic_timer_interrupt+0x1b/0x20
> [117.004385]   cpuidle_enter_state+0x12b/0x8a0
> [117.004388]   cpuidle_enter+0x2e/0x50
> [117.004393]   call_cpuidle+0x22/0x60
> [117.004395]   do_idle+0x1fd/0x260
> [117.004398]   cpu_startup_entry+0x29/0x30
> [117.004401]   start_secondary+0x12d/0x160
> [117.004404]   common_startup_64+0x13e/0x141
> [117.004407] irq event stamp: 2282669
> [117.004409] hardirqs last  enabled at (2282668): [<ffffffff8289db71>] _r=
aw_spin_unlock_irqrestore+0x51/0x80
> [117.004414] hardirqs last disabled at (2282669): [<ffffffff82882021>] sy=
svec_irq_work+0x11/0xc0
> [117.004419] softirqs last  enabled at (2254702): [<ffffffff8289fd00>] __=
do_softirq+0x10/0x18
> [117.004423] softirqs last disabled at (2254725): [<ffffffff813d4ddf>] __=
irq_exit_rcu+0x13f/0x160
> [117.004426]
> other info that might help us debug this:
> [117.004429]  Possible unsafe locking scenario:
> [117.004432]        CPU0
> [117.004433]        ----
> [117.004434]   lock((&fence->timer));
> [117.004436]   <Interrupt>
> [117.004438]     lock((&fence->timer));
> [117.004440]
>  *** DEADLOCK ***
> [117.004443] 1 lock held by swapper/0/0:
> [117.004445]  #0: ffffc90000003d50 ((&fence->timer)){?.-.}-{0:0}, at: cal=
l_timer_fn+0x7a/0x2a0
> [117.004450]
> stack backtrace:
> [117.004453] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S   U       =
       6.17.0-rc7-CI_DRM_17270-g7644974e648c+ #1 PREEMPT(voluntary)
> [117.004455] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER
> [117.004455] Hardware name: Intel Corporation Alder Lake Client Platform/=
AlderLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
> [117.004456] Call Trace:
> [117.004456]  <IRQ>
> [117.004457]  dump_stack_lvl+0x91/0xf0
> [117.004460]  dump_stack+0x10/0x20
> [117.004461]  print_usage_bug.part.0+0x260/0x360
> [117.004463]  mark_lock+0x76e/0x9c0
> [117.004465]  ? register_lock_class+0x48/0x4a0
> [117.004467]  __lock_acquire+0xbc3/0x2860
> [117.004469]  lock_acquire+0xc4/0x2e0
> [117.004470]  ? __timer_delete_sync+0x4b/0x190
> [117.004472]  ? __timer_delete_sync+0x4b/0x190
> [117.004473]  __timer_delete_sync+0x68/0x190
> [117.004474]  ? __timer_delete_sync+0x4b/0x190
> [117.004475]  timer_delete_sync+0x10/0x20
> [117.004476]  vgem_fence_release+0x19/0x30 [vgem]
> [117.004478]  dma_fence_release+0xc1/0x3b0
> [117.004480]  ? dma_fence_release+0xa1/0x3b0
> [117.004481]  dma_fence_chain_release+0xe7/0x130
> [117.004483]  dma_fence_release+0xc1/0x3b0
> [117.004484]  ? _raw_spin_unlock_irqrestore+0x27/0x80
> [117.004485]  dma_fence_chain_irq_work+0x59/0x80
> [117.004487]  irq_work_single+0x75/0xa0
> [117.004490]  irq_work_run_list+0x33/0x60
> [117.004491]  irq_work_run+0x18/0x40
> [117.004493]  __sysvec_irq_work+0x35/0x170
> [117.004494]  sysvec_irq_work+0x47/0xc0
> [117.004496]  asm_sysvec_irq_work+0x1b/0x20
> [117.004497] RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
> [117.004499] Code: 00 75 1c 65 ff 0d d9 34 68 01 74 20 5b 41 5c 5d 31 c0 =
31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc e8 7f 9d d3 fe fb 0f 1f 44 00 00 <eb=
> d7 0f 1f 44 00 00 5b 41 5c 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3
> [117.004499] RSP: 0018:ffffc90000003cf0 EFLAGS: 00000246
> [117.004500] RAX: 0000000000000000 RBX: ffff888155e94c40 RCX: 00000000000=
00000
> [117.004501] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
> [117.004502] RBP: ffffc90000003d00 R08: 0000000000000000 R09: 00000000000=
00000
> [117.004502] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00246
> [117.004502] R13: 0000000000000001 R14: 0000000000000246 R15: ffff888155e=
94c80
> [117.004506]  dma_fence_signal+0x49/0xb0
> [117.004507]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
> [117.004508]  vgem_fence_timeout+0x12/0x20 [vgem]
> [117.004509]  call_timer_fn+0xa1/0x2a0
> [117.004512]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
> [117.004513]  __run_timers+0x231/0x310
> [117.004514]  ? tmigr_handle_remote+0x2ac/0x560
> [117.004517]  timer_expire_remote+0x46/0x70
> [117.004518]  tmigr_handle_remote+0x433/0x560
> [117.004520]  ? __run_timers+0x239/0x310
> [117.004521]  ? run_timer_softirq+0x21/0xe0
> [117.004522]  ? lock_release+0xce/0x2a0
> [117.004524]  run_timer_softirq+0xcf/0xe0
> [117.004525]  handle_softirqs+0xd4/0x4d0
> [117.004526]  __irq_exit_rcu+0x13f/0x160
> [117.004527]  irq_exit_rcu+0xe/0x20
> [117.004528]  sysvec_apic_timer_interrupt+0xa0/0xc0
> [117.004529]  </IRQ>
> [117.004529]  <TASK>
> [117.004529]  asm_sysvec_apic_timer_interrupt+0x1b/0x20
> [117.004530] RIP: 0010:cpuidle_enter_state+0x12b/0x8a0
> [117.004532] Code: 48 0f a3 05 97 ce 0e 01 0f 82 2e 03 00 00 31 ff e8 8a =
41 bd fe 80 7d d0 00 0f 85 11 03 00 00 e8 8b 06 d5 fe fb 0f 1f 44 00 00 <45=
> 85 f6 0f 88 67 02 00 00 4d 63 ee 49 83 fd 0a 0f 83 34 06 00 00
> [117.004532] RSP: 0018:ffffffff83403d88 EFLAGS: 00000246
> [117.004533] RAX: 0000000000000000 RBX: ffff88888f046440 RCX: 00000000000=
00000
> [117.004533] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
> [117.004534] RBP: ffffffff83403dd8 R08: 0000000000000000 R09: 00000000000=
00000
> [117.004534] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff837=
cbe80
> [117.004534] R13: 0000000000000004 R14: 0000000000000004 R15: 0000001ad1d=
f466b
> [117.004537]  ? cpuidle_enter_state+0x125/0x8a0
> [117.004538]  ? sched_clock_noinstr+0x9/0x10
> [117.004540]  cpuidle_enter+0x2e/0x50
> [117.004542]  call_cpuidle+0x22/0x60
> [117.004542]  do_idle+0x1fd/0x260
> [117.004544]  cpu_startup_entry+0x29/0x30
> [117.004546]  rest_init+0x104/0x200
> [117.004548]  start_kernel+0x93d/0xbd0
> [117.004550]  ? load_ucode_intel_bsp+0x2a/0x90
> [117.004551]  ? sme_unmap_bootdata+0x14/0x80
> [117.004554]  x86_64_start_reservations+0x18/0x30
> [117.004555]  x86_64_start_kernel+0xfd/0x150
> [117.004556]  ? soft_restart_cpu+0x14/0x14
> [117.004558]  common_startup_64+0x13e/0x141
> [117.004560]  </TASK>
> [117.004565] ------------[ cut here ]------------
> [117.004692] WARNING: CPU: 0 PID: 0 at kernel/time/timer.c:1610 __timer_d=
elete_sync+0x126/0x190
> [117.004697] Modules linked in: vgem snd_hda_codec_intelhdmi snd_hda_code=
c_hdmi i915 prime_numbers ttm drm_buddy drm_display_helper cec rc_core i2c_=
algo_bit hid_sensor_custom hid_sensor_hub hid_generic intel_ishtp_hid hid i=
ntel_uncore_frequency intel_uncore_frequency_common x86_pkg_temp_thermal in=
tel_powerclamp cmdlinepart ee1004 r8153_ecm spi_nor coretemp cdc_ether mei_=
pxp mei_hdcp usbnet mtd intel_rapl_msr wmi_bmof kvm_intel snd_hda_intel snd=
_intel_dspcfg processor_thermal_device_pci kvm snd_hda_codec processor_ther=
mal_device irqbypass processor_thermal_wt_hint polyval_clmulni platform_tem=
perature_control snd_hda_core ghash_clmulni_intel processor_thermal_rfim sp=
i_pxa2xx_platform snd_hwdep aesni_intel processor_thermal_rapl dw_dmac snd_=
pcm dw_dmac_core intel_rapl_common r8152 rapl mii intel_cstate spi_pxa2xx_c=
ore i2c_i801 processor_thermal_wt_req snd_timer i2c_mux mei_me intel_ish_ip=
c processor_thermal_power_floor e1000e snd i2c_smbus spi_intel_pci processo=
r_thermal_mbox mei soundcore intel_ishtp thunderbolt idma64
> [117.004733]  spi_intel int340x_thermal_zone igen6_edac binfmt_misc intel=
_skl_int3472_tps68470 intel_pmc_core tps68470_regulator video clk_tps68470 =
pmt_telemetry pmt_discovery nls_iso8859_1 pmt_class intel_pmc_ssram_telemet=
ry intel_skl_int3472_discrete int3400_thermal intel_hid intel_skl_int3472_c=
ommon acpi_thermal_rel intel_vsec wmi pinctrl_tigerlake acpi_tad sparse_key=
map acpi_pad dm_multipath msr nvme_fabrics fuse efi_pstore nfnetlink autofs=
4
> [117.004782] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S   U       =
       6.17.0-rc7-CI_DRM_17270-g7644974e648c+ #1 PREEMPT(voluntary)
> [117.004787] Tainted: [S]=3DCPU_OUT_OF_SPEC, [U]=3DUSER
> [117.004789] Hardware name: Intel Corporation Alder Lake Client Platform/=
AlderLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
> [117.004793] RIP: 0010:__timer_delete_sync+0x126/0x190
> [117.004795] Code: 31 c0 45 31 c9 c3 cc cc cc cc 48 8b 75 d0 45 84 f6 74 =
63 49 c7 45 18 00 00 00 00 48 89 c7 e8 51 46 39 01 f3 90 e9 66 ff ff ff <0f=
> 0b e9 5f ff ff ff e8 ee e4 0c 00 49 8d 5d 28 45 31 c9 31 c9 4c
> [117.004801] RSP: 0018:ffffc90000003a40 EFLAGS: 00010046
> [117.004804] RAX: ffffffff815093fb RBX: ffff888138f86aa8 RCX: 00000000000=
00000
> [117.004807] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
> [117.004809] RBP: ffffc90000003a70 R08: 0000000000000000 R09: 00000000000=
00000
> [117.004812] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff815=
093fb
> [117.004814] R13: ffff888138f86a80 R14: 0000000000000000 R15: 00000000000=
00000
> [117.004817] FS:  0000000000000000(0000) GS:ffff88890b0f7000(0000) knlGS:=
0000000000000000
> [117.004820] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [117.004823] CR2: 00005db8131eb7f0 CR3: 0000000003448000 CR4: 0000000000f=
52ef0
> [117.004826] PKRU: 55555554
> [117.004827] Call Trace:
> [117.004829]  <IRQ>
> [117.004831]  timer_delete_sync+0x10/0x20
> [117.004833]  vgem_fence_release+0x19/0x30 [vgem]
> [117.004836]  dma_fence_release+0xc1/0x3b0
> [117.004838]  ? dma_fence_release+0xa1/0x3b0
> [117.004841]  dma_fence_chain_release+0xe7/0x130
> [117.004844]  dma_fence_release+0xc1/0x3b0
> [117.004847]  ? _raw_spin_unlock_irqrestore+0x27/0x80
> [117.004850]  dma_fence_chain_irq_work+0x59/0x80
> [117.004853]  irq_work_single+0x75/0xa0
> [117.004857]  irq_work_run_list+0x33/0x60
> [117.004860]  irq_work_run+0x18/0x40
> [117.004863]  __sysvec_irq_work+0x35/0x170
> [117.004865]  sysvec_irq_work+0x47/0xc0
> [117.004868]  asm_sysvec_irq_work+0x1b/0x20
> [117.004871] RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
> [117.004874] Code: 00 75 1c 65 ff 0d d9 34 68 01 74 20 5b 41 5c 5d 31 c0 =
31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc e8 7f 9d d3 fe fb 0f 1f 44 00 00 <eb=
> d7 0f 1f 44 00 00 5b 41 5c 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3
> [117.004879] RSP: 0018:ffffc90000003cf0 EFLAGS: 00000246
> [117.004882] RAX: 0000000000000000 RBX: ffff888155e94c40 RCX: 00000000000=
00000
> [117.004884] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
> [117.004887] RBP: ffffc90000003d00 R08: 0000000000000000 R09: 00000000000=
00000
> [117.004890] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000000=
00246
> [117.004892] R13: 0000000000000001 R14: 0000000000000246 R15: ffff888155e=
94c80
> [117.004897]  dma_fence_signal+0x49/0xb0
> [117.004899]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
> [117.004902]  vgem_fence_timeout+0x12/0x20 [vgem]
> [117.004904]  call_timer_fn+0xa1/0x2a0
> [117.004908]  ? __pfx_vgem_fence_timeout+0x10/0x10 [vgem]
> [117.004910]  __run_timers+0x231/0x310
> [117.004913]  ? tmigr_handle_remote+0x2ac/0x560
> [117.004917]  timer_expire_remote+0x46/0x70
> [117.004919]  tmigr_handle_remote+0x433/0x560
> [117.004923]  ? __run_timers+0x239/0x310
> [117.004925]  ? run_timer_softirq+0x21/0xe0
> [117.004928]  ? lock_release+0xce/0x2a0
> [117.004931]  run_timer_softirq+0xcf/0xe0
> [117.004933]  handle_softirqs+0xd4/0x4d0
> [117.004936]  __irq_exit_rcu+0x13f/0x160
> [117.004938]  irq_exit_rcu+0xe/0x20
> [117.004940]  sysvec_apic_timer_interrupt+0xa0/0xc0
> [117.004943]  </IRQ>
> [117.004944]  <TASK>
> [117.004946]  asm_sysvec_apic_timer_interrupt+0x1b/0x20
> [117.004949] RIP: 0010:cpuidle_enter_state+0x12b/0x8a0
> [117.004953] Code: 48 0f a3 05 97 ce 0e 01 0f 82 2e 03 00 00 31 ff e8 8a =
41 bd fe 80 7d d0 00 0f 85 11 03 00 00 e8 8b 06 d5 fe fb 0f 1f 44 00 00 <45=
> 85 f6 0f 88 67 02 00 00 4d 63 ee 49 83 fd 0a 0f 83 34 06 00 00
> [117.004961] RSP: 0018:ffffffff83403d88 EFLAGS: 00000246
> [117.004963] RAX: 0000000000000000 RBX: ffff88888f046440 RCX: 00000000000=
00000
> [117.004966] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00000000000=
00000
> [117.004968] RBP: ffffffff83403dd8 R08: 0000000000000000 R09: 00000000000=
00000
> [117.004971] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff837=
cbe80
> [117.004974] R13: 0000000000000004 R14: 0000000000000004 R15: 0000001ad1d=
f466b
> [117.004978]  ? cpuidle_enter_state+0x125/0x8a0
> [117.004981]  ? sched_clock_noinstr+0x9/0x10
> [117.004985]  cpuidle_enter+0x2e/0x50
> [117.004989]  call_cpuidle+0x22/0x60
> [117.004991]  do_idle+0x1fd/0x260
> [117.005001]  cpu_startup_entry+0x29/0x30
> [117.005004]  rest_init+0x104/0x200
> [117.005008]  start_kernel+0x93d/0xbd0
> [117.005011]  ? load_ucode_intel_bsp+0x2a/0x90
> [117.005014]  ? sme_unmap_bootdata+0x14/0x80
> [117.005017]  x86_64_start_reservations+0x18/0x30
> [117.005020]  x86_64_start_kernel+0xfd/0x150
> [117.005023]  ? soft_restart_cpu+0x14/0x14
> [117.005026]  common_startup_64+0x13e/0x141
> [117.005030]  </TASK>
> [117.005032] irq event stamp: 2282669
> [117.005034] hardirqs last  enabled at (2282668): [<ffffffff8289db71>] _r=
aw_spin_unlock_irqrestore+0x51/0x80
> [117.005038] hardirqs last disabled at (2282669): [<ffffffff82882021>] sy=
svec_irq_work+0x11/0xc0
> [117.005043] softirqs last  enabled at (2254702): [<ffffffff8289fd00>] __=
do_softirq+0x10/0x18
> [117.005047] softirqs last disabled at (2254725): [<ffffffff813d4ddf>] __=
irq_exit_rcu+0x13f/0x160
> [117.005051] ---[ end trace 0000000000000000 ]---
>=20
> Make the timer IRQ safe.
>=20
> [1] https://patchwork.freedesktop.org/series/154987/#rev2
>=20
> Fixes: 4077798484459 ("drm/vgem: Attach sw fences to exported vGEM dma-bu=
f (ioctl)")
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

We should also consider to lower the timeout massively. This needs to be in=
 the range of 100m-1s to not cause the same trouble as the sw_sync framewor=
k.

10seconds is just way to long for that.

Regards,
Christian.

> ---
>  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vge=
m_fence.c
> index fd76730fd38c0..07db319c3d7f9 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -79,7 +79,7 @@ static struct dma_fence *vgem_fence_create(struct vgem_=
file *vfile,
>  	dma_fence_init(&fence->base, &vgem_fence_ops, &fence->lock,
>  		       dma_fence_context_alloc(1), 1);
> =20
> -	timer_setup(&fence->timer, vgem_fence_timeout, 0);
> +	timer_setup(&fence->timer, vgem_fence_timeout, TIMER_IRQSAFE);
> =20
>  	/* We force the fence to expire within 10s to prevent driver hangs */
>  	mod_timer(&fence->timer, jiffies + VGEM_FENCE_TIMEOUT);

