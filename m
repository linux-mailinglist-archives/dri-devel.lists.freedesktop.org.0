Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DCDB39486
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 09:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA4A210E6AB;
	Thu, 28 Aug 2025 07:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="raEDRuhX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB64910E643;
 Thu, 28 Aug 2025 07:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIx9zxQD2EtfP3jlahGXcGg7DTwS+4HsYLVlxz6NXM5oRu+PiVGRY72nd9H+MIRFjdw43nRRwKnj4gJwZcpcvP4CNXfbmFo+lipjjOJUd5+ujfWk2xfwVkyDkfUYN/H/q9HsnLmFRQ2zwYm25Lmhnobq+zEbF8H+QRziHbTx27lkGXqfGp2NPOaIluv10p8BvU1zzVwKzOMoSgB5Lt/8G+vVXgCIqc3XusA6jpuXzZpf5qr4ehxmSPExS6lMZFJvTgtrdsHMMB12pOArJS+ZYKxm67RDmhX7rZIya5UVVhx0XJiMOzv+m7Uuzy1H/C6bunp8s0DpRU/hVmt+Q1Cgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/6/e0DOoGfXfLTyxJ+BR1ZhMG2ZnY9EyJY+CjZWjtI=;
 b=TkKGiaTI75CeP6RciMgMgoRb89BVwTYGAaHkak2qMrO2DUyaTt4NYVQC4+UVDa7nHiJwefm+x12WDnJwfY7ggCMwrdayFZm4VwG72tZK7jTmGlN10F++eI09bEyFn1r9Et+8hg/UpmHFhF+mGJIo/Ata3GczOCovykRnyolD5FFFoUUEaZrFNixKg0Ndfrd+F0OsX9Nqv1S95yrXaYz9DIejWrfCjIPOHCj8a/GKYLxWmaPyX6rVGzl66hXIOUEKQTtzcuktzGjHXYds+zDQQrgiyCm+gQg2YURCB0MuwMmQHuz4kWjFT8K+trmk8FPbwpojy4ghX5AZ+Poe41J9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/6/e0DOoGfXfLTyxJ+BR1ZhMG2ZnY9EyJY+CjZWjtI=;
 b=raEDRuhXOLQKb3jgjkZQ1WQzDRfddsiwC3SXALSiG/myFZnwBhd+V3u8vsrTY6BlKDe+YzVn611l5FKmmgg6uUv68qY6tr9W4xvyhicKx7TrL5xdt3OVs1pxUcdkPmPScwVpoHqJ6EPya6rE0q7k/DwwMZfNRbeLkUbihQ1FNMQJODAuC4p60gVNNnOAXYyGRl0mSQulVzfpY3f0bWLq+20zM7FZtdgkHNQfkMwq1Gqhq5CAFAgx+7QdltbE2APiSqx2e5HIa+u4BV84Nagd+SdMak2TOBWIrPRyGZPgHHEnBv/dsnA1Udg6yjQJV+FseVmcRXReI1UQqNAgxgRbcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPFDDE56F72B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 28 Aug
 2025 07:05:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 07:05:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 16:05:21 +0900
Message-Id: <DCDVBY8MOLWV.1N5ZPISMJL82O@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
 <a33aff7e-c260-4d7e-ad18-e919706cdbda@nvidia.com>
In-Reply-To: <a33aff7e-c260-4d7e-ad18-e919706cdbda@nvidia.com>
X-ClientProxiedBy: TYCP286CA0161.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPFDDE56F72B:EE_
X-MS-Office365-Filtering-Correlation-Id: e6056414-4561-41d5-40a6-08dde60142e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGtCbkZndldvZmozcytBcVB4OHNLWmRONnRENHd6b3FhVGp2bTNUaFJhaHRn?=
 =?utf-8?B?aU5rZ2krYVgvaEVnemZYYmhycUxlS2xuVW5RUk96dldSOHRrOGVPdFp4dVRq?=
 =?utf-8?B?UUU5dGIxanlCUWJJenhxcG5maUUzTFBBWU5sNEl1M0gxQldIbWpBbXU1cnRZ?=
 =?utf-8?B?YUJUWUQza2RVdzFXK1Y0VFJDNkh5Y0J6MkJjczFDTk9ET3ZsYndoWU9ZTS8y?=
 =?utf-8?B?aUxYWDA0eEk5bnZRYkpJRUd5ZExEWVhhcUg3Um5JVEZWWERMVWptYlV6T0Rz?=
 =?utf-8?B?MUtrdlFWN04wTjlwK21MZUpDazNldHBTbjZvb3hiWUx1eVBHYk9adzlsZTRm?=
 =?utf-8?B?WFgrczJsYm4yZHdxQkxKY1dmZC8xMW9vRFdLVCsvTWdoZFVtUk9wbWNkVXk0?=
 =?utf-8?B?Qi9xUkdBaENMZ3FoK2V2SXNOaks2aW5vR1l5TWZzU0ltTm91VTZIWGxTYm1w?=
 =?utf-8?B?Q0FxVVozUGNOaGp0Qzd2VzNJaVd5N1JKU2xSZ095M2VMT1FVZFRVakFYYjha?=
 =?utf-8?B?ZW9MT01FMGMvblpCSkpJZUhqR0xSYmo5ZzEyVmRZb0hrRmQzVUg2c1RtTHJq?=
 =?utf-8?B?dlBlN2M0YVI3YWZ0S0FDRXdkY0ZNODh6WXdlRGFJZUhMaGVVWnVYWHJJMDkv?=
 =?utf-8?B?WEtOL0xXTk5SQXRCVzE5VEVFdEtINmZqMy9XSUkxZkttY3BDSHlhL0JTYTVK?=
 =?utf-8?B?TE54T3ViSzNBK1AyK0JnNFY3SS9hOHAzYjUvMElGUmRjMnJjWjI3TEVzZTlI?=
 =?utf-8?B?ME9WZ1crTG1LK1FlUTZOU1lZVTc1WHJCR0srdXc2bklsbzBCQmxUWE5LSjho?=
 =?utf-8?B?L2ViNUl4cTZrWVprQ3ZCUDFMeHVreUY4Tm1LZVBYM21jQTlTY2RNRDlUYzcy?=
 =?utf-8?B?SDNWNUVLdzJYRTA2NDNvM0t5WEdtTWpYb25SMUhBeFJ1R29zUHpLWVNiZzEr?=
 =?utf-8?B?VWtndjhRUXRKQ1dlTGlJUkZWeENFVmtUNkZBZGFSTkFQTUY0OXNueUNxNFFq?=
 =?utf-8?B?YndDUGJVbCtBSnVNR21sSnNTdWVqV3pvdTlSdVVVcVNaVGVtR2lQbmRLdE5Y?=
 =?utf-8?B?ZlJ4NG5nYXN6YlVyR0dpVVAzcHkrSEEvbXVhYnRoeDluY25aaEY0MXFNdHRY?=
 =?utf-8?B?UG5XOGtmVkY1STU4L0lpa0lPckNvcktLc1lWRnJ0YlhHbFJwc2lVRDlQU241?=
 =?utf-8?B?KzhSU2t3dUJ3WnYxam5qNzBxYlQ4UW9kbjZvN0FmMUFDYTdPNkc2bTE1SE92?=
 =?utf-8?B?aEpnN2ZyVC9iNlF1MmFuTXMzbDhwcU9yWThNdDljZVYvdTlaSWkydWVyd2xq?=
 =?utf-8?B?R0NIdFI4RFhWSEFSVlNpUm1FSDZEaHFLSkE3NGxsUWRmeTFyTlM5MWh6ekMy?=
 =?utf-8?B?WDFlRVlkbkJZTDZ5ZzNxaC9zZWRPNHp4YXlaenhkZU1qVWRSZmlRT1RVY29w?=
 =?utf-8?B?akFGa2V6bFFGa205WXJPSkhiMFVmdVNTejh1T3h3R2tVeXM4SWIwSndsN3hF?=
 =?utf-8?B?NVo4Z28vZG5VaW9xUVdmdElhZ0RsNDJ2ZkNiQjBZcDgrNE5CR0c2bURzaE04?=
 =?utf-8?B?U2plWlIwRDYrWXg1aW05c0VyaHN0NjN3U1RPNlBaVU5sUzd5K1Jkc3VDREIw?=
 =?utf-8?B?MTZiZDBtaGkyYWRobEtIOHRJelNwQTZTV2RvbUQ3UzNFbnhUV3dJSmhjRi81?=
 =?utf-8?B?Yk5IZ084TUJjSzY0SWU2ZjZFZlR1VERRcWdnZHMvTzgxSTVBWVJiL3pwN0tI?=
 =?utf-8?B?TllGYzkwUHNMdDhLUTIyREZXcGd2eS9pVDBYVzlOOEZEWmtmRWY4L2JKTmt2?=
 =?utf-8?B?NU1TUnQ1SHB0T0dnMXlVdHVNdktxWXVKVDl5eWFwVGR3Y3haZ0RqMlQzb1Jl?=
 =?utf-8?B?Wm4yTmtGNTNqb0lVZE9tWk1PYkJEc00wYThwamxxWFZ6VXBhMnBVVGhwd1FC?=
 =?utf-8?B?a0NhVzBQdVdjQ0NSQWVXdnJldmJXRCsvR0JYTWxGbXB6SDBSVlhiUVJJNnhh?=
 =?utf-8?B?Qzdpak5YRE9RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUtxYy9ZUjRIQkhUdll5ZnVPZ1VlRzdVVDJ4emhZWVFxRHpvNElZRlRERXdw?=
 =?utf-8?B?NnFUYldnTGhjNksvUnE2WkpTaDJUWUtlZy80QXpTTTZWS25kUno5dGEwb1lX?=
 =?utf-8?B?T1QxZ3F4Lzd2SWFoZVdmT2JHdnNrQUhKVXNqUVl6S1pIN05XSzIzNHo2YWpa?=
 =?utf-8?B?aE5ESGVPR1RJaWd1S1BoTmtqQVpoUURYS0FTSVozUjdBaTdQZ2hSRkFvc0xm?=
 =?utf-8?B?TlVtcmZxaENjQzRmZzZaQU9rTWp0K2QxaTlXR2k0SkluVUVNT0VsSnd6Ty93?=
 =?utf-8?B?L2cvVC9CN3QwRFNqRkZhMzdHUHBkZjFPeFhoZ0lFZEdBaTZ2UHBTZFVMQkpv?=
 =?utf-8?B?b0dYODVnRVZTMzFOcmNob1RHTm5yRnBjczdhWjRCN0ppVng5L3VMazFZZVRC?=
 =?utf-8?B?U0lNdldEYnAxVnVZNWZULy9YdE9kZW5uanhNOVdXMXRvNStNb1hGbHM2RlBJ?=
 =?utf-8?B?eS85NUVaUW5OYzZKN2QremJlUHV6QWJGWk9CdEpmQUVGWkdDalBmbTRtVDFF?=
 =?utf-8?B?cnZCWi84aXEzSU44L3lXUzZ5S2dHb1N6Q1JqOG15TlYyaktlM29IV3ZCQnRZ?=
 =?utf-8?B?L3ZhdzFLRzNER3VTbXp0RUx0MkFPOWZNZ2lDMDc0MXk0MlU1TkRMdzQ2OTFh?=
 =?utf-8?B?ZVR1bU54eTQxNkQ4WVM1UXVWSC90YnJQVGtMWU9USjR1M0VoV0FhdmRwNG9t?=
 =?utf-8?B?TzA2bFFoVSs1a3JKem9CeDFodlFSYzNwN3JBQ2IvbXI3QVJNdzdHcXZrc2NT?=
 =?utf-8?B?NWNhNmZzdEJZa1VnVmlrMk1FenFTdmJieGQ1V0lIQWlHTGhYSzdDUkQxckJO?=
 =?utf-8?B?MXVPZk1vNWxEOVNVbFpxTUNQRmhERGcvajkyTXRrL1ROSUtxbjNJN01zQ3ps?=
 =?utf-8?B?WkRvaU1LTXU0U2tWMWFzL3RWYlczOHZCMnZwZGNMWEVJUGE3T1RWenN5bC9j?=
 =?utf-8?B?Q3pNVUZPdFNGbkpnMDFpVk5RZmViRnhETGszTXhEbVM2QjRjRnoyVDdFNGc2?=
 =?utf-8?B?TzFpT2NWdjRickxscHVlRzdyaHAvd1NacXpSZHJtQmJudTJzcVZYTUwwbU8w?=
 =?utf-8?B?UG9hMjJNZ1NIemRjS0o1MXRlM2JjdVhwTTdQYVUybUhYaGlpUHF0NGVxSzMv?=
 =?utf-8?B?OUt6SEhseGZneFJIa3RDbWd4VFJZdHZNelgyWnRsbjlHVFRTN2crdzhVOTBL?=
 =?utf-8?B?dTBTeU1rbTVLYVcyNlRUVTNKalpMNTVpTUczZVNsWnFnMXZVUFlUTWR1VUh2?=
 =?utf-8?B?Qll1cm5nYVJLMmRNY1VETkdoL0F4ajZGTnRFMkVKTDNRcm9KREtkTDFkMmta?=
 =?utf-8?B?NUV1OXdwcDU3RDRzWjVQdFFpZGY5MFAvcDhCNDc1VGxNcTAyZTBuVGdjTDVD?=
 =?utf-8?B?cm9NZEptazlDak9YdjViNkNOdmplZWg4OWYxNjh2MDBSUzU3R3dCaE5rZ0lI?=
 =?utf-8?B?QlpRejJUb2hKMzAvMHBzTVh3RXQ0UjBEMU5NZURvVFdra0RmODJjRFlsdnJa?=
 =?utf-8?B?bjByR2t3TllLdUU0N3BCcWNqZWZoN0lJWUtWaFNBQzB2bHFvM0VMcU05VmlY?=
 =?utf-8?B?dEU3UVFUejR2TGFMSjdnN0dMZmVSMzFPWnhIcXNPMHZtQTAvWFdZN0ZLeG00?=
 =?utf-8?B?QzlUL1d5SXBiTnZudE1RVXRSTEhrcExheEc0ajA2eHVVWTd6bkVwRWpDNVRl?=
 =?utf-8?B?ZkFvNU5YUVZQMXhTQ2RiTHZPTUlLdjFKd3dQN0NvR3J1eW9EbDNObXVNT2NJ?=
 =?utf-8?B?TklRWGFNZlpvRlhzYXU1d0xVQ1U1Nm1udU5HZ1BMSW5RRXRjcDc5czliTWhl?=
 =?utf-8?B?MjhRTERaLzBnaFZlNkk4RHVnTzJuVjloN0FZN0VDQjdOL1Z0TVVGMitGekVu?=
 =?utf-8?B?UG5QYm9hbUxDNXZDeHNjc0ErRWVBZmg5bTNocm10Wm9tQzdwVzJDemphYUVD?=
 =?utf-8?B?N21YbFdRbjZQaUxMNnp5TnZFalMreGdlVDN6bHFzTklXaGtTalNxa3pXMXl6?=
 =?utf-8?B?dms2c3dYMy9wV2NHUVpxd00zeXNRQmNZRFlXUkVVZGt2bDdJMVFGU3RYWG4w?=
 =?utf-8?B?UHV5OENEdGJ3U1VyemJPSk15bjdVMEZuMy84WmVZVFhTOHhIajdDdTdFU0lq?=
 =?utf-8?B?L2QydTBDL2FUVTN3akFsajlOZDF6VndmamdtbG5MVnhJckRYVTRCdmJEcFVn?=
 =?utf-8?Q?UytDOtrlhsa7NvxJO4dugs9cdWBsyCdkTr42cQFCNs/N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6056414-4561-41d5-40a6-08dde60142e0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 07:05:25.6600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPcZDQGftrVLY4fX51OFsI59zqNypxKbusqbyXhalDzmzlRqL2YIpU+XDx3Y/iFnIVhpW44x0odKaFs1IRmvTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDDE56F72B
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

On Wed Aug 27, 2025 at 9:51 AM JST, John Hubbard wrote:
> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
>> `FromBytes::from_bytes` comes with a few practical limitations:
>>=20
>> - It requires the bytes slice to have the same alignment as the returned
>>   type, which might not be guaranteed in the case of a byte stream,
>> - It returns a reference, requiring the returned type to implement
>>   `Clone` if one wants to keep the value for longer than the lifetime of
>>   the slice.
>>=20
>> To overcome these when needed, add a `from_bytes_copy` with a default
>> implementation in the trait. `from_bytes_copy` returns an owned value
>> that is populated using an unaligned read, removing the lifetime
>> constraint and making it usable even on non-aligned byte slices.
>>=20
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/transmute.rs | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>=20
>> diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
>> index 494bb3b1d059337520efef694fc8952972d44fbf..721dd8254dcedd71ed7c1fc0=
ee9292950c16c89e 100644
>> --- a/rust/kernel/transmute.rs
>> +++ b/rust/kernel/transmute.rs
>> @@ -78,6 +78,23 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Se=
lf>
>>              None
>>          }
>>      }
>> +
>> +    /// Creates an owned instance of `Self` by copying `bytes`.
>> +    ///
>> +    /// As the data is copied into a properly-aligned location, this me=
thod can be used even if
>> +    /// [`FromBytes::from_bytes`] would return `None` due to incompatib=
le alignment.
>
> Some very minor suggestions:
>
> This wording less precise than it could be: "as the data is copied" can m=
ean
> either "while it is being copied", or "because it is copied". Also, there
> should not be a hyphen in "properly aligned".
>
> I'd suggest something like this instead:
> =20
>     /// Unlike [`FromBytes::from_bytes`], which requires aligned input, t=
his
>     /// method can be used on non-aligned data.

That's much simpler and better. I'll just add "... at the cost of a
copy." to not lose this information.

>
>> +    fn from_bytes_copy(bytes: &[u8]) -> Option<Self>
>> +    where
>> +        Self: Sized,
>> +    {
>> +        if bytes.len() =3D=3D size_of::<Self>() {
>> +            // SAFETY: `bytes` has the same size as `Self`, and per the=
 invariants of `FromBytes`,
>> +            // any byte sequence is a valid value for `Self`.
>
> More wording suggestions. How about this:
>
>             // SAFETY: we just verified that `bytes` has the same size as=
 `Self`, and per the
>             // invariants of `FromBytes`, any byte sequence of the correc=
t length is a valid value
>             // for `Self`.

Taken as-is, thanks!
