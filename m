Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AE0C42537
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 03:51:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3534E10E2B8;
	Sat,  8 Nov 2025 02:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ABNgH8Pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010000.outbound.protection.outlook.com [52.101.85.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1DC10E282;
 Sat,  8 Nov 2025 02:51:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfavWNx4Qtrqc/HEWtCYSJQwSehJOgTeRa2YWl9r9bcxvMx54lxmMkohCaI+bLGTLvU5xLsBXWxbVrZFqp8hbpJXjcfTBz3jf8D+fghZM3F/0ru7EewjsM4ZPabfbioUdxHQSr6QD56U2sUR5xhVMHhbpUXVyN/J2Gpp0/sLOH6ycdWF00XqkHzIaeIwCaICqMiCVtBd/Uufh2hYTHLir+2iYDLjg0OflyzaOLmWPr4zCzg0I2WI2q2JNIQjxsvazf56l4RO83O1DPU0obt15+YHdwzoVkjoYzBmWQcmqyIyd808yB74ybVWsCbW3Su4AykxxKJIyzUEHvrmewS4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUE6EVjGshrq9ospPC09tGk7+lpROpZ7rKZPEthNa1I=;
 b=gJva391zIVX3Xq64d0WfHWlTDQjTi494ZnQl+gUQBTAQzl7p9X9gioWihdzhLQ6Cum3l83vw9rqo8cYuaYCUCE+MsVy8UZVDNOu9rxpgufhD9mYez24lpBzbraJq+RxdG9l06i+KZen4/BOjt/40ZjwEJ0W90+ya1OktLPNeIjGERGTTLxZHz38vIFTZJB/zL6Dr1MdIbex5v9Ii18XQPP/e+ZHqeAuXmNiT+uo7pnN+R5EjeXUtphbjMoUkmAMnd/7c9WoYO8uS/3uLF0jTQKLDZvBd6UxDMwpZ2K0zEuTE4EToUDIVDfzZ3D7TJt4HHuv9fXbYCfypBoIDIlGm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUE6EVjGshrq9ospPC09tGk7+lpROpZ7rKZPEthNa1I=;
 b=ABNgH8PlfQXPKlDmC7jUlHnkK+wn2aEQenZXIILvTTxklEwJIfffdTTopdpLyqjovr85Z9uFW/g8YyvOgI6YE0uoDMaqLEIeYPCSVv0s7Le3eMGZmgGAxqc20/sAXKFByGEEWTvZkcpzlArEwQM2yDvLKxogS5lsu6Wp39vAkLCnv1TM+368OOkTc3Tw23nX5T2zJPOK1KYf30ReYh4yIGhpEitrVSwuyZAN9WE1giXihDvimT+44mE1GmxrQxsmU19Hsze82NHB/uctUX8xJyLfQtC1IYBNNG0Ra+QWNY7aBqkz7fr1b4VyckpXOrxuQqDGLosJjDppyq2fWGIy+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SN7PR12MB7345.namprd12.prod.outlook.com (2603:10b6:806:298::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 02:51:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 02:51:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 11:51:00 +0900
Message-Id: <DE2Z0FA9CVCL.3IY7U65O2LX5N@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Lyude
 Paul" <lyude@redhat.com>, "Alexandre Courbot" <gnurou@gmail.com>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v8 00/16] gpu: nova-core: Boot GSP to RISC-V active
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SN7PR12MB7345:EE_
X-MS-Office365-Filtering-Correlation-Id: a02128db-6059-418f-1030-08de1e71a7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVdoemh0SWl5d2dRdDBvVGppK2kvbjlGMjlNbWtYb3BNSjBodE5ZYkgwdWZ1?=
 =?utf-8?B?c051SmpZWEl3R3VqbFRGSHYvVzVtakhYbkdnZlFETjVZYTdjL0xFc0VSY090?=
 =?utf-8?B?WFFnZW1GY21JS1EwVWFhNi8zL0QvVERaODBNZHdrYWovQm9Wckh1Tml0Rm5Q?=
 =?utf-8?B?cS9FdXk3b3FRSVhraWt1SGM5QVlrWTJDL3pKMy8rM2kvMkxNUFBkMEJpbytT?=
 =?utf-8?B?ajRkd0pScVJEeWpTQ1VJZUVyUDc5NHppNTlodTBic3YxRVdaOGJRR2dtNGNu?=
 =?utf-8?B?RXhxZUg3ZU5UYnF0eXdVcGQxWHBWaEYwalVpbS9aMkU0MnRkdXoycEdwVHFq?=
 =?utf-8?B?Nml0ci9HTU9JYmxNWWFLOCtCWlc3WGI3OFJHeVF1SHdEQnVZMWE2VENJSXd0?=
 =?utf-8?B?RW9qVXpERGgxZTA3QTViNEFCdnhUZjZFUUJ2cm1nK1pLODRpUlZaL1JnOVBW?=
 =?utf-8?B?dHhyeHhWNW1XTzh0MzkxRnNvdEl1bkh1aXFka3VJQ09sUlJIcVVGaW9xL0tP?=
 =?utf-8?B?dVB1aW53VkhBTFlpdllJd2gveVQ4dXpVMWNrNEZ2U0k2eUkrQ3FRR1J0blJD?=
 =?utf-8?B?WmdXaFJ5OXV3NWRoOThpcmN0SGVCanN3WGdBWWdlMko4cHJRMzc1dG5tZGZB?=
 =?utf-8?B?SEJYc0M4MnJoUzgwbDdDVlRRaWtHd08wbTlqcDc4Qm5vNzQ4RWVYanN5ZHI5?=
 =?utf-8?B?eUt2alpDaGJ0VkV0Zi9BMjdvREdRckxqdE5WL0ZVc2MwRzRqcElsUmRkVnJx?=
 =?utf-8?B?L3MwNllHUkw3dUpoLzJUUlBKeG5OazRKR1V1QkxzZVpHbmJLNEFFcktOSzFo?=
 =?utf-8?B?TWRJZEFTRXVNK3JrRGFOaWgvbUlhSWFZeGpIMThJUG11YU1ZUmdya08xaTYz?=
 =?utf-8?B?SUNheFhaVWhsaGN3NTdCNmo2Q2pKY2RYYU11Z0drQTl6RFUxZEorc2xpc0dS?=
 =?utf-8?B?WExrOG44cmQvVmZ1SG03RFcrUmpHTVdPUXZCV3IzMXpDaG12bGFJTmdBYnA5?=
 =?utf-8?B?UTBQTzQ1TXhoMjA4bmEwK0tTc2wydUFuak1OUDdQd3FmMzZyMTVFaHk1RHhx?=
 =?utf-8?B?MFRPUVZ0Mi9veEdiVnlndXlOUWM4cjk2QmhDSlRocEpmZlFocGMzZWFmL3h0?=
 =?utf-8?B?UklrTkZPSVVBSTRtQVNQakQyNW5rSnhVdmxJd3VtbHFGL25Qc2YwVEovUCtz?=
 =?utf-8?B?eU1nRS9qZm9GOWkxdWxvZGsrSlpoTzdTZ2p1N1BMTzU1SHA1SCtuTTRxNW83?=
 =?utf-8?B?dXJkS2NrZUVvci9NOUZpTS9VV0oyS1d0OENRR2RjZ2FtY2xkek13WTJ1N3hS?=
 =?utf-8?B?eWo5UDg3YTlsMStUNSt4Wkgwc29rbHZHdWdMbWgzY3RWYXBBTnhYUGhJUUto?=
 =?utf-8?B?Tm43VjVEZmVqVHh0U3g1U0RrdHVzZ3hBdUhlMjNqVWhGekw5VDR1OUtYZk04?=
 =?utf-8?B?LzRWQ3M3M1hkbVhVR2YrTTkxMUlMamd0RlExKzVHTUw3REhXT2lqeitJakFB?=
 =?utf-8?B?S2hYL1dhOC9aUW03anljamFRTVUvaWsvVHhxNnB6L1k0OWtlK3ArZmJxblAz?=
 =?utf-8?B?eUppckJ1RStzUVp1d1hlc0VYeWhHMWZKYXFpaFBvSExYRm10b1cwOGcxWGU0?=
 =?utf-8?B?bStMdGRJb2ExTTJvN2Q2MW5Zd2VXNi9WclE2QUl6bmppTWJiUWd5MVFXVlFz?=
 =?utf-8?B?NEl5eURoYnpRUmJGWEFOVHptMi9SYXExU2cyOVFqOHgwUStSYzVNUnFvRWlX?=
 =?utf-8?B?cGRZYUcvOGRwUHZNakNYWDgzZ2VWUElGKzV5aDcvMlpTN3lQTDZYSzZKaVVN?=
 =?utf-8?B?SHk5eTRzL1prUXJ4bVFRaW5aTDBRdS9aM2xkSTlvUGlrY3dMemR0bmhJVHdV?=
 =?utf-8?B?RnllVkN5OWRsLzFxRFBTSTFxU2FBR0hkQSsrRkp6em4xSHQ3TWs5UTNORzZ5?=
 =?utf-8?B?ZlQ1Um9kQnFyMFFDdDdEb091T3ZJVHNpWkxMQUZ3ZW53RDdzNjJrc3pjK0Vw?=
 =?utf-8?Q?0ZTYTFLPnFiyhyr/1NejZtYyULaCWo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUQ2RGtrWTlqeTJnTUtFS3NvbVZFVm9mNW5CMWxQWGFjbWUzL0xuSWY2VWFv?=
 =?utf-8?B?bEtyNThab1ZXdENhdVV4K2VhLzAySlRlZHd6K0ZhaEorOWI3Y3ZZbHpiZ09s?=
 =?utf-8?B?TStyNStqZStBaWllOEVGMjZCYU9KOGg2dlNLTEp0OFNXNG1LbzJZUnpZZ2Vl?=
 =?utf-8?B?SGZxTitIY1NhVkFTYlViZUZyanRvWDJPMWxUaUNMMy9Md1k2OGwzNUdhZE42?=
 =?utf-8?B?SksrRTBPWnNkQkIxd2wwTVIraXZZQ2Z1SHVIUkxieXBsNEkxVk12Y0R3YkdB?=
 =?utf-8?B?KzdjM1p4N084dlU1b3poK3JKbDl5NHNBVkM5dWZHcHZkOXQ3QVZrYkUwOVVt?=
 =?utf-8?B?TjcxQ2t2OXo4VXZjQnd0Y1JldWhpdk5iMDdWOUxoL2tRSDdZWUR3Q1FiMEtC?=
 =?utf-8?B?c2dJVnErSzRWSVlkWE9jWml3Vkx4ZWwzWktZRGFiNFdrdExocityTElxNFE2?=
 =?utf-8?B?UXFtQ2w3dkxUaFlMdlkydWR1Smg0SGJUY1BLbkw5Q0MzdkZKZzQ5Y2hFVjdS?=
 =?utf-8?B?bVNLOXp2NG14a1dUV1dwMEIvQytDaFBQM21DbStzR1l6UmpKeGFGcDh2blhX?=
 =?utf-8?B?d0RQUFhZSTlZN3BoWSt2UDFBQXF2VXRFbVkvcUMvVjB2V2poQ2o3UTN6cmxK?=
 =?utf-8?B?TDMwQnFSWWlzeE1WcXlKYXF2NS9QMmgwUU90bVlDdm9nYWlBbGJ0ZzcySExa?=
 =?utf-8?B?cXhxenlZekVNV1pqaUM5L1VENUxsSHVwYXhQc0llSEVGd2lIcnpWZTcvL2pC?=
 =?utf-8?B?Ym93OHg1TXJuNjF3YlV1L0FwN2NiYkpSZmFUcnlRdFU4QnoyMDVsUFp1aTlC?=
 =?utf-8?B?WVc2MGtZWmhCTjcxQktzcllWcVJDVG1NNEt4eEFJWWZ0S29TN1RiRzRlOVc1?=
 =?utf-8?B?NnhNVkJQVjF1VzN1R1JEa0JWN2lzNTYyQXNRcW1rNm5QRlgwYXFCdDZWWVlH?=
 =?utf-8?B?TUlTYzh4bFhBa1p3eGxGRjdYK1FsR2M0YjJhczJLeEdjcXc0QjRuek5iV0Rk?=
 =?utf-8?B?QUVzQUxadjdqa1I2N29HeGNFY2xWck54VUxGZTdEM0M2eU56M0tEaCtVU2c5?=
 =?utf-8?B?S3ovN2o0aE9pN1hZbFZFOUl1R3VoTThUTXpJVzhGQzEvVnBlc2FuN3dsdzc5?=
 =?utf-8?B?enpFczNrVk9BSTY2ZDhaUUpUNHVvUndUcXdwK0psWU5WTVRvWE9uV3phVHVt?=
 =?utf-8?B?YUlRb2VvNEc2K3FRazJQeUNwUjZGMVBIMVJ0UDlyN0EwRVdQZUpEWjFJMjdE?=
 =?utf-8?B?NlJWMGIyZFllb296WGh5VUs5cERPVS9sdm1VVTdpQU0vQ1p5QnJ3L3YrcU05?=
 =?utf-8?B?VUp2d0xsZ1NJaFhNUFFIT2xHOGY4SldrVjBUdTdPQWRQZ3hWeHM4YnRzcW1Z?=
 =?utf-8?B?OGRvZ1BhL0pkVHVZTjFxQnNPcmY1NmF1STk4OTB4UDZUYThpZXUxRStMZkt3?=
 =?utf-8?B?aWVwWU1TUlZFQWoxVCt0T1MzMzBseEhIM0NObVp4dDBYTDE1eWJFdDBzektE?=
 =?utf-8?B?eDhqNC9VNkJlb1NwUEdOamQ2OUoyRkVHYzB6VHZxeThXRUZaTEV5TEgvWTIy?=
 =?utf-8?B?MEdhckRFUDRoN2dvUy9ZdjhSUWpkZU9kbkg5TXJJaGFIK1dEMjRnSmNQK0Rl?=
 =?utf-8?B?cHhjS3BtRERiUUxHL05nNjdzMStRT2JtbXdQUytoN25iUmcvSVhNS2dzNFkr?=
 =?utf-8?B?TmsxeHFndGg2Zm9ZZWUzQjdwYUJjMG5oazlzTGY2NEdacE85aFZ3VDRKVkRq?=
 =?utf-8?B?Q3ZDSjg4em1DVmpyZ1hnUWwzS01sNVdMYTJ6Y25NTzZPMldOT0RXQVlDaHdT?=
 =?utf-8?B?L3cyVzdqRit4ejRWNDFKVHlraElkUzR1VVlzVHFaTndsZWMrWVFEbXNRVTFv?=
 =?utf-8?B?SDZXZVZtN1k4bEh3UmNxNGVRRFB6aTRrUkNXMW54ZHZjV2ZQd0dPL2gweFpR?=
 =?utf-8?B?MThXdU1raWoxeElUTy9nd1JrREUxVGprWUpqd29PRVVOZFU0K0pTWHJzRWF6?=
 =?utf-8?B?NWZoSWk4b3BaK1J3NU80NXhrbk8vd3FFWnhBckdlL0Vua1RVMUZ0bEJHMUV4?=
 =?utf-8?B?OVBtQ2wyZEg1d0xqUFRlRjF1RmlROGQ2K1hac0dEUzhGd3JwOEc1VjFFNUZn?=
 =?utf-8?B?SjJCVUlrRjE0NWFpdDJCb1Bka2tqWFRZZGZrZVpIZmNPTVNTSUQ5MTJ0T0k4?=
 =?utf-8?Q?epriv95ZjVCT/sWOTSbhPdpvHA/tkPd8hoL/t+v2Her4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02128db-6059-418f-1030-08de1e71a7dd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 02:51:03.2477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ty1eOPWSs1X7M99nCZ6O85n2ZsXbu4XIxCFH/ziegtr0n6YgV6STJrrcPvtI4TJgSGxc5ZDRKeXXkAcP3Ws4GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7345
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

On Sat Nov 8, 2025 at 8:43 AM JST, Alexandre Courbot wrote:
> Hopefully a close-to-mergeable revision. Lots of documentation added,
> making the process of understanding the code hopefully easier, and I
> have finally given more attention to the top patches.
>
> This resulted in another refactor/simplification of the GSP command
> sending, moving it closer to Alistair's original idea of separating the
> commands from the objects representing them. This also means there is a
> single trait for commands, and a single method to send them. A couple
> Reviewed-by tags have been removed as that part of the code changed
> quite a bit.
>
> The message receive method in its current form won't be adequate as-is
> for the long-term, but it is fit to boot GSP.
>
> The hope is to merge this or a v9 before -rc6, so it can make it into
> 6.19.

... or maybe not, after looking more closely at Joel's follow-up series
it becomes clear that the message receive code should be improved. I'll
try to capture that in a v9, but maybe it will be too short a time to
get proper review before -rc6. It's not a big deal if this slips to the
next cycle though, as there are no outside dependencies on this series.
