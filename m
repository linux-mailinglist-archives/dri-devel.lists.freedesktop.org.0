Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D3BE5410
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 21:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C03510EA77;
	Thu, 16 Oct 2025 19:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EmZ8Jb85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B6110EA76;
 Thu, 16 Oct 2025 19:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9QX/dQHMitV/CWDsI5PEm+qdDhv0DzHDligpVJpSy/DQx3iE48hTVsRDFXCN2MAhqsYkzUDRDHRowWiw2GGDRrt1SQWcfnmBCZ7YsV6kOcdlj7Il45epL+WVQ6Jdh+sW3yyQLkcXHLDpMkc8p/nLZE7e00A6dPgLHYZF4QIp2foCGoqFzNOhNC4yysXUzAn/kL07ZDaef7rR2qn1Wry5F7n+dkVTT4prNGYoZpFzgl3DzDPshjsBTfv05C2QDJ2/MAQO/vYhXdTKf83cN7vIlbrAeYg2eKICxxabqgDiJDV+QIoFAvZp0Yj9S7fBs/alStTgSuYiX1PzTfaZ4LZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1EjXqD2//rrU+155vuVS4Y+g/QvJQY0AfjSmziVFJdo=;
 b=ULUsRhbse/TsG3HR4sOYNhjouDsPapH7GOSGj8RQHqsICH7IOQnWghpqz+ZI+xE7scGgoNhPfIWHARHYpXaG17W7nvA1dYSVQgaIKxgD5Xbe2393e1rSEFUU22nHVam9/B8Y7jxAeeYcSylorrGwRd6w9Vq1yRttyut5HuGvTPqruxOfdS9as3mpkBJNLjF260ZDjFTcxO6ZEurSYcCQWgY1cM7jLT6K6Uab3i6J5LY/CbCgkmbaRitkxU/dg/gHaOhatPvcj6AQkOxnnBFZJq8DcrilbSpARBwbvb2dZOC6EMVDPfwJgoi97SQ1vHIHMk3HS+p237XwwyTjLcLwZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EjXqD2//rrU+155vuVS4Y+g/QvJQY0AfjSmziVFJdo=;
 b=EmZ8Jb853m44qKmAsp6Avqcn6yMj1hrOt81gEEBJfqI8BJcup23UQWISaI3p4YENU7t44XFqtevU2wF2N3KU1svKfHz5wbIneGqknW3e37jcG3LvYHgCfqs3aJjscaXpc4i7/xCHfnCLplFVoWKnQJokou6voGufo37yYYKO0H9dmA8ibWzvwQuRO4/iqIudf//WhcUblFdmJY8tG7i7+YWtxNq+IaiXD1x4oVM5m/NZ0dPiI0ceqzg3/CCCWVBTt6EW7qQ3kj3xv/6/YBlJBlhZkJJXd1KcSFL+zfAtSMiel8K1DyXIdtox5nXjry/lxpqYVCI3ryDpzs1tqhGLZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 19:39:42 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 19:39:41 +0000
Message-ID: <e4f5ca12-bf67-4b48-97a1-7ab2c771056e@nvidia.com>
Date: Thu, 16 Oct 2025 12:39:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7.1 2/4] gpu: nova-core: bitfield: Move bitfield-specific
 code from register! into new macro
To: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Edwin Peer <epeer@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
 <20251016151323.1201196-3-joelagnelf@nvidia.com> <aPEv_UO4vViOcOvN@yury>
 <2CF462DB-D2C8-473F-9D70-522E6AFEDCE4@nvidia.com>
 <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDJZY40SO5EF.2066SEKKQ4U8I@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::12) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 593bd447-8c28-4d72-a9ce-08de0cebc047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1VTZHBsaTlSNS9OblRJcVk3eTJad2Z2aElXbkNzenA4NlNScmRWYXY4Z3Yy?=
 =?utf-8?B?aldiYlJvWUxkUXJUaWRkVjFTTjNIVVZGUUVuTTAxZnB5R3padldJOUhzM2ZF?=
 =?utf-8?B?ZjFsOFFQVnFWUXZjeTJreWROSVBiS1B1Rk12MVFsM1VIdkFoWGhEbEJUc0xs?=
 =?utf-8?B?SkpPOGRBQnFRZDlqT1l3Z1p4TDYrSytWbzlNRHpYbGtuOFgrVWUxeHBjQ0Zq?=
 =?utf-8?B?Q0FKcGwyMHJHY1I4c3QxWEVzT0J6WWZZN253aTdkMklWSlpRenB6aXN6bXFT?=
 =?utf-8?B?OEptUW96OWorNHVvSGFSQ2djR2ZwTTZsOEJhWHVYSGxVckVwMUJQSDlHS2Fj?=
 =?utf-8?B?Z1hVYUV6MlE3dDYzLzNxKzdjMTdCdmljZ0JuQmdnUkp0TSsxOUJuTTZheW1l?=
 =?utf-8?B?RGVuVnRXOFZzV2o1RVE0aGkvNUxyZFZQdGN4UzMzKzJINUVhMDN5Z1gxNWNh?=
 =?utf-8?B?NDhuN3doWGFuK3hISjVkdHN3aWE0YkVCVjg0TTFrT2RMVnl1RG1UTUNIQ2l5?=
 =?utf-8?B?M0JpMVFWc0hWU2swZDBJYzVUdyt2c09hQkR4em4rWktJVkk0dzhEeU00cUl2?=
 =?utf-8?B?eGx6b081V1ptUXZhMUtzNS90K0poU0NoczQwTWFudGdJc3RWV3orTDkxdGts?=
 =?utf-8?B?aGRjUU85dkk4aDNpblNvdVZqR0kyakRwNG5teGtuTEpHUlFBMWU2Nk9vSjJH?=
 =?utf-8?B?cjBrY1ZRUkd4M29FbFpKNmtxMEdhVXNDdkk1V2xxM0k3bzl6clVQbmNMZ3kv?=
 =?utf-8?B?dGEyQ1dkSVFKQTJFeGpSanl2MFp1MFFrT0xRRlAzVXZpVlpoRm1oVlBzbU5H?=
 =?utf-8?B?eUgramhzV3kxZ0NUUlhQcE41V0k1SldCaWRZUDUwRW5qenN2eHgvQ1E2WTd0?=
 =?utf-8?B?ZTdqMlVraXEvM0x4LzNUOUcxaGd1NDVuOWpCbDdGY2NiMnJsVDlHNUNISWhz?=
 =?utf-8?B?ZlV1Si9STkRNZll5dTJITE92N2Y3M1pSdG1sdkl5TmJ5TFBuaGZINWpHZzhh?=
 =?utf-8?B?aDFpK3AyaWVOZkhUL2dVdnZLdEJDak9udVlkNkF2MncwRmRNdXBxb3lSRy9R?=
 =?utf-8?B?QmxkejNLVlhpMEcrNDMvYU9ybXpubHZodGw0eWQram15bFcxb0lBTFZIdHQ0?=
 =?utf-8?B?MDRDUmpxWVdpZ3MxMlU3eEh1RGFDV0lGMjRmd2t4b2Q2YURZcExCVng2enFt?=
 =?utf-8?B?L2M5UENBSzdFMFYwSkhnbytRUXBUWmlMeUpWZ2JjWkhuclVNclMybkMrNnRO?=
 =?utf-8?B?M1Q2Q3ZBa0Q3ZFpVTHlSL3Z2M2ZQM0xucHk3b3FRcXNDRkozSXpJMDhLT0hQ?=
 =?utf-8?B?bkVBT01PK004TkROci9mTU1nUGR0MHdZQmlhN1RScnAyVGs3TlpCb1dkQkcv?=
 =?utf-8?B?akl6VVVaTDlpQ1RGc2NBL2dpVjZpWEh3WmxrdVlpTlZkTEJ3TUQ3RTlMek1u?=
 =?utf-8?B?MkhKc1NGL1I1Z0VUNWk4WFFVV1lXY2ExdUlubytJT1dpVStTMnEwUUc3ZjBP?=
 =?utf-8?B?UHE3RWtWSU1vT0VuUEE5REJ3eHlKL2NrQlJiSVlsdG5ybnhwSTBJRDZlWHdP?=
 =?utf-8?B?UGQvK2o2MzBtYVpyRzdwUi9NTDZjTkNMUzlHMUtaTzlRdW1PLzZ5SHVGek0y?=
 =?utf-8?B?U2svUEQxY2Z5Rzc1OUxvZVhINmNxeG5yQ3hETDY5TUZRdFBwdUZocjl4NHY5?=
 =?utf-8?B?aGJJa2cxZWpkVmMwUE4ydzRJdkZRN0o0Sk5MTUJvaGI5bFJOelo5RGJoZzI3?=
 =?utf-8?B?Nk5YaHlzVFcwd0RGUnkwMmJvZWhKeFhNY3BwNEd0UVQraHc0ZUV2MWgzaEd5?=
 =?utf-8?B?c3dxODJzRHd5alVXOVNVSHNLanJ3Wk5JU2pUbS9wV0s0aGQyRHN6b25QVmlN?=
 =?utf-8?B?MExiam4zVENjL3VzQ1dVa2lpV3YvV1g4NHZFK0Z4VVBMbjBudXRKZmFpc2My?=
 =?utf-8?Q?r9iC1G1VIHPOIzFuZbpsxS6xNSkDEoW0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGJWdUhHTmgwbThsWTBrd2JlZERURzdwWTJQMytaY2RrajRueHlTdVBia2Ux?=
 =?utf-8?B?amRqZW1NL3pLLzY2cERQZC9sV3JqSWZWZmYvdGhwV29yaktvV29QUmx5WlQv?=
 =?utf-8?B?VVRFZm5SMXA3OERKd1crb09zQVNQcURoa0lCZTNpTlVJb3VlUTJJSTNOVjN2?=
 =?utf-8?B?anBTUEh2aS8wdjQ1Y2dMTzZLMnJLRFFoRWNYVkhCVmd1bTcvcktiQy8ya00x?=
 =?utf-8?B?MGY3V2lSYUpxaGFQMkhLQ2U2RnduWXFyU3VtYytYZnRPVkFtdndGa3RsNyt2?=
 =?utf-8?B?K1VDMTlzdWRFd2JmTzcwTzdLd0NxbUw1dkZjU0IwMTB6dFBRM2ZiMnozTEdM?=
 =?utf-8?B?dGpvSlBSUUZRbGFZcEcyNzRIRThYSVV3RUdJWitOZTRaVmpDQVNBblNSdW5T?=
 =?utf-8?B?b1ZQUFRsSWJsM1pDalp5eU5nZDljREMrcGtOWEh5TmhXYVlBaWVBOXo3cEdj?=
 =?utf-8?B?L1oxMytKajNUSWo2THkwTlFRQWV3WXZkUVhGd1ROdktJc0hqeFhpTW5BcitS?=
 =?utf-8?B?WkFQSDFjYWNQY1NmOGZHVUY4OTFyRDdJZEE4QVVMRFpVckpCTUFSVENLQVlR?=
 =?utf-8?B?ckRMazh2MXFQdlNFUGJzTHl6TGc1YUQ4ZGpwUlpCY2VlcjM5K0lrdkVXOXlS?=
 =?utf-8?B?VVQ0YVFsc2JBZW5tSXNPRmM1UlljeWxQS0lKSjNET3dzQXpLcFdqeXprVE9p?=
 =?utf-8?B?Sk9JQk96L1VsNmZTTytsSTRmKy96KzNRc051cVVsRFJXUTdqZEhjUE5abkgw?=
 =?utf-8?B?V25mYU9lVVNTMnc4ZlkvT2VCVHUvM0tXZlFERHFWenlBekY2L0lUeDJMbi81?=
 =?utf-8?B?WTNnb3N2WlhtOG5HM2twbElIc29BNnJFeDV3TXpOZ3pqR2pLRSt2VFFXL25P?=
 =?utf-8?B?Kzd3akhNS1BxeUMwUkdYN2JWdnJYdWQ5VnJJWnV1RWU4TjhvOS9Xa1FiQ3hQ?=
 =?utf-8?B?eGh5NklpQUd0emtYeUhlL0szUnpsZ2w3WnJ5TE1NbXNQMnZaQXM1LytWbm9j?=
 =?utf-8?B?dTE2MmxxUHZ0T1FpTUJkeUpEa0c0ZU5aeXNhSTc5TlRqSkpsdENvVFJrV0pj?=
 =?utf-8?B?amwzVVo1R0FFNmZhYmdMTmkwSWU5N3VkYmNVSWNIK3VRbU4vMTZGT0FDckhy?=
 =?utf-8?B?ZWxlUDVhc3ZsSkR3Rm1lb2k0RHd1eVJVUWNZQWUxRUpGQjdRN213K3lDaVhP?=
 =?utf-8?B?VzJZVjVvWmRmVTFNc1poeENycjBTdWNvQUw4WmJURndJOUkwNG95MlpqTFBz?=
 =?utf-8?B?VXd3MzZ3REpkK1Z4R2xqaUExWjJkZlpSTytwNUkyZ2UwN0IyUERsemQvbWtD?=
 =?utf-8?B?ZUtGTGVVdSs3U2FhcnZJamM2bG5ZdWx4aUkzSnV2SXRpRFFjb29xN1hYQklR?=
 =?utf-8?B?ZTYxTUF5eDlwT2I2aGxvWEdoeElwSHBvM2I1dWN5Zk5iK2FYNzBQaTJRZlFQ?=
 =?utf-8?B?NTlkcTFaUENOOW5Cd3pQeE1VVnR6a3d5OUZpNytRNHkzaXgvbFRVWEYrWUd2?=
 =?utf-8?B?WWRsOUEwTGFMNUhiYzlzRlB1OVVlYnBsWjR3Nzh3WnR1UEE3YXNYcUV2a0JF?=
 =?utf-8?B?amdpVXFLRUZibENtVVlRMkZGd3FkZllRTkxyVWhlNGkyODFHVVRHVXJqMlJP?=
 =?utf-8?B?aTI4YWdhMkRyTmZVQ2ZLcTRnWDV5N3JWZkYwTUdFblZtRG85MzdWMnRzVEdt?=
 =?utf-8?B?Z0Fob2dhSVF3cjhvblYzcUhhczlZYWFBM2FpZHI2THBld3MreW9UMFlxYmNK?=
 =?utf-8?B?ZHpISjNCWk53cGdhK2lxYmMzZzhVYUVGc204RFpGMjlZL1puME5VNjB2aHkw?=
 =?utf-8?B?cEV5N2lnVUwwM3NNMTFjV3EzeEhjL2tkT1FtamNXQ2ltZzBqTCs0L2RJaHZH?=
 =?utf-8?B?dWNiRlJHeFlsb1JJRzJjRytEY0s5a0Zya2EyTzNaUTg2cHNNbjltWkkraGx2?=
 =?utf-8?B?RzR3cmdURkNCUkV4dG03c05NOXphZ1BZWk85c2NmTFM4TTluMC9iNTBqL3VP?=
 =?utf-8?B?YnF4NCtKdUZQOWF6RGN6TmRJL0VsVjA5eVA3SUk0UlFHT0JBdEtZRXk1K0xt?=
 =?utf-8?B?TnBBYmZ2LzlqUStxTnBQay9yR3lEZU9tOWJDdCtiaUdPQTlpYkFiZnhMNTdI?=
 =?utf-8?Q?Zm/rgdD2NBu41Rf0ShZqiOuCG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 593bd447-8c28-4d72-a9ce-08de0cebc047
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:39:41.7932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NyN684rz1Da94GurQUcqfKcpkc4SkYJ+LNAIbUmFOmkGmM8ncopA9NxW+29ekPbiSPFwEFDTiTb26X1XidpHDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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

On 10/16/25 12:34 PM, Danilo Krummrich wrote:
> On Thu Oct 16, 2025 at 9:28 PM CEST, Joel Fernandes wrote:
>>> On Oct 16, 2025, at 1:48 PM, Yury Norov <yury.norov@gmail.com> wrote:
>>> ﻿On Thu, Oct 16, 2025 at 11:13:21AM -0400, Joel Fernandes wrote:
...
> While I'm not super opinionated for general bitfields, for the register!()
> infrastructure I very much prefer the hi:lo notation, as this is the common
> notation in datasheets and TRMs.
> 
> However, if we use hi:lo, we should use it decending, i.e.:
> 

Sure, descending works.

> 	bitfield! {
> 	    struct ControlReg {
> 	        7:5 state as u8 => State;
> 	        3:0 mode as u8 ?=> Mode;

And hi:lo matches our HW reference manuals. And if you're dealing
with bitfields, you are often also dealing with HW, so this is
a reasonable place in the SW to use hi:lo.

Looks good to me.


thanks,
-- 
John Hubbard

