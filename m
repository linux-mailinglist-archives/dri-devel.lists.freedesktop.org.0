Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E70D7AE071B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4496810EA54;
	Thu, 19 Jun 2025 13:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WxPvcVI9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E630010EA56;
 Thu, 19 Jun 2025 13:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G1uM4NxH6NH/GX7q+Wpl38QXXdk2UQgzCj0yICYknolftmfnMJec7t4FkI/7kFvsTQDPlCF6P3riFzB0C97k/aBfffhisNWO9hN6zIKXrKFnj/YJ7XFWmeffQCCdP/cACWL9IGnAnQSDiHGKA+ZB0uLqypCpNbWtwsGfFu4LAXTn0Ye636k/5USndtoAMRZkZlQot691atY5xfampk6GzB8Fg1WQttkydCfC8/MuFvC9Ztkf6mtp8PHjX2qEW/hZ0a8d0YZo7bfLdDK8KNH1iFQnOhqcms2gaN1qHrWHXW1Oa7L2Qj3HRvgkzuaFg694K/Mq8Duq5jzcVfMD1bmPUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cn71A6BMUxf7/gDSfzp168xz4mUjAEkJ+8fgfbnL82U=;
 b=jwJIpJEf9MWZZ1RhG6OAq18+75tBqgJH+En22JvQ0PxDabixwKY3cc9Q/s//Crom2vSksoLZcpa7ZzIsFTAwmb/+5lrRQhJP27Ys64A0vnsOYY67lqwEP3uR1axQb7jnVoN8W7okcbOo7SyMwMKCHYrsv2FlFK/SpQZ2KonMUIBg5DdLItzL/c0OMuacif7dV01VhCK0XdAF94ejUpeUuX7yoCyhk3uXJ7AyRyHkf82h9kDjHClGnmRswl/5S2IPVVQypU69pKxW6TA3yD+5jx3ipsHTW6FNtu3FzwfRfvTQLaKtll8vuhkcD1yfAcORC9nVOsA1GjFVMalP8ovMuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cn71A6BMUxf7/gDSfzp168xz4mUjAEkJ+8fgfbnL82U=;
 b=WxPvcVI9UF5QtQbhmp2KT8no/3yOKrfsisvyNUMhfBKaK+zxzuskWowPT3MV608qsJDmOrEe0C2fporq03FntHMUgiUM41pxTh4H6bYC9OzPRWNx2klrAeKyseSO5e1YYKVf68Z2qLCoAMwVET2bIG+e56chwJMS9iO+Ke7Qb+t3rAeYw2X3fsV6tL06QTCciXXSg8VNwO+9DPOnkp9tI6S2WnK5Xlnh3YaON9W5Qwuqe4OBoI3EY+m8By+QKd5v0S/j/Huw9CBF93IegQXtd43P6ZR/oLilaj0CKb6EgMqIiI71tUT/4/wUUERgq3hIbmyJ43+ikKSbRwY+XW9Gdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Thu, 19 Jun
 2025 13:25:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 13:25:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 19 Jun 2025 22:24:05 +0900
Subject: [PATCH v6 21/24] gpu: nova-core: add types for patching firmware
 binaries
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-nova-frts-v6-21-ecf41ef99252@nvidia.com>
References: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
In-Reply-To: <20250619-nova-frts-v6-0-ecf41ef99252@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Benno Lossin <lossin@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0165.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: b060116e-7d86-49e1-5286-08ddaf34c780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czFCdWZhYStVZGsrSytIaWMyQkpGcjdVazl3YlhNSXFoNHlheXNRYlUyUFY2?=
 =?utf-8?B?NE55UGZnWmZiSzZIVE0reGJrckhuejIzUVZ1QTBGNS9yVnJXSTg4NjV2SzFP?=
 =?utf-8?B?OWtuaTFvdDRhRE5FWXY3SGo3aGsrWW1oK3pWTnk2TEkxYU9MOThlS2VrYWxa?=
 =?utf-8?B?ZFFza1V3QVV3NndGZGxjTXNwSndQZVppTzJOb2s4dTJJaEI1QjdZbVF3dUdm?=
 =?utf-8?B?Z1BEcVJ6RWh1RTNCQVh0ZTJKNjc2eFZsMS9mRkxwTEg1bTZKeDNyaG9TOUx6?=
 =?utf-8?B?bU4vVFVZSzlJMGN6VXVjT3JSTk5BVHUvOThla1NnVCtaZU96RlJ6UWtVK1Uz?=
 =?utf-8?B?THp1YXB4UGNqdmZ4VGVVbUNoSHNrbUNmbUFZZ082WkhqWEFNVmdTeEtxZUQ3?=
 =?utf-8?B?Und1ZTdjRTYrNEpQS3FhNnNZQ25yeGxGTi9BVXFyeDZOTWNVUmxxTEFkckZD?=
 =?utf-8?B?cjh4c0NLRnUyeHJuRkprVEwvcVlnZEFwaENLczU0TFpBNENhUWRyYVVIN0hu?=
 =?utf-8?B?Tkd1Qm5aR1J0WkFNM1pUV0t1Mkp6UC9nZlVEWmFsQWJySGxPV3lVb0R0aS9C?=
 =?utf-8?B?U0RNaVQxTm51cy94Ym56RU9nK2MxZ1pDUExkYUtYdW13SHZsVlQrY0RESGFX?=
 =?utf-8?B?cjh4aHR2RFdod0czQk5NRmozTWNNSGIxTnZTMGIvRG5YaUhuTFRuWmxDcndl?=
 =?utf-8?B?aDMyR0lMaVEyR2ozL2VadmpXV0lrd2F0end3c2dNMFVWWE5tUUFucGoxQkkx?=
 =?utf-8?B?Zjg5SHRQTWl2WnR4VkFEUDhCR1JGU1ZVNksrRWY0Nmp1Z1VUQnUyMjJSdlZ6?=
 =?utf-8?B?M2ZPbTN2SXNOdm1xbGcyMlVUL1hWeTZzaFNSdEZOUE1WMTh1RkgxT3hmVmJ4?=
 =?utf-8?B?Q3M2bGNyV2lDRVRNUUNEc1drVzBwNHVJQ3ZVYTBHVStoTXZmR1R2ZExUN1U2?=
 =?utf-8?B?aFQ3MWwzS2R5d01mWStON3RjMVkreDl6b0V0MmcxL0F3QlRKTXE5Ukg3bHp2?=
 =?utf-8?B?a1lJWHJVUU1oR0F5TnRIdmtRM3dQNDRrMVpDbW5ML1NXVEFBbVg5R1J3VXBs?=
 =?utf-8?B?YS90dTM2Q29MbW15a2VsUVpwK0V3ZkUrMkZESDdYRnpGbHhoNnUxWmRieDlE?=
 =?utf-8?B?K01kV3VtaUVCMFZPYnpTb0E0ZHZ6STdXNFVKbSs3MENTVmdBaDFsbFcvYjNO?=
 =?utf-8?B?di9xczNuMlhQb2oza3ZiekRRQVFlUXBKOFh6NnJzb2UxMkM4em8yRU1EU2F5?=
 =?utf-8?B?azNpbHE2ZWtDMWIwZGtFQWtpKzlQRUhsSnk5Y1JNNFVETGhndllqKzBXWlRa?=
 =?utf-8?B?WnRIVzRDK0NydDkxM284SDdyV3JMMXdQRzVocXlwdkpKQkRDWXl6OHUwVzZx?=
 =?utf-8?B?M0h4ZFBYdTEreHNwNmc5QUplRndmbG9CL1lXYlNXbmJPME5Kem1MY0tqTFdO?=
 =?utf-8?B?VkxmcUxhNTI3TVRwcGp6TGgyQnduYk5Dekkwd01paGlkVGlXZE5FRTNxNTUz?=
 =?utf-8?B?TkxIZDdnYy9JeGl4eEtDZ3F3Vk55cW1pd0hQMnN6MGk1TjFsYjV6ZE5hbHRV?=
 =?utf-8?B?ZmN3L0xaZlBvaW8vV1dvVFluMXlDTnhRR1VoY0lUd0svaWtiQ1B4TFJDQkRL?=
 =?utf-8?B?R3ZtVWNOTXZzWGVFNlp0SExZOVFMNkhqN2ExejdlWXgvV25LRmtrNmo5cVlo?=
 =?utf-8?B?M0JQZnRYR0MyMnptRFU4ZExBdFF5ZW1GTWxTUVRWb2NlS29KTDEya1lLeUxx?=
 =?utf-8?B?Q0I5cExLeS96VnlyNXVFdEFla1VkcGtyZ1VYVnZwVFFVMFpSS1MzRjdGNDJv?=
 =?utf-8?B?cFJwSm1OY3JBV3dMWjIzajRwNWdVWlBmdzRvSHFVWmdSWVVsZ3c0bmJnUGtV?=
 =?utf-8?B?WDEvMjB0eDE3NDV1Q1praHM2eitaUjFZZWMwSmdUc0tOOXowdi9ucitnRnRh?=
 =?utf-8?B?blV1NHY3aXpYa0NWRDhWVHNzNUxVVm1hM29HZW1MaDJDeVdqSWNyaWdPMzlS?=
 =?utf-8?B?MEYreHprZ0lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnpOV0hza0dsY0pDUUZMTXJ0cnBNbHAzNUwwTndmYlB1b0FnRnFoQmxHNVo3?=
 =?utf-8?B?bjhRWDFpM2phOGs2ZnlFS3lVcHpzRVJYQXdWN1VyMXNwZy8wZ0ZhSEY3eFhF?=
 =?utf-8?B?blY1a2FINVFYeS9TdnYwbjR5LytRemtncmhGcFp5VUxxaHZJRFZyMWF6Mk5S?=
 =?utf-8?B?SGpOd29yRXZycHBlc09yTzc2SkpsUWlDWHJWMjRKeE5icUViZm9mL2dMRFhI?=
 =?utf-8?B?eFRJc2VYWnhxUFRaZG52QzFHczZiUjE4LzhaRW1UaHBNcEpKTlhzdmpMVFlU?=
 =?utf-8?B?dUdxVklrb1pQbEhTVUQxWUJ5UHdwQTNlU0JNcDhoRFBCZHFqQlZ4bFJYaTU4?=
 =?utf-8?B?eUtRejl3cWhFQno1b1doODZ1RXF3SGhlN2tzZzIvVldIVmFiMmxEaWFtVWx4?=
 =?utf-8?B?VnQyb21VM0YvTjZ6S21QREpSTlc0ZENYWWFpNHhUYXV0NVdMKzJQRTlCaFRx?=
 =?utf-8?B?eldVeVdWYno0LzhTSG03YzZRMVpPR3RoMSsxZGx4M2VLRi8zVmhOZFNMVjho?=
 =?utf-8?B?WElLdC9jT1p6eHEyMmc5ci9EMCtTL1pOT1pVYy9vOVV2NWlEbldLekNRc0xU?=
 =?utf-8?B?aDAxUThwaFhHQzN3QTdPM3lOR3hlai8vRG1MRTVUemg5ZThxeHlEeWFWamxE?=
 =?utf-8?B?eUZVSFdKUi9ubE5EbTM0b1NubzJLWHAzV25PblJIUE1QUVJMRnFhbEhNd1d1?=
 =?utf-8?B?UUE4RGRiRHo4N0lWTTVKWEZsa0Zjb0g3b2o5c21Ebmw2OGpDUU1SUzU5OTJj?=
 =?utf-8?B?OU5ENkpDWFhqbDcwOFV6SFVzbGxDNlJKNkpIWlczeEd0YzU2eGNRZU1qei83?=
 =?utf-8?B?d29xUXN3dUYyUnVZMHFmTjR2VDJoREpESXcxMXJXTm1MUnkwYThSRnFpczdT?=
 =?utf-8?B?c2IwQzNUMXl6UXErN1Q0N3dxdCtNamlCN3ZrRkdPV1JLSUJXSWdwRWZjLzhz?=
 =?utf-8?B?QVdmQmNSQ25vRWtLb0hkVHlNTi9jUXl5RE1wcXAyMmtVdWNUczNLRkF3djRv?=
 =?utf-8?B?NkxQbjRnV0Vwc0lGM2N2MmJKTWFxYjhlUTFua0dyTWhvWVBJRXVCZ2R5ZS9w?=
 =?utf-8?B?c09NSWZ6NTJqOW4zS1A5NjEvQlJyRVJYQktWRWFUdC9ZY25qaW9Sc3JYNXV6?=
 =?utf-8?B?OWtndk5VTnF5aVo1V3I3R3BMeUVscGR5QXYzWEVKM2o5dUVxVjAxMCtLOE16?=
 =?utf-8?B?YnE4SzBjN1NDOUN3RU1SVXBFc0N0TWM1SjZqWkNQL1liQWs0N3gvZGxjOUFH?=
 =?utf-8?B?UGJSYmNJMzF5SDkzYnQ3MVJOUmJrbGZMdGdvUEEvYXZQOFRIRGlnMHVoYUNh?=
 =?utf-8?B?TmhtM1VWZGdabmxUQTBHYUdTK1JBNHp2UkJRVmF4Ymg4ek5wSEtBVzkwS04v?=
 =?utf-8?B?cWpIQ1MvTHIraWNnYXZIRFhLNjl6ODQ3dUhvUDdqTGRMZG9ZajB1bE1ocjl2?=
 =?utf-8?B?ZllhZmYzaHoyT2hnd2ZLaHhyTkdia0JjdUJqWDliWENSck5EMExRS2lHVmF1?=
 =?utf-8?B?N0h5TUMvU1dwNFk4TjVIdnZVdjMrSXJJSzB5SU5YaWt6OVA5QW9NNzRjYzNo?=
 =?utf-8?B?eGFiencyVTMxcElISVNKdE1FdmxoektmWUFkTWNxdDhqT0c4aEIvTWJwb3l4?=
 =?utf-8?B?K0V6SUozNHdDWDlodmJEbk5kNHY4dUx2U2pIbnNGakk1YTh3UDMvZ1IrUzZE?=
 =?utf-8?B?UzFXYkttY09iQTlvd2Z1NE1UaUNLUTZvQ2xjdXppTTl2Q3ErNVJIQnZnckFu?=
 =?utf-8?B?RWd5cXk1MEN0TnRDTkVlaFk0NXBTT0dpTExrUjM0eHh2UEVQdUhrRityOVV5?=
 =?utf-8?B?dWtYQ0pOZDZLL3ZXdzRubTVEbzFnY3d0M0V5NXhkQU92NVBLNmVRQS9lc3lW?=
 =?utf-8?B?dXZEVmcwRGN5bFpoZWozTU1KM0JwK3MraE5Cd2FmNC9RTkN2bm8rSVMyREgw?=
 =?utf-8?B?OWF6c2tvaHR5UlkrQ2hJUjlsREtPaVFkT2dpZlZPb3hlR2VYQkZ6RE9Lbmh3?=
 =?utf-8?B?SkozQXhncTU2b28xTFpQVFNiaVF4MXg4c1R3dVlaZ1JlSlUrTVd1SjNTaTNZ?=
 =?utf-8?B?ZWFnbmJVN0wxZnpzS2trd2pQRmEvL3QxMmJub3kwd2p6b0k0QVVFR1I2UVY5?=
 =?utf-8?B?bTZ5UGxEMzFYUkxJVHg4eWNzL1U2NXpCNThwQ1lPU0xmU0o5ZnR1Q0UzbzlY?=
 =?utf-8?Q?W/GjRci0m64KkWm9xv/fzPoxdlUdNwp0A6f3pFZnUJr8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b060116e-7d86-49e1-5286-08ddaf34c780
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 13:25:37.7838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sO/hOcWjqFioT5GWCJbt4qVuQDjMYNK/ivDu4rqn8rqxRPUZKihWL7NsJGBvg96mkGZHm3j/so1ohy0J5xAnxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

Some of the firmwares need to be patched at load-time with a signature.
Add a couple of types and traits that sub-modules can use to implement
this behavior, while ensuring that the correct kind of signature is
applied to the firmware.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 64 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index e5583925cb3b4353b521c68175f8cf0c2d6ce830..32553b5142d6623bdaaa9d480fbff11069198606 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -3,11 +3,15 @@
 //! Contains structures and functions dedicated to the parsing, building and patching of firmwares
 //! to be loaded into a given execution unit.
 
+use core::marker::PhantomData;
+
 use kernel::device;
 use kernel::firmware;
 use kernel::prelude::*;
 use kernel::str::CString;
 
+use crate::dma::DmaObject;
+use crate::falcon::FalconFirmware;
 use crate::gpu;
 use crate::gpu::Chipset;
 
@@ -84,6 +88,66 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// Trait implemented by types defining the signed state of a firmware.
+trait SignedState {}
+
+/// Type indicating that the firmware must be signed before it can be used.
+struct Unsigned;
+impl SignedState for Unsigned {}
+
+/// Type indicating that the firmware is signed and ready to be loaded.
+struct Signed;
+impl SignedState for Signed {}
+
+/// A [`DmaObject`] containing a specific microcode ready to be loaded into a falcon.
+///
+/// This is module-local and meant for sub-modules to use internally.
+///
+/// After construction, a firmware is [`Unsigned`], and must generally be patched with a signature
+/// before it can be loaded (with an exception for development hardware). The
+/// [`Self::patch_signature`] and [`Self::no_patch_signature`] methods are used to transition the
+/// firmware to its [`Signed`] state.
+struct FirmwareDmaObject<F: FalconFirmware, S: SignedState>(DmaObject, PhantomData<(F, S)>);
+
+/// Trait for signatures to be patched directly into a given firmware.
+///
+/// This is module-local and meant for sub-modules to use internally.
+trait FirmwareSignature<F: FalconFirmware>: AsRef<[u8]> {}
+
+#[expect(unused)]
+impl<F: FalconFirmware> FirmwareDmaObject<F, Unsigned> {
+    /// Patches the firmware at offset `sig_base_img` with `signature`.
+    fn patch_signature<S: FirmwareSignature<F>>(
+        mut self,
+        signature: &S,
+        sig_base_img: usize,
+    ) -> Result<FirmwareDmaObject<F, Signed>> {
+        let signature_bytes = signature.as_ref();
+        if sig_base_img + signature_bytes.len() > self.0.size() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: we are the only user of this object, so there cannot be any race.
+        let dst = unsafe { self.0.start_ptr_mut().add(sig_base_img) };
+
+        // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
+        unsafe {
+            core::ptr::copy_nonoverlapping(signature_bytes.as_ptr(), dst, signature_bytes.len())
+        };
+
+        Ok(FirmwareDmaObject(self.0, PhantomData))
+    }
+
+    /// Mark the firmware as signed without patching it.
+    ///
+    /// This method is used to explicitly confirm that we do not need to sign the firmware, while
+    /// allowing us to continue as if it was. This is typically only needed for development
+    /// hardware.
+    fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
+        FirmwareDmaObject(self.0, PhantomData)
+    }
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {

-- 
2.49.0

