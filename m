Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF49B33D0A
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 12:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF0210E42A;
	Mon, 25 Aug 2025 10:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fRtTlZQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CDA410E42A;
 Mon, 25 Aug 2025 10:42:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHafvBT63rtffXWoHdT0nLex9AyL2XNzU0hD3uw1xg4StABuyIigznn2pFaL+5E6Uf1LDOE4w89o5J1/5sR07MymxoBHKmvAgwi9ZfHNaMoCIWwNFD+BtcgrDYdgtyWI3IysTFx97MPVlA1+vlq73EJOQ5ha7aIes++IN4ndm+PE1mZ5q9FbMtDvTJvayjoalIWiZ+RKPJi9z30V09MdL9iIObbp2EaR+UYy1SJRyrUoIOeZopfvoV6MruD+suNFKCOdFTfamlaO8nPybkxuSiTNGAf5cLugUE8e/wu6QIUYv3/AwxU0sepm8Sy0lfJ72/Heot0gjo3VW2DOn47q3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho7Aji8FYjVLdb5KHxgM5CRcrzOoduKZrCeVXhOukio=;
 b=VNHt99RX72CHw77fuHBwPxWdHnvSmWMtFb9mBlFUG2dE+1EEiCTv2SvvJ1mx0tYAe6IhwPuE0dHqJCAtMfKbsd6WUF+8VJLIsy/uJoabdxXg/bEzXZ9MqNNtxyjguFxj2KsN1ayPURmEUxocsISFgCYIxXBoiMunfbDZ5dgs4l9xffWVa1tHqs/M7zBRPs+8c+yz94FKlgDVGJl/XN3u6svKTVvSPS6nCs2l5JjI/MYF6eldmurvfvZcEJ35UNEre10iKDOMdk7ioil/wR9ZSB3nl/2vTr+ZE3hATyb//0eSJMmqK3lBeFRdH5gL2kQLqIqCKF66bOU4jg1VwUBbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho7Aji8FYjVLdb5KHxgM5CRcrzOoduKZrCeVXhOukio=;
 b=fRtTlZQlPa0n+uWKFIeLWCqYKqdYQDQgAqQove986qC7HTQgXzv7SzaUhZiGUFMHrxjK+yN0aPEfddZ8YLnDdzTRuTf4vAcvSSqdT3EAt1ydvSIoZsu0EpjpagCn08ex7lUft0KvvQCm46JizA+13WScXLF5djgwNkDWgIcRZzsGRfVnWIo4O55aXuNbyw020JtEjxiI0c5O73HZtx9gDeq6dgLZlKWASB1O8g+8nbJF7vWVyh9fC4RhqKCXH5Pkrq7AHYiLGKT0eWK+YiqULI/6qUThmaFm9ibNpQYPKjPwTYJL1VUlAHxj+nCogzjGPgTqpymQpqp5dEOXiXG95w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7161.namprd12.prod.outlook.com (2603:10b6:510:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Mon, 25 Aug
 2025 10:42:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 10:42:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 Aug 2025 19:42:39 +0900
Message-Id: <DCBG2OWWZV50.7A1XDXAOL0VK@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Boqun Feng"
 <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <aKvjIM39f1oGyn23@tardis-2.local>
 <fe23756b-9e0e-4070-8ec2-06492dc3f1bb@nvidia.com>
In-Reply-To: <fe23756b-9e0e-4070-8ec2-06492dc3f1bb@nvidia.com>
X-ClientProxiedBy: TYCP286CA0167.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e6e8b6-13a2-4238-21e6-08dde3c41f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGxRcFlsenhYUGRBcEplSGJHck94M1BDOUxsdndBci9MdXRRQUFmNk4wS1lp?=
 =?utf-8?B?aVh6ZWNhdTdDQVI1UFRaVlpJcnpTeTFpZmVmWnpaSXpTTlRyZ1JweDI1REF0?=
 =?utf-8?B?Z0M2MHl2VVJsU2wySm5IczdXbGJGcWJPdThGbjN1emQrTTgvNytFbXFlK2l3?=
 =?utf-8?B?U2xuN3E5TkdEbUcwY3Y2YkxpUUVNMHRkSGkyemU4TUlkeEt5ckVJUkwvSU94?=
 =?utf-8?B?OXcyNTllbmlvdmhXR0FGamdueS9PRURnVTNXRUF0eU80aW1kaVUyQjNXbm9n?=
 =?utf-8?B?ZEZwVWc0OVloNEp1QnRHWlRwUlg2VzhLQklBK09pZ2VwQ0lNc1pUYkVhRVBO?=
 =?utf-8?B?T1JzcGlWSG02Wm1xUzFpZllNck0xY3BHOEt6VDdMYS9KN0ZUb2JJd1dWY3lE?=
 =?utf-8?B?cFhKWVFTSlJMUG1vRWZQOTlDOS9MczZQNHZtZ1dVQW9GWkR3N2swQTQxYXRa?=
 =?utf-8?B?TnhWZ3dEc1E0NGNwdlZLNmtXNXBYOFZIanp5WjRKcEwrYVgrWkVodU1UMmQ1?=
 =?utf-8?B?cURPVGZQSFlOWE9mYTlTVm9mVzRkWFZ6dnFobFhiUmJvNkxVWXc5OWNPalBO?=
 =?utf-8?B?cUF6K0gzTGFiZ3VqcHhYRmJsSi9nUWh1aHE3d1MyT3c1UGdpNFFnOExORVJ2?=
 =?utf-8?B?OXZTWFZ6Yk05MUFPeW0zRWF0NC9va25ocEdNVDdiZzRHZmJjQ0NrVmhUa0hM?=
 =?utf-8?B?L2lUSmFjc09FamFFYWVzenJEMm9rZTc5ZnNFNG5rRXZESjVTeVM0UjlRMjdY?=
 =?utf-8?B?SE11UmpiMU0rTnozak1jYndOVXJ6RUZXQXdQNUJhenRLa2pVQ3U5R0U4aWZx?=
 =?utf-8?B?bm9Ba295YXVKbDNqWHdlNnF5NG9JQXo3ZXZWOTRyS1dUY0JQY1RXakRzNEJ2?=
 =?utf-8?B?aEY2Y29lZHVFaWNVeU1BSEVyYm9HaTQwQ3E3TUtwSVlFZFQ0K3FybW02NERq?=
 =?utf-8?B?NzNXc1RJY1J2VjJnZk9oWmVuRlZQeDhKTFlSOElEUEptVm5LUGVQamI5Y1hl?=
 =?utf-8?B?OE40a3BEWjVQdWtOYUxobFFkTXhOdUU4eVZuRlAxVHRSMVNxRkt3OUdJenc4?=
 =?utf-8?B?R2wrUDNTU3lzTzVGdlE2SE1QZWdtektqS1RucXJzYWZpckM0T0dxNWpwTnRt?=
 =?utf-8?B?ZUVnNFJQUmR2U2dhNWI5QzN2UUNkUkhUSkRndXcvNGxDeUZhNGdEYzFnMjk0?=
 =?utf-8?B?VXgrWWlPRHBlQzM1RmlERUk2bjIvNXlKdTdMYkRyWDRpMjFNQzVzdk14WDZX?=
 =?utf-8?B?cFMyd0I4b0I2bVFjVzF0OGcwWUFMdmNROGF1YkVCRHBFSkZ2OVJmcDdmWEFy?=
 =?utf-8?B?YXBwdEF3UnBJWVZVc3lGVlJnMlFzOFF3UmhiR2lqRUN5akszRUdoSmdkWWts?=
 =?utf-8?B?UU9aVExCVUcxRjJ1MXBWYUVOSVdwN3J2UmNZSXNwTW9TNnJnUXg0UitORTBr?=
 =?utf-8?B?dWpBSkFUUGg5QlN4TXl4czFrSEc0U2g0bWlRR2pTbW16OVFZWE5xTnU5OGo1?=
 =?utf-8?B?QXUxVmlYNVhDVWdEM28xS0ZIWkFzLzJaZy9IRXlhQTlwOGlaSjYrSmV3aFNh?=
 =?utf-8?B?Mm1aMkNXZW5HMTdBeDBjS1MzOTBidHJDVllDc1pCaE5ycXRCZFRHdUtrb0Fo?=
 =?utf-8?B?bHNWRzN4d3RHTXc5T1gxdVcxN1NHOGI1MGliaWlXbHBhOWF5U1ErOEhVRW1M?=
 =?utf-8?B?eVBSV2Mrc0MxUkxaeWg0bjhmS3NvWkhDUEcwbXRzejNvcDFOVzJQR1IveG9j?=
 =?utf-8?B?RFJ0cEJtaUYraTY2bTBrK1RmNndYK1VwZHZXNTRjd0ErV3V5Zlgvd3hqTUFn?=
 =?utf-8?B?RlBUSGVuNHFNcjRlZmVLa0J3Q2pFejFjUWJ5c2hNOTNJdVBhakdoVVY5bVBz?=
 =?utf-8?B?MEJzamU3SjJBcDJBemZieXp3SVA0UmUybENRblBVWkNDNVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXNOdlpKNW5sZ0xaSTRtUlF2bi8rdXd5NXdPVDJXbDhITjdmY0d2cW1LdWFC?=
 =?utf-8?B?WExuYTJ0S1Ryb1lwQy9wL3JwR3JTMExES2RwSTIrVnBlY0hNRXV2SVNPSERN?=
 =?utf-8?B?Rk1LbHBCUHZieEFqRTc3eGR3VGY3am54Mzh2c0VJVWhuQUdGbGpXUTJRVS9C?=
 =?utf-8?B?V2NPd3lEcXE4dnVWSDEraHM5QzNFeVJNNkpvUkFPc0dFeTFLdldmUUxJRW0v?=
 =?utf-8?B?Y0hQcGI4V1p4Z2N3Rmc5RFhQZnMreFdMVXFDeEFiaEpFS2R6K3d5Z1hhUzJF?=
 =?utf-8?B?MkFpOWM5OXQ4STJ5R0lHbEhRZ3ExRWhlYTgwd0FwOHZlT2ZUK09seFZ3QVJB?=
 =?utf-8?B?TjA1a0xGUlkxWnoxeTIxcFZPWU5pdWVlbWxoeE1oemlWQnRvRmREVTMybmxY?=
 =?utf-8?B?Y1JDK25NMzFWaXlzc0xoT200UmdkcFhLWVhTNjEzWHlvYURwdldrNFlrTW9J?=
 =?utf-8?B?bURWbjhsUjBIeGtmNWY1UHVkTWpqTTlVZytBRlNOWlc5WVZwR0t6bENXSS8y?=
 =?utf-8?B?Wm5FNXlEL0x3V2VDN2haeU1DWkdONXFsVC9vUDUxdi9OUVpxbDJER3ZuRkFJ?=
 =?utf-8?B?bTQ4T2lkUXhTMS9YM0U5cVFGL1FIQWxaSUVRdGhrSktEeTExRjRwdEo3d2hR?=
 =?utf-8?B?VlBvZVE5MnBvUHBBMmtRYXZVMUthVk50NU41SHhaTFZjRVE2STBWMy9DM1dl?=
 =?utf-8?B?STdvbzV3QWNFVFFaUEpvbFVGMnB6U3VvL3FKeHpxOE5nZEJzcHErdzVVR2Y2?=
 =?utf-8?B?b3JpK1czSHV6SSs1N2FlMm9vd1BraXZOTFZIWnJYZDQzTGRCMlFERS9DSDY5?=
 =?utf-8?B?U3diVmZlR0NYWHZHNzNzYVVnZjA0SCtYRGVMZXB1VGl5cHhBYmk0eXRmU200?=
 =?utf-8?B?M3NmVm40dlJSVFRvZDliU2JMWVdoMFVlUllvODQvTmttaW9iMVYxZHNuWEVZ?=
 =?utf-8?B?TldrR2FPQm43RUNvaUZ4VEhuZlBsMjJpQklBSzdCdUZrUWpqdEEwUk5KVHVZ?=
 =?utf-8?B?WmNiOHIvekxITWZLcFU5ZGluelFjUnA5b21KU0NwcE8rbEZ5RWtUZFN6QTdl?=
 =?utf-8?B?OFNMQWFXd0FuRG4xakJoWWFsVVdSREtiOXY1enlpQWRTeTNRQ0FRVWdROVV3?=
 =?utf-8?B?YWNFTUJ3ZzZ0aFh1RmxjdlFOVGtoUUJleXRqSkZWS28rYy9ER3NVQk1NaExm?=
 =?utf-8?B?eWYwM2FWeTM2U01YOWViVXlrSklNWm01eXdTNXdkLzVvTmtyclM5ekJqR2FD?=
 =?utf-8?B?NWROL1FCSmg1aDFEa0lzcWFLT1FKTmZGc2JicXV2WkY5aVJ6bE9Nd1VBV1d5?=
 =?utf-8?B?c2M2eFBxNVF4WUtNRDdRcWR4aTdBMWNTdGRDcHJNZnJ6UUQ5UktBWHlDUDBn?=
 =?utf-8?B?eWVVcEd3R0RsNGI3eWRBU1F3MFpPK1MxNWJzSHhDTlhHbCtFQ2Vma01lOTFE?=
 =?utf-8?B?cUFiTkl5SHY0WTVCZFVRdE80Qm5jbUdOa0U2aVpxZkpiRmpYRFIvQ0g4NzFt?=
 =?utf-8?B?ZjBrZTBSWjVPM0JYK25KM0gweU9ySW5VVndyekZiV2N4WEpnQmNCTnhqejBN?=
 =?utf-8?B?Y0s5eU9Td1pWdm9iek1LdGw3enRkWFJnb3czWncrMVdabGNnbUU2Q3Z3aXl1?=
 =?utf-8?B?aU9KRHRQblVhODAxak5sUzVNVHYrSmRROVZGaStzeFNJTXVTdUpTNnVjOUZ0?=
 =?utf-8?B?ZGluWXk4dHNpWHhvWlZaLzB5N01wZFJYU0F3NDZCR1BLakVpNkwwMFNmNk95?=
 =?utf-8?B?elVpSGJEWjNyRUUzUWREd21ya0JzNzI1YU5iM2s4WjRkekg3a2Mrb0FCN0t2?=
 =?utf-8?B?dEwyMnIxTnlTYlQyMFFFZ2lXVFozZGs1UTBOam5pd3NKWFFaRGRlYmdYSGQ5?=
 =?utf-8?B?c3hmU002RGFIMWxOZjIzcXdRU1ptT2ZlVDZrbmh3OERHM1prckJpWDl1VmxS?=
 =?utf-8?B?alpTeVdtYlk3NGpsYmt1ckJoU3hPbXdsNjVXVE1zbUlkWjF0WWl1cFZUTlUw?=
 =?utf-8?B?U1l1bGx4Rlo0OXdzVGRVcllXdVNBc002eDhKSmVpOHlJdncvNVV4Q1FuN1hi?=
 =?utf-8?B?M3F4V09DQSt6SUlUMVRHZWhXMTBUZzFxK28yTnIrdVJlYjBaMTNqeEQvYWpL?=
 =?utf-8?B?b2EwZVBqdUkwSFNHL1FUTmdqWG9NNzgrbzAxZ3hrNWxrZnlVNTdwQ01PRXVT?=
 =?utf-8?Q?rueCVKFsq+4qOvFWjRge61KskouPij+EiOLf8ItNK7nB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e6e8b6-13a2-4238-21e6-08dde3c41f94
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 10:42:44.1082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ci0jb623GDyDxW9PVAcFQoC3mHhk2Lvm+vfgUGLOzW5ssZFeiuB7J/hf5Fyo3lvT46f1NXdeJY/26lbigoBjuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7161
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

On Mon Aug 25, 2025 at 1:16 PM JST, Joel Fernandes wrote:
>
>
> On 8/25/2025 9:44 AM, Boqun Feng wrote:
>> On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
>>> Add a minimal bitfield library for defining in Rust structures (called
>>> bitstruct), similar in concept to bit fields in C structs. This will be=
 used
>>> for defining page table entries and other structures in nova-core.
>>>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>=20
>> FWIW, Joel, I only received patch 1/2.
>
> Oh. Good catch, will CC you on 2/2 for the next time.

I believe the reason for that is that patch 1/2 has been send to
the rust-for-linux list, but not 2/2 despite it changing the Rust code
as well.
