Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC2EA947A2
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50BC10E2A1;
	Sun, 20 Apr 2025 12:20:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tTn0vVem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381FD10E2A5;
 Sun, 20 Apr 2025 12:20:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvBLou6Oh59gRdWYJkJGb4vhZybCunuDTWN6yBfE9L+lpRPRDxR2b4+VnNh5lFZvIectdH74U38WtBMwlHJyOKTSelLdBERCIvkyIeQTpxFqEtbRwdfxS0fom7oTua1o24g3Dn0SETpBmh6+8mFQkK1iJTovTCkTBRPPEcH2u02uVLN6+hme7BHSWMvnQaVgFUgLsn0RCwv2nuBHoI9vm0XcWCCgT+jJxgQkf1q5IwRWFmwqTlFh0bTEXDhO/tXba+lWe0y9MuoNmkSDy95Qr/+pX0ywId9+Cj/BU6d5Ec01CiccKh1OSCvAFhyhg+EQS3iPgaGMSh/akPsg7ZNnbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiZI8pM4Zu/6ZqF08uy2+0TbE30HzmhD1uWG+Lm3eBw=;
 b=PLH6vcHMBa7S3MRYQxSFzEFUd0Sz16R6kX1ZXTYtQmzKZ4YzV8uWc/CDl8SfBTtdD7tsFQ+yCvhinXAgSTPjaYEGE7bNWdl50vHFsoo9jzVn75dL8gxTK4YZti7ZYwgkO0XwqbP8KKeIurmOltQk0ln21Fw4OJZKaNkZ5g+qKFlWgIGfjeGodAhRDmbrn7Zc8Re3eHE2xsCSycblMaBptTRuQBophCRpHVMJdpx+mDAVufmKbWpvF2e7HtdYTiSeS88mCoX+SGlgdwOSQK37fSkhTLIKp5xVwRPqYeLKffLDi4YF6IJF7UEFwCTDa4QiR5E1D44BN57+ccwF0cu1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiZI8pM4Zu/6ZqF08uy2+0TbE30HzmhD1uWG+Lm3eBw=;
 b=tTn0vVem48okIdYJgTtN+c7/DiqUx4nPfMXirUlL31xrwI5OmA/6FAGmhvT3a5A2A5RQVCVmdGlsiL0cycqH4SvgtO8AkXIAeTfJH9Sfq6ZFvce6LMsL4kURgM4l+yQyWzONXcnUvczeGadTEl9RtuXlekJ78Ju6+pUtGmyh9mUMH4x55m4YeSl5MoW/eRTM/wdTfOQWgjsJdgcmALAjAqNzALFVTVz0nEs18RHkWm/pjD+36N20hMp+L2pGuQrND3yv5rsgAZsdHzLWoGSU7VIV1khU7WpnUHMGAyQ0NIn09LGhrAytlI9+Lefv2PKB6khXce6Ke6Y6IAHsvzqC/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:08 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:37 +0900
Subject: [PATCH 05/16] gpu: nova-core: take bound device in Gpu::new
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-5-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:3::24) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 41089990-dfc3-4d35-02b1-08dd8005b08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTZJbko0MVpzdUdYT3hlVmZ6Q2JCRHo0dWdGTmM0VVAvODBNQjBhbW4rSUl2?=
 =?utf-8?B?VXlDUk9keWZOUVNVazNiNlN3V1l1UUV1SkphTnJXWTNVcTE5WjZDZlVrajdv?=
 =?utf-8?B?cll4dDJ2US9URDE4NmdSZ0RPa2phTW5ic1MrRGloTEhRRE1VRjJ5MVc4ZFg3?=
 =?utf-8?B?a3FFYzlaNzB2RUFnQzY1ZXFNZE14RlBhcndZbXpsTURvVmFLZkZVbjJ4Smxn?=
 =?utf-8?B?NElUNGI1dlNGQXBaVTJQS2dvZE5yK1FHVlRYdUpzZVoyb1YzUnpITDNnamVu?=
 =?utf-8?B?VHFseTh0TTN4WElqckZEekFlUTY1MWQrMVVOb09DaHYxZm5oRU5sRjZyM1BZ?=
 =?utf-8?B?K2M5d2ZqU0R5RjNrRnIrajdsMU5TYUt4UVNDMWJXM0UzazR6RU1oa2l3TzM4?=
 =?utf-8?B?dU1iQ2tKWjJkejQwTmYyazJCV09yVFB1d1NsVmZjWnIwNTR4aVQzVys2di83?=
 =?utf-8?B?Y0Z1VEFQVHNpTWlBaE5BeWJ5Q084WXJ1RFBzaFcxU0RORjlxZkdZeTg3dzJx?=
 =?utf-8?B?MWExL29mWlNPWTByelhidWVRVmhXWnJiTGxXbU9Ca0trQ0k4N1hHTkpXZm8w?=
 =?utf-8?B?ek9ab3JSZ2ZYY0taTDMvNG9LcDVPUVR1VDVKMUh5MUI1b3JqWXAzbE1SM1I2?=
 =?utf-8?B?RFRvOVdXdUQ4MFQyM1BoME9NSFRIdlRvREZBK2p2d1cra21nYUZ3cE12REhU?=
 =?utf-8?B?eXVLc2dWRXp2ZTZrcWNZWHVML011L2ZhRER4UmJvcFBHd1VwMXprS2hBdEZa?=
 =?utf-8?B?QkxqRkpFU0gvbkpiQ1dZS2kvcXpVQzIzalFRWlRmcmZ1OW16WTN1eXdLWVgz?=
 =?utf-8?B?RFc4N1R0R2N2Mnl0NC9aalcyWEpCLzVYeEhkd2NNVitXb3VldWdZZFk1c3Bj?=
 =?utf-8?B?MXlKc2E4ckMvOUphNXRoL2llVUw0TmhwV29CVDUxaURTbTVBbi82MDh3aWpE?=
 =?utf-8?B?M1Vwc0ZDaU5rQzR4cnJpZXNpUHF2Z3hKNTNteEF6cnlocGFzYzA1L1RZaXhN?=
 =?utf-8?B?S3Nnd2dZZmZGNUdoc1YwOUdiTGFmWkxpb3ViTkUyUm1pZVVyRjJwRDJLdHJG?=
 =?utf-8?B?dEdwRFd0SG1wN1RJZzkxdlYvMzdmdTQrTzNrRnAwOGNKRHhSalNvWWtVT1Y5?=
 =?utf-8?B?TkJtaFh0Qzg1SG1Tdkdabk5kNy9jTHRJUTVNdDM1cXh3TUpoRWs5bHBhWm5B?=
 =?utf-8?B?MDc4eUxQZ3dkY2dnbm9YQ1Jqam9GVkllejBuQWhVNk52TmF1R3V1c285V0sy?=
 =?utf-8?B?K2NBWXJCSUlScWxGanI5Zm9oSkxramtmMlE5dlAwQXpOOFFxSnF5eTZGcXYy?=
 =?utf-8?B?MFdnUldmQ2JkMHE1ZDJDV01TWStYQjQrYTBGTkJ2OG5la3pLcHNWaEhCeUpS?=
 =?utf-8?B?cnpwQzkwdWxCY0x3WnluTDRGR0J1WDJDYml2c2ZLT3NQbzNtNGgxdTRXRVlQ?=
 =?utf-8?B?WGhxNElOYWdBZGVlYTdWblQ0dnQ4NSthR3VOanBSRHZHbXFBNXpvNUpZSnFl?=
 =?utf-8?B?MSt4ZzBIT0dLcS9DV2N0dWtZY3J5OTVLMGpDYjdCd05sTStKUjlzSnM1eGRn?=
 =?utf-8?B?cXJpdm1wZ2QydUNLdkUyS1VUNCtqeEhtZllXMzNvUXJHWmgyZXRpZTNHWUJm?=
 =?utf-8?B?MnRUZkRvNGFvMWZRRUZEQWZROGx3eU1UdCtaVmg0OENXYnE4TThuRWVLQngv?=
 =?utf-8?B?NHJzMFlWTlhsZjlQcFl0Q2tGeURJNDgvSmszdGFPNDhxcnFMVW9VQ3luK21Q?=
 =?utf-8?B?aXNkK0JDVVBYd21EM2lHNHJXZkR6Q3loQVRNcEVZckxkZ1NuWFVDM2RWWlI0?=
 =?utf-8?B?R0hEN1cwVkFwdUVCSUFETkZNT3lwcXJCZjcxdzFaek1RbXVzVjB5TVdxNVd4?=
 =?utf-8?B?bnRpOEozc0cwUk1ZV1A4d21ibkE2U292a1V4OWw3TURUTkNiR2RzNkx2NUZ3?=
 =?utf-8?B?N3B3N2ZQdjQ3U282Tm1HdTR2TTVMUDg3TEpFTEU4dW15RldZcnAwdTVJd2pI?=
 =?utf-8?B?VGhkUUkrZkdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW1aVkZUR2MwcHZ0NmQ3Z2IySW5Za0pTOVdHMHlodkk1T21GcUl1eHU0RVVU?=
 =?utf-8?B?WWlKdnQreTlhMTJCdnh6dGcrVHJqN0xURCtIRlJsVlU2aEZUcnBldUQ0WXN6?=
 =?utf-8?B?ZE05NHVFTW5LVjY3dDVabkgvRTk0U2JOaGxVQlRQL2MxYVhma3ZjUk9kRU1u?=
 =?utf-8?B?YWt3dXlzZW9KSXJVeU5WQzRyREFDUTlPeXg2NWJOeWdSbDkxVW9RWGI1R056?=
 =?utf-8?B?cUhPanVEc2JsV0MwSlY3UVZqOXVnN3A0RTVSSzhGMThkT3E2dVd2R3ZyZGY0?=
 =?utf-8?B?NDVSQWV1ajB5Z0pmTCtWeElzS3hIU1BLUVVIUjVoRkFkdXBLVzdHbkxJMmRC?=
 =?utf-8?B?RDc5M1Q4WmMzbU9GdVlTZC9yb05hZ25ZTnplUHRsSGx3Z1NEdDZxNzNJYlE3?=
 =?utf-8?B?OGJ4MThhSXhsYVVSQ0xINER1MStpREtXNWg4SStCY1hWSnZOakNZdzVCMHBv?=
 =?utf-8?B?UUZ5dkRLWDR1OVNaRVJ5SkIwNW1iQ1NYS2JCMXVLendDVmU5dFFKMlg4akhr?=
 =?utf-8?B?QW9iTDBpNVdURVczcWp3dHNEUkF0TDNRZzJYaVMvQkgrZm9wb1Z5SVNVTWFa?=
 =?utf-8?B?aFFHYmxBcTNDTUswUU5qLzNXMTc1QlhlMVc1MmswcEZvaTFOalRuT0tpRUNE?=
 =?utf-8?B?enJwQlFxa0QwdDIxMmFFYXF6L3h1MitQemQ3d2Q5MEx3M0JZRmZyQ2o0Y0ZD?=
 =?utf-8?B?VEpWOXkxQVhCWEhML3hGajdJSUx4SVQwQ2l3c2tJcnBzeWQwNWlVMk1kcW1p?=
 =?utf-8?B?TVd5Vjg2U0RDeVZZOTA0d3I2RzJkcDVEdzZkRUpJd0JHb3UzZ05SYXFGS056?=
 =?utf-8?B?UGxrUWF3S0xJMlA4NXIxZ1VCOUhZS2RGdGxkM0dFSlAwR0tDeVlHUW5ycW5r?=
 =?utf-8?B?VzZEOG41ZXhlYUlrU0t1d21rUEZmMFNYOVlTYW83dy9aellkeXBXcG5DUUZs?=
 =?utf-8?B?VFBESE4yUlE2cFdJS3dRTEJwVmpKSG5GR3FIanJlZURGTnE5Y0pzZit3dk9G?=
 =?utf-8?B?elJ5SmhEQkQ4WnBxZWRUKzFCN0JRbU9yVU9UcWtYQXduSDViWStwT20yblNJ?=
 =?utf-8?B?QjRKQnpyYm1NdUtOQzhjSmp4eFlKU1pXcW9hZTBKWDhZNzVrRlZyeDJ4ZWZJ?=
 =?utf-8?B?U09QdU82N0VHVmZsZG52V2JDRFE4dWhIY1hVa1BoS1VoNjFPK0FKUWNrQ3FU?=
 =?utf-8?B?ZVFkbFgwMmJMVm1tM05Ra1dXT2lMMWt2TlRQbGJLcFhxcGxCcXhkeGVuZUJn?=
 =?utf-8?B?K25xdkd2MVNKeERXZ05rV3VjdHdnVnJmelB5R1EvLzkrSUM4aFRzekJFK2Ru?=
 =?utf-8?B?VHZNK0hpcVNZajJsWmZGYkJYU2VIL21vVjAzSHBUdDVFV3BmYy9idFpYMC81?=
 =?utf-8?B?ZHhUb1FaTjVmVnFUZGlrQjBHYzFpZlBoTVhEMEtMTmpTR3FzRlQxb05vVXN6?=
 =?utf-8?B?T1NBNVRXWXJwSnpEWkNuMk9udmJwcUlsTDdwakE0dEdFOWxOM1NJNFJCTGx1?=
 =?utf-8?B?WWh0Z3QyTkthUW1LSDlMQkhJdHhmUVl1K2pYajNqVlBZSVN2NFRKZmZCcXpr?=
 =?utf-8?B?eUpWcld0dHBhVUdSeXpOUUcxZFNQUU5pYnVHNVJCemdKRXhSQjVRTmhKM3dk?=
 =?utf-8?B?eTdtbGhEYVpUcXhjdkVoMzFnTE9oN2lGU1VuUmU5YlZ0ZGQ3Vmp2ZWZPbXNj?=
 =?utf-8?B?cDA3OXdydVF1WWsvYW11enZiYWZyQzMxWHJRQVorYTc4RlladndLNDBuRllL?=
 =?utf-8?B?SXdJSGdnWjhQT2J1N0JHbUZvVW9NNnQ0cHpLR2w2ZE1qSFJyNDN5NDh6N2Rt?=
 =?utf-8?B?bnk0NnRQbW43K2NkNUp2UWxOTG9uY0ZkZWJvR0Fac2pQdi8yWW4zSXhEUW5Q?=
 =?utf-8?B?N0Y0Q0xncTdQeElxRkNydHoyWlFUWXg4L01wMkdxanFJQWFYOFFxYjQyUGZy?=
 =?utf-8?B?TFR1REwzWWVZdllTL1hkb0RjMk9zZFB1anZZL3RxN1BNUGE4Lzd0b3ZtVFFE?=
 =?utf-8?B?RTRYd2RsaHMwMVdSdjFZNVlMRkJIa0tVWEpsOHFiOGpUODFuM0tlVkdYWDRt?=
 =?utf-8?B?ZjBQWTRnNm14aFdkV0ZJQ25YVnA1czd2VUVRd1llRzg2UHZBYjF6Sy81R0JG?=
 =?utf-8?B?NnNhOEZRSml2UFltNzJsd1VyeVl2eDMxMWtjSVMwL0tCcGpCWld0aVBkejd0?=
 =?utf-8?Q?7n21IkO5dLAMunLOicrZ9Yf3LvT01lC1d8FZF1LFv+eS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41089990-dfc3-4d35-02b1-08dd8005b08a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:08.3006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHCZVzA93YC5bad38w5hlnpIBIONlAjkmawMtEYx0awdk9U0eCPLvseUmuwCFAuYGAD0oDTINqBLtIIySph4dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

We will need to perform things like allocating DMA memory during device
creation, so make sure to take the device context that will allow us to
perform these actions.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9fe6aedaa9563799c2624d461d4e37ee9b094909..19a17cdc204b013482c0d307c5838cf3044c8cc8 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -183,7 +183,10 @@ pub(crate) struct Gpu {
 }
 
 impl Gpu {
-    pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<Self>> {
+    pub(crate) fn new(
+        pdev: &pci::Device<device::Bound>,
+        bar: Devres<Bar0>,
+    ) -> Result<impl PinInit<Self>> {
         let spec = Spec::new(&bar)?;
         let fw = Firmware::new(pdev.as_ref(), &spec, "535.113.01")?;
 

-- 
2.49.0

