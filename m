Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 084BCBFB760
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 12:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D6410E74A;
	Wed, 22 Oct 2025 10:51:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d99SeLsl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7259310E74A;
 Wed, 22 Oct 2025 10:51:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X8KmBcbbN0QOdU8m5mHsHmhjfY20bmX43wJmhHAWf6XY4cLzSZKxOHfq626VEY9qqYFl3SyTvfcUpcNH695u9tk8vjt8RYESykFoo8t7LmJmfOmb7aIj3EaH5XTfNy41wrM06EYHK9qRGzYVKmT94+Im5TjgoGuqq9FDJnbaVawHsudhsBEGu/yFyQPVZ1J/2L1vXPrZBWMrVvn3DMS1s2W7q27OyhifX9Inq9oS0JOexC3qi/3jztXeo7d90uZxBjN9J6z1G1G72qEjTGXWSpa3IfQxWX4f8PoqEZHGV1S98e21gPmCZ7lmhhhkxiBJQNInO0WYnXE8fHRJ5lYgKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcIMVgdUkFreicr8Q3bQ6nC29g2h5Dhj9CO4PGmzyg4=;
 b=M1lKspfpityrNg734j0nX1+ryJx97Lp/41g/dbXBTxrf8xPQQ90i4QGlMl3XVG1pD5LwfsL5JB6DYwpxYiXuBydzMGiP6eqks82NFDVj1yBx6TTFb7YwEsnHO/jjD3fxnh3FukIJHRGcq+q1Eaif+ZZZ8RV6UTTb8BSwVz1pAOQy2H1moOXsJorwMxKiff7YRcs87tCyGWwmdSHepfhW/Nuwc+eJyOvtDQsEX07s0JAhLUUeONLMIu9TUh8M/wmbVVzgmsfRm1813uOLvgHNjGUep29io1IdGUOwOdXYLvmVTHvHmugeG2ZHJttr0qaKCY3jCPeYKp22Fy0LXieL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcIMVgdUkFreicr8Q3bQ6nC29g2h5Dhj9CO4PGmzyg4=;
 b=d99SeLslLPNQL0K1T2S29u+3AR6QkUwK2fhBqS4S9oIHco9hbX3MfYQWfWu/nAQKE76qQk7dXXtzMPgT587bG8Vqfn4RbJ105cqQOHLupySkd2FzTme8ac5su9yz8nru7EA69QdltjBIDeAnQq74NywTDzAPiw1LPtr/ze3YZSKu4Q1sCs9mS9bSc8hU6y4p11EH/e3hGM9KLGqv/otjnyMCvnDvQag+0QjhUVjnzxICOv0IqBWy9ijCZkM3DEj2pTfqHSOcudOWllWIeJfcQrfExo8PapQTJTtbRhGgBIkQKVutd1tB99u8ofjq9cwDHOSW3NDBIBMVADD3bjYE3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7917.namprd12.prod.outlook.com (2603:10b6:a03:4c7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 10:51:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 10:51:12 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 22 Oct 2025 19:50:57 +0900
Subject: [PATCH 2/3] gpu: nova-core: bitfield: simplify expression
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-nova-bitfield-v1-2-73bc0988667b@nvidia.com>
References: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
In-Reply-To: <20251022-nova-bitfield-v1-0-73bc0988667b@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 62fca7e7-d55d-4396-f7ed-08de1158ea4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVA0Q05HMDQ3T3RPbVlMZ3RROHp6N0VCa1pocitoZFBBdis3U0YvQm5UUjBy?=
 =?utf-8?B?Tm5pQmpRb2ticjhJUXNOTndwYmFDSFVqWHJtSXdXNGVleUpUczhYSTZXYzI2?=
 =?utf-8?B?SnBOTlJWclQyeVg1UFY5emVOelo5MC9UM0J2c2UxOUpMdlZPR3B1cGxCcE0z?=
 =?utf-8?B?WUNtclREams3NEZjejRYemJIcmxzWTY1aVRQdjJsUFoxdzNHNGYyQUNWUnZh?=
 =?utf-8?B?UGxoTUwvcDRQMlpMc0tjWFYzVmYvWUdwSFJrd21vM2I3TXZCUXJGL1VNSW85?=
 =?utf-8?B?WW11dWZVYlhQQ2VnL2QrZXJJVGlPRHcrZ1hUVlp6enFabEFpQmN1OTFRT1hS?=
 =?utf-8?B?dzdYRzdoQTljRWk3RG50U1pzUnZJaU5ZYjhVaWxZZnVTeFlvSEFKVkJ0emhB?=
 =?utf-8?B?MHE2QVFYWFBkOVJmRXJOdDQ3Tkt0eWxZd2RiMkJITmFwbU1SdjFvcVhucEFY?=
 =?utf-8?B?MUJWYVNEMEVMS1ZJQmJJcTFVT0phc2FSSHlvbWJuV1k0TnRtb0RjUzFoUkdU?=
 =?utf-8?B?UUdKc21aeDNjWktjWllXMFg3R3JIblJKQkRXZDVpSFBYRXZsOXI0TWV6UjZD?=
 =?utf-8?B?R2psQ0JLMlJDemYyZGlnYmlUNmg2SUszVWxCNXdxSDhDZnMxZXZuQlVtaFJ2?=
 =?utf-8?B?QVl6QTRRbmlSRmF0anAyb1ZKWmlDYVNHYzBjRSt0d3VUYmNPZDVNdWNVQWRE?=
 =?utf-8?B?WTF3WjJjTXQySEtBbk5MSmNsYy9JS3dlY0t6SG81MFJIU1d4U1ZUZ0N0TUo0?=
 =?utf-8?B?SW1RYUJGMk9hOEtGSld4SXMrSnZzMVYyMDh3SlRIR3NLN3JVSXpRc3drZ0ZJ?=
 =?utf-8?B?UVd4QkxUNUxvQnlVdG9sNHBybjFmcGdYcm5UcGFzck9hcUN1ZUh2dHAxcWpS?=
 =?utf-8?B?bkMyWmFxVkNLc2Q2L1ZkVC9JUVdPc0RLdnJZUjRldzk0NkhaNXJYZ1dVNlpo?=
 =?utf-8?B?anNVRXUzWmI2WGZ1KzM1T1BoSEtZK25rYnlLVDRKVWE0a2NHSlJTSXZYVThp?=
 =?utf-8?B?WE53OU42bWpVYUxLbmlkTkFBdm9QVzdPT0pIbXBiSU15eFhUR0hYZy9wMUVw?=
 =?utf-8?B?UE8zcjRKRklQOVdrbFRzSlZBTTl2SjJ3dzVrandXMnRFanpqSkp3a3c0QjVL?=
 =?utf-8?B?bjNVYm51b052R1FEOWkwRmZUYTZJMHJqeHhzSHFmOTltK0ZGdTJ5aWNqYmhE?=
 =?utf-8?B?V3FjU0ZmeFFDZU1CZVQxc284WnVoVEtOUDNZbTl3aVhtNHRxZjMvSm9LMVcv?=
 =?utf-8?B?eGdNOTJaNUVHd1BKS0JNeE41U3JPYU9IUGMxMmhacjJVVDVzbkN3ZHQ3L05k?=
 =?utf-8?B?ajdxZjhqQUhQdzZBRkYvbloyVVB3MWg4RUduTHp2WWZudUVCWWs0TDA4YjNv?=
 =?utf-8?B?K0VkdUplcTMvMld4eG5mUEdib01pYmtaUHdXWU5ZbVh2SlRrRHZwNi9TYkk3?=
 =?utf-8?B?ak9mcFZEbSt3Si9oQmlMcENPM2E1aTIzZkx3eUJUa280djgwUlN5UnB6bU5k?=
 =?utf-8?B?SWJ1c2VWSHhZbmVpSEI4YU9LdkZIc2tTNCtYYkJHSDVHMlQ1anVzT3JBaUp0?=
 =?utf-8?B?U1VldmxTQjJ1d1Awc042SHRhOGZ5ditKL0tTN1IrMnlXWjZiOHJaYVY0VXZi?=
 =?utf-8?B?NVF4M1MwR0dadFMzdW5nVUlTZGVkY2FVV2dzZmNmcVdCQ0hORDZkL2F3RFB6?=
 =?utf-8?B?Q2x3RWhFeEFzcDZtQ2dZSDRXUWdSMEdteU16WXZtUzNoWFh5dFBmazRvaWd4?=
 =?utf-8?B?NlN3S0JIYmpnTjVEVCtQT1dNVGE5eHdVZmEzcEVuV3RETGhZcWczSFNsTzJw?=
 =?utf-8?B?N096bWJsM3BDTGFpUG5RZGx0L2V0TDYrak45ZU5uVk9sd0s5dnpHcGMvWmlz?=
 =?utf-8?B?UUdLVktobTY4UDZHWklZMFkwUWFxV1R2WjcrcTdkUEdjRGtMZVliYzdmLzhy?=
 =?utf-8?B?K0x2emV6dHBCMXJaRER3Y1RIejRQY1VXQjI1TERpbDlHNDQ5eEFnTFNndUlC?=
 =?utf-8?B?OUs3Z1gyc1J3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXRpek82eG9yYjU0aDNJdkhmeGpPZHp2bFNFSDUzOWwzcXVaMXNwR2hIZTVM?=
 =?utf-8?B?NXZWQmVLZFZWQjNYTXBKU0dibmZxQ28yN0ZBQVZyQmVPTE9kSW93QTYxWTQw?=
 =?utf-8?B?WkdaNVZkMUkvTlpITUlxYXpMUEMwZWNqNUJTZjFPeUg5bU9LLzVwVC9lbm1M?=
 =?utf-8?B?WWdmSGhFR3JkbHFMdVJuTGJacjR6ZTZWVkNrYTY2dm83MUwrM1VPQ0tCWjJ4?=
 =?utf-8?B?cnJHc0h3TFhzN0h0ZjRvSGlrcDdaZEd6aWZoV1hhbmNKL1ZWU0s1clQ1Mzc3?=
 =?utf-8?B?RVBQV2czSUtzVXJPcndITEw3ZWpDTmNvbElMRjQ3UXgxc0svd3JsMWlHa3hD?=
 =?utf-8?B?L2tLYzZjb2k1ZzI3emZhd1l1UWNQMmowVi9QU3NNdXdzajRjOTRvUHFZVjgw?=
 =?utf-8?B?S2RGa1BLbzJUMW1wOGQvZ3YwSUNDaUZkRUdaY0d5aHJleFFJSFJBc2ZvelBs?=
 =?utf-8?B?T0g3aUgrKzFjamViMFJqMlU2SVF2bERIL0Q3VmhGdWRFS2tRTnF0MzB0b1ky?=
 =?utf-8?B?elNYbnFUdEpDWnp1eUc5dm12OGljVE5hN21Qa3NUM0U5dmM0UUxSV1RTWUcz?=
 =?utf-8?B?V3hLYTVyMmlhTjVmdW1Zbm5YeXFkNDlWcXVIbWhueTFKWVV6eHdmQkxISm1o?=
 =?utf-8?B?NDNGbk1wZ3ZDekZ1UWF5M1hLbEp4SkFwK3dMekIvcXdzTnYvblJjMnMxeFdy?=
 =?utf-8?B?SWlNNjdacXlQMzBTQm1xOU5GMkZSalhNVTl4NldlRzYwQmZSNmFTOGpDVUxx?=
 =?utf-8?B?eDRNL1JKY0tBaGxwcWlobklXUm9hS0tXSE1KSzFnME5EcG43OWpGZHN2NXVr?=
 =?utf-8?B?L2VEc0x1WVZSUkNvOHc5MUt1eXp4V0ZXSUpROHQvWHJOY3ltTmNRa3JjOTRX?=
 =?utf-8?B?Tm1qWmJvSCtaRkEwRWJCUVF5VGR1WUlVWE9wZGZucmRFV0RSZ1JsaVpXVWZG?=
 =?utf-8?B?QlNYQWh0eitKb2NQc0NvMHVmcmtjWmJmdWdldkZRSkh5dXFDTTVoRVZLcjdN?=
 =?utf-8?B?R0U1WXpHU2ZMWnh5T1o1L0NUQkNlZDNXakUzaXR3K0U1V1pDL200NTZSanJn?=
 =?utf-8?B?eG1veFJRZ1Y0SEVYaVR0VnJrNFdJMXhWaW1lMndzVkJkYjdJVWRsMjlXN3RV?=
 =?utf-8?B?eUxzWGNSQVN0d1dQS3VlamY3c1RxT29rUVpmOUN0c3NOQ0NEOFFtQ3lHVkVj?=
 =?utf-8?B?YzhLY1p3NUVyVVd2Q3BCV2d5ZkZ6VTlTanNKckVaRktDQ2RsV2xwS0lhcDBy?=
 =?utf-8?B?UjhITzA1YzNYU1VmL0xjcHlEL2hDL0RsUlNzc20yZjY0N0tSS2FVNEdabGNn?=
 =?utf-8?B?N0NQOTNvb0thOWw5WTYrREgra3g1TG0vaGs1UER2MkljbzY5Tlc5TEYrWXRW?=
 =?utf-8?B?dk5SeGtSZXVEVVB1UVlycFRYMlBWU1c1bkErQ1dkNmJkbW9OS3lTbHJTcFlt?=
 =?utf-8?B?UUJFcmpWdnEwclh6bUdvYWN1dHF2WU01MWd2Z1dnQzVUVXBTN0hnNFNMaU5v?=
 =?utf-8?B?ajRKeWtUNjVxNU1tdTNRK1RRcTJOMU90anNUYkdnT1BldyszK0tqdFZIeUNW?=
 =?utf-8?B?YzZkNkV1dmFQTWxlSjJFY1NUNVNEay9zRXUyOXhsYTVsN0VsWitnMFJqTDYv?=
 =?utf-8?B?cWRpK1JZV2FvcVdqbUtYS21VR3JPalZKQ2FlVnFuSDhoNkgwckhmcy9HQUxI?=
 =?utf-8?B?TkxnK21UZ08vdHM1TUFseEZKY2NKK0w0cGh3RGt5NVA0R2QzVEZPMmJIOGg1?=
 =?utf-8?B?Q1RoWWxBNFpCaWNHbFZFanJkTFhFQ2ZjWnpEd1hFTlNQYzdCcWZDOUJMeGp4?=
 =?utf-8?B?RUZLb1dQZGVXQ1NqaWlRTEFGNlFTNmFVbHU4VXBtMUl3akRYTkw5Vm11Lzg1?=
 =?utf-8?B?K3phREdjZEYybXFmUXl6Wno3QU9taFhORUJvR25ycTEzUjZIRUw2UWM0STdZ?=
 =?utf-8?B?RTRCa1k0aTFkaHhHajEwMUFwK1IwbVM0VzdvanY1ckV2YWhUcHpGZ2M2Ykly?=
 =?utf-8?B?ZEY1eG0vdEdaTEVhdkFKRkNEVVR0Z29KZE90ZmEvWldLMmVmRk1HQjhRQmUy?=
 =?utf-8?B?R1BXVWRMSCt4QTRrYkRnWjJobE5UbkVnUGhjU3QxY0VPK2l4bU8yZ3FuV1pG?=
 =?utf-8?B?TytFMXdHUlhodUYxRmFLbVhra1hiUmQ3MFI1UlcxVnBqc2Vpa1ZGV3BKS2Qv?=
 =?utf-8?Q?ioyrXTq9npVuRVTAD9yGZ144U2FPs9TnU92FFrWEV2ny?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62fca7e7-d55d-4396-f7ed-08de1158ea4e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 10:51:12.0173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DL/c9RFhvKkgh9v5o+9cjc+EtocSZgJ9Dn+UIeWmyCZmywKcqdViUJdyYhRlNpLpxW9mI7jn7dPFtHLrdCtHrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7917
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

The shift is more easily expressed by the index of the lowest bit of the
field.

Reported-by: Edwin Peer <epeer@nvidia.com>
Link: https://lore.kernel.org/rust-for-linux/F3853912-2C1C-4F9B-89B0-3168689F35B3@nvidia.com/
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 136de7289162..f113439c6501 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -268,7 +268,7 @@ impl $name {
                 _ => ::kernel::build_error!("Unsupported storage type size")
             }
         };
-        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+        const [<$field:upper _SHIFT>]: u32 = $lo;
         );
 
         $(

-- 
2.51.0

