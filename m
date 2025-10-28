Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8AC175EB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534B810E6B7;
	Tue, 28 Oct 2025 23:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QYH1MElZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011038.outbound.protection.outlook.com [40.107.208.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3081910E6B7;
 Tue, 28 Oct 2025 23:31:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cpffBK87gRp2YgGAl6wC9D1i/xUz+++aYPx1GrL7a7K7OG7IiH9MIXLnAzvgkEs7+j+KZVvMKRXiE+x7AbwQyce6z5ORoynhXqlDOEsTWJbR3Yf9go5sEF63qfnyrVcg0sf6ME3gDG7RYqy7WJSJfI7km5WlEDrnn8C78zw23KykjE92vY5wEO+QQXcJdelo75q8cEiaT6ewyLr2cvLWnFJs9rpiClger8ak+Wzdp5fCfwYHyncJG5yFSZvj5VVNFpcV+i6WPLVb0iFASs+3LKxeaisR6uhZKG3Cvix1m0FtZ5RJ3hjUvyNXihJ56JTBJ965fXoWg+8H4IebliyS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVRfQqst/nbEu0/EdceJkHJFVe31Xi4p4BeIzgFKZ4o=;
 b=HVCHCcmx01akwlFzkbZ/JlLobKR9ynkQgZ2Lb9izPCWrHHeXkBkOKsFE72vCEvy2vIHafAcy0xY0pjp7QiSblCcLM6Yzife16WjuhfgvhotN//gQybMPRIxlbukWX6zejGk1R/Ovi+LFl/DI7Ap43yIiT0frAmvA1nFinCOKKc0OdaE6w8M354mSzkqOJpKq9g0QHk9HG87lCZeptTmNcPJfsE/49abgS0gBg4BZ1e5XlAX+ONDu9mH1Uswxtyw4uq1E8KD2xRFb/guubiga/OqRHbbmvXqjmx1hUhw7Fx7qCspCC5u3EnBsk2ZmSNNwyS33CGKoB7eMmoM9O0l/iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVRfQqst/nbEu0/EdceJkHJFVe31Xi4p4BeIzgFKZ4o=;
 b=QYH1MElZA7uXzGGK6c3K+lkD+SrGM9DQEoH6hdAelvB1H1+RI0HQsxsnvGO1umamQEyFSheNOwDbNlyzxvhAJNgNC8laCpg6SiwuOtLsePTYexIVaKZlxfRO5GrGt3SXXIlQoK8Y+pcKMge3gH2la8+VFzdSDVeXDgKx6QGzY4bP4DFe0JQeUfweIuQzbk6I95y6OP7QLyWeglJwjR8bHYIZ5shRdGyN6d6hE+uNaE+CAHVD1OznE1eYkq9VkyRcIA+QeOQzVXQu0NG6NtwrKQFaUyYhLZ3xlV4u2MpKZE7VSjRobIL+83uOYeYRLWB3VZdw1/gTEL6oo4PBaWStjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 23:31:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:31:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Oct 2025 08:31:41 +0900
Message-Id: <DDUCIDB7E861.3FJ7OM506MTJ6@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/6] gpu: nova-core: replace `as` with `from`
 conversions where possible
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
 <20251029-nova-as-v3-1-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-1-6a30c7333ad9@nvidia.com>
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: d4832774-0f20-40d3-e99e-08de167a273d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QllYUkIrTXhpbkNNWnJRZ25YeWV5b3RRWHFNUThOVjV1Sm5kQ0prekgrL01l?=
 =?utf-8?B?dnVXMFkvMzQvdzJ3UGZvYlFkeUE3K0RFN09kWmlYTnM4bGM2L1Y5TENUY0E2?=
 =?utf-8?B?aU5uWU0wbXRldE45SFIrczlzZ0JjWTFBNTJnTGwxWmNMd2lsRGxMeHl0Vi9X?=
 =?utf-8?B?WXVJb2liNU10SjlzSDJVM2krNXdoanZFMHUrNTZNeEtHT1hGOXZQRGdKQXFU?=
 =?utf-8?B?MkMvVXhMajJUankzM2c1YmpvR2JHa3VpTjhGLzdVNmQ3OEk3QjZiU2dYcHR2?=
 =?utf-8?B?T3lOeWtDcVZWWE5LN01telh6dUtNNUZPbjQ4d2VYemJ1RW5Uek4yT0pVZ21o?=
 =?utf-8?B?U2E2Snl0Z0hVRVl2UThaUEpEOXdOQnRJY0c0c0Rkb1NVYnF0TEdBdDVKTUh4?=
 =?utf-8?B?U3pUSG5MeFRnUmZrVXZ3ckRUTTkxa1B1VTFkN3NqR080ZTNPNEFTVGUrZGNY?=
 =?utf-8?B?ZnJJekFuaUFHdVdtMEJGYlRoY3E0alZwdGZ5czRvTEdwazJNQ09TenRPZlBh?=
 =?utf-8?B?U2xWMWR0QzFUeVNEaHFqVSsrSFZFT05WQ1dOV1kxVmhNQyt0OXVsbU1PQlo0?=
 =?utf-8?B?N1l5VW5WOVFyWEdPMDlyNHNwWGNwMDhsUjNhYlF1Z1JoYS92WkdYM0V3UC9T?=
 =?utf-8?B?SWdxaGF3UWM1b0NpZmM5Wmc4THlhY3RNMWJnbDdib2RVREZBSk94akxEV1My?=
 =?utf-8?B?MS9XUlpkZVlxRFF4YzZKMnJZdEFyS3B6M0JZdEM3QWlHc3VOWkp0RUpKd2NB?=
 =?utf-8?B?dmdPc3U4S0EyZTlKMk5wNmVRSGVIQXg4Z3ZFb09OYTE4aE9iRlB0SW10dm51?=
 =?utf-8?B?TmRPQThjUGF3aWNERHNIV1I5UG9Tdm8rcnhiOThHYUp6NTJnSng2WGxIdHl6?=
 =?utf-8?B?bHJlMSt6TVlvYU95b0VRV29VQVVEN0w0RXVYTmtFOUE5ZFIyZzl1ZTE1cWpa?=
 =?utf-8?B?cHZBRTd3SEVxaDQ2dlNPZGpSTHBhUjBtc3dOSXBKN1BPeUVtdkR5VmJrZ2hE?=
 =?utf-8?B?TDJoTzdXQU1pNmpBRDN3UHNGVEdsMURWTkhNSjZuYVlJOHdwOUh2bkJERnRU?=
 =?utf-8?B?dDBsMzF3MHQ3d3VSYXBlUnFkRzZuU1IwUnZ6TEhYMEp0MkRwTnpKKzdOclpB?=
 =?utf-8?B?N2VZZkVmczdWc3FlRHM2UzRqWlo4WFBJNTdiNWI2eGRuZkphUXRubnpvY3hI?=
 =?utf-8?B?eGhIa203Z0pSK0taSHovNWlrZkxLc0FhYUcrdDdKNlZ5aGM1ekVPQUFsY3NK?=
 =?utf-8?B?amFRNVIxbjJpMVg0bnorN1IwdWlLK3BZWndCeDZ3M0xZT0c1dnJRMGVCT0E3?=
 =?utf-8?B?WlBING95TGgyQXhRSnVWSDNQdHB3YjhCRW9IWEppS2xlenc1MGRLVEJicGE1?=
 =?utf-8?B?L2thSmdmUGxTQU9HcG44Z1k0aUJabHhKVENZMTdKVGNjNHpqYUdCTVNGcStl?=
 =?utf-8?B?eGdSVFcvY01Sc3V0Zmc2bU9Uenpla1g3N1ByMmdrc2tSTzhZSU45WFhsTWd1?=
 =?utf-8?B?WnR5dm5ybnVhaXJWT0V2QS90WUpJQ1Bicno5ZDBsMmczaGhFRXA2MzdFVENu?=
 =?utf-8?B?RnFhaHZMTkoxRGo1R2hwd0xBenFhdFFNWUVDR3o0QXB2cm80Y3Y4RW9ZQ2p3?=
 =?utf-8?B?YmhPR2JlMGRtd1FkcFlrdGpUck5oZWdpclZoS3VFWUNlc2w0NEdBZEF3N1pM?=
 =?utf-8?B?bnREQ1Q5ck1QaHRiaFUxSWlzSUs5T1JlNGpabG5LZ09aYzV5bzZ5enQ2SVNC?=
 =?utf-8?B?Wk1iV3JyRC93dmx1NkMweWVMUTc5TUg3NjRsczcwb0JHSUVML0FuVzVXNWdo?=
 =?utf-8?B?ZHBPTU5CRWlTZzcxWUZlRllrZWV5dlVjTjJ5dkg2YzBDRVNpQUd3cmIvaWdn?=
 =?utf-8?B?OSt6aDJhemxRUnMyNmtSKzVxT2JZN3BKbEVUc2FuZHcrbFdONGcwaGgxK1Bn?=
 =?utf-8?B?d2tGY1dmMjhqa01md1VWZHdVSGdkOS80VW8xYmIxYmFPdVhJZ2hOdFVlem85?=
 =?utf-8?Q?/HOPB7JCwU2CHTiH7ai7TMJzlw6qNE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXJVZ0pLMkhOeEQwWXRJZkpoSG5hVEpyY3A5TUpSaHVBbEttazRYM2RSZFNp?=
 =?utf-8?B?UEdtUUc3M05rK3FEZ09ySkYyQzd2TmtDMmNDeUQ0TlJLcS9OdjFLSmZLSEY1?=
 =?utf-8?B?WndzQlZrcitqWlNaUEJrcEFGSkxrbitmek9NK3U0SUtjWE5KMnZuazAwRFJN?=
 =?utf-8?B?QUphZ1E5K0hDWmcwd3FlY00vQ2xUZyt3dUsvN1FtU2RuTGtiVGsyMi9IWXJN?=
 =?utf-8?B?cjNveUY2Tm5KVzFvYmZ6RFRJdHZLeVRpdWNuWS9YdU1OdklYRkR4V3J4UzRl?=
 =?utf-8?B?RG5LVEw1cWk2aGY2YWdxaVVuekMwSVBBa21uTFJ5ZElIQU0xQlpZUzhBVTZZ?=
 =?utf-8?B?TENyeHg3MnJsbGNLdGttZ0FvL043aDk5U0VhdFlUV2hVQU11WkNPVXN4Y1ZN?=
 =?utf-8?B?anNDdEhkQUdObFovaVYvQks2TDNVK20yaVd4Z3J5ZFR1UkJETk8yZlNtQlhR?=
 =?utf-8?B?eU83bEpXVHM2czRmdTNFNzg3WDVoY3Q5WG5sTTcyVFQzd2IxL0Qzb3RUQVlH?=
 =?utf-8?B?eEFQS0Q2Q1UyelIzcFBFY0hKejYzOFpYK01wNUJLYnRZMzZIUVZ2aUNPbm0y?=
 =?utf-8?B?dlhhVlhQRVQ2alFlQkc5alVGRnhaY0lIUnI1Q1prMDFaQjJScUdrcDFnZmxR?=
 =?utf-8?B?N3c2d25JUVdUaFdGdkh2MGJ5NXJyMkc2bDV3MTM3RXdvNnhTK2Y4di9VNkh4?=
 =?utf-8?B?dWFKc2lxcUhYMVd3NklLK0gramd4SW5PQWtBQyt3NS90dTE3OFY4ZndYRW5u?=
 =?utf-8?B?Z0dCbWlUUVlJcjVqdWJ3RlQ2dEpDUGZKRzdmdmpsb09LdlJLUTd5bnZLclFj?=
 =?utf-8?B?cE83NXhzVEo4MndHbmhHeDI5ZGVWVEVQd0tLdWhNNjQrSnFHcW9DZ1V0TFc0?=
 =?utf-8?B?a0Nlcjd5V2F2Yk03ZTZ5Z01MSXBNTnBaZzdJWWlTQ2lpQnExTExtTmVjZEhn?=
 =?utf-8?B?bEZyVTI2c1V1UWtVSmFZMklGbmFTS2ozdi8zbDJSNGNEeW1JMFRoVGVCMk0w?=
 =?utf-8?B?ZW9ISU9FejBqTXB0TGRNSEJPQmZ2S2hlRUFVSGJodTRScTQ2T0YyRFZtWEd6?=
 =?utf-8?B?eGhvYnJISUlKcUU2ZFhvMmNaNVJKTjl3MXhqK0o4NXdmcnZsYTJ1M3Bsa0E2?=
 =?utf-8?B?b2JYdm9vZXZWaXZwUC8wbVdZbm56bk80ZVFzR2FtaUZFdUdPOWpQQ3lzNlVD?=
 =?utf-8?B?RC8rMkgxZnQ1QzIvRFgrWHpLZ2ZOUWZXNHZlVEsyUEtkVWk5MnlJYkdJSUY1?=
 =?utf-8?B?N0Flb3c4bGhiWXdoQWV0akVQUDJMRkR2OThHNU1aQjN5eDMvQVVuQ2lIOVNL?=
 =?utf-8?B?eTJPMll0cmorWTRiMElkK2dSNEp1ZndNRkUzU2tUVWhBQVJ4NVEweXVkTkVq?=
 =?utf-8?B?aVlsR25oUS9kMzhZWVRHaVJXNS85NFhKa3VmdEt4cEtHVXNSdmdEOHBZa0Ju?=
 =?utf-8?B?a3hNRkNaQUliZEtBbkJJVzYyUzBwQlJKOHpBRnlmbDZkNm40aUhZSkNUdmhO?=
 =?utf-8?B?TjZrc2VTVHRveUUyaWpONkNOdlcwWDVNVnRUakdxUE8rd3VRTkoxd1ZXMHht?=
 =?utf-8?B?Tm9vVmRrc3J5TCt3eTg1QTBOWGIvajhqQmxmVkxJa0RzUWlSdjZXZ3IyczlK?=
 =?utf-8?B?aGpIQTR6aDRJRmhkNy9sVkljcUM5blZRR0NjaUc2eVpOUnJpOUpQUVJMYkhK?=
 =?utf-8?B?UnM4cVRPSnRqTmFxV2c2WWNsRDgvTnlRVUtsbGp5RThiUE1EeGhNVUFsaTBS?=
 =?utf-8?B?Z3JZRHptZ2wwOWN0UkhYd0FqdDlUTURKNEFDaEJEZE9kVlMyWGdhR08zNndJ?=
 =?utf-8?B?N0w0c1duczdhZWh2SWRuK3FvNDNXZzRDSzdVS2psQ2dFQWFIUEFMb2JJcUVF?=
 =?utf-8?B?dkQ5bDd3b3N6cnZqYmIwblpjRlJhaGZ1KzJ4eXE2YmZ6T05hQVFtYkppRVpl?=
 =?utf-8?B?MmxlbnVVcUJkdUVuRC9zaG1wcTRSVUcySGhtVk4xdG1EeE1RQWNMTHlrTzRE?=
 =?utf-8?B?b0lpUDcvZ3dTdGZneWNkaUY4RUsybElqMlprMnRPMklEZW1jNFg4TVlUZ1ZG?=
 =?utf-8?B?cjUzQUtJQmE4NGt2WkwzTVdlZDNEYzg3VENWSytKYWF1aFdoSnRYZFowNk1W?=
 =?utf-8?Q?NOE/JiK88GLq62QscZogPwj+M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4832774-0f20-40d3-e99e-08de167a273d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:31:43.7534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwknpORC1O7v56TKFZndnFBD+E/2zDACiV9Pd7mKmBIn/Qt0/h/Rb9BRKsRPtHB4QX8VEeRu30HNCj9qW8pjMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620
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

On Wed Oct 29, 2025 at 8:12 AM JST, Alexandre Courbot wrote:
> The `as` operator is best avoided as it silently drops bits if the
> destination type is smaller that the source.
>
> For data types where this is clearly not the case, use `from` to
> unambiguously signal that these conversions are lossless.
>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Unless someeone screams, I will probably merge this one patch today - it
doesn't do anything controversial and is required for another series.
Reviews welcome still.
