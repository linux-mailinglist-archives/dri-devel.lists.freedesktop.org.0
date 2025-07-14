Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09A8B03DA4
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 13:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6904D10E471;
	Mon, 14 Jul 2025 11:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GCt/ouwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4D10E17A;
 Mon, 14 Jul 2025 11:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Djz7HkhxoVhR9FejwU+Ru9YrcdNj9NZMSXkyQrCUkYPIfbP4TKu/MTvSU1PN65dnYwvCxBlVKvTXl8RkMxEcwSHrCbdJHB/nnDisjT2bdY1CA1AFWGmaoRXjJkQJ1Pm+CshmYUdXuc7KbV2VCe2K11CdBuLrdked3rB1JU6O2cA8KbP3eONZEh0IgQXQNeVRt7PTVDzYxx16T7RnFik0+OG3LDbSEqT604r7vv1+IV/uCEi6xHoop0P4+lJ6Y3etmRV0bPTmjyoY8PwWPm+VHQ5A9steNdHfAW4yA6RqdqJHDr0HgQPKInfvNixnGyK6jVA+J0zICfszTFx0Qzp2mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jADenP891jJrklyVMErCqGky9wS41Pi0OdfgNxJ5JIQ=;
 b=ayTEL64aHuYJOnvEAi3M44eF8BTG/kI+sba4MslPBpyBCQM+0CPvD5jyA9uDXtOKHNO52aRl0Po0nK5GtzoI847RdMctlUCPGiHgDphUTQrDLnjEBOqGCxP3x3PzP7tsdawKx/SMqa1MDUeu6j2s87Pap9nEyMxYWpjVzxUiWqQPxcYr/G/mLqxj5y8C3zwlNIb6DiqYb63j+bl7ck9+ZCn5rc6ieKsuTZPoY7+BtMyG01VsREsPwqgm3co1yz461QTGwNJLjU9LBsM1KQhQHTNZYLEjwHXmPI4oGNJa+hCx8uNUdWgpM1wa6eC76lIdo0c3G24rf94IMFJGld8w2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jADenP891jJrklyVMErCqGky9wS41Pi0OdfgNxJ5JIQ=;
 b=GCt/ouwB1scv8AFUqw6J/7LxzB7JtPlYYaXq86NYJ2Ht6mtnedEYMYTIVWF0gBHBaf37JQuKVZ2Hoxm6xujdvfEUw3YngO038qMvSZJQFNfyjBr3PXeyYMeTIxGnXNTIvt/EPK7kQc/l8D01rac8IduYxKPkuMv7C7ad/mvF1v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9344.namprd12.prod.outlook.com (2603:10b6:610:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 11:46:42 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 11:46:42 +0000
Message-ID: <26bdeeec-8b73-48fc-9efb-572dd10d76a0@amd.com>
Date: Mon, 14 Jul 2025 13:46:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/sched: Allow drivers to skip the reset and
 keep on running
To: phasta@kernel.org, =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
 <20250708-sched-skip-reset-v5-2-2612b601f01a@igalia.com>
 <20499b2a-0695-430a-9280-035a7e04d328@amd.com>
 <335c9bc57d19f17a3ba0da311f287dfdc3d580c7.camel@mailbox.org>
 <176e7f13-52e8-42d6-a9db-0bb237790aef@amd.com>
 <2347cd33-5289-4e6f-8296-b34bc05eff8b@igalia.com>
 <2818cf80-4dac-4628-9079-2dd6311b48ae@amd.com>
 <9dbf93987a0d302506247f17985aa08f948c062d.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9dbf93987a0d302506247f17985aa08f948c062d.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9344:EE_
X-MS-Office365-Filtering-Correlation-Id: 77be855f-3faa-460a-100e-08ddc2cc1a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1JmSnk4QlB0WnRnRGdVR3BHOTdFUW1ySzdpNExoQnVaS3YzWFpQZnh4WVdm?=
 =?utf-8?B?WGk1dGdaUWh6WEdnU0J4b3NqRy9RKzAyZ2VWRDJlc0NJa2pFV2pVbjVwVUpk?=
 =?utf-8?B?b2NnaTlHajhVZ25ZTFhNZUdvc2VGeDRLMS9pQkY1K2VrT2pZMEtpQjVkdncx?=
 =?utf-8?B?WkxndjdQcndKWWNBNzRsYmpTRWNIVmVKaGZTdkt5RUlMK2Y3NGdONjFTdUdS?=
 =?utf-8?B?ZXZ4VDRlWHU3U1JiZUpSTlNQLzlEVGYyaXhqYkd6cTI0YXNFa2F0dlJrVFJp?=
 =?utf-8?B?Yi9qalphK2FrR2U4cEpKM2V2a21CLy91dG94bDNlaFZXU0g1QWpKRlBnSkdo?=
 =?utf-8?B?VFp5MmZwMmdjaGg5NmpDWC9SemNSbDlZV2R6S1FwaWpkNUNTN2N0cVZXWXF5?=
 =?utf-8?B?Ry81dlpqOEQyYUFYamV4eFh4aUE3cm1NWlhGamFFdktOdFZiMjU3RWxMbmRB?=
 =?utf-8?B?Z2s0endocHhwdlQveGJ4dnJVdmZ1S1Z1WjJGTDcybm0xZXBKUFdRdGlaQjVF?=
 =?utf-8?B?Q2ZyZnJHeitxREI5Rkl5c3ZjYjNITE9sN0lrV2ZZTUZRUkNMS01GUlRYVE9D?=
 =?utf-8?B?UW13TGorWDBTS2hYR05mSTB1M0NKMHZGbzJleEl0ZWlpNUdLRjg3TDNScTFW?=
 =?utf-8?B?K0NvNFNGeVpLUjFrMEVkL3RYZ255YUVTQTd5aWtZVi9wejEzUWVhY09VM091?=
 =?utf-8?B?VHY0bkw1a0dMMGFrandBa24wZ2Jwa3VqeWVCSWFzck5xR09pQU1QSmM5SjVm?=
 =?utf-8?B?ZFdXUjJSV1E0N2h1ZjVXK0p1czRPY0NyNkJwMWcyVXJuUXlDck92dlI3VHB0?=
 =?utf-8?B?M3lwM3ZpS1R1cnFkNFFFY2dEempkVkJEdS95cHlQNnNBelNvbm41WHBwWXQy?=
 =?utf-8?B?MjYzbXdwWTRhL1EzbWdCeVN0ZXdaVlYzY1FtdmIwYmRRQTMzbmRRc1k2U0Nj?=
 =?utf-8?B?dEo5VUNYQjJRQjBFcVFLNmtyL3JTeWFDdnF4UFRJU0hSanpVUlZKUzJtYjMx?=
 =?utf-8?B?bE1tT1IzQXZpYmlPS2Q1Lys1cGRJNUdCa3JSN3dYOERDV2RWT0tYeFFSWDlI?=
 =?utf-8?B?M0pCQlNGdk81d2Mvcy9xdTFveFc0UlRBdTRLa0NJME92Vnp4MVdKNDg5WTNF?=
 =?utf-8?B?RllrMXFUcnVKODdUVkFUc0J5ZmJZWEpaL05RejZLT0tpUE9GQk1GaXlQL0FK?=
 =?utf-8?B?YzU0SHRJbDArL1pvQmtGVmJmYlJyaGpReFVmT3pGMzJ2SisySVpEVG80UXVK?=
 =?utf-8?B?TzJSc3pWTHVTMnYxRXdXMFltaXM5dW1sMHRzOHdmQ1ZmUVJuOU15YVdiNTE0?=
 =?utf-8?B?R3FTOWVMQmVGN2xmWHliOVg5MzgvUXhqYklGaE9Dc3RwZkNMZGNndVd6WDdR?=
 =?utf-8?B?bDJUTGhDQ3JrU3prUWxTbWZYdjNWc1lUSklJUGNMVDRYMUJ4ZlR3VGZ0RVA1?=
 =?utf-8?B?cVpBY1M4cVhVeWlZWmQ4ald2YlVMTmQ3K3N0SlVTVVA0M3lJd3RvQnQyZHk2?=
 =?utf-8?B?MVNjN0F3NEhUUnUrNkpJYytQaURHV3JaUkxyaGNqdFZiOGQ4RVQ4YjBNTFY4?=
 =?utf-8?B?VDdjNzUrbldlTmNYUTVNSEJnMXF2NU1GbG83SVc0dWNDYS9XbEtJRDhJc0J0?=
 =?utf-8?B?a25HdkJIL0o4TUs0OEtGdVZrVjNCS3NrdXA4a0pvdXM5cnl1akQyd09hMDFY?=
 =?utf-8?B?c0FQRHVlMnlSYTk3TlN0N2RsQm9ScWRzNDdYVkJvTjZFaERzdllZUnp3MnlR?=
 =?utf-8?B?U2h5aWJ4bUFkK1Fkc1cyeXZ6OTV0SWFPejZ1VEN1OFpja1g4MWlmTjdpUGpw?=
 =?utf-8?B?OCtBTGhGTSs0N2lsQ1VWRjR4VG9PUno3cFEwUzVNSWE4anVlWngvWWo4Rnlq?=
 =?utf-8?B?ajk2dlpjVGRrTGVYNzc3Tkg0cmQ2MFBUVEN6R1M0MWZ0TkZXM2EvaVVzUHBn?=
 =?utf-8?B?RU0rTVlFUWZld3J5am1LV2dvdjdIRnVtbU00dWFKZG5EOXpLZnJ4MmZjaS9H?=
 =?utf-8?B?aHpKRzJZcE5RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRVbzFZZFBWbks1TUF0ZTY4Tm5BRno5Z1Z5UjNxaGgvQnhHcE5xUzA5dExn?=
 =?utf-8?B?UXFNTWhlcmhRNXFWTWFld2Z6V3F4bDMzM1VYSE0yUkVNSDEvL2FyUWZvOXY0?=
 =?utf-8?B?NE5vaEJHeW05ekE1QVN0NUlHTDVka3paTE5CWXFuU0t6SStxY2dxU20zZ1NT?=
 =?utf-8?B?YmtUWDcwTlNseStvYmdtMTNVSDNUbGROa3lyVHM4bkRLcjY5aHlvbHFpMHdB?=
 =?utf-8?B?YndpVlhzMjV0S2lEL3pKMjNtYllVckMzRDQrUkQ2cSs2NUY2NllHYTNjNjlU?=
 =?utf-8?B?SWpDOW1qS3QxOGlQNFlKUGRZTzVPbWdYM3Jyb2RXOU1EL1hWNWlLdTNvamVh?=
 =?utf-8?B?cTd1elhMUlhyT0VTZmRKVTF0aUJsQWp2ZjMvUnlVZHpZaVhXL1pZU0xjQTNl?=
 =?utf-8?B?aHpEaGhXeS8zODMvQzNweENYRmtUb0lyQm5XR0x2S1dxTmhHUjk4ZHd0a250?=
 =?utf-8?B?dWFtN1pEMkpUV1QrSUp1SDh6TGtsWERDL2xNWWRuVm52QnlOQ0tMZ3YyNm1x?=
 =?utf-8?B?UVVGcXNMbjFzVEljS1JKbU9VU0ZRLzVsL1lTQ0wxcTNPNG4xQ1pvMW9uVXh1?=
 =?utf-8?B?SjNUL2NQK0JtUmIxUE12Vy92aEJsQnVPUHl0UGZEOTdETUVaWDBwQXV1VmFv?=
 =?utf-8?B?M0ZUdkEvQ0hTN0QwakVrY1lKUXZTUjlXdmU3a05kZ2h6WFpuVnpJazJ5Yi9t?=
 =?utf-8?B?TDZSdkVsYjhodWJLaG9BNDZtSjhCdUhlbVh5YjVZdU9SR2MvZ2VoL2FSRnYy?=
 =?utf-8?B?c0FqV0F6UU9tNFY1bGRSM0JtWXgvV3VqVVM4UDlNMnA0M3VkT2liSHZnVEV6?=
 =?utf-8?B?NjZGVm1kekdYQS93ZEk5VUxzR0xTNVl2RnpoOGd2Wk5uMHRqWHQzNHNuR2l6?=
 =?utf-8?B?VGhUZHNsOFZDZXVaZ3dkdHNOY21sZjJBSzZldjRUVXJtdmlZUktkMXlxS3RO?=
 =?utf-8?B?M3RLSDRTZm1RVE9VbExlL1QzK0pjeDNYYW9GUFI1WVAvcXlKbWduYlN1ZzlD?=
 =?utf-8?B?RWk1RU5CYmMwZUppajM4NjNQUGorVnhORTkwa3E0Vy9COU1mQkZVaGRjRjdi?=
 =?utf-8?B?MWJVWmRsRkhCNkxRK1NFZDQ4eUEvQzNkYTBmSWtPSi85cGxZaExFdmN5YjV1?=
 =?utf-8?B?ODJ2M0VMRXp2ZUlFUkpkZ1c0dnJQV0R2NGN2R3JaZHRjRVBzZFBSQWhhV0Vj?=
 =?utf-8?B?dDJmc2RsSFJWQTROaTAvMEZJeS92V0FsUFh1akpoWHh4RDF3YnFkMDRHZ0dz?=
 =?utf-8?B?OThQcUpETTI4YjF2WnlURFNUZFBNZ3RHNjlJRDVKSFhvKzQvblVpV1BCV1Zl?=
 =?utf-8?B?cTJ0blZqZGgxc2YwbzdGSmk5bEd4dFdXZ2Q3bkJuMFcxTU5GUzVjeHZHSDAw?=
 =?utf-8?B?MzlNWi93Y0wzVzErdktiTjJTVWNHYTFrbUNINnUvTm51N1hWcEIzcGtjNnF1?=
 =?utf-8?B?cU42bmpHdlkxdEVPd3pHS24xUTlLQWh3NHJXeTJyYXNUSmdKRC9YQWFzNTNk?=
 =?utf-8?B?THdUcXFCU2kxOE8xaUs1TUFMTjNHQ0xFL0MzVmRVcnJKRXlFekJ0UnlsMllu?=
 =?utf-8?B?TUh0T1ErQ1NYNy9MYzdWOGovYUlrckdDZkVpYUZtUWxtdXdERDJvUkpwUWN0?=
 =?utf-8?B?YzRNMVkwL3hGTm9XT2lSaU16NVVlcUh6ZVBNWEg0UUp3Q1U0dFY4S3dJQy8w?=
 =?utf-8?B?QS9qYVFtdjFZU3JrSTNXQjhTaiszVlVQU2U5dm5zMmFmNjlHK0pKcTFxclpq?=
 =?utf-8?B?eG1iaVBQYWpPdkFXbEdBQTZ3YXZHckZWY0VpQlhieDZNaXZ3eWVmYUE3ZzlP?=
 =?utf-8?B?K0ViM2NqbnhyN05oSTZwMUNRTk1DTEEwTjZ6VkNKdktObFQwTlh4Q3BQQkRX?=
 =?utf-8?B?TjhLbVFyd212d1ljRkt4K3hodVhmdzBDK2gwWG8zUlAyejRJL2xoNmtZaGRh?=
 =?utf-8?B?WEZnc2JESnQraU9SMFVqbytsUTJUNlNqS1c5c2JPWk0yb3BKTmhnVitobW5N?=
 =?utf-8?B?ZEZEY0hOdm5aSGFxbDVTdG1wbUplRm5SV2ZYK3dWOWdzaW91d3JMaFdTZENs?=
 =?utf-8?B?S2Vra0djd0kxcVhtd1dFSkI1RFgzTFZRYUpRR1RsVVIrSUExc0RnUmxKeGh2?=
 =?utf-8?Q?qdJ7xqYfK2Xp2VRGnH1HvMzLp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77be855f-3faa-460a-100e-08ddc2cc1a17
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 11:46:42.6145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0MG6VZjiNum5fOL+Vn8Hp9oy6vB72r5Hr079w7ZxNPN6XtV2ruLu0D+JgT5Eotw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9344
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

On 14.07.25 12:16, Philipp Stanner wrote:
> On Mon, 2025-07-14 at 11:23 +0200, Christian König wrote:
>> On 13.07.25 21:03, Maíra Canal wrote:
>>> Hi Christian,
>>>
>>> On 11/07/25 12:20, Christian König wrote:
>>>> On 11.07.25 15:37, Philipp Stanner wrote:
>>>>> On Fri, 2025-07-11 at 15:22 +0200, Christian König wrote:
>>>>>>
>>>>>>
>>>>>> On 08.07.25 15:25, Maíra Canal wrote:
>>>>>>> When the DRM scheduler times out, it's possible that the
>>>>>>> GPU isn't hung;
>>>>>>> instead, a job just took unusually long (longer than the
>>>>>>> timeout) but is
>>>>>>> still running, and there is, thus, no reason to reset the
>>>>>>> hardware. This
>>>>>>> can occur in two scenarios:
>>>>>>>
>>>>>>>    1. The job is taking longer than the timeout, but the
>>>>>>> driver determined
>>>>>>>       through a GPU-specific mechanism that the hardware is
>>>>>>> still making
>>>>>>>       progress. Hence, the driver would like the scheduler
>>>>>>> to skip the
>>>>>>>       timeout and treat the job as still pending from then
>>>>>>> onward. This
>>>>>>>       happens in v3d, Etnaviv, and Xe.
>>>>>>>    2. Timeout has fired before the free-job worker.
>>>>>>> Consequently, the
>>>>>>>       scheduler calls `sched->ops->timedout_job()` for a
>>>>>>> job that isn't
>>>>>>>       timed out.
>>>>>>>
>>>>>>> These two scenarios are problematic because the job was
>>>>>>> removed from the
>>>>>>> `sched->pending_list` before calling `sched->ops-
>>>>>>>> timedout_job()`, which
>>>>>>> means that when the job finishes, it won't be freed by the
>>>>>>> scheduler
>>>>>>> though `sched->ops->free_job()` - leading to a memory leak.
>>>>>>
>>>>>> Yeah, that is unfortunately intentional.
>>>>>>
>>>>>>> To solve these problems, create a new `drm_gpu_sched_stat`,
>>>>>>> called
>>>>>>> DRM_GPU_SCHED_STAT_NO_HANG, which allows a driver to skip
>>>>>>> the reset. The
>>>>>>> new status will indicate that the job must be reinserted
>>>>>>> into
>>>>>>> `sched->pending_list`, and the hardware / driver will still
>>>>>>> complete that
>>>>>>> job.
>>>>>>
>>>>>> Well long story short we have already tried this and the
>>>>>> whole approach doesn't work correctly in all cases. See the
>>>>>> git history around how we used to destroy the jobs.
>>>>>>
>>>>>> The basic problem is that you can always race between timing
>>>>>> out and Signaling/destroying the job. This is the long
>>>>>> lasting job lifetime issue we already discussed more than
>>>>>> once.
>>>>>
>>>>> The scheduler destroys the job, through free_job().
>>>>> I think we have agreed that for now the scheduler is the party
>>>>> responsible for the job lifetime.
>>>>
>>>> That's what I strongly disagree on. The job is just a state bag
>>>> between the submission and scheduling state of a submission.
>>>>
>>>> For the scheduler the control starts when it is pushed into the
>>>> entity and ends when run_job is called.
>>>>
>>>> The real representation of the submission is the scheduler fence
>>>> and that object has a perfectly defined lifetime, state and error
>>>> handling.
>>>>
>>>>>>
>>>>>> If you want to fix this I think the correct approach is to
>>>>>> completely drop tracking jobs in the scheduler at all.
>>>>>
>>>>> I don't see how this series introduces a problem?
>>>>>
>>>>> The fact is that drivers are abusing the API by just firing
>>>>> jobs back
>>>>> into the scheduler's job list. This series legalizes the abuse
>>>>> by
>>>>> providing scheduler functionality for that.
>>>>>
>>>>> IOW, the series improves the situation but does not add a *new*
>>>>> problem. Even less so as driver's aren't forced to use the new
>>>>> status
>>>>> code, but can continue having job completion race with timeout
>>>>> handlers.
>>>>
>>>> Maybe yes, but I'm really not sure about it.
>>>>
>>>> Take a look at the git history or job destruction, we already had
>>>> exactly that approach, removed it and said that leaking memory is
>>>> at least better than an use after free issue.
>>>>
>>>
>>> If the job was removed from the pending list in the beginning of
>>> the
>>> timeout and drm_sched_get_finished_job() fetches jobs from the
>>> pending
>>> list, how can we end up with an use-after-free issue?
>>
>> By adding it back into the list after the timeout handling completed.
>>
>> We had exactly that before we came up with the horrible design to add
>> it back to the pending list in drm_sched_stop() and the free_guilty
>> flag.
>>
>> Could be that your approach now works better, but I'm really not sure
>> about that.
> 
> This isn't Maíra's approach; this is an approach that is already
> established practice in DRM. Have you looked at the code? There isn't
> that much magic happening there.
> 
> The job gets added back to pending_list. For the scheduler, this is
> like a completely new job, with the timeout handler running again and
> the other work items picking the job up when appropriate.
> 
> Maíra ports several drivers which have been (illegally, outside our
> API) doing that and it worked for them.

Oh, good point! I completely missed that.

> Now there's a centralized solution; one which is only active for the
> drivers which choose to use it. Other driver's aren't affected.
> 
> IOW, my main argument still stands: this series doesn't add a new bug,
> but improves the overall situation in DRM.

Yeah, if it's just a cleanup then please go ahead with it. Certainly better to have it centralized in the scheduler then every driver doing it's own thing.

Regards,
Christian.

> 
> 
> P.
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Best Regards,
>>> - Maíra
>>>
>>
> 

