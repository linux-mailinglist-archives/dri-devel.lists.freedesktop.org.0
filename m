Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A95B56165
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 16:12:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCFC10E1F8;
	Sat, 13 Sep 2025 14:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GAibg6VF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696E810E1F7;
 Sat, 13 Sep 2025 14:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDGEwFB1It387a/KIbz1VQm9QznvSkrfpMKRetk+6zfuhbqBKho+Xfw7nf0/jHMp9hBBrVST5gCvdx+uXQFpIUP2rs5p6ST144l4xtOUJUjKkU3/KHxLHb4vHFlVvJOy/+rikP9SjDGml1jAKWxEMOlJScQySzs6R5uU1zB8+TyL/BBHKnNGxTf18gVrGxEXpUXvPbQLj6E5CxpkWwtWvtE7iUt9ey1nxMGmF7BHg6zOvj46+uANItwnXH3uQt3zMgOjUC/fEtycx3aGeQ4S8X07Lyf111dsUGzU+hK9dRqW+5a9Bo3V9J3ij+CMAvmTmZ7thRheN8r893yk4UO5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXrL12F7jvOxsnR4NAa/FGYcO1+1/osekg1veqtyLUo=;
 b=eKeb/SmnsOaiIohMINTJ/W2JqOa1EtC98BJvLAN73ULk5445M/BTjd1n/uQkX+L4rBQdJIFfFd2wHQYdiLhKBrDg07HdzwwD9ttqpDqn33UKMQ8vb01NgOCJGDhqPOHb1RiKesa0M55z7jpm7F92wmDxR8EXUiRVnmix9T8uxiAKY+OCqIFvO84cWu6ntVI1G8bcIwpsF7aVLxkq9Ej1TTh4tvHyDbdqh6djShvPdI9XygdaQazP+urn8CQlZa1GcuihnGBqgLWldwf/EraddKZUIU3jeX1aKGQ9wmOX2dg3aGoPxPQwrvoFguR/jSNmhikvlg5VsWw9U5NA6zADVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXrL12F7jvOxsnR4NAa/FGYcO1+1/osekg1veqtyLUo=;
 b=GAibg6VFJMcKq4IH5KBbn26nXtrOg2+6FGJi3Ro6W/GT6wYIbKkqG8sPYUS3uMtY77mzgyiebpkuFcUL9VpH2+i8UQZ/5Ij/QHyto5EAoZAc56RymhUpCdsbaxr60u5USd11IosCHY9XScwgKZAAdLfGq395tPAmqwjRPKm8Vu3YiE9Wbj4nqwfn6SyNrpbLYbKXKfj6ll+kgl64Ufxe/BgOXh/YggNHyiu2wpAen4eDfjuoix78WP3uifIZo3VW5drd1S3OqsIjCC+8qM8eNsSAlJigEe1Vng4/vJ4dwQS4EARW3Vs/9J2j4d/gFRtZprkr1Ecca3qFllmmVJox4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 14:12:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Sat, 13 Sep 2025
 14:12:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 13 Sep 2025 23:12:16 +0900
Subject: [PATCH v6 03/11] gpu: nova-core: add Chipset::name() method
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250913-nova_firmware-v6-3-9007079548b0@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5e8799-b7be-4b4e-3f36-08ddf2cf9462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VU9zVXR4MkdnZ1pjRlRHVCs0bkJ4d0JrM2txWEFjd2R0NnRTdzhnM1A3UE5Z?=
 =?utf-8?B?c3VTeXhYdkcyMnRiai8xeXBhTTdvR0wweEQxNjIrdll4WVdMalBjd3kyL2Vp?=
 =?utf-8?B?dThIeS9BcXEwTnM1NlF0ZVlsbFhJWlRDY0YvN0JhbitDUE5NeUFpNFVHM2tr?=
 =?utf-8?B?blRkYXptMjNSclVTc1NQQmlUek43NEhMY00vR1hQMUo1UzZScERPVm5XQzAx?=
 =?utf-8?B?d0I2azgrYlg4RkNDbCtJUm5kb0NOMWp4Q05ZRVhwWUJYekpIQk5wZjVGSlRm?=
 =?utf-8?B?N0xhejZwbTdvNXkvc0IxOTNRV0RIR1hhYkxRQlhUUGszek9lNE0waTErejVp?=
 =?utf-8?B?THBFcGg3SDBDNHR5WUlhU0hwS2JGL2tKc0hXcTZpMUJlQi9SeFRSTzZlTU8y?=
 =?utf-8?B?LzYybUlZSW1qYjRkNEt2c0hMeE91NFZjSDhIMW1NNW1sbW1yZG9iU0E4MUdx?=
 =?utf-8?B?RUNPd2VaRkp6Q0s2TytIR1pmVE1oV3BUMzlWN3N5Wlh4cVRSUGIzeGRGekp1?=
 =?utf-8?B?MDc0VW5BQTQzOWJmWUxUTnh0S0FsaUsyemYvSHNrOGtlOWt0SFI2RWVBWkV2?=
 =?utf-8?B?bHV4Yjg0VHdDbmNhQkhMRiswYkdXcTgrd241L2FMZFNHMEtVTUVoeVhTTEJO?=
 =?utf-8?B?dE1aYmdKYTRwbXRESmVNZmtDTVRna3FlUE1sOWQrSlROeW81ays0dkxLU1Uz?=
 =?utf-8?B?VWVNU1QxYis1ZDNhTytDV1NLSGszcFdydEZ5NmlnNU93OXRRWXBxdFZmUGhF?=
 =?utf-8?B?VzJDUVpwWCtXdGVMSU1lTGZYYmpiL2JDMGxQVVpjVG84SVd0dWxNSllJMHVH?=
 =?utf-8?B?MkhhN2xWM2RCeWVCaUU4MysxVHFRNjZHU0RuTkd4cW9hSS9qSVQ1aWNmSU9R?=
 =?utf-8?B?bEZQQ3FJa2wxbDZuZkpqaEUxVDlyY3VLUVFJbzFuajlzcUg1UVNUZEtuNzlk?=
 =?utf-8?B?Z0xxWjN3c2IyMEY2TnB6bWlBa2VaaGlxOUVWK1lPU2tvODRBNnRpL29Tb3M3?=
 =?utf-8?B?Y3VNS0hXTDhFanhaVjRmMWp0SlUya0I0cFZxelQvSVZ4NlR2YmZOK2lSQTlr?=
 =?utf-8?B?RDZEMzMwakpuV1dmd20yNldRWElyTjJLRU03Uno3b3V4TC9wYXBzcThPZHVm?=
 =?utf-8?B?eSt1a3JqWktBaUN2Q3lwblMzSnZVSnl3R0pWaWtpQXJmNTFqOXJWWXJrenNl?=
 =?utf-8?B?UDJ5YzY4Qksrb3YvME45VWYxaWZqSVNaT3BjTjFubWdjVEpPNnV4aE9NbThX?=
 =?utf-8?B?MUJnbUl4YmlBSjFpTnBjdkd4U3ppQk1kbi9TY0o0NmV5ZjFyWGxQRVdINmhi?=
 =?utf-8?B?VG5FdENzNHJ6dW8rZld6UndBU2UrVnhnN2RuZmk5MHNVWXkwTGpodmFiaDJI?=
 =?utf-8?B?SlNqM1RwdkxTbE1HN1NiVXMvcVYyTVluRlhoejZnWTY0THRLZWQzL3lCUjRG?=
 =?utf-8?B?a0VCWW9vY1l5cnIra3ZrZWhGeG8yOFEwRTZaMmVMc3p1WHNqemdJRDI0TE5Y?=
 =?utf-8?B?K3NmN2svSUE2NzNsSytOQklkRWh1a3A5VS84TGxJVndBc1Bkb0ZKdG9zR0RR?=
 =?utf-8?B?OTAweSt6Q0NvdjRPUnpSMFRUVmZ0YVNpMHR0dmt1dCtpZnNQYXlsdHJDbG9F?=
 =?utf-8?B?ZlFRUnc1VWU2bkFRcDEvcjR1WjlYVmZPKzJVUUNLUzhjSkUvVGM3N05YQnc5?=
 =?utf-8?B?bXBKYk5UL1VEeWpDWFZPcHFKZ1FLSmdWeWxVeUJ2UG5UNkNVc1U0cUhxd0ZQ?=
 =?utf-8?B?eFZLSHdNNkg1QmJLMnNEQU55NjdlZUE2bVJBTFJwVjJMNUpyOCthak9qNGlx?=
 =?utf-8?B?L29WRVJFYmZWbEhOYUhsWXRQL0p3bTlNM1lkOGp1VEJkbzB1VkpJRHVLQlRz?=
 =?utf-8?B?c2dKUm1PVlR5NmN0WGZpSHRRcDgxRTJsUG5uaHI1ckprNHlEazNlc1FoNmtC?=
 =?utf-8?B?TmNnU3gycGdrOFVkNGpBdWxqdk9CSnlLZTg2SmRySVMwcmtkOVdtUzBnNmJX?=
 =?utf-8?B?OVRMNnl3TmxBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bklCTGN3VEx4Qkt3anlwMUZvLzZHbi9pdklDQzdvb1Z0azlhd3VEVU9VWmVI?=
 =?utf-8?B?Q09rTnhJclBmOWJxYWxzNjFRTlIzR1VvdXVZU05Md2s5TFRZRW5KUnBIUUpY?=
 =?utf-8?B?RzIveVVqdXhYODZBa3R0UDdoNWdFYW9peUR6QXUrcEdDMWFHVzcyMGlOSkNw?=
 =?utf-8?B?WUgxVlFBVWs4eTQ0bERROXg0N2FEQ1FuNXp3K1B2bmJ4R1lBaitnc1JMbi9Z?=
 =?utf-8?B?TGYwWkZxeGVpZFdhNkZkdXpjenVuWDlmcWVybzNxdjJGWTVLRXVTUHlybCti?=
 =?utf-8?B?dEsvTE5tbmxtQUUzdExIZ1JaS1ZsRTBwODU5ZzR1emg5Q1NpdWJ4RHU1Si9J?=
 =?utf-8?B?Z1N5NlNSb0pZUXptcTlXdGxFRkVIcTA0TDhwajkwZDJuTS9QMnU0bTdmTllW?=
 =?utf-8?B?WmM0OUlrZnRDNUM1Rk1VeWNPYnhDZTVWSXBnVmlxMFZ6M25JWnV1NnVIbGdF?=
 =?utf-8?B?UkVSbEtLc25iOTdKUms2U3p4NVJldHg5dHZVTjUzTGJQMThFWjdSd0pybEhL?=
 =?utf-8?B?dndkYms5NEJ4aXdaZEcyZ2pSRDRuRVZFT1FhZ3RHZWQ0TFA2a1kvVHdHVFVv?=
 =?utf-8?B?dGJMZDNrSDR1OXBGUmdUQ3hDS0ZFeHlpSHgvbDF4cmV0cGcrOHZRbHMwUXlQ?=
 =?utf-8?B?ZDhFNVkxaUZNWVFzZENDNFpTekpvWGhvclRMVFpYdXhKYUIxYWR0dURsSXdo?=
 =?utf-8?B?aHFFSkdWVGNjSmdlK045a0ZmRnViYWdCM3BCeGUrSU1ya0lRTEpYcUxWUWsy?=
 =?utf-8?B?RDNHOWF3TlBsMHdZZ3Z4RHlxaXpUVUp3dWRuZjFnK1VaMkJ6NXNObUlocHdJ?=
 =?utf-8?B?eVpTWW5NMFN2MGpCL3NZNk44TThSVllYenJPV0JadEZqV0ZEYjdLVmU5R3c2?=
 =?utf-8?B?dG9jZzBkelpRRkdyTHB2dGRGQzUyV25QN0pOL2tUNE4xVjVwVm9FeG1hMkll?=
 =?utf-8?B?RjNJUlRnVlM3S1dLZEZibnhVL1AyYzhmK2tiZ2l1RkVhWGhMNEk4MGg1LzJZ?=
 =?utf-8?B?Y0lPQ1ZwWWlralRYdGhpUXJEQ24rMGc3Vk5WblRVQy8xSE1QaWJqeGt3VlZ2?=
 =?utf-8?B?TE9PZWRLOTdvdnNDVXlvRStIYUVXbFh1czZKb3QydlpDTGxUNVY0eUQ4QnNT?=
 =?utf-8?B?UlJlS3dEWG03em45dnQzNXlnYlhBQ0JqczdoV2k2aTVDbFA3WVVkSkZ0eVhD?=
 =?utf-8?B?OXJoZzVtT1EvenYyZU1GZ0lGQWIreFlBOTBmSGw0OG0rejZiOEJNOVlrOXZr?=
 =?utf-8?B?d2dleFhPbUg5Qzd1alRsQXZxVE5SYWRYY0x5ZU9ZOVMyejhVb2RZbm1oRXc2?=
 =?utf-8?B?QmVXUS9SNmVqZHlkYjdVelFQaWhWbGRxcUFwMFBSZE5pVE5aYzdVbFVMOWlX?=
 =?utf-8?B?YnZVdVpmWTJsalhHQXN3aVhkeGVOTk93UGJzd3l6cHVkd2hmOUZhL3llL0c1?=
 =?utf-8?B?SVFJeGtiSFM5L2JNTjY5bi9iS256RWhnMGdPMHN4eUZhdWs4U2RST1FQTlk0?=
 =?utf-8?B?RUcxMExnT2dia3hXdDdnbEcrSWlZcHIxbkNvbnI2bytmTnNnYlZaeGJROW5u?=
 =?utf-8?B?V0ZIVTcvdkNDT0FDUC90V3Nyd3hvUG9PR0w1eEZ3MTRjZWQyWGRNRFFGZGFG?=
 =?utf-8?B?Y0FwNUdZUXdQeFZaUXorOVlyUTh4bUh2bHBFMTV2WTUzNDR4L2JxZ3FYVUJH?=
 =?utf-8?B?Vi9ocHNNeWtoKzdod0Z2Ym52SzdpcmNWWmo4S2p2Tmk4SmtOWDNiVUlNeDlr?=
 =?utf-8?B?MlNzOHBIOTlRcnQ4Qll2cWRoSk5KS2RURkFaaTdweDM5UzlzUWFkVE8zSE4r?=
 =?utf-8?B?ZTk0MFRaQks2aFB0NTZxYmNMZ09KMWNOSG96WVlwOW1zTFVEVWw5MnR3dDVL?=
 =?utf-8?B?alBUdUlXTWJqK1pBdWpjZ08rUkwvbmFxYkdzRkdhTlluQVBVZ2pwMVFMSmZE?=
 =?utf-8?B?U2VXUkNYajdNRDdVQmYzQWEyUVpNNVZoWWlFVlc0ZEhJS2dCSGtUZlZYdmM2?=
 =?utf-8?B?aE5FV0dQWlgrYWhPVXM2U3M5U1ZWN3c5c2F0RDhFTktFYk0wS3Nydk9qTTFK?=
 =?utf-8?B?K3VYczRNUE80eFVoZHhQRlN1TTNldGRTek44alF0bkx5OThDRDFXRTVTNkNp?=
 =?utf-8?B?Z3I0aEEwN2N3S0JYZnE2Y1lla3Z3NC9kVXV0bGVVOGxTdmxYUFh0L21Rc2I4?=
 =?utf-8?Q?pBn8XS5bBZfYmqeEl12Pf8oOwnNyQpVgUnaGcF+UVs5V?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e8799-b7be-4b4e-3f36-08ddf2cf9462
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 14:12:31.9928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4rNNPcIIjYmWmskAgvwlLq98nbBkBo/caZ4ER/xQhgEyAcUOYHCdxK2S07Pc/O3mlKB5Lo78n+dRSWYFvBb34g==
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

There are a few cases where we need the lowercase name of a given
chipset, notably to resolve firmware files paths for dynamic loading or
to build the module information.

So far, we relied on a static `NAMES` array for the latter, and some
CString hackery for the former.

Replace both with a new `name` const method that returns the lowercase
name of a chipset instance. We can generate it using the `paste!` macro.

Using this method removes the need to create a `CString` when loading
firmware, and lets us remove a couple of utility functions that now have
no user.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs |  8 +++-----
 drivers/gpu/nova-core/gpu.rs      | 25 +++++++++++++++++--------
 drivers/gpu/nova-core/util.rs     | 20 --------------------
 3 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2931912ddba0ea1fe6d027ccec70b39cdb40344a..213d4506a53f83e7474861f6f81f033a9760fb61 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -30,9 +30,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let mut chip_name = CString::try_from_fmt(fmt!("{chipset}"))?;
-        chip_name.make_ascii_lowercase();
-        let chip_name = &*chip_name;
+        let chip_name = chipset.name();
 
         let request = |name_| {
             CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
@@ -180,8 +178,8 @@ pub(crate) const fn create(
         let mut this = Self(firmware::ModInfoBuilder::new(module_name));
         let mut i = 0;
 
-        while i < gpu::Chipset::NAMES.len() {
-            this = this.make_entry_chipset(gpu::Chipset::NAMES[i]);
+        while i < gpu::Chipset::ALL.len() {
+            this = this.make_entry_chipset(gpu::Chipset::ALL[i].name());
             i += 1;
         }
 
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 3c019df01d303529ea67f1ebf8ea84ebdb1ed813..d2395335727a1f7265df0a5703853cfcd2550965 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -9,7 +9,6 @@
 use crate::gfw;
 use crate::gsp::Gsp;
 use crate::regs;
-use crate::util;
 use core::fmt;
 
 macro_rules! define_chipset {
@@ -26,13 +25,23 @@ impl Chipset {
                 $( Chipset::$variant, )*
             ];
 
-            pub(crate) const NAMES: [&'static str; Self::ALL.len()] = [
-                $( util::const_bytes_to_str(
-                        util::to_lowercase_bytes::<{ stringify!($variant).len() }>(
-                            stringify!($variant)
-                        ).as_slice()
-                ), )*
-            ];
+            ::kernel::macros::paste!(
+            /// Returns the name of this chipset, in lowercase.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// let chipset = Chipset::GA102;
+            /// assert_eq!(chipset.name(), "ga102");
+            /// ```
+            pub(crate) const fn name(&self) -> &'static str {
+                match *self {
+                $(
+                    Chipset::$variant => stringify!([<$variant:lower>]),
+                )*
+                }
+            }
+            );
         }
 
         // TODO[FPRI]: replace with something like derive(FromPrimitive)
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 76cedf3710d7bb248f62ed50381a70f8ffb3f19a..bf35f00cb732ee4fa6644854718a0ad99051666a 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -3,26 +3,6 @@
 use kernel::prelude::*;
 use kernel::time::{Delta, Instant, Monotonic};
 
-pub(crate) const fn to_lowercase_bytes<const N: usize>(s: &str) -> [u8; N] {
-    let src = s.as_bytes();
-    let mut dst = [0; N];
-    let mut i = 0;
-
-    while i < src.len() && i < N {
-        dst[i] = (src[i] as char).to_ascii_lowercase() as u8;
-        i += 1;
-    }
-
-    dst
-}
-
-pub(crate) const fn const_bytes_to_str(bytes: &[u8]) -> &str {
-    match core::str::from_utf8(bytes) {
-        Ok(string) => string,
-        Err(_) => kernel::build_error!("Bytes are not valid UTF-8."),
-    }
-}
-
 /// Wait until `cond` is true or `timeout` elapsed.
 ///
 /// When `cond` evaluates to `Some`, its return value is returned.

-- 
2.51.0

