Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F5DB5616D
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932F910E204;
	Sat, 13 Sep 2025 14:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKstxUA/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C7110E200;
 Sat, 13 Sep 2025 14:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIl3sR1mMFF0sY7E2k0RIKrW8R1+4hNBDydNN8cUCqkBra9C5g3fCSx03L7Q6Z2EXqtwXN8wWiOe9PNLibs7eiTfZKw4lLjLuB/azpXP/DOTsA8ET5slrIQSSbAVbddcbwttIcv0g8shJESg+Y7KPh2oBOec58tdY3l8o8zhxB7TgRtkpqGVFhzczvLtrINKvPvHNxpyco9s7z5jO4xSRkFYNPpppd937j56d24UydIjqk1vuEN6fIbaAMJwdM/GFQ3HHi31REyYmIiUzxlagyWI6tXaYwQONrxtyjmNbWRgZ/6cWJGHrT4pJU1KNIVR+yYoGrqYrjGLq00Q8xHMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JH9dzZunDu/Tf8sdmNlmdV5nhek/FN4JjpnEWxGpPk=;
 b=b5MBjrhCNzczMGkX69w11OHktudQGCmG315srQV59eEZ1xH++a4y6VH28bA9NfegApVL6n7RXJCAPp2p24gKv5uVeTxHlNORhEGqg2UYFBE3UYuLAMXISmAiHLTUbIs0BLvx7i4cjyHvonBPR7oy6t0r7E+Y4RYcTcoP8HtQxJiXJSNstwpn1RpzKsw6FxyjysP/L/4w3USrmkCKg/WNd4920ehEmyt+IGyJkdup8J/U4L1ukmF8xP4rOykP2NLTKxcE7wkNpAPJYWDr9oAPcEq+n1zOavox2uXqVJjrOPibV/5Y/2+WCGUJXop/mV4snbzTW+2CD85mM2w49STZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JH9dzZunDu/Tf8sdmNlmdV5nhek/FN4JjpnEWxGpPk=;
 b=jKstxUA/a6jQ91i5nOIbXUR8WzEB6MZX2n7leGjoUprRXAGx+8FEtew1nESRWPF0YwCpFzA02thy/hM+FmchliTOeJA4qfT1IAB1tVIqLGx9MqDP/Zz3hHxUayRne9Ffidl/RQTaGnzVMDFdizHjNgWmyldmwkszvNgvTxq+6JWscro+EwiNUYF/LpMyO0d/Bq/Lbrifj8Hg5mVfp0yyMokYBmW2QV9ckxH9zCRJc1Fdavb4t9Vwa3KiemJ8nleS9FoOeszZ0sRo+XXcR5msPjD8chanLwez0JGBdG2vWW3PYaAE+AQ538n2mtILNodacuOVn2VFT0RmNmbA2fm1hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:20 +0900
Subject: [PATCH v6 07/11] gpu: nova-core: firmware: process and prepare the
 GSP firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-7-9007079548b0@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0051.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 09633c54-9c88-400f-3403-08ddf2cf9c96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnRGczU5MjRNNjdKMFZ0bmorcmF4K1Y0S2lYTUdTS2lLd0pRWDRUUnJuMWs3?=
 =?utf-8?B?cTVNZCtNWSt2NExpSERYMC9BMzRvamg1QTk4dHo2TzBKV2VpWlJhQ1FNdU5J?=
 =?utf-8?B?ZThudHVtZksweHIxd2lhWXc1MzFIWlFRN1ZxMHVraHdISlJ4alk5Tk1MbnAr?=
 =?utf-8?B?TTd2Ym5DQ1gzcWl4cm5wdXViZTJXQUFwdTZINDJ1SDlTOXh0bUVxdUh6ZmFB?=
 =?utf-8?B?SDdqV0oxbVRtSjFvK0UrUXYvUmV2NE1RUFdWRFE4UE5GWk8vVXVMNXZtY1lE?=
 =?utf-8?B?c1J3bWovdFhaWXRMUlRCM3R6OEMvQjRYWVA5YXVlNThYd2xrcnBoYm5qejJn?=
 =?utf-8?B?UE4zYmlmdHF4UmI3a0wybGYwdldERWtiQWZOZkV4TU9MaCtXNDJKai9Zdzli?=
 =?utf-8?B?cE9ESUUvRXBPSzBSdERKbXQ3Qm42RTl3U2h5UDdISlVoNFZmL3NSWTM2Ty9o?=
 =?utf-8?B?bWdyZXF5YVJzZURBc2ZTZE85L1M0R3hkWHpLMEUzQWhtakM5Ujc0UmIrWTd2?=
 =?utf-8?B?TUovQVhnd2hiZnlMa3BnalV4cGJaazNISGJRbkVMTC9hdGhaSkFrd2JKaUR4?=
 =?utf-8?B?YW83T00wTlNqUmtEaFRJNnFWQ2NKdEtVTldtOU5nNU9jcXJ4NmlDbmJqVXh5?=
 =?utf-8?B?N2pSMEhEN2RHa1hjODZxcHI3VndHS3I3dlNSRjdUNDE5L3VSY0J5K0RZRFFU?=
 =?utf-8?B?cThQSW52V2FpUW5pVHZZdWVKV1ZGVlVPcEs3cE5mRlQyZEF6VGVnOHJwd1Vv?=
 =?utf-8?B?MGhXcStlYnA2S3ExK3k2NXd6TTdGZ29MVnlOYkt6MnZjRm1RMHdNR21sLy9x?=
 =?utf-8?B?N1I5V3pCb2Jlc0hpdmFXYS9CbGxabjFwQWZwazUzM1drSzNFZ202ckxKMVpE?=
 =?utf-8?B?RGw4ZFpMSzhTRkF0bkFOYmhzdTdDYVpJaCtXN1FyYmhWZCtQbVgycTJpSXc4?=
 =?utf-8?B?UDF5SE84dmdlaTlaYi8xcnAxak1sdGlkR2o3WUJiVzVFT3ZkUFR0VTNxT3Jm?=
 =?utf-8?B?Q296NUJHUzR1c0JCbGsrQzRraDlzOEJpZHdTOTFVT1cvYlAyaktKOUhGRHRW?=
 =?utf-8?B?THBTSUkyUnhiZXVDN2Jnb1djQ0JBSXFGQnlYdE8vMnRlNmFDUFVscEhmKzNB?=
 =?utf-8?B?VENsK1daMEdCUFpSemZmSTdHSFpyR0NVc0xHQ3B3SWI1UkxXNVdxbjh5aVZy?=
 =?utf-8?B?ZTJmczBtSWdUUlpFR0pCSnJjSWlQWmoxZWlteGlUK3hBU3M4N01iWWFMR1o0?=
 =?utf-8?B?ZklXa0lrM1MwQW4zRGhiSHN1RXN0S0NJR1BBSHBTK2x4eU1seEFyQnB3WFd0?=
 =?utf-8?B?T1JqNi95OHdpbTE1di9JUnRwclpXR05LaEp6d1puL25NWWFqTk5NTm05a01t?=
 =?utf-8?B?K0tTaVZFRDVZNnZzYjduYzlFQmtqUERiRHp5OEdzZTN5R2hMMjM5dUd1RUhX?=
 =?utf-8?B?OWdWem1CU0dJRDM0cXp2SXlJZmFCOVl4dXNrSEwrRGxSWCtqSzRIOG5SRWRH?=
 =?utf-8?B?b0x6RVZwU0N4eEZ3VG9pZGhNYWtHc1NmM0lENHFyT1E3RjNZdExVeGdEdDlu?=
 =?utf-8?B?ejVQVFlsb0hsMHNvaXRUeVdpZ2ZDbnRhV28xMUpPK0xhbDJKSWpwZm1FQzdL?=
 =?utf-8?B?ZGVZM0JmaXZPN0VzQXg5aUk2MHhyOFpwMnQ4TFU4Z0x1QU5pS053Sm01UjJZ?=
 =?utf-8?B?S1cwWkRLbHRwV3gweU1DNXo2bzdpZEZrNU13c2hWaXlMVWRORk9Od0w1OVdu?=
 =?utf-8?B?NkdYaGNnUGVvbFVSdDFqcnFEc0FlQTdCTkZuMytnS1Fsdm9XNW1ob2toWEYx?=
 =?utf-8?B?ZFBiWVdXVzhtK1F0a0xlbGtLZ2NVTTJ6UHpxbmZYQituejQwMzgyU1hyVmFP?=
 =?utf-8?B?V2IrekFOcjBmT2FQZVR1VEdabkdhU3dTT2NSNkQyS0FxM01lRW04V01qVnhX?=
 =?utf-8?B?UUw3VVBRQ1lMTkhPSlNTcnFYVmUrWFlNY2RWQ3VFMkJwSXBYY2dFdVhNNTJ6?=
 =?utf-8?B?VEtHVHJHTlRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWF0T1JBbWZ4R3dPYjlEeUZIcUxlQWpGek5KUHYzb1l4ajJjNWN0RndWTlcw?=
 =?utf-8?B?OHh1OGNDWDF6aVprc1dRbFBWQnVWUzJzY0NjSWMrSE5kbmVldUZmbTdQMSt2?=
 =?utf-8?B?Uk0xY0RySWh2endxZ3FDZm9OM2thaXJtdjJiOGpMZ3ZiS0NOUjJLLzJRWFpR?=
 =?utf-8?B?ZVZHV0pkeDBJWjJXWnA5QTdRZ094RmlPcW5XR2pKd2ZZeWdkeGZQVzlIc0Nq?=
 =?utf-8?B?LzMvb1I5NlYxNVhHemxzcWowNDd3VXpaYUJKZWROMHRZMTBGR2xSQjg4Q2Vt?=
 =?utf-8?B?cnI5TXBxVU96K3VZS3U3eXdsYXIyWXQzak94MUhLRlJKbDFKMHNrNlJXWmZP?=
 =?utf-8?B?K2pVbWZNNjgwMGllQmovVGkvRVNkRTNZRWJYbHNmVWxxMXExdzRtMWZLeTVN?=
 =?utf-8?B?MDNKbitBRVRubit6aEVSUGR5N0EwZG82UnIwVXlYOHU3S2h3czJJYnNmdzBW?=
 =?utf-8?B?Z0dGQU5TQjM0ais2NzBLUHhtNHIzZDd6TGRJR09rTFc3Njlka2wzUUVjbkxj?=
 =?utf-8?B?YjV1eCtVQnYybzU5OW55dFNtcjJFSlhuZTNzODFnT2VVYUtkWE8xZUZoUWZW?=
 =?utf-8?B?WEtJTGJFQW1LMUNUR0RUZkR1bEs2WktjUWxsNGl1Vk4yek9xSjlndGsrK21Y?=
 =?utf-8?B?dHBRTlA2Mk5oVnVWT0FFK0czKzZYaDU3UW9rQ1FuNUd1YVlYemk5eHJ3elVN?=
 =?utf-8?B?Y2RHV0Q2TDBDeDY3d2hFOW96bGRpdkVqbzl3aDdEQ0I0bWYvbzNDQXVPdTR5?=
 =?utf-8?B?N2dOaFY0YnJlbDFuZFo1QkpYaEx4NklxcUtWZHVzZXlnN1AzS2dRcEVPdnha?=
 =?utf-8?B?ZGVzQ1JMN3lQWnRvUTV1WElRc1p6ZWZHd0xZVUFlSnIrdW5PT0VhWDRCVjRV?=
 =?utf-8?B?Mk1lWTJKeDdMZ0VtZUdONGk2R1IxSW9Ed2RPd1J5NDhVUUltTDhGOThVSHM2?=
 =?utf-8?B?R1BFdkdDNjZ2SmdKcHIwVk1Ibi9IbCtyQ0c5Q2dQdDNNYzcvN3RWd0lXb1BD?=
 =?utf-8?B?OGN0QTloWUx2a05rb1RlRFdKVWE2UkUzT0Z2a1QwanRXc0h4OGZrTFdZRURi?=
 =?utf-8?B?VDVVbTNPL0NmeUZQY2NCVTArZExFcTdVZmhid0lKQi93SGNCdHJPWHBhV1Yw?=
 =?utf-8?B?allkUk80MEU1SHIyQWNlVFNrYUdtSUsydEpQQmdqMjVOSlFPY3pXa0xvMUts?=
 =?utf-8?B?b1hEZnNFQVFHeW1yWnJwK0MzZGEzelh6WTIyREtnemc1L3p4VXRXZm00R1Nu?=
 =?utf-8?B?SkIrT1VFR3BCVHZrd1prMHFTbTI5WmNJTzN5a0ZHdFM0dllLU2dYaVhBbjRI?=
 =?utf-8?B?UFMrUXZtRThSbVZLOTZtekVoaTIrR0VMZUQzc3Fjak1UamR4ZmJjWThPeGRZ?=
 =?utf-8?B?V0FBWk5CazJ0UHVWSnlVa2lKRlU1djVIV3BXSDNydmVoblUvTHVSaENuY09l?=
 =?utf-8?B?RGNlZ3FaWlZyenMyR0I0eGM4THVqK2E1OWVjM2N1NTJOZmc5WUt2Mm5KejM2?=
 =?utf-8?B?VnNoK0cveE1YSXZkTlZiR0hTUE4xMkdlMUxaZHZFRGpvR000YUExSjhBYVQ0?=
 =?utf-8?B?S3pCWnVTSEdjQ2IwY3lUamYrc0VCM25MY2JvK2UvajJqZVJjRTVnRU1Dc3I3?=
 =?utf-8?B?ZWhielI4N1Iwb3gyR1FGaW42UEFWMWJwNFl2L25vbDZCQ2tSTURwWElkL0FY?=
 =?utf-8?B?cm1sUEFxdy9HVC9EQ003MHY4aFUwY29IMlJySys1WldaVTdHSERRN2VqRDF2?=
 =?utf-8?B?UGtueHljd295VGdZMkw4US9DWVRRaFZrNVBCMTNSSGFydjlHVXkrajk0aW9y?=
 =?utf-8?B?d3l3YzFoWDZrRkZ0akpZVFpvQW5ZS29BL0xDMG9hUGlHbHdHdWhlZlM3SWhq?=
 =?utf-8?B?ZUhYb1BXQzlleFNEa1VXQUE5ZTJlTHVVV3FqMEIrMDhDZjZXOUg1dFFIczhM?=
 =?utf-8?B?bnZEMiszYjRCSG1HN1pFOXExamhoN1BqNGZZZ2xsV2tydXpPSXk4YTVjYlF5?=
 =?utf-8?B?UCtFUm5MK2ZRa3oya3J1Z0VuRzRpWVdHdW5XUWk1RVJPVWZRSWQ2c1pRb2Rq?=
 =?utf-8?B?ZUJGMzgrcllRTzlnckZpS0xZcFliTVhRQ2xFK2xnVXFVbVc5VUM1d241Sjdy?=
 =?utf-8?B?ZVlxYlNwNWcrUnZ3U1VxZjZDQXNhcDdUVW9HZU43Rnh1OEcwVXFoV3FWekRB?=
 =?utf-8?Q?JvU1TplSLR+reYe1I4+NBqLMfQjKlhNGHoeb8skN2nYR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09633c54-9c88-400f-3403-08ddf2cf9c96
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:45.7269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtjJWPdh1RpBn2QhN616ZzdwgDA7pE3am/jkyuxXp3ZcxNEpvARY30dOhCzxndqem2gCtoavQHsdQ1bP8DlFaA==
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

The GSP firmware is a binary blob that is verified, loaded, and run by
the GSP bootloader. Its presentation is a bit peculiar as the GSP
bootloader expects to be given a DMA address to a 3-levels page table
mapping the GSP firmware at address 0 of its own address space.

Prepare such a structure containing the DMA-mapped firmware as well as
the DMA-mapped page tables, and a way to obtain the DMA handle of the
level 0 page table.

Then, move the GSP firmware instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

As we are performing the required ELF section parsing and radix3 page
table building, remove these items from the TODO file.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst  |  17 ---
 drivers/gpu/nova-core/firmware.rs     |   3 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 236 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp.rs          |   3 +
 drivers/gpu/nova-core/gsp/boot.rs     |   6 +
 5 files changed, 246 insertions(+), 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 89431fec9041b1f35cc55799c91f48dc6bc918eb..0972cb905f7ae64dfbaef4808276757319009e9c 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -229,23 +229,6 @@ Rust abstraction for debugfs APIs.
 GPU (general)
 =============
 
-Parse firmware headers
-----------------------
-
-Parse ELF headers from the firmware files loaded from the filesystem.
-
-| Reference: ELF utils
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
-Build radix3 page table
------------------------
-
-Build the radix3 page table to map the firmware.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 Initial Devinit support
 -----------------------
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d821744d996105d81f6667207fe931492f82d6c0..10200d11bbbfebd5abc05f2b03151ff0614fb5a6 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gsp;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -39,7 +40,6 @@ fn request_firmware(
 #[expect(dead_code)]
 pub(crate) struct Firmware {
     bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
 }
 
 impl Firmware {
@@ -48,7 +48,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 
         Ok(Firmware {
             bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a7eda9ca0d2193c944060bdb04f6fba520def01c
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -0,0 +1,236 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::mem::size_of_val;
+
+use kernel::device;
+use kernel::dma::{DataDirection, DmaAddress};
+use kernel::kvec;
+use kernel::prelude::*;
+use kernel::scatterlist::{Owned, SGTable};
+
+use crate::dma::DmaObject;
+use crate::gpu::{Architecture, Chipset};
+use crate::gsp::GSP_PAGE_SIZE;
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use core::mem::size_of;
+
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    #[repr(transparent)]
+    struct Elf64SHdr(bindings::elf64_shdr);
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64SHdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let mut shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<Elf64SHdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr
+            .clone()
+            .nth(usize::from(hdr.e_shstrndx))
+            .and_then(Elf64SHdr::from_bytes)?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.find(|&sh| {
+            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
+                return false;
+            };
+
+            let Some(name_idx) = strhdr
+                .0
+                .sh_offset
+                .checked_add(u64::from(hdr.0.sh_name))
+                .and_then(|idx| usize::try_from(idx).ok())
+            else {
+                return false;
+            };
+
+            // Get the start of the name.
+            elf.get(name_idx..)
+                // Stop at the first `0`.
+                .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                // Convert into CStr. This should never fail because of the line above.
+                .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                // Convert into str.
+                .and_then(|c_str| c_str.to_str().ok())
+                // Check that the name matches.
+                .map(|str| str == name)
+                .unwrap_or(false)
+        })
+        // Return the slice containing the section.
+        .and_then(|sh| {
+            let hdr = Elf64SHdr::from_bytes(sh)?;
+            let start = usize::try_from(hdr.0.sh_offset).ok()?;
+            let end = usize::try_from(hdr.0.sh_size)
+                .ok()
+                .and_then(|sh_size| start.checked_add(sh_size))?;
+
+            elf.get(start..end)
+        })
+    }
+}
+
+/// GSP firmware with 3-level radix page tables for the GSP bootloader.
+///
+/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
+/// space:
+///
+/// ```text
+/// Level 0:  1 page, 1 entry         -> points to first level 1 page
+/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
+/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
+/// ```
+///
+/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
+/// Also known as "Radix3" firmware.
+#[pin_data]
+pub(crate) struct GspFirmware {
+    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
+    #[pin]
+    fw: SGTable<Owned<VVec<u8>>>,
+    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
+    level0: DmaObject,
+    /// Size in bytes of the firmware contained in [`Self::fw`].
+    size: usize,
+    /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
+    signatures: DmaObject,
+}
+
+impl GspFirmware {
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = match chipset.arch() {
+            Architecture::Ampere => ".fwsignature_ga10x",
+            _ => return Err(ENOTSUPP),
+        };
+        let signatures = elf::elf64_section(fw.data(), sigs_section)
+            .ok_or(EINVAL)
+            .and_then(|data| DmaObject::from_data(dev, data))?;
+
+        let size = fw_section.len();
+
+        // Move the firmware into a vmalloc'd vector and map it into the device address
+        // space.
+        let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
+            .and_then(|mut v| {
+                v.extend_from_slice(fw_section, GFP_KERNEL)?;
+                Ok(v)
+            })
+            .map_err(|_| ENOMEM)?;
+
+        Ok(try_pin_init!(Self {
+            fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
+            level2 <- {
+                // Allocate the level 2 page table, map the firmware onto it, and map it into the
+                // device address space.
+                VVec::<u8>::with_capacity(
+                    fw.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level2| map_into_lvl(&fw, level2))
+                .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level1 <- {
+                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
+                // into the device address space.
+                VVec::<u8>::with_capacity(
+                    level2.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level1| map_into_lvl(&level2, level1))
+                .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level0: {
+                // Allocate the level 0 page table as a device-visible DMA object, and map the
+                // level 1 page table onto it.
+
+                // Level 0 page table data.
+                let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
+
+                // Fill level 1 page entry.
+                #[allow(clippy::useless_conversion)]
+                let level1_entry = u64::from(level1.iter().next().unwrap().dma_address());
+                let dst = &mut level0_data[..size_of_val(&level1_entry)];
+                dst.copy_from_slice(&level1_entry.to_le_bytes());
+
+                // Turn the level0 page table into a [`DmaObject`].
+                DmaObject::from_data(dev, &level0_data)?
+            },
+            size,
+            signatures,
+        }))
+    }
+
+    #[expect(unused)]
+    /// Returns the DMA handle of the radix3 level 0 page table.
+    pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
+        self.level0.dma_handle()
+    }
+}
+
+/// Build a page table from a scatter-gather list.
+///
+/// Takes each DMA-mapped region from `sg_table` and writes page table entries
+/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
+/// 4 consecutive page table entries.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.iter() {
+        // Number of pages we need to map.
+        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 33cc4f2011c1f08931efa540fa10493478018721..917e8a83d2935325dd75d625cf4b7051ac08238a 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -4,6 +4,9 @@
 
 use kernel::prelude::*;
 
+pub(crate) const GSP_PAGE_SHIFT: usize = 12;
+pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+
 /// GSP runtime data.
 ///
 /// This is an empty pinned placeholder for now.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index faa553635b7c73f01ba1b07d31f57404e164a622..2800f3aee37d05e4d24b4989d2ce418ab2549596 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -10,6 +10,7 @@
 use crate::firmware::{
     booter::{BooterFirmware, BooterKind},
     fwsec::{FwsecCommand, FwsecFirmware},
+    gsp::GspFirmware,
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
@@ -112,6 +113,11 @@ pub(crate) fn boot(
 
         let bios = Vbios::new(dev, bar)?;
 
+        let _gsp_fw = KBox::pin_init(
+            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
+            GFP_KERNEL,
+        )?;
+
         let fb_layout = FbLayout::new(chipset, bar)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 

-- 
2.51.0

