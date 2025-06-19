Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D28CAE06FB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C605A10EA2F;
	Thu, 19 Jun 2025 13:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="spKgKmLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2074.outbound.protection.outlook.com [40.107.102.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B710EA2F;
 Thu, 19 Jun 2025 13:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHjQLzsuVgwIr2CDoVFUqQZqPPcz5YmtgrO4By5/my40PpDAs9npDW3Y5Bi1rBuXUfYRd/CTjM9IgiC8Hmb1nlaULeuzhPiXi5R29Q2/vs17Y+eRgIUy1H1A/9uBWJlTp8//yce+lcYoQ01Zu+7CWRjUjI4iaVz+y08Fgd/5q7A+XX0HHRUSfDOtoQS5O89VkCdTDCVOHHAjvYpEF3vkpDU4Bbvzp1sLYMMbEXLNXYZ+SNvvfPCz3u7plHAj2pstdU05hEJ05y3V74+NGtDkxWu6LaTBROMrxKfJYk36H7WC9at/V5bKtno482642Z4seBPag4gLOceBVqLXnSlRXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbnQ/FyHfAyCCyFUkPYxHinCAmvkpj0+f2thgsqQmfg=;
 b=ctmkxaZ2xhpTpPROZYP+UGgkQAEQieq6v9iRDQWE12PU1E7ivMoT2+Fd4GeKMqpMWwag72VDY9UEOlMhNX3nchMlNJc+NgGRjXjp+1FPJcVdu7iU8rBszberKpEfolHc0k9UjU/qrzcmrLb9/pXo2sPMEFNLvr4RgWs2ePh7e40naJ24KZuet5+4TqxWiA7ry2aN1GnCtiWPhBeGp22ljqlBqYO2PJOELVDZ4WKiA6QWcTZvJR7keuEeOfg9bqMGsedvzShdO0w4imrcr33kb9FwFfwhUUerpbOCCn24Zd9kC7v5qTzkkLYYEJhAtmcBWcnOSn+fcSxGR5HsnF1KaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbnQ/FyHfAyCCyFUkPYxHinCAmvkpj0+f2thgsqQmfg=;
 b=spKgKmLxYUZLkL0j1Oos/ukd2JyPyXmOhp9vbf9xPAn+rPH1Fk/kBB759U08+4uhC5SqPAdh/L2gCJz9lRwdc7rRJJA12mIj2S+z5EUrzMCo1qsbyGfgMeCjau5MxHvvdhpmHZ1kgM4+0bSsxeVkpD4ad9TUQU0da/8HEWKteMaSODk9T7UjsBkYq0l6KmVvwNj81bkczOuDsEPjx5WNmswgGSMxWCSDfUc13Ey+9k5MeW34eh6nFW/g+RA0k8EVlevm/QEG7lDq21IQ6rjt7z3GPDW5UGkr/1x9UP83Elh9JKtw16minDJzDKZ9m1kh+K5Nhh8NFW/x5MSuanhusw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8122.namprd12.prod.outlook.com (2603:10b6:510:2b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Thu, 19 Jun
 2025 13:24:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:24:46 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:23:50 +0900
Subject: [PATCH v6 06/24] gpu: nova-core: use absolute paths in register!()
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-6-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 23b9b985-13ec-46bd-963d-08ddaf34a8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXNvK0Y1OG90RVpKZ1lXNS9lR3VPVnZTNmgwQkttbzdGRFFKYXBXWjBpUXRK?=
 =?utf-8?B?bjk3My82ZXlWbTJ6cGF1OXlnRytHTXNOYUZ1WTlOQkxDWFFReGVXWUhIUjB5?=
 =?utf-8?B?aEp3Yld2UmJJS1JHbTh2eVB4R1BlbHdmSmxRZmJENlYyUzRvZGpybnZVdE5o?=
 =?utf-8?B?Wkx5dGNvdDVVbGUxVWUyTUc3M01RMDlybFBCejFCSTcyblZGaXNQQ0dCOXVv?=
 =?utf-8?B?TG9IRm1wdHdDaDZLNlVwYWVhTnExSU1kaHlQVWhiWDZlVjFkckVOZHY2Sjg3?=
 =?utf-8?B?bUhFaitucjZRbTJVU21HdUJzRG9BN1J6RTlWNVoxVDZLMkZpNldTQzJYUlAr?=
 =?utf-8?B?dzdVY2FjQi9CZ1ZkMUgwNUl1TkJPdHhKN0wrK2VmMi9zZGJ6Q2VOeXhZME4w?=
 =?utf-8?B?M1V1elFPd3ZsY1V4QWZUYkJpMEVscDA3MkdUWWk4d20zUVZTS2pBMy83YWJQ?=
 =?utf-8?B?cWlZTFBvZGpFNHVRVHpNNXBuaEhyelJKaG1jeDJGKzhGR0JGRVJ4QkVXT0ZC?=
 =?utf-8?B?SlBDTXYzM0ZWS0xZbm9kM1FKQmVOZHFMcUZJNm1heExCOUwvcDRRWHUxUFZr?=
 =?utf-8?B?b3JGTHNiMlEzSE9kSmgwRmJZZUtvTVU0TXg4TEtZTlU5U2p0VjFqd0dZM05X?=
 =?utf-8?B?U1BJWDdlc1lmM2o0WmhyQUdwdTh2N2RSZUxLOTg0dEEybDZPaHlBaWV3ejh3?=
 =?utf-8?B?VTRmK09hdmYxK2UwWXA5cm9STDVpTXlhdWpxKzJydjBwODJTM2RoVXRZQnFW?=
 =?utf-8?B?NkRBTit6OUFndWp3VXE5TU0rWmZrSHcxM292TitZUlN1UW5BcVJhTEpvb2xz?=
 =?utf-8?B?NE00bzh4QlNkaDFyZitCWm9vN2Z3dWtXa2dnc2xlamZ1MmN2dmVuQ0h5MWJT?=
 =?utf-8?B?TldWV0d5OVdlbE9Ma1QvL1RMTlVCNldtOFRNelYzVThvYzNNRGcrY0tBY1hu?=
 =?utf-8?B?VlhjOWx3YjlYcmN0Uk9KOXQvQ2g4K2o1TlBoWVAxSjlXUzViMCtuM2xVZXl4?=
 =?utf-8?B?NXVhSzYxUTFISmVpQUNkKzdMdUZvREZ2U0lpQjVVL3VIbGYvdVVvcHVkRXAz?=
 =?utf-8?B?a3ZwR3dBZTN0Z2dIM3Y2WGg5UnlCTkV2RTBZV0cxYVhpY0xLZWZaV1g2aS96?=
 =?utf-8?B?a0dXd3dGcHA2bWpkK1Myc0lmZk1zay9jb2x6S002bTNOeGVrMVRGZXBvT1ZP?=
 =?utf-8?B?ZW9UcGppM09nVHBESHo1eUhhT0hEcGwzWUZZZnFDQTBKVUFKajJwek9NVldW?=
 =?utf-8?B?bVlabnZLT3FYanNIVGlSU2s2U2duOGNCWlQvRlpCUUJiNzBVVlFKcllQa3o5?=
 =?utf-8?B?cTFCVHp6N3FoeUx6TlQwc1pKN0xJMFNCT0tyNUovMDludmltSVkyMDFRV1FU?=
 =?utf-8?B?YnZBT1dzRStnMVRLejJ3SlpaVW1SOEV3azFGQzRRU0Fmd3NVbGdSN2NwcDNG?=
 =?utf-8?B?VVVMUUZZTnJuUmIrMTR3amJGVEJpZW41ZzdjVmxvTmRzRjE1dS85RDBCZzdI?=
 =?utf-8?B?OHkrMzdpRjNMdXNSOEg2UW9TdXhocGs4ZmlTREROYTRGaTdTL2wrckVHZE1R?=
 =?utf-8?B?WHJZK3l2Tit1aWhYZitEeldIeWFZNkNkQmFYNmdDR3lQM0Q4aWNWUTNhOHNq?=
 =?utf-8?B?T0J2VUN0OFN3SnQvQ1pqWENpVEplWWVGVDY3SlNvRThlRkZrQXhEeVMrK2gw?=
 =?utf-8?B?R05uMEo2Q0I0SlRaQzMwNVY4ZUl1OHlYelBxVU55TmROSEhUL3dvanY2N1Iw?=
 =?utf-8?B?MTRaMEdYWllyMU9Bb05LTzR6emZnVUdwOWNWR1JQMjFlR3hYeHV5Vm52U3Ra?=
 =?utf-8?B?ZGdZeUFST3NhelpjU0toSG5LWWVLcUU0QVZLVFZwQmh6aFZVNmhxOFg0VTBn?=
 =?utf-8?B?VzhxL1pzbnlMMGU5QkpIUE05VEsvK0NybHNlbzBLaTdCYktGSHZQNi9oVHdR?=
 =?utf-8?B?NlhEUTduZ0NjeEdlOHpPQTZBT1V6cDRIKzNRR21CMTdBbEJMT1dHYnBDek80?=
 =?utf-8?B?WnprUElPdTd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZodHovcUVyNnpaMlAxY1N5Rll6eXdsRE5mMjl3YVlxNDdKN0tXWXZRY3Rt?=
 =?utf-8?B?Y1dzeXlGOGdwTWdyR2ZwemJPTHhHUjZCSzdBclJkOEpXeldXUDNEN3lFN3N2?=
 =?utf-8?B?SUtPZy90WWxVa2tlekpqMkhDelR1RVdiallNbjUxU3R6Y0VjcS9IMzZwdGZ3?=
 =?utf-8?B?RklDTksrNmFDK2tDdkdjalVzZmRoMmw2UFJZUTk4bVRoNTI2alVLTDV5WmNZ?=
 =?utf-8?B?ZVdzQW84UHFrbXFsandvTTYwNWhKY1BZeTdaMzNEM1FkakM5VkJSQUxEdzg3?=
 =?utf-8?B?dis2b3g2Ri9CaW1SM3Q4REhFT1RCdXlrSEtyMFl2cC82bUcxaklPamxBZ2ZF?=
 =?utf-8?B?dDZ6ZmJ3T1BHWlIzWFJHeS9paW5vUDhVRlpONjM3c3Q3WldaRHB0bTR1bnk2?=
 =?utf-8?B?MXZDOG9FZ1FmZDAvOGFING1MdXBxMURodCt6ZXJYWVNjdStWcXYrL1gxZ2li?=
 =?utf-8?B?WTVFSThCWnBrOFY0NkVEMFp0TkpnbDdMc3VWK2hHTVpoeHF6cWNnU0RXYmp3?=
 =?utf-8?B?QktKdUI2ZE9XaWFPU0p2bWNxYVY5Y2w3blJBNmpBclk4bGpiRE5WakFTZVpZ?=
 =?utf-8?B?TFpJSXUyeXJKcnpYVTgyZ3NRRHRJdE1XbTExWkY5TW9XazNjRlFOS2tYL3E3?=
 =?utf-8?B?REJDby9IVlJvWWcrcGM0Y0FlYTZtUkxIbEFIVUlobm16T3UvMU1IdzVjM2RU?=
 =?utf-8?B?MlM2TStLT2pyc094K3JuWjJOZlMveFpNUDJlcEl3eFllM01OUVQreDFxdllu?=
 =?utf-8?B?VnRieTZrNU5NdUVsazlNelpabnVMR0s0UDhiajZRV25QYVpWalAvRzJqZXBm?=
 =?utf-8?B?QzVyVnZ0VHp2Y3pRdkxaKytiSWQvMGdVSmJ0L3IzR0ZoOWd3SmRBdmMwWm9C?=
 =?utf-8?B?TXRkcjhIL3N5OEhVd2dOK1ZZWWt2Y3p0R1BmR2szZGZFT2YwT1h6RHIxLzlZ?=
 =?utf-8?B?ZDRTQmFzWm9NSzhJZ3pRQU9uWjdTQUt0elBmMHAvZDZtbVZkOWlyYjVjc0dE?=
 =?utf-8?B?K3FGNGpYOWRzaG1Eb1NjN1FjR2hvMUZkVCszNWJGUkZtR3h4R0crRnR2cjB1?=
 =?utf-8?B?UW54aDFQc0VHYlRVanFuZEZnYjJSTklrZVhWb3hsT044TGFnYU9jQWdIK1d5?=
 =?utf-8?B?OW5BQnpvRWoxNmdQWEVCVSthUTlUaVF0bitOQVBIajRvdEk2SENFK21peUdE?=
 =?utf-8?B?M2dENC9YWlhnTGEwdUx0UUcwbEFKaVhpdHAxNkxtS0ZPTndNbXNPaG9ndG4w?=
 =?utf-8?B?RVk2UlZlWlQ1NUpYYk1XS045TVJydituLy92SWx2ZHZyNWYrMVBjMStJUEx6?=
 =?utf-8?B?RUtPU3BKWXNOdTJJdkRSRHlLYlVCbWtEdTFCc2t1VEFTM25yU1R3TmlOejRw?=
 =?utf-8?B?eGhyUi9Kc28yOHErYmZlaDY5S1pxMEh6RWJwOFM0WDkyTWY3Vk9JR1JUN043?=
 =?utf-8?B?VDA1RlhsMmVBUG9BTjVOTkV4eUN2VTJ4K2tkNzZmTnNPZmVhMTN5QUNpYTRy?=
 =?utf-8?B?YWMyKzl4UytNN2tWeEVJSXlWZEZyelB2amZoaVFSOEk1Qk15OENKeVZXQXVk?=
 =?utf-8?B?RHoxUTRPeFRNK01mSFdNVWZ0Ujd5MVdhZzBDbDlkejJIaXlSanBONjZtVlRG?=
 =?utf-8?B?eHlkM2ZJK3k5TDNxRDlXQk1HK0lCQU1xQThXMmlBVFA3Mkh6WjBUb1BpdXEy?=
 =?utf-8?B?UVRTeCttUFJYMUsrQitHdnFGM1M1Y2xxRlNYcHBDYVk5QlhKeDhMK3RodzFC?=
 =?utf-8?B?QWNla0lKUTNuTFMxOXpmNmNRM2pJWTFXZDZYcFNFRHovbTdJUjlTS1lQVGV2?=
 =?utf-8?B?MzRudWdSL0N0TVluOWRUaVVsdFpHcjUzTkQ3dGpWemlIUkRvSmtJU29vQThw?=
 =?utf-8?B?N1c5YU5rNFJrMTBpc2ZNV0s4SjZqVTUzVzI4enhsZmRCb0d4VDlrRHJxWkdX?=
 =?utf-8?B?VW1XUkdHNzY3ekxKMnNWMUtYWUdiaWRZdGtoVUV5eTlHSE01Y2doZWtiS0cz?=
 =?utf-8?B?NEc1UkJuNUZla0VtcUpxSXlMMlRpbzZVNmFGUVhoTmVHN2ZvTlJiUllBbEhi?=
 =?utf-8?B?czEvelNGMGJBekR1WnJoQ2tXQldMcEFjbmoyVUExN25zQUthVTVsU0piTEpQ?=
 =?utf-8?B?ZkpaQ0hXbkY3Yzh5ZkdXa000ekI4M3EybENaU0c2aGlZbEl6aWRzekxIYW1X?=
 =?utf-8?Q?rVeZ1GMO4poxC64cp0/Rs6MOaWtW01JtOkz4ZagMLfmo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23b9b985-13ec-46bd-963d-08ddaf34a8c0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:24:46.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpBjiivgk+SJWfwJXaClgBau+nvwQDb77dDk7gJPyx7pZ6in4WcQyn3CJPWraxCbOUx41ER5OCHWINnRJtAh8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8122
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

Fix the paths that were not absolute to prevent a potential local module
from being picked up.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 7ecc70efb3cd723b673cd72915e72b8a4a009f06..40bf9346cd0699ede05cfddff5d39822c696c164 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -114,7 +114,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
             }
         }
 
-        impl core::ops::BitOr for $name {
+        impl ::core::ops::BitOr for $name {
             type Output = Self;
 
             fn bitor(self, rhs: Self) -> Self::Output {
@@ -161,7 +161,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            kernel::build_assert!(
+            ::kernel::build_assert!(
                 $hi == $lo,
                 concat!("boolean field `", stringify!($field), "` covers more than one bit")
             );
@@ -172,7 +172,7 @@ impl $name {
     (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
         #[allow(clippy::eq_op)]
         const _: () = {
-            kernel::build_assert!(
+            ::kernel::build_assert!(
                 $hi >= $lo,
                 concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
             );
@@ -234,7 +234,7 @@ impl $name {
         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:ty
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
-        kernel::macros::paste!(
+        ::kernel::macros::paste!(
         const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
@@ -246,7 +246,7 @@ impl $name {
         )?
         #[inline]
         pub(crate) fn $field(self) -> $res_type {
-            kernel::macros::paste!(
+            ::kernel::macros::paste!(
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
@@ -255,7 +255,7 @@ pub(crate) fn $field(self) -> $res_type {
             $process(field)
         }
 
-        kernel::macros::paste!(
+        ::kernel::macros::paste!(
         $(
         #[doc="Sets the value of this field:"]
         #[doc=$comment]

-- 
2.49.0

