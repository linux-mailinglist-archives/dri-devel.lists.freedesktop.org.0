Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EA7C9F65E
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 16:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30DF10E8AD;
	Wed,  3 Dec 2025 15:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oGHnva2u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2710E8AF;
 Wed,  3 Dec 2025 15:08:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lt7FgB4rmw15RlcWha6Nn3h9sMa+pP9o6zKQ69eouEjstJqkE0MGZ2XqeceaTkNQKsQLCmCvBN8BNwE6AIQ3fMoXxttRnBNBxX4LeF9tLQzFWzMoDFUERegLjyEHdKhhg3dH4Pb9xGoYTvOPdZJY/ifoOK/L4uY+egEWswgBlUGEUW+C3y8KS9yMNIlhJ9YgFRUKZagrZ4S3p4mm+K/uoo1FfSkId+w2lL4aNVApClJXoeGsU2/3WUCJnqEDWgWPeRHzw92njK521bb2u040brzGspG7aB9miXfqvN7d8QOOIC6coooy2VODREvFQnjyViB8Pbc0Bi6YDBekuhf1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQJzFyrz1QcFPtw9hrzfEyKky3/DhzuUeasyGw+a/ww=;
 b=qL3xTsi6hutHNdL1pn2Sf3SlCYvbiviorDqp8VfauMVzQAGCAC5epn/mrOKjB5VFtk/d9dJYdpxUuGElhno7sBNjq2++TCFw8mCPOtx9efVsI19Jt/IUVJyWorteB3S99YCY34qi13veEdWrCCJ8+dvo0e54FKMkNypdQW7s7swk+s8RB8azGqdoGVau2v1NoJ7IddUfYfXuWHtrSQTYcelpM5hf39LhJXMGuCIqNxN85CptZIv/7/yJ94IedP6c73h/k8gcrTmYr3LYn7tL+CQ9O+jniS8n35aMHg5xYtq1eFGoMxTTUB2URAuy6a5VdHnNOPPyUv+clC4MwHfuoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQJzFyrz1QcFPtw9hrzfEyKky3/DhzuUeasyGw+a/ww=;
 b=oGHnva2utpMJ1Med+X4nvSTbFvNIYkv9nKCEDe/wO+RCftekqFhl/tq2y6EYCz5/jXywDmSdJhIowg7KcapYdf4M27lW8xduJfRXfF4XFELSl9fN77r1k0Gy/F9du/DLDtLjTAP7L2+/EYKSuH0qaVv+NtTouebFq2NZHAzqKZt+JwhPPi4y+Aqt/7YPfAbUH8emRa2eHvf2bTO+rWpzzcfY2B+wBOa0T2OCxb7U4DzibP8v1nHnNDyXZzkxrL0kdIDbWGg//AWuJd5RMLT19olH05ZyvjktBovUCMMIUWP1Vky513iXN3I98uE3+s+Uxa1QR9koU7mkKO6Ior6LKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6641.namprd12.prod.outlook.com (2603:10b6:208:38d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 15:08:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 15:08:39 +0000
Message-ID: <44b99b6e-1ab7-404f-aeb4-62eacd40ad8d@nvidia.com>
Date: Wed, 3 Dec 2025 10:08:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: clist: Add support to interface with C linked
 lists
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@gmail.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251129213056.4021375-1-joelagnelf@nvidia.com>
 <DEOLRLCZQMBG.1WHBR4YL8SKYR@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DEOLRLCZQMBG.1WHBR4YL8SKYR@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:52c::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6641:EE_
X-MS-Office365-Filtering-Correlation-Id: dd468ac1-ed5a-449c-61eb-08de327dd6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1hUSWpwV1ZZMXZMRFMzUVJNZlI1Ty9SZnZUd3hKL3NSTmg5eU9iUHM5OUtp?=
 =?utf-8?B?YkY1cXpGeVlrTTl0bUtCSW9Wa2R3b3IwbmNuTnRtc3dGNzhjd245eUZZcWd5?=
 =?utf-8?B?UG9UeWc0a3NjVjZUdHEzak9ZTzRnYVdtTnlnUnFndys1Y2xtWVRtUWh6bUgr?=
 =?utf-8?B?YjZkOEZldjBwTTQ2Z2NraE9YVEVwQlpjVzVvZlplVnJxbTRDSVh6TFpOemlR?=
 =?utf-8?B?Q3R1Z3daTWExM3czNG1TWTljNG1wa1ZacktxT1kvcEpVTXgvaGNwbFdMSDVX?=
 =?utf-8?B?RVhHUmx3WHlCVU1LbUcvaVNnTS9zRlRwL0ZRbGlaNXNIUWhNUmxpYks5cFRG?=
 =?utf-8?B?Y2hISzZRcTFJdGR6NVJHUTBpazRSOGtHRlk4czN2S0tDNnphRnNZSVdVRytM?=
 =?utf-8?B?TjFJaTIzbEM2MGk2M3ZyVzdPZURwTHB1KzZqT2FSTW1haXVRQlJYQ2R0LzUw?=
 =?utf-8?B?UW9Fem42a1hBcThpb0VOSlRyeS9vUkpKV2lHSDgyNG1LTFlWRlpWMGlUMW9C?=
 =?utf-8?B?S1padXBVcHMwS1VJakRiRTl2bWloTUNTS005b0FoemdaVk5sM3J2aVNBa0Ny?=
 =?utf-8?B?WStWaGx2Z003bk9hMVhXeVhVUnNvR2xTRExiUnNUNVlxRjByb0xKMlE5czh4?=
 =?utf-8?B?WmxYQU50b05Va2xhblpSSUpHRmUvQmUxbm1Wb0RZRm1oWXVHcTQxV3piYUta?=
 =?utf-8?B?MThxZXAzd0xvczRjbSt6eVhiK3JibWJ1eVF4STFIQ2dVTWpZRjRlY2dMUmtM?=
 =?utf-8?B?WEJyeExHT2FoUjgrNmNnK1BUYloxcThFRGdJcldUVWllbVdvZlUvNklYSVM2?=
 =?utf-8?B?dVpOa29tUlp5VjBGenFvWUh3VEhYVCs2Mm84OWVkQmRRL0FHM3NVbnFOMDR5?=
 =?utf-8?B?V0RzRW51c0RGL1J2Z3lKTi9lUGxFQXB5UnpVSEtNMHY5VjdRWEZHZlp2ZWJF?=
 =?utf-8?B?cWs4YWs4Rjg4TjhCNFY1VVNWRnNFVmc5QStxdmV2bHNqWnV2aVhWY0g3K1Ir?=
 =?utf-8?B?Slg1TVp4UTkyVGU3TkQzYWJhNzQ3NFNodHZlMm9ZQ1AxaFlXR0w3c3NSeEJN?=
 =?utf-8?B?Yk9FOFFHWmVPWnRwMjBsUW5pU3AxMW1ObjZ2cTYyUm83bHZRT1RKMEMwbFJK?=
 =?utf-8?B?enpRMzJIcVFhb0xraDN2R01WTFZoRWF5R0JkZDlESjhINm9wSUdvN1VHQ01q?=
 =?utf-8?B?Qnh1K0I3NjhkVUxLbU1kNGh3My9Sejl2cUZpYnAwR0cxcy9JQzMwUDg4Zkhh?=
 =?utf-8?B?bVpMTHdlZ0tvUURWTHMvd2xjYzFYWmJOWEI5aVNUQSs3TkRsRE04VElRWVg1?=
 =?utf-8?B?Y1R2aEhWQkN0OXAyZ0JmQjdNc25NWE00ZmdScUxHZ0ZJOVdCQWlWaXU5bGhL?=
 =?utf-8?B?TmFPSUxxMVhaUkkwYUlaQUFweGVURXR0bEUxcGdWS0orVFRXa3c3TFg2ZVZ3?=
 =?utf-8?B?Q2lUVkRWdEtJSnBuR0VIbkVQT1NoQWE2V0ErUzdjcE12SExVNG9ERmFTZTdT?=
 =?utf-8?B?Yk4vaEgrR3VlTTl5TkRjc3BHL0V4cUFFNXZnWXdFRXZ0RmtVVUlVR0EreWlK?=
 =?utf-8?B?Q2QybzFheTNtR1JmRkh0Q0dEVHBOTWtBbkhVRUtoZkJzSHBMVTNyN3dvR0RJ?=
 =?utf-8?B?UVdkY3FGdi9OQWpVeWY4YWpUcVA2OWREU1VUVjZFeEtqMnNGc0VRYlVXYXcy?=
 =?utf-8?B?dGtKMTZLbStzVzRzQXc4QzllYWZBaWQ1bXdxSzAydWZJVys1Y3M0aGVlWlYx?=
 =?utf-8?B?OFBtUzgwRlkyVThLUUZndkhETktnR0ZoZVJxVkY1K2F4b0VubWM1Y3FoV05K?=
 =?utf-8?B?eVgzSWJ2WmkveGt5Y283WUpwQ3R3cDF3RHM4MldMbGN2N1U2M3lpMDFHMlhI?=
 =?utf-8?B?M2cvVlF0elF2YS9Kb3gwbXVONm9FbFpObU50SDUwaDdtSUl2TW5ITm03NWk5?=
 =?utf-8?Q?jUYKJemVgWqGE7ayITCX+3Xvr94EcgSV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJFT2t3ek5aYjlvSERxM0gyTnJaZGl1Mjg2UnhmN2pqSUtCbmN6Q3lDUVB5?=
 =?utf-8?B?QkQ2T1BlV1ZJS3JPZ3FkczAzSVJMTUtFNiticzh1MFZRTmhCN0N5bzFIRDBq?=
 =?utf-8?B?ek15TkpLVW9IamV3WVdpSnBGRWpsYWlYeS9oK1VlZ0diU3hNNkhhM05MaTU2?=
 =?utf-8?B?T0dTNTFlcFN0REFTeDh3QkVUSHZJUXFnRlhiNG84b2pWUGQ1ZlpDNnY0K3lT?=
 =?utf-8?B?ZEw1bGM2Q0hXQ0FwQmRoU2t6N0g4T0tVRExIb1VXRGdNbkxDTlBmZmphTGxq?=
 =?utf-8?B?dytITkJHd3FzYmlhOW5IVGIzZUhWR2JQQzlUOUtyWUkwaG1LSktuNTZsb2RW?=
 =?utf-8?B?NlFWNXJLeEMzdEROeGFVUW00VHRTbVNsTGgrT1VDc3JtUTRjQy9zOUlObDNz?=
 =?utf-8?B?RVdMQjBYODE1RXJKdFZocVg0U2l4QzFSUG5FQnNGY2Y1eHQ5ZHJMTjAwMXdS?=
 =?utf-8?B?NGszWnlNejNEYzZvQXhDM2RGcmk5KzVMQmVWOTNOVmJaMkpFVmFFbjAvZ2o0?=
 =?utf-8?B?V0Zwa2ZTejY0SUNPTWxKaXN5Z1dDM2RlNDg2dGMwRWdiNHdtVGVOL3B1V213?=
 =?utf-8?B?eFJQNTlmMEsxZ2ZjN0QveC9YL2p3VWY0U0NLbllNVXczZ0w2SEdrbzI4OUNm?=
 =?utf-8?B?bm9XaWZGM3pBci9PVFRaaXMvUk5TZ25iVUdqUFJTRzNjcGZsM2FMdkZoZi8y?=
 =?utf-8?B?anY2eUxBYWprcHJIcDFoYUtPbThQSlNocTdKemhtM2JuQm1RbElYQWJuSldV?=
 =?utf-8?B?cUtpS29KbWx6aXc0SkFYVFNqeVozVGovWUxZemJkZUxaR2FOd2FBZm9IQXp6?=
 =?utf-8?B?OXl3WW5XUmpBTkx2UUtMaGR6QVEwM3dhZmk2K0UwSDJOZGVCK2pwaFRqK1hG?=
 =?utf-8?B?bHpGWDRYczk5VUdBSVZOdkNrZURUVEN0M0ltaDBiL1A4U1BsNVJFV2c1eWVj?=
 =?utf-8?B?Z0RGUis2SWM0NUVKS285WmhheXhVcUZoT2FKVjFFMkkzcHdWZVZYWFdRVDNz?=
 =?utf-8?B?TWRDMTJCYkdxL01PViszbmsvTHBSZXFTN2dqdFdHMVIwcitmK0x1TVA5b09h?=
 =?utf-8?B?OWhTRXltdlorR0F6VHpWVVBNQlVPUWpmQ2kvaS96WVRmbDJQUzQwaWIxREg3?=
 =?utf-8?B?YytzVGVTT0xvclZiNzV2ZUlPbGdiNUVFMDdoMGhTeVlRR2U3WVp1Rkl2T1gw?=
 =?utf-8?B?RWtsVFE0RUtISUkwMWJSUTFOZysyOVJ1ZlgwL09ja0ROUDIzcUlwYXJOT2hv?=
 =?utf-8?B?cjBjRnk3eUxzVkFOL004akRUZjQveTdEamliWTd3dFQya0dvNzdEVC8xbm1h?=
 =?utf-8?B?WTBZMGhRZFpNNURFMTg4dzJnbW5SWTBWeHl2MDRKRTQyV0RXMWRXd3dJM2hG?=
 =?utf-8?B?MExqSkNTQ0ExdmV4YXNMb3ZvdFpDL1lydEUrYnp1QWN0OVRhODlpTFNyYkRm?=
 =?utf-8?B?c2lIL2xyY1U5NkdaTS9paHNGNTFLV3BEZE1oYVJibkxQNjIyNXl1eXAxS1RG?=
 =?utf-8?B?dGlPUDdpa1cxZFdJSHhETERmYjk5TFRVNU5IQ0hoVWZVWnV1QmlRZ1JBdVRJ?=
 =?utf-8?B?M1FlSUppVHRFZHVZR1ZWZXBROU0rRUZHamUwV1g2Qm9hRjlBdXRnWGVXUTFX?=
 =?utf-8?B?RlA5ZlNLWEZDdm01SlozVG85TWVFUE5HaENPeWtIeDhnWkRGY3dmdEJOQXpO?=
 =?utf-8?B?S2VITFMzMDZScmRjZkdOcGdtTVJWVE5OZi80WEtJb1ArRHoyd2ltWGVCQUY1?=
 =?utf-8?B?N3pTeUVhbmplQmNld080YUtUaVdGa05zL1BwMVFmclRIVUJZNXdKNVlCUThN?=
 =?utf-8?B?N1R2V2N4T21jcFBOSFl3NURuWjdydlc2Vk9WVHl4OEk2akNsOWltVmthdWha?=
 =?utf-8?B?U204MEFHS2hIZVppL0Q3RzdIVFpBTU8vb1NJYzdGNlRTVjBKWVdGQTJ1M3c5?=
 =?utf-8?B?SFVoczZNK0JlWUJ2T2liM1gvZ1FuK1d5bzdYT3hOZUdsNU9NeEswK1Q2RUlY?=
 =?utf-8?B?V3dXeCtIamF2elBkU2tIamU0aFpjcUY2YmpncWlHQmsyV09oLzRtU1gvM2Ew?=
 =?utf-8?B?eTdwVXVpL0tVMWRhcWtBcUVLMU1TZ1VHcDRRRjlJK0hhQnFZNjFyOWdReFNt?=
 =?utf-8?Q?KaBSgax7UI0237bUPoF5e0f6W?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd468ac1-ed5a-449c-61eb-08de327dd6b4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 15:08:38.9129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAJeo20N+ZI5EQeCXjif9EsXpODhWeyjAImGchS3Ggr+YLftNiV450VaoDIovczb03uEHHQXlHtpkEPAVeZe0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6641
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

Hi Alex,

On 12/3/2025 8:06 AM, Alexandre Courbot wrote:
[..]
>> +}
>> +
>> +impl<'a> Iterator for ClistHeadIter<'a> {
>> +    type Item = &'a ClistHead;
>> +
>> +    #[inline]
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        if self.exhausted {
>> +            return None;
>> +        }
>> +
>> +        // Advance to next node.
>> +        self.current_head = self.current_head.next();
>> +
>> +        // Check if we've circled back to the sentinel head.
>> +        if self.current_head == self.list_head {
>> +            self.exhausted = true;
>> +            return None;
>> +        }
>> +
>> +        Some(self.current_head)
>> +    }
> 
> IIUC you could just rewrite this as
> 
>     let next = self.current_head.next();
>     if next == self.list_head {
>         None
>     } else {
>         self.current_head = next;
>         Some(self.current_head)
>     }
> 
> and drop `exhausted` altogether.
> 

Yes, this is better, changed, thanks!
>> +    _phantom: PhantomData<&'a T>,
>> +}
>> +
>> +impl<'a, T> Clist<'a, T> {
>> +    /// Create a typed `Clist` from a raw sentinel `list_head` pointer.
>> +    ///
>> +    /// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
>> +    /// the C struct that `T` wraps.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
>> +    ///   representing a list sentinel.
>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>> +    #[inline]
>> +    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut bindings::list_head) -> Self {
>> +        Self {
>> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
>> +            head: unsafe { ClistHead::from_raw(ptr) },
>> +            offset: OFFSET,
>> +            _phantom: PhantomData,
>> +        }
>> +    }
>> +
>> +    /// Get the raw sentinel `list_head` pointer.
>> +    #[inline]
>> +    pub fn as_raw(&self) -> *mut bindings::list_head {
>> +        self.head.as_raw()
>> +    }
>> +
>> +    /// Check if the list is empty.
>> +    #[inline]
>> +    pub fn is_empty(&self) -> bool {
>> +        let raw = self.as_raw();
>> +        // SAFETY: self.as_raw() is valid per type invariants.
>> +        unsafe { (*raw).next == raw }
>> +    }
>> +
>> +    /// Create an iterator over typed items.
>> +    #[inline]
>> +    pub fn iter(&self) -> ClistIter<'a, T> {
>> +        ClistIter {
>> +            head_iter: ClistHeadIter {
>> +                current_head: self.head,
>> +                list_head: self.head,
>> +                exhausted: false,
>> +            },
>> +            offset: self.offset,
>> +            _phantom: PhantomData,
>> +        }
>> +    }
>> +}
>> +
>> +/// High-level iterator over typed list items.
>> +pub struct ClistIter<'a, T> {
>> +    head_iter: ClistHeadIter<'a>,
>> +    offset: usize,
> 
> Now that Clist's offset has moved to a const generic, let's do the same
> here as well.

Yes, done.

> Overall I think this version looks pretty clean! A nice,
> easy to understand wrapper over the C API.

Indeed, it has come out to be very nice. Simple design and clean code. Thanks
for all the reviews! I will shoot for posting this patch with the DRM buddy
series together today. There is also a pin initialization patch for `Clist` that
I will separately add to the series on top of this patch.

thanks,

 - Joel


