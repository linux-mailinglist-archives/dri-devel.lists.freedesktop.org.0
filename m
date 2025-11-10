Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E80C47066
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84CDD10E3D7;
	Mon, 10 Nov 2025 13:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DB0vE8G0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011016.outbound.protection.outlook.com [52.101.52.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2360E10E3C1;
 Mon, 10 Nov 2025 13:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TD8fPzlojkkG3Hm9tFdrlqYfUtlJvNv5DeDL7BaaoBUmHth8xggYQj+GZmDQ42kbBmcDRWUEZRMFPD8QxNfR3OXggvsbm9Z1mXYg5HEW5HlLUxPv9hX4YcjMRrLDRjM5GRZ/3Y6piu9pCNArxPDnu2MiCHQY+JJr3chGXgFgf8iEO4uVYYSM5MDh3wGCTtENJ61L28VPfq5EQlai26cACwfOoDbK4eFo0I88w27z9kF4ZG+BtuI1Y/6WSaDvzFCkP48hmb15ai4iyW0sag8C+miPS+rMFhbzKwlfJsdZSN1kywa/vn8w4R5l81y+4vGLTmfmRc2uoMZQkZ98rNY2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1A1uMC6mwXcac7bIZ9StyjjwjSueCkeOrl6H68mxni0=;
 b=BmIfHUoxrp8kwNqeZiVgJQeWX8Te6Esc1Q4rLN0TawF98q4BTdR85g0hAvLjX9R2mDe3DeKqvO72A4VazM7p06AC5pZuNg2ughnv4XWlO+6ip0L2G31I8CMqfDJkRYZ7rcMF6+nWq5igS+uh3uVkxSzLvdZ8dbHJ48uJERcCkGXkZV+il3vHhf/Bl6pkvgH/8s2eafTQ6FvLtV1g8VJtcuoB3NPheLC9j1HkCF7NhIDc+EznaB0sXbzUTerHo4aqcJbnNurJh39mLFRwePw76kkc9eXoloPm7IMjS9977j0k5WPSIon+bAP4c3HwEFyMLBrLw0jtpdAlcfozqw2M4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1A1uMC6mwXcac7bIZ9StyjjwjSueCkeOrl6H68mxni0=;
 b=DB0vE8G0Fj5/s6PMr7ZHUa+RHl0NXZRR2QUaHElraS3N/NubLt55LzR6AWKso5VeESMx8IW/LTz83rf+sukGCEcRlC0MyiLozUBB43Yppte1olVWZqUhDo3vBD7gO0LMSg2CANDlZ/RLANlWGV6jzS4Do32NlqxJqwOuHKPGyRNOTZ7vqBZc+U5nOBzp1NmB09Se7ClLadQ1U+O9a2GUfEEkennD3J9yQe7t9Zhg6mvFZPvkBlZnbQOJu1f7CavBCqJ06xl+NOdmKYql0jHoL953SCLhpGVnxeHSo7X5dcnvZFQarMFve4vD4vDyYp7q/u2Di1F+zFyGh7rFOMFudg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYXPR12MB9340.namprd12.prod.outlook.com (2603:10b6:930:e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:51:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:51:18 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Nov 2025 22:51:14 +0900
Message-Id: <DE52B15QXX0R.1FDTVD3DFBHDL@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 12/12] gpu: nova-core: gsp: Wait for gsp
 initialization to complete
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-13-joelagnelf@nvidia.com>
In-Reply-To: <20251102235920.3784592-13-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYXPR12MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a772ce-a586-4181-b476-08de2060390a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2VCbXl6anpkVGE3eW1tTjd2ZnU0dWpMVkFjYithSVk0M0djMGxPaGtaN3FD?=
 =?utf-8?B?R1RRZGtEYVZIRUxlVy92Zmp0Vm0vZlBlSTZoZ2JsTUxNNTYyS1lHR1ZLRzJI?=
 =?utf-8?B?RWpmOVRoZ0JzcFN0NnJEOGJ3RGpFQmh4enIxY0R3OFdpQi9BVU1WcnJhZU5J?=
 =?utf-8?B?dUozQ21lTGdRODc4alJYakRUbnFiUFZHMjBpK3RFYjYvYWFWSXU3b001Umgv?=
 =?utf-8?B?T3A4Y1ZxUXYwZ1FJME5ycTVlRytSaTRIZTNEYlpOYXBXanRMdk9SWmJtNkR1?=
 =?utf-8?B?Y1lDbGlYL01tTFRZT1h6eVdXNkVnd3pUWEhDMEtTUVJNU0drMnRDSVZ1ditY?=
 =?utf-8?B?NnVHekxXbFZtbzNkK24zOVpwRzdoR3dGMnhkS21HbWFjb3dqVXgvbnF5Skla?=
 =?utf-8?B?TVpHVmNIbGt6a3hYS3BiYXp3cFlYMVRzNnVWVThQS3I0VmV1WjRKWkNYdENj?=
 =?utf-8?B?dzBId1BnNHZsNVhrNk1jM2kzSy84d1ZPNlhoYzR6NUF0SFgxWHp6R0pDYjI0?=
 =?utf-8?B?OXljYkczVWJwN3NXTTFzTEpGOFJ4OU1SRnZTMG81T01QWTVMZHlKRlRkSFUw?=
 =?utf-8?B?YzBQWmJpVmxxdHBVc2dkQlpsVVR5WnNmditERld5QmZuSS81UlVKcFJZZzJ6?=
 =?utf-8?B?RTdtYVFUODhmaGd1ZUliYUNtdlAxNzIxM3o1eVJzRlZ2L1ZvYlhYUXhqdWdW?=
 =?utf-8?B?TytNUnFteDlxMGN4dG0xNUtxSXFPMmg4TkxzTGxYUjFseHdJSmNVMG95Qmtk?=
 =?utf-8?B?ZkxPOFRYRzZhOGUwMExodHErOUtPcGpvRU85b3dBT1BHdlM2OU1KYnE2VmF2?=
 =?utf-8?B?NmZLNllJaHNzMVROZUxhdlN0U1VJVlJXNWRqT0JCTVdVNmNqRVo0dlppMmVZ?=
 =?utf-8?B?ZVlmTzBpM01jVVhORE5GMGZCMHozOGZEdWFwaDFMajlmQ1JqaStMdFdxTlZB?=
 =?utf-8?B?c2ZnUy9yVExXV01paWpFSGtxWEVNUFM4K0hiTTJ6ZWhFSGd3Q1RJOTRyY0g4?=
 =?utf-8?B?YUZFT3oyRjRTQTdPOFhqWkJnSzNGZTduTkxDZDBkcUViZ1lBWHRnS1JCSjAy?=
 =?utf-8?B?dlArWkdsQk1rN01YYTNXME83bzJFTDJIdnlhRXhheGNkV1dqSWNiK09HWUpr?=
 =?utf-8?B?TFp5U1k3Z2pzRTRFbHN6L3djK0dpSHF4d2k0R3hRVm5zWUpXdHk2d3RGaHFv?=
 =?utf-8?B?N3FSMkpLNUFkci9GRHU0NzBjSFJmb0JOcTBkSVRnbnVaTEkybi9sYzZjd3J6?=
 =?utf-8?B?cExieUdEWHprTnlNWEgvSjJrcHdGTkhwYUZYcFFrSlluM3N5OXZPL1FiRjJI?=
 =?utf-8?B?VGRKZDdqK0dRSHQvM3BxdGEyRTUreHpCRW1SbndnVlA0RkFFdEVWMDY4d2JB?=
 =?utf-8?B?TkFUdnBxY0tOZS9FaFNkOFZma1FYZDlsUytjTDNyY09KUmRlSG9Idk5sZlFY?=
 =?utf-8?B?bzZQYSs0UzE4cVJUNDVwZTJGbHR3VEc5NFVNZFdlRlJxWW5PVnVSRDE4U1Jr?=
 =?utf-8?B?OW9yNll1QlFVNnZWbStWSklESlFPRnN4aDlHa05nVjY2OTREblhMYUpDL3Bl?=
 =?utf-8?B?MkF0SlpKTjFGSHU2ZTdCWWFsZWR2VVhSeWxDcFgwYUZrQmRianNUSW1haWph?=
 =?utf-8?B?QW50UGlkNGV1S2paSkEvOE8zQXJzc1F0K0NpSUtQY1FJdVBocjM1MjVNaGln?=
 =?utf-8?B?aUVnMk9HamRrdFlwYkc4c1IwMW82cnVGVCtsNDJHbk1XWDFCSGx2b2Y4MmFK?=
 =?utf-8?B?WHF6dkRSNEEvaDNrU1RpakJYZUpnOHRFVkpUNCtHUWFUUUhsS2R2MGc4UUpr?=
 =?utf-8?B?Wm9iMktDWU5oVFIxNkxrU1V3b0FBciswbk0yNmJ1SWdYdnBUUmlPQ0xLVGNB?=
 =?utf-8?B?Wk1oUGVBV2lPLzQxNmNpdkZ4c3p3NDI0N1RMNGZnbnZHZWlCZWJ6U21kRSs4?=
 =?utf-8?Q?WgiLyHlLM5dbPqWBgSZRYGbTlq3JMPQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkpWQ0ZUY3U4WFAvTjZtM1ltM3pTcnl5Zm55dXJhWS9GSE5Ib1lhNk9pTjk2?=
 =?utf-8?B?cVAzdHgzQVdLajFZZG0yNndzbzQxc0U4eWh4QUI4UTUrNFl1WkJJMUhBYjZ6?=
 =?utf-8?B?QUtKRVphYnJXZkdxSUJOVHpXTStMMTFCZ0JNNkRDTTdqaE5JNHVqQktxc3RS?=
 =?utf-8?B?MEZ6Ymc4Ykl1Y0VyZWFhOFB6SlRjMXAzclJFekNnUStQVVh4eElWUTRNamtq?=
 =?utf-8?B?WW10Y1FYK01mNHo0WTgvWG1jWUNuMENqc1BOZUVkWWs3NWZxN1d1VWtqWWNX?=
 =?utf-8?B?Y2RVODNyK1dBa3NKbXFQVjJkY1BiNTBsbVFlUFEzNXQ2TXVNQ2hhNTVXZE1p?=
 =?utf-8?B?bUR2SjdTaGI5QmxnTGxGZjNaK3E0NU9LSWh2SS9obGYzeUR1OFhsSmU4dDVJ?=
 =?utf-8?B?ckY1NjNWcytZUlV6ei9MLzBTRUNRdnlOU1B0UE8xc2lBZTNpbzdxVFR5VXNL?=
 =?utf-8?B?aXV5NVFsR0J4WlEzOXlXOU5KR2pRYktPbjcyWmlNN3lmMzZyU3V4NHcvVjM1?=
 =?utf-8?B?dlloaXZFbWxjcmw4TUJVNjdJb3dXRldXRlJNY3M2WFl0aVh3OGVCcHJwS1Z5?=
 =?utf-8?B?Rk9RVGVJVHZCVHdyRHNwdGMydHkvbWNUemRqa2NMcUp1bjlBaWluenh4dldl?=
 =?utf-8?B?Qk85ZWxBZnRuSVR1T0hIeHhnOHZBbkRpUVJqL05QRnZPUFVSQ25WTmFLcktQ?=
 =?utf-8?B?WWdFVXJEQitieGoweW0yQTMxOHVkTlkyVTI1UmhhSnFhZ1d1RW9TQXZxRDlM?=
 =?utf-8?B?aUJwdEpEUnMxck9jdWtnUWRiV3VwU3o1S2d3cURHUDJyOFN5aUJvcitVcm9u?=
 =?utf-8?B?N3hHQkJsRkZFK2JnVmNlTUJpUVNmVStTZVYwdlJNeTg3QzBXbGpzY2pWRVI3?=
 =?utf-8?B?SGI4cEF4bkJQZjZhS2g5VHg4dEFWcEwxZWU4Z01HNktWYk1qeU01MTRydzhU?=
 =?utf-8?B?bWNIWll4NWIvSkdZVjVQS1IrRHRGSjFyNmRFWHVsQ3hHcDl1MnJQR3ErUlBK?=
 =?utf-8?B?SjlDb2RCRWNWeXNvSDVyWFlkc2FQV3RZTFBzQm9DTkhJenAvUzlva01mRUhm?=
 =?utf-8?B?bm8vQ3JYR0ZaVW16NGVMeFQzRVZnSG5yZWNNU24vWU9HaTFidDE4MWlLZDVX?=
 =?utf-8?B?RllDaW9pZThDL1hQZzE5QVFXbSs1cG9kRFA3eTkxdlp2ai81RVZFOFpHK1hX?=
 =?utf-8?B?YnRiZlU2cERGbXlBSFQ5eGVRcVZYcmtBVlZWTGtjMGs2OWdoWmdGd0U1cWJh?=
 =?utf-8?B?cWJFYU5RWDlwRE5ianNnVHRMTkZYV2Jwd1AwdFZxU2U0cTlXTlZYUGFKNnBj?=
 =?utf-8?B?cFM0SmJRUTVWRXlzcStxT3dqZmlEa3lLakNtYVhCT0ovSHhOMzVDQWU1WVFV?=
 =?utf-8?B?dUhzaFhqTUg4R3VwQ0Z4UlE3VUR2ckVWbGt1SjhFRDNUUU9CRnN3VHZhYzRW?=
 =?utf-8?B?dXA1YlBOTU5VeVVqMnZXcXQ3ckxocGhkdjZqWE5McE9CdS9QYnhPdmU2aC8w?=
 =?utf-8?B?aVRiQTV6czhpNW9LVjRVc0ZHZFVzQjY2ZnJlcmRybUs4OGlwc3dCK0t3MEpJ?=
 =?utf-8?B?YXdEcGNZS3VybzJ4anUvNldONldUbkhRVDN5c09pZUwvdExpUDZ0ek9iK2t5?=
 =?utf-8?B?S1hyLzVKV2pXUDRiWGVia21oc2pmdG45K1l6ckZWTGZRZTBTeTVVQ3R6MlVX?=
 =?utf-8?B?WTJIZ1JSb01zUlRFUXNKMmpnaVhlRitOWG1MNWRkZlhFZVZSWXU5NnBrSk5B?=
 =?utf-8?B?aWowWEJMOW14U3pvRjRRY2tUc2dwVHpyZnpFVzFNMzV0V0c4MnFBQUdNZDc4?=
 =?utf-8?B?UTcwS3o2NUs4ZDhrT1drWUJwOGR3N1dzUkw3bkQxdHJ0eWRTNXgvNUpUcVdX?=
 =?utf-8?B?enVrdCt6ZXdBaEYvMFhVeUtRSk9JUm96dXBLYzBiRjh5TkVoVnFWVU9QcGJD?=
 =?utf-8?B?SXkyUFlEbXBFMGhIMmJLRFlSTmRIQXBkOUc4VnNNOWJqSGxHSDBNMzM1dVls?=
 =?utf-8?B?Mk01QytXa0krT1BRbGkvN29CSUVnd1pYUE9ESkVVZngybzJXMlJaQmQwOXkw?=
 =?utf-8?B?ZW94eWo2Y1RPcFVhUkl1MVZOVG5CeG83OCt4Z1Nuc3krR09lSUZzeDR0QmZo?=
 =?utf-8?B?STZNUE52ekdkQ1MzQXRwazdhVWtnM0dSQzArbmk1R1pKWm9MazJtdEFreU0w?=
 =?utf-8?Q?0CT/GHDwFRTvWhp2lkm5krkkqYRRVFQ7/6aFBGqaJYit?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a772ce-a586-4181-b476-08de2060390a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:51:18.1747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1VYGGWVWQvPi1Y7oYHE+MfuIdqIm3yIZnWtq5kfDvFtW4znxz2gdnSLNuYSt0hRANfXNhapdGEV/5yg7NnMDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9340
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

On Mon Nov 3, 2025 at 8:59 AM JST, Joel Fernandes wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 338d1695027f..475c6d9410c5 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -4,16 +4,51 @@
>  use kernel::device;
>  use kernel::pci;
>  use kernel::prelude::*;
> -use kernel::transmute::AsBytes;
> +use kernel::time::Delta;
> +use kernel::transmute::{
> +    AsBytes,
> +    FromBytes, //
> +};
> =20
>  use super::fw::commands::*;
>  use super::fw::MsgFunction;
>  use crate::driver::Bar0;
>  use crate::gsp::cmdq::Cmdq;
> -use crate::gsp::cmdq::{CommandToGsp, CommandToGspBase, CommandToGspWithP=
ayload};
> +use crate::gsp::cmdq::{
> +    CommandToGsp,
> +    CommandToGspBase,
> +    CommandToGspWithPayload,
> +    MessageFromGsp, //
> +};
>  use crate::gsp::GSP_PAGE_SIZE;
>  use crate::sbuffer::SBufferIter;
> =20
> +/// Message type for GSP initialization done notification.
> +struct GspInitDone {}
> +
> +// SAFETY: GspInitDone is a zero-sized type with no bytes, therefore it
> +// trivially has no uninitialized bytes.
> +unsafe impl AsBytes for GspInitDone {}

This implementation is not needed IIUC.

> +
> +// SAFETY: GspInitDone is a zero-sized type with no bytes, therefore it
> +// trivially has no uninitialized bytes.
> +unsafe impl FromBytes for GspInitDone {}
> +
> +impl MessageFromGsp for GspInitDone {
> +    const FUNCTION: MsgFunction =3D MsgFunction::GspInitDone;
> +}
> +
> +/// Waits for GSP initialization to complete.
> +pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
> +    loop {
> +        match cmdq.receive_msg_from_gsp::<GspInitDone, ()>(timeout, |_, =
_| Ok(())) {
> +            Ok(_) =3D> break Ok(()),

Here clippy complains that this should be `Ok(())`.
