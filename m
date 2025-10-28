Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC0FC1749A
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E650410E6A2;
	Tue, 28 Oct 2025 23:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RA2XVPpf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D197E10E6A6;
 Tue, 28 Oct 2025 23:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+Itu8PYtkMmEnRqyfHR/jxujD07LCPPyCxt0HOAfvqg7GwqlJFr0Drt3khwKZzvEv3retsMd8hhIBYex82Hl1a9dExuauXgvxoYahSG8kA/QZJzggF5C0aMU1w93Jzp3Pwz8rPwOQxmylZCFyHf4/nhUPcqF1Fu2LbmHhSLlX6OgsTGVjd7MQCA1EU0psOEWb7Zx4ZWzGM/Y7MX4dTOcz9XEZO+njpOQCKg4nqnO+1HCoHYoBD8a3GwRbFl/pWhE90mFKCQXCl6dPFeObBJc6BHEIlYzRQUy4AK1i+lNsQn7x0yMgFmCs125SntF1xTfVibT918rnSf2+XmSQFFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=baZUy3IL1p+29CMMkQ8aeBGCbTZaAvBjgdWiJv+aiZ0=;
 b=ee5HiEclay87xfA+oBdnMLi+JQqOcN54rpSSks2qPjPv29Pgf5ilBGcM50RkgzvJ+LJwY4/p3SmWbk28rXqOeA/DRJB7gXBxGt8HERavETMAUX+k7qeqkfFrUy8V7Y84d+spdfDDVLrGy2sRaab1/Tl4tsDjsu0FS03YtuA8LpMnBET4E9OC0ld+61iEULdf8UPc0sBLdiHpphWlN4YaVMGRi3rLBIE4N15Fg09jegFgYK0sMMVeU4NyBzRoB9XxpA+fsBCViGb7ReGAdjQQNs4fh80j0i6HlnXuKnbmbotrSItuua3+ehYFo9pgCgF4u/OErjffGHQ2B0o6jg+1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=baZUy3IL1p+29CMMkQ8aeBGCbTZaAvBjgdWiJv+aiZ0=;
 b=RA2XVPpfhB11W7SUhWw/ORzNSajBQOXT+ZnIre9N75HUqh4s4wHKY+Xrpaa7VXl9Jm6LVFVNPy39Gpa7j9M/594s9iNv1GRo/21h9UP45zhdSUT12Gi9ddHl03Sn7K29QMT9kIb0vUCVe9O/zefR5did/0RZ4XmuWPBkqXahvgvEcCye5Lf6AV38mwxGmWSEgtB9a70S0qDByGk7rhSeaAfEeU8SbWHKAIKHtTUNZN0A9U4c6lJ5XsCUxjhLE4MbiVbDGUiaWzFxIwUvi+oymkK6C67BEG9ncZlF6ioUSWrJJhxs+sDnzRL1pl6XplIZezNJaxHjAZs+Sc0IlCb8Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 08:12:12 +0900
Subject: [PATCH v3 4/6] gpu: nova-core: add functions and traits for
 lossless integer conversions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-as-v3-4-6a30c7333ad9@nvidia.com>
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
To: Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0069.jpnprd01.prod.outlook.com
 (2603:1096:405:370::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee19037-c6f2-44ef-6a86-08de167776a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm00RFI4Y2lBQ0xCSEVaZGtGWnh6eFF4d1lQdFJyQjBaaGt6UFZOL3BZQ3NI?=
 =?utf-8?B?MUUyUjdGTTltY0pJRVpnNENoVUNGQUcvYUNjWjdjSzJzWlkwK0FLdnFSd0d5?=
 =?utf-8?B?Y1VWM0tla1lFVC8wa3JQUUFaTGQ5UUxRcFErS2tHZFl4SWxOOHVJeEdxaVVI?=
 =?utf-8?B?R2tRK2Q2Q0pIQUFURE1CaTdrZ3BOdURRSVU5T2FZNHcrbXVHU2wxUzhXUkd1?=
 =?utf-8?B?dmxOYk8yaXN2N2t5d2FzYkREQzBLUTRNREhuZXMvdEg5eWUrV29KV2tzbzlw?=
 =?utf-8?B?WUV5V3g0Vkw4d2VpUXRGWHJVeGJyN0FtemJUK0k0c0tUWm83Q2FtSEs3MGtG?=
 =?utf-8?B?Skhkc3RTWVgzdjEwR2Z3MUlWNFZXbkVXQUtOOWtHM0lHcWZiRFJtZldRVVlX?=
 =?utf-8?B?OUk1NmZLSm9kZk9Rc3JJaFdoTSs1N09qYitjWTFBTy9nVWtlT0RiaWpONGVv?=
 =?utf-8?B?MEZFS1hVV1krcWlRN0VjUWtzOHI0SmZJakNBS0FSNVl2YmtXU2xqY2VQSmpj?=
 =?utf-8?B?ZElQSzYrakFOV2NOQ1BYTnVkcVZaalNPdDA1MHZ3ZTdONDhRRlBXVFJUZzdS?=
 =?utf-8?B?WUhoMEZjYk9rZHc0REFqSG1ic1F3YzFXQnlIWXhxS3ZWYVlRcE13bHZQRnNH?=
 =?utf-8?B?OC9xK1owczByOVEzNVVJdzBwdlNlOXlMT1l2and3RjNWSWFkcm9rYk1OdmpW?=
 =?utf-8?B?NnJpdERGMzZlMC80ajVRcjJhUGR5bStvWFVSLy9SR2k3TnhXcDhDbEVoYU9K?=
 =?utf-8?B?ajNoMU1jTVBrNDFhWjJKZjFIVDdkQUtRNHV0WWE3Q0lyNzJKVGVQeW5ZMHkv?=
 =?utf-8?B?L0Q2TlRpSGtDV0pveXFodVVjaTZYQkhxMjVqeXE3aEpXNFo2UFZmbUhOSDdJ?=
 =?utf-8?B?Y2dxRGtWUW9INGgwMXVEVE9mSUgrUEV4RXpWazcrS2ZDRXFrUEpkM1huNERR?=
 =?utf-8?B?c1hPMkEvckRJbStDWkROWWJMdlgrSDRNRkZOeDVYWGp4SVNhTnNsOWUwRzRr?=
 =?utf-8?B?OUNQTkRlOW1saUtSaXNCVmROUHNSdkRsZk5NMm91Mkl2WHV5a1R5YzdOVkVv?=
 =?utf-8?B?L2xoUnk4T2ViNTBJQjFNRFZ4THdKSGtnUDlPTGJiZlBlUlBLUFZ4REI0TmZC?=
 =?utf-8?B?Z1FTVjFLb2JFcjc2UW9XV3VrZ3RldFdKRzV1NklHcjZHemh6OFBEbHpaSDJK?=
 =?utf-8?B?S2tFM2k3ZFF4SGh4d0xOblQzRnRIRWtBeHFNQjU0MXRQVzV1R1oyL3BuQ2FN?=
 =?utf-8?B?cWFyWnV3Q0lXNGVHM2ZBclNLRnowaW1tU3ZraUdHRHFGZ05mMkxrVUUwWnBJ?=
 =?utf-8?B?SERnbVZ0dDZsclZoSWF5cXdGYUJ0eENqeFNOY2wrVUVOT0MzNVRaRjl3cjc0?=
 =?utf-8?B?L0RiaDZXUldpVUcyZkRHZm9VY25LcXg5NVlOSHBRUFEwd3RzaTBoaDRTQnQ5?=
 =?utf-8?B?UVlTWjI0Z2RlT240TXJjSmhPd3hTdzA3MDVNYzhhVGxDejBoWGZmbTAwNHRz?=
 =?utf-8?B?Lzk3cFoybUh4NjlTazI2RnFPUXBLVjVpTk81LzI1RHJITHY1cWdtb1ZFdW5j?=
 =?utf-8?B?b2RwTnZ1UW1SSGtEbnVhZU1MMGNNRVVoSDBPWkM1UHpuRG5rVlB3YXVqSFVn?=
 =?utf-8?B?M043bGFUdGM0ODRWa3JkZDNCRkdjd0x4QVphOTRhRHNYM2RDMTBzMDRvS2g0?=
 =?utf-8?B?bmlkZ0oyQUFjdUcvQlBuMkY2Y0M2Z1NjUC9ONTlSOGcyMXhqSjQvbUVNL1ls?=
 =?utf-8?B?d0NnakJLaEJqZ1NoQ3BSaUkzb0c2VjNyZUErWU5tZitrUmNKOTJKNVRsNE1J?=
 =?utf-8?B?MHkxeHYyZ1Rnd1pFVVBFdzEvRE11VytvWE5vSm1tbEJDek5FRG1rbXNGTktZ?=
 =?utf-8?B?c0dQOUt2MEJ6SVU1RWdSZFI4NFBFK2tVRW1QOFVmbUFUK29ON011R2dFQytY?=
 =?utf-8?B?Sy9BUEI5TWZndjNKZUZ3YXVGT2w5R21HcmxlVGtaTXhxbDVoN2FoaG4yME5N?=
 =?utf-8?B?R2lWN1d0OC9OWW1xNjF1RCtqcXJaeC81c3Ywdld2NElScFIwc1pqRGtodDFV?=
 =?utf-8?Q?bcLESv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andaN1dMaXZKQUx0VmtXYkU4V0JLUS9xTTkrNUlDRm52RVk2YW9qMmRNaDkw?=
 =?utf-8?B?OXpCeGp3clA2NEQ2bkxva0hDdUJNT2pjTm9za1lyOW1aQTltWVhjUzdlOFFS?=
 =?utf-8?B?Yk9WNUV1YkpNd2wxenUzNU1EZHEyWE1aNFUxTnl5MEl4NnQxNmhmZGk5Zm5h?=
 =?utf-8?B?RVhpekZ6UndQam1BU1hzZW8ya0F4ekJ0blRGSGdPZzFWRnd5Zll0aW9pc1Qv?=
 =?utf-8?B?V3RMblhJcDBoRXNTZU93Zll1MVgrWEZZMTdUUXdvSXpqdUFuSEhZRjVweE5I?=
 =?utf-8?B?T2VjaEM2eEQvUHl4MldMRGk5NDlwTE9JY3JsejJYRk4ySUh0OVVsdHkxb3gz?=
 =?utf-8?B?N0hKWkN6aTN1NlArK01iR2wxeWUvc2YzVTVpUnRtLzRuajZrV3N5Z3NIcGVC?=
 =?utf-8?B?TEtpZ3Y4ektRRDdDK1VnWDkxLzR3dlhKaGhhR3pqMDRUK01RUTFnc2JCSXlx?=
 =?utf-8?B?NXZyeVNsNTBaN01Jejdnc1RhM2d4QnNhRDZJTExYdDR6eWxiQ2JEb1lXTS9y?=
 =?utf-8?B?cGZpUjQ2c2hUc095Y2t4dlMwbkJPWDhuazdWYnJuUXU4cW5HVXc4TkhMRGJ5?=
 =?utf-8?B?dE5WQktHZytvUVVqa05UTng3Y0tPZWlzMWdnUDZyQ3krbWJHbzFlNHEyaUpS?=
 =?utf-8?B?UHdOckx5bGFUU0t4MFpibXZMR1pqVnpnY1RldXJLeUNXbVQ3Y3FBekd6aGJl?=
 =?utf-8?B?RmYzTytDOEZaWGFibU5IMURlZSt6K0NJWEZuTFNoK09Gelg1WTNBSGdCeGhy?=
 =?utf-8?B?MXJ4UUN4L0xoMVJGYVhlVzZkN0lFMDRWK0Y0ekJ0V29GOFpYUW9NQlZXYnA2?=
 =?utf-8?B?Wm5GaUdCM1FkMG4xMzBXNFZuWVZCMGM4SVJPcEVEZUw1MWJUQWJCdjNaMXNm?=
 =?utf-8?B?Z1p4MFFHVEw3SkoreXlWek96bUw5QjFZYThuV1lZdDdoUEFNZlMvWDhBR1R1?=
 =?utf-8?B?THdZdWNwL3Z4Y3ZKb2RldTBMRTBLbDdXYmlLMTNQeVoyZ2hJREw2dDRQMGJ6?=
 =?utf-8?B?cVFEZ3VpYjVwV1NHME12RTNrZ0ovK1I5VklPdmRMKytucEdTNko1K1lVN2xv?=
 =?utf-8?B?YUdVNkVheDZ6azljeGhveHdzMXNtdjU3WTNpRHlxZlNsWVNaNUlkVVFhR1hv?=
 =?utf-8?B?bmo4UXFMZUVFVkxsZUxoTEZyc2JuM2xQRjF3MG94L0tUajFtODQ0REsxZnp1?=
 =?utf-8?B?bVFVWWQ5MlZSZFFHd3BaWHJTSjhheG54V3BIRnpGaERJcm5oNmd0czF4RXk4?=
 =?utf-8?B?SlgyZGFRQVlrc1lZb21iT043V2l4SDR4WXhiZG4ySGVmYjJoMHYzZEFZdjdW?=
 =?utf-8?B?QVdTcTVBWStBQ0xDcW5pWDNySlU3c0Jmbzhqb1JJU1U5dmo5UWRkSGFSeXMv?=
 =?utf-8?B?Y1Y3cGlybGdMQTZuWG41d1RlZEQ0a3RrRXAvdnArS3A3c2YwTGtyNStWeHZo?=
 =?utf-8?B?c0FOVFBHZExBcWEwbUdxU3R4c051VUwvbGFBQzczVVVOcXo1aWc5V0lmdDVu?=
 =?utf-8?B?czhDK0ZqTURTdmdpczUydGdEc21GVTdSNFZPdU1tS1BaWlprN3lCK1FybldY?=
 =?utf-8?B?RjJLdUxERlh1QUJGNkJ2RXkwcFVUa2hwM1VzbEhYSGVRRUdJdUpoL2pOckZs?=
 =?utf-8?B?VnFqQ1lhZzNPOTVLSHdjRGljQkZzQTBFK2xqMklxT1ZQZUY2OHNLb1lQWHVZ?=
 =?utf-8?B?NzhFcndHOS9UdGtOM3BpUmlLQkNLVDd3RnI3M21mMXUyWUdyV2Y3L3RrSTlh?=
 =?utf-8?B?cm4rYTNZWGRibXZpamNxR0xJZEtUdVBvTVhzVXd3VEEvbWtOOGc2Q2FYcGZT?=
 =?utf-8?B?S2I0d2dvaS9wbUVicjlSQW53T1drNjVVeFBYMGJabGorZ2Q2cVJ5NzZlYk95?=
 =?utf-8?B?NU81dHNZNnhBWjVTUnJUTG9oeGphaDZ4Wm9jMEVJaTBKRTl6eTBDbXY1djFI?=
 =?utf-8?B?eHJGSGVsaWtXb0k2OUZ4dmgrNXpacjdyQmk2RkdVcFR2K2FwR2tlR2VJTjFV?=
 =?utf-8?B?SXdueHNLdjR3MDJXMnRiMnl6bEFJQXNEUEZQU01aYjNCaWtKOENJbnA2cTA4?=
 =?utf-8?B?bzNJeEM5WCtkK3YxOHc4NVZSQVN3TjBzanBjcUVEUktaR3RTWndnZEFZNDh6?=
 =?utf-8?B?L2VKMFg0cVJHc3pwdWVxQUt2Zkt2THhXTDd5T1B1bmtWL1dhZWZLR0tsMEZo?=
 =?utf-8?Q?rj9gpLl3KzrLMGWnQJa2hSg0LvpZWiTXjMdbrzGAokye?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee19037-c6f2-44ef-6a86-08de167776a0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:28.1931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfJ18f8m2aWX8ygO0h+oXZnIkVNQqm/U6hcwJ+o5jQGU+FkYpTU1LF6LfCCsi/6T0SnxRjiT2Cl8HhNmCZbiUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9646
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

The core library's `From` implementations do not cover conversions
that are not portable or future-proof. For instance, even though it is
safe today, `From<usize>` is not implemented for `u64` because of the
possibility to support larger-than-64bit architectures in the future.

However, the kernel supports a narrower set of architectures, and in the
case of Nova we only support 64-bit. This makes it helpful and desirable
to provide more infallible conversions, lest we need to rely on the `as`
keyword and carry the risk of silently losing data.

Thus, introduce a new module `num` that provides safe const functions
performing more conversions allowed by the build target, as well as
`FromSafeCast` and `IntoSafeCast` traits that are just extensions of
`From` and `Into` to conversions that are known to be lossless.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link:
https://lore.kernel.org/rust-for-linux/DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org/
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/num.rs       | 165 +++++++++++++++++++++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index e130166c1086..9180ec9c27ef 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod num;
 mod regs;
 mod vbios;
 
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
new file mode 100644
index 000000000000..3f7daaedee0b
--- /dev/null
+++ b/drivers/gpu/nova-core/num.rs
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical helpers functions and traits.
+//!
+//! This is essentially a staging module for code to mature until it can be moved to the `kernel`
+//! crate.
+
+use kernel::macros::paste;
+use kernel::prelude::*;
+
+/// Implements safe `as` conversion functions from a given type into a series of target types.
+///
+/// These functions can be used in place of `as`, with the guarantee that they will be lossless.
+macro_rules! impl_safe_as {
+    ($from:ty as { $($into:ty),* }) => {
+        $(
+        paste! {
+            #[doc = ::core::concat!(
+                "Losslessly converts a [`",
+                ::core::stringify!($from),
+                "`] into a [`",
+                ::core::stringify!($into),
+                "`].")]
+            ///
+            /// This conversion is allowed as it is always lossless. Prefer this over the `as`
+            /// keyword to ensure no lossy casts are performed.
+            ///
+            /// This is for use from a `const` context. For non `const` use, prefer the
+            /// [`FromSafeCast`] and [`IntoSafeCast`] traits.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            /// use crate::num;
+            ///
+            #[doc = ::core::concat!(
+                "assert_eq!(num::",
+                ::core::stringify!($from),
+                "_as_",
+                ::core::stringify!($into),
+                "(1",
+                ::core::stringify!($from),
+                "), 1",
+                ::core::stringify!($into),
+                ");")]
+            /// ```
+            #[allow(unused)]
+            #[inline(always)]
+            pub(crate) const fn [<$from _as_ $into>](value: $from) -> $into {
+                kernel::static_assert!(size_of::<$into>() >= size_of::<$from>());
+
+                value as $into
+            }
+        }
+        )*
+    };
+}
+
+impl_safe_as!(u8 as { u16, u32, u64, usize });
+impl_safe_as!(u16 as { u32, u64, usize });
+impl_safe_as!(u32 as { u64, usize } );
+// `u64` and `usize` have the same size on 64-bit platforms.
+#[cfg(CONFIG_64BIT)]
+impl_safe_as!(u64 as { usize } );
+
+// A `usize` fits into a `u64` on 32 and 64-bit platforms.
+#[cfg(any(CONFIG_32BIT, CONFIG_64BIT))]
+impl_safe_as!(usize as { u64 });
+
+// A `usize` fits into a `u32` on 32-bit platforms.
+#[cfg(CONFIG_32BIT)]
+impl_safe_as!(usize as { u32 });
+
+/// Extension trait providing guaranteed lossless cast to `Self` from `T`.
+///
+/// The standard library's `From` implementations do not cover conversions that are not portable or
+/// future-proof. For instance, even though it is safe today, `From<usize>` is not implemented for
+/// [`u64`] because of the possibility to support larger-than-64bit architectures in the future.
+///
+/// The workaround is to either deal with the error handling of [`TryFrom`] for an operation that
+/// technically cannot fail, or to use the `as` keyword, which can silently strip data if the
+/// destination type is smaller than the source.
+///
+/// Both options are hardly acceptable for the kernel. It is also a much more architecture
+/// dependent environment, supporting only 32 and 64 bit architectures, with some modules
+/// explicitly depending on a specific bus width that could greatly benefit from infallible
+/// conversion operations.
+///
+/// Thus this extension trait that provides, for the architecture the kernel is built for, safe
+/// conversion between types for which such cast is lossless.
+///
+/// In other words, this trait is implemented if, for the current build target and with `t: T`, the
+/// `t as Self` operation is completely lossless.
+///
+/// Prefer this over the `as` keyword to ensure no lossy casts are performed.
+///
+/// If you need to perform a conversion in `const` context, use [`u64_as_usize`], [`u32_as_usize`],
+/// [`usize_as_u64`], etc.
+///
+/// # Examples
+///
+/// ```
+/// use crate::num::FromSafeCast;
+///
+/// assert_eq!(usize::from_safe_cast(0xf00u32), 0xf00u32 as usize);
+/// ```
+#[expect(unused)]
+pub(crate) trait FromSafeCast<T> {
+    /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
+    fn from_safe_cast(value: T) -> Self;
+}
+
+impl FromSafeCast<usize> for u64 {
+    fn from_safe_cast(value: usize) -> Self {
+        usize_as_u64(value)
+    }
+}
+
+#[cfg(CONFIG_32BIT)]
+impl FromSafeCast<usize> for u32 {
+    fn from_safe_cast(value: usize) -> Self {
+        usize_as_u32(value)
+    }
+}
+
+impl FromSafeCast<u32> for usize {
+    fn from_safe_cast(value: u32) -> Self {
+        u32_as_usize(value)
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl FromSafeCast<u64> for usize {
+    fn from_safe_cast(value: u64) -> Self {
+        u64_as_usize(value)
+    }
+}
+
+/// Counterpart to the [`FromSafeCast`] trait, i.e. this trait is to [`FromSafeCast`] what [`Into`]
+/// is to [`From`].
+///
+/// See the documentation of [`FromSafeCast`] for the motivation.
+///
+/// # Examples
+///
+/// ```
+/// use crate::num::IntoSafeCast;
+///
+/// assert_eq!(0xf00u32.into_safe_cast(), 0xf00u32 as usize);
+/// ```
+#[expect(unused)]
+pub(crate) trait IntoSafeCast<T> {
+    /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
+    fn into_safe_cast(self) -> T;
+}
+
+/// Reverse operation for types implementing [`FromSafeCast`].
+impl<S, T> IntoSafeCast<T> for S
+where
+    T: FromSafeCast<S>,
+{
+    fn into_safe_cast(self) -> T {
+        T::from_safe_cast(self)
+    }
+}

-- 
2.51.0

