Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA26ABEC39
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5510E673;
	Wed, 21 May 2025 06:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ec2q34//";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3605E10E65A;
 Wed, 21 May 2025 06:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8cn7+/sQJiqtyjg4G1iiTkkt1/elpw4KJOyfOP3oqpyPtEbXK8fr63wD9exIsLgO1hv+RVZGAhx7nPROKIOm7mi4eFMk7MEnpla24B+S9SmUywFUuPYX4e5TwRB8e6IiyWK3BhE1+6MqggjjY/2QWKiU1+UY+R0vUJGgzxoG6Euv2zXn3jT36hUOQZWdcu0c92t2LsRmvJ/M7mfKkju8Suuy9cI13vHXWuEdwwU073wHZkiOuy+2Z9gToVkVPEG1MxKHRqJJNxO5s5KWdt0pyTOkMePDCVAmF9TkxNTGj3X2P3MhZYCuADoBJ3LNvkQg5Q0GPbg4HfRmAk5XcWiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ctf1ay+nycLgSG0dnZZ3FWl0RrOnGEyT2tAmm18TL4=;
 b=ytZSDEkKVMsdsRcJre3fDfkU1vF6XfbQN1SZNigbjYXjlIXtyC+J2IUrp60hLUlLXpwsQ0WTTARL50sqhbqyEtj84LQY4Xu1YFT4WgiKL7rPsTz152hXph7IzUqjldUVx6iRyrJbCJ0ltjIQ62elGia6QpWEeti4i+eFye34+vK7hwSqiCuB2x0ReNRhMoTR7M5CpiCZqgEibvP13b1Ua1VAaUMAVVrHybLGDhvHq8ren1JODTENIcSYenlSGqNNCzKVzCqwo54VKanXCrdS3heGczlOxFHMYY1VGJWDq5OPVN/w9F69c35V8S6RCV0CKOg+JvWmdtPowSQFQ9tyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ctf1ay+nycLgSG0dnZZ3FWl0RrOnGEyT2tAmm18TL4=;
 b=Ec2q34//3n1oF1MiKhW2idAL7nLDOB0is0QbBEI4Eg9zGhq1Q2d3GRo98jjhD7onEtP2xp0llZ4Tp4it7hmk14X/uJNNU9qK6mpmDFuHLwD+9WDZhlVLYTcHI4gQpzn9Gd8pv3fPMzHDihJQc/60iiu5LDtPff4l6GITidNPABrRu/QNTRVABEJQ+Xny6XeZ5bFNiy/1iYO7lKLBbzc2hO+QVPwjo/qjwCNxmt2TRSd06t1GefEFYpudJCn7ji8v9KmDU1MZly9WVl1erxLnYzfOVMT2kSx5il9iarCO422N76tRMuwlm7IoRKzcchTDPtx6ZzaHYcHXhIFQDEPRsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:54 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:09 +0900
Subject: [PATCH v4 14/20] gpu: nova-core: add falcon register definitions
 and base code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-14-05dfd4f39479@nvidia.com>
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
X-ClientProxiedBy: TY1PR01CA0202.jpnprd01.prod.outlook.com (2603:1096:403::32)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ad4918-03af-4fd1-31aa-08dd98332211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWUxald1c2t3bFJlOXZFNU1vVytEY2crY3VkWERRRDVXQmxWUGdCVlVaMTJt?=
 =?utf-8?B?Uk5IQVV2QnZvYzU0ZktmY1JjdzZUNUxXV2lUV3d3bGltSzJ6V2x6dTlMR0Zn?=
 =?utf-8?B?TEhsV2hlRXJ1MWhFNjlQK1duOGgwRm5IcWVCWkJ4N3NiVkZiSVBxaXpXYS81?=
 =?utf-8?B?T1VEdjNTSjFwYVJsQldRTXFmaTNucWFwb2MvcThPRWx1UEFzWlpQclk2K2tX?=
 =?utf-8?B?R3ZBbUN2cTNBQUZMdVlwRlF5VkxTdUlQQm5aRWJFc2VwdUJJc0dlZ0U3WjBG?=
 =?utf-8?B?R3BackRPSWZvc29EYVNWY2NCWEtWcUZSbG5TRysxczlHbmRpU1ZuR2Y0TDlq?=
 =?utf-8?B?OCtYOWVjbWl4NnlWcXU5K2tUNlNLaXJLL2dOL2hacDVIYXVIM3A5dnAvU1Bt?=
 =?utf-8?B?TFRXV1h5ZkhYZDE4WjcxM3dTSlAxM2tDMmlmeWhQOEFBV3g4MmhFM0VVRUNl?=
 =?utf-8?B?QVBCT1drZzFRakFVZENRY2lMZldJanBKY08wYkRBRVpTNzZ3cFJRdkdUc3Ra?=
 =?utf-8?B?ZGRiOFV6SjNTdENMZDZ0Uy9yMDlpTG12ZXM2ekF5aTVac2c4Wjk1NlRHcnJU?=
 =?utf-8?B?S0JVVU05WmlieVJYSEdpWE1VTEF2Zm9JQXQ0WWFOMDBqQTB3SFlMSUppTzdP?=
 =?utf-8?B?Y0JBK2dabFJsVXA5d2p4NWFhLzRWcEdxdXRIWW10QlVKcXUySWIweEVQZHVn?=
 =?utf-8?B?NW1kV3kzMHZDZ1FRUVlnSFNCRkJ2U2s1SXFiL0tGblFBUXNpbXpIQUJOVG14?=
 =?utf-8?B?Z1JZaUlRY0taQTk5ckQyWXA3aWZnRTRaU3BHdnFHMTZoYlNySUdINEx5c2Jm?=
 =?utf-8?B?My9WcUUxTVJ5WDh5Q2NuMy92VlRaQS9CTG5WYWlSdGNFbjJXNVNyenFGY2xa?=
 =?utf-8?B?aFdmMm9NTUZzUEdvSWxvdjlUT01ZSG5HYndrL3JCVmhFbzJZWXhaL2xMQnNQ?=
 =?utf-8?B?b3JIT2s4M0pmMVZZOEVwQ3g5Z3JoMXJnTGtiMkpobTdPanVrYVJ0aUg4RDV5?=
 =?utf-8?B?TWFGcmorTjI3VkxFdkUvVTVnQWhGOE1KbnVUQUJScXpkeTJkenhnUHNMNVQ4?=
 =?utf-8?B?cGlENWRyUTFEby8vR2JZMVRiV2dyU3hJd3ovYTNETU9LVGRFWHFvMXdIWDZQ?=
 =?utf-8?B?MVBuU3pUM2lmbDR1RkppK1V5RkpmS1VHSlN2Q25mVzBaR2RPY282WDk3RHg1?=
 =?utf-8?B?eENhbkVkbURKa1h1ZmgzT0ErS0hwK2NxSzFxODR0WHlWUGZVUGt2Qm1ncFRJ?=
 =?utf-8?B?U3pEUTFoVnNiZFJiOE4rYTU5eVZzdm8xSVZMaEZzeDhSRk1kQWx0UWpmVksr?=
 =?utf-8?B?bWhnQWJrRXBJdjB1THk4NGxkaklPdDRZNElqVmNkQXNiUjhsTHJYcDNhUC9v?=
 =?utf-8?B?emJqOUpkdC96ZWVIM0tKUWEwWk9YQ3I5blRvQTBObExsbW9HcC9MK2FzQnRO?=
 =?utf-8?B?QUJRQUtFRWFBVGhnaUhndGRPNFdoeTZUNndBeFVPeG5nckdUbTdkZmErT2RW?=
 =?utf-8?B?Wko5dWIrT25YUnVHemNGUVk5bGVSVEUzYkthdTlYQmNsM0FaQXVOWXk5Ung1?=
 =?utf-8?B?QmdHNDU3TE5JS0syWHhEOG5EUDJ4azYwdEhScU9YbnNHZ3d6UWM2bS9abjZu?=
 =?utf-8?B?NFpmVFYvSkh0WmZHckw2cFIzOHFRTHB0WEhEMk1ZS3lnQk0rQjRxZTdqVHpM?=
 =?utf-8?B?cngxV0tpR2hLK2JOaGptajRzR0Y4UzZtOExOcHBUemxuZkFyakdkSG81ME1B?=
 =?utf-8?B?Q0psbmowaHNlaHo2OFJ6OGhiQnpYdGlvdms4ek1qcVlSZnBtTHZQdHpjWFlK?=
 =?utf-8?B?Tzh2UkVwNkVIWk5DaW4vS3p5UDNJRE5Xc1plN29BZjZuNTZ2UlV0dEtjcVpH?=
 =?utf-8?B?VnlSVnNqWlhZaEMyUGV6bm9iNXVVcXVRazlzQ2Y2MHFCZUFsbGdTejIva085?=
 =?utf-8?B?Q0tjdVRaRmZ0MDMvU244Mmk2U2RHWlV5MjMyV3hUckFaZmp6K2tIaHRRRUlW?=
 =?utf-8?B?R2huWkhxQ3dBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm5QTGo2RXcyRStTYjV0Rk9CMUhjRVhFVU9HS0JRQXprS3N3Z2xQUnluMWlk?=
 =?utf-8?B?RlRleE9JZVdNWUdmL0drKzAxNUh1N2Q0RitwdlNwWnI1VWVqYjU4R0V5MGp2?=
 =?utf-8?B?cStkYjd0VklYclZUU1BoR2UwNVpZTFVxMk1DZ1hBMXBUb1l1Q2l2bzRlYU14?=
 =?utf-8?B?WERSWVFySnlMZk9jSVl4dkxzc2NnWlFmMXk0dFdwdEFaMGY3SU55Zm0veE1B?=
 =?utf-8?B?SVA3SDFwTGtUTDZoVEE3ZUJjU3k3K0JTWWIzWjNDTVFwUWo0SS9Bb0hUVC9K?=
 =?utf-8?B?dllCT29XMWhzbTc0RFlHai9UUVpSN2R4VkVMb0M2UzROUU1OY01OSkN2bHJJ?=
 =?utf-8?B?cVZOaWR4ckZaMDdxQmdOcWcvYXpNWkc3Lzh4TysxaUsveUpkUnlSeVFVWWpw?=
 =?utf-8?B?N3pwYmwyaThucktKZWFTUElIb0hPN215SllRb0NjdXZtaVNEY2duU3VXMmNB?=
 =?utf-8?B?ZGJQc0pkajdCUGJ0cDVGdFJOUEw0WnVuRmI5SEV1cjNKcXpGRkdmNnJqUDF3?=
 =?utf-8?B?WXZ0dEltbHpKWVBJeTlEamJyejUyQ2w3MlJkRG9nMWtOY0lNcThRS2VqSzFU?=
 =?utf-8?B?ZEZjbHJobHU5ZWcycFYweHA4aUNvV0VEME5WU3BzcFZpV0lDNHpqY3F2ZUF2?=
 =?utf-8?B?SWcxQmh0NHZ6eGJNM3hPOWhvaDBTaWd0LzJMaFZNVVkrbnpoV2dzUytMcG1T?=
 =?utf-8?B?WWxQZkNSQzdOcFNmb0ErMXpnQk40KzRiU1plT3VwTG9seTlQbGdaa0wrUFlV?=
 =?utf-8?B?VTF2TkpXaEhSSWlwa1BQU0pQTzVqdjhGUlBnWGUvZjR2SkhUSjE1M2tuNDRO?=
 =?utf-8?B?dmFKbTErdzFHaFVZSFZKb01qNEJ6SGNJUWx6dEFnNTFRWFZqWVNlb1R2N3Fy?=
 =?utf-8?B?dkpvL3BHejZqMFhzZ3d5d09aS1FMMXVnVnBqdmJkTEhIR3VzeDYzN0RsTUZo?=
 =?utf-8?B?YmUxWjBMSzBVSkdjYmttR2hjb0JNTC90TUNJZ3h2NlFaSnF5Z1hsYjZ5eGhS?=
 =?utf-8?B?eDRoTWdoV3NNQ25mNEJQSVUycWwxZjQvbnI1VXBDbVU2RWJLK09JSEl0N3ZU?=
 =?utf-8?B?bzV5eHVSclczS0VqMjBuMlpmd3oyVUU5NmNaNjdRWVh5TTZhZ1FWd2t3bEIr?=
 =?utf-8?B?cklVaFc1MGdPMlplQVpDVFVuK05DaklQUG9UbXlqcFNuOUdhYmlMQWZ5YnJ1?=
 =?utf-8?B?Nm9UL3BWMEdITFZyYlZyVmxYRWJnN2xmKzRlTjFHUVZxYkhPK0EzbERYaGtI?=
 =?utf-8?B?TStGN1M4bXhuVkxBZU5LWWN3N3JtQkpVNXV3akpsaHNSZ1dDQm1CeVl0QVVh?=
 =?utf-8?B?QVpPRmlJRHcvRHNwUWtzR0FyeUx1Qmx0VGh6M2Q0SlZTZWJpVEZscHBUNjFh?=
 =?utf-8?B?Y3ZqLzJ1emR6R05jLzZRSTMyMlFsSWsvU3dzUGpYSmN2UGxBcGpYU1dIbjkr?=
 =?utf-8?B?WGZydTloWmxwcTBXaGF2ODNHYjd6YTQ2V1RHYU1nU1FIME9Ra0lMajFjdjAx?=
 =?utf-8?B?SThnU2VhckF5VVlHL3dNNnBDUHQzWXZIRHZjWFdmNEp5dkgxSkZFWHdTL0xW?=
 =?utf-8?B?YTZ0MVZnYXhmWHYxVUttMWhUVXlmeENOSWI1bFY2SkZwaHlGT0sxTS85cXlG?=
 =?utf-8?B?aXJDazNoaUJ0QkJwWVJhNENLSHdOTXJ1TEVjMW1WVEs0NXVVaXV1NW9MWkhD?=
 =?utf-8?B?YnRIc1ZDakRwSU5vbmpJeGRod1lPb1VNeGlOYm1OVERNME10QVVpWUQ2YWpN?=
 =?utf-8?B?ODUvUWhUQU9HTFB6d0padDlmU3JSZmJ1OExST0Y3KzN4UzJKc01qMzMzYnJk?=
 =?utf-8?B?bHIvUmRHemVnbFBhZjdOWUVtd0JPWjVGbVZzTFlsT0prR3B4RTk5R3JDWEZ3?=
 =?utf-8?B?UDg2ZDdMeFJ6NGJNckI0LzZKRG9BeUc1VjljZU5xSFhKQ1JYa3FwdXZMUzJo?=
 =?utf-8?B?cEJmVGo2K244M25CSUlYVGdNd3p4b3JONmdxaWZ2MHpjTWJsWS9odTZlSjIy?=
 =?utf-8?B?QmJLZUFxUmIxU1kxNk9UcjAwZ2NiY0FydUtCSVNRWjJHQ2FlL3laZTdGT1Vo?=
 =?utf-8?B?V0xwV1UwNnlzSlIwOHlXUzRHQllBRGZwL21LZEl2L2p5WTlxSXVFMHp0cjRB?=
 =?utf-8?B?V29qZkNLYnU4M0ZWUFVZcXh4Q1dzaHVwejk5NEVrKzE0RlpXRU11bGdoVHd3?=
 =?utf-8?Q?c2TQboPT7KQxLwTvBJWijUfLvaHGagDG3WQ2NcQbbbs1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ad4918-03af-4fd1-31aa-08dd98332211
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:54.1589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g/8anTAu6Wj7UYIP/73/FAY1gee54E5oQArcBHdh5zVjM0Wvc0Z2eJTVq2KtLulPFFc1d3zDrFXffroWyurXwQ==
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

Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
GSP and SEC2 Falcons that will be required to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 560 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |  22 ++
 drivers/gpu/nova-core/falcon/hal.rs       |  60 ++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 122 +++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
 drivers/gpu/nova-core/gpu.rs              |  11 +
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/regs.rs             | 139 ++++++++
 8 files changed, 923 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f224ca881b72954d17fee87278ecc7a0ffac5322
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,560 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::ops::Deref;
+use core::time::Duration;
+use hal::FalconHal;
+use kernel::bindings;
+use kernel::device;
+use kernel::prelude::*;
+use kernel::sync::Arc;
+use kernel::types::ARef;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::util;
+
+pub(crate) mod gsp;
+mod hal;
+pub(crate) mod sec2;
+
+/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    #[default]
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u8> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+/// Revision subversion number of a falcon core, used in the
+/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    #[default]
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl TryFrom<u8> for FalconCoreRevSubversion {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconCoreRevSubversion::*;
+
+        let sub_version = match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sub_version)
+    }
+}
+
+/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    /// Non-Secure: runs unsigned code without privileges.
+    #[default]
+    None = 0,
+    /// Low-Secure: runs code with some privileges. Can only be entered from `Heavy` mode, which
+    /// will typically validate the LS code through some signature.
+    Light = 2,
+    /// High-Secure: runs signed code with full privileges. Signature is validated by boot ROM.
+    Heavy = 3,
+}
+
+impl TryFrom<u8> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+/// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum FalconModSelAlgo {
+    /// RSA3K.
+    #[default]
+    Rsa3k = 1,
+}
+
+impl TryFrom<u8> for FalconModSelAlgo {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        match value {
+            1 => Ok(FalconModSelAlgo::Rsa3k),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum DmaTrfCmdSize {
+    /// 256 bytes transfer.
+    #[default]
+    Size256B = 0x6,
+}
+
+impl TryFrom<u8> for DmaTrfCmdSize {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        match value {
+            0x6 => Ok(Self::Size256B),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Currently active core on a dual falcon/riscv (Peregrine) controller.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PeregrineCoreSelect {
+    /// Falcon core is active.
+    Falcon = 0,
+    /// RISC-V core is active.
+    Riscv = 1,
+}
+
+impl From<bool> for PeregrineCoreSelect {
+    fn from(value: bool) -> Self {
+        match value {
+            false => PeregrineCoreSelect::Falcon,
+            true => PeregrineCoreSelect::Riscv,
+        }
+    }
+}
+
+/// Different types of memory present in a falcon core.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum FalconMem {
+    /// Instruction Memory.
+    Imem,
+    /// Data Memory.
+    Dmem,
+}
+
+/// Target/source of a DMA transfer to/from falcon memory.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifTarget {
+    /// VRAM.
+    #[default]
+    LocalFb = 0,
+    /// Coherent system memory.
+    CoherentSysmem = 1,
+    /// Non-coherent system memory.
+    NoncoherentSysmem = 2,
+}
+
+impl TryFrom<u8> for FalconFbifTarget {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        let res = match value {
+            0 => Self::LocalFb,
+            1 => Self::CoherentSysmem,
+            2 => Self::NoncoherentSysmem,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(res)
+    }
+}
+
+/// Type of memory addresses to use.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifMemType {
+    /// Virtual memory addresses.
+    #[default]
+    Virtual = 0,
+    /// Physical memory addresses.
+    Physical = 1,
+}
+
+/// Conversion from a single-bit register field.
+impl From<bool> for FalconFbifMemType {
+    fn from(value: bool) -> Self {
+        match value {
+            false => Self::Virtual,
+            true => Self::Physical,
+        }
+    }
+}
+
+/// Trait defining the parameters of a given Falcon instance.
+pub(crate) trait FalconEngine: Sync {
+    /// Base I/O address for the falcon, relative from which its registers are accessed.
+    const BASE: usize;
+}
+
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+#[derive(Debug)]
+pub(crate) struct FalconLoadTarget {
+    /// Offset from the start of the source object to copy from.
+    pub(crate) src_start: u32,
+    /// Offset from the start of the destination memory to copy into.
+    pub(crate) dst_start: u32,
+    /// Number of bytes to copy.
+    pub(crate) len: u32,
+}
+
+/// Parameters for the falcon boot ROM.
+#[derive(Debug)]
+pub(crate) struct FalconBromParams {
+    /// Offset in `DMEM`` of the firmware's signature.
+    pub(crate) pkc_data_offset: u32,
+    /// Mask of engines valid for this firmware.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+}
+
+/// Trait for providing load parameters of falcon firmwares.
+pub(crate) trait FalconLoadParams {
+    /// Returns the load parameters for `IMEM`.
+    fn imem_load_params(&self) -> FalconLoadTarget;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load_params(&self) -> FalconLoadTarget;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
+}
+
+/// Trait for a falcon firmware.
+///
+/// A falcon firmware can be loaded on a given engine, and is presented in the form of a DMA
+/// object.
+pub(crate) trait FalconFirmware: FalconLoadParams + Deref<Target = DmaObject> {
+    /// Engine on which this firmware is to be loaded.
+    type Target: FalconEngine;
+}
+
+/// Contains the base parameters common to all Falcon instances.
+pub(crate) struct Falcon<E: FalconEngine> {
+    hal: Arc<dyn FalconHal<E>>,
+    dev: ARef<device::Device>,
+}
+
+impl<E: FalconEngine + 'static> Falcon<E> {
+    /// Create a new falcon instance.
+    ///
+    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
+    /// controller.
+    pub(crate) fn new(
+        dev: &device::Device,
+        chipset: Chipset,
+        bar: &Bar0,
+        need_riscv: bool,
+    ) -> Result<Self> {
+        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, E::BASE);
+        // Check that the revision and security model contain valid values.
+        let _ = hwcfg1.core_rev()?;
+        let _ = hwcfg1.security_model()?;
+
+        if need_riscv {
+            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if !hwcfg2.riscv() {
+                dev_err!(
+                    dev,
+                    "riscv support requested on a controller that does not support it\n"
+                );
+                return Err(EINVAL);
+            }
+        }
+
+        Ok(Self {
+            hal: chipset.get_falcon_hal()?,
+            dev: dev.into(),
+        })
+    }
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        util::wait_on(Duration::from_millis(20), || {
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if r.mem_scrubbing() {
+                Some(())
+            } else {
+                None
+            }
+        })
+    }
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = util::wait_on(Duration::from_micros(150), || {
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            if r.reset_ready() {
+                Some(())
+            } else {
+                None
+            }
+        });
+
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
+
+        // TODO: replace with udelay() or equivalent once available.
+        let _: Result = util::wait_on(Duration::from_micros(10), || None);
+
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
+
+    /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
+    pub(crate) fn reset(&self, bar: &Bar0) -> Result {
+        self.reset_eng(bar)?;
+        self.hal.select_core(self, bar)?;
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        regs::NV_PFALCON_FALCON_RM::default()
+            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
+            .write(bar, E::BASE);
+
+        Ok(())
+    }
+
+    /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
+    /// `target_mem`.
+    ///
+    /// `sec` is set if the loaded firmware is expected to run in secure mode.
+    fn dma_wr(
+        &self,
+        bar: &Bar0,
+        dma_handle: bindings::dma_addr_t,
+        target_mem: FalconMem,
+        load_offsets: FalconLoadTarget,
+        sec: bool,
+    ) -> Result {
+        const DMA_LEN: u32 = 256;
+
+        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
+        // code addresses in the firmware (and the boot vector) are virtual.
+        //
+        // For DMEM we can fold the start offset into the DMA handle.
+        let (src_start, dma_start) = match target_mem {
+            FalconMem::Imem => (load_offsets.src_start, dma_handle),
+            FalconMem::Dmem => (
+                0,
+                dma_handle + load_offsets.src_start as bindings::dma_addr_t,
+            ),
+        };
+        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
+            dev_err!(
+                self.dev,
+                "DMA transfer start addresses must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+        if load_offsets.len % DMA_LEN > 0 {
+            dev_err!(
+                self.dev,
+                "DMA transfer length must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+
+        // Set up the base source DMA address.
+
+        regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+            .set_base((dma_start >> 8) as u32)
+            .write(bar, E::BASE);
+        regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+            .set_base((dma_start >> 40) as u16)
+            .write(bar, E::BASE);
+
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
+            .set_size(DmaTrfCmdSize::Size256B)
+            .set_imem(target_mem == FalconMem::Imem)
+            .set_sec(if sec { 1 } else { 0 });
+
+        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+            // Perform a transfer of size `DMA_LEN`.
+            regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
+                .set_offs(load_offsets.dst_start + pos)
+                .write(bar, E::BASE);
+            regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
+                .set_offs(src_start + pos)
+                .write(bar, E::BASE);
+            cmd.write(bar, E::BASE);
+
+            // Wait for the transfer to complete.
+            util::wait_on(Duration::from_millis(2000), || {
+                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
+                if r.idle() {
+                    Some(())
+                } else {
+                    None
+                }
+            })?;
+        }
+
+        Ok(())
+    }
+
+    /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
+        let dma_handle = fw.dma_handle();
+
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
+            v.set_target(FalconFbifTarget::CoherentSysmem)
+                .set_mem_type(FalconFbifMemType::Physical)
+        });
+
+        self.dma_wr(
+            bar,
+            dma_handle,
+            FalconMem::Imem,
+            fw.imem_load_params(),
+            true,
+        )?;
+        self.dma_wr(
+            bar,
+            dma_handle,
+            FalconMem::Dmem,
+            fw.dmem_load_params(),
+            true,
+        )?;
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, E::BASE);
+
+        Ok(())
+    }
+
+    /// Start running the loaded firmware.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Returns `MBOX0` and `MBOX1` after the firmware has stopped running.
+    pub(crate) fn boot(
+        &self,
+        bar: &Bar0,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        if let Some(mbox0) = mbox0 {
+            regs::NV_PFALCON_FALCON_MAILBOX0::default()
+                .set_value(mbox0)
+                .write(bar, E::BASE);
+        }
+
+        if let Some(mbox1) = mbox1 {
+            regs::NV_PFALCON_FALCON_MAILBOX1::default()
+                .set_value(mbox1)
+                .write(bar, E::BASE);
+        }
+
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE).alias_en() {
+            true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
+                .set_startcpu(true)
+                .write(bar, E::BASE),
+            false => regs::NV_PFALCON_FALCON_CPUCTL::default()
+                .set_startcpu(true)
+                .write(bar, E::BASE),
+        }
+
+        util::wait_on(Duration::from_secs(2), || {
+            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
+            if r.halted() {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+
+        let (mbox0, mbox1) = (
+            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, E::BASE).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, E::BASE).value(),
+        );
+
+        Ok((mbox0, mbox1))
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    pub(crate) fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        self.hal
+            .get_signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f74aeadaee9ae96bb1961d3c55b2cf1999943377
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::{
+    driver::Bar0,
+    falcon::{Falcon, FalconEngine},
+    regs,
+};
+
+pub(crate) struct Gsp;
+impl FalconEngine for Gsp {
+    const BASE: usize = 0x00110000;
+}
+
+impl Falcon<Gsp> {
+    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
+    /// allow GSP to signal CPU for processing new messages in message queue.
+    pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
+        regs::NV_PFALCON_FALCON_IRQSCLR::default()
+            .set_swgen0(true)
+            .write(bar, Gsp::BASE);
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..f6a6787b6af0195e99dd34f9f35a1ad218c0cd59
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::prelude::*;
+use kernel::sync::Arc;
+
+use crate::driver::Bar0;
+use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
+use crate::gpu::Chipset;
+
+mod ga102;
+
+/// Hardware Abstraction Layer for Falcon cores.
+///
+/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
+/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
+/// registers.
+pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result<()> {
+        Ok(())
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    fn get_signature_reg_fuse_version(
+        &self,
+        falcon: &Falcon<E>,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32>;
+
+    // Program the boot ROM registers prior to starting a secure firmware.
+    fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams)
+        -> Result<()>;
+}
+
+impl Chipset {
+    /// Returns a boxed falcon HAL adequate for this chipset.
+    ///
+    /// We use a heap-allocated trait object instead of a statically defined one because the
+    /// generic `FalconEngine` argument makes it difficult to define all the combinations
+    /// statically.
+    ///
+    /// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
+    pub(super) fn get_falcon_hal<E: FalconEngine + 'static>(
+        &self,
+    ) -> Result<Arc<dyn FalconHal<E>>> {
+        use Chipset::*;
+
+        let hal = match self {
+            GA102 | GA103 | GA104 | GA106 | GA107 => {
+                Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>
+            }
+            _ => return Err(ENOTSUPP),
+        };
+
+        Ok(hal)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..63ab124a17ec50531512cc2f5ea1d397a2545fc2
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+use core::time::Duration;
+
+use kernel::device;
+use kernel::num::NumExt;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    Falcon, FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect,
+};
+use crate::regs;
+use crate::util;
+
+use super::FalconHal;
+
+fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result<()> {
+    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+    if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
+        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
+            .set_core_select(PeregrineCoreSelect::Falcon)
+            .write(bar, E::BASE);
+
+        util::wait_on(Duration::from_millis(10), || {
+            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+            if r.valid() {
+                Some(())
+            } else {
+                None
+            }
+        })?;
+    }
+
+    Ok(())
+}
+
+fn get_signature_reg_fuse_version_ga102(
+    dev: &device::Device,
+    bar: &Bar0,
+    engine_id_mask: u16,
+    ucode_id: u8,
+) -> Result<u32> {
+    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
+    // registers, which are an array. Our register definition macros do not allow us to manage them
+    // properly, so we need to hardcode their addresses for now.
+
+    // Each engine has 16 ucode version registers numbered from 1 to 16.
+    if ucode_id == 0 || ucode_id > 16 {
+        dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
+        return Err(EINVAL);
+    }
+
+    // Base address of the FUSE registers array corresponding to the engine.
+    let reg_fuse_base = if engine_id_mask & 0x0001 != 0 {
+        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::OFFSET
+    } else if engine_id_mask & 0x0004 != 0 {
+        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::OFFSET
+    } else if engine_id_mask & 0x0400 != 0 {
+        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::OFFSET
+    } else {
+        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
+        return Err(EINVAL);
+    };
+
+    // Read `reg_fuse_base[ucode_id - 1]`.
+    let reg_fuse_version =
+        bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem::size_of::<u32>()));
+
+    Ok(reg_fuse_version.fls())
+}
+
+fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result<()> {
+    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
+        .set_value(params.pkc_data_offset)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
+        .set_value(params.engine_id_mask as u32)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
+        .set_ucode_id(params.ucode_id)
+        .write(bar, E::BASE);
+    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
+        .set_algo(FalconModSelAlgo::Rsa3k)
+        .write(bar, E::BASE);
+
+    Ok(())
+}
+
+pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Ga102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result<()> {
+        select_core_ga102::<E>(bar)
+    }
+
+    fn get_signature_reg_fuse_version(
+        &self,
+        falcon: &Falcon<E>,
+        bar: &Bar0,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        get_signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_mask, ucode_id)
+    }
+
+    fn program_brom(
+        &self,
+        _falcon: &Falcon<E>,
+        bar: &Bar0,
+        params: &FalconBromParams,
+    ) -> Result<()> {
+        program_brom_ga102::<E>(bar, params)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c1efdaa7c4e1b8c04c4e041aae3b61a8b65f656b
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::falcon::FalconEngine;
+
+pub(crate) struct Sec2;
+impl FalconEngine for Sec2 {
+    const BASE: usize = 0x00840000;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a4e2cf1b529cc25fc168f68f9eaa6f4a7a9748eb..3af264f6da8025b5f951888d54f6c677c5522b6f 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,6 +4,7 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -227,6 +228,16 @@ pub(crate) fn new(
             page
         };
 
+        let gsp_falcon = Falcon::<Gsp>::new(
+            pdev.as_ref(),
+            spec.chipset,
+            bar,
+            spec.chipset > Chipset::GA100,
+        )?;
+        gsp_falcon.clear_swgen0_intr(bar);
+
+        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, bar, true)?;
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 121fe5c11044a192212d0a64353b7acad58c796a..b99342a9696a009aa663548fbd430179f2580cd2 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -4,6 +4,7 @@
 
 mod dma;
 mod driver;
+mod falcon;
 mod firmware;
 mod gfw;
 mod gpu;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b599e7ddad57ed8defe0324056571ba46b926cf6..b9fbc847c943b54557259ebc0d1cf3cb1bbc7a1b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -7,6 +7,10 @@
 #[macro_use]
 mod macros;
 
+use crate::falcon::{
+    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
+    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
+};
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
 
@@ -72,3 +76,138 @@ pub(crate) fn completed(self) -> bool {
         self.progress() == 0xff
     }
 }
+
+/* FUSE */
+
+register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100 {
+    15:0    data as u16;
+});
+
+register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140 {
+    15:0    data as u16;
+});
+
+register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0 {
+    15:0    data as u16;
+});
+
+/* PFALCON */
+
+register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
+    4:4     halt as bool;
+    6:6     swgen0 as bool;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
+    10:10   riscv as bool;
+    12:12   mem_scrubbing as bool;
+    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
+    1:1     startcpu as bool;
+    4:4     halted as bool;
+    6:6     alias_en as bool;
+});
+
+register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
+    0:0     require_ctx as bool;
+    1:1     dmem_scrubbing as bool;
+    2:2     imem_scrubbing as bool;
+    6:3     dmaq_num as u8;
+    7:7     secure_stat as bool;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
+    31:0    base as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
+    23:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
+    0:0     full as bool;
+    1:1     idle as bool;
+    3:2     sec as u8;
+    4:4     imem as bool;
+    5:5     is_write as bool;
+    10:8    size as u8 ?=> DmaTrfCmdSize;
+    14:12   ctxdma as u8;
+    16:16   set_dmtag as u8;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
+    31:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
+    8:0     base as u16;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
+    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
+    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
+    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
+    1:1     startcpu as bool;
+});
+
+// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
+// instance.
+register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
+    0:0     reset as bool;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
+    1:0     target as u8 ?=> FalconFbifTarget;
+    2:2     mem_type as bool => FalconFbifMemType;
+});
+
+register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
+    7:7     allow_phys_no_ctx as bool;
+});
+
+register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
+    7:0     algo as u8 ?=> FalconModSelAlgo;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
+    7:0    ucode_id as u8;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
+    31:0    value as u32;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
+    31:0    value as u32;
+});
+
+/* PRISCV */
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
+    0:0     valid as bool;
+    4:4     core_select as bool => PeregrineCoreSelect;
+    8:8     br_fetch as bool;
+});

-- 
2.49.0

