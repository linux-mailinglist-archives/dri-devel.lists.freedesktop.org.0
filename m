Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF418A9A4C8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:51:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E7010E75C;
	Thu, 24 Apr 2025 07:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H+YRyy5R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3787010E75C;
 Thu, 24 Apr 2025 07:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EukBjzQ+20w0G/tBsrlEzIjyk0cTvEz0atcc8N5WYcovwtH7QYXccVbud/BLgchaRDKluREiKXKCCriXri9zFwNXa97er4Fk7yQ8zOszJOOXc9gPv8eJqHiu77ENgpz1ETHP5hiY4woxVG+Fhowt/w7bvGQvi1NCO94DNlM5yoMgT4tJiDW82GV0E/CjrHpCzABDqa4s/d59QHe+CTy33Bg/OVPUso4gZAsGrKfhoNQn4OLLwDuq7ceaR/baHUC0td8bVczfPs9mFfBr+Y6m/VeKfWCBZjZdasaVFTpa94qpb2CIPrDCsYkyEAFScYsBTuhkGM1lG3kt+TJkcmQFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sO8yWqJH4Dro65jKgL+/0GppXVIip9FqSOy5zryovh0=;
 b=auj+2YxA21eyy2aYYKuJjSwKuwgwHHhuwuS/AZ4AqdG3AtY6vLVfd9+LnVRxkW7HaQBulgthxBVESkMWWbyeWPFUlnEF1Zab7R+u0Yv8ayhcOibqPgAQwINpwn+QAUeQm8wz0IKVUt7S9WspfSHFut1mBzG7LZ2MtzTcaGoyuIxb7SokDbBE0jdFtV5JUJ1lWACgBh30StQunKnuJTDLW/HXI9KLXhlGZwSJN6gf4QjHCqAsbWtiI5BP5BvXcNPzqXq4zCRiIyr6YtpNHSMihgoobPoVIuXE+Y7g8H3G1P9BrVcWifxy6smyICATlRgkBf4krXFsrXN32021E/znHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sO8yWqJH4Dro65jKgL+/0GppXVIip9FqSOy5zryovh0=;
 b=H+YRyy5RbqB2481nGXnx9Y4nRsb9uf5zoayBEm38KDcdMEpTT3h1IFV+f9sbgyT51a6iwR8Pt01hvTV4oeyc0rgIzNPl1DxcPSraX2lOCKKRbeYDetTmLHZ22HpiZOuiJfCtv28dR5aAbxUXoYfRa7QTKipo6ptkrmRD5XOsOtSpuOM8wleOQB3bJwhWg0jjoPwEdkGjrb+C+AGODiOdAHCd9OdcWX++fPcHOUkodD7OzicDxa5LSk6XKtHnuXJyaa+o+YaiYdXfnEPBm2iyCkp179D75wk6V5Jc+KHd69ODa90slLj5ZHhKGbXCbK1ZDc9wkWp/i0DnDEA7epmwXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SJ0PR12MB7035.namprd12.prod.outlook.com (2603:10b6:a03:47c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 07:50:55 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 07:50:54 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Apr 2025 16:50:51 +0900
Message-Id: <D9EPE53YBQBK.YBT6P0MI6FPV@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 03/16] gpu: nova-core: derive useful traits for Chipset
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-3-ecd1cca23963@nvidia.com>
 <0d5e7a8a-c272-4652-ad03-229384bbbc95@nvidia.com>
In-Reply-To: <0d5e7a8a-c272-4652-ad03-229384bbbc95@nvidia.com>
X-ClientProxiedBy: TYCP301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SJ0PR12MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: b1286e19-4940-4f98-6401-08dd8304bdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzJMQ1o0N25FMVF2WnFkUmMwUXhseXM2Q2JrOUZMRmpiWjkvc3FvOTExWmJ3?=
 =?utf-8?B?dzV5M0c4WjRMTWp2NlQ0MTFuTW5iTWRXem85YlU5anJuMTdHSmlHUGxTTm5Q?=
 =?utf-8?B?NDBYa3VzUHk4YWMrcERmRFZUYXZIcmJBQ2RuK1JOUmlrbkpYazlUZGlRcmZM?=
 =?utf-8?B?THBycmpVNlBjNldjZUV0Z3dmUUtFNy9tMTZjblN4TEN1QjFZMHlmUTNFSmVz?=
 =?utf-8?B?OFIrSCtiMklFVzZ4MkV1YlJYbmg5UnU0cWo4bFZvc2pHZEs4ZDhzY2I0UHFp?=
 =?utf-8?B?anZGOTh3azdOL1AzSVVQZjJaOFZkNW02bzVuaHRFV1dmdmt6VlJnbUdMaGN3?=
 =?utf-8?B?dElxcTNRUEs4UEJjcmRSV1l2VU9NUVJCamQ1LzVObjVoa1FhY0JkOUpaUzVu?=
 =?utf-8?B?eE5qV3Q0cHZqSkIxWTQ1OForb0g1dkJFN0dZVnJMV3NEcWR4STNJYytMeXdk?=
 =?utf-8?B?R0lRbWN3MEY1RzloWEs0UmREUTFvNmlOM3lMemsvR0lFd0VaeGVpdEx0d0JK?=
 =?utf-8?B?WCtKeXdIZGxZMXRudzZQVGdNaFNreVU2SEhkaXBkWk51aDBOdHpPcUpxTGRk?=
 =?utf-8?B?bjNLVUM5TUcySUxOb3E5b2t0eUpnckpyTmtIbmJTblJEQ2ZWREJuamVVTTBJ?=
 =?utf-8?B?ckk4bVRrWGtGSC9VcWRxZUVRdHo0MEY4L3YvMllROGI1SEVzc09oWGFhNTRK?=
 =?utf-8?B?Q0JFTThvYkJaZ2FJNFVHeURQMkZKR2NOQjhjVE9yWVN1SHNlK0lGUGNYQlBO?=
 =?utf-8?B?TE9UR0J0d0M3TzRCZGRXNVhMaStWbEkrRGlJb3BEamVqQWxzU2Q2Rm50OVV4?=
 =?utf-8?B?WjR3WFpaYWFEUzRLT2dWcEhGUlg2andmeGRSOUhHcEdGUEJ0d2tqa0dOZVg1?=
 =?utf-8?B?RUlzRmpNUTE5cU80dGlqNTdEN3pmSlAzVmdRZVNLbXJTak9OZEJkR0paZkJR?=
 =?utf-8?B?bmVZd0Jxd2NIbVZjMWY1WUtMa3JFaVdwbExaYXdlb3ZESE5lVDVhY3FxME9J?=
 =?utf-8?B?ZzhLUUgzdFhaMkVMOWNxOEQzNnkzMWlEL2FPY0dDaGFxOUNxT0E0UlJyM3h1?=
 =?utf-8?B?NC9aUnJmQlp6ZzhLQXpocjFZZGFCQW1tRUxrUC9UcXA4Rjg3ZmFJbHJjZWhx?=
 =?utf-8?B?a0NSdkFRMkhRdnA1WkZaU2wrQVg3ZHNwVkFIS09QamJWODkxWjJWQVdzM2lF?=
 =?utf-8?B?aTJGaEE2am1Id1ZHZ0tDU1l4U3QyTGtLR1hacCtjTUc3R1R2cm02RmZtZGs0?=
 =?utf-8?B?bitzM2l6c0pxbEJyRHFmSXl2MXZHRDJGYkZLWHRjOGhrWUEyb3FtUFc4S21H?=
 =?utf-8?B?aUZad1RzNWxKT3VBSlJGc0NYa2daOWU2TUR0Q0cyUTRHV2o0OTYrb0RKeGk3?=
 =?utf-8?B?MFR1OFZkZ2FhcStQVEw4R0RTSTk4UlZWdTdOSjFta0k0Mis1MEZNVjJjVlZv?=
 =?utf-8?B?c29rRmNFSkhTMHBSWXlSMEpDZWxaVStYeXhDejlDN1FzZ3F6L1cxYUs1b0xH?=
 =?utf-8?B?VXVEQmNaUkNtZVZrUTlpUENLMU16aHpGcDBiS3ZXdHhlZmJUcnpxNTZvU1Fw?=
 =?utf-8?B?cEc4LzNGRkRlTzN0TjRkTXNOTWsrRzJIQ21LekZGUkhTMG5ScHRDdXBhTm00?=
 =?utf-8?B?ZUYzelBmV3E2VnF0L0lJQzNaNUMvSTBjQUpuaDM1NzhLTGV4WUFSdHhuNmFn?=
 =?utf-8?B?VVZnWTZIcTdlZ0w1akp4SFRCNGJ0bjNqaTlHVTRSM05VZUU1MEpINGJ4bHRO?=
 =?utf-8?B?bDlCMW43TEpKMlQyOXBwQTVScURYVXBGa20wdDN4UzFEbkJXVTQ3UkJsenFZ?=
 =?utf-8?B?WGkwR1orK1hma0FqQjFOT3d3RWQ0eXNyWjN0SGFmUGQ2NHE2K0pGRlFXUmE4?=
 =?utf-8?B?QmVtTkJaT0xBalRKRlZPQjlYWFFNdW5uOHpnTU5MRnhXWEtMOEZoanZjL3lC?=
 =?utf-8?B?Q1lIbnlDWUcwejVia3dWWkkxMmNYbkxuU1hQTWIxMlN5dnZWZ0hGVThnSDJ5?=
 =?utf-8?B?NFhJbmIvNVJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk8rd09qV2s4ZlJkaEE0dU5tVS8xdCs0NHJHamlualAxa3NzaXduVDVyL285?=
 =?utf-8?B?dUo0cVRVMForM21EcEVtOTNPbFRhcStabDQ1NDQ2a1JZZExsY3MrU09jTk1q?=
 =?utf-8?B?NTdXZUZUdHRoaFA3UE1mRFNMUGZwRVFHY21vUjI4cnVKdFlJcVlSbXRjazUv?=
 =?utf-8?B?VHgrWi9iRFRlcHhJUlVHdFQzU21XVkVKWXhocElDZVd3eVZ6TEJZYzFyZFZk?=
 =?utf-8?B?MnloZ0lpMEFDTkwvVHZ0TWFqWlUwMGhWVlpqOG5oVGo0WUVaSmZmWldQTkx6?=
 =?utf-8?B?czVTNEJJalZFV09YeXpDQk1Sa09UUjZ6bVdzTjduTUlTZEwxL04zT3BacFZk?=
 =?utf-8?B?NXdKVWNnVlcwd3BTVXRnbDZ4c29ickhabXlKQWY1Rzl5UDdaa291ZjNiYnVZ?=
 =?utf-8?B?NUNYc0ZyaFhwaVNMNkRFcU5kWmx0cVpwYTN6bkJKR1lzMlRKb1JZclJCbzhC?=
 =?utf-8?B?Qm4xbmRkdUsvTVdDT3FhM1VnL2VGZVoyZnVDNjl2RUdoWFBBTnVhc3kvTXhr?=
 =?utf-8?B?TXJYREMrOWovZ0xIRTFVei9YYU9vVGNyY1JFR2pHRExLZVlFL3lkN25ERDEx?=
 =?utf-8?B?aXQ3Z3A5bEFKRkpiV1JQc1crSTZlUXFYWlBlSDFjRHY4NjRjY3JRWkdjWEZI?=
 =?utf-8?B?YUxLdmRyTnFlYXRBYUJtVDNBZDdLUmJsalByTm1GSlBEU3pyMWNMb1pKcDZK?=
 =?utf-8?B?eWNISUhPSlFHKzU0SnhIMS9BaVJWYVlqK3g0bkx2NEVuVHRybTBWamF1ZWow?=
 =?utf-8?B?QTA0czFxdXJUUmpGWWwxdnVnanorQ2QvT0oxdlVUeVU0OVNRRW5HSzB3cU5R?=
 =?utf-8?B?K1JBY3J2WUxDREhVZVgrM0N3WGhNY0p1V3FTaEU1QVp3ak42NmY4TUpQVkZR?=
 =?utf-8?B?VUx5eUdlVnkzNjNDRXJQZXA5clhXbSs5MUtjU3hhT0k2czhRYWxEdmljRFpZ?=
 =?utf-8?B?OUhtWWFreG9wcEIveTZ1VmVBVFJCdm9pN3lDR1RCSEFvdU5SaXlQVlhkSDlD?=
 =?utf-8?B?NjM2YTgyRGt4M1hoYktGWTdldnJxVklSUFRRWHlzbmR3eGdpNi94UG43eTJv?=
 =?utf-8?B?MjgveXN0cmRqOFN6dk8xQmlabWUxaGt5cmZKSXFQei9za3RKWmVmd2tUYXg1?=
 =?utf-8?B?bktRT0lvN2pFdkRaYzlHT2JpcXhEemhSU0UwTGhtalVZbmR2VVBqRGE5WC8v?=
 =?utf-8?B?RGVyQjVVZENMZGtKUVoxaENiTnRDUitRNXVUdnUvV28vU2FJQmZIc1MyaC9z?=
 =?utf-8?B?MXd1Qmo5L0FyejlEMlprS1BucE5SWjNhOVBTWjk1enVWL2NSdTdKUG0zZmd2?=
 =?utf-8?B?OTYwdmVpa3l0YUVxNWYrQWpJdlpxNHMyU1JraEt3Z3k3Q0Z2UDNWS2x4QTNp?=
 =?utf-8?B?WXZUUEIrTE90cVI0YmlhTXpEQzdIQWpZYzB2ZTU5c3pSYUo0c3VRUlcyNSt1?=
 =?utf-8?B?bTAvbFlJeThhTlhtK0U3L0ZBS3M0Q09KTGJlTGFMOE5wWFBrNW9tTkFlcWlI?=
 =?utf-8?B?VUthVTdiUnhHdXEwQkFaL2x5ZHVqenR2eC9vd3RLdXBHOTNSZkJmMzd4dTVo?=
 =?utf-8?B?V0NsNDM2a0llVXRNcDRGS2IwS21ZclhPSUloeTV0L1Z3STlmdHY1SXBPWTFy?=
 =?utf-8?B?U0ZUV2lWVUZWQnk3Q0FNR0I1cXgyeUY2S1JPeGhHNXpadXM4NHY2RWg1TmNL?=
 =?utf-8?B?Yk9wN0tHNXVoVUsxMDgvNVFhWUdHZUlFRzZJdjBHMGtSVFRnNzZ0NXBWUE9C?=
 =?utf-8?B?QVdBeTJkajlCZXBDL1ViTytmSFZqb1U1U0l0WkovZDV1NlRYUHpjakVkYi9w?=
 =?utf-8?B?QkhzeEVrcEpVc3AyZ2VJcGlOcldLUXdld3FHU3ZjMm9RZkVCSWlpMDNoUU4v?=
 =?utf-8?B?OVlaY2JzaUx6KzZZclVmOEVXVzBGdGVuSTVBRlgzeWg4QURpODJTUHczV2c4?=
 =?utf-8?B?SE15UGd2cnhXN3U3ZlFUamRFaWZSdWgxSzRUNjJYbXY4WlNKTjk5OHoyOHhz?=
 =?utf-8?B?STE1dWs5VnNWQjY4dEQrRkdXcVBScWdGcXdwK2ZYM2hGZEg1V0ovejV6TUxK?=
 =?utf-8?B?c283N0hwamNlSjM5OFdZOXJvMG5VMU5MWHlMeGg4MUpML2J6TUZPVFliQUs0?=
 =?utf-8?B?bHA5dDk3Nk90aUY5SUZTNGs4bmgrSXQ0OGRBNm9pSU5XQWl2VCtqVWZuY0Yw?=
 =?utf-8?Q?sQvpgiFZTYmm+XYJlbXi6kNnjdU/EOIwgyl7FK3rs2YH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1286e19-4940-4f98-6401-08dd8304bdc7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 07:50:54.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hY6aa3qm9OQvFTWq4B10WVIxLZNMRKowZA2+DhCf/FOdWGPSnolc3K3yRJ1+vMESm5m9qljU6HDp6LMlYMJnOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7035
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

On Wed Apr 23, 2025 at 1:23 AM JST, Joel Fernandes wrote:
>
>
> On 4/20/2025 8:19 AM, Alexandre Courbot wrote:
>> We will commonly need to compare chipset versions, so derive the
>> ordering traits to make that possible. Also derive Copy and Clone since
>> passing Chipset by value will be more efficient than by reference.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 17c9660da45034762edaa78e372d8821144cdeb7..4de67a2dc16302c005300261=
56d7264cbc7e5b32 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -13,7 +13,7 @@ macro_rules! define_chipset {
>>      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
>>      {
>>          /// Enum representation of the GPU chipset.
>> -        #[derive(fmt::Debug)]
>> +        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, E=
q)]
>
> Since Ord implies PartialOrd, do you need both? Same for Eq.

Ord does not imply PartialOrd, it requires it. It's a bit cumbersome but
the compiler will throw an error if `Ord` is derived without
`PartialOrd`. Same thing applies for `Eq`.

