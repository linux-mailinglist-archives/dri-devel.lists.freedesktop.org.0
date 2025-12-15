Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC28CBC56A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 04:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED88E10E0C6;
	Mon, 15 Dec 2025 03:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eRZJgNfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012069.outbound.protection.outlook.com
 [40.107.200.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB39810E0C6;
 Mon, 15 Dec 2025 03:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR7adth7Eu+3MBl29FW6wm5Q8xXeyGNr9YJ44q/tM/xGJ0IVHnmfwjUcMP9o+LPb9bXMJfULmL7QsQCYOa3xa6xnF3RHVBTRXgSGMq7ytOrQWAe0wmQftplnz4fsjRqtbj6+yYDAqEZLmgW+TDOrRUGKbd9ZvXkP+sRey+t5Ux9e0hx4yuw4yAFrqWlmposLGNFamtTNkTIPrnQoaQA9bGEgAnWu3YpcBZErbTcf9JR4ab13AmaQDiq7pOAkS/KjcQr1JslFO1zMzUyzoqTnaydGFjdogUlVuJPXXxk1VL53F0WA9+onvw1aoW0vY0FRDdpASH+LOTqKpk6LR5G+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKYDrhAiK0rIofbv2kgaD1Iesbx7Iu04IrP9CZqprm8=;
 b=NTb+k0WyiA/x0NpFq/2ndR4kytlJQs1Ywsx6XCBOeEaDYMJQzYtteJYHb/RJIHW9lJryjvoc/gMccT2X/r05PzjVyAeogmD9smqXhr46eApRFlJhho3QfjNE1EmDUvFbPgAbMhoFC0StesywkR7b2VyFES2vz02DtAMvJrN1w0acWhwbcaYssIlglx6zrSkOaSlVhQ8BCsRCEdLExGgbHn8qfBD2487BoxQUry5dlDbBPmFSm7nRyHOKqD7emhVGpBHEkMTVnPUQwMfewpGwg545xm736BT8TX3vFqu7bFZs6MrD75RO7mCvt3QaIMuX+hPKH+UCK9ifSRv4OlLwIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKYDrhAiK0rIofbv2kgaD1Iesbx7Iu04IrP9CZqprm8=;
 b=eRZJgNfhygCuqYYIE7PSEYoFXTvcPH6/y5TGLUqua+qo9PSoFdkZO4pbGqYXsFJ/bSFoBgdzWWKrGFSQiw6C5KatUwgxlptHXhH7TSuY0qGLgt2CJ+5/O1KTRxFYQJtNPD/wWOeW8o5b0HKz/E3oVoW3gpT5zVlQMbQsNnXfTCfb5+DNGyWKpJkM2BsqH/svVr5VjLzjW0kmWUUZIMgzDPkhDZUlRyddpPaojv1YW6RtQ84akIKOob2uSvhtiycjqgYh9JJkRLtnKlGOA6mfhNr3mdPqXTjnujuKbROOL7QwQZBEXT7EG5GzE7sdIP71zKrUcMUXeSJDZUhXQERJkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6377.namprd12.prod.outlook.com (2603:10b6:208:3b0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 03:41:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 03:41:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 12:41:29 +0900
Message-Id: <DEYH98I3XO5L.AJXE5EZ3AWZP@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <5wfozb7rrh7snccab6dxckrd3umk7u34bixwjfqveta76237um@l23sftnckeep>
In-Reply-To: <5wfozb7rrh7snccab6dxckrd3umk7u34bixwjfqveta76237um@l23sftnckeep>
X-ClientProxiedBy: TYCP286CA0104.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: f938f5b6-e0f8-41a9-ca5f-08de3b8bd6cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnlEWlBKbDNhRmpFZUc0emZOcFNrQ3BSTkdDMkNnN0ZZQXE1NVpaUEtLc3Q5?=
 =?utf-8?B?NXF4RHBISzlXWTQxaG5pbmhXRzBnOWJpdHEzRkcwYkhKZ1EwVnBxWVlTOXlC?=
 =?utf-8?B?YUYxMndvS1NCd04yZE50WnNjMXpvZFhsMFBDRFBRZEVCT2pTMlBJVXNHbkho?=
 =?utf-8?B?eWhrQzM1U0ZYeWNKazRDQmpsb25kN0tqV2R6MlBGU2FmK3NQWlpZSERzVnF5?=
 =?utf-8?B?MUsrT3JINkxHdUNNTndiVmQwNDFWSnVHYmtsbmNkc1FZc21paU1vMm1RanZ6?=
 =?utf-8?B?a1JqNzlTeFNBcWZZYklkYkRQekNNR1QyQmhkVjRSY2JtWDhTUkprWnJ0bHZP?=
 =?utf-8?B?Z21wd2dxRkU5UTJCNllrRE1Fc2R1cHJXMHl1K1U2Wlc1cnZuOWVqY0V1RU9R?=
 =?utf-8?B?WU9PZnNoYUI4NjR3YWtGQWc4YzdKMWlVUWdZOE1NdjJKcnVWcmFHUGphbDRF?=
 =?utf-8?B?ak9GbG1VbFZ5SENlSHVTVGtvR0hPZkdDdGQ5S2JhTzVFY3ptMmlJaHc0ckYx?=
 =?utf-8?B?cjlySU5Yc0ViRVJuUks3YUxLdDZRejlhSFdqakN5MUlheTg4bDJxLzJFNlUr?=
 =?utf-8?B?Rm1vbDEyMU1kKzJGSW1vUjJWK0poTTVFcXFzaWlINjJ0OE5rUGRiYnl3NDIw?=
 =?utf-8?B?Ri9tMHZJQ0IzSzdpdndJL09IRlozcnBIYVdJc0RZSmR3eGF5TWE0cGJoclc1?=
 =?utf-8?B?aXhrdnRnK0RFT3BNTGJaUWNENXdRUzV0d2xoMXJPN1Q0WlVNMFpNUDltT3B5?=
 =?utf-8?B?V2J3TnNUNVlvRDZuZjFvQTJBeU5ITzcxc3I5ZGJpNHhlczZ0Zkh5aVVFRWhW?=
 =?utf-8?B?ejlKQ3BDdGY5OVhQN2Y1V0JYQkVsL21JdTdyQTQrYzNmT3NKUGxMdittSjhT?=
 =?utf-8?B?NWJ2T2V2RENzaUx4L2ZYTHFTM2dLTTIwUjA4M014djVlYkh0VzBsS1RoenN2?=
 =?utf-8?B?MUZDa1F2dVNTNWhWeEE5Vm9mMFFIWDJJZEtseFlIa0huSDRndU9iNVQ2d3VF?=
 =?utf-8?B?S01kN1ZNZmN3NkhsN2ZCcW4ySk42N0todFFnYkFqZjZoZkwzVzQwN1VvZVFN?=
 =?utf-8?B?UWsrRlVzSGFtdWswN29jdTJ6SGtPMVBxVmZGcHFnd1laRTYzSlRFZnIwSEIr?=
 =?utf-8?B?Y1NVSjh1UVU2bWRRdXVBeC9WNHJYVzdEWlkrSVdmTVhWR1YwZVI2NVlKdFlG?=
 =?utf-8?B?cElGcWxVRWs0US9BQ0xCV0dnTzBVVEFVWVdzeitUc0gxQlVyYlI4OURrSW5E?=
 =?utf-8?B?enFFa2RqS1pXMzVRNVdrLytPU2lqa2tNa3BNMnQxNjFYZmtuWnZKaGJCdU8r?=
 =?utf-8?B?bFFyR3N5UWFlMTlhYytIZ1poWGVyWUY3MHJNQ1orbDZFQlZRejJ3NG5yOUhO?=
 =?utf-8?B?elhHeFdsenVKeVlNcERNK29Qb3JVUzV4RTJsZDNuZHZ3ZXh1NlVxRlMyZmYy?=
 =?utf-8?B?cUVtNHk5Zk5vVnlaVmFXMXhjNEJaOVVwK0o3eUw5QlZLQkJXS3VPbGFIc21k?=
 =?utf-8?B?eEUwTXRUU3FNaEV3eE43R1VPNjBKOTBTVkJ6MHJ1dVNxa1VkQWtJSDNRSTRC?=
 =?utf-8?B?ZW5XZDFZK2RQa2Q3TUxFUU9GM2NMdGovYXJZY2hMWFB1amswTXI5azlSSXc4?=
 =?utf-8?B?WEwyL3dJdklpUG1vSlBWM2ZXSERPTm9RUm55bWdDdW1oTXV6SE5td21iU2JB?=
 =?utf-8?B?R0NHRDhIVVZjdjEwZzFlOFFvU0NGVERXU2czTERFWDVnU2t1ZHpOWFhLeDBP?=
 =?utf-8?B?VENQdUh1NUdTdzcraFRrSHJSdzNkTlF1S05YbFc1Z3ZRN2NyalRYWi96cnpK?=
 =?utf-8?B?bHU5am1xNVpXK0IxRGdDNXlWamVCMTZVMDA5TFRxNHRTLzVkaUgvNHVhak91?=
 =?utf-8?B?L1dCcXhUWG8ybklzamhaSnExajJ6akUrc3N3RUNBQVloZ1ZMM2RLekZTZ0pW?=
 =?utf-8?Q?RwPCyep0bs6Q6ri7PrTXX0ZjpqZMTgSK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjVoWE91Z2hWOFBwRnZRVkNMbVpubng1cnpGKzhBS1d4dUZCUy9oTWx4aW9o?=
 =?utf-8?B?RzZZUGZQSlRDU2dTVUtZbnFiVnFQRDRBbDI3b2QxTDI4aUo0Wm1EK3Q1bWR3?=
 =?utf-8?B?TitQL3QzazdLU2dRNmpVV1N4VDk1ZDdLNDNDUVZOU0duSE1IMS8yUURLbEVx?=
 =?utf-8?B?bzhhWU1ZaDFYNWJON2FqSDdDRndMQk03UWZ3TGdiTmtRbDN5dTk1U2s0aEZX?=
 =?utf-8?B?RVVBZmRiSEQxeUdSOS9mTUIwWmw0cUdqNFJCV3dkRVd1VFkvRCtUTGJWQU5C?=
 =?utf-8?B?bmM4TWJiVFBtQWJzLzNWUXpiUWQyc0FVRzZVTXk1andRR3RlZnhRV1NqUTgv?=
 =?utf-8?B?SGRYWUNzQ2hJSUNOdUtFWDRpc0ZFL3JoU21pYVE0TG5ZRVBqcFg4NlpFb1BC?=
 =?utf-8?B?Vk9wTXdCZThhR3dnRTkxVTQ3SC9TMitOVUh0K3ZkQ3dMbndZVnFPQmV5YW00?=
 =?utf-8?B?UzNpRityNHhXQmVkZ0RIVnBYV0l3VnRNdWk5Q1I1UjFVK0thdWx3Z0h5TjhW?=
 =?utf-8?B?UzNXeHRxSmRXanRhWDlkMFYzOU1kKzUvTGJlZFdnNnhLLy9TMHNOVnlKUnJy?=
 =?utf-8?B?M3dMRDJkSC9HemtBTm15a2ViUnp3NVgwV1NDdnRBV1pmWEEvUnpycnBzMHht?=
 =?utf-8?B?VFg0a0VIYm9haVhyMUZjZHNiMTVrLzhaK3Q4OWtTWU5QcU4zaXRaR0lUY1BG?=
 =?utf-8?B?eWhiSkthVDVidlU0WUFtRkpMS2JUcHpXSEZWNm9BN0VTd1VBc05idFFUOGdQ?=
 =?utf-8?B?QmdZdFpKdG41S080MnV0bzBHa29MUm1LeWo4SXhmc1pDZ3ZDWkF3R3NDUzNr?=
 =?utf-8?B?UDZBK0prZGMwM3I2RFV2U3dObi9qc2lmS0J1WjlXL2gzaHUvRFRWWUk4WW9M?=
 =?utf-8?B?eE5HeDlPTXVXS2l6REJVWm1Gb3o4VXFFb1YrV2pBNHRUVDlPL09zb2lxOURi?=
 =?utf-8?B?WU1hODM4NTN4dGd2QUZEUEVWd1NobzJYTENHZ1BXa1NPL25yOUNqMEc4YmNy?=
 =?utf-8?B?MU1MdUpINkNNa1BXNGxpa2tTM1JwYVpJWS9kdFZQMVJEcmFpb0pQTVo4QTJ5?=
 =?utf-8?B?cDhTeHROWTBUYmtYZGdFSTZubHd3eE9JRXpkZ2xxajJEeXVjNEIyQk00NVhw?=
 =?utf-8?B?Si85R1N5bFZKNDJzMHVkSEI4Wmp1NmhSWnNQNnhScG5mUTBMakVSWkZEaWpl?=
 =?utf-8?B?TU9JTzR3cW9zQUJVc2srakdDbER3WGJkM0pHNjRWUWMzTFlzNjN2SnA1YThj?=
 =?utf-8?B?VnZrbmhsWkxhaHhUQ0FBdm00cE9xUUdTYzg2bFR1bGhoYzJaL0hWQkhCQXNS?=
 =?utf-8?B?aUoyMWd3L3M4MG8vd2cyNjNsRFpIb2FMR0UzMTNGTEhXdnBmN1ZUZGVEeTAy?=
 =?utf-8?B?Y3BHQlZsNmJDL3FCSm1Pd3llWSt6b1NNellqS1RKbTZqdDB4Y0NrUStoR3Zl?=
 =?utf-8?B?Z3FERnVhamlETmpZMGIvT1hvaTU5SFZUZDVSSlFvb25SWWFUcDlacUV4RFB1?=
 =?utf-8?B?a0Z6VThrRlJ5QlQzY3pJT2NxNFljNFYraC8zalhCNS9nUjk4cDlnTmRCcUU4?=
 =?utf-8?B?UTZuY2NhVUlUWHZ6OHc0QmVlZ1M5YUg0RzU0TS9WcjdPRTBpcHpCcTc0NC92?=
 =?utf-8?B?SEVRbHp2dkRsbmR6Y1NFL1BhRzRzSmNGdXRsOW5rU2ZKS3Q5bzRDYWZHcVh6?=
 =?utf-8?B?dDg1MU9zUjlZVCtDUG1iemJqT0lDaHVsUTNkNjhqM2kxc3BuS09zQzVvTWps?=
 =?utf-8?B?Z1Byc0hkZHdnUnUrODVDQi9jL2xZTm9STll1clU0UFNwSy9IVks1YnVpZlk3?=
 =?utf-8?B?cUw4QzFXNVNtZm84b3dqZWhLMUFVcDlxU1lUVHFIM1pPdVVQRmk3R0RMZXpC?=
 =?utf-8?B?aDZqUGhEVWpQN1grS1FhU2hGdEZBQnB3RGVXbzVtZHE5KzBMa2FZZHhSRUNo?=
 =?utf-8?B?V2dYRW14WE9RRE9RYTdSMG1wZ3J1OHA0U3JSdkdJRWxQV2FXOXFuaDlrWEJu?=
 =?utf-8?B?VmZoK0E2dnlHbXA2VFdYanFic3JQcDl3ek9DVFNRRGI3MmRSSk0yUFlkb1hs?=
 =?utf-8?B?Mm5KNmhKRGp6c0EwSml1d1FhSm0rRHJXeSthV21NRXE0bi9QUDVRbnFHb1Z6?=
 =?utf-8?B?QStnZE1tSWVVTHZmeWNFQlR2MnYzWk5qYWFvVmtHWlpPNjRzczdwMEMzT3ZV?=
 =?utf-8?Q?aLzahh6SwaFnh54lRs1FLjIqrQTpdJxwf/oNoJ/uS6mQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f938f5b6-e0f8-41a9-ca5f-08de3b8bd6cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 03:41:32.6070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hg/5MKknAdRfJiDOy9ARr7S7WeJrLdLLiRvrR7I91a/polY6dmtJ2XMA4h1uB//nXCi0Okt9ixlMivenlk55tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6377
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

On Mon Dec 15, 2025 at 8:29 AM JST, Alistair Popple wrote:
> On 2025-12-12 at 18:59 +1100, Joel Fernandes <joelagnelf@nvidia.com> wrot=
e...
>> Hi Alex,
>>=20
>> > On Nov 22, 2025, at 12:00=E2=80=AFAM, Alexandre Courbot <acourbot@nvid=
ia.com> wrote:
>> >=20
>> > =EF=BB=BFThe size of messages' payload is miscalculated, leading to ex=
tra data
>> > passed to the message handler. While this is not a problem with our
>> > current set of commands, others with a variable-length payload may
>> > misbehave. Fix this.
>> >=20
>> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> > ---
>> > drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
>> > drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
>> > 2 files changed, 8 insertions(+), 5 deletions(-)
>> >=20
>> > diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core=
/gsp/cmdq.rs
>> > index 6f946d14868a..dab73377c526 100644
>> > --- a/drivers/gpu/nova-core/gsp/cmdq.rs
>> > +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
>> > @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result=
<GspMessage<'_>> {
>> >             header.length(),
>> >         );
>> >=20
>> > +        // The length of the message that follows the header.
>> > +        let msg_length =3D header.length() - size_of::<GspMsgElement>=
();
>
> Wouldn't it be better to add a new method to GspMsgElement to get the siz=
e of
> the associated message rather than open coding it here?

Agreed, that seems to make sense and should provide us with a safe
operation.
