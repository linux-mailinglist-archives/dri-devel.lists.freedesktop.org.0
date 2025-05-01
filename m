Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5ABAA5EB3
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C0410E81E;
	Thu,  1 May 2025 12:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="acS10iJP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE03510E35A;
 Thu,  1 May 2025 12:59:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6vjtVicFZyzTqh9aw2lHSbF+Dyr43Zka+FH5QPqTACvjVrhaQiB+nTZiwX+My0zxkFEKwySsykBIrfG+GQ7yqBG7rVGU7LSj7XNuYbfN1/xC8CV8vHnAmIWo/UV8nvcvXp/Wte6HK2F4Jxsr1JGJyohlGQXoaKD8j6xCCH1h311AZxcWKmIr2OJewisNe+oY9w8u+IkYlj2IP70Zvr4yigBjhA7Im5rsctmEJCkTh/ey8Ix+lxOeNjPfRcM9IonlbbFP11IQJ4BYvhkwt9+672KVCcrlo8AIoocKo550XZaZ0QU1/5MUM3XM4nFruDaWj47BdbGpMWwfcdsxk7ArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPTmwN0glf7WjhUerrKyJMaFvWRXWDbnYc+uvGNFom8=;
 b=k0H6AOMibwW+9ot4tPMo3rsgdJzt54unjIl4U1NbrLMI7SpkX6R3EdHS3xMkjVqpsvUMy5Hn+5MprFV+JOosWVzk1FDpvUkiptEC0ZP2wANiJgUcRbiPAyDMLT9gBXTRRRpc7EIR9g0QZFj3lpAsPW19hSVjCS2Fqm6p7N6xaPvOKugubbPBgiHv3pKqEeAXg7l7lQpISLaqZXJSgCXE1sqOxkUy72sBFS/mMLVhlGmv0MVLvy0/xcYeGBq4dpQoH/lrKk6Rj/yH8Ix+h0lEdkf8FQ0ugiPisr1eoylDi3IUr+JHBVPzLRrLo6cvvwEG0am+dSuJqHcszQ51zNhpsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPTmwN0glf7WjhUerrKyJMaFvWRXWDbnYc+uvGNFom8=;
 b=acS10iJPuK6QblsltcGw14lim1B/K9cE+hc/UErR+qoGkkQvAMPRHodabp4pOIoVLRKPS4ABijmS7oxx50BFW7/Xz/Wi2YD+VaN/IJNUFjQptAyQ4NE5agFJdvKKMkEZ592nE3uJBUvifp2TuTL0zTANkypjIPCQBHmxx6oKSM99fkjhl20YGKaw8qi60Q0X/82rLbm2dDLe/6UDfL6ramLevwm256hCdFYSgqw3ZDMUVWCHzfHZ7OoFdtlF0UD99W73o5gjHoJlJlntaXPqPNGdzzY97CyZJZGJhTC7vNYpkGpDPA6sWmNdCGpIzV1cc8YJBkJPx+erds6QP0F8sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:58:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:58:59 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:21 +0900
Subject: [PATCH v2 03/21] gpu: nova-core: derive useful traits for Chipset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-3-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1a9f94-da20-435c-6728-08dd88aff05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3p5d2IwamNmWTduM0ZJdG41OFVzM1lPbVBRS2paajBJalNndW51cUw4dWJE?=
 =?utf-8?B?S2RIdWxTTnh0cEIxNE9DYWlrZWxaNHRrT3ZmRlIxaUlxNzF1KzZaNkc4L3BN?=
 =?utf-8?B?Rmg1Z2ZxSXVseVh4NEJPWGErMW81RDNkdGRmSXM5Z1hHam92aGppM3NZTGNt?=
 =?utf-8?B?aGtYdDB4MTZvWlBDRzBhY2FNN1JpQkFTRmpkVEZNek9BaG1RV1BwMTJSL0p1?=
 =?utf-8?B?eUFBMUhVZWFhbFhadlZQT1M2ZEh6cE4wWWw3emVPSWxqOXNrZzFkY3pmditU?=
 =?utf-8?B?ZUF6czRMZlFNOVNxY1FZZ1VwVjNNdDZFcXU5MXhsVUdVRUVwQVdHRDZBUCtp?=
 =?utf-8?B?L096NmNzQ1NBaTNZUm9zWURLUTVnMVZaanZodEJXOG1QTWoray90MlpGQ3hP?=
 =?utf-8?B?VFFHbUdyZnc0ajVPMk5tdGx1Wmx5SmdFS0g2dCtJUkFteFFiWUNoSkxSUThY?=
 =?utf-8?B?Y0RKanhHNUJZUXdCR2hibVlyWXE4K2EzMms2S3d2b24vUzBvcnpqWnZHc2xL?=
 =?utf-8?B?OVRDZFVoS0kwTXlWL21nVmZuNjViWDdDQWxoODR1Tm1qQ3IyN0habTRHeXdt?=
 =?utf-8?B?Mys1Vm45eER1bXk4TVhQOTRMQ2ptdE1CUFMxb3dCZXlxb3VPK3ZsZEowQVA5?=
 =?utf-8?B?d3YveU1xYjU4RzJyMkVxbktJSlJ5NlFBWVhLSjBYVzVrbGhxL1g3LzY2Nys1?=
 =?utf-8?B?NGU2TGVQcXg5QzVqejdsbFdrNE9oRjNULzlNOXZIV25DU3pVM09yT0hkWjFp?=
 =?utf-8?B?QzVEemVPd2pDb0dYSFlMT2l4TkdRVWVUY2JKRjFMeGZhUXp4bjN5OUVPU0I1?=
 =?utf-8?B?aGJLaUFQZXgvN0owYmZPSTlDeldwR0twOVpSL01XK3R5aFFjUlA1akJwUFNJ?=
 =?utf-8?B?d2YvNXljOXBSeDRWQ1lQV0REK0JGKzJpVWx3SnR5UFk3NXNSTERjQkk1SmRS?=
 =?utf-8?B?Syt5UVJQR3RIelYrQlB5by9YNEd1NlJlWkpDTThwcXpTRDN5MlNSZU9ibnhF?=
 =?utf-8?B?WjFMSGFJMXpEeGpMOEtNMmwxZDVaWTFrV2ZqVm1ZRy9SSnUrT0tFdzFYY25s?=
 =?utf-8?B?bUVGc1ZCbVhkQ0FzOEY2aEgybUp1azkzajdDSXIwR25DUGdBb0JUditIT1Vk?=
 =?utf-8?B?TFUramhLMUJxRE1YclZQTkMzZHRtbHdUWHhVM1NlRXBnaDVYODdvejFyWkJR?=
 =?utf-8?B?a1ZHd3Z6c2lnMmR6OEFSMG1qcjdEbU1xWGw1N3loUVhRSEZSQ1lvYkQwN0k5?=
 =?utf-8?B?TWxsY1RIOTJCUzE0dmk1WTF3UXc5RWFrTnR0YjZxSnNuU1NXaExRUEN4NzdY?=
 =?utf-8?B?c3V5ZWV3OTZxNUxybksyM3lJMHBocFk3b0JzQTh6OXVHTVBQYVpxdllQV25N?=
 =?utf-8?B?SjNPVWlWRW5SNnd5QlFnYzNFakN3TVN5WnZRcWRTa1hGb1hnSDNYWUxYdEE5?=
 =?utf-8?B?YmREcFdFRXUxck1maXVpUmp3RnJRU2JBU25PaEZXMm1aK1NpYkM1YXBESysx?=
 =?utf-8?B?MVNPRjJIaDZ2cU9GQ0hteG4xdGUveEZyaHdSZy9lMXhNVlFmTFRpaVBpY2Fk?=
 =?utf-8?B?WWxiOW5LYnUwYkpndnF6NnpPRFBGaXEyMlJKa25Ud0puYTFlVUN4SlF1MHg3?=
 =?utf-8?B?bUFXcmdSakxtYWhYUmtlMm52UFpsK3ZWMUg3SWYybjhRRzgvTjlkcUVVN1dO?=
 =?utf-8?B?OG9YQ0NYbmI2MnNjNE5Id1NxV3psUjVuaUZGVkJydkxyVEIrc1g4QzJwVEVs?=
 =?utf-8?B?QTBpY2VVcTM0bVVKSUlybW1kYkxhREpkdGUwZXk0K3U1SGNGWnRNN1Mxc2NF?=
 =?utf-8?B?SDVucndZWlREYjBibkQxalFEUk9UYTA4U25WQUNTUEQzWVNMbkZpVk0wSzhs?=
 =?utf-8?B?bTlqU01YZm0vU0RUWlhvN2V2VUg2cTZCc0RvRG1xOWs0S2VlSk1FR3Nqd2hh?=
 =?utf-8?B?d080alluYXhqSkFOR3dZaEM1WS9kSHpyZWczWUo2eHg2ZHQ2TXFpZVpzM1JV?=
 =?utf-8?B?VEhzWkg5YVFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXVwRXpJVTVCVktyVDFvUk9zK0c2dEtpdllQNWhVL0hCYWdpRmoyNW5uc1Ra?=
 =?utf-8?B?OVJhemZqVzNQK1RySEpEMzEvSTRzWnVoOGNacFE1dHBsaGJHalc1ck5tK2E2?=
 =?utf-8?B?TEYzRTdIdUljUzdYT0tRRUNOVkFOaEkybDdLaVd5bW95V2lkVis4UjFzVnlE?=
 =?utf-8?B?cC9JS2pOd1JkUXNJcTk0NXQ3Z3FGTWZBYTVUbmdjL0VxdVZqTlRPeVhlNkE2?=
 =?utf-8?B?TkJVTExHL2lhbkE1ejJuZWJadW9JQ2JvK1NNT3Q2cDdQRWY1ZUhZKzlsTWVy?=
 =?utf-8?B?a3RlMjAycnl4WjdNeHpPbmdEa2xpWjRydFVVZWM3VWpqMWJlK2d4MncyYkJn?=
 =?utf-8?B?YWM3bUhJTCtwSWhaRTl2SStzVm5jNlo5d2wxclRzYnArME1RdS9aaXNXZVdB?=
 =?utf-8?B?cU42cUlBSm1FYktnV1l6amNnTnJudlUydTBvaTBPUlFTMm9tRzFvUFAvaURT?=
 =?utf-8?B?TEFoS0VxNW1nd3hjWTdObkdJNmtpTWV2RmtIRlo2Rk9FTkp6K2JGRFBtaU9V?=
 =?utf-8?B?bUZJZnB2M3hXTklPWU02MlZRMjRhMTkvemR6azJDemxlYWtzbC94bXFkRU5H?=
 =?utf-8?B?dnZiYVVQM21mVEV2ZURVS1lZa2V4eXI4cXFJTDUzMjRuOWJhMW4zQ2ZsdDBx?=
 =?utf-8?B?VHBqSW5zTUplMnB1Wkc3VUIrUkdTREhPdHpNSGdINjRZdUJ6Z0NuYTBKRy9M?=
 =?utf-8?B?QjUraVVTOGUyUkJuM1dxMTZyd1A5cnFFYmRiSHZTTExIclRYMWtoanhybmlU?=
 =?utf-8?B?Njg5aHNBdlp0SVZGZVV0SHFUaFIydVhHQllDanFyd1MraGVZUFlOcld5RytW?=
 =?utf-8?B?bjUwV2hYQjFTcUN4Z21HWUl3RlRiVGZxdVMxY0JIS3Nna05WQ3JHZFZXNGVk?=
 =?utf-8?B?OStRQW9GVTZlWDNmaVUzQTVIdFRTMnBRVzJxNlJaNk1IMEtUdDNyT1NsNVE0?=
 =?utf-8?B?UVhUSDR6TDZmdVBiWmF3SGRaWTNSOWV6N1kxRzFWSmN3UUpES0lySXZTS0NZ?=
 =?utf-8?B?WHJ6QW9jdW94UzRyQllKd1ZLaEhoaFZvVUFMUTU0aFlBSmU5YlpaRmp2a24y?=
 =?utf-8?B?WWFmQnJMeEZUR04vYzEyVjZGVVpRUHRvY0dSblJHY09ONkhQTjJ4QjN2WE9F?=
 =?utf-8?B?MFgrU0ZsMFI4VUlQcit3Nm5oN2FnVS9NdklldHhmbzErNFpXVEhVVk94UEhs?=
 =?utf-8?B?RHFkNkVVQmcyWFZjbHI0Q01aQTFWNzQ5cWRFUjhGSmxSMFpVbDZFTSthb01p?=
 =?utf-8?B?L01NUGppQWUzSWV5ZVdPcFZiaDhJVXlYM3dHa3Jra3MxRm9YSEdDekFvL0lB?=
 =?utf-8?B?dUpNK2prbWt3am5XTkNWc05tb3hDdk9KSUNkTmFTMkdmT2lESjh0T1puazh4?=
 =?utf-8?B?WWxwVFZ1M2JsTk1wMEM3VlVMMEppQkF6a1F2ZENncm40RmxYVFZaWEpNSmxx?=
 =?utf-8?B?QUhBUW5NV0gwVm5rTnpVd0F4QktqQXRTdVFCckNkdVNEdjE2L1pNcWFTNmFF?=
 =?utf-8?B?bHBZRjFQTSszY0FDcVR3ekVtM1BueGxLdUw4SGp5SStuUEdlajJpZkZqZ0R2?=
 =?utf-8?B?ZS82QWlWaHpOU3dIeExiVnUvY3Y0MUpNSENseWdtQ3Bwc2ZWRVFNTzIzTlo5?=
 =?utf-8?B?OTRWR0xUQXY4VkgxYUozNmYxUGcrNDRNbU1mRkVzTGdSdGNnNzIzeXJwcFJK?=
 =?utf-8?B?d0hydDNTUXRRYU9SYnZzbDZ1bGxNVDNsZTM2a0JKRC9vbzJ2QS9MWGo0VTRD?=
 =?utf-8?B?cGtyeFhSb3pSMVJMbkZuUFNlbU9LZGRzS3kydzMvRnZGckVkNUFoYkE4K21x?=
 =?utf-8?B?UXRCSFNYMHYybHhjY25DQ28wN3RxNEFQbU1kSzIxdmRMTCtvWExmMkRCaWww?=
 =?utf-8?B?YzFicEMvMGk5aDlMUnc0SXFIR3NYblNWNm53QWhBbzc5Szd2V0dlSmgrd1hD?=
 =?utf-8?B?UXJiVVBPYkoySFkxNHFuOFkwWU9tMmhCUWc3RjF2Nm5VNlR0eEFZNTlWekkr?=
 =?utf-8?B?NlhheHJOTVppNXBpaHdTY01qRFdBcUtqdS91dkdJcUJKcmU1dnpJaVVXWGlz?=
 =?utf-8?B?clVKaDJCZDVyVXJWdzl4b2JTU1pVYllHYWF1SEtLRFhvbUVOMjFURGZqN3VB?=
 =?utf-8?B?clAyYnJOcHJxa1dJZnJRY3ZNdGtOeGtvbVNqVFlHQkVlc0hkcUEvRmdmR0FE?=
 =?utf-8?Q?2xtx/EUjfmujNUN47YENvoqE69KGenp2/luDkg46ScRR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1a9f94-da20-435c-6728-08dd88aff05c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:58:59.1227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mCu8O6jo0rcp5KPz2twzbr8FbRFqtAE0DNdtfWWBx16nFAst1+c/77jiQRJm9xsn4Z5CGBy/ILPCOnwzj/0Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

We will commonly need to compare chipset versions, so derive the
ordering traits to make that possible. Also derive Copy and Clone since
passing Chipset by value will be more efficient than by reference.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 17c9660da45034762edaa78e372d8821144cdeb7..4de67a2dc16302c00530026156d7264cbc7e5b32 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -13,7 +13,7 @@ macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
         /// Enum representation of the GPU chipset.
-        #[derive(fmt::Debug)]
+        #[derive(fmt::Debug, Copy, Clone, PartialOrd, Ord, PartialEq, Eq)]
         pub(crate) enum Chipset {
             $($variant = $value),*,
         }

-- 
2.49.0

