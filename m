Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 473F1ADE305
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3560210E268;
	Wed, 18 Jun 2025 05:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zb7VZHG+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1E810E1A1;
 Wed, 18 Jun 2025 05:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiLOBgiqzbXQ93V/HkgrfWNA8KorizpEOvMYytiq3RQTFXt5AdP/oC4uueViq1rBL4UOrrE+MNgA0b0KPRBit5xl2vAxeyRchYfdAaqnDD6AOJZttTb8oIn4/dxac9SjY8goe1XULvPdBzArMr4Q/O8vKrfKqUDOpWmpOyhAFNMmELphLoNVwDDzCIBMiLnskW7WeoCX4saurNB8eqE6VxaASa0LYAecqDRoAnqCOi7+2WvcChrHHbNdH2yeDtrK51ceu9L/kq6QQIlviVy/He2TBf9BsQw6vdvul6vkGcRIZFZHU2GuZopzENz10kmc6m+ZSHJd57l1/GZcgzWY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e53FY15+L5V4Sj4zx8ZSRztx+wdrEbYaPA0Rfmx9HyI=;
 b=Eod+T54ylOjvv0bJqUc8xQcynXcT/9IuxozIvXvzPNrck91a8cxFobFRvE1W4Lo0U1UDNQG+ctCxwbLdXr0I9owQBNo8bey/eCiXD87y10WjgwkPYaYeFVtWzmWAgNHN6Kl9aXYby5EIj19t28F3KgTAOKE83yCxh5yzQs67kwhF2yaC8STSq7HihycQRZjyeiHd+6X5BwKLVsWVb9Rqpe5z5rVLw+wmxdncw0CA3up7cU0G4SQwiekMu6IbH/H3QKIVau1S975UnJVIKCcIyJmpW/ZdcXbOgZDbmz1KOjzL8PTEWymPRd99llpi2X0lzufFeakiFPHmTbm1HKAj3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e53FY15+L5V4Sj4zx8ZSRztx+wdrEbYaPA0Rfmx9HyI=;
 b=Zb7VZHG+EK1ykTALuvcqTeFl49PsPaKXyaH3JOEqF0s0xCalWESzrO0UqJQ0EcRSb5kA/lxeWkiUYLzGp99SdSMqUER69ZLkzNhVpDoCEmb6m1FjZyxNIE+Wj5om0L6kSM1MyivadZ/AcHHyXv8Vaxj8+FVa6nKJXPjgt4I4k+1b9dEccS1DubEL3YzOWlCyYUEWpOqn40Ikl3K6difEwq7plOHlYoLHnjXnnCYYXv+J6CbhBfioQ6msORaMU7BJgJ74C4X4C3ePGcWJ6dLGFmBQglHVuX2qfJAfQ/CAlAHW3i/WhpxEZkup05Hci94imswmCnQZFvpH8YuqpN0CBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 05:26:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 05:26:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 14:26:52 +0900
Message-Id: <DAPERUYR0C7C.4LXQU1B8HB9Q@nvidia.com>
Subject: Re: [PATCH v5 15/23] gpu: nova-core: add falcon register
 definitions and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <20250612-nova-frts-v5-15-14ba7eaf166b@nvidia.com>
 <aFGYyXS21tZFdldX@pollux>
In-Reply-To: <aFGYyXS21tZFdldX@pollux>
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: a76a9f75-fc02-48ee-49c2-08ddae28bce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDcveSt0NEtqTGZxQkorZHJzbU8yMXRzSmNnbnVMc3JqcEJkbkg1Tko0bmVt?=
 =?utf-8?B?SU9qY3Y4bWEvTENpZzdNSDFvZk1DNHhsYURnS0RGM3RkYitHZUlTSDhraWpy?=
 =?utf-8?B?UmxTN3V2TnBHNVlUMUcvcW1pM1Rsc3d0V3daaTRnenRFOXVJVEJwUUVEMEt1?=
 =?utf-8?B?TTJBZjFENE1SLzRwSHYvZTR4cDdJN1RSSzB0TERIcUR5Z1QwNlg5OFFqM001?=
 =?utf-8?B?Vm5mZkdITytNbzhxd290Q1JsY2JXRUtheXFKLzYzN3oyalFqT0xVVEZXV3Ez?=
 =?utf-8?B?VzJVYlJMWDdJOCtXNWFFamNlTzdQSGE0WCtMVkhFVkdpZmg3elgyNHA2eHEr?=
 =?utf-8?B?d2lWOEVwSkU2aWRGMktHbWxkNkgzc3JEcW5GMzBTNHRUWk5ySmZCQlk2YWRS?=
 =?utf-8?B?bFZWOEdIRmhQdWNtamExdmR6cUFuQUpPRm9KVE1aTjFNVjlIRXRrdCtIcVBO?=
 =?utf-8?B?S1NuVHFueXhUOWViakdvOTExbUNsVUZmMy9iUUpSc29kaTBhL0FwZkNBZjNC?=
 =?utf-8?B?akthSDVVeFRZYW1YbWVrRzR5WTB6QjFDZEp2NVg3L1U3WXNtL3FtRUNyd01r?=
 =?utf-8?B?ZG1mSm9xbmlxdURLQk13aWNuM3JJV0xTRVF4QTV2RWc0bFk0ejdTYW5LR2tp?=
 =?utf-8?B?blhOcmVXaVhUaitUSml4cWFGTk0vL0pDVmdsWG5oaktxZ3UwRmhGbklBc0ZK?=
 =?utf-8?B?SjVWTUZTNVFqL1ZMakJrSjRxdHJoNWRTTThFaEdGQmIyTmlORjgxZFBnNXlm?=
 =?utf-8?B?SHJ4R083YlBxblRhMUhaNmV3M2NDUCt2ekRwQ0F5aWNFb3IzelRNR29OZ2p2?=
 =?utf-8?B?TU9VNC9LbXh5ZUdTdVFoRlBUQlp6YzJaVDVsNXowZW5hcHVxTzlmUytNWlpK?=
 =?utf-8?B?ZW8zOFRRL2tSaFdCeU5XTHhHNVVWN3F5eDNVN0lzeUNJbEZXUXF4SlFaNk5W?=
 =?utf-8?B?TTRpU0NQUTM3WXJyVlZ4MnFDTElRN3JvdTVJNHJSaGFXUm5EWG1xNTZsWHBM?=
 =?utf-8?B?MjlqQVE3K0JIM05BalhLZllRNlQ4WFdvRnc5djhGUndvWC8wbUIwcy9PWVdB?=
 =?utf-8?B?NlRUcFFucFdRNW4ybVUyTzZJdlk2U1JucTF3c1NHeXFicFpXcFVPVXhWZmM3?=
 =?utf-8?B?eVYxRXVvTXJadTJKcWdlRk9VbHZjakpXZC9rTUJsaG1ZTDc5WXZ2dmpIOG9v?=
 =?utf-8?B?MVBDbWpxZkVUOFQvcHQyUTdzejA3QXFIdU9DdjEvK29QQVhnVFJ6WUNCRmFu?=
 =?utf-8?B?QzRjK1l2Wkg0WUFFMFhlRDI5MHNHZ1ptKzJIK2JVa2ZYdTR4U2pyYTNVOEVu?=
 =?utf-8?B?bkM4bUhIN0k2MVFXbjhFenVIZlZwTXpodkU0TmsxOVQwdjMrSWcrdzVnOXd6?=
 =?utf-8?B?b0E0emZMdmZIZllIZUY0czdXSmVEVjBkTGQzT2U2RDdPZGI1eFlnRW9OZXNP?=
 =?utf-8?B?U1YrcExlWmdUTExNKzdUa3ZFY1dub2h4NWppUzNiQjdtL3FDMFZIS3dLVmdO?=
 =?utf-8?B?bVZlWXczbVUwUHpNMzVVR2RUdTR0TnppT2FQeVF0VU9SblU5MXh1L000eVEv?=
 =?utf-8?B?ZWRYR0xDbkwxU01KN2RlL2tabTNpVThEdTZDbGtXeERHQTgwWk1vTmEva2NE?=
 =?utf-8?B?T2ZpcGJXZEYvYXFvUTJ4cGpEeWlGeTBZdm5uZm12eExYN0xlUVcvYTdtM1VW?=
 =?utf-8?B?NTdqSExpTEozQlltVkZ5eG1NVmx0eDF6cUN0azVjNzQ1bnMwQkdLMHVMYUhu?=
 =?utf-8?B?cHViMDJHZ0xQZVFyeWxRcitSUkhpRG5CT2FtTnNVUXEvcWkrNVJld1hOYUl2?=
 =?utf-8?B?NFF2c0Zka3JRaUZ1ZU5QWWwzb2EvTUpQaUVJMTlTSDAzanRvdXRROEhMYUNn?=
 =?utf-8?B?VDRlT05USGx5TE5zZW96SmloQUtxLzFvYno5UnlPRStiNGdRS2VWTExVUHNv?=
 =?utf-8?Q?B+uZGRQJPkE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mjc2M3RZQnpYSEVxY0xsNnpxRUlDMlIzK2czODR2TCtpNU00ZEVrVGRFZCtS?=
 =?utf-8?B?Q2lZcW5aT0czNmdRT2tKOXA0ZVZBQ1kvMGU4Q0hTNTJqTTk4NlkrdktLbWVo?=
 =?utf-8?B?SDdJYlZ2Q2pkUy9ZN252Q1g0bDBOZ1lDMENSZjhkcEdhMVZ6aUY3T1ErUjZw?=
 =?utf-8?B?RFlwL0t6RmxIaUl1MlV5ODM1TyttV3pXVi8yVFZJRzIxNkJQT0plNERpME1p?=
 =?utf-8?B?RWM0ZFdvQXdTeUZabEJuNHVUbUp4SmJmd3NNSGQ0LzVhekh3RCtsK2QzcTlC?=
 =?utf-8?B?WTdsVm03M1FVdXFwY2hveVVxMktzQWFia1R4S0ZMc3pGcG53QkpBRDlESFZP?=
 =?utf-8?B?ZEZkRi84OUdXVk1LUnBONktRNGhXdmlFdW1LNlRKQnlCNlpWRUw3b0J5bVJC?=
 =?utf-8?B?Mm1MRE5aQWY5TEh1Q3dXTXN3L054VHZ3cG5MclU4dFRlTm13QTVpSGx2WGlz?=
 =?utf-8?B?K0p0Um1wRmQ3WVRhSm1lamkyV3VIRm5wRE5sZ1JNTUxjRjdTbjVlVjBBRUZl?=
 =?utf-8?B?UVpKN2lPS0RaUWdFOEtOTHRteHlhc0RHdW1Tc1pYQ0d4eG9lbis3RWJpRFdn?=
 =?utf-8?B?dmdXS2NPU3c3cGpNWkFIY2E4dlBjaTY0ODBBNTJITDJMS09sR2h1SHpWNU1C?=
 =?utf-8?B?bjc1VyttTkg0VlJMZ3AyVm5wclJKZFNCdFBBb2V3b0s3VE1Rb1A0U3FxVGlR?=
 =?utf-8?B?UmpwMU9UUXd0SVJjU0JLd1hjMEpqVUxKL1RHc0RrMFdmSVhYd2FuYXovcEl6?=
 =?utf-8?B?dHZyOG9WK3pMR1E5QmtVVFMyMWRiVHRpSXRqc2FGTWhMcXFqVnVUTWp5UUM5?=
 =?utf-8?B?blA3bjhWSzMyRG1QNmhaZUp2ODF0VHE1VS9pSkw1d2VuMXl4SEY4RFlxSVBw?=
 =?utf-8?B?VHcvOHJ1eGYwSDU0aEtXdXhLUjdZQ3NZOWZINWI2RXYxTnRwM2VlcCs4Yyts?=
 =?utf-8?B?QlZTa3QvOGowM0JUMW00TUpzcHIxYVVZL3gwd0JZeFNWRXRmb3VPd1RVcTlz?=
 =?utf-8?B?NGxMQXBCQWNmTmpCUFpwbi9Ob0FkYUlPL2Ntbk9MMDkreEVzTkZKeUlydTdv?=
 =?utf-8?B?ZHZwS0Y3RmcvRGNkOC9KSStnTU1DNjFFK3k0ajhBbWdDMnROTkJhbFJDdWVn?=
 =?utf-8?B?eFpnYTlNRVdNWkUzWlNuVDhGS3REVGRkYlp2bExvSUhTYnVrK0o0b1VLSUhw?=
 =?utf-8?B?WVhzUHBLUGdMYlBkMFJhMHJxL1hBVUpKd1hhZjNHSjFSVnJlNldSVnp0bzJq?=
 =?utf-8?B?VjVnSVY0ejgxOUN0eUE5TzkvdWYraTBMa3VPaVVmMW5qV0lvL01uRjc0T3RS?=
 =?utf-8?B?dlJGNHp2NmRhSEJlcWhlTDZYcS9uQXFWb1dWalYyc1lTNkVEaFZsbHdXWkhG?=
 =?utf-8?B?RzZzWXRHcTJyUXlDSG1hKzIrR2pORTZlQ2JydnJpUHRCQUkyT0NwYTBYR05D?=
 =?utf-8?B?T1JqT1VXT3I1cCtuSGxrRW5mYVZVOTJONXBiNWRhVHJsZ3l4SEoxaUkxOEkz?=
 =?utf-8?B?WnYzejRPc29Pd3B4U2t4dUFjVUxsMDhQc0RPNTFjd092L3VkQ0dXMDRQaEE2?=
 =?utf-8?B?MTdEcEpJVktnR2Z4bkcwdWwyZG5OUVVidkpKME90TGlmb2tuV3E0QkJDL1Q2?=
 =?utf-8?B?VUVzOWtOSW0zajVFZStuckxhZUpERUh4S0ZhdjRLTmhmbEMwZy9jK0FWREgw?=
 =?utf-8?B?c0FKdlM5c1lQM01TRCtXQ1R4RzU4UFJlM1VPeDY5b2FMWDdaZ0Nkdjh6SVJr?=
 =?utf-8?B?UVEzaTc4ajIyWTRzcG9LWHRwVFppRS9uYkErN0hUaDZKRmNXZE1JYXlTZncz?=
 =?utf-8?B?NWRyb3ZKSVlHZWhON1A0VWIwZDBDOEcyZUtDdDREcFVZTDlIREJFclVqWlZi?=
 =?utf-8?B?aFRzL3BUMStQL1VLVkw1TEdjek45ZXEwa1pqTVhCR2d6dDdVazE1c1FWSURq?=
 =?utf-8?B?NlB2eWorTFNVT0IxQ1VrWHZpcmx0cktLNXFhdHkzNEk4NVpSTzhaZVpBbzZu?=
 =?utf-8?B?SGdGdjlKM2cwcG11L1ZPNEkydWtJaU9BS1RqNk9LTTVvTXJPNlpnb3M5Sncx?=
 =?utf-8?B?UUZOWVhJTndBSVhtRnNtcExwd0R5cGVTQ2M1NGh3MGplMWxqRFlhMy9kZTJm?=
 =?utf-8?B?Q3J1azdyUkE4NEVIcEFVbzRNSGRieXBRMDNPRWlvT2c5SklycVk1TkJ6dVky?=
 =?utf-8?Q?I3Thxqn94a33qW9zKpuYjn+9Z28us5ciQyNHGXx2Km9E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a76a9f75-fc02-48ee-49c2-08ddae28bce4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 05:26:56.4565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6q2q6XB7DrCJ/+D65LfGcTyr8F4NzHahvMqyrBWG7+2I1cnJvGKzWbwQmrtovlfoVkRXfcAq3cQ9rz0SF25WDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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

On Wed Jun 18, 2025 at 1:33 AM JST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 11:01:43PM +0900, Alexandre Courbot wrote:
>> +    /// Perform a DMA write according to `load_offsets` from `dma_handl=
e` into the falcon's
>> +    /// `target_mem`.
>> +    ///
>> +    /// `sec` is set if the loaded firmware is expected to run in secur=
e mode.
>> +    fn dma_wr(
>> +        &self,
>> +        bar: &Bar0,
>> +        dma_handle: bindings::dma_addr_t,
>
> I think we should pass &F from dma_load() rather than the raw handle.

Agreed, done.

>
> <snip>
>
>> +fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
>> +    let bcr_ctrl =3D regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE)=
;
>> +    if bcr_ctrl.core_select() !=3D PeregrineCoreSelect::Falcon {
>> +        regs::NV_PRISCV_RISCV_BCR_CTRL::default()
>> +            .set_core_select(PeregrineCoreSelect::Falcon)
>> +            .write(bar, E::BASE);
>> +
>> +        util::wait_on(Duration::from_millis(10), || {
>
> As agreed, can you please add a brief comment to justify the timeout?

Oops, for some reason I haven't addressed that part of your comment last
time, sorry about that. Added `// TIMEOUT:` statements above all calls
to `wait_on`. Note that sometimes the justification for these cannot be
more than "arbitrarily high value indicating something went wrong".

(similarly, I have added a `dma_handle_with_offset` method to
`CoherentAllocation` as I said I would in v4).

>
>> +            let r =3D regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE=
);
>> +            if r.valid() {
>> +                Some(())
>> +            } else {
>> +                None
>> +            }
>> +        })?;
>> +    }
>> +
>> +    Ok(())
>> +}
>> +
>> +fn signature_reg_fuse_version_ga102(
>> +    dev: &device::Device,
>> +    bar: &Bar0,
>> +    engine_id_mask: u16,
>> +    ucode_id: u8,
>> +) -> Result<u32> {
>> +    // The ucode fuse versions are contained in the FUSE_OPT_FPF_<ENGIN=
E>_UCODE<X>_VERSION
>> +    // registers, which are an array. Our register definition macros do=
 not allow us to manage them
>> +    // properly, so we need to hardcode their addresses for now.
>
> Sounds like a TODO?

Yes, although it is addressed in the next iteration of the register
macro (which I will send after this series), which supports register
arrays. Marked this as a TODO nonetheless.

>
>> +
>> +    // Each engine has 16 ucode version registers numbered from 1 to 16=
.
>> +    if ucode_id =3D=3D 0 || ucode_id > 16 {
>> +        dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
>> +        return Err(EINVAL);
>> +    }
>> +
>> +    // Base address of the FUSE registers array corresponding to the en=
gine.
>> +    let reg_fuse_base =3D if engine_id_mask & 0x0001 !=3D 0 {
>> +        regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::OFFSET
>> +    } else if engine_id_mask & 0x0004 !=3D 0 {
>> +        regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::OFFSET
>> +    } else if engine_id_mask & 0x0400 !=3D 0 {
>> +        regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::OFFSET
>> +    } else {
>> +        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask=
);
>> +        return Err(EINVAL);
>> +    };
>> +
>> +    // Read `reg_fuse_base[ucode_id - 1]`.
>> +    let reg_fuse_version =3D
>> +        bar.read32(reg_fuse_base + ((ucode_id - 1) as usize * core::mem=
::size_of::<u32>()));
>> +
>> +    Ok(fls_u32(reg_fuse_version))
>> +}
>> +
>> +fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromP=
arams) -> Result {
>> +    regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
>> +        .set_value(params.pkc_data_offset)
>> +        .write(bar, E::BASE);
>> +    regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
>> +        .set_value(params.engine_id_mask as u32)
>> +        .write(bar, E::BASE);
>> +    regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
>> +        .set_ucode_id(params.ucode_id)
>> +        .write(bar, E::BASE);
>> +    regs::NV_PFALCON2_FALCON_MOD_SEL::default()
>> +        .set_algo(FalconModSelAlgo::Rsa3k)
>> +        .write(bar, E::BASE);
>> +
>> +    Ok(())
>> +}
>> +
>> +pub(super) struct Ga102<E: FalconEngine>(PhantomData<E>);
>> +
>> +impl<E: FalconEngine> Ga102<E> {
>> +    pub(super) fn new() -> Self {
>> +        Self(PhantomData)
>> +    }
>> +}
>> +
>> +impl<E: FalconEngine> FalconHal<E> for Ga102<E> {
>> +    fn select_core(&self, _falcon: &Falcon<E>, bar: &Bar0) -> Result {
>> +        select_core_ga102::<E>(bar)
>> +    }
>> +
>> +    fn signature_reg_fuse_version(
>> +        &self,
>> +        falcon: &Falcon<E>,
>> +        bar: &Bar0,
>> +        engine_id_mask: u16,
>> +        ucode_id: u8,
>> +    ) -> Result<u32> {
>> +        signature_reg_fuse_version_ga102(&falcon.dev, bar, engine_id_ma=
sk, ucode_id)
>> +    }
>> +
>> +    fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &Fa=
lconBromParams) -> Result {
>> +        program_brom_ga102::<E>(bar, params)
>> +    }
>
> Why are those two separate functions?

Do you mean why does `program_brom` calls `program_brom_ga102`? This is
so HAL methods can be re-used in other architectures. For instance,
Hopper's HAL be identical to Ampere save for `select_core`, so having
everything in separate functions allows the Hopper HAL to just call
`program_brom_ga102`. It's a sane convention to have IMHO, maybe we
should codify it via a HAL paragraph in the guidelines document?
