Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E690A3F301
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 12:36:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5A510EA45;
	Fri, 21 Feb 2025 11:36:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KgJaEJl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038C10E2CD;
 Fri, 21 Feb 2025 11:36:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPYIaHmxtFYpcpPpGwL/dTYE8VgyESKYBwSYzeMM2PqTMVi1xYixWbwXiaq4shjLQXM5pexv+kg6Rv4688q6WsPJkdZnX1+bMP0Fdrx70fwhop/6KokpcQDCAKwOVv+L4XJUgsAs1RBIEIqRuPv1t47pIOjoGKHX6b1tbvLW+f+YwcD0PKmuA/DL0QTMMl7gnA2qYmz40ftstbPJcWhAKhXVspmAc+oDxj0ToJbry69qqVK+iB+LzBxxOwuhv5mp9v6vETJpjYb0WtiHlX8e7iDhNKZH7OyXmWP5DIiYLTEda4gOE/g5mRyDiSYdsXM9+SqHIvKlnok2E/KtA5IPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6UxIPxgPUb/hyBwCEI7G/KIJZAF+KWVAQJnNsmgqJc=;
 b=Tj+gbIVYQv6jdw4IR8jyP0RiVxovfAcTUqM7ePXTk+8pwTP43axtkTjlhafFwgbcklp6Sv//irLoMm0hC2Qkcy3H2lpmzSL737gD00q3tXQIOdOoF/L+nuL9CYHEZRWr2dTFu4SVd2qfok5aYMWtpnu8mY/arpwXGc4tb1/vFQQ3w4A3NrWc6QBSb+8hDiO7xBbiP6q0aGj2Ne6WDxgW0x7iWcyc5Wp7vKm6BujL8lhIxpMH0qHMk4tzBvN+CLOBzSORaKWOTiMmsWYECgTX/hg6KYl6uoFsRXeb+A0JWiV1+C++joc4n6MEznYrOjKcsjH5E1GA8WGUwqo0mmGYUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6UxIPxgPUb/hyBwCEI7G/KIJZAF+KWVAQJnNsmgqJc=;
 b=KgJaEJl2EsL93HCL5RNH38ifraTjzvm+VIT6DCAOYn5Q7ytN/weiwpT95OQQ27/8issPavGOgGZMNRfrDpqZEMr0WLmq4CGeouVVqKAECtB0JOcz2eex4pDMpCAk5eAp8+9JOEAUVmiKASoEv9KlItfFpHNWeBa5SfZW/WcoDpEYb8gZeITI35+e10JPndPk3meUNZb45MGmn5Nf98wGhvnL7vVyCJulnlHo41wnYIKp04wt9+ujHFPfUyct7K//oWMjvozWwbFIIT2asMNkPjQZmH0P6GpLB7+zumYNxHW1GvgeZ2Afw3unZSDTTHxDaPClsZdzJzgdIeRTNcUo/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF75EAF8F39.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::999) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 11:35:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 11:35:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Feb 2025 20:35:54 +0900
Message-Id: <D7Y3CO9OMZBQ.1QGFV73NZBBIF@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Dave Airlie" <airlied@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
 <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
 <e6322f90-08bd-4e86-8dad-2ddbd7e5cece@nvidia.com>
 <D7WFP99SMV3H.26AJWK17S0UPX@nvidia.com>
 <fd920faf-a707-4c6d-8c0b-3d59c010da1d@nvidia.com>
 <CAPM=9txmQWO+SHnZhr8zXHCZ=S8CNY=PryRVkWWuHyor-ajU6A@mail.gmail.com>
 <1597EDB7-D91B-4660-ADDC-D2252B26CB22@collabora.com>
 <41cf1c79-f61c-47e7-a0ed-afb8e82d50e6@nvidia.com>
In-Reply-To: <41cf1c79-f61c-47e7-a0ed-afb8e82d50e6@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:604:257::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF75EAF8F39:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b4731d-c3c2-49dc-b324-08dd526be896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTlGb1BrVlUya2JiN0kxM1EwUytsaTFSRWRlVlN5Um44QkJVK2JRKzFndnp6?=
 =?utf-8?B?cHdPbFhGZ3J3NXVlRzdXVTNWbmFaRGlZS2drQ1FUdTBxQWZEMW9IN1IzYU5i?=
 =?utf-8?B?M3RhQ2RhMzk1T0x5bGlsOHhyS2V1Uk5nZ0xka2tlWG5NS21SZStkbFdhU2ZC?=
 =?utf-8?B?THFTNjFsc3JwNysxcWRFWHp3ZVBod25acXZaLy9vVHpvVW1KM3kzU1FWR3pl?=
 =?utf-8?B?ZVJEOEljeEtWSWVJSCtYVEZSeTRzT01ydXUvTkdBQUs4TFN3bnMvdkZ4a1c2?=
 =?utf-8?B?RVp4OVRLUkJMUEdsUnJxakx3RWpxVXN2V2twZ2ljbVBtK291SXRTVUZYRWdP?=
 =?utf-8?B?Mzk3QzFiK3pXVHJCbUs4ZzAvWlQ3bW9iekxJRGRxd0M3YlBpVUxZVTl5M0pm?=
 =?utf-8?B?anNJZFA5dHVoTXpEVWM1Mm1OY1hUQ2tsRlcxRnphWUxzcXBUVDFQK0NGTXJ5?=
 =?utf-8?B?MTlEQVphQkFuZHpiblhGQXNFQmZoMkMzOEZxMFppTWsrL3RobEQ2aldFU09N?=
 =?utf-8?B?Vnc5Ry9ITTdhZTdDK0VIdkQ0bVhlVXlTT2xKL1VYNUhzVGZhRDErVzJkNUNl?=
 =?utf-8?B?NzdwV1d5ZkJoY1B4ZjN1d2hFdVg1aVBMK2Q4dG1VMm5MSEdBRTd0d2dMTThN?=
 =?utf-8?B?NHIzeUo3ME84ejhmaHdWamhQcnBEdlliUGFJY25LTW02c0U1YXdoZjRzcTRt?=
 =?utf-8?B?NDVndGFMZEkxVzhTM2xSeTQyWURWRW5UZWd3Um5xaW9FRTZLbXB3OGNEbVMz?=
 =?utf-8?B?U1lBK29Yb1c3SnVsNDA4Ym9uSWNydERRc2traGROZUFFbjJnakhRbHlPQ3l6?=
 =?utf-8?B?dFRSYVJqQkVleFYxQ2ZLaHRyRDlFQnVXR3FJOTN5R0JCcFp4Y3dyLzR2T1pa?=
 =?utf-8?B?TW42L1hiaGV2amI2NnVOdFlpU1p3NTV0eS9pL1dFRU1FWUZzTVdISGNjOFVy?=
 =?utf-8?B?VnQyaTI3YXNsY0ZubmtySHdKdHphQnlLOVhLSitIdzkzMDJWcjRBT3NtSzAv?=
 =?utf-8?B?VFBrQzh5MEU5eERtYk1vMHlNVXlGS1d4QXJJamN5N1oyZVR6TTM2bnJMSDB0?=
 =?utf-8?B?S004a1BnQk9sdHJjU0JHbEdUWmtPYTE1YjUvb1RNbkVHaUUrMFN2bVdQUktu?=
 =?utf-8?B?dmxIdVNrVDNNNzczZytWYStGZjk5Zy9yKzR1TUk5Y1pVUWs1U2pOSjJzZFM1?=
 =?utf-8?B?MGJxcXhVZE5XaTg2dGo5b0lEZWwrYU1kRHNXbXB4T05iYXlDbldKRm9OOE1R?=
 =?utf-8?B?U1dBcGpIWFAyR3hDWmhIbks4RFhXMkk3NWJTRURGNCtJdTRQcDZIcEhicDFY?=
 =?utf-8?B?SmsxSWdERXpoUnZJeCtsSTlsQXlFcXRHKytjL21wV3pnR0tIekVjWXZjN1NL?=
 =?utf-8?B?bkMzZ1ZFYys1KzRuYVZaTFRsT1laWWszV1BvVjZEOXl2aU1XR0xZdWZxMUVQ?=
 =?utf-8?B?THRtODFabUk3N29KY1BKaHZ3Zkg2Sm5JM0N4M0RjK1FWcnU1MkxaTkI1TGxl?=
 =?utf-8?B?cnVwaW9CWi9wMllNdkhoZ2QvczJGeVY2RFBpMU9xZVNCV1Arb3RqWkVZemMr?=
 =?utf-8?B?VExSRDE4SEpQaGpFSUpoeGFQOUM1Q1V2MmwzYnVVczdVYVFTbFRidGZKVXc3?=
 =?utf-8?B?OHdlNG0vYThlaTJtb0VQR3UxdE1VbVRHRTg1SjBSSk1uMUZmQUVKRVJHTHFG?=
 =?utf-8?B?VFpvV1ArVi9TMWJ5VWJsdG5VTCtWclZjVzV1RWFqdm5TVXRxTWR5R1d5Y2Mr?=
 =?utf-8?B?ZW5NdVArTTFCb3JqL0JmWEVlOUpaQjVEcjFUeE5NQTJDUm5OcmtWQWlxcmhl?=
 =?utf-8?B?N3R1ODMwcEgyRnk3WHFQd0ttcUp2eXVBamVvTXdxOUVZVlJGWFNUSEtxRFlS?=
 =?utf-8?Q?svhEqhPn+AY1K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjMxdUJxRmhDYXJDSkFWeFRocG1zdFJiOHh5WGhxWEMwbmtLMm1RQVlWbTV4?=
 =?utf-8?B?dXM1U1VaZXFReUprUFV1YS81Q2NGUTNKSVZDRllrZmZNb0h0bjk5YUFGaU8r?=
 =?utf-8?B?eldIZ1pSNkQrdk03bEwxK1VhMjdFRUk2Y2tJTjA1WE04aXdmMlJWeXZaeU1h?=
 =?utf-8?B?bWgzZW1iZ2dCOHJhZXJRNFBVNnRDcGtMcTlZTzcyT0RXQ0wvTHpwenkvaDY1?=
 =?utf-8?B?OHd4cmRRTVl3QzUvR0FzQnRoYXg5dlRMRFhBQUxNU1ZURUZLbHZGSjJuRnFF?=
 =?utf-8?B?UjdlMDJpdG5JTkYxcGRJVk5lUlI5NE9jZ2N3TFRRVEFOVGxaUDRpQlJNTzBI?=
 =?utf-8?B?bVJoaU1XYnJsWTlibDhYbkZIS3J1NjU3Z2tZNnQ5MkQ2eDNuZG4zVVMxVzIz?=
 =?utf-8?B?cTZhOGl0MkVtR1VQVmpBQ1RyaGFJalpKVmR5UVlxU1ZDeVpQaWxncXlhTWwy?=
 =?utf-8?B?cDNCNW5Qd1drdEVLb1l4SXFwL2JpQ0RBYnRuY09BblZtZVFQVWRLQkpzZVBp?=
 =?utf-8?B?T0kreXdUT3hVWDU3TnRYMEJtQkpsNVd4R2k3WU1SQ2Jyam5ma1A5cmxnaTZS?=
 =?utf-8?B?WXBEa3huY3owYkJFU2NwSlp3YzJWTnd0U3RUVUFZM2ZRcEZ2ZnlKQklyRHdm?=
 =?utf-8?B?OCt2bUROMnB3NXE1NVZKSXEwQk9lc29ZNG5ETjgxVi9QYklYS2xZejBEbTh0?=
 =?utf-8?B?UjRPcjhMQjYxNkJYeFFVNlFHeWxuUkI2ZndVTkhNOERJdnhya2RweXY0RkRL?=
 =?utf-8?B?di9qelVzczJJQlowK3N5MEN2SFo4VzRRY2pXRUxjeW1qOVh0d2xvbWQwRGRR?=
 =?utf-8?B?dTJoaU1iemFpNkJlU3k2NEVxeDJpM0JoVVF2UmtDL2VtVXphbnNDanV0cndI?=
 =?utf-8?B?OHc5SkFxcGtXeVBwbGg1bldiWTRTT3MzTks5SVpuVWViT0RZUzBubWhDRCtX?=
 =?utf-8?B?OHNHbGllNXZvT0NZTWpOV3I4N1kwZ1JLbzV3UHU5NVloNTFIa3dOcHd2TEFt?=
 =?utf-8?B?cThBQ0U2a3VTeHlxQ3dwU3RSMlpFN3F3WHdFQ3dYV3pHYzl4WjJtZlZTTGRj?=
 =?utf-8?B?TG9OK2hkNlRDWFlEbEVEY3BGR2hBQzQybzNhQ2h1WDVRdlBrOVlrSGRnWEND?=
 =?utf-8?B?Y0FzUFg3cXlGSzJzd3FKTUZpdlhwa0l6d29HTThGOWgzNXY1OFJtNXhVRkxu?=
 =?utf-8?B?UUN0bnRQQTVNd3NuUnZZL0tpY0ZFbkJnNkhqTDR3a2NzTmJ2TGhBblBNSHNE?=
 =?utf-8?B?VFJSK3AzRXVMeGQxZzJ0bjViTnB6ZTZEZG5qeWZGQ3YzZktOSnZZNFpobmZl?=
 =?utf-8?B?aHhFL1hOckY1ZzlsSDlGQlN6dkNKRlhFZ2prNkZmRTdMZ1Fkc1RmUFBoM0ty?=
 =?utf-8?B?bGhwYURBdVF0UGdLZDVEUGNLRHNTR2NJbUVwR3ZuWWt0b09tOXNmczBia2RO?=
 =?utf-8?B?L0tVd0U1UkdJY3gvVXhpMHZldXZWR2hFV1pYa2hyb3AyYzVyZndVaE5yU1VL?=
 =?utf-8?B?Nk5RL0dVN0dnWCswbDFJRGRmTjR5V3Nya1I5aDBmMUNwdTMrN1pNNkx6V1dQ?=
 =?utf-8?B?bG0zeU9hcWJUTVUwbWNFRmc3dkpzK0pPZjNkVmtDeCtLRmc0NzZ4WUUwaUxH?=
 =?utf-8?B?VmN3L3VSMDgrTmpEOFNmem0rUGI5RSttc254SUJmY3NzZHhnbHZnUkQ4Q2FV?=
 =?utf-8?B?MHA0Vk5FYy93ZWtVOTRLN3VpL0hkV1Yxd1ZHYmhiRWg4d3dUN3RpR0ZiVVdM?=
 =?utf-8?B?bXZDVFU1VmZiL0tIZ3BlaWFQK01SRHpSbWQ3SUJHTGM4TllTdVZZSGd2MUFa?=
 =?utf-8?B?b0MxTzI2MmFtYUZhcElHL0FJZFZtS3hkbWYwLzltbWVtakVLOEQ3S3RYRlNJ?=
 =?utf-8?B?SmpKMkxpK091MEFqd2RrYVA1Q0ozcTFpVDJTOEV0Tk9iVVE2b3dVNlpGNVRN?=
 =?utf-8?B?Ykp5OVVuZmI0bjhMRW5yK0RzcW04Q1BmN08zYmdCYm4vQ3lyamg5eGhFTjF6?=
 =?utf-8?B?L0dObjkrMkxFUFJBOENjYVVhR29zWXh2MXNwb2prZExsTmlTcUgySFRlazFZ?=
 =?utf-8?B?MDg3d1BvekIydVZraXpQdGdOaWZ0Mlo1OVYxb3JvK3NXOEkzVGhzQ0pkcmlP?=
 =?utf-8?B?ZnhCcWo2czRJdnUrcFIyQUlOdGFJdDFLUmpvSDRaUExDK2FHZUEra2o1U2No?=
 =?utf-8?Q?kXjhIu3kptpPZCw8tEEWm1AFZD/TUFl4qmpU7gdl5i6q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b4731d-c3c2-49dc-b324-08dd526be896
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 11:35:58.1474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dw6UFkVkjWV4/Ezs6I/1feGjMdjWj8QMRQ0MSQ93ezc0d3elKbUhbsS1bDvwbrUbPWb8yFhxJ6ochN5nFC67fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75EAF8F39
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

On Thu Feb 20, 2025 at 9:14 AM JST, John Hubbard wrote:
> On 2/19/25 3:13 PM, Daniel Almeida wrote:
>>> On 19 Feb 2025, at 17:23, Dave Airlie <airlied@gmail.com> wrote:
>>> On Thu, 20 Feb 2025 at 06:22, John Hubbard <jhubbard@nvidia.com> wrote:
>>>> On 2/19/25 4:51 AM, Alexandre Courbot wrote:
>>>>> Yes, that looks like the optimal way to do this actually. It also
>>>>> doesn't introduce any overhead as the destructuring was doing both
>>>>> high_half() and low_half() in sequence, so in some cases it might
>>>>> even be more efficient.
>>>>>
>>>>> I'd just like to find a better naming. high() and low() might be enou=
gh?
>>>>> Or are there other suggestions?
>>>>>
>>>>
>>>> Maybe use "32" instead of "half":
>>>>
>>>>      .high_32()  / .low_32()
>>>>      .upper_32() / .lower_32()
>>>>
>>>
>>> The C code currently does upper_32_bits and lower_32_bits, do we want
>>> to align or diverge here?
>
> This sounds like a trick question, so I'm going to go with..."align". hah=
a :)
>
>>>
>>> Dave.
>>=20
>>=20
>> My humble suggestion here is to use the same nomenclature. `upper_32_bit=
s` and
>> `lower_32_bits` immediately and succinctly informs the reader of what is=
 going on.
>>=20
>
> Yes. I missed the pre-existing naming in C, but since we have it and it's
> well-named as well, definitely this is the way to go.

Agreed, I wasn't aware of the C equivalents either, but since they exist
we should definitely use the same naming scheme.
