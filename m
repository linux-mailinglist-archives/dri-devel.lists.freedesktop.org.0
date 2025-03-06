Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576BA54AFA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 13:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB19F10E959;
	Thu,  6 Mar 2025 12:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ueJW+by8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 361B710E954;
 Thu,  6 Mar 2025 12:42:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pv5NGqMChXaelf3yc/X0YWQ5Of0lYd1wpzi0Iva1z/GkZ23x0ipXTjVNt1YPTbId1at95ayN/cS87WQBwbeqJC9RZr0eA3pmXA/KzBlToxmebt5hBsVbH0u/lTqpUXEyKMQyYPeq6tIC/pNraL+RF4YJA/eCnJLh8aNnrDJi07Fywn9jLzyMJJEaCbFOqKXw7VNsThFOYBwfX34UW06cK5CgU0ngu7bKBzKSvv8gBlXE+d0rUWn5g81U2q2ypjVH6ZtCGZ2glVq3Vi2VDj1x+VhHW5uHpCYq2r8nFT3HhwoiUdN4jfLmT4tB5AEyW25Q/NSnKazxnm1WVquT+FFGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoDwu5HMgIQ+e4U21aMx7jRyWkMNVNRhJbhEa3eAWbw=;
 b=emqhsc/s28rUaO1esr2OiBfBuxn/TLClh6vHY5G12IJThLhEV81QC1FyMznD9gFTaMG6TieJcdJFqaqptH8s+lvUfPA++892oOiYc6bkvuwhtU5sIJ3poswQ0Kli8wQhicf1VAjRz0tuxlmYzoz5kAG0Q3rDpomsHhrdut91lggfr9rPXFfLYgZGSXT/vllE9HbWOB/01P1R45Mv7Nh5TjyH0W9T38zpvbmxqwvaUaY596csHqQByS0JJaaPttaVKHjP6/g6e6HwE0puD/Nz6Y+AkK2T8r8yXHgJiSQzfU2lRHoRxhBvHEeTBg5tnQo8r7SEyCpsqtXM53HV6TVeYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qoDwu5HMgIQ+e4U21aMx7jRyWkMNVNRhJbhEa3eAWbw=;
 b=ueJW+by8/rHU884QV3vmVpjlfZP+Roo0aiKInnQDl2KCq7l+I7gfciRgeQfLtb9/CrgdHvrrDNDOb1DZwUlFVe14XUfXHRyybtu0G4OJ4CEzkBnZDWJgURk8+390cs7ej5BLyfSZsHjp6VFQvk5Xc/owut+oFBmIlez8VObIczk4V9K8BjGNxfGAjuZGu/dNr8p6BQi855CymR70cTEZiY72Dyp3RPzcvhSsndQetHDd1vFrzcurin37m3x1r59OW0ADGKwCKfv3XyDjfTVbJQ7kKGCaTCs2zDA+y9AhpuMUr7W//kicSgqEKOTsbJydYAie108/73e7sJuoT7lPJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DM4PR12MB6254.namprd12.prod.outlook.com (2603:10b6:8:a5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 12:42:01 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 12:42:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Mar 2025 21:41:57 +0900
Message-Id: <D896WBS00WNO.2QFVBP5GPEHA3@nvidia.com>
Cc: <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <benno.lossin@proton.me>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <gregkh@linuxfoundation.org>, <mcgrof@kernel.org>, <russ.weight@linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add initial documentation
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <corbet@lwn.net>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <ajanulgu@redhat.com>,
 <lyude@redhat.com>, <pstanner@redhat.com>, <zhiw@nvidia.com>,
 <cjia@nvidia.com>, <jhubbard@nvidia.com>, <bskeggs@nvidia.com>,
 <acurrid@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250304173555.2496-1-dakr@kernel.org>
 <20250304173555.2496-6-dakr@kernel.org>
In-Reply-To: <20250304173555.2496-6-dakr@kernel.org>
X-ClientProxiedBy: TY4P286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DM4PR12MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: bc46f6c9-93f1-40d0-84e6-08dd5cac49ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dW9kUjNMOXNhMExpeFZhSy9EWDFOTm13ekpqeWRndG5NZDlaZW5iajFScERL?=
 =?utf-8?B?akNyMVRCeEgxdGoxQUFKd1h3Vnc1ZjJHVXZwNXJVYUV6Z3pxNGd6Q1hZQXlr?=
 =?utf-8?B?RlJrT0lpMmdqOWRDanFwb3h0Zy9JNzNLS0NxR0xZQkVJajVDcEg0MVVpQlNh?=
 =?utf-8?B?MzdteHNTUmtCM09QVEF0NDJlYmZ6WnUvek5tM3RxNVYxN29kcDR0TGJIM0ZQ?=
 =?utf-8?B?TW5pMzJFcFFqZjhyT0hKSEd0MFJrMExsRlBtVVZVVEhXaGVtTWV5L0pqUVpS?=
 =?utf-8?B?cVlKZkpRcnlKa015c3dWMEpidVNYUkMycjFkSGdNQm1jaDZjVmhvaWIyQWJ1?=
 =?utf-8?B?SUNtemMvTmRSTzdtaUIvbGJoQW1jMkFYam0vZ2kzZEhxNmk5eC9kaHhodlpJ?=
 =?utf-8?B?ejdvUkM1dGlCUEVnMzYxanBWdnBzSHdRdEdXVjNwRTJ1Y2MxOEVGdHRFQ1RY?=
 =?utf-8?B?VHk4V3M5UXRhTUx6RGNjR05jamdGdVd4alIzeXRxcWdFZFNTemw4aC9vRkdB?=
 =?utf-8?B?MDRWb3JYajgyYXRocU9nd3ZqOHBiV2U5WStGeGhYMURFdU9GUUNPOU5MSXM1?=
 =?utf-8?B?MWRhVHRwVGduM05Eem5FYXVEa1h3S1BsVDE3S1R2NFdYUkk4SytGcnRmK3Zn?=
 =?utf-8?B?TGJqOXBkVG45WWpsREhqT2o2S3k0MXFhN3Q4Tmxqc1RMSmZGTFlDazZFUk45?=
 =?utf-8?B?ZE83NTNMaktRZDVqWEpTZk5aYUdOSUcyRUxyMktQVjhNdnNNdUZJQ1V1OXRV?=
 =?utf-8?B?Tlh0UW1xaHdLMjc3OG5rbXhjTlJYenZZQUwycmdFSVBlK01hekdkOEtXM0Vy?=
 =?utf-8?B?Q3JWUUV3SzFYNVBQZENTZFQvYVBsMXEyMDVvL1AwcDhwbnVzWm1oZVRqRVV4?=
 =?utf-8?B?THFFUDlvckoxeGY5b0xTdXZjeG5aelFiWURRSU5lY054N0pPS3crODZRU3hU?=
 =?utf-8?B?VW1yWkhSOS9VZ3haUmIySDVYcnR3UDNaaXhERHlRdU0yU3ZCN1I1bVlXSXor?=
 =?utf-8?B?a0RLUENlMEY4RWNoNEhIOU9SS3FTdG9nWFRKWnhGTVYxMG9CaStUOUFFVE5R?=
 =?utf-8?B?SWowRnQwMWVwMXZpdndPSys5U1JBUTFmOUNQaDdCSGJHMTVzVXRHWXdKbzlm?=
 =?utf-8?B?ZGJCc2drNWYydys2aWdHaFpSemZMdDRVQnpKR0hvWFNPSjVWZTdmTlpPK2Z3?=
 =?utf-8?B?YlBiVVcycUVNbFdabW9odEpsRjFJaGJEWVBoQzQ0REJrbEZEYm9HTmhqTkdW?=
 =?utf-8?B?TlBoSjYyOGpJNmE4M3hSYlU3bkhFY3lZWGtWU1cwL2hqTUcvUVpiVVhrRm5R?=
 =?utf-8?B?MkIrMjZBZ09oendia3lvWmhEY2J6ZklzT0taUHFLMmFVSzlFSzduczJKbDJO?=
 =?utf-8?B?VGpjMjJUU2JEd29yN0dVVXVRbXovaWpvS1NIRjh1N203MmVPbWJWM1hmUVJh?=
 =?utf-8?B?U2NHTUhNbnZ5WEFuZWQ2TG9MdFRqK3dNMmpvRktJUWJ0dW9LL1RiUXFlSkg2?=
 =?utf-8?B?eEh3KzlDZUZaSzFoaXdnM2RScGRLaTZBL01DY1pmRlZkSVdsa1lJRDdUTm5R?=
 =?utf-8?B?aVppenB1UUIycVhhTVhIaXhxM2t1bGsyN2llOWFZaVRCMFo1WkRtWFlJVmVK?=
 =?utf-8?B?VmozaVBBTWQ0R1NkdHZUOEdNWkZRUVdsWUNsSkdTTzh4aElKMjUva25lTGN4?=
 =?utf-8?B?RWpOZ1NFMTlmb2haN2MvM1UzS2ZiVnJJMW5VS2tLUXhlcnN3b3RvcTBwcE9Q?=
 =?utf-8?B?WTFBaTRlMnU1TkEyUFJWYVdwdC85cDFCMUhUWDJIKzFzUmVPZVhFV2NIZzZT?=
 =?utf-8?B?TVhMVE42bFpkV0JzVVFDT2tiNHhsbVlSUVNTbDR5MGIrWC9PM3hxTVRkenBO?=
 =?utf-8?B?YXBsbSszWWdZZ2c5QWErVGlJQWRsSkprK0ZTUkM0Ty85WXpRMElxZGwxV3ZZ?=
 =?utf-8?Q?fz92GFCKqAE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9QZXhuZWVyYVdLWjRzREllM3NPamdXOFBRQ1FnMGJ2M0V3bnhCS0VGU1BQ?=
 =?utf-8?B?U1diRGgwSUpRbTFZaFdVWVpFQ1JXMVFUTkoyc0FqNCtHcUxPcTUyVjIvM0JK?=
 =?utf-8?B?Q3BRUHo2Q09yODM1dGQzVUlmRDZhdStXRmxlWWsrMmVjdGZNQ0t1R08xRzFN?=
 =?utf-8?B?L0tqZGZWM0k3RHFoeEViY29OZm9kclQwZ0hHTEtuRmdWRkxhUXpYb1BXOSs0?=
 =?utf-8?B?ZWJpOEYxRkNYdGNkYlBhMldwSXNUa3RhSnBWS0taZTVPYitWYnJoY0hIUWZX?=
 =?utf-8?B?b29ua3h6elNwdzVtRU5ubHJaOXB1YWRVVkRJOEtWUCtGV3hTNWx6aTBFWXd3?=
 =?utf-8?B?MFppRzBtS25DUEM0cWpvbis0K0lnNS9UYkNuQVVpNjkxSDZxVDE2ZWJtbitV?=
 =?utf-8?B?K2g0dkVad2gzSXNCVS8vQ0hzY3B4SUlidzdyYmkrYmYxbXJ1ajhEOHl5WWk2?=
 =?utf-8?B?SG1kenJaM1NwYndiQ3FmY2R0K2Y0OWZQSFJ4ZGF3ek84NGhtREx2ZWVkTVNT?=
 =?utf-8?B?Q0gySldZZm1Eb0hKenRHa2RORmJtUGVBaDRDc2l1VUd0dFVwWk5TVWs3N3N3?=
 =?utf-8?B?Ykw1ejRpWERkWXJNa2hYNHZRQW9DZnVzQlhlTTNyZTV3TzlSNTRaLzM5UjVW?=
 =?utf-8?B?cDBtZmpSdUVpQk83YkJYMzBUenM0TVB6eHhRTnJIWXlpSFJNNjVVcUxDOWJD?=
 =?utf-8?B?UW4rNEdvV0ZlYXZxUURNUW5rdWR1QUkzK2dFMi91d3JYVDBKQkJLYTVwMzlo?=
 =?utf-8?B?akc0S3hFZFNYd0J6UTJWZVFpK2JOVnorbHFWbjAyMVpoODNTSml0YmpGaElP?=
 =?utf-8?B?VjRPOSt1K2xERk1rTkk2c0dodDV2UzRHc2xONzdSNzBhaTNLeVB3ZTJUREJx?=
 =?utf-8?B?V3NKeG1YR3JaWkZUVlI3NzFIOGdJRzdvdGkyanRtMUVFLzl4Y3ZQRjc5SzBy?=
 =?utf-8?B?UVRWLzE3eEpzU29XTHdCbDM5RWEzaVhNY3V0UUV0ZFNZSUR0UUcrVUtqKzZN?=
 =?utf-8?B?bFNwbHd4MkhwREVuRW01dG9HSmFRY3dWZ01ndEpLOVlYK0hzMDhqc2VSMFlB?=
 =?utf-8?B?TXZNdFlPT2N4MTdEMHNiMkkzb3BteThSdEJyblM4Nys3SERORHM0UGw4UDNK?=
 =?utf-8?B?QVZ4MVJQa3FuNW9PeTBzWXZvaEFkSDlLQktadkZTSmF1d1RlRlhEc0l0SlBQ?=
 =?utf-8?B?cmdNeVNFNlh4ZHBtU3JGV2ZuUVlTNDI1Yi9OaXhNbjJ4a0NVRkV6Vk1laUhB?=
 =?utf-8?B?ZzlKenFGalhLaENSNENlaXZHam42Q3hqVnR5TEtnQWNuR09HT1hhTXQxRklX?=
 =?utf-8?B?RXVET05pSlVtN0ZRSDkzcW9XSEh0Q3hvck5lSHpiY3cza0IwcG9NMzdrYjFj?=
 =?utf-8?B?UHJxOTR2ZDNHbGZKRFE2Z2I5ZjBlODByZGFDT1hnbXphOTNvbGhoN1VWWlRm?=
 =?utf-8?B?TWpmNTlPSU5zQm5OTFkxdGpjQ2VwYWJWbllXb2dlcmNLR1g4akwrNzdKZ3RN?=
 =?utf-8?B?SGIveDlZb2t5UThvU0ZHeDdwVDNadHplOFdPT0FPQlBzeTZwbkY1MVllWGlx?=
 =?utf-8?B?OURDWTFhM3VKWFZUZjl0ekNJSFA0VDlWcko1bll4NEhBeEE2MGZ4WkpQVGlD?=
 =?utf-8?B?azljb216QXRVd1RDZURYcEVza3FhMm9TTjBIempTWWZyVzlQdjJ0cGU3cW5O?=
 =?utf-8?B?VjZMK2dQTnVRQk5YQ1BSY0NJL0l5UkhGZ1J4RSt5YUY2d2RONks1cm5iMUlq?=
 =?utf-8?B?MUgrbkFDYzRhT3pHTXhUNU1LQnZBZnhXZGtFeisxdnBSZE9qWWdHU25pU2hn?=
 =?utf-8?B?QUkxcUpvamNYWDRXdTgzM0xrQ0VzWnc0aTdnSVB0cWJsNDNWUE1SVGpuSTB0?=
 =?utf-8?B?ZWRSRXk5ZmpSQ2lQckxXb0pBRFYrTURFV0RRMldIOXVZOGswaktkNlFpWnBo?=
 =?utf-8?B?RFhJZGEvTS9Rb2hJNGlHTnh1Yy9MRVhFbjdTYXZzYjFsQjI4UkRDSGthRGJp?=
 =?utf-8?B?SDdXeGE5SzFCWGkvTVY0cVc4RmVZVVZCM1hncGlhWjRIa3A3L0k0OStmazFP?=
 =?utf-8?B?SzZtTkNMVit2eVNYYWdsc0VScnl1NWVtdDIvRnNDbkFmeXpzeW01RzdlVmZp?=
 =?utf-8?Q?UjLBiBatw2dvuiA1X0DZNAlUp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc46f6c9-93f1-40d0-84e6-08dd5cac49ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 12:42:00.8253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4snvy0H0/B9xGMZrScDUqIFkCZJg1yCVtLPwTqlogmQizXw8Q2q7wzOLCPXdV1R+2ROmfBGCDmQ+5jYBnA4X9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6254
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

On Wed Mar 5, 2025 at 2:34 AM JST, Danilo Krummrich wrote:
> Add the initial documentation of the Nova project.
>
> The initial project documentation consists out of a brief introduction
> of the project, as well as project guidelines both general and nova-core
> specific and a task list for nova-core specifically.
>
> The task list is divided into tasks for general Rust infrastructure
> required by the project, tasks regarding GSP enablement and firmware
> abstraction, general GPU driver tasks as well as tasks related to
> external API design and test infrastructure.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks for this - the todo list in particular is super helpful to
understand which components outside of the driver we need to include or
drive to completion.
