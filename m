Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EB8C17494
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 00:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A8E10E6A5;
	Tue, 28 Oct 2025 23:12:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oHzaIj2N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012003.outbound.protection.outlook.com [52.101.48.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A117B10E6A1;
 Tue, 28 Oct 2025 23:12:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZlclLe/ZFK8KnZhTDJbbEPQR67XlnQ4A02YWUXkBiOttDYOQb1xZ3BPmCuKy9HXQniU+0R61ZXW0bs69ew1Gk9y12lHUGDC412yMa8ZuOFiMFhvUNW38GuN3bhgPYqv3jzXcLCKODVXB7oe9wM6iVSO1RjW9IwX+Oom+XrD+9NkweltovUadnsn4oGNwHcAJdOol6kKnwezH3nPdET4I1DJq+cUADzZiGLDnzLEX8ZHmkHifO0ZoGKM1+OoPJay2C2B1AHhrtI9zUPidYBCY9zySPjs7RVmZW6zHghUTFrdevmMx+hxfNMdk3WQfT/WZzlPOg12czGBbtNS1BIiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GND5E2jcBraVnfmRCnwz0aOMWV3ReGwwvU2fJzyUXX0=;
 b=aO5Hxm17mbNGC0M5EucOGseXii6b2Lz5B2JlSXlYfzahr6cemHTV/G1wf+0s7wMPGW+gdno0OtDQ+DwQVaxzai1yD1rQNK70HiEhO2EM3tEdtEm9qzHn5cmzn1vjNzSXEOBDfsVMlEYiqzwB+fj3fSru6q8M5i1SJEGPW/fFWm/Q5jt1DtHuN5kbO+QDEp39SKYFqa/C/FqGXux0rX0kGHoSJ5HCHK+yhAQ8nPqyWb3JoWjQhMGgrKrVFT63/MIU09ysarGE6wWtynRSbilf0BmIlJR7MRO39wWPokXg4MZAj4Vb0SzZq9sc/Sv/8pYI1RkdW5/0lYpsLF/C4L1J/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GND5E2jcBraVnfmRCnwz0aOMWV3ReGwwvU2fJzyUXX0=;
 b=oHzaIj2Nsw78Rd4Vt2wxhHdAFFTSHJIcX/odWp1UmNMUXx2tYjTvWH2HzGwdOT0UlLnvJ7lLEfaC7cZ9m7l/o4wkD8nxD9XjRTT8oNDyIVgo0bsqsZYFIU87JSjhg4OMXtO2PDKkQee1A1ruO4W9mkvb6PngMm8f5jwZB0nwhbiC7SLyILWbJfRoOAMc00FHTZqtFLz2SvSLarvEykVA0MzTvGeI4y9oLzyAtoZYFaKFi1++Plq9K3c4m5kOoVqusA5iKQPExECOn2oy0tMvAXWUfZtW/ieaWldRUmZrD+wWACR0wk97b1bshLkHJjHJ6K3++Jgtu4jnPHHQqWdidg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PR12MB9646.namprd12.prod.outlook.com (2603:10b6:610:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Tue, 28 Oct
 2025 23:12:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 23:12:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 08:12:13 +0900
Subject: [PATCH v3 5/6] gpu: nova-core: replace use of `as` with functions
 from `num`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-nova-as-v3-5-6a30c7333ad9@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PR12MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad3525e-9da6-4444-f9fd-08de167778a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3pqVHZ3bXZLclh0K00wb2xWM1FLUSt0UnF5eVpDQUpMWklEOFhCN1ZQMmxx?=
 =?utf-8?B?Q0UvdDhaTXlqYWFyaDhJZ2ViQk5PUG5iaDAvNUVlWjdBU3JnZWtVY2MrTzM3?=
 =?utf-8?B?TFcwbjNxbDFrU0xFbTFsc1BHS2JsVG1WOE54ejE2NDIvaDhXb2F4R2Q3dVhl?=
 =?utf-8?B?TFc5Y3NCRGNZdkpHK3FDVUZQM21GbTN2cmFRaGp1SUlkVWJWeEk3RmpheXBt?=
 =?utf-8?B?RzBydXdaYktONUJ2YS9TZEc1OVErdTJQTEVoMjU4K1dRM1lWZ3FGWTZUMGNa?=
 =?utf-8?B?ODlRRHZoS1UrdkE4ZUc0NHRxd1FXUzRtZzM4VUgrNXdzK1VLTlBJWC82MTNu?=
 =?utf-8?B?TEhTZGFVVXIzaWZ3S1pzd045eDBIVWxEOVEvSVd1b1k1OFVWcWpibE5jc3BJ?=
 =?utf-8?B?Y0pla1k5S1FqSTNwLzQ3dCtRSHZNYTF2akpUSmNDL1oxaVRBU09DUFJOWlVU?=
 =?utf-8?B?Q0dhZnhRYWNDd3dGMzU5Wm8reW5GQ0Fib2VyT2VWUys4V3RxTU5XaFZ5aDd5?=
 =?utf-8?B?VHdzTGlmVERJWEpSTytWM3pVSTVMYmFybC9YbjU1VW9RdnNHRHpISEkyaFpF?=
 =?utf-8?B?alBoQi9iV0pPSjZaN0pJcVFxL2NYYnduZ3ZsMEVoUjJ6aWZpQWJmOEl5UmY1?=
 =?utf-8?B?R3RmYU1uT3BReDk0MGZ5anBUUlN4a3VDT2tTSzhyNHRZSVRvTDczeUl3d3BZ?=
 =?utf-8?B?aE4rbHlkK2d4b1M5OTJqOUJCb3V1NVBYK1d4OGZqc0JqQzFhaGh3dklUdTI5?=
 =?utf-8?B?WHFDNXN2Wndmei9tL3UycGdaSnFXdjVuR3dsK3NYbDh1Z2VpMUFUUmEzVHBH?=
 =?utf-8?B?Yk5aRHBSclNGY0o1NVRmcnZrVE5XRWUyQm9xamp3ZHZ6RS9UQTIxNUpSdkFk?=
 =?utf-8?B?ZkNKVDV4bjJISXJLd2VLcTFMamthcFFMcE0wcmh3MW5WV011MUVBcTJnUkhC?=
 =?utf-8?B?WEtxRVY3cmcvR1V3WXlTTG5naHFyalBwSnRJUDUwUU1xR2tyYXIyUnJVWnE4?=
 =?utf-8?B?V0tMZVhWZ3I1RjFyeWFlQ0JlbnVoQ3E2MVdDOVVxL1NCNmR6R1AxbzA5WDln?=
 =?utf-8?B?dUpDT2d4T0tmU00zSW9mL2VvQzUwYUdoLzBjdEcvTjBCLzBXRk1iWmpHRjY4?=
 =?utf-8?B?TDFLQXdVclJxMmtWd2dUWnhDVnYzMFpSWlgzdHFuVVpGZjFJbGc5NHV4ZGVW?=
 =?utf-8?B?R3RRK3FFK2w2S05ESmlUZHlFL1RrcjBBQXp1UGRiNlVIcnVmVTR1U2NqRExU?=
 =?utf-8?B?SGJGMDlQZktWRnVTb0w2eGFpQXdabGdFMWIxSTJmVmlmd3RyU3JhRGNGSUJq?=
 =?utf-8?B?Ui9TcloxamkwUm82L09hOEtnc0MwbTg2c2J3ZWhMK29qRkYyWk95amwrZnJk?=
 =?utf-8?B?eVFTOXlCTGNYa3JMTHFRdTg0SVMzRmJxZW54WmlZbDk0dTFlWDRZaUVPbWhT?=
 =?utf-8?B?NG5wNVNzMHZIQWRkU09LRG1tNVJxQmNSTEYvOUVkUjM4MkFTdXNCWTlXbm53?=
 =?utf-8?B?Y0RZNXBuSUJzaHR6MndLbmJuMDdsMUtrdFNUOVhBOWdqQ3J4ZHlkVzFwTWdk?=
 =?utf-8?B?Q1pPSTVKMjlmTTN5WkRLVUMrTS8rWWNoUGdPUVp3SURDK0RGU05jdHNvYita?=
 =?utf-8?B?VHZLcHhIbS9Xc2VBVnRSTG9ReEJyMEhpSWpIY1MyS09XYXdCY0UwTzk3UDNx?=
 =?utf-8?B?NnNMNVExd3hqYUNmT1BkVjZkUmQ0cE8wL0NuZSt6T2RwQ2podUdPbFZJbFR2?=
 =?utf-8?B?TTI5eExHWm1MaU1BUDNZeHB1Vmx3anJ2cEc4cTQzUVIyTjM0MERhR21XYjhB?=
 =?utf-8?B?MWp2Y1BEQ05pM1R0cm9IcW5uMTk3OFN3OG40SUNUVS9YWVYxS3ZKZ1FwQm1H?=
 =?utf-8?B?Z0lMLzJhakZ4Tk4xaWpyZzd6QVNiZndZWHlaOWFRNUNueTNnQ2dUc1ZRejBj?=
 =?utf-8?B?T0hvOVNESnpQMXFacU5IS1h5c1RIQVNXbDF5UElXVW5sU2o2NTQ0YThRaTdN?=
 =?utf-8?Q?mzqN4Bk0G8x9ArVDBtFgrg6bzRTCmI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THJGYitUVDF4SzdWVjNNOVNxdkNEeFl5S1ZCMDd0T1orcGVsUk1tK0NYb3ln?=
 =?utf-8?B?SWl5YzR4eUloVFhlOU9iNEU2RFczbDJqM01WVkpLakVIcVVuTHRtQjBNc04z?=
 =?utf-8?B?YkxJNGJ3enFHWCtoelRiYTB1cW5EbWd5Mm1HSTZkYkdRV09iSGNCQXBuY1lq?=
 =?utf-8?B?Z3Rudm1pcXljbzRlWk9XY09ndndBMmhjY3RhaktyM0NHUzQ4bFVsZmFWMWI4?=
 =?utf-8?B?QmhLcHBVVEJLMFJjNStnajVMVmpRVlhqM2dLUGZJZ0xJbmdBN3BuaEluNW1Z?=
 =?utf-8?B?a1ErL0N3c2R1a3o0RnU3aFo1bWNXaGdESEd5eUdBR1VQbGtmYUdIL2hvVmlU?=
 =?utf-8?B?elhnVmJkUlQwQWljRy9ZelNINE1rUHNFU2RHK3hJSFlEZ0xiWUtSczkyR0Ny?=
 =?utf-8?B?cU5jZnBRMHZ1S2MyWjg0SEhmM043OHRxbWxWZTg4UnBFbUJoby9TMExGOHpl?=
 =?utf-8?B?MjRTZFYrYXc3eHpsOThOYXhpZlI1T2JQWm1NWCs1bzNIalBaNUZCYVNCMXFQ?=
 =?utf-8?B?cjI3S2hJZjd1OWM3L1k4Z2FGUlR0V21melBzSUw3RmpjZzBDZ1ZrZkxOSzBE?=
 =?utf-8?B?NFlRMmM0ZXdwMnRNNU9oU3lHamVsTndjL3ZEcjNHWGg3UTgwc3VLTnF5MEdV?=
 =?utf-8?B?eWhlbEo5YmZ0SXJyQWlNN0YxYWRmeGRFc3I0N0IwMzZnNDhUK2RUSk8wM05y?=
 =?utf-8?B?N1pITmhrMGUzcEF6blBkQU93VVhBRXNuK09FeTJBWlVqWjF2SmFDQnMvQXBt?=
 =?utf-8?B?QlhOM3QyeFdUaXdCMlRxanBDc3NhZlkwTTJJU3hZUXVHSVVVZXljKzVOVWNh?=
 =?utf-8?B?UnNGQllIMmJDbUhFWTFLYitxUWZoRk0ycUducDhqVnNNeldFOTNGTXFBYkI4?=
 =?utf-8?B?eW9uMUVCUk1YQWt6ZDZXcStTQWNpczBkTFJIeXhPNDNBMElBYVE2dGxMRDBJ?=
 =?utf-8?B?amV4MjJ3YmVzYldIRThhVmJCSlJCRi9tRFlpTnZZN09oOG4zb29Cb1hwWnVD?=
 =?utf-8?B?WDY0SzFRZG40VTBBSlRuMDEwWUJGVmZ4MEpleDBlTVQvdGlLU3ZmMVU5WjFO?=
 =?utf-8?B?WDJaQTRPbk90ZGE1RXI4eEtBUFJ0Z3hvNStHNEU0SFI0Qk5GZElSbk91ZGRV?=
 =?utf-8?B?b3hMNUxhdGkyTUFtNUpCQmtTMzdCNWJPdnBqNmpSdHpLaStJQ1pMN3F4cTVN?=
 =?utf-8?B?ZWlNRWdqc3YrT0FLdTJsUG1TeUVocGcyNGMrNGlGZDlJcFhuNjlENEd1eXhm?=
 =?utf-8?B?MjlrNUpEeEFXd2owWG8yVzdLbFdRZmYvdmpHWHhKcGh1OGVRRUk4OU9FTWFV?=
 =?utf-8?B?N09IZTlZRTlCYkpic2E5YWRjNFpFWFlCVjJsdU5nUXRFT3pjYzNYcTF2Kyti?=
 =?utf-8?B?VFVHeDJjZGxVbVlJc1NFalIvNWRHSE9pK1VmVGpjem1KQmlvc0lSRC9kYmtH?=
 =?utf-8?B?akhseEs2a2xPaFdEUXhjY0JCU0ZFWnZJbWw4dmhNL0t1RjZtYmZQTVpCOEVX?=
 =?utf-8?B?OG96RkcyM003cXlvekhWQ0cvMWN3U3g1OXFnZnIwS2JGT0xJT1piVGJxV1hP?=
 =?utf-8?B?ZWtNbWhiaVZ1Q3BsOG9nMzZGbjJMNnEyTlI1WVc0SjZPWW56SWtXWm5lZjU1?=
 =?utf-8?B?RnRBeHFYZDBUTFV3V2V4eklVRW5IVjFSMFhQZHpwMUt2ZE1URWxMRjdGSGZE?=
 =?utf-8?B?UmhxVTJNYStDMXl1OUdVbmpydlA0YitkK3pqRzN1TXF0N2V5ZkVsOE5mU0hr?=
 =?utf-8?B?SzFUZTQrL3JNc1k2WlM2Ymp1cklaQUo0UkhJbmFhMzZWb2Y0VG5sRStRRlht?=
 =?utf-8?B?SzNOMzk5aG5TTFpOd0JTZjN5dFQ5bksrazZLY0NiTjZHQ1FJUDQxdGl5Rm1p?=
 =?utf-8?B?Snh1ZTFLL2RLRDlab3hFTTRaeEhwelJBQXdLM0hMTDA1djI2V2NEcG50aWpo?=
 =?utf-8?B?ZVNISHlaRHpsZFFQRzdnbDFZQmU5UmhXK2xKK3ZIVitpdXNkL243VmtBdXZM?=
 =?utf-8?B?SXlaaTd1TXg3WWg4NVROZERoUVlFcW9UR0Jhanl4Um5nKzFtZjhEUDVxUXdL?=
 =?utf-8?B?UXR3K0ZBZ2UrN001ZkZTZGpqL1NKTlg4aVRCRXV3N3V6L2hxMVg3NVBmZmJR?=
 =?utf-8?B?WE5LZjMvL21zTUFnVHphbUptb1pvOEJiYm0xajF1UVpqSHJEUG5ndnVERHY2?=
 =?utf-8?Q?pXO7PLkep+ALQZYVEKkn5nof4rcagAUPNMPy2fmj651y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad3525e-9da6-4444-f9fd-08de167778a4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 23:12:31.5765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +uSBIpFCEC+uWuzCfXQBwblwVinN0pRCSRa1Us3YqD9n0pQ+taJHwH6mrzHITCu4vJ90mONeh5kig1Hcr8GgaQ==
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

Use the newly-introduced `num` module to replace the use of `as`
wherever it is safe to do. This ensures that a given conversion cannot
lose data if its source or destination type ever changes.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          |  5 +++--
 drivers/gpu/nova-core/fb.rs              |  7 ++++---
 drivers/gpu/nova-core/firmware.rs        |  7 ++++---
 drivers/gpu/nova-core/firmware/booter.rs | 34 +++++++++++++++++++-------------
 drivers/gpu/nova-core/firmware/fwsec.rs  | 11 ++++++-----
 drivers/gpu/nova-core/firmware/gsp.rs    |  6 ++++--
 drivers/gpu/nova-core/firmware/riscv.rs  |  7 ++++---
 drivers/gpu/nova-core/num.rs             |  2 --
 drivers/gpu/nova-core/regs.rs            |  5 +++--
 drivers/gpu/nova-core/vbios.rs           |  9 +++++----
 10 files changed, 53 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fb3561cc9746..a0ae197a1489 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -15,6 +15,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::num::{FromSafeCast, IntoSafeCast};
 use crate::regs;
 use crate::regs::macros::RegisterBase;
 
@@ -442,7 +443,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
-                fw.dma_handle_with_offset(load_offsets.src_start as usize)?,
+                fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
             ),
         };
         if dma_start % DmaAddress::from(DMA_LEN) > 0 {
@@ -468,7 +469,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
                 dev_err!(self.dev, "DMA transfer length overflow");
                 return Err(EOVERFLOW);
             }
-            Some(upper_bound) if upper_bound as usize > fw.size() => {
+            Some(upper_bound) if usize::from_safe_cast(upper_bound) > fw.size() => {
                 dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
                 return Err(EINVAL);
             }
diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 27d9edab8347..1461dd643cae 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -11,6 +11,7 @@
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
+use crate::num::usize_as_u64;
 use crate::regs;
 
 mod hal;
@@ -105,14 +106,14 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
 
         let vga_workspace = {
             let vga_base = {
-                const NV_PRAMIN_SIZE: u64 = SZ_1M as u64;
+                const NV_PRAMIN_SIZE: u64 = usize_as_u64(SZ_1M);
                 let base = fb.end - NV_PRAMIN_SIZE;
 
                 if hal.supports_display(bar) {
                     match regs::NV_PDISP_VGA_WORKSPACE_BASE::read(bar).vga_workspace_addr() {
                         Some(addr) => {
                             if addr < base {
-                                const VBIOS_WORKSPACE_SIZE: u64 = SZ_128K as u64;
+                                const VBIOS_WORKSPACE_SIZE: u64 = usize_as_u64(SZ_128K);
 
                                 // Point workspace address to end of framebuffer.
                                 fb.end - VBIOS_WORKSPACE_SIZE
@@ -132,7 +133,7 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
 
         let frts = {
             const FRTS_DOWN_ALIGN: Alignment = Alignment::new::<SZ_128K>();
-            const FRTS_SIZE: u64 = SZ_1M as u64;
+            const FRTS_SIZE: u64 = usize_as_u64(SZ_1M);
             let frts_base = vga_workspace.start.align_down(FRTS_DOWN_ALIGN) - FRTS_SIZE;
 
             frts_base..frts_base + FRTS_SIZE
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4179a74a2342..667d5681e347 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -15,6 +15,7 @@
 use crate::dma::DmaObject;
 use crate::falcon::FalconFirmware;
 use crate::gpu;
+use crate::num::{FromSafeCast, IntoSafeCast};
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
@@ -75,7 +76,7 @@ pub(crate) fn size(&self) -> usize {
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT) as usize
+        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
     }
 }
 
@@ -190,8 +191,8 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
     /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
     /// the firmware image.
     fn data(&self) -> Option<&[u8]> {
-        let fw_start = self.hdr.data_offset as usize;
-        let fw_size = self.hdr.data_size as usize;
+        let fw_start = usize::from_safe_cast(self.hdr.data_offset);
+        let fw_size = usize::from_safe_cast(self.hdr.data_size);
 
         self.fw.get(fw_start..fw_start + fw_size)
     }
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index b4ff1b17e4a0..cdd6e971f19e 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -18,6 +18,7 @@
 use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
 use crate::firmware::{BinFirmware, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
 use crate::gpu::Chipset;
+use crate::num::{FromSafeCast, IntoSafeCast};
 
 /// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
 /// `offset` in `slice`.
@@ -74,7 +75,7 @@ impl<'a> HsFirmwareV2<'a> {
     ///
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
-        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset as usize)
+        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset.into_safe_cast())
             .map(|hdr| Self { hdr, fw: bin_fw.fw })
     }
 
@@ -83,7 +84,7 @@ fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
     /// Fails if the offset of the patch location is outside the bounds of the firmware
     /// image.
     fn patch_location(&self) -> Result<u32> {
-        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset as usize)
+        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset.into_safe_cast())
     }
 
     /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
@@ -91,19 +92,23 @@ fn patch_location(&self) -> Result<u32> {
     ///
     /// Fails if the pointed signatures are outside the bounds of the firmware image.
     fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
-        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset as usize)?;
+        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset.into_safe_cast())?;
         let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
             // If there are no signatures, return an iterator that will yield zero elements.
             None => (&[] as &[u8]).chunks_exact(1),
             Some(sig_size) => {
-                let patch_sig = frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset as usize)?;
-                let signatures_start = (self.hdr.sig_prod_offset + patch_sig) as usize;
+                let patch_sig =
+                    frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset.into_safe_cast())?;
+                let signatures_start = usize::from_safe_cast(self.hdr.sig_prod_offset + patch_sig);
 
                 self.fw
                     // Get signatures range.
-                    .get(signatures_start..signatures_start + self.hdr.sig_prod_size as usize)
+                    .get(
+                        signatures_start
+                            ..signatures_start + usize::from_safe_cast(self.hdr.sig_prod_size),
+                    )
                     .ok_or(EINVAL)?
-                    .chunks_exact(sig_size as usize)
+                    .chunks_exact(sig_size.into_safe_cast())
             }
         };
 
@@ -132,9 +137,9 @@ impl HsSignatureParams {
     /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
     /// if its size doesn't match that of [`HsSignatureParams`].
     fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        let start = hs_fw.hdr.meta_data_offset as usize;
+        let start = usize::from_safe_cast(hs_fw.hdr.meta_data_offset);
         let end = start
-            .checked_add(hs_fw.hdr.meta_data_size as usize)
+            .checked_add(hs_fw.hdr.meta_data_size.into_safe_cast())
             .ok_or(EINVAL)?;
 
         hs_fw
@@ -169,7 +174,7 @@ impl HsLoadHeaderV2 {
     ///
     /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
     fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset as usize)
+        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset.into_safe_cast())
     }
 }
 
@@ -198,12 +203,13 @@ fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
         } else {
             frombytes_at::<Self>(
                 hs_fw.fw,
-                (hs_fw.hdr.header_offset as usize)
+                usize::from_safe_cast(hs_fw.hdr.header_offset)
                     // Skip the load header...
                     .checked_add(size_of::<HsLoadHeaderV2>())
                     // ... and jump to app header `idx`.
                     .and_then(|offset| {
-                        offset.checked_add((idx as usize).checked_mul(size_of::<Self>())?)
+                        offset
+                            .checked_add(usize::from_safe_cast(idx).checked_mul(size_of::<Self>())?)
                     })
                     .ok_or(EINVAL)?,
             )
@@ -318,12 +324,12 @@ pub(crate) fn new(
                             dev_err!(dev, "invalid fuse version for Booter firmware\n");
                             return Err(EINVAL);
                         };
-                        signatures.nth(idx as usize)
+                        signatures.nth(idx.into_safe_cast())
                     }
                 }
                 .ok_or(EINVAL)?;
 
-                ucode.patch_signature(&signature, patch_loc as usize)?
+                ucode.patch_signature(&signature, patch_loc.into_safe_cast())?
             }
         };
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index ce78c1563754..96bedada91bc 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -23,6 +23,7 @@
 use crate::falcon::gsp::Gsp;
 use crate::falcon::{Falcon, FalconBromParams, FalconFirmware, FalconLoadParams, FalconLoadTarget};
 use crate::firmware::{FalconUCodeDescV3, FirmwareDmaObject, FirmwareSignature, Signed, Unsigned};
+use crate::num::{FromSafeCast, IntoSafeCast};
 use crate::vbios::Vbios;
 
 const NVFW_FALCON_APPIF_ID_DMEMMAPPER: u32 = 0x4;
@@ -250,7 +251,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
         let ucode = bios.fwsec_image().ucode(desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
+        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -277,7 +278,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + app.dmem_base) as usize,
+                    (desc.imem_load_size + app.dmem_base).into_safe_cast(),
                 )
             }?;
 
@@ -285,7 +286,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset) as usize,
+                    (desc.imem_load_size + dmem_mapper.cmd_in_buffer_offset).into_safe_cast(),
                 )
             }?;
 
@@ -338,7 +339,7 @@ pub(crate) fn new(
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
         let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
+            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
             let desc_sig_versions = u32::from(desc.signature_versions);
             let reg_fuse_version =
                 falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
@@ -369,7 +370,7 @@ pub(crate) fn new(
                 // Mask of the bits of `desc_sig_versions` to preserve.
                 let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
 
-                (desc_sig_versions & reg_fuse_version_mask).count_ones() as usize
+                usize::from_safe_cast((desc_sig_versions & reg_fuse_version_mask).count_ones())
             };
 
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 24c3ea698940..b78311f32752 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -12,6 +12,7 @@
 use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::{Architecture, Chipset};
 use crate::gsp::GSP_PAGE_SIZE;
+use crate::num::FromSafeCast;
 
 /// Ad-hoc and temporary module to extract sections from ELF images.
 ///
@@ -232,10 +233,11 @@ pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
 fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
     for sg_entry in sg_table.iter() {
         // Number of pages we need to map.
-        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+        let num_pages = usize::from_safe_cast(sg_entry.dma_len()).div_ceil(GSP_PAGE_SIZE);
 
         for i in 0..num_pages {
-            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            let entry = sg_entry.dma_address()
+                + (u64::from_safe_cast(i) * u64::from_safe_cast(GSP_PAGE_SIZE));
             dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
         }
     }
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index afb08f5bc4ba..0bae8c74328a 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -12,6 +12,7 @@
 
 use crate::dma::DmaObject;
 use crate::firmware::BinFirmware;
+use crate::num::FromSafeCast;
 
 /// Descriptor for microcode running on a RISC-V core.
 #[repr(C)]
@@ -41,7 +42,7 @@ impl RmRiscvUCodeDesc {
     ///
     /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
     fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
-        let offset = bin_fw.hdr.header_offset as usize;
+        let offset = usize::from_safe_cast(bin_fw.hdr.header_offset);
 
         bin_fw
             .fw
@@ -74,8 +75,8 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<
         let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
 
         let ucode = {
-            let start = bin_fw.hdr.data_offset as usize;
-            let len = bin_fw.hdr.data_size as usize;
+            let start = usize::from_safe_cast(bin_fw.hdr.data_offset);
+            let len = usize::from_safe_cast(bin_fw.hdr.data_size);
 
             DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
         };
diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
index 3f7daaedee0b..b08139ec667c 100644
--- a/drivers/gpu/nova-core/num.rs
+++ b/drivers/gpu/nova-core/num.rs
@@ -104,7 +104,6 @@ pub(crate) const fn [<$from _as_ $into>](value: $from) -> $into {
 ///
 /// assert_eq!(usize::from_safe_cast(0xf00u32), 0xf00u32 as usize);
 /// ```
-#[expect(unused)]
 pub(crate) trait FromSafeCast<T> {
     /// Create a `Self` from `value`. This operation is guaranteed to be lossless.
     fn from_safe_cast(value: T) -> Self;
@@ -148,7 +147,6 @@ fn from_safe_cast(value: u64) -> Self {
 ///
 /// assert_eq!(0xf00u32.into_safe_cast(), 0xf00u32 as usize);
 /// ```
-#[expect(unused)]
 pub(crate) trait IntoSafeCast<T> {
     /// Convert `self` into a `T`. This operation is guaranteed to be lossless.
     fn into_safe_cast(self) -> T;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..2e7cebed684b 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -12,6 +12,7 @@
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
+use crate::num::FromSafeCast;
 use kernel::prelude::*;
 
 // PMC
@@ -75,7 +76,7 @@ impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
         let size = (u64::from(self.lower_mag()) << u64::from(self.lower_scale()))
-            * kernel::sizes::SZ_1M as u64;
+            * u64::from_safe_cast(kernel::sizes::SZ_1M);
 
         if self.ecc_mode_enabled() {
             // Remove the amount of memory reserved for ECC (one per 16 units).
@@ -158,7 +159,7 @@ pub(crate) fn completed(self) -> bool {
 impl NV_USABLE_FB_SIZE_IN_MB {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
-        u64::from(self.value()) * kernel::sizes::SZ_1M as u64
+        u64::from(self.value()) * u64::from_safe_cast(kernel::sizes::SZ_1M)
     }
 }
 
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 7c1bf10b2eac..cb54d96c9535 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -5,6 +5,7 @@
 use crate::driver::Bar0;
 use crate::firmware::fwsec::Bcrt30Rsa3kSignature;
 use crate::firmware::FalconUCodeDescV3;
+use crate::num::FromSafeCast;
 use core::convert::TryFrom;
 use kernel::device;
 use kernel::error::Result;
@@ -817,7 +818,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
 
         let data_ptr = u32::from_le_bytes(bytes);
 
-        if (data_ptr as usize) < self.base.data.len() {
+        if (usize::from_safe_cast(data_ptr)) < self.base.data.len() {
             dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
@@ -945,7 +946,7 @@ fn setup_falcon_data(
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = pci_at_image.falcon_data_ptr()? as usize;
+        let mut offset = usize::from_safe_cast(pci_at_image.falcon_data_ptr()?);
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
@@ -986,7 +987,7 @@ fn setup_falcon_data(
             .find_entry_by_type(FALCON_UCODE_ENTRY_APPID_FWSEC_PROD)
         {
             Ok(entry) => {
-                let mut ucode_offset = entry.data as usize;
+                let mut ucode_offset = usize::from_safe_cast(entry.data);
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
                     dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
@@ -1072,7 +1073,7 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = (desc.imem_load_size + desc.dmem_load_size) as usize;
+        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
 
         // Get the data slice, checking bounds in a single operation.
         self.base

-- 
2.51.0

