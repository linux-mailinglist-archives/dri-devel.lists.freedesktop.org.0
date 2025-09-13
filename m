Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3097B56169
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE1510E1FC;
	Sat, 13 Sep 2025 14:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="amhuQigr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26B610E1F5;
 Sat, 13 Sep 2025 14:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMm3GRZsM9YYDSASQba6s3mD3j9fnVKMbUBA3qY5CWMtbdnipW/EcB9N5YiDmw4D+Oe3pm/Hk9ZmJgNQfZ/QCZko55XxA7HZMF48LjfNCL8fZ8/6uRi/Kd6OgEkFSHdmTdrrgcfqz/IiMgf/iW/tZMPIhE3bXDGb8iT33rd3e4XO9W2vFw9W6u1MbsCAf6R37OYV5o4y+pFFN/Wl7+Z9qNNwqarHLzy2s2rdOOD93A/RNcs9rwJEb1uYCwfWLncyGd2Xlga7qlfx9ezoOwi2LvOGGWzdOqPUQm5/q5qYPGyc5srSJfLFbeyGCJlBf9YdH3L3ZtmN9xLNiTF0hmU31Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sMIj+2K77EEYWOD9pKSe93vOFHE0J9aihqXaBWormM=;
 b=BYCv6SxniwiZFH9+YXXrn7Mf0SYMtAxag1wk0r1T7F/6oJL/gRpGyFgY/PaKrxip1yQcDiynbdjCSZlaXj7pB3GEEOy5XvNaDmFw+OQNpsUfVhcmC0NtR+/dqXdXKY+oRgHAQlzrFDromU0zPrZGhDw5mljZ1VVdsyd6ArHX2hTHkMPeOVzv9BuVCpFhE/y4yhIRlpx0eEnH1TW78JzWDjMqRGHLTW2/6JwxbTIFoMbPHmbgSBDEoNPeDHkna13zdDwTB+J1qKSv/8GbOxzf7bkCmcZin2QDwzEU3hwg73ncD4aoFvn0ysfYUXTc1rjGKALWzSXdW3Cj7FLt1CiELg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sMIj+2K77EEYWOD9pKSe93vOFHE0J9aihqXaBWormM=;
 b=amhuQigrm1XJFqD9pfWYdgmTYPkhUYATEWi3VREIoIVCU7na8A7mgN9kVCGTzgzh229mspb1iAxIzx53Z+lD8KMLb2EhnZRIADi7fP6ftHXiPzW7HqPjgHUjEilXYF4A1RjNIB3s1c/nqN6r5OlwvuExHY5PT+uGHl57YA8bh1HI7DS/U4GbEFo2mZIYeCQrtXrh8JwZktslSS+kKbNJyvPYY+MI209f/HMFxjRJ8C05bWIgyjwOl+UMM4az0q5EOIyOgp+U+DdcoVkj9O4oJlrZEtGQicO5yA+iYamSHu0fQC86/x7bdbfxh7dbhGCk8R/2RRnybiFVlT0TBdIUgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:18 +0900
Subject: [PATCH v6 05/11] gpu: nova-core: firmware: add support for common
 firmware header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-5-9007079548b0@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfab3c2-7294-46e5-5cbe-08ddf2cf988d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHZxRW4xaGkzcThSWldBa3NaRXJxdlhrTDdNcmxQb21nZE92eTNEQmZYNVJM?=
 =?utf-8?B?MFIrNTZkVTZzVWs3c2ZjNHNwSXdtWTNYS0tXeTNjNVZEdDNxZmtSL043aTZh?=
 =?utf-8?B?Nm1qdHlkR1VJbXZEK0Ztb3B4SUQ4NlJXbDYwUDFGYXFjQUlVTmhOUktVSzNQ?=
 =?utf-8?B?QlQ5ZDV4SkJFL21QN3FyWDhuZTQ5c21xdWRwZkVqNmw5L0dSRjk4bzlUVTBL?=
 =?utf-8?B?YXJjcWZWTnk4VEdMTFAvdnc4ZWlCWC90VDhyZ2NJRUZkZUppZmJOQ0JIS2xz?=
 =?utf-8?B?Mk00VVh1OFdNWWZTbXA4L0hkQTIyZjJ6azhpQmFESUVuZ1Y4eEtJUEVpU0l4?=
 =?utf-8?B?bXo4bC9pSXZhTTJPMnZPNlhSSWpsYnhuODl4Sk5UelZSdndWcEIzMEhDSW91?=
 =?utf-8?B?cUVhU1JZV3A1N1JDVDBQNTZqYjdtVmVWY253NmtFM21QcEliOXZFMjFheFNI?=
 =?utf-8?B?U0xyRHNPT2gwdEdFbUVRQW00UkNFUTU0aFoyKzAxYnZldDZLWnBwZnNHR0dU?=
 =?utf-8?B?QXpRSXdoQkw4VEsydDlrekFjb3hoT1lxeWhNOFJORDQ1Nkxzc2w2OEF0U0Vq?=
 =?utf-8?B?Zng2cmVIUjlLYTl1WlhlaXZLYTlTN0JEVFJCSVlnbm1NUEo5aHJsZ0RvY2pr?=
 =?utf-8?B?N01RTXdydXE4RWZWS284NG1pamN6dG5qVzlmMzFmTTc1Rm9aWitlakRWZk9B?=
 =?utf-8?B?NGhTVG9kdUMwRmJhNWtSN2FyMFJxd29vaVcvVXVUTnYyZHhhb3FnWUV6WGRw?=
 =?utf-8?B?NUJvSnRHdkIxdE1jeVc0SjNzTUlIQ0xhemFhQmhlbmxYWWtveXlwbXpGek1s?=
 =?utf-8?B?d0x6Y3RkMkF1clV0c0JQVVpMdkNBbURwZko0emRtcDVQYlVJbHBkVjd6T09m?=
 =?utf-8?B?d3pWbW5mT1BubFlIRlc1TTh3VWRPT2dlL1FxZUxiUDgvaVc4QUlDTHRpandL?=
 =?utf-8?B?ZXlHZTNFOVk3bm4vaTZjK291Znd0WWgzNVJLMlU0ODc0Q2xmbXhGQzhiTHpP?=
 =?utf-8?B?M2ppWlNKallHS09wdmlqVVRNRFd0WGhWQzg5cm9ac09EUFh0MXB3OCsvbXhZ?=
 =?utf-8?B?eDZtUGNaZjNFbHdYVllpU0h6aWtjT1N0amRHNmg3N2JraGhUN2ZlbHR0SkM3?=
 =?utf-8?B?R3lnSU5DbmRWSXpSZWFiSVlBTlY2Wk45RWp0b0JOY2JGVm0rUE5lUnpBd3RI?=
 =?utf-8?B?NEsxYVNJMHRPSmZMbmZvSDZLSk8rQ1lQRU8vdTFMWml4dXN5RzY3WkNsM2dJ?=
 =?utf-8?B?ek9JdXEwR3FqdDlROEowQ3Rra3hLUVhJekQ4ZTc2SW5YVC9RM2Z0NGoxTWhZ?=
 =?utf-8?B?NVk3ZlBFL0RWV2xveUNZU3pQWTB0SEFCNDVZSGxPMWU5NER0V3gwdGJXZjdv?=
 =?utf-8?B?UmpuTXhyZ0U1RUVEM0F3dUtDWGhJVVlzb21qc3BxdlQzQk4yYWZVeWJUT0x4?=
 =?utf-8?B?cWJISXFCU1F6ZTZycDVYeWxXS09BU244Q3J0STgxbWdzZDM3ZXNEbER0UXJM?=
 =?utf-8?B?UmhVbWVlUUJoNmZsRWhyUTFxRmdXZEtrcmVueUlyNXV2UHp4bFYzeU1aYUt3?=
 =?utf-8?B?VG05cHVyenYvV3gzYnppWVd1MFFEaUlJZXh4NDVPU3RyWWd6d3NNYnFGT1h1?=
 =?utf-8?B?aE90N2lBY2RmekM4NTNEbDh0TUt0MkwyWXVHZnVjNG1Ya1YzM3JiMEdFRFFa?=
 =?utf-8?B?QjRMdzlpOHZKbS9FSzA3MlR6aGI5V3ZENTN2cWJNVDNNOWIvZ2NXUm8xeEFm?=
 =?utf-8?B?Rmk5UEtieUMzTU4zYzlYMDZnZi9NUzJ0ZkQ0SXlkUHdFUk5ZOUtkc1c1SVZX?=
 =?utf-8?B?N2FPMGtibDVpVGIxdVBQTGh2N3pTTjd5V3QwcFpvY21qaEtlSkVjaFdJdzVQ?=
 =?utf-8?B?R2I2NW5wUXFWMU0vb291SS9HRFlvblBuSzUxU2NlT2FlMkUyaE1QdisxcytT?=
 =?utf-8?B?SnFNdnFqekhiOUdTeTZFR1Z2bjNobDBDV1RKYnVSQ0FjL2hpS1lEWmE1TGxV?=
 =?utf-8?B?dWVucnZSeGl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THlHNzBxU2Z0Q2h0YnJzVGYxS2xlcitxSCtLZVUxcXZiUUZoMzJ4V0xXVFl4?=
 =?utf-8?B?ZXVaR3dQbjF6UjRzMS9nd05kbFdFUndsWWRNa1A2eFZLVnQxaFpXaTZ6d3hp?=
 =?utf-8?B?Nm1WREp2dkhXUEl1aXBoVDRIaWhBWjRGalFJWEJVMTcxZGRSdk9BeTZQK0tR?=
 =?utf-8?B?ZmFNNXdvR1dMdlQrS2N0ZTNVVjRFUk1HUEtlbElUSG5OTUp1dG1WM3NXSkVj?=
 =?utf-8?B?aHhZdW8wMVlOYStKU3hGQ0luNDRhN2NxVEQ4RUlhbUFza21yYW5rbng5aGJU?=
 =?utf-8?B?b01oK0VkOUlYSUZFa0N6bHBhSUY1Z3VOYitUaHVSLy9hUGdCcHBtU1dpbVNo?=
 =?utf-8?B?V0ZCaWZ3eHlaU0FIdGJRaW1NeUd0OENaQ0dneW9TUzFaMjNSekMvMXFDY1N6?=
 =?utf-8?B?ZDZQOUNmK3dBSldxY1E0amRpMlkzM01SZmt4VTlYREF6S1d3R0lqemlYZUFu?=
 =?utf-8?B?WjlrSXhmRlZLRmRENDYzWW45cWVwZCs5SUlqZlVsaHliOWtZNGlZVzRTck1j?=
 =?utf-8?B?VWRuMzZieGNjd244L1BwYkRVQXpGM1Y4WVh5L3JIUGdZL3ZyK2pUcnpFdXhx?=
 =?utf-8?B?ajZ0a2xFQzE0U05tVVk5UExRQTFrUDdUVlZTSmE2cWt6c29NK0VCNjFUUTlm?=
 =?utf-8?B?MGJVZFpISzZ6TU5aSCttbWZLWnU4cTBkNlpLSld2eWp3VnRTbUJ6SVZJY2o4?=
 =?utf-8?B?QVB0OHFZQms4Q2Ntc2lkaktmTG5ySitvOGdtNTgzZkYvMlQzNmF3WlpVSW9C?=
 =?utf-8?B?QVdlODNCbTNWZGhJa1M5TDhFbzExYXFVN3UxZW9mbC9mUEV0SVF2elczVlZF?=
 =?utf-8?B?OGwvbjBuaFk0TjdnQnVtWll1QzB2aXFoR2J0UmI0OFNrM2hYOXpNV0tPSlEz?=
 =?utf-8?B?ZFdCNEJCN25Fb3ZFaGdsUnREbUt0S1ZTS3g3MzE0RUxYZnVzcnVlOFM2OTdB?=
 =?utf-8?B?eWQ1VzB1Q1U1YXFMd0N6UG9ydU5NeHlndHBmOEgrSHlCeEVxaERNN2ZmdzR5?=
 =?utf-8?B?bTduWi8vQ1d3emNaaFlNb09mTTVSbHJJU2ROQ0N6TkpEaXB4Z21UNU9ISTU1?=
 =?utf-8?B?L2NScDhwaHNBU05RcTA1QXhMYmxyVUpXd1B5eGVKa3ZuU1lFdmNZWkk4UCtD?=
 =?utf-8?B?RlgvOS80UG9tV2JFSTg4dHY1SVhucHRIMVk3ZlNvcDIzbkZQQWNNekU2YzJJ?=
 =?utf-8?B?Sy9sNEJSbWFKMlBQNVBGR2N5OGJDZ0JVVTQyQUlaU2ZGYUtuelg3cHZQa2pL?=
 =?utf-8?B?ZFBPZWJNbDQxZ2xXL05YQmtPQXJwblg2MmNJRU9JS3REelhtZ1ljSm5DbVFm?=
 =?utf-8?B?eXhRdkdKTWtlRjN4ZmtvRU0yYjJSR2NRT2dpNklGN3Z6V3prZlVMdDhOYjNR?=
 =?utf-8?B?ZjlFWFBzUjRDSjZZUGR2aHkvVFVzSFJVYlE2elJWOWVYbGlJdSt0ODNsTEJ1?=
 =?utf-8?B?UnZSRDlaYlBoMWVVYjMwQis5WmkzSTlITzd1OFNoTEZsQmhidXpFQkxxQUxR?=
 =?utf-8?B?NzJQaCtHY25veXoxZVA4SXNDOGJtbWFUODNMZjhEVklFVmh4MlhrN1d3YWkx?=
 =?utf-8?B?ZW9CbDdsRitzY2Q4RCtWa3lKc1RXZmh6citZbEJaczZZd2dMOFhENlRySzJN?=
 =?utf-8?B?YkQxMG9WcUZBdUVSTkdlUVBhMmc1SW5VNGxodDdpcFJMK3RUQlB5WDFvUURn?=
 =?utf-8?B?YnRYRnI5Slh3Yzl6TTlNTkoxVFVzT3JGR0VnRFZ4SnlSMEtreVVsMHVOdjFw?=
 =?utf-8?B?Y0kxZUwrMVhiY0xMTldwcyt5aEh2RjhnMTFZODVVeDQ2MGttSGtRQjBOcDlw?=
 =?utf-8?B?QTh6VEtqTzFDakFNSCt5MzIzTzNvbEY3V29NYURqQ1VuMHRhSytIaTY0MXFi?=
 =?utf-8?B?bjJDQ2MwUlN3SUoyZ3ZRNENhUjZRZURCOHR1dFVtekdFN2lob3FaNGc4ZUdW?=
 =?utf-8?B?Nkd6Ukk1Sk1KUmU2TklqcXVmMEJybnkyUFZoWnZ3SFo5TmZVWlVMMjVJbW94?=
 =?utf-8?B?M3p1R2NOTThMSzNHdnpJaVorYjdrWTZiNWJnUnNaY21lQXVncDVSc0huejI2?=
 =?utf-8?B?SkkxanBFRjBSQlRIa3drRWlHSk12N3MwWmNDKzczWmFNRVp2TmZ1ZzB5V1FO?=
 =?utf-8?B?Um84eVByUWFzZkw3dzJSNnZuTkNxcVhoSkxGQUUrdEl6NzlFK1V3azhIZjVL?=
 =?utf-8?Q?aVVTiOsqB4sYmSeTqgUB3dit2axal+pSV/HD8L8hmQfn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfab3c2-7294-46e5-5cbe-08ddf2cf988d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:38.9146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOeLYkgpT7qHvSmMveGD0Fz21/11E2mc3/ZPOYA5AexmBukrzbMigokVFyv3xbNLgZ9mA7s+BrrFk/nE51UR9w==
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

Several firmware files loaded from userspace feature a common header
that describes their payload. Add basic support for it so subsequent
patches can leverage it.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 62 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 8e40a671eca8cc3454c106ef6c83bb54e8454715..dbc62c00d95bc1bb420fa704977171d7c9f74109 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,11 +4,13 @@
 //! to be loaded into a given execution unit.
 
 use core::marker::PhantomData;
+use core::mem::size_of;
 
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
+use kernel::transmute::FromBytes;
 
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
@@ -156,6 +158,66 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
     }
 }
 
+/// Header common to most firmware files.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BinHdr {
+    /// Magic number, must be `0x10de`.
+    bin_magic: u32,
+    /// Version of the header.
+    bin_ver: u32,
+    /// Size in bytes of the binary (to be ignored).
+    bin_size: u32,
+    /// Offset of the start of the application-specific header.
+    header_offset: u32,
+    /// Offset of the start of the data payload.
+    data_offset: u32,
+    /// Size in bytes of the data payload.
+    data_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for BinHdr {}
+
+// A firmware blob starting with a `BinHdr`.
+struct BinFirmware<'a> {
+    hdr: BinHdr,
+    fw: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> BinFirmware<'a> {
+    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
+    /// corresponding [`BinFirmware`] that can be used to extract its payload.
+    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
+        const BIN_MAGIC: u32 = 0x10de;
+        let fw = fw.data();
+
+        fw.get(0..size_of::<BinHdr>())
+            // Extract header.
+            .and_then(BinHdr::from_bytes_copy)
+            // Validate header.
+            .and_then(|hdr| {
+                if hdr.bin_magic == BIN_MAGIC {
+                    Some(hdr)
+                } else {
+                    None
+                }
+            })
+            .map(|hdr| Self { hdr, fw })
+            .ok_or(EINVAL)
+    }
+
+    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
+    /// the firmware image.
+    fn data(&self) -> Option<&[u8]> {
+        let fw_start = self.hdr.data_offset as usize;
+        let fw_size = self.hdr.data_size as usize;
+
+        self.fw.get(fw_start..fw_start + fw_size)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.51.0

