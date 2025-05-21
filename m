Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A6ABEC1E
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAD110E63A;
	Wed, 21 May 2025 06:45:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pHLOyYlY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE39810E63C;
 Wed, 21 May 2025 06:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vunr3ZQKSumJy4XX1AqpDm2CCi+6czmZvYnXjoWwGGxKP0FmigE+TPUXV14w/DjodDAW7Hb1vg3ITMW1MYshCK+DyLPokXUs2ZOHx5oFNhyD3m5QemWlIBAA3mfj9KgJne6Du2V4XFbW4/Rx3ti0OMILalFPsbVkBZWVQuRz4q85d737AnibmfYlaHABDEAfSw0HmBZQvM5QzsKrlVJBIbjdmwphASCFP2aLosezysNr3+S/htq2V7EaawufNYgKmAbUDdQ/31yd9BFU6uEMQvin/xsJw0uIhE05YVD6SaWJNAuVBjjhOBeYi2loTgkWVwsRFzBaniY2eJ2MAXAIXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdplzD1GZu3yzk2SMr8IYSIj+W92xB+mAKQRw6bnNow=;
 b=SOYdBfVt6Or1D7AMSyEmnyCWsvvoWkk1pnBjS3hD/1SWkea4a6T14oPadyboU+bcmslzBdScQjMzAQsto9dm3QpwoFTia0HvfqGDI581QmELUErRe1qwtBJ2fU5BrgEkUUd0PQ7AP9dS69SVwTVeRQroDQ0EB82ktQAoQLgBUqKhikIZxAuSk/zUVRNs6aMlzqAZDdwFur9ganGGKh9QeTnfLlfS8jba+2ugLlY8HEKPhiGv/M0CGhApvBkOzrJM+8IiNtMcDufgfCn74fqdRGic4qxyMLNGQ+G+SQNmfqSiCgzDd7ytz8bdPLwpMXZhIKUfqRxTra4WD3fUkp+RuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdplzD1GZu3yzk2SMr8IYSIj+W92xB+mAKQRw6bnNow=;
 b=pHLOyYlY0iwCerqytR3j/TsOouMNzS4cOPRc1YLci8A/q/oP34xPh+ouzL92JWVWhRr8un66/KRqctuL36fnVfklHqLw6mMqf5Q6ZW0Qcrq0a52ncBccavJRySgO/wIyS2LXNvI49HkkXE1EEcConFac9lBhmJ9DoJGVXVdrZRwVW2bYf5l2Jy/7z1Fa9vDmqEQbqnxuFyPw39VJNMlbPRkkCUEtTg+BlJkzi0pnXpJi9O6y2Z4VxVnEqFV2qT7ZLXMlpoiXPhS13ZjrThq61NVUOKGaMvP0SCdlLNnJC1XKGcPubeHr0EIoq6MA2GYKqOD187/agFjAMNHjeUVqJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:44:58 +0900
Subject: [PATCH v4 03/20] rust: sizes: add constants up to SZ_2G
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-3-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: 2838ecae-37ce-41ec-521a-08dd98330a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djJzKy8xKy8wUWhGaVAwVERsUjlVL0ZkelBxRjZGaGRGRlg0eEtYNzFxdnhx?=
 =?utf-8?B?dTZUcGFCbE1YRFF0aEhTcUFJU2RkYUxQUVFzTHBxdlhNSGw2dzRjck5DcitC?=
 =?utf-8?B?a3VYNUpFeEF2K2JwMkI1b0VpSXl0S1ArVzRYUTRqTEpGdlJNalV6M0Frd3J4?=
 =?utf-8?B?QnUzTlRrVnEwaUdZR0hkQUwyTWtOSjZ6anEyNkEvTjNPREhOOXlDcWxQMGx3?=
 =?utf-8?B?V3MwZ2gwR2NZdXVOcWdtS2U0NWY0VGFiK1VReWtQWXhYRVpXZjZLVVZOMXNF?=
 =?utf-8?B?aGdWMUVzM1NsQTlFZmFhcTF3MGRqbm5DZjdJUUJSVWh3TysrQStvZ1Nud3px?=
 =?utf-8?B?YzlBOW5kanFnZkpheFFrbnh5WEJxc09PTlhwTUxlZlRqN3NrbWVQUnE4OGtp?=
 =?utf-8?B?djVNbnlyYVcyUHc2UnI2OHVYbTY4YkxTYTZxNUZXbGpScUFZQUpLVjNOeEhH?=
 =?utf-8?B?RFRqR0h3MUJ2Tm9ZOExpYWZ2Y2JVRVh3TDB3b1Q1WjIzR3d4ODBBQ2tHMXhN?=
 =?utf-8?B?a2RKSUVqcWlzNWJ2UysvWFRBWGxaN3JUYlBiaTAvN2lDNm1zaFJodmhxcEdV?=
 =?utf-8?B?UDdGbnNLQm9LUGtISE45K3d0dFhnSzNSdnFDZzNTTGp0U1c4UmVQamlPVFNY?=
 =?utf-8?B?b04vNC81TDVHUVRjTkVkenA4dC8rSDRML21jbXlLL3A5clNJdGNmUkV6TjVm?=
 =?utf-8?B?UWU0TTE5eTJNUG9nbWdOMDN3ejdoQXdjbnJCbXNtV2puRTl6OFh0ZG1ja2pB?=
 =?utf-8?B?anhQUUY0VUtsZGNFc2FSenpvR2hkQWdRY2ZFdzc1YVdLalpsaERnV1RDTEN2?=
 =?utf-8?B?cGVGUy82dGM3ZjhRallmSGNjcE5ia25RcmREMnRYYTh0WDRFNDVFcGttZjBF?=
 =?utf-8?B?WjQvcGxmRDM3TlMvVzhiWkZITUxKemV2V0c4NWJiK0NTL2tTaTFYSUFRQkRH?=
 =?utf-8?B?ZUZCTmwzQVhVd2Y0Zm5DNDE4NzhCU1FnaUpDek81MTlrMUJQWUZGYS9iUHNp?=
 =?utf-8?B?RGdmYXF3Z3IyZjhJOTF6MThDUFFNWFZQek12bkcyM0MyY2xtaE15NklrTEtP?=
 =?utf-8?B?MFh2UUlaT2lWdUQ4dzVxckhrb1lqVkFGUFFydXBRd1BnSTFuUHNLNDlpS0Fi?=
 =?utf-8?B?UkhLTmh1YnovRjNKNWJhK1RLc29jckJ0SFhTK1VuamhEQlFtamk2bEFsenpI?=
 =?utf-8?B?MGwzKzl0RzRWd3g3dWlQam1CZXEwa0dhSExyemZ0aVVaQy9YL0N6ZmxvUkhp?=
 =?utf-8?B?aDFFaGh1TWZoN0t5bkg1NllmbS9ZTGRWN1FPeU50b3MyRkhhY1B3eUlrWTFt?=
 =?utf-8?B?RTd1WlQwczRxN3R0VFNucVlxMi9JUmo5UC9MMHdjTVNjUzQ1eXRXMGc3MVJK?=
 =?utf-8?B?L2Z2Z21LZmtHT08wb01JQU9SUE5Cd0liY3hYbFAwV0srNDBWai85ODBaak9w?=
 =?utf-8?B?QUpvU2N0dTYrY3ZhWE00eWtXRGI5RWtoQjE3bzJJaE01clZ4NysyNVRVMmMy?=
 =?utf-8?B?MGRCai9IZ25WYVhlYkgvV0JjbmdHR2lDcUlKYkY2WVlZRVlCaW5lcGhYeUE4?=
 =?utf-8?B?cmVVdVZJTkpzSmtvZ2cyR2VYRFBIVUxUOFpOMlpSZ2VRSlkyRzVWTFc1RmVQ?=
 =?utf-8?B?cm5pWHBkRERDaXByTzlOdWtYUVY0VlhUMlU5eVVLTnc2Rjk4WGxhRkwxWk9N?=
 =?utf-8?B?aG9DMjRCdm41QnB3MFN2U1hEbVJpM01vSk5lS21UamlqeWR0dGJHNnh1ck1p?=
 =?utf-8?B?MzZEUkVwcnRhNkY3cEVzKzByZjZibXJoWlpnbnZucDdNaWphUzhsTzBxSlY3?=
 =?utf-8?B?cVRHMDdmbFl4OW45SzBndFlFUk84V2JoeFBvRzFqNVRYenBkUWxOdjE3YW93?=
 =?utf-8?B?aW4yNEFqRXp0Yi9VaDNiSmt2S1M4dlk5eVM1U0p1VUFBcVNwUHc0WDB3Y2dp?=
 =?utf-8?B?UlpUQTdZWC82MWxYazltR3VBNVh2T1E2SFNBMmlvb1YxSWhqb2xjbnFadlB2?=
 =?utf-8?B?SEl4a1B2V1NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGVpYUM4RnJPYjYwejh0bVJNM05SbGZ2K3BTTVJTUnZwbDVRSTNxWnZ3M1hC?=
 =?utf-8?B?WFRkS1N6M1p1eGtSK205VWZhQm96NjBlem9sejRzc1JiRlVyYVpobEFRZ0Ex?=
 =?utf-8?B?VDJrL3dwSG0zZUx4cWNFMXhBOU4vRU1aTFF3azh6WWlmcDd6aEMrNWcwQURO?=
 =?utf-8?B?cmNRdWp1TFR2b3l6R1FEeFU0eVVlNkl1WktrRmc3MG1FOGxVeWFYMHhWQzZo?=
 =?utf-8?B?bzh2Nm9zbzAzQm1FRlJ4SzVKRmRRb3RzMUpDbzZqcUt4RXZFVzBhN2hlWkE4?=
 =?utf-8?B?VW5QWnZZdHZWNWhDVVdCdXB0a0p2OFFmS0RYcHdXSzVjUXExZW9PNzRwcDR2?=
 =?utf-8?B?VUdiNkxoWXR6NTZFSUNaMUZPZWFnMjR0MTUzb05vRmtuYUNUdElvNTlLRS9P?=
 =?utf-8?B?dkFFcVhjNDBpV3V2b2NJZHNjTGpScjJJeEhQL0xsUlg1QWp2RDIveHVwK203?=
 =?utf-8?B?emFCY1NORk5PbEk5a1U4MmhHK21ETzFISFRmOEtFcXlka0lFNkdPaFFBUGNV?=
 =?utf-8?B?M0YxbW9TVVg5cEdmaTFsOEtvSTIwWmxMTk9NVkt0Q2NSQUxvMlNsK3NUNnVT?=
 =?utf-8?B?Zlg0OEQ1UGZ1UTZzdVk1ck4zaXFQUzV3UEdaaWUyUDB2eGZiYmdzRG9KRUQ3?=
 =?utf-8?B?cE5sTStveXNNdnB0RW5xZlBrZU5WL1pEejVTQnQ1NWxsNFBDb1VwY2JrcEwr?=
 =?utf-8?B?RXpRVVpUUmxJeG9ab1c2UENqbFg0eldhSzNuWGtIY3J3R1pFN3BmVTV5bWZN?=
 =?utf-8?B?QWVuRk5ORGwzbk16L1ViRjlVR3I2a1NaRnZjdDQyUXF6a2JJRTZ5MXVha2V2?=
 =?utf-8?B?ZGY2TDNuNlZjVjFKbFdidXZpR203QU5ScERlL3l1UkZSanllMEoyWVFrRlpI?=
 =?utf-8?B?MzRHejF4SE1hVld1MTZJYWloRllqQTRwa0MzdlhlaFYzV1Yyc010M1dlWW1N?=
 =?utf-8?B?Q0FsQ1o5b1RxcGVIckwvdHowbUFrWW1YSU8xNkQydUJkWjM3UjNRdW42MzFX?=
 =?utf-8?B?VHZqOTdSUFdFVGJlbGhSQlR0aWd0TnNYUUVlU0lXUkUxeU5FaElwTjdGbXYz?=
 =?utf-8?B?UGh4QmtXR3JJZjVrVXZFM1NnU2NGQkZ5VkkzT1k3bjJxWitjRHZJbGlwY0xJ?=
 =?utf-8?B?UHVJZW1QM0dyc0J6emhyd1FWem0wbUhMZFlHeVozUjcya0MrRWJDeS9YbEhD?=
 =?utf-8?B?WGJpMHVjb3k2cUJqdWxONFpac3dQVTRieWNJbEhqcnRETHNRSlVEWXlLSG9E?=
 =?utf-8?B?N3JXZUJOSytaSlJham5nd0hJRS9tdkRyMnJHUmp1eUJjV1JqQTlCWllZL2I5?=
 =?utf-8?B?ZkV3QXFxK2dlaW00amZqWlptcGhvSXM0YnZZQTlSa1hFaEpUbFNzUmZqcStG?=
 =?utf-8?B?UUJQNHV0amRZZUx2Q3c4OTB1eGZNTHBlWHJTTGFEZFNqcGljMmJvQWE4MThQ?=
 =?utf-8?B?TW9lb1lqSzg1ODM4NkhFeHNCeVl1NFRxd0dlWWM1dU1PdnlCVXlQMit1Sjd5?=
 =?utf-8?B?Q281bE83eWx1V2g3bE81bGlSVlF3dzBrUEdjNDM1TE5yMmhIbHIxdzlHbHA5?=
 =?utf-8?B?b252RVZWL25CYzU4ZVRVL2dOMC9xMGtNRnFNNXRwZUlMTCtQYm1wTDA3SHdN?=
 =?utf-8?B?TGZlVmhBUVJMRzBkRjRaY2U4c3Q1bnNRaDlYNGk0WHQ4aWxhcTJYenFWMENw?=
 =?utf-8?B?ZWtITUU3N29ta2Z5UkFveE0xSnhZdUV2Y1RIR2ZFMW1aV0VUMURPQ25KWUNW?=
 =?utf-8?B?eldzV0YrN2hadUpVL2dRZlM0T3RWU3MzbUUrdGtYSVVjeEowV0htL1k4SVJ2?=
 =?utf-8?B?WUZFbVF1eDVtcldYRks5WTNleXpaakd3SUVUL3paNWxSdHhGdVhtaSt6dmpp?=
 =?utf-8?B?ZlZ2bE9xbXd2NWE5Q0NEZXoxZjdsenZ1WUduYzNMcmltWEpVaEo5YkxrajND?=
 =?utf-8?B?S2RoRjVOWnB4ZWw1V3hmL1VpdlZOMW1senE3OXN3TzkyRWdZOFNUM2xNS0J4?=
 =?utf-8?B?alIvcVJiZUEwWHRlNW82TWgwS3RkN09STW1XNVR5dUY5b1RCaXh4RzJLclcr?=
 =?utf-8?B?NGFZSWl3bmRDV3ZIQzkzV3hEbWVENHlydk9LRFVlSkJYaDdBQjJ5YjZQdlFk?=
 =?utf-8?B?aVA4dnIvOEY5Zml0cGVGTUhtSkkxNDBhOTBwUUhFT0IxWjBNK1NFa1c1WFlD?=
 =?utf-8?Q?uwu7KoYuO9MQAlXFFJtqFB8SuY/fpKIe7r0fDi2cKz/I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2838ecae-37ce-41ec-521a-08dd98330a44
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:14.0789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRUGzAamEIt7o2llCTgYqPKlgsj9am7RvNvTQn8VRtAM9+c4gpmUsLelroYMVDS7QMbL3taQB032apO0OjB90w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

nova-core will need to use SZ_1M, so make the remaining constants
available.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/sizes.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
index 834c343e4170f507821b870e77afd08e2392911f..661e680d9330616478513a19fe2f87f9521516d7 100644
--- a/rust/kernel/sizes.rs
+++ b/rust/kernel/sizes.rs
@@ -24,3 +24,27 @@
 pub const SZ_256K: usize = bindings::SZ_256K as usize;
 /// 0x00080000
 pub const SZ_512K: usize = bindings::SZ_512K as usize;
+/// 0x00100000
+pub const SZ_1M: usize = bindings::SZ_1M as usize;
+/// 0x00200000
+pub const SZ_2M: usize = bindings::SZ_2M as usize;
+/// 0x00400000
+pub const SZ_4M: usize = bindings::SZ_4M as usize;
+/// 0x00800000
+pub const SZ_8M: usize = bindings::SZ_8M as usize;
+/// 0x01000000
+pub const SZ_16M: usize = bindings::SZ_16M as usize;
+/// 0x02000000
+pub const SZ_32M: usize = bindings::SZ_32M as usize;
+/// 0x04000000
+pub const SZ_64M: usize = bindings::SZ_64M as usize;
+/// 0x08000000
+pub const SZ_128M: usize = bindings::SZ_128M as usize;
+/// 0x10000000
+pub const SZ_256M: usize = bindings::SZ_256M as usize;
+/// 0x20000000
+pub const SZ_512M: usize = bindings::SZ_512M as usize;
+/// 0x40000000
+pub const SZ_1G: usize = bindings::SZ_1G as usize;
+/// 0x80000000
+pub const SZ_2G: usize = bindings::SZ_2G as usize;

-- 
2.49.0

