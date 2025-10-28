Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1EBC1345A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 08:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24DD10E07B;
	Tue, 28 Oct 2025 07:22:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g4zfiZ5+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011036.outbound.protection.outlook.com
 [40.93.194.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73E810E07B;
 Tue, 28 Oct 2025 07:22:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JqXCbjxrv5GCIuM49d3R9JgNmTo69Q3t8efG7zXcIUFPypI62SSmlo8jrxfSQBcr50Q3N3DGjX5BE8ZMugpghZgNMZRYolLyWlXy1FNDRLYBi0pRSkr3BxbxFenidQW6mG9C6Y0QF2rLWnz+d7Ym7sAfMTnUXn7FkN6F/XUw002bcYKE3tFD5rTPFJ4LZGGsuLHIi6VrJ0dDJOHrYHG9I57WqQ6MA2H0Ku+ceRI3J/fCQtNnu6a91RUjZMStRXFvEiCj6CH6eegeTCa/IktcI9C4W86CVTD21fxJUl0+yyRPzZwN/KXF+EZNiU3cIOGjWtRa1HI6UZc5mv+41MiJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHL2iyj/WJmf3f9RquAh9jSoPefeMfU36CiJTmK2ClU=;
 b=r33qI6XCd2RqT+U/0lov0ewro0l/yJZHxtr/gR1GqjRU6QOdCGKmBD7nl2LWc1JAaSCUiVZlIXPpgOsvW6DssFcQVzNBNAiXfLYv9KiXJM8lBTPZayKiNwm0B0E8eFXcJILL0kJsFPnPl6AelL+9WY7uONKUd7EMba3WFZvujU5UWYPSs0giyx22XlYRI3c7GkEHl0tYflsp8HqFZK2tzojJii+rhvksW6QWDrUZnDDbd1lWrVNx3c2a74qmhZLD6bIwf4NnM3BNizswQTQI525cNeNnk1UrWR8WGQGZ63KtQZAhJMHRXzMsh/gYS4Vz2E4Kx1XTlTXK62fIrYHKrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHL2iyj/WJmf3f9RquAh9jSoPefeMfU36CiJTmK2ClU=;
 b=g4zfiZ5+SI+1Pgi0BVzC4Vdsa+to47FS58u0bnaQ3Oj0acy7aqBS4KO9DZS1qomnqQe561Y027b1aS9gmL7ySyxsF8iPWi2G0jUHaY4jUqNKTzE8mYkwq6vt/PYZu7LXijNFHJim+rFpOLnZGbU0dGhMDrw+iSKOl1vlXUvIFbuTV2LJPUb9u/haWiSHnVRgsfS3w1v1IMSH+acbSQCunLaXXvSZOI2MV+IG3uXeRxccCGlK28rlzvC+3SiDDKNLENorjWXjR0pDx60VB1E+T7lO57rNl4KYGQidtFRf9okO52bqDrJDWR6miSwAG+XArlg9FLzDuuguWVN+iULJoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 07:22:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:22:15 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 16:22:09 +0900
Message-Id: <DDTRW1P2I4PB.10ZTZDY95JBC5@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/7] gpu: nova-core: vbios: remove unneeded u8
 conversions
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
 <20251027-nova-as-v2-2-a26bd1d067a4@nvidia.com>
 <50f8b846-aead-43d3-b3f0-49e67b1952b5@nvidia.com>
In-Reply-To: <50f8b846-aead-43d3-b3f0-49e67b1952b5@nvidia.com>
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e0c546-28a8-4959-ba0a-08de15f2b72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWhSWG1SMkN4TGFMeVRuV1RhQ1pBL0cxS1hEbS9RRDB5UjZGb0RaQ25HRE05?=
 =?utf-8?B?emtkZFoxY1lBWG4wcWRld29nbmttbmVoRDZIU29FVkNzK1k1ems5OWl5bXlu?=
 =?utf-8?B?SVpNT3NKSjF4ZmNVU3ljajdzbndwQUxlK2RCbkZmZXZ0eVNJRk5odWh2Zk16?=
 =?utf-8?B?b3NYTDhjR3FoSGtBMzdEK05VWUM2bUNydEVkSVZRR3F0bU83YUtJS2xvaGdO?=
 =?utf-8?B?Lyt4STB0bnNiY0xCMEZyamV1ZDNXc2tKZjVQQUJvZTlUcEplelBjVGdKZUdj?=
 =?utf-8?B?UUxLWlR3TTg3TFI2SEtuaDI1LzVSWEI2ZXBFQ1M1YkFHeEc2UjRiczZtaU02?=
 =?utf-8?B?ZEU3MnZCSUt3dGFEZmNZQS9qU1FtTVkraVZVMTUxM3JCQ3MxZ1JtRGNnVnBM?=
 =?utf-8?B?SU4wa2xFa2xJWGppRndiNGdYR1VOUGJ1SmV2ZDBwOW0rZDFrZFBqRksrcnFU?=
 =?utf-8?B?Qm1LcFdzbExFcnBCdHpSZWxiOHNRR05TUlFNZllvWmtKazhoNmR3bGFwTDRC?=
 =?utf-8?B?YnhwVzVjOWlhS0pqbEVtQ1psOTZYWTR4R2ExN1RBNm1EUFBSQk15L2VkSC9P?=
 =?utf-8?B?cmdQR3VocU1DQWZsSFhJbGhaSFNxcmVycEtvNkhoQTlDYVc3ZnlNUlNZd1NY?=
 =?utf-8?B?dzFHWVBuc1ljVDVGSnRaMGpKSDFGSFFpZEZTdWkwL01SeVpDTCtIai96TXlT?=
 =?utf-8?B?UDNydCtyMEV4TnZ2bjcyYWx5SE5FcWFGa3orQXA4WXZtcUd6R1JjbmpYdlhR?=
 =?utf-8?B?WEhEa3FzZE5JY2dqeVRBSGJ0dVV3UDdJd2RnZEgzZ0tFOVVVVHRDYUkrT3Bp?=
 =?utf-8?B?ZlMzN1BXaDdaekwrVUVuT3lVdDRoWW5IS1FvMm1aR2JtNFU1UW1POTJBU2FY?=
 =?utf-8?B?bkNkYVErLzgxaHhRRkVMZlJWNFd1QlgxRURhZFhzN3ZjRUlrcWJXL004dTE4?=
 =?utf-8?B?WElqaVhnUFpyb0pOY0NLUFFRdE0wUlJORk9BR3czaFdKcGk4NVp3SlNvVFRo?=
 =?utf-8?B?RnNZd0J2eVNzR3NBQmQ2QXU1L3NheERUQU80TzVhZWt4THV2UjBpb25oR21U?=
 =?utf-8?B?WVNzV2RoM281L1FEZk0vdWkycjB6ZXZKdDY0TUhBaThucm4zZnAxQzRMTFBw?=
 =?utf-8?B?UjlGY0FNMklHOUhUSWZQb0NUNUoyZnl1ck96L3FYOWc3enhmL1ZjMDJGaUlK?=
 =?utf-8?B?eFZKRENhNTlucmsrckRrdG5wTWMzWTBHK3ppc2ZYQk56cE1ONWRSSkk3UVZt?=
 =?utf-8?B?TG16T1ZGZFgvZUJLVEIrWklSbnFGa0E2cktrUHFsT2xrZi9JZWtYc05zd3E4?=
 =?utf-8?B?OEJVY01oQXNIUi8zczIvVnJyUkR6b0RwcTVsd09hSTl3NkZLZklmNk1YK2Rn?=
 =?utf-8?B?QWZoQ1BkN0M4RXpjV2dTOCtCSW5SREF5a3lOdG0vLzk1N3RNTjNhV3IwTGRL?=
 =?utf-8?B?d2RqRlVyVTd5eHdvRTl0ZE9LU3FHZGw2bkxRQVVzUFJNR21OcU1HcmVVV1E0?=
 =?utf-8?B?cjhzOVRhUmI4ZEtKMThuVW5RU0d2MUxoVlZOUm1BUnNqeVBKWE1XZmduZTZm?=
 =?utf-8?B?REZHTFl0TE9SbStVYm9iWWRGeTQ5SDE3UU9lOTBVWlkrbVRwRk42WDhYZlpx?=
 =?utf-8?B?ejVUNlRjSEJOSGF3KzhyOUpMQXlCOVcvV0txc25FdW0zOFRUOXVCTWdOeERr?=
 =?utf-8?B?ZXdibGR0YWRqRkt6cVZjeWRSaTlLTzFXNDFrLzFmL29BY005Ym0wY2haTEY0?=
 =?utf-8?B?V2F4ZXdjVktuL0Fwc2FxQ1VkTy9Wbm4zTk82QkJZNDRoL0J4YkdKSHRhMDlk?=
 =?utf-8?B?d3czc29QSjdjUnpzOWRuK3RZOUpyTXY2emdoc2RHZHFQdDhqanJSWmpaMTl3?=
 =?utf-8?B?RE1EcXl3RHNoNWFDZEVjNzhROFZNZlY2ajYzcHlFWnZIdmZQUTgzUWJFU2Vj?=
 =?utf-8?B?QVl2bHdVNnQ3UWtFSEhxSk1TVmhTdXdqRkRhUnFVSnlyTU9rSGFOQldGMFZS?=
 =?utf-8?Q?buKaowuxenIMLoivpGOsbiiC7z7A+E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTVHd2E1Y2pYU0JKT0JIcFJ2TTJ0RERDa1FTcDlkTXYrcloxNU5lNUpURlV2?=
 =?utf-8?B?M1l0bXJPKzdtNWdwc21JWmxReW5OakZQdlN4Q1pFZVhFNGp4dkN2U1VLWUJ5?=
 =?utf-8?B?aDhGVXVoVFF4TFlPeTFzWHRoVjJRT2kwSUVnQ0pRVExScHMwVjRsVEYwMWsv?=
 =?utf-8?B?aGMrc0dtNi9pdWllMVN2dGtCUXhDaHhOTUJidFAvU2VHSDF0b3lXd2pKN2Rm?=
 =?utf-8?B?UFNoeDNFZFdvWFhBTXhvKy9RbTFRY1F2am1DVU1Nb3ZPbEx4ZEI2R0Q3ZTRn?=
 =?utf-8?B?a0ZtU3M0MnFxc3BLMDZPUS9ZNEJLK3ptRVN6cEwxbUNpbnNqVEtSTGpISlBw?=
 =?utf-8?B?Skowb0c0cHdBR052djVBRmozbjlYSzYvaEg0dVpLSStrY2wzdzR5WU9QUnFi?=
 =?utf-8?B?YkhvQjNiNzZHOXFGUUE5S21rR2MxSlpXYmlRSGRPOW90aVlhbHhpZDdsUHVy?=
 =?utf-8?B?OEpiQ3FhbzJrTlVsNVlxOEN5ek5WUUlsSzE3cmkxeTZSazZrcjdCeUdjSEJV?=
 =?utf-8?B?Wm9aZHlpQ0VsYTBuRnhvR1hQTWc5eGJrSUJ3VitDdHVyY096UjBMc1hiYWVh?=
 =?utf-8?B?akJZbENLREdOckRDMGVoRlRKbXpmVzlPRGRYYjdVeFBJeUQwMnQxR003T2xv?=
 =?utf-8?B?Z2Z1blZsc1RNUTNXZDRNbGcxbEFpZ3B3OFdsZmdpVTZoV2ZYSXNIbUhnQXR1?=
 =?utf-8?B?QTc2ZG9jWVBiR2FXT05PSmdHMUVDSTUrL1RQdThETWg0UmJCMEt6aCt0dnQ5?=
 =?utf-8?B?RldRVmx2Z3Q4clpnVVRaOHpXb21kMldCcy9Za2pYL0JRcUhUU2NCV05QZTd3?=
 =?utf-8?B?WnovdnZPcnZGOTdmWWxTU05aRTJpa1BlU29LVGJaYVdHUDRQVUVkS1UvdXpm?=
 =?utf-8?B?WmNlWCtlWk43ZWZHSlFPRmlBQkF2S09JM2tCNElRTWc5S3ZLY3lKejlISDRZ?=
 =?utf-8?B?RkFZUTAwTlJNZzNjWXhtcHpKeDZRUngrM3VCNEgrOG41TlRzQWZSVWRWYS9v?=
 =?utf-8?B?RGFOMUlRRjUxUTVnd1VBazBSaG0xZWtJTDdnQTdWbUczMnkxRlZ3bjZqcnpM?=
 =?utf-8?B?STRlOTR6MWpxUVZOUDFwV3pmSlVOdjZlRVJTRG9jQm0yYVRUREhoYXk4Qk5K?=
 =?utf-8?B?U2FnczArNFMrQUF6eW54R2N0K1VhYThtVVpVRUNNR0kyMHJXRFQ4TWpPYkZT?=
 =?utf-8?B?MXVlZTcwaHhYSXU3TnJ4YlRNY1QyQTV2Z3cyU2xTWFlYeUlHQ3Q4dkZZSmxx?=
 =?utf-8?B?RnYrYjFKYlFhY2tuVXNyK3FVWk1FQ2NnNjdocERYbzVab2E0THdFblRDUFll?=
 =?utf-8?B?U2tqRitUOGtwcVBRM1VYTTVHU2FQYi9Wa2pXS2d5REczdktLWVc0cnBPOFVL?=
 =?utf-8?B?cVY1VXY3aWFrWCsreGtOSnRzNGZHOWlvYjhSbG9rYnMvR2ptK3dHdzJsemU5?=
 =?utf-8?B?U0VPT1RZekpJa0JNVElUajMvNE00MTBGUUlseENGTnpUaEpLRDhyZHdOZGtN?=
 =?utf-8?B?TlhkSVdScFdqdTBZend6Uy9BWG9jWFFlY2R4T2FzWWZhOVhsS2E1dTI0WWRJ?=
 =?utf-8?B?VHUraVJncE5HWnVWSk5PMUg4cTdUdXBJVTd1MHZDOW9rVDFKa1pQRWJXTCtK?=
 =?utf-8?B?UHo5OGJEd2x3My9HS29IMTRyV3dLNXNuWENQWlQzYkRHaklqeEJ2Y2lsb25D?=
 =?utf-8?B?VEdWZW05NUNhZjZuZjkyWjkwUkY1UERXeHl0dEEyd1ZJRTlHMUdDZkQxTW5K?=
 =?utf-8?B?RDg1M3dDcVhRbFhOajNvUkxja3l5c1lpMGZxYUxsdVliOHhZOHZXcHVwTldv?=
 =?utf-8?B?L0xubWtGV3hHZDVzVkFTZTVNa2FudUh3dFlYTXh6UmMwT3JYUHhlMHZPSWN4?=
 =?utf-8?B?T2JwVHovUnpjYzR0ODhFZHdqU0Y4UlhoZHhBYmZJc2FlVERzcXZYYU43SkYz?=
 =?utf-8?B?TGF0SGtSVEY0S1VSbHphZ2dSNi9YUm85U2tpVW1HaXg0L1ZKeGo1aDJZQVJk?=
 =?utf-8?B?SzZ2QWYxdmx1T1FrWWR2bjJVVXhFeDdJWWc4SUdWL3Z0cmJTcFcyL0cwT0tO?=
 =?utf-8?B?Ulc0aS9qTk5INXVVQWExUkF6L01zTGZRaVZSc3ZhQjNVVkJBejNJTXNxcmFo?=
 =?utf-8?Q?qXm7cbvfm1+fUsVtLYQZ5nSVI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e0c546-28a8-4959-ba0a-08de15f2b72f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:22:15.3565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bfu/kVdDotTVVqPwTVeVoxIT9zpHv2fI+xC+jRzc1qYvDEGKjnW+OcHYf99GvCVjSxtxg1fwq4h05PENfUF9CQ==
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

On Tue Oct 28, 2025 at 2:41 AM JST, Joel Fernandes wrote:
> Hello Alex,
>
> On 10/27/2025 8:54 AM, Alexandre Courbot wrote:
>> These variables were read from the u8 array `data` and converted to a
>> `usize`, before being converted back to a `u8`. Just re-read them from
>> the source to avoid using `as`.
>>=20
>> Acked-by: Danilo Krummrich <dakr@kernel.org>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/vbios.rs | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbio=
s.rs
>> index 943b0dac31df..dbe0d6e4a015 100644
>> --- a/drivers/gpu/nova-core/vbios.rs
>> +++ b/drivers/gpu/nova-core/vbios.rs
>> @@ -911,9 +911,9 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<=
Self> {
>> =20
>>          Ok(PmuLookupTable {
>>              version: data[0],
>> -            header_len: header_len as u8,
>> -            entry_len: entry_len as u8,
>> -            entry_count: entry_count as u8,
>> +            header_len: data[1],
>> +            entry_len: data[2],
>> +            entry_count: data[3],
>>              table_data,
>
> Why not just change PmuLookupTable to:
>
> struct PmuLookupTable {
>     version: u8,
>     header_len: usize,
>     entry_len: usize,
>     entry_count: usize,
>     table_data: KVec<u8>,
> }
>
> That is cleaner and removes the issue while allowing to use the local var=
iables
> (and also makes sense to be usize as these 3 fields are size-like fields)=
.

That would work! But while trying I also figured we could just split the
header into its own `repr(C)` struct and use `FromBytes` on it, which
would achieve the same result with less array indexing.

Actually, we could do that for a bunch of structures in this file, so I
think I'll just try and do it that way.
