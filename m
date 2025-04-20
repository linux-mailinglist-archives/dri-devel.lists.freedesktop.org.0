Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59DFA947C2
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC1AF10E310;
	Sun, 20 Apr 2025 12:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZN5nFo5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C942210E2FC;
 Sun, 20 Apr 2025 12:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSoB4StNdYj386GKxEmLQ8f7g2JPLpgxrmua/XvKT6kYqwkWSwZjLhZS9IQ+nSZ8SYGszAN3RukBWE9BHfSVFnRAOy39pS1Bnpi0BTFO6uNqS2EDoKiHrrXqTPSy/qa49V90o0Xf/HK0exB8yKHFD4MRhMedNsNApGSbS0fNjhmbhGNB1X6bT94PjfGjJo733zFhh93yUoEIfGLn8ewhJJg/NwVUhDLeQLdz69jeKHlm8gDr8NK0r/GAY1SzkRSy2DsKnMqIi7/mXmt8cgWnW/7dMXZp4CSM7zZ0Nt9DLcGkHtGsZqwj86T9hZMGY+5rXxcAG+Ae+cUG+HCf6j2PIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hN88YFcCx31BSE/TsxSIP/6L65x6qlW15t23yO2gZ1k=;
 b=kZ2mHjdaEsRgLPzj2Jc+dpwwQ5rVcmvHVmCn2bOA7iezXaYCcVzISjtdHrFp5CJFVZPGW9NBUbur9ax+vzt4Al9qGa4ce+Ya0gDbOAKgZH5vYhBvNG23RoLcwLzxawkWBACFu2FDV9O38NNk52h5kRH2uNyX9VYKm/FCiR24I0v4Drpr5VNHh2T2PwTeI2TFMxg/4jiWj9lIG58P+9dcjUIVKaV39zNA/vfiOkzTtDDyjKToE7u01lH8dwR0G0GKDNY6dNKzI87e5mwsNs7kAl+/nlckXmPGzxLe/q9i+Vj3M2urzFUTtedS7AqbYLrvsRfKc4UaqmwiIMqTvgjS+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hN88YFcCx31BSE/TsxSIP/6L65x6qlW15t23yO2gZ1k=;
 b=ZN5nFo5/BY9XVmykvr/KJ5zTGZu41I+WEeSTQME8boKZOnPZufdc9M6STz16qb091Retd9uKekujOkjhvu3Coe/BALp/qlZOxKfepcXClGob1nfEqLzh+3csDQdX0Mc/367QiCIhGuw5TEFl45+v7sAL+zMbzcUEykpGIXIh3OEpvrcN0GhreFNU2IjLS2TH6cep/emDSz6wIoKMYVDWRsF8+3+MFKazqrXwsAoXenHBzk/WyqMgBS/xIu5s3loqNM8MtmPqMOiTi7fqY1EbqCpVgkG8LTQnPc9opsXOmXXtuq1TQbzewyhoKEiBJ8tDBgPJ7hEsOdoVrf6by/NXKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:47 +0900
Subject: [PATCH 15/16] gpu: nova-core: extract FWSEC from BIOS and patch it
 to run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-15-ecd1cca23963@nvidia.com>
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
X-ClientProxiedBy: OS3P286CA0088.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f6::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e86d1d3-beba-4281-1d69-08dd8005c52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M3Z0N0RwcnBrZ1RCK0VWZjQ1SUVJbi9UV3h2aGpMSnVqOXVQcmJQRGU3V3ZQ?=
 =?utf-8?B?MGN5T1RmUkl0dUMvWXptL3ZrVk1DNzA2aVEycnk3M3NNL2p1YTR6aVZuaXhi?=
 =?utf-8?B?R1JTZkJNZFVvUmdzSUxRT3duTis3M2trQ2pMV200elRrNDJ4Vko4ZmZHUEt3?=
 =?utf-8?B?akFCQ29IaGduNFhOL0RnM3VhNGFZMjlYZTNrOFo1dTRpTWZ4dWJnU0dPUHRQ?=
 =?utf-8?B?WFd6VmY2Vy90Mmxpa1JKWllmQXRoVmxhbmhHUHpmMEV0ZW5PNnZHTEIxbmdE?=
 =?utf-8?B?ZzN2bWxRVHhuLzBwRmhiUVlnZ3pYNFpLRzRHZVU4UzNCaFdQYWNReXd6L21K?=
 =?utf-8?B?Ym4xMHUwSEdLYklmeDVJcU5zc1hUYmlFZ2hORHNyYVgxMmRHckt2dnFoaXRU?=
 =?utf-8?B?QjZyU1g5TTg2UVczOVJ0c3IreWJuMi90Nm9WV1lOWVljcHFqUmcveUgzd29G?=
 =?utf-8?B?dG5GTmRCMTh0V29idzVuUXFFbzZWNXZJSmwxTDk1MFlRVEswQmg0RmtNdVc2?=
 =?utf-8?B?aXJDZG5aWjNDYm45WFFWczlzMHM1YmJrTm5yc21QQTY4d3lBZFR3Tk40TVAv?=
 =?utf-8?B?K3R1Sm1UYzFJQ0hjWWdiQjdzam9KU00rRDY4ZWRsTXFFbjArcTZHWjZ3UDBV?=
 =?utf-8?B?MkJVdEpDQVhvaXcrQ1pmRjlkNFJvNGxDanpVeFIxdjYzZGl0QXNIblJqbXY4?=
 =?utf-8?B?NXFQbmFzK3RuS0k3SFFVSFh6UUhDa1lENEhjcmpPZFdqQUJQeG1tbjVrVmUz?=
 =?utf-8?B?Q2JzZHJ3aUE4eGc0dXUxd0pxcmkyMmRweDlhVnFSK2Z3T3ZzV21TSkhxVS9B?=
 =?utf-8?B?cW5kZjBTK2dIemdCejlzM0dzNGd6alhsdXRaVHRCNXplVE9SODVOZjJGL215?=
 =?utf-8?B?TVlvRGNnVk82L0dhbElvL2pxQWxoUHpGS05oSlFkNk5VTE9zUUpzZlVjNU4x?=
 =?utf-8?B?UlA2QzhjeGxGWDZCUklldkVDZ3IrSDZRRWljYzZ0UVdyM0k3cm5Qb2RBOXZI?=
 =?utf-8?B?cTA0QjB5ZnNsb2RObUtBTDZ6SVF6OHdubmRzTWovQXk1Q2ovdm1OZ0hYYWJu?=
 =?utf-8?B?akxNZ3Y2MTA5Tys1Yk9KbUc4S3JWbW9nZWJ5NGtvTFdzYzVubjNDNTFuMldT?=
 =?utf-8?B?UE5KT0cxOVRQMEJiU0RXTnJMZlRaQmVQQUUrMjRTWGJjcDFvYjUrMzZPbjJE?=
 =?utf-8?B?TjFVL3dNY01abWNVajhyWCtXSG1Ta0pIVnVmRGhteWZ2ZTRtZkV2cWNzaG81?=
 =?utf-8?B?Z202cmhScFVRY2dYeDRhNjNQbG5PTUp6dU51Mjc5MndSMXAyUm5PZkRFcjRx?=
 =?utf-8?B?WEgzcktPUVJsSWRrUjVmaVlGcDFlWllZMEdmNXVWalZRRE9ZUDNXMTY0T1ky?=
 =?utf-8?B?T3BJUUpwMEhocGM2bHdpd3F3UEE5UkNQb001d3lhOVQ2K3dpZW1kdDA3MUZU?=
 =?utf-8?B?MWxlOGxwMjVrSE0yeFAxM2ZlOTlIMm01Y0t2WXNLcDcranlrdWhNekFHK1dG?=
 =?utf-8?B?NWxydVFmNCtSbEFOemRYV25uNHE5SUZubVNGaU8yUWhHOHlFZWg2SkNYak05?=
 =?utf-8?B?eStvbU42Z2RSRDI0bWNkdHM1cTVocjl1VGZQWUJ6MUx4ckdBaHV1WWlpZlUx?=
 =?utf-8?B?bldTazRrZHBpeWQ0c0hKWmhaQ21aRmpHYWVyaDNUT3d2ZnMrRFJMM1RNQ1No?=
 =?utf-8?B?Rmw5TlpIZFRadi9lbk1BSGJTU3ZxK3l4ZXlrUlFLTTI1YzR1SCtWK3NIVGtB?=
 =?utf-8?B?MXphblBUS3NWUWpNRDEyTlRvakJqVlFuSEtPRzZtdnRTdU1Yb0FibkJNcWxp?=
 =?utf-8?B?Y3VRY2VBUHZiWnhESFB5SHBMRXJ4OUlqblFVbEZ4TSthRE1pVktPZU1kc041?=
 =?utf-8?B?OUFVMWM4YjdLUTZrYzFQYnY1NjVXQnhyeFpxUTJVY2l3Qm9CMXlzN2ppV2RV?=
 =?utf-8?B?Vzh4cnBLNDdWdDNrQVhQdnhrT0laSXNBWG1yZC9vMUNqbXM0elhxTXlKcDdL?=
 =?utf-8?B?L250UVNWM1d3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjJLLzJwY29UblV0TGVrU3lRVGY1ZldJc3QrSGQ5RGtCWnY2R3pSclVDQktz?=
 =?utf-8?B?YUNTTlNoYlpTemlFeTZWam1BOWpJYThzZmk4a3FsMTdBbVozSnpKdks3MWdK?=
 =?utf-8?B?cEVHN3Q2bGdNb3dud2FBb1cxQjZKazJ5Y3RhZUV1WURkM01IeXNORGtFaTZ6?=
 =?utf-8?B?OG9WVTFyRGZ2VzhtYUlVbjFWMXMzN2xTUTY5OUZOcm5LeDNqa1IzcEQ2R0FS?=
 =?utf-8?B?UWpSVmtESGdtOHNHOFU1bm41YXRWaHk0dlRTZWRlTXhvb3UyM2pkVCtseGc1?=
 =?utf-8?B?UmJqbXBTNks5bU41bWlkWWFRdVVFdGlHb09NQXQvNEFHSzJsTUNGOHpRWXZ4?=
 =?utf-8?B?MmwwNDFqNmdUMGU3dFZlMURGQlBlY0ZQUncxR2tuaGVoRENTV0pKQzltWXNx?=
 =?utf-8?B?dERPYjhDcnNDdnRwNWZHdzdHWC85UXRDd0dIcE1IeVZVQUo2Y2dLSGRWQnpr?=
 =?utf-8?B?YmZuTmR2NFNCQTQ2N3RKRXVBQmJpbEtoR1pleXdhSDI3Ui9GSkVqT3Q1bHFm?=
 =?utf-8?B?Z081am9aNmgyaElCcTBNVjlGQXhFNHNyYVBydEkwRkN5NTlXK0ZwNVF3N2ty?=
 =?utf-8?B?WkIwZTErR01pVm5uUFlSNko4VHU4NmYzdTg0MzUwV2NJblRTVnBkY1hsa2sx?=
 =?utf-8?B?Vk00cEJSd1I3czNMNXZkZkNvUnZqTjB1RnkxUXlhYmNhUTVyOXY3ZmtreEtm?=
 =?utf-8?B?QnlwZXdxQkU0dDNjOU10K0Z1V3JERmVJRGU0K3Bva0s1NFFmbmVLV1pDaUJm?=
 =?utf-8?B?bzdIdUdBMSsremNZOWlmeXN5aGZ5YXcrNXZFY20vbkZ0K2ZEYXR4QjMrd2px?=
 =?utf-8?B?TEs4azZ5dVVWT0RQdGRtZHRhaVB5OUpzZjZ2VTB6ckRhbDZuOEFWc0tCMFdD?=
 =?utf-8?B?cy9PRmY1ekpCYWw1WWtGSWhSQy9LTzA4MHF0eXhsZ2UxZExyUFd5R0l3OUVL?=
 =?utf-8?B?Y2FVNGVNSE9aYVBWM0FIQUpNU2pRN3JlQnFuSmxKbk5DSDJIU1cyMWJLOXUy?=
 =?utf-8?B?c0FzNWE4bEREWmR5RGVBWklaUmIydUQwbUJ1b3hYOG40Wm9PQnpTek1oY3dx?=
 =?utf-8?B?eXpPUllVK1I3MXh3cFRYZ1FudXJWbDhJQlh2UTBSenRFR0VOVTluYkpCT2tE?=
 =?utf-8?B?VkhWcnBjNjNka21OYTBNY1AyMjlnQ3EvTlQvMGl1NlNkS2JUNlQ2cXpiV1ZJ?=
 =?utf-8?B?VTE0TklYeXRhclJDUk9KMTc2L2xobkVYbWpITERxN1VmMm1xcmcrcGUzbTdR?=
 =?utf-8?B?T2hCTTZZVkZ6NmFIT2F0cno1Y1JjU0N1UXp3VFVlb2ZuZFlyaXAzNlg5aFI2?=
 =?utf-8?B?d2FBUHJVYU5SbG1qbHVmQ3Z2SVExUjNBQ0VHdGpCeWJiSDdkdElvRzlCeC9G?=
 =?utf-8?B?SU5LQ24vcVhUa2w5K2x6MURHU2R0N09xM3BSN3lQSjBNdmRFZzIwL0J5Ukpy?=
 =?utf-8?B?NHM0a2J1RSs1ZTVpaDRRdHlhTWFjNFdFRFFaVkRUL3ljVmZTWlJuR3EyNlRZ?=
 =?utf-8?B?K05wN0N1S2VmcjRrbzNkZGJ5QmlqUUZEc0w5aURCZ21LOWR5OVNsc2xsREVu?=
 =?utf-8?B?aitOb1pLL1JqRjZFMWRCNlc0bisxRStTekRpZmxrVHVIUGZNdWdnV2M5dENl?=
 =?utf-8?B?SE1zZWFsQ2FHU2t0ZHlDWW5ucXVrZE41eEF3S3dlbXlvZkNTSXFQcjRXc29N?=
 =?utf-8?B?QzR4OU9NaW9acU9oR2UyV0xiYjQvK1Z5NHZ2TGdaMWZhOTF4cUIyRkloYjEz?=
 =?utf-8?B?eDdidkJPMExGazFJMG1vdXJiemNXRlZENktpVitjZndOYU5CZCt3ZmxHZjl0?=
 =?utf-8?B?SG81blpKblBYanZEOS9yUForZ3FMcU5iZ1NLL2NQeTMwWXZsQnZhc2EvMzlx?=
 =?utf-8?B?S0E4RXdBN2IvUVl3UDlCc1YzaFpCSFFIOEx6MEtNY1IyVExyT2pFYWFnRkI0?=
 =?utf-8?B?TWVqWlM2RXRpbnk0aGlBa3piSmkrZWtjR3BXeDdkeWZlekVLcjF2TzRTQzI5?=
 =?utf-8?B?SjFlQWJlN1NnTUtvRmJvMm82Z0RtQTRMcU5VMEdzcDc4bXMrbFV5WXJiZ3U0?=
 =?utf-8?B?T0tDcGtVU2dNbVRyYm9xcXB1QjYvUjJ1alZmYXlSOWh6UWFGcW1scUpCUUdO?=
 =?utf-8?B?Skk4ZzUwZVd4OXBIVEhFZi9tMktNeXVha1BUOGJJcS9hMXpLanc5cWlZNE5B?=
 =?utf-8?Q?Cn8EItmasnt0aeHg8qimE3KsqoeaV529Jg0fXihjBwLs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e86d1d3-beba-4281-1d69-08dd8005c52b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:43.0318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ELx6rgJoeYia++3n/enmGms0MRtrNURBl5kmQZ7DvE1Q+cyty/uffUvD89cf2IDUadTc6FYAL1Gwl778ErIBog==
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

The FWSEC firmware needs to be extracted from the VBIOS and patched with
the desired command, as well as the right signature. Do this so we are
ready to load and run this firmware into the GSP falcon and create the
FRTS region.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       |  22 ++-
 drivers/gpu/nova-core/firmware/fwsec.rs | 340 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs            |  18 +-
 3 files changed, 378 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 58c0513d49e9a0cef36917c8e2b25c414f6fc596..010763afdd74e92a4380d739a17319e05781007f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -8,9 +8,14 @@
 use kernel::prelude::*;
 use kernel::str::CString;
 
+use crate::dma::DmaObject;
 use crate::gpu;
 use crate::gpu::Chipset;
 
+pub(crate) mod fwsec;
+
+pub(crate) const FIRMWARE_VERSION: &'static str = "535.113.01";
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -69,10 +74,25 @@ pub(crate) fn size(&self) -> usize {
     }
 }
 
+/// Patch the `ucode_dma` firmware at offset `sig_base_img` with `signature`.
+fn patch_signature(ucode_dma: &mut DmaObject, signature: &[u8], sig_base_img: usize) -> Result<()> {
+    if sig_base_img + signature.len() > ucode_dma.len {
+        return Err(ERANGE);
+    }
+
+    // SAFETY: we are the only user of this object, so there cannot be any race.
+    let dst = unsafe { ucode_dma.dma.start_ptr_mut().offset(sig_base_img as isize) };
+
+    // SAFETY: `signature` and `dst` are valid, properly aligned, and do not overlap.
+    unsafe { core::ptr::copy_nonoverlapping(signature.as_ptr(), dst, signature.len()) };
+
+    Ok(())
+}
+
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
-    const VERSION: &'static str = "535.113.01";
+    const VERSION: &'static str = FIRMWARE_VERSION;
 
     const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
         ModInfoBuilder(
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
new file mode 100644
index 0000000000000000000000000000000000000000..664319d1d31c9727bb830100641c53b5d914be5a
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -0,0 +1,340 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FWSEC is a High Secure firmware that is extracted from the BIOS and performs the first step of
+//! the GSP startup by creating the WPR2 memory region and copying critical areas of the VBIOS into
+//! it after authenticating them, ensuring they haven't been tampered with. It runs on the GSP
+//! falcon.
+//!
+//! Before being run, it needs to be patched in two areas:
+//!
+//! - The command to be run, as this firmware can perform several tasks ;
+//! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
+
+use core::alloc::Layout;
+
+use kernel::bindings;
+use kernel::device::{self, Device};
+use kernel::devres::Devres;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::driver::Bar0;
+use crate::falcon::gsp::Gsp;
+use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadTarget};
+use crate::firmware::FalconUCodeDescV3;
+use crate::vbios::Vbios;
+
+const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
+
+#[repr(C)]
+#[derive(Debug)]
+struct FalconAppifHdrV1 {
+    ver: u8,
+    hdr: u8,
+    len: u8,
+    cnt: u8,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifHdrV1 {}
+
+#[repr(C, packed)]
+#[derive(Debug)]
+struct FalconAppifV1 {
+    id: u32,
+    dmem_base: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifV1 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FalconAppifDmemmapperV3 {
+    signature: u32,
+    version: u16,
+    size: u16,
+    cmd_in_buffer_offset: u32,
+    cmd_in_buffer_size: u32,
+    cmd_out_buffer_offset: u32,
+    cmd_out_buffer_size: u32,
+    nvf_img_data_buffer_offset: u32,
+    nvf_img_data_buffer_size: u32,
+    printf_buffer_hdr: u32,
+    ucode_build_time_stamp: u32,
+    ucode_signature: u32,
+    init_cmd: u32,
+    ucode_feature: u32,
+    ucode_cmd_mask0: u32,
+    ucode_cmd_mask1: u32,
+    multi_tgt_tbl: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct ReadVbios {
+    ver: u32,
+    hdr: u32,
+    addr: u64,
+    size: u32,
+    flags: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for ReadVbios {}
+
+#[derive(Debug)]
+#[repr(C, packed)]
+struct FrtsRegion {
+    ver: u32,
+    hdr: u32,
+    addr: u32,
+    size: u32,
+    ftype: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsRegion {}
+
+const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
+
+#[repr(C, packed)]
+struct FrtsCmd {
+    read_vbios: ReadVbios,
+    frts_region: FrtsRegion,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for FrtsCmd {}
+
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
+const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
+
+/// Command for the [`FwsecFirmware`] to execute.
+pub(crate) enum FwsecCommand {
+    /// Asks [`FwsecFirmware`] to carve out the WPR2 area and place a verified copy of the VBIOS
+    /// image into it.
+    Frts { frts_addr: u64, frts_size: u64 },
+    /// Asks [`FwsecFirmware`] to load pre-OS apps on the PMU.
+    #[allow(dead_code)]
+    Sb,
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as an instance of `T` (which must implement
+/// [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not written for as long as the
+/// returned reference is alive.
+unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a DmaObject,
+    offset: usize,
+) -> Result<&'b T> {
+    if offset + core::mem::size_of::<T>() > fw.len {
+        return Err(ERANGE);
+    }
+    if (fw.dma.start_ptr() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &*(fw.dma.start_ptr().offset(offset as isize) as *const T) })
+}
+
+/// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
+/// implement [`FromBytes`]) and return a reference to it.
+///
+/// # Safety
+///
+/// Callers must ensure that the region of memory returned is not read or written for as long as
+/// the returned reference is alive.
+unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
+    fw: &'a mut DmaObject,
+    offset: usize,
+) -> Result<&'b mut T> {
+    if offset + core::mem::size_of::<T>() > fw.len {
+        return Err(ERANGE);
+    }
+    if (fw.dma.start_ptr_mut() as usize + offset) % core::mem::align_of::<T>() != 0 {
+        return Err(EINVAL);
+    }
+
+    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
+    // large enough the contains an instance of `T`, which implements `FromBytes`.
+    Ok(unsafe { &mut *(fw.dma.start_ptr_mut().offset(offset as isize) as *mut T) })
+}
+
+/// Patch the Fwsec firmware image in `fw` to run the command `cmd`.
+fn patch_command(fw: &mut DmaObject, v3_desc: &FalconUCodeDescV3, cmd: FwsecCommand) -> Result<()> {
+    let hdr_offset = (v3_desc.imem_load_size + v3_desc.interface_offset) as usize;
+    let hdr: &FalconAppifHdrV1 = unsafe { transmute(fw, hdr_offset) }?;
+
+    if hdr.ver != 1 {
+        return Err(EINVAL);
+    }
+
+    // Find the DMEM mapper section in the firmware.
+    for i in 0..hdr.cnt as usize {
+        let app: &FalconAppifV1 =
+            unsafe { transmute(fw, hdr_offset + hdr.hdr as usize + i * hdr.len as usize) }?;
+
+        if app.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER {
+            continue;
+        }
+
+        let dmem_mapper: &mut FalconAppifDmemmapperV3 =
+            unsafe { transmute_mut(fw, (v3_desc.imem_load_size + app.dmem_base) as usize) }?;
+
+        let frts_cmd: &mut FrtsCmd = unsafe {
+            transmute_mut(
+                fw,
+                (v3_desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+            )
+        }?;
+
+        frts_cmd.read_vbios = ReadVbios {
+            ver: 1,
+            hdr: core::mem::size_of::<ReadVbios>() as u32,
+            addr: 0,
+            size: 0,
+            flags: 2,
+        };
+
+        dmem_mapper.init_cmd = match cmd {
+            FwsecCommand::Frts {
+                frts_addr,
+                frts_size,
+            } => {
+                frts_cmd.frts_region = FrtsRegion {
+                    ver: 1,
+                    hdr: core::mem::size_of::<FrtsRegion>() as u32,
+                    addr: (frts_addr >> 12) as u32,
+                    size: (frts_size >> 12) as u32,
+                    ftype: NVFW_FRTS_CMD_REGION_TYPE_FB,
+                };
+
+                NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS
+            }
+            FwsecCommand::Sb => NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB,
+        };
+
+        // Return early as we found and patched the DMEMMAPPER region.
+        return Ok(());
+    }
+
+    Err(ENOTSUPP)
+}
+
+/// Firmware extracted from the VBIOS and responsible for e.g. carving out the WPR2 region as the
+/// first step of the GSP bootflow.
+pub(crate) struct FwsecFirmware {
+    desc: FalconUCodeDescV3,
+    ucode: DmaObject,
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
+
+    fn dma_handle(&self) -> bindings::dma_addr_t {
+        self.ucode.dma.dma_handle()
+    }
+
+    fn imem_load(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: 0,
+            dst_start: self.desc.imem_phys_base,
+            len: self.desc.imem_load_size,
+        }
+    }
+
+    fn dmem_load(&self) -> FalconLoadTarget {
+        FalconLoadTarget {
+            src_start: self.desc.imem_load_size,
+            dst_start: self.desc.dmem_phys_base,
+            len: Layout::from_size_align(self.desc.dmem_load_size as usize, 256)
+                // Cannot panic, as 256 is non-zero and a power of 2.
+                .unwrap()
+                .pad_to_align()
+                .size() as u32,
+        }
+    }
+
+    fn brom_params(&self) -> FalconBromParams {
+        FalconBromParams {
+            pkc_data_offset: self.desc.pkc_data_offset,
+            engine_id_mask: self.desc.engine_id_mask,
+            ucode_id: self.desc.ucode_id,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        0
+    }
+}
+
+impl FwsecFirmware {
+    /// Extract the Fwsec firmware from `bios` and patch it to run with the `cmd` command.
+    pub(crate) fn new(
+        falcon: &Falcon<Gsp>,
+        pdev: &Device<device::Bound>,
+        bar: &Devres<Bar0>,
+        bios: &Vbios,
+        cmd: FwsecCommand,
+    ) -> Result<Self> {
+        let v3_desc = bios.fwsec_header()?;
+        let ucode = bios.fwsec_ucode()?;
+
+        let mut ucode_dma = DmaObject::from_data(pdev, ucode, "fwsec-frts")?;
+        patch_command(&mut ucode_dma, v3_desc, cmd)?;
+
+        const SIG_SIZE: usize = 96 * 4;
+        let signatures = bios.fwsec_sigs()?;
+        let sig_base_img = (v3_desc.imem_load_size + v3_desc.pkc_data_offset) as usize;
+
+        if v3_desc.signature_count != 0 {
+            // Patch signature.
+            let mut sig_fuse_version = v3_desc.signature_versions as u32;
+            pr_debug!("sig_fuse_version: {}\n", sig_fuse_version);
+            let reg_fuse_version = falcon.hal.get_signature_reg_fuse_version(
+                bar,
+                v3_desc.engine_id_mask,
+                v3_desc.ucode_id,
+            )?;
+            let idx = {
+                let mut reg_fuse_version = 1 << reg_fuse_version;
+                pr_debug!("reg_fuse_version: {:#x}\n", reg_fuse_version);
+                if (reg_fuse_version & sig_fuse_version) == 0 {
+                    pr_warn!(
+                        "no matching signature: {:#x} {:#x}\n",
+                        reg_fuse_version,
+                        v3_desc.signature_versions
+                    );
+                    return Err(EINVAL);
+                }
+
+                let mut idx = 0;
+                while (reg_fuse_version & sig_fuse_version & 1) == 0 {
+                    idx += sig_fuse_version & 1;
+                    reg_fuse_version >>= 1;
+                    sig_fuse_version >>= 1;
+
+                    if reg_fuse_version == 0 || sig_fuse_version == 0 {
+                        return Err(EINVAL);
+                    }
+                }
+
+                idx
+            };
+
+            pr_debug!("patching signature with idx {}\n", idx);
+            let signature_start = idx as usize * SIG_SIZE;
+            let signature = &signatures[signature_start..signature_start + SIG_SIZE];
+            super::patch_signature(&mut ucode_dma, signature, sig_base_img)?;
+        }
+
+        Ok(FwsecFirmware {
+            desc: v3_desc.clone(),
+            ucode: ucode_dma,
+        })
+    }
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index b43d1fc6bba15ffd76d564eccdb9e2afe239a3a4..5d15a99f8d1eec3c2e1f6d119eb521361733c709 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -7,6 +7,7 @@
 use crate::driver::Bar0;
 use crate::falcon::gsp::GspFalcon;
 use crate::falcon::sec2::Sec2Falcon;
+use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
 use crate::firmware::Firmware;
 use crate::gsp::fb::FbLayout;
 use crate::regs;
@@ -185,7 +186,11 @@ pub(crate) fn new(
         bar: Devres<Bar0>,
     ) -> Result<impl PinInit<Self>> {
         let spec = Spec::new(&bar)?;
-        let fw = Firmware::new(pdev.as_ref(), spec.chipset, "535.113.01")?;
+        let fw = Firmware::new(
+            pdev.as_ref(),
+            spec.chipset,
+            crate::firmware::FIRMWARE_VERSION,
+        )?;
 
         dev_info!(
             pdev.as_ref(),
@@ -245,6 +250,17 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, &bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
+        let _fwsec_frts = FwsecFirmware::new(
+            &gsp_falcon,
+            pdev.as_ref(),
+            &bar,
+            &bios,
+            FwsecCommand::Frts {
+                frts_addr: fb_layout.frts.start,
+                frts_size: fb_layout.frts.end - fb_layout.frts.start,
+            },
+        )?;
+
         Ok(pin_init!(Self {
             spec,
             bar,

-- 
2.49.0

