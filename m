Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DE3AA65D5
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:52:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906FE10E88E;
	Thu,  1 May 2025 21:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nvOon+F+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E7710E88E;
 Thu,  1 May 2025 21:52:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTgC0xsur9ONwBPOLiXl4FN1WvfWnzRkGRKokqjQuTSfbmhOj3bGu7n5RD/WsDoT2B8EXSMiLPtwG6hPe0qg+mHM7UacgCGw9anPggnJHivm29cWs+mzh+/nCIdgm2/OqPH2nV9lSYARwk5sEQUURPbjU93sfST3Kv20+xQlLQeb42jnDlcj5fbp2mlMyKJwrliRnWCZXAUUKGAWNemC7B0p0H5wKKTsdKGOrhq9ShMccXwyoN8R3Ve41oe6fbENvXUJ9HmDB2BuzSa+lmZzfuUuwZ4vROb8Chliyx1Uo9q3BSnJU+ZiP464N+sT0a3FEdRH/AnOUuKayVxmxIcYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgnljnmEQmjNJw4+xPmQ+dmvr5+3Wv+qr1ck5tM1PgY=;
 b=knDNRDZv45KZZTRHHU6Cp/TPfFHlho6l3bJlKSZj/Do5YpFQKM/2grOZQnoAUB4aVUUUPvsvr8gGFVJKwXE7tQ5bPwbWT+kyBmBR1K0yKzayWEfxMCinCigVrkLq8FnrieWSg0HGK5ZDyWkgrxzC/AAthRboS0ljtL2wjVHVEfi8cXUFZR+VCNWduHsJJ/T1dEFBPWC3CArAPfVFOiUgES2OHCL0QebvdycCKJRQ4eVQzS97FfVQr4MiWLtLVciE+D0vUHoG/AhOl4PeCeiPJBavvIH6LtfJlNkZhgFjDn9BLNmQcTx112TSq1/mRbm0XX6L5SlHkdQFxS4NIKWSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgnljnmEQmjNJw4+xPmQ+dmvr5+3Wv+qr1ck5tM1PgY=;
 b=nvOon+F+6LbIAtoLKRasArPOlGM1KDoFobhTyPNHtaNj0cYwZFBAdCw5GlYy0DDrhUfPYlI8S1z4kdU+ku3XknSAvC9qUzRJnRsdX6cshVnyq1/L5q29darcNPAzC63PMmGDRuSfpY6M0nsP6pN+cGvNr/rrYdsNzQKTgZ0kuqb9STJ+nNH8qAKrKMw1yesvS8g15+2c6QkD8+Qdo0NvnAOR9e1Nuo646n6McutbFbOscnR7fTBYyvbu5p+dzhRHOIq5IhB7txL7NcM27id4leoaVNZf1PmE0mEmWSPAmh+4WNQm/iiUWyA3Cz02UNv8pUyVK6BBfok3Th5I9gRg3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY5PR12MB6107.namprd12.prod.outlook.com (2603:10b6:930:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 21:52:27 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Thu, 1 May 2025
 21:52:27 +0000
Message-ID: <a5d078a5-2995-4fcd-bdfa-096e544db07a@nvidia.com>
Date: Thu, 1 May 2025 17:52:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "corbet@lwn.net"
 <corbet@lwn.net>, "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "benno.lossin@proton.me" <benno.lossin@proton.me>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
 <D9L4MCKPAUE9.57CNHP46R2IC@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9L4MCKPAUE9.57CNHP46R2IC@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN8PR12CA0012.namprd12.prod.outlook.com
 (2603:10b6:408:60::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY5PR12MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c809948-8644-49d6-a2ca-08dd88fa76a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGxHOVczQkIrQmlqK3NRakwvb1dKL25odkRVQVdidHFNNUpZUTFBOXQyU0RZ?=
 =?utf-8?B?Wnh2Y0FkNzhBTDkxck8xaDkwbmNjTHRNUVZQRmVINGFLY3BDd1JncEFYMjJ5?=
 =?utf-8?B?MDdDUXdjL3FndlRwM1RTU2RPNGpQN0VCSG5uQTI3MHNEUFFTSzlML2NLK2R1?=
 =?utf-8?B?OTUvNW9GTHdMYm1TSWZ4N2owcEtmMFZZVmpWR1VPdjVJUno5UEk5T2hBb0ow?=
 =?utf-8?B?enRQUzhSL2FWRmRXa0JRK241QW5YUEhMNVVlWi9lV3lHK25qb0U0K2ZlOWVV?=
 =?utf-8?B?aHdGZzNGLy94UVI4VVBBb04wSDgvR09ML0NhREk2bXptMXBwdFVma2oveFhK?=
 =?utf-8?B?U28yRzRZNEFlTHhhS2NrNDljYWEvUnNKZSs4QkpQN0ZJdEQrWnpCeUI3dnhz?=
 =?utf-8?B?Ri9kZnJOam1iUEV5QW5TK2RYQUo2VUlXaDd1amhIaXhnRGhoaGNQUVgwRW9O?=
 =?utf-8?B?NmZrTFlNRlovcUdJdldzQWFWVUVWMlZ2SGlQcDNFR3ZlaE8xODBBWGFHVWgw?=
 =?utf-8?B?ajZ5TjBDYjJvNUhpdmdPbncya2RRaDV0Z2xHMFZ2RnRJVk1vRXdVaG40azkr?=
 =?utf-8?B?aHkxMU9UQzNvS3JDdnlMZWJ4OWQrTFRhRGNObGlXVkYvNTZPRlNLSXFxTXRj?=
 =?utf-8?B?bTFZTUVTMzlwQndiUUdZY08wTEdWbURZeUxKY0VXSFhLdjFOenVmaENvcEo5?=
 =?utf-8?B?MmZzOStOaC9tOVJ2VEdjckJGamJWeWdSNU1qNCtlTUFtTVdoY2pxYUE0akZC?=
 =?utf-8?B?dUlGT2I1Wkc1aVhJLzVqbGgvc0w2dG90UUhOL3gwbW9oZVN4UWU2YmVOdG1x?=
 =?utf-8?B?Zm9aemZ5YjVPVS81c3hCYVpONkw4U3FoZXJuOS9Hc3Z4WnJJR1lBODJ3bHhK?=
 =?utf-8?B?bGF4TXYxbHhBWmpsUXRaVkpSMTFnQ3hOMDd5Y1kzZlZHeWliamYwQ0xiMCtZ?=
 =?utf-8?B?Q2N5clpnWDFsNDVCaEdwTURQTW1CckZ2OVRwUHExbWZNS0tEQW9KQlk2TlFh?=
 =?utf-8?B?dGZudURlYWF6b1VkdFdnSW5NNnVPTlhWRlppRDV0YUt0ektwcUNtellCTE1K?=
 =?utf-8?B?TnBHc1lRVnBwbHBnQlhvT2hLWFB6WlhEMFk2MWRZbUtwK2w1U3hsQVU1azRY?=
 =?utf-8?B?TW9FUWs3dWZBa05XN3VHVXQwNzRpaGhwbnppUmpYQU0vcXVlSEZkbkppcjJL?=
 =?utf-8?B?MFBHNjd0SXUzNFVMeldaQU9uYUM2MDZFU2Y5cUt2QW53NnM0ZnYzOW10TDRw?=
 =?utf-8?B?L3NmSy9sS1lWME5pTGZ0eVNBVTFHMUluZm4wVUtzWWRUQnY3ZndSKzJOdXd1?=
 =?utf-8?B?VHhjTll3Ylo0R3lWbGx0K0FCdStTSml3UTBoYTgzZlZEcDBYMFFrcHE3TVhO?=
 =?utf-8?B?Q0VLRE9ZL3FjZnBWM3FHUWRzS2E2cnY0SytRT3QxRXh4eXprTmpoWkxKU2Rj?=
 =?utf-8?B?YTdpRk1KS1ZPWExXdTRmRnRMa0lBWmwwVkdGYjRJeXlrT0pQWnF5VHdIZndp?=
 =?utf-8?B?c1BrWFJyYVZycFBWNmVIN2M5cXhyL1F3VTZKcTVNWE5nYUFKaGxuV09HVEJK?=
 =?utf-8?B?VlFxUjNXenQ3R1FxeXFKckc1VXFDS0VLK3o0am5xdER1RGVRVytjRXMxTXYx?=
 =?utf-8?B?RU9mL2VqVXBITm80ZkUyOXczMG0xQnVZMEM2dXFRbDZPSGhnWkpWVVR5ZWM5?=
 =?utf-8?B?ZHFEQ2ZWRnhYMG93SEtKeEFoSDJiTTFVSUIyaVQ4eERSckhJcUFPRzdaQ1FL?=
 =?utf-8?B?UFNhYWtQcmlPdWloa0Z2TVZBSXFyRk52Q2lnOXVlTkV5MFVSWi83VEtYbkxU?=
 =?utf-8?B?SzEvSmcrQkJ5WHVmbXlFcEhRa2NIK2I1L2ZGZmRvNTdrTXpkOHhDajhiUTND?=
 =?utf-8?B?ODU1TEhOOFdzaDVwYWJBOXovYW45WHFHeXc4MDB1c2tObUc4TkVTUHBnWDJV?=
 =?utf-8?B?cFB1ZldFZUxTM2g2N1U2QVFEYi82SGUxVmt4SXpsc3dvTVZabys0WThjVVo0?=
 =?utf-8?B?TUdnSXF0SGNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mmhhd1FYbndmMCtKQUxJblA3MXZLUXlDRSt4UW1Vc05LdXFWOVRmckhaejh6?=
 =?utf-8?B?N1JnalBxb3NnQkxyMkJpSXFvbkpJZmlla09YeVFZK3VSQkl0cnlub083dkF2?=
 =?utf-8?B?eGYybUVZOWRIUktGbDhoVG5RS3BLbC9LZEl0bU92aVpJOEV6MDBnVUlaRGtG?=
 =?utf-8?B?eUFUUmRMd1pLQys5MGpRbDRiV01FV1RRTEw1bFZoT1UySmFPUThFdHFGQjdm?=
 =?utf-8?B?d2lDUUF5b3FRTkluK1RQcGlUdEdEakpIa0YvSHorZjlLc3Nzc2Z5djNKSWFa?=
 =?utf-8?B?bkt6MkVzalFBMExDZTZGVWs3R1hLRnBaZ0c1Nmk0QmdIZ1RBN3plVGptQ004?=
 =?utf-8?B?eE9mb29ZYmhIZjN4SytjNEVNejFHejFUWGZhNE1hMjRXUXlLRVU5SkE3YTNy?=
 =?utf-8?B?cWhxZnc1NjQrejlyK1h3ci9wVVFFSTJML2NNRVdOTUxlU0hoTGI3MW9xSmgv?=
 =?utf-8?B?UXdiRGUyUlZtMDdJWGRZQ01yeitXOWRkZmRPWUdVaDluVGpmYlp6eG5DdW45?=
 =?utf-8?B?akgwVlBqMzdGMFU5MXhSMFdRY2xIMis3MzFFd1VSNXdibEpYTWFxaGhCajlR?=
 =?utf-8?B?TlJPcENhcmJIM2lpSkZrMWdGWWlKWTI5QUNUeDY4c3JILzNuekFreVFoZTBp?=
 =?utf-8?B?YUx1bDlmUXJDRnlGMUtVR1dEbmp0YThqTCtrVUdrSWk3WmI3bVdFMTFVOVVj?=
 =?utf-8?B?Z0NtWUdkdzN4SWdqOVFtdkhQSG1rOCtyRTJQT3JkbS9TeWdBTVVFVzJnZnJs?=
 =?utf-8?B?Rzg5eit1WjcrTTY0M0lhWVdhMURPcGIvc0k4RUx5cGx2cmc2NUpSdHorTUVK?=
 =?utf-8?B?d05COW9IRE4rMmVvc0wvSjZGdHFxR3NXaTVMaXF5NmF4TDJuUWIyUWU5NEZp?=
 =?utf-8?B?UnltekxWbmlEYXpWYU4xcExRd0VWbjd2TXowZnBSTXB5STR1NnFBUHpUMFA4?=
 =?utf-8?B?MU9IR3RUOTNOdmRMNkh2Y05NZnp1MVlxUVdaWVRXYko4bTRQOWs4VzBSK3NC?=
 =?utf-8?B?SnpGRFROTDJNVGVhcHlJbkM3QUJ1T2JNNFNJK1hXZXgrYnlCdU5yUUhzRkZ5?=
 =?utf-8?B?ejBMQTFmRjlRUTBkeU8xT2ZlQ0JVWmRYWGFNYjArNVFaMXNZTXlneGcwMzYw?=
 =?utf-8?B?OThhNmdWMkdVdXREbGJESmpWNHZUeGJsRmQ5c0x3bnV6SWZxRm1OMGZIZW9T?=
 =?utf-8?B?VTdqcW1xcnBGQjhuMnlRSitBK0xOOSt5ZkZORUN5UitEdCtLY0k0L0lwbGV0?=
 =?utf-8?B?N3Vpdyt1ZUluUzhrZ05yN05IczAwZjhJT0ZzdGppSm9VWmMyR0JDZXcyYjdm?=
 =?utf-8?B?WGNHOEhudkFYb0NQRWt2QjNHS2FBS3lpaDFqODlEYzRJSk5qaWE1UzlITGZi?=
 =?utf-8?B?UWZIR1UyOGtYRXhxTGoxUWVzdDQzOElRTzVWUFFCTlRqOEdTbnB0cXYyVzcy?=
 =?utf-8?B?dU9HSjdBNWdJMmxoT3dqU0RwNUZoeVorTTV6bXZKdnY4N2RiTkN2TUxyWUcx?=
 =?utf-8?B?T1BDclB6ZDV3T3YxWDErRjhtd1R6ZEJaT2dtQ29tOEQxSEdtTERpV0JkSWRL?=
 =?utf-8?B?SjV3dG1JVzlkeWJKdG91elhibHNuRVNpdnVZcDErMFNENXBLNEZ0VzU5NjU5?=
 =?utf-8?B?OHBIUUhvZE5XYTRuRlBlRlU5V2owTk11dkhzZStCUjZLbC9ybTZublBZZkQ3?=
 =?utf-8?B?L2dnTldVSk1EVWEwcmd5ZndOdkFib2pEYnV1QXRoVFRPTklSa25qTkpCamY4?=
 =?utf-8?B?dFk0UjZQTWJpcExBVG1FcE1ibnVXUkVwRDdjU3F1TWxXaGNiUFpiSHFNaWYz?=
 =?utf-8?B?SEVYa3BMbXNkSUZVcDhGWFdya3cxSnR5TkcvSlRVN0ZXYUlEcmkyVE1vRlRx?=
 =?utf-8?B?V3gyckpadm5lRjloUUtqYWozdDlveVAzS3BwckFxdGtzUWtHcG42M3JIK3Fo?=
 =?utf-8?B?VzZ4emEyMW5FOUpheVBQK2NLSmRpYnBvQkZ1L2oyMWdLMHE0Y01LRkR6dFBC?=
 =?utf-8?B?NSszN3YyWG5TM2U3eTg0WnU4S1NTa2NzeGVZaHpIRXh4ZU1BOC9kSm1PN0tE?=
 =?utf-8?B?WDFFVjZkakZ4ZTB3V3ZJQTVZejRDYk9NWWJRS3B2RXRwdGtFTHhUYnR6QnVG?=
 =?utf-8?Q?5FIsMTA0k5pcGlm1p3MbOLazq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c809948-8644-49d6-a2ca-08dd88fa76a9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 21:52:27.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZAq15cxbl60Ys+943ua698OaBEc81lFE68hnSUi0025O9gVFb55YMiLfH1MB/QPPB7dPOgCC/7eys9e+h5I2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6107
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



On 5/1/2025 5:02 PM, Alexandre Courbot wrote:
> On Fri May 2, 2025 at 12:19 AM JST, Timur Tabi wrote:
>> On Thu, 2025-05-01 at 21:58 +0900, Alexandre Courbot wrote:
>>
>>
>>> +impl UsizeAlign for usize {
>>> +    fn align_up(mut self, align: usize) -> usize {
>>> +        self = (self + align - 1) & !(align - 1);
>>> +        self
>>> +    }
>>> +}
>>> +
>>> +/// Aligns `val` upwards to the nearest multiple of `align`.
>>> +pub const fn usize_align_up(val: usize, align: usize) -> usize {
>>> +    (val + align - 1) & !(align - 1)
>>> +}
>>
>> Why not have usize_align_up() just return "val.align_up(align)"?
>>
>> But why why two versions at all?  Is there any context where you could use one
>> and not the other?
> 
> The second version can be used in const context to create values at
> compile-time, something the first one cannot do. If we want to factorize
> things out we can probably make the first version call the second one
> though.

True. By the way, Timur suggested me to factor it out in a chat so I already did
that in my tree. thanks,

 - Joel

