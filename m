Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDFAAFB2E6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D1510E455;
	Mon,  7 Jul 2025 12:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pqMXczRi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0068E10E0F1;
 Mon,  7 Jul 2025 12:09:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAHeEEUaWVHqINayPC+DNLaIgsPuBB8zf+/mkysvNAnhDOUpJYVewkF0G5RskyhICAoHgeWrzQYvzaYnS4EmNKv/TyhM1kilaSSw+fqT4rK9EMM/4JqYszmXAUrhTOU4woOHJxCNdImIz6QVeC9mDsuiuGsAUaCo8CHFVYjH1gs0vQMZrvRrHlYsYGBNwM2zkYg+Xo8B3CHfVhB1Ia4G7gvIIJH43X+aSStySb5WssUTZtGfYcOCz2HmiHTS1TJNDhGZV2hGOr9DhVCcrJvSuDEBtH/A2w3KoAAibV/H6z5bKfawPUFZZASgkx3m4LpE4g1DIpif7H8/DEI3dF1sRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABmASgPD377r58hx97svAJCiaMa3L55m21yOJS2VjPc=;
 b=epjAE1x2Cpkqddq4m71wjFoWqkbGwt9aHFCZSrpznvJKbaN4Eu/VgS7J85L5x5Fsn0uK8V8Fcg152g+taY+kKJGc7JTs2SMN+vV6HOlkm8WpmNPFmCRUrQ9ivWTADLfBgfMuy/WYRKCzDXw9CLB5IC7SY0m0csPHiR70IpW1zme6iWk26ZN4aCFA8QFwDjYMGxEHfmXDzcFeuBIQB1XjnR0RsnxERFYQes5j7mQjbwvd4IWhktmsJGfrENf3XzRyW40odAjZ7tMowPixNjE8Sws8Vm94PeG4QMeogYXMKHGNbuk6hB6FSz9Dou9rmFqX/GzMF+w6WnGSg6XmZ7j53g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABmASgPD377r58hx97svAJCiaMa3L55m21yOJS2VjPc=;
 b=pqMXczRiSVFVAAaZWVU4PFbDkgEMHuQ5zOVL7cJwDMkSpn+wxeUsAixjTEgXxid8JHfeNwIYy0X0p48lr79BYGXNrkruLPgMk7q3V+UfFrI4BspoA8bnk1Dtvo78kCQe/SSFGsOO9QMCLlHSPeuESL1TL/XXPGlDZrXhcqBEJFdb7NMkpmP/qzW8Uw4aP8ZsFYOTCe9EhDOxO0iL2BXl8VTY1Ri3lE31apLLhOayC0Gsl81rkJbj8EswjZQV7Jb/gBccZzLe9Wa6/MomGcn3q5dUp7QyFfFLnahOoQ2L4XwsWJc3HWrvwkEo19Teuxxkt/2ifyC5RujhSsuWCwgwCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 12:09:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 12:09:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Jul 2025 21:09:01 +0900
Message-Id: <DB5T84DGHN3G.12UPQ43LW6U34@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v3 1/7] gpu: nova-core: Add code comments related to
 devinit
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250702-nova-docs-v3-0-f362260813e2@nvidia.com>
 <20250702-nova-docs-v3-1-f362260813e2@nvidia.com>
 <CANiq72kUoyhbwiTeB3Bwv3X0iGLbiVWeQCBvKshOaNMqkEsUPw@mail.gmail.com>
In-Reply-To: <CANiq72kUoyhbwiTeB3Bwv3X0iGLbiVWeQCBvKshOaNMqkEsUPw@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0006.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: a488f94d-a7fe-4c2a-4667-08ddbd4f1138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHBtRVdXcG9TcStFUEdxZTluc1hmRzlGclRvRE4yakk0dFcvQ2MwSHJKUVNR?=
 =?utf-8?B?eXk1di8vRTYyQkxGMnVMV09OdkxSYlZlWnNGUDhBVGxwUzlWWHY2b0N5MWFX?=
 =?utf-8?B?Vi9yelQ2QmJ3RlBmNUFZRy9DZFc1S3dWMEV3VXBCN0huMkh5bEdMQ2tWTm5v?=
 =?utf-8?B?TzN3MUZCN0xja2pNbEF2Q1dHK2xBanVCQVNybHVtOXl5L0swRHhkb1lIM1RP?=
 =?utf-8?B?QnVtcnloWXY0b3VDQlovZVlCb1ozNnhJRUI1RllYTGlBWVEwMXhra3Nxa3ZX?=
 =?utf-8?B?V3NFK1Zkc09hUXA5SXpRY2JNRTZTaXlWdlVmUloyWmh5WVRWSnZZeHNpL0ZQ?=
 =?utf-8?B?S1JjNm1lVUJ0a0Rrck0zQ240QzZ2Q1hCTWg4VUN4dncwVU5hSFB2aHBsa1dB?=
 =?utf-8?B?QlJRSDQ3cWtoeG5XZUxCaE9oRkdZQ1prY1Z3ZDVrczRWVldXV2JXQ1BvbTlC?=
 =?utf-8?B?cEltR201NjJDMHlQeFVRWU1nRnhNNUVickJEVU1GOFdMYW9BNktSZWZnYlV3?=
 =?utf-8?B?K2FsRHlzSWZ4U011K0xBT3JDU3hUdzhIdFNXT2ZvT3ZuQjNqd0pWZG9uc1h0?=
 =?utf-8?B?MVRKSnhYODlnVnFER2Z4UkprbjNUUmJJZ2hJOVRIVDMyT2hiekJiM0l5SU01?=
 =?utf-8?B?b3VJZWtaRUpLcTkwMmVUUENuNzRRcWhsa25hS3NKU0pKaWhUcWpxUW9iL1VY?=
 =?utf-8?B?M1UyWHV5b29Xc0NlUCtOZVFqa0Y5SnNORm5nRUpSQlpJT21VZFh5blJmSjg0?=
 =?utf-8?B?M2xpWTZQb2JoOEUzcVZJYmdpaUo2azBqcG9GMlBMWFl4OER5YlBCaG10eTFX?=
 =?utf-8?B?aXQ2VTBqTkRNVE5nb1pwM1VJZm9vck1MSUhUOGc3ejdTYUxNR01xYmxIcFdp?=
 =?utf-8?B?a3B2Vi84eFdLbmk4MmYyZVJmdURFdWNqZmFodlh5bGYzakJYU2o2OHZYZWZU?=
 =?utf-8?B?NkZvQmlSR1RxUE1ySm9jcEEreFFVWVJKd0RMazhGeHZjVkdiL2lDck1xZys2?=
 =?utf-8?B?MG9NWkwrTTdhVXBsZUI1MWhZMzdhZDdYRG94TG5iL1AyMjVhbzZnUmpJY1JN?=
 =?utf-8?B?dzFPcFI0Nzg3cDczMlJUaWVUTkluN0VzRXNrSFFZdWVwTVZpKzVwUnpvL0ZP?=
 =?utf-8?B?Mmp6S1duUHI2ZVJ0MnhTZ21hVUYvR0EvNlJzbk8vM1BFM3hLT0JwUDhVNFp0?=
 =?utf-8?B?bXphSUtZU21Bblg0US9vUWdiaVFjSVF6WHR0Znd6aHk5SUpmWTlWNncweFJP?=
 =?utf-8?B?bnJOTWlvS3YyOUFWR2F0eTMvR0p6SGswYXQ1OGpjeTRDK1M4dmtDSmJvZDk4?=
 =?utf-8?B?VmY5ZDBIeHhyNXc3eFFOY0VkTVR2bldyeklIaFZIRFBMMWl5dEpCR2E3b0hG?=
 =?utf-8?B?aWsvcHVjeE5ZRXRjcVRCT2FibWUra0cwSWsrZ0VJS3UzbEFNbTBHcTJPSVN1?=
 =?utf-8?B?MXZza0tyeHZhMnpCWk5xYzVQUlBtazFKOW93RkdERTNFQUp5YitCVlhrRXRY?=
 =?utf-8?B?czVhRTBHMXI1L1haYThHYnByTzRyYzRYSnF4allObTVPUlQrUFJqdUJTU3VT?=
 =?utf-8?B?WGE1QTkraE9haEwxSUswRlJwcnY4aWE0c1FXK2o5Vm9TV1FHTUhwVWtQR25R?=
 =?utf-8?B?SUF5SFU0amowKzBGcTlUanNNR0lmVzFLczRlMlRtV2RUR3kvOGhrQ1ltN2pJ?=
 =?utf-8?B?N0tNckk4VjFFNHBMbE5DQ0gvV2hSRmZGTHZXb2tEWkFkcll1MDNBNUtOdWVS?=
 =?utf-8?B?SmhaL2tqbWZUa3RFM2RyT1BxajRyaUlGU3BRV0d0Ni8wK0hIZm5JZy9welNy?=
 =?utf-8?B?RGdKVkFtQWx5OHhHL0RBcmxpY29nL0pOMFJoblAxQVlEWEpjZDZ5blZuRmJY?=
 =?utf-8?B?anIrMHQ1dzNIaUFPTWlwckNteWsrWk1hbEQ4SkZxN0ZHNHhJbnpmaDUzamJv?=
 =?utf-8?Q?zjFl+WVS5mE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVUyQWRGcUdpWTg1YjJaZTYzYWpyL2xUZzROdFZDbHk4T1paQnVsVWNKTEd2?=
 =?utf-8?B?TnkxTC84N042dzJkRzJHQnJYbVI4TDhDTXU2TGJ6cDNPaW5ieVo3VnJ4Q2xY?=
 =?utf-8?B?d3ZxUmNGSHJlMCtpaG5WcUU3b3czNDVLdUJEK0ZDOTNnQkFhQmw5NFJ0MUtl?=
 =?utf-8?B?Wk1JT3ZaZkRLTDZaeDRSUlEvZTU5ZnNJdVZOSUtQNUVNcXMraVh3Rk15NFRt?=
 =?utf-8?B?MVlabjBKR0FTNUFmZTRzNm1oWGZtWmhoMVYxWUJyLzZXSnIrVThlR3YvWnE4?=
 =?utf-8?B?KzBZdDNFalNKWGNFVFlSK3VsM0VXWE52cWV3cnJ2cEZPZVdpUXoydEU1V0Fj?=
 =?utf-8?B?azFuNHI5Smw3NHFPeFloSFQ0MTJDODRuWVkxTGl4aHhzSnc3bWhmVjNteEpm?=
 =?utf-8?B?VWFQN1huNWViL29KSHp0NkZPODIrdzdLdmR4cjlsNEVXUE1EODJSQTlJd0pN?=
 =?utf-8?B?UWRRYzQ4aW0xZmdVSWdrSEZxdVJZeUJ4KzRxMW4zSk5sSXRPT0tQU3NVV3dZ?=
 =?utf-8?B?V0ZXUzhiRVVQZjNldXNZNkxsMklxOW1yVlZ1eGhrRWNaQ0krUXZyN2ZlUmdK?=
 =?utf-8?B?MkdwT2FIZlArVU1KYXdFeE9BY0JGQnNUN05xeEttaXJpSzJnbTNuNE5VWk9x?=
 =?utf-8?B?dFBSSUZCUkdvSEFkdnB2RHZaSW5WSTFuOFZXeURkamZNRzNzZU8yN3pMU2Z5?=
 =?utf-8?B?K2IwR1VoRU9WSVRFY0k5bVBRZ0JCYXg5cGVKTTN3NlgzS016cm1BSkRRUHlI?=
 =?utf-8?B?Vll0M2JHVCtIZzh6VFBYZS9TdjRrR2lsekJKTEFiNG9DaGFxYkpQV0xUbHla?=
 =?utf-8?B?MFZwVzk3WkFERzFoY0p4a1IybFNDTDF2MUtKMEZTanZKQVZoK0VxeWdWc0Nv?=
 =?utf-8?B?eG9UbStRY1o4MlV0T1pIbEZETnRxRFFmWDJkSEZzektQOU1HMWFUNVQ0amhY?=
 =?utf-8?B?dlpseGNpMVZVMHhUbUlibmhUczlpelpwQitxOXZETjBJUm9hWUU5R1ZGaHVQ?=
 =?utf-8?B?K3lLWmk1bndCYU1DZ00xVHl5Mkp5RUxGSUNZbkZmaHpraGJMTHNaT094VEo0?=
 =?utf-8?B?OUM5TWovNkszVGI3WUUzOGRLbUl6VFF5Q2EvZHdPQUphdHB4eU5SMTRFWDdr?=
 =?utf-8?B?ZHdmUFMva0prcHZadUlxTTNET052MWJmdHVSaHEyTDRNNUVrUTBuZU52ZjQ3?=
 =?utf-8?B?bnlhVnZMWGxpNTRhR0NmS09QL0gzQVB0akFtcHdnWllFMk1pTmdEd0dldEFH?=
 =?utf-8?B?d1Y1VzA4QUsvOUVEVXltZHZTY29Ic2IwejU0YW5sZXoveUdmQXJRUVJ4VlNx?=
 =?utf-8?B?UmY0YW8xMlF5d3ZhVk9zRE5qSUtYN29kZDZRaVhHcjR6TGdzMkNxbFNLbCtj?=
 =?utf-8?B?VDRzcU1YWU43QlBZVEtjMG00WVg5eHZWeFczNFh4UEFkTXF0clVvM2U5c0g3?=
 =?utf-8?B?bkhMdTlIV00rMzQ1dGZKS3M1ay90a1l5NGxWQVNiVEpjbSs5c05UMCt2eDZL?=
 =?utf-8?B?OUduSHo1UzJ0Z2w2eE1OcU85S3MwQzRUY1VQam9GREZvRlAwSXlDRS9QSUx6?=
 =?utf-8?B?eFBLWW43aVNFU2doWmdCQ0lpaERhVjhjTUtVdjlYZ1ZXUjVBRERrSllpSWt6?=
 =?utf-8?B?RnJWSjcyRGRFTmpJYmk1aUN1eWh3UVo0Y2RZV25YL2p6YVNobFhLaDE3bUZJ?=
 =?utf-8?B?WWI3NHJOWXNPQVZyNGpCRUZ2WWtBd1NkNzF0Y0x4Vks2RnFrYXhjZzRnZ3Zm?=
 =?utf-8?B?ZlpuZmswN0x5WHhIaEk0SmE3TTVRcElWMkJEa0FGNStPTXpBVzllMGtpOGgr?=
 =?utf-8?B?RThSU2t2em9MbndvMDk3bkdQaFBrRjNJWXJWWTdLNlVRaFBLeDlpNlRjOWo5?=
 =?utf-8?B?QmRjVElDa2dMa3J5TFN0SjdBb2xzRC90UHRLclVPblIrNUhQYWtQOEFpU3ls?=
 =?utf-8?B?NjUwcnNZd21NUjdXVk55WWlwaWNxZHJOTG13SGhWa2ZuWkZ0aDBuQmlkY2RU?=
 =?utf-8?B?aFV4MUQ2endiWVJySFFjM2ZJeThWTm0zRitZUytqanErOVhOdTFvVlNRVElW?=
 =?utf-8?B?bXZTdThxVXFrc2RMZkR5MllnUWF6T2lsSFEzcXEzbVh2cXRKSk9ZeHk2eklT?=
 =?utf-8?B?QVRDTVluRlZHcjc5ZG1kNUpxYzNRTmtCMDBrZmMydFZKWVYzbVVERXVXQzVi?=
 =?utf-8?Q?jhOl4OMt7HvOweCsSQ9WuXn0c4is6kGw2GWvR9sJqhI5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a488f94d-a7fe-4c2a-4667-08ddbd4f1138
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:09:04.8168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWVa5u5A1+B0lCFdhDTruczfe3i410RHeHAZc0PAmpmDfyMwmc+YxK2nYixc2qw38UQhYSvMx7KFHkAwBWGniA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
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

On Sun Jul 6, 2025 at 10:42 PM JST, Miguel Ojeda wrote:
> On Wed, Jul 2, 2025 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> +        // Check that FWSEC has lowered its protection level before rea=
ding the GFW_BOOT status.
>
> `GFW_BOOT` (another one below), since it is written like that above.
>
>> -/* PGC6 */
>> +/*
>> + * PGC6 register space.
>> + *
>> + * `GC6` is a GPU low-power state where VRAM is in self-refresh and the=
 GPU is powered down (except
>> + * for power rails needed to keep self-refresh working and important re=
gisters and hardware
>> + * blocks).
>> + *
>> + * These scratch registers remain powered on even in a low-power state =
and have a designated group
>> + * number.
>> + */
>
> I noticed the file uses `/*` in a couple files -- could `//` be used
> or there is a reason for it?
>
> (I guess maybe in a different series, since it is already there for
> PMC in mainline. It could be a good first issue.)
>
> The idea is to only use `/*` when `//` cannot be used, e.g. within
> code, so that they have a different purpose.

I cannot think of a good reason to not use //, let me fix it here before
this gets merged as I cannot find any other instance in nova-core
outside of this series.
