Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCDC1346C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:23:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5CB10E59C;
	Tue, 28 Oct 2025 07:23:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KlufcyN+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011033.outbound.protection.outlook.com [40.107.208.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A11610E59C;
 Tue, 28 Oct 2025 07:23:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHUAhwxUkZtxtvgncGNG+64hdbcrvn+eH4wmwu9YFDLxIHcoTTaIsO49i2v3SY3t8xYHokpCszXJGj64UHbPXDwSq2QDM4pYqO7fXlBsYgwQnC5uKinwWWkLdYcjfJFOz8okNYzBtAFuOiSVMD7gmdXAGqji3vJmXYWnKJR7QVWomUWv8bre0DhQ6MgTNYoV9D2zf6ZJTQHettcCGbG1uvlqXsLj8MTUhtAc6D2qAZy8YYzCVf8uvh8aKFszxaEhVEozHZy+Tf9zIP9eprwE/kbJlmfFIZ170B+uY5hIoGKCiqTWbu5dhTnqvtwtFisyPNnILU+hifbATzSYdW7mog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hooZpu54js4GLcP9Gx5BNma2IbJZaBRt9gpCYOI6ZCw=;
 b=HyO5b7nE9Pc2ozlq728Tz3F8JQZamvrmHt9L9QhyqJUBRqjHMbs6nN4te8KB1OWrulfaaT3AfZBL61aun5WpRxQnfPsUK4GvhU9RZdDW3QXHlXb5Ao33WNJFGPQkPAcKGSnDeOZUBHlyPecESus7sb9xdzhZVqDafmphEFwy59AzyB3CvmGC34yDK8RiIbYwsMlyGyL72uzgJA/7cymGlm2U1x/JvP6KB1HAvszjV4KMSZ5iV2O43XjkBNsOYYLAsozlV0hlpVnqr0gPVfgr1gmUxcrxpUEEHLvSu6lwXyKND7MwFx0tVcf4QULQG10R+kjr5vvg6H6xLj2eSUofqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hooZpu54js4GLcP9Gx5BNma2IbJZaBRt9gpCYOI6ZCw=;
 b=KlufcyN+P9Chw57zuL/+7H/CrYAeLfx0hDlwWan3PDNCIGYc9haybFC3MPR+K7sr+sLy3Rnb4vGgiYJAdoPGWsXD2HLWygpAjTdtYDnh+V4Ux/4y1hPe9zstU3Zb2UUqDn2lH0Mc+vzhH8FeJi7yOYdyc+cKliB+nJcJHg6vDNaSPaZcuyUO35ki5F/C/3CYhyEOYCp/eyXH22d7Z65KWcIHacfNNn+r+1BmmjfA1fzdIDzMLvS/JsbZGX67Y25CEz8c0Q+52el1TFaIgT+qZgc7gUgNGKClve3I8BZVf9pNquf2wyU3g5KwRzSEi5wUaO9TsAe8YxdDi3Gw3V/tVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 07:23:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:23:36 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 16:23:32 +0900
Message-Id: <DDTRX3S7VYX1.1L0T28KA1NJ5M@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/7] gpu: nova-core: add extra integer conversion
 functions and traits
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251027-nova-as-v2-0-a26bd1d067a4@nvidia.com>
 <20251027-nova-as-v2-5-a26bd1d067a4@nvidia.com>
 <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
In-Reply-To: <c94dd17e-0e81-47cc-9482-e8743d3bc68f@nvidia.com>
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 78993b96-62f6-42ef-630f-08de15f2e86c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzlQc2Jkc0tzSXVzblhhQ0xmS0Y3RHZSelg4SS9vOVpnL0x3TmxzZDcySlZV?=
 =?utf-8?B?bEFBQ0JMZnZrUVh0aUIzUmtURGpxcjZNVlUrN3JZeFhhRVRTajRPWnZCUkVa?=
 =?utf-8?B?RW11Z3lNV3pzdkEwZmRzN2lGREdsSEJNQVA3czNjMFE5OHZLN2hWTFM2WFhK?=
 =?utf-8?B?bmZCbG5lQldFVGNSTGNWcHNveWFwK0cyeWpCZ3NnYjlhWmpyOUdzV3NYdjNJ?=
 =?utf-8?B?SCtvZzlGYWNQRlpLalBmZ20ydXhTTENFdXk0NzJETHpxNUZ3YkZNSEtENUVJ?=
 =?utf-8?B?V3pFV243VFBuMEc2MTlPdkV2WmVXaCtnTE1kUStNbzFkVW04UHM1VkhLUjVE?=
 =?utf-8?B?czdtRlFsZ1Jkd3A3ZGc3NDR5Zit4TGhGZXJTV2NGSlgwMUJjdXE3SjFTaU1s?=
 =?utf-8?B?bmZ0MHd3aDUwL2wwc3pJMlRubno4Vi9BZm9pVW1JZVRjL1RVeVVTLzhnMkk0?=
 =?utf-8?B?ZHlpUzlpZ0NzWVY2ZXFjZXpuS2ZJYmtjU3U4R21qNnlFZ0cvY0tIS1p5OHVN?=
 =?utf-8?B?U3FteUZLREpXODdLV1cwbDNsN3UzaGxPcHZsR0t6eCtXVTZDblVQY0RWdEVY?=
 =?utf-8?B?UlFPNmdwQVdUMldXaXZldFdvbXN6YURYbzN4RTVXdEg2RFI0MENsVUMyTTZz?=
 =?utf-8?B?bjR0dEVISFdQRFBPWmZqVS8zbUgzSm1iTGhqcTZyUVkyWmMzM1ZBZERERWhk?=
 =?utf-8?B?ZzB3YVU1MjMxdlNSN0VzUG9ldnJFVWpSZ1QyVEsyRXBhcys3MG85RjhlZjIy?=
 =?utf-8?B?b2pYV2RsUTdUZnN4ajBoU0lmeU50ZTRHR0xwaE5JN2laRnhMajE3UGNGNFdZ?=
 =?utf-8?B?N3lkYnRKekRVYkRwQjVhZjRkaHlPb1BmV083Z3N1ZVo4SzBiQ1NQc2FTbHZI?=
 =?utf-8?B?MDQ0OVZkNmxSeW5xZjVKOEloN1dDNk85ZUJVR0J4RGlmU3ZESVloU05RVmxJ?=
 =?utf-8?B?T2FaejlrTmppWEJqcVRSSXdDNTloUzdsdUJrcVBvUFpkV3pFcnF6UHhNK1Uw?=
 =?utf-8?B?cTlLSUxVbDlwTnhBZVo1VXdteU5mZUpCMkY2RjgwWk9QNWtwckd6c3ZUZTJD?=
 =?utf-8?B?ajJOeDRCam1GK0c1RUZIdHhZQ1NHbUlYcXRnTzFJc0FUQndKYmowREllZWo4?=
 =?utf-8?B?Z2JlK1Y4SWJRbDJsM0hLN3YxUU1BK0xSaEYwQVRJblN1YjZ5UWQ3S2ZPYlBz?=
 =?utf-8?B?bUd6eXE1NC9JS3VqSzFTUXZuN2JqUnk0UEpyL1hDT2Q3M0t4OUMzLzhPdmR6?=
 =?utf-8?B?Y3Z3L1JONzgvT3hLOTZUUmJPWnlVTEpLVW4vMG5HV3VNc1N1ZEszYkZCazFs?=
 =?utf-8?B?N1pYa2JOZDdvQmFQTmxjYXQ2YWcrM1ZsRDY4QXI5U0VrNzcvdzhVK2FHckdD?=
 =?utf-8?B?YW84RGpjMUppdGdhbU9rQkdpMHU2RUhmbnpraVo4STllL2hTL0YvVXVXQU5K?=
 =?utf-8?B?dzFCMzVvempnTHpDalpac3dIR3lYcituazlqWmZ5Ryt6OVVSYVJ4REFlRGl3?=
 =?utf-8?B?anFlODlhQjhsRExCYStmV1dpamUrclR5NG5WUEpjNTBFRjNBdVNGUHlwM3o4?=
 =?utf-8?B?dm90Qjkya3hPd2dWQTFDendVeFdvVDh2WVRlZEU5QzJQV3JRV25IRE5tdnhP?=
 =?utf-8?B?NXorZW9BeGQ4U2VpRmw5TmpTajdGdms1cGtwMTJDZnFEOC8xMTkwaFdmSDRJ?=
 =?utf-8?B?bUdIczViNTBpOVgyT0dyM3RxYVNZaDcyQ1RkYzZ5WHF0dWgzT1RSQ0NBUjNF?=
 =?utf-8?B?UW00OWlmMUdQcnlOSDllLzk1bkVoZSttYU56SndhMkpvTzI2OHVrNjNraGJH?=
 =?utf-8?B?TFFCSG1NbTVJYXFNSWUvSmNDSmU0QWF3aHhsRzhJU3kxcXNpRnhCQjk0dVZC?=
 =?utf-8?B?dXYvQW5EcWVFa1RmSCthb1VyeWpsVlVkL2xVY0pFSTVNazEwSjI1bm8xN2FI?=
 =?utf-8?B?TnEvS2Y2TWhnRnI2YXRORWRpcGtjd3ZFT0FmZTBRMGpvWTRSUmQxbFh1Vjl0?=
 =?utf-8?Q?ragmDTVIqlwgoS/jH0Yd0pbe2wq/7g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZjaGJLR1ZNZEFNbnFKRGhVK0ptUTBIZlYxRkdpSVYrQzlZdzJmS3NmMklD?=
 =?utf-8?B?aVdGQ1JhZ3pKTFptaXVjQjJYME9yNVZDS2ErNzBFTDJ4M1YrdFV4V0NmOHIv?=
 =?utf-8?B?dXVkandlb3pGcU5XbnB3SHlSenc2QTE3ZGh1ait5NHJjWjk3b1dZUitYdWZ6?=
 =?utf-8?B?SnQ3TkxlMnRsQWRUYytkZFEraitiQy9CcUFyRmtKMWJwNDlubGdQS2xWdzNI?=
 =?utf-8?B?aVAvcHFWajZYY25CbEhyQnAxZ25LVWVNVFZab0RhMzYyelhjcjcvTitsWFIz?=
 =?utf-8?B?c0tlU091Q0RGMWZKYWwrTWZoNkVuTWtNZVo2eGthdlBMVkVzOC9uV0lCLzRG?=
 =?utf-8?B?N1hybGNQZnN3SXByMzVDTFZyckVlSC9XVlRObkR0SjV5LzhNVlBKRWZ2NWRa?=
 =?utf-8?B?NUtCVUI5Qk9oaFA2cS9PQVdhaDFjbTFQcDdDQUtOcFNsLzFYMC9HQnZjWUFK?=
 =?utf-8?B?cVFIWTh6V1QzYWIvc0hGd3RVMTRNbGZSYTYyb29sSjNTRWpWTUhVWGpFQnAx?=
 =?utf-8?B?cXgrUmRNUEtUM3lkSElaVEFZbFBJaVRiTUkvQTdOOGhlNHNMNU44Ylh0aWls?=
 =?utf-8?B?bERsaWhnWm1rSjJ0bFFQNkNlRStDNkc0UGdRT3pvZ0F4NGFleXRibTlML0pn?=
 =?utf-8?B?WUF6NnEreU1FWkY0cEhUdzBQWm1LdnM3UDREV092c3FRRXhIRWhKREtqQzkz?=
 =?utf-8?B?THJrcHY3eDc1cGNVaXo4SklrWk1VN2xQSHJaeDkrUkZHZk9vbGd4S0Ezb3cv?=
 =?utf-8?B?M2ZzMExPb2ZaTHZzTFBnWEE1Z1cvK2FTclhyWi9NY1lKWU5lRWQ5NnRGZERv?=
 =?utf-8?B?MVVUb1dTVkFtWk5BalRtVEZWZk1RRUFaVzNibXQxbnFqRXpndFJoLzJvNUVS?=
 =?utf-8?B?aHQxTXpBZHhBdFdiV1RKdFI2TEhzYUpEZWt6ZWptZFl5WWZnblJnc2tXRTFq?=
 =?utf-8?B?TEpvQTNTUmpScEVQQXNtTVQwYjd3OWd5ZjliRUw1UzRtL1NZMnRuTjFaNE5O?=
 =?utf-8?B?TWJnR2dIZGRDdldITjlZWEJpazlVQW5rb1hobG02Um1tM1VHOWphRXVGVk9k?=
 =?utf-8?B?OHlFYkhIeUZoRysyM25jd21xSFRMbURUczNkREM5dm9zZEZ4VDFnWUFmVGht?=
 =?utf-8?B?Z1FkUEpIWVJTdnBlK3NmRDlLcmpYVWw0RTRldUlDMmQxdmtRVGZ0K250NE80?=
 =?utf-8?B?UEVjc1h4aU1DT29tZFkybTE3MUd3YkxJOEVsVVlHOEV0TjhQLzY1Y08wSHBJ?=
 =?utf-8?B?OHczZGxnOVgyYWl4MjBxalFuM1UrZk5xSmFEUEVXa2hhbWwzMUJsb0p2a0VZ?=
 =?utf-8?B?UzZpakQ2YXBDM0JCd2JObi9KMDZ3a2p1bFVDTWV3N0l1TkZTaDREYjlvYkNJ?=
 =?utf-8?B?SFRuSEVXY0hxZHRsaWlaNGtpNGo0S3hFZHZ2cUx0Y2NnZXZ4dUFXMkZIc3Iw?=
 =?utf-8?B?RlZNOURnWG5EU0JnWkNvZUpyQ01GZkpWMGNXdTNFUUx3SDljdHB3WDRubXB3?=
 =?utf-8?B?WjFmalpwd3ZEWkJTMGMvUEl3azF2ZG5mZUptclNWclpCNkV4M09ZUzJTOWR4?=
 =?utf-8?B?dDNodzNXNFVNQ2JRMTZTRnV2QktvQ2t5NDY4UFF4UDA4MTdLR2JFUlljUksv?=
 =?utf-8?B?YTdtSDUxZi9UTTNBMlYxV3QwUE45TWE2bFBCZ0NNZ2lRMjJMV3BHWDRSd1VO?=
 =?utf-8?B?a3ZENzFxMjdKbWxNenNBY2FJT252Q3A3VUwrMEFZTi9xbVNpcVg5b2c2OVNa?=
 =?utf-8?B?R2d0YzB3WHpsZnIxWnBhVFliTENKd20wWi9tdU1vanczcUJjaDFBN0wwZDZF?=
 =?utf-8?B?dXVIbktTK241U2Jmd2U2SEtLekVZeHVIcXBUWmp4cG9yemoveXVLYURycEdz?=
 =?utf-8?B?Q25wSVdKWEhNOFBUa3liZTBlZWcyZXF5V2RaSzNkMjY0T0V2RWI0SUI0eCtx?=
 =?utf-8?B?OGk0TWJSVDNKYW1Bd3BoQ05Lb1VYcXVkVWpobWVBZGxDT05zaFBUOVN0OFB3?=
 =?utf-8?B?OFAzSFE5ZXM0UTNGa3c3OVdvR1M4eXZQajkyQytlc0hCVFBsWU13RG9BZVRF?=
 =?utf-8?B?NDE0cGhFS1U1VlVIbS9mUDhycEdpN3pqNjJNMnN2dnBCS1h5OTZKd29mUVpj?=
 =?utf-8?Q?OV6qZMc0AuvxHvXY62o4fr2oa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78993b96-62f6-42ef-630f-08de15f2e86c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:23:36.3325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w24omtDk6ywfp4jom4N0fbFgvnXtNyBKMDED3UPdnADco/2++8a4KC7CgOQ+5Ie7UcV+GhedtEmoc6w7Ozqq2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196
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

On Tue Oct 28, 2025 at 4:09 AM JST, Joel Fernandes wrote:
> Hello Alex,
>
> On 10/27/2025 8:54 AM, Alexandre Courbot wrote:
>> The core library's `From` implementations do not cover conversions
>> that are not portable or future-proof. For instance, even though it is
>> safe today, `From<usize>` is not implemented for `u64` because of the
>> possibility to support larger-than-64bit architectures in the future.
>>=20
>> However, the kernel supports a narrower set of architectures, and in the
>> case of Nova we only support 64-bit. This makes it helpful and desirable
>> to provide more infallible conversions, lest we need to rely on the `as`
>> keyword and carry the risk of silently losing data.
>>=20
>> Thus, introduce a new module `num` that provides safe const functions
>> performing more conversions allowed by the build target, as well as
>> `FromAs` and `IntoAs` traits that are just extensions of `From` and
>> `Into` to conversions that are known to be lossless.
>
> Why not just implement `From` and `Into` for the types missing it then, w=
ith
> adequate comments about why such conversions are Ok for the kernel, inste=
ad of
> introducing a new trait? This is exactly what `From`/`Into` is for right?

I wish we could. :) The link Danilo sent should clarify why this is not
possible.

<snip>
>> +impl_lossless_as!(u8 as { u16, u32, u64, usize });
>> +impl_lossless_as!(u16 as { u32, u64, usize });
>> +impl_lossless_as!(u32 as { u64, usize } );
>
> I prefer consistency with the notation in num.rs in the rust standard lib=
rary:
> impl_from!(u16 =3D> usize)
> But I am Ok with your notation as well, which is concise.

You're right, something like `impl_as` is both shorter and more
consistent.

>
>> +// `u64` and `usize` have the same size on 64-bit platforms.
>> +#[cfg(CONFIG_64BIT)]
>> +impl_lossless_as!(u64 as { usize } );
>> +
>> +// A `usize` fits into a `u64` on 32 and 64-bit platforms.
>> +#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
>> +impl_lossless_as!(usize as { u64 });
>> +
>> +// A `usize` fits into a `u32` on 32-bit platforms.
>> +#[cfg(CONFIG_32BIT)]
>> +impl_lossless_as!(usize as { u32 });
>> +
>> +/// Extension trait providing guaranteed lossless conversion to `Self` =
from `T`.
>> +///
>> +/// The standard library's `From` implementations do not cover conversi=
ons that are not portable or
>> +/// future-proof. For instance, even though it is safe today, `From<usi=
ze>` is not implemented for
>> +/// [`u64`] because of the possibility to support larger-than-64bit arc=
hitectures in the future.
>> +///
>> +/// The workaround is to either deal with the error handling of [`TryFr=
om`] for an operation that
>> +/// technically cannot fail, or to use the `as` keyword, which can sile=
ntly strip data if the
>> +/// destination type is smaller than the source.
>> +///
>> +/// Both options are hardly acceptable for the kernel. It is also a muc=
h more architecture
>> +/// dependent environment, supporting only 32 and 64 bit architectures,=
 with some modules
>> +/// explicitly depending on a specific bus width that could greatly ben=
efit from infallible
>> +/// conversion operations.
>> +///
>> +/// Thus this extension trait that provides, for the architecture the k=
ernel is built for, safe
>> +/// conversion between types for which such conversion is lossless.
>> +///
>> +/// In other words, this trait is implemented if, for the current build=
 target and with `t: T`, the
>> +/// `t as Self` operation is completely lossless.
>> +///
>> +/// Prefer this over the `as` keyword to ensure no lossy conversions ar=
e performed.
>> +///
>> +/// If you need to perform a conversion in `const` context, use [`u64_a=
s_usize`],
>> +/// [`u32_as_usize`], [`usize_as_u64`], etc.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// use crate::num::FromAs;
>> +///
>> +/// assert_eq!(usize::from_as(0xf00u32), 0xf00u32 as usize);
>
> This `from_as()` syntax will be very confusing for users IMO, honestly we=
 should
> just keep it as `from()`, otherwise there is confusion and ambiguity arou=
nd
> whether someone should use `::from()` or `::from_as()`. Please let us jus=
t keep
> all infallible conversions to use `from()`/`into()` and all infallible on=
es to
> use `try_from()`/`try_into()`. No need to additional `_as()` prefix, as i=
t
> creates confusion. In the end of the day, the fact the conversion is loss=
less is
> not relevant, all conversions that don't use the `as` keyword should be e=
xpected
> to be lossless right?

I wanted to use `from`/`into` initially but this unfortunately clashes
with the `From` and `Into` traits and forces callers to disambiguate
which trait we want to use with a turbofish, which goes against the
intent of keeping the syntax short. I'm happy to consider better names
though.

