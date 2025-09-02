Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96803B3F26D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 04:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B6A10E55B;
	Tue,  2 Sep 2025 02:38:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O7DsliXP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748910E069
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 02:38:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6AmrgpUbbaNoP4X4DilOakv4hHPWuMSktEXkDSCamjHOqhcTZZgJIY7SRHt7maw8u+aaYBMKrXwZ8E2qMn4El161pLJYYPh7uBYHegolhZ5lcHmW/VSnnHUE21a9RRA9gIo9mJm8lIJ3svgAvKysMvSRgo0PZfBJl1crrZmsbreynyGuaij87OirXNZlc+0ggL3Mk2gKTTfEUiAwNim/w+Aswnieo2F4rS+Jq2c+1JDEIRtsN9T+GnHDkX30SYY5TaxWgsldEB+ljdEIimwKJyLEb9xJwthtDqalUs6lfENmkzFj6BmDFvyUEeYDRi6JpEifDgzD9WIqe8fxdajmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtq7JYSedRluXNjfObLY5qUShRoPc+WJdX4jGLiXKUE=;
 b=DkyQlBx/u5ZnLKyrqvWL+IIMMB6XnfLwOEkfkx9+/QFX1h3SOOhu2yVWJ/XZ+HcmQtYm3mawpfdtbxYGae+i4ZH3n1rOVUkGndkCle4Zp/FTT+NGkZTze32s4L2MYRrQMddDgkvdReyg5r2WUUPXz0h/c883dgDP0nN18+xYzWK4Lw8HZlIAamJCiNN2TIaDGHGphHKKBfPdBUZ4075i/PTtKRl7WH4KAZkgxR2PPuFF7tt0f+c7Bn5WctoM+KRZtNoYxGj3MbJr7hAj/Q+DYMaNWfnPcLzH06HiNhaYPFzrV7726XrazCge6msh2KhhNFtkMepjazVvBC81/DrYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtq7JYSedRluXNjfObLY5qUShRoPc+WJdX4jGLiXKUE=;
 b=O7DsliXPN+HgNNehRuvEyiS4KIqkdVR5d6Vtu3VUgmObzsMzItXwC4cEbYpwkJqiB8LVUnThI1PeDouIk51QyYV/Do2zU64LKBP/pRJvSJyW7nim1GDChlxwLIslkikWhZ+YmqQq22yc7BV2sQ0dIqOK7lLQoApJGm1JWSl7RrMQxVENr8AfqAJTUG5u7lfqGbFSJ+11xhuN/ICCy1AXbZYHhGWPZ+hCo5alOe9NfD5Lmy4sQyGCxLsrL/q035WHVnTpk2cwpTvPu7ogfOHmbXZNsQ+94IQQzmePdcYCsS+RKsherkk7KsY0g2ZhFGJiomOTJF0joR9UOFHyeU6wcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH8PR12MB6961.namprd12.prod.outlook.com (2603:10b6:510:1bc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 02:38:28 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 02:38:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Tue, 02 Sep 2025 11:38:18 +0900
Message-ID: <3643424.irdbgypaU6@senjougahara>
In-Reply-To: <20250819121631.84280-20-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-20-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH8PR12MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b440783-cc04-45e3-4af2-08dde9c9c88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU1hdHNSb2poSnE0Y1dab1hEK1JGWldXNEFRdDNURjZLV2djZlo3UTRNQ0hm?=
 =?utf-8?B?NmpQRVVSb2Z4WDlPWTAzcHAwc1lpbTI3eU5mTDJ2OFUxRjRvdEE2aVhvNDVI?=
 =?utf-8?B?c2JDQ1BoNENpUFBrSXdWVWppNVgwME9JNUZPUzU2cHBTckZQTWVQUktFbVlk?=
 =?utf-8?B?VFFMZU5vTjFpV2k1b1JpQ0RtM1VVZ0ZUcVpQL1BlTVdPbFhRVzNpZ0N1eDlq?=
 =?utf-8?B?ZzMyaUREeGkzWnA0R3FKbFp4OTN4UjY2bDJTN2VwMFFSSm1oaytHNW5nR1Jk?=
 =?utf-8?B?ZGJZMitRK0VQaHFoRXh5ZDJmNG41NEl0WG9ZSFVZR28wbTUzMWpMMFN5eEkz?=
 =?utf-8?B?eCt3ZS92S1Y3VkE0QVluMFkrcGxOdHZSVENZRGZ2TkxydittMXExeTcwQ0JH?=
 =?utf-8?B?SkdmVVhQcUdxNGpFUnFGWWxKVkhHQnBDOUlFZm9LTGZjM0U0VHVoQTZQQ2sx?=
 =?utf-8?B?emhKWExId0JZcFhsdGNtNUFtV1IyQ0JZSGI4ZHBaSmNUV3FQc2FBUitqUGs5?=
 =?utf-8?B?cTM3dlJVSmcra2p3OFFqYlI4bEpwUmlkRDFaU2FvUlh4cXgza055N0JzK0x2?=
 =?utf-8?B?MFE5Z3JMSGRaRDJ4NHRZV0VXeVdscHlXZk5HZDY2TVlxNXF0cmRpajRxR1Ji?=
 =?utf-8?B?SEo0NXc2QzVwajhUYm5EbHVMblo2MTZmWDI5aTcrdXByeDVWeU9INDB5QVpS?=
 =?utf-8?B?RDlIUjAzR0o4WlB2TUo3allJUGJLcXNtbEQ1WTdrQzlTa1JjcWxmdWlDVU41?=
 =?utf-8?B?dk9SanlITk54MnJhcXZBVjZGREJMK1ZueS9YTUVURFJTd0dhVlhvMlBkeity?=
 =?utf-8?B?cHJGRmtUQmJWUTJsUDVpR2R0eHllNXBHeU5nM2x6MUZnVnFtRjN4NGRSSFpR?=
 =?utf-8?B?NU95cGhIcUdtam9scHlGbnZSMHgyOWVHdTNYL3pHTEZOSytINFBMeVBrRVE3?=
 =?utf-8?B?d21XamtTazVTOUY5UG5Rbis4WGF4MEVTYzRzSGpPK3kxU0tMRzdDYkY0VDM4?=
 =?utf-8?B?Z2JVWmNDcEVoVWgvK2RqVzAvdFdvMHNaajRjWXUvRkhJMHM0cEhnQis4Sk5M?=
 =?utf-8?B?RjJMQTRHV04vc0YyRHlqL3BuSWd0RUVuaEgrdGFlWUxOY3MxN1l5cCtJT3Bv?=
 =?utf-8?B?ZGNxUXVMUDY0Q2x4bjhodlN1R1hLaFNtVVd0eW5MTENwUzIwV29WVldETkdr?=
 =?utf-8?B?cmJkRXBhQ1k3c0tlRHJ1M3dHZ1ZvdldxRTV0YnZObi9NMzNqVmhUTkFCZnFp?=
 =?utf-8?B?SDBXcTdHZzZiMmhvdU14MklldFY0Qkl3b3BnYVo4UDFrdDhoRm04cytHTlVm?=
 =?utf-8?B?YkRIck5vSm9YTE1HQXNid0RVOTM5dDBFU0lURTFEbWtYMHA4YlRKeHoydlZj?=
 =?utf-8?B?aHZxN0VDL0JLSVhxV01ucDc3Y2Z4VzNkck1TbHZlNHJwK0VlRi9tcVA3L2R5?=
 =?utf-8?B?eWlFNW9LV2tlRkJtekhXVlAzK1IvdlFQV1Z4V2Q4UnZmbElZS2RwYXNRMnQx?=
 =?utf-8?B?Q29XSHdURU51THNsdGJGYUVLWGVtMldXM2wxcnBIQnpydVRjMVFqL3VIZUFK?=
 =?utf-8?B?NnIvQnQ1Sm5ndjNlNXRXaTB5UUpZc3NYalk0YnhKWUorRTV4dVVNRUwxQWQ1?=
 =?utf-8?B?bk5keFl3OUhEejdKcGEvb2ZDK29yUW95cnlJc1JSS09pNlRIZzYwM2RlV09D?=
 =?utf-8?B?V0UzZnhsM3hrdktzMHk3WkFLV05xdkloM2JCU1pMeXJpOU9Ja2g5WlNwOUdq?=
 =?utf-8?B?c3lnSEk5RWp5dmlqd3pkdVNOZkJUMHRwVUpWV005RjV6Uzl6enVjRXMwTkJZ?=
 =?utf-8?B?Ukk3anFPZ1pncFRVbEozazB5OTl1VnlLaEQ2eGlVNW9XdDdPQW1vYmYvTHd0?=
 =?utf-8?B?NE1sam9Ra2lEQXp5SmJzclp1SnZ2SkN4VFFtTVpHMHhXWTRxSHVOK0tjS3VO?=
 =?utf-8?B?cjM2TTVuVnNKNTE4dlNpQzJTUzNPaFBkVHM2bzNzbWN3THV1emsvdGpDS2FE?=
 =?utf-8?B?MllXQllkSWJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkdQSERudTNZUFlzdXlrNk5ZNDhib0FBdWdzcU9SdkMyMTVPU0FVMzNsbHdq?=
 =?utf-8?B?OVlxK3Z0Y3h4VGR2ckNaR3RxTHVGTjFIYlZFdUJlb1FVNW5JK2xVMHlvemQw?=
 =?utf-8?B?YWhFdTRobTBFY0J2WkFxUU9zcVVFRzU4aEZtemRuMklvaUpNVEg1QktkczNZ?=
 =?utf-8?B?NXdJczZRYnBsS256elM3cDBBcDMwYVhGREJCbGlQVTg5SENsWVRRcHI3dXJw?=
 =?utf-8?B?Z0N5aEdVY0c2Vk5kbmtYcHBaRWcyY3lGV1VDTUNJNE5GbEEwT1RhM0tPeTZM?=
 =?utf-8?B?ZnNuTUNaTFRrMHYrbks1V1lLME9hcW5Sbi95UjRHdTB6YWdWbWlsUVVwWDlI?=
 =?utf-8?B?R3l3c1dNTkhoWnNZWWVPRlhVNUNrN1RlZnYxaXhDUExNdHEzd1YydkRvd3ky?=
 =?utf-8?B?RjJON1BFNEZoUnJacDlJeW53UVhhR2NxakliRFlUOXNBQk1tWjgwTEltaHVh?=
 =?utf-8?B?V01SOCtXOFQ4YTAvM1JyT3VMMFlQZmpNYzk5VWxWakNJSmFWQmJicFYxNkdu?=
 =?utf-8?B?NnBpOGdYVHdTWnlpQVFsTWk1V1VsUWJZem14VWVaUDJLeVdBYVF2ZDdJN0dH?=
 =?utf-8?B?eWp6Zm55RVpMbDYwNTJ2NUcvcC80T2NjdzRmWGlTcVcreGcwTk53VDN6ZzRL?=
 =?utf-8?B?YWpsbUNOMGV1R1Z6dEo0Z3YxbnpVYVBzaDVOYlZsbHJBMGowZFIxa1NROFJV?=
 =?utf-8?B?WXYybkNIWW1BTVdyRWMvQ1pxL1NhSldjaU1JdE51a1hIQ3Q1QmxUQzB3aE1R?=
 =?utf-8?B?eGh6WDQzMzBwSURZaTJhZGFBMlYxL05xQnVXK3B0UUQ1YmJIelFzUWFJWGVp?=
 =?utf-8?B?Nm9VbFUxT1dEVEZXVGtXa2Z4S0tLSlVBcTBJeFZtU2wydnJCZDBZeGVZQkl2?=
 =?utf-8?B?RTJJeXZpSU9pb1JwZG1ZY1phYTRCY3AxR09LdCszbXNZU21KM0NmbUp2bVRR?=
 =?utf-8?B?RU5yd1FIeVBkUDdscERRTWRkVXZZNlQxcHVxRitTUHRjUitHSWpISkdYZDZr?=
 =?utf-8?B?ZGF6UWJmZ2RwN2l1blA5WXYyTDNTU0FOUkxIdVFyM3o1ZjBNOFNhUTRRQUhJ?=
 =?utf-8?B?TGV3T2M4WkVaM09EQkM3djNJdGE4R1g2N3FGdlh6c3pWUDVVTFNGRjRBaWp5?=
 =?utf-8?B?SWVJUTQ5cStrMjNXRmdmSjA4dU80UXFJL0VYNHQ4Z2tPMHpCZjh1LzhyNUd1?=
 =?utf-8?B?NWdscy9neXFZZlQzaFpxUDJKcnpZYVJsSURPbjROTzdiNnJMQTNVeHd1ZzU1?=
 =?utf-8?B?eTJDVDZ3eS9zY1pCNUE3UDhEMjFtaXlXQnZCNDZWdEI5UWZ5bWx6Z1R0Qjdh?=
 =?utf-8?B?V0cvSXJCcVZzN2l4Qm1Gb3BTb0tUbFVZUU9McGpxZWZxSXNzcFd3b0ZEVmZ1?=
 =?utf-8?B?QmtpRzRzRTYyaUpOWHowdzJGYjJicWRCQVd5RFZ2TUlWNFRnQ2hhLy8wcHVx?=
 =?utf-8?B?YS9iUGY4WmkwWTNoOXZidTNPS1Q1cXNMM0JHRXQ0QzhoZjNWaHlzT01tZWJY?=
 =?utf-8?B?dU1QYXNsWGtjMUdjd2pLQnNLT20zemhrM1VzbytISEpPY1FoaVcwMHAxeHIz?=
 =?utf-8?B?ZDUzRmRpNWU5TXdHYlRQYjBhS21pNjBCb3pRSVAra3g0TjNzN01Ed3lraTFt?=
 =?utf-8?B?TlZSeFRLRzN3Ukc5c2NOcVZZZSt1T2VhbU5PYk5sUHhFMTdrclI1S05KdlZ1?=
 =?utf-8?B?cEVpcUhHQTN1QUFwZHdzMjNaSHFyblBtbFFWTlJnckw2TTZOSzFLQ2ZuL1BL?=
 =?utf-8?B?UjB2SHYyU2NCNEd1Z0FBTTZkeHFnSG8rR28zeE9EYUI0bVEyREVEbEdpeDFZ?=
 =?utf-8?B?RWlkZExpYS81Y1JIRC90Z0hsVTZWcHRKZnh0S3pxTkZBSlY5MGpNWEpoMmdh?=
 =?utf-8?B?U1pYVUczbVVwbXpYZDl6QW00U2RaZWxhT1pXbG9yS0xJNmxzQmtYbC95TVAy?=
 =?utf-8?B?WVhqNmF2bTZaUEpneHpxV29jcVR5QTlHZWJFaU4xTS9XODJud25qZ0duc3hZ?=
 =?utf-8?B?Qy9tbkpCQXdYam9HenJVZkduZzZGNE5NaWcxeGM5YTllajU5UW41NWVNM1BF?=
 =?utf-8?B?amRHNEkxaHZaanA1QVJqRjF5MmdPK011YTl5TTRvU0w2eGZrOEtneTN5Q1Zl?=
 =?utf-8?B?TnhvN0N4UUZST1Z6aHkydzduendHR2ZFL2w0Q2F1bk9EMGRHWjI1YjljdWRO?=
 =?utf-8?B?allXdm5CSDBsdVNVZnByeG5yUWkwSkNsaWg1VnFtblVKWFdibjJ6WTdVbFJz?=
 =?utf-8?B?Q2l6K0Jjb2xYWHI1SVpiazI2TXh3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b440783-cc04-45e3-4af2-08dde9c9c88d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 02:38:22.2676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6HYqUBg+BfdlIv3Vj/NKPoyaiIJiwpSl2U57VqYuZtXgVUAiIwaEYoPIXoM8ohM7ni3QXeSt4JmXE6lJVF1hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6961
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC.
>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c     |  12 +
>  drivers/staging/media/tegra-video/tegra20.c | 575 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 +
>  drivers/staging/media/tegra-video/video.c   |   2 +
>  4 files changed, 553 insertions(+), 38 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 2f9907a20db1..714ce52a793c 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -826,11 +826,23 @@ static void tegra_csi_remove(struct platform_device=
 *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
> =20
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +extern const struct tegra_csi_soc tegra20_csi_soc;
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +extern const struct tegra_csi_soc tegra30_csi_soc;
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  extern const struct tegra_csi_soc tegra210_csi_soc;
>  #endif
> =20
>  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_soc },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_soc },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_soc },
>  #endif
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index a06afe91d2de..e528ba280ae4 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -4,6 +4,9 @@
>   *
>   * Copyright (C) 2023 SKIDATA GmbH
>   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + *
> + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
>   */
> =20
>  /*
> @@ -12,12 +15,16 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
>  #include <linux/delay.h>
>  #include <linux/host1x.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
>  #include <linux/v4l2-mediabus.h>
> =20
> +#include "csi.h"
>  #include "vip.h"
>  #include "vi.h"
> =20
> @@ -42,6 +49,9 @@ enum {
>  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
>  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
> =20
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)	(0x0070 + (n) * 8)
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)	(0x0074 + (n) * 8)
> +
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
>  #define       VI_INPUT_BT656				BIT(25)
> @@ -87,6 +97,8 @@ enum {
>  #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_=
FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPU=
T_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER	(7 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER	(8 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> =20
>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
> @@ -151,8 +163,106 @@ enum {
>  #define TEGRA_VI_VI_RAISE				0x01ac
>  #define       VI_VI_RAISE_ON_EDGE			BIT(0)
> =20
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)		(0x01d8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)		(0x01dc + (n) * 8)
> +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)			(0x01e8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)			(0x01ec + (n) * 8)
> +
> +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL		0x0000
> +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL		0x0008
> +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)		(0x0010 + (n) * 0x2c)
> +#define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
> +#define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
> +#define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
> +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
> +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
> +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> +#define       CSI_PP_DATA_TYPE(n)			((n) << 8)
> +#define       CSI_PP_CRC_CHECK_ENABLE			BIT(7)
> +#define       CSI_PP_WORD_COUNT_HEADER			BIT(6)
> +#define       CSI_PP_DATA_IDENTIFIER_ENABLE		BIT(5)
> +#define       CSI_PP_PACKET_HEADER_SENT			BIT(4)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)		(0x001c + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)		(0x0020 + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)			(0x0024 + (n) * 0x2c)
> +#define       CSI_PP_FRAME_MIN_GAP(n)			(((n) & 0xffff) << 16)
> +#define       CSI_PP_LINE_MIN_GAP(n)			(((n) & 0xffff))
> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)		(0x0028 + (n) * 0x2c)
> +#define       CSI_PP_START_MARKER_FRAME_MAX(n)		(((n) & 0xf) << 12)
> +#define       CSI_PP_START_MARKER_FRAME_MIN(n)		(((n) & 0xf) << 8)
> +#define       CSI_PP_VSYNC_START_MARKER			BIT(4)
> +#define       CSI_PP_SINGLE_SHOT			BIT(2)
> +#define       CSI_PP_NOP				0
> +#define       CSI_PP_ENABLE				1
> +#define       CSI_PP_DISABLE				2
> +#define       CSI_PP_RST				3
> +#define TEGRA_CSI_PHY_CIL_COMMAND			0x0068
> +#define       CSI_A_PHY_CIL_NOP				0x0
> +#define       CSI_A_PHY_CIL_ENABLE			0x1
> +#define       CSI_A_PHY_CIL_DISABLE			0x2
> +#define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
> +#define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
> +#define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
> +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
> +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
> +#define TEGRA_CSI_CSI_CIL_STATUS			0x007c
> +#define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK	0x0080
> +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK		0x0084
> +#define TEGRA_CSI_CSI_READONLY_STATUS			0x0088
> +#define TEGRA_CSI_ESCAPE_MODE_COMMAND			0x008c
> +#define TEGRA_CSI_ESCAPE_MODE_DATA			0x0090
> +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)			(0x0094 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)			(0x0098 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG			0x00a4
> +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG			0x00a8
> +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG			0x00ac
> +#define       CSI_CIL_MIPI_CAL_STARTCAL			BIT(31)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_A		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_B		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)		(((n) & 0xf) << 26)
> +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)		(((n) & 0x3) << 24)
> +#define       CSI_CIL_MIPI_CAL_SEL_A			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_SEL_B			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)		(((n) & 0x1f) << 16)
> +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)		(((n) & 0x1f) << 8)
> +#define       CSI_CIL_MIPI_CAL_TERMOS(n)		(((n) & 0x1f))
> +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS			0x00b0
> +#define TEGRA_CSI_CLKEN_OVERRIDE			0x00b4
> +#define TEGRA_CSI_DEBUG_CONTROL				0x00b8
> +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED	BIT(0)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0		BIT(4)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1		BIT(5)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2		BIT(6)
> +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)	((v) << (8 + 8 * (n)))
> +#define TEGRA_CSI_DEBUG_COUNTER(n)			(0x00bc + (n) * 4)
> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)	(0x00c8 + (n) * 4)
> +#define       CSI_PP_EXP_FRAME_HEIGHT(n)		(((n) & 0x1fff) << 16)
> +#define       CSI_PP_MAX_CLOCKS(n)			(((n) & 0xfff) << 4)
> +#define       CSI_PP_LINE_TIMEOUT_ENABLE		BIT(0)
> +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG			0x00d0
> +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG0			0x00d4
> +#define       CSI_PAD_DRIV_DN_REF(n)			(((n) & 0x7) << 16)
> +#define       CSI_PAD_DRIV_UP_REF(n)			(((n) & 0x7) << 8)
> +#define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
> +#define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
> +#define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
> +
>  /* ---------------------------------------------------------------------=
-----
> - * VI
> + * Read and Write helpers
>   */
> =20
>  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int=
 addr, u32 val)
> @@ -160,6 +270,25 @@ static void tegra20_vi_write(struct tegra_vi_channel=
 *chan, unsigned int addr, u
>  	writel(val, chan->vi->iomem + addr);
>  }
> =20
> +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *chan,=
 unsigned int addr)
> +{
> +	return readl(chan->vi->iomem + addr);
> +}
> +
> +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsign=
ed int addr, u32 val)
> +{
> +	writel(val, csi_chan->csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *csi=
_chan, unsigned int addr)
> +{
> +	return readl(csi_chan->csi->iomem + addr);
> +}
> +
> +/* ---------------------------------------------------------------------=
-----
> + * VI
> + */
> +
>  /*
>   * Get the main input format (YUV/RGB...) and the YUV variant as values =
to
>   * be written into registers for the current VI input mbus code.
> @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, b=
ool on)
>  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *c=
han)
>  {
>  	struct tegra_vi *vi =3D chan->vi;
> -	struct host1x_syncpt *out_sp;
> +	struct host1x_syncpt *out_sp, *fs_sp;
> =20
>  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANA=
GED);
>  	if (!out_sp)
> -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n"=
);
> +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request mw ack syncp=
oint\n");

Existing issue, but dev_err_probe doesn't print anything when the error is =
-ENOMEM, since "there is already enough output". But that's not necessarily=
 the case with failing syncpoint allocation. Maybe we should be using a dif=
ferent error code like EBUSY?

> =20
>  	chan->mw_ack_sp[0] =3D out_sp;
> =20
> +	fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAG=
ED);
> +	if (!fs_sp)
> +		return dev_err_probe(vi->dev, -ENOMEM, "failed to request frame start =
syncpoint\n");
> +
> +	chan->frame_start_sp[0] =3D fs_sp;
> +
>  	return 0;
>  }
> =20
>  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *=
chan)
>  {
>  	host1x_syncpt_put(chan->mw_ack_sp[0]);
> +	host1x_syncpt_put(chan->frame_start_sp[0]);
>  }
> =20
>  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int =
bpp)
> @@ -418,30 +554,60 @@ static void tegra20_channel_vi_buffer_setup(struct =
tegra_vi_channel *chan,
>  static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
>  					 struct tegra_channel_buffer *buf)
>  {
> +	struct v4l2_subdev *csi_subdev =3D NULL;
> +	struct tegra_csi_channel *csi_chan =3D NULL;
> +	u32 port;
>  	int err;
> =20
> -	chan->next_out_sp_idx++;
> +	csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> +	if (csi_subdev) {
> +		/* CSI subdevs are named after nodes, channel@0 or channel@1 */
> +		if (!strncmp(csi_subdev->name, "channel", 7)) {
> +			csi_chan =3D to_csi_chan(csi_subdev);
> +			port =3D csi_chan->csi_port_nums[0] & 1;
> +		}
> +	}

tegra_channel_get_remote_csi_subdev sounds like it should only return non-N=
ULL if it's a CSI subdev. I'd move this check into that function.

Checking by name doesn't seem right -- v4l2_subdev has an 'ops' pointer, co=
uld we compare that to tegra_csi_ops to check if it's a CSI subdev?

Finally, is it possible to move this logic to some initialization logic for=
 the 'chan' instead of each frame?

> =20
>  	tegra20_channel_vi_buffer_setup(chan, buf);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_E=
NABLE);
> +	if (csi_chan) {
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> +
> +		chan->next_fs_sp_idx++;
> +		err =3D host1x_syncpt_wait(chan->frame_start_sp[0], chan->next_fs_sp_i=
dx,
> +					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +		if (err) {
> +			host1x_syncpt_incr(chan->frame_start_sp[0]);

This is technically a race condition -- the HW could increment the syncpoin=
t between the wait timing out and the call to _incr. The driver should ensu=
re the HW won't increment the syncpoint before checking the value one more =
time and then making conclusions about the syncpoint's value. I also don't =
think it's necessary to call _incr here, you can pass chan->next_fs_sp_idx =
+ 1 to syncpt_wait, and then only on success increment chan->next_fs_sp_idx=
.

Also, I'd rename this to next_fs_sp_value. 'idx' to me sounds like there ar=
e multiple syncpoints that are used e.g. in succession.

(I know these are in line with the existing out_sp code, but it'd be great =
if we can fix these issues.)

> +			if (err !=3D -ERESTARTSYS)
> +				dev_err_ratelimited(&chan->video.dev,
> +						    "frame start syncpt timeout: %d\n", err);
> +		}
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_DISABLE);
> +	} else {
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_=
ENABLE);
> +	}
> =20
> -	/* Wait for syncpt counter to reach frame start event threshold */
> +	chan->next_out_sp_idx++;
>  	err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
>  				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
>  	if (err) {
>  		host1x_syncpt_incr(chan->mw_ack_sp[0]);
> -		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\=
n", err);
> -		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> -		return err;
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", =
err);
>  	}
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> -			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> +	if (!csi_chan)
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> +				 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> =20
>  	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> =20
> -	return 0;
> +	return err;
>  }
> =20
>  static int tegra20_chan_capture_kthread_start(void *data)
> @@ -502,28 +668,6 @@ static void tegra20_camera_capture_setup(struct tegr=
a_vi_channel *chan)
>  	int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
>  			      data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  			      OUT_2 : OUT_1;
> -	int main_output_format;
> -	int yuv_output_format;
> -
> -	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_fo=
rmat);
> -
> -	/*
> -	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> -	 * for luminance, which is the default and means not to touch
> -	 * anything.
> -	 */
> -	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> -			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> -			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> -
> -	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> -
> -	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> -			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> -			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> -			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
> -			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
> =20
>  	/* Set up frame size */
>  	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> @@ -548,24 +692,148 @@ static void tegra20_camera_capture_setup(struct te=
gra_vi_channel *chan)
>  	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
>  }
> =20
> +static int tegra20_csi_pad_calibration(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	struct tegra_csi *csi =3D csi_chan->csi;
> +	void __iomem *cil_status_reg =3D csi_chan->csi->iomem + TEGRA_CSI_CSI_C=
IL_STATUS;
> +	unsigned int port =3D csi_chan->csi_port_nums[0] & 1;
> +	u32 value, pp, cil;
> +	int ret;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> +			  CSI_CIL_MIPI_CAL_HSPDOS(4) |
> +			  CSI_CIL_MIPI_CAL_HSPUOS(3) |
> +			  CSI_CIL_MIPI_CAL_TERMOS(0));
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_MIPIBIAS_PAD_CONFIG0,
> +			  CSI_PAD_DRIV_DN_REF(5) |
> +			  CSI_PAD_DRIV_UP_REF(7) |
> +			  CSI_PAD_TERM_REF(0));
> +
> +	/* CSI B */
> +	value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_B || csi_chan->numlanes =3D=3D 4)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> +
> +	/* CSI A */
> +	value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> +		CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +		CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +		CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_A)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> +
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration timeout!\n");
> +		goto exit;
> +	}
> +
> +	/* clear status */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration status timeout!\n");
> +		goto exit;
> +	}
> +
> +	pp =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
> +	cil =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> +	if (pp | cil) {
> +		dev_warn(csi->dev, "Calibration status not been cleared!\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, pp);
> +
> +	/* un-select to avoid interference with DSI */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> +			  CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			  CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			  CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> +			  CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +			  CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +			  CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			  CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			  CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	return ret;
> +}
> +
>  static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
>  {
>  	struct tegra_vi_channel *chan =3D vb2_get_drv_priv(vq);
>  	struct media_pipeline *pipe =3D &chan->video.pipe;
> +	struct v4l2_subdev *csi_subdev, *src_subdev;
> +	struct tegra_csi_channel *csi_chan =3D NULL;
>  	int err;
> =20
> +	csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> +	if (csi_subdev) {
> +		if (!strncmp(csi_subdev->name, "channel", 7))
> +			csi_chan =3D to_csi_chan(csi_subdev);
> +	}
> +
> +	chan->next_fs_sp_idx =3D host1x_syncpt_read(chan->frame_start_sp[0]);
>  	chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> =20
>  	err =3D video_device_pipeline_start(&chan->video, pipe);
>  	if (err)
>  		goto error_pipeline_start;
> =20
> -	tegra20_camera_capture_setup(chan);
> +	/*
> +	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> +	 * for luminance, which is the default and means not to touch
> +	 * anything.
> +	 */
> +	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> +			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> +			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> +
> +	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> +	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> =20
>  	err =3D tegra_channel_set_stream(chan, true);
>  	if (err)
>  		goto error_set_stream;
> =20
> +	tegra20_camera_capture_setup(chan);
> +
> +	if (csi_chan) {
> +		/*
> +		 * TRM has incorrectly documented to wait for done status from
> +		 * calibration logic after CSI interface power on.
> +		 * As per the design, calibration results are latched and applied
> +		 * to the pads only when the link is in LP11 state which will happen
> +		 * during the sensor stream-on.
> +		 * CSI subdev stream-on triggers start of MIPI pads calibration.
> +		 * Wait for calibration to finish here after sensor subdev stream-on.
> +		 */
> +		src_subdev =3D tegra_channel_get_remote_source_subdev(chan);
> +		if (!src_subdev->s_stream_enabled) {
> +			err =3D v4l2_subdev_call(src_subdev, video, s_stream, true);
> +			if (err < 0 && err !=3D -ENOIOCTLCMD)
> +				goto error_set_stream;
> +		}
> +
> +		tegra20_csi_pad_calibration(csi_chan);
> +	}
> +
>  	chan->sequence =3D 0;
> =20
>  	chan->kthread_start_capture =3D kthread_run(tegra20_chan_capture_kthrea=
d_start,
> @@ -592,12 +860,17 @@ static int tegra20_vi_start_streaming(struct vb2_qu=
eue *vq, u32 count)
>  static void tegra20_vi_stop_streaming(struct vb2_queue *vq)
>  {
>  	struct tegra_vi_channel *chan =3D vb2_get_drv_priv(vq);
> +	struct v4l2_subdev *src_subdev;
> =20
>  	if (chan->kthread_start_capture) {
>  		kthread_stop(chan->kthread_start_capture);
>  		chan->kthread_start_capture =3D NULL;
>  	}
> =20
> +	src_subdev =3D tegra_channel_get_remote_source_subdev(chan);
> +	if (src_subdev->s_stream_enabled)
> +		v4l2_subdev_call(src_subdev, video, s_stream, false);
> +
>  	tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
>  	tegra_channel_set_stream(chan, false);
>  	video_device_pipeline_stop(&chan->video);
> @@ -652,11 +925,231 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.default_video_format =3D &tegra20_video_formats[0],
>  	.ops =3D &tegra20_vi_ops,
>  	.hw_revision =3D 1,
> -	.vi_max_channels =3D 1, /* parallel input (VIP) */
> +	.vi_max_channels =3D 4, /* parallel input (VIP), CSIA, CSIB, HOST */
>  	.vi_max_clk_hz =3D 450000000,
>  	.has_h_v_flip =3D true,
>  };
> =20
> +/* ---------------------------------------------------------------------=
-----
> + * CSI
> + */
> +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan=
)
> +{
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK, =
0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> +}
> +
> +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *cs=
i_chan,
> +					    u8 portno)
> +{
> +	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&csi_chan=
->subdev);
> +	int width  =3D vi_chan->format.width;
> +	int height =3D vi_chan->format.height;
> +	u32 data_type =3D vi_chan->fmtinfo->img_dt;
> +	u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> +	int output_channel =3D OUT_1;
> +
> +	unsigned int main_output_format, yuv_output_format;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> +
> +	switch (data_type) {
> +	case TEGRA_IMAGE_DT_RAW8:
> +	case TEGRA_IMAGE_DT_RAW10:
> +		output_channel =3D OUT_2;
> +		if (port =3D=3D PORT_A)
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER;
> +		else
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER;
> +		break;
> +	}
> +
> +	tegra20_csi_capture_clean(csi_chan);
> +
> +	/* CSI port cleanup */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /*=
 CSI_PP_YUV422 */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width << 16);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height << 16)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0x1)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), wo=
rd_count);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> +			  CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks between frames */
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
,
> +			  CSI_PP_EXP_FRAME_HEIGHT(height) |
> +			  CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clks for timeout */
> +			  CSI_PP_LINE_TIMEOUT_ENABLE);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port),
> +			  CSI_PP_OUTPUT_FORMAT_PIXEL |
> +			  CSI_PP_DATA_TYPE(data_type) |
> +			  CSI_PP_CRC_CHECK_ENABLE |
> +			  CSI_PP_WORD_COUNT_HEADER |
> +			  CSI_PP_DATA_IDENTIFIER_ENABLE |
> +			  CSI_PP_PACKET_HEADER_SENT |
> +			  port);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
> +			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> +			  (csi_chan->numlanes - 1));
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> +			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> +			  0x5); /* Clock settle time */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port)=
,
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->frame_start_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_D=
ISABLE :
> +		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			 yuv_output_format | main_output_format);
> +
> +	return 0;
> +};
> +
> +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *cs=
i_chan, u8 portno)
> +{
> +	struct tegra_csi *csi =3D csi_chan->csi;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS)=
;
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, value);
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	if (csi_chan->numlanes =3D=3D 4) {
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
> +	} else {
> +		value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_NOP :
> +			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +	}
> +}
> +
> +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int ret, i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++) {
> +		ret =3D tegra20_csi_port_start_streaming(csi_chan, portnos[i]);
> +		if (ret)
> +			goto stream_start_fail;
> +	}
> +
> +	return 0;
> +
> +stream_start_fail:
> +	for (i =3D i - 1; i >=3D 0; i--)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +
> +	return ret;
> +}
> +
> +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +}
> +
> +/* Tegra20 CSI operations */
> +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> +	.csi_start_streaming =3D tegra20_csi_start_streaming,
> +	.csi_stop_streaming =3D tegra20_csi_stop_streaming,
> +};
> +
> +static const char * const tegra20_csi_clks[] =3D {
> +	"csi",
> +};
> +
> +/* Tegra20 CSI SoC data */
> +const struct tegra_csi_soc tegra20_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra20_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> +	.has_mipi_calibration =3D false,
> +};
> +
> +static const char * const tegra30_csi_clks[] =3D {
> +	"csi",
> +	"csia_pad",
> +	"csib_pad",
> +};
> +
> +/* Tegra30 CSI SoC data */
> +const struct tegra_csi_soc tegra30_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra30_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> +	.has_mipi_calibration =3D false,
> +};
> +
>  /* ---------------------------------------------------------------------=
-----
>   * VIP
>   */
> @@ -677,10 +1170,11 @@ static int tegra20_vip_start_streaming(struct tegr=
a_vip_channel *vip_chan)
>  			      data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  			      OUT_2 : OUT_1;
> =20
> -	unsigned int main_input_format;
> -	unsigned int yuv_input_format;
> +	unsigned int main_input_format, yuv_input_format;
> +	unsigned int main_output_format, yuv_output_format;
> =20
>  	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_fo=
rmat);
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> =20
> @@ -713,6 +1207,11 @@ static int tegra20_vip_start_streaming(struct tegra=
_vip_channel *vip_chan)
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_ST=
OP_CAPTURE);
> =20
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			  yuv_output_format | main_output_format);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index cac0c0d0e225..c02517c9e09b 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -127,6 +127,7 @@ struct tegra_vi {
>   *		frame through host1x syncpoint counters (On Tegra20 used for the
>   *              OUT_1 syncpt)
>   * @sp_incr_lock: protects cpu syncpoint increment.
> + * @next_fs_sp_idx: next expected value for frame_start_sp[0] (Tegra20)
>   * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 (T=
egra20)
>   *
>   * @kthread_start_capture: kthread to start capture of single frame when
> @@ -191,6 +192,7 @@ struct tegra_vi_channel {
>  	/* protects the cpu syncpoint increment */
>  	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
>  	u32 next_out_sp_idx;
> +	u32 next_fs_sp_idx;
> =20
>  	struct task_struct *kthread_start_capture;
>  	wait_queue_head_t start_wait;
> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/=
media/tegra-video/video.c
> index a25885f93cd7..8fa660431eb0 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -124,10 +124,12 @@ static int host1x_video_remove(struct host1x_device=
 *dev)
> =20
>  static const struct of_device_id host1x_video_subdevs[] =3D {
>  #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", },
>  	{ .compatible =3D "nvidia,tegra20-vip", },
>  	{ .compatible =3D "nvidia,tegra20-vi", },
>  #endif
>  #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", },
>  	{ .compatible =3D "nvidia,tegra30-vip", },
>  	{ .compatible =3D "nvidia,tegra30-vi", },
>  #endif
>=20




