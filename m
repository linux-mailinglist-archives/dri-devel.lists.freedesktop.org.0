Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD3BC1797
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 15:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54EF10E19B;
	Tue,  7 Oct 2025 13:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uOIiE3QA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA9310E19B;
 Tue,  7 Oct 2025 13:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqP7vlu6lxHTiWs8BGG6t7sfmQwSSTS5dYLQKthlQnW7aq3ZQrcP5cD1h1nPbL4wF3++7Fg1H1SbEe3jXADOuneA7wLZqb7Cfod7NV3pppDVNVllRcYj/ImczGbCSJ7DKR9nFNkBuEsItc4jxtbfOi9DrLy2pNY3Meoon7DdhS3rpNIzCEbPp3Nr/yu2O+gERfOlKVirRXyFh2CI3JIdL40OEZN5wfcDJJUgngd0L+Fs3V+XS3RiDjZufAgDRgnONahqR0p5XdTY++/SbYrDRD5uyB29T+ZD75+rhYiKa41fnWxZdpIuub+kX3OFYzZH4aSdbG8pCXS85Xp+3camrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+tiZWiUiUP4yX4qo+8Za7rw5z9ylbokJaWY4T5lzQs=;
 b=op9mwSMy9ROubKD7zw6gdWvprYFNzW95bz6UYpVbU9uelkUpjjz7Zk8PWrEegKTWOwl3fT4LhWT7pHOqwQ5YhH4JmtPNOPa7uS+cC6OPXhFYnlso3MnLN0bZEr/rf4d/3OcI40LcCoaA+/JCcd9nocb//YCPdTgvtESL2TX31o2BFNesK449BtytMpyWCaJlhCB8PE3aaAENELgekwBgsHJYAViB7CewP9k0wr5nZgNahd4mX4IEmxgV2mOiCwCKsxlOWQC2A6KDiCNIaPDHAtPIrzrmynV+LqF1hlrtQndq0irnE84AW+PvS7KXq9iTz1YmprSx3rISW7p5Xh2GEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+tiZWiUiUP4yX4qo+8Za7rw5z9ylbokJaWY4T5lzQs=;
 b=uOIiE3QA+wkz1fZ2YqFJ3dlMJrr92WIU2b13I8jbM2pv6Abs6jPX0n1UZda/t+W7iRLZRESZpH30uf3RcG2Cwj7NxdyMFXSGjNSoJoPM2lZP7YLq7fjBScGbf/44P+GPihkgm+NlUZ+Icq07yFDrjDQVACfcFEa7yw1bAce78c3L++hgNv9Q9gH/FQwRweXVaeWG1AAkk16ktZFqsCgnrgJ/BXsTLbU0JLznE1mXUcm1N8zjE6Vbjcqzhhtq2q22bxxUueOVLh7QNesDwI8g3q8NzhI4mvlKwnDfnXYlwRxhGTtguheUBnS0rHh4u2IZyIVmaT6QX+RDWaApIseRWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 13:20:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 13:20:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Oct 2025 22:20:54 +0900
Message-Id: <DDC4DA0BPHRC.3P5M2CXSJYYTI@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Andrea Righi"
 <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 0/5] Introduce bitfield and move register macro to
 rust/kernel/
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <aORCwckUwZspBMfv@yury> <DDC0VAHL5OCP.DROT6CPKE5H5@nvidia.com>
 <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
In-Reply-To: <CANiq72m1eiGVJHNyym+JwM=tQ9bGnmoW0+OuKQ3Vxo_AQOy5dg@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9008:EE_
X-MS-Office365-Filtering-Correlation-Id: a507b2e6-1ca8-4a18-c61c-08de05a459d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THpKOTArNWt5NEM2ZEhQRUpJNUE1dTJkZFB4YVBVNWxDU3Nmcm92aDJwc1Qw?=
 =?utf-8?B?R0pVSmlGVFYrQmp6cjc3MnNhOWpYSDN1M2tMTWRXRGYzcjJDZG43WFBrOW9E?=
 =?utf-8?B?T1dRRHhISDI2SWFXYkZEZTBsd2tkUm02UWNGR2RNeVRBeTMzdUdGb2I5dFVn?=
 =?utf-8?B?YUZXbDZIVktwZlNXMWNmL2hLMzRvR2k0K2tjeiszMVFZc3lTN0d5TTlQN1ha?=
 =?utf-8?B?N0c4SEdNMGxSczZsNkJtd2tUcnpoVVpLeFZobExwb0lPai9iOFNWNzlLNGlZ?=
 =?utf-8?B?UHBtcjRJR3A0RTQ5aCttazRTUWFjcTliaWVrdFZtZW5CTENXZkIyZUh4RllZ?=
 =?utf-8?B?RlV6b012MlpkcmhkbTF4eXFNZ3ZOaElWTkJIWTU4NCsvaFRmdGkxM3VaUC8w?=
 =?utf-8?B?d3lIOTNSVTZFczVVY2FlMFhWalJ1VndMTnZKbCtNT2tJZTArd1NUR0tHQkdv?=
 =?utf-8?B?V1MrZXBXVHhvZFZ1MFdlSWhZekNGUktXa2o1Yks3a0JaSkltMWtFNG1CMnRT?=
 =?utf-8?B?OWswNm9aZGRaVXFBc2l2L3d6S0JMemRnSFpPbFJYOW5NSnF3czFGaVBGT25a?=
 =?utf-8?B?TGUwMHRWbFVWbWlDVXhGb1hqaXB6Vm9UWHRJTE0zR3IxdHB0Q09aWm9MbjA2?=
 =?utf-8?B?TW9hRHIyN0VXT1dvTGNIQ2VGTHBKN0JwL0NoNFZBYzZsVmU3dmRCZndkeGhP?=
 =?utf-8?B?Z25XcEVWRDVSaGhJdXB1UzFSS0JpRWRWd01LRDZneldrWkNRNjFOWVVNV3ZD?=
 =?utf-8?B?ZmxoL1JCaWp1b3BXSGU0eG9naHBmZVkrUEpRRlFJRmZNU28wOEdSUkR2a3VJ?=
 =?utf-8?B?NC90S0pVdnNEcUI4am12MGVxUnA2OS81TVVRMkxKZEh4TnRHajNBWkpYOTdw?=
 =?utf-8?B?bmt3Z3lYSzdUN1VlcDBvbkltL3RwcTE5Ny9ZWFhlUUV4QktjL1JvVVM4UDZP?=
 =?utf-8?B?aytVQXZValZPc2ZMWEtKV3NiYjVDMHpOZGFBaWJweFdXU1I1cGRyM0RIcFd0?=
 =?utf-8?B?UU94N0hvcFh2Um1oV2ZMZjhLNDhIbDhZMDZibkwwRFhsOW8xS25mS280K2xF?=
 =?utf-8?B?OGplNUZxSjZ4Vmdvb3IyODk1TGpPMncvMU1aTGVPdi9jM2ZzcVJqYmhQUzhs?=
 =?utf-8?B?QVpvTklMazhiZExRR04zblczRnV0RDNyRkQwWWV2QTE1dWIzR0IwNVoycnUw?=
 =?utf-8?B?UlZUVVpjOFV2VTFJVjVrZDlCTXhFcjJQUkxzWUxrSURSR0Yxd3FLY2N3QUFx?=
 =?utf-8?B?UEEva01qYk51K1FpdTFySnZEWHg1TDdBejlraTNIS3hzeGRVWjdGekljeit2?=
 =?utf-8?B?YnlLYldsTnNsd3o5bnQ5QVljM0xpNzdYeDZPUm1lM2ZtclFSa2NPbEJhNVJS?=
 =?utf-8?B?Q3paYi8zRnBGT2NVaVVaUjRGTkpDdDk1MjF5eUo5MzJxWjRvZyt0WDhwZW1q?=
 =?utf-8?B?SnY4VlFwQ3ZpNjAyMWxMcUJQTnNhUFRBSDRFa0Z1QmRVODVocEdkTm1zZjFS?=
 =?utf-8?B?L2lsTEtJd1NPdnVnSXN0b3Z1d1NncllDYkxoTWlRNGpjTlJuQmJoR2pDb1di?=
 =?utf-8?B?SDVxTHV6b1N3TXRJWWdGZFgrd0xuZ1BoZXgxNGxaTzVnQ0w0TkF4SlVXU3ho?=
 =?utf-8?B?cHA2UWFwT1pLcy9vYThacTdrNWhkYWRJSXpQSFBTUFRMSTAzb0YrOGtkQUVp?=
 =?utf-8?B?TUs1UGpVZVJLK1NjSmtQcjRuUGdiQ3REdmRJWm5qOGw5TW9CRXJkOGlpV0JI?=
 =?utf-8?B?Q3BwbHhaV29Cay85LzJ2bWg2Z1dDWnUxSzFCSmJEQTJjZnBrVjhNeWZWeGZK?=
 =?utf-8?B?WENwbml6c2JRTUhxK0JKbXVXOUZjdkdtVGUvL2gvTEMyV2YwWERKNmRzaHdq?=
 =?utf-8?B?MGc4VmY5Uy9SWmcrQ1dUYS9XUTdnVU9CVkx2V2xnTGJ3cTYySDk5RGlkZ252?=
 =?utf-8?Q?FQbiqAOrfdQWd+l1JZKZbH0QfGqeAWYr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alRIcnI2UmxoMnJSOUlmMkl1ZVZvYUFIVU1VNVdYK1p5VU5YeHkxNDFScFFJ?=
 =?utf-8?B?VzZEejJtNTc0M014czRIWTR1empaZDFua0V4NUY2YlRQZSt1d25IRk9QZGFY?=
 =?utf-8?B?RkFwRVZ4UTZnSERwVEtSV09rbWdqZFVHZ1RHUktKVWRqcWExWDE5SUNEMzRM?=
 =?utf-8?B?UzRmSWR0MXNCTXdFcmRiSmI4RUZxOWFvaXJiY3pmUis1d3RaZHd1UVV1SlF4?=
 =?utf-8?B?NGpjNTZFc3Ivc1k3N1d4a0N1STR5ZnNjWEpyT3NneXZaS3BjN25ETzYwZjcz?=
 =?utf-8?B?YTdWZVpFYzlZZk1kRlZZRVFLSnNjWFZ4MnVpcnFHYnZxdklDM0RwRGs1NE1W?=
 =?utf-8?B?a3dyMjJtR2h0ekpkU0RQY0xuMHZ3QkR1a1h1US9iOEpUZjBpempteWxXYmps?=
 =?utf-8?B?UU9rOVF3VmxnUnZZY3U5YWlYaTZyVy85M0RpMXl1dDBzc3BZWTBxMUozTitR?=
 =?utf-8?B?cGVEV0x3YmVFY2hkSG8zRUhkc3hrUy9YMGFUVlR1RnEzOE5ZR0YzWU8vaVg0?=
 =?utf-8?B?NlJQNm5Xb0NvK3JqOUIydS9hWXpEV1g0YndPY3NFZTVwUlNQZWptRTc2S1kv?=
 =?utf-8?B?UmJ0MGhDekVrMndNZ1MxYWdjUU5HZ2J3eHlyM3VDTWQ4bldhMjdXOVY5Q1NS?=
 =?utf-8?B?WG9QVDB3bjVNOERYcnZiUW02RzhScE1rWU9KWU1Zd1FUWnFNa0FvdFpkbzJD?=
 =?utf-8?B?MG41SnBYanU2V3ppelZ5Y1o4SFdRYmhaVGtkbWN6bmlqV2NJckhkOE9yZnZV?=
 =?utf-8?B?MG9qYUNsRDlMVWJINVNZdFZScXBRSnNCU3l2VVpHaWZndFcyODZzZ2ZQZDNt?=
 =?utf-8?B?STZUN1A5bFpRcEVtY1pvN2xHZEF6TVRNUjVZWlVjd1ovMkNFQ2luaitIcG5X?=
 =?utf-8?B?MTF1S0VGSWw2MmVjWjZKemdwNVlzTmcyQzBmVTFMcnFzL0hLZFlRVEQzSDgz?=
 =?utf-8?B?ZmVjSlZoT1l1a3VOMk1tWnN1cUZhbGhWalJ6S0l4TXVUcVdOaTRIOWI5S2dX?=
 =?utf-8?B?RERLd0pXbDIxNlBPYkFsVnhCSmJBRVZlSnlMNzZ1SjlqTEhBNmJSUFFuZm5o?=
 =?utf-8?B?a09DT0JCRm5wZGMrMWRxSXU2S2Vmb285VCtBSmQxbzlFeXpFK2tWalk1bnlZ?=
 =?utf-8?B?TWhVNXpsZUs1bUhLTnUxbTV4MXk3dUFmZXJ5TlRqNnZVeGQ2YTd2VDFva2dP?=
 =?utf-8?B?YkREdkRMUGdXUENrQ3BNeXY0aTNNQnU2OXh4VldIT2RPbEROV096YzhpMWpN?=
 =?utf-8?B?emtZMXJmbFdLYzExSUliMkdTSTk2YVh4U1BVQW1wUENleVFERDBveEkyekJM?=
 =?utf-8?B?Q3hKOUlvY2R2M2lnZHJPdW92elVrbWxvZmZKc2w5b1V4Sk55RWpVVk91bzBI?=
 =?utf-8?B?M0pjU0djTUw1RytTZGlKQmFZRmRmK3JEbUxEbHpWdXdWbDZIbFo5Z1BNbDNM?=
 =?utf-8?B?RDkxWHRkYThIR1ZOL0dWTGJWdjBWNDZESEQ3MWVmbGNsZVNGRHBhMXllSzE1?=
 =?utf-8?B?R21tdndkeXljQStKbHZ4M0pKVlNoWWJHanRJdVRDdldFbXZ1YVJWWU56T0Mz?=
 =?utf-8?B?Z1FuejhBUnhBdVpGOVNOWlE3TTFTZkV3L0VvUWJXZzNUZnlhZURCdUo5Q1o1?=
 =?utf-8?B?SjE4Ni9rdWE0aUwzanFIRGZRbzg4eDZWTCtIVWlHVHhjVEdaZWVZR2xIODRv?=
 =?utf-8?B?eXVMUVRuZjZWVW1uL0lSQWpURTJoZk5pa2lBVG1rWHlsMzE5Z1ZUdHFJa3U1?=
 =?utf-8?B?MmxuQzk0RFBDMUVYdWdpTDQvL1FsRytjWVNOdndKdGptc0c1ZFV4MHJBazRF?=
 =?utf-8?B?YjZoN1VzQThISW1hZXhuY1o1M3ZIRVA4UGhadU55a3BHN3hrR2ZmUDduNzBa?=
 =?utf-8?B?TlVHeTB6dkxiR0cyTGVMRCtsaU5qcERqY212Z0g4djFmRG9XSGVJZkluTmQ0?=
 =?utf-8?B?ZldLN3pLd2xBSUcvS2hENnJPZm9qUG1RQkhEcmx3S1R5ZVczcWFiaXBLbThl?=
 =?utf-8?B?NlpsL2FaU0xseEhBZG12d0Nheit2UHE3T2RLVU94RllGNXppYkRCVUpocVZF?=
 =?utf-8?B?Z3VSU01OdHZYeEVVRFhwQTZyMmc1Vnh2QjFWczcyMVdlbW95L2ZNV1VKNlV3?=
 =?utf-8?B?d0lEKy8yd093ZS81bFA3OEltR0lyV3dLK1FuVDJSdFMvbzh1YTJNV3h6dGln?=
 =?utf-8?Q?YJIozoAUaQDNypkDVAZbS5+caCycCYDVFyWoHzip4lFW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a507b2e6-1ca8-4a18-c61c-08de05a459d9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 13:20:57.5348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HZLHImADH4o131TD7uB7uN1Fazyy8dZkgPop4dqgG+lACAyiIUuCCh6qLDNV8bUdxT7jgVwi6TYYg3GeSq1ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008
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

On Tue Oct 7, 2025 at 7:42 PM JST, Miguel Ojeda wrote:
> On Tue, Oct 7, 2025 at 12:36=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> We can assume maintainership of this of course, but is there a problem
>> if this falls under the core Rust umbrella? As this is a pretty core
>> functionality. Miguel and other core folks, WDYT?
>
> I think what Yury may mean is that this should get an explicit
> `MAINTAINERS` subentry even if it falls under `rust/kernel/` -- I
> agree that is a good idea.

Ack - how do you expect things to work in terms of code flow? Do we need
to have a dedicated tree and send you pull requests? If so, should we
host it under the Rust-for-Linux Github org?
