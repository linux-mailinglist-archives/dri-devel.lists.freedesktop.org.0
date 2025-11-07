Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1ACC41F3E
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1D410EB8F;
	Fri,  7 Nov 2025 23:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uqZF99F1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E5510E1AD;
 Fri,  7 Nov 2025 23:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezOI00IFVBygK96O/j/qUrXfrdgcvBA86oGmy3xqSK3eHXDMyyqAIDp/Zlv+8o5mu1VqqsyI5LjDxPF3rsJwUanH9FRYby78xdckhcWcvrxyUlwuvjuS7u55U3D5MAF6hqebg80gVWG40PGBYk4TNldGaodt9v79lWo1obyTAcs7eWO4j4Y3LjUBZaF1rhXdA9Wxncrr87qbFOr95XMidCG/DkbN9oXNSoM6/l0rOwzKKlw8K8FGPCTbhkaFObUCIg3Y8bWnpGAQVZwuKiFvrV8bPJ/SGUSu+Njr/rCrnXvQWRhpu6GikF4ng0Dtkz3c8XbYh1U41JZ+pAzBkL/96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoFtDLpC2Mk+abPyafZCCjutDWGoHpnCT+/sAD6aiTE=;
 b=gfzgdei/M77u6w7V9IsM2ekaCxrWaeVSqn1kHbG5mdGYn4ek2Ym+HZAF4ir2ZCnP4/rhXXre7o1+Laulz6OMmsgKEsIgb5xsHAiLth12CeedmlwcvqvFIovgMgFG9PZTVluBLXRJcqGosXGfO68VwTgQlxPgeMhso/RTI+X1VMaZ/yCXJhFXGiNsVLQjnhouX7M9hYQ6VBHf5TJia8NrM/CA+YaIfrLlA6hIWFx3PqWAy7nd/5kEDSjXj7xm3KLx6iIUcx+aqxo7Z4r6wUfdrt1TWKT8h84vSvWvE7pFDUv12UW1jiCP4xW/8LZ9zarONEDl300dnm3ZXmKasMy+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoFtDLpC2Mk+abPyafZCCjutDWGoHpnCT+/sAD6aiTE=;
 b=uqZF99F1ZWlYHNK3Nj8rzQ7RMR5tawPQm8KkRZ+PE8KmwowhkxFVlQUGYPi4/h/qXbK2l3AFphoaA1ql10kUcR39zshhrG02Grmz8xJOpLq1IWMuKp9S3higZ96VUFm7jzlcYzU1mROnkGCq0C6XyaFqaNvllE06oDzUFadiXsZi8+92Kr4ONXM+GttqN9Yn4lYlRfdrDs/MfKMMBvO6tcQz1P7V6xpaOwCkD4pS7AUfx8aDP9LiB7jMyMVb9QMv/N0RGxjuIPfAajieEkzbQGhXjuMTZ5ZFqiIGYGilSlc4LMvElqOUDNsEhFGQQeLcTwKo46g8cIPx7AtTkG8xbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 7 Nov
 2025 23:31:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:30:58 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 08:30:55 +0900
Message-Id: <DE2UR8B3NFSN.27WJF1J897R4Z@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 0/6] gpu: nova-core: remove use of `as` for integer
 conversions
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
In-Reply-To: <20251029-nova-as-v3-0-6a30c7333ad9@nvidia.com>
X-ClientProxiedBy: TYCP286CA0094.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3ad970-0e38-4de5-1808-08de1e55b464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzNlNHlHZUhyS0NLSTAxelQzTHdDczBJK2RUWmNEampMdytDYzFkZ25oWXQv?=
 =?utf-8?B?d1FFanZJSEJ0SWpSMzJKRFlSbUhQazJpeG0wQVBUNjUxc3pGQjJ1VFVvc3Iz?=
 =?utf-8?B?NCtFZTM0aDBmeGFPcHlDSDdXa0txcGNEWUwvSzRiUVVZcVFXSTFHZWVlSVlS?=
 =?utf-8?B?UDQxUjZ5c284ZFl4UU9QdDRhQ1VTckhLWGRocFRKT2tnMUhHNVZMLzdSdFkx?=
 =?utf-8?B?VWltWEgrRjF2UTlNcUoyM292LzR0Z2kxQzk5SzdHTXpmeHd0aTZ2TVgxMzEz?=
 =?utf-8?B?S3IzSFFyZjVSQm92b1RvMi9uOU5kWFh3TTE2MTJlaFRwUnJVSk1uWW9WeTNh?=
 =?utf-8?B?ckZqUXVYaWowQkJyWTc5cXRDS3lFV2pKTHJMRUE4RDh1ZnRCV1lWQTJCa3pj?=
 =?utf-8?B?TTJwZlFXYVNJWmtxbTV3Q01nTDhSTVlNRGZUVzRXa29QOG9HbXptaG5PN3NG?=
 =?utf-8?B?NmUzb0xUenRkV3RXZXQ1NDJHb3ZTbVIrbDM5Q2YrMUdQZ09NcFg1bEVvTm5n?=
 =?utf-8?B?RldaL0lOelYxWlhQdnJGTlI5VTdBTXRTU3NrSUZJRDJER240eG5YREVyRnQ5?=
 =?utf-8?B?NEV5cVhCczRMMk01NVZkb2NXOFA0NlF3U2dWMFhpK1M0Ly91YWdzY0xzZEFa?=
 =?utf-8?B?WWJtZmhMMlBqQlEzR0tESng3aXQ5TW1SN3V0Wmt5M1dzTkdSMUJnU0k3dU55?=
 =?utf-8?B?ZDJQWTMxNkVZQWFGRDZWUG8rU2pjMnRQNHl4R0RXL0wwZkJiYnFmaG54UytJ?=
 =?utf-8?B?Y214QVVxTFM3RDlHVllmZUFmWlA3bUpzbHRGSUhpY09KZjhDVG9ISzQyZ1Jn?=
 =?utf-8?B?K3lIbTNDUkRGcEJvVDk5Y3pOSGZkd3c2RWFKUEFrNDBwNWM0R3RPeXcyZXhs?=
 =?utf-8?B?bEFIcTRYbWIxN255cHRsckJBaEhzcWVCTTh1eHI3angvYThJWFkvTHNJTWJS?=
 =?utf-8?B?WHdBVnd4QUtZdVJ6UGFkWnppSTFIUVdnUFJ0LzdqR1lESml6RjdMTUwrcU92?=
 =?utf-8?B?RENjZmlQNDkxNTVnSlB3cEJiK3dYMHhDT1BKMXF3TUI0VEZTRHR2R0FsSTRu?=
 =?utf-8?B?Q3UrdnRuUUlIYnRvb0ZIMHZxR1FZbzBNcm1naEI5SlNEMDh6VGQ0SkU5UnQr?=
 =?utf-8?B?TUVnM2RXbVZRSmZza2VyN3luTzNVMWdlbDBoRXhtS0YzekR2ZlNzanpUOXp2?=
 =?utf-8?B?TWtWNE5sYldLVTRPb1N3b2xBdDVoNnl2SnozcmpId0dydkE2dkdWVUhiVFNz?=
 =?utf-8?B?ZFdmRmt5bWJJNURUWjBaRGd2a0NaQkR4eHBsUmJac1ZpUU1ydHVIb2JLalZo?=
 =?utf-8?B?YVI5bGlJRytWcVNZLzR0ckp4MCtNd3hRRWo1ZWZoNzVPby9MYU1CTGFDbjJF?=
 =?utf-8?B?SWFEUC9BaW9rb2hPSWFYY1BCYnVEUHdhVEdtL2NnL2VtS1hMQ3NYZzlFNGJE?=
 =?utf-8?B?M25tbGxOOE53Zyt0ejYxZVpwUE5KbFdvRWNwLzVkSzVxc2NnUXZNTi9La1N0?=
 =?utf-8?B?L0I3cVo0ME1TbDZscHJ0QTAyMjVGdDQxOGZVdWMwU2FJcVZHWHluMkpiY3pE?=
 =?utf-8?B?ZFFVRG1yTm1iSjRJYlczMjhXQmJ3eDBpVEhLZyt3M2pjQWtvZkRSRGQ1TTBC?=
 =?utf-8?B?QXc3Q3RTU2Z4Zmo2c1JaMFJqR2J5MjZVcEZWRFpjYzlQcEMxd1RMcG8weFp2?=
 =?utf-8?B?a0RjVU1RSXozMHFFTFVPdmRYejRBUDZteWlZVHE0TWQySVNvWllGazZSbXkx?=
 =?utf-8?B?TkozbE05ZlNjVWRUbTY4dGRoSTMybXRtcUk4M3lQcWRMdXdoVXRvSzFpdEVU?=
 =?utf-8?B?eUtWNDFrMEpkOXlVcnNwQkY4U09Zc2lLNXdsdnArRFlBaEhsbjNkU3dpODMr?=
 =?utf-8?B?bUNpU3RWWkdUV1FGUUxYbXJvMUo3S3RWclo2bHljOFV3N3JtUk5aSU5DWis5?=
 =?utf-8?B?djZpZElLWHpYcEdQb1cvRERWNWJhYWl3WmF5SlBEQkxnc3NsUkpoYzJuSk1j?=
 =?utf-8?Q?mrABuUglBzAEm/SY51+nwJnSDr/oyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SExFZTVocVdJa2dLMmNpR281NlNXYWFURkxmaHdtaDNiZzJ1aGpWTVZvbm9s?=
 =?utf-8?B?dTY3QWo5ZSt6aHczQm5laVRPTktnQktya2dMaFVhZHExbEo1T0RTRCtMMm5r?=
 =?utf-8?B?QkovOUVNUldrclJaVjBsLzY1N0dCdFlEdjB2RGx5OGJxZWErVnozZkNWZHU5?=
 =?utf-8?B?UzBJbGJ0elNDRzdjdis4c3YrUzBQNWFtV0FtUXN2dGdESnVFYjA3bjFlN1ND?=
 =?utf-8?B?REpweG5mU2R3a0lWaGp4NlRlZzB4djZVb0ZhWTBoKzlRaE9kT1ZLQWZ1M2Q5?=
 =?utf-8?B?SSsyTFlKbElwZ0k2czRpb3JrcXVuMHJnY2RWRUJGUXA1R29xNnB3TlUwdG5j?=
 =?utf-8?B?YklLWDJGbE12WWZwMVpHZFhLQ1M0OGVvUUEyazZuVnF4NExpK2wrOHNrdmo0?=
 =?utf-8?B?SDNFUzJYR2x3RnpZbFZRdmRjcjREVnpIN3BBdGwwTWNMeEJBY3IxU0swK01j?=
 =?utf-8?B?NHRQOE5NeUczZWxaQ09jdDU3L2psbGJBcEJqY2VxWjhjTHhJWERMZGZCWXBh?=
 =?utf-8?B?QlluaFZ4Tk5KRy82UGtILzJLRDJFcXFsUzRmZWVML3Q0OWhJR01uQXYwU0dw?=
 =?utf-8?B?UDdlaEdOd25QcjUwWnZsd1VNT21zdmJRZDViZWxjNWxIc3dtUjZBVHBjVldt?=
 =?utf-8?B?c0JIelZGVjJnZW83WnRYekhDaDdPbitkd1FobVRXSVRuSFQ2NkJkbDFJS0J1?=
 =?utf-8?B?ekU2YktzVjZvaGNEc0pzMTNSdHpyc2tVZUlZQXZuZkFmc2NmeXRIYzdHbnRU?=
 =?utf-8?B?UVpHRnlzYWtaOU1iRGhTVmFNdUxja0d4RUZOdStIL2RCYnp4Yjlta25rbUhL?=
 =?utf-8?B?elo3S0JrVmQwNksyb25LYUExZTFBSDNMdG4yTFlDeFBBQnVDK0lEdno1dGpj?=
 =?utf-8?B?K2JDeG9JMEtkWDBPaG1sM2pVUWpReFg0MjRVRkRVcUZqUUVSdGhTekwxVEJM?=
 =?utf-8?B?MFAydFdXd2ptMnJXZXFheGdTdGVLNWMyK0Zna3VQMWFGbjFZTWVldFczYkJ5?=
 =?utf-8?B?ajBDMllzSXo0T1UzZWxNQUtHZS9nRkh3OCtBNEVsdEltQzc4d1ZVQko5ZW5u?=
 =?utf-8?B?YSt1S3VjSmJuUzVjbEhzMVZsK0sveTNvQ3g1Ty9EamY5ZmZqZ1VwYVVFZEQz?=
 =?utf-8?B?V0dCZ2h5YmpnV1JOcXlyOXQ0SWV3alU4enY3K2hxZkdoMGhYSVZOQ2MzSWg5?=
 =?utf-8?B?TDlxQSs4Y2hLRVE3SmtFdk8vUjhxNHBraGM3VFBjTGZaU0cwNnFCcnBQdmI1?=
 =?utf-8?B?UnUrVlZLbmh1ZTB1UHVQalMyOGRhMktsK1JwM0dObUI1eGtSdVdNaUhPQmJO?=
 =?utf-8?B?RERHNlQxT1NDU3ViSmg3YkVlb1pBRGZaak5Wd3lwaDJ4dlp6dXJoODEvNFJ4?=
 =?utf-8?B?dDZSZHZMSjZOVlpjZytOQW1laTR5bEdCc3NsM0I5MXVWRk9xdHVQbXhlRVZS?=
 =?utf-8?B?elhobzFzVWdDWEFya21vUUN1Um1PVGZ2aWQ0Z2x2WEczbGl6bXM4dS9nUlc4?=
 =?utf-8?B?YklpQVd1UUxSMThMQWRIN1VlU2F6WnNLOFpuU29zRnlwbkRaTEtJc1B1SW5v?=
 =?utf-8?B?ZDE1UDQ2aC9HMmpPeHV5TERXRlpNZTREczFJMEZudWNpSzQ2S2VrSUZ6Zmk3?=
 =?utf-8?B?ckRZdHFXMTd2YnhYSnhjZ3ozb1d1MWpEbU9OU2Y5U0xIY2tFSUYrRlp2UUYw?=
 =?utf-8?B?ZmdsTGNncnFoa2ttOTdOdWNBdmRXeTd4akJyV0R2UEYvMkpuWDJleFYxeFRW?=
 =?utf-8?B?WWo5dW1Xc0dwcU9DTnhQRXVtSFR0TlpydUhSVWQ3N1NTTkpCVzhITW10L0ZL?=
 =?utf-8?B?NURxSG5rMHdaeW1KWXpkTndRY3RuR0duUnJDdWRhNnEvUEFSYVZrQkpKOXEw?=
 =?utf-8?B?b2dqWTlmSVA0ZWJOeS9xdkFCMStXc0NUZFgxK2xkZzRIZFRvUFlyZlFrREQr?=
 =?utf-8?B?bkE1N0ZFb2FzSGdKOW14eHBlTzE2cC83K1dOcngvYzRWWnRONjM1NG1HZUZr?=
 =?utf-8?B?K1Z3Q0Q0NVMwS3BiSWxrWnBZRnJWZisrN1Y0ODl2L2RTL2ZWak9qNFZmSStu?=
 =?utf-8?B?L1ZacUdJYmZaWHBqai9wQ2tjZUJBM0NYK2RtdWxoR2tFWGh2akcxR1M2WFFM?=
 =?utf-8?B?TTB3azcxaU9pdTZBSTBKenZ4ZHF5Uk9rOFVqR3VrK1FvK2kxUHpyWXdjNDVM?=
 =?utf-8?Q?hTzkmls+EkKdcne4R12+WdQqlYTXMlfPpbHCkvhn5n6u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3ad970-0e38-4de5-1808-08de1e55b464
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:30:58.2939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHNC7YtACLDKidghE7TJH4dBSUGWtz1WQhSntJjCA7WwlOVSe167/6sPyEt8TgPZ0WnMpySri/6PaF4N1CVjwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

On Wed Oct 29, 2025 at 8:12 AM JST, Alexandre Courbot wrote:
> Using the `as` operator for integer conversions is discouraged, as it
> silently strips data if the destination type is smaller than the source.
> Many such conversions can be replaced with `from`/`into` or (when
> justified) `try_from`/`try_into`, but these traits cannot unfortunately
> cover all conversions satisfyingly.
>
> There is for instance the case of converting a `usize` to `u64`, which,
> in the case of the kernel today, is completely lossless but cannot be
> done because the Rust standard library does not provide a `From`
> implementation for conversions that are not future-proof.
>
> Still, in the kernel it is very practical to be able to perform such
> conversions when they are safe to do for the current build target.
>
> This patchset tries to eradicate the use of `as` in nova-core, by using
> existing means and introducing new ones.
>
> The first 4 patches use the already-available `From` and `TryFrom` trait
> where it is possible or advisable.
>
> The fifth patch introduces a new module that proposes conversion
> functions for those that are infallible under the current build target.
> This is done through a set of const functions, and the `FromSafeCast`
> and `IntoSafeCast` extension traits which, as their names lightly
> suggest, offer conversion for those types on which the `as` operator can
> be used losslessly.
>
> This new module is put to use in the sixth patch.
>
> The idea was first suggested by Danilo.
>
> As Danilo suggested, this could eventually find its place in the kernel
> crate if the implementation is deemed to be fit, but for now let's
> review and let it mature in nova-core.

All patches pushed to drm-rust-next, thanks!
