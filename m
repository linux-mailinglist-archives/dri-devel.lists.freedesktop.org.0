Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3031DBC05F3
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 08:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7945C10E048;
	Tue,  7 Oct 2025 06:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UP1ZGc9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012012.outbound.protection.outlook.com [52.101.48.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AC610E02D;
 Tue,  7 Oct 2025 06:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q7/PHBnqCFzeC/UGQOWIwbiYP/wBYwwJW14Q2i40WEjqP5y1scOoH04UyeZzNW1C0lR52dz2QijupLzefcFLqDojR1WGxoyCoPMKE6u8aqABokuQ8INPykDsHUhCfhQNAymFRUNzDtYzWm+R9v+ElpKl4sNXO2dgj21l0BhCOIith1gNw7ZaJYGdiCbC9C2roc7MzAebm0I9TnX4WUwjfwtaMOzEuM6VVPrcuoK+8H3kt1FCr0oj1aDzMYF72AfJkwFzsBXdOhLh3uTnPyhFuMhgNES/p8RSKtVdf17T/C3p9NJPv638mxD/IpRjvMGa4aptJq9BrFDDpuGlUSFW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oaVDNS3QitRr/MdozJBXneK/QfegC3erOy2gqS5yWyU=;
 b=Q/CmCx+DRMTEs46n5773P8Fa+CUW6/SyyV0/rZwiGPWgnBPn43UYJAFX55fzd+k+F9eX6tQydNcU5kj+2JPsMzn/jQlBW8y7JqI0JX1cMf4F38x9c441IhVbeNfDSOM3dNqH+SMiSS0epIOIF+xNbttmS3HPdSfvAWvFy8eIp+vpZA5aldp9Od83ysC4mxsWQcsRDoDeiBDF5ndKBLgaJQst2Lh8lX2+c2sx4whrk5gXeoHAvvj0Dvof1fWW4Ms3Xjwqy8CbE5sx95O+vIQ2RX4a4jRwU4RVcqV406EK1ULfHBnDDYhAcuWg5TqLUQHJQP8fyaK4Hdvel34mzg0q5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oaVDNS3QitRr/MdozJBXneK/QfegC3erOy2gqS5yWyU=;
 b=UP1ZGc9MoUAv0iJNuQcZm4XgC7uNICXoA7S94qqUN6vUEN3xoA7u2fqbaMD5LrqohPooOP1iNbsALvGsOovj+mCjKn780xmDfrUKi9DfvhoC3/Ad2j2e2kAw0ZwbHX6n8f8yOjkG7rSM3CfT3l2vZQfut2Uu0e2ivUUm90sSQNTs9i9ewP9JBiGE5N5q3syQbfWJpZABzValvLvYkUHub9eNVxVYOKyQYE4DMmHOKC/IDbG4CXNNkJ8gNVBfOtdejAlglX29HWnYPww93nvxARvzcs9+Y6OoTiBRb2XEV8MmkitFg5iw9d/Pxxqz5stMe2aM5oBJSnotXPJWaw2irA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 06:49:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 06:49:30 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 15:49:26 +0900
Message-Id: <DDBW1JYMK8Y7.37R0EJR5VFEO4@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>, "Elle Rhumsaa"
 <elle@weathered-steel.dev>, "Yury Norov" <yury.norov@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 1/5] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Edwin Peer" <epeer@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-2-joelagnelf@nvidia.com>
 <F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com>
In-Reply-To: <F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0090.jpnprd01.prod.outlook.com
 (2603:1096:405:3::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 77690e71-cdf7-4d84-553c-08de056daa19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUpwcldVamdobEFvT1pDZ0dtcmJ4Mi9tTXlJR0hPSU1ESW1QYnREa1FKbXpU?=
 =?utf-8?B?emFIYTVseFA1WlFLdTM3TTcrS3VFaVBkM2J3T3NzT0U5ZnhhRjNZb0NieDR6?=
 =?utf-8?B?ZVphM01wUDJ2NWZMS2x3T3krWlU1b3AvU2V3M2x0bzJucXdxUTdGWnlVNE8y?=
 =?utf-8?B?SkcyaHpFNFV4RDlDbytJTHYrbVQvOG5xSnhRWDhoRGxpcE9EeDVGSlo4WkdU?=
 =?utf-8?B?YTJreGFzV1lDcE42bTFjVm9GVDAzTHlValUzMzBvamsvUkNNYjFVRUs5Q1l4?=
 =?utf-8?B?b3Q2b3RqN0pnTGRLbGN1dFErM2s2ZElCaGlpUHkvTUN5YVd6WjNsVzBCbDJk?=
 =?utf-8?B?K2ZrNndxNXF6a28rZStqay9KbnhYSmkzRDFVRVNHTlNJSWVFKzlGTHhkajF6?=
 =?utf-8?B?WkNmM1J1K1pCLzVPVU9Qb3dLNGNGUGREdXJ4V0ZZVWt2MHk1b0lVemI1eXp4?=
 =?utf-8?B?alFVZVNnVnJ0bDNZUE1nejhtMHVseGRaV2ZsNnFTY2x2Q2x1dHVkODhnaTE1?=
 =?utf-8?B?UWNEdC9rcnVnV3UybWpKRWxKbVhFejM5QzRIMmRxbVRrU2t1WGs4Z1dXZE9J?=
 =?utf-8?B?WGdIRnh5N3dUZitvS1dsdDhLOWgrSEpmN2RjV3VCbkRTZ1Z2Qy9ua0lBTVUz?=
 =?utf-8?B?Q2JPbUtxSFFTdzI4cUNEaGR5b3Y0QXpuWXJ0T2VEOGF3YUpEVHU2VGx5bk9k?=
 =?utf-8?B?V3lnRzAxKzhhZHhJb296OVRRdzVkd1pJc2JKSGxQdFV1bnNmSzdsTDUzY2Mw?=
 =?utf-8?B?dzlBcGQ1L1MycmhZOEwrSGVtMGhrOWZGRXpFRzFDN0xQR2ZSc2ZwU2VwaU9l?=
 =?utf-8?B?dUpCTjlqdDR6V2kvTmxpUmw5cEgxeVhTTTdEVlF1ZkFPaEl4UGk3R3ZtYVNt?=
 =?utf-8?B?ZS9nOUZoTmVsa2xjblluTVhjc2FyRjZjWXZzajg0Z00yQlRNSG5ta3VDNHpM?=
 =?utf-8?B?cVpzRzhNcC84RHFmOVJ3YTM0ZmdyUUpRcjBJZmhaUTEzWjk4SCtMcWtYYTMz?=
 =?utf-8?B?d1MzL00vMTIvTjRhZUY1alU1NmgvTy9GTXNjQUptcC9jVzk0bFpJKzE4WDgz?=
 =?utf-8?B?TEVQdWFDVzhoZmpDVmdYOUQwalFGSE9vbXRTWEhrK1dvZUhvdys0ZG1KRjQy?=
 =?utf-8?B?UXEvVDZzRTJUY3EvenBMWGw2dFhteTFWc2FKSkhiTTZwUlFWZTJRWFhYNGVw?=
 =?utf-8?B?NDNQY21KOXp6cm1RbXNWTHNmcjRmeElrM2l1bW1TNmZXR0tyU2xnRDVOdmhi?=
 =?utf-8?B?NmkrSVB3cDhFZ0dRL2xsMk9kU0RZak9oRGEzSWJBOFZrcENuSUJpQXhpZm5J?=
 =?utf-8?B?cWpGbFJyNEo1RVUxOFROOG5teVhzU1JpSGVsWkhPcElVNUI2ZTMzT3g5amdi?=
 =?utf-8?B?dWNtSFNTdGRIQlNrVyt1UVM4RXUrSjg0UHdWOEJXN2F1eGZWajRicTlsbzZ3?=
 =?utf-8?B?ZEhDRThBQzltSHVpMWFJL0M0Nk5JTG5Zc0dsNGJDQ0R1c05BNE15N0V4Q3pZ?=
 =?utf-8?B?aGFYYnpUVEJMR01PeHM1aS82c3dOdGhuaFBMWHdOTVA4bklaK3BGQmNCYVJt?=
 =?utf-8?B?Wmtpc1QzeXZmbVhuWjNwMDJ5VVpvYVpFQWxxdFByd3RHcXNlL250cVBDUito?=
 =?utf-8?B?VHVNOGtFeEIyT3YwRWZMd2VueS9SK3dHNnJpWGlTZW5oa0tleDRLQitxbkVm?=
 =?utf-8?B?dTlud3hLa0xYKzZZc1MxekVxYUJqaDdyUlFadkcwcTBzNVRHQ0JaVDh5bFpJ?=
 =?utf-8?B?L3loS3l2ZFkwdjJHYXJ6RW9BOUJoSUhIZlRhQWdVU2RIRWRBZlNYMDJlS2tw?=
 =?utf-8?B?NEplblpjemw2SXlKdlFXQTRxQ1ZYckxQMFdranYyWkVrUlh5US94RmIyQnBZ?=
 =?utf-8?B?a0ora21PdnhCQ2Z6dU1mcGdGNkR5TU1LN3cyZGV4Z1pMYUhtOEJiWnI3YmNW?=
 =?utf-8?Q?nR53Ou4B68dalZv2G0yd98L4QUuut6Az?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2V5UFJoc0JPYk82THQwbmZwOWd1ZFhkaGdkN3RObTMrLzRmZ2oyY3RnMEN1?=
 =?utf-8?B?Z3pPZHNvSlpYVHF2TmlrR01DR3VhbW5aYjJiT1BnZkdCR3BZa2NFakUvUTM4?=
 =?utf-8?B?eFF1OHZqK3l0aExETVFaeTFTWEh6YWtRS2dvc0VYM0MvcW1RN09tUWNMc3d6?=
 =?utf-8?B?YVF3NmN1bXpxMm14NlA4ZHpaSnUvRFRDWG0vYzhlblBCSngva0lTSXNFd1g0?=
 =?utf-8?B?TFBsOHBIN0ZuZFhSVWwzZkMyZnJmT3ZrRnpoSEhkNUlOZjZOTHZxVzVOZjlS?=
 =?utf-8?B?eENSN3R6QnNoUmNTWGpYQW1aS0pxREEzUUNCaUdwZ096ZXA4dHdCaFE5cWZj?=
 =?utf-8?B?VCtsNnZPb3FZYTY5NEZoZkFFMnVhQXlXTnllQUNLOEZNd20rS0JoclpJd05q?=
 =?utf-8?B?VFBjWkMzWWxHS0VuU0czc09qZ1VqT25aTHE1ekJOc3kxOXhSSnpBUFM2WUgr?=
 =?utf-8?B?L2FpOUd2cllPeUpmellmNUNVTHUzaHpnQVM2eFptVllJTDdESGdTRHA5QXB5?=
 =?utf-8?B?dHNYTktYeHBJZVBDandJRXpnQzZsa3RFcFdZL0lOVmI1TnBNVHQ5Q2Q5bGhi?=
 =?utf-8?B?MWV1MGUxa1l0bTQxbXlrMjNNQ2dpZXdHRng3NTFBQlBINkU5NEJaUUY0S1Zl?=
 =?utf-8?B?elFac3B1WWovTi9aMWpYbDBEclFrYWg0ZUtrSmNiNktUak1aaUJ0L3VNYzZr?=
 =?utf-8?B?cjg1RVNIV1NqV3dieldGTU9uZDhXSkcxSUJ1WHZaeXRJNGJaekl0b3JPdGFu?=
 =?utf-8?B?L1F6NXNlS1FBeWhBYXFUSTNpMmdPcURJS2FGdzlXUjd4MHEyQW9FaThSMDBu?=
 =?utf-8?B?U05BUmpFTHFqbE1vQmV2OFhLb09xSmFSRStGODZEeWJqcEFpcjVWd3UxUHJV?=
 =?utf-8?B?N21tYWV3bHluT3h0ZVdRZjlYa1pNRmtiSzhtT2IxTGV0ci9MR1ZDNUNWL2dp?=
 =?utf-8?B?L2lCSG9MSjNVYnlMd1JNQVZtNkV6bDhad0l3c2RFRG9icVFYRmwzRFN6RE53?=
 =?utf-8?B?TzZnM2NDbXZBa0FQOVM1ODhrUWl3a041THRuRXRrVU82YURUUkllMzcxVmUv?=
 =?utf-8?B?K0s0OXI0ZjNzWlFzV2lwVWgrTFRzVitLWFRheGQ4Y1hnZVdrVVFqRUErMENa?=
 =?utf-8?B?cmhqRWlOUGJNSGNqUjg3a2lNeW90Tmh1UVVuenFaSW5iOVBrZXRwdG1DbXdZ?=
 =?utf-8?B?cHMyUmNFdzFVQ2h0a3hzK1BFT0JZVHlNUTVDSC9vbkpUZVNXS1luODVNa2gz?=
 =?utf-8?B?bmVLVGtQMHNDZlI1SWFwUjd3REZRaWJ4M25TNEZqYnlaemZQU3JaUWg1R3RX?=
 =?utf-8?B?V2FzU1FSUmRXMmhJNlU4TVFRejlxWTNodndzYWFvZmxoMHBJK3Nod2RIRTBY?=
 =?utf-8?B?ZVZsMTVHeGFCM2w2Z2lERHp6bUpUVHI2WlVCa0N2QUt3ei8vSG5KSWFFT3Yv?=
 =?utf-8?B?MXNNNld1ZDlqcml1QXVaKys5VEhQMzUyZ0pKWFpVQVAxUjVHQUUzaWRTSUFj?=
 =?utf-8?B?V1FmY0ZpbS9zRHNOVXZGWUxXN2IvUFF6cjdtVTBJUlpwS0JPWmt1b2p0VDZ0?=
 =?utf-8?B?SjF6SEFOOFJ5UUc5RGEwak45SmExa1JGTmp5RmZYUlU0bDltUXhrRXQ0THRu?=
 =?utf-8?B?WE1QNWVQdExNNFZZMVBFUE1UeXcrU0pXZ1M0SDNyK0FzRnAwT2prWm1nVFlO?=
 =?utf-8?B?RWt0VUVZT3BZYTBDTmZlV0VXb01BdE8xZWNrVEhNZVRkUHlZeDU2Q2FzR1JW?=
 =?utf-8?B?R0FOa2FXZTlBWm8yanJEODE4MGhtb29MSWh4UVhTUTlSQ2NwR2poU01HOXBJ?=
 =?utf-8?B?UmIyTDdSakZqc0pMcTN5TVU2bXZzV1kySXBzVkVSWTIwTXdDUXQwQVpDd3JG?=
 =?utf-8?B?bkt1TjZCTVl3cnRYb0MzNlJ2aGRwRWxqd0tzMWV6UXVGV1oydnZoQUxrYWlB?=
 =?utf-8?B?TG1TdXpoeXR6b3JXOWdKM0M4dG5Qd2J3aW5EUWVuRVI1bUcxT1lsZHFZZmQv?=
 =?utf-8?B?aFJnSWJvQTNhM0lJQVhXS3pva1V4SHZVZDgzYld2L2NzaVdJazM5LyttUEI1?=
 =?utf-8?B?QzhrUXVrdzR3QlEvZ1k2UmNUVHc3cTJEbDdsRUp6NmFvQTJhZlJhdHg1UCsx?=
 =?utf-8?B?WnZwanNha0N2djZDL05QMldRWlFJb1FreWd3WHQ3c2hFT3pKZGRZZVFpVVgr?=
 =?utf-8?Q?YHODB3uJTYAKC+S646VtD/++2ie6ZyMlnnWwFPu14L9n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77690e71-cdf7-4d84-553c-08de056daa19
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 06:49:29.9049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5nb56NGmFAOWZNg0eRDbM9vhG3dzv9BqJRAcF9tbWLLx4V9Ggf27PVszJ9DDZ8gouVhF7CJKKgcpr1C7w/IFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317
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

Hi Edwin,

(replying as I wrote the original code and introduced the points you are
discussing).

On Tue Oct 7, 2025 at 2:56 AM JST, Edwin Peer wrote:
> Hi Joel,
>
> I recognize that this patch is intended to be a code move, but I=E2=80=99=
m seeing this code for the first time, hence the comments regarding the con=
tent below.
>
> On Oct 3, 2025, at 8:47=E2=80=AFAM, Joel Fernandes <joelagnelf@nvidia.com=
> wrote:
>
>> The bitfield-specific into new macro. This will be used to define
>> structs with bitfields, similar to C language.
>>
>> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>> drivers/gpu/nova-core/bitfield.rs    | 316 +++++++++++++++++++++++++++
>> drivers/gpu/nova-core/nova_core.rs   |   3 +
>> drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>> 3 files changed, 329 insertions(+), 249 deletions(-)
>> create mode 100644 drivers/gpu/nova-core/bitfield.rs
>>
>> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/b=
itfield.rs
>> new file mode 100644
>> index 000000000000..dd0ef2016ff8
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitfield.rs
>> @@ -0,0 +1,316 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Bitfield library for Rust structures
>> +//!
>> +//! Support for defining bitfields in Rust structures. Also used by the=
 [`register!`] macro.
>> +
>> +/// Defines a struct with accessors to access bits within an inner unsi=
gned integer.
>> +///
>> +/// # Syntax
>> +///
>> +/// ```rust
>> +/// use nova_core::bitfield;
>> +///
>> +/// #[derive(Debug, Clone, Copy, Default)]
>> +/// enum Mode {
>> +///     #[default]
>> +///     Low =3D 0,
>> +///     High =3D 1,
>> +///     Auto =3D 2,
>> +/// }
>> +///
>> +/// impl TryFrom<u8> for Mode {
>> +///     type Error =3D u8;
>> +///     fn try_from(value: u8) -> Result<Self, Self::Error> {
>> +///         match value {
>> +///             0 =3D> Ok(Mode::Low),
>> +///             1 =3D> Ok(Mode::High),
>> +///             2 =3D> Ok(Mode::Auto),
>> +///             _ =3D> Err(value),
>> +///         }
>> +///     }
>> +/// }
>> +///
>> +/// impl From<Mode> for u32 {
>> +///     fn from(mode: Mode) -> u32 {
>> +///         mode as u32
>> +///     }
>> +/// }
>
> Is there a reason for the asymmetry in the From conversions for the user =
facing enum type? Here we have u8 in the one direction and u32 in the other=
. It looks like the latter is required by the use of u32:from() in the set_=
<field>() accessor, but the macro would be more ergonomic if it handled the=
 necessary upcast conversions internally too.

Mmm, good point - actually it turns out the field setters work with the
type of the storage, and not of the field. This problem was in my
original code and is not introduced by this series.

I agree that we should have symmetry here, and actually that will be a
requirement to start using the TryFrom/Into derive macros [0].

I do have a patch available for this, which I kept for when we start
using the derive macros, but we should probably integrate it at the
beginning of this series.

[0] https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gm=
ail.com/

>
>> +///
>> +/// #[derive(Debug, Clone, Copy, Default)]
>> +/// enum State {
>> +///     #[default]
>> +///     Inactive =3D 0,
>> +///     Active =3D 1,
>> +/// }
>> +///
>> +/// impl From<bool> for State {
>> +///     fn from(value: bool) -> Self {
>> +///         if value { State::Active } else { State::Inactive }
>> +///     }
>> +/// }
>> +///
>> +/// impl From<State> for u32 {
>> +///     fn from(state: State) -> u32 {
>> +///         state as u32
>> +///     }
>> +/// }
>
> Similarly for bool vs u32.
>
>> +///
>> +/// bitfield! {
>> +///     struct ControlReg {
>> +///         3:0 mode as u8 ?=3D> Mode;
>> +///         7:7 state as bool =3D> State;
>> +///     }
>> +/// }
>> +/// ```
>> +///
>> +/// This generates a struct with:
>> +/// - Field accessors: `mode()`, `state()`, etc.
>> +/// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaini=
ng with builder pattern).
>> +/// - Debug and Default implementations.
>> +///
>> +/// Fields are defined as follows:
>> +///
>> +/// - `as <type>` simply returns the field value casted to <type>, typi=
cally `u32`, `u16`, `u8` or
>> +///   `bool`. Note that `bool` fields must have a range of 1 bit.
>> +/// - `as <type> =3D> <into_type>` calls `<into_type>`'s `From::<<type>=
>` implementation and returns
>> +///   the result.
>> +/// - `as <type> ?=3D> <try_into_type>` calls `<try_into_type>`'s `TryF=
rom::<<type>>` implementation
>> +///   and returns the result. This is useful with fields for which not =
all values are valid.
>> +macro_rules! bitfield {
>> +    // Main entry point - defines the bitfield struct with fields
>> +    (struct $name:ident $(, $comment:literal)? { $($fields:tt)* }) =3D>=
 {
>> +        bitfield!(@core $name $(, $comment)? { $($fields)* });
>> +    };
>> +
>> +    // All rules below are helpers.
>> +
>> +    // Defines the wrapper `$name` type, as well as its relevant implem=
entations (`Debug`,
>> +    // `Default`, `BitOr`, and conversion to the value type) and field =
accessor methods.
>> +    (@core $name:ident $(, $comment:literal)? { $($fields:tt)* }) =3D> =
{
>> +        $(
>> +        #[doc=3D$comment]
>> +        )?
>> +        #[repr(transparent)]
>> +        #[derive(Clone, Copy)]
>> +        pub(crate) struct $name(u32);
>> +
>> +        impl ::core::ops::BitOr for $name {
>> +            type Output =3D Self;
>> +
>> +            fn bitor(self, rhs: Self) -> Self::Output {
>> +                Self(self.0 | rhs.0)
>> +            }
>> +        }
>
> Why do we implement BitOr for the register type? Seems a bit out of place=
 for an abstraction that is trying to provide a safer field level access AP=
I.

Nice catch. I guess I wanted to make it easy to combine fields into a
new value, but that's what the builder pattern is for. BitOr makes it
possible to build an invalid value from two valid ones. I'll remove it.

>
>> +
>> +        impl ::core::convert::From<$name> for u32 {
>> +            fn from(val: $name) -> u32 {
>> +                val.0
>> +            }
>> +        }
>> +
>> +        bitfield!(@fields_dispatcher $name { $($fields)* });
>> +    };
>> +
>> +    // Captures the fields and passes them to all the implementers that=
 require field information.
>> +    //
>> +    // Used to simplify the matching rules for implementers, so they do=
n't need to match the entire
>> +    // complex fields rule even though they only make use of part of it=
.
>> +    (@fields_dispatcher $name:ident {
>> +        $($hi:tt:$lo:tt $field:ident as $type:tt
>> +            $(?=3D> $try_into_type:ty)?
>> +            $(=3D> $into_type:ty)?
>> +            $(, $comment:literal)?
>> +        ;
>> +        )*
>> +    }
>> +    ) =3D> {
>> +        bitfield!(@field_accessors $name {
>> +            $(
>> +                $hi:$lo $field as $type
>> +                $(?=3D> $try_into_type)?
>> +                $(=3D> $into_type)?
>> +                $(, $comment)?
>> +            ;
>> +            )*
>> +        });
>> +        bitfield!(@debug $name { $($field;)* });
>> +        bitfield!(@default $name { $($field;)* });
>> +    };
>> +
>> +    // Defines all the field getter/setter methods for `$name`.
>> +    (
>> +        @field_accessors $name:ident {
>> +        $($hi:tt:$lo:tt $field:ident as $type:tt
>> +            $(?=3D> $try_into_type:ty)?
>> +            $(=3D> $into_type:ty)?
>> +            $(, $comment:literal)?
>> +        ;
>> +        )*
>> +        }
>> +    ) =3D> {
>> +        $(
>> +            bitfield!(@check_field_bounds $hi:$lo $field as $type);
>> +        )*
>> +
>> +        #[allow(dead_code)]
>> +        impl $name {
>> +            $(
>> +            bitfield!(@field_accessor $name $hi:$lo $field as $type
>> +                $(?=3D> $try_into_type)?
>> +                $(=3D> $into_type)?
>> +                $(, $comment)?
>> +                ;
>> +            );
>> +            )*
>> +        }
>> +    };
>> +
>> +    // Boolean fields must have `$hi =3D=3D $lo`.
>> +    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) =3D> {
>> +        #[allow(clippy::eq_op)]
>> +        const _: () =3D {
>> +            ::kernel::build_assert!(
>> +                $hi =3D=3D $lo,
>> +                concat!("boolean field `", stringify!($field), "` cover=
s more than one bit")
>> +            );
>> +        };
>> +    };
>> +
>> +    // Non-boolean fields must have `$hi >=3D $lo`.
>> +    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) =3D> {
>> +        #[allow(clippy::eq_op)]
>> +        const _: () =3D {
>> +            ::kernel::build_assert!(
>> +                $hi >=3D $lo,
>> +                concat!("field `", stringify!($field), "`'s MSB is smal=
ler than its LSB")
>> +            );
>> +        };
>> +    };
>
> It would also be good to find a way to catch overlapping field definition=
s.

Overlapping fields are actually a feature.

>
>> +
>> +    // Catches fields defined as `bool` and convert them into a boolean=
 value.
>> +    (
>> +        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool =
=3D> $into_type:ty
>> +            $(, $comment:literal)?;
>> +    ) =3D> {
>> +        bitfield!(
>> +            @leaf_accessor $name $hi:$lo $field
>> +            { |f| <$into_type>::from(if f !=3D 0 { true } else { false =
}) }
>
> if f !=3D 0 { true } else {false} =3D> f !=3D 0

Oops, thank - will fix.

>
>> +            $into_type =3D> $into_type $(, $comment)?;
>> +        );
>> +    };
>> +
>> +    // Shortcut for fields defined as `bool` without the `=3D>` syntax.
>> +    (
>> +        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool =
$(, $comment:literal)?;
>> +    ) =3D> {
>> +        bitfield!(@field_accessor $name $hi:$lo $field as bool =3D> boo=
l $(, $comment)?;);
>> +    };
>> +
>> +    // Catches the `?=3D>` syntax for non-boolean fields.
>> +    (
>> +        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type=
:tt ?=3D> $try_into_type:ty
>> +            $(, $comment:literal)?;
>> +    ) =3D> {
>> +        bitfield!(@leaf_accessor $name $hi:$lo $field
>> +            { |f| <$try_into_type>::try_from(f as $type) } $try_into_ty=
pe =3D>
>> +            ::core::result::Result<
>> +                $try_into_type,
>> +                <$try_into_type as ::core::convert::TryFrom<$type>>::Er=
ror
>> +            >
>> +            $(, $comment)?;);
>> +    };
>> +
>> +    // Catches the `=3D>` syntax for non-boolean fields.
>> +    (
>> +        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type=
:tt =3D> $into_type:ty
>> +            $(, $comment:literal)?;
>> +    ) =3D> {
>> +        bitfield!(@leaf_accessor $name $hi:$lo $field
>> +            { |f| <$into_type>::from(f as $type) } $into_type =3D> $int=
o_type $(, $comment)?;);
>> +    };
>> +
>> +    // Shortcut for non-boolean fields defined without the `=3D>` or `?=
=3D>` syntax.
>> +    (
>> +        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type=
:tt
>> +            $(, $comment:literal)?;
>> +    ) =3D> {
>> +        bitfield!(@field_accessor $name $hi:$lo $field as $type =3D> $t=
ype $(, $comment)?;);
>> +    };
>
> I realize that the additional From conversion and closure invocation this=
 produces will likely be optimized out when compiling at a suitable optimiz=
ation level, but this is inefficient for register accesses in non-optimized=
 debug builds:
>
> https://godbolt.org/z/YcTGh9xor
>
> It should be relatively straightforward to have the macro construct appro=
priate wrappers for an inline accessor function only when the conversions a=
re needed, which would compile to something more efficient by construction.

This would only be possible if the field has the same type as the
storage type, which it seldom the case. I don't think it is worth
complicating the code to support some edge case that is only relevant on
non-optimized builds.

Furthermore, conversion will be unavoidable once we start using bounded
integers.

>
>> +
>> +    // Generates the accessor methods for a single field.
>> +    (
>> +        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
>> +            { $process:expr } $to_type:ty =3D> $res_type:ty $(, $commen=
t:literal)?;
>> +    ) =3D> {
>> +        ::kernel::macros::paste!(
>> +        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> =
=3D $lo..=3D$hi;
>> +        const [<$field:upper _MASK>]: u32 =3D ((((1 << $hi) - 1) << 1) =
+ 1) - ((1 << $lo) - 1);
>
> I note that genmask, introduced in a subsequent patch, also uses this con=
struction (based on the range, which does not appear to be used by current =
code).
>
> Using const MASK: u32 =3D (1 << $hi - $lo + 1) - 1 << $lo would be more c=
lear.
>
> It can also be a good idea to first right shift the value in the accessor=
 and then utilize an unshifted mask, since smaller constant masks can lend =
themselves to more efficient immediate instructions (as in the godbolt link=
 above).

The next patch addresses this by using genmask. Let's not modify code on
a patch that is a strict move, as this would make it more difficult to
review.

>
>> +        const [<$field:upper _SHIFT>]: u32 =3D Self::[<$field:upper _MA=
SK>].trailing_zeros();
>
> const SHIFT: u32 =3D $lo;

Indeed. Let's address that in its own patch.

Thanks for the review!
