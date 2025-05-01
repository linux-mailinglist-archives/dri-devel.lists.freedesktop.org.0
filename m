Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AE8AA60A6
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 17:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F3810E86A;
	Thu,  1 May 2025 15:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ha1tDnsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1090710E86A;
 Thu,  1 May 2025 15:22:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOk/7Ol1SQqSwmROiIio9lH7c4cB8KcAiCTNGYIFd8pRBPbqTQ+RCaUwgb7T8T2hYXcUSbdu7LsuZgYzmWEiy3m15r0EMQGKJnqT5iFDVIXCg1AxKCnuH/qImQnBfTpT9zaJ6AqHEIKk32/FP/xahUOhlFIc1YkIh34BC8dWIrFOruVnsDljbSzNvS7U+ySkF+q9k4Q2350KX2DwZ8GLHTAzY+p+haEMFgEAsw9HVHItgiR1+E37tZhdLC+3u8th1f66mNGsppfKMPpcKhrEoX0Do2Pk5S8pagjhCbBMpo3ciZTX6qm2V6tI1IQWLKZjASXSuS+NuRfirgddwonYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cz9coE0IB2CD0l6y1qH8bH7lMJ5BVGJOvFLxdZSf8CI=;
 b=h07JO5OtAh9rBi+OVlhNxYVns7Oq7V1Oax3e3+ufv0YnPMz8TIOuFC1qoYMIqoaYQBm7J0y9ZSnkQc2DwVwdkN/X6apt2Vpclcdexi3Ns0KS+W4afOn3WFB0N+Q2ZLZEVV7p/W65f8yW8i+RFAX8dYwsjk477131Zh1pnl4KQN7u166wQ4J4r+umaHuF6LFx5yhk8WRju33FOcY/sIGvvn367bZw0uGa8zIkRMRWImwY7PpOJmQgNp6fYoKla7+4I3/jpGiVMUCrgoeKFqAhRJ0J8Qhd2letv1aW1wka450NO4FD9J35qKH/tbAPCqZji2Yfx+BSGInhWp4RmbZwcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cz9coE0IB2CD0l6y1qH8bH7lMJ5BVGJOvFLxdZSf8CI=;
 b=ha1tDnsElVuaXWeEFd/JQyJRByQVncwgruqld6UGFfGccgI9XiPmAHMVD78opnO1UiL3EVQf/xn9GuI9eSBAqpj1CJEEHWkFv3e+Z0FuKidfGGLuPXEiW0xAdRgcSmdnciMEi2GnkCSuOgRxonQva9KQ5g21ntsFS1kq09SC+7FQ3OYz+z6NnG80l7knGvplG2MiMy8AJVMsu1MvEOjJYmoUDVOMzlCpvEGT0AHHLr+GRhntPplGMlVMDvQVm/aI/ZrbUVlsJK2sqKy4bHo8nFTWfJETaYW0jeFW6Lm3YWHtWMeTd4LMFazP94jtFV4rbMrosQni11ZeMLPPgqyAhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 15:22:28 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Thu, 1 May 2025
 15:22:28 +0000
Message-ID: <7481f03b-3fb0-499e-b200-b3366334adc2@nvidia.com>
Date: Thu, 1 May 2025 11:22:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
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
 Alexandre Courbot <acourbot@nvidia.com>, "gary@garyguo.net"
 <gary@garyguo.net>
Cc: Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <eaf5b0cf138c32135781977a7774bfd4572286b5.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0058.namprd08.prod.outlook.com
 (2603:10b6:a03:117::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: a671aaba-101f-490a-f4dd-08dd88c3fb9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmtpNkY1T2lSbWRNK0N5Z0ZJdTJwT0VMZFcwRUZvQU5ybWJSN0VlNkRHdktT?=
 =?utf-8?B?dlNmOWxIcjcxeXJpenZiWDBqUy9QTGhDVzNhMnkxSEhNS0h1b3NxOENEbE1T?=
 =?utf-8?B?bHNjSnp3eWp1bWxjSDdlVVBYSjFnYnZWQ1dsbSsxTjQvN095aXZQWElka1ZK?=
 =?utf-8?B?ZXBmS0l1UU42bjl6MnZvdzUrMjRzY2dKM2FEQXhwK0xWQVJUM1hacHlFd1FX?=
 =?utf-8?B?cWNFbFJsKy9lVEdJSWd2WEwvUnVpK0p0eEFwVEN4YUVLSGt2N29MMkcvWWdr?=
 =?utf-8?B?Ly9Ed3FYZHdrMWNRZHN4VDNXRkw3V01zWTZHWmdndDFhbTBjaVFyWisyUmE2?=
 =?utf-8?B?ck0wTGlVZjB6WVNNNlhtSnVxazQ0SjFncVd2cWt4bEFWcnc3bWM0WUNiTHdF?=
 =?utf-8?B?Tjd1Vk00S29CMHZaVERhREw5QWd0SEg3SCtiZll5cU9EdUF4dW5LSmQ3V1gx?=
 =?utf-8?B?M3pGVVBnUGtHYzhTd2ZVQnNZQ0ZDU1pUSDM2bmREWEI3OHFiUWZSY3R0d0NH?=
 =?utf-8?B?VzJPWFVkTmNDQmF6VE1mWmFRSk1kcVBIV0Z3bE9pc0pSTCtnZENSTXJIU3Rm?=
 =?utf-8?B?STY2WHhqMS8wb0Q2TGtmVTBLMjRKRmVIZGE3TXN6R3hFYXdVZ28zb005NUJT?=
 =?utf-8?B?SDFhMFVBQndCRWZHSXErOFFiUzhEY20zd0Q3ME1EUUo1NmdlM2RCeitCOFp3?=
 =?utf-8?B?cHJSU1ZjazNrek9KRzZHWldPVHBNSWN5TkUzSElYKytPQnBDeGNSdmJiam10?=
 =?utf-8?B?Vnhzd0c4cnp6RmFnbStTR2ZCRVlFa2pFbXlkV3I5bXZRNjRnbGVFQ25jLy9j?=
 =?utf-8?B?SkswOUQ3Y0dQTjRCNkZMVTdNL1FUYXhwVzZuUlRCMVh3ZC9wK1V2U1Z2VldP?=
 =?utf-8?B?OWtnT3g1UE9DK2JCWnlnc2dkVGJuMHBwTTRDc0UwVy9SR0JFL056eGxsQ0R6?=
 =?utf-8?B?ZVRPSkNHM0NqcjRhRVVPNHR1NzBZYktxYlNkbzFCS1VxZWVTbjh3SmRKSEFV?=
 =?utf-8?B?a0pxQ3A5UHFkaEdiaUcyT0gxZEUwM0hGdi9vNEw2K1g1c29QZ2U1Q0JkVzZP?=
 =?utf-8?B?Z0hGUlB3WW9lRHlYbGdYREJEVjZTWWpnZTYzbVcweGFmelhkK0Vzd0c2RVBa?=
 =?utf-8?B?aGExdlc1czdiTVd5S25FT0laeXBHbFg4TDZHY3pmQWtGOFpDdnR6YXdyWjFP?=
 =?utf-8?B?RERZN2ZraTdURlprNEVKdmFUc2hmT1NVWU9TeUhHM0RwUm80aldXMXZSTlk1?=
 =?utf-8?B?aUNWclhuZkVLRVdIRDduY00rajJlVDZZTnlSM2lkRzlDcWhUZDhPQVFzN0to?=
 =?utf-8?B?U3ZZQXJmd2VlSWpoT253MElmL0xFQjRCNzVmQ1Vhb3RlVitkSTZGTDdOZWlr?=
 =?utf-8?B?N01NNjE4M2RZMlB3VnZETzZOamt5NDlVbG5IdVpoSkhTMDVlWStCK29kZlJH?=
 =?utf-8?B?eU1EL0s0UnRIaDNadHhrZmpQd1I1TnNUYzg1a1Z2MWpHN1g0bFFkUWkvYmdo?=
 =?utf-8?B?aGRnT0k5Z1JoQk15R3dpdHA3N3VBbnMwd3B1QmM4enA5RC9zdXhwTnlEMTlW?=
 =?utf-8?B?VEhPM3RRaTRYVUM0b0ZhdzFNQXl6eGUwcElENXhOVkNaVi9oT2RVNmVZbExk?=
 =?utf-8?B?WEJmcVl1aGdWSS8vc1FVL3kvVks0OHNvdXVWZHVQUmdUNGRxMWhwb2xQcnNG?=
 =?utf-8?B?RVBPUGkvcGhhWTQyeHh6T2NCWWZ5WTBpZDVERUc3cWkyZUZMQU91OVJGOW9V?=
 =?utf-8?B?MTV0VlZwcHYxZjFwVG5WT2dHb1BaRDZEcmRpU2Y4Yi9pS0FuN041TG92OEdZ?=
 =?utf-8?B?YlJNNUU1SFRjalpDTnh1YmRybW4zZCtYYm1vcVA5SVNXMStnV3pWMHBlWm5O?=
 =?utf-8?B?WDlvTzZKZnVXQVA0UHAwNEFTU0J6T0NYWVY5MFp6TVQ1UmRqbkZHbExXUkgw?=
 =?utf-8?B?ajRaWFlscnI1RTVTdDlRK21uckNJajhEYU5sWmtPY0l6Ky81YUdDT1VwMVgy?=
 =?utf-8?B?U1RGUWV5OXdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N29JM3I0cnVkODl5aDY4cFBNOGpNMVZ5Q0VUN004L0Y5RThpd3B0bzVKV3lO?=
 =?utf-8?B?VjUzaS9ScDdmUHB1cDdGZnhEQytFaXNTUUhUK09MclZYVFN2dG0yWHQ4UU1m?=
 =?utf-8?B?MGdaRWRhalhyRWxVM0tYVDhxS1laWVBSODJacnBwY3d3U2hBcXlkZTI3WWZk?=
 =?utf-8?B?RnI0RXNmOTVkV1RGd2pENFB5K0lzWnNtOXVxRE03bkE4SHFJbFJnamFpN3Yx?=
 =?utf-8?B?eEhkaDFxL1dvcFRjZFlkdWhRRWRUbXdJMkNod3BCdDVvQUdZU0grdXFFMmRP?=
 =?utf-8?B?cTE4THVDTjBnNkJUVEh4dXpaUU8yZGVaYkJtdVVQbWpDait4U2FITTNpcTNQ?=
 =?utf-8?B?a0JlbFowNzd0M1NjNGNKTEliVFdBYVo0aElQaGoxQWZGcUpFVVpma2xCakxh?=
 =?utf-8?B?aENnZHV3R2RZTnhMMnJGZXBGUXJjdWdmUHpqMlg5eTg0M3dCbUExNVBhRlB6?=
 =?utf-8?B?V3FBM0s0bU9aOUZ6YThQZk05WHhEakdLOVdsZ29xOTdkNmx2ZmN0RFRGR1pR?=
 =?utf-8?B?dVBiQnFNNUxEN2NKY1I5RDkybXVsSjNkZ0kyTU5YUS82VEVkVGZmSHZMNXNK?=
 =?utf-8?B?ME5ZSXRkcVBsaHNRZEtwcXNYVHZ3cU5kaDV3dXpEcEdCYzE3emhHUVU2dmNh?=
 =?utf-8?B?S0VxeTVJaE1neVlHVHRXYnk0eU9FUVlnUkxJMnNFeU9ORThmOVZIOWpSaGs5?=
 =?utf-8?B?TFRHQWZZSlV1NnloWUFxYzJyWDBDYno2dWl0cnprZjlKaWRUaVFLWGpPMm5t?=
 =?utf-8?B?NUJBVWltSkxwcjBYaktORFJ5RUdCakJzazF2K2VMTzgyZjJqYnFZRFBYNXpV?=
 =?utf-8?B?YTE3cW0yT0ltQ3kvR2JWb0VLbmVCa0FESkJxUW03ak84NnExUno5VWxCTWw0?=
 =?utf-8?B?c001VCtxUS8yTjJBK2p5RnhBR3RkUWZpRFlkekFhdi9DbDlBZ0RpRmRiQWRH?=
 =?utf-8?B?NmxmVlFNS3VsViszMXFydi9KOTlPbGkyajB0RTdoSi9sMDg4aVF5bDU4OE1K?=
 =?utf-8?B?R0RFV2dPQ2tqdTAreE1TWFo3UWpaZE1XdFhicm1keVZhWnhOOG9SdisxNWl6?=
 =?utf-8?B?RStLZTl2SmFUek5TNGhOaVJadGhaWG9udFhYNU53SXZOb1hGNk5JTFZtUzhx?=
 =?utf-8?B?Z1ltZWNXc1hzbURxTmxvK2VRR2tMVWJmSDgxVGJiQ2JkMzZUZFpFMk9mVjI1?=
 =?utf-8?B?SUZQWStTNGc4KzIxM3ZXTEFXUkN1YmxIMEJOeHhoOUpCTWpabjhaVFY3cmdk?=
 =?utf-8?B?amNHMGd1enNWQWNSWWxuYnQvaVlPYjJWYWwzd2YrM1RBTTZmQmlmdytnUzBo?=
 =?utf-8?B?bUQrS2daTHdOcTFpbDZQeUJmck9aK01BZUxud2R6OFd2N2xHTjFLMmlCQ3F3?=
 =?utf-8?B?REZaSXN6VVJ2UGpEOW9jcXVFakVveEs1YTVVN21CWnRMcExXZDRMVHg4dVZK?=
 =?utf-8?B?THBpeS9YN1NiSTBOdlFVM0ZiVjlGaTlRN0h3bm90Nzk2NUxheE1VaHNlRnQ2?=
 =?utf-8?B?dzVOb3NQVTJ1S3Y1OFl5UmhhSVZkbjhIS0hsQlRYN0ZmTDFnZy8vdTdqaVdz?=
 =?utf-8?B?TUxQVjhQNTlicDA5M0NiM0puakUrczBWTnlleHYyUW44SUJVWkRyNXR0Zyt4?=
 =?utf-8?B?aG9jYm8yc29zTnk0YmlHeDJQKy9LdFRkeXRIQjRKZUZvdDdITU41T01EclM1?=
 =?utf-8?B?SVJkOWViZG9mcHV6b1RRd21kNjRFNEtPM0VyS2xKaWw5MFBpdlhYTFg4Q0M0?=
 =?utf-8?B?MEdFZnVTMHU5Q2p5QXYyc0tiS1JQOEUxazgrRWtVaVF4Qkovd0NHZ25yNW1Z?=
 =?utf-8?B?VW0yQ1RRanpreHBsL0JOYStRT2dwQTNWdmkvTnc5Q2d3eGZuQUc3WURmKzF0?=
 =?utf-8?B?OXhaV3djTVhLbENaOE9zRndtb1R3OENFWThSTVRTNDV5UllqUENCZnppcFpm?=
 =?utf-8?B?elAvRFRydCtwUHcxSXBVc0RKSDc2YmorZGhmWTVKbWcwcWZ0ZDdDRDUrRDlO?=
 =?utf-8?B?SGozdXpTdko5NHN6V0R2S25rWmd1TEpIQ2V6UTRsZFNuQzh5K1dhVnZnMHNO?=
 =?utf-8?B?cXhhUmxrTG9JcWN4Y3AzUVgvc3Y1L1loYlFGVGNvNjBlTGJCU1JReDJqVFR4?=
 =?utf-8?B?dUtqRTdmc1Q5dWdLbTVWbWgwTUhpSUl0OEVpaUQvdEc5Z3RuVXR4RTVHNWRr?=
 =?utf-8?B?UHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a671aaba-101f-490a-f4dd-08dd88c3fb9f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:22:28.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0xp960mPwzL1hYd32oiKYrDK/6og+aeyke2XzXTKqM/RE0i0Pg++au4NNcRrlUZu8eBchQ4Or6ITepIt9wcfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998
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



On 5/1/2025 11:19 AM, Timur Tabi wrote:
> On Thu, 2025-05-01 at 21:58 +0900, Alexandre Courbot wrote:
> 
> 
>> +impl UsizeAlign for usize {
>> +    fn align_up(mut self, align: usize) -> usize {
>> +        self = (self + align - 1) & !(align - 1);
>> +        self
>> +    }
>> +}
>> +
>> +/// Aligns `val` upwards to the nearest multiple of `align`.
>> +pub const fn usize_align_up(val: usize, align: usize) -> usize {
>> +    (val + align - 1) & !(align - 1)
>> +}
> 
> Why not have usize_align_up() just return "val.align_up(align)"?
> 
> But why why two versions at all?  Is there any context where you could use one
> and not the other?
> 
I can't remember now but when I tried that, I got compiler errors (because val
is immutable?).

Also not mutating it like that matches the pattern in the rest of this file so
I'd leave it as-is.

Thanks.

