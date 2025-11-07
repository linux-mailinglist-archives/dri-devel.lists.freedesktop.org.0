Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA1C41FE0
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:43:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5DF10E124;
	Fri,  7 Nov 2025 23:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4TRGb/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CE7710E124;
 Fri,  7 Nov 2025 23:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTetscJicSrkDO44/Jdqt/8p/9wJbnH9pkrgOyMu2Jayi7mGs0lJNiAKLX9Na4P8eJMgY0qbhRtjeoS3Mx+B0zcYrd6hnB5g/oQcDR9wSj9LTmdmw0ZhxvCOeAgJNroFQKz1k+uSNGHSSZ7T1aKGAuO7hx0e8cliegjiNToNipyueV3eepgmuL+r3NmtXNu4JfOea/DEKWXChIS1XNdQprZH/TeccXEsaWhSa1diPpn4OqUexNlZC4EWWhHk6oA/CX7bx7l8aVDxBi1/QSKZpwIHuLElW9A++qdxPYLvgYxntQeBvK7mwSysYZSz2eCLjcWONtDDlkwY6hTsRmYsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1ZACAzl0Z9pYgfFY1aIJIuF/TOoDo497RylNYqK2rc=;
 b=fxAyBsz/EKbiFW8juXRnMmN4vQ+wM53Bf61ST/XRYjgQ2mmtdzw5wKV1RKgu1Cli1FcItXO/9cW/3+UUiv9Q00MXsg0rlbizaIRijDSNbPsuLUizOgN9au+YuJfRUOV9nItyPLsEeaqO0dMpDn3q9ldieAH5JH+7UmG46Ws+9ScmNCciOwy0ooBoapUR/H/C2Uy8vNJC5HZ8zGSeta1KECUWq6PO4VvZ5oXeQWJCTt228L/H/dE1qfFVqfYqVAvIxPr7yLPXQ/eFr1J+gkcc+wQZ0MaJMtUfvFbLb9uB2z5pJ9OqtGliKntWDXG0MI81uK9JyIi976gy/lnpbLKwbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1ZACAzl0Z9pYgfFY1aIJIuF/TOoDo497RylNYqK2rc=;
 b=j4TRGb/Ja5FwMtSbIY+jC8FUmRFO1Ow+QiH43ZCvmNsSMEPtQjmPexupVG9Mco167DRx3GcTzxZ4R822V8lpA/CiyWgr/I+lzV0+7Eu9gjXXvsmQZbtug8iyZIeDY+2FGLAYPFn14zhpm9K04lzkdbyakSAf3h5z/lS10yJ+vuB2Asjfov2LkPH6qoNowG+7mrVOlhhReZZqzfckHC/gCg4xg+LfGR2n80U4bHumfrst1d16J2v2JgJXruLXK7Q3EFNpTRPO3z3lWKRhYsFuj1dSpTttTePehI4bCPBbb6zHWxfeK4V9f2dRn/+PJ8fqK0kpDsGKULCzsNaCBT4vJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:43:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:43:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v8 00/16] gpu: nova-core: Boot GSP to RISC-V active
Date: Sat, 08 Nov 2025 08:43:01 +0900
Message-Id: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAaEDmkC/0XMSwrCMBSF4a2UOzYSk2hqR+5DiuRx296BTUlKU
 Er2biyIw/9w+DZIGAkTdM0GETMlCnON9tCAm8w8IiNfGwQX5xMXmo1pedgQVuYu1nLVGskVQr0
 vEQd67dS9rz1RWkN873LW3/WHXP9I1owzqYTQZjBeKn2bM3kyRxee0JdSPpvlZcGhAAAA
X-Change-ID: 20251027-gsp_boot-c6bb048a304e
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>, Alexandre Courbot <gnurou@gmail.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 167064a6-c244-445b-372b-08de1e576de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHNFRXZqZkdtTUZvTEZncDBjOUJRV3RTZStXbkl3QVJrZXBVZ3I0aFVzQ2Zl?=
 =?utf-8?B?K1pYU0lURjd2eDBTa1RibVJJaW1UcXVVWWk5d2pGbFFTbTgydEdlSSswZ3lO?=
 =?utf-8?B?OVVoQ2NjcWZXeXhKaGg5ekx4N3dsL2ExZzd6Z0FFTGJSZmtuTzZLNkJWSjJl?=
 =?utf-8?B?ZTNqNUY1d2pVdWsrUkR4OHh6cjB0eTVqYTFoYlFteEo1VlZNRG1zV3kxUm1X?=
 =?utf-8?B?YW1iR2NlZkNXV01TR2Z4ellPUzlHN3JxTTJWRk1qU1hQMkJpYVNQYVhCY0pF?=
 =?utf-8?B?clIrUHFvWHRCdXo5bHNWRWViaHNLSUxJTDAzUE9OTW53Q3pOYlV1UXJKT2Fh?=
 =?utf-8?B?MUxGaWwvajFSOXhYREZ2ZVV0ZDk2ODFUSnZiU1pBdjJFRTFENkhQRS81ZW94?=
 =?utf-8?B?SldlSkh3MG5NRG95alZtTitaTDMwNUUrTGFDeVNTT3N1TllEV2U5YkdJamR4?=
 =?utf-8?B?czZnWXZUQmJncDI1Q09PdG5JTkFPaVMzYVA4eU5Fa0VXQUJlRldBRkhjVXpz?=
 =?utf-8?B?ZDNtL0t6alBPcHV2SS9FVUJKbzZpR0hqTDlTOHRIQXJhNWpMSS96TjMzaUdP?=
 =?utf-8?B?Z2VQVlFLOTA3SnM3TmxlalBGcVl0MUFnSTM4bitCQ3ZCcHdKYi9qemdPRDBx?=
 =?utf-8?B?SFowenczTHM2TzV3bXBHeXd3VzhOaXhBTVdCNTZnZ3JIRmRaMUQ4YjRFWjZy?=
 =?utf-8?B?OEsyUHFadDREcWxBVkttZ3A3Ty95RFYyaG1BeHJvUExhV0lGMmd0ODVEcjhp?=
 =?utf-8?B?cnVld1NqUFZkbHJzQ0ZmZGZybUVZWDJlVFY1cW55bXNlM3AzNTJ1d3BtT09R?=
 =?utf-8?B?Wm4rMUpRZVh6T3ZsZmZiZVQzUVFtMXFnWVk1VzEvMU03MGFJTUU3cm9Mc1hX?=
 =?utf-8?B?N2ZOWGZjUEk1d2FPZGFvMDJaN2w4RmFwcDZNYm5BOElTdmU2MDRJaWdqMkgr?=
 =?utf-8?B?K3drWEJrMFVFWERnVDcwMnZMQkNNdlIwYXA2M3o1ODlhdk05VHZZY2lTTW9D?=
 =?utf-8?B?aXFRUm55ZFJKZWpVTXNDb1RJbndQcDM0V2FoRkhIMU50cmpwTnNNaHlxYmNl?=
 =?utf-8?B?STI2Snc3VE9GdmdOaXVUdk1ocWtRdVI5czg4ZFZneHpiL0NzazlKUnVPb2pU?=
 =?utf-8?B?WnpKTmZMRVNQblJxY3Y3WVJYNU9WTnA1QzdEVHRpanVXL3ZiQXBFU29mSkJa?=
 =?utf-8?B?V09tUTg0Sm1GSHIxc0JwcTBjeUMzS1ZtYld1RWdvY2h3ZEtsTU93VERCK1ZG?=
 =?utf-8?B?VlcrQVM3VXkvbzZPekc0YnlJS0NmejhFMExnRXp1R1hBY0JOS2V0NlFqcmdF?=
 =?utf-8?B?alpKTFZLWkNkQms5VTQ1blQ1N0VKM0ZxdWoyMGJoOEdvUUVoWVZTemxHdStF?=
 =?utf-8?B?NjdRVWNZTG9xMjBPY0ZVTlBydE5vbWhCYlhEUzNXRXR1TFF1WDNFcjhHNU1w?=
 =?utf-8?B?aGROVjh5WnFyMjg4VWxJRnFVVGViZUllb0hxN3g2eklwVXh6VlJ5SmZHV3NK?=
 =?utf-8?B?QWtLY2NqRmtDMUsyZnhBb29CUnZZSHAzbkZzZUdPUmFZWVRWZnd4cU9OZTNo?=
 =?utf-8?B?SXk4U1hsNzlDNUdyZmEveks0YmdqeG5XVzJnSCtDL0dLUURLbzMyS2J5Uzd5?=
 =?utf-8?B?bHk5N0NWakZqdmg4eCtvZ1lhVktKWnUxTTZ4WEZjSVgrMXEyWUNsRVhvdHlM?=
 =?utf-8?B?bzJEdlZuWDhiTk9Mbk51YkhXMDZIL25WRE56WHhnY045dlZhUk1lU0lIb3ls?=
 =?utf-8?B?UWRBQTR0SWJPeEJnaGltdkkzNmMxQnRUQzBpUVZjcy9ZVlVIQ05hSEMwdDFJ?=
 =?utf-8?B?QTVzeVdxcWU3cVlrcEVzQWU4bW0xZCtLeGZFY3JFM0djZjVtMnVzY21LaGRP?=
 =?utf-8?B?NDR1bDhMVjh3bkE4RXIvbGYxb1pPWnFOTTFBdStVdjRha1ZFazE0dXZidXpS?=
 =?utf-8?B?bVA5VllKa0wvRG8zYVRid0U2WTFiUUhFNklDS0pjK1ZCN1lIeC9iZ1ZqWGQw?=
 =?utf-8?B?WXlBc29NbVhPbmkyQ09sNlI2eGpLTFdVeTF6QmxhQUg4S2RZZTJkakcxemRk?=
 =?utf-8?Q?RtxmtH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K01Pa2tLL3Fnbldsb0k3ZitVOXh2bXVBNHU2TENmQ3d3M3lZNVpjS1BEbnFa?=
 =?utf-8?B?TzdQNkJkSWlOTGhtVXR3QTIxTktka3ZhS2ZyVFNFQU1oY1NZZ08wQTltZDN6?=
 =?utf-8?B?bW1aTm54WWREaXZOS1VHNllSVnYxUDhqbnpHTmJNdG81SzFGdkpxUEczZjhX?=
 =?utf-8?B?KzI3SU1vQ1BvZDU5dXAxcXFQbW1VS1BtWU1iUlBpdm5aVjFVem1sVlVjTWo5?=
 =?utf-8?B?VzBLSVpYVUxScjNmWUc4ZXp5S0ptMWNGUi9XVk9NZnlWMDNQNkoyOHZzcGw4?=
 =?utf-8?B?UnJDQWRwMWhuMERsdzE1a0F3MTkvQVA3VldsSlNCWW9BZ3drWHFQMHJXd0pN?=
 =?utf-8?B?ZU1GRkQrTWgrWDUzVjdYcUJzaXdkWUFwYWx4aEYrNU4rUDNncGFtR2JFeUhE?=
 =?utf-8?B?SjJjWFRPMyt5VDl3OEVqSDQrbzNWV213VGQ2WkdEbk1TV1hWR2ppd05FVm9t?=
 =?utf-8?B?S1VJazBWNWlxRXBaenJHazA4WHB1ZCtqcWFTREswNjA3Yy9Ea3EzVER3dFZx?=
 =?utf-8?B?eEM5c05hTHpOWkhQaUREL011ZHA0MTQ3azk4UGNieDRvQ1d3RFJjcWtDTk9Z?=
 =?utf-8?B?WEdhV0NNVFJFZ2ptN2ZneVRyQ2wxeWJyaTBLN2RxQmYrdCtIcitaSGJtdW41?=
 =?utf-8?B?b2kyVTFoRXVGQVl1SXlEYmYySk5lRVlrRGlNdGR4RGxoTzI3cWtlVC9xM0ht?=
 =?utf-8?B?TG1Nc0hNVEpaNmQvNXEwVis0cTQ1RTQ1ZGdEek9aRnpqT2w4SmtST1lwUXpo?=
 =?utf-8?B?Y1BCRnY4REphRDAxRDdCeEJzTXBiWWROc0VyaS9tRWtyYmNzUnQ1cDBmdTB0?=
 =?utf-8?B?T1pSRHF4UU1LdVNUZ0lOdlVaMWYvZitMdCtmMmZOdXdmS0ZmQWFJOTdJYkRu?=
 =?utf-8?B?K3lidytpbDArWnh2bHVaYzBDQ2xsMW10Ym5COGZqSHV6dkZ1Z0tNamp2Vndk?=
 =?utf-8?B?TU9Mc05TM0RYNXh0cXdDdENxVHNhL2VwMzc4NFRFVkYxOUZ0dnc4SzlSZVAv?=
 =?utf-8?B?Tm1leC9JbmxPZzhUNWtXMFRMQnVnSGFuTUlrZEkyUG01RS8wUXRvUXNqazNn?=
 =?utf-8?B?aHhiR3JUUjVWMitDL2drZll1SGVZaFUzNGYwR0o0c3piRWZDamFEVVJUTXNR?=
 =?utf-8?B?UXI5aDg1TE1wMUN4UVJURHJQYkxYZ3hsYTFxQ3FoUFFHRStGUGlmNkFYZExa?=
 =?utf-8?B?bXNwVU9Fb3Y1YjhaQ1UzSVhVWTQreEw3d205ZGFhNERQaXFNN0RkN0tVNkpR?=
 =?utf-8?B?aVlYK0RaNmdLRC9WbWVvOGFiajhPM284SlBuWm1hd3REZk14T3hzZ1Jrdlg5?=
 =?utf-8?B?cXIzbU9oZStwUHlvQjVDd2V2alQ0dm5JbGNkZitIVUFMSU5KQWRtazFNcW0v?=
 =?utf-8?B?N1hVVTMzL01Bc2I4MVFFRmVxTk5wQzVGV1VLV3BTNHpSOFRsdnMrUUxITEM0?=
 =?utf-8?B?QkxHeFVwVHZuZ2R5SStnZSs0dG96NVB5Y3loMVVUbFJ0ZXcwNFVnQk9kN0hY?=
 =?utf-8?B?NG5sZ3kzSHgvRTBQUDNmWEpsTkppSE5vWmRRVkNvZkNLYi9jYVNkcWxhS3B4?=
 =?utf-8?B?UnR5bnpNSU1qeGRoQitoWHRLaTlOWDkva0NibkFZaGZIbXI4c0tFaitNMWtU?=
 =?utf-8?B?NXQxVmFMWG9PMGZ2b1VmQmJFSUNSYXNvYkU1NjRWOGVORm9ubnBGMk5VS0ZU?=
 =?utf-8?B?M2NHMXBZUzB4VnJvQkQ2eGc5Z0gvWjlYU3dMUWx3WlUyUUc0dEpCbFZoZDZT?=
 =?utf-8?B?UEpFakFNRityRjJKUzFWaWlYa3hMV282YkpGWlY1eXpPeHppdzM3OUpybkNG?=
 =?utf-8?B?aW5ZU2cvMXphcEZ1d25IK0hUdmYvZ0djaTVma1lDL1pRN1owN0h4ZklvYlht?=
 =?utf-8?B?Vy9mR2lkcXZVKytDV1NnQXdqOVZzV3gxVG1ZYXdIQ29NZVQ3cjAxQlBiWGc5?=
 =?utf-8?B?b2FGbUYrSTV3enJLenJkWHhDSSs4NUZLNHppTWxudE5tL050dElLbjR5Q3hU?=
 =?utf-8?B?c0MvaURKMEJRQ0lpVENoanlzcUsrdkl5Zk5xTVh5U3cyQjBxeGlmMWxITlVX?=
 =?utf-8?B?YXYranlnSWJIWVRzVCtBM0lNTExmUXZxTGxFOWZzNHFqay91RVN6VmZBRUtI?=
 =?utf-8?B?RzROcnA2VjNNQlVnV3NLK01BUlYrMmJiQ0RVRFRaK09XT1RyYU40VTVUVEgy?=
 =?utf-8?Q?KuykDju72GYRfohP86ODNLCQhCp4/inOD5xejqf+dCQL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167064a6-c244-445b-372b-08de1e576de7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:43:18.9574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Js7RDjG25q6F3CTERq6EDhvLVlCZxTIfD9RYalBUAIJYwpoF9efgcOBN2fMYS46/T3CY752gIuHc0jXqTLt3Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

Hopefully a close-to-mergeable revision. Lots of documentation added,
making the process of understanding the code hopefully easier, and I
have finally given more attention to the top patches.

This resulted in another refactor/simplification of the GSP command
sending, moving it closer to Alistair's original idea of separating the
commands from the objects representing them. This also means there is a
single trait for commands, and a single method to send them. A couple
Reviewed-by tags have been removed as that part of the code changed
quite a bit.

The message receive method in its current form won't be adequate as-is
for the long-term, but it is fit to boot GSP.

The hope is to merge this or a v9 before -rc6, so it can make it into
6.19. If there are reasons not to, please scream within a week or so. :)

A branch including this series and its dependencies is available at [1].

[1] https://github.com/Gnurou/linux/tree/b4/gsp_boot

Changes in v8:
- Add lots of doccomments.
- Refactor and simplify GSP command sending - now uses a single trait
  and a single method.
- Leverage the new `from_bytes_prefix` family of methods to simplify GSP
  command queue code a bit.
- Simplify RM arguments.
- Split the `GspSetSystemInfo` and `SetRegistry` commands into their own
  patch.
- Add a `is_empty` method to `SBufferIter` and use it to detect when a
  command's variable length payload has not been entirely written.
- Harmonize imports according to new format rules.
- Link to v7: https://lore.kernel.org/r/20251029-gsp_boot-v7-0-34227afad347@nvidia.com

Changes in v7:
- Remove `as` conversions by using the features of the `num` module.
- Add build-time conversion of constant integer values to smaller types.
- Thanks to the two items above, make more functions infallible.
- Remove unneeded `nr_ptes` member of the `Cmdq`.
- Use `repr(u32)` for `MsgFunction` to simplify it.
- Use `from_ref` instead of casting references into pointers with `as`.
- Add message header version type to remove use of magic number.
- Switch some parameters to `usize` to limit type conversions.
- Add comments for undocumented functions.
- Remove `function_number` method of `GspMsgElement` and return invalid
  function numbers as the error value of `function` instead.
- Work around the renaming of `slice::flatten` to
  `slice::as_flattened` in Rust 1.80 (thanks Miguel!).
- Fix clippy warning with Rust 1.78.
- Link to v6: https://lore.kernel.org/r/20251017054736.2984332-1-apopple@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (5):
      gpu: nova-core: compute layout of more framebuffer regions required for GSP
      gpu: nova-core: num: add functions to safely convert a const value to a smaller type
      rust: enable slice_flatten feature and provide it through an extension trait
      gpu: nova-core: gsp: Add SetRegistry command
      bitfields RANGE doc - not great

Alistair Popple (8):
      gpu: nova-core: Set correct DMA mask
      gpu: nova-core: Create initial Gsp
      gpu: nova-core: gsp: Create wpr metadata
      gpu: nova-core: Add zeroable trait to bindings
      gpu: nova-core: gsp: Add GSP command queue bindings and handling
      gpu: nova-core: gsp: Create rmargs
      gpu: nova-core: gsp: Add SetSystemInfo command
      gpu: nova-core: gsp: Boot GSP

Joel Fernandes (3):
      gpu: nova-core: Add a slice-buffer (sbuffer) datastructure
      gpu: nova-core: falcon: Add support to check if RISC-V is active
      gpu: nova-core: falcon: Add support to write firmware version

 drivers/gpu/nova-core/bitfield.rs                 |  16 +-
 drivers/gpu/nova-core/driver.rs                   |  16 +
 drivers/gpu/nova-core/falcon.rs                   |  15 +
 drivers/gpu/nova-core/fb.rs                       |  72 ++-
 drivers/gpu/nova-core/firmware/gsp.rs             |   7 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  11 +-
 drivers/gpu/nova-core/gpu.rs                      |   2 +-
 drivers/gpu/nova-core/gsp.rs                      | 145 ++++-
 drivers/gpu/nova-core/gsp/boot.rs                 |  86 ++-
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 607 +++++++++++++++++++
 drivers/gpu/nova-core/gsp/commands.rs             | 122 ++++
 drivers/gpu/nova-core/gsp/fw.rs                   | 608 ++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 106 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144.rs          |   2 +-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 703 ++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/num.rs                      |  51 ++
 drivers/gpu/nova-core/regs.rs                     |  17 +-
 drivers/gpu/nova-core/sbuffer.rs                  | 227 +++++++
 init/Kconfig                                      |   3 +
 rust/kernel/lib.rs                                |   4 +
 rust/kernel/prelude.rs                            |   3 +
 rust/kernel/slice.rs                              |  49 ++
 23 files changed, 2839 insertions(+), 34 deletions(-)
---
base-commit: 80b3dc0a5a2e51fb2b8f3406f5ee20ad4a652316
change-id: 20251027-gsp_boot-c6bb048a304e

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

