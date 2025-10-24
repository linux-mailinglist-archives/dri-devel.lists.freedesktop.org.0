Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34829C0618D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5178B10EA84;
	Fri, 24 Oct 2025 11:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kwd+ylIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010060.outbound.protection.outlook.com
 [40.93.198.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03A010EA84;
 Fri, 24 Oct 2025 11:51:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TixLR9OPGtbdZiHG/sjDngiPAn+7WtSh1vWFptv++o0IB2CD80p5wr1xwCxW6AyxOqZc1luLrne4Husx1Qdsv8pOvMndf4pyvOcCNK/pPN++6rQ/l+wv9E9v95f6Show5XwTTRi8PsLdBQvtAv+2okn6VkT5nGvUB1yZC5wlsrGJwgx0rrF6sLv1xuduIX7oBi1Uc10QD0ILukad5PB8NDuiKVrkV91MgkmIEoeIHS/wjSKkKFJCCP45JgLwuop6sePsSV6T22aJICHLqL2EPAOVie+JqyLIp6NYxP9D1z/Nh8JNrddiw/fEww9qIxODuXm/JFEXwYJR7RnQrboaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmnXVMHCkjH+pT5FWfzR2PppcnPVZZEB4+2kaglDY9c=;
 b=ldUqJr61eByhWeoxsyph+K/jvVsTanVDlrxaEp0sJLRPuTzd3hkpopXFbqcECWWI5ij1JQTJP7rhi2kPPOMzDLu6hlx4s1C72Wu4MS3dDl5YblkrQQqIputXuUi1bZ8MYb+1BLCskUWv1GKpVUKBw/0U81A3blqMKf0MCLCu1ncn0bbZbjQs55lG8GzaDCwmvHgqB+MtZnVPL2i4161fNQsOr8w7pQxYkdtaQH6qNHnnkLYDAOfgpscEh2nKpWFk6HDkkZ5yEs2Nkfpyzy6njlPNk5+Nt9trftMNNh8YKyYx3wHi4a26eu2Zf8nKm+e/Fz3Zf+3NaTkGcih8Ko6qXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmnXVMHCkjH+pT5FWfzR2PppcnPVZZEB4+2kaglDY9c=;
 b=Kwd+ylIn9u0vaIjDuHHWLswxAwJsk+y3g8YPI9DqJZ70/JIebDHvgB68NdlWVxI6mRdNpEMIbhD2ObhxqdE/4r2DsRlFxuQeQiklwPCM0bDmCqUOzXNIzulza3ViVcGdgvH0klCBROzOfqyKQK6pxRV4GW0He/UY9rLIEIb0MXkJpN+OByRfBlH94o7PXApR2DDUXUP+K69W5A9wF9RFI0vZdBrIrlsMH5im0tys748GO7h9OWPEs2Ib8Mdd7Dc1F3Au9UMJ4r1QMjAxQRWgiPSxGG8fCt9na8/UwF8qqDamJ5PjxQpNFm6MGNFA6WpSlW8jPJLNF2iQa4VKRZ0upw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 11:51:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 11:51:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 20:51:29 +0900
Message-Id: <DDQJ433KOPW6.3VMVZ86418116@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Pre-requisite patches for mm and irq in nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <DDONM9Z1XF2T.32OBDFX7FONJY@nvidia.com>
 <3cc835b1-d9e6-4d91-a398-7ea9c8f4332a@nvidia.com>
In-Reply-To: <3cc835b1-d9e6-4d91-a398-7ea9c8f4332a@nvidia.com>
X-ClientProxiedBy: TYCP301CA0053.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: d647401a-fdce-4d1e-eae8-08de12f3ad44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGV4TWkwOVVjZEMvcFluTDVBRGtMT2J2TzNxMGhxOE9tVFBNb25yQWtTZzY4?=
 =?utf-8?B?MVNQcFpBMklhb0VGdEs0TXZuUXZxNGZSWGI5MWw3VDQzS3NsS0xOd01MUytF?=
 =?utf-8?B?RG03dVNTTTVOS25pMzMwZGM4NlZUK2M2N3ZJT0p6U0djL0ZUSy9FOXcxRUVk?=
 =?utf-8?B?aEJ5SFVxSmd6QWNQcjRoTkhNaU5jYkxSQS9UQnBycVdqYkJ3OTZ0NTh6S2Zm?=
 =?utf-8?B?R1M5RHRQYktSWCsvVHlhcG9oTlZMVUVnekpKWlBsY0R4aEJoRk9qUXlLb3pE?=
 =?utf-8?B?MmVQYmxuUUNOdlI4YmRXWjRtVGViRWtmWlBkdTE5Y3dScmlzZEpKUG1FVUtp?=
 =?utf-8?B?TG1hd290N2l5bjBkaDYxY0FDd2F6ZzJud1pWVEYwYXJpbnl3a0FKRnoybzJt?=
 =?utf-8?B?ZTNNWmRvV0RqUjlVcWpvUWZsR1RHMmJMTWNiZUlubWxhN2poa1BPWkdvR1lO?=
 =?utf-8?B?TDh4b25OdCsrYzZLSXljcmxBcHlvbGpnOWlpTyt0ZG9FNWIwd0lka1NoWXpO?=
 =?utf-8?B?aklKYzBsZ3pzb004K0w2dkZDZ2NuVWRXQ2dPUHorWWVzWit3S0lkY2MxcWtN?=
 =?utf-8?B?VkE1TzYvNlJmeG96TkQ3QitTM0pRU2oyQ3NZTGlEQy9ZRFZZYVpOWmFjS1RH?=
 =?utf-8?B?bjgxcWtBUHZuVEJFb2YwcTZMRFZxV0UrR0JIN2dRbkpwemhhdzk4NlFmRGE5?=
 =?utf-8?B?UzZEWEgrYktSQ29VRzUrb2lxeTU4Y0lmeTl1R1c3eFpEOU5FTmgrUDFUOGN4?=
 =?utf-8?B?MlhBeFBnSkxoUmh2UU41aFg0dEl5ekprTVFWY2ZRN01rMFo1ekw3eWlsdnNj?=
 =?utf-8?B?THdoUW1UNG15cGZka3hMNnVDWmFjdmwvUi9QNWZzbzdPSCtOQzhNRFZ4VU4x?=
 =?utf-8?B?bkduZkNma3JwQXlJdXNrK3g4Z3NFdy8yTHVUVmxwMUgxa0RPZnRST29aWmNT?=
 =?utf-8?B?cW1kYmhOczdQVFNtckJKSFQ3cFJSMDNNenZSenl6Si9mK0lSdzdkZ2xlM0pF?=
 =?utf-8?B?QUd0NEZGT2MwaDlmTmk4bWpHRnI4MnZsL09xUUd4cUhmV2xrdjF0S0h2bmRo?=
 =?utf-8?B?MUkwVFdnSnV4ZjExR0k0REFBQ1FmUWZZcDBoTjBtaWVKdUYzYkhnemxCWUNm?=
 =?utf-8?B?MGF6L1luQWxRaTYyeHBQQUlBc0J6NmY4RTlDbmI0cFNvZUxjSVlCZGdhVWhv?=
 =?utf-8?B?ZThXbGZhSjQzaEg5d3lOWVFxc2hmR0g0eTRwN2w3Y2Nxa2lKN1Z3ZkNOSWpG?=
 =?utf-8?B?YkVHUFF1SXYrem1oclpPVE4vVnJidEQ1eitUbXFOdVFkNUkvQU1MckdnWTkv?=
 =?utf-8?B?QmZodmdHT3hZNnpMNnk5TFloNFJoZHBTOWxwNEQzTk9ianZNUXQ4VitWMUtY?=
 =?utf-8?B?d1JBRVp3YkxvVVpidlY5K20vM0IvaElVUTgxc2dpcnhDNDBoWlNQdCsxN2s1?=
 =?utf-8?B?RWNFMlRoM1BKTVh6RnBiODIrVjI0SVZDNm52Y25XUHRyb1hBMkkxTTRnenl0?=
 =?utf-8?B?Qzc3dUNrWnZaWExnWUpxOEhSemxFdXFkZFg0cG9jTGdNalBPeExiUS9Xdmtn?=
 =?utf-8?B?cGdTTlQxdkxscHFVeUhCcWsySFNrT3RMU1pGdzRzWHFoZFMrT2Q1UmxnVEov?=
 =?utf-8?B?VHh6T29ZL1RxNnJBOTJadFcyYjd0MGFZTlBLVnFvK3BIS2cwNXZueGsvbkpR?=
 =?utf-8?B?WFk5cUR3WDRnMEtFWGRxenhpQ2oxR1BpVGNGR3hSUzh3Sk1TcWo2SGcxSU55?=
 =?utf-8?B?c002ZnN6MStkMlRmMzgxRnR0QnRRaWNmdlV0cllob1ZzZGpTN0RzdFM0SU41?=
 =?utf-8?B?R2hWSndTekNyQ25CNXVQT0p2Ym1YRXo2MlM0cnZqelRsMjBIYUNpZndqbXRL?=
 =?utf-8?B?K0EzMStMcHNSTW16czJJM2RLQnVDakFwdlRpaUZqVEtydkMvMmFIWVRlR0Rk?=
 =?utf-8?Q?/8iTgi5aUXZwO0mTfwdN8Ku8vh4LMspO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZURUanQ5RG1BYWVtbWY1WlVESE56T2FDL1VTY1FUSU5neFZ4bkxBc3lXU2cx?=
 =?utf-8?B?YjhFTjVKRmhreHBPaUhSNDlncVlsRDMzVHBNWXFvclUyVVlteVd2dW1ValhD?=
 =?utf-8?B?OGRGWm1zT09HV0xja3A3Nkt6VkZ2eGlMcHd1Wk9GbnZnVXpaeCtBc1Zqc0wx?=
 =?utf-8?B?dGhiaEZ3RUpDNkgyYmtEQ2hHRWI2OGxwZmNYUTA0TmNzY1dqYVJPb3IxdXR1?=
 =?utf-8?B?TWN4bThXUFQwcXBpYU9lMDdjVTNZZSs1cVRXNGZ3cHNVa3JWSm00bkpGNExH?=
 =?utf-8?B?aUQwNGxkeHcrVTVWRTBWd3FBUDZGVS9uZHFQWDkrVHlmQXhSOFR1VURDam9p?=
 =?utf-8?B?aEFRYllCYXNGUUQ5NkxXL2RxcFc0TTg3bWhvaWpsb1FVM0NrOTUxdXhBWXVO?=
 =?utf-8?B?SzN4WkVxZ2tZTGhMa2ZLRURNSndySGNFc0VYN2lXY05Va1JWQXJKaW5jdG9R?=
 =?utf-8?B?RVNxZEYvUHRuTDhEckphRkx6MDhaMnhzbmhvcDBhZE9FRjBvV2pIOXp2bWlz?=
 =?utf-8?B?VVM5Ujl0YUh1U0NQVzRPdFlVWDlIdXJRaW4yaWpVeG5aeHU5RlllSW1QN0NF?=
 =?utf-8?B?Ly96VVozVklQWEoxWU5jRHQ3aUUwMmNMTGt1NXpzaXdmaVcydHl4S1ZVYndt?=
 =?utf-8?B?VElvSWZqcDd1SDZrUE5TZFpLTWx0cHRaN290YTFxblFhb3NTU2QyQ0FIV3Yr?=
 =?utf-8?B?bm9BT1VQa01jZkNzUCt4S0FTVEVsZFQ1czF5cDVnY2NtWTROeVkwdlJUVGRw?=
 =?utf-8?B?cTBzazF1R0JiR29rUGpSVngzZ1Z2eXhJVnRqQWxxZENtak5uL3UwYzZlZGhG?=
 =?utf-8?B?cnpFaUZqazJMZTJEVVJMNGxQZWdLRXhPVjBobVkvWm5CK05oOUN0clcxcnF0?=
 =?utf-8?B?bWdGRlFYYjdQdWFlTjlDQTRzdHhqTmdrcGliWUdNOHlzcEJPYUFua2xydFZl?=
 =?utf-8?B?ZmdKTngrRkVOb3MvVzZyaEcvQ1lWb0RyeDJsVWVYRlFJa2UzNy9UdEFqT1Jj?=
 =?utf-8?B?SmE2ajI0cEdiNGFZakptQ0JTS1UxbDFuSHJLYW0rODMrQmJJWjJJVUZqUE90?=
 =?utf-8?B?MlZoeDlYRGJjaVVyNFVpK2dIR01rdG5JdjlvVGVldHQvdm5TY2o1TGFkb2s0?=
 =?utf-8?B?dEdka2wzWWY5N0c1TUJiRDdRUFhzd1ZuWHJEcWFEZDZ5bGZkai9yTGNiWXMr?=
 =?utf-8?B?a3MvMldaT3VNV3puMW9wZE9vbzhiV2Z6QktMQzBXL0ZCcWVrV0cvMU1sSE9C?=
 =?utf-8?B?TTVXT2FZdTgrenZGalJiWGVQNkhOZ3ZyZ0VTcHRqa1FaSzZqRnhIU216dGNJ?=
 =?utf-8?B?dk9XQmJoNm5MSDhXKytRZzY5L05lRFYzL3JjckFBWDdlMHV3UlJRV2N5SEM1?=
 =?utf-8?B?TExFMlNOanNLaE4yWi9LVUVSVDUwdnU0dy9TUFNyQmVxSzROTzNqcVZ0YUtI?=
 =?utf-8?B?YnpLUmNINlJhWlgxYnYxUkpIQ2xsdWhwd1lEaitpdzJqWmtsdEJiNFVjeXpK?=
 =?utf-8?B?YWQ1QUxBaDYzQUdoQWQrMGZZNmdLTnhlcUZQZUs2Ylk1cUNrc1dLcFBBY25h?=
 =?utf-8?B?ZEgwM0lDY2dyeU1RVEV4cXkyUFVEQ2g0YmJ4Z1ZHcVFBR2VZMHFmaEsvUGJk?=
 =?utf-8?B?M0ZheUFva2RzOVlwZEFFbGNQMnpLeHY4eHpNMFhsN1ZrNWxrS3JyNGREck5Q?=
 =?utf-8?B?a0xhUXlraEN5TnUrdTV6SnA4SkREaksvL2ZNMVVjMzd5dUtWVzBjOEx3Q3M4?=
 =?utf-8?B?L3c1UGhYVzdMVVlDWHVtS0dFV3ZOSDkyaFVUVDZ4eTlOcEZweVlVcFl5T0dU?=
 =?utf-8?B?NEpwWTYzZnlVM25iMWI5T0RzbUFTSHAvV3RVNC81MkMvUkJsUk1PMlI4ZnFM?=
 =?utf-8?B?Z0xaV294V3FvMk83M3RhWTc2cmZRbW41V0NvdWF1d05ReEhPSnFpQkxNTHYx?=
 =?utf-8?B?TGI1bnZNUFgyQ2lQWVYrclhodHZPc1lGWWJPaVpqV2JLZTV5OG1xci9CMm1Y?=
 =?utf-8?B?WHEzaFNtRERIekY5aTNOUlNtSkRzTk50MEJvaE1uR0NQWkpxOVNKSVc5a2Uw?=
 =?utf-8?B?ZzhjZENaUnVmZDJ3UEEvUzRCZFF1N0E5c1J1TndxTFVPay9jU1o0V3crYVZD?=
 =?utf-8?B?Y29TSFkrUy9MSE5GMEJZU2s2aENiRzNua1ZhMHNPVjZrK0tOUXhZZ1oxUWtR?=
 =?utf-8?Q?4dGL6b4BltOTPuL/epMMq/Fdx2d5CqHjiNXDjm5Ka++f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d647401a-fdce-4d1e-eae8-08de12f3ad44
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 11:51:32.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhZZ1g9uQKOG8NTLQSP1h/UiNY0IVibTj0SI0tJI67cIN7Peq4IphKfTIG9KSucXuHgYskoi3mq7WMu8K4+4ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
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

On Thu Oct 23, 2025 at 6:30 AM JST, Joel Fernandes wrote:
>> - The falcon interrupts patch does not seem to be used by the last two
>>   patches? I guess it belongs to the series that will add support for
>>   the interrupt controller.
> No, it is independent. Yes this leads up to the interrupt handing feature=
, but
> just to emphasize a bit, the motivation was to "get small patches" in so =
that we
> don't need to do obvious things later (example, the VFN interrupt module =
is much
> more complex than this GSP patch yet both are needed for interrupt handli=
ng, so
> the GSP patch is a good candidate IMO for upstreaming in the next merge w=
indow).
> Having small patches merged reduces future burden on both reviewers and t=
he
> developers. This is also not something new, for instance we don't have an=
y users
> of the PCI MSI IRQ allocation bindings in rust/, yet we merged those. I t=
hink
> that is reasonable. RFC should be used too when it makes sense, but I thi=
nk we
> should also look into merging things in chunks to avoid future review/reb=
ase
> burden. There isn't one rule that fits all is my point, right? I mean jus=
t look
> at the attempted bitfield move too, Nova is the only user yet we will mov=
e it
> out. But one may ask why move it out until there are other users? It has =
to be
> on a case-by-case basis..

We do have another user for bitfield/register and that's Tyr - the move
is to allow them to use these macros.

I am also more comfortable merging code when I understand how it is
called and used in practice. It doesn't necessarily need to be fully
complete, but something at least in RFC status demonstrating a real use
of the API helps.

Once a core patch in RFC status is reviewed and agreed on, it can be
added (with all the Reviewed-by tags) to the series containing its user
code, even if the user code comes later. It delays the merging of the
core code a bit, but since it has no user it would be dead merged code
anyway, and when you look at the whole picture it really comes down to
the same - there is no delay to when the machinery starts moving to
produce something useful.

Exceptions can be discussed if e.g. there is a big risk that a
refactoring will wreck everything, but this doesn't appear to be a
factor here.

