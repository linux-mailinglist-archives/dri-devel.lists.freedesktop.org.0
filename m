Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2E7B37DF6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D56810E77D;
	Wed, 27 Aug 2025 08:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="enNGEEpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F6D910E098;
 Wed, 27 Aug 2025 08:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQhcsanRI6Wr23sUddhlDP46TnPOup8UddTD8CU/Rtf0F0ZTL89WuayIjvyGqTPvrBG0ozdpirdiQqU1Q3fn4ZmbkiL7gWc/DruqD29tmy3U83Uod1x8sJwPqNF40qjaS37cybhy4vmRa2TtOl2h0BdZJlQfZnO7WAmny5dgLUNoPiBWdv+eZ/ZTvA1+5O3ktNGvEeeYEyTQ6FUZtUJ8YQN+02wX/pwORHWXfoNP0RNVZl81xopfupAvrtnwFw4/Q6HBJ7X/Ii0y4+nPyOHRy3TtVwbwBGUEd3UmNVDGWV/oEYJ2qC0Bi0K8Oms9qD901KntHOhYIN8P3iP/QePwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/UkVUHDfNetn4u/Mo3foLFYzTZxdfflzLi+l59gGlY=;
 b=k/5ihf27MczqbrXrJgU6NPlJzjKsdE73BS4AVlMaZoqqqajKzi1pN7c/65YAkF6zhFLeQFjv367ECbPTluhbt+hkrhF6odXC1KGN3JqWMHcyEgWcHJ8SjW8976SCYSEeAaeIOIXKhDZCZRCPcQS0LsBnxQl+5OtNcDBYxbDDkntBizImGjveEnYQrF343I3VFg9fXO5cWaRGkgKCcdtGctMHeBhxydqi22MYsqIxc3xHj0OSqtiyWK6iYhH+uDVNBZPzEPm1C4wEg/VCPu0fy9/p6UuQENV0aK4uSTm7mTyy9Iec7NQkvE4cFyHM1QKcfObqdmDIIUYZqHiRL56Q7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/UkVUHDfNetn4u/Mo3foLFYzTZxdfflzLi+l59gGlY=;
 b=enNGEEpXeZ/P3RV6lVwiT7QVTAOdlfNMFkjDA2v/LGvP+IUfqKccWHWKE11/1xlctIjyWaTgVgG1CAHRAacsFH39dAvnUith+ua/1K76Hrprhbp07PH+dWDMbui+HnXQV9TqTTdHxS7sW/NTBuhQ4yIVxq9/3RmSNXAINBSOfUiWJqNgvDRQTBxWG6o6g1TWy/A3vuGdC+/qCoryyQpr+Q5m/4sF9klB1SEBJZzhizHjA0463fy+vQagdLlApOACbgdCYYVH31glKnrpRbAItjQTtXAAxeSorO40NgGl0vdTGnnOjb2Q9ySJcyARXF1+HShz3uOv1+Uj1mZrsQK5JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB9635.namprd12.prod.outlook.com (2603:10b6:8:281::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 08:39:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 08:39:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Aug 2025 17:39:02 +0900
Message-Id: <DCD2P4ORDLYV.2NSHXI305AF2E@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/8] gpu: nova-core: process and prepare more
 firmwares to boot GSP
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com>
In-Reply-To: <dc18894e-09d3-4088-9be0-22c2070b61f4@nvidia.com>
X-ClientProxiedBy: TY4P286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB9635:EE_
X-MS-Office365-Filtering-Correlation-Id: d7794402-e20f-49f4-14d6-08dde5452e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGxscG9sMGJpd3ZEL2FJcWVXR0ZCSE1wUmJxcEtRNENxRVoydVl1K3hubys2?=
 =?utf-8?B?RVdwQW9FWkJwSkxyZkZQd3ZoYzFPRU04d3FHMzJERUtiNUYxTncyUW9vZzhy?=
 =?utf-8?B?TDJWVFhPREMyNWVXVll4RUJXK3ljYlZaZ1pmWEU3bTNiRkRJUDRUMnNCWjFM?=
 =?utf-8?B?WHJwL1kvd2RkY1hLbVZjQ1JBd2tud1hzakRoaDg4Y1RiMmI3Z0s1bXNyOStl?=
 =?utf-8?B?RFVtL2U0bGxWUzM4ci9LMGJUajltQUdZOE1DTkdkZExKVzJnWHRLaU1WSUI3?=
 =?utf-8?B?Wkd1MlprOXRkM3ZaTlpYajFFQ0hBSFBweEF5elFvcy9nc2M3cnI3M25leHI0?=
 =?utf-8?B?ZGs5bHpDOHMyTmlWcUJlUm96bFg5REVuUlBOZWhBNHU1QUdmZnI0MUtBMWN0?=
 =?utf-8?B?QjZVcDFTckVyOXJROHRtRjZCVFByWmExcU1HeUYwVUpqTyt2d2FRVFRXUGZk?=
 =?utf-8?B?bEdyeDgva0tGL0hvNzN4V2FmRTdwYVZqUzFsUC9ybjVtY21LZXVHM3hLdVZz?=
 =?utf-8?B?NG4wNHFuRW1KWEE3cHRaNmNyWXhyQWk5bEJqaTB3cThaY0w4RlhmVEJseURx?=
 =?utf-8?B?WXhTeW1KVUFvVEh0aEpEMmx4RG55OS9vNWt3R2owR01sN1AxQ0xpK0psYy9u?=
 =?utf-8?B?aDFsdDdTTEZ4TWc5dk5IeTN0MXU0Z3cxcE9KTlV1VjRTMzY3R3B3RGtvRHMy?=
 =?utf-8?B?YUpzS1BKYWdTRlcwRWdlbkFycHhheURQVGRlV0dvdGpwTmlReHBCV04yU09G?=
 =?utf-8?B?UDUxWm5xb1JUd2hwZjZKRkdKUmh6VGdxeFdZb1JtNXZ0Uy9WWjQzZHp6Ym5X?=
 =?utf-8?B?V2pNd2JGSVJ2MDZqKzZWYURvVVVIM09aZlFERENNL2xMdmNwSTNDa0lkcXZB?=
 =?utf-8?B?OGl3QW1jK1EwTTI3d2s5RTNFSmdpK2VZSVJlTmZWb0VFOGFweDNhYjYxWWhY?=
 =?utf-8?B?RkRPS2E3TXVkbjRUOGVXUXBMK2tIWUNEdWhNN3RRbWdyYmNFTVJIR1prZThQ?=
 =?utf-8?B?VUowV0RQOTFZYzkrVktHdmt5TG9sM0dWOUx3QmNmdm5CMHAwTklyd1N1ZFlk?=
 =?utf-8?B?cEluMjZpWTlXdDdyekZUMnBjNXhiSkhSQTdsYmdnTVJweElWeWNmZGNiZHlu?=
 =?utf-8?B?aVBWSUVyMzV1RFhVYlpEK3dzK3o3bGVFVDhMeXJlUDBFYmNWOEdINUI0WDVl?=
 =?utf-8?B?c09iSFM3NERpM1NrK0NvNURBTWJyQjJ5WUJZQjRWdDIySkJocXFURDAveGho?=
 =?utf-8?B?Vzhmam94d2lLbHJPdzVEQU5LaGZTcjd2MVJoYVo2Lzd2MHlsbTJONGU4RVNu?=
 =?utf-8?B?VlhvUjU4NWtpWHVRZ3g1NEc5eVhJcEVrMmw2bTVvQlluck04dEM2YjQrK1hv?=
 =?utf-8?B?VVJGSmcyQVRlOTlCN0d4Y003YlE3UVV3WnBVZXcranc0L1hzdHNLdGExUEc5?=
 =?utf-8?B?V0p0emcyaEQ5dDNqWXNuVXNOYjhFZXpLTXIzRTdvb3ZKUzhvL00zL1g0MUQ2?=
 =?utf-8?B?NkhVZjk1U0hmN1FId0dMeXVLTWltdGNpbmVYYjRMTUhQb3pUTFZRYld1UEF3?=
 =?utf-8?B?SUN1Zk5kSzFqT2tlUkNRK1U3ZmNtb3IyZVFQUGY5MDZERSt3TXhuTUtEOUtR?=
 =?utf-8?B?bFdGUGZqSHhnbEt4YkZxL0NITzgzdy9YczdGSzRKaGN5aHNkVlpSVmhrMUsz?=
 =?utf-8?B?VXErWUFrVXdZcVhuZnBLWjdrdDlINTBGSHlxYU9raVBVRGtLVjZaRitKcmV1?=
 =?utf-8?B?MlpHbW5BMm5HdVRlZ2dnSW9PUk5EWnBrUHI4R0dZTDUzL21IMXduTDJadlcr?=
 =?utf-8?B?ZFRxUXdRYW1TODJFbXVmaXV1T2tVamZ3eDVEcEpRaExrSVZPNU1UdUYyUHNB?=
 =?utf-8?B?Uzc5bTR4SkNIeUtKNWcyb1RxSTlMZHZrZlNBaWRSKzZ4Q1E1QndxRDlWcFBx?=
 =?utf-8?B?T2R4ZXRxbDlRQlUrS2t6NnhwNndmOXlTanEyTWRmM1NPMzJzdTVzUkwwWEVu?=
 =?utf-8?B?OWNMakpKZDN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW9oYXR6cDF6MnVYVE9lWnJKU1IvZ0V5VFYvaVpmdkZZWXpLRXB3elZ4S2dG?=
 =?utf-8?B?YzRiK1NmVVdiaWpza1F1VzhzM2NiRi9IRDVZeUlsQ21CZkZIemNXQW5nelB0?=
 =?utf-8?B?dnZQWDVGZlJreUx2ajZjY0dZWXhWLys5R2NJdW93cGVnTkh1UTZiNE5EOEE4?=
 =?utf-8?B?MTNpekhYbjRtQTJ6V2d2ZHN6UnBjSHB2OGVBc0ZnTE12RDlUVEl4WDlUb05V?=
 =?utf-8?B?aG5GQ3kwTEJQc2VWWW9iYkpMb0FDZXFQQ0h5S0dzRDNOU2habGdDb1pNcmNK?=
 =?utf-8?B?M3ppQXhkSUMyRnJNdXB6eXRSbkhBWGoxdEcybVJrZXFJMFJuTkRYdUVINE9Z?=
 =?utf-8?B?NjZoQXNXbFo0UE42dm83QzZma01Eanl2ZHBhYmpYeTlqRGFRUHUvK2xJM29j?=
 =?utf-8?B?V1NHOENzRTErcDY0UTZPSmJkREZTWk4yUTdoemliM0lpY0F2MmlZYWhPUmg1?=
 =?utf-8?B?dXNIYlNtM3p5ejJCZkxCZWE2Vm5OczFMZ1RLS1FmL284aVI5ellJeE15aVZ3?=
 =?utf-8?B?K2lzcDJUaUt3ZHR4ZFJwOXpZRTk2cHhvTDdWMDFaZjE5SU1OZk5zVU1LNjdY?=
 =?utf-8?B?cWNPOWdld1NqUGo3cXlxa2VmOCs5eUMwc25uaE54emxaRlZTUldReW93QWVY?=
 =?utf-8?B?UmI5QWdLa0VNVXVsRXE0KzUwUlVxeVNLUkZtS054a2NWWlFPWjgrVEk3amhH?=
 =?utf-8?B?SWJLS1M3VmluMFhYV2FDcms3RW4wcUp1eWpDRnBKRUFKUlBKK1pTemZvb0Rk?=
 =?utf-8?B?bmwvZzFDUjFqKzJVdDRoVTJaS0FCQzlCTGFFUCt1T0p2WUUzL09ocG81UFcr?=
 =?utf-8?B?bm8zQTVJUENLMmFuQkdkS2lYSy9jNFJGMzNLVG53M0pHQ3ExQXljNHFuaXBO?=
 =?utf-8?B?eEpPZ2RZZGhnR3dEc0Q1M1JYUnNLaE5vWG5zZytwVmJLdld1TVFyQUY1VXR3?=
 =?utf-8?B?bURXVE5kNU9qZ1FEdmllR0Rjc280OHNLV1AvbGM0eXRtUVdSOVJ2MXZpSkhD?=
 =?utf-8?B?dzYvVTJpbUdscEN5bk9LQW1hcnA1TVdsV0wrTmxMTjlxSDlBTVV5Y1lWdjlJ?=
 =?utf-8?B?QXZOOHV3NnRpKzRRYjBuRzN2RTFzYkU5bzdpOHdHMTdFQTBONnlCSDZvclhq?=
 =?utf-8?B?T2dHdCszRjBzRmw5VGVic0IwTmFWKzU4UWNMeDlwTWhaVE9aQklrQUl5NmV3?=
 =?utf-8?B?NlJSWGpWdVdxcklYMUltSGtNY1dTbms1dy8xQ00zN2JVT3UrbSsxU2FmbGFM?=
 =?utf-8?B?aFlzRENDQVhiOFFvNG1sWHU4TWdKZlE3ZTdTWlVkMk1lWVRIQmhIM3JjWTcr?=
 =?utf-8?B?Y01RTE9MYlhGQUVxWU5CQk5VaGU5eXJUdVVkUVN4YTF3UWRJcDYzUC9qU0pY?=
 =?utf-8?B?WmFCYUx2MWhnNkFOaG5oNno2WVZBK1ZTM1JBMTN4bVhoSEdYYyt5ZFpPRnNa?=
 =?utf-8?B?bU4yVjJaNnRPZ0l2QnZQQjltTVpFNXhxamU1eFYxRWhOc1lSSkNaTk96bGll?=
 =?utf-8?B?bXFVNTBnd09CVDhrQ05aU01wb21yWEppVFBXT0xUQmZIb2JzUmozcm9jdVRa?=
 =?utf-8?B?WU9Dbit2M3Z4cFJobWRra0dmSER4S3h2VGc3SFRLQmZwZE01SXJrMko2dHI2?=
 =?utf-8?B?TkdWRmR2VE5zS2J2dGZ6ZnRJYlRnMVk4aDlNZ1hvM1pmNHhReWY4VS9JMjdS?=
 =?utf-8?B?WXhrSThiSnczQmw2MFRsdlNHdDkzdldlSTNyVmdzQ09ZWmVRQkZRSkxGWXVl?=
 =?utf-8?B?RVJVNEVtalozdFUzV1VYY1Jydlk3a1c3RVhMYlJkU2g0Q2t4TERMSmhSQkxo?=
 =?utf-8?B?NkhVaHNGSkVOSlEyalJjd2ZTQzN4d0J5TjRTQ09oSVM4WEdrWDJjYXE1UmJx?=
 =?utf-8?B?QWZKT3RPRVA3VGQ3MWdqT01XNkxvYUxqM0Z1eENDNEVwMlFkeWpaNmIyM0RD?=
 =?utf-8?B?YlJSOHdUK2UyWlVIa3hoOFgzVFNqTzJyVXhQK3RkMURBUnA4LzdlelhnVm80?=
 =?utf-8?B?Qmc3Y0pvMjhUM05yd0UzVUVEemFaZSt0cGlPK0c2aFJVaE9NWDN2QzVkek03?=
 =?utf-8?B?b3RxV2RSS05UMGI0aFNQZG11Zkc2OWl0YWRLc0ZJNkZUcDlBUDBSV3pxSW9E?=
 =?utf-8?B?QXdJZW5xRDRHKy81T0poYWJPTE91LzJpODIxTlozd0hNSjVDaGUwamhGbksy?=
 =?utf-8?Q?bBKzy3kMG5ys8w/XD2XPoDC1TzQtmRvO7xmqe0S1F0wr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7794402-e20f-49f4-14d6-08dde5452e89
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:39:05.9008 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEc1kHRQUom8fNkxnm3QomSrSWr/lkCvD0FaMvtmHup+2S4G90Yb3kG51dmU/QS8j2pcO1942KskEBIbUZsdzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9635
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

On Wed Aug 27, 2025 at 9:29 AM JST, John Hubbard wrote:
> On 8/25/25 9:07 PM, Alexandre Courbot wrote:
> ...
>> The base of this series is today's nova-next, but there a few more
>> unmerged dependencies required:
>>=20
>> - BorrowedPage, AsPageIter and VmallocPageIter [2]
>> - Rust infrastructure for sg_table and scatterlist [3]
>> - FromBytes [4]
>> - The Alignment series [5]
>
> Hi Alex!
>
> For future patchsets that have complex and/or lengthy prerequisite
> patchsets, let's please please make it easier for people to
> locally apply the series. Very important.=20
>
> The very nicest experience is by simply providing a link to your git
> branch that exactly matches the patchset you just posted.
>
> In this particular case, it would also have worked to just say, "this=20
> series can be applied by first applying FromBytes [4], to the base commit=
."
>
> Because that works, and is simpler than hunting down the other three
> items, which are not actually necessary for git am (although they
> might be for actual testing).
>
> But the point is that the admin can be made simpler for the reviewers--ev=
en
> those of us who know exactly what you're up to. And we should keep
> that in mind, especially because there are many more of these situations
> coming soon.

Right, b4 is supposed to be able to help with this as well, but indeed a
link to a git tree should be the standard with patchsets requiring such
dependencies. :) Will try to keep this in mind.
