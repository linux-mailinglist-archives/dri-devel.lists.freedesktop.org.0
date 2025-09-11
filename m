Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC042B5322D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387BC10EAFF;
	Thu, 11 Sep 2025 12:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cnnFxiug";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943DD10EAFB;
 Thu, 11 Sep 2025 12:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh0gBdnPq0RDmKdOIlrOkfwRgTNh2ycdCCjGk0rpznp6syRpR969Wyacn0TpUqOS+DquHYuk4hcuclwYkXFQaH3TA9MMvE36W3FMK1o7PnW+HWUKnAGqq419jrk/ZNIV17rSBSDG9cQSqDvJSeXKgCfRTAk+v9sLMWzB3kGi6y7yB/CjhP8pmAhpniYaKrUAeFOmjl0GZSC71sj+oXb6uo9nW+NQ6M7L4FSr+N2xhT7CCLxVp4trzwyB8mCmUYb3ggEx5aeRrDt0OVvp8dlmvm+nMXJCMw7KNAzicXnwJsjChl7UoKjouuJelsvKNCIrdWkyZ2mstyFcSd3GurPoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bhby1uahtXHs+lTkcfZILowXnW7g2YUJzXItU7AxKbM=;
 b=GKq8xvt/wyFtXNJ911Zu6PxUrIgy/Zq4R8klHkp7e1dut33uQot7eBQnIKIVvTJRj7xDY0DBJJevc6aoPNmhzoCwirWA51LPbef7yfLOxJ0BjSPqryt7IOqcvZyKMiXM4kQZh4bVkBHf8Q6KcQai0JB7MM6PEM7XG2pjvTy8+bMm1/0lx+uHzehPqL+NjgI1fFL08EXNQy5AD19/XrUz2v1yMd7HxRsiIyjxZCEuTn5tde1os0Qs7Qs53nudIC+aJsKl8pAXQWks6lLQLBjUFfC6LsUNg3c1mdjeTS79GLq4FEMsSGgWp7psrQBM9UPdZEGlONc5JU4GaREd1VMoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bhby1uahtXHs+lTkcfZILowXnW7g2YUJzXItU7AxKbM=;
 b=cnnFxiug18/3J3SrY5sCopOGjk2oLdXmWHw7Rq14/863I3F41PLD6OnaffkfawT/2/Mb+155ANdG9p2K67Z0CGGYe3QTHaWFqi4PS/AicY96y8yTXR8LlmWMWAcZtftTwyeOHn8HcW5N7Nsj9S8cPrXRGRT6NntOi08ZAHzIX/7/eAZt0zX2YKCDRvefAZ45v2g1qX7dCzu4CPnlosZXZg9UvrvbcnpJANrUtBmVIzRMwEX5WJdDSY2WI3p5tsya096DMzmRonZvGVZtzWV4cObAlZxJeMlH6jF7CR03eEsZ9s+6s5z9NrblHcLXeqvdVu/vZzZqwxVTJT9Rsw2ORQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:29:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 12:29:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 11 Sep 2025 21:29:32 +0900
Message-Id: <DCPYZSLUJGZ1.2D835NAHYEM5U@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 08/12] gpu: nova-core: firmware: process and prepare
 the GSP firmware
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-8-5a8a33bddca1@nvidia.com>
 <9c1a7902-4e14-4b25-ba32-57a475a0bccc@kernel.org>
In-Reply-To: <9c1a7902-4e14-4b25-ba32-57a475a0bccc@kernel.org>
X-ClientProxiedBy: TYCPR01CA0015.jpnprd01.prod.outlook.com (2603:1096:405::27)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4313:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d16e83-f35d-4d97-690e-08ddf12ede6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUdqemp4dlBrcGd5MWt5bWhyM0ZuL2hvbExaODVJQnh5Tnh4aVY4WXdoU0Nh?=
 =?utf-8?B?VldYZTRNOFI1a2xaVDFsZk8wVzl2T2tjUFcvcGg2SmJSRHdhU0dNb2ZDc1BL?=
 =?utf-8?B?SUNKTkJPQjhxY2M3cHRVWXBVdWJmQ2g5WmVjWXdlOXhPOVhCcE9WaHFSUVFz?=
 =?utf-8?B?WWVESkw4REg1c0haN21pL1VUMnZReGdSWkVNdXBnVXEwY2w3Z1RYbThLaVZh?=
 =?utf-8?B?MUIzKzViY2JxeUU4RVh0dFI3elNRVjY2UVNGT20rV1YxNFBMOXVyWEYzelMr?=
 =?utf-8?B?Mk9Qa2NFSElPeWxNdFhVVHRQYXhaK1JJWmFCT2w3d3VsNXFrOVBNL1BrUmpz?=
 =?utf-8?B?dmhqMDFvWG4wQ1FHKzRxWkxLeGx6dFhNaFpPa0FqSDRUdEEwb0tLM0RoTklY?=
 =?utf-8?B?RmpDSFBiYzA3eVJsa3UyTGF0Nll4RjArQmV1dWZnUGRKcmd6ei9wWjFIUEFx?=
 =?utf-8?B?VnFDSjl0ZWtJS3NpUWNTK0QrbmJYRGVudXYrRWI3elZibUpyYWZGNnNMcFAw?=
 =?utf-8?B?UTZPdXhNdHB0Z09YN0VzeXUzZ3FyN1ZueHNUOFdCM2VqV3RTQzFYTlQzRVUw?=
 =?utf-8?B?bHlPN1A5S3dJRWIyNUR0YVR4QkN6ZkUrQkdMQ2ZzaWlQQk13VkJiZE5abFlO?=
 =?utf-8?B?ZlV3RllpMno2YVZHbHk1VkYxeTdSMTAzQTRZSXpCNnBRV2xmTGwrUnNGU2tm?=
 =?utf-8?B?K0VDZ1ZpWEd1RkUxaUFINWd2RkdIRW1DT3RaclJkREhvem0zR2J3RDRoQWNN?=
 =?utf-8?B?YzhySTY2MTNYUytuamZ6bkFka3YrVk43d2hCMWJkRnBqa2VsQnJqQmd3YU1a?=
 =?utf-8?B?SmZnR01vUVR3NmQ1T24reFRwUkg3d0xVbTYyaTlXZSttMjgrZDdNWDYrbVVt?=
 =?utf-8?B?UnQwVmtxUW9TMEZUZkcrYXBBZ2tyT25TZVJFN3NRbkNMZlkxZW5pekdOaHRJ?=
 =?utf-8?B?UEI2ZjJadVh1RFMxM1FNcFNvNXpsb1VsMDNobjlWQUROblJRNk1qQXNINWdL?=
 =?utf-8?B?NHZsU0lkZHBFWkdhakZvUnBhbUpWdkU1QTZjSVZjeUdQc0NVVUlQR1YxN3hj?=
 =?utf-8?B?VGpOS0RvSzZzaGtJelJMa1hYN0xod3ZZeXQySWVDOUdTSytmUzdBRk1vNHRX?=
 =?utf-8?B?ZTNtcGpHRzZ3K25FN0Vtdjc3RlIzL3dSV2lVM3NnTEo2KzdETXh1TW1uVE5z?=
 =?utf-8?B?MnErZkpuZVRIajA2YVBoaU02b0dBVVlSbSt0T2RiT0xMdUNOdnV5bFJpT2Er?=
 =?utf-8?B?L2dUMDZzTFVMTnJpWXZDS0RRcTlBLzdXdEdPYTA3SWpzV25vdHZvTG9KRHVx?=
 =?utf-8?B?TzFaQm9ZSU9SbkFaS2szdVBLMTV3dGdnLzdKWXN5TElrd3c4ZEhnTWlNM2FL?=
 =?utf-8?B?NjNvUTZkZXM0UlZBVFdPUnVoNEhkRSttTUhkcEZFZ1p3ZnRodis4RWlmNFBP?=
 =?utf-8?B?VFhIR0MzRitQbTJ0cE43N3ZqV3FxT0xhdUhhVlgvcktWSnZuNEFkbVV4cGJj?=
 =?utf-8?B?M2dZaysvWHNoelVHNDZ0RUNodTZlZUkvbFRXb3VWWmFQaWlUaUZsVC9JcklL?=
 =?utf-8?B?RHh1UXNFVzR4RGtobURLNlk5cmJqMldSZmhMKzcrT2tWK2MyWnZTSDVkajBw?=
 =?utf-8?B?Vy90N1ZzejVUKzcxUmpZWnhsbzZ6Y0dQL29tVXNtaUFESXUxMWthVFBKaGxp?=
 =?utf-8?B?ZFlSbzQ1Ny9Fem5OelJjdE50OEo2MzFJV21OMGl5ekdGZEVwamlmenQ3U1Ra?=
 =?utf-8?B?Y1V5TFh2OHZ3WForL2V6YUczbjZndUVaQkFQK01PM0Y4dllINExxaTNCbDZR?=
 =?utf-8?B?R2lHbzYxL3NWdVhiWVMvWjg1K1dabllhcFdmcGRiK3k4WTU5aVV0V3lpK3RZ?=
 =?utf-8?B?SjY3clEvZUh4aVJ4Z1hqNWE0TnF2d3Fvd2s0aDZ4NDVrMmF4d1FldTNhUmtT?=
 =?utf-8?Q?We2M+7g14Ao=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OCtjZ1FiOVgzUkFNaTFHM2lUM1pRTFRRQXNoWGNVb25RdEVzYi9NUk5PM0RZ?=
 =?utf-8?B?Ulk4aU8rMUxCbmtzR1A0dVdUc0w2UWNNOXZyZGVjNnpxMElNTHNzQWZrN2VW?=
 =?utf-8?B?N0VacFRQRVBDYUNtNFVXRElseGxIZGZ3YlZ0RHVaejAyNUNZRFZJNDZtLzR5?=
 =?utf-8?B?OUM2a2Z4cDFHSGxweXIwcWFLZGlZMFM5Q2EvWForWHN5dnl6NU1aMWk1M1BE?=
 =?utf-8?B?NFdNbzlPelNQZXhsbnI0SjZXd0tZWk1Xd0R5OGZ4eTdjNWRqRm04QzBRRzRm?=
 =?utf-8?B?L1lTQkMwakp1bzlhYlhvMWdMdnRTRzFvcW9LZ3REUE9OeEp5V3Y0akJlckpC?=
 =?utf-8?B?NlFYeW1MdHRDMFpHVUVHZlUweHh4cUhyalZuZzdETUxadmg3aCtObDllSmRN?=
 =?utf-8?B?dEY3NWlHbkRhRXQ5bGJ6YlBlMHBvTlJXVnRFeUpuUFVXazVyRTA3V1hqY0Jp?=
 =?utf-8?B?VXJ1TzJoVXM3aDVDQW5rQngwZUpIUlJPSHY5RjVvb0VLTTJYZHVkMDdSUWFU?=
 =?utf-8?B?UVhwcXhFaFVDeVU5OFNmNnB3cnV2VWtmdmk4RWZrTkViQWh6UXgxQkZJVVVH?=
 =?utf-8?B?TnZjSjJqaVpRR1Z2RVJQVDlSbHZRRldiR2tGbDRhU3VNWTN6QWtnU2ZnU2pL?=
 =?utf-8?B?K2U4eExoWnhFdEhkMm5HaEoraEdHZVpTUGVXMGhYRFlFTCt0NkxNcktEUnRn?=
 =?utf-8?B?Nm9RVXJDRWpCbzcvNWNXaE9mVC9BdUYyV0dPNGdNZHJzNzVMNjgvTnlxUkho?=
 =?utf-8?B?MndSZTR4c2t5VGpUQWFxajgzc1BiQ0RseVgvcHR2cmJhQzJLVTdKNVR0WG9N?=
 =?utf-8?B?bGFhTkY2ZnN6T1hBL3h1S08xWjlNdVBrMm5pTUlqNWdZc1czZ0pUWWZOS0g0?=
 =?utf-8?B?SHVocEZJOFYwV1B1MDdYdUNvdW5ZT2MrUHRHTDB0UElVdUJZbjFmYitIWTFh?=
 =?utf-8?B?c2Z0ZUhtYU1BMUVya2t5MTdSWVFIZitpZWJESEtPa0hHVUY5Qm0wM0VXMDB6?=
 =?utf-8?B?RGZvR2Y0czl2bTNpc2UwMGRRRDNZUzJLNUpxZy9vbjJNMnRnZVdtNVRpdyt3?=
 =?utf-8?B?VXM1dnUwVzhHM2wwRDk4bTVIR3l3N3BsdnVzcGNES0VMWG4weW5kVFdMK3VG?=
 =?utf-8?B?c3IyNVVueDRWOWE3ekFLNEJVU2FxUHhLMy9WN2pOVXBiRDloZWhzcDFzaVRM?=
 =?utf-8?B?N1pXWVBGTG9wMnJLdit6SUluSHdhMVZDbTJuWHJtVksxbThLNHhHT0p6cWJi?=
 =?utf-8?B?ZTZtU2NBb3pvalltMGRlejhPTXhWNENHMjBBeisyMlhKdmEvZzUrUmgrU0F4?=
 =?utf-8?B?cGNaZVRTSGtQNHQ2SVBTNFNFQ1FkdGlOTGw1bEtZWmJtb2tqb28xRWlPZ3Br?=
 =?utf-8?B?SEZ5ZkVEc3d2MlBqSXBiMU40SU9rMnIxSkdrcVV4cWRLVzNNNmNNM2tDMTg3?=
 =?utf-8?B?djFBVEFEZlE5UDlGY0VHd2ViUC8xd0FjbVY5bmh6WG1ObHQzbTNuNzkrc1M1?=
 =?utf-8?B?UWovOTVJNmREV05abU5ERzZFZlowSU1mUFVLSXpYa1FSQXNGNGtPL0tqd0lq?=
 =?utf-8?B?cVgreU84ZU44YzIyeTZxR3RBME5xYnlEbVZtOUlRUDc1UW1TWFRSdUp3b1V2?=
 =?utf-8?B?cW9oRkFvdnUxc294SXovRkxhWmVZQUZuMlZqSFhveTFLTDR2UWFsK0NCOUxs?=
 =?utf-8?B?OWhtQ2k0eEk4QTF0ZHM5U0FPcWlMTDdkMU1kaTVBZktGQk9JejFvbXhUNzFa?=
 =?utf-8?B?cDgva3J3SFNCOGd6czJOSHNqL3RWeUtXbDltUGdBVTZNYi94TlZibXJta0V5?=
 =?utf-8?B?UzRURER1OXJLdGhUSCtyZU9hcVZOM3NnYTljMHNiU2dROFVwUm5maEN5TWVJ?=
 =?utf-8?B?MTNDUHNGN1phc1JQR3JOSnJWNmdPWTkrRy9oTFRUcnhUOXp4ZUdSb3VJWTlC?=
 =?utf-8?B?S1FBRnJTWW9oWFR0ZUFzU2JCYVA5WXdleVRST29hYWVmWDdNZnArTXd1MlBG?=
 =?utf-8?B?U05BOXlWZDg4K0NjYjZia3MvdjJud0hPRTh4N2hYQ3hqUU0xam00OWZqODNs?=
 =?utf-8?B?bHJhSTlKWFpEQTRhaVlYOUFwNWg0WnZvVFZ4L1poYVRRNS9ISHY3ZjlKL0k5?=
 =?utf-8?B?SU9Ka3k4dEoyaTFkNk9HSEhzQ0xWbXVrM2c4T21MUFZDMnFlT1dzWGd0Tzg0?=
 =?utf-8?Q?Aw6bxIefwWd9Xkr5klAHUaEKfIZeh+Wqny00Bcbjmm8O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d16e83-f35d-4d97-690e-08ddf12ede6d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:29:36.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: py/xecPIwtX3Kqb2M43puJtrnmOUMNagNJ5AuAT/wCnLHneRFMRxzjTjQOeDwtSFAHw06aAoymojrRlRWI707A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

On Thu Sep 11, 2025 at 8:27 PM JST, Danilo Krummrich wrote:
> On 9/11/25 1:04 PM, Alexandre Courbot wrote:
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 06a7ee8f4195759fb55ad483852724bb1ab46793..8505ee81c43e7628d1f099af=
f285244f8908c633 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -8,6 +8,7 @@
>>  use crate::fb::SysmemFlush;
>>  use crate::firmware::booter::{BooterFirmware, BooterKind};
>>  use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
>> +use crate::firmware::gsp::GspFirmware;
>>  use crate::firmware::{Firmware, FIRMWARE_VERSION};
>>  use crate::gfw;
>>  use crate::regs;
>> @@ -285,6 +286,11 @@ pub(crate) fn start_gsp(
>> =20
>>          let bios =3D Vbios::new(dev, bar)?;
>> =20
>> +        let _gsp_fw =3D KBox::pin_init(
>> +            GspFirmware::new(dev, chipset, FIRMWARE_VERSION)?,
>> +            GFP_KERNEL,
>> +        )?;
>
> Since we now have the infrastructure in place and the change is trival, I=
'd
> prefer to make this a member of struct Gsp and make it part of the Gpu st=
ructure
> directly (without separate allocation).
>
> Should we need dynamic dispatch in the future, it's also trivial to make =
it its
> own allocation again, but maybe we also get around the dyn dispatch. :)

Ah, my previous talk about dynamic dispatch is a bit obsolete now that
the `Firmware` struct is gone. :) Sorry if that created confusion.

Truth is, this object is not supposed to survive `start_gsp`, and we can
dispose of it after the GSP is started as the bootloader will have
validated and copied it into the WPR region. So we don't want to store
it into `Gpu`, now or ever.

I guess we could technically store it on the stack, but IIRC I haven't
found a pin initializer for that in the kernel. And the structure might
be a little bit too big for that (several owned SGTables and a couple of
CoherentAllocations - we're talking hundreds of bytes).
