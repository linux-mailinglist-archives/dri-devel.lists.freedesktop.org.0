Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE473ACD508
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 03:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111F010E271;
	Wed,  4 Jun 2025 01:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jTTYHq/P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2829410E271;
 Wed,  4 Jun 2025 01:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERFo8vqfQ9Kn8gwFEYn19aTVO1BcIkJSE+uwnTNxyuu5N27Ic/pWFNMxRu2UppiGakCciww4Lp+/5yjbT8FdHPeU31XAT3jCB3A7zjwNt4/rtQ275zEidLCEBrj9cuWrwl7mTQiMr9KPpIG7q3GS5In3p7bQ9hwMnlLvAHziBHOfI5jODwPt8uaF94Td79tdQP1ZU2l52l+P/FRpkc4nQU33oaClaF6jzUQ0rSfOh2GfEw3OxN7f/gR3sC6oMMmPcSocZUdAy+rpP8gTLRenO6gDNuxvtjtz5+Q/nVgrYAke31x98DdE949l6gQyMFIvTIZzZwk58YFoD1KpbfkhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Yf68x1iFdXNk5ultfa69zwPfanwtItkLRkI9Oraczc=;
 b=uuoHGVycgwKj+rF9s+kR4c8XSBp0solpoDWEsgwgh/6osRS0XJdsI+yxjPV2io69anoc/xVfcRIoRkKJgxzRcyfd8UtLAdprGqNNlUZlv8f6MrV0YEYyWkSEzZtelKto4eAdN4bCJaa5O6rR9iq9/jp4DF/UdWxgMFdms/CAGGu45+uEzFu2jm5P1pbxWJXElEYWveaMDrnpN7GhYThkKMNyLGmYwYGZIl7su2bvL6ncfIzWdq1JG3aV5EeRw0ADL1cSyOwSmaUPwluGkkXoUofHZ1o6nTQVMf5Yg/g4oO0dUHlxSe3RqWGMXb1CQsl3DUxf0qwfTHhW+s7OwgFeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Yf68x1iFdXNk5ultfa69zwPfanwtItkLRkI9Oraczc=;
 b=jTTYHq/Pors2UpeG4TY+xCdigJTND19GXFJC2tI+Ehes5DuDPZ1yj6IpNt/iluMMWmX3tA5IFOY7Z/9HHlNC+AG5LAZyqAfkWHo8yTA/rdniismKHpXe+TYIzKAjcE9wALqbbHpo6WRf6t3J9OaggOdfBuzRH/1S1AzNf8tpxISAeGXaoB56QFKeSIajhxZP9uocP5Pw2LJltYFNFWIL6hBx1mfB8jn989NfOXmJBKblUhowt4cZZUw/L7nmetJuafEYQIIcBlUt4WHPOoY+9YG2/iUtz6zPVAyCi81aSJkzBdoSLLC+UGsudNNqqD0jh6Rj7jVg+4h3d2LCK8PyXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9101.namprd12.prod.outlook.com (2603:10b6:510:2f9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 01:38:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 01:38:19 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 10:38:16 +0900
Message-Id: <DADD57F0Z5IX.2EQ7AIDLERVCO@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 20/20] gpu: nova-core: load and run FWSEC-FRTS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-20-05dfd4f39479@nvidia.com>
 <3441e3669a7da5b70a0d80d86d5e114f75bdaffb.camel@redhat.com>
In-Reply-To: <3441e3669a7da5b70a0d80d86d5e114f75bdaffb.camel@redhat.com>
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9101:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0674ad-cf59-4478-de86-08dda3087c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFprbmZlS2hYaU52b283RVNPN25oSkg5dHltWndPZk5DRFFabUtjaDk1MCt3?=
 =?utf-8?B?TEVLUXFCOXdCcGhLVUVaVDJSdUovdHc3OFRYbVlwMUovRGMrMTlYUy85Y29i?=
 =?utf-8?B?bDBoTlhrU003SkNtWjFwYjU3NSt2MEZYZExUODlVR2YwZUI0YVN1M3VsMFhS?=
 =?utf-8?B?VjY4N0tITlljYXlkYVpkektBSnFSMGNaNlJYVjJUUWR6ZG5TMnFIWEZLRjB4?=
 =?utf-8?B?am5jWFU3QnRiMkxKV2pPVWJpQXZueVR3aUZiWUkzNjhCYkdydUgrQU9Ya1hJ?=
 =?utf-8?B?akVNT0d5dHRVUzB6TmRIVjIrNkZKQ1NVRUxBeVFQcjNQcnQyUUY0bDhwb1lW?=
 =?utf-8?B?STJjQmVETE43aXdodGdXM2F1SHlvTTk3WjNCTUVnanlFOWdQVGpZTGlEM08z?=
 =?utf-8?B?RytDdDRxaDRJdGEvM0JPVGVubzNzU0M4K1dWSmcwYk41aFdpeWtORmJQaXQr?=
 =?utf-8?B?L2JUdU1KeTFhMHdMVFBWN3ZBYjdHNmNtQUs4RDlHd1ZNMXBQWUF1a3F4Q2la?=
 =?utf-8?B?emNrNTFneWlveUZRRDBSMkNGa25zZFhuTFl2QmMwVmhyMGwvZGUxRFdzcTN4?=
 =?utf-8?B?RVVMeVJ4eXJ4d0R5TmJCYS9sS0NQVDNIS2tKQXdxaENXa01oRHJnMXlmb2JZ?=
 =?utf-8?B?VnkzNFRNeUt6NTZJUUtaZ2lJZFVMMUlCMEM5T3RnTjZjRWtaK3JiTDV0eTV0?=
 =?utf-8?B?RkkxYm9sTnZrUzFQVE5ZM0ZFMW1vVXhheGxuR3dDZXZvUUpuSFRZeDRzTWFN?=
 =?utf-8?B?TzZGTnY1VzR0OVY0YUJTQ0tRblRXYUV4MUxQaGVVS0NXbmIrOFlkTjdYajd6?=
 =?utf-8?B?YzVzeGRqeUZSaGlxbWhpeXh0T1NiTzZFNW9ZVnRFOXZlVDBnWEhHc0Rhbk5j?=
 =?utf-8?B?dU5pcmNXSmhSWmk5M25jMkVCTnZYMEY4VVMrL2pILzloS1pQbGFDQ0xoMTBK?=
 =?utf-8?B?RVlDQkM1RHh3MjdEbGJ2YjUwVkRMaDhsTm50NmY2M1VibFNOcDk2RFhzTHQv?=
 =?utf-8?B?VWJtM0tEbzNIeW5SYmk2eTZyOFRlbDI0OVZPRDdpMkFqUHpBVHl0Z1dvazIr?=
 =?utf-8?B?R0FZMjhlRjdrU1h1MEhtd05GSXdxemFiTElZQjNnNm4zaCtSNUpHd0lsNm1i?=
 =?utf-8?B?SVVHQStJdHZncFFDZ0Rqbk91QUVJMFZBVnRVSEN6ak4rSzJHbEw3RFNuQjNQ?=
 =?utf-8?B?aW4wUnhlMDJCQys1dENjQ3kvWnFTSUwyN0szNU5xWUtTY3NpQVZpWFExMFBR?=
 =?utf-8?B?SkNudVUvNCtNbFdpem1NOXZYN0hpbXMwRTVybHo1T2xUZ0tlS3V2QnBNb25s?=
 =?utf-8?B?WUxPUHY1cjNjcE9SWVVuVENnZlJLdmxBZmI1M0ZHS1UyR1JhSkRRM2gxdnRi?=
 =?utf-8?B?TjI2bERwUERWbS9ienQ5YkFEWWJ1bjRxRkdTUlpTaUxCYXpTVDFhaEY4OXB4?=
 =?utf-8?B?cXdPeEdCbHBibm9uSUVpMDVSdWZsMm5tM21pem1BTU0wWWpXZEI5RHdHeVBV?=
 =?utf-8?B?R2w2cXEvbEJmd090V2UxWk1QVUYvS0tERFJtMGRaSm4vYWlyeWxxcGFzWXZZ?=
 =?utf-8?B?NlRnOEFsV1BtdDlMb0ltcWpDSHJjNWpYcEI3QnZ2eHo0bldxRjNwMlZuSGM2?=
 =?utf-8?B?ZHJZNVBkZm5VU0M3NjVMVzFHRnBYaFVRUC8zQjF2K1hac291Z1V2ZzZSZGRP?=
 =?utf-8?B?aHM2UHlBUHd4c2Qza2JVV2JUM2x2NmhFWVp4bmowN0gvQ3Q1MkpzSjN0MU91?=
 =?utf-8?B?emtsdUdUbzZKMnlnS3lWUjd0UGp3Q1FLQ3pXaFlQcVdqV1ZyaVhGZDR1RWMw?=
 =?utf-8?B?eFZ1azZZNTNMQXVUYjBnRkV4OFFQTms4UDNaRVY4QmhGUEtZTHJRMlNWVlhH?=
 =?utf-8?B?VUhXS0pMRk8rbVVFRTJvVHAzZG5oREs4NzNVT0pxNS9uTEZKQzJ1c3RRMmxh?=
 =?utf-8?B?ZnZmMXE5bFpreDlWMGd0V0t5aG1CNGZlYjhYNE1YMDZYR1BtQ1dKejJyaFho?=
 =?utf-8?B?cDFkV05jOEdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdlRml4VlI2QTY5QWdxYy9Od2xTM1VNOUIrMFQxWVg3S2lhcEFzLzltN3px?=
 =?utf-8?B?U1FqazZGeSsxVk1VRmV4R1BJbWhtQkJpeWtSSHRoSTFpbGhpY0NwZDNPbG9U?=
 =?utf-8?B?ZGJlLzJabzBBc2FmeWhDOEZGNVU0VFRRZVhOMlRzUFhRenQyYkpicmFYN2Nq?=
 =?utf-8?B?NXdiUmMvNTU3SnNPSHEyWEZMZkt6R05nK3VKUEF6QTBwRGVoWVJTZFRuTGIr?=
 =?utf-8?B?K3ZtK3ZVOGh6by9ER0tYUjBmRVdFdzFLYkZ3N3lZNU5FeVVJY2cweXhnNnZj?=
 =?utf-8?B?SnpUWDFRU25DcHY5NTRIUW1wSlZaWloyOE9wakg4OWxDakFqT2N4Wll3c3JG?=
 =?utf-8?B?ck14SjdyMkxCc2ZSYnp0UEU1S0hjMjR5SUFXRys3bVFjSFlzUTMweWJSSnNW?=
 =?utf-8?B?SlJhOWl4aUFtMGZ1b1M0Q1NzcXZEcjRtT2lLRVBYRXlJSGNEaGpjclYwUjN0?=
 =?utf-8?B?NHR1c0xqR3A4bWgySU9odkNhOUV5Y3Q1UUkwellKbDVmaCtmUXBxd3k2MVF4?=
 =?utf-8?B?Sm44aldWZ0JlK1NRWTk5dms4QkFOL3RBNGhPbDBla2NqTDJpOUxGbm5lVVI3?=
 =?utf-8?B?NkVQNlcvR25wT2VsNVFqeW5Ea1dSMS9RNHJnMlZSclJEN1BQUnpiWGZLWDlu?=
 =?utf-8?B?RGd5dXBJVDU2eElOeUJHVTlTczkyY1ZMTTYvcEFoSTI2ak4ybURYVWNtWEVP?=
 =?utf-8?B?cUVKUUxmMWxGU3hYbnpPVGNmbVM1YklOS1BlYVFMTjEzL0Z2b2pmTXJIK2Jp?=
 =?utf-8?B?NDhqNmxzM09FNFgrMEZTc3Q3bkNmaW5HK1d2U3F5cnJvam1kZ2p2eWxiYkla?=
 =?utf-8?B?bndIbkdPbGJvR1NxdHJKeFlTTWREY0FPcFpGNVZYM1pZSldZMFZTTjRlYU94?=
 =?utf-8?B?aS9sK2NDY1p3bmhRb3hYMFVsSXpSc2szSXpGZFJoeEZrdnpvT2RFaG1pSjJl?=
 =?utf-8?B?MlVJUGVGVGd2QW5jMG82WVZ4OGFKUUkwWlV1cVkwdFdQZzNDRGhNSnZCR0dq?=
 =?utf-8?B?a01mMW92K1FkTlZsUktGdEY0dFhJQWhBY3Q4Ui9DVzBUNnJpMWxvV05ua1p2?=
 =?utf-8?B?c04yaXBOc2kyL3hES0ozb2xWdHUyTEt3L2NmLzJ6bGlmU2pMeVJSc1RjN1Zl?=
 =?utf-8?B?dkc0a3BPVkFVSllmNGx4VzI4NDBpWDc3RHpBRGM2TjhvQ3BrSHdzcGpkelc3?=
 =?utf-8?B?R0JZNWdsTGFjOUQxK2YyN1NpTkY5clZMblVNM3lqclIyanNIbHdlUTI1UDdF?=
 =?utf-8?B?ZGxtTFFUSXg1OUovbFNFYkNKbklEdWJuUUtaSm96UytQTVdnTkw0amRmNmQ4?=
 =?utf-8?B?cFhvRnUzei8zcTBXVnhYVEtuNkxBeG92VHIrcHFJZTZ5ZkxsZ2ZQbVo3S200?=
 =?utf-8?B?Yk1scXphNkJqQzRqQlBkeTNkZ2hTT1RSc0tTSE1Mc1VjK2lxeHU4eFNpSFRJ?=
 =?utf-8?B?Mkt6N2V5aGYzUjREdjVsT0NLTzk0aWlkWEg4RGE4dHg1U1ZpWThqcVNCUEtJ?=
 =?utf-8?B?eXdFcldUcHVXd0lzbEtSUUVpNnJmc3c5VjFTdlM0L1laSVgyNmxvNnNlSnFV?=
 =?utf-8?B?VllEVmpPeTZIUTdXLzRQYkFKYU9IR2tUWVpEYWsreVZHOUVuOG9UNW1saHYv?=
 =?utf-8?B?bzRjbXFxWkxFMUplZU1sZ3lNcWVEQmdtZ3BndHZYd1lpT2hhdUJZWlQrcUxR?=
 =?utf-8?B?NC9tM1JJai91TjBwQ0QzRWlRUGJSUER2STcrUVV2Qjl5bythZzIzNVJpbXh6?=
 =?utf-8?B?UXB1cGREQzA4RkMwWUhwOTFyelVxajMydkd2cXk2M2hDeGpIbjNhcVNxZVp2?=
 =?utf-8?B?Q0d5ckJFWU5hWmJJUmx3RlZ0NC84OFlhTmdXcVBXWmJTaG4rL0lwTEg3dWxW?=
 =?utf-8?B?bXJ5SXYxcFFCeUFlUmE1U0lXZDlMZVdtY0ZWN1Z3QnpUTnBnQ3czYXV3eEJQ?=
 =?utf-8?B?ZWFJckpsaGRRaFFsQUZjMjI3Z3FwL2pFUzhuMnN5eitNOW5UTHhYY2E2aDRF?=
 =?utf-8?B?RmNrYW9LU3cyRHltcnlGR2NYZ243T0JGZEdvb0Q3Tm90bWUvMjRIT2k2VkUv?=
 =?utf-8?B?SDM4RlVhQjkyZ3lSNHJLeEZyODQxTnQ0OERmWjJuaHFSTDArZ0NrZHM2NHF1?=
 =?utf-8?B?aEk4eHluU0NFc2IxdmhpTkMyQW4rd3QrTktVNUtLVnowUDNVTzJpdmxYWXB2?=
 =?utf-8?Q?/BamWWkMSZzDYYrZzg0MfC1NNL3LeHa40zMTB+86MhOJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0674ad-cf59-4478-de86-08dda3087c21
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 01:38:19.6769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D96JDNYqnAtCw3ksvRtnTPUehO+lTt2y8XxmJs/lj0CQGq+O2EXGKUpjabDMEuOZK9WhTs6xUAG5yBhi0kIbng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9101
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

On Wed Jun 4, 2025 at 6:45 AM JST, Lyude Paul wrote:
> On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
>> With all the required pieces in place, load FWSEC-FRTS onto the GSP
>> falcon, run it, and check that it successfully carved out the WPR2
>> region out of framebuffer memory.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/falcon.rs |  3 ---
>>  drivers/gpu/nova-core/gpu.rs    | 57 ++++++++++++++++++++++++++++++++++=
++++++-
>>  drivers/gpu/nova-core/regs.rs   | 15 +++++++++++
>>  3 files changed, 71 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fal=
con.rs
>> index f224ca881b72954d17fee87278ecc7a0ffac5322..91f0451a04e7b4d0631fbcf9=
b1e76e59d5dfb7e8 100644
>> --- a/drivers/gpu/nova-core/falcon.rs
>> +++ b/drivers/gpu/nova-core/falcon.rs
>> @@ -2,9 +2,6 @@
>> =20
>>  //! Falcon microprocessor base support
>> =20
>> -// To be removed when all code is used.
>> -#![expect(dead_code)]
>> -
>>  use core::ops::Deref;
>>  use core::time::Duration;
>>  use hal::FalconHal;
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 5a4c23a7a6c22abc1f6e72a307fa3336d731a396..280929203189fba6ad8e3770=
9927597bb9c7d545 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -246,7 +246,7 @@ pub(crate) fn new(
>> =20
>>          let bios =3D Vbios::new(pdev, bar)?;
>> =20
>> -        let _fwsec_frts =3D FwsecFirmware::new(
>> +        let fwsec_frts =3D FwsecFirmware::new(
>>              &gsp_falcon,
>>              pdev.as_ref(),
>>              bar,
>> @@ -257,6 +257,61 @@ pub(crate) fn new(
>>              },
>>          )?;
>> =20
>> +        // Check that the WPR2 region does not already exists - if it d=
oes, the GPU needs to be
>> +        // reset.
>> +        if regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() !=3D 0=
 {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "WPR2 region already exists - GPU needs to be reset to =
proceed\n"
>> +            );
>> +            return Err(EBUSY);
>> +        }
>> +
>> +        // Reset falcon, load FWSEC-FRTS, and run it.
>> +        gsp_falcon.reset(bar)?;
>> +        gsp_falcon.dma_load(bar, &fwsec_frts)?;
>> +        let (mbox0, _) =3D gsp_falcon.boot(bar, Some(0), None)?;
>> +        if mbox0 !=3D 0 {
>> +            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n=
", mbox0);
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
>> +        let frts_status =3D regs::NV_PBUS_SW_SCRATCH_0E::read(bar).frts=
_err_code();
>> +        if frts_status !=3D 0 {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "FWSEC-FRTS returned with error code {:#x}",
>> +                frts_status
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Check the WPR2 has been created as we requested.
>> +        let (wpr2_lo, wpr2_hi) =3D (
>> +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_LO::read(bar).lo_val() as u=
64) << 12,
>> +            (regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar).hi_val() as u=
64) << 12,
>> +        );
>> +        if wpr2_hi =3D=3D 0 {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "WPR2 region not created after running FWSEC-FRTS\n"
>> +            );
>> +
>> +            return Err(ENOTTY);
>
> ENOTTY? Is this correct?

Probably not - I guess `EIO` would be better to express a firmware
failure? (and for the errors around this one as well).

>
>> +        } else if wpr2_lo !=3D fb_layout.frts.start {
>> +            dev_err!(
>> +                pdev.as_ref(),
>> +                "WPR2 region created at unexpected address {:#x} ; expe=
cted {:#x}\n",
>
> Extra space (but if that's intentional, feel free to leave it)

Oops, French typography habits. ;)

>
> Besides those two nits: Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!
