Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5FA6B41B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 06:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCD210E555;
	Fri, 21 Mar 2025 05:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PT4EEB/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27F510E2B9;
 Fri, 21 Mar 2025 05:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4pKR7coqvv/Ga76wkhcrK7uNV8+yQf6iio02sNSohzyTKrd8mUJT+guMQJOhODOd+owON0r1S+hvmXOH8JwAWM5m9dpaenKrfVJnuLJZZKDrlRyzHXyXBC1qz+KWFQsFpV5aGcGKTLIJdE1kN2KZ+uORl2l0Fbf6LBezg9snJSQ9vfnbguHtsTNurnq24RiBVyIiIXWQpS0koV037XS1dHRdwidsKccMtjcZKWW6tw3wFQsrc8eTjRM1gJYLj4HLjpBcAPVEb+HbXfYmB6iICZAY2Ky/oN1ek4LzubaRMBufgP1oeWyZpYKfXEQ+rBur+RnW9WkaWmpIjNNMU35Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvACWfydYTWuo4PjHSwLirXdoY8GB/T+c+eaGffYwG0=;
 b=I8NiizvjdU1yqqGqQWpgZvOD2vrwtZ+KxisSxiuXCZo24I7NS1hkEf9LDgyD3vQqMT6dReN+CtkMQ3JoxR+iunzzs1pwQoCkoe3InDjuiZoozjfB9laMvu+l82iUKGhuTyftvzN/OviOy22f8PSNKzMbHBlroN9HUyR8hhkjjzeswLpdUF0Zr9bHYSNcFkYsBeD7wTA8KvuZVVuEozoM73NNnU6Jciz4Xi0giBztol3mC3iv7FS6mSQeaosf+opryLxVavyjGZKvFArhojmD+lpBMqVYCafhkpH5BQ1ygx3NBtSl86iTe1snaWhjKADOAZl1XFjkVOtsUzHKjgHXqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvACWfydYTWuo4PjHSwLirXdoY8GB/T+c+eaGffYwG0=;
 b=PT4EEB/q3AXYwCo3WF/w3Akj5k7r7X6RnApnv9baLJiOiuSUcWoEnPv3WI9qc71M70GQzJ2aW77jkYGAkOFz5inr3gBdgirqKj4cTWIPhVS8psbYOTWDMpctlq1rSFoD/G9S8hqgcV2d+LTKca98a9ztoh9PGCmYeQ3TJRgX9CLQ6liYV6CBr+1Tebk839+7MY8NaJzoz6IDkPVZKIrrKapexkA38HVZaLWZVBDzOhdYxd9oxa3gXAXNhZP8Kx3XFDHkMNIDroJ4tLMcGh05aZ4aBJ3/pDseri7NE+Pdg27Uc9BSyxbaA4VLIqxkyQ0NUtu9VKNrb1/Mu/4X1msRKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 05:41:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 05:41:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Mar 2025 14:41:12 +0900
Message-Id: <D8LPCCP6JNYU.28DYTEK5BB74K@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Simona Vetter" <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Boqun Feng" <boqun.feng@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
 <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
 <Z9xb1r1x5tOzAIZT@boqun-archlinux>
In-Reply-To: <Z9xb1r1x5tOzAIZT@boqun-archlinux>
X-ClientProxiedBy: TYCP286CA0198.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bd4883d-9f07-4e5e-fd99-08dd683afede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1RVc29JODVrVkNCQWVzQldKMHc0d0xSNEUwK2RtY2ZiVUZkUHhqZldzNzkr?=
 =?utf-8?B?cGFlbnhwMDB4MHY2Wk1hb0JpRE1PZ2lHWXVTUzkxRUhuaFlBNmdqQS9NMnFw?=
 =?utf-8?B?ZlFVVGJFcWgrdzFUM3FkS1l0RkVhRTJpdS80RHBib3RldnkycHo0SUw4dWU2?=
 =?utf-8?B?OUNGeUN2b2lhMGViOE4wSm1aT0FtaXRkSmw2b1dyS2FldEt4NzRKY2g1Vytt?=
 =?utf-8?B?QzNpdnJFYmY1bU5BVnFZTTdsVis3MnFlMmhUSkJxU1lQcTNRTDJBbnVsNVN0?=
 =?utf-8?B?cXRZSkd0OHc0THlIT0k3NGlyUW9zVDlieFlnN0JxaHB3TzFQWldUN2RyS0lH?=
 =?utf-8?B?YXNHWUtSZWlqMkVTRjdQMm5IS2hPNG9DUHlSY1BHemUxNHdKNTRINk4yd1FB?=
 =?utf-8?B?Z3JxeUlGZ25iaFkrbGtvMUE2Q09USUE1S21BQjFVSldqampET0l1bVZzZkxs?=
 =?utf-8?B?VG1KTTFRUG0wOXFvWVRvMkZQK3M1QmZNcVBLWTVhRG9wdlkzYlVIWE92SmYy?=
 =?utf-8?B?eG9YWkRHYURnc2gzbnJETGZ4Smh2OHRiQlNzQVNnUmZ3Qkk2RlU2eFVmQ2Nx?=
 =?utf-8?B?SndCVUs4Yk9VL0k2VWpNcXo2aGxpc0s5ZUUrNlpkWW02ZmtPWDh0dG4zcTBu?=
 =?utf-8?B?UlhwOEQyWTBNS0RoSHRsTXFkN2owcjVQdXNKVGJqSnJOZGRFY24rYmpGVFF1?=
 =?utf-8?B?U2pxV1IrdmJMVVhrZW41OFZBS0orWnZJSWtKVWNvczh1NXFmZVNlbkwvSGh1?=
 =?utf-8?B?dUllVm1HNi9VWXRuOVVhdkpRV2hWRFo5NnMzYTJFZ29wbXRmaHk0UDV5YXdM?=
 =?utf-8?B?YWZnTVdVQ2NFOEhuOEIrU2xoU0VkT2d1ck41T2lvQk1sam5mY0VhYU1QYXZ3?=
 =?utf-8?B?c2lpYWkycHU1amZPSHhlR29qZ2h0dlV1TFZIVTdLTWp1OHNDVTV3bTlBNWwx?=
 =?utf-8?B?T3RYZTFsenJ0ekZzVFVTa2t3Z1hsVTJSYmdCNVFpL0xJOEJ0T1p1ZGpucVll?=
 =?utf-8?B?anE2S2lyZlRjMVo4ZHZGSlpNSUh0bmsrUDMyUHVYL28zam5scTFtUytrVVc1?=
 =?utf-8?B?dmlFekhHSDNOZ0ZmWi9NVm45VHV3S1g4UFRCeGR5S0tGYlpsc0VEUmYweXlG?=
 =?utf-8?B?ZWZQRk1LT3RGem5sVkp4RHR3bEd2Y2RsbEd1c29VV0ZUZFhJd20rRzJKQzMz?=
 =?utf-8?B?QnJ0Y3dLNWJCb21rOUJ5TmhTaDY2VkVGNnFSMFBBSGRxUFJlcDZEemNiWjRq?=
 =?utf-8?B?UlFVVXU4RGVzbG5vSURMMnJ0ZEUwU1phRVdJMmxiYWh6SS95UDBtcHJIMldO?=
 =?utf-8?B?NXdNWTVBVmFwemZrQm5Vb2IxSmJLUTZ4alRmVUlhM0dQR2xHSTZ6ZHZDUzBj?=
 =?utf-8?B?VEFWVzM4dmFIN3ZpN1FGcEcwUFpsZ3V4VWFHb1hYU0NmUzViZWpjNU1rY2F4?=
 =?utf-8?B?dXpCRm5nb2lqK0VCanVxd3NTTW9pSGNqYWdKSXI3TFVuZytPSjd1RGROR2hQ?=
 =?utf-8?B?TWV3QkMxTDVSL00yVnovQ3RkRjYwYWJRTHZBSElGb2J0UWxBU29xVkcyK0dR?=
 =?utf-8?B?cnhkNmlRcjJ2NWE1UVpIWkhEVFZyREU4emhYR0tWQzUxSDM1L0g0aW1ScWor?=
 =?utf-8?B?ZCtvT0szNWRxV3RCN0dEQnY0VksyOUowQW5ES3ZpaDNqSTRLblF2RklqYUlm?=
 =?utf-8?B?WDJJdHdqY2J0ZktzamJmMFc3WjhQdW5KOXdueG5NLzJOTXpwdkErazhFN1NJ?=
 =?utf-8?B?OWlNVG1hbk5xNnZxaEllSWFEUXZkcjN1aVZUZGZJTVVqb2VFeW9mcTFwR05u?=
 =?utf-8?B?RXNFaGZwNkNTYkJkeEFmQkorNUtpK1c3bmh5VW5YaTk4RTQ3bDN5bHpibGtz?=
 =?utf-8?Q?jy5XJrKzu/073?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tlc3Sk5Zb3ZiV1dVSzRPZVg4cVZUdFZXZkxTd1hDVmxubTE0dUVoU2poOThp?=
 =?utf-8?B?dnoyaldYTlE0WXlNay82ajhhUDJNUm1BSGFOQW1tdnJDT0J1L0RaT2s4a2g0?=
 =?utf-8?B?ODFtZWxlRkZwalNDSW0xMHh5WXVjZStnL3hVL2hBRUwvL0VtNnB6b2xqeXh4?=
 =?utf-8?B?ZEREV0hNWm05VmM5MXRMWm1ZRmtVL3c4UThNRWdoZTFkbittdTFQSGFZQlhk?=
 =?utf-8?B?RmNOaWxzRHljb3V0eHpYSUZRYStWQ1V2VjE2UmttWm9FekV4ZW13eDVlME82?=
 =?utf-8?B?WHZmTlUrMVhxRXl1bFhVM05CV1JPVjRLQnhQN1crVFphOEtmMnplbHRvSkZ1?=
 =?utf-8?B?OG5keEt0M0IwdVFRVDdBVy9mNnNqUU0zeFFaa2hocUtXRGpZM0lDOUYwSEhm?=
 =?utf-8?B?RThodHU4bkwzY0wraUpibmpqK3hkV0gzcDdCZURIQ3Nnb3FYc3hvbFI5UWky?=
 =?utf-8?B?YmlGVEVqUDNmTnlaOFlpTlhuR2crREIybkRlRGNDS2JUSm1GUDZ3enlRa1Zy?=
 =?utf-8?B?RDYzS2R0UDdWZnRKNDE3clNQY0tiYTdqcHFBcVJQL1RWVlBEYU50ZjlZMnBC?=
 =?utf-8?B?eWVHVUpRQXNhMW5xdGc3NWJlRjk5aXdoUml6TTVNU1VQNHhLRmZjYzZQKzhn?=
 =?utf-8?B?UUh3bGp4TlA5WFhoRTl4dU13bm9TREd2KzhtaGV6UmtyMDVqcjVTYkhVZmtW?=
 =?utf-8?B?YU5SVEw4a1dDMmdCWjVwcWhOVHZMcms0bjM5YnVjTWxrZGlsNjVaWnVSNUxl?=
 =?utf-8?B?dndDRWRXeXY4ZDZLOGZpa2xzbTN0Qm1lb0ZXZlVuOGFtaUNPYTZzRGtWOFZ6?=
 =?utf-8?B?eEFraG9PcEFyaHdtU3Azc0tLQ09SMmlhT25yMy9PUlNtL0hzZ25rVEtsamp4?=
 =?utf-8?B?eGFya1VwdVEzLzNiSkc3YjNVV0F5RFBHTVpTL3BrUWVJdWp6SDZsZFZWWWRo?=
 =?utf-8?B?Y1o1SHo3ekxoTDBENThrSzZpTkprUVdXMTFSY21zL09EVmZkVENndE93VDVs?=
 =?utf-8?B?bTZqaE1lSGI2YmM0WFhpd2cyd0ZKZWpNSjVPUFEvWWM2enExQituOTU0WFdq?=
 =?utf-8?B?RTd6S2pQMUFPelk0VHFaSGpEbU5XVkMzeTFyWXdiQ3pPQ1R1ZXVwTWtJTFZG?=
 =?utf-8?B?eEhiTDlMMWZXREVzVDRORnNGYjVTT3dnUU9SMUNRTjlselkxcGNIeXpvazlE?=
 =?utf-8?B?T3MwNnpCOFdrUE5CVzJmSXBuUDBzWXdWRlJHTmtIZXpmQUhEVWZIT3ZYL0M3?=
 =?utf-8?B?dXUwVW9OOG5aeG1rYTRJRlBnaEFrUXZYUXk3bitrcDZWOTBYMWk1cTNFN0VR?=
 =?utf-8?B?Z0dNeVl5VkpCNmdySGRMK3Rlc2ExOTJMaElmZVVtQWhWRmo2MkY0ekRkZWFj?=
 =?utf-8?B?QjBDUGZaamx4eElOWEN2VlAzSXl5UzFEc21HWFNPMkNDV2pSdFZ2YnprTHN4?=
 =?utf-8?B?MHpyV1QvSmJMOTRPZzc3UjFuN3hWN1VoNkZISUc1ZHV1cWR6dkpSREY5L2Jx?=
 =?utf-8?B?OFNNNmd6d3pnSDlWdkdGZVVYVHE3NlE5Z2F5LzVhVnBKc09UeU5ZZ3J0YUo2?=
 =?utf-8?B?Q2tYUnphUGlpOWVETzVHMkpiTllFOU5YUWRqOE5FYW0wcjBRTkNrcER0WkZF?=
 =?utf-8?B?YUNqeFhQaXlQWERiaFdNZ0tkZWdkL0lXZlpwV1puK0ZSZjhndWtwQU81UlEw?=
 =?utf-8?B?aFJ4bnBzYVFTVkE4cnhobHBlYkQxWHltY3lIS0ZWenpaWncxNGt2Q1o0cUtK?=
 =?utf-8?B?Rmp1U00zYTVwMkZuYjBFbG1hT2w1ZE9lTVpZWDU4L1JoamFxVUJTbXozdHZB?=
 =?utf-8?B?SXkxRzhBOVNLdjUxcTBkSjRIcHBMaTRBUVpMcTNjYzF3cHo4MHdidzRGY1pw?=
 =?utf-8?B?UnFhTU92Q1JiVWVtRFd4bkdLREdFd2dwMjk0aHZ1OTJIOWRuT01jNzF1SDRm?=
 =?utf-8?B?WVBvbmM5WlpCN29ZVXJXZWhNQjl0dkZxeFNza1VEWlo5Ky9Vb3owRnl2Zm1D?=
 =?utf-8?B?YkpNby9jOHNxRmpzZU5md2FPS28wclVxMXZEZlZ2NnZKQUNoTDUzU0NwNTJ4?=
 =?utf-8?B?UXduTzEwc0pwY3BCeDlRZGRmTFdta2E5Q3Fpcmk4dnlxUlRCTEZ6SjJYWk5T?=
 =?utf-8?B?dDJ6NTVZbVU3MzBuR3R5d29BczZKb0ljWUR4bmpDcGx3OTBRQW9KLzRJc3BL?=
 =?utf-8?Q?1h4TWoBGfzo9i2boNodBs52uXQgjDCp4Z+jUT3wGrk8u?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd4883d-9f07-4e5e-fd99-08dd683afede
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 05:41:15.2274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M2Ce/uTywGvK6EfFXfcyoXhnDf5kurj996JCQgbtvC85SbtFLDz1y+8SVx/W4k06/Ivc1PLzexZrRESRCmOxww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
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

Hi Boqun,

On Fri Mar 21, 2025 at 3:17 AM JST, Boqun Feng wrote:
> Hi Alexandre,
>
> On Thu, Mar 20, 2025 at 10:39:14PM +0900, Alexandre Courbot wrote:
>> Add a basic timer device and exercise it during device probing. This
>> first draft is probably very questionable.
>>=20
>> One point in particular which should IMHO receive attention: the generic
>> wait_on() method aims at providing similar functionality to Nouveau's
>> nvkm_[num]sec() macros. Since this method will be heavily used with
>> different conditions to test, I'd like to avoid monomorphizing it
>> entirely with each instance ; that's something that is achieved in
>> nvkm_xsec() using functions that the macros invoke.
>>=20
>> I have tried achieving the same result in Rust using closures (kept
>> as-is in the current code), but they seem to be monomorphized as well.
>> Calling extra functions could work better, but looks also less elegant
>> to me, so I am really open to suggestions here.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/driver.rs    |   4 +-
>>  drivers/gpu/nova-core/gpu.rs       |  55 +++++++++++++++-
>>  drivers/gpu/nova-core/nova_core.rs |   1 +
>>  drivers/gpu/nova-core/regs.rs      |  11 ++++
>>  drivers/gpu/nova-core/timer.rs     | 132 ++++++++++++++++++++++++++++++=
+++++++
>>  5 files changed, 201 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/dri=
ver.rs
>> index 63c19f140fbdd65d8fccf81669ac590807cc120f..0cd23aa306e4082405f480af=
c0530a41131485e7 100644
>> --- a/drivers/gpu/nova-core/driver.rs
>> +++ b/drivers/gpu/nova-core/driver.rs
>> @@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
>>      pub(crate) gpu: Gpu,
>>  }
>> =20
>> -const BAR0_SIZE: usize =3D 8;
>> +const BAR0_SIZE: usize =3D 0x9500;
>>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
>> =20
>>  kernel::pci_device_table!(
>> @@ -42,6 +42,8 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo)=
 -> Result<Pin<KBox<Self>>
>>              GFP_KERNEL,
>>          )?;
>> =20
>> +        let _ =3D this.gpu.test_timer();
>> +
>>          Ok(this)
>>      }
>>  }
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index d96901e5c8eace1e7c57c77da7def209e8149cd3..f010d3152530b1cec032ca62=
0e59de51a2fc1a13 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -6,8 +6,10 @@
>> =20
>>  use crate::driver::Bar0;
>>  use crate::regs;
>> +use crate::timer::Timer;
>>  use crate::util;
>>  use core::fmt;
>> +use core::time::Duration;
>> =20
>
> Since there is already a Delta type proposed to represent the timestamp
> difference in kernel:
>
> 	https://lore.kernel.org/rust-for-linux/20250220070611.214262-4-fujita.to=
monori@gmail.com/
>
> , could you please make your work based on that and avoid using
> core::time::Duration. Thanks!
>
>>  macro_rules! define_chipset {
>>      ({ $($variant:ident =3D $value:expr),* $(,)* }) =3D>
>> @@ -179,6 +181,7 @@ pub(crate) struct Gpu {
>>      /// MMIO mapping of PCI BAR 0
>>      bar: Devres<Bar0>,
>>      fw: Firmware,
>> +    timer: Timer,
>>  }
>> =20
> [...]
>> +
>> +/// A timestamp with nanosecond granularity obtained from the GPU timer=
.
>> +///
>> +/// A timestamp can also be substracted to another in order to obtain a=
 [`Duration`].
>> +///
>> +/// TODO: add Kunit tests!
>> +#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
>> +pub(crate) struct Timestamp(u64);
>> +
>
> Also an Instant type has been proposed and reviewed for a while:
>
> 	https://lore.kernel.org/rust-for-linux/20250220070611.214262-5-fujita.to=
monori@gmail.com/
>
> we should use that type instead of re-inventing the wheel here. Of
> course, it's currently not quite working because Instant is only for
> CLOCK_MONOTONIC. But there was a proposal to make `Instant` generic over
> clock:
>
> 	https://lore.kernel.org/rust-for-linux/20230714-rust-time-v2-1-f5aed8421=
8c4@asahilina.net/
>
> if you follow that design, you can implement a `Instant<NovaGpu>`, where
>
>     ipml Now for NovaGpu {
>         fn now() -> Instant<Self> {
> 	    // your Timer::read() implementation.
> 	}
>     }

Ah, thanks for pointing this out. I'll keep track of these patches,
hopefully they get merged soon!

