Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74253BFC309
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 15:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C210E7B8;
	Wed, 22 Oct 2025 13:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GK6UY7q5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013036.outbound.protection.outlook.com
 [40.107.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5A510E79C;
 Wed, 22 Oct 2025 13:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIXB4eDB3Qj9wYF8Yyg9r0VcnyFwxlym8R0jwUhiLjdRws5mvaOO8+nKZ399PUQ7nRFeILO6wA24Pea9ZjcruoKtldw+9rw7FrGpwOv9xdz49p5h99tSW3JxJ7sBlHXV+Kekkiy4r6P8VmsTrszKfDbQoadTJjzgQiGnIB8CwEdQ8WU5rxqhyn7Iqphw2vLBGhMKdjG+eszl1V8ydz8O3W5IVkYMCogUFYMq3o6dkM7tKegg0ylMCKSslAq82tHfoq1Zf6dsCzSqzJA+dd28y+rnbi1Sk+x72XiUe8Psew/UIsQK6UNqOrcNdEPsHxUSHm8JSVxy3kPpF+0pcd3ghQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QjJzHzcQPrlfssRf34tkreG7sfP99VTciae4qKJexi0=;
 b=u4ZCj4JvVH1zWgzs2fLrW4H3AsKvBZZWnK++LrX1k7owQ9E989WhwMj2gKF+/493GEALvlkJOZJ6suHUcMOUlCA9OZ82omhdsQSZ9ra+A6tT3L7C49m2nkHGUY4ZGd5cM0XaqV+XF048PABHqVA1UBK/Si3/awZl/LtHls1xiiOiuasXoPx12+8G9sE4TplO75H0AEj9CX1Z/J0VpeRAyex3D49RrXmUHFkqhU61Od83kHEnmVsRSdQRRvZZCLPb+S7N09qdRMhh2wqzSOzPGwLdB+vNQ8BpU9dPs15QOCxWrQ2zPJVLn/2zJEOiCNJF9iNs2g+jKdgLwyCqRuMMzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjJzHzcQPrlfssRf34tkreG7sfP99VTciae4qKJexi0=;
 b=GK6UY7q5NcVjechWLplEEEkEFWj2TY7vd+OPa7NI+cNr3tau9+ReCT46WtMutjJWKt1nrj6kNedS+6NqrTbVhgCQNVxSYWvHte7jRfUOlsXJ7LwkomOViumFuD/uNNHzQgGTMZD3oIRuqScPDmLHLOrs8q20t3w8T0gcCDJ5eSVHHNctmnbG8rHl9alOOMvkjPOJT0sPMRQvCsSJewMUzVshnw3xckVoDju0HHNXsR/jdAZXHELiY2fkZqxDG1/Vc9f/xEf9GrwE+138vfGGKw7PVK+f/IZ+xQpsx+lFtxFcN1P/uCrqHbHhl4GOYJQKZQEeqwiGBHsg3KiEdF9YKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7444.namprd12.prod.outlook.com (2603:10b6:806:2b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 13:36:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 13:36:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 22:35:59 +0900
Message-Id: <DDOW30B98WRF.2VQA9N45N2PYA@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel del Castillo" <delcastillodelarosadaniel@gmail.com>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
 <DDK7N52VX059.202D7SPGFV8A9@nvidia.com>
 <72cfbe83-e587-441e-abfb-b50155a326ab@gmail.com>
In-Reply-To: <72cfbe83-e587-441e-abfb-b50155a326ab@gmail.com>
X-ClientProxiedBy: TYCP286CA0178.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: da877e7e-7a62-416d-61c6-08de116ff1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nmpzb3FFMi9qelVNVTNyTmZVekNaWXp4eWtKVGdBYThVVHptU1VUUUNxbkpw?=
 =?utf-8?B?bDBMSm1JdW1naUl2dkdodWpEdmVZRlR6bkhkWXZIUUVSbURuTTlRWThuOSt4?=
 =?utf-8?B?blBYb01MUysvUjNNZXRhcDFPOGlJZVZiczc4SFRDR2w0M05PbVEzWTUrZ3R2?=
 =?utf-8?B?MndadXNJamRRRytYVzEyUU54NVBhbVdGU29TL1Ura28rWldYNi9ZRnRhRysy?=
 =?utf-8?B?WGc4TWwvVHdXTFJXTjhBa3pXNW40REJhbUg5dlV6SGpTOWJIN3oyTWhWc0hB?=
 =?utf-8?B?dUxhd3NVbTk1cUFTRU1Yb1gzRXlVVGR1Q3NFQVNheUkvZ3dIUVNZUXhYWW1I?=
 =?utf-8?B?Nk1JN2ZBalJCNlZzTXdFSUVLb2hwQkZVWEpmQVA0QjFiN2kyYi9HN2lPTjVY?=
 =?utf-8?B?SHp3Y3dCNXRDeDRNVzNPQ1IxcEVMZDFIWVlvdU0vSCtqZklTbll2d1pNSlov?=
 =?utf-8?B?VTFPOFJIb24vcUlxeW1LaEsvSWQ5Wm9aMGJMa24wclVYRVE0d2QvN2RJZFk1?=
 =?utf-8?B?TTlyT21ZUHQ3emtnQ3FuempUWFFhVU0zZFZhZ2I1dldxYzFCaFhHanZhbmcz?=
 =?utf-8?B?citZc2wvMjhlL0FpRkwwMlBVZ2NDWGd5bzBzd3lPeDlPMkxhUlBQQjhuYitK?=
 =?utf-8?B?RkFUMUt6dnJqOStDTWk0enhONnlCR2RTR1RiN1JkTXFoL1dQYzdWaExZSGFV?=
 =?utf-8?B?cEdKUW9HbUJic1o5ZmJZeTNRZEVuZ2pIYTUrMGFZVktSNUlJOGZKZU1tWjVi?=
 =?utf-8?B?MWFWK2l2TDR6TFkwOUpBdE9JQ0V0eXJPaURIWmRKR0k3SUI1ZGRzZE1hRlVt?=
 =?utf-8?B?dnF2Z3h6a2dRcXN4K1hxS1d2dGR3OU9mV0FQSERzYnhlN0hSV1VxYUdFWldt?=
 =?utf-8?B?aHdFQ3ozbDloRVRxZVhTUTFsRlJxd1B5czAzM2ZtTjQ5YlBqaFRLYVhLTUVR?=
 =?utf-8?B?aU9COTEvVVVuWFVqbDZiSXp3YklaYVpwUUxicUo5Slp2SDRnaE50TkdIbEl0?=
 =?utf-8?B?UU1ldG1tR0tlTm5MbWdnNkxVaHVEbHBsT3p5Wm5uMkUxNEpObnRnNzhrR3U1?=
 =?utf-8?B?bk5MYytmMUxMZVkydUgyL09vLzFvbWM4cjJGNXJETy9sUlM5L29LZkppWUp3?=
 =?utf-8?B?N0xTUmt1UGpuVUFvcmFlQnR5MmszZXJlM204NXcxUitwRmpBalpmUlhWRm9M?=
 =?utf-8?B?WGl1b3phVGpNRW56dUlQRXVZOUFmZUdBOXZ6M2Y5eUorWS8xVnE3YlM5VnJj?=
 =?utf-8?B?OWtFVjdQTE5vQjBnNHVCcUdwSTZmcEMwKzZGVEt0M3ErVGRZL2FaUmRuVmsz?=
 =?utf-8?B?clRrYnlGZE0zUWZUMkpFZTR3bmptbkpKSTVsQjZjL3RUMG8wQ3Rab1hZRWxz?=
 =?utf-8?B?V2hYQ0VMSGlhd2w1U1VQcXRzazUzSGM3K3JIWk9ESC93L0hua0lIWDY5Nzg2?=
 =?utf-8?B?cnFuQ0RLT09PR0RVSWExQ3lzRzhUdllkeTlIMmk0bjRsd3F4eG1PaTlBSEpi?=
 =?utf-8?B?Vlk1eU1BU21hak1hbFd0akI3NS9ZY0JVQ1EwRHVITy9yWDlyeGlCN3lEOHNT?=
 =?utf-8?B?dENKNGZJQldMdVJ5ekdNUENENWpXNURBVkhWU2xWd3hpZStya201RDBPRGxI?=
 =?utf-8?B?Y2o3SDRpUFZsM2dtZWMzNUFGS3M3dkhhWXlvVndNanZCSzFONjJzUnZJaWUy?=
 =?utf-8?B?T3VwQURwZjVLelpkY2ZLa3BsY0FDb2pJZDd6N3NoZmR2Tm1oYTVHV1BML3BR?=
 =?utf-8?B?TXZPMGx5TU5FQmtsbGxpaERSMkh6WTBIOXl3T1BTQ3BMS0htTm9qM2FGckVj?=
 =?utf-8?B?Njk1cytSNzQ0MUlNcWVVSWx4dGNTbS9CSi9wNDZhdGt4c1pHZExPWG52OFli?=
 =?utf-8?B?ZnBWVXM5U3Q1Zzl5dlhjQ1NxRnlINXlkK0RtVXZpNGVnTXFYQ0lNWmhweC9p?=
 =?utf-8?Q?/eVN1fXhpbh/SG5Xn0YoESeaNYDvDwLO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWt6Y0JzTDdsTnpFTm1FU1U4TVBJNzhSN2RVTVB3U0NFUDNmK0NLOWV1Q3M2?=
 =?utf-8?B?L1k3VUw0alNEMFdWTFBORFZzd0ZHbk83TVhhdjN4S0tJNFRrZHVRSGsrR2Yr?=
 =?utf-8?B?eUVXRTlOQ2lHa3FlS29LQkFucVJ6ZUxYeTJYZ3ozNk5IZUVzQTRNZnNSZ3B2?=
 =?utf-8?B?Y0xGdXZUcDJVVnRseDFlNVkwK0JnM3FKcmZvblgxTy95ODU4L3l0MTBOTFdu?=
 =?utf-8?B?azVPbmZGVmVOK3VydGtXUTE2Rk14dmxnKzlGRXBnUHR1MG8vN1hDRGFWelhH?=
 =?utf-8?B?UEZwL2UyK2pzcDVpZXJOR1hVZVlVNUpaZGhiZmIvN2VoTGhPVk5YV3kySnBh?=
 =?utf-8?B?V2xCUkd3UmNEV1ZNdVovMlpLd0t4eEdDb1RnUXdRVHdCOURCU1pDQzRsSlVD?=
 =?utf-8?B?cTVpVFk1MnFBVlVCRW1WRHN5c2hkbTNFeHVPeGdsNkxsWEpXNGNmWXExNnpt?=
 =?utf-8?B?WFBUVUtxZHh3WVM3QXJ5K1lXeGtoNVQ0UmpRSUJyS0N1dXFvek8xQ1kzK1NO?=
 =?utf-8?B?d3FkejlaWGVXSTNUbVVKREp3eG55ZFMwc3hEOXNTaEZlVmJVVjlJUDdMTHI3?=
 =?utf-8?B?aWZ2enRzQ3E0dlJ6dmJEWHNaYUJYd0JsSU1RS0x4S1JKZkVITHY1UVB1RlRQ?=
 =?utf-8?B?ZTByMGFIcTNmNWJuUUFCSWxzRnN6YVFpSG9lYTArdWZnTk13NHhtNmRpYjhN?=
 =?utf-8?B?V1pxK1U0SGd3L1NpWXdyV2xXMS9XUEhIT0d6dldiWXpRZ2Y1TGxONkFBNnln?=
 =?utf-8?B?V1VKOGJ1QUpMUzVIRVlNSlp5TEdkaTZmaHIvK1VMTzhKcmhMUkNCd2ZWRkYx?=
 =?utf-8?B?OFlrT3F3YmRCZ0pVbXVaMklpcUI5SjNpaGtPTUsyU1lVbWpWcGV0a2RiWW82?=
 =?utf-8?B?dTdxSmhSYnpKc2xJZ0g1SnFVSFpwbi9kMXNRRm9Wb2RnVUx6VnBXc1pYYjNS?=
 =?utf-8?B?VlFYN1NOVUgxdUdpbnBKZW9tRlVXS1orSTR2YW94amRidjdtVFNaR3dzY3Vk?=
 =?utf-8?B?ZXFJNmxXQ2x4VmZsOFIvWnkzKzl6NU5sQUgxaS82cG9DR05TS2owTFp3QnhD?=
 =?utf-8?B?ODJtUi9ZZUsyNTB6Mm1EdUg0ZDNJZExWdzI5bE9uTFkvRFk1WlR3M0xaNnJ5?=
 =?utf-8?B?YjM1bHR2WHVUN2o3NXZ6cTFyYmtSN0xPVjhERDh3bkg4blRzVmFtdWt1SW5N?=
 =?utf-8?B?VEVmNFcxNGJrRGxENVVZNmptYlhULzJTazFaeGg3SlYxcXZCQzRRVFI4K05E?=
 =?utf-8?B?R01LUFh0QTBzZHYrZ2tVaTNmRXBGNzBwd3NqZUVGSW9jaW14NDJOZnQrT1Y3?=
 =?utf-8?B?cEdHaFJjenl2WE1MamhzSi9yak5tZE9iejI4eE5QUUlGWjA0NTQvaDVBRE1p?=
 =?utf-8?B?VXFGbVBpY0hDZzNiOGZTd0d1U1JQL1JBNE8xYlFHaFZIbTArM2MvK09VWUZQ?=
 =?utf-8?B?ZFdOQkpWQURFK1hnM0hua0Y3RHhwRE11REk3WDJkek1acEc5WWtEa3pSMklw?=
 =?utf-8?B?YWl5OHRiRTZPQTJTbGljT0xFSjluT25rSThhRDlXdUJ6bDQzVlhvaFFTM0Nu?=
 =?utf-8?B?YXBsS3VVcE9yQ0QxdlpNbTZhMlBZd2JLL202SlBJTTkvalNDQlYxaEdNUHNM?=
 =?utf-8?B?MmNFKzZybVhocnJsb2VWUnNJZWtvVTdNZUFDTmVEcHpRbHNlSzUzVDdIb0tX?=
 =?utf-8?B?b1RhQ0tqc3UvMHFra0diYnJYcE1hM1BSQWQxbno0Lzh4dzcrVUhqdUVZaDZ3?=
 =?utf-8?B?bG84VUtrZ3VLR2kwVmFjZUZIMlJzM3RWZHZMZmRCcUZia1hKclhWUW00OW1H?=
 =?utf-8?B?TVhuVGV1VFhuSUxQUGlkdVJ4SkttRHFJbFprZXUwcld4ZXBjaDB3TUdrcDY2?=
 =?utf-8?B?bjAzOVplTm1WcFZ6c1cvZFROUTVycVpFdi9RbVJQSi85QzgvN0kxdmpnSjJm?=
 =?utf-8?B?dmsvcmpoM0ZzRnRnUDdJeDVvVW9uRDFZajJvK2VlUm1xOGsyQ3QyT2xTS1RS?=
 =?utf-8?B?MmxVMDFmdkNZNFk4R1B5dVFEbWg2OGlhSDRYZ080WnJ2ajVReTNwUVI4cGg5?=
 =?utf-8?B?cmZNc01EVmlaRTBGM0dEbDV6cUpHZ2lJTG5TV1JCU0ozb2pkYW93eTBZNjJU?=
 =?utf-8?B?Q0o1WVVKcjlhNmliNC9LZFZ3TTlzcjhROW5YSmpiZXdLSlVLRUd2eTcyaEtX?=
 =?utf-8?Q?+FkcaKjtwS1hcqIYMaXv/II0fTIx62zIn2/m0GDK2Yu0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da877e7e-7a62-416d-61c6-08de116ff1ca
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 13:36:03.3766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSo/I6f9skF4g7wp1TXJsJ9TGMlI3FlNUmxpuCoigWenx4FaklTn9sDVpTmEOH0rfltkFOn4ZGKyLzX+Qi63og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7444
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

On Sun Oct 19, 2025 at 8:57 PM JST, Daniel del Castillo wrote:
>>> @@ -296,24 +287,19 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &=
Vbios, cmd: FwsecCommand) -> Re
>>>                  size: 0,
>>>                  flags: 2,
>>>              };
>>> -
>>> -            dmem_mapper.init_cmd =3D match cmd {
>>> -                FwsecCommand::Frts {
>>> -                    frts_addr,
>>> -                    frts_size,
>>> -                } =3D> {
>>> -                    frts_cmd.frts_region =3D FrtsRegion {
>>> -                        ver: 1,
>>> -                        hdr: size_of::<FrtsRegion>() as u32,
>>> -                        addr: (frts_addr >> 12) as u32,
>>> -                        size: (frts_size >> 12) as u32,
>>> -                        ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
>>> -                    };
>>> -
>>> -                    NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
>>> -                }
>>> -                FwsecCommand::Sb =3D> NVFW_FALCON_APPIF_DMEMMAPPER_CMD=
_SB,
>>> -            };
>>> +            if let FwsecCommand::Frts {
>>> +                frts_addr,
>>> +                frts_size,
>>> +            } =3D cmd
>>> +            {
>>> +                frts_cmd.frts_region =3D FrtsRegion {
>>> +                    ver: 1,
>>> +                    hdr: size_of::<FrtsRegion>() as u32,
>>> +                    addr: (frts_addr >> 12) as u32,
>>> +                    size: (frts_size >> 12) as u32,
>>> +                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
>>> +                };
>>> +            }
>>=20
>> I liked that the original code updated both `init_cmd` and `frts_region`
>> in the same match block. I understand it might be difficult to preserve
>> due to the borrowing rules, but can you try to preserve it if that's
>> possible at all?
>
> I agree it was nicer. I tried to preserve it, but I don't see a way to
> do it cleanly, as I can't keep both mutable references at the same time.
> What I could do is only check `cmd` once, set `init_cmd` and store an
> `Option<FrtsRegion>` that I will later use to set `frts_region` if it's
> not `None`. Let me know if you prefer that.

Yeah, I agree the borrow checker will get in the way now that we have
fixed the lifetimes.

What I wanted to avoid is performing the same match operation on `cmd`
twice, but if that's difficult then I guess we can live with it. Using a
temporary `Option` comes down to the same in the end, except that the
second test is indirect.
