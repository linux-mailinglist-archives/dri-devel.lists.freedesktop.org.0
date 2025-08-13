Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB23B2488A
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 13:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A94B10E1E1;
	Wed, 13 Aug 2025 11:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Rn29RJHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012011.outbound.protection.outlook.com [40.107.75.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E8B10E1E1;
 Wed, 13 Aug 2025 11:37:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTFBrDgJxaINNrnbfJodlmDOgMvJNJOJY1bAQbXbBULhY342camovx89ECDv/VykFi0UFu55cpRFkBeg7/ft4gmaIqr4RzAePjK44iuZoN5rwuGHQyPOv4X1EQRx2rEfIbGxixvezvXiZFVRvoYpvqQNQHKb1TWzvhhpML263SIF+MZ5PQK00r2Kd1pm/1QildYWgqOWZrwT4tbswK9C1XA2VhQh92vbyPuF7iTgcYGWIjUXE55r3ijwlzeug8fXBsxYcencsVAYSMgBiDZlQF69MPcv3E4wJvV/j3lG40G5U+Raqhuooyy2Us83TjoMGWzSV67DuATYEBK7Yvq3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBeVkaKjyGLwDpMJaocqPF1bbKlxN6S9W0uCDt7Tn2s=;
 b=IvcidOo0A2bymsMusDLs2hiHVuLZfllkcTWDc7q3LenKRx69vMDZSmqTYCRBkaf5jVBdEd/dDssFdpINrMjJA4URlzZm272CU1viE28kt/PYQEYRmHnog0nfV/Hz1Q7NpFbdhU3S3uYHxVyKtUNDp+AnZEBpUy2LqCQzH3L7zVzs8lzoJ5YSqdMfUwnnNLtSx/5h9k5wYdOP1leraNzr0Z5ZS86aIUKtUa+5+dAb3RwT/JrcaTQfeOAC8MlV1BeZcj5LoHNZ/+5HUWed3GfP6wkBQCw/t6sMzPzY+WKg7oCz97jYPZghoV8r69ehDXofyF6IAG+Dn9Nf1TYX5pidsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBeVkaKjyGLwDpMJaocqPF1bbKlxN6S9W0uCDt7Tn2s=;
 b=Rn29RJHzUEsJ7zkwrFAyRqTz0SfDEKzIeqerKi3CYgoMLPt3QtIe67Aw2croMO1jzWX+b7KEU0W53tgfzVJcgxhnDphNHmjEOaMtitjbvDMHG0w8klEat6BXKilhLEXZ+6g0KUyDLVtqBZPcUFy0l/ZRrbFveqBiB+bGu5RRT77I/kiz1BGn2JEm0wVEopicFepSmDd6b87VsXzV24X6DzOEijMcytZml6NoufvEsr4NRhz4pzASzZUX2UK0gUDO2eJvvD07HUZGO9NzTU/bfr8O2DwSc/sI55lIM8ukfq88cpVAbSsiWANc9/br3nxD58U5s85mPRVBR9WiKLAl2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB5595.apcprd06.prod.outlook.com (2603:1096:400:31e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Wed, 13 Aug
 2025 11:37:04 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 11:37:03 +0000
Message-ID: <fd8310b0-7265-434a-acb8-23f98d110e6e@vivo.com>
Date: Wed, 13 Aug 2025 19:37:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Content-Language: en-US
To: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
 <20250813134622.000069a0@nvidia.com> <DC18YY6U37ZD.16KGMXOUG43RO@kernel.org>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <DC18YY6U37ZD.16KGMXOUG43RO@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB5595:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a8f2fb-74e0-4fa4-de46-08ddda5db9a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnhnbnBFd0hKODViS3ZnL2V5MllBbVVXditmc0dhRDQxYnBRTk1JYXIxZXdO?=
 =?utf-8?B?VFR3MjY2S2I1S2Qzb2dhT09yS2lrR0xSdEQ5MERNUjlTcXg0RmxvVFhLUVhx?=
 =?utf-8?B?UTFqSUh4VldQcWt6OWNBR1hXd1k0a0NDdTVDZm82Q0tvUVl5cEE3cHpWTVhM?=
 =?utf-8?B?N0xWTVZNeFIxYUVoeDB6eGlqWU84QkRLdE1ON2UwU2tRRjhtZDl6aGxNWTZL?=
 =?utf-8?B?TXQxODF6MDdROXlOYmJEZjBPWWtJWThlc0RqVWVLOUprSDZxamdIOUdIcUJ6?=
 =?utf-8?B?VEI2ZTBxQVVYbTlEaHoxUUtsWGpVQ1BhUmsybmJ2clBZYWZicDc4NS96Rkpv?=
 =?utf-8?B?emVlelZ3Y2YvemZEeFhiQzRBOUJQZS9VNUxNdkxjcDM3RlFsVy9ZSUpyMTY3?=
 =?utf-8?B?UTBCVFlFdEUwWG5wbTE3NWYzSU5Vb2I5SlJyTE96SGhjMnY1OHpUM3lWbUdO?=
 =?utf-8?B?bGplVWJDdVQyK05VS2VzekpmWEhZOGNXS1pyY3NINEpFSmlRMHI5NTV5VnN4?=
 =?utf-8?B?MkN1YjJNcHVWckxsZEZiNGpCRnBJaXlhYXI1SDMyT1IrSXo1WDNYQ29DN0JF?=
 =?utf-8?B?UWRySzJCTnNTQ3RXVkdzNzZzN1JkU2ZVQnprTkI0b3dtWFdVNVZLbGhOcHJi?=
 =?utf-8?B?TUQ0MlFMaVkzdmVqNTBwSDlRKytHRGdBbVVGRlg3cUw1aUZya3pWVTdUZXho?=
 =?utf-8?B?UzZXTGhaWnh2QTVScEt0TSsyR2Z2cWpCeUk2UE5TbXQ0N2RjUkIrNS9SWlA2?=
 =?utf-8?B?eFZrckJwVDVHMG4rSmVMc1krSUJIa3BzR09YZHNNQ0M1QWVMT2xTWlorV2I0?=
 =?utf-8?B?c0tSWmxua2NjeUNzdDBKTS9TMDJ1RzBVcmgwdnBjZnREOVYyekI0cG9EWUxj?=
 =?utf-8?B?cWJvMklXZHVTT1NsQTV5NklZbUNBVjdtcTR6MWJRN0tZRHEwdXcwYlRVSDRQ?=
 =?utf-8?B?bk5jcE14K0lSVm5ldTVTaHJTVTVwSUVSd281V01RQndoTm9QQVFuVXVxTDFr?=
 =?utf-8?B?NW9NQUNYd3dQUEhjazUxSTFIb280NmFyY2lNUHhRNkNBQTdmZ3VMVTcrbDlD?=
 =?utf-8?B?dUNPVy9xSi9VbUd2WUZ1ZlhrZXpFaFowRldyNFVTUkkraHBpeUVhenltMzla?=
 =?utf-8?B?L3RncUJNTmlPSm5CaEtkMGdmUXd5WXYyRVBUYmRuN0VhQngyZFRTSVdLRkhx?=
 =?utf-8?B?dFI4SWVrUk95SHgzL2ExSGQ4M0RUZ091dkZndmhzcHZkS3pkQW16QjZJS253?=
 =?utf-8?B?cGRtSktjZzN1YlNNRUhvWnZVUitDc2tTaHNHSzRVUXJKUW1RY3Bsc1J5THNP?=
 =?utf-8?B?M2dGUmE2NGY0cGcrc3dlNEZnSFRqYzJtbFNyVVFzSktUSnpMQWR5RkJRMDdk?=
 =?utf-8?B?WUI0clNkMUV1dEMyN2F3U2dhVGJ2NkxXOUZyWGNwNjZzMEYvMnZKNkFvV1JO?=
 =?utf-8?B?RGZya05WN2FXWkR4ak9HUERsaUh5OGRnelVWd1I5Rk1Za3l0M0xFZGNtMThL?=
 =?utf-8?B?ZDFBM29KT2d0ZVE2N2xYSDlBcjF5WVVwbnhtMFNmZDcyUUtmWEVpZTN5Smoy?=
 =?utf-8?B?N0VxVXd4dHQyeWh1eE9BMDJMbGI5ZG1mdE1IZGwvbVpLWjJqOHcwbVBqYmFu?=
 =?utf-8?B?emlXdlI5SUtrcjJqc1VzaHE2eWFRREYyK3EwYVdlTTJrQWFGOUZxaHZuYlp4?=
 =?utf-8?B?TTZ1QzNCay9EdmlwdDN0N1dJbXFwODJlWWFNbll1T1JxbGUvR0NzeVMvbGRE?=
 =?utf-8?B?NTlsZCs1Y3orOUJ6Rm1aYm5vT08xMmNPYzJvUmFPUEcxcFVLa2s4clRpRkFx?=
 =?utf-8?B?bDQwcVc4aFVmbG42ZFZFc0tkTzNQa3VJUlVrYjk3MUNEeGJMN3drRkZPb1JZ?=
 =?utf-8?B?RTMremNZaHRIaHFGYW9oWk94dFQvTElWYVFSOWJrMUpXVDJhRmJZczBDVmNi?=
 =?utf-8?Q?P/CxmiffTFc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnR0WUhhSnhmSmxuQnZPajU5NVhiS3ZMTk1TcDJBSGtoY1ZSNWkwd3JTZmlp?=
 =?utf-8?B?Ty9EdFdRdW1IUERodlk1ZlkzOTRWK2NGRVZQbXM2U3c0eHZHc0NaUTAza3VL?=
 =?utf-8?B?RXlpZGNYelhnR1cvVDRya1cwTlR2NXAyWGFZc1ltNjZzbFlBUHpGcTQyWDJR?=
 =?utf-8?B?cStNRHhjajY1L0xpalNZMER2YTNvdkhzODg0NlVsWk5Fc2lEY0RQMFp6M1A5?=
 =?utf-8?B?UkJxbUwyYWJGUFZyaXpZQ1VFclBLS1BrNUFGVFBQeTUvd2t5d1pxNHptSm9Z?=
 =?utf-8?B?Q1dtSkQyVC9LZUpFdUM0dWh0VHlaKy9yTnNZUnoyMDN2QVhocC8yL3d2cmcv?=
 =?utf-8?B?ZWtSMHMvTCtMSXFuZEFsWnpsVnAwb1QzTEhYRWVaYmcwOGRQbmt5eDVsNjFK?=
 =?utf-8?B?S3B6WTUvemF4Qk5wN2VyOWVBVThtbEUzMkFMQkVnNHhBYzdLZytleHdiUHlR?=
 =?utf-8?B?UnBkZlVibk82YkJnR1ZNbVBJVzdEWGRrd2NmcTUyM0p2aEgvQUFTR2dhMG9R?=
 =?utf-8?B?RHpwYlRVR3A1TlRubDQ4WmMyVEFPVzdrL2hoT0xiaVhkdG9aM2NZZkJGOXp4?=
 =?utf-8?B?YjZIMk5TTkpzOG1MQ0JQV3VSOXI3K3liOElkQ29ma1FEZjlnSXJCT2ViTHJp?=
 =?utf-8?B?MUVINERRSE84S3paTEdXaDFtVEM5blZyRmowdTB3NGFYcWhBaDNiU3YzaDRm?=
 =?utf-8?B?YjI0LzRmL3hYVFB5THRiNjV4TllnZXUwbzFMRkFwVzVrMGV2cmh5SXVlb2Ex?=
 =?utf-8?B?RWhET3BOZnpmYUVHek56UUh2UTBvVmV5bXFpMGtSKy95eTRyK1A5TUxGYjRj?=
 =?utf-8?B?RlZ0RmpGWDd1dTVHaFZBMUFINHEveVJLbkwyZ3ZueDJKR3BsS2xya0hwZFhT?=
 =?utf-8?B?UVV5ZVhvMEZsRXVMbWJTcGYvM3hvZFdGdnIxaEo0OG9UZ2R1RCtYODJGVG5L?=
 =?utf-8?B?N1lrd2krU2xQSFBlMlFqcHplejhnT053MjI5YVhRV0lYWEJJcXNmd2psK1hT?=
 =?utf-8?B?V0FINk1IUTNyeUxIQzVkc2c0YnRvZlRVNHdvRitMbjBraTVCSEpmWDdSUmRO?=
 =?utf-8?B?Q1NXNExMNkJnTG5JVHdBckMwRlFoQzZab1FwT2V2ZVVCVlh0WEhzeFhxVUly?=
 =?utf-8?B?M25hR05zQXhSVUJGZ3NqZmNDbFRXSXViUkdQVm9JQjhHKzB2YzFRK3M2U0J4?=
 =?utf-8?B?R2pDY2s1NTVWQmVnWk9MQlEvRnMzQ1lNaUZTdE1CWUVGbEU3RlptaVZERjhT?=
 =?utf-8?B?ZE0zSmpaeWZYSHg5QUNhSFh4anVVNS9RZlNCenZWQ1kvb1dmNWhaM0VOQ01y?=
 =?utf-8?B?NkdYd2RvYitPRVcvQXFDMnZjQUlaUDdlRTdaRTQ2VFExbkJLbHZGRjVQd0s3?=
 =?utf-8?B?c0ZnREFuODVmYld6bmhheWovbHkycjZXUWJ0Tml1bHpocmpWSWlvNTgxbERw?=
 =?utf-8?B?QVVFVENKR3V3NmZock1HZ3VYNzZQNTE5NnFFRFV5T2F3ZTRsWlNlem5GeWpm?=
 =?utf-8?B?SjNLY1VHdXVOcStSbitlMVZjem5lRGZpM1hIcEFyRENOOGdsY0ExVTJKVEJo?=
 =?utf-8?B?MkR5R3pVWHdzb3dJK3lrN0FxbmJMa2JtTGt6Y016S2tFTzNLVlJWTEFwTnlL?=
 =?utf-8?B?Z2hQK2ZwZ1pOREs4ZzgrcklHenk1aEVTbW5GcERFWTVHZ0dXaExXNkFYOTI4?=
 =?utf-8?B?TUJMOFp2Ry9ySkZkOXJwOWZtUGpFYWV4bkN3WFdOS0YzYnI3ZFkwYXc4N3VH?=
 =?utf-8?B?WWNJcXBBNUhFUUxURVJ6NkFWTnpLNkJ6MSt5Yk5zM2pxOFI5WW53SjJwMFFO?=
 =?utf-8?B?cEFWRmkvNCt3REF3cVBOMXZTYVBMV2tpb05CekdlOGZkdEh2a0Z3QUNhZm94?=
 =?utf-8?B?ZXZjMFNJZHpVbFVsd1BQUEhkcjdPbDJHNTRKNGdhZEp1ais5R0hVUk9Ca3ZQ?=
 =?utf-8?B?WjRpQ2tKNDFLb24xd1N0R3pqYjZ3TWVwdXU1ZnNCWGxkdUJBVWlZRUFKYnRq?=
 =?utf-8?B?TWhXbE42QkNxMUx1S3R6aWdSQ3g1am1iR3Z4R2VQb0JXYlp1R2kwcUVxbFFI?=
 =?utf-8?B?UUk1d0ZEUHNoa0dmb056YkRlSXdzWVA0VjZkakRsTStQNUZFSnRmSktDeVVB?=
 =?utf-8?Q?V+nIKOmkJouq9UIquocye3uqq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a8f2fb-74e0-4fa4-de46-08ddda5db9a3
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 11:37:03.8996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9kkdg0VPJDQERn8PgzjY8/Ij64xh3rLqwYrx1rOyexDzu76bjZMD2monP0ql/QNMo8SxxqmlPqBqtjg0sDHIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5595
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


在 2025/8/13 19:01, Danilo Krummrich 写道:
> [You don't often get email from dakr@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Wed Aug 13, 2025 at 12:46 PM CEST, Zhi Wang wrote:
>> On Mon, 11 Aug 2025 17:19:00 +0800
>> Qianfeng Rong <rongqianfeng@vivo.com> wrote:
>>
>> Acked-by: Zhi Wang <zhiw@nvidia.com>
>>
>> Please add a Fixes: tag.
> And please also add "Cc: stable@vger.kernel.org", thanks!
Ok,  Will do in the next version.
