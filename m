Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8B6B35288
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE85410E382;
	Tue, 26 Aug 2025 04:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e0FPaZnx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F2810E2C9;
 Tue, 26 Aug 2025 04:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bur0ATPD3dvSZ6gmGWpkg9MiH6nuq8GdXZ3leaVHbPIhGN7cl4qD88qkrp77dGB6SkhclYo7N+PuQHEZqVZm67aO27ycfb4SrpVNRNXpi/MfKAw3sjFVRZ8AFui7Ol+dMDG1NNH+gw3DdpYLGNnuNvfVlx+SG+QIr7li7ods9wNSEggsmCk5VjsS4MLUn0AZUNMroB+Vs5+vZIo2nywNjdyb4f34RZKU2Z6eaPpidQ+6W2PXkeFq0a8dmqeGyhqwT4eH7EL0VIqTZjwMkx32kX43fTqHq4C/yvd8XJDeY4QaCA/82KgYKC3V+uJCGyhygKBmrM6TI7EnKpeGg6uW6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjzcniWd1lk8KqSyOVLfo3xl6lx8TeWc4N9enJ0A6f0=;
 b=YDUGtquUZu00X2TuraQ5JPlN1cRwJr2agOpQ65WP65OjpoMJoLg1hdAi0Xm3/HrGF3vYnw+W7nt9lwhBH4ru0Jwk3akhkj5aQ0OrPjzqu/LkCFeqm9UOOl7iO1XbwL/RbYWCbULgH1ExgEoJQHaMgmpyfUIJJRHnntOQuz/QGYyfCNaDw9M6XCwP7qxcs03EHa71bwR73QSCKXEx7gJMScLTc0pPvSaSq09jcuXCJ5tJMN6RTTnaSP3AAlaRMdh8FoaMeX+3Pm8Mci9bL0hi8V7JfMekvlNR6IPzpbG7VkJ23gF41HabcjwDNFB3xW5rs/+NbafGk3VIkc+XttW65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjzcniWd1lk8KqSyOVLfo3xl6lx8TeWc4N9enJ0A6f0=;
 b=e0FPaZnxfxPttvX+4iEfmpCu6a7kM8Qse/OfXLkUBt30wjRaChgpVTNnHOeGaZ5LE1tJNGL2XiQHGtktZsz+O9JRIiA3VMjae/IJpqrQ2znLVlPMj/7vJIhT5IGipZ2mOTypTAj/O09cgBYUz9C1QGwAKy9x3gQuyzFJs32BhDN/lGCBrFy4Q7wB9VoNRZvkvyxiP1e8gPqOO7ctkEVSed087IfnJAsESB3DYJjMDPShbIBmOqIQw3/VuV+6bSm02074PK7pxlDnr7Pmxd8wzx8S9i+C26k2lNhDgCQYp0JfvE00EyKyh8MGDqaemAbsP5yMZijDX2eRi+YwkFe9HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:08:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:08:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:41 +0900
Subject: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare the
 GSP firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
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
X-ClientProxiedBy: TY2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:404:42::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 78835b2c-c291-430a-7b69-08dde45628df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFFZLzNUZ050MlliZHVEbGRHRmo4TEg2SE52STZHRGRnWWEvMmxqdFRKeGUr?=
 =?utf-8?B?SWtManNTd0dtcDllRC9IazUvcG41MU0zY2p3TEJLNGtQbU52aENkNUhyVHZ1?=
 =?utf-8?B?MEZJU1NzNFJYMWdoVEZFVStCalN3b1NyY2FCMC8renBYVDNMWGMzZERSQXAw?=
 =?utf-8?B?azZkRDI4V3BNVy9OZnJxS25oS1ErdWdKZ2FoYU9lOHRsOWFhMUtEbzUxWTV5?=
 =?utf-8?B?VXBJWU1CQy91T0VQR0xacG1sMlI1bDlRT0lpQkxpVUZ4S2tnbGNTNVZMS1NI?=
 =?utf-8?B?N3RkUmxTRlZhd0MzVkFrN3gvZzRZU3hVMEFxaDNlVzhyQXYrZXp6MlUwc1Ez?=
 =?utf-8?B?MmZoZFpRN2Z6dTN4UE02cFlzaE5XVEFQQkxQWEJCenNuUHFwQ0JrSW1SMU81?=
 =?utf-8?B?bll4QXdWd0dGZ1VqSmJEdWQxbXpabjlTd3o1aGxDaHNTR1VjVFhVL0pscXln?=
 =?utf-8?B?LzhoRXIvVzRldmsrMnA0QW1DUm5WRVNxNHdTYktUWWlGUmJlSmFmZVhmeW5w?=
 =?utf-8?B?YmEvRGphQjRySzhPVyttaEwwM216Vyt6ZUVYdlVBMWtTaU81NUxSS01LeWlL?=
 =?utf-8?B?REdIeXl6VFpObWRoTU5FZGgrTzNYSFB1Tlpld0c4YWFndTdsbS8wK2dqdzJZ?=
 =?utf-8?B?bFE4ZDk0MVoyRVRHNlY5VnBab3VpN2tzSzVYR005bUF0Zk5XYVBXQ05hVlhj?=
 =?utf-8?B?TGxrdVpMSTlFWlMzMmdrekZuelErSW8vN0dLaWhYbjlXOWV5QjNsdndBUStn?=
 =?utf-8?B?MGJrRU1lWjJaNDRNK0diSnF4UVgyekZIZHNibG8xVHoyZ0tndkpQcnlCcVRH?=
 =?utf-8?B?M0JoTjNPY0p6LzN1T09VWWgvcEkvajhMWWFOK1BuQVVCN3VwOWVvMmh4SHFq?=
 =?utf-8?B?VG9wdGc3RnNJVnVxNm5WdkFiWE1WVlBIQnNndzZMN0gySzVkYjEzWnZ6RWRK?=
 =?utf-8?B?WXhYUjdGSGtZLzJWOGRkcEpGaDVMR0dBaHJzZm5VK3hCckp1cUMvNnVweXox?=
 =?utf-8?B?UWJwczQ0YTUvQnlnNHBCSVlGbWpjd1pwNGJ4ZGpoN1NFN1ZRZUlaK1BnUUta?=
 =?utf-8?B?SkU0TTVBNVNxcEs3aEM1ZWplZXgzSEdiVnphckdMcnNGUHlMOVhJMUxWdHJT?=
 =?utf-8?B?cTVwMXcra0RsSWN2QnZoODVrZGRnV1l5aGdXTVlWb0hiN21TK0dCdHRReHlr?=
 =?utf-8?B?eGF3aktYaG5NUkoraDRjSTlSd1ZMZndBNUNoY0RadUJTNjdQRytwTnAxejBG?=
 =?utf-8?B?M3VvN1JmTTBHSjhlR1VJYWxQM24wQzFQYXdqNVE0ZnFsd2xRaWZHVWNxN1NJ?=
 =?utf-8?B?UVluOGZwYVhjODd5ZWV2SEhTUjJXVzVlajV5U29kNFlUL3ZYUHcwQjJ4NFNJ?=
 =?utf-8?B?TThaMi9wVjB0YzRsU0d5bFM0QmlFRG9iNGNuM1FkQ1NSdmxVYS9URG1uWElX?=
 =?utf-8?B?WE5IZmx4WHZWeElZQVRnaEJ1WG4zczZVWWFXTU9GMUk0ek5JMnJWTEFXV1o2?=
 =?utf-8?B?aDBaWlBvYWRHQVN3bktDOFRseHNyRi9ncFZZa3g3Z0VrUklKa3FabTBhSUcz?=
 =?utf-8?B?SFBqdEhhZ2xMQ1hRS3RDRnV2dC9peTg5aER0a05Nc3VEWGg4TEhVRmJiajJ2?=
 =?utf-8?B?MXlIMHd3MUJHYldFRnppeG1Sa0d2M3FjY2JOcUdpektKNUY5dG5lcGVqT09v?=
 =?utf-8?B?dDZKSWR1ZUUyYmwrM3NsVFl3OTNGZ3RBOWhaRENWR1FzSjF6NlpPOGVsbDdE?=
 =?utf-8?B?RnVXZks1YVkyYTQ4NDc1amE2bW10SzFvVThMWm1DQTk1YnFiQ1hkR2tnUVlt?=
 =?utf-8?B?ZEgvc0gvUzJIQ3hQMXNIZkJLVkhRZUkzSGFndTBiclRVMDZaamlFa3hSMmVS?=
 =?utf-8?B?ZEtWM3l1QVVQNEgxYi83aGZpdmcyWitDd0FFSUtCZitzUmVjNkU4WDljNS8w?=
 =?utf-8?B?SXpLM1U3cENtb05RQWN1eXY0MEwxODZkT1JWVHV0T25tYjVEVlpxL3hqY2tJ?=
 =?utf-8?B?VW9uOVJDaVV3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anlkamptZDQzclVBMGV1dE1uNy9yZllKSnpZTVpxRlVuUG83Ukhkcks1M2lB?=
 =?utf-8?B?WFZrTmpCbXo2WjhpbFZnRS8vNExVdVBtL1BjQmd6aGYvY2swQ3RPSDM0ckVy?=
 =?utf-8?B?d3h5QUVnZ0NsTDJDdXJEbms5bEJLMVE1R2hiUnBhRHN3dGJ3aThwTlFueWZX?=
 =?utf-8?B?cW9YVGt4TVVqVFBxTlh5Y3hhRlV3L0JnbHI1M1ZVbmtNbWFIcnVPTC90Z0t2?=
 =?utf-8?B?UzFxNzFSSDA1RThUaWVIdFFOUC9XeW9YdGlXeVFyU2lzelc4TWRIVHVXVXZ0?=
 =?utf-8?B?aWpUd2RSUlUrdFJybFBkNWsvQUwvdStQOGNEQkRRUmRtSlN0UnpveEh0K3FU?=
 =?utf-8?B?TGFET3loZEJpUlBLTDVqMWFTQVE2Nm1Fdzg2REZSM21oRjV3U2dtaE1yMXRW?=
 =?utf-8?B?OEYzNWsvQy9Wb1JwZmFOSEV3RDQ0WlovazJsSkhHbzlvWTRzeDFoYkhKMm43?=
 =?utf-8?B?b2d6MWNiQ2ZVZUlRSUthMkI3SU1ULy9RY25IRGJiR0xReHZWMkxVdmdMQ3lR?=
 =?utf-8?B?TXNlYXA3bzN2cUpSMGFKOWVzUkgxMS9IUGVqL0t3b0g2d0RKS3UxY0JTS0N4?=
 =?utf-8?B?cHFCU3FOMGlQeDdUS1l3Nm1WbG9oU240dTVzNjR3WjFMU0xvcUowNThXMjRT?=
 =?utf-8?B?R3hyaXBWVzlwTXMremZGQmFSSTZ6VjdlUFdEYUhoZCtRZGRZQlhNd2tHV3lo?=
 =?utf-8?B?U29lMGVBVHB6RjIxcVNBVnovaXpla1UyNmZkblJiYWJ6b09nK2NOLzZNa0lu?=
 =?utf-8?B?L3l4Znkzai9DbFpDdHlvb1BrVXp6MGsySzZkMjlLOVc4cmJpSXY0SEVmN0hP?=
 =?utf-8?B?cTB2bU1SNzVrOTVKUzhFZUR4d3hqelFmdy9mVVVnYVM2L29iaTRtR3gzU2lh?=
 =?utf-8?B?b2Nob2JTeStFSXBtVnpLdnF1S2ZzYlhnNXIxVmxDM0VrOHNWcWRlYWtwSkhQ?=
 =?utf-8?B?R1JhSFZURm0yK2ZxdXJPMUNJV0wxMTlVeGljMkh2TisrN0x3c1FqeS96L1ds?=
 =?utf-8?B?TzlxTmllbnBoRng4RFczWVR6WThFT2V0U0ZBd01GcTF2WG41NUJFN2pIRWhY?=
 =?utf-8?B?NDloVUZScFk4cEJpVGh6dlM5QjRaNGdYNEVUSFlna3VtWjd4M29rVVZHcEI0?=
 =?utf-8?B?bjBnMnhJdEkvUkNIRGxUYWpieHlSS2Fyb3NPSUxMY1VHOUVyb0kycllCUVVp?=
 =?utf-8?B?RXU2aFJjdEY4QXlKOXVpdjVPRlZVYkdyZTRSQWY4Qmw5US8vVU9yNDUzMks1?=
 =?utf-8?B?bythaEhrUW9XcS85a0kxeWhkQjVhVG8wTGg3VmNwL1VVUzRScFpxT241QUNn?=
 =?utf-8?B?bTI2YXZ2NmVqcGNoY3hxR3JGOWdYc0g0U2sybmYxZzJxaTdKelhRSjNSR2Ru?=
 =?utf-8?B?bS83cWtrMzJRUE1mMUJhRmpEcU5oQzAzREJObEV0ZmhuQUppRzBKMFB2NlFy?=
 =?utf-8?B?VkZhMXgrRFRmVmFydy9RRUJwaVdjT3NMWENISTZXa2tHQkxBZ3NVeVJyd2lV?=
 =?utf-8?B?WWdIbGtaaUdXK01ORVp0L3JubEpyaU5BU3ZhaXUwTlBJVStid3lrUFRxYmlm?=
 =?utf-8?B?b1pYc1dIYlJReXZtWkRXdVFBd0htKzRXUHQ0Um9oMG5BaitpZXVGbHE0UzNS?=
 =?utf-8?B?RDBNaVNjZ1pSeDhlN2tXWUFDRjRLRWVpS0VtbWRWS2Zxb0RlVkU1RFlscmF5?=
 =?utf-8?B?NUNCbFdLV3h3MUtIVzFhd1Rha0dUNGxTbytIZkhGVjVEYUNlWW5XRGNob0dT?=
 =?utf-8?B?TjlrTUEva1FqUkJ5aSs2TndDU3hsTG9YczRxZDAxWnczM2dDZE1kYkJtWTlL?=
 =?utf-8?B?a1JDQUNRYWNESUgrUDUzajhzVi9YWUVpRHFoQWxUMlRVc1dONndaMXNCTEUr?=
 =?utf-8?B?KzMvSElRaTl1UUVwS28wb1JMRWY0VWNtUFRvVGRRNGFSSE1kY0h5UGYrUmph?=
 =?utf-8?B?QlNxSmZHY0hEZ1BUcm9UMDdmVEswdUFsQkIzckxrMmRlbk5nNE1TWFdCVVlW?=
 =?utf-8?B?bkh6bzhWdlJTK1JMVU52cE4zaTRXK3EvSEF0Rk9XTERLMllkandKUW10YWhU?=
 =?utf-8?B?WjA5VXFveHpmNWc5Zm1KdlVFMVp1N0s0bHpGNUNocnBYQVlFNkhTOE5jQUY2?=
 =?utf-8?B?bzh2UUlhNDhxSHEwaW9MSFFTZmJNSkprMGsrYWJSYVd2Z29MYnZudVBLY3Vi?=
 =?utf-8?Q?4SIUSbn/AGrAhTzKfQ5dzmIc8D7arR2tuKwkCFl57WlU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78835b2c-c291-430a-7b69-08dde45628df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:08:06.1764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3LfeovFlk8+FFelXZ1eRUdRl+cVYSL60y6oiDnbsRX0yR8P2xGMNLlz1IU72BFoLhhPMU+WU7V8IXGcSaLcoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

As we are performing the required ELF section parsing and radix3 page
table building, remove these items from the TODO file.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst  |  17 -----
 drivers/gpu/nova-core/firmware.rs     | 110 +++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/gsp.rs | 117 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp.rs          |   4 ++
 drivers/gpu/nova-core/nova_core.rs    |   1 +
 5 files changed, 229 insertions(+), 20 deletions(-)

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
index 9bee0e0a0ab99d10be7e56d366970fdf4c813fc4..fb751287e938e6a323db185ff8c4ba2781d25285 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -7,6 +7,7 @@
 use core::mem::size_of;
 
 use booter::BooterFirmware;
+use gsp::GspFirmware;
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
@@ -19,14 +20,100 @@
 use crate::falcon::FalconFirmware;
 use crate::falcon::{sec2::Sec2, Falcon};
 use crate::gpu;
-use crate::gpu::Chipset;
+use crate::gpu::{Architecture, Chipset};
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gsp;
 pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<bindings::elf64_shdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.as_ptr())
+                .filter(|ptr| ptr.align_offset(align_of::<bindings::elf64_shdr>()) == 0)
+                // `FromBytes::from_bytes` does not support slices yet, so build it manually.
+                //
+                // SAFETY:
+                // * `get` guarantees that the slice is within the bounds of `elf` and of size
+                //   `elf64_shdr * shdr_num`.
+                // * We checked that `ptr` had the correct alignment for `elf64_shdr`.
+                .map(|ptr| unsafe {
+                    core::slice::from_raw_parts(ptr.cast::<bindings::elf64_shdr>(), shdr_num)
+                })?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr.get(usize::from(hdr.e_shstrndx))?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.iter()
+            .find(|sh| {
+                let Some(name_idx) = strhdr
+                    .sh_offset
+                    .checked_add(u64::from(sh.sh_name))
+                    .and_then(|idx| usize::try_from(idx).ok())
+                else {
+                    return false;
+                };
+
+                // Get the start of the name.
+                elf.get(name_idx..)
+                    // Stop at the first `0`.
+                    .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                    // Convert into CStr. This should never fail because of the line above.
+                    .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                    // Convert into str.
+                    .and_then(|c_str| c_str.to_str().ok())
+                    // Check that the name matches.
+                    .map(|str| str == name)
+                    .unwrap_or(false)
+            })
+            // Return the slice containing the section.
+            .and_then(|sh| {
+                let start = usize::try_from(sh.sh_offset).ok()?;
+                let end = usize::try_from(sh.sh_size)
+                    .ok()
+                    .and_then(|sh_size| start.checked_add(sh_size))?;
+
+                elf.get(start..end)
+            })
+    }
+}
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -36,7 +123,10 @@ pub(crate) struct Firmware {
     booter_unloader: BooterFirmware,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     gsp_bootloader: RiscvFirmware,
-    gsp: firmware::Firmware,
+    /// GSP firmware.
+    gsp: Pin<KBox<GspFirmware>>,
+    /// GSP signatures, to be passed as parameter to the bootloader for validation.
+    gsp_sigs: DmaObject,
 }
 
 impl Firmware {
@@ -56,13 +146,27 @@ pub(crate) fn new(
                 .and_then(|path| firmware::Firmware::request(&path, dev))
         };
 
+        let gsp_fw = request("gsp")?;
+        let gsp = elf::elf64_section(gsp_fw.data(), ".fwimage")
+            .ok_or(EINVAL)
+            .map(|data| GspFirmware::new(dev, data))?;
+
+        let gsp_sigs_section = match chipset.arch() {
+            Architecture::Ampere => ".fwsignature_ga10x",
+            _ => return Err(ENOTSUPP),
+        };
+        let gsp_sigs = elf::elf64_section(gsp_fw.data(), gsp_sigs_section)
+            .ok_or(EINVAL)
+            .and_then(|data| DmaObject::from_data(dev, data))?;
+
         Ok(Firmware {
             booter_loader: request("booter_load")
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             booter_unloader: request("booter_unload")
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             gsp_bootloader: request("bootloader").and_then(|fw| RiscvFirmware::new(dev, &fw))?,
-            gsp: request("gsp")?,
+            gsp: KBox::pin_init(gsp, GFP_KERNEL)?,
+            gsp_sigs,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f37bd619bfb71629ed86ee8b7828971bbe4c5916
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::dma::DataDirection;
+use kernel::dma::DmaAddress;
+use kernel::prelude::*;
+use kernel::scatterlist::Owned;
+use kernel::scatterlist::SGTable;
+
+use crate::dma::DmaObject;
+use crate::gsp::GSP_PAGE_SIZE;
+
+/// A device-mapped firmware with a set of (also device-mapped) pages tables mapping the firmware
+/// to the start of their own address space, also known as a `Radix3` firmware.
+#[pin_data]
+pub(crate) struct GspFirmware {
+    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
+    #[pin]
+    fw: SGTable<Owned<VVec<u8>>>,
+    /// The level 2 page table, mapping [`Self::fw`] at its beginning.
+    #[pin]
+    lvl2: SGTable<Owned<VVec<u8>>>,
+    /// The level 1 page table, mapping [`Self::lvl2`] at its beginning.
+    #[pin]
+    lvl1: SGTable<Owned<VVec<u8>>>,
+    /// The level 0 page table, mapping [`Self::lvl1`] at its beginning.
+    lvl0: DmaObject,
+    /// Size in bytes of the firmware contained in [`Self::fw`].
+    pub size: usize,
+}
+
+impl GspFirmware {
+    /// Maps the GSP firmware image `fw` into `dev`'s address-space, and creates the page tables
+    /// expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a>(
+        dev: &'a device::Device<device::Bound>,
+        fw: &'a [u8],
+    ) -> impl PinInit<Self, Error> + 'a {
+        try_pin_init!(&this in Self {
+            fw <- {
+                // Move the firmware into a vmalloc'd vector and map it into the device address
+                // space.
+                VVec::with_capacity(fw.len(), GFP_KERNEL)
+                .and_then(|mut v| {
+                    v.extend_from_slice(fw, GFP_KERNEL)?;
+                    Ok(v)
+                })
+                .map_err(|_| ENOMEM)
+                .map(|v| SGTable::new(dev, v, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            lvl2 <- {
+                // Allocate the level 2 page table, map the firmware onto it, and map it into the
+                // device address space.
+                // SAFETY: `this` is a valid pointer, and `fw` has been initialized.
+                let fw_sg_table = unsafe { &(*this.as_ptr()).fw };
+                VVec::<u8>::with_capacity(
+                    fw_sg_table.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|lvl2| map_into_lvl(fw_sg_table, lvl2))
+                .map(|lvl2| SGTable::new(dev, lvl2, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            lvl1 <- {
+                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
+                // into the device address space.
+                // SAFETY: `this` is a valid pointer, and `lvl2` has been initialized.
+                let lvl2_sg_table = unsafe { &(*this.as_ptr()).lvl2 };
+                VVec::<u8>::with_capacity(
+                    lvl2_sg_table.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|lvl1| map_into_lvl(lvl2_sg_table, lvl1))
+                .map(|lvl1| SGTable::new(dev, lvl1, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            lvl0: {
+                // Allocate the level 0 page table as a device-visible DMA object, and map the
+                // level 1 page table onto it.
+                // SAFETY: `this` is a valid pointer, and `lvl1` has been initialized.
+                let lvl1_sg_table = unsafe { &(*this.as_ptr()).lvl1 };
+                let mut lvl0 = DmaObject::new(dev, GSP_PAGE_SIZE)?;
+                // SAFETY: we are the only owner of this newly-created object, making races
+                // impossible.
+                let lvl0_slice = unsafe { lvl0.as_slice_mut(0, GSP_PAGE_SIZE) }?;
+                lvl0_slice[0..core::mem::size_of::<u64>()].copy_from_slice(
+                    #[allow(clippy::useless_conversion)]
+                    &(u64::from(lvl1_sg_table.iter().next().unwrap().dma_address())).to_le_bytes(),
+                );
+
+                lvl0
+            },
+            size: fw.len(),
+        })
+    }
+
+    #[expect(unused)]
+    /// Returns the DMA handle of the level 0 page table.
+    pub(crate) fn lvl0_dma_handle(&self) -> DmaAddress {
+        self.lvl0.dma_handle()
+    }
+}
+
+/// Create a linear mapping the device mapping of the buffer described by `sg_table` into `dst`.
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
new file mode 100644
index 0000000000000000000000000000000000000000..a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) const GSP_PAGE_SHIFT: usize = 12;
+pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -9,6 +9,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;

-- 
2.50.1

