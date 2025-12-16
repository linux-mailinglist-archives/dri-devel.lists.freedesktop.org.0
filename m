Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5906CCC0FAD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A1410E6A9;
	Tue, 16 Dec 2025 05:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bu1QoUHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED92A10E6A9;
 Tue, 16 Dec 2025 05:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2UepbbRLBrYJY4hv8miczvfexgsbYOUtnma43Za6IN5LeljmvsYbcL1rGe6PpLnRb9HZ5GHPcylQJ+0iP1fyAuhl1YZ6uaQkFBOx39Dm4To0LNlidf2v9/r6+qxpAKUdY3/23d0rTcAPNBOfRO+e6cMW+lbxM+F/a7bpVBBk1wZbnawbvSBlfHQZf44K1Cl82oFPp7KJCOwhH4DQXI1aiMg4uY0HEUcLcpQa1rAsJ48/OLFH5y/PU18bIy7S+7V9aSw5/L7BpCEUEY0gU923JTTwYcb0srgco2UB9SjE51EVj/oFZghBUhvMScXk9uq71F+maMKc+D0Cy7j4bowoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vxj1Mip/fytbwHtIh5o5HAwA041KqTKLu336u7neCAo=;
 b=heF1GZFbJznEiT/qRato/7+d3B6ypltp2GQXOILQ9VLRa89gg+oG9BMzCBA9uud7q3z6886Yv5KFGzulLbQua1lq1OagsCWXXidpWKRS0Eh3eyZIyyjD+2ioH6QBWi3R+42E8SQlw6+lhngLDp0MIGezkxFrKJWT7jgtTRugwgWC5l1m+a1vtiuLNeWwYjHJpZ0nxgRmIpGVBMG//60L76qLKGoQ4cF0sVX7lUdY1ggEqJ2RiYSDwori7n+syHMo146ruqgPjIB9WsQoCw3+1YPHeANfhgAwHZ+divqblDIX5OGeDF+Pd3Iuc/HC3Gk2X+wZKJYX1ZWPlrwyYoAyGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vxj1Mip/fytbwHtIh5o5HAwA041KqTKLu336u7neCAo=;
 b=bu1QoUHNsoNV3Fob2XGJ/H3n5ePn5Ou+/nI9/+zcCI9nC67FG3uYo4knGQKmosAtr1fj0ezrgdFj223hEsuC8vnPtj0Fph+9so0e4L/f5U3bRaRZSrINXeb19k4XnJjE7AAcdWbHReuzT/+2rq7Out/Vek+lgyoL07G5AswlznYaoQEqogpqxHKuop0IWjfqBnRJb2bZ/Cjpx8WesMcLcrJao8WSU+btkiHD+t/ajVb1yg6QdI9ffDY2Tuwgw2PhaYQilXLuplYxxPeHjkgrdxDwqog/wbEf3m3cMJb3fHk3fHuj3NvRxDiCTp7nfTdllxIjBudd9eV6JzA1beKBCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 14:13:33 +0900
Subject: [PATCH 7/7] gpu: nova-core: run Booter Unloader and FWSEC-SB upon
 unbinding
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-unload-v1-7-6a5d823be19d@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0082.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: b30ddcf0-6945-46fa-5b8b-08de3c61eb33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2R0aGlrUXJVY3N0cXM2eURJeHVhRStsY2s1SEhPc1NGWi9Qa1RyNjA0cHNT?=
 =?utf-8?B?SDQ5bWxDSGlJRm9Rdy9oVnlrSVBpY0hTaSs0eGFpRENBK2ZrcCtFRXZySXlh?=
 =?utf-8?B?MklKWVhWNnh1WjBYY05kUkpuU0ZoQXZiWEpCNHZ5M3hYQWlvazFpeXY5bW5o?=
 =?utf-8?B?K1RHMXNUcjZyUzZSVHV1WW84akZTSmlWUmxueStpSVJwZTNoeEZBeUxpckEw?=
 =?utf-8?B?dHZaU1RLdmRyYTcrcnNRbmt0eVdxUko1b2hFKzZaM1VhMGFYV3liQy9HbzVC?=
 =?utf-8?B?ekIyL0s0ZmVndE8wNXFWWmtuRXJVb2xkczk1MFExOUhHdkNHVUFTaFF1Smdz?=
 =?utf-8?B?bURPanp4U0JhY3hjeGhpR3VCdVBVNWxScnFJY3NyRG1IWVVpSVd2R2J3bXNh?=
 =?utf-8?B?Z3ViaWo2eU9JUXM0TkZFa0o3eWZlanEzc0tKSnR4L2lJMWpxc0t3eFVncjli?=
 =?utf-8?B?R0F6UEkzN04wUmJBWWFnV3RCTWFvSEhNRS85MVUzUGRSb0s5a29qWlE1dW9Y?=
 =?utf-8?B?VXdNbjZGVllkTmU0dFVIODNMejc3aFRYNVhlcjVWazMzc2ZKcjNGVmgwWGor?=
 =?utf-8?B?TGg0bXNmaExyM2xEMUNoZ2tmdHNWV3EyODduTEFuNDJuaDdNaVVkZDdqMGJQ?=
 =?utf-8?B?amI3SysvVlE4UlNZOWxMZTJZckJGVkZjK2ZHYWJHelZ4dmpjM1p0YXBnSDV3?=
 =?utf-8?B?ZksycERlcmxjT3lYWTdXdjhocEZXT3BxbmY2cTlwTmM2bk9zRkhnSkpleVFF?=
 =?utf-8?B?ZHR3cjl5MGxWNVhYWklpMmRRemlpMDFHd1dad0RScURHQ1RhSGdHNDNGTENH?=
 =?utf-8?B?Rmg5VW5PWlBsYTN5TFFKZlNDSC9zcFBFSTBQSTR4S0xSUWlBQURzSGljT0Rh?=
 =?utf-8?B?NGxoSzIwYkNTVi85TmduQnRZdGE1VkRYZ3NzUkVjMEhmSkFuMk42dzJxN2sw?=
 =?utf-8?B?VTdwdVA0SC8veHZDT0xJQzVFZTRFbHAweUoxV1JweWo5QjV2ZEM3YVBRY1FP?=
 =?utf-8?B?WVpXVmJLcmg2OGViakh4aWhuWTg5TjRNak0rTm8ram1CT2hZS1MxcFFFemtP?=
 =?utf-8?B?YUZtT0tzZUh2VEZBcVJpbENoclVoaEVxRzk3Y1ZIako5RXQzSGdTeG1BV0Vh?=
 =?utf-8?B?VlVZUmkzNk9zK053bUZXNmRFczZkWGJ6MHhDeUR5L0pMdXR1NU9zQm85Q2dH?=
 =?utf-8?B?RGEvSlZMdVFpZXY1SWlqU21qK2prbk04SEIwTEg0ZGFlWUo0Z1VlbW8wQ05i?=
 =?utf-8?B?NzlOTVZML291SElRNHYwVnlJenNHRGwyVExjN3BaMW0zZkZMbkZ5RmpZbjNE?=
 =?utf-8?B?eDVpUlFRblV1ZmUzdGQwRWVqbVppU3VTb0dMVHBORlFTRUpqSnNHQzNHcTRS?=
 =?utf-8?B?S2gramp5dkowbUJHV2Y2MVNvTnExbGFQVlFvM2ZhM1haTUc4b0pLY2hJRi9N?=
 =?utf-8?B?SVNuNHBxSnpGYlRXVGVvWDQ0d0IxRjExVUJmYWVhSktva215YTlwYmwzdjBO?=
 =?utf-8?B?SFEzQ2FxNFJQd042Q1Y1TTM3Y25iK2R3TEwzalBaNzMxalIyVTAxeVFPdGdt?=
 =?utf-8?B?aDhnYmFrN2lmbGU4NGhIS0w2azg4eldxWXhTZ1pqdDNrdFh3UlZDNWZ3THUr?=
 =?utf-8?B?T3NCUE9FR2I0ZnRwTThUOHhDd3FNUUR5dUwxUFgxc2owamg0NTc2Y3dNRkVZ?=
 =?utf-8?B?V3dxQVVPREswQmwvYUY0ZXJmZTZTU3liRGxMdStadFdmckxVTEp0VnlOTmFj?=
 =?utf-8?B?S2ZpV05JcVlMNXFNQ2o5R0ZPN21lZmZtNnNnQ3ZIRnhBL1BnaXFycnB2NElF?=
 =?utf-8?B?cmZLVnV2d3ZubWZnbTRwVGpkSHpnTVpEWHdzK0lxKzJjUU13Rk0yWGVSRDBu?=
 =?utf-8?B?S21zYmVQRGlrMkViVXFLS1FxSWQ1eXphNGtqZXltZjZvVDY3Yk9sMlMrYTM4?=
 =?utf-8?B?L2prMVRTdnVvOGpEa1FJYU83ZmNWS0JlRDA3OGlvc3pyQnpoa1ZPZjF6YjBa?=
 =?utf-8?Q?5SYsWeh9Dge25hjkv9yL0xrlQwU71E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmdpcWNDWUtOOXhQMHRKY2w0d2t0bTJ4QkhkRWpOYlFiaERCZER5MWN2c0VV?=
 =?utf-8?B?cFNqNW1xVldLZXUxcURVWVZZTDg1MkRpMng2NjNtNitIR2VXU1dIRG1Xd1Q5?=
 =?utf-8?B?OXd0ODhOTldMc1hiMHU2T1JZbTJUVWRsbmttR0pndW1nczZRNlAxaENsN3ZD?=
 =?utf-8?B?YVV4aE5hVG1oekV1UERUUnFsL0RxS2Nra21GTHE1WUYxN2ZnaS8wL3hoaUUx?=
 =?utf-8?B?ZkJSQWd3SE9MdW1kVnlQTkpaMGxyNVlkWGZZY2ZGTmw2UzVnNjc0ZGhaaHBT?=
 =?utf-8?B?bUg1akF0Y2JiZVZJeHNoZUFxSDRHUVprcHFIZzRQTDFtcGJoWnRtQkt0aHVW?=
 =?utf-8?B?SXYzSU8yblF1MmlvbGh3NlJoYnd1YTJvdUM1cSsxU2UzUVVndkQwakcyZWkr?=
 =?utf-8?B?V002L2RMNUFnY1pTZ28zZW9jai9JQnBqc241Z2tvZUQ5QStmUjU0RmNRZjNY?=
 =?utf-8?B?MWRHVk1WVUFYNEQrZkJRcHBaM1pZMnhEa2lHYzlNd3h5SFpENVBCaHRUSEVy?=
 =?utf-8?B?dm0waXh2RHRSSGV2RHpJYVBhRHVNbmJQMzJ1VTE4VzJoUUkxTUttdnpFRXp5?=
 =?utf-8?B?ZFZRKzZOeG0xL3pIZlNUSm1XSEdTRDAvRWt0RTNBYUZyd083RTYzd1J2djcr?=
 =?utf-8?B?dERqU09mdjJNR09SUHQ3Z1k2anMrWGxvcTUwT0k2VEpCa0NDMlFEaWI2Y3cr?=
 =?utf-8?B?SmNHQ1ZzOENFUDNGTG5ldUFobHZ4MjJLVy8zeENsaG0wYVV4RDNGWXRjdHNn?=
 =?utf-8?B?dkxER3ZNTTNxeTFtR3FLNzhDdjhIb2NEcGJTWjZTblVGekJ2YlNja2RUYzN6?=
 =?utf-8?B?aWtVdGJKN2xZQy9zM0liVldObnRHZEMzek04MWxTWTdGMGliR293ZWEvMHlW?=
 =?utf-8?B?Q0lUcWRrN3BuTCtSYUE2RDE0TFJhT1lwcmtUcE9mdWtjNVA3RWZhQ2RCN0xU?=
 =?utf-8?B?ZGhLVkVDdE5TdWxaQm1CTERPeG0vVFJXNHhuOEtZczZkaWxHOWtRcFZadUpC?=
 =?utf-8?B?d3h2NU9FdVRod2lkVkkyTDB4MnlrcUNhRDlvWDRuN05mU1daazlrWCsyMU5V?=
 =?utf-8?B?MlpXUFVnVkQxQldrMkdYTmhBZnZWMllvbmhLcmtrQW9Dd2F6amRiSzF0SVpz?=
 =?utf-8?B?OWdmRS9mTWpiWlJjTkF3aCtZOUk4ZVZ1eUZHWEg0Y3U3aHdha0JqRlQzWndx?=
 =?utf-8?B?bHdhek5neWcyZ2FmWGI0WmRXYW9BV1k1cWpKUFQ3UzlRcERidEN5b1lva0lR?=
 =?utf-8?B?cFE3Qi9QejFqZng0QnhYd0FsRHdyUEtMejRhSm5CajBVczV2ODgxKzRTWjRl?=
 =?utf-8?B?YXN0QmpjY0dYcmhXUlMvUkxXMUo5UmRaT2cxdmNkQ2FleXFJVWxBcnRqVFJa?=
 =?utf-8?B?QlVjZWtIcUF6dDRnZnpzNXdqT2hyMkcxUU05dVkxQ0Vaem9lYTRWZ1ZPOXE4?=
 =?utf-8?B?VlBoaURjNUtZRDQ1d0VVWHFnQUhpS1F5eHo4Mk1pQk5YZXQ3TTZRU0xkbmtL?=
 =?utf-8?B?bzBCeUZzdXFhQ2ZWRnZpeVZjejE2S240MmdvY1VIc0VSbzlreVlBTWlwT043?=
 =?utf-8?B?L0VGek1CT0w1Uk0rY3B5K2VzMUVNdU5SbFNpUytvcndYZzlBUEwzRzFna1pi?=
 =?utf-8?B?THgvN1ZvbUo5TS9mTkFlQnpwenhaZHZPcUNzeW1HcERjQjFPVjhTZHZ2Y3o2?=
 =?utf-8?B?TDJkY3ozT0VGUWNjSzNJMlIzWmVZd0QvUjdJbndlOFQ5VHU1Q1lMMFBFYW1w?=
 =?utf-8?B?d3FvejQyZk5vSzZpVDg2aDdQd08vZkxwTjNEMU5ieDRHL1pZakdOWjRXUXpw?=
 =?utf-8?B?SGlpa1VlM2JCSlVta1pNYVQxOUpLTVJ0K1dMY3dvdS9RcUxzeUpYcjYrb1FI?=
 =?utf-8?B?ZHJtZjExZTZtanVnaVlFVGdMUnBodWVJNXJ2UG1GRWpkVjBiZXZaNzB6b3c0?=
 =?utf-8?B?UUxScDVjRFFpY2hIODZrczFNdk1XNTV3TnUwam5mek5yUkYxc21Zc2F6ZUVF?=
 =?utf-8?B?bUpTUEhPaHBkWjdOc3VQSFpKRHhoQ2JQL3hHZTRMeVJ1bXA1dndDdTUxdTJF?=
 =?utf-8?B?YlFjSXo3K09ZUjNsb2RFWWcyU3hLWGVvV0ZZWFQ0ZlNkVXJORjdvMTNsSXNZ?=
 =?utf-8?B?UUZVZTNubTVZeGJFenVLTHZ5OW1WZkczT1V5bE03YWRRelZ6S1V5U3ZBN0pW?=
 =?utf-8?Q?NY2pTxuMV3DDyCUo61vRkG//kBEgvt/dmiJ6EJWHmidj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30ddcf0-6945-46fa-5b8b-08de3c61eb33
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:58.9807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YOAksCWw5kcB690a7sm31KlUY/ktYJn1EsX+ER6akL9lwyvpdVsEEneEBlfSRmQRUtwyNqu3z8N4DNP/cO/Z7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

When probing the driver, the FWSEC-FRTS firmware created a WPR2 secure
memory region to store the GSP firmware, and the booter loader loaded
and started that firmware into the GSP, making it run in RISC-V mode.

These operations need to be reverted upon unloading, particularly the
WPR2 secure region creation, as its presence will prevent the driver
from subsequently probing.

Thus, load and run the Booter Unloader and FWSEC-SB firmwares at unbind
time to put the GPU into a state where it can be probed again.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs |  1 -
 drivers/gpu/nova-core/firmware/fwsec.rs  |  1 -
 drivers/gpu/nova-core/gpu.rs             |  8 +++++++-
 drivers/gpu/nova-core/gsp/boot.rs        | 35 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs            |  5 +++++
 5 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f107f753214a..d435ff11c5ec 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -270,7 +270,6 @@ fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self>
 #[derive(Copy, Clone, Debug, PartialEq)]
 pub(crate) enum BooterKind {
     Loader,
-    #[expect(unused)]
     Unloader,
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b98b1286dc94..0758867a57a6 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -150,7 +150,6 @@ pub(crate) enum FwsecCommand {
     /// image into it.
     Frts { frts_addr: u64, frts_size: u64 },
     /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
-    #[expect(dead_code)]
     Sb,
 }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b94784f57b36..f98b195994ce 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -302,7 +302,13 @@ pub(crate) fn unbind(self: Pin<&mut Self>, dev: &device::Device<device::Core>) {
             return;
         };
 
-        let _ = kernel::warn_on_err!(this.gsp.unload(dev, bar, this.gsp_falcon,));
+        let _ = kernel::warn_on_err!(this.gsp.unload(
+            dev,
+            bar,
+            this.spec.chipset,
+            this.gsp_falcon,
+            this.sec2_falcon,
+        ));
 
         this.sysmem_flush.unregister(bar);
     }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index e12e1d3fd53f..9525ac912ee9 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -261,7 +261,9 @@ pub(crate) fn unload(
         self: Pin<&mut Self>,
         dev: &device::Device<device::Bound>,
         bar: &Bar0,
+        chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
+        sec2_falcon: &Falcon<Sec2>,
     ) -> Result {
         let this = self.project();
 
@@ -271,6 +273,39 @@ pub(crate) fn unload(
             .inspect_err(|e| dev_err!(dev, "unload guest driver failed: {:?}", e))?;
         dev_dbg!(dev, "GSP shut down\n");
 
+        /* Run FWSEC-SB to reset the GSP falcon to its pre-libos state. */
+
+        let bios = Vbios::new(dev, bar)?;
+        let fwsec_sb = FwsecFirmware::new(dev, gsp_falcon, bar, &bios, FwsecCommand::Sb)?;
+        fwsec_sb.run(dev, gsp_falcon, bar)?;
+        dev_dbg!(dev, "FWSEC SB completed\n");
+
+        /* Remove WPR2 region if set. */
+
+        let wpr2_hi = regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar);
+        dev_dbg!(dev, "WPR2 HI: {:?}\n", wpr2_hi);
+        if wpr2_hi.is_wpr2_set() {
+            let booter_unloader = BooterFirmware::new(
+                dev,
+                BooterKind::Unloader,
+                chipset,
+                FIRMWARE_VERSION,
+                sec2_falcon,
+                bar,
+            )?;
+
+            dev_dbg!(dev, "Booter unloader created\n");
+
+            sec2_falcon.reset(bar)?;
+            sec2_falcon.dma_load(bar, &booter_unloader)?;
+            let _ = sec2_falcon.boot(bar, Some(0xff), Some(0xff))?;
+            dev_dbg!(
+                dev,
+                "WPR2 HI: {:?}\n",
+                regs::NV_PFB_PRI_MMU_WPR2_ADDR_HI::read(bar)
+            );
+        }
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..6f53ac096e1e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -156,6 +156,11 @@ impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
     pub(crate) fn higher_bound(self) -> u64 {
         u64::from(self.hi_val()) << 12
     }
+
+    /// Returns whether the WPR2 regions is currently set.
+    pub(crate) fn is_wpr2_set(self) -> bool {
+        self.hi_val() != 0
+    }
 }
 
 // PGC6 register space.

-- 
2.52.0

