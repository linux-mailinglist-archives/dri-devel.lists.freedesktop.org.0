Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B6B56175
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29EC10E20F;
	Sat, 13 Sep 2025 14:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OP6F+ftn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848BF10E21D;
 Sat, 13 Sep 2025 14:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9dumux7hc+/Zn0fa9N2iiBotoWAC214FO4hZXACD3PoSTLpzC5FyQZtmJ7WDdwwYu3VDGhMmtY4dOxHss6wheud+dbOuVFYChN0QcNP0owxQk4iNq9c82yh5+sjRnhwzG6NzPmq86JId93bPVF6DJSxeZkAF8l4ZGtTVw4RJZmgphGc8QCWzb+swIUqa7TKUYlPTDDqLvEs7sS5vFKrhgW2RKClv5UP2NqX2Gt20Y4Ld3PGosZPUAtBqXM8RNWy3LS+vYbD0xbryCL8iXS8YiJQvtKJhrdiHgjdnQGlJlzFQN759xP8WLF0sTEsc8nAKRq4EKu9zDDqr4RSThkNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXfBA36fX3kWgyGdfy+FrcTaKWGpdfnz45KW/LLXukI=;
 b=dAqF08jJvflWjn6fTbxsk00HDOoKxeIHQN7db6fEXkjd4gdhHE5saANAlIDUvGELGGbRWiu6NKRpTLtsivz0SoeNcAr01PzzP+hlC1sGpkmvpSOLd2z1oeVb0dbWIH6l99BGg1Ilj/c3nBDsRdoxzzx79RVprvLXsE/Jv6B7FUdQF2M+jApjpdM4VE3vvTTd4/Iq5rNLjkkUUjauAyud8tccCYz9WUjVxCkIX+t/k2AQm5BeU+KBq9EaFNY6mgmjKlcEO31AVD0HQSN6TEO4qO22OoHnFwQF4C31WFfPQXLUD72Lu1wUl+BG/csveBaeF6nE6iHueqwn8tGVnz1IGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXfBA36fX3kWgyGdfy+FrcTaKWGpdfnz45KW/LLXukI=;
 b=OP6F+ftnO+cUnhz9DnEp4gg5oKik8QukUK/eCdgSUPT1iqV9IacyFbGvBWdHk8bLlOu4OPJOkaAk6GzXuPfsvbeBhrS0RA6c5X/S8oC3ONzW3npu9EKILTsolIR3nSykrm3M522ltCNv4yZNGrwsyeOb6Xb8SX1sfRuWeH+v1/YLHrPAd9XlrbKgerds8Js+L3J9IdIxtBRfz7Cpj5FuPYgOIZj0zs17qiBlLumHJG205WS8KQEuPLCU05Y48SM5Zh4bwA31Mq2aZ5SsZUKGyQPG7zkVNjnVUreiKglnwVn4herS9RRWg4YJfVigOvKtOA6t1N7MdCsFaNuAf96FWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:56 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:23 +0900
Subject: [PATCH v6 10/11] gpu: nova-core: Add base files for r570.144
 firmware bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-10-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: a696a743-9d52-4208-fdc0-08ddf2cfa2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWErcm5YZ2JOME16MzZ2aDFNVUtxNStna1A0S1JxTy8ya3FQb0ZPUkFyaTJy?=
 =?utf-8?B?dk42enZzNXhFa1R4RjhkSXA4T2o2U2lpU05KVUJ4c1kvTi9GMGYzdVZnc0ox?=
 =?utf-8?B?a0lHb1pXK0JaOFdvL1VEdzlmNVFYeWRabkhQVlk1eVA2b0l6VnUyQkh6R3FT?=
 =?utf-8?B?aHRaM1hUL0txL2NIbTRIRlpxUGlueWt3Ymd1bi9jQzJlUHYvNGpPaFZxNFpO?=
 =?utf-8?B?ekorOGx6V3BvcCt5UTZWMTVyVCsxZTQ3N3JMTDRDbWFKbGs2SVN4MXBkK2pv?=
 =?utf-8?B?Z0Zla3ZpR21EM3h4WG40QWdRRGFLRkdsaUV4N3B0Zm1UT2hadVloWm95RWd5?=
 =?utf-8?B?NDVXNnQ0OE11TjlyQldhdEErQk5FVENnOGREaUxoYUtEanpIcGs3eHQzOFlI?=
 =?utf-8?B?QVNkUGc5RDUyMnNDQmdSdzlmWUdLcjFSY3FXL1lKZkNDZHFHMmNYVmxhZkZP?=
 =?utf-8?B?MnlDcVU5TmRaM2R2YzJDdmU5Z1hiYUdJNk1vREZnVGIzZ0NBRHc5ME9IKytT?=
 =?utf-8?B?WFlURHdJOE9VL2FRWUNTTm85UlB4ekNSOHBFSm9UNkEvZ0hYbnIvb3VjY1FH?=
 =?utf-8?B?ZFNqcjJpbHYwUURyVXg4UE0rMUVTQnZRS0JGak01WmtNbkZtaUlzanJqczJv?=
 =?utf-8?B?LzBnVzNaRGlEdGxyRDE3SHdFTko0R1cxNTZkVDVLZkdXbzdESUtVTWcxdHA2?=
 =?utf-8?B?a1hrdk1YT3B3U1BoaGk1a0tEblFYbXhZZGxaTDZkNEhSQTlHUlpBeEJCWTgr?=
 =?utf-8?B?MzhYbTdndWkxdXZ0QzBJMURaRklYU3RDTFZXZ2NGaGVVUXpGVm5zS3FFb1VX?=
 =?utf-8?B?b2FEcVlrYzlYUitFT3M0WHBNbFNjOGMxQzUrMlJzOE84Y0w3NFlYZ00ycnFC?=
 =?utf-8?B?aTcvaE9uSmY0aDhiOStZcUVHYUI1eElaWFl3MXpHdEQrbmdYWUtyZjNZa3Yz?=
 =?utf-8?B?Y2NKZXBiSm82dXdzQTNORDRoNmtaVk5vVUlqMHhMYjJEdk5YQnNNZFVsamFE?=
 =?utf-8?B?M2dOTnIvamlkZDhZQ3dkRGViTWxvZXhjMUs0aEFkMU5PNzdINVBEblozdHRy?=
 =?utf-8?B?RUJyKysxV1h2YytmWVRWSmtxODRPSzBrcnVtYTRYSzRZRW5yN29SU2lQRnBP?=
 =?utf-8?B?VG1CK0hYdkNjbHBTMTRjZkcvTWJTdE9yRWgvVS9hWE8yZHluNFErVFVKS1VS?=
 =?utf-8?B?ZGtHUU5FSmRuWkNjdVNacFd5RFpjTnNpNjFlalFPb1JENTQzLzYxblhwV0xo?=
 =?utf-8?B?ZGhlVVBTTXJhM0thaHNHSTRYMFRGcW9RREVPTTFMcmpkaGxWOWZ2Q0ExeFRi?=
 =?utf-8?B?bU5SdUIwcmw4aXV4WmM0Yjk1SHJ3Ny9HbkpvbDlKa0hzalZYa3d0UDl1VWN3?=
 =?utf-8?B?Qml0eERpUGl2YWNhYzNpdkNMbDFWa21Ia1RWd3l6OGt5cHMvbWpjMGdzcGxx?=
 =?utf-8?B?VVFvQjR2U2RlWWRGcXdYZzlvK3RyNG1xa1VFSnpFL0FpREhTNytoaUptUmV5?=
 =?utf-8?B?Rk5SRkJlWm9UaHFYVTd0dFdENWxSS3hwVVMrNjdjQ3Q1OUVGcUtOVG5qZkV3?=
 =?utf-8?B?THpWUWgrVVRMVFdpVnA3N2YyS3lNem54TEFqNHJBYklFd1VvS0xiS3cxZk1p?=
 =?utf-8?B?V3c5TGV4YlYxYkt2SkZ5dUJWamVHTTc2NEZQbHI2c0t5RS9LNmMzeXpuWDlj?=
 =?utf-8?B?WjlSRnoyOU5tc2VCcnV2bENsWFVoaGsvZTBYRE1ob1RETEtla2dhL2F0ZVhK?=
 =?utf-8?B?TDF4dWFqbFJIWS9GTWI1R054T2R2MFdPdWZ1eWJRV1J4Q1Roc293OUhSUXdi?=
 =?utf-8?B?UzV1Q1pSNnJJdHZUZ1k4Y3dtRDJBM1k2YStvRTV3V1NDeUlYR2UwT3Z3VDVi?=
 =?utf-8?B?OGc1K1Jvdi9kR0tESlFTWS8yQlFVTmI2WmpkcTl0NlF5Z0h3WlZpYmRjMnk3?=
 =?utf-8?B?ZHpJaWcwOFRPSmNVNGpFSXhPSUsxLzdIZkVWQ2FTYWx0dXF6REtZcmJHRnNL?=
 =?utf-8?B?T1Z4R2VFMnVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1NMeTNmMmhaSWFKR0R0V29VNSs2Snp1K3ZUV2QvRW9iWlpZQ3YwZ3ZtbXJP?=
 =?utf-8?B?bUgvLy81bFBmeDBQdE1ES3FGTUZrNmFCT0UycDc2c3I0K3JabUF1MDViWkNj?=
 =?utf-8?B?RHc4OFo5YUJqT1Z2UGc5MXl4Z3doTGV0UUtzUGx2TWREdkN3UWY2QXE1ejNP?=
 =?utf-8?B?TmVzV1ZjbktGVmVGQzZPRHoyQVhZY3FtVjgyTHdDNm9VQ1g4cGJzS1ZNQldX?=
 =?utf-8?B?b2VIaXBBSjdJUTRnTG5meXdJbEVFa1NNQ0xXUnZSMjN3MVIwUnFDMmZiKzBC?=
 =?utf-8?B?WjRhclhuS1ZFcWRTZGl5N1lxaWRKQlVJNUppKzFiSHprVFFnOElSMGYrcHgw?=
 =?utf-8?B?bktSZUsybkpXeFJIQWxVMSt5RThiVFBSWjR6TWdvZE9IbDRHbEN3bzlhNW9Y?=
 =?utf-8?B?dEdsM2hsQnJkR2pyWDhBR21MMkJMQm9BSHpjNUczNDFsd2N1YlhxYTZ2Z0NY?=
 =?utf-8?B?RlBWeFFCbENwK21NRVFpc3VwMmJlZGVtV2FHaFYxWGV6ZjFLeGhNTnM0a2hK?=
 =?utf-8?B?R1MwL0hDRmRRRmF4TU1FbFlYWkptUUp0WXBDM0NUQS9LRXUvR24vTlAvcGxG?=
 =?utf-8?B?Z1pRL2YyYks3WC9jQ1RLc29yNGNJQzdxVFZGTmo5S2dRYUlhdXpzczJueGVa?=
 =?utf-8?B?TWZjMG1uelBvU010RjlPVkdtWlppQWwrNUJmZG9XMlFQbVF0UjlQd3JQTGtZ?=
 =?utf-8?B?VlRrNi9RT2xkZ3VtQVVsNEtVdW5nbnJkUjBINVlOVWhKZG1PZXcrYjBBMm9l?=
 =?utf-8?B?OGZHWXdDWjdkYkFQWEtJVjJjM0NwbDkySlVmWTRLaHc3TFZtdlgyRytXSXNX?=
 =?utf-8?B?RHhVZk9tcGxzbi9HRDVkajJtM2Qwdy90SHlaZlI3bWRPOXpONW9naDRUak0y?=
 =?utf-8?B?WXhiNEJ2akJiZmlRUHNDcGRFWWtqT3pPQll5VEFwVmFsMHNxRmRybEhsT3pQ?=
 =?utf-8?B?V0tvU2M4Q0cxUnJ6eWFMd1V6QUxwbVpxTFZWYUtKSjY4eXNmVlBtRlM4dFRp?=
 =?utf-8?B?d1N3LzNaSUh3d0tkcllSTU8wS0RsVS9NVGJHMGpRdVovTlk1M2NyZzdiNzZ4?=
 =?utf-8?B?a1dsYTEyNHpKeDcwTlB0dEsrZG5sRWxTWDk2a3MwQ0ErNCtjaC9PRklyTXhl?=
 =?utf-8?B?eXM0RjVMeCtzUmZ2YVU0ZlhjQ3JJWEJaenorYy8rRHpUSXFndnJQSEVTd1hs?=
 =?utf-8?B?MEFNM1BNSjJsbC9wS0pEcU9icFQxSUFlMVpJRGplbFBGRlBBM2dKdHpZNzh4?=
 =?utf-8?B?ckQ3bFVjcGFsZDkxYnpMSThIVGo5bi8rd3R0cVlvT1d2ejdPd20xRnlvODlH?=
 =?utf-8?B?Q2dsdVFMdTFPY0ZtelUybUt2c0xPMkRIY1RTNVVndEQyc29aTHBKUGVIT2ZZ?=
 =?utf-8?B?c0ZjeDdoQ0F6akdQektkQmtyRjhQUVkyUjhtQm13UVZYb2NiWDQ2aThiRXB4?=
 =?utf-8?B?NHNyZTk5MnozSmVrbHViNjhHOWV1UmxCTnYwOFREb053cnNmdkthbC9FdVpU?=
 =?utf-8?B?VWRhc2REeXpiVVBCeXNSWS9kM2tSWExLRzA2RjY2a0tlSkxUZ0xZU0ZvcEJF?=
 =?utf-8?B?eUsxOUVUelNtcStlVlc2ODF2dTUxQ2VHUVNrQmwrZFlmV3o0aHVPQzRzR0tF?=
 =?utf-8?B?Vy9ZcFZGODlVa0xvRXlZZkd2NXM5bkNJWDZla1BIVjlZYU5HN0dsK3R4T1RM?=
 =?utf-8?B?bzRubTZNTWNGamRuS1VJb25KVHQ1aFY2bWsraDJXamdNaldzR09SN3FDNUNT?=
 =?utf-8?B?VUsxWGVjUnVZNUU2ejdENk8ybUlmbVBiS203U1lJcHpuN3pWQXFpSGcwS2Ja?=
 =?utf-8?B?amZJUXFWeTdtQi9DUGp0RmN4Tzl1ajhQeng0RDdaUFVkeENtU3VyMUpubDlq?=
 =?utf-8?B?WXRROGplczdNcUNPS2cwWndEbkVXNmpzYUNINW1GWjJQSFZaRkhSdHRYZjhW?=
 =?utf-8?B?L0x1eTVMbTRYQStaQWJEZWE4RUJCeldjbVlnakFQN2FlKzZQV2xkcUlFaVNx?=
 =?utf-8?B?L25HT2tmekZwZlYrUis2RGxNMHdCMytOb2FTdWNUTmFSMkRnUktQZHh1eGRn?=
 =?utf-8?B?R1MxdlVJYTl5RnRaam5zcEV3Rlh3bjZWUnhvVThIRnJLOGpLL1JqY084RDlY?=
 =?utf-8?B?RnFVUW1zRllJSlIyb1A4TCsyQTJjZzdlLzFOTWJYWDhkUXhYc05BMGp0K1Bu?=
 =?utf-8?Q?G4qa19dqZJLB30UIO8nL7jLsOLvmj09bl8Lw6EEok7iB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a696a743-9d52-4208-fdc0-08ddf2cfa2ed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:56.3244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OePyXJpVs2mS+mn/19Xq1hXEF3mrfh/bqbnLDxw4ADDCq3qh2tIUP4IYqLr/xL+qqCDjW1S8fW/CIGQJIn2zVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

From: Alistair Popple <apopple@nvidia.com>

Interacting with the GSP currently requires using definitions from C
header files. Rust definitions for the types needed for Nova core will
be generated using the Rust bindgen tool. This patch adds the base
module to allow inclusion of the generated bindings. The generated
bindings themselves are added by subsequent patches when they are first
used.

Currently we only intend to support a single firmware version, 570.144,
with these bindings. Longer term we intend to move to a more stable GSP
interface that isn't tied to specific firmware versions.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
[acourbot@nvidia.com: adapt the bindings module comment a bit]
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs                      |  2 ++
 drivers/gpu/nova-core/gsp/fw.rs                   |  7 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          | 29 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  1 +
 4 files changed, 39 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 917e8a83d2935325dd75d625cf4b7051ac08238a..64e472e7a9d3b3a600cbe45b5d18c2f12861750d 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -4,6 +4,8 @@
 
 use kernel::prelude::*;
 
+mod fw;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..34226dd009824c1e44d0cb2e37b43434a364e433
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod r570_144;
+
+// Alias to avoid repeating the version number with every use.
+#[expect(unused)]
+use r570_144 as bindings;
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
new file mode 100644
index 0000000000000000000000000000000000000000..35cb0370a7c9b4604393931f9f3bf72ef4a794b4
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware bindings.
+//!
+//! Imports the generated bindings by `bindgen`.
+//!
+//! This module may not be directly used. Please abstract or re-export the needed symbols in the
+//! parent module instead.
+
+#![cfg_attr(test, allow(deref_nullptr))]
+#![cfg_attr(test, allow(unaligned_references))]
+#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
+#![allow(
+    dead_code,
+    unused_imports,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+include!("r570_144/bindings.rs");
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cec5940325151e407aa90128a35cb683afd436d7
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0

-- 
2.51.0

