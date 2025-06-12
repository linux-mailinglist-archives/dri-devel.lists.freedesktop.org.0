Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2823AD70D0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532410E813;
	Thu, 12 Jun 2025 12:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rrqcTl5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E96810E813;
 Thu, 12 Jun 2025 12:52:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UjsHVQjmhVOkuw8Ie14Xg90GHZzsEowVPRWPERawXm/whumgfIM2HRI8fxzo78F2lQ2ntFnivXALSq6+i/6P9H2xyb6KGA8vMElFNaFXP2yH0NU1a4XsitfcWZOgNPv5EmUqgU/X0HFE5Y0mvkPiv1UTjN/BixlXQeMuJAg5SAZVYw+Yt00uilp9tqnfsNRD0iBiL13ByzOeVcITWn0OdtXW/t2ppV7AmoP/d2TU0IQgZTBHkDVRstz3+HpAA3FN/3iT6ZTiz1DCdnOmIEe7ygDLicuCMLz/C7k4HnFxOpvUCXnPkFLLZkgrPnmmuNorWTtdbAiORu3nQlxoqd2SrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BY2EWk6766vfAS7e/7vqCxVzF6SkljkVT3oVy3yklc=;
 b=rMQXNtylmDnF2x81bxHNI/lT1kZfPaSBcGUE3hl35Rw2kVmcEfBEnqvO7Cf03tkAAgBlC8/0/+1JvopNrmsJ9zpmcoGDJuv8qHkl6zmJZpQibrmzT1JU2nUHZVwqIVjfYyT76KRIf3cnlTQsa02k87qUHVeI0WaZgM2QxJmq+jtB6WkHKafgNKln0cOrIHB1UovoAH7hTEteYx++Hx7Z37S3zHbJkzwKjOQkGNBhCKsVzZE/Bx0sMc3WWnFAO6K/rkqdOEg5P56zO+B/j5sfKnoBRvx085IOxut3RlmVrqGAa14v1lLrAmYNXlKpTe3eWF/MiWeL2VbnipuURLDDWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BY2EWk6766vfAS7e/7vqCxVzF6SkljkVT3oVy3yklc=;
 b=rrqcTl5BHBQgDxHFpV0j8cK+slgWhLt72+lWKZ7Z5Z67ALurEQ0BSwUYidlltZefYozeH+jj1fOAr1FCndIKRhvxqG4wDaoyf6OoiIEDlt4Iq/52Ud1LbtYGNxbHvpYookqM1KodpdFxkQ+dMfxHog4q6fiVaKu6SOADDo58P1JizYYRAQzq+3D3P8kaO2EJ3Wc9DFtXNjvRzLbJ8GNEtTeqm3Lw3abC5Sudc30yrahjKJCx6HxDM4KBjuFGNe7s3C9I2ryVO++gxO+2xwzt/RpM2WPuYbHFh5yEujyjAV/wAIEi342FaSKTGvjBRC3HwW7RlpNlsuOuXcd4PCIdfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 12:52:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 12:52:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Jun 2025 21:52:35 +0900
Message-Id: <DAKKHV3XF7SE.2R83O5PCSDNK6@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 18/20] gpu: nova-core: add types for patching
 firmware binaries
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-18-05dfd4f39479@nvidia.com>
 <aEAf3GUUz5oxnuk9@cassiopeiae> <DAKDETL7I95F.31L41GTLYNBWO@nvidia.com>
 <6e97aa79-6d6f-497f-96d2-7568d6516682@kernel.org>
In-Reply-To: <6e97aa79-6d6f-497f-96d2-7568d6516682@kernel.org>
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB5716:EE_
X-MS-Office365-Filtering-Correlation-Id: b91c57e3-52e0-4dbc-56be-08dda9b002e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkdodVU1dzF3NTM1d2lHN2M0OXpHSWtrQjVrN3I5Q25xejVaSXl4TE1YaW1t?=
 =?utf-8?B?bHlQb1NiVzNKTVZxZzlOU2RGeHpLQ1dxdnlacVNHaWZFRHZvREViTE5HbFNN?=
 =?utf-8?B?aytPbEdhMS9kRlh1UzhCOWVHQjMwY2xVTmx1VGNocjcrL3ZHcXRzU2dRMXR3?=
 =?utf-8?B?ZmtUQ3hIRjNXNXJMZERyZzFtRWc2VVBXWHFrd3o4RFpDSjg5K1pHS1lYTE54?=
 =?utf-8?B?ZlFibjRQS0psdE8yZEVoTmNaNW5Ub1JYWHVNcHNRaWtubit0TjZ2NHVSTVVw?=
 =?utf-8?B?a1Azbkp6Z1hjU2ozNSs3YXc5cXM2R3ZpTkVvN1NtNXlGZW5RZzZjVkdtTHBV?=
 =?utf-8?B?VU1SemZnb28ybWRwNlJ5dDZwdllDWlNveEJtMmpIaytpVWNESVRhSXZzUE1Y?=
 =?utf-8?B?ZWQxVTVjSDhybE43Q0VvT3U2SFVGN2pFdXlFbjYwMjd4SEpTTWtsY0lQaW44?=
 =?utf-8?B?Z2lFTmJaczNlc040N3g4d3JsQXI1cVhlQkVFam9Ka0psb3lvdTI5WlVmRnFu?=
 =?utf-8?B?Z0RkeEJ5TWdDc1ZiR3Y2SVo3Y0plTWYrUEd6OW9NTHgxRzVTUnNJRDQ3b0w3?=
 =?utf-8?B?c0g2bjk0UTJOSHZHWUdEMGRVS2h2T0d6TDRWc0ZKRU96b0UxSEpZTmlRVE03?=
 =?utf-8?B?OGJ0WEluQ0F0eU81d1pIcmR6aVdicjdEdi9oVnNiNW84Ym5sSGZlR25oODc5?=
 =?utf-8?B?STVVMytNUkNMVlpFRld2YUJ5RTJ4SElHNEpZNDA2Ti9LaTdhTThuZmVxWnQ3?=
 =?utf-8?B?QzNLSFV1UjFadzE5VmF5YTlPcU1jODNPK010SFVVRHNhS3RGcm1JV3JSMlMy?=
 =?utf-8?B?dEkyRjcwTnNvMUdtZWYwNDdzcXJRVnhGNUJYUEJERlJGNm1lajBPZUpsTzVw?=
 =?utf-8?B?V3RNdThKMnlTZGxERzVsODJMeUFsS0FGQUNPYndvSCtzaWlXbnpmdTFDMnZT?=
 =?utf-8?B?RHdoWmFTYVlvM2NzaFFOTTcva3diZ0F0WWJCc1FGS016V0U2cFczN3dMSkJ3?=
 =?utf-8?B?SUpodTdDOHY1N2E1SE0wMzR5aCt0RGxhTFdQdk14d3lFZ0xMb0FrMHJld3Zt?=
 =?utf-8?B?YzFsN2dJMS8yUXU0b0NSOWJRUTc1am1NOUpEWUZQZlljWDdFZFN1Ty9wZEhD?=
 =?utf-8?B?NUs1L0NzUVUzeStERzJiU2tEMndYa09GRFJZUEpLektMdlk4NlQ2dHBiU25Y?=
 =?utf-8?B?ZW81aW1jeVZ1Wm1ST0tGUzU3OFNpR3NIVHc4MjBLMldtOU0zQzN1TXh2S1FQ?=
 =?utf-8?B?eXB0SWdXaU10eVBxVzZwb0t4OTkwTTloMnJYMCs1R1JDeWhyT0RtOHBBemk0?=
 =?utf-8?B?QnBlcVN6Ty9Dc01jblRmeVlTUjNJalQySEhZa0VqeUNmQ3pCcG1pb2R0MG5R?=
 =?utf-8?B?M1pueUVrMFJWOVBFNjh1OEY5SzRtaVNyZDBtaHJscWhhbmtKZG1QVjlqc09q?=
 =?utf-8?B?cHppWVhublNDRDVkYXpQc2dKcGRWU1dOOVFraEJGZDM3ekRLVEtWT3Fnak1o?=
 =?utf-8?B?d2R4WkVkRlgvRzZlVjBPOXRjMVppYWYvWUdEQXhYTHpwT0Z6L3l6RjhmM1Vq?=
 =?utf-8?B?TDFJR0ZhdDJpOGU0NE5GTTE3dERma0F2Nk40ZnVEYzdoemNlcnNPSXQvcndH?=
 =?utf-8?B?OHJpWjZPcFY4aGUzZlBBTHFhTUIvbkJwdGhOYVB1T0hJTkpRcWk4Q3VsdEtq?=
 =?utf-8?B?RU5GVnlNL1RsYkFoSjM0SHRKQjNwQk9UcmpEaXR6cXFqcHg0V1hGOFpwZXRi?=
 =?utf-8?B?bElxTmI5V3FRd25FTjY4NnJhS2I3MHBQdVZEc1lzOEZDT0grVGxzZjg1MGlT?=
 =?utf-8?B?WnF3RWxGTHRvQ3BDc3R6eVBrZDZNM1U2NnBOa050VG50RVNKZ1pabG5lNDJR?=
 =?utf-8?B?Q1FET2tpQ0hYNnhIT2RmZGtkRXltVU1zS2V5WGV4Ykk4UEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3J5RWFPVlM1cGhQRjRHSTcxQXRUZG5aTnBJdzRUNjBQQ29jZ3IxS1A4Nzg0?=
 =?utf-8?B?MDhKeXNXNFdNM3hGcTcwTy9hbEFMYTB1VkRNQzEvRW5RK1ozSC9rRTBIM0VD?=
 =?utf-8?B?dm1WRDdqN2k5ODlVaUk2TWRHTDNkSnNUT29SdVBzeG9xSGtPRUFkV1lkUk5t?=
 =?utf-8?B?OURkWTh4azhOcnhuN3BPdHdralIwalIwUHlMd2NJM2ZRNlZQcEZHQzlsWjIz?=
 =?utf-8?B?RzJXcmxuMWNvdUludDlUV0h4Q3h3U1RvcTVOQXBud3BkKzJacTF4Z25ia1kr?=
 =?utf-8?B?QnA1OFdVWkcvNStYTDJHc28wSk9EdkYxTkNDTnYxN1FXQlhibVdZSFJBcnM2?=
 =?utf-8?B?N3B6Uy82dklNRVRocmlaMXRCNmg5SnNab21QQVh5QVpxN0VLYXJuVjVvcUEx?=
 =?utf-8?B?TUJTZWNGMGNtZ0o4SzJETUdBZENZeUZlMFErRXdYM2E4bGltR2pUVG5sZkZu?=
 =?utf-8?B?c3QybHV4N3ZYVll0VmRONnlTK1VlK2xyc3ZuRDBuNHQ5VHpCaGpScHAxRGJl?=
 =?utf-8?B?WEVhRHBFekhsR2NQZ0NlN0c4N21CZ3VobmpZWWNCUUdxem9VY0lEckdDREZY?=
 =?utf-8?B?VGJrOXVTWkExcldWZHpxOVIyRWlKakVMWThMT2VzOEdsM2pBblJzZEdoRWkw?=
 =?utf-8?B?RS9KSzBKVTdrRlc0VVg4Z3VjMkgvT05zTlVicnFNdFpnU2JHSUloNFVQcDFv?=
 =?utf-8?B?WnE4TkxEOENVdS9BZmxJcWIvSndveTQrbXJock41dUYrZ0p1dktWS3ZJVXVW?=
 =?utf-8?B?cGlKTlB6bzIyVTBmRk91bllyTW5iSk5zb3dkZjNjWm1EU3JHa2JmSXlOeXI0?=
 =?utf-8?B?WThvampCVllyQktpZXA2SzZCUEt5WFhtWkhWN04yV0gyQk5FWlJteXU0eVhv?=
 =?utf-8?B?aXdidytUOEMvRWV4RmlJY1JHTlRyL04xSU5pVUhwK3AxdGk4UXVRZjJaaDFi?=
 =?utf-8?B?WG1MS2NYcW9maFRHSjZYTVg1ZkdRTWpYYmpwTTF2RTEvd1FqVlVFcUR6VzU0?=
 =?utf-8?B?Y0FtZ1ZJRStQQzZFSEFPTkx1OVVHd3FHWGMrZng5ZjdmUmZ0YjV4ejBWQWtF?=
 =?utf-8?B?SVJ1OGl2UW1selVCODlYSm5UVEhTNkc5cElUK3RuaGJrcUE0U2JEOUVrSDNX?=
 =?utf-8?B?dFp4N0NmZnE3TFNBWVpGR2tHQjhCd0dWQ0g5aFZySmUrbFpiVnI2RWpBbVZl?=
 =?utf-8?B?WlY0TGhoVVlETld1dytDb1FIVkliWkdjTXJraU5XVlRxRjcxcDBRK1kzeXBz?=
 =?utf-8?B?RU5SMVhqK053Mzdadi9LSmxmMkpQbkMrQlpNYzEzTCtPdEN6V0ltV3RvNVlU?=
 =?utf-8?B?eG0xMGF4ZHdOamhPR0hNME9WOHVrNWtKMzQycXNoOFBVVjZMcllxOHJvbm9U?=
 =?utf-8?B?Z2w1KytFTm9zaWRyd2pJUnFYekFjRVYzUVoyTG4vMHFkOHhnbktkMEQrUTND?=
 =?utf-8?B?UWNUa0h2WDdVYkhkajY1KzdhRkVYV2c4RkV2SVZHR3k4ZExPSlJMZjVoS1Nu?=
 =?utf-8?B?QVlYaVVPNHRjM3lYNDNQZlJXU0hIVi9FWHlSWkRVdGhHMWZLR05HTzVuVWhw?=
 =?utf-8?B?SGpPcUt5K3JHa2tHb2paeDd3WkNSQ0JlUkJXMVh6MCt2MXo5NDZ1dFRkRGxm?=
 =?utf-8?B?V3VkVDE4ZjBqN05RMTY5ZjlzaWp0amhUejhzVWYwU3BhMnJPeUVaSmhURU1a?=
 =?utf-8?B?SUI3RHE1ZEpjVFVYRW5IcTB3eVI0MXdPWldDTGxyeFZTVXdRZTNoTHd2a2hy?=
 =?utf-8?B?Rk5QbVJCV21JQ3lYbW4yMmNZTVA1alRyMGZlVHlIeEh4UkRaSXowVmRmZkVO?=
 =?utf-8?B?Skg1ZHVuWDM2amhReExiWDlBM3VJRjJPYUxCek9STWltMTZtb3lDNXpXTFN3?=
 =?utf-8?B?UXJNYlIwWjlhNnhRWjRHRjNLdU04OVh5MzZtalB5NlNOV1pCQkhHbGNHckZP?=
 =?utf-8?B?WDRkZFZRN2QxZWFTcmZtYU9pc3pjV25jcXgxSUxWMEFWbitIZnh3a0t3ODVa?=
 =?utf-8?B?QW5vMUZqR0s1NFN6RVd0cjhaRWdtWHFhM0xRMmMwMG0weWdyNDBJWENIWVZ4?=
 =?utf-8?B?MVp4QWJDR281WGZCUGhTclRPTWR0Mm9Mb3pMK2ZSSFFmV2lQdzJiRU1sbEpj?=
 =?utf-8?B?aW9XNGc2dHVDRUhzN29pS1FLbXZjNWJERTFlMlhVM0hZK2ExeThzaUlPbE96?=
 =?utf-8?Q?r16L+GLrkcr9XvFTR4n5TOaxQbo3cYbyLm0xb78rYVJI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91c57e3-52e0-4dbc-56be-08dda9b002e9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:52:39.0114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q9xBwkUaWfiO9MGD/Sn27D2NO2t8whrL+VVSNNzEIRuONO/uTTDy0em03N8r+uZct627gxUv+si16HO5Aw5auQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5716
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

On Thu Jun 12, 2025 at 7:54 PM JST, Danilo Krummrich wrote:
> On 6/12/25 9:19 AM, Alexandre Courbot wrote:
>> On Wed Jun 4, 2025 at 7:28 PM JST, Danilo Krummrich wrote:
>>> If we can't patch them when the object is created, i.e. in
>>> FirmwareDmaObject::new(), I think we should take self by value in
>>> FirmwareDmaObject::patch_signature() and return a SignedFirmwareDmaObje=
ct (which
>>> can just be a transparent wrapper) instead in order to let the type sys=
tem prove
>>> that we did not forget to call patch_signature().
>>=20
>> This one is a bit tricky. Signature patching is actually optional,
>> depending on whether there are signatures present at all (it might not
>> be the case on development setups). So involving the type system here
>> would require storing the result in an enum, and then match that enum
>> later in order to do the same thing in both cases - load the binary
>> as-is.
>>=20
>> So I guess I would rather leave this one as it currently is, unless
>> there is a better way I haven't thought about?
>
> In the end the idea is to ensure that we can't forget to call patch_signa=
ture(),=20
> so even if it's optional we could do what I mentioned above, just that=20
> patch_signature() might be a noop?

Sure, I can add a method to transition to the signed state without doing
anything. At least it will make sure the caller knows what they are
doing.
