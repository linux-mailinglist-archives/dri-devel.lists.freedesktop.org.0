Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E5ACD71F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 06:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89DC10E260;
	Wed,  4 Jun 2025 04:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ud5+A968";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B1C10E05C;
 Wed,  4 Jun 2025 04:18:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DPwd0l68ohOdCwAEDZfZMfhRtrl1VW/LZ+QJ3NPrxFjvgcAsmUHzKivt1U2xT702SOcxcU8w+5a2J+KDgY9+dsg1y4MbZf/ihBvDySfQ4XOz95+yzlCGLMUTsoHTjpUjyTiv2QCwzxBPuliekHkIR9gFWaQ/zzHY/Bdb448Qw0KK8eGK+OPJRbnsx+GXizghhR+iHxLyV6XYvnFzTXSMXokEC7wchyrPTe3vDrbg/mtYP+jDNxqkV2SP7AwAmwbU52opa0NDZKuYaiiNo0hDLGBIDyMfjUlU7wbmsHZAEfUU8iPWjAByBY5u4xxeCcs6HIdStnyusDiuIbHkVJszYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMSsrfHLspD/IpCSOTEIy2wFrUSU9TK0Wc1yJVPQVhY=;
 b=t/f5oTiFAITVI+yh5svbFMeqJ5CnArwC+f4eUKUvUc96P9qjIOhqaY7EsudY4jHR9vWlP+xQx1cSZe9oYzcZ9RdDUY2NLE18DH0SRJ+qYhLDV/Nt21aRL1jc5kg63JgddD6/Wjui4a01v7srpOKe3l/5GYax274TLPm6AWpLFVaEZcSJj6rMGgVHf2VhLgiZCpbk7ZLXG6lyaBfsKD/ti/owDY+mWbDRdys1Gb3oSLDbFUtQyixG08xNEQtc88QH3piKLBFEQh9GNHP5YNDp5F6h0bLz3jCPb89wd9VpHZVSyMuQBFs9g06ZoLK4HyeFkdaBB42e2PxKvSTQvcalcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMSsrfHLspD/IpCSOTEIy2wFrUSU9TK0Wc1yJVPQVhY=;
 b=ud5+A9684XY19GMudcjhS7KMCb9iKFQwkBj91ANyIuFfF0xwXluiUy0FGXd9twuOXs+vtsD5ICmqfwjzu2Nq2Pqnz+j+IqeoBVR2sT9HJiW7TI1CxwFGuodEPUmpL+uZmRXYm5wrZYXaCsw2LfUpQFN4Q34PCoo/RTgk/RqiEqWXw7XGK+b37uw94N3HdEOugmF6LqVWPXj/JhhRFuwG0tewv9K/QbMIol/1CJMUws6F4YwIjsSrgOueqbpa6lmp3nztSbsSNp9Wpk5+2cc0lRIEQoBhtjBkz/mMMpSDbuOJpwcg1HJEyMiAQ5ajx40I4/NsIwCSMJv7k+4ZfT0rqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9731.namprd12.prod.outlook.com (2603:10b6:610:253::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 04:18:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 04:18:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 13:18:37 +0900
Message-Id: <DADGJZGG5PXE.170H96D26HIN6@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 17/20] gpu: nova-core: compute layout of the FRTS region
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-17-05dfd4f39479@nvidia.com>
 <632966ba8231e8f3c20350b217b225301280cdd3.camel@redhat.com>
In-Reply-To: <632966ba8231e8f3c20350b217b225301280cdd3.camel@redhat.com>
X-ClientProxiedBy: TYWPR01CA0042.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::13) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d4e78de-5b16-4a59-0cc2-08dda31ee2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmtva2xRMXFacU9mbzdSYmh0ejhkVTRrOVJnWlNWWHhzNlUxZ1BGWTl6ZTBr?=
 =?utf-8?B?clZjbDlKNTNJT2g5QXd4SVpvYnRSMk05bUZaU0oyNjB4VmNld1JEWldBR0dl?=
 =?utf-8?B?Y0ZBcXJRL3BwL0VLV3lCQnBjcFIxQ2k1cUw5TmtBSnVoTFJ5cFRCSTd0R21w?=
 =?utf-8?B?d1VEMDZCOEFsZDNzSmFXS01SMXRMSUZzdGoraDZKWW4xc01NaUFMYVREQTZm?=
 =?utf-8?B?bzEvaHlBd3U4aXFDS3BLN1kwOTNNdG1WL24zOUVHZlVZQ0tsYTh5V09QNXdn?=
 =?utf-8?B?UUVwVjQ5ZmhTOUVuWWgxaURaSHJmdlZaZ0ZPMmJIQU4yN3hkbFBnZVhkYmdo?=
 =?utf-8?B?bTRQQmt5elRvcXA5azhUZUo3WXFaVUtBd1g1dUxmTUlKT0lmYTQzU2pIWXRo?=
 =?utf-8?B?b2VyZGtFamxFQndtRlFnRUZ0a0VCbHN6MFlaN3lSRFVlb3JpSytoUTZyRzFi?=
 =?utf-8?B?WEp1V3llSmxvZ280NWZqcjdNaHRtVURBN2xwQXl1SGpvRGxDV204ZjNsUnlF?=
 =?utf-8?B?cWR5VklXYlJOZkVCM1J4ODVOVWNtZWFpbkxZZXpVRmt2N3hDSHFxN0RDYllP?=
 =?utf-8?B?NUk4ajFvTm9OamluUU85MlNpc0QxNmVXU09ocEFxNjFSYWNFdWRrQ0xRL09j?=
 =?utf-8?B?ZVlkbElXaDNZUzFxUXl4bVFmVm9yUk5TTkhNVElnZFNwWmo2ZjEwSWJpV2Fq?=
 =?utf-8?B?YXVaU2UxNFE3RGVrUzd0a1libTFrWjFJY0pkWVd4dUFvbC8vdE9VWDBDZk1C?=
 =?utf-8?B?b0R2YkxHT0ZHRUpOelowaU9Jdktpb2hVMUUyNzhyUnczbXBhdEN6TWhma0pL?=
 =?utf-8?B?NERDdDJKT0VLbnJDY3hYL04xUEFESTBDbGNVR09xYlBPNVZuMUhMaXpxTnNq?=
 =?utf-8?B?bVZEeFF2ajFDcXdwcytYeEU1bXpvQ3kyRWpmQWFrYlFOeGFJK29SbFp4Ymo4?=
 =?utf-8?B?ZlRWU0VDYWNjZnhoNHYvUkc4ZTJVeTJNbTZQTDFHZGhyejR6NS9tK21SL0xD?=
 =?utf-8?B?alA2blkxemc3djdyODRYYXRqa1hMOVBDZDFaT1lVUWtpNHluYUp3RzlQaGYz?=
 =?utf-8?B?emFEaWs5TDdxQmhtY2RTUW94blUzZnR5MW1BTXpDVDlXUnp1WG4yZ1Z1QzE4?=
 =?utf-8?B?Ukx0VVlMSUFodjdaKzh4WmJUaFlIVlliN0FKOWtFcmo2bGMrMTBSMDJnTFYy?=
 =?utf-8?B?Q2NvUlFadUkrK0pScVpHUGNZTHBvT1kzRzZGaGo0Qi9xUDBNVU0vV0JaQUwy?=
 =?utf-8?B?RTNEZjJ4L3E4NUpKV0JuU0JybFNNTi9lYjZRd2ZGdjZzWUJPUzIvb2dKUWE5?=
 =?utf-8?B?MjFUZXdNR2lzU09RRTRLL1NmelJxdVBQU3JkdVJjSElzbzFGTGVDSFJtUDRt?=
 =?utf-8?B?ekZEZmY2ejcrYlI0djZjRXlpVnpBMFZzbHA2WHdZK3hqajFka0N1MFJzUnQv?=
 =?utf-8?B?Q2dYRURmU2lDWDA4aXdRRG1vbFZUNEh2RmFHbGd6b05ZT1RQM2VzbmVGS3dj?=
 =?utf-8?B?cndmQy9ScWtHbXBXSFFYd3BCbGhYdkhWS3E1UzlNMTlneDNiK3RHeVowbVlV?=
 =?utf-8?B?em9TeU1JWnNIbklldWZra3pFU09zRktNQkxLNXlMeEJqUmRHRTdBVlNkdzZO?=
 =?utf-8?B?My9wLzE0Z3l1Mld3UU9hRHhidzRGY0lNNXRiNzdjMGFEcUk3QzlJWUhCU3ZX?=
 =?utf-8?B?UkJPQ3d0Rm93RjczOTVyVlVnMW03K3BjL3RBN0pGdlN2QVJmbkRGZzQwNEty?=
 =?utf-8?B?S2lFQ052MUdTY3ZaR2txLzMwNFNoK0QzMnNVZnYxNFRkb0RIWUFqU2dlYk5U?=
 =?utf-8?B?M0dXVHJHYkphZU1iMTdHQWFrbUkwbUdJR21Ob0VTRkNqTmxLMTZPUVhYWUx4?=
 =?utf-8?B?a0FER1RwQ3NMeFZMVUhPMjU0d2Qyek81Q3BZaTc4OUFsd0dnNW8wdG4wODB3?=
 =?utf-8?B?M0t5MXU4SG9tUXNXZ0V4Nkl3SFlESVFRM0hSalpkNEtZNTZYMW12YnpHVEF2?=
 =?utf-8?B?NmtudWxtTXBRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(7416014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNPcFd5TFFQWXJlVUJ0T0d1QW5JaVBvS1ZLMlUrVXJhK2JZaGRNQSthY3RN?=
 =?utf-8?B?bUt2Qk0wRFlZSU5wYlZMc3QwYUdnQVRmbEdUbkVrdDk0d0tsQ2VDWDFnSTlV?=
 =?utf-8?B?M3RsNEpqV2lxNzhSUGVOa0RPbHBjeVBOanZSMjg0WVgvUGFhbXpxYTVxYU9i?=
 =?utf-8?B?anFYMVBoUVV2aTBOMXhMYXo5ZGVJT1AxOFJmMkwxL2ozaEg5ZWVDTlV6WWcw?=
 =?utf-8?B?ckZ4ZklWaFBpTWFjRC8xbWkvSEpBalloNFJxRWsrM2poZ05FVWJMT0RYb0ZD?=
 =?utf-8?B?VFl5NWhkcEMzVlZmWjR1ajcwcmNtTXlVVm5DNUJEcldGSm1SNG5kc1o0WVlq?=
 =?utf-8?B?VVQzbTgvakt3ZnB1UnpuVXFCd09GdGx2Qk0xUVp5NExOVDRlYmV5cjNDTTVm?=
 =?utf-8?B?R0NUZncyZEJXc3Q3N09mbHJyMDBhOEZGVFljaVB3Z3d2YlptS1p3ajZNelRz?=
 =?utf-8?B?MU9OMldnN2RWRDd0REZoZ0hTTENkNndTR1pxcHBib1lyTjlzVUd0NWFSS2p1?=
 =?utf-8?B?dWoxQ3F1T0pWbWpDd1QwWmQyaEFBQXBockdFdGhHQ0xqSFdQbXZIR0ZIV0I1?=
 =?utf-8?B?UGNkZ3UzbHJTTVc4VysyeUhIdFZaZEpOTjhYcWJJNWl2akpzaHR6Wm16aUVl?=
 =?utf-8?B?bzR2c05OdllUV0tDOEpQamJabWtrMFZVeng3VWxDVUxXRkY0dzNvMllrOEUz?=
 =?utf-8?B?WjNuTHpkc3pJSU9nNFMxcUdVMCt0aE5wUXIrMDVjSFQ4V2REYXB1YkN3NjZy?=
 =?utf-8?B?dktaWkpTRDV5a3VWVEJaS1psZ1RmbkRud0tLSEZZQTRMZGVjVXFJS1kzMFEz?=
 =?utf-8?B?ZVl2VG56U0FEU1h3d3Z2aVE2TVRINVU5VDZRNmpyYXQ5MERzVTFHTjVZeDVu?=
 =?utf-8?B?ZHVCWDQ5VXdaMm9sSythdlNGQXduaXpVTHJramVYUm5YMStrN1loNERKQmpn?=
 =?utf-8?B?TTdCRnBpczJyUXIvdVA0R1REVXcxUjV1aCtWV3RtTHQrYnV5QzRtTWpxeXJM?=
 =?utf-8?B?N3RqSGgyckZYZXlDZWgwbDdrQTFtaW1UYldTSkhWTkRwN1l5VFllYlBmc3J3?=
 =?utf-8?B?Yk5ESFRXOUxnZnMyRmpVMURVT2hjYlNQTnBFOFNrRmVFSG1jQ2JLUzVBSHBa?=
 =?utf-8?B?dGE1VmNZcitUbnNEVU9tbnJ4a2YrakZMRlV0TW5MQ2wxeUQ5cjZGczdyYlBt?=
 =?utf-8?B?QmxvV2sycjY1WlAzVzVmZ1JobktFZEgzTC85cFhLUE4xZDc3RE9IampSTUts?=
 =?utf-8?B?UURSUS9DUkdnbWVsYmpEV3RNajJSQmVJcWY1SmVDR05vWGxuV0N0UUkzZFda?=
 =?utf-8?B?Ri90Z0xhUmlDVGxsb2lwWGRWNGVNSm5qdHNrNjc3aTk3VHNBbHJiREFmczlH?=
 =?utf-8?B?bWo3NVVYNXJrTmR0NDJkUmR5Uzlndm9Kb0NjTm5GNkw2QTJNRU5kNEVtUXp1?=
 =?utf-8?B?MkhSNUJQTUZDcWJmNWJKd3A0Zm1Ec2VXZU40NzEzK25pcGNXV0gwTHFMbUt6?=
 =?utf-8?B?ckhEdlM3SlFjQ1lIbUp2Q1FyUjZVSmt3UzdNUG1kZnpYVi94MS81dk5LSDcz?=
 =?utf-8?B?SndkUU54TklEYVh3bDg3ME9qZ2s1bjdIY3BMK2NZOThWVUZPYWQxWEF2dXMv?=
 =?utf-8?B?MnVlWENFWjlZdi9tc0RmSkRXQnhWYVpLdkJTV1RwcnN0TkhFeTgrL25VQWVQ?=
 =?utf-8?B?T0NWK1dYWGZSY0pYNHJJaFNsaWpOMmhUUFJXUzR4R3lncFZ4dTlobzNHZDNW?=
 =?utf-8?B?M01vQjBqQlN5clVQVjk5Q0cyNTRSdkgwUTFwK0JjaVhDcGdRRDVqSWs0ZzZM?=
 =?utf-8?B?RHc5b1hHY1RWbHBQTkhhM0dvSS80aklDMUw5TU5DdGRtTFlmdVhvN3liOG80?=
 =?utf-8?B?dW03WlF2bGpsVGFIKzcrWDcvZDZhU21UWHpoeC81TUxEYmJrVmk4eitVKzB0?=
 =?utf-8?B?WDdHT3h2Q1J1TVRWd1NOaEZ2RlJvNytBdGRrUy91OWJuMlFtTit2Q2xpdkNa?=
 =?utf-8?B?Qy8wNGdNTk5LVHk1UEhVVXhMYjR0aEhvZlhLYmZMK21hNWcvN1lSSlFNdWFZ?=
 =?utf-8?B?TlluUXI5cnFyNHpHaDVKdjRBRnZEdityZkllaTlKRUg3OTZRRXZnclpEU21s?=
 =?utf-8?B?ZHJYUGhlcUxxcmphdU5BTXIva1VNYjJ5NkthVXJ2UjhYcUtWSC9yejY2bWQz?=
 =?utf-8?Q?5uFNd5cMjzBI21sTNpyz6baMy/ocOFqCSiujvrJ9KPMf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d4e78de-5b16-4a59-0cc2-08dda31ee2f0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 04:18:41.4588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdKgJlbRlRYE4D79jyxmSAqUGjjOsZbxLuJj8f/3x+1IW27rce5goTSSwWG4Qrg8mBRp3NNmclO6Nciw8WBAaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9731
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

On Wed Jun 4, 2025 at 6:14 AM JST, Lyude Paul wrote:
> On Wed, 2025-05-21 at 15:45 +0900, Alexandre Courbot wrote:
>> FWSEC-FRTS is run with the desired address of the FRTS region as
>> parameter, which we need to compute depending on some hardware
>> parameters.
>>=20
>> Do this in a `FbLayout` structure, that will be later extended to
>> describe more memory regions used to boot the GSP.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs              |  4 ++
>>  drivers/gpu/nova-core/gsp.rs              |  3 ++
>>  drivers/gpu/nova-core/gsp/fb.rs           | 77 ++++++++++++++++++++++++=
+++++++
>>  drivers/gpu/nova-core/gsp/fb/hal.rs       | 30 ++++++++++++
>>  drivers/gpu/nova-core/gsp/fb/hal/ga100.rs | 24 ++++++++++
>>  drivers/gpu/nova-core/gsp/fb/hal/ga102.rs | 24 ++++++++++
>>  drivers/gpu/nova-core/gsp/fb/hal/tu102.rs | 28 +++++++++++
>>  drivers/gpu/nova-core/nova_core.rs        |  1 +
>>  drivers/gpu/nova-core/regs.rs             | 76 ++++++++++++++++++++++++=
++++++
>>  9 files changed, 267 insertions(+)
>>=20
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 39b1cd3eaf8dcf95900eb93d43cfb4f085c897f0..7e03a5696011d12814995928=
b2984cceae6b6756 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -7,6 +7,7 @@
>>  use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
>>  use crate::firmware::{Firmware, FIRMWARE_VERSION};
>>  use crate::gfw;
>> +use crate::gsp::fb::FbLayout;
>>  use crate::regs;
>>  use crate::util;
>>  use crate::vbios::Vbios;
>> @@ -239,6 +240,9 @@ pub(crate) fn new(
>> =20
>>          let _sec2_falcon =3D Falcon::<Sec2>::new(pdev.as_ref(), spec.ch=
ipset, bar, true)?;
>> =20
>> +        let fb_layout =3D FbLayout::new(spec.chipset, bar)?;
>> +        dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
>> +
>>          // Will be used in a later patch when fwsec firmware is needed.
>>          let _bios =3D Vbios::new(pdev, bar)?;
>> =20
>> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..27616a9d2b7069b18661fc97=
811fa1cac285b8f8
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gsp.rs
>> @@ -0,0 +1,3 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +pub(crate) mod fb;
>> diff --git a/drivers/gpu/nova-core/gsp/fb.rs b/drivers/gpu/nova-core/gsp=
/fb.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..e65f2619b4c03c4fa51bb24f=
3d60e8e7008e6ca5
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gsp/fb.rs
>> @@ -0,0 +1,77 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use core::ops::Range;
>> +
>> +use kernel::num::NumExt;
>> +use kernel::prelude::*;
>> +
>> +use crate::driver::Bar0;
>> +use crate::gpu::Chipset;
>> +use crate::regs;
>> +
>> +mod hal;
>> +
>> +/// Layout of the GPU framebuffer memory.
>> +///
>> +/// Contains ranges of GPU memory reserved for a given purpose during t=
he GSP bootup process.
>> +#[derive(Debug)]
>> +#[expect(dead_code)]
>> +pub(crate) struct FbLayout {
>> +    pub fb: Range<u64>,
>> +    pub vga_workspace: Range<u64>,
>> +    pub frts: Range<u64>,
>> +}
>> +
>> +impl FbLayout {
>> +    /// Computes the FB layout.
>> +    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
>> +        let hal =3D chipset.get_fb_fal();
>> +
>> +        let fb =3D {
>> +            let fb_size =3D hal.vidmem_size(bar);
>> +
>> +            0..fb_size
>> +        };
>> +
>> +        let vga_workspace =3D {
>> +            let vga_base =3D {
>> +                const NV_PRAMIN_SIZE: u64 =3D 0x100000;
>
> Don't leave those size constants out, they're getting lonely :C

Not quite sure where I should put these; they are not used (for now)
anywhere else, so the relevant scope is not obvious to me. Any
suggestion?

>
>> +                let base =3D fb.end - NV_PRAMIN_SIZE;
>> +
>> +                if hal.supports_display(bar) {
>> +                    match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).=
vga_workspace_addr() {
>
> Considering how long register names are by default, I wonder if we should=
 just
> be doing:
>
> `use crate::regs::*`
>
> Instead, since the NV_* makes it pretty unambiguous already.

We could - I'm just a bit wary of introducing lots of (unrelated)
register names into the file's namespace... Maybe we should split
`regs.rs` into smaller sub-modules, e.g. `pdisp`, `pfb`, `pfalcon`, etc?

>
>> +                        Some(addr) =3D> {
>> +                            if addr < base {
>> +                                const VBIOS_WORKSPACE_SIZE: u64 =3D 0x2=
0000;
>> +
>> +                                // Point workspace address to end of fr=
amebuffer.
>> +                                fb.end - VBIOS_WORKSPACE_SIZE
>> +                            } else {
>> +                                addr
>> +                            }
>> +                        }
>> +                        None =3D> base,
>> +                    }
>> +                } else {
>> +                    base
>> +                }
>> +            };
>> +
>> +            vga_base..fb.end
>> +        };
>> +
>> +        let frts =3D {
>> +            const FRTS_DOWN_ALIGN: u64 =3D 0x20000;
>> +            const FRTS_SIZE: u64 =3D 0x100000;
>> +            let frts_base =3D vga_workspace.start.align_down(FRTS_DOWN_=
ALIGN) - FRTS_SIZE;
>> +
>> +            frts_base..frts_base + FRTS_SIZE
>> +        };
>> +
>> +        Ok(Self {
>> +            fb,
>> +            vga_workspace,
>> +            frts,
>> +        })
>> +    }
>> +}
>> diff --git a/drivers/gpu/nova-core/gsp/fb/hal.rs b/drivers/gpu/nova-core=
/gsp/fb/hal.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..9f8e777e90527026a3906116=
6c6af6257a066aca
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/gsp/fb/hal.rs
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +use crate::driver::Bar0;
>> +use crate::gpu::Chipset;
>> +
>> +mod ga100;
>> +mod ga102;
>> +mod tu102;
>> +
>> +pub(crate) trait FbHal {
>> +    /// Returns `true` is display is supported.
>> +    fn supports_display(&self, bar: &Bar0) -> bool;
>> +    /// Returns the VRAM size, in bytes.
>> +    fn vidmem_size(&self, bar: &Bar0) -> u64;
>> +}
>> +
>> +impl Chipset {
>> +    /// Returns the HAL corresponding to this chipset.
>> +    pub(super) fn get_fb_fal(self) -> &'static dyn FbHal {
>> +        use Chipset::*;
>> +
>> +        match self {
>> +            TU102 | TU104 | TU106 | TU117 | TU116 =3D> tu102::TU102_HAL=
,
>> +            GA100 =3D> ga100::GA100_HAL,
>> +            GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD1=
04 | AD106 | AD107 =3D> {
>
> Hopefully I'm not hallucinating us adding #[derive(Ordering)] or whatever=
 it's
> called now that I'm 17 patches deep but, couldn't we use ranges here w/r/=
t to
> the model numbers?

I wish we could, but Rust doesn't allow this yet:

    error[E0029]: only `char` and numeric types are allowed in range patter=
ns
      --> drivers/gpu/nova-core/gsp/fb/hal.rs:23:13
      |
    23 |             TU102..TU116 =3D> tu102::TU102_HAL,
      |             -----^^-----
      |             |      |
      |             |      this is of type `Chipset` but it should be `char=
` or numeric
      |             this is of type `Chipset` but it should be `char` or nu=
meric

Applying `#[repr(u32)]` on `Chipset` does not enable ranges unfortunately.

>
> Otherwise:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thank you!

