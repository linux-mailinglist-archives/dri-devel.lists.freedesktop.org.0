Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C5AA5ECF
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17DC10E846;
	Thu,  1 May 2025 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUMQVR72";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5110E848;
 Thu,  1 May 2025 12:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdzqvX+e1rOTrFC1EF00uqzNsliu5SivWbD7/jTB/KuHckE329iWf80rrPORRMJrN5YyeQClgV7iXr4mt2JtqF7k6S3FQczkf+JhaoWAZpc+2qNdgDU9Gd/MkBpknesHOoJjbvYf6GZ9Qg7ZOMSXfZo5OwE0E6UBncgYFXj/05ZuRrDuoyU4L6ghVIJim34sM9DPSP9QO0T808p22F6+qP9U0Tlfv8afRe96VCPQRGLSbiEQKbzyDE6N0NRpZ3ME44Mrox1pbTbbMHUXWuL8oe7AgkZBT14+YmyYotdNZnbcd/ue5NzdQ38Rnafium8vXwN4SyELZRUS39J2HkjTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1jzw++mA8dvfGbWMjnE3Rb19R7lqIUDNU/5xH47DxPc=;
 b=W4oaR3E0TCGN+i90hBJEe99qLDhedVyPH5vrbDIofAIcpIYjqod5oHFDw8gs4/XYirbuXJU+YpA/4+C3FfxmkYoA4c4vJIoqr8N2uT0PuWul6oLKhqgtKlfchIeB+q1RX14ncg/DiDGYjFQzxQY8DZA+Sv/neqX/Z4KSWeJDaHVIRw9njY5KJyQYoL/GgqRqGFb4LXpaGzkebkJoenJcBn/0bcb3SWA+6md1cLnrMVlUZ3ch3Vef4lLknR5nhWQKn7/6P+J2FKVYFahvzLcNZhymCNYCuhqDuVZA0prN06UADhgBMPMknQG0Hsx1+4HUe0KAV56p3Kzb3ssD1vwrpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1jzw++mA8dvfGbWMjnE3Rb19R7lqIUDNU/5xH47DxPc=;
 b=rUMQVR727+p+I4eLtJcsQTtNUgxX4dcuv7F2AALSYICI1ThA73dw3Fi01KvWPwsUmIoM/x0VAUpdbuVmw81mIWubn57Ef0WqaASeyCAs8MCuHDMt0CS/ifTy6kZP3rpZEm0/AyIvD4BAKfU/FcZvXJ/XypREvsu4Y0W5FfxRd2A4lrmqXX19Zxz0ckGMWmLsJbfPJgWwHQ9eVmaZZz1da2DEGZ4TEsI7PrqdzoGJg3Zd8hlDnXtWsV6WytvqYHC+vHgzLO88RQO6ab8imxk7nvAIrYy4QwSkqr+30Ujr9vgEd1Bpuf/jLH0SQEdIVKEwIw9R9S6bp/7C2kSEr5f/rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB5919.namprd12.prod.outlook.com (2603:10b6:408:173::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Thu, 1 May
 2025 12:59:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:38 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:33 +0900
Subject: [PATCH v2 15/21] gpu: nova-core: add falcon register definitions
 and base code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-15-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bfb0c32-3b8a-43da-8775-08dd88b0079d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3cwN3o0WW1lNmJQQkdCYnFXbFB5bXdZNnJMYmpSMWRTTUZBa3FGdDBDY2NZ?=
 =?utf-8?B?bko3RGZmTTg4UWxKZEdTZUNwN1ZwaEN6Q2FPUExsc2syUzRybEdtSmZRZGk0?=
 =?utf-8?B?VTNzU0J0OTlCaGtnMDg5OFJSRW1scjBJeFBlTDZ0ajBvcFhBa0x1cXhQdXEw?=
 =?utf-8?B?QUlFVEUxdXhXdUY3VERBMk1xNUlPMnBZb0lGalA2Zys3cm9EeDUwTTVDdWtP?=
 =?utf-8?B?LzdvenFwMmNEcWpZSTczZFE5MmhyT3BFWTAxZndpc2liZFUrUEJHUEpiVFNF?=
 =?utf-8?B?QVZXMFlveE5abnc1OXIxUzNYcTZhdWxqdEpXbVR3eU9HT1U4ZE1CdzJkaFlB?=
 =?utf-8?B?NHB5ZXo3WURXdDV0bVp4SWpnWDhyVUVrUVd1cmorWWJZQkowendQRHU3WUJs?=
 =?utf-8?B?N1ZlaUFyWmJKSmtzWnRJWk1rVzlOZExJb3hscmpaQmFwZXdNeGcwc0ZHTXk4?=
 =?utf-8?B?RXNSMkNQZUxMeEtHYWNjZldnYmdkTklaK2dnSWVNaHdoT0FhNlB2R1d6VVh0?=
 =?utf-8?B?c05LdGJLdWtzait0NzJpUUg5TE55Ulk3cXZKemNGVkNXd3owS0o2RnFUZitR?=
 =?utf-8?B?MXZYZTU0VnlUQytVOTk0ZGR6cFR3VmhFWUpUMkFJVW1GWDA3c3kxaDVJOGxk?=
 =?utf-8?B?TzhvQzNra2ZvYjI1M25Mek5iZ0RTLzVndFdZTHZxa2l4SFZ6YWR0UkEvNWNS?=
 =?utf-8?B?TzROL0JFSFQveGZnOTE2YkZNTHUvcnpkMjhOSmdpOXpNNVFsdy8rRHBkTCtG?=
 =?utf-8?B?MnFGbmkvUU9IRTBSTGJ5dE1jcVZkcjNGdk5hQjdHb0ZmZnp3ZUJYMWdJVUxu?=
 =?utf-8?B?aXp1eHZNaUJ1SlhBd1V6TERFT3dmZ1huOEtubmRJckJxeFM2NjBxcjhydDNu?=
 =?utf-8?B?NXBUeTM3UEtmeklmOEFwTjB3cVVTekRaTldJdEZYekVZaGwrSFppL2VXSEpP?=
 =?utf-8?B?YkREbGVueXM5cFpDV2wrUS9tVDNtQVlWMDd6OC9RQ0xEWXpFQ3ROcVd3V2tl?=
 =?utf-8?B?OXVXSXhKcStjQ0dBL1FhSmdTNmdFQTVXajZjZnREcFVMUnpFR3FqUWQ3VU03?=
 =?utf-8?B?dEZZT0NnVXBYUmhNK290NENrOEorUjJrOHJxcFJMeVdtV2tIalR3aTlLblZh?=
 =?utf-8?B?eEIwUlJBK0ZOZlVmK1hYZ29tUHpKTGtDKzdZSE05UEtPUVhJZ25zK1VUeTVZ?=
 =?utf-8?B?V2J0U1pkckgreUZ5ZmU2dzlxRlNRK3V3VU14NjNJd280eVhNeFM0Qm1ITlpS?=
 =?utf-8?B?cXNjYVRWTVpWN04weVpCUUNNQXdGUkJSZ1k5UTRpRmhaeW9CTnJFZlRIMkdn?=
 =?utf-8?B?dlVyTlBtaXhSR0h2SU1wZWVqQ3FWWlY4NW9VMDg1L3VWaER1RXA0NS82Snd4?=
 =?utf-8?B?TG5QUDVMd3hXUnYvM3hxOXcrL0hhcnlYY0VzQU84UzlKTWR0L2k3VCtGeGo1?=
 =?utf-8?B?SUtPTjFQLytUbVNvWTdUUWwxYjRXSyt1cXU5VjhXTWJoWjlSYzU5WEJ6SUVN?=
 =?utf-8?B?Sm95dTNtTVo3YXZvL1ZhcmJvSENlWjVST21WUEtra0wwTGJmd2M5YWZ4VEht?=
 =?utf-8?B?U3J2bTMyakwrS3UyOU9pek4yUi9BUmhPckhnOWJqVTF4ZHhwWU9waGprK1Va?=
 =?utf-8?B?N01BbTJOZGpleDZyKzJONDNyZG1YVFQ5OGdEdTZ1S3NQUHV2VWFUeG1FVTl2?=
 =?utf-8?B?ZGR3SkpWbXpweFJIOUJmNnh4ZDdrVXlIeFFSbTZzdWtFS0RZcUNDZENWOTQ1?=
 =?utf-8?B?Qy9UeStBKytPOU5vdzZUYVJvR3VVMHFmMVlsKytZbUNHUGtYZEVBRC9rNEpo?=
 =?utf-8?B?YUhuNzc2QnByVGFsOWdIT1lFVTJlMmlZSVlqbVNnOWprUCtXU0xlSUk0Y3Ex?=
 =?utf-8?B?ekdQazNCd1doVTVoOGdtT0d5VzZMZnNOOTlCRUpJcTdTWXF3M1htb2U5V0lW?=
 =?utf-8?B?ZmNrV3dWcHlhWUZSZm5EYWZxR3JMcU4zc2dnUHNhaHZwWDAxejQ5cmZHZTgv?=
 =?utf-8?B?UG0wVmNyWlZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0FaYnZEZVVOODN1N0c4THBHWSt5dWVrY1d6TlVwRnhoalc3TlhlWno2alpk?=
 =?utf-8?B?NTJiSk1LTWpWNGRYYmd6VDZPLytieTloY2RDcG8yNmZmdjI2VmhLVmIwaWd5?=
 =?utf-8?B?OCtOandNd3IzSjdQNkhCWXVRNE44NlkxRE9Pa1J4WXp4NXJOZG5UeG51Z2p5?=
 =?utf-8?B?TGFZUWxiWW1PZ3dIOXNPNVZIaE92VkxQa1VHdUprN0RrWnRZU1A4aHBTdVht?=
 =?utf-8?B?cm1pRzN6TzU3U3A1V2NSMjJBQ0xIdDFuSkQ4SHZpL0toTlhCbDhseVF4bkNn?=
 =?utf-8?B?eVNPS3c2RVYwL0VqZHlMWmtIa2g3b2xGU2J6bkw1R08wYWFXSzYwK2toajg3?=
 =?utf-8?B?ZFljT0ZsaUU5c25ramVCOEpXblVwTmtaRFk4SEk5V0ExRU42RHhlSUhLazcx?=
 =?utf-8?B?THR1b1dYRFRad2xIakUyanFWa1NoQ2h1akdGY2k3QTBzdnBNVGp2bFlrNGtt?=
 =?utf-8?B?Wm9RNUl0VGcvcC95SjBwL2dwT3dMTEpodXJ4ZUJpZFhNeUNIczV3Q3BlVTl6?=
 =?utf-8?B?Yi92MEdVbzZ3WmVEb0xnMVdSTzdOaTRHc3JxNVV3RkNucVBlZWRXcHhNVWRx?=
 =?utf-8?B?WmJ5Lys5T1JLaWNMWXdDN0hzWEI4c05SRVdCS09XdlVtVTd2NkdwZVhvRTF4?=
 =?utf-8?B?VGFvU2h0cGFMUUpNdXM3NWtGZlFpQTZ5QnI0Q3libjFyMzdSNnFVL1ZCcURi?=
 =?utf-8?B?WS81cEQ1OVZkWGc5Sy9kQ1RubkxDYnU0SHhhRk1jWEtnR1FPVE9mZDk4TEhk?=
 =?utf-8?B?ZDRWa1FKYTR4TTVlY2k0SjhqZ09lSjB5ME92YmlyZzFwYm9qYWxYdGMxNXJP?=
 =?utf-8?B?SkJ4K1hZaFh3bTJEaTVTUzNwQm80TWxQUmhMVDlNemlGbWhxanU0aG5ybWxh?=
 =?utf-8?B?UTduK242aVBudGpkTmtFTEoxMFRkMll3TFJXbWZrYU04bjRvckh5OFRNNlcz?=
 =?utf-8?B?VVNKVVE4cyt4ZDd2bkNvYWdFU214TTdMTTQvQm41TUFaVlVhQ0VqZXBhU1kz?=
 =?utf-8?B?NTV2UGJ4cEErOXhZYVo4eEtFckFKUzZkckVqTDgxSG9ycWtGQ3hKbVZiNHh0?=
 =?utf-8?B?b3dvOXl5TVUvc2M1TGc1Rk9HSWptSEdGQWRaSWo2R2ZwQXZOL0FiMytUWGNs?=
 =?utf-8?B?U2FuWFZPUjU2cjI5bjdwQmMreUptTGRJaUx0YzVOajBqaTdabGxxUXRUb1BN?=
 =?utf-8?B?WWFkRFZQVEJSaitTTUtveEs1NWFTUFJWNGVaYTNZdUNjd0R1ZVM4KzNmdkY3?=
 =?utf-8?B?b0kyRVhrY3VFcXYxM0JxMXJYOWZlZ3JYWDdnY1JtcVJ3QytHdFVTR0xxVlZm?=
 =?utf-8?B?bnRhSGkyeFFjZGdtYVY1OWZjYVdKV3RWVld1bndJbHZZelRwRHh6TDhyeGwz?=
 =?utf-8?B?U1hVa3VDaXFwR2VoYUhlSFQ1QldvdmZuMEVXSkZIZDVwbTJEdndZZVM0Tnpp?=
 =?utf-8?B?T1k0TTQxUDR3cTBmRXNWU3hxSVgvZVBvMEx0MHpuMmxwUE05cVJCbUIyeEpl?=
 =?utf-8?B?YXZ2bTF2QXpaNzdEeWZyaDRxSFdoaEhiVkYrY3JGR1BGbDI1Tlo0K1BvT3lP?=
 =?utf-8?B?eGU5RHRtK2N4OWk4N0M2NHVnMHh0WmxHNFVkNHNsSFBrYVNNRm8rUVZCU001?=
 =?utf-8?B?RjZlSFlhRHFsS2V5MnBKRHVaT0ltVU5PY1UxelplM2JOQVM0S2pyRnlFSFdw?=
 =?utf-8?B?QktCNU1kVFBETkp2RU9vTy8vNXowYkd5d2tVN1phVFd1dnhLRDladStTeGM1?=
 =?utf-8?B?YXZUWFpvNzl3UndYMHMwRm5QQmlrSzUwTXZQV2Nia3lGbmcvcnNMQmZ4QThj?=
 =?utf-8?B?NlUrSm1MelNReFozVzY1SHp1Sll5bE9GVzVMOEJxc2dIYTNtclZVQnhyQU1i?=
 =?utf-8?B?MzdwYzZvUEJDdlFvUmVZbUNLYXBZb0RqVXZqN1FqWGR5YUZwbEFzQ0lmWldK?=
 =?utf-8?B?KzIwdm52UjFROGMwZ2NmME1YcHF4UHhjRTd3REJ1VEYrZ2h6WklJd2s1LzhW?=
 =?utf-8?B?UU5BZjVoa2MvTVZPa3dlaDY0TzdwUGo3VVJ0TlZyN2taWG1wNjdPa0dLM0JB?=
 =?utf-8?B?SWVlVEw1Vm5FRmpQYmpQeThKWFFxaHJEYldVZFF6MjUxMUpSTXVveDR2YXZP?=
 =?utf-8?B?N2E0WXBYMHZCY1RuY1g5UGZMeEcyUFNvY3M1aElzUnBrdzhQbEJ5aWtMRENm?=
 =?utf-8?Q?1P189nwcdINGTZDq26Qq0cJpY5oorUO0JpopZo6Ycb8w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfb0c32-3b8a-43da-8775-08dd88b0079d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:38.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nshvA2dBUqSI8FIb2u9FGCEOV1/FGxPCYeRup5XaavZ61TggZIw4x3eamXr2WsZrxiLvc7ZPU8aD1CxPoZSAyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5919
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

Add the common Falcon code and HAL for Ampere GPUs, and instantiate the
GSP and SEC2 Falcons that will be required to boot the GSP.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 546 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/falcon/gsp.rs       |  25 ++
 drivers/gpu/nova-core/falcon/hal.rs       |  55 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 115 +++++++
 drivers/gpu/nova-core/falcon/sec2.rs      |   8 +
 drivers/gpu/nova-core/gpu.rs              |  11 +
 drivers/gpu/nova-core/nova_core.rs        |   1 +
 drivers/gpu/nova-core/regs.rs             | 125 +++++++
 drivers/gpu/nova-core/util.rs             |   1 -
 9 files changed, 886 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7cae45645e548bab5b85cb53880898cedbae778a
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Falcon microprocessor base support
+
+// To be removed when all code is used.
+#![expect(dead_code)]
+
+use core::time::Duration;
+use hal::FalconHal;
+use kernel::bindings;
+use kernel::device;
+use kernel::devres::Devres;
+use kernel::prelude::*;
+use kernel::sync::Arc;
+
+use crate::driver::Bar0;
+use crate::gpu::Chipset;
+use crate::regs;
+use crate::util;
+
+pub(crate) mod gsp;
+mod hal;
+pub(crate) mod sec2;
+
+/// Revision number of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRev {
+    #[default]
+    Rev1 = 1,
+    Rev2 = 2,
+    Rev3 = 3,
+    Rev4 = 4,
+    Rev5 = 5,
+    Rev6 = 6,
+    Rev7 = 7,
+}
+
+impl TryFrom<u8> for FalconCoreRev {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        use FalconCoreRev::*;
+
+        let rev = match value {
+            1 => Rev1,
+            2 => Rev2,
+            3 => Rev3,
+            4 => Rev4,
+            5 => Rev5,
+            6 => Rev6,
+            7 => Rev7,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(rev)
+    }
+}
+
+/// Revision subversion number of a falcon core, used in the
+/// [`crate::regs::NV_PFALCON_FALCON_HWCFG1`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) enum FalconCoreRevSubversion {
+    #[default]
+    Subversion0 = 0,
+    Subversion1 = 1,
+    Subversion2 = 2,
+    Subversion3 = 3,
+}
+
+impl TryFrom<u8> for FalconCoreRevSubversion {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        use FalconCoreRevSubversion::*;
+
+        let sub_version = match value & 0b11 {
+            0 => Subversion0,
+            1 => Subversion1,
+            2 => Subversion2,
+            3 => Subversion3,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sub_version)
+    }
+}
+
+/// Security model of a falcon core, used in the [`crate::regs::NV_PFALCON_FALCON_HWCFG1`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone)]
+pub(crate) enum FalconSecurityModel {
+    /// Non-Secure: runs unsigned code without privileges.
+    #[default]
+    None = 0,
+    /// Low-secure: runs unsigned code with some privileges. Can only be entered from `Heavy` mode.
+    Light = 2,
+    /// High-Secure: runs signed code with full privileges.
+    Heavy = 3,
+}
+
+impl TryFrom<u8> for FalconSecurityModel {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        use FalconSecurityModel::*;
+
+        let sec_model = match value {
+            0 => None,
+            2 => Light,
+            3 => Heavy,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(sec_model)
+    }
+}
+
+/// Signing algorithm for a given firmware, used in the [`crate::regs::NV_PFALCON2_FALCON_MOD_SEL`]
+/// register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum FalconModSelAlgo {
+    /// RSA3K.
+    #[default]
+    Rsa3k = 1,
+}
+
+impl TryFrom<u8> for FalconModSelAlgo {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        match value {
+            1 => Ok(FalconModSelAlgo::Rsa3k),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Valid values for the `size` field of the [`crate::regs::NV_PFALCON_FALCON_DMATRFCMD`] register.
+#[repr(u8)]
+#[derive(Debug, Default, Copy, Clone, PartialEq, Eq)]
+pub(crate) enum DmaTrfCmdSize {
+    /// 256 bytes transfer.
+    #[default]
+    Size256B = 0x6,
+}
+
+impl TryFrom<u8> for DmaTrfCmdSize {
+    type Error = Error;
+
+    fn try_from(value: u8) -> Result<Self> {
+        match value {
+            0x6 => Ok(Self::Size256B),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+/// Currently active core on a dual falcon/riscv (Peregrine) controller.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PeregrineCoreSelect {
+    /// Falcon core is active.
+    Falcon = 0,
+    /// RISC-V core is active.
+    Riscv = 1,
+}
+
+impl From<bool> for PeregrineCoreSelect {
+    fn from(value: bool) -> Self {
+        match value {
+            false => PeregrineCoreSelect::Falcon,
+            true => PeregrineCoreSelect::Riscv,
+        }
+    }
+}
+
+/// Different types of memory present in a falcon core.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum FalconMem {
+    /// Instruction Memory.
+    Imem,
+    /// Data Memory.
+    Dmem,
+}
+
+/// Target/source of a DMA transfer to/from falcon memory.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifTarget {
+    /// VRAM.
+    #[default]
+    LocalFb = 0,
+    /// Coherent system memory.
+    CoherentSysmem = 1,
+    /// Non-coherent system memory.
+    NoncoherentSysmem = 2,
+}
+
+impl TryFrom<u8> for FalconFbifTarget {
+    type Error = Error;
+
+    fn try_from(value: u8) -> core::result::Result<Self, Self::Error> {
+        let res = match value {
+            0 => Self::LocalFb,
+            1 => Self::CoherentSysmem,
+            2 => Self::NoncoherentSysmem,
+            _ => return Err(EINVAL),
+        };
+
+        Ok(res)
+    }
+}
+
+/// Type of memory addresses to use.
+#[derive(Debug, Clone, Default)]
+pub(crate) enum FalconFbifMemType {
+    /// Physical memory addresses.
+    #[default]
+    Virtual = 0,
+    /// Virtual memory addresses.
+    Physical = 1,
+}
+
+impl From<bool> for FalconFbifMemType {
+    fn from(value: bool) -> Self {
+        match value {
+            false => Self::Virtual,
+            true => Self::Physical,
+        }
+    }
+}
+
+/// Trait defining the parameters of a given Falcon instance.
+pub(crate) trait FalconEngine: Sync {
+    /// Base I/O address for the falcon, relative from which its registers are accessed.
+    const BASE: usize;
+}
+
+/// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
+#[derive(Debug)]
+pub(crate) struct FalconLoadTarget {
+    /// Offset from the start of the source object to copy from.
+    pub(crate) src_start: u32,
+    /// Offset from the start of the destination memory to copy into.
+    pub(crate) dst_start: u32,
+    /// Number of bytes to copy.
+    pub(crate) len: u32,
+}
+
+/// Parameters for the falcon boot ROM.
+#[derive(Debug)]
+pub(crate) struct FalconBromParams {
+    /// Offset in `DMEM`` of the firmware's signature.
+    pub(crate) pkc_data_offset: u32,
+    /// Mask of engines valid for this firmware.
+    pub(crate) engine_id_mask: u16,
+    /// ID of the ucode used to infer a fuse register to validate the signature.
+    pub(crate) ucode_id: u8,
+}
+
+/// Trait for a falcon firmware.
+pub(crate) trait FalconFirmware {
+    /// Engine on which this firmware is to be loaded.
+    type Target: FalconEngine;
+
+    /// Returns the DMA handle of the object containing the firmware.
+    fn dma_handle(&self) -> bindings::dma_addr_t;
+
+    /// Returns the load parameters for `IMEM`.
+    fn imem_load(&self) -> FalconLoadTarget;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load(&self) -> FalconLoadTarget;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
+}
+
+/// Contains the base parameters common to all Falcon instances.
+pub(crate) struct Falcon<E: FalconEngine> {
+    hal: Arc<dyn FalconHal<E>>,
+}
+
+impl<E: FalconEngine + 'static> Falcon<E> {
+    /// Create a new falcon instance.
+    ///
+    /// `need_riscv` is set to `true` if the caller expects the falcon to be a dual falcon/riscv
+    /// controller.
+    pub(crate) fn new(
+        dev: &device::Device,
+        chipset: Chipset,
+        bar: &Devres<Bar0>,
+        need_riscv: bool,
+    ) -> Result<Self> {
+        let hwcfg1 = with_bar!(bar, |b| regs::NV_PFALCON_FALCON_HWCFG1::read(b, E::BASE))?;
+        // Ensure that the revision and security model contain valid values.
+        let _rev = hwcfg1.core_rev()?;
+        let _sec_model = hwcfg1.security_model()?;
+
+        if need_riscv {
+            let hwcfg2 = with_bar!(bar, |b| regs::NV_PFALCON_FALCON_HWCFG2::read(b, E::BASE))?;
+            if !hwcfg2.riscv() {
+                dev_err!(
+                    dev,
+                    "riscv support requested on a controller that does not support it\n"
+                );
+                return Err(EINVAL);
+            }
+        }
+
+        Ok(Self {
+            hal: hal::create_falcon_hal(chipset)?,
+        })
+    }
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Devres<Bar0>) -> Result<()> {
+        util::wait_on(Duration::from_millis(20), || {
+            bar.try_access_with(|b| regs::NV_PFALCON_FALCON_HWCFG2::read(b, E::BASE))
+                .and_then(|r| if r.mem_scrubbing() { Some(()) } else { None })
+        })
+    }
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Devres<Bar0>) -> Result<()> {
+        let _ = with_bar!(bar, |b| regs::NV_PFALCON_FALCON_HWCFG2::read(b, E::BASE))?;
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = util::wait_on(Duration::from_micros(150), || {
+            bar.try_access_with(|b| regs::NV_PFALCON_FALCON_HWCFG2::read(b, E::BASE))
+                .and_then(|r| if r.reset_ready() { Some(()) } else { None })
+        });
+
+        with_bar!(bar, |b| regs::NV_PFALCON_FALCON_ENGINE::alter(
+            b,
+            E::BASE,
+            |v| v.set_reset(true)
+        ))?;
+
+        let _: Result<()> = util::wait_on(Duration::from_micros(10), || None);
+
+        with_bar!(bar, |b| regs::NV_PFALCON_FALCON_ENGINE::alter(
+            b,
+            E::BASE,
+            |v| v.set_reset(false)
+        ))?;
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
+
+    /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
+    pub(crate) fn reset(&self, bar: &Devres<Bar0>) -> Result<()> {
+        self.reset_eng(bar)?;
+        self.hal.select_core(bar)?;
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        with_bar!(bar, |b| {
+            regs::NV_PFALCON_FALCON_RM::default()
+                .set_value(regs::NV_PMC_BOOT_0::read(b).into())
+                .write(b, E::BASE)
+        })
+    }
+
+    /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
+    /// `target_mem`.
+    ///
+    /// `sec` is set if the loaded firmware is expected to run in secure mode.
+    fn dma_wr(
+        &self,
+        bar: &Devres<Bar0>,
+        dma_handle: bindings::dma_addr_t,
+        target_mem: FalconMem,
+        load_offsets: FalconLoadTarget,
+        sec: bool,
+    ) -> Result<()> {
+        const DMA_LEN: u32 = 256;
+
+        // For IMEM, we want to use the start offset as a virtual address tag for each page, since
+        // code addresses in the firmware (and the boot vector) are virtual.
+        //
+        // For DMEM we can fold the start offset into the DMA handle.
+        let (src_start, dma_start) = match target_mem {
+            FalconMem::Imem => (load_offsets.src_start, dma_handle),
+            FalconMem::Dmem => (
+                0,
+                dma_handle + load_offsets.src_start as bindings::dma_addr_t,
+            ),
+        };
+        if dma_start % DMA_LEN as bindings::dma_addr_t > 0 {
+            dev_err!(
+                bar.as_ref(),
+                "DMA transfer start addresses must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+        if load_offsets.len % DMA_LEN > 0 {
+            dev_err!(
+                bar.as_ref(),
+                "DMA transfer length must be a multiple of {}",
+                DMA_LEN
+            );
+            return Err(EINVAL);
+        }
+
+        // Set up the base source DMA address.
+        with_bar!(bar, |b| {
+            regs::NV_PFALCON_FALCON_DMATRFBASE::default()
+                .set_base((dma_start >> 8) as u32)
+                .write(b, E::BASE);
+            regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
+                .set_base((dma_start >> 40) as u16)
+                .write(b, E::BASE)
+        })?;
+
+        let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
+            .set_size(DmaTrfCmdSize::Size256B)
+            .set_imem(target_mem == FalconMem::Imem)
+            .set_sec(if sec { 1 } else { 0 });
+
+        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+            // Perform a transfer of size `DMA_LEN`.
+            with_bar!(bar, |b| {
+                regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
+                    .set_offs(load_offsets.dst_start + pos)
+                    .write(b, E::BASE);
+                regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
+                    .set_offs(src_start + pos)
+                    .write(b, E::BASE);
+                cmd.write(b, E::BASE)
+            })?;
+
+            // Wait for the transfer to complete.
+            util::wait_on(Duration::from_millis(2000), || {
+                bar.try_access_with(|b| regs::NV_PFALCON_FALCON_DMATRFCMD::read(b, E::BASE))
+                    .and_then(|v| if v.idle() { Some(()) } else { None })
+            })?;
+        }
+
+        Ok(())
+    }
+
+    /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Devres<Bar0>,
+        fw: &F,
+    ) -> Result<()> {
+        let dma_handle = fw.dma_handle();
+
+        with_bar!(bar, |b| {
+            regs::NV_PFALCON_FBIF_CTL::alter(b, E::BASE, |v| v.set_allow_phys_no_ctx(true));
+            regs::NV_PFALCON_FALCON_DMACTL::default().write(b, E::BASE);
+            regs::NV_PFALCON_FBIF_TRANSCFG::alter(b, E::BASE, |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            });
+        })?;
+
+        self.dma_wr(bar, dma_handle, FalconMem::Imem, fw.imem_load(), true)?;
+        self.dma_wr(bar, dma_handle, FalconMem::Dmem, fw.dmem_load(), true)?;
+
+        self.hal.program_brom(bar, &fw.brom_params())?;
+
+        with_bar!(bar, |b| {
+            // Set `BootVec` to start of non-secure code.
+            regs::NV_PFALCON_FALCON_BOOTVEC::default()
+                .set_value(fw.boot_addr())
+                .write(b, E::BASE);
+        })?;
+
+        Ok(())
+    }
+
+    /// Start running the loaded firmware.
+    ///
+    /// `mbox0` and `mbox1` are optional parameters to write into the `MBOX0` and `MBOX1` registers
+    /// prior to running.
+    ///
+    /// Returns `MBOX0` and `MBOX1` after the firmware has stopped running.
+    pub(crate) fn boot(
+        &self,
+        bar: &Devres<Bar0>,
+        mbox0: Option<u32>,
+        mbox1: Option<u32>,
+    ) -> Result<(u32, u32)> {
+        with_bar!(bar, |b| {
+            if let Some(mbox0) = mbox0 {
+                regs::NV_PFALCON_FALCON_MAILBOX0::default()
+                    .set_value(mbox0)
+                    .write(b, E::BASE);
+            }
+
+            if let Some(mbox1) = mbox1 {
+                regs::NV_PFALCON_FALCON_MAILBOX1::default()
+                    .set_value(mbox1)
+                    .write(b, E::BASE);
+            }
+
+            match regs::NV_PFALCON_FALCON_CPUCTL::read(b, E::BASE).alias_en() {
+                true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
+                    .set_startcpu(true)
+                    .write(b, E::BASE),
+                false => regs::NV_PFALCON_FALCON_CPUCTL::default()
+                    .set_startcpu(true)
+                    .write(b, E::BASE),
+            }
+        })?;
+
+        util::wait_on(Duration::from_secs(2), || {
+            bar.try_access()
+                .map(|b| regs::NV_PFALCON_FALCON_CPUCTL::read(&*b, E::BASE))
+                .and_then(|v| if v.halted() { Some(()) } else { None })
+        })?;
+
+        let (mbox0, mbox1) = with_bar!(bar, |b| {
+            let mbox0 = regs::NV_PFALCON_FALCON_MAILBOX0::read(b, E::BASE).value();
+            let mbox1 = regs::NV_PFALCON_FALCON_MAILBOX1::read(b, E::BASE).value();
+
+            (mbox0, mbox1)
+        })?;
+
+        Ok((mbox0, mbox1))
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    pub(crate) fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Devres<Bar0>,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        self.hal
+            .get_signature_reg_fuse_version(bar, engine_id_mask, ucode_id)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..008e672315df5def72caf930403ef7487c46b525
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::{
+    driver::Bar0,
+    falcon::{Falcon, FalconEngine},
+    regs,
+};
+
+pub(crate) struct Gsp;
+impl FalconEngine for Gsp {
+    const BASE: usize = 0x00110000;
+}
+
+impl Falcon<Gsp> {
+    /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
+    /// allow GSP to signal CPU for processing new messages in message queue.
+    pub(crate) fn clear_swgen0_intr(&self, bar: &Devres<Bar0>) -> Result<()> {
+        with_bar!(bar, |b| regs::NV_PFALCON_FALCON_IRQSCLR::default()
+            .set_swgen0(true)
+            .write(b, Gsp::BASE))
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
new file mode 100644
index 0000000000000000000000000000000000000000..0d21a6fc52786d99f3e71e5d72f4dcd0be7d4b38
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+use kernel::sync::Arc;
+
+use crate::driver::Bar0;
+use crate::falcon::{FalconBromParams, FalconEngine};
+use crate::gpu::Chipset;
+
+mod ga102;
+
+/// Hardware Abstraction Layer for Falcon cores.
+///
+/// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
+/// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
+/// registers.
+pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+    // Activates the Falcon core if the engine is a risvc/falcon dual engine.
+    fn select_core(&self, _bar: &Devres<Bar0>) -> Result<()> {
+        Ok(())
+    }
+
+    /// Returns the fused version of the signature to use in order to run a HS firmware on this
+    /// falcon instance. `engine_id_mask` and `ucode_id` are obtained from the firmware header.
+    fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Devres<Bar0>,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32>;
+
+    // Program the boot ROM registers prior to starting a secure firmware.
+    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()>;
+}
+
+/// Returns a boxed falcon HAL adequate for the passed `chipset`.
+///
+/// We use this function and a heap-allocated trait object instead of statically defined trait
+/// objects because of the two-dimensional (Chipset, Engine) lookup required to return the
+/// requested HAL.
+///
+/// TODO: replace the return type with `KBox` once it gains the ability to host trait objects.
+pub(crate) fn create_falcon_hal<E: FalconEngine + 'static>(
+    chipset: Chipset,
+) -> Result<Arc<dyn FalconHal<E>>> {
+    let hal = match chipset {
+        Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106 | Chipset::GA107 => {
+            Arc::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as Arc<dyn FalconHal<E>>
+        }
+        _ => return Err(ENOTSUPP),
+    };
+
+    Ok(hal)
+}
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d4177ad19a2589c12b1173a3e89c26ccc676142c
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+use core::time::Duration;
+
+use kernel::devres::Devres;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::falcon::{FalconBromParams, FalconEngine, FalconModSelAlgo, PeregrineCoreSelect};
+use crate::regs;
+use crate::util;
+
+use super::FalconHal;
+
+fn select_core_ga102<E: FalconEngine>(bar: &Devres<Bar0>) -> Result<()> {
+    let bcr_ctrl = with_bar!(bar, |b| regs::NV_PRISCV_RISCV_BCR_CTRL::read(b, E::BASE))?;
+    if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
+        with_bar!(bar, |b| regs::NV_PRISCV_RISCV_BCR_CTRL::default()
+            .set_core_select(PeregrineCoreSelect::Falcon)
+            .write(b, E::BASE))?;
+
+        util::wait_on(Duration::from_millis(10), || {
+            bar.try_access_with(|b| regs::NV_PRISCV_RISCV_BCR_CTRL::read(b, E::BASE))
+                .and_then(|v| if v.valid() { Some(()) } else { None })
+        })?;
+    }
+
+    Ok(())
+}
+
+fn get_signature_reg_fuse_version_ga102(
+    bar: &Devres<Bar0>,
+    engine_id_mask: u16,
+    ucode_id: u8,
+) -> Result<u32> {
+    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGINE>_UCODE<X>_VERSION
+    // registers, which are an array. Our register definition macros do not allow us to manage them
+    // properly, so we need to hardcode their addresses for now.
+
+    // Each engine has 16 ucode version registers numbered from 1 to 16.
+    if ucode_id == 0 || ucode_id > 16 {
+        dev_warn!(bar.as_ref(), "invalid ucode id {:#x}", ucode_id);
+        return Err(EINVAL);
+    }
+    let reg_fuse = if engine_id_mask & 0x0001 != 0 {
+        // NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION
+        0x824140
+    } else if engine_id_mask & 0x0004 != 0 {
+        // NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION
+        0x824100
+    } else if engine_id_mask & 0x0400 != 0 {
+        // NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION
+        0x8241c0
+    } else {
+        dev_warn!(
+            bar.as_ref(),
+            "unexpected engine_id_mask {:#x}",
+            engine_id_mask
+        );
+        return Err(EINVAL);
+    } + ((ucode_id - 1) as usize * core::mem::size_of::<u32>());
+
+    let reg_fuse_version = with_bar!(bar, |b| { b.read32(reg_fuse) })?;
+
+    // Equivalent of Find Last Set bit.
+    Ok(u32::BITS - reg_fuse_version.leading_zeros())
+}
+
+fn program_brom_ga102<E: FalconEngine>(
+    bar: &Devres<Bar0>,
+    params: &FalconBromParams,
+) -> Result<()> {
+    with_bar!(bar, |b| {
+        regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
+            .set_value(params.pkc_data_offset)
+            .write(b, E::BASE);
+        regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
+            .set_value(params.engine_id_mask as u32)
+            .write(b, E::BASE);
+        regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
+            .set_ucode_id(params.ucode_id)
+            .write(b, E::BASE);
+        regs::NV_PFALCON2_FALCON_MOD_SEL::default()
+            .set_algo(FalconModSelAlgo::Rsa3k)
+            .write(b, E::BASE)
+    })
+}
+
+pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Ga102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
+    fn select_core(&self, bar: &Devres<Bar0>) -> Result<()> {
+        select_core_ga102::<E>(bar)
+    }
+
+    fn get_signature_reg_fuse_version(
+        &self,
+        bar: &Devres<Bar0>,
+        engine_id_mask: u16,
+        ucode_id: u8,
+    ) -> Result<u32> {
+        get_signature_reg_fuse_version_ga102(bar, engine_id_mask, ucode_id)
+    }
+
+    fn program_brom(&self, bar: &Devres<Bar0>, params: &FalconBromParams) -> Result<()> {
+        program_brom_ga102::<E>(bar, params)
+    }
+}
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c1efdaa7c4e1b8c04c4e041aae3b61a8b65f656b
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use crate::falcon::FalconEngine;
+
+pub(crate) struct Sec2;
+impl FalconEngine for Sec2 {
+    const BASE: usize = 0x00840000;
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 08302967375274fd88bb9b4fef4969e79e82f3b4..48e4546da603c15c7426fbfd72677f23301f54d2 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -5,6 +5,7 @@
 use crate::devinit;
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
 use crate::firmware::Firmware;
 use crate::regs;
 use crate::util;
@@ -228,6 +229,16 @@ pub(crate) fn new(
             page
         };
 
+        let gsp_falcon = Falcon::<Gsp>::new(
+            pdev.as_ref(),
+            spec.chipset,
+            &bar,
+            spec.chipset > Chipset::GA100,
+        )?;
+        gsp_falcon.clear_swgen0_intr(&bar)?;
+
+        let _sec2_falcon = Falcon::<Sec2>::new(pdev.as_ref(), spec.chipset, &bar, true)?;
+
         Ok(pin_init!(Self {
             spec,
             bar,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 37c7eb0ea7a926bee4e3c661028847291bf07fa2..f70b48a0a28f8c73b4f6e5223528138eda39f597 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -23,6 +23,7 @@ macro_rules! with_bar {
 mod devinit;
 mod dma;
 mod driver;
+mod falcon;
 mod firmware;
 mod gpu;
 mod regs;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 218cb6441eb0e5c6e5b52eabba006163eec0c8b4..b5c6eeb6ed873a06b4aefcb375f4944eb0b20597 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -9,6 +9,10 @@
 #[macro_use]
 mod macros;
 
+use crate::falcon::{
+    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
+    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
+};
 use crate::gpu::{Architecture, Chipset};
 
 /* PMC */
@@ -59,3 +63,124 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05 @ 0x00118234 {
     31:0    value as u32;
 });
+
+/* PFALCON */
+
+register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
+    4:4     halt as bool;
+    6:6     swgen0 as bool;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
+    10:10   riscv as bool;
+    12:12   mem_scrubbing as bool;
+    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
+    1:1     startcpu as bool;
+    4:4     halted as bool;
+    6:6     alias_en as bool;
+});
+
+register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
+    31:0    value as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
+    0:0     require_ctx as bool;
+    1:1     dmem_scrubbing as bool;
+    2:2     imem_scrubbing as bool;
+    6:3     dmaq_num as u8;
+    7:7     secure_stat as bool;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
+    31:0    base as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
+    23:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
+    0:0     full as bool;
+    1:1     idle as bool;
+    3:2     sec as u8;
+    4:4     imem as bool;
+    5:5     is_write as bool;
+    10:8    size as u8 ?=> DmaTrfCmdSize;
+    14:12   ctxdma as u8;
+    16:16   set_dmtag as u8;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
+    31:0    offs as u32;
+});
+
+register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
+    8:0     base as u16;
+});
+
+register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
+    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
+    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
+    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
+});
+
+register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
+    1:1     startcpu as bool;
+});
+
+// Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
+// instance.
+register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
+    0:0     reset as bool;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
+    1:0     target as u8 ?=> FalconFbifTarget;
+    2:2     mem_type as bool => FalconFbifMemType;
+});
+
+register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
+    7:7     allow_phys_no_ctx as bool;
+});
+
+register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
+    7:0     algo as u8 ?=> FalconModSelAlgo;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
+    7:0    ucode_id as u8;
+});
+
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
+    31:0    value as u32;
+});
+
+// TODO: this is an array of registers.
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
+    31:0    value as u32;
+});
+
+/* PRISCV */
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
+    0:0     valid as bool;
+    4:4     core_select as bool => PeregrineCoreSelect;
+    8:8     br_fetch as bool;
+});
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index afb525228431a2645afe7bb34988e9537757b1d7..81fcfff1f6f437d2f6a2130ce2249fbf4c1501be 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -34,7 +34,6 @@ pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
 ///
 /// TODO: replace with `read_poll_timeout` once it is available.
 /// (https://lore.kernel.org/lkml/20250220070611.214262-8-fujita.tomonori@gmail.com/)
-#[expect(dead_code)]
 pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Duration, cond: F) -> Result<R> {
     let start_time = Ktime::ktime_get();
 

-- 
2.49.0

