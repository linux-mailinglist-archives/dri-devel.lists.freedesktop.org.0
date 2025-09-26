Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE455BA2237
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 03:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA4710E329;
	Fri, 26 Sep 2025 01:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZSS9VZ1G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013039.outbound.protection.outlook.com
 [40.93.196.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F0110E329;
 Fri, 26 Sep 2025 01:26:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoeDuCbNAEKG55kU7TRFg0fUozxRsYrM+gIVxcRkcwMAv7b8Sn0RDKC2wzgFnfaeVGyvN9yNg6YUp1CSOrlDDFu+vBs5R74u2S8vn59wbQDhZknB1b4RJ01+LphzK+jee3CFeayoZpnL9AZOqDfKjXR8c7lsWcWpCcG799+CSq9klWodKJ9OtiGEFPMRRBASKF5YhZY+lOjamHuTfqdUajW1X+uU9Tnu1VwYBEsOTGxy4pJn6X78rZfwKOJ/jijblu1ZvmaEiZJ9qrinQWOeLwK6p04n0yEXrGJx4dI6YQAMCQ4epLl1Z1umxqmaVCln1V0v1nC8nyxfXj5JbN7B6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8n6zroIEmiBL/o5yRz3jvm0SCJdHCFVhebZY0YvHVlk=;
 b=RyXADmbEsqqDAwqabaUHZ8UXOnoveoaZ+p5Vt6N21DIXfNl2JV16LMZtddyyJIVSHxK2iJDqNYa8WouKBDyae5/gj4XR2UThKoK6XWpv/uXRoDPPKx5IE8jQrBgppA5TICIHX+xcBQcMAstuTaZnMEXJORVvvVnQyIEAyOZ/LB6Z7qGe0sA2vEf2DPQkRu2gjfzwACA2IXRAjTuAvjaQNF6zf5s3sNXnX72XlMnTC/KDVOaBFOTVfjMDwBiUxGWadVSUaD4acLfCqvmPTopdGP1KAqpOvM+neJNZpJOCQwvJ1J32nmjIVza+OduPbs+zfthicAGrGvCyMZpf359gOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8n6zroIEmiBL/o5yRz3jvm0SCJdHCFVhebZY0YvHVlk=;
 b=ZSS9VZ1GQL4yVYIXeccKT0HjzGlelUPPbkvtlhVNIjC9kXWkbmrR77wKCT4K4pKdPHc4LM554AHJI3tfmC/lPCguRlLM0PeLhdCgNNJh9EioR/w5L0q+JaiUxJxOELfMZEPOdTwGkNtq2Ub3+1diELOEJh1UaIUHgG30H8Jh00AqFhA4Uph6r1gzLG9T/n1tqO3FN/KA4LzJHEcPOVlEnYR5i8yoh2fjRbanjtENQ25CUwgeVYt+PJisZ3YD/P9IK5LvivZ/wL1ZDBXZ/87bB6WRoNNzU15b8jwiyuyp1vLwrzYAn1LL51HuwTH1jQwlfF+oHDNY24Uyr1uNAsQ1mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 01:24:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 01:24:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 10:24:40 +0900
Message-Id: <DD2C8WLZ0SKN.VEB4AXG4I0UZ@nvidia.com>
Subject: Re: [PATCH v2 03/10] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-4-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-4-apopple@nvidia.com>
X-ClientProxiedBy: TY4P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 000c7315-4b64-46fd-0cec-08ddfc9b790c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHJqUVBVNWF5eXQ5UjRZd3ZpRml0ZFhSVlRsY0gzMkdoajF2c0IrV250dlhX?=
 =?utf-8?B?L2NJZEk4cGQvWnN0Vmo2Ky91VDJ3U2pJUTdhY3dtWTBNVDZXL0dBdGw0MXAw?=
 =?utf-8?B?K2RiZ1lldEQ5VU9qWHdhdmI5MEZ4VlVmZ0dOUVMyaTJMMWRwK0tNL2RsMkFU?=
 =?utf-8?B?dDFvSzc4N20wZkJqUkJNMXZTbWRFMWYyVGQreWd2bVRyMm5pblhncTNhWWlE?=
 =?utf-8?B?YkxOTlVoZkVabTh6S2pBRmxqRnhnbjdWV2hOUjNla0FLU0NYVmpaRnZCY3VC?=
 =?utf-8?B?NzM4emliK1ZWVjlvRkd6WFRxMFhSbDhKaEsydUVXWnBYNmgzSm1VeDRDbk1x?=
 =?utf-8?B?VVA0WnZjRXJJVlNkV2VkdDlpTStrNTBxbVRQdDVCbjh6cTkzWlhSTFlFTUlM?=
 =?utf-8?B?RTFvTTUrSnhSWTV5dHZjWmkvSUFVT2RUWUVsamhxeDF1enN2dTl5ZGFyemkr?=
 =?utf-8?B?QW9JS1JIbUZzUUt3THg4dndnUHljTSsvOHVsZDNCMUxtaFNDWnhyZjNDKzJu?=
 =?utf-8?B?ZlBjejZ1MEoyc0l5RENhQWJzN0FFSmhaZzNwSFpWN3N1TUo0VkkyQkVqcTdS?=
 =?utf-8?B?aHFSWjJnaE5RMFpkaUZXWSt5cmJEOWQ4NEllU0VlbnVGOCs4SU1yREFLdjRS?=
 =?utf-8?B?VVJWcXdKOU5OUmgxTk1ucFF1Q0t0VlZ6M3Z3eWxnc3JQSm8wRW1LU0pXekg1?=
 =?utf-8?B?WWcyeW5xdVBkRlh0VkRmOUE2anEwWVUxN3MwM1V0eEo1TS9tVEtiQWxqSEdV?=
 =?utf-8?B?WmY3VFVoM2J2dnNTS1ZqQjBURmNITjN5eXFLYkRxajlDTGVTR0ljbzBZYWM0?=
 =?utf-8?B?TnpYelVzMS9NQnZidm1WaXpSb083VzhNR0lFQk96RDRyeWZ1bXU1REZ1bUNt?=
 =?utf-8?B?eE1yWGZ6bTh6b3FyalcyMm02OHhQRDF3OUdLMm14L2ZVbjdKZkQ5TExiQW1o?=
 =?utf-8?B?bHVrNHFtTUpBcUFTYmx4VmR6Q1E3bjlQKytIV2dUTWlaMnFabG9QVUZuWUNw?=
 =?utf-8?B?b2hWcGVlaDRkamJndDg1bXY3ZHluOVRIZUwxSkEyRTJEaUp2eTBPUFBFZWo3?=
 =?utf-8?B?a0NNZ2pYY3lNZkxIM2JIdEZDditBQkVBS1VRekJNVDJQWlBqM0tsV0VFeDlo?=
 =?utf-8?B?ZEszaDdlclRyTVpMSHFFVkw1V2FlZDlxM1IyWTNvYVdLOW9GT1lHMWNZNGVk?=
 =?utf-8?B?UVE2ZTdzdk1vZTg2SC9IWWpQeUxCdTRBckhtQUR4RThXdzY2RTFqZ3B6MEtW?=
 =?utf-8?B?Q3FpRDNMaTZPM00yT1pGQTBwbDh0bE92UlNwdDMvL0dBWmF3S0JIVC8xK2F1?=
 =?utf-8?B?ZkRXQVc0ZGJUcUZkeDBiK1U1MXFYWG03NFJxU3BhUm5mbEp5TTRFc1lIQjhj?=
 =?utf-8?B?TmQ0aFdESjB5bUFWQ1ZMeGVNTjNNZE82bTdTYWJ5RlVobGEwMUdBU3VLZVYy?=
 =?utf-8?B?VjUzcksrY054TmF5ekcvRTJyaC85T3F3c2tySHprRlQ3ZFFRL2tLM0xJYS9W?=
 =?utf-8?B?UjJTdTdqSDJPTUxNcEl1Sy92NGF0Qm9BZVVaaVorMTZQS0VLQkFBSzAyNzNn?=
 =?utf-8?B?amhjY1RLTFZ2T2VIWnkwckpiT2lWS2JnY2p2eFRhTHFQZEcyWmpzcVk2VzIv?=
 =?utf-8?B?dTRuelJYaTdaZi81d2ZBTlh4dDNlUWFKYnBLVDZlSHpEODI4aEU5THc1N2FX?=
 =?utf-8?B?ZkIwM3VITTdzOGVaUVo1Q1ZVdUdidU9POHV4cTVPZG10SENXZE5DZ0NEeHNZ?=
 =?utf-8?B?czYvSlVZOTRYRUUyL21aZ0VxVEJnSWFLb2FVS2ZSK2JWbnplTzZJbXZra3cv?=
 =?utf-8?B?UmFvM3lkVHRTY1V4NVB4VWFSRVN1STEvYTNCdHpZSStrNk44Tm5zd3p1NFFX?=
 =?utf-8?B?d0JnQTd2V05vTFRBOVpXZGpvYk5kOXFMbko5a1RKbXRXTTA2Z3RjL1dzQTgr?=
 =?utf-8?Q?9ZvUN0lFi6M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3Fmb3htbXduWlR2RFlSNUlDbGg0YTlJOHNtbUVFOTNFYTJqa2dIWWVlTm81?=
 =?utf-8?B?VWx2TDVXemkwbDBnYjEwWWx5aVVsK3Fhdy95UjlvWWc1RzhHUW9LOHlQdFlp?=
 =?utf-8?B?VElmTzJqRUw0SUpnRm9PWDhHL01qS2Fyc3NtRmgrbEowVjNlK0V0V1NNNUhq?=
 =?utf-8?B?OG5LTk04WTllSTNld05oWm05WU1PZzhvdlorUEp6WE4zSE8razVJYVNZOXBp?=
 =?utf-8?B?VEw1ZVQ2cnRVT0o0MGVvN1hTQmN3SWJ5dWVDNmh0YU51dkJ3ckFydXQ0Q2dr?=
 =?utf-8?B?MFJ2aGZXVVJlM0QzNExROFFOK0VSZWkyOTVEdnYrVU94Q0hISERvbndXN01y?=
 =?utf-8?B?MVdVMFNEUGxZRlJ4aHJ6ZlhFMkVvcnlSaEUwRHVPWHdLcXlaT2JEOEswNXZs?=
 =?utf-8?B?YWxiOGwxU1RaRmJFSFlud0lnWExuYkpxTDk1QktiMWdSN1JEeUdlajY2bGI2?=
 =?utf-8?B?NTJBclFQRmRPaTFXUnZSUTExQ3k4VWVLZ2pQZWJ6MTlEaGloWXdhZXNOajhD?=
 =?utf-8?B?Y3FWMDlTdTBqMXJQdWJZWXcwa3pWRjFkTGd3UUh0dnh3RWpxallxUW5sa1lx?=
 =?utf-8?B?QUoyb25PeXFSTzU0djF5T01XdzZHOURMaFBMY1NIMkVwanFQQ2IvSlFVRVcr?=
 =?utf-8?B?L0ZyV0FvbXNJNFlXMm8yRUdXZ0xlVEJhWGpBclRzQzkwcEpkOXBnU3NQSGNN?=
 =?utf-8?B?UG1VK25xSVBTVDIxOGtoa1I2SDZUUk5FZnhwblFDeTVqOS9VbTk5R2FzZDNo?=
 =?utf-8?B?ckxJNkk1SU9tOVZjajdYcGpONmE0cmRLeHlpMlVMSGtObW0zUWZjOEZ2aVlh?=
 =?utf-8?B?UVdnMHhuSXBabXhJcG1jT2ZjTFNxU29rZWZUMWNpeXp3OVU1TmEza01oS1FB?=
 =?utf-8?B?Y0wxMUxyVk5aeE9nRFFQQVFyRnFTR1AwVzBOLy9yYkg4VDVrVnZJMlExUHMw?=
 =?utf-8?B?UlF4b2NhK1p4TDE0cFdEYlduR1k3cGl3ZzFNRzFhUmRTV0EydVpIa3pYc0Z3?=
 =?utf-8?B?aFZ6eFRoVEo3N3dXQ3BTVXprcHZ4TFZISExhVG4vYVVvT2VYZDNZU3d0QTR3?=
 =?utf-8?B?eWMzMlFwRFlzOWZRY2czSVo1TTZlNWtCVmE3dGs0R1N5YzZsbEcyTS9xWXN5?=
 =?utf-8?B?cDJFclo5NWhBc3ZvN2QvcHNuaFN4aXR4dDl0VXFZUjFkcm5ONjhJV2szZlE5?=
 =?utf-8?B?RlFWMVNmMGwyQXR0R0wrU3ZFeWNGSDBmbDFSVEdiUkxjMmZTOGl0Q3dkMWVI?=
 =?utf-8?B?d1ZObUpxKzBzbE1BRmI0L1J3Ulo2aGdRQlFlYkIzZlUvNzBYMEhocUJxd09y?=
 =?utf-8?B?TCtLNmhybW1TUmhybkpVL0pkMFBTZjdteTVjbUplNFNYL1M4bVRRQnI0UXha?=
 =?utf-8?B?STNXSDh2a1YxL3RiT2lQakwyU2I5N1FXeHdhVU90U0ZOT0NKcjJSM3ZYRGdT?=
 =?utf-8?B?MVVlaXgzdWc3MG9ucWVhTnVCa1RZWUhYcm51UXlLT0V6WnU2bEVhUVMzSjI1?=
 =?utf-8?B?U3Vad1BrdjZiUm8wallzQXRnUjlobnl2cC92alJiMFhWVjdLbmtEL2dkVTdT?=
 =?utf-8?B?bmRvc0FtckQ3cDlRSlJQMHlrYXZUb0ZQQlQxRzlvalN5NkR5ZE40eFd3YlpB?=
 =?utf-8?B?Yk93dis0TW1CRlhJaldtME90RUZZNGowempBRFF1T3hOR0xVVzdtNmN5L3Yr?=
 =?utf-8?B?ODdXTEpwMkRrempVcmZrSko3WDZYS0xFNEowMzVKdjN5QU4wRGlwM3hoVmw1?=
 =?utf-8?B?T1dhY1htKzRuMDNNWmFDZzRPaS95YmNFaDlRc3JDQ09KL0ZJcHUwVnV5N0Vq?=
 =?utf-8?B?Y01jM0FWaDc5dDdwRHI3cWt1c1ptYUdQdlBieHNNRzZSTDBJVVJVaFA0cFJo?=
 =?utf-8?B?cUxES2ZVVEpOWmo3MGIxaVdPdndjS1JVaEY2bDliVGIxMWhPVU9MQXZJeVJ0?=
 =?utf-8?B?UEpvTHlWd2JLUW5vR0sreGJUczlPV1FjVmF0TGh1VjFkVHhZYnY5a1NKUmRJ?=
 =?utf-8?B?QlNUVkNwbDllVXdFMHB2cnpscDVLKzdKUGdrZFZRTkRjZkhoWGZKUU1paHRE?=
 =?utf-8?B?UFBUZ2g3aEdWTzgxZnBFUS9CcExLZVhUR1F4clFaY0ZkdUlxTHVlc1VlQnRY?=
 =?utf-8?B?bFI4UGFzeHgybFlWMWNmSWNJY2NPNi9kOFpGT2NIdzBxblhVUEVDcVludXJK?=
 =?utf-8?Q?XMGRwojIlpFhZkgKCoIJreAsSHUtm38embYr9Swel0NI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000c7315-4b64-46fd-0cec-08ddfc9b790c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 01:24:43.9093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fEER623TN11TsJ+R5NwRhF5QfNxDekzt0xPwP3phtPRgCA7K75LgVLSwOGKAvn71gGynAKLrodoiB4RopeH3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
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

On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index dd1e7fc85d85..7f4fe684ddaf 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
<snip>
> +pub(crate) use r570_144::{
> +    // GSP firmware constants
> +    GSP_FW_WPR_META_MAGIC,
> +    GSP_FW_WPR_META_REVISION,
> +};

Why do these need to be re-exported? I don't think we are using them
outside of fw.rs.

