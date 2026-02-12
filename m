Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMMnONSOjWl54QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:27:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7912B4A7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 09:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE27210E70C;
	Thu, 12 Feb 2026 08:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jFx/F9g5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013057.outbound.protection.outlook.com
 [40.93.196.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C634E10E70D;
 Thu, 12 Feb 2026 08:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGilt9J4JuMN7OGTaiXCVXoZzsX56+Yjyh1iHfCnmjlyd1vsDJmxPN/LqO3nQIrvViqf6/HYtOUeUy0XxZEN0v5Po4Gbhl186PvlN+zxvCL2QiiiJtGqSpl833h0I34B0JLtt/qZDWcZ7p0OWAQjPyNPAMQNb1I1RBTwIQ2+NK4qkAYOp4jIX9aB2v+Xj20qSoRKnAbdDhGe0iRUSZzlTk8VcZ75naGuYBinE9fgF8E6o12TWewytPN01AxJpkTFVbJPOuX+4k4BNcsy/sx2CaJ+ShEH1YwsJ+AIcVhclJ2MB7oA0XoI2Yv2eYwpsNuVyqja5ROuvP/2Mp29D0Hv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph26vy9N9eU0sDcCHmi3vraH+lSuYIDVWhqcJNU2x4U=;
 b=S3NarEwCOldCQ2OPQM53VFmG4uXE/5NhrUxRTZepoeQFO6SsEDXe8Eu9Wz9zHZiXMMnn/A+ZAmtdS2tIEbDCTDwAICjcImc2ot/MW7bo4Z6ZkvfuDYOnt3lbbvNMrQj3OsRRRHvGqdcMLhn4gj/f8dQOUoO5Jd7NKDxj4WOSAtukGDej3NLHWr1CMziS6m/NPB1UxQjvfMHn8sXQYxh4u6C/zmH3HfTyBxdK6pBQvga3f5DH0Gv/T6S6e8fvKe/PIsYdktG7IRMWlMHtGnj6Wc7HcvZWFcKptCRTfxIFxjVsMDABSmZsfSdEVIxD+tlZ514t0U/KrJ7cVCTHxHZj3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph26vy9N9eU0sDcCHmi3vraH+lSuYIDVWhqcJNU2x4U=;
 b=jFx/F9g56t7te+FyNKpHcfWZWZ9aImaAKdDwnEHQ7L29DM7+r+3W/+eCQPAV6OBXhsfnz111Q3sl3S69tO2hn77nLpfGMTr48fAq3amQr/mHEw6PIuOOcQwURGh7uwWqbfaeSAbGXzDlrd5J5l9cyfotfNB9zpNjG2mQzbyBZMgO8fv0MHAQtENrHO93FNINDWfKpD6apMc2PshZpQt/sbhA65TrUvy/Rj5sI0atxgCiNq4VuUHjHY2BRnTyYQWiu5DFIQVDlVAV539v5RCQBMZ6K2yemSdHH2QvjnotisWiBjf3tNRTVh9saQkW1euMrby96My2VPklqwntZNtfoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Thu, 12 Feb
 2026 08:26:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 08:26:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 12 Feb 2026 17:26:25 +0900
Subject: [PATCH v9 8/9] gpu: nova-core: add gen_bootloader firmware to
 ModInfoBuilder
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-turing_prep-v9-8-238520ad8799@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 31423062-c192-4f60-1deb-08de6a107b19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2k5RlJ2OXROWlptZzRzSE9zMHlDSHNPamxuZ2hWL29DSGVKbzVBdUsyNEVD?=
 =?utf-8?B?UUN5OEJuTXRvQzVCanNGSE84SmdxSlJOVGcrVWNoTXp0QmtyMDhTcVZDMnMy?=
 =?utf-8?B?RUNWWTNaajE5VXZobElrdlRLTjlhK0RaUDBxZmtXUkU3ejZ4VVJuWm02TWo1?=
 =?utf-8?B?UFJ5MGt2cHFtazVTKy9KdHhmdmQ5b1oxR2tPdzdjQ2U0RW1acHhVSmhMYm40?=
 =?utf-8?B?MVZMZnU5YzVvZS8rMFpaQzRFVURxMnF4d0FwelR3N0lDMGl3bEZ1MU8yMUpK?=
 =?utf-8?B?TUJYNmx0TldGcUZaejRpQ2NtT1c0ejB5ZTV2VGtmUHJ5Wkg0WFByeFBRUjVB?=
 =?utf-8?B?SkR1OFdYQTBPeWp3RHV6WFFqL09tUmhCR05aUmljemJJd3QwL1BTSHlkMlRX?=
 =?utf-8?B?MVBFOEU5NzhabG9kaThIYkVvaFlpRzVFLzN5ZmszK01QbnZKdXhwZXB2MjJw?=
 =?utf-8?B?M2wzckl2dWthWjAwOWxBYUFTZWhRSFdlMG9QZ2Y2MXp1ZzQwaFQrb3JjcDgy?=
 =?utf-8?B?MW9xdllJR0xheU04M0JKSnhLcjZ4aG5ydHhrOU5FOUhFZDhlT2lkNUs5S0hl?=
 =?utf-8?B?WXBHUGZYa3cwL2JqYm1LU29iZ1lyMnEzWFBqQWwzeEc2KzBsQWg1czNHT0Fa?=
 =?utf-8?B?QjJuekk3QWhuV3lVZjlDT01oMGtmU3pKS3AvQ1lmeTU0SEg5bzFqSEZHaDBX?=
 =?utf-8?B?bUpNdFpHYXYrNWp2MUlPcW1CYkoyaDVaVFBxaEFzS1NwQm9BRXJIeXBNTjZL?=
 =?utf-8?B?TWhRU1VKQ3NMbVdpVXJPR0lwUUcrYnhvTXVYeTRKdGFXaHVKU2cxelhQS0ZI?=
 =?utf-8?B?RTkrdUlTSm1IMFR5WGxHZ0xmaGV6UkN4YVJlZlpMNUMwTkwvVnJlQ0dHcElW?=
 =?utf-8?B?VGxFdlRCSFBMQmZoSEFsa0x4RmVlTUgxYnRRcUVEREtPQndnUFdiRG81TWh4?=
 =?utf-8?B?dHFXM3lEb05yZ08yaldSNEI5Tjc2MCtzR0JaZVZWcmt3cGdFZWZVK3UwQjBa?=
 =?utf-8?B?S0xwNFJkSEhqNHV2Q0hZQ3gvTFJSc3FXdUxJVGV0cERpT0JlNVVuZC9GVDBI?=
 =?utf-8?B?VG90V2hYdXFkL0tDbDV3aGI4VzBtU3J4VTdRcnNST3YzanVvTDNSelJUZ3VX?=
 =?utf-8?B?ZUFrOVk0Wks0Y2hadTlqeDRsQU13SDRvSEJsWDhBZytacjY1Sk14UzNIMVNn?=
 =?utf-8?B?WllPWC94NlJkMURNbDdBKzAyemUyV3JZUFlQUUFmazQwSEtBbUVFNi9UZFg1?=
 =?utf-8?B?VVJZMWNlUjJJdEdEb0ZKQUMybDFzZi9ya3NMWTNWSGF3RjhBSmF1RVB6blJU?=
 =?utf-8?B?ZmJOOGo4WXkzTXdDU3E5VXpYRFN6dTlXRzRJMWt1bmR5VGVoOUo4SW9vQlVJ?=
 =?utf-8?B?OTJWczBYWVlFalNaQkZLVWxiVzY2UThFT2h3UFpaRGlEc0xKei8wMmwvb1cz?=
 =?utf-8?B?dUtGVVFvMnFJaUt6UXl1Ylh6RzVCWXN2SDNERmJ6elI1K25uM1JsYm9PUWpt?=
 =?utf-8?B?aDdCR0IrditIVkxpazZvYlo5U1ExOGQyc0NXSDkzczUzL2I0WWs3SmFORjNK?=
 =?utf-8?B?Z3c2WlBqcFJKam5kRjNOLy84ZVZQQS80Y0czb0h4Y2tSWVNOclpVV0tzcnZI?=
 =?utf-8?B?V0ErM3pjRVEySFZ5OGljK2RROEtHOWxlSWdZbEhjV2xGN0lIYy9YdWJKaGxs?=
 =?utf-8?B?dUhCTDNwSFBPTndYS1h5VmNzRUVDL0pFQ0ZBYlJsWGxvdk1leWc5Sms2U0tk?=
 =?utf-8?B?aHlMWHFrdVNDRWdTZDRFaUdhQ2kxc0lidlhzTmpYeFMwQUNuV0JUdjNSZk5j?=
 =?utf-8?B?R0FYMmdKdmxpRnQxZHFURmgrVm9mdGN3UU5zaFpZZmR3SUJlVy8wVnFjLzQ1?=
 =?utf-8?B?c3NNUUJpNmQ0VHErYWUzdFBCS1p0cm1Md21Uam5nZHZlUVFQRkZQZ01iMnl2?=
 =?utf-8?B?aUJ3MndyU0xEMDVab0JRTEN0WUdmemRZTmlZcnFLUEZQYTQzbFdlVFdscjdn?=
 =?utf-8?B?UWk4SjQrdkZOakQwU09LaGY2R0QxMzlXTXVBNjJveTNnV0x3RGg1RmxMUnJz?=
 =?utf-8?B?eGpvM2IxUjhJbm9jZXJBODdEblI5d3RxNHBiYTlZdld4OFpvYTZ5V3phcFlV?=
 =?utf-8?Q?qQDo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1pNRTBXcGYwMldpeDRoMFoySDdvRnBYaEJVRkw0Q1V3QWZYdVNaMW53RjVU?=
 =?utf-8?B?RGRuWDdUT0dUZ25FOG9QYmxSZGZxd3JHM1U3TGpPM2EwTnc3NUdPazlIUi9G?=
 =?utf-8?B?TjJoNnN2WG5FcnFVSVBLSmduWC95MmlLUmlGOVlIMXJBWHpHMHR6dGphS0p6?=
 =?utf-8?B?ZUVvWFFWK2pkcE9aTXRVV1l1Y0tUMkpsa1RtS3ZmQjRKaG5ld3kvUmU4U0ZH?=
 =?utf-8?B?Yi9QYW9sTTRsRWp5Vk1VN0Q2T0dHNGhxVnJSNmhNdlZUaEZlL2l4UW1DckVt?=
 =?utf-8?B?Z1RicjF1cWY5T3l4S2l0Yk0zcjdYOW5VZEVXT2o2aUhDNXpYVTBuN0Q1TWFj?=
 =?utf-8?B?WWQzZTRDOVFuTHl0b2dLak5kb3M1Q3FjTmFORlowblQ1NEhPYnFRWEFKNG51?=
 =?utf-8?B?aFoyY2gvSzlzeHhMNTdyVGlNTlMzOVlZZVBTV3lVR2lKWHR0dXRDVXdWbkMx?=
 =?utf-8?B?eERHZTNvUzRMekFPdjFSazc0ZmNKWHo5VTk3dGRvVDhHVi9vUkNyYnR6dzFM?=
 =?utf-8?B?NmMxdVNDU1pKYmRCaUlhRGEraFhRZHFLcVJ2Q3EwcER6R244NlRYSjJydTRl?=
 =?utf-8?B?Vjd6ZG9QK0J1WFRROVpkN3huSmVJMEROYkZNRzlHYjYzbjNBbi90Z05SVEpi?=
 =?utf-8?B?TnF1TDRsWXZiYnhnVnVwYmVqYkFGTlMvcFlnamVHWWkvTDhJTWpUelFJVHVr?=
 =?utf-8?B?TThHNHZCRDhIQzhNcmpsZE5oYmlpN0hRcHQwMEkyY0lJZUdRVlVnQllRUkpB?=
 =?utf-8?B?UWZpSUxxY1NFbFkySGFiU0ZBVmo2dVEvSTllNkR1QWVTWFRuSEI4YzltRWVS?=
 =?utf-8?B?NFE0cVVnUjkvVmpIWmYzZms2WFpQOXRXbURDYjU3RHJEMXhkN1pzc1hoMWQ3?=
 =?utf-8?B?ZDd6OHpabTBJZEhjc1pFakV6czZQbkZWUUpDazhNV1VEd2d6S1p2ZVpQTDNP?=
 =?utf-8?B?OHVvV0dZdG9na0FFRGZNVmhNMHg2L0tmUWZudG8yY3RzYnRlRUpnbEM5MC9p?=
 =?utf-8?B?bHM2ZXA1OHdQMHdtMmhvSkF4a00zQ0V3N2RnM2Uvd25BekdDelk0MjV6TDcw?=
 =?utf-8?B?SVp1aTlSU29IdlRMODZhTG5HNWtVL0RKSWhSU0xBeEhtKzVJVks0dy9VVVZP?=
 =?utf-8?B?aXVXQkFpVXBCMEFNRUJ3ekM3ZjkvNzgzVVk2dFhYNTBUZW9lb3hrNi90RitO?=
 =?utf-8?B?bHRiWWxHMGtvR1I3NmRNcGJoS3JJVnNldUl2UFREZHFJQVQyeHhKUlk2anBj?=
 =?utf-8?B?UnEvV0hzUG4vNzVXWGZ3VjVXeGs2M3c1M2dBVWR1NkxMRmFaZTRNMHF4c1BV?=
 =?utf-8?B?Tng2aFh6NzQ5d00vaTYzcHJseXNCckRZd1FjYllMdkZZL1pKTlVrRG14R2VF?=
 =?utf-8?B?L0FzQmoxWXdPTERTSnpTajBGa0dlRTAxM1FNbDNucERNaENaL2l5eGI5TnBB?=
 =?utf-8?B?OXVkZnZHSFFuQmpvbEFVUEwzaVdJK1htZWFhVDN5SXd1WWhveFNmRGw2bk5J?=
 =?utf-8?B?aEd6UzlhYWZWSUthYzk1S0VaalB0MkZ3bkxPRlQwOFJycFpqYXp1RUhvZEtD?=
 =?utf-8?B?UnY1VjBUNWpsNE1ubXFWVkpoYmlWYitMRWZURkRCVmluMGMxZlhuUkpheWhl?=
 =?utf-8?B?TDBxOEdHUENCSmhxL2JGV0FRS3lPaUY4TGhpaVYydTZNUVpSVko4ZU96ZXl6?=
 =?utf-8?B?ZWNDY1RXeWp5Zmk5SkZBTlZmeHFsOStuaTZURllhRWM5M3VaNU9EOGpiRzBW?=
 =?utf-8?B?RE9MQzBZWG55VGtHYWhBQ3ZwWWR3bSt1Q0tlNWprZUkrVFEzWlowSS9KVnJG?=
 =?utf-8?B?c01YUkFyWWdJZnRvQ3psRDlWeWNYcGNWOXQxc0lpbWx2dGRvQXRnOE00SERZ?=
 =?utf-8?B?WjJvdGI5WEQzczRwWWRsWG1Lbk4vWXV2RlBlZHpFeDI2djZDWVFEcnVZVFor?=
 =?utf-8?B?V2ZHNGY3c05DSkhXby9pclo2UXdwZU8wMDlnRW16K1EyQldrdjZKVFNhQlpt?=
 =?utf-8?B?cEZpSmdXc0xiSm9sZitIeWRxQm1kdGhxZE9FNU1Nd3JWQWpQM1ZxclZSTjUv?=
 =?utf-8?B?Um9Oa0l2YmU0Zm9DQitaajVhQURlM2tnZGxuQVV1MXBiVTRhZ21tYmRpQzFN?=
 =?utf-8?B?b0cyRWhGT0RpNHZuaEl1MWxrL3V0RnJtZEJmTTZjSnN1djJHR2U5bTJWaERp?=
 =?utf-8?B?R1hmeDRQSnhNUFhReGVibWRIOFRCcjZqWGltWndKUHJWbjdCWjFpT3RUbUZN?=
 =?utf-8?B?Q1p2Mm92ZWJRQ2ZYYUhJaHBGSzVpZUlVNXpLcGpGOFlaa0VUSjFVWnNhUlRS?=
 =?utf-8?B?U2JHa3lKMGRQNkdVNGZpWDNzM3B2K3IzVE41M1gxZDJBNUpLYXY0bjAwZVVL?=
 =?utf-8?Q?kXH9oSopnc8zpK+AfpPkVESUfTvisFyqnmYiKnYb8papm?=
X-MS-Exchange-AntiSpam-MessageData-1: 9IqAf5+q5keEVQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31423062-c192-4f60-1deb-08de6a107b19
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:26:55.3392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI05sRyty2Dt7fIZ6NdkQ/g1lQfyNDGdJ56KOOKkYQAApO7gVe8kw9sVNUXvZmJxx/S1aTBdUWw3hL5WRO7+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 95A7912B4A7
X-Rspamd-Action: no action

Turing GPUs need an additional firmware file (the FWSEC generic
bootloader) in order to initialize. Add it to `ModInfoBuilder`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 21 +++++++++++++++------
 drivers/gpu/nova-core/gpu.rs      |  7 +++++++
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 5beb27ac0f51..6edcb0e0f808 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -416,11 +416,20 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
         )
     }
 
-    const fn make_entry_chipset(self, chipset: &str) -> Self {
-        self.make_entry_file(chipset, "booter_load")
-            .make_entry_file(chipset, "booter_unload")
-            .make_entry_file(chipset, "bootloader")
-            .make_entry_file(chipset, "gsp")
+    const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
+        let name = chipset.name();
+
+        let this = self
+            .make_entry_file(name, "booter_load")
+            .make_entry_file(name, "booter_unload")
+            .make_entry_file(name, "bootloader")
+            .make_entry_file(name, "gsp");
+
+        if chipset.needs_fwsec_bootloader() {
+            this.make_entry_file(name, "gen_bootloader")
+        } else {
+            this
+        }
     }
 
     pub(crate) const fn create(
@@ -430,7 +439,7 @@ pub(crate) const fn create(
         let mut i = 0;
 
         while i < gpu::Chipset::ALL.len() {
-            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i]);
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9726205d94b6..959f1f4caf42 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -105,6 +105,13 @@ pub(crate) const fn arch(self) -> Architecture {
             }
         }
     }
+
+    /// Returns `true` if this chipset requires the PIO-loaded bootloader in order to boot FWSEC.
+    ///
+    /// This includes all chipsets < GA102.
+    pub(crate) const fn needs_fwsec_bootloader(self) -> bool {
+        matches!(self.arch(), Architecture::Turing) || matches!(self, Self::GA100)
+    }
 }
 
 // TODO

-- 
2.53.0

