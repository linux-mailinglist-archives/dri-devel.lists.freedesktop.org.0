Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BC9B52F29
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 13:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2026710EA77;
	Thu, 11 Sep 2025 11:04:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QCdbDXSu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2047.outbound.protection.outlook.com [40.107.96.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AA110EA7E;
 Thu, 11 Sep 2025 11:04:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amDim824HtpJerbjKRTJSEIkQbU7GH7aNsCiGXpyJnhZaA/dvLvmgjY1Pj1eboJXI/aVcffPT2SBMsDDra3NXAlEoAhVN/Y1VuPirwaigkzf3KpTOaa3+B28A6FLsJZMChZcA/5lraJ0vre+kJh7axiY6Z/Jb8fqbLH+bx/wxom6VUKao17mr6mSirTElwa3Q0IoRm8C1mYlRlqHpyaAgyPfl1JoAj0agdbDT8JKpTjzW+6jFZ3s7sfL2sfuDmJNmQpfQKRhokHvxV9cNNVnZOu67N8q388GcxvDMZb1qDVarEImjGpwI12gvMkGponkO+3rPnh9ZoEOHkugOYJhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+9UWrQgoN9IC5MLSyik1hgPPDsgBGF9BrxeL5KYVRU=;
 b=qz02rxBL0czXwPt5cqzePSonYIeEYXgHUrh8CpbgmI9ANoemJJw/RstUQ22gmWTBc3/M/9y2IvJNY84jJRgQt+t1hxsSXJGfwjgTaobeI6GULEkiKuwcnGULeHan8bRJV+YeLpFFBBcYcfwzYnylbvhv5pEKJblkLquIhAj3X86yL821oKKrfLOyrhCkRDRt/+jQHGu9YUJURxTYc+vvdSQvC1CogySpt4OPrV/alJsZxbd5ieDrp9jP6vkBNEOAMG3FKYQpJi4oRqq2h+G2RX8kx4wUNQehffkgWXKrmLHQ3xIRN5ii9M6ZYnhtJqNH+RU1cN7hpsBHsAMh1aZJDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e+9UWrQgoN9IC5MLSyik1hgPPDsgBGF9BrxeL5KYVRU=;
 b=QCdbDXSuEZK/HrAMfotg6Y2oaTqxpBs/hXz0YQuhm3PACOM3Af2aK8Sjzm8Vm0xcnz0W1yz4u42ZJ537uT6vtYF03f8ei8sekquT4UkzMvk31RVqvQHn8XbQhO9EV0XbMgM/K0wUc+o7QT8rlsleQimBpfDocouMtPkFPU38moFZ7Q4yU/9Kcb/ZDAvT05AuidemnxpyPl9K0naOmtiJnwa8ycYuJ8BPfq3GtdUm7Wnurd4viUCsB4rwWzXagRVRXj5M5bpTYo3DYt1mQHT/lwOTbeFQQo1V/01obOKUX3a07TZrTEubnU5UzxVrTavSsLnzexiYMbclZSejl83TgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9840.namprd12.prod.outlook.com (2603:10b6:610:271::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:04:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:04:49 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 11 Sep 2025 20:04:30 +0900
Subject: [PATCH v5 05/12] gpu: nova-core: firmware: move firmware request
 code into a function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-nova_firmware-v5-5-5a8a33bddca1@nvidia.com>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
In-Reply-To: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: 9808c639-9fef-4bdb-9400-08ddf123069c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ny9nVzkrd21ESGdZLzZ1UlJHTzdrcUxPcXN1cFFpTDdhOGpDS3BvYmxiY2wy?=
 =?utf-8?B?TDZZMnZtOXVuTE84dHZCTzA5S3hoMDJMU1V1eWhrZEFWWXpHcHloejI1czhL?=
 =?utf-8?B?RStlQTB6NlB2UUVDczB2K0U4bG00LzF2Wnd4RkVUcjEzZ0d3bGpPeGlYVHRv?=
 =?utf-8?B?aEs0Q0ZaS0x0Wk02MC9PeEgzU0Z1a3VJd202emVoVGVNeXphK1o1MDhnTlk4?=
 =?utf-8?B?QnBnZTAyVmE4dGRieTRwa08rOXdqWERNa3B3bGdDNTJITXowR3RyWGEyOFh3?=
 =?utf-8?B?dlpwSVVnYmU4OHRoZUhueWVpUzVyYmxSbjBkc0J2V2pZYThwcHV6TW1IVkZZ?=
 =?utf-8?B?b3ExRm5BVzQvQlMwYllld0dhZ1dFcDdyd2ZnR1Q2TjRoQld6WFdtUEtuTjZ5?=
 =?utf-8?B?Y3pHVTJMcVNEcjVUUXZyMzRYNVRraGt1RWJVQzZBU1ZaWnZIeXlnTjVEbG02?=
 =?utf-8?B?Q29YSllBeGtZb0FVZjRHNnRONFAvUFhWMktEcys4dEwyU2VsMDFsY1lWbE5q?=
 =?utf-8?B?OHhWMzVmZG15dnNoMWRjaitHcHY4Mjg2cGRoNWhDQlpnQmVkb2VPVERIU2Fi?=
 =?utf-8?B?SXIvUXlRTVNONTBqblF5Y3loaGxEZytkWlQxUEswNHN6RE8reiszb1R2NnhE?=
 =?utf-8?B?RDNCQW8xa1JNSHJ3Mk1EcVlycm13TnMxbWlMc2ZJWi84bVhFQ0NhZmVDbWFT?=
 =?utf-8?B?dW9TRmR1WS80QlFCVTJCdDB4MUZQY3V0bG4xbkpDVjhlUkJYS05ybVB5ekZ2?=
 =?utf-8?B?Z3NvUDE2M0U0YzFYTDVwdGI0WU81MnJBWWcwdFZqOTI2MlRSOG5VWlVhYnBu?=
 =?utf-8?B?ODYweTU0enpvV3JEQm1Lejh1UDd2djRpVmErZ1B2YmtBQmVHNmVLUStra3Np?=
 =?utf-8?B?dGw2QzZhNUl4MG5hYld0ZE5EMklOZzRwQVl5SWg4a0lTZ2NjcVNCOVJrYTYv?=
 =?utf-8?B?UkI5aVBKcHJWZjJ0M2s0a3ByRTVuN3hOTUh3Z0w0VEJpbkFzWU9Gbkk5OHRa?=
 =?utf-8?B?Vnk2UUNTT3BJZHdjNXlTaGNZaFRka2pZMUNVUkFvMEFmbEVmakNMS3lZRWww?=
 =?utf-8?B?cUZxZFFTSCs2ZU12TjR1V1ZUaXFrUitUUjdQTFlKUDlYcXFCMWlzc2dEYUJG?=
 =?utf-8?B?SUFsMlVmWWVRWC9hRDBLd0NNZFBVSVVUQnpXZUZHMDBXZXc5K0QzRG8xenRh?=
 =?utf-8?B?dEhmMFc3QjZscnhwQXhxY3pnb3F5MW10NXFVRDZ0dk5jN1BsSk5XdEdFRkRO?=
 =?utf-8?B?K1BUb2xCSVU1bDdBZTRuelA5Q0dhdWNEazdBN2wvMzdycFhIZW5hS1FpRWor?=
 =?utf-8?B?eWJSU0cxVExFZ09tWjEzOFpVbFVWYWtxY2dUMGFrZkhGbUNucmVNclpGZnlU?=
 =?utf-8?B?cEVzNmRTQUlKN3RXb2hBeUhPSXlJSkx2V2Z5WVovOEVDdWhFOVlNZmFSSW5h?=
 =?utf-8?B?L0JMd1JWTWdBaFB4d0IrS0IxcVA3ZFNuUGdoNUtCdVpjZXQ5bE5OY2xPblNK?=
 =?utf-8?B?RzZKY2NOMjFHL1NnQlZGdy9oS0IzRDlHSjMwOTBDNSsrVmJ0UDdrM01FYkUw?=
 =?utf-8?B?ZjJXYTJocXdMZG9RM1pUWElVVndrRWFrK0Vib1NIRi94TXhhR1k0T2FOV2Nw?=
 =?utf-8?B?Rm5XcjZ1UE5vZVdSYncxYUZnZ1l6bGJBclNURUZJczREUWVGY3FUb2tyUDVY?=
 =?utf-8?B?ZWZ0WFowSjd5UkZReVN2bGh1c2NtYnJUMzBWT0dDalpWcS9Tc3ZsSFVWN2Rv?=
 =?utf-8?B?TW1QbDZGWGwxdit1YnNGMkZkUm5yZkFtOWg1RFZUM1NTVklMOG1iZUtlaFht?=
 =?utf-8?B?WjJKWjBpM2RYRUtqc3ZRYm44QUJtcFppdTRsQ21ZUkdkZFhNWXNaUWhTZXhx?=
 =?utf-8?B?OWFrQ3ZjU3ZCRnJrMlhINWh4amRPUG1melFNZDdvSGt1eDZtT20vc1AxcTJK?=
 =?utf-8?B?NXRWKzFwQllOYnY5QlJZOTNnblFiYkJEZ3lFM1JNc2VTZ3BnZmptOTVBZTMz?=
 =?utf-8?B?WVdHMFhqaVdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVlYbjF6djVwSlFia25oRlBLc3hPd0tQZXUzaG5BYWhpVzhrNVhnMklmQjNQ?=
 =?utf-8?B?UE9DdHBLWndhZS9UVm9BWlVGZDhEQXdBV1FjRkJkMjM2UDl6ang4THlVcCtD?=
 =?utf-8?B?MnFiM1lWYloxWHp4cndRTHo1U3JPcUF5b3c4bDFrOVdUUXA1aHJpUTRRKzVX?=
 =?utf-8?B?Y3ZKY3VQSU15YXVML3VXTkNJeWF4eGVhcGdaK2VGVEVFK0pqOVdXRHpNaG9s?=
 =?utf-8?B?dmdPTU5TWk1FbVhmQTlmbjJSV2pZZUdoaGhBQ2JkcXoxSDJIV3g0QnJUMXZM?=
 =?utf-8?B?ZWNqSVh4OUsvZWJRNjZEN2cwT2VSNjErN3QrRjAxeGp4Z3JEak9UWFJuUC9G?=
 =?utf-8?B?SU01czcyOVhMT0NUVWJCeFRaV1BOVXFnajJUUVBlN0orYStWRUZ5OXpiNFVa?=
 =?utf-8?B?MkhNR3FMY0s2czcvSUkxS3FyVDYrbnc2QktsOFZzNlRPeXl6S3QvejlsbnFO?=
 =?utf-8?B?YThZUzNUSURDL0VsaUZ6SU5hUitxUE8xOGhmVTNJa3RRRk9oS3RVZllKcUdF?=
 =?utf-8?B?R0lZR0FKaTNWT1RvTDBHcGNpZEI0a28wcE1qV1hidk9jbkxFbHRMY2dUYWZR?=
 =?utf-8?B?NTcwQVlLZXAxN21YSE5Ma2ZVQlpuYzdQK2ZDSitQYUF6WXVEK3QxVTk3dUc0?=
 =?utf-8?B?bkVTVUcxa0hyR3JYdUdUZVdXWUYxVUNJWjhyYVhVZ3ZhM0xmUnBjcnI5d1N5?=
 =?utf-8?B?S01pdVNyYkNCMzludXpXcGxlZENvd3ZaUCtHdzBmaTduUVVTQktCaE5nN3Zv?=
 =?utf-8?B?NG1pekp5dnVQZkEzRVZ2T1h0TjViMmJ3c1F0WGwvSUVJTHZaeUtQbWp2RFdX?=
 =?utf-8?B?L2w3QUJKd3ZrNjlYaVZvWjlLSXN0eUd6YzQySnNmUE5TaGVwZFh1Mk0rZ0gw?=
 =?utf-8?B?eHNaWkNubE8zR0tJUm1aU25VSWlFOXZzaEJVVngrMC9DbkgvajBHZ21kQ09r?=
 =?utf-8?B?TVFCTWxsOFY3UnNnWk9GZ2wyR2Rta1BnTGZtaGlwWSs0UVRQaWFjcmt0MmNh?=
 =?utf-8?B?cDBSemRqNnVHb1ZGMW1tSWdpbkhiajMwL3JnV1ZnQmI3SHFldzRUSWRCWDkv?=
 =?utf-8?B?SDRBclJlWEljaFM0QzMvc280WmUvNlVSMk1wQXc1a0kyd29CWE1YUXZBcndY?=
 =?utf-8?B?MGQycG94WmF5aVBiQXpDWGw5VE1Ca0Q4SkpyOTEvK1dCYlVQS3A0MFU0SlFz?=
 =?utf-8?B?ZDZ6QWxIeWxBYU85WC92c0hlR3IrSXpzT1A4Y0dtb1BDZUZhaEpvdkYxSUVl?=
 =?utf-8?B?aGhPN2tMWjZ3L0pzRmg4ckFiVVVrejBSNVJIWU41c3poUXFzN3JDYjlsdlZo?=
 =?utf-8?B?QWgrMGZMZmdtKzVsWXowM2xBOFhGVXNGbFY4cUk2bkFKMUtPVGhjY0NZUUcz?=
 =?utf-8?B?d1M3c1JTZ0EyaUpFSWFwcGxoekFITEJkc01xTzBCdmdxb3VZK1p5WXcrK2V3?=
 =?utf-8?B?VDJRdlF2NU9IZXlLSy9VRmVQVU9ZbVptZENKeTJoTU41K1dVLzkwZ09hK0NI?=
 =?utf-8?B?c1RFa1dqRFhPS0s4cU1rZ1pBaUxjbkUzYVlCNTNUOEtaaEdmaCtQdlM5a2p0?=
 =?utf-8?B?eWtscm43UFgwdXZLUnBwN0M1VnFOdDVpYm52Y1dqWkY0NDc3U0F0SFVnQ0M2?=
 =?utf-8?B?U3BxU3pLTDZMZS9jV20zdWtkU1FyRFppN0RmOTNvSlRvZ3lYVWhPcFowZEtV?=
 =?utf-8?B?bi85M0xGeE5GaDNBRWo1Q0ttY3JrY3dnaWFIcWtuTitaTjE1RjJsUFhqV1RD?=
 =?utf-8?B?Q1lFa2d5dFlyQmRTUE01VnVrYXZ6anFEMkR2UExGUE9xQTg2enMxZUNJRDg2?=
 =?utf-8?B?b2ROZjhkYklEemdxNGdJT2VoVDE4Y1o5TXV0ZnlMN0RVQzVSd0xrbUlVdjBR?=
 =?utf-8?B?V1g3VDVvRUFwa2orMHYrY3kySW1RVndrVkZDd05jNU1aNXEwRG9QcG80QmZj?=
 =?utf-8?B?SWRYSERKWXZpVHJ1QkUrMTBSUzc4WW54ODVNRXViOU1UYTZ4NWJJMnBEQ0lu?=
 =?utf-8?B?Zkc5dEhUQTQ2RWdUR2hGSE9sRDExRTFGZGN1VU9aU25RZXJXSldxUTlsdXFs?=
 =?utf-8?B?T0dkanZjNU1QWHRHVnhlMTZ4NEFMZCtoNlhKNmZRb1dzM0lIY0htcXpIRlZS?=
 =?utf-8?B?MEZYN3FuVTZPT2VkdDRIaGFmM2MrRTg4Z2JEWmlrSWduWU52bGgxdjNkVE5E?=
 =?utf-8?Q?rTxATiosEBRVW0voQMWWlTmAl9JZN173g4qMAxjfWH1g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9808c639-9fef-4bdb-9400-08ddf123069c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 11:04:49.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajuANKJyNAb6ocNQMo6h04aPmtrPpT/eSyHDEqDUTTO9oWRb5AENlbo2iBqq4MjEDspKptjLko3PMzej1L1Mqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9840
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

When all the firmware files are loaded from `Firmware::new`, it makes
sense to have the firmware request code as a closure. However, since we
eventually want each individual firmware constructor to request its own
file (and get rid of `Firmware` altogether), move this code into a
dedicated function that can be called by individual firmware types.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 213d4506a53f83e7474861f6f81f033a9760fb61..4e8654d294a2205ac6f0b05b6da8d959a415ced1 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,19 @@
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
+/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
+fn request_nv_firmware(
+    dev: &device::Device,
+    chipset: gpu::Chipset,
+    name: &str,
+    ver: &str,
+) -> Result<firmware::Firmware> {
+    let chip_name = chipset.name();
+
+    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}-{ver}.bin"))
+        .and_then(|path| firmware::Firmware::request(&path, dev))
+}
+
 /// Structure encapsulating the firmware blobs required for the GPU to operate.
 #[expect(dead_code)]
 pub(crate) struct Firmware {
@@ -30,12 +43,7 @@ pub(crate) struct Firmware {
 
 impl Firmware {
     pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<Firmware> {
-        let chip_name = chipset.name();
-
-        let request = |name_| {
-            CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name_}-{ver}.bin"))
-                .and_then(|path| firmware::Firmware::request(&path, dev))
-        };
+        let request = |name| request_nv_firmware(dev, chipset, name, ver);
 
         Ok(Firmware {
             booter_load: request("booter_load")?,

-- 
2.51.0

