Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAFCBC5B2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 04:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F24010E0F2;
	Mon, 15 Dec 2025 03:49:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kKD7h/8t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013035.outbound.protection.outlook.com
 [40.93.201.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9310E0F2;
 Mon, 15 Dec 2025 03:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SnjnjcvyR+0zduJ8MzXCjUuJrhA21hAfuEQNAOBdGZFeDoce3fWlUctlM4ItuFjo/B/ZckrU5QJZaXvmAnWLvvc2LOZ37C5aI4/OXwalRElPJf9OYpvlj4rPR/X2q4CBWsaykgTrSQ9IJvquygV4pt9LbKFjd3Lfbjudm2RuOBGekRBdemmkD7BSgsqZ5N0Jp1j6Og5TiYSTHgyVVjTYMc40bWhXy6RpD849U2jsMvNd68ilCvOSuMeMO1PPTvZ4AQL6uhgPYaqSsb/tf0luKeOqvqHbU8yqErLrcxwjNm6UpkNKzanf6iUUsbVdQXn3y8q5qy3YWBt1AFlhZHfPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhgPGa4BTh5ZQxhY3UhM4y7EhZjxxNJEaFaSnlVPjJc=;
 b=iyThWSqp7XtIWbZetthMvxnTDrJ5xEcjPsisWzSzxsMkyIp36C+mstQ65vuz/6frTLqZarBC83+MdGwtDCNNZ1D2FQDS+gKNbKU8y5S26JNF2aRv3zCG8V3vliwRno6pV7AysmJUssHg09HvnhKdsEjujLyRMhF1vbrOiA6+1LptyqxJ9gN/HWk4fhnI+41j79+4RlU32V/41oelFRPk2PufvF5gZKAOFV9zuE+Ot1YDnHKRSS8kbOxXJi1vhPP9GbDnwX7LauPlEpmgKqlhB/5V3oW/BPea3yUJamKjBYahr+kTQ3oWolx0qAWsZzbP9YvCkj1fUB0yaEreXdxh6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhgPGa4BTh5ZQxhY3UhM4y7EhZjxxNJEaFaSnlVPjJc=;
 b=kKD7h/8tSbjt5/tC/JS7DfGHjo90OKaiBdT1A8bX71DMxxi+9A140XlnG8mqBhoTvLS+LaqV73HKko3Q/zc+DBQnWcXlSjDXJWxlPtpHCY4TxVdyL/diteirfbzjh/rDquLGx/5N4kkByFaQGcCT5SBIiNwyLnjkTch+6mnlW8DaaoB8H1R6DFb3IvGtAx1voi3yCnshabGgNjEpXvIHHvDVdk5KPLmGv5Iei37mfMnsLuzBcMmFLPHaU8Hu9ta7TQumBUqoVWFDtzFgN3b35pdbeRLsZnQXvLEesxY8tBwVtJIR6LdEyGPWYDYyHqHpMMGGMsV8rA5O8bcSNJpnoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 03:49:02 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 03:49:01 +0000
Date: Mon, 15 Dec 2025 14:48:57 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Message-ID: <nja27dq5kk6jse3ldsay5epl7accyfmqd6lu4afmbhmtad4pxq@5hk4ehj4aiev>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
 <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
 <504C636B-FB96-4B54-B9CD-C506026CCDB1@nvidia.com>
 <25aa90a7-e9f4-471e-9d93-c61b9a7a429c@gmail.com>
 <lgncc2k5klyqxzlz52dzia5v5ly3nfnjbv5if6esniulruahnz@b5fc5bfyltny>
 <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B5724DA0-6031-4576-9B3D-DB67569711A2@nvidia.com>
X-ClientProxiedBy: SY6PR01CA0060.ausprd01.prod.outlook.com
 (2603:10c6:10:ea::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: ae231519-6e30-4687-4053-08de3b8ce2a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWZLQmJQVlZpKzRsS1ZQWjJ2bFNsZE4rWXVTWkpuTmpROTlRRy9WSUpGUDly?=
 =?utf-8?B?azRuanEyU0N4NmkzdFdIY0JYY1h6V2RGOEdob0R1VHVrS0lBNURzS1lEOWNj?=
 =?utf-8?B?elp6NTRXd3NHQjRjdC9MZGh4djhwS3FNUGZxSmRXVWdscUFxYmxtamgzb1My?=
 =?utf-8?B?VmFVamEzYmtmV2kzU25hODZBWlNCUXcxam1wZFRWNUxUckRjWk5ZR3kwbVE5?=
 =?utf-8?B?VkMwdzh3TWJ0Y1JjWDl6SmUrYlJhWTRjMGFyYkFoT05LL0xmSmc1MXJmNk1P?=
 =?utf-8?B?SW4wV0c2a2tsZC9vNmxKcC9DMDg0RXZ5SFhzbTFrdkhjVmtUcWptM3dUaWU1?=
 =?utf-8?B?Uy9OY1A4TTVra1d4Y29wVlhoZExWYVBWRmRXYXRDb3BRWWdOQkd0M3Ftc2JC?=
 =?utf-8?B?V0x5Nkw4T3pJdjVwUTlldWhqZlA3WGFWUVNVSEgxTm9zTTN2Vzd5bWZTTFFU?=
 =?utf-8?B?elZUYmg2V0h1RmE3Y1FhSk1Za0FhZzRwaVZ5RzFVaC9aOTA2aXZSWmR6dmJE?=
 =?utf-8?B?SjVLSFZsZGZwOVg3dTB3RTlsNFRhWGhURUJlZzlKUWdJSkhBeTVRMjF1RzEr?=
 =?utf-8?B?cjhMaGtDKys5djJLSzlOOEpaYjd3NWhvS2l3RC93dElqOVgzbFh0TFFvY3VD?=
 =?utf-8?B?MjVHMDJ5UklQZ05uSkgrUmtnUmRDM3ZPNGdLVUtBUVRMWVNBN0tTbDF4MTlJ?=
 =?utf-8?B?OVNLZ1Rza3pzUlRkWTk4Szd1cHo2WHpxUHR1N1pMdWY5US9GS0lRZ25JcUVG?=
 =?utf-8?B?YTBkMGd5dXNGKytIMnZ6RWdISUsrREpaQ0Q5UWh0R3k0S2lzQ2Y3MmpySDJi?=
 =?utf-8?B?RFlRbHdXV2tON2VHQ3RtdzBSSDh6Tmt3dFZzL1dZLzR1bkFsc1dNQUxSSU01?=
 =?utf-8?B?YmkwZitlVVJINnl6d2N5OEZlVTRFNWVvMHQ2S3hTT0VwbGowQmtjUk14Uklo?=
 =?utf-8?B?UDQwODVFSTNyakZnKzZHV0lvY1pwRnEzRVFhRTl5bFIwVDJuRGhsNjZ0ZlZU?=
 =?utf-8?B?c29jdHMwcWsxQ3hJS3hWUnpLcGFHaTlkNzgwa1ByZHlTTlhUTHR5Vmp2eWNw?=
 =?utf-8?B?MTd0NFRvMzdUWDNpSUVTV21KK0Y3d2I3WXR2Ti82ek5lRUE5Mkd5ZHZmZTlz?=
 =?utf-8?B?SFc0K0RTQVg0cEJtQy9qR09DZUdtSHVuQVJoaHQ4amhLZ0JRYmNucXR6WWZ5?=
 =?utf-8?B?MlE2ZGpueTBxZ2JnSkRaaU9qQ3FUeEFhanZCTm00NDdHdVVCdnFmbkNNbW5r?=
 =?utf-8?B?a3hJTy9Rd3dhT2xlUktETVcveGMyN0RvdVFxTzV0THp0L0xaZ0ZYd3hobXls?=
 =?utf-8?B?eG1PeExvTnMrMnRMZmkyWUlyNWhUQ0R1TzhuQWtxZW5sQWNNZGNJb2o4RVVs?=
 =?utf-8?B?eFRrRlpVVEdkOFhjNENsbUl6a21uUFhmdTlVTjgzb2VrUTVXRitwVkFvR2JG?=
 =?utf-8?B?bzhCaTcwK3RBNmVNZUIvWERBdGV4RnNEckxjUWEzU003M3dLbGd4d0QwbEpN?=
 =?utf-8?B?bkxERTZNZDlxc2pMZlJ3VGc1WVo1WllzRHk5MmFvWHVFZHNTZnNJdzJrSVVE?=
 =?utf-8?B?K1RzbU5EOXBuM3JOTSs0TkNMaFlQb2lubVlLMUZrWnc1SVhKNHg0K1Yxd2tW?=
 =?utf-8?B?OUNvV0gzRzlJUjk4bWZoaEthR0tXOGxvOUYxRmdaYngzdTFzcjQxcDZuWnRs?=
 =?utf-8?B?WW52TjlkeURFdTBnQWh6bXluTTdFS3N4MnNnK1VOSXdGM0QySStGWHcrTXF2?=
 =?utf-8?B?VzU5ZmZuSW9HVGNuc21aY1lrSnRBRkJlNkd2cGtmUHA5QWFDT2pTcmErdVRp?=
 =?utf-8?B?YzRUSldVUm9sM3ptaUdWN245QUVSY2Y3VERrSGVOemtQdXRSTWJZRzg4M251?=
 =?utf-8?B?QUpJQmZIUWl5KzFxMFZQZ0d2YkxvdjZwWmtiN0NHL0hoUlZ2RFZ5MkNWcklv?=
 =?utf-8?Q?55PRgOG6O+whxx4arkwT+RZW5IX70Jeb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ZZZ3pURitOWWFKa2V0c3ZHYWZYV2dDV3F6T0lyMVhyLzlURTdNRFNPSTBG?=
 =?utf-8?B?TFhFRklrNHBUdVZFNTdGQ0NrUWRPU0lNYVhOU0tycVdpT1R3QTJNdmtYV0hB?=
 =?utf-8?B?V3VIVUVySzNiMWVDMkFDdW1GRVN6UExJdTltdzE5MjJVSWEzZ0xlaHg0UWZ1?=
 =?utf-8?B?dFczTld1N3F4Uk5qY3k3eVY2bzQ2V2VhYk5CZXpsSHhRS3lSc0M3U0ltcHBr?=
 =?utf-8?B?bys5VnRSSmJaMjdaakhrL3p1MXdoT2dqbHAzWVduZnU5NkFWVlRFR3I5UmRS?=
 =?utf-8?B?RUh3WFZYYjhDdis5OWNSSGtBTU9BeEtMdURsN1hxcE1RaXlHY0JDUjlBTUZE?=
 =?utf-8?B?b3VUK0FMZ2xaL25EY1lPY3kzMlZlRjZUdWFSZUtFOFhSQ29kbzFTM05iQnVo?=
 =?utf-8?B?NFdnajhxcWtVb3c3aTV3aEppYm5zS2Z5dEJlMWV2WkdHdVRReElVTW9YcjBZ?=
 =?utf-8?B?WGVQNG1mM2xYRmZGQTAxRFhoRWdwMHZiNGwzdFdmb0JCbUZiak5Nd0dZdlZt?=
 =?utf-8?B?ckZtb2FQZy9DdWlDOVY0Q3Azd015bCtLK1BzZGtiU3d0ZW15RXdjdU11RXVL?=
 =?utf-8?B?RHRtYnl4aTIvYjlxTGNJVUdmM0VId283Zm5RLzl5bzlsaGlMSGczL2V1RHNB?=
 =?utf-8?B?MWFKN2VvZ1poU2lWM0cyRGE3YmZjRGR3cUtvUC9IaUUyMjdUckZTSnBPa1R3?=
 =?utf-8?B?dG5jRzBOTlR0VTNYb2h3blJlSm1vL3dzdG8rM2x3akFVYTBjd2VNYUQ1TFRy?=
 =?utf-8?B?S0xKdXFIVXIxcDZEemVUeFp3MWVlNE5xaUpLNE90RGxqeTZZRytPSEhGQXE0?=
 =?utf-8?B?QzFUV1FYaTJyVjI0YTAxZGthTTlEajhNWHlVeUdoa2ZDaGV3dUJEWS9sYXF3?=
 =?utf-8?B?M1NNMEJncXg3QThOUjNSeUhaWXZHSG1iWFN3N1VmUytxVEFqTUE3cExqZ2cw?=
 =?utf-8?B?VkNFQVB6Mmx1SSszVFliVXBHY010bEpNUnZkL1YzeHNWMmd5Vlh0T0VkcHg0?=
 =?utf-8?B?bHVHNk1Nb2hxc2dzM05UbjNaQktCbGsrUDllVHFpK0FMT3RUR2JwV0U1NGg3?=
 =?utf-8?B?c2VLdG1INkJNNm9BajczR0ZLNWg2STdnSFVXNlY4SGFxV2loclBnQ0h6N3BU?=
 =?utf-8?B?OXZBUWxnQ2kxcTE5dlY5L0UyQVdac2FpeG9QRkJOTy9TL2wvTnJ5TVhNbmZX?=
 =?utf-8?B?dUVGeTFEbGVLallNSXM4WllXdWM2NVh4NWxjK3F1QjdCWVg0MkZaR3FZUEcr?=
 =?utf-8?B?VkszSHBhUmdIK3lHekR5clVmWlZnRkl1endGQ0pldjVNNWhuVHJYNkE0aHE1?=
 =?utf-8?B?SWZSaWx5R3c5UHhLcERXQVVRaDd4NDQ1TUxuSDk3VmNNbjIzRGppYmhFTnVI?=
 =?utf-8?B?bVlOQnM2WGxGUnlYOFdPRGE1cjg4QjNxTU9JUTFGdkZYWW5SWFBDRHJjeGRQ?=
 =?utf-8?B?eDF1aTRiSzJwL2NORXdTSURySW1kYUZBSklQRW5yMDJYZEUwdEZiMlpQZ25V?=
 =?utf-8?B?RjBkMWl5eDJHSjl1SjdKaUhjQXZIdUpBeWZ6RlowY1FRbDI0Vk45djR0LzNj?=
 =?utf-8?B?UHo2OTJaM0YrRWY3TVRIZXFRTWQ5ZTZBZjlxMlRhOUV5UmtrSVVlb0w5Z1Z2?=
 =?utf-8?B?UEJMdlZXZTgxSVZieW53N2hlK2I5RlB0VGh2NWIxOW5BejAxY0xHT20vMWJG?=
 =?utf-8?B?UDc4TkpOU3pFMVVqVCtYa2xqNG1OWDdlQ0dsTnVtR0s2N0RBb2Ivc0N0WTF6?=
 =?utf-8?B?SklzMHlRaS90UXlJank1Qjk3azBxUGJZa1MxVG1ZOTFQWktYeG1qTTk2V1NU?=
 =?utf-8?B?SXlPNGpTcGZoK0ZudC85SlRKc2N5RXE1djFnQ3BOUU84SFRxR1J0dTgwRE5z?=
 =?utf-8?B?bTVXTzBMU0VEOFoxQkdJSThUVVdwNG9Pd0dDR2tsRjZBLzNuMG8vdm05YW1H?=
 =?utf-8?B?KzVpcGEreVdoVzlPY1JTZTZ2bWVLZG9tR1VwNFdaL0hFZTh4R3pGbXBLYmMx?=
 =?utf-8?B?NUplcmRUWjhwT3NvbjgvQ2lPTHB0NHhnSk9DT1BEMm00cVROSlNmQ2Q2bGwv?=
 =?utf-8?B?S2NLREJneXVxM0o4WGFvN0I1L3RkZTI2Wm11eWV5SWQvTEVWUDN0RDBBMEdm?=
 =?utf-8?Q?syjnayIq7pJexNEq/YdNYrI2M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae231519-6e30-4687-4053-08de3b8ce2a6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 03:49:01.8681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFl2U2lnDdTakz5EPjahfVxvnky85VvR3z4v4ODkMDZsUpyBPAstwMqPDCVd/xDmt84RoIftnJKfumv62dCAfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
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

On 2025-12-15 at 12:22 +1100, Joel Fernandes <joelagnelf@nvidia.com> wrote...
> Hi Alistair,
> 
> > On Dec 15, 2025, at 8:43 AM, Alistair Popple <apopple@nvidia.com> wrote:
> > 
> > ﻿On 2025-12-12 at 19:10 +1100, Dirk Behme <dirk.behme@gmail.com> wrote...
> >>> On 12.12.25 08:59, Joel Fernandes wrote:
> >>> Hi Alex,
> >>> 
> >>>> On Nov 22, 2025, at 12:00 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>>> 
> >>>> ﻿The size of messages' payload is miscalculated, leading to extra data
> >>>> passed to the message handler. While this is not a problem with our
> >>>> current set of commands, others with a variable-length payload may
> >>>> misbehave. Fix this.
> >>>> 
> >>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >>>> ---
> >>>> drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
> >>>> drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
> >>>> 2 files changed, 8 insertions(+), 5 deletions(-)
> >>>> 
> >>>> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> >>>> index 6f946d14868a..dab73377c526 100644
> >>>> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> >>>> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> >>>> @@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
> >>>>            header.length(),
> >>>>        );
> >>>> 
> >>>> +        // The length of the message that follows the header.
> >>>> +        let msg_length = header.length() - size_of::<GspMsgElement>();
> >>> 
> >>> Is this immune to under flow without one of the checked subtraction wrappers? Either way, we should not tolerate the underflow I think. Which means it can panic when the rust overflow checks are enabled. Since the header length comes from firmware, this cannot be guaranteed to not underflow in the event of a malformed message.
> > 
> > I think we're guaranteed not to underflow here - check out the implementation for header.length():
> > 
> >    /// Returns the total length of the message.
> >    pub(crate) fn length(&self) -> usize {
> >        // `rpc.length` includes the length of the GspRpcHeader but not the message header.
> >        size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
> >            + num::u32_as_usize(self.inner.rpc.length)
> >    }
> > 
> > So the above calculation expands to:
> > 
> > msg_length = size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()
> >            + num::u32_as_usize(self.inner.rpc.length) - size_of::<GspMsgElement>();
> > 
> > Where self.inner.rpc.length is guaranteed to be >= size_of::<rpc_message_header_v>() by the construction of the type.
> 
> But this length field is coming from the firmware, correct? The guarantee is provided by firmware, not by Rust code calculating the length.

Oh you're right - I had this around the wrong way, I forgot our constructors were only used for creating messages not receiving them. Obviously killing time reading mailing lists in airports is not such a good idea :-)

> Maybe Rust validating that the length matches, or is greater than or equal to, the message header would be one way to avoid doing the checked subtraction. I would still be comfortable doing the checked subtraction in case the firmware payload in the message buffer is corrupted and the length field is corrupted.
> 
> I think Rust cannot trust fields coming from the firmware and needs to check them to prevent undefined behavior. Or maybe the policy is to include safety comments, like we do when expecting C code to behave in a certain way. I do not know. But we should identify the policy for this and stick to it for future such issues.
> 
> I think one way to verify that there is a Rust guarantee about the length field is to do the unchecked subtraction, compile the code, and then see if the generated code has any panics in it (With the overflow checking config enabled.)
> 
> If it does, then dead code elimination could not determine at compile time that the subtraction would not overflow. Right?

Agreed. Whilst we can't avoid needing to trust the firmware at some level crashing the kernel in response to a bad message would be bad and make debugging it a pain.

> > 
> >> Would this be a possible use case for the untrusted data proposal
> >> 
> >> https://lwn.net/Articles/1034603/
> >> 
> >> ?
> > 
> > Responding here because Joel appears to have sent a HTML only response ;-)
> 
> Sorry. :)
> 
> > 
> > I agree with Joel's points - this does sound useful but as a separate project.
> > I'd imagine we'd want to it one layer lower though - ie. in the construction of
> > the GspMsgElement.

So I guess we'd need our own implementation of a from_bytes trait or some such that would also validate the fields when deserialising the struct.

> Agreed, thanks.
> 
>  - Joel 
> 
> 
> 
> > 
> >> Cheers
> >> 
> >> Dirk
