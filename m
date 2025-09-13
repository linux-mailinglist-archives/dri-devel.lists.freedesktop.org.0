Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D935FB56160
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB31910E1F2;
	Sat, 13 Sep 2025 14:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UTdLTh4K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769BF10E1EE;
 Sat, 13 Sep 2025 14:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lskXvTlOsKkgj3vnr9wlb70YgXrl7XBx/IfY3TQuNwLXQ8bo4s0G3Tr1jxbVOfTSdjjtFaZ5RgdX9LUzw0ryriGWkPF7D664AsF0dQNeNTdGXwk5KH5TMvl66WvE5v+38QZoj2lWO1Wa3m8ReN/M48GYpZYv9uRwI801BvXAzu02E6dzgASfjkcFmAoofmw9vpoks/7wxiKmHp5l73R3sAwXZcjVYgU1TfJw15BKrNuTVyioQWRxvfvnuPw7WoSn7oi7AKcgXnCJbJ6a7MnHyOmfbw7PyAhg10iuY538YuSTuX7GHOAjUzyH7R3Mu0utyiipqeEVyRXsVJXkENla8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJU6Mth31b3Y1PZ16cO1zUQQqumPyOfS1INY/BKbamI=;
 b=jtUCmt63RZaOg1Ad9FoKIiyq5U9GQuSo2V7hHY01vH0vAKKUzyafMbHoK93GOwXgJv+Li/tSZPWghpMfR1zIkaNgirbxgNVB7fJ6KCGJcLLKhM7TaAXRaaUBlmr7ZmLy34r0bret7Bt3RklnJg/fP0JJfbyvx0QT3pz4toAmTwytHSCIJaJNQkWyJ8K6NIYQYz3xFOCT+ghzNOEWrZDYWoWa6CZEi66vBJDWwEGhNM3TpLr4cyBZW/Pt0P32/bD15W9hqyGc9eCN09U94CgnAJjW5tgWS93o87GIPjSZ3+TeRI4pC8HcxOyp7WlkI/em57x72/mWD569hvEgkmjdMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJU6Mth31b3Y1PZ16cO1zUQQqumPyOfS1INY/BKbamI=;
 b=UTdLTh4KHH6fZeq7tnxaDm9skS2kurEH1X1av/n7H9AsEkuiw2StHQ5P4Im/7NjwQ2BM57tx/giJ4LEDOeIkyxwL1PaN9V/TdTaW4n0uUgLEk0SmszbphxNhgufiBLYsS+h464j9NOu2smMJ1blon9x7rz7+Fsr3auHBE1BvtfJoRVDrqae4X1mWQ809QuL7r51AkiJCHTdPG4P9ZS11gLchJisARDVZwav2dnzNLCZSE0PWFdUD90U9cnEhbmt2mhpcKG0sqDGfLagIRI1zJudmK65i6S6YvMFWo+u5b7m0kPG0YjqaN7bebPxGiVtekkBBdxSAlC32dhRuxevq+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:14 +0900
Subject: [PATCH v6 01/11] gpu: nova-core: require `Send` on `FalconEngine`
 and `FalconHal`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-1-9007079548b0@nvidia.com>
References: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
In-Reply-To: <20250913-nova_firmware-v6-0-9007079548b0@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 693c97d5-9ba5-4e2f-c4c7-08ddf2cf9015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2Q0U2lUandsTkk5dHZ0S2haNUdoeHY0WlNYZDhGYjVvR2s1WmpwVjBYTzll?=
 =?utf-8?B?VEdVbjF3SjZWeDk1ckN6REd3WHNrZW1rQXVUWnFXMU85ajNjTnU2eSswSGhZ?=
 =?utf-8?B?QnVGRERTamgydFVtSERUZitXZGlHM0FHRkthWlVQTXo0U2pZVGRUVE1MYU5H?=
 =?utf-8?B?MEFGbmJ4eVVXdllCZ3hOVDlwR1JzUUF6bWF3QnduclFPaXRkQW03S0pjVkV5?=
 =?utf-8?B?b3dCL0JPbDVyVkRUT09zcDhtRlhHMHlOSEdnMnRVK3c2YkFJVkNJT0t4NGxr?=
 =?utf-8?B?eTk4dk1zcHI0My85dXRrbjIvYXNlWFBtYk1oNnJqTUJ2RkNvSGxnMXpGTElM?=
 =?utf-8?B?NUdWTC81bnlKbjV1cjF6OGk0TlU1ZUZ4N3hQWExEWStPN0J0L0ZMa3JXeTNh?=
 =?utf-8?B?cmVpaVdWZ1dEaGwrY0RmeDNnR2RQdUw2cjcxb2tGWjJzL0R4NXRUamJXRGgw?=
 =?utf-8?B?anZtcFhDcUwxcU5USHBtQVJkdXNwT0RpajgxZ2JGaG9IbU1nTFp6YUE1K3dr?=
 =?utf-8?B?TU1udXZKQTRudTdycXp2NDZHTGJKbkNjMXRvaEZud1IxN09JRi9pQVY0eVJx?=
 =?utf-8?B?RGs1SStFdkcyZzRMSTI3WXBYdXRNMnZXT2I4eGZxQ2gvS2tLcE9vNFN1aDNu?=
 =?utf-8?B?UkVIcWJxTUR0TnFtK3Zjd2VFNUFJRnJNRktTSWdrN25yQURhZS9JU29JZGJx?=
 =?utf-8?B?Mjg5RjNac2tBekphZHR2NHNWMWRCbmFWY1JpRFR5clBlVVlkNUJITkxnZkcx?=
 =?utf-8?B?ckJxYVRkNGlaMmNVV1JLbW4rVWFMZ3RJaVgyYUZJeUVtOUpBUWgwUVRRNFBq?=
 =?utf-8?B?NG5FczdYS0pzckNocnNSOXNWVWFuVTRDOUJ2dmNmY0ZqWE1ialFyUFFXRFU1?=
 =?utf-8?B?ZDZ3T1hnenpPMmw3TWkzL3lqSXpvU0gvMUgrM1pJNllialFXbG1xRnl3cktM?=
 =?utf-8?B?SmZSbHRxd1FPc0hOZXJmZ2krall3ajdRSCtVeVNONnBUb0N4MitTL0hxSmdJ?=
 =?utf-8?B?Z1N5b0x2WUw3dVpOZUgyVzlybjZGdVN1dTZ3d00yaTVVaTRaMzd2RTR2YUxu?=
 =?utf-8?B?UTcyam5iSjZrbStRekNSVmp2MlFDN2Z4VVloQ2d0bSs3aUVVM1BZRTRrK0py?=
 =?utf-8?B?MkZ5TVRnMnFmUjlZZktlWlBHcUJ3Q1k1dUpVNTlVTU1weWEyc0pXWXZSWHhr?=
 =?utf-8?B?UmttSXJRR1VseHh4MTBkdWhtTjBrN1BjRjduRHpLU2kyczVkNkd4bkVYYTdN?=
 =?utf-8?B?eDk3MFRSODh3d0krOUVIL2VWTDhYR1FWcGx5dTBYQ3RJR3JBSjBmRDJXVXl1?=
 =?utf-8?B?L3dvTXcxWTA1ZUhVWGpaQ1NrbG1MR2RKTUJOZXk3b0pJT2F5S2tHbFNoNnRu?=
 =?utf-8?B?SGphZEZ5bGpMdUUyYU5Ecml0NHRLR0lCbHBvRGNpc0JuaFZqSWpEaEdSR3gx?=
 =?utf-8?B?azVxbXEyZ1pQT21WRVNnZE5ralFDK3lPcHNkcWNBaCs5Z0lJaEV5aitneUtN?=
 =?utf-8?B?eVVWZ1AzV2tSdlBQaWFqRkJIb3BTVlZlV1B6ZVNKaDh5M1lnb3dXS0cyM1RX?=
 =?utf-8?B?VlRpMDIwOWlZT2d3SUw1d05TWWhqT1BGallnOFcvK2FMdi83WURQck92bFFs?=
 =?utf-8?B?NFVtOVJDM1F4ZGErWTBmcjhUdTl6TzRXS0wvOWhVMFlmNGN5WFl2Q3lLZDYr?=
 =?utf-8?B?RWFSMG9XV05EdXNZSit1U3pZL2FXOWtjTkFYcHpuUTlyV1RyMmlrM3VwUTda?=
 =?utf-8?B?UGtwUFVRNlppYW5tWlRnNWk2czJmTTFvTzBsM1QwTURFZVgvcThOZElFaUs3?=
 =?utf-8?B?VFFwMFphWXQ0ck11STFnUzVWbGdFV3dEYlNSbGEvSmtuMnhEeXBwZi80Wjlm?=
 =?utf-8?B?OXZkY2RIN2xadEdaeitIb1FrenpuS1lEL29maHhpNVBTNUtNVWU1dk9Nckdv?=
 =?utf-8?B?dFY2aWIwcHZSREU0YU5NYytjYVZZSUd2M0RNOXBiTEhBZFVIUnpJbkZFWjdB?=
 =?utf-8?B?TUdhSktKdDdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3ppRUZzQ1gvNm1TUDZ4ZGpwS254R1BUbEkzdTFYaUZhS1FyRGNKbmRPRVhp?=
 =?utf-8?B?cjlpREV4WDFWL0VjQnllakRzVlV2aks5dGd2cWF1UWZLTXoyKzhPNXFTaWQr?=
 =?utf-8?B?cFpGVHduRVFOT2tFaFduSURsd3oyK1RBa25FeWd1UEV3Zlhud3ZPZEEyTVFo?=
 =?utf-8?B?Q0F1MklZYnVLZDZ6bGRKcXp6T2NDYkdEQ1A1T085ZFFXYXFyTVdSTzN6NkNZ?=
 =?utf-8?B?U24wRGJEVUlKVHQrUzdPaFhtbmg0TmhXQ2NkbzNGbWRzWkxuRTNONnlVblNu?=
 =?utf-8?B?eVVFU2lxK0tWSko2UXBwV2hQVHpMNmNONndOUTZHWFRkemVHeHNrTnQrYnRi?=
 =?utf-8?B?UDJoTitNd2VGUDJhYjNxVTNlb1pRVUp6cDE1eGJub1hTanhyb1BsSmlWU0tT?=
 =?utf-8?B?UTVwZWlwK2JZS0czTHJhQ3RlRmh6bkJqa21MT0tFWmtieDhaSXRLRG5LSmht?=
 =?utf-8?B?QTU0OUlCaE9uYi9FaUtOSzVMdEhxZkgzUk4rTllxeTJNZkxvcWdUR3dZTUEr?=
 =?utf-8?B?L1BKL2hOdjB6V1hCTmt3UFRsb2JGbjRPNTBPVjliRVE5SDdwOVVQSHdiTTUz?=
 =?utf-8?B?K1RqUzl6QjNQMjNvQ2xKNmpKMERsa3hRZFhVQ1I5OVlBVWFDUTVCVEM4TE5F?=
 =?utf-8?B?dTcxYi9LdTg3bDlvY0o3cm9ydXdJWW9mc3lWWXpLUS9HZjhDOXlieHVVVGta?=
 =?utf-8?B?Rnh1cVpJeS9zL0R4YVRDRGR3MlQ2ODdqRWdnSjhYY0x2aEpNVGZ1cmZhM2E2?=
 =?utf-8?B?Wmc1Q0dXbEIwdndkekVRUUwzckNwc2ZCcGp0blZrUmJnNkMwekFhTC9LbTlu?=
 =?utf-8?B?bVEvQmZ0V0pZUHhjbmZvbi9uVTJrVjMwNWN0cjAyQXovdFZLd0h5Vll5SXBO?=
 =?utf-8?B?WFphWFRJY2Q2UHlwRmdkRnczbWRpREtreHNFdFBpTisxd0djSy9SRHpITkxm?=
 =?utf-8?B?MHVMV3EwcGVzMWJUQ3hTeTJVdG9JSmxUZUJhSnR6WFE3YzRoVU9vNCtmem9Y?=
 =?utf-8?B?UzY2dDk3cXJHeDA5cWR6NVprSW5tdXc3REZwSVQyTUZMUTlGeHZ3YnZxSGNC?=
 =?utf-8?B?VTh2QjloSG9lRDhmRzZGdmFMSllsQ2J6c0FoWGtPc0Q2M3l0N00zM2VlV2NS?=
 =?utf-8?B?QjRSbVlqN0taRDdtVlpyYi9zR3JzcVlhT0Q0Z2p4aGE4L0RTd2I4Nm5kWWIz?=
 =?utf-8?B?UlJUQ1NEY3RjclIvZXhZRWNoOEZUd3hoeHN2aDFQeEZYRUoxNDZyOXBBeWxO?=
 =?utf-8?B?UFpYOElxWVYxWTBab0FuTDlIblVPWjdjVHRCeTE5WjByQTFPcUN5Z1JDVlNa?=
 =?utf-8?B?L1VWM0J1WjBrK21ielh1WmsrZFlJaE0xcUJmVGx3NjFMSjJyekNTeE5ZQ3pJ?=
 =?utf-8?B?U2lmQ2psZ3RtNm9Gbitlc052eTJrdzVISlhUS0xJUHUwNk93dlUzSGJKYlpF?=
 =?utf-8?B?Uy8vaUJwYnYrc3drVy9rUk5JODdoUHdkbXYwQlB6NUp6NWdWZ1JMS1dvKyti?=
 =?utf-8?B?bjhpdHFNbXBZTFoxYTQvekFBRHhWUFZvRStLMG1pcjJMVUFDVDJKM056SHRV?=
 =?utf-8?B?Y09CeUFvRmx1aExuMTJuNElTU1QwMEpSUXVac1F5OGFRSWNaRWNxb1M4dlBQ?=
 =?utf-8?B?ckY1NXRTRDVIc0cvbVlONmxpcWFudG1QSzNTUG9peGNwU2daZmdZN2ZzUVNh?=
 =?utf-8?B?YWV5MXdiMWo2YUhOdkd5eXF5c3Q4cmNCNy96TjIvbkIzVHNYcW5NczhETjFi?=
 =?utf-8?B?cXg4WWJ0cXVqeVBZMnlxd2Fydi9lakdkOWl5WEtFQUl0TDBsS2U1bWlFMHNR?=
 =?utf-8?B?ZmZva0t1a3N6SURTQ0lRYldrUFZYZ09HWU8vZE5TejhVWXZ6bUlVWW52T0t6?=
 =?utf-8?B?YU51NEVxcDZhUnc0YjZGT3FLcXlGVGNvQlRDVSsvMGlIWWxGa21mOTNhS2hm?=
 =?utf-8?B?WEpDYWpkZkVQSnRiRG5kODEwbGdZaWZaM1pNZjNsaERlR2lTTDROY3kwdkdq?=
 =?utf-8?B?VmtxZXpKT0xwZnJZY29yWVozTkFId1ZudTV2TFROZGRrS20wZTRESzFKTjBI?=
 =?utf-8?B?ZUtXaHowclZZOUF2eklSWUJlc3M5ZThpOUZSL05Tb2RlRDhMbVBTUlpzenAv?=
 =?utf-8?B?R0prUzEvUC9YcXBjY2dXZzE1RmprQ094U3h2UXV0bWtZK2xJSnBwdnFvUTMr?=
 =?utf-8?Q?sxsHPkL7TubNUQ+11s48NqYftUaqaK+EYXjfO7zLxyGn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 693c97d5-9ba5-4e2f-c4c7-08ddf2cf9015
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:24.7580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOE27oTpqmyxf6+F91CS5tfND1B4y9W++E0U6Mb6GdiitG690RbckTtbCKoKUcgdpBQJl4w7EQmGuqF2hMghtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9583
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

We want to store the GSP and SEC2 falcon instances inside the `Gpu`
structure, but doing so require these types to implement `Send` for
`pci::Driver` to remain implementable on `NovaCore`, which embeds `Gpu`.

All implementors of `FalconEngine` and `FalconHal` satisfy the
requirements of `Send`, and these traits also already required `Sync`,
so this a minor tweak.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     | 2 +-
 drivers/gpu/nova-core/falcon/hal.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 2dbcdf26697beb7e52083675fc9ea62a6167fef8..b16207e7242fe1ac26b8552575b8b4e52f34cf6a 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -286,7 +286,7 @@ fn from(value: bool) -> Self {
 /// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
 /// to identify a given Falcon instance with register I/O methods.
 pub(crate) trait FalconEngine:
-    Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
+    Send + Sync + RegisterBase<PFalconBase> + RegisterBase<PFalcon2Base> + Sized
 {
     /// Singleton of the engine, used to identify it with register I/O methods.
     const ID: Self;
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index b233bc365882f9add9b6eab33b8d462d7913df37..bba28845561795914e9a4dba277d72bbac0b37dd 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,7 +13,7 @@
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
 /// so its `BASE` parameter can be used in order to avoid runtime bound checks when accessing
 /// registers.
-pub(crate) trait FalconHal<E: FalconEngine>: Sync {
+pub(crate) trait FalconHal<E: FalconEngine>: Send + Sync {
     /// Activates the Falcon core if the engine is a risvc/falcon dual engine.
     fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
         Ok(())

-- 
2.51.0

