Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3390AA7DFB
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 04:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B2D10E15A;
	Sat,  3 May 2025 01:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I5W/Cp9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F116210E0B7;
 Sat,  3 May 2025 01:59:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAIM/Cj84KdbNbZw3T1VkkbhF18rUIid+IHbCknpEqyOzGMXWrgRv8HWYMgK5BFIn+D76slLLCoumKg38YtlyWnTRqIjjoT/kGXAH2q8VkbEKe+0TWd0YgqEl+42VwkgEA/QYD6R+cXRxT0MYrBb/fv9RNmq0ZB3TK3hzyitOaN6ZZsNfnILM5jIMTCARvR401QUIuv9r7FEPZMohU1er9Hi6s8M0ftB2F+63NILDzqAACbUluAXVSYfzJmbIhJoPCWSlJKMYs4XvJSMFKQg+KKeYg3XjEgS3ph36huZCtLzqMGkhSXLCC7ygqgZS+NBbHNYD8esq965Yjq0XBB4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCGz4KfpVM5F9S2Yvsoltd/5uEHd4yEdbzFhyTjVPNA=;
 b=ATKopoYt6EgAd2sPLusP2ygb+fB83UKarYq75e7df9ncj6d3XQSexk1A41yc6WB/oy5uyjm4fO47BcyG7SpvHKFQHM3CXW5zRHOqd71FjofWUAeedUoHcLqZ+yPysmznUL0ns7DLLwOzbC9X5uyP9y3PFbWzKsR/k86uxmp+Ax6xfRvIat7toW0S1lp/+qJ3WasWP/cBzokPDpoiW4EOOZHRwenD2wy4J8Q40lwJSFeyxWj3Y/N2Xh9QYMvSbcffND4TNoy+rHYOAlsxx9PqzKCNhguqThubxw7ON/efJb0nWqtooLLwwfclqu7febsn9bAzmVYc4fIzcS3yuL21xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCGz4KfpVM5F9S2Yvsoltd/5uEHd4yEdbzFhyTjVPNA=;
 b=I5W/Cp9PONt2eQCRpiDOR9HGn4NTSGFze4XLGvQhT1rTnywlUrWVNY9s+USNPbmGIZXZai34m4NTDO6Q+G0nAKhmohLD3dURvcY2QDcW2b2PT8Utn5sMo6YEXstm0zQMr97+pA082tzaHLk+C0sKNRZBO1IvQtiz4q/TLJPuZvMRccPg1Lpvnk0dCN6Fv8LqoLv6m+jZHV6YufwzSD9SvLTigdB7DPcxqLGAUhouTX/H3SL7TFD9PNqXraLVvUwArEzQN60Qw7hFyEI+jjwIKDLx++BAt7Nb4lP9uIMFknOk1WmkqWjQSIBHWpS7a/eSnKtRfKiK8j3hKLk77EbYfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8288.namprd12.prod.outlook.com (2603:10b6:208:3fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Sat, 3 May
 2025 01:59:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8699.022; Sat, 3 May 2025
 01:59:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 May 2025 10:59:39 +0900
Message-Id: <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
 <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
In-Reply-To: <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
X-ClientProxiedBy: OS3P286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:200::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c352286-3a69-4cd9-a232-08dd89e62b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STQ1WmFjNEJJTjhDZzI0OWpLMGdEbyttQmtuSSt3U3FFUTEwK2xwQk5vN2li?=
 =?utf-8?B?T21iN1lvVDQ4MmtCNzJvYXdUSVJzeFpSRnYrQjVlTmc3TDkyYVZmQVkzbmFi?=
 =?utf-8?B?RFZqdWJiMjJ5dFJKZUY5alZuaHhuMTdIYy9kT1V5WTkwcUlObm9raWJuV2Jw?=
 =?utf-8?B?ME1yeEcxb1E1R3VTT3Nvb1JodnMxNnptUmIxT2JXSEhkcGJjQzlsRjBDN1ZT?=
 =?utf-8?B?YlFlVGVmTGNHRm9xY0NZdS9jbEtuSHZMSWx5TGZ2S25Pa2JFNGR6eWt5c2JK?=
 =?utf-8?B?Mm80Q2VzQjF2UjdzbTdpL2JEV3k3bVptVkR0QVc2OVArU1c3VDI4cEM0Z3k3?=
 =?utf-8?B?dnZOMHBvdkxXTDNaZVRESmhnclhSOTFqYzI4Y1BtczFIMEljZVJIenRIS1di?=
 =?utf-8?B?QU5DYTZWQTBDakZ5RXFhYWNKb1dOMHV5czB1OUN0bzJFTWZYNnJnak5GZTl5?=
 =?utf-8?B?a1JuZkJPZlhibjV0WWNYY1NQK2ZLSmVlQjBiNisvTmhadEZHek5FMktQcXI3?=
 =?utf-8?B?aHpsMml1aHZZR2Q5bGlFSVlYSmxtakZkUEZjRjBnTDdzNGNsZnprNytUL1NT?=
 =?utf-8?B?Rk9NWTdqQmp4cTVxcExwSjdFN0xzWE1PZDJZaDBnWGZVY0grcTV3a0gzL0xS?=
 =?utf-8?B?aG9jcnY2T1dlNWE0LzQyOFc1dTljQlNuVUNiUVJtQXNPT05MbEpZaVZWU3VP?=
 =?utf-8?B?Q2J5ZGYyYnBPSkRmb25ZNmJxUlE5Zk5rdmNzNUxzYldhZ3Q0VCtUY3ZWbGdJ?=
 =?utf-8?B?QWQvaFRSdW1rWEZwVjZ6V1lCWWFBQmwvTHYrUFZJNTBFYnQ1eXlBMW5hTnVU?=
 =?utf-8?B?eXpmcTBpWlVRUWQvQTZMTXdPVzJMaXVhVDNHaDI2RFdwdFVSYS9ING9vZVBt?=
 =?utf-8?B?OW4wYkR0bmpXVlBicGlNSlJ6S3Y5MHVxeGJJbW5EQ254RHIxeC9XcnZXTVF0?=
 =?utf-8?B?cUtRME83M1JJZzhuUnVYZ2g3M3ZzUFlKemZBcWFkd25EMW5mZW1TT1d5NG41?=
 =?utf-8?B?d1V4TER4TEQ2ZlBGcGg3VnRnVVlXMjZoWWF4RXZaM25ITVBMNXl6ZDdlZExk?=
 =?utf-8?B?cWw0V0xaZDNHcEVyQmpXZ2Y0U0hzL29Ca1MwOGJ3QVBacytlWGR2NkR0cCto?=
 =?utf-8?B?Yk1XYTRJSVpoMFk2bi93NHl3bDkvL21FYjloa3lsMEdPZmZvRlZaSEdHa3dx?=
 =?utf-8?B?TUg3L2pQMmpIM0dQTFdHTG1jMGJ1YnZobzBkMXVXVmM3U0VuSStHMnZSTFU1?=
 =?utf-8?B?bmp6NXBjd3ArdUtlUllkT3RFWW84cG9QVk84bnJqV0pJWit1bkNvZHRIOGJO?=
 =?utf-8?B?QkZlb09aQWQ4QWxQMy9JQ1RtMTdrVG9sQVNOam9xSzY4UUQyMjkxWkVZMlhY?=
 =?utf-8?B?cTAvdHV4RE9KdkdJYWxhRUJyNWdpQjNTL3FmelpYVmFVcnhFTS8yUGVFb01o?=
 =?utf-8?B?bGxEUkpCTmVyYldoWmI1UEIrbFRxVE5oN2taQThCSmRMSDBJMXJGSk9xZnkw?=
 =?utf-8?B?Y0hkMzdVVElrUzlHd284Vi90UmpOc2NuaU92Q0JUVXlkdDltNWlOaHVCa1pQ?=
 =?utf-8?B?cUlIM0p6YlpWZW5XeHFnaCthZGhjNllKWUdiUElrNWMyZmxZOGlVV3E1V0FQ?=
 =?utf-8?B?ZzZJbHVEbTV2UWVYN2cyaDlLL0ZYTlhTaGV6UThwa1NrMWtFeVBzT3F1V3lN?=
 =?utf-8?B?eTZVNk5jbXJ3MDhMT2dHTEhJNy92N1RjZWlWQjFFWFpTOGF0NHVKWTRDekp2?=
 =?utf-8?B?Q1JBN2RiZmRLVmhYdEp3YVdjWjBwYkdzN1VEMWVNMUREWHpsTlJRL2FlNmhE?=
 =?utf-8?B?c2tnRUM3c3haaCs4WWY3QVB0TEsreWVqSFN6bjdHazVCS2EvTmVOWm11ZXJV?=
 =?utf-8?B?RzQvdXBmVTRSdWltQVZuR1prNzd1TkJJVXVXUE5aOG8wUUlkME93YmFmTmxv?=
 =?utf-8?B?ZjdCeWlISWcvbCszNStaa1QzVVV3K3lwSXJmYkdxV2U0aWJjOVJEdVVUaGlh?=
 =?utf-8?B?SzEvVVU5akNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFJ1MVVDem43SkhKbG1sTE5JSko1OUhwY0pxc1RGa0hENG5jbXZmTHNHcXBP?=
 =?utf-8?B?NU9RUk1pWnVwYmRqK2dsNHF0QjcvM2FORG9QYlRPdGZUeWE2YkxqUHc2a281?=
 =?utf-8?B?a0o0L2tBR3RBNzZHeGV6WUlEUnU4eHQwMHJGZWJSUGpZVFlYSkFSVVUyQ2Vu?=
 =?utf-8?B?cXk1K2k3MEh6VWFjdHJLdndPbkhCc0IrNW1ITVVIMmhPNkR5QlBUMWJIQjJF?=
 =?utf-8?B?aFBxbnVuRTFRRVVBbmRBNkJUbTV4bytBU2YzT3FhekJHSjNSemhTMEVlaXRP?=
 =?utf-8?B?bEFqWEFJM3oxUnZTY2EvSk1KTy9lNWROak1kcUZPOExoNzhLTFU4SXRzREpa?=
 =?utf-8?B?c1lFMFNndzhITWY3aUE5SlVXdmpab2ZoZ1RTbzE4UHlEc0ZzdTQvaEx0SnFw?=
 =?utf-8?B?TEFNQlBIWFNoeTV4ellpNXdZR25LNUZXeWlQVi9nbFJURkV2cEJjQ1dtclVL?=
 =?utf-8?B?dzJCdWYwVG5SUFJCUjdPSjhLU3dybHpZZytkcFdoYW1Xd3hML0RxM05ZR0dH?=
 =?utf-8?B?Vm1oN01qb3NiNkNvbjM2VnpXUWpQK24yN3d4YnNST2VNN3F1Y2ozK1U1dGkx?=
 =?utf-8?B?OUZCODZVcFZJLzdLVXYzZTd1eVA5U3VvT0FDZHd4VHVsWVhQKzhhdWdvb0po?=
 =?utf-8?B?blZEZUlsdkdUajlCc1AvdWdqaFBxSHJaT2dsRXgxZTdoN0lVcDdVZHlhYXhS?=
 =?utf-8?B?VjNSR1ZhazZnSTRVVjROMDJCNWtKZGxzbkpXZjlScW9ja284eGEvTE45dFpI?=
 =?utf-8?B?U0FDRnBHMVNhZFl0WjBlZ0Q0MkJDYjVXbjVuVWt0RFFhUkd3YkFmUklmdFhY?=
 =?utf-8?B?RFRyQk41bEZteU5PbW83c09wcVNob0RvcG9yR2pmREtiRER3aTNmeXpuL0lz?=
 =?utf-8?B?OG9WeXpuc2tFT3VxRkY3aUhKcDZ1SktsalZKZGpsejhMY1BCRXJTbEMvcWF5?=
 =?utf-8?B?UTRDYnpCd3k4eFl6VlUwcWVscWVNNm8rYlZQS3F5SkQ1eUM4elBjdU1mdEMx?=
 =?utf-8?B?S1d6Z3luVm9hUkxaLyt6aW5Zang5OXdlNjd1M3lOMURnMUZWcm9wSGdVdmdB?=
 =?utf-8?B?bzFGc1A5Nkc0S21Fb2I3aEdlTktFZERGSEREdlM3OWxackgxK0JvNVRxWEpZ?=
 =?utf-8?B?N3VGT2hqY0Z5d3FIOHkxNUZ0M0Y3czAzMlJLSWEwNUwxUnFISXhUN3QrVHBh?=
 =?utf-8?B?VTZmUitvSjh4MXljTFRYOGhzOERYSlExWnNnbEQya2tVbi90WXdQRE93cnJu?=
 =?utf-8?B?Z1dDNEs3dUdVYm1ONitrRkdGcDdLU1BEMkdyRnYrT1J0cE1FNlJTTzc3SVF0?=
 =?utf-8?B?ZWRHdlc1YzBvTDZqaHNWcEQxNGpjU0I4dnV1SFR5RVFmYTZDOERWbVZrR2Rs?=
 =?utf-8?B?TDJNRFpXWTYrTm1UQXJJNlg1SjJQMnpHZWlwa1dNSXE0RGRiMEZudFQ4SHZv?=
 =?utf-8?B?NHJqRE5lRlZYOFN5aDMwMXBvUFdRZm1XOHlGM0M2RzBjQklvci9VZnhoNW01?=
 =?utf-8?B?R1ZDV0ZZREp0SWNtNHNBMFExN2R3MjJHRVBCeTJpNWJpeld5VDlPR1RWeG5o?=
 =?utf-8?B?TDB4UGEzYTZjWFdGWWZBSnFxNXJIcnFEY0J3aFZnZmZNeklSVmlxeS9EV1dK?=
 =?utf-8?B?cDJWNUpyb0ZXdFBzdHRPZ0FHUkF1RWxIWWNuanVnWS8yMnp1RGhlL21IRlM3?=
 =?utf-8?B?UG1yVW5ReXJBTWRrOHFEbHNTem8vcEhwSlYxWmw5czg0akN2blBnQjU5eGRY?=
 =?utf-8?B?anlSeG8vSmtad0tnRnNsTVdCNlhBcGZPcVFQWFpxQVRGMFRaUWxUcTF3Y2Jm?=
 =?utf-8?B?VkJQc1g0MjRYTENrakk0MlFOVUVRV0VEM1VadlF4WVFKRklvVTlRZVZNWUlW?=
 =?utf-8?B?amxZb21hbElBMFRFbUQzbE5ScHh0aEFrOVJYVlh2NU05K1R3WGdnY3IvaWpQ?=
 =?utf-8?B?dzhoQ3F1cXRzcFVVV2RYNk5pUjNVQlBjVXc0YW5UcHVCbzJUaUhBT1JCZ29r?=
 =?utf-8?B?QTkrSmh1VFoyZHNLZ0pHNlcvK0tYUTYvZ0tvMEsybmJLQ0lZQzVDa0lINGVu?=
 =?utf-8?B?d1A0QysrTWlJeU5iWE1oL25yTVl6UEVUTmFsT0l5aUdINGRETDNkQnpnTTNG?=
 =?utf-8?B?U2djMUpvakEveEoxck1lSndzVEVjVThBK0IrMUlSRzJ3ZStjSFR6NzhtR2Nl?=
 =?utf-8?Q?QyE0oLSfQSnkh6kUJaL/Pc33UekMdf6+3hZzKhKu77NN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c352286-3a69-4cd9-a232-08dd89e62b74
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2025 01:59:42.6724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ci9//5NXGkuCcmWn5KAcFJySRiszZ162s8k3Qj3B2brkCRl/Q0r3jzFd5gMqpDmAaV0/5LiNSJ+DD22BMe4x5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8288
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

On Sat May 3, 2025 at 4:59 AM JST, Joel Fernandes wrote:
> Hello, Alex,
>
> On 5/2/2025 12:57 AM, Alexandre Courbot wrote:
>> On Thu May 1, 2025 at 9:58 PM JST, Alexandre Courbot wrote:
>>> From: Joel Fernandes <joelagnelf@nvidia.com>
>>>
>>> This will be used in the nova-core driver where we need to upward-align
>>> the image size to get to the next image in the VBIOS ROM.
>>>
>>> [acourbot@nvidia.com: handled conflicts due to removal of patch creatin=
g
>>> num.rs]
>>>
>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/lib.rs |  1 +
>>>  rust/kernel/num.rs | 21 +++++++++++++++++++++
>>>  2 files changed, 22 insertions(+)
>>>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c9=
02ed8fb98689bbb50 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -67,6 +67,7 @@
>>>  pub mod miscdevice;
>>>  #[cfg(CONFIG_NET)]
>>>  pub mod net;
>>> +pub mod num;
>>>  pub mod of;
>>>  pub mod page;
>>>  #[cfg(CONFIG_PCI)]
>>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..953c6ab012601efb3c9387b=
4b299e22233670c4b
>>> --- /dev/null
>>> +++ b/rust/kernel/num.rs
>>> @@ -0,0 +1,21 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Numerical and binary utilities for primitive types.
>>> +
>>> +/// A trait providing alignment operations for `usize`.
>>> +pub trait UsizeAlign {
>>> +    /// Aligns `self` upwards to the nearest multiple of `align`.
>>> +    fn align_up(self, align: usize) -> usize;
>>> +}
>>=20
>> As it turns out I will also need the same functionality for u64 in a
>> future patch. :) Could we turn this into a more generic trait? E.g:
>>=20
>>     /// A trait providing alignment operations for `usize`.
>>     pub trait Align {
>>         /// Aligns `self` upwards to the nearest multiple of `align`.
>>         fn align_up(self, align: Self) -> Self;
>>     }
>>=20
>> That way it can be implemented for all basic types. I'd suggest having a=
 local
>> macro that takes an arbitrary number of arguments and generates the impl=
 blocks
>> for each of them, which would be invoked as:
>>=20
>>     impl_align!(i8, u8, i16, u16, ...);
>
> I actually tried this initially before settling for the simpler solution.
>
> We can do this in 3 ways I think, generics, macros or both.
>
> Unlike the last attempt, this time I did get generics to work. So how abo=
ut this?
>
> use core::ops::{Add, Sub, BitAnd, Not};
>
> pub trait AlignUp {
>     fn align_up(self, alignment: Self) -> Self;
> }
>
> impl<T> AlignUp for T
> where
>     T: Copy
>         + Add<Output =3D T>
>         + Sub<Output =3D T>
>         + BitAnd<Output =3D T>
>         + Not<Output =3D T>
>         + From<u8>,
> {
>     fn align_up(self, alignment: Self) -> Self {
>         let one =3D T::from(1u8);
>         (self + alignment - one) & !(alignment - one)
>     }
> }
>
> I know you must be screaming the word monomorphization, but it is clean c=
ode and
> I'm willing to see just how much code the compiler generates and does not
> requiring specifying any specific types at all!

No, I think this is great - monomorphization only happens as the code is
used, so it won't be a problem. And the compiler should just inline that
anyway (let's add an `#[inline]` to be sure although I'm not convinced
it is entirely necessary).

>
> This also could be simpler if we had num_traits in r4L like userspace, be=
cause
> num_trait's PrimInt encapsulates all the needed ops.
>
> use num_traits::PrimInt;
>
> pub trait RoundUp {
>     fn round_up(self, alignment: Self) -> Self;
> }
>
> impl<T> RoundUp for T
> where
>     T: PrimInt,
> {
>     fn round_up(self, alignment: Self) -> Self {
>         (self + alignment - T::one()) & !(alignment - T::one())
>     }
> }
>
> fn main() {
>     let x: u32 =3D 1234;
>     let y: usize =3D 1234;
>
>     // Output 1536
>     println!("u32: {}", x.round_up(512));
>     println!("usize: {}", y.round_up(512));
> }
>
> For the monomorphization issues, I do wish Rust in general supported rest=
ricting
> types further so if we could say "where T is u32, usize etc." but it does=
 not
> afaics, so maybe we can do this then?
>
> /// This bit can go into separate module if we want to call it
> /// 'num_traits' something.
>
> ppub trait Alignable:
>     Copy
>     + Add<Output =3D Self>
>     + Sub<Output =3D Self>
>     + BitAnd<Output =3D Self>
>     + Not<Output =3D Self>
>     + From<u8>
> {
> }
>
> impl Alignable for usize {}
> impl Alignable for u8 {}
> impl Alignable for u16 {}
> impl Alignable for u32 {}
> impl Alignable for u64 {}
> impl Alignable for u128 {}
>
> //////////////////////
>
> And then num.rs remains simple but restricted to those types:
>
> pub trait AlignUp {
>     fn align_up(self, alignment: Self) -> Self;
> }
>
> impl<T> AlignUp for T
> where
>     T: Alignable ,
> {
>     fn align_up(self, alignment: Self) -> Self {
>         let one =3D T::from(1u8);
>         (self + alignment - one) & !(alignment - one)
>     }
> }
>
> If we dislike that, we could go with the pure macro implementation as wel=
l. But
> I do like the 'num_traits' approach better, since it keeps the align_up
> implementation quite clean.

This looks very rust-y and I like it. I guess Alignable (maybe with a
more generic name because I suspect these properties can be used for
other things than aligning as well) could be in the `num` module without
any problem.

>
> pub trait AlignUp {
>     fn align_up(self, alignment: Self) -> Self;
> }
>
> macro_rules! align_up_impl {
>     ($($t:ty),+) =3D> {
>         $(
>             impl AlignUp for $t {
>                 fn align_up(self, alignment: Self) -> Self {
>                     (self + alignment - 1) & !(alignment - 1)
>                 }
>             }
>         )+
>     }
> }
>
> align_up_impl!(usize, u8, u16, u32, u64, u128);
>
> Or, we can even combine the 2 approaches. Use macros for the "impl Aligna=
ble"
> and use generics on the Alignable trait.
>
> macro_rules! impl_alignable {
>     ($($t:ty),+) =3D> {
>         $(
>             impl Alignable for $t {}
>         )+
>     };
> }
>
> impl_alignable!(usize, u8, u16, u32, u64, u128);
>
> pub trait AlignUp {
>     fn align_up(self, alignment: Self) -> Self;
> }
>
> impl<T> AlignUp for T
> where
>     T: Alignable,
> {
>     fn align_up(self, alignment: Self) -> Self {
>         let one =3D T::from(1u8);
>         (self + alignment - one) & !(alignment - one)
>     }
> }
>
> Thoughts?

I think that's the correct way to do it and am fully on board with this
approach.

The only thing this doesn't solve is that it doesn't provide `const`
functions. But maybe for that purpose we can use a single macro that
nicely panics at build-time should an overflow occur.

Cheers,
Alex.

