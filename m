Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD7C46EA0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1CF10E397;
	Mon, 10 Nov 2025 13:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IVzWbdXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0302C10E397;
 Mon, 10 Nov 2025 13:34:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ql+fQs9uIl52CfCLAkjhmAxR0tghzKa+OJ9oLl3DNtD61zUM2Oa7VFO1vqjZvo84Z7iIOaCNu982uKNPCPrSMgFeyF7FMwjFcarBCWKWOibmHmvuwvRiGenspdsjeQmDYM+u8mvyvluDiLM03OEx4EPp2CdVO6or9rXU7HKAKyKQAfuXu0prxyxw6gXg+hr+TzS6LoEyYrNpRteOv2g0CAaYROoJtjzFIGccsJPezwPxKpUhGFnDQJoGt48ElmymE7WoW194k+vspG86k6UEfGHjg4pu84jFfqafxECbuOEB1XELEPaJAkoyDu6KHi0Fj26zAVHPev+aDyxVz8fRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEYxAyWeZY1qqItUhZseYaW445Rp0NagWVYug8NToRI=;
 b=vjq8PEh1UJ/B40mAKZyXAJObLcQzet1NTERvNK4IcgMqaWw8aHwyLsLb5vvn+Evjjz/vHq5pdFvgckeZEzq+4WnL0wUDcSqKwCjwiKVVRjZZZM1o+4R3mmOC60NpOo7q2Tp2g91thn01CDF/BSGFvrOAN+p5OcuLZ5uNlM6lhxvUA44jHllKtpzCkcygfOwe92zML8k/IXQYSF4P5jIIITgkbLwjYxkySnBeuiLxuskn/R4Iz5PO+ku6kPj4X0IuRcomssgV0Y7C31ZW/IVwGXq3YSdCC/+IAFbFBc9GUjl4cjTZko5t3PQBs1f80jZ0yYdbVM2C5Ze+S+ul7lRayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEYxAyWeZY1qqItUhZseYaW445Rp0NagWVYug8NToRI=;
 b=IVzWbdXER16+9xs9hltG7gUFQAeVbs5jL+3M3CUVKofpynhPKAlol5E6dDfw/i+HgE07CAjmZXSb/EpUTrgw3L2YK3iL2yVOG3QfZImjmmvBpvv5OKS8bcWfaNGoTJm3VVR0UqGcdgI2xfw/4RM4VcACpsgcw5DTpQW2xWNZr2iDFnIrLsLW9nYOgOKgsLuvr+j4F9V8/p9jmq6d/MXDP328jClU2Yg1gubQBecKhyHTrOKb9Fq0yFmVfcH7oA7MwpxECC9jy7mIDvtSnoFy9RDNHM9CM5ZDicU5BU0cf486EiYy082D4uNXVJao0DpGocnK2guUsaOB7cxhtsuKGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH2PR12MB4055.namprd12.prod.outlook.com (2603:10b6:610:78::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:10 +0900
Subject: [PATCH v9 02/15] gpu: nova-core: Set correct DMA mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-2-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH2PR12MB4055:EE_
X-MS-Office365-Filtering-Correlation-Id: a380afb8-3019-452a-711e-08de205ddefe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkxuK0Y5eTlza1Bld1RnbUtCbUVzWXdZQmhRK1UwTnlEUzk3OW5MWFZMMUZy?=
 =?utf-8?B?VlZDT21hTG9ORTBlMEVicXhBQ3lGQnZDQkpvNnlmT1phL3czb1ZEVmVlMU5E?=
 =?utf-8?B?NmNWc1lNekdVc2ZNZTJHb2NZQXU3bkk4bVNOZ1E1UFovc1NWVWxjc1o2TzAv?=
 =?utf-8?B?bjArbkJYSExrczAxQnFmcVoxZHJFUzdrbzFBcTlrZ3ZEaUsyMW9rZ0xyZmIv?=
 =?utf-8?B?YUxiY3prV1pMRzYxcmZUTnlKa0xvamkzQlcwTWwvcFpneTF1VlI0cUh0SGta?=
 =?utf-8?B?ZFE0NGdJU2JQb3VDYndpY2l3V0RuNlF3ZHV6TkZGdmZhWGcrMGpvVkcwV0tv?=
 =?utf-8?B?SHZKdlNvN0VrNFZXOTIyMG9wb3BNOXp4Zml3Qm1rNWVrSG1OT1QwUCtyVkYw?=
 =?utf-8?B?dEhWaWNzWUJuR3RYaDhvcURQeWg2Skh6eFhmZHJaS0pSS0lnQWh5S1lwejBI?=
 =?utf-8?B?M3FRTGpzZkd3bnZ3WTVHUnUzdmFGV1lMenlteFFrQXFQQWlVcGc0bENRZHdN?=
 =?utf-8?B?NHNEKzBuTlpBL1ZhQmRNZm15a2pwMmFJS2lveXZNZGkxaU1pSnRxK0Z5dnBy?=
 =?utf-8?B?MFpzZlFSZzljZXFJTEZleDczU0xYT3dkUzhqeFk1UUpQc2NrdFBxaHE3UzJB?=
 =?utf-8?B?YkE0d2VxcUJFRjJDZXhUMFNicXVzcTJMVlZGV1hobmc2WXV3Q3psN3RNQXpr?=
 =?utf-8?B?UEpIYmJkOFZGcGhYM0Mwd3dMM0kvM2lGdi9rOGk0V1BSMUZrNlFBWEFrTk5T?=
 =?utf-8?B?NHBxWFpxS2d2SWdwaDdrRCtHS1Nwd1RYZTVBSjVrZW5DRS9qRUc2VXJ3akVL?=
 =?utf-8?B?OC9kU3JXazNUYXlVM2xpTXEzc2tZME9MU094bHpLd0VJSU5uQUxWeFU0QnZ3?=
 =?utf-8?B?em8yeXJqUmFHVHp2ZFRyUHZqUGJGbEFZZ0wxa1lTa0JQZG5WV25PL2p4QVYx?=
 =?utf-8?B?a01kQ3lsMENXYUU0TVFYSUZLZ0I3RTM0Z1lhaDNTdTZOSGxGZDkxelN5WEVu?=
 =?utf-8?B?NmJBTTFTdEY0NnNqSkpGc2IwcDFpRlp3WVpJc2pYSjNhdzVjTGVvOWtLMFFO?=
 =?utf-8?B?aHFVaWhQVXJoR2RvVm14YTQ3emYyMEdMeUN6M3ZVM2t3L3ZPZkl5NXFaa2VH?=
 =?utf-8?B?ZUZCTlZCZ0w1MHBXT0RydkdNZUpsY1FDUXBUWlpKaXBpVk0xMEFQN2hVU3R0?=
 =?utf-8?B?dDFybXJHZjVIaFRNZzZXV3RpWjZ1OGdKWVhPNkp3MUgzNi8zeFNpU1NEL09C?=
 =?utf-8?B?QTNxcWJzZi9zWkJiWUNnQzIrQldjamdxRWVhem1UN2c1dnR5UlJzNzNvMnZT?=
 =?utf-8?B?d2VmM3EySmR6WVZ3R0ZpTDJGMTJ1UUNMVUJBZ2NTamkwUVFMSC84QThVWGlr?=
 =?utf-8?B?ME1sVzJCRVV6Z0RsZCtrTjdRQzhhQnp1VmJFYnZHc3VnR09IVXdzRlFERGJN?=
 =?utf-8?B?bHNxRVpFbTh2U1IxTVFQNmFmUm1YWHVOZnQ2UWZoQTJWSkxpVnVucnM3VEI5?=
 =?utf-8?B?ZjVJZkdPM1JpcVRaY2E1WVdNYzJxU25lL09xVCtQenhnaXN5SCtTUjkxbDVH?=
 =?utf-8?B?bVhSWjYzNlV6eW1CRmlkcnNRMTZpY3RPWTRQSWR6NnFyWDhtRThSMUxXZHVE?=
 =?utf-8?B?SmdMM2hRdFBvMk1iTEJTNUVqZ3ZlSFA4MDZXQTZpNGZwamdDdGtaZWY0K2ww?=
 =?utf-8?B?Q3orZnRTRkNMUmZzU3JnNjlZbEZwRDc5V0NYSzNmdlEwRzZVNFN0TFZsTlFk?=
 =?utf-8?B?c3d1aVErOTJ3QlNkdm41MW91SXlyb2xJV3p3QzFhY2pNdDNtaW8vLzdrS3Rr?=
 =?utf-8?B?c1N3L0diZ3pwdDJDUzdGNmN1TmtXRVVGcnM2ZTd2Zkc0eUJUSDVJa0sxZmJW?=
 =?utf-8?B?MGlWZ1lMdmFLeS9KTXVnc0c3WjZkVUJvSlkrVDVsSW82Y3lNaVdzb0o5dnNX?=
 =?utf-8?B?Mm1pLy9SMFJ3THQwbVJmWTRxLzYxNkNEVE1XcGZYYWlBVXNjV1ZVMWNSVGFO?=
 =?utf-8?Q?S9/o+VPG+ZJK1ffREDl/CbA31QDHzw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnJ6UjJtbkpCUUpZM0lmdUEyd01yZWl2bU9qSFM5UkZwb1hrUHpvb1JmdTBC?=
 =?utf-8?B?VUM0Y3lMUlY2c1RydjRsNzVKUDBCQlJUcWlVSDV6ek1tTkxxYWpHYWsrelNt?=
 =?utf-8?B?MlR1cGZ4UHBMNGF2OWVOWDRDUVMraG9wM2ZoRFJIVUZldDRIYW1mdzErZDJl?=
 =?utf-8?B?eTA2QjFINWZ6N3QrTGdBUW9qWWF3dUdGVmZ5eVpMeFFPWEJvQWdKbEt2SDN0?=
 =?utf-8?B?Ti9JQ3FaRWp2LzhBSVN5cm5HaHZVazM0dEpUZEx3ZXBlRnI1NVJUZ0s0ZHpk?=
 =?utf-8?B?dVF1bXptYkZNSkVSYmg5ME1ubFlMZ0t5TURXTXJHS252WkxMRlVjVklXOVN5?=
 =?utf-8?B?QlJYc1NPMXFvV09UY2hyUkF3OEVNMnZyL1JNbjRkeFRjRWFoOWU1dGYxay9H?=
 =?utf-8?B?RDZJbmFvR1FuNjVuVWpiMEN5b3RMWGFUcFN5alR0UGcza252dDk1RitIQkNI?=
 =?utf-8?B?bWsySkNYMkl3cHBpTE04RkFubWlkV3pUa1o0TFpQUDJVVjhOYVQycHErZlNQ?=
 =?utf-8?B?U2JCV2xXK245SU1EUHozdFRCNWtOUjFucXU2Q3RlSmZaV2Z2Q3FycVlObnBZ?=
 =?utf-8?B?OVVINnFmdGh3V2txeXZpU3lrc0x2ZFIvVWt2TmFOMEp6b2xuaU8yQ2dFeE05?=
 =?utf-8?B?azhoNHM5RkhUOWRKTWx3a3pTWURwUHBvSm5MKzBXSGFsV0lUZnBpcWhCejdl?=
 =?utf-8?B?MUIvdFhObnEzOHBJSk83dEYwbnc0RTVHM1hvL3Rrc1kvSENqL251U09pZzc0?=
 =?utf-8?B?WFVqVURwazZDcUt0Y0syQ0ZyeXVTMTBqbk9mTU9qNmFMMG8ralBxZExCMEJx?=
 =?utf-8?B?RnorS1pianhJVVNsd05jbUQybUpMZUE3cWd4SWhldmI0STBYRG9zRDU0TGI1?=
 =?utf-8?B?TWFrczlWZmNBWGE2eFpHQzl3S2k1d0xVQzRlL0hFNEdVTlFjSGR2WVgzWms5?=
 =?utf-8?B?UG5ITktkNGFrUmJRbFhod1lPaUl3cTM4VW5QYWZXSks4R014WEVPSHR6eVN6?=
 =?utf-8?B?L3J6WFViTW5WcVNjRUFPdGZ3Y2RIWGtXaEtOZTZYemplNzF0Q2ZPUjM2YWRr?=
 =?utf-8?B?Q1MyKzZTNDlVRVpoenNuYTBNMjZnSldPME9mSTh3ZnlsekwzZWJQbjQycy8y?=
 =?utf-8?B?OUg3MENUZytya3ZYMzBJNENSemNTUXZXTFJZSkM3MXNickFRQ3dZblhBSTFw?=
 =?utf-8?B?cjlMTnJlNFZqWDFhMFJGWjVIVkdtT0FzaGg0djkzNkR3cDlmcmVQTGgrRzFq?=
 =?utf-8?B?NTN1aEFSRXhtZHd3ZWN5TU1DcmlFa2ZsQUZSQWRRaEduNHc5VUZUNVR3U2h1?=
 =?utf-8?B?bjkwVVBjTTRmSVdOQVdGL0lhNUtRdFdwYmpaM3lIdGtLaUxJYjR3blpiQmZ4?=
 =?utf-8?B?SDBoU3F1UHF6VzkrZGlwODlTMUZRWHFhaTlqQ3gwK0RTc0RRYXRJZ3UwRS9y?=
 =?utf-8?B?aFFuVjJZbjkzeTZUYS9zZUVMU3NXSUNnUDVGd29Tc3U3UFY1dDVqRnJBdE5X?=
 =?utf-8?B?Q0JhY0xUOXJWRmpNY2dNM0h1UitKUXd4eWdOYnhFM3JhV0dNenJvakU4SU5p?=
 =?utf-8?B?eFZjVEIwOGc1Ym1sVHdTamNNRk9wR3pISm4vL3djelRuTW84ODYyc3pGTkVk?=
 =?utf-8?B?NXBob0VqdWNtWjllUVM5bmN4b1dZZkcwaEk4TkJVSFhJL2Qzbi9HUGVMVVk4?=
 =?utf-8?B?cFM0Q2lBOURHTHJNRUFld1JGQlRVSXpGbnp4Mk9DbXl1ZmdKL3NldU5Na2Nz?=
 =?utf-8?B?Z1VXSVhUWjRseUpZQVFTN2xoVVJXQ3kxcDdPR3dZNnBnT1QwcmdSZjA5c1Js?=
 =?utf-8?B?bTF1Q1hIL004U0VpU09PQi9WUk0zN3hrczYvZi95aTIvYU9hRTJMODdzeVc2?=
 =?utf-8?B?L2VuMExiVkJiSnd2eGNINHZ1aFhMSmNQRkdwZWRiV1RuciszTEloTDBibmI4?=
 =?utf-8?B?Sk9Dc3BQQzYxcng1UDFsN1Zid2pkWEVsNXdQVlNZczUvVStQS2E1eVJIMUND?=
 =?utf-8?B?Q0lacG14b1FsNnZQMkFDN1pBRVI2RGlmdXhSZ0hzVmF5M1EwTVFVZHVWeTlM?=
 =?utf-8?B?ZmF1ZkR5aUtUR01uUS9XUUFobnhQbHBnYmdVQmlsYmRydUNUTzVTMExmdTJ1?=
 =?utf-8?B?YTJMZm10WlJmZW4vZVJGTzAxYzB2bDU5YkpabWVacEJrbERuU2NIdXp1NUEx?=
 =?utf-8?Q?/GKF7zA+O/f4B4M8PMYnn8QxOXRaa/zsnjEltnOW2aBT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a380afb8-3019-452a-711e-08de205ddefe
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:28.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXjtYGeQTSexkDS89cVQlktAxtOAn1y+NCVI86QZoCodk2IZBEdkeVrDePrL8st0JwiOeVPOTNMg90erXcIfZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4055
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

Set the correct DMA mask. Without this DMA will fail on some setups.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 2509f75eccb9..d91bbc50cde7 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -4,6 +4,8 @@
     auxiliary,
     c_str,
     device::Core,
+    dma::Device,
+    dma::DmaMask,
     pci,
     pci::{
         Class,
@@ -25,6 +27,15 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+
+// For now we only support Ampere which can use up to 47-bit DMA addresses.
+//
+// TODO: Add an abstraction for this to support newer GPUs which may support
+// larger DMA addresses. Limiting these GPUs to smaller address widths won't
+// have any adverse affects, unless installed on systems which require larger
+// DMA addresses. These systems should be quite rare.
+const GPU_DMA_BITS: u32 = 47;
+
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -62,6 +73,11 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
         pdev.enable_device_mem()?;
         pdev.set_master();
 
+        // SAFETY: No concurrent DMA allocations or mappings can be made because
+        // the device is still being probed and therefore isn't being used by
+        // other threads of execution.
+        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_DMA_BITS>())? };
+
         let devres_bar = Arc::pin_init(
             pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
             GFP_KERNEL,

-- 
2.51.2

