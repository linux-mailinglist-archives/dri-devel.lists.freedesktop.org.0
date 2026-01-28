Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCKnKEf2eWkE1QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:43:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF40A0B50
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 12:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E56010E297;
	Wed, 28 Jan 2026 11:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R47oYFyr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA99910E297;
 Wed, 28 Jan 2026 11:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hwvGooyUKdiCa+fbSpMFKr7Sv362deaXVB1FenMBQfi0eavuGjz79nSTb531LUBwz3j8+aqgde2oYQeY5wIsX46+EZnBVVS1vB78fiENDIwUUNo0ROOkduSFGVRbWRVpWcc53h55DtcuPcEbUAjyLn0JVpStKTguz7dl1ee2jOiyYUVYf4D+Px8EIB0TpK2tQDWmUi4jb3QHqtXp1zepAztGcGMDVuluF1Vo6SiNQcBVb70w8tCSaPonfhK5IH3Jk+12nm4Oz5XTgnxtvlnzvd2B5pWvIasm9LeXbYTJAHREXtmQRhC19gEV5BG15g2Wq03JaCQQATMCQ9rnMszhyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/Sx08D9VPm9fPeH2dwVs9wP7USAO7h+53XVp6/YTvE=;
 b=Fib9/HSAA98Lvl4gQPilQt01VLMOl6TZyJhPzRIALcTlK/NeACJ0fId5jNTqOTm+7fDr/HGRC5DwrThdaeLFL7wbtXnXet7ZEhoBwwCoBeoW1Aj6hVQQuRyN5vdCFMIzhuZwdc7pjQZar/S4X0xcIDXkRWSrtxvZa+K/oPfyDkNFAYaOZniCDDDEPvpctb7rmzLJTEbANb7j2O+V5lHkA8CFGgpo/2yQBWHNn9vMwhEweXe/rFzazs2rmQih1J8Q3zdrOQgUyoHioBv7JyMlOaotvy0Fvus1IPbhuibh61uvE7jAZPD3q/St7HGNzqVSCDK/6kXxM1T9U3QyGE5GOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/Sx08D9VPm9fPeH2dwVs9wP7USAO7h+53XVp6/YTvE=;
 b=R47oYFyrE0Y/4ApgYoUY7PYyQQJA8xF+m9KrMUGoRQm9cO9/KLCOBB6mTGHys2+RSvZmqeA3y05j8qTtWdXLEn0lAm8GB5rJAzr0SMyMmfx692S6OVbf2ynHmg1ZvGpiq9mospeDW+MAYlVtHyxhAkJ+AOnRCCCM9WobUui+zsvxUm/xt5teNuU22q9yDeFwSmnOkCYQISoiaHuz4i2YK5rVWknf+AvVUMwrTcmlrv6IJYlT9xdW47AzIESZXNtFnhcfYyMcUTJVVpuO6H9HgkpY0KKYVEElZ4PQOjMGgb2VBb72TnH1H0AOmZ7ScZZZg+mauq2Yh+JlhC6w1BAh1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7563.namprd12.prod.outlook.com (2603:10b6:930:96::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 11:42:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 11:42:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 20:42:52 +0900
Message-Id: <DG071RZV1S25.22955R6F9YZ7J@nvidia.com>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair Popple"
 <apopple@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] gpu: nova-core: gsp: fix improper handling of
 empty slot in cmdq
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com>
 <20260123-nova-core-cmdq1-v2-3-e797ec1b714c@nvidia.com>
 <DFYQDRTTNQ4J.7DS0PAZQZ7XV@garyguo.net>
In-Reply-To: <DFYQDRTTNQ4J.7DS0PAZQZ7XV@garyguo.net>
X-ClientProxiedBy: TY4P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: 584c0326-fd4e-4af3-31b8-08de5e6260e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXo2eFUrUGRkbXEyaFE0QnlRdzZvM1hWRFdoa1VPNEFFOVEvS3E5NkJkN0t5?=
 =?utf-8?B?Um52RmdBbm5TMlNTRmhvVkhoNFlhSFZ5dGlhanFUQXpTaU50aU8xUE5SbXdx?=
 =?utf-8?B?U1VzemtDWUZBTWhuVWNmNEM1c3hOUmxybmQwNVpDR3RjQkpQY1Y2OURnbmNP?=
 =?utf-8?B?ZzRxemNwNUN5QUZha1hXVXk4TmowNm54M3VobmlVOHZ5OFR4Z1hiM09lVGJx?=
 =?utf-8?B?ZEk1ekdhNTc0T2RRNitLQ2FueUVUS3VnT0FnZkhKS25nSkREWS9kaFlyY2Q0?=
 =?utf-8?B?Z3psWndHcHhOWWhtWkIvcSs0eWdGVU5lbU1wMUpLYU4weVNZTWhvNkJNUk5z?=
 =?utf-8?B?VlYwV0RXWEkwNUZDdFRrdmJPSDU1ZW5MQlNHdVNVM2c5aHJFU1RFaHZ1aExi?=
 =?utf-8?B?cHJpTWlVNXpVa0hwQzBoSlRXQmRxc2toVXFad3pMZWdGbEZHcDU1K3lXbVJY?=
 =?utf-8?B?Um14RFcyeUZOV0F3Y05FU2ZwS3l0bmpPYVRVNG1wVG5TNlkrenlMOU1ycDh0?=
 =?utf-8?B?TkIvMGtZUkJaTFR0YUcyNXUya0hST1hjNmhjb1MxQU5JNlVoeUFQYmxxSnB5?=
 =?utf-8?B?WjVxbWMrd2hHaWRORDFsVnhHU1llYWgwaEdjdUJucnNtTkFBaGtJUHM0TkNG?=
 =?utf-8?B?SzZNY2liUGR5ZVNWaU41R3J3L3dhQ0FOZjNES0p0WVZkNjZuc3luRCtMUjZr?=
 =?utf-8?B?QUtEY3dLYUJPVUV4VS9taERGdXFtQzVkbVFXM3g5L2NpUWNxd0l1Z3h0U0RJ?=
 =?utf-8?B?TnhXZ1BsSFFUWUxUSWNHaVh2UXBrTERZRDRjamNwWXZ3VHFVYkFCL3A2bDV4?=
 =?utf-8?B?NXg4NEZYYklkaDRaNUZPOXVwWmFHSW5KR1hXd2x3ZFlDTGg0TWlaK2RYNGJH?=
 =?utf-8?B?c3pTSXNqdW5mSFcxS1VWU21pUEd6RUttWnhuaU5mMWU5d0FZUXpKV0FuMSt0?=
 =?utf-8?B?bkdUWGVPQjc2cENEZDZyNGdEVit3ak5VdEJqZ09KMUFYZ2t3QVVvSFN4T1NJ?=
 =?utf-8?B?OXF2V2E0ZUQzZnFDWjV5NktIMmpjejA1aVUyaC9WZzBYR1dyK0VIRlZIVUMy?=
 =?utf-8?B?b2FhZ2dHN2o5WFQ1K1VhZmVyOTRIOWUxQzViNHdxYkxMekcyTmpUdWUvaGF0?=
 =?utf-8?B?VkNLa3hMSlZya2NTc2lQK3NpL2ZlWjQ0ZlA5RzVJUkNxT2tuRHlWT3QrRyt1?=
 =?utf-8?B?UWZsQmhyb1lQRERiVGpQV2o5YXZ3ak8vdSswNTNOcHdscVJMTzFsQnpTa01w?=
 =?utf-8?B?YnNsY3JkanBDeDZkVGlHdU9HRWJmRTNMajROWkR3VGhuMTVuTXpKUlBCek52?=
 =?utf-8?B?YmRLcGpBZDU3KzQvUmErOVQzS2lJdnA2T3ZKMTJoZVRLN2ZxL042V2owRmlr?=
 =?utf-8?B?YmhtN05OeDd0OGhWYTN2MTMwNkpOWmlGREVWdDh3MFBrSmZrcWpSdTlSOUdk?=
 =?utf-8?B?dnpaNmxCSEdJQWZRaE1qbi9NRnVFNHdpVGJXemNHT0xtREE0ZDBuTVR2NW9W?=
 =?utf-8?B?L0JZZVNodnVYeEJuOVcrVGVoVXJiSm13bkgvWktUOXpHWkZMd0Q2bnEyWHdw?=
 =?utf-8?B?ZnVBUHRXaEV6cHFoTXhVV2puQ0V1cXdDakIvS3Rwa1hZNUdmNkoxRXEyTC83?=
 =?utf-8?B?dkd3MEVFOVV5ejVhS3kxL0tPRU1sVlpLQnRzMFdsYjZtdUNwWDUvNkxFRWJ5?=
 =?utf-8?B?YmtVNmxmWmw4VHlXMEk0dEwzRnNFU2ZsaytYQ29uSGVXQmVrU2h6M2xmWFUx?=
 =?utf-8?B?dGE3SSt0RXE4RHBVZnkzRTZDQjBGZDAyelFLMld0ZFBVYkFRU2x5bWhvb01T?=
 =?utf-8?B?Mm0wUWR4Z3RsUTZXOTFkTXI4TUdnOFR2K09jVkcrNzlYbjd6Y2xUVklHaE1t?=
 =?utf-8?B?V1BIbFc0WUhmQllDTkZud01ISUdjYkZXUVk5RlZVZmpQdWxUUEdrZlN6M2Fz?=
 =?utf-8?B?aEZvTVJaNFkvWllpT2JIcGkyNC8wRkgyYWQ2dUhvcDRLSnEwa1JSLzh1Qm1G?=
 =?utf-8?B?YUcxVzVUbXBadDRVa2FxcGM2SkgzQi9zempYczh1dmJBV01RTUptUk9GTWR5?=
 =?utf-8?B?YStEQVBTSWoxdVhtSXluaDZQanFtTnU4eGl4UVdaMmtsT1JEN1p4QlFUZ0J0?=
 =?utf-8?Q?IwAI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkNjNWMrckppWFYrWWJ5b1pOTUtFTkE3ZHRSSE5nMWR5MjAzaThNOEE3R3ZF?=
 =?utf-8?B?WGVkbHRIUG9WNDVnUVpSaWpEODl0MWtoZVFEMmtNTW95YWtnR2dWeUxrZGNN?=
 =?utf-8?B?NVpPdjNQdWY4NXU4bXgyU0VtSEwwMXRVQ2VVMi9zN0FtMnhjbTZ3ZEhrZ0pp?=
 =?utf-8?B?YnlSYVdBaWI0MnM3MlA1SFd0Z21iTE12NS94SGFDeXI5SnNNNWliZm92cEhp?=
 =?utf-8?B?UkVLbWRKLy9IU0RuWWYwUG9BaS9WbW1GcjVaUzNzVG4zUHJMQUFHUW1DSkVz?=
 =?utf-8?B?aFlDRTNmcG9yWGwxbWpnTENGWFd2QUlkYjcvOHhoNlVnTkZWWHUxTloxOFFX?=
 =?utf-8?B?TW52QXc1aTFiMmRidDVaYUJPMDMwamdPTHdZUVRlVUZxbCtDZ0Z6TU1oQkxO?=
 =?utf-8?B?Q1BLdjVSWjdrUytPRzdLditvVXFXTHRBUEVMdmFOckVVTnExckgzYi96M0JC?=
 =?utf-8?B?ek5ST0FxUUZnVUtsMm9lVWtkM2hBbWhCeWIyUUlPL3NQd0JUMXQ4Q0pIQUpo?=
 =?utf-8?B?Ry9qQUdQdTV2VlM2SndvS0VqelRKODhoNkhYZFZIZE9FUHovVmlpSE5lMVk2?=
 =?utf-8?B?N3VQVXZlQkRDWnVDVUJqTVYzakNrZVd2eHVET2RqbU5HM1k3L2h4Y2srMzZh?=
 =?utf-8?B?TXY1MUQvQnNOaVJoTFI1alUxOEdTZ1NjVVE4eC9qWUFwTm5YZWZCczhzeHJU?=
 =?utf-8?B?R0Y5VmxOOUhVUHdkOU84c1ZjZTBuSkFPT2pxUXZ4d2l1RTJXWlZONEp1MHFX?=
 =?utf-8?B?V1BoVW1RM25tc2VGemFlL1VtZ1VNb1Q2bDBoVWs0bTJDbmhwNEdHVHg4QndL?=
 =?utf-8?B?c0c5Y3YxQTRiK3RVWHhLbjZIN08ycUpiQVROU3JJdjF3bnI5TCtDMXlITzZy?=
 =?utf-8?B?MSsva1NRaFRER3pXNXJpeDZUYTFPSnJJb3IwNFVoa1VyWUpsWlJJc2x2UWU4?=
 =?utf-8?B?b21UZ2p3OHRQVERLY0dNejc1RG9OVmg5djd5TmNHNmdzTjZEN3N0cUVHTENq?=
 =?utf-8?B?SGZHc01pbmt6MDB4RURzV2ZmeFNKdG5TQ3lFQUVENU5NUFVhMGVNdklRSmlE?=
 =?utf-8?B?c2UvdDBXQmdyaWduUStjSTRkbTNxZURSbEQ0UDFtOUhTTXdQTzJCeU82bGFw?=
 =?utf-8?B?MnY0QjJodFkwVmxkcFhRTWhXK2l6QzdDUmloeEVVenRqQUR3UEV0NisrQkhX?=
 =?utf-8?B?QzFISlcyQTd6WWJ1N1NqTkY2aXZpZ0FVMldxZzF4akl3dUtEL0IrU2N0ZTZJ?=
 =?utf-8?B?cC8rUmpWbTRibDNVeUVVT0FFLzFyVkFIdDhSK3dwNXNucFBNc2U5TnpOWllT?=
 =?utf-8?B?aS9MLzl2V2VEMHB1Tmx1VU1yVEdiRUp5SnBRaW80bC83VFhZdEJWQ1dEdnVw?=
 =?utf-8?B?UnBKdFhyZmhRZElxWnoxRDZuTHAxczByZVBlK3BOL0JmT3paUThtR2lTR1Bo?=
 =?utf-8?B?Q0I5OEg5TzNjcjR5WFZ0VXJzS1NGcEpPc0tpYzNMTkJwVFoxcllhWVFIQVFP?=
 =?utf-8?B?OCs2ajRNckVkeFl0VlhJci84cUhvSTRQTXNNbXc3NmhpMkQvRUZXYkVob2ZB?=
 =?utf-8?B?L2hBc09tUkdiZ0RzUHZQZmlzdmRZUlR0a2NjS3BqaDlOK0lIdEQvUjdNYmhK?=
 =?utf-8?B?R0VRM1BZck5kc3NRVEdoWjg2azBEQjFyb3N3ZWo4b2hKRXRJdk92U3NEQ0FQ?=
 =?utf-8?B?QjNLa0lsY1FMdWR6RXJLSUJ0aS9NRDBaRHk5S1JBNUxGYWU1M09RcjZhQita?=
 =?utf-8?B?dTBoZ2pyZGo2RHI4dTNJbU1FYUZVSlp1bXl6RXdtK2VxRTdudUJ6MGRWNXZ4?=
 =?utf-8?B?eWpuMWh4aFhhU3RCWmJ2aVcvZ3FKOGJwV252Zy9jVUtrZXlTdG5wZzVmMU1B?=
 =?utf-8?B?dXZzeGF2U2VCY21YRkJWOU85TkdCSkl6S1VPTDRoczNob2h0VE5kM1FYVTY1?=
 =?utf-8?B?eXFlcGJNa2grU3NMREUwTVc5VUd5cHBPUEFFRy91TnpqTHFGc3ZXR2FNWGkz?=
 =?utf-8?B?dkF0WTg0MXgybXJtZFlBYU92RHNPc2dHYVRyVEsxbVdpNHdkUmNDa3JQNlQ2?=
 =?utf-8?B?L2llZVN6S1N4dUY0dUJXL3RFb1Joa2VjRVVNZnZQN0RkZlNnS3RzQ1lITXZ0?=
 =?utf-8?B?dnhRZjhTTm1kaG9ZLzI0NG1RdzMyOTZiVnNZdDJYdU81UEtndjJ6ZmtKZ0RH?=
 =?utf-8?B?ZFMrNFR4NjNtbHpTK0NpdHV2OGd5V3BKNzdyenN1Y1FTeWVCaFd0NTVMKzFF?=
 =?utf-8?B?elZnWEl0dmJmMGN4R000WDh4YWNMQTdRK3MrTjRacGtiSHRRaVJaNm04NFFW?=
 =?utf-8?B?OVBMSk40MkZJUmlQeDUzbHpKc1VkWTZXYWNudlcvQ0svaXRTb1ZQZkFtZ2hF?=
 =?utf-8?Q?IHZZ+TFXeFv4+M2BV/F7T0zsWCiT4hGvE5IGveD0S6MiB?=
X-MS-Exchange-AntiSpam-MessageData-1: mRZ74s/mnEAuQg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 584c0326-fd4e-4af3-31b8-08de5e6260e7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 11:42:55.9976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjxCBJBM7P/tQ8p3hHSpvCDcrqMw5MHX7mNhZIFQkS/vkFLsJ1R1B4sxHcKkh9KDJtKAwxkxMmb8YtOdMIuEUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7563
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 0DF40A0B50
X-Rspamd-Action: no action

On Tue Jan 27, 2026 at 3:26 AM JST, Gary Guo wrote:
> On Fri Jan 23, 2026 at 12:12 PM GMT, Eliot Courtney wrote:
>> The current code hands out buffers that go all the way up to and
>> including `rx - 1`, but we need to maintain an empty slot to prevent the
>> ring buffer from wrapping around into having 'tx =3D=3D rx', which means
>> empty.
>>
>> Also add more rigorous no-panic proofs.
>>
>> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue binding=
s and handling")
>> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gsp/cmdq.rs | 33 +++++++++++++++++++-------------=
-
>>  1 file changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/g=
sp/cmdq.rs
>> index 09c28eeb6f12..aa8758fc7723 100644
>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> @@ -227,21 +227,26 @@ fn new(dev: &device::Device<device::Bound>) -> Res=
ult<Self> {
>>          // PANIC: per the invariant of `cpu_write_ptr`, `tx` is `< MSGQ=
_NUM_PAGES`.
>>          let (before_tx, after_tx) =3D gsp_mem.cpuq.msgq.data.split_at_m=
ut(tx);
>> =20
>> -        if rx <=3D tx {
>> -            // The area from `tx` up to the end of the ring, and from t=
he beginning of the ring up
>> -            // to `rx`, minus one unit, belongs to the driver.
>> -            if rx =3D=3D 0 {
>> -                let last =3D after_tx.len() - 1;
>> -                (&mut after_tx[..last], &mut before_tx[0..0])
>> -            } else {
>> -                (after_tx, &mut before_tx[..rx])
>> -            }
>> +        // The area starting at `tx` and ending at `rx - 2` modulo MSGQ=
_NUM_PAGES, inclusive,
>> +        // belongs to the driver for writing.
>> +        if rx =3D=3D 0 {
>> +            // Since `rx` is zero, leave an empty slot at end of the bu=
ffer.
>> +            let last =3D after_tx.len() - 1;
>> +            (&mut after_tx[..last], &mut before_tx[0..0])
>
> Does the address actually matter? Otherwise I would find `&mut []` easier=
 to
> understand than an empty indexing.

The address doesn't matter, and indeed I am not sure why we did that
(possibly a lifetime issue with some previous version of the code?).

Your suggestion seems to work fine, so Eliot feel free to include it in
your series (as a separate patch please to make sure we can isolate the
effects of both changes).

>
>> +        } else if rx > tx {
>> +            // The area is contiguous and we leave an empty slot before=
 `rx`.
>> +            // PANIC:
>> +            // - The index `rx - tx - 1` is non-negative because `rx > =
tx` in this branch.
>> +            // - The index does not exceed `after_tx.len()` (which is `=
MSGQ_NUM_PAGES - tx`)
>> +            //   because `rx < MSGQ_NUM_PAGES` by the `gsp_read_ptr` in=
variant.
>> +            (&mut after_tx[..(rx - tx - 1)], &mut before_tx[0..0])
>>          } else {
>> -            // The area from `tx` to `rx`, minus one unit, belongs to t=
he driver.
>> -            //
>> -            // PANIC: per the invariants of `cpu_write_ptr` and `gsp_re=
ad_ptr`, `rx` and `tx` are
>> -            // `<=3D MSGQ_NUM_PAGES`, and the test above ensured that `=
rx > tx`.
>> -            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
>> +            // The area is discontiguous and we leave an empty slot bef=
ore `rx`.
>> +            // PANIC:
>> +            // - The index `rx - 1` is non-negative because `rx !=3D 0`=
 in this branch.
>> +            // - The index does not exceed `before_tx.len()` (which equ=
als `tx`) because
>> +            //   `rx <=3D tx` in this branch.
>> +            (after_tx, &mut before_tx[..(rx - 1)])
>
> If this is written with get_disjoint_mut, the indices would be so much ea=
sier to
> understand... To bad that that API is only available from 1.86 onwards.

I for one am longing for `split_at_checked`... :)
