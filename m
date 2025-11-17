Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B22C63D56
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF8310E36F;
	Mon, 17 Nov 2025 11:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="izXFoS51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010057.outbound.protection.outlook.com [52.101.85.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705C710E33B;
 Mon, 17 Nov 2025 11:35:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8jxMxoPhnZ2K+Z7M4HqOcUS881ESWqRL1yhwckx7bWSP2nNFOXn47XOhucRUyk9jEZIZcfXM36JbY6h32IYK4K6MRElTTCJULGU0Ze9HimaeKKoSXEMEb6gobXSsttvkHvhyGoW8ObfiA4tGdtIWPkmv9LxWI4xegAaNHXUf8fZPkIvpEKbp3F5MdD+yGutRuI4T/afJ3BkW8UwVO33nF7+PubQBBiJ5zurNgojeGJRxMZlt8qtOGyQrJkl2vxb6gjTVWHuArSh2mUzKwZK4B7B8t3zxPQL6fUs9GD3iWCfop++DQTPU2XD6m8eC9glfdn/0zJWHsgVmyqba4wgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Mnnx7rd47lG2QiU5jjn+iLQYAr4HCLPXQuFrhVjGpk=;
 b=wOsG5TtSuwsyJDhtjPpw0wQ6Ofnt9PCBpMb4IFEEIme9S1hVPXfP+3Fo8Edm/CnuBA538Qyg+KDiBbFOO3gtdtnilatRVp1ZNGy4CiS+srmnyCToeOXwfrHLkrfOb5B4FBXejiC0LAxkeVFFN0OvQIy2SBrh0/j0s7bKzc0MpBCtmAxa/NbxT2jiMl3iHPbUqsQGIxZPS5tHj46/a5GmRiF3Ev9fcO/y12t9ZKTmWAt2aUjzNmZZ2Sr8Xll5L2mrr4m+d7IqWaILNDNx3TEoguR1CDrMDF5qsaWFIBqwlUK6d4EOlTU7GdxHV2urdewG4MIzMmiS9kf3nkK/dkqAzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Mnnx7rd47lG2QiU5jjn+iLQYAr4HCLPXQuFrhVjGpk=;
 b=izXFoS51JklBxUB4GeOviCRcjDsBIK+ED2ExxrvOCW/+jRYPkbNNlA9tEqK/UdfonBFzoEa7AXkzwYuJcUXhR9k/58C077NwwoO4pBQ1yxL46F4j2gDsjm6esgEW95EUA8M9wX4H1X+u/9o8d8fGcGTkMWz8ZRFmKI24EtisrTMjlK1ENwrzgxmU8HjMQPvlidqG7enYP31Y2o74Murl9PCjmzNZSPku0ArfEPCbxd7Ol7llFWpOXVf55krTaB9UW1KGpxvYlzdW2P8DaB0KVOmetLIEww3Q5GpIGBUhViXA5MLGOKJy3QIajCMDYfmV1OrVQEBbJuWwXF8TEjGHyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB7837.namprd12.prod.outlook.com (2603:10b6:510:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 11:35:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 11:35:00 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Nov 2025 20:34:57 +0900
Message-Id: <DEAXSHY1G7J3.27Z1COU6EW074@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: make formatting compatible with rust tree
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
In-Reply-To: <20251117-nova-fmt-rust-v1-1-651ca28cd98f@google.com>
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e604880-f907-4378-1f88-08de25cd57cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWwyRmlnd2JzYll2bElJZlQrNEdmWng0Tlhyc0lRZ0pVNzNoMEh5Tm90b3lX?=
 =?utf-8?B?Wk5XM1BoQ3AvV0c5WTAwRlExNnFKd2xvdElVUmtSK0tpQk5remxpVCtrTi8r?=
 =?utf-8?B?THArbjVGWVhkdkZQZUhRMHhxTEpzWFlFV1NESnZVTE9UZ2l2Z3o1ZnVuOVd6?=
 =?utf-8?B?S2JIaGlYU2FTWVhTVnNmQkVvSUozSGwzL05aajl5K2VWUnZwVDFMYVp5Szhw?=
 =?utf-8?B?OUFWMllJaHh0SHNJMXV4OVBvcndBeUZaRWE3M1VOclI2dER5Z2t1SGpnOXN2?=
 =?utf-8?B?dVlhZFlkd2xuQWh5Y2lBL1JLN2F1ZVpYcGV0UDZ1Y05lVHprOXRNUGY0Z2RU?=
 =?utf-8?B?eVg2TEttKzFkelV5NUtNUWdwaVpiVDNkTW9IS2hPUm45ZWZhZHhlL1N2OVJV?=
 =?utf-8?B?Zm9rUlpkWHA1MGpEeTlUcmJOVlIwRVZ2c1RMM3YwbG4ydmhUNUh2cTU2K2R4?=
 =?utf-8?B?Q2N0a3gxdVlZWmhTTVJPTDFpUjBlMFByazc3TGRhOTBCOUY3UHVYZzVFZUlX?=
 =?utf-8?B?K0pFeUNFVDVXY1BwZmJwMWpEN2VHWHRGMG1rL2orUVNCL1FsU2Y1Tm9yYUc5?=
 =?utf-8?B?SWVGYVpsaml1SGxicU9xdG9mOUJoeVdNeCtJYVpna3QvMlpITGFpOTRFN0c3?=
 =?utf-8?B?cEJ4N0krOStHMjAzRXl5cnhjQ3h4ZFo5VCs2WldZQ3VEWUVPYU02djI0S1oy?=
 =?utf-8?B?UzMrRm9kSllCNUpuSzh0djlpbktHMExMYURuVzlZVVFtUy82ajJrUDlQbWxr?=
 =?utf-8?B?RzJlTkNPMHBlQmtaaDh4UGJacjZrbHpNNlZTOUdkYnU5emJCMy9rU3l0N1Q4?=
 =?utf-8?B?M0VpNHFabW0xTFhsWEZUbk9JWjJsMjltZ1NibHgwREZHQlJHTVdpTndvZHg4?=
 =?utf-8?B?dkZZMW1VYkc4NEQ4VWJsNU5VczBpOHMwMGh5aHVmVXBaTlFDVXMrWEVUblJB?=
 =?utf-8?B?ZzVtYjNvTVpXbHZSdjhPQnd4Zkp2REIrUXFvUXV2RTZ1aVcwaXFzT21PNGRG?=
 =?utf-8?B?RkQzQ1FyTUxNQmhGMEI5UGp1UmdtcVpxMlVGOWs4bnNnb3lxWVpPVk9td2Fl?=
 =?utf-8?B?RGdVVk5vcEY0RHp2YVhHVXM5ODdaTDNsQUdCRlBKVUpFTzlJa25NVVNmbVZp?=
 =?utf-8?B?Z0gwRHRxUUdwNkNaRXFva2ZXMzBocDQ5TlVqYUs4SUg4YTFZcEV0SVVLWW9F?=
 =?utf-8?B?bFp5bXFXTlpXaXVEdVpLazlyTjBRZUJGL05GMVZLemNoY3JkRmdSbG9HOEtw?=
 =?utf-8?B?a0FnZUZRSWU3dk1NQmxMNzNqajFJODJYNkJaRzF0OGU1bjdwajNYd3A4bkZi?=
 =?utf-8?B?cVpTK01Fc3dsSWh4SGxKY0lURGtvZmpsRm5aNEliN2FvdGFGQVFQRkJ4YUJC?=
 =?utf-8?B?YkxHTTJBK3dkQjdUU0ovcStLaTFRbWViVUV4VGpQMzJGKzZadk9ra284Zmkr?=
 =?utf-8?B?L1hHcldLeklUOSt2alBrRFZPRTdmZDY4cmM3ZUo2WDdqdUVkaUN3RnhCajVK?=
 =?utf-8?B?TGN5bVo5ekpsUlFLUlRsT204UkdPVFlCN1h3eGlJNXU2TE9DakVuZlRIRVVm?=
 =?utf-8?B?UERhY2RZUEFabWltRHJyRkl4SHRpTmZTdTM2Zm9iaDQvOVZ5RHRUTlJ4emtl?=
 =?utf-8?B?Z2FmaVJTa2tRMURJTUQwWE9URk5wTG1PMkVIMFp4TU1uYVRrdFFVUXFiR3Nr?=
 =?utf-8?B?c2ZxWVd4eVc2TGloQkdoTWt1MVFJZUhuUFBuc2VISWZ6eHo5d2dnc3BSSmcz?=
 =?utf-8?B?RlJqWUUxdTJNZXZzVzlURkpWYk1TcGJnQUd4Vnl6MWhYbnpZK2Y3VEZ0anA5?=
 =?utf-8?B?WHQvejBnbElaRUVGR0RNVnNXZXFaSkZMUUlrUHlJZVRVQ0ozRjJZejhCcnZH?=
 =?utf-8?B?R2h0OU0rN1loWXJOLzVzUHFaaUJ2Z25zOU1RT3FFSE44bVBVb2g2UHFINnVk?=
 =?utf-8?Q?gFPp9Ls647b1cPtgudaeA+e+Q1r8cflG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmhGU1JrZ2RTMTBwWit1cExuTHFZWko4bkJpSGtEOU1tMWVXRFBQL2lHS0RZ?=
 =?utf-8?B?VjFOaktUajlkaXo1bThSbVBxWnpTSGtuaCtYaXhsclFJUzkxS3Jza1JkK0VG?=
 =?utf-8?B?U2ZiazBMazdKSTJ2UTBYTS9MMTZ5WWo2ckhGay9CdXp3aXp5ZVJJeDJoQk16?=
 =?utf-8?B?OHpsQm5aVW5ZZU80SDVDdWptc1dPMmhDVXJlaWt1RW90Si9KZFl4N1JBSmJq?=
 =?utf-8?B?NEh6d2h6SUx3RFp3WFprQUZ2NFpBU3QwOTlDdXo0R2lKallBR1hjWGx6bkUr?=
 =?utf-8?B?R0tCeU1IQVcyTEtybVdJOUdsYzVGdHZaYUdDb3VhSFQzYytmSFk5SDIvYjZP?=
 =?utf-8?B?UFZraDNBcFVvb0JWRW54MDhqVjNYOTh0b2hKL0RQQnA5QXdmdHZJUFJNYmQz?=
 =?utf-8?B?ZWljNTF5NWs4cndid3hVUG01R3VxS3ZKdm5SUTVaWXlxeXpId1FJcENxRkFj?=
 =?utf-8?B?aFZPalE0UTljZ1M1T1RHRURoLzd4MFphdytIbENRUzkzRjNCMmNqUldFVFdU?=
 =?utf-8?B?aXYyY3pBL2tqRmlvYTFUSmZmdG4rUEJySVFpeUc5RlZLRFNGenB1K25RK3Jp?=
 =?utf-8?B?VG55cVBHQTZ2bVRsUERWN3AvanVCdGlUZXZuR1JMbUdJZzZ6RVh4dWRaOUhl?=
 =?utf-8?B?bWNYZGhqSDJXRHNrQ1FsNHpIeThYNXVVSzZZSFBodVJleFVCQTIzd3lUK3JZ?=
 =?utf-8?B?V0xiSlQrOTB3QUsxOEh3ZzF4aElBZmVNYnVrOVZMU0o5SERMaWVldDVmUnRy?=
 =?utf-8?B?VzFnR3lpUG1nMjF2UUpPb1U1dk1sd21ER0RXSVVBUTFMVWN2Tzd2b2lwSFZC?=
 =?utf-8?B?aDdBTllqb21OaWtONHFyU09vcWgrTlU1bzFrWmNiR1BaUFZCK0h4RWRERnpy?=
 =?utf-8?B?WUhkZmp3dnFxM0ZKcXRsZTBrTGpkYjYxQ0pOZ2xjVFNGbWcrNWcwRkcra1ZO?=
 =?utf-8?B?R3dId2dKaWNjWC8yL0xNeVhjYWxaZEtIemJGRUpESXFlbjJVMHk4YkovZUVv?=
 =?utf-8?B?ejV3Nnl6cnM2NmxDa3Z5RktkbHYrOVZDcjdpa2F3dHNQNWNycEl5SkFVdVhL?=
 =?utf-8?B?ZUdtL0c5OVVYK3psUmIwZjlWQ0E3eGFXZEVWV3N1NHNYdHE5bGptM1hZRTZL?=
 =?utf-8?B?NFBZa3RySGtzZUROb0FnYlBGWnQwVFEyUmpFbFN4L0JEcVlWQW9CdjU5N29k?=
 =?utf-8?B?NWEzR2Evb044SjcreGE1MFV2aS9SMFhiR3NyRGZtZUsvVGhRTk9HTEwwN0h6?=
 =?utf-8?B?dUlnV0RzcDlFU01Jd2ZkUEdiWXNOcEZtdXBVV0hJYWNUU3VaM3FJazlEaS9X?=
 =?utf-8?B?M2daTytPRkJ5WEYwVW9Bc2lDMFFLVDBUaDFCYlRHOVhUK1pLZjMzMDNqNmdK?=
 =?utf-8?B?NzExTHJjRThOZ1NJeTFXVmRlaW16UHBscjlLOWdiRHp2ODFxekRDWmJTUWhN?=
 =?utf-8?B?UXE2TjN4ZTJhUHU2ZjNvWlV2S1p5MUFqNURYL255SUxMRjdCRkdRU2RJYkVv?=
 =?utf-8?B?V3VlZXM3RURzUWkwNXBxVFFMS2dKeGwyYVRBczI3dlJhbGhVczMyMHUwQm4z?=
 =?utf-8?B?dWVlVUtQd245blFrRUJlZ0loM24zaGlkNWhPNlJBMWVNanVPUG5BMC8zczEz?=
 =?utf-8?B?S09aa3ZrTFZNVytQMExWbDNjYWdCb2dkVG0yTDU5bGFQdXNiWXVuK2tycnZh?=
 =?utf-8?B?QytvbGlTNmJjRC9QTmFUZXltWGdGQTZNNVZ4dEpsU2RjZFFscC9KWmk0bkJU?=
 =?utf-8?B?aUZZdmdFVVhaeE5wK2lxOFhScTlZT0hUSmUyWjJPK1FxazlFRjRrdzVCSzZ5?=
 =?utf-8?B?UGx0dzFiMWxJVDI1VTNKTDNncVc2Tzg1Rk8wVksrZXlKTC90M0tuejRYTlk1?=
 =?utf-8?B?YUx3eGNaVkxPcGxqdGJRdSthLy9mODFwaDh0bWRhSE1UeUErS2JLL3N5Y25P?=
 =?utf-8?B?V2kzdlcyV05xTzhPSGdiQmNIVnFjSWZ4Tm5jeW84aGxMQnNYcURvc0RyRU9E?=
 =?utf-8?B?L0VnUHR0WmMzaURmNjdLUDZqeTRmcFZ2eWh6WFNLQmZZOUJ4WldFOFdHV0Z2?=
 =?utf-8?B?NjlFdTRiT1FSOUgzNURaSG5UMTc3aVdFRnBVanVpbmpTL1QzbDdmS0xTdURi?=
 =?utf-8?B?VllkdTk1RjZabUwrRkRkWEhWdkxFOEZITHpNcnBlOE14WjJWTzEwd1Qzakt1?=
 =?utf-8?Q?sXma2ZxX6yA7cLMBr2xLpmEZounQXfCKJ+cl58KZW0KZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e604880-f907-4378-1f88-08de25cd57cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:35:00.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: butgbodumE0C0t3m3/Qu+J2eAFzn34zWnDwy8FNxV9aCWPpgHdjNbovEj9oU71hYGti0xcILu7GbEUmGGp8CEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7837
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

On Mon Nov 17, 2025 at 8:30 PM JST, Alice Ryhl wrote:
> Commit 38b7cc448a5b ("gpu: nova-core: implement Display for Spec") in
> drm-rust-next introduced some usage of the Display trait, but the
> Display trait is being modified in the rust tree this cycle. Thus, to
> avoid conflicts with the Rust tree, tweak how the formatting machinery
> is used in a way where it works both with and without the changes in the
> Rust tree.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Thanks, this solves the issue elegantly.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>

