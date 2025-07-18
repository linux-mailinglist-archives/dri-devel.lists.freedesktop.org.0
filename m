Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A917CB09C71
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0FD10E907;
	Fri, 18 Jul 2025 07:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HvUrrFJb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2084.outbound.protection.outlook.com [40.107.101.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F8E10E904;
 Fri, 18 Jul 2025 07:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUh1Mi/ihkAzmW7aYPWVlNh7Xt/DIA5xDipqS6tusvjXWaE6AocwrzRkceJD5rUjTwcZFNyDgFhl8kizzncGt/fHsvksC1wPiCP1fP9dQ4Es8wG77YLFgFzzbx8mYrShZsPiRn7Iy7OxWYqDpH/9tXBF9DXf/948lnpLVUvqeFhH/BBwVaA9NLfMDPEL7NsJV0iFPe7JOuH21aiCpcO6kc9r2TkyPpyr7cappMq45Uc1hJFX2SMshM/YLOKx9w+TITSq7fbb/3etYYxrhbbHFIboMYMNaQm51W07hY83bxTcrMnsGu+Etcq+UmnqZPFgkEgN72oDpCe3kJGovm+5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65hJKeHP7/KnlyHyvASw2as2XtjfZwGqTf3N/VQ2xP0=;
 b=qEV06odyFSKwtcreY8vO2npmkCqhsKkoijDuLEeV4glFroFF3iS/VQP2P6NBXgK5D/KsliTZLFmeUhhHSiWB9RzjQLtLoco0W1lSp7kWt0bDgC1jwNzW1DqGcm7/mhNejLs83wIXWXoHm/eU/BpXFoemhLc/v1/QoMPDKLQqdft4EOMa91Pc8KLRrvxkZIvbsavJp53bhDKVznmyr1vGHnUZhZKu+ztRdKZJm9ZtRPZJHjSzmwSLribWpJjOaiTusmArCGxg03m4turE1XCt73F6Hr5TTiTLX3K29/wM541m4yEGdQk66vWzTpdqbzzsizh2dFU1smXAxwNnPu8Lmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65hJKeHP7/KnlyHyvASw2as2XtjfZwGqTf3N/VQ2xP0=;
 b=HvUrrFJbEyX12Rf0ePxiVsMOMKviCFz9z4c2zzGYk8HCSU8TuSyV0o+yFfNupqFRp1jykX2e2N53mAqPOqluSeaOKBzRo0c9iNOalUzhb3tI5sDGheXjcjEJ2pN0sfwoa79mZ1p+dxERb5PMYIDd7u/h45D9d2DWzepgpdYWWzijhmgQvxKCtPOt/1WBKuWzov2Q4iN5RjQdI+8kONsWQw/fiS+X+2gF4uOtQR8uxttSpEsIAFvxmIn0c/IFS+TYYYqTRFsInyozTwkZiGToXbj1evbBnkPQZM5v0+pTgH2wFSze9rR6OjCk/yIylzt4R1Qt352OtAR2IBmxG4N5Ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:27:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:17 +0900
Subject: [PATCH v2 12/19] gpu: nova-core: register: generate correct
 `Default` implementation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-12-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYBP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: cdf47f08-c7ac-4914-6aa1-08ddc5cc7c85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1NCenpqYjhsenVQUU1ScmY5TEZYanNjaUtmUDRDUklaR2cyOGRSMkQ5Q2kx?=
 =?utf-8?B?czlrdWdWQzNWQjRRallLemRFM3BiRkVNcmZGTXVCTlVZd0VMaWJSdmF0dVQr?=
 =?utf-8?B?SVJ6d1MzV1RnVzR0NFdkM3o1QjNaSnhVWmJMVDFERkNZMUc3d2owV1Q0T1lx?=
 =?utf-8?B?QW5RaFZjNUFZd2poMDFSbExJNjlvK1hXWWFkOHZQS1BpeGlJOFlZeXNveDFF?=
 =?utf-8?B?aGlUcXIwM3l5NG0wMUMvMUpRVGhMRmJsV1p2dFFVWnViSUdLeTA3WWRKMFR0?=
 =?utf-8?B?NDQ0bnFTbURLdGtPRU5XVStybU40QU05U3JZWTRWRVpuLytucTNGQWRDQjNr?=
 =?utf-8?B?dm9rbHhFUk90eUpBU1N0MXNHNTRSTXR2OVJDKzczMHhRU3dKN0YzUHMyUkVv?=
 =?utf-8?B?MjFaUmJIdXJNeXNBc2NLWW9teHFxL1ZwS0ZOOEdQWWxsQ1RrWkp0N0Fqc1JG?=
 =?utf-8?B?NWJuR09xcWJ1U0xEd1VIWk1mKzlEVzE1ZU1ydXgvSkU2am5KeXcxTmVUNjhv?=
 =?utf-8?B?eFVzRnFTTElnaVlramtKTFYxZ282Tk1YSFNiNjdQVmlpTEtpL0Jpb1Y4bjNn?=
 =?utf-8?B?QlpwaHJuUFpnR0Z5OTcwemNNdVhuMW9mNW8xckFrLzBqaWUvU3cyekZvUnVu?=
 =?utf-8?B?S2xkL2daOWdPcXRGdlhSSWhmVE1vc1JySWRuc1dRelFneXhNNkE4ZlVvV1I3?=
 =?utf-8?B?WXMrR2dXc0c2OWJ6UmpWb3ZkaDdTeTBUUGdlL0Vlak5VZFZCK3FncWdnRFhY?=
 =?utf-8?B?Z2JaZ2s1RzZqZzBaSXhjN3lKaWJaZDFSRUc5MHhxQ1RKQkxjS2VjMTJWVzBE?=
 =?utf-8?B?b29WRkRZNkthanEwcmZaelhUYUhWbzZkT09nWk9NcHNxVXNHUWtoYStVMGFR?=
 =?utf-8?B?c1Axakd4L3krQWZtVkw1bDNhSmptODdMODBMQUNmMDNRaUdIT2Yvdy9MRTFu?=
 =?utf-8?B?UlVFRmhkM1E5WlV6OUVTVUM3QVpQRkFlcGhWVVhHc0xoUFdzTUVUMUtCck1F?=
 =?utf-8?B?UWRPN0dDWUdIakR1WmxwY3BnQlhRL1o0cXZ3UjRrWkdtTW8vNVNuUVZHZnpO?=
 =?utf-8?B?RTZpcUFvQ3cwQjNJL3pXbFFlb01EQ0lTMEQySi9UMGJvZmc5NU5NZUFLek15?=
 =?utf-8?B?dm5VRnArZ0xKQWg5bFVOdDlGbkdSSG9tMDNJcVhOSE1sM1JOK0ZGeGpMMnV6?=
 =?utf-8?B?Sjl6YSsxVGZ5VkJERXpic0pQYUg4c1VTZmtYNUppbjB5bFhIZnIzK1pMUE1J?=
 =?utf-8?B?eVA4T0ZBUmpjL2JobUNtdlp6V2M3R0RqTUgzeFZkTW11eDJOZDN0YjVCZEpR?=
 =?utf-8?B?ZnJJdlVDWGZrV0drZ1VzWjNDdW96R3pQLzV5dktxV3VBaW5aS0M1ZTVPL1VT?=
 =?utf-8?B?UnVVR1dEbUNPc2FMaHdFS1laUkQ2SngwU0tXUkVOdnE4c3RlZWMzSEk1Mndz?=
 =?utf-8?B?VEdXNjRVT0J5WERZS2RpZWV2Q3BuS2c4N2FkWERMT0JRKzZ3ci9LYjVFSjdZ?=
 =?utf-8?B?NS9xeDNCbmhIbkU1ZHVZcTQ4M0N3cE01T05SQzU4UE00a2lqbkZMYVNZa2NU?=
 =?utf-8?B?MWw5WEVkdktsMlJEdFMyZ0E0cE9maFpHL0pGczdwTEdpM2kzbnh5SUw0c0Jo?=
 =?utf-8?B?WGxlTzhOY0IvanpIa05jTG81ZytwNXZ1czB3SFFqNDhGSERRY2JkVmZnSkJt?=
 =?utf-8?B?MWhzdDExSUJ5ZWRPNFA0TzMyT2VrWEU3RW56V3VJWTk2Z0xpR2RScFRFQU5l?=
 =?utf-8?B?NUpoTU5McVRSOXBWUlk5SDRjZlZtYkFRWHZCMjBOcSticFZFUDZNNUFiZk1w?=
 =?utf-8?B?RWl0aWEyMDlWcU1hTVBZUkJBMWQ2MW9LL2RuaVo0NWVuaHVUWUMvdytFelUz?=
 =?utf-8?B?eHNJcGRwanRMRnNyenl6REZlNlhOb0UzcUYySWVNejdXMWpKQjFZUEtPam9Y?=
 =?utf-8?Q?FRfWDo5LO0E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmtKTmVRdm0rNDZPMDE4TmtUVnExSTVrUGxZWThYM1czUnEvWlRhd0NpeHR0?=
 =?utf-8?B?VFRPWFlIa0ROd2FNdFg3MXNqcmdvU1NLWmowRDU0MVJWOEo3NnVCUUpBM08w?=
 =?utf-8?B?MzFidWNkRjRQQ0IxS3BGUk5jREw4Tm1nQTdWZktaenU3NVNuRU5hSHFWVUFr?=
 =?utf-8?B?RmFSZ0JtVVBRL2ZLWW5ycWh6ak41NHlMNmRGU1hVSm5IMnppZW5kWnJsaXN6?=
 =?utf-8?B?TXRJMHkwL2N5NFJ6UCtDT3ZhQ0UxeHZrT1hwcXJnNzhRbEhaZFI4Mzk2T0dt?=
 =?utf-8?B?VXB2ZHpXUEl0UCtzdjV6eHBQUkpOSUF1NTVhS2JKMG9Hdm9HRU9sV3I5V2R6?=
 =?utf-8?B?aTU1dnF2eXZ5anhud1NsRFJXbmhla2ozWlA0a0JCQlVka2FSOUlGSmI3ek90?=
 =?utf-8?B?Vnh2dmRnV0xYWmJsQzVOdFExaDNRc2ltM1VKc2hXUUlmMXZySW5XWXFoRlBL?=
 =?utf-8?B?TVVnY2lKcW8rcWRwSEEvRkcxQXNGWmphbVJLaG1MWFd3T1k5b3lYYjJBQzZs?=
 =?utf-8?B?azBkZVpuWTZZakh1bnQ4T0JXTzVzeDRSTnZMdUV5cnZxM0ZRWUMyS01tYlFZ?=
 =?utf-8?B?R1JTclhWNzJhUXFDZ3c3U3ZySDFTU1U1VXRlV3lib3o3OWxDMWxmY1cydmRr?=
 =?utf-8?B?dEFtOVYxNzluVEtEMG9RSzRQLy9lM1Byb1J0TFpReGRjdDVCd2UwWUdkMUtP?=
 =?utf-8?B?UExwa3N6WjdRL1NlZXpFT00xTjZNMDZBK3c5WVdYOWRHOHQ3RUo5VVZVVWVR?=
 =?utf-8?B?UzhUTVZOZXhNMU4rN1dpV2lsWlJWanlzQkhITXQxU1ltTjV5dVVOcFJPeFpW?=
 =?utf-8?B?THcvdk5DZ29qYU1sK2VjcWI4WXlDQ2l4MUtqZCt3VmpXczIvbG5zdExpUG5R?=
 =?utf-8?B?SDhXSGswVVM5UkhQMWZUMHIrUEMyM3BCNU1VVjJSL2RQNXVHek15Qlg0V05B?=
 =?utf-8?B?U2JRMWZPdVVJNU0yQkN0VjY3U3EwQitnMms4YW5WSWZDODFzRDhEUk9Ycisx?=
 =?utf-8?B?OEw4QzRRR0xZWUhZTkx5cXF1NXpXaDhDZjJITG8yWDA5R2wyMDBOYVEyNEhy?=
 =?utf-8?B?MXJicWhrRm9Pamp1dEY4ajFMNVFNMTlOTDA3VThYcG5kaVJyWEgvREpLR294?=
 =?utf-8?B?L0xxYzk5QVJTV3pVQ3Juc2J5YWtOYjNTREprU3NoZUFuWGVlZlFHcU9xWlRi?=
 =?utf-8?B?OXNna1M5WlVaMUlVK2xkVVV6YzRLcEwvd2pIUkJCbXZDTjRYeHNydy9CdHBo?=
 =?utf-8?B?WUNXWFNBWjA3ZVFFK1hKQUZjVmNwNS94TS92TzVzQm0xRGFEaXFYbmZvdytw?=
 =?utf-8?B?ayt6WDJacW1YYWg2REpjQ3VzMzdqUi9mWDFIeE1oRVJwUVlwSm14eWJOeVVo?=
 =?utf-8?B?S3ZEMHF1bjYrZmg1MVFBWHYybE1ReU5pNlpxd3NSajlFU05wUzBxcVVpNGx0?=
 =?utf-8?B?cnU4UU5LVGdIclJmNlBOVGs2WWplUDFzQ2tRc0ZTUUZGOWZvajBDRktSSlZu?=
 =?utf-8?B?YzVhOGZuZXZyS3ZLVUdEU1VnakJtZWRlWjRYK0ptSkZrakxJdlZscG9uZ09F?=
 =?utf-8?B?Y0tMRjFPdGsxbWxqN08zSUFCYU1nR1JMVXhaalNDUjlJZkg3NG54SWtHbjgv?=
 =?utf-8?B?eE4rTUdrZDdZRFZRbko1NW9CZzJoUk1neUVkeVRmZGJ2Y082QzFWQVNveVY1?=
 =?utf-8?B?UEIvd2hQbWVSNUswQkxJVUd2aDZZdmhJTFdFV05BSnd6RkpjaVkveFZjOFlS?=
 =?utf-8?B?SkVrWnFzTVBac3ZzczRCa3dpRnZHMnMwMGtOS2tRbHl3R3RldUhzVFgwOEl6?=
 =?utf-8?B?WW1vbnRNVjhOZlM5eGlFMXpCWUpLWHZRMlZBb3FnSytIaXZ2TjFsbm1oZHpa?=
 =?utf-8?B?UDFBbG1ROUZzVmdCaUF3cWk1S3lnVWJ3czc1amNTNmpuMTJrZUNvTS95RWFV?=
 =?utf-8?B?RThuZHRNR1lyWGJaTER5TGtLOHlHNXZoQ3VBTjJtaWlEYVhqMS95NWRNZ2Ew?=
 =?utf-8?B?OWI3S3hwMndTMnVuclFWckltLzY4R0c3ZGk2dWR4SEp6Zll2UGplTDNzOHJU?=
 =?utf-8?B?LzBpRVBFQURUSTlCRmtTVkVCa3E2Y2kzNlNySmtYYUxHSklaeUVEMVNITmJP?=
 =?utf-8?B?ajc4NVVvUFh0ZGEvSklvaW1QNmRzU0lpWUhNcDU3NDVRZ1dMMThPeFNzUVkw?=
 =?utf-8?Q?NMKoBOm8uwfMGDVY3nsLy568mI1t3eSWYJ/67Dgb+kPY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf47f08-c7ac-4914-6aa1-08ddc5cc7c85
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:01.0755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDG9uk2glova+gbCzAXRcqBE7f5dcCNerf0ce2Ub4wkcvTL3K2Ie/0/yET2VUl+FFF3qNPyvB9Ejpn0CVKxTCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

The `Default` implementation of a register should be the aggregate of
the default values of all its fields, and not simply be zeroed.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 485cac806e4a6578059c657f3b31f15e361becbd..f0942dc29210f703fddd4d86b758173f75b3477a 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -112,14 +112,14 @@ macro_rules! register {
 
     // All rules below are helpers.
 
-    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
-    // and conversion to the value type) and field accessor methods.
+    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
+    // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
     (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
         #[repr(transparent)]
-        #[derive(Clone, Copy, Default)]
+        #[derive(Clone, Copy)]
         pub(crate) struct $name(u32);
 
         impl ::core::ops::BitOr for $name {
@@ -162,6 +162,7 @@ fn from(reg: $name) -> u32 {
             )*
         });
         register!(@debug $name { $($field;)* });
+        register!(@default $name { $($field;)* });
     };
 
     // Defines all the field getter/methods methods for `$name`.
@@ -321,6 +322,25 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
         }
     };
 
+    // Generates the `Default` implementation for `$name`.
+    (@default $name:ident { $($field:ident;)* }) => {
+        /// Returns a value for the register where all fields are set to their default value.
+        impl ::core::default::Default for $name {
+            fn default() -> Self {
+                #[allow(unused_mut)]
+                let mut value = Self(Default::default());
+
+                ::kernel::macros::paste!(
+                $(
+                value.[<set_ $field>](Default::default());
+                )*
+                );
+
+                value
+            }
+        }
+    };
+
     // Generates the IO accessors for a fixed offset register.
     (@io $name:ident @ $offset:expr) => {
         #[allow(dead_code)]

-- 
2.50.1

