Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA52DA2AAB0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 15:06:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1354610E866;
	Thu,  6 Feb 2025 14:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZV2XjAV/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5887010E859;
 Thu,  6 Feb 2025 14:05:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trNYClL+rLfMbibE8dY+YCrpcUbeCNLC4dYezRzqNJbBnPNIrhnM8RsqP1uADSKZ9NW6/CyrmVX5dVTjrDZcNOxZkQFa12Qu/IXfOssmUuJ0Nj+iowPc6p3TnFWMCIxxWF39E9VZT+XY/0WBZEX8Z8IfiG/NBx/vsOeX1BLCp+WPGtfF2pC6AcPHWG2S//6MuwHascl7W+NCzYjdQTeC7k1w7XYmEB7PhT/jNP4du4tjv9nzrmWBWirLPyXmWRtMc+MAvrhyc6/A6RN6LVkaqugQjbYJQHurjJjF3NwqhuKhzVl7rEL5e0vACmdyaikeoc/vupj013ksmPv6AassHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4hQlM5GhMnlPpNOPQFjrxCEY27NE2MF8eD9wnSmTtQ=;
 b=w+OKPVNsYKfiuirJjsWZZXUWm9SqP43EDXaqORAn3kobH/jNi2vJbtmvgCNauZTsCjP19ZVUEHuR7KyFrArr4KvpOcd3SysEIUODJjSpzVBjSuKzw9niJhxrYVYP2WlqXsgpcXqLEWRN7FPiMr/W/yY6cUCSX2YA674q8PrwJwWMJmJcnmndT58yAMBSccofdp9YYlSPcJBbrFUr14FjwTdTD/6AuZ6o+fxjAVhtHJqUF3UsRRCx9qqSzfBIEK/66NQxwv11vFcNy9qPeCnkBsOpqnQZq7IecSxgSlDWxzJCdVCUqzuUVsgLanBY9Nco584hi3AnaGBwATC2651Wag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4hQlM5GhMnlPpNOPQFjrxCEY27NE2MF8eD9wnSmTtQ=;
 b=ZV2XjAV/jfMgom8gu/cyhPsJO+3UJn6pETw0IdGCTNdBsMRYa0vRqdFZpHuOuqeY8BT09YF5RZLE4Ufz6hDIoplTpfceKxNWxv7abZL1wRtFtNuc1KmAuJ03AqvYm7tk41ts5vY2d+amiK1yqQc0nIreOEJVbl5cexojCqDBmNoqL7wxBOXRXaoYQeBZz5nEBxhg5UMZ3nIxh1b4JuT417wSYhdt4wX5Xut4b/ynnHTBgvwVRN+80+fs45BPC6gjfuLbQHGHGE7dupsrrq/wJ0sfPpsuZPYD4nVdgrvFrEsLLA7A0PcKGcwAejq+2lwjAfR8353qJYEgz2bSsr0iDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Thu, 6 Feb
 2025 14:05:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 14:05:44 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Feb 2025 23:05:37 +0900
Message-Id: <D7LF554L2J0N.JRPHDUCHVKP3@nvidia.com>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] gpu: nova-core: add initial driver stub
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
 <lyude@redhat.com>, <pstanner@redhat.com>, <zhiw@nvidia.com>,
 <cjia@nvidia.com>, <jhubbard@nvidia.com>, <bskeggs@nvidia.com>,
 <acurrid@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250204190400.2550-1-dakr@kernel.org>
In-Reply-To: <20250204190400.2550-1-dakr@kernel.org>
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4439:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f747ab-258b-439c-bfd5-08dd46b75922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUlzRWpZSFNxNmd0SC9xSXY4U0ZzdEhadlFrNzNwdU1rWmdwWlFYRWdieVQ5?=
 =?utf-8?B?bFpSelFIWWlIWEJoOHNkTkc1Sy9oRnNsYmhDMlhZUW83bTlGTHo4dkRSNXpQ?=
 =?utf-8?B?clZCRS9pamxFVTBsM3RMZ0x4YzdnZDdCOEZMaGdLcldkNTZRZ3djdyt4b0VL?=
 =?utf-8?B?NWtiT0dtVjlHeC9PQmRCdEJQQmpWQVlWOEEzcnBGY29hOWEvbEVwWitiOFVk?=
 =?utf-8?B?azFPTUlLT2VaaUpCa0pJRGRwejRpaXRtekpCUUNpS0UweHdCNk5qcFdvbURU?=
 =?utf-8?B?V3luRXNLVHhkVTFiaU4rNy9iMlF3WDRXUnJMSEhtanpEY3orRzA3WDczK2I4?=
 =?utf-8?B?dTM4c3pJUlJaM21GcnExRnFuM0lwWXFOS1dadGw0SnJkZUM3YTc2bDkxdFl5?=
 =?utf-8?B?bUJGYTVISml2Qjl1cm5vSDRSQlpxM0xkU0ZyY0h0YmNrRHVyRWsxeVRTczQ3?=
 =?utf-8?B?NzRZTVhvVjRBMHJqQWRCUHNSWE5zSkRKcm9Yc0hOVXRZSVE3ZHM1cTdJR0Ri?=
 =?utf-8?B?Vmx0VlpSN3Nic1R3SHZjbnpMOFhOdEFBZytPaUQyTEJKV3FObXdCY1FVdmxm?=
 =?utf-8?B?ZCtjRGZNcVpVTk5pR1VaN0FtOGpnbG5JVWpRdGExZUhuK0g2WHY5VG4wcjM1?=
 =?utf-8?B?Vytkb2lXM3lzUkk1cklTZGN1TG1nQStSVGVMbk5FYmszbVpOUU8xYlpBZmhk?=
 =?utf-8?B?UXJGZmlHQUtTSU1weEV0WVA5WmN5ajhXMklpVFN4MHlIL3pldFZ5TitDVVVJ?=
 =?utf-8?B?NGxxTXBGWTZycUlMdGtkcmlETUdkNU5pbWx1K2N4WmVwaS9IdFhna2FKcW45?=
 =?utf-8?B?OGNrR1c3YUJHSzJQNUFmRTN5UTdncUdxZlpLblNaejJNNy8vSjlDalNvaWMw?=
 =?utf-8?B?SzRIS29wcGZtWkJiaXJnT3FoY0NEaWpObmFUbEZvc2F1cmZYZjNPMGUvRUxL?=
 =?utf-8?B?aDZsTVBsdGVJVWIyblB5STFUaVA3SDJCaWpxekt3aVNXckcyUTdML1FJZnVs?=
 =?utf-8?B?Nzd5L08zNENwbFlwYytXTkhTZ1Q2a1IvdnM2QTZ2bmdaZzZXZ1VHeFhJVkNC?=
 =?utf-8?B?QVZOa2tQK3FnRUVzVGlTM3FXdWJUTDN6S3oycHZaK1IwRTF0MmNlcmQra0Vu?=
 =?utf-8?B?cUpyTy9UbGpwc3dvUjF1a3Z1Mk5IRHJOMk1kdzJZblFLTGVla2Q1ZkwyQVZ5?=
 =?utf-8?B?bkF3aURqWHdFL2Z5eFFOR3pqeWIxSUU2R0tvTW4yOUhVN3AxWUpiY0g5NzRQ?=
 =?utf-8?B?QkcxMHJiSU5zZG52WVVvSjJEQXJLTjFVY1ZrNjNnODVTTUJTYld6blBCc0Ix?=
 =?utf-8?B?Qmtub2tKR2s1MGhVMEs0NmZKZ2w2TTVFaElEc3ZrbVFNZ0JiREEzQmc0WVMr?=
 =?utf-8?B?dkJ4OHpuVzdqRzllaHpYVFFLY21HTVRxYUNob2VFcXpsWUtEUTV6bVh6RXhz?=
 =?utf-8?B?M1MvRVhnZUJCQnNpQXZzdWc5eHMzUmtmbDNZL1NacjdJK3ExRk9XaUFlWXhr?=
 =?utf-8?B?Mi9ISXk1eStHTkdXOUIwd1htRnM4MTBFTWFvU2pDb3I3MnRUMUs0VUZNUDlL?=
 =?utf-8?B?MUdtWTQ1ZEd5ZkxwVUVSa2xicEVJaG1GdWZ1SFV1NmJLekRhZUdvQVJBdlRO?=
 =?utf-8?B?SS9VRnJoZEgrNlpUSS90enFZUW00UjNrR0VvMXAvVEwvSG91b1pHMEdiWXNa?=
 =?utf-8?B?ajNlMWQ0TFp5S1JTUzljajA0enVxODVJQWlxbEg1VzRXWHFxTzZYN0Vmdy9x?=
 =?utf-8?B?ZDk0ckQrVlVzNFFwSVNya05KWDA0eUJBMkpsNGRBQzBlTUk1dE5oZ3NvMzVI?=
 =?utf-8?B?eTdRWVBBOFl0R1Y0YVpXYjkrdDd3cjloZFpVS2VmbldZSm1Ed3dKaGVWOVcy?=
 =?utf-8?B?OFU5Wi9aNi8yNzl4Z055Q0xPV1hEYnZFa25tZ29IQ0N5aGZrZWhiMFcxZzh6?=
 =?utf-8?Q?jXSeeTHWouE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnNINGFvV0NVd3pJdk1IYlFycS8yOURjRGF4VmkxWFBVWGVNRDFrZ1QvRERD?=
 =?utf-8?B?am1DdTdRMDRFaXBPRjMraUUvbTFwd0lrYlFJZ1VlWkM5NmthK2J5VVBtUFBU?=
 =?utf-8?B?bEprVzlBeGdTTnFuQnVnTktYUkl4VS9XWnhmWitTT0Y3bDgxUDFhZXpLY3Fk?=
 =?utf-8?B?Sm1tRFMzZ29oVlJGbjdxb0RNTEticDdQZkJEc1lNV3ZsRmlkcURCbnRtRTFh?=
 =?utf-8?B?NkNkRWl4aFlndmN4U0dZaUhueC9LZFpoNWpRZkRMbjB3cWRVMnpCdWRBazR4?=
 =?utf-8?B?WExWNkl1dTBaWTlmUXZ5NXQvcm1aMWtoS251ZnhIa1FyR05aK2daQ3luUFp6?=
 =?utf-8?B?VTZHdTdUUmlIRzZidzVJSHFZUFNTck92SG1BRzZpZTFXbU9TK0hlWlh6Y0FG?=
 =?utf-8?B?QU81UUlsU0JkbGN2ZjViNGFVekwxZUR0RytFSlZ5Y0RqNmhZc3lOdWxPUGhX?=
 =?utf-8?B?TVZXYitzdEd4WEt3dVREYlVOQ1FRNkZSL2VjV0Q3RktWdjRUYkF1QUFVT1VE?=
 =?utf-8?B?c0YyM0poOXdBb3dFaTcvWjlkZmREckdyRkUzeUxxZWZJazB5dDVzTFNxaTRH?=
 =?utf-8?B?UVJOZ1JBVEorRUIxU0t2Um9ucVVVUll5VUgzMU9qQjVlNEdoZFZhZ3RRVDJL?=
 =?utf-8?B?RkR4d21DMkcvOUR5T0JQVEFaRkFyNzBxTklEOVZGeGpDdENVTmE1RlNPY3lT?=
 =?utf-8?B?b0I0b3pHaWM4WVc1N2o2bmcvSHA2elRoR2xBT3BqaHRTdGFrRGNVcUR3OWpx?=
 =?utf-8?B?ZEF5cC9HdFgyVGY4cHdueGxwOTdEb0JNOVVQeU9zejRYNnN6bGw4aHJaTGxa?=
 =?utf-8?B?Q0RsT3puQ2Z5Mjl5V0I2eEROOU44UzhLT0FxdGNGdEhRRUdjOXhCSldPcnhr?=
 =?utf-8?B?SFZUQWlmbC9Yb1pOVlJhZlBlQzYwWHVpVVdpL0FBNlc2S1J5b2R6amppcVZ2?=
 =?utf-8?B?SVovZ1BISVRSdUFQa214ZUJnb1QxbkljbnVndzYxMkViM2FmR2dMUldyQUJU?=
 =?utf-8?B?SmtPSm1IRTl1UVEvS1prajFudldZUzRzVlExQUJhbWNtSGgwMWlPd1NiRndV?=
 =?utf-8?B?M1QxVlYrVHZRNXQ0RkNIMzF5N1J2cXJWd1lKaUR2WTc1cnVnMmV5VUtweFBV?=
 =?utf-8?B?NTE0ZXR4YTAwU0lycDNEaVBHLzMzVU1EN3BFUUk0R3FMeTc1YjFLQ1VZNy9v?=
 =?utf-8?B?b2oyeVJLR3h5Q1JDcjZpeE5NOXcrbnJyL20yemJ4L0x1VEZvMFhiVHduY2Fj?=
 =?utf-8?B?TnUzK2ViK2RPbVZsSzdDanZQOGFDOXZyd3Q3djBsSlM4bVoyK2J3SDRNUWpF?=
 =?utf-8?B?dWtITG44clg1bS9hOXd4QlREc29vWXdBL0R6WGN6dXZXTTRJVEp6T1psMVd5?=
 =?utf-8?B?YWJTT1R2N2l1NTBxY1gzakhERGZwNHdJZ283NkRLTk82REpISHhrMWo1MFd5?=
 =?utf-8?B?Uk1xQ1ZNdXJpTnhVanR2di9qTTNkdERhSXNjaUdjQlRPUkQ4ay94VHBqV0h6?=
 =?utf-8?B?ak14SC9ScnlhYzZqeWJSaGFZV0ZTUFR5QVhjMksrV2IyVloyNURMOHJycFI0?=
 =?utf-8?B?K2lTVlBlT09Nd2dYd1B4VXR0Vlpjb1J1KzBTYUsvOHFObzNZZmZhMXpPUWpt?=
 =?utf-8?B?YmJPUDcrS09HeTVjMjVHS1VuRHZWZGRBYkJpWUpGclp2K0w4WTYrSzdqSjdD?=
 =?utf-8?B?TjNUd3hnOVp5dzg0TG5EbmZWOGY0T3hlb3dvbFg0MkZ5MWVlZ0lkcEw4ckRY?=
 =?utf-8?B?WTRiT1FWNWhVZHlEL0JEamFVeWNiYmpueHI0T0pBWkZQbmROWGplSGlpN1c4?=
 =?utf-8?B?UnJKaXRIR0lBcVVYbHM5L29IM2pZUEhyWXhuYU1ETDd5V0x3eFc5SVloc1Vh?=
 =?utf-8?B?ZjVFU0pvbDVEQlpBeURscWVhTThvZlcxcklZaWxRa1hvdjlTd0hjZzAwb2Z1?=
 =?utf-8?B?UEVlQUVnNnVtclJJRU8zNjNJNVkyNXJqRDN5ODViSHpyUnlTdHdHNDRUVzd0?=
 =?utf-8?B?ZGJSQ3BhUUZZUjVqdU9Lc3ZNVHdvQkt1KytqK0xtaUtNaVgvV0ttakE1OGhm?=
 =?utf-8?B?TnFhT0plV3kzd3ZCQ05CbHJ3V1ZZQkhHOWV2T004cURvZDBWa291TEhFR2lr?=
 =?utf-8?B?U2g4cm1EZ1NiOVd6dkFJKzJNT3F3VzVkZ0hPdERDNG5JZ1JUOEM0eE40WFhD?=
 =?utf-8?Q?ViHlAYro+4iO2ZT3DquydMXVnEgU58qO3DCDBqtDezP+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f747ab-258b-439c-bfd5-08dd46b75922
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:05:44.6737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UE18FQdv8p6ot0adYoPSZ+OqTLqM09+XZiYP4nHkPnS9FUZYOvRfAv9LW+l4wowRQv1mbmz8cJLyLigqEFqoIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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

Hi Danilo,

Here are few comments - or maybe I should say nits, as they are really
minor. Note that all my experience in Rust is from user-space, so feel
free to ignore anything that does not make sense in the context of the
kernel or is too pedantic.

On Wed Feb 5, 2025 at 4:03 AM JST, Danilo Krummrich wrote:
> Add the initial nova-core driver stub.
>
> nova-core is intended to serve as a common base for nova-drm (the
> corresponding DRM driver) and the vGPU manager VFIO driver, serving as a
> hard- and firmware abstraction layer for GSP-based NVIDIA GPUs.
>
> The Nova project, including nova-core and nova-drm, in the long term,
> is intended to serve as the successor of Nouveau for all GSP-based GPUs.
>
> The motivation for both, starting a successor project for Nouveau and
> doing so using the Rust programming language, is documented in detail
> through a previous post on the mailing list [1], an LWN article [2] and a
> talk from LPC '24.
>
> In order to avoid the chicken and egg problem to require a user to
> upstream Rust abstractions, but at the same time require the Rust
> abstractions to implement the driver, nova-core kicks off as a driver
> stub and is subsequently developed upstream.
>
> Link: https://lore.kernel.org/dri-devel/Zfsj0_tb-0-tNrJy@cassiopeiae/T/#u=
 [1]
> Link: https://lwn.net/Articles/990736/ [2]
> Link: https://youtu.be/3Igmx28B3BQ?si=3DsBdSEer4tAPKGpOs [3]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> Changes in v2:
>   - Fix module name in Kconfig description. (John)
>   - Expand Kconfig description a bit. (John)
>   - Expand name for PCI BAR0 region.
>   - Do not store / print boot0 raw register value. (John)
>   - Rename CardType to Architecture, rename enum names to represent the
>     architecture name and adjust enum values according to the register
>     definition. (John)
>   - Add an abstraction for register accesses.
>   - Print chipset, architecture and revision.
>   - Load bootloader firmware. (Timur)
> ---

<snip>

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> new file mode 100644
> index 000000000000..be260a8ffe46
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -0,0 +1,187 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use kernel::{
> +    device, devres::Devres, error::code::*, firmware, fmt, pci, prelude:=
:*, str::CString,
> +};
> +
> +use crate::driver::Bar0;
> +use crate::regs;
> +use core::fmt;
> +
> +/// Enum representation of the GPU chipset.
> +#[derive(fmt::Debug)]

I suspect you will eventually want to also derive Copy and Clone, as
well as PartialEq and Eq (so the assigned values can be used), but it's
of course fine to postpone this until we actually need them.

Note that the usage made of Debug suggests that you actually want
Display - but I understand that implementing Display would be more
cumbersome.

> +pub(crate) enum Chipset {
> +    TU102 =3D 0x162,
> +    TU104 =3D 0x164,
> +    TU106 =3D 0x166,
> +    TU117 =3D 0x167,
> +    TU116 =3D 0x168,
> +    GA102 =3D 0x172,
> +    GA103 =3D 0x173,
> +    GA104 =3D 0x174,
> +    GA106 =3D 0x176,
> +    GA107 =3D 0x177,
> +    AD102 =3D 0x192,
> +    AD103 =3D 0x193,
> +    AD104 =3D 0x194,
> +    AD106 =3D 0x196,
> +    AD107 =3D 0x197,
> +}
> +
> +/// Enum representation of the GPU generation.
> +#[derive(fmt::Debug)]
> +pub(crate) enum Architecture {
> +    Turing =3D 0x16,
> +    Ampere =3D 0x17,
> +    Ada =3D 0x19,
> +}
> +
> +pub(crate) struct Revision {
> +    major: u8,
> +    minor: u8,
> +}
> +
> +/// Structure holding the metadata of the GPU.
> +pub(crate) struct Spec {
> +    chipset: Chipset,
> +    arch: Architecture,
> +    /// The revision of the chipset.
> +    revision: Revision,
> +}
> +
> +/// Structure encapsulating the firmware blobs required for the GPU to o=
perate.
> +#[allow(dead_code)]
> +pub(crate) struct Firmware {
> +    booter_load: firmware::Firmware,
> +    booter_unload: firmware::Firmware,
> +    bootloader: firmware::Firmware,
> +    gsp: firmware::Firmware,
> +}
> +
> +/// Structure holding the resources required to operate the GPU.
> +#[allow(dead_code)]
> +#[pin_data]
> +pub(crate) struct Gpu {
> +    spec: Spec,
> +    /// MMIO mapping of PCI BAR 0
> +    bar: Devres<Bar0>,
> +    fw: Firmware,
> +}
> +
> +// TODO replace with something like derive(FromPrimitive)
> +impl Chipset {
> +    fn from_u32(value: u32) -> Option<Chipset> {
> +        match value {
> +            0x162 =3D> Some(Chipset::TU102),
> +            0x164 =3D> Some(Chipset::TU104),
> +            0x166 =3D> Some(Chipset::TU106),
> +            0x167 =3D> Some(Chipset::TU117),
> +            0x168 =3D> Some(Chipset::TU116),
> +            0x172 =3D> Some(Chipset::GA102),
> +            0x173 =3D> Some(Chipset::GA103),
> +            0x174 =3D> Some(Chipset::GA104),
> +            0x176 =3D> Some(Chipset::GA106),
> +            0x177 =3D> Some(Chipset::GA107),
> +            0x192 =3D> Some(Chipset::AD102),
> +            0x193 =3D> Some(Chipset::AD103),
> +            0x194 =3D> Some(Chipset::AD104),
> +            0x196 =3D> Some(Chipset::AD106),
> +            0x197 =3D> Some(Chipset::AD107),
> +            _ =3D> None,
> +        }
> +    }
> +}

Shouldn't this be an implementation of TryFrom<u32>? By doing so you can
return ENODEV as the error and simplify the caller code below.

> +
> +// TODO:
> +// - replace with something like derive(FromPrimitive)
> +// - consider to store within Chipset, if arbitrary_enum_discriminant be=
comes stable
> +impl Architecture {
> +    fn from_u32(value: u32) -> Option<Architecture> {
> +        match value {
> +            0x16 =3D> Some(Architecture::Turing),
> +            0x17 =3D> Some(Architecture::Ampere),
> +            0x19 =3D> Some(Architecture::Ada),
> +            _ =3D> None,
> +        }
> +    }
> +}
> +
> +impl Revision {
> +    fn new(major: u8, minor: u8) -> Self {
> +        Self { major, minor }
> +    }

Suggestion: add a version that takes a Boot0 as argument and call the
right methods directly in the method instead of relying on the caller to
do that for us, e.g:

    fn from_boot0(boot0: &regs::Boot0) -> Self {
        Self::new(boot0.major_rev(), boot0.minor_rev())
    }


Then new() can also be removed if Boot0 is the only sensible source of
Revision.

(I'd argue that Boot0 should also implement Copy, that way this method
can take it by value directly)

> +}
> +
> +impl fmt::Display for Revision {
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        write!(f, "{:x}.{:x}", self.major, self.minor)
> +    }
> +}
> +
> +impl Spec {
> +    fn new(bar: &Devres<Bar0>) -> Result<Spec> {
> +        let bar =3D bar.try_access().ok_or(ENXIO)?;
> +        let boot0 =3D regs::Boot0::read(&bar);
> +
> +        let Some(chipset) =3D Chipset::from_u32(boot0.chipset()) else {
> +            return Err(ENODEV);
> +        };
> +
> +        let Some(arch) =3D Architecture::from_u32(boot0.arch()) else {
> +            return Err(ENODEV);
> +        };

Technically the Architecture is already known if the Chipset has been
built successfully, so there should be no need to build it again (and
test for a failure that cannot happen at this point).

Since the architecture information is already embedded in Chipset, maybe
we can have an arch() method there?

Something like:

    impl Chipset {
        pub(crate) fn arch(self) -> Architecture {
            match self as u32 & !0xf {
                0x160 =3D> Architecture::Turing,
                0x170 =3D> Architecture::Ampere,
                0x190 =3D> Architecture::Ada,
                _ =3D> unreachable!(),
            }
        }
    }


This would also enable us to remove Architecture::from_u32() and
Spec::arch, which is redundant with Spec::chipset anyway.

A better (but more verbose) implementation of Chipset::arch() might be
to match every possible variant, so we get a build error if we forget to
handle a new chipset instead of hitting the unreachable!() at runtime...

> +
> +        let revision =3D Revision::new(boot0.major_rev(), boot0.minor_re=
v());
> +
> +        Ok(Self {
> +            arch,
> +            chipset,
> +            revision,
> +        })
> +    }
> +}
> +
> +impl Firmware {
> +    fn new(dev: &device::Device, spec: &Spec, ver: &str) -> Result<Firmw=
are> {
> +        let mut chip_name =3D CString::try_from_fmt(fmt!("{:?}", spec.ch=
ipset))?;
> +        chip_name.make_ascii_lowercase();
> +
> +        let fw_booter_load_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_load-{}.bin=
", &*chip_name, ver))?;
> +        let fw_booter_unload_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/booter_unload-{}.b=
in", &*chip_name, ver))?;
> +        let fw_bootloader_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/bootloader-{}.bin"=
, &*chip_name, ver))?;
> +        let fw_gsp_path =3D
> +            CString::try_from_fmt(fmt!("nvidia/{}/gsp/gsp-{}.bin", &*chi=
p_name, ver))?;
> +
> +        let booter_load =3D firmware::Firmware::request(&fw_booter_load_=
path, dev)?;
> +        let booter_unload =3D firmware::Firmware::request(&fw_booter_unl=
oad_path, dev)?;
> +        let bootloader =3D firmware::Firmware::request(&fw_bootloader_pa=
th, dev)?;
> +        let gsp =3D firmware::Firmware::request(&fw_gsp_path, dev)?;
> +
> +        Ok(Firmware {
> +            booter_load,
> +            booter_unload,
> +            bootloader,
> +            gsp,
> +        })

This looks like a good opportunity to use a closure and avoid
repeating the code:

    let request_fw =3D |type_| {
        CString::try_from_fmt(fmt!("nvidia/{}/gsp/{}-{}.bin", type_, &*chip=
_name, ver))
            .and_then(|path| firmware::Firmware::request(&path, dev))
    };

It is also short enough that you can directly invoke it when building
the Firmware object, without using temporary variables:

    Ok(Firmware {
        booter_load: request_fw("booter_load")?,
        booter_unload: request_fw("booter_unload")?,
        bootloader: request_fw("bootloader")?,
        gsp: request_fw("gsp")?,
    })

IMHO this has the benefit of being more concise and keeping related
operations closer.

Thanks!
Alex.

