Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B6FC7DB14
	for <lists+dri-devel@lfdr.de>; Sun, 23 Nov 2025 04:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E6510E034;
	Sun, 23 Nov 2025 03:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bbbOnHJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012010.outbound.protection.outlook.com
 [40.107.200.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6208F10E034;
 Sun, 23 Nov 2025 03:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKMOqHglifW53Le/LFrWjnEtsj9RljdzQo0N82tMoppFT52xrMoI89rlx7eFNvdL/bFc/eroImAxfKfofy1vVMI84a8yXibsoKzzB3zzrLXCZ9a/9fBWyvZZrPfoChA/7k7zpNDtWwSfhMNiUUk5ClrkrXMXwQxf+8hHqQ8ihAJzsrj/F+YUifGp0oBtkr7hCjLHp6ApEk1r9xuF1gc+O4odLHCl6ZXwgtGuEGsIx59APIL6ctv5RRNwUX2ubMdExoDoTYG8nnunvvZzaLWkzTpzRqXyFscWs+b//RFXkXD708HEhmL07ESGVqXR+CnCS24tIYA0cS+Itziueu+7YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnawAst6W2gk94+EiC2OWK71nAYkhk5s3z7iJgqIeI0=;
 b=DOZJwBv7U/gWhyr2YfL1cwX2wpcdluGHDUupBU3/1f/sqJNXSdy38pTK3jL6Cs5IPm0K8dcPGvAhuksuFtvZDti4IA55CrkaRjxlEgWvzcwKdu/+37k14irlUeirfo6dyx8sZEyctlIfRZwUovsdrVtR5yEywojPJ94zMGnw0rbbfXLLjGj9xUCWnDgvMg9+g3GvoxPWegVZTbWapwe9l6GXF+6ZHaK4lJxhTB5EYWg3tjbpZnXCOmQcJNLODrpXvRY+GXKMeQ8VKjysdNRFIwBCG13A8ncwkEyQTkQp7QMfawAeZh3KZ1maccoZKYAyekuozCah/0sbxswlb2/Nfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XnawAst6W2gk94+EiC2OWK71nAYkhk5s3z7iJgqIeI0=;
 b=bbbOnHJVxk9+T9dvjNTmYb0FBc9NV2cHlcWcmiPx3R7hsynEx035i5IYWqSZUDX1mfDI6eMGMcw3QOu2DW4BBUUV3rjWhV8P/3HWRe0VOWrH/gYjZZ6W7nWA7jKei4F1mtKXpNEAavAuRiHI/eakOfNO5mct4LIW4TnCura5Nc6UGaUp7e5xRcNrPVrmgGBIIdjTTxaQKqVHUNpe+4lpAlngHph19qAWxGxppvi0XOY3mRy4IsEPZFXSRuycAH0cbomRF0GIcCg0GYU7lqdnr/EFAeHPcu7pVIiJhobVRZtluNpPoip7whu3E61Gne//0SCOrmBBwZSySDJbuAfVag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7006.namprd12.prod.outlook.com (2603:10b6:a03:486::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 03:04:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Sun, 23 Nov 2025
 03:04:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Nov 2025 12:04:21 +0900
Message-Id: <DEFQOTTEGDLP.1AUVYGX48501N@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] gpu: nova-core: Fixups for GSP message queue and
 bindings
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
In-Reply-To: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
X-ClientProxiedBy: TYCP286CA0203.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7006:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fc8d9a-3039-41c5-fa92-08de2a3d0255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2sza0h0Z2hmUnRYVDZ3Sit1UHFCZ3E4Ymk0bWdaZXJaa243d2JTSC80N0R1?=
 =?utf-8?B?VGpaM3FHN3NlRUYrRU5rVVpJUDY5YW82MHZ6cVdWbHZDYmpCbjBHSzMwOHpL?=
 =?utf-8?B?MEhXaWNvOTYreEFaVmtibk14RW52OHozcDUvU0JXMUR4SXhXRmVydEFnVGhV?=
 =?utf-8?B?RjM5UTBKQVpUWDUyMldvMzhhTHBaOFY5cVMwRnVuQ1drSFBLRitPTUJWOTZl?=
 =?utf-8?B?WW5mSHVydEJvTlRwMnJYS0JQVXlDcnlRdjFkMXJBM0YycVVJWnZiT1FoRmtV?=
 =?utf-8?B?QTR5N0QwcFNlNFNtd1FOUG84TjlocEVGOS9pbzNiZ2g5WVpOR2srWkJtYWpD?=
 =?utf-8?B?VS8zSGZaMjFCSXlxK0JyRlRRVXRXbFFKNnFNZHJPOXAxc0lvTmVsSGJscEd2?=
 =?utf-8?B?QUR0WWlic1hOSEpMOWxHUXBVdElvcHpiVGdpQmhHbUR4eXVteVFzbC9GMGdQ?=
 =?utf-8?B?Q2NoNHBjZjhxaXpLZ2dIbW9ULzF2NVBRaW5ZVzBIdHlxdTdVazUxZVhHRHhI?=
 =?utf-8?B?cUdndlVtbitleSt2WG5CWkl1elZpSFg5VDZMM082NlUyQVQ1QWF1NHgzQWdq?=
 =?utf-8?B?eTk3ci9JNVU4Sy9WR1pCaHhYMlZXd3JxL1FMRklJYWlpOTFyVW9LRFF0cVkx?=
 =?utf-8?B?ZDFqd3VWOFdrL0dMV1RWc2t6cElWOFdEeGJoNkNIYkJmWTZTQnorMFBMT2pM?=
 =?utf-8?B?M3BUN0N5OXlSZFJLdmY5NUQrbENhbnpROWxjRWljQTlONnZyZjZYcUZkUm5O?=
 =?utf-8?B?a0k4L2hBOEE2Sk9vRDh5dDJRSHlIYmJaWU84TEQxaWk4QkNPSW9SQURhT3dn?=
 =?utf-8?B?T2hTaFo2TXc5NzR2TE16REhNU1IvaWVsSGF3ZW5hVGt3ekhCRytzZXZ5WTdl?=
 =?utf-8?B?M3dqSjNuLytxbFJsTjc0SlJxdXFlNUF3UlRGK3hGanlJRXlEUXFkZ2VQVEky?=
 =?utf-8?B?ZkxKT3g2QnlDRXlnMlgvNFFxTFVCRU55SnJEWFV1VlB5a1hVeDcvU1RGU0dR?=
 =?utf-8?B?R3M0b2ZXclR3RW4vTnpOUVY3Z2t2SmFaV0hNOVVsU3RXUHI2QzFnZ2hUNjZJ?=
 =?utf-8?B?ZXRQYlBIVGdsMnpiUjNvcTRyNG1TQUN3Qy9iTVhlMmFXZXlYZmdiS2FBVVpC?=
 =?utf-8?B?cnR2RU5GSDY4YS9IQVFINm1kcitpUThvK0lNaXhoZkNRWVU0WXZxRFR6Z1hR?=
 =?utf-8?B?eXJrbXR0T2ZvWW5WcmNEMlF0b1ErZkdPNVFzWGFnVXFvSTgyS2g5TG55bERF?=
 =?utf-8?B?eW9jWDdoMW04VVhHU2ZWakp0SkZMWkFQVGozUHQvLzlKNUVQT0JCb1N3andE?=
 =?utf-8?B?MXp5bDYzaTR6STBObldCQmtNNmluWnUyYXAxbm81SnBtaVhqSDM0WG51QkhE?=
 =?utf-8?B?M2NaNTk3NDlxbzlRWjgyVkxvSFY2QXNjdFdsRVdWZEdFY0ZsL1dvUElyUVBP?=
 =?utf-8?B?TTcxRmJCNmQ3Y1hDbmRMa1cyVUV2NE5OVjVDbHFPNzVuNmFPZGR5S091VHhu?=
 =?utf-8?B?NkJIMUkrYVgzMjEzUm1uYndqQUQwQ0RkenFWK2dDZ3BOOWQzaGJucTFWRFVK?=
 =?utf-8?B?R1pBU2RkRjNYZTlXU2MwSThEWFQzMXJuemRYeTBmVXNDM1luUTNYUnJEMUJD?=
 =?utf-8?B?b3FXajFyR3E2Wnp3ZWVlUGdVTE41VkczbU9RZmxid1BPZE00UVo2VUtLeVBy?=
 =?utf-8?B?WEY2MWFPU2UyK21qdE45ZEJyVGp5b3FaUm84Z21CK0Ryd1ZBQXpmRmtiUytl?=
 =?utf-8?B?cEh1U0xiZFl2ZEZNYUF4bE44d0lLTGVmM2ZCZDF2OU05WTRHYWprT1B1eTJ4?=
 =?utf-8?B?cHZSTk1kdGZqZ1p5TkZBWmEyN3Bpa0pmZkVYRFFxZWJKMkpyREZDaHJ1QWhS?=
 =?utf-8?B?bEc0VGMrQjU0RGx6cE8wd1NLOTA1WFJrL3phcS9iWlBjRFptQ2tjWXJMQ0VK?=
 =?utf-8?B?SG1xcjZEQ0luVEs2bDZIZmZsaXBqakpCNysyV3JZYTNsdFF3RnVFY1lSZnNX?=
 =?utf-8?Q?2ZADXRwYWp66x3Pyo9Ipj2J93LcJjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rk9oMU5JM2hXU1RJTFpYc2FndjkrRU5MaDdja1B5cUdUWk1KVTB2YVJ3UnRa?=
 =?utf-8?B?ZXp4Ri9BY2o3NXQ3Sk1OT2lOcEwxZnpUVzFaTWlrRWhyRmhKUzYvVndKVHJS?=
 =?utf-8?B?WnBEYXZlcSttSzBaV0pqZW10TmZGeWZ3bk5HUVVGTlkwM01OUE91TjNXTWdn?=
 =?utf-8?B?UUVkbWJHeFVXbXZJV2FpT0ZETzZuTUp0TlpDWEhkUzMxSDdOc1d4Zmw0V1hH?=
 =?utf-8?B?QVJwcnpTdTgxOGlhcFZySExtNmhqZk8yNUU4cGNIbHJsM2JYQUxOcWxnb2FZ?=
 =?utf-8?B?SGlPcnF4RWpzbUhyVThJN2JXZW5XWnplckkyZUpBOXBHVWVsK1B1VVowd3g1?=
 =?utf-8?B?VzFGRGJmaC9nVnJwWWdqY1NnWmhoUUkzY1dkRnNpN0tidytnYTFUNFo3MGU0?=
 =?utf-8?B?U2lGTHdNVVlnRXRxdy9yS0ZZY0g4OGZUQlJ0SlVmbnBHb05RcGU2SVAwVklH?=
 =?utf-8?B?NzNOSVRzT28xQy96MHpWTWU3K3ZvSHFPTE5KcVdScHljNWJzTWdjT0Z5RXFD?=
 =?utf-8?B?UWZnN1k2bUQ4U0FySExLbHFRWjlQWDJBeHlaTG5MeEw4QmZzN2ZhMVUrMjlE?=
 =?utf-8?B?N0RxVlFwQWxwbWVxZUNFM2NzZDg2Ukp0ZHFEbVFleElMTWVYdWFpTHhQMkQ1?=
 =?utf-8?B?SWFrTFhFSUUxQWtERU13SFF4NWxLci9nTXRPNjZpb2pYYVdNRjNyVE1iMjRK?=
 =?utf-8?B?aDZVTjNlb2s1R0F0KzVIam1xanNGQW9FU01mdXdQd1c0eldFYlYzTzFTNUJQ?=
 =?utf-8?B?dTRsSGlUZDNDckFEL3gxZk44aHovR2JJLzY4bTN6c1RZZVpReG5YaU1NdjVW?=
 =?utf-8?B?U29mYXBLbHRVUjRONkRLZUhtTWplWHBrVnRRRlpSTkFJc0luL2V5VndnRW9w?=
 =?utf-8?B?Q21MYkxHWXBhbGU4QkRHNjViZUVQaWNVcmp0Mlk5dXVoRjc4ZUFmMlRBbTg0?=
 =?utf-8?B?cHFQYTFxcFQ4M2dKMHkwbXpCUGdhdlZJdXVOR0x1YWV0UGpycFJQVmZtUTZl?=
 =?utf-8?B?YlVOc0srWE9iSnB0SUE5T3l5VlI5dmxQQllQbmdRb0ovQTdwblVjc0RGTWcw?=
 =?utf-8?B?dndkWmcreE5UYmo4NEtNalVUU2Rud2IvWU94TjBCVTlMaHhSRzU2VHQxbnpv?=
 =?utf-8?B?M05xY0xZVEdSSHdnS1kzUFFFODFzc2NaVklldFV5aWx3bDRVUmY1NndTZmJ0?=
 =?utf-8?B?emZtdnRYNDRHYW8xcXd5OWZaQTZ6eWpyY1RkNEw3VXlWeDZsVFNkSWcvcHVE?=
 =?utf-8?B?aFNVRS9PeE55U2xYU1EyczdQTElZYldSNS9XVTN4ZmRXV0haQnQzZW1QZUpJ?=
 =?utf-8?B?eFQ0Mk1YUHFodGl6RlBubjB5OEM4UXR2S0s4ZDRuaWFsckt6Vm85RXdEclc5?=
 =?utf-8?B?ZldVNGl4d2NSbU5iN3N2dVg1NzJLSlhHZmJ2TU4rd3ZkUmFYUTgzaW5EMDNu?=
 =?utf-8?B?QkxFTjRwUHRFUlVPTkg3YmFKY25oQUgyMVBXaitzeW0yZTJ5NnBta3N2UUc0?=
 =?utf-8?B?a2ZlQSt0UmVPdWg2Ynd4WHZCT3owWEE5QVpQQnQxR3c1YXJMcmlLZEE3U1VI?=
 =?utf-8?B?SEV4MFlTeks1MnZ1MlEvVGpIcm9uUzdvbEdFR2hoQTVXelA3NmVJeDRwWWYx?=
 =?utf-8?B?SE5ZNEswY3d6T3d0ZWZqNXpjK1doVFAxcVl3QStNRG42WE5SaGwrWlQ5Zjdu?=
 =?utf-8?B?R0hQUW0xOGpvOXFSdWRzNHpNdklnT2QvY2JGM2pnS1pVMDRKcWM3OTJoY3Vj?=
 =?utf-8?B?bHhMQ2NNVjlRS01PYk1oRU5Lc1BtdDVRQUlQZFlhaVBGUDcvWnVkY1pjTzkr?=
 =?utf-8?B?UjJNQzRuajhheTZPN0U5OWZXS2hnUUpTV3NQaEs1ZlZmZlVvNVlVZU90eHpR?=
 =?utf-8?B?bWxlS1lId1B3aC95VjF5VFpSR3QzWEswWGVoVmk5RXI3Y21HbnR6dlp4U2or?=
 =?utf-8?B?VCtZNzB3YkpMak1OSnNDTFhZNElzVTJXd1g1b2hFNjJKYnc1MFhycHVjVTVN?=
 =?utf-8?B?dWhWMEJ1L1ZYSjliQ080dmpNT2pYUmNyeG1QdmZwOG5pZ3JqOVVOcElKalNM?=
 =?utf-8?B?UmgrenBTQ21IQUFQclJwSlZra004T2NDdndVTUVVSmRwWFRjVUFlaUJJc2Nn?=
 =?utf-8?B?L3R6WEZmRTFqUFN3STFrOWtZVkFOaTZsMnpXKzZjZC9BNzhXSHpmeTl5R0Vz?=
 =?utf-8?Q?VzlFfpEaaBLLgpoVyTfDolakFFvYmaIx8F0AG64+6r6g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fc8d9a-3039-41c5-fa92-08de2a3d0255
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 03:04:26.4522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LfIgqIpXVkfSwXXc6shSwv8pHXWGGgTFCEt+HT0aSBVV/dIrKsV8LxI7WIfPiBccyBLkzRspEaM+zSeIM4nlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7006
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

On Sat Nov 22, 2025 at 12:00 AM JST, Alexandre Courbot wrote:
> This series contains a few fixups for the recently merged GSP
> command-queue code, by order of importance:
>
> - Some explicit padding required to safely implement `AsBytes` was
>   missing in the bindings,
> - A bug in the received message length calculation results in the
>   message handler being given more data than it should,=20
> - `MaybeZeroable` is now derived by the kernel's bindgen, but the Nova
>   bindings have not been updated for that,
> - Some items in the bindings were referred to using the version module
>   directly, instead of the alias we defined to limit the diff when we
>   upgrade firmware versions.
>
> All of them address "bugs" (with the first two fixing actual correctness
> issues), but since Nova does not do much anyway, they are also not
> absolutely critical and can wait -rc1 if we prefer to do so.

These patches are missing "Fixes:" tags - will send a v2 with them.
