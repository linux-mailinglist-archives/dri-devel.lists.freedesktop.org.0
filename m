Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEA3ADE57F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 10:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15FE89E33;
	Wed, 18 Jun 2025 08:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SWmhF//Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7EE10E1B3;
 Wed, 18 Jun 2025 08:25:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4VEoObp4SAXJUr2ojFMEEH1jQeWzT9yx0DiuwhAWlGuDfpqA3SvHcx9odMYGa1gwx4W8dGuTq9Hjx9wTqb7CpdpWiMLC5k4k5uAhf2qUAEMdcl+5Nc3JbckucUS9m1u8DRQpyvJ0q2QTu37iPndgjzuhrUZpzIL8gwk4T6gedxyacSbhZkMfgqc8HfpjjnOtRIH3qBdEbsnQqPTNk4m/nqaWRNAHtClp49VWoh8nzvOGGap/zDS3g97vgD//ENBWnahV3e27Q6P+qBLaDR3T2HK6lTEKe7/qq7CdTtp2fVaUbGuzb2Hhp5p7jc1DgvlCrjwiO7VuXLrEUCawIzo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoFX5UpFHdxMBMVswKL04cydLsueXynRyd8tZkPcNWQ=;
 b=AVJOj8y/ANc5NJawlGPI5V+VVBwhyFwUvJxwDhN8U8eDOMLAli8S3T78JzSKH1uz94dbSwdAznWzPPr4tZK9vv6LIKnuBGjUMoS7lo61P4xV1AwmPxhndSR53VOo4z3FPhSA5Zidtx2efXFpM/9UY5UhgBVUiLpjJto8HGgCRRzdsDMB4b+/tqb7TtqmQyJfoxzICKeuVy0VSGhT406f8HsB75sjVXxbHymNEfF48Oi6iThWelBzja/7zeSGV8eMZJtQCsCn2NRaAqS7yFtKMMScfjIDvjQByMa6hW70msPTfIVZOGil0L8OPyImnioz0yCtsLgGvopHz7vG5ol8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoFX5UpFHdxMBMVswKL04cydLsueXynRyd8tZkPcNWQ=;
 b=SWmhF//YWf2/RL7HEo6mRPucvbZw50mqV6EEoIA7EjDDtJs+GuKp2+ZpwP8BAGkwspLMg0O6hT5uh3zVOQPUBGphm2jU7tCjbuDBil9YbnhTy3WSmV2sjSLH4d+WRbcBSaX3R9noNRpI2aTBPMN5a5rIxvAuI7LwgR6+Wreo5379znn8DYFg+Sjd7CeZ+H92w7EI56pQluNlsNN6/sV7OTkmMU5ZMQoAAlcwaiAOgbOiCl2h2f2gWuQj/QRT+L1thutdKNmwFAYQNpjP3hCjn8PFXNZ8adfG7dTvbJXzBJwQrbuDPUwdVHPrl9rq12x6d1FMcCoJ2YueuBg/1mJKkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 08:25:37 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 08:25:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 17:25:25 +0900
Message-Id: <DAPIKKLD8T6M.1I9DCC7WNFZDF@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>, "Shirish Baskaran" <sbaskaran@nvidia.com>
Subject: Re: [PATCH v5 00/23] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <aFHMjEt7KrjClom_@pollux>
In-Reply-To: <aFHMjEt7KrjClom_@pollux>
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: 324fe4d6-1294-4305-22c7-08ddae41b243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0pEWmlkSUNETEJxSGNrUmU0UDMxNnUvYkFOcWU3RGgvZmZMV0hwZDFDaC9Q?=
 =?utf-8?B?NnErWFVsZmRCZFVndVgxajF1UVZOcTlkaHEwY0lVOHFhQVdGakRvczl3QVVT?=
 =?utf-8?B?SEw4NHUxN0hJU1RXblczYlhyaTJWdk4wM0dyU2VhZGtwdUVwQlJrUDF5dWN0?=
 =?utf-8?B?NlFJdkljdmIwQThVWnBRSmRMMG13VzlnVU9HUERmelFsTEJLL1FvdkhlNEYy?=
 =?utf-8?B?UWdMOFN2cUtYQVI2ODJiMXFhREJHSXFwZFBuMjhBN1Q3YkNoZUxnOHY0STQr?=
 =?utf-8?B?OFhmdnJZckpGRjJJOVByKy9UOUl1NDFYWU5SdGdvZlVkSzJIMStmWGNoYnlw?=
 =?utf-8?B?cDYxTk1zZjQ2WURkQUNMRzZlK3pXc2pPNkVIUnJ0V2tTc0oyRTVaVy92VTlv?=
 =?utf-8?B?ZzV3VFp2WU14STQ3NFl0OFYxZ09RQ092MURORHlpTXZVM0JHaENYZmxLRmtq?=
 =?utf-8?B?bDQ5ZkhJY2F6WjBvNTN1STI0OGhQajVYUW9jaVNlREZnMGpkbVVLMUtydkhV?=
 =?utf-8?B?ZU1hR0cvZ2dvUmtVZjFTN2Z2MTFXVHhURkFZL2FKMUUzRGJSMk9Ud05iVnht?=
 =?utf-8?B?NnBWZ2NvekRlWUp2MmNWeGk0N2FNaUY0cGUwUFRwNGFGSS9qTXNxRFJKd005?=
 =?utf-8?B?VGo5NDYwdGVDOFdKRG1CRGtPbk1ZcG9yMlBMbWl2Zk5MbUM1b0RYUldnWFg0?=
 =?utf-8?B?b3EwS1FvY1RSZWM5TEhOMjlzZHo1c2piSmdkelRnN0srMGhmU0tQNzY0a0V6?=
 =?utf-8?B?YWsyZ3pJWllHN0JWcWNEZjF6d3l3emYvZ2FoNGY2U1V3UHc3V2lMajZ0UHR4?=
 =?utf-8?B?SGpRb29zQmwrM09lUng3SWtHd0pORXllUUQ2WmV4NFdEL0QzS00zU3NuK1gw?=
 =?utf-8?B?T0dsaHNKNUJOdTlIUzd6QUdQL2YvZlBwblF2eTZRM2tOaDdJQ3Z3SE1oR3l1?=
 =?utf-8?B?Y3NDdTB5TWY4aUZrQi9FdVRmNzZNNUlXaEVUUFAvd3lUMGM3UFljVm56VklF?=
 =?utf-8?B?S1g1UWNBWUJwZ29aQ3FNVmtHVlJQWXEzMFBSNFhFcmVOdDVoYnJkQVc4SGdY?=
 =?utf-8?B?S0JtR3d1WnJMV0VROFJmdlFROHYyNnNBeHFXOGM2V0hQOFFyZW51MTJPajJ0?=
 =?utf-8?B?cXJpVTF0UXBCQ0tHVEhCQVIrdEk4d2VtTmw3NzYrOFhIL25QRFl6VmxyU29w?=
 =?utf-8?B?SWhtVnM4ZWxvY1BJVjZ5YkdrenhEYktyYnQvaHFUNDUwRzBPWmhCdHgwZEhO?=
 =?utf-8?B?ZlV2eUgrc3dvelZZSElZY3Z5ZDFub3oweUlOVnFEbzUxc1dIL2djY01FR0dp?=
 =?utf-8?B?aEZrS2pPS1NjOE1YWmlNT3RWelkwTTNIQW1WU2tHdEVMRHV4SUllbndqSGhs?=
 =?utf-8?B?R0tIT1BFdkh3QVBuQmFPVUlISGw4ZWh5V3lrMXEzeDhJTDk1QmliQ1RmWlJo?=
 =?utf-8?B?RE5rM09oa3BvSmdIdjE5YWR3TjhCSU5ETXVLU0xjN083Vlhtc3YwUU94b3B1?=
 =?utf-8?B?QUd5bWRXb3htNlB1VU92R2ZZRU5JaEdva3A0L2IwK0k0U0x0UFM2YWpLT2pz?=
 =?utf-8?B?VFMzejg3TVNwME5neGtLenNJMTJHQWV6RmdxZmI1VEk1YkdPUmdHdmpjb2xl?=
 =?utf-8?B?b1BCRUVLVFU3SG13bTIvdUJWQ2drTkYwcWVNMTI4M0dqc0JUWDRJRjNFdDVy?=
 =?utf-8?B?RnJvbko3K3RBNjVwcW5yWkI3VnB2WDI4MVRkLzlLTzRZTVZERGducHI1WnIy?=
 =?utf-8?B?RE10WXk0TXJ3OVZTZmhpeUd4b0E5RU1GeGtZR3U2M3k4MWpQT3ljcXM0UTdH?=
 =?utf-8?B?OTNRN0thWmVzTGt6TUt3RUVxcS9DSjFtRlFvNmoyb1oxR1Jxc3VDQy9xa3da?=
 =?utf-8?B?b2RPNm5NU2NmaWhCWGZlSVVmZmVUUitnUU03dENncnpsTDVrendzYkt5dTE5?=
 =?utf-8?Q?S14pCCKFXOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UW0zUlhUYUxZNEdDQTZjTHlCdEtyMVpUbW11MzlQejk3b05hSlZTZklrWFdh?=
 =?utf-8?B?SlBRRExNMVo2TWNWMzVncE1ldlNhVXpRWXI4bnMzMDAwWlN3QzVlcUVueEtn?=
 =?utf-8?B?SEdsZjhtdXhEak1NdTFqQm1IWEp4ZW5zdVVjWmpOeEVxY0ZRZi9qWDM2SDc1?=
 =?utf-8?B?RTRUbWN0UEw4UkJRMzZGeW9TNWZLcmc3S3h0Z0FxNVVZY2ZPTEk3TDZ0Y1VI?=
 =?utf-8?B?ZVVrbDFWNXVyUzFyWnVpWnZQQlE1ZlhFY0VvK1l1WmNBZlRPQW44TmxkSFZz?=
 =?utf-8?B?YWhrYzZ4OHFINUV4ZDY2N2VBdjBKWWZEbm50THlzSHk0TGVSNHF1dklJQlJE?=
 =?utf-8?B?OG92eFdRQnBHWmZ5aUl3MDVmbmxhUXRuaEVGbUNUSk1lc0JQUDcrNms5Z0VL?=
 =?utf-8?B?Tm90V2hEZDNhbkxOVnd1QS9BMXQ0WTBUOGZvT1E2ci9mTDM5TjVyUndxYkR4?=
 =?utf-8?B?ZHJJWWtPTUpSOVplYm9abmRpMnN4NzJ3Tis1Q3g3dHNsaTZwUVkyMG1Md2ZO?=
 =?utf-8?B?SXVVRTFLV1FGZjhwWElSRjJtRHcxc3JHSzdpZTJIMWdFZXRJTy9DbFBqUmQw?=
 =?utf-8?B?YmhqUVNuTW1wb0d1aDhha0NzNFJqSjFLRVBYUmI5VFlmbXNQMmp6SSszNTNu?=
 =?utf-8?B?N0JIUExveFNDamNGa1FrYmk1N0dzQnZzVTJLQ2FlK1I0a2tvYjZXNEZCcVZj?=
 =?utf-8?B?ODQ1VHM1cVVuRURtbldGUkJhUytpQVk1dlQzT214SWljMVhjRk9DeG1CWXJW?=
 =?utf-8?B?eGN5MzI4MVdUamxFalFQa0hGcjJYZVVMVU4yN1JtUVVWWUFtNnBSajRFOXlM?=
 =?utf-8?B?c3JCTWZJamk2SWk4R2RSSVc0RHFCN2FLTEh5ci9uZ0pER2tMSGxZUmZPU0wy?=
 =?utf-8?B?ZjBSZ1RRcXBHZ2E1ODRWUzF3d1F0eHZsK25PZlR5NExsL3ZYdjVNa1A5dHl5?=
 =?utf-8?B?Y1hFbGgwYXpHc2lJQVgxY0pEUkc3YzZXS21RK0pMUC90emdzUWtNU0RhTXR1?=
 =?utf-8?B?OEdjWTNId0NyVGlNRmRjREZyMGxzTnlpcjFNSU80Uko5Ym5NQW54ZlA4eE1J?=
 =?utf-8?B?ZFkvbXdiWVpLMXNHeFZiUkh3dzdxblh0cnBsTEpaNnBuNmZuamxLWW84dUl2?=
 =?utf-8?B?ZWNXVWNmUkhOQTR5c2xsRFA3NlFNM1NEdHNyYzY5T2hxOUhxelIxd29iRm1p?=
 =?utf-8?B?V1FtZ2J3ZzRuZUNtWkFTbkt0RUpDc0tSaFY4Sy9jSHY2dXBqZnBBbmxjakFS?=
 =?utf-8?B?YjdqSmdpTDVhbExTVEJZakMwSUN5QmE3RVYwT2M4MjRBUGZrcHFRMlhycEYv?=
 =?utf-8?B?SFZ0ZjVSTUFrTTBTOTNWYnl4ajBRVmErdlljWXRXL0dac0NJT21CbnQ1Q1d3?=
 =?utf-8?B?Vi93dXo4Q3AyYmZISmx0aG9GbXl3TW9yYWoxSWVYQVhoUE9HbFFWUk5uVHdl?=
 =?utf-8?B?UkJldnIrZm1hRVUxWjZCcE9TVnViVHQ2VU41NXJlVVZmRjNGeUZkb3UwRlFC?=
 =?utf-8?B?dmZqVUI0dy90UGVNeklhS0h6WVd3QnBPaTQ1bXluZTY4REZZZ29qTDNkS1Zv?=
 =?utf-8?B?cVB1b2srMThSSGZwa050c1RPS1c5YzFJSWhOcldiWEVxWU90RzdkYWdZVmZp?=
 =?utf-8?B?Z0tVWHFCUFRwSDBvMmdLUGk5TXB1VWY2aXlkeXV0bVFBaGgzcmI4ZnI3UUNQ?=
 =?utf-8?B?TjhhNlI4VjZiT25PckJUSnZaRjI1R3A4WnlqMHJrOWpTaFlxNDhJTlE0U0xE?=
 =?utf-8?B?aXdwNGkrOVJPUlBUV2pOcCt2SlZoRFlVM1IrVUVFc2Mzck9RUlloTkdpS1N4?=
 =?utf-8?B?ZUMxMEdDbFNIMk9RUUZsekdNdE95K1U4UU54Ymc5TldLYlFoWUdWakZvUDBx?=
 =?utf-8?B?SVdnbDFBb1lYajZJUmVlT3MvOHdWOFh4aDdWZVhvNFJJMm9ITmtIaEczbEEr?=
 =?utf-8?B?RUxJSmdGQ0wva1M1Q0hGbDJDVEVFSjVjeVFNKzVNRjNaYm5BUmZCaExoWS9H?=
 =?utf-8?B?NzJwM0lBOHc3V2Z0VGtkbHhHazlhM2hZOXVoY2QxQjhYYk4vY3ByanN3NWxp?=
 =?utf-8?B?Nll3N0pKRjd0eWNSVTdPbGE5UVl4bEwreDcwOE0yY3hzQXNWTnhHTVJnc0Qz?=
 =?utf-8?B?MHZ3Rms4M3pKd1FvdkZSNG8xcG1jNmd3RG0wZ1dmdGFSVXF4ODBuaWpWR3BQ?=
 =?utf-8?Q?GOoGxjMJGNxYFKtHfLKnxC/KvVovtAe27XGX9pikVA9B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 324fe4d6-1294-4305-22c7-08ddae41b243
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 08:25:36.7363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vd/9LcuZKDWxvme3VfBh6+UpKzDDsDvkt0nTN/iYN3vQER7aXl21nrbNlNamPxA7vgn3mrM6BGNZ7FyUlrB+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088
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

On Wed Jun 18, 2025 at 5:14 AM JST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 11:01:28PM +0900, Alexandre Courbot wrote:
>> Hi everyone,
>>=20
>> The feedback on v4 has been (hopefully) addressed. I guess the main
>> remaining unknown is the direction of the `num` module ; for this
>> iteration, following the received feedback I have eschewed the extension
>> trait and implemented the alignment functions as methods of the new
>> `PowerOfTwo` type. This has the benefit of making it impossible to call
>> them with undesirable (i.e. non-power of two) values. The `fls` function
>> is now provided as a series of const functions for each supported type,
>> generated by a macro.
>>=20
>> It feels like the `num` module could be its own series though, so if
>> there is still discussion about it, I can also extract it and implement
>> the functionality we need in nova-core as local helper functions until
>> it gets merged at its own pace.
>>=20
>> As previously, this series only successfully probes Ampere GPUs, but
>> support for other generations is on the way.
>>=20
>> Upon successful probe, the driver will display the range of the WPR2
>> region constructed by FWSEC-FRTS with debug priority:
>>=20
>>   [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
>>   [   95.436002] NovaCore 0000:01:00.0: GPU instance built
>>=20
>> This series is based on v6.16-rc1 with no other dependencies.
>>=20
>> There are bits of documentation still missing, these are addressed by
>> Joel in his own documentation patch series [1]. I'll also double-check
>> and send follow-up patches if anything is still missing after that.
>>=20
>> [1] https://lore.kernel.org/rust-for-linux/20250503040802.1411285-1-joel=
agnelf@nvidia.com/
>
> I think this series collected quite a few TODOs to follow up on once the
> corresponding abstractions are in place, etc. This is fine and expected.
>
> However, I think we should list those things in a central place, e.g. our=
 TODO
> list, in order to make it easier to follow up.
>
> Additionally, it might get us more contributors who might be interested i=
n
> following up on those things.
>
> @Alex: Can you please add such a list?

I went through every TODO in the code and found the following could be
done:

- Update the entry about the registers macro with remaining sub-tasks
  before it can "graduate" from Nova (notably register arrays, which are
  several TODOs by themselves),
- Mention the missing `FromBytes::from_bytes` that will allow us to
  remove some unsafe code,
- Mention the missing features of `CoherentAllocation` (write() and
  as_slice()) that require us to use unsafe code,
- I wanted to mention the missing xarray but noticed it has been merged,
  so we can just use it and remove the corresponding TODO. :)

... and that's all I noticed, but please let me know if I missed
something.
