Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81894B3528D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87FC10E5B6;
	Tue, 26 Aug 2025 04:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GX7msgVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAA410E5BB;
 Tue, 26 Aug 2025 04:08:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVvMmeK4kQ492ah/dmpGzAW+uaDISJkF/DLRlv3Hxdnow0RPXGKjTPd1dNE0FtIBoEhpj983nfa7tOUXyKKPnIxR0Bke9ykeXEovVrcyUo25+spwSApoOjdcIbNRfntAv5cAU/mChAaMER9GvLvUDG7n8zsVl9IBtnmIkTNGRK89UGOKVitBD4B2PDPSRblKmwG3FQ6U5/6WaV5EV7VQ9JY/60/UXrDOnxo+ZhYBH3NJ7iiEWKpYBhSnOY+B9uHXlepJJxzxJoQmnd9+lkR0DJcrn7BCuHCJGkucmnpVt5IhiBhfXRSynpVr7oB41tm+2v0L30zCPk/tElUDfVDMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Za7CyvXxsHQZzLeUBHvHu3tKtjwANuFMHtnuk7GL/Hg=;
 b=HoCTfCnshlmxbkZoRxw7C16GMZRRQpuKdmgfJ2BQkzXMx5ORgC/GQtk0r9eHRiaL3LvrG2EhETPue2IH3UeR73Ns5zRhLBM9ci7HNQR1gwgIdyCK59deLj4ZNc1aJctklwr03mJKMR7iE2P2vL9vP4f3/vrquI7po+SoZn3X1Ehz12L9eEmF7GqnwhTL6p6IeVs+KMaBcmaHTZfXj0+jtfN6D+434jkMiUi3UFNLlf19PlnsP13g2h2CQQim5LTIKeGR8DGLwxrUQSyK71tHobiuBkl8UA7bkkJdJKjsIS/+CnsaGhPG+WVzq8JmG/jqDvbhkBXHJNoBfm1kh3jC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Za7CyvXxsHQZzLeUBHvHu3tKtjwANuFMHtnuk7GL/Hg=;
 b=GX7msgVk5IEmHJuD0xRN4boW678FWk5je6v0suynXWqPJxS4XJ/820pGcdm6jEf+089SgldFopP3P1YEH2uN/OY50I6MUqTTwg7xHcMSwV/vdBpRzcin9eCMoIjN1EjFqAOiBCXjMZkgkm1+uXDFZwhxNv9M3PSU0FYnug3UZuYO1vyItIppyLVZ4nMThsZXLpJJnxl+pMcgqXbELgs42iIwpt341CWTt6UL5BPhaC7HaJTjSgEqhFRMeyJysGhgBMkXps7U7e1m7lSo1stw/pYs+FqoI66lXbZ1/lCsjq/n7h30JTdBDp+2jTkVi8WDhSIBw4NpKV68B+xDX/AaFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:08:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:08:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:43 +0900
Subject: [PATCH v2 7/8] gpu: nova-core: Add base files for r570.144
 firmware bindings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-7-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: cb80146b-c2eb-420b-51e2-08dde4562d32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnBOZnJ3bUFDV0xlT0pQWEpLMWxidTJobXlrbUxYdW9kWk1FWHpGbXFLM3BB?=
 =?utf-8?B?YmVyMHJiSzlzbjltRDNZVjVVbDkxY1BNcm5UMGtpdy9DV0c2em9kaG4rKzAy?=
 =?utf-8?B?ckVINm9TdkQ0TWtCai9QU2VMaGUraWhLdkxScGp4MlRwZW41di9UdVJGRVBo?=
 =?utf-8?B?VS9SaWJ1dVIzOGNLNXcxd1laZlNTVjBvNmdITzFydWsva1VzR3dxRTNLQmk3?=
 =?utf-8?B?dFB3cUh2elhHSEYzWi9peGRWbUhBSXdocVVZZEJZUXFSZFRJdDlDRkQzS3hj?=
 =?utf-8?B?eGdwR1BPTDF4Nm5KUnd2MVo5bzcvZ0JJdURzN3ZFeFZiUE1UK3pCck5zN3U0?=
 =?utf-8?B?ejgrRWR5dnhib1drWTlPT3dWTnB2U1I3U0kzSVdRYlZRemtDQklud1I0ZVNU?=
 =?utf-8?B?aWpzOHVnL1hTUHY5cSt5N0NkMllUYUhFb3d4Z2d6VWs4M3hEbXBxd2hEVEhq?=
 =?utf-8?B?anNaZUY3R3V6MHd6MEV1YjJDcGNsb0xObE4zZWZXc0YrSURFMnFGYktxSGpV?=
 =?utf-8?B?L2tYd0huT0pndktpMWV6ZmMzbmxFSS9YVzcxMmFISFQrU0Z5eWtDWHZWV3BQ?=
 =?utf-8?B?OTZVUmxKajJKNGtLRm9Gc05sZjNSLyt3bjg5Ujc4UDJrVEdpeHVySDBtbHFR?=
 =?utf-8?B?b0MyTWt4alVpSUoxdENTZVA3TklLTWVWU0xremhHZ0s3RjhubjZKU1FCVG85?=
 =?utf-8?B?bFBWUHpKUFRtelF3ZHlWTkNyclRmNTJFekQ0MThidFo3Slp5RmJKV2hPVG5P?=
 =?utf-8?B?MmN5Z2h0aTcvaWdNRldGR3RiNlozMExoZDVpM2VJZG9UV2lxNXdkdk1XUFpp?=
 =?utf-8?B?b0JDbXhtSUtpeWdvZUNZTVFhZWdWcjc1Z1NEeHZybytPQVRyNWhXMXlldnA1?=
 =?utf-8?B?RVZVdUNmUWkxTWZvUS96dURZZ1czWHdWbm1sck82c2liYXdiV2dQank2SHJl?=
 =?utf-8?B?N2IzaEVTMUErVGYxZ0Njci9wRTN4RzZReTc1NzROYW95eDVmVEk3U2lUL3BB?=
 =?utf-8?B?NUlUS0RZSTFBc1RJOUxMRmFMM0JCZzBLSkVhNE4rcUVvK0ZlWFg5ODJRWUJt?=
 =?utf-8?B?NUZVUjV6OURETWxBRmtqeVdRcjRXN3ZVTklVSWpoaDhTYi80a3dkQkh2MElX?=
 =?utf-8?B?cHJqMEZJWUtwT05Vc0djVmRxQTZHZjVGRTNjZ2c2bERwejNQSGhZMkRIY3BR?=
 =?utf-8?B?SWVBV1UzdkFNS2hXOG50ZThHcWF5R3FhMGNGV2FlOFFkOGt2K3lvcjFBSXhB?=
 =?utf-8?B?azZDZzR1dzVTLzVEUFNWMzl3QlJsbTRuVWhZYzFFMG9oMVJGRVk1WXNnUS9F?=
 =?utf-8?B?OFpqWVBTRUpCRHg3YnNjdTNlWnFlYlhPb3J1QjN3UjJsT0hNVERsSGNGZmp5?=
 =?utf-8?B?TVMrNjQvMVZjVG1BOE9FTDh3L3hBV0diUUV3cEE4bzJkcTd4SlNVMGZiK0d6?=
 =?utf-8?B?dDZteUNWdXp5aFVEaW5oWUxTL3o0dEZ4bncxVlVaYTFSeDJ0blNXMkYxbWlU?=
 =?utf-8?B?Y2dYd0w1Zjc1MjJqWERtbWZrWGF1a2c5SHZrTGNGcFlHM0tMUkdzMHZDRHNj?=
 =?utf-8?B?SWt6TlJzeWc4M01aL3lFVXpTNVRZaUMrUnZnSFhwSDhKY2hhcmNiOVZneksx?=
 =?utf-8?B?SENXQlBxQjYyRllDNFJaZWd1NXNPT1V4czB6K21TU0QweEFYcks0ZHBnSXBh?=
 =?utf-8?B?aEk1RXVHRTN1SGcyVFNKWUhlOVF2OEI4K3FXTUlxS0JBYlRmVjlNZUo4akJS?=
 =?utf-8?B?TmtSaDRTN2NMVm0wNnZzUmxUMEhEdDRJZUp2eG14MEVrTHRjNVRxdElBWkRw?=
 =?utf-8?B?V3pnR2d2bE5VOEg4RW9mUFE5LzNpamRQaHZXaEpoWlRtNy9hVFhIdXIxZmlC?=
 =?utf-8?B?aHhxb0JXUlFuUS96R1RZRnVocXJZTTRWdmxkRCsxZUpUcUZMZVB3SG41clAy?=
 =?utf-8?B?RmFtbXp3MENIWWgzSXQ0S01xZVhoSGMvemRkUThYckxBSnd1aDJqeXdTaFFn?=
 =?utf-8?B?UVJ3Q2V3YnJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVBN1p1emwxYi9tNkNMejZmT0FmeTl5U2RKRVlhUDlHWnlKanR3cnVWQWdw?=
 =?utf-8?B?Nk9rd1VqZGI5cUlwdVQzcHVxbHFVZ28wNWtwQ3FBdmR1V29BL3VuMVhyT0Fo?=
 =?utf-8?B?WTh4N003Ync2eGREUDkvenVkN2t5V0lKa2FOOEpqN1BqVzNiWng2M2ZrWUNi?=
 =?utf-8?B?TTVmMFJtWnlCb3dkNnVhQTcxSkdSaDAxZkxhQkRicDYvVEZkdHNURS83cmEx?=
 =?utf-8?B?SGRnVzZWVUJ3enMvbzhFVUVSSjg0M1NzSkFOQk9pMHhpT1FDNjlEUHJ4YXJL?=
 =?utf-8?B?L0tnanQ4SkpzckpYVEdrWVJOZlcxWkZtdldDeXNET1JYMEZXU0QvelFycVVo?=
 =?utf-8?B?M0dmSGFmeGZnaWEreVBzdXpKMUo5Zy8zdkt4WFEvUmZEQ3dyY1cvcGF1YzFO?=
 =?utf-8?B?MXMrc2ZIK2J0ZThSYXBxQ3ZidXZPY3FsNnRrR2REcFdDcm5veVZqcFlBTmY0?=
 =?utf-8?B?ck1WNVB4dXZTc0xjMlNsV0FMTDVydTFxMGZ6cWdXWnFvb3JmdjEyd0FOWnAw?=
 =?utf-8?B?dngrR0FZUHI1Q293NG5jVGFlNktVbllxWE1KUzI1ZEZ3a2FhL1F5MCtLNGNy?=
 =?utf-8?B?ZVFSUkNISnFSbHUyKzRkeUM2NktJNW8vdkhkZmZXeDNjbDdrS2p5eStLa1Jl?=
 =?utf-8?B?dGZJc3B3ZlpBZUNGc3FqYy9jcXV4NmMwNmY5N0owdFc1djRJS1Z0Si9oemM4?=
 =?utf-8?B?TTkwRlF4WVJnd0NiajdtVy8vMjF6TzR0MXpTemovSEZTWW1vT2RTUmZ4U1RV?=
 =?utf-8?B?My93SkxjdC9DaUZnN01xcnVnOFBtR0k5SmtWRGpZK0hNMUNHcFVSWHpkN0pZ?=
 =?utf-8?B?eERrMFFxSGJCZ2NxcXJQQlMyZ1FPNlBNa25aK1ErYzN5NjFmWWExcG9qNkZ0?=
 =?utf-8?B?T3hBZHRVMVRkQlZsN25PaG1YNDcrUjN3Mm11UWN1Nlo5U0FiL3BaNXZ3K21X?=
 =?utf-8?B?Ny9yZnkwRUtkaUFtYmxoYW9TTzZpLzhBQVpQRnpiRkw5NVZyK3JKK05pZE4z?=
 =?utf-8?B?bjRwczRHbGF1b0RDU09OR2syazlnUnZIQTVqcjNiQ1BpVmwyaEJ3Wk1ad200?=
 =?utf-8?B?b3J2ZXZSaFR1Qk5EOUdEcWhJcHJGcjVEelR6a21FOTcyUnplWkNZUTZkb3FB?=
 =?utf-8?B?R3ZzR05ZWkluaEtlSEtNa3JVVkl4TzhQQ1l0OWFKMnJoTmdEM05OalBPb3lL?=
 =?utf-8?B?VmtJS1l5anUxVjEzRDdjMkZacUxxYTA4ak5IaHEzTGk3bWRmSGdIOElPWGF3?=
 =?utf-8?B?VXVCUkZqUkJHbFU4SmpLRXdtTTRwY0FpdkRpbkJaNEtmVUhFR1pqL1RGS1R6?=
 =?utf-8?B?ZzY5TVIxRTBISmxMK0E5U1VaY2x3OG96djhpTkY0TmZBbmNjNDcvOWljWlFS?=
 =?utf-8?B?b3FiamNRNEJMazRxNWh1VGd4WVlUN2tDSUpzWlBYTkRNNWQ2S0hQS2lOeVlv?=
 =?utf-8?B?VHdETDVYSFNlWVp5NTNBRlVvN0VDZDRxRVVTcjBDcWNMeEsrRTU0OXBhVUUv?=
 =?utf-8?B?d2pLdXk0ejJSbkFEKzhOUTFVZjlLdUw0dU5YNjlMSTdMc3ZFa0Y2d20ycFRJ?=
 =?utf-8?B?TUlpcnJkaVpRU0o5R214WTQzWHNHQ3BoN3drSEFKcmNpV2p4RG1PRFltU1JL?=
 =?utf-8?B?NHNjeDRPZVMwZi9XNWlObEwzamZkVjZiOUx0aXJBanJHUnFtbm1MVURUQjJV?=
 =?utf-8?B?MlNXUG1vc3pZOUdLU0t1dk9VeGR4eXoxMFk1TmViQjAyMjJKVjJOY3doc3My?=
 =?utf-8?B?UTNYTi9PTlB6czVUVzBad1l5UUVRWi9GNnVQZm9GNTl2Sm9CTGEwK3ExKy9h?=
 =?utf-8?B?MzhiUlNhRlZEY1UydUw5YkdvVUVqSkdwOTBpaDc0MFBGYzRpdm5sTEhKcUFL?=
 =?utf-8?B?dkxRRUdKdWFDYW9kTHBqQmRFV09WVklOS0EwVy9iV212MGJlbUJaN1o0TWUr?=
 =?utf-8?B?UGx0czRWUFVjVDV4OWRZdjgxNlZsNDZIL2I5MmZZWGM2VlhBMThBWFYxelE1?=
 =?utf-8?B?cndsNmtObWpsaXdqWmVVaDN0d3N5RGVFOUJwMlVKUUszazMydDhwaTYxK05R?=
 =?utf-8?B?bVR5a1FlZGJsRVdZNEJTVkluZzh0d0l1RC9rSUxOcUFsZWZaL1NKc0lLZHdN?=
 =?utf-8?B?SDZEWUNNM1FuQk56S2ZuWithSVhYSHpCWUlEN0l1MkZvdnhBR2d3SStvZ2JR?=
 =?utf-8?Q?8IxaoRxbsFZ/LtIoqYzwAhUT8FUIIOt2Rze0mcPXFLOS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb80146b-c2eb-420b-51e2-08dde4562d32
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:08:13.4259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJqvm+R/ioRbh0PcKwSK1VHYZHXCli30jMJKuwovXA5dRCEyTfV7I3RLcfFP/JX/KXj1HOeWKMkDXn8LyTGDpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

From: Alistair Popple <apopple@nvidia.com>

Interacting with the GSP currently requires using definitions from C
header files. Rust definitions for the types needed for Nova core will
be generated using the Rust bindgen tool. This patch adds the base
module to allow inclusion of the generated bindings. The generated
bindings themselves are added by subsequent patches when they are first
used.

Currently we only intend to support a single firmware version, 570.144,
with these bindings. Longer term we intend to move to a more stable GSP
interface that isn't tied to specific firmware versions.

[acourbot@nvidia.com: adapt the bindings module comment a bit.]

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs              |  1 +
 drivers/gpu/nova-core/nvfw.rs                   |  3 +++
 drivers/gpu/nova-core/nvfw/r570_144.rs          | 29 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nvfw/r570_144_bindings.rs |  1 +
 4 files changed, 34 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index fffcaee2249fe6cd7f55a7291c1e44be42e791d9..db197498b0b7b1ff9234ef6645a4ea5ff44bd285 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,6 +10,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod nvfw;
 mod regs;
 mod util;
 mod vbios;
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
new file mode 100644
index 0000000000000000000000000000000000000000..7c5baccc34a2387c30e51f93d3ae039b14b6b83a
--- /dev/null
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+
+mod r570_144;
diff --git a/drivers/gpu/nova-core/nvfw/r570_144.rs b/drivers/gpu/nova-core/nvfw/r570_144.rs
new file mode 100644
index 0000000000000000000000000000000000000000..2e7bba80fa8b9c5fcb4e26887825d2cca3f7b6b7
--- /dev/null
+++ b/drivers/gpu/nova-core/nvfw/r570_144.rs
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Firmware bindings.
+//!
+//! Imports the generated bindings by `bindgen`.
+//!
+//! This module may not be directly used. Please abstract or re-export the needed symbols in the
+//! parent module instead.
+
+#![cfg_attr(test, allow(deref_nullptr))]
+#![cfg_attr(test, allow(unaligned_references))]
+#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
+#![allow(
+    dead_code,
+    unused_imports,
+    clippy::all,
+    clippy::undocumented_unsafe_blocks,
+    clippy::ptr_as_ptr,
+    clippy::ref_as_ptr,
+    missing_docs,
+    non_camel_case_types,
+    non_upper_case_globals,
+    non_snake_case,
+    improper_ctypes,
+    unreachable_pub,
+    unsafe_op_in_unsafe_fn
+)]
+use kernel::ffi;
+include!("r570_144_bindings.rs");
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cec5940325151e407aa90128a35cb683afd436d7
--- /dev/null
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -0,0 +1 @@
+// SPDX-License-Identifier: GPL-2.0

-- 
2.50.1

