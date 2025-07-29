Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A73B14EA5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 15:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BBF10E17A;
	Tue, 29 Jul 2025 13:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CSUNQWNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319F10E17A;
 Tue, 29 Jul 2025 13:47:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnHf1zWy2AQuN/Q2tjY3vhKgYx50YggRd5ZDz7uUq8Lk6quFSQSPnrBfBHhenDmLalt3Tr+060Kf2J5b6LDWaDawgA0MUzndHhXbTFfYzm8NgLKJ6ZIlmbzxpdSH6UoLCZgxcuFypw6k/Yse10guekvDxQq8HpD5eA5NbIkyWZ57r4iN3MWoa8sfOCW6f41IEhVxkLAHk7aJN69+DlIigIwaeeJcOaE3W4mFdkDClGbqStuENE4w9fk6n75igx4/7I3y+xskqg90qsBrzdmZtGThggKDH3gqRW6S2H/tlRQIlDyEIYnXSOF4rE7lS4BfejYXWJPjEEFbhw5Tz+BLlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j10m2l2LPq36TL66Xa9pbRKRiaUSLcH+KXabhNWzeeo=;
 b=j3dWMbpLCuTm+fPKXKbQzYGkCvKVNdg3Zte4q/CEM79FMHjOQBxLqEf/e5JUrv/8IiW/3fudmakjYkse9ynmVY9AmK74D8JJgvPTwgum3iK5EsXvW5YzHARWscDXpDmFUetLeXIJ9ts2EuGEA6UHEfMsWfaryl0dZCiMVzFVn+5O0lRFnqzgcNFrsFPCJaXS4k74aVriN0pHNt/J19Qzf5nAVL62YCl7B7xD5uAvGVzI9A79ih3EtOUV4riOJVuhkQuyj+Lm1OOY5oVI2t/bLD58u6F4giN9Ve7NzRD9grFQGGSeSo5eaOIlB1GEA16Q6uLNwPKuXjsEoaY6icMayw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j10m2l2LPq36TL66Xa9pbRKRiaUSLcH+KXabhNWzeeo=;
 b=CSUNQWNNnNVG86zf4zsUABBNyycu3WTmM9khvjAm2vD2j2fBy6rJJ8mTQWHVf0wuFUofWlMIss+EkWzGCzAB3Mna08K1QCVoK/RSQXmQsUVvEkBK4c3h/6JeOnK5FBVtg00SkKWAiSFjjz7b4/sHWjoi+ao473qHHeHQu666Jb57YX4n9o+3VRSVyVUfAJzlAIKMzATw86Bg6suUkCHVJtnhrq4Nh+fDfW0J60SONno+//befJlrlWI1KKPgtHvipGSivGLCyD8gJvQbMRqlYypwIytgYAfMh1OqswYYvsBJhtUMasKA9cB4zAMUaynSQtNx6hay+scSLoQ/7Wa/0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 13:47:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 13:47:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Jul 2025 22:47:28 +0900
Message-Id: <DBOL3HSE1OUW.22PGYP5T6164C@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 01/19] gpu: nova-core: register: minor grammar and
 spelling fixes
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Steven Price" <steven.price@arm.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <20250718-nova-regs-v2-1-7b6a762aa1cd@nvidia.com>
 <B1AA6359-7854-4284-B533-F5CA3C18AF34@collabora.com>
 <DBNF8SZWLI79.1NRX9AMW5QW45@nvidia.com>
 <d0ffb55b-690a-4a65-98b5-b83adebfd88b@arm.com>
 <DBNNTU14VH90.25AZCJSVT4JDR@nvidia.com>
 <ce8b4bd9-5122-4b85-b605-a1bf10556208@arm.com>
In-Reply-To: <ce8b4bd9-5122-4b85-b605-a1bf10556208@arm.com>
X-ClientProxiedBy: TYCP286CA0059.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CYYPR12MB8871:EE_
X-MS-Office365-Filtering-Correlation-Id: 6742087c-73d4-417d-0a2b-08ddcea67849
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlB1Rnl3bGlIRmZkZU1Qd1g1NytGc1oyRG9VUkpPdGNYdU1GZUEyQ2EwZDh4?=
 =?utf-8?B?MnczYlNoYlZEb1A0c2lEUUJGdkZKeUJuMTU3bmJTZFJhMCs4WjJqSzRPcS85?=
 =?utf-8?B?RGJwdWhqMlZsbGZmSnlRVmUwQ2N3VlFsY1RlL1loaHJiMlRmZDc2dlc1Yjl1?=
 =?utf-8?B?YUtaWDMyb0I3L0NHaC85RkFoUTh6Y0FneEx5bjY4c0lTVjBiNm8rS3lCN0FW?=
 =?utf-8?B?anRaTUhNT0Y0MmVoWXNsZWxFU1BPd0JsRGZoNWxaUjl4d2ZiSklIQnk1L3VM?=
 =?utf-8?B?aTN5KzhKbWw3cE5mY3J0OFJyRS80QjdKQWJBSzlpemM5aEJuVDg0MnN5aWcw?=
 =?utf-8?B?R0paNHFhbG5zYXhYK0NLUzZ5enEzQ1ZqYUFWMU5XMWlDWU1XelY5VUhDUUdq?=
 =?utf-8?B?NzdkVCt5cjREOU55NDdDVkp0OERBdklrcm9GZ25aM1BWTHA3V3YycElJdnNE?=
 =?utf-8?B?ekhRWVBBZFRFczRrSUVsS29PdlNEdy9YMzY1eFRIVGVEWTZQanJ3d1lrU3Yy?=
 =?utf-8?B?UjY1SkJwdXdCbzBTSW1aSVo4b2tFRGFyRGc1UnlVaUVSZDRGazJnQks1N3Zi?=
 =?utf-8?B?VzVwNEhRdW5DZDFyYXRxVlhncWVDV1pOd3BsYTNqbXRCMTZCMlB4aHZneU8r?=
 =?utf-8?B?N3RJTERLYXFpYXlUSFZtaktsWGdIbmJSSG9wUVFLVjFRT0Q5enBIcDMxREpN?=
 =?utf-8?B?NFcxRitUWC9mMmxTY1JHNVVQRUwxcVl1ZlpISFFhKzFvVi9ZWmdIMXRyaHNU?=
 =?utf-8?B?TGZHR1ZjejNCSnFpOStOdXdmWnVnUmdhQ2JGSDFJT3BOLy96RkNVQlh3TXQ5?=
 =?utf-8?B?TjVDUUhyRGx6M0RhQkwzdlFTYXkvSy9EMk0vWXY3Sm9WR3lKWm9vaXpBaUY3?=
 =?utf-8?B?YXk4U2NFemVKOVN3Y0FEcVNXeHRDRzlYOHlEVjBTc2RKSVBrQXZiY2JCWHg0?=
 =?utf-8?B?cUFNYzBtMmFFaWtGNHVIUFdqNytsRWdwUjdmNTNUQ0RWZkMwaWtnNWc3SDBm?=
 =?utf-8?B?bTd3azNiUHAwcWpJQWtqMlVhaGFjTE9TdHdkWUJvMHRMRENIeit0azArclhi?=
 =?utf-8?B?UTNCYTBkN0Z6bzU3cUdJMzFHY1lIM0NweXZ5SWs2dk5BYzZrZGpyUk1HOXZk?=
 =?utf-8?B?ZzdzSk54ZmZub1VqOFNVcDYxajZBQUVLanJETE9TajZMcGl3SW1pK3VPSytE?=
 =?utf-8?B?Y1RRZUEyejBOVldkRVorRmlWRXNEdE1HZWtLcEVxZDRobU5iem5XK2JsK1lM?=
 =?utf-8?B?Kzg5ZHJoK280K0ZOaWJqTW5ERDlRWEoyZE5lMWtUUjVJQ0lSaFNsWlFaUGlH?=
 =?utf-8?B?RTVEYkZ6TTNtdkc1T1p4VHY4WURnSWdoMWpqWEc5MjNEQ2QvUjNOc0srNzJj?=
 =?utf-8?B?Qm92NFNRNGVJK1VLTHVpdnF5K1d1Wm5Dc243YzMvbkxnZHdOeGhHaEFLTFdU?=
 =?utf-8?B?Q1FLaXJzTU5LaGVldDc4ZzhEbUxqYkVBWXB3ZkxpVDNsWUgrdGZSNS9RdkZi?=
 =?utf-8?B?OE0rVERjdk1hUTZkQXBDSGt6dkwwcmlhcVdTK2pkTXdiMEx2N2lwZktkSldN?=
 =?utf-8?B?K3N4QmJ5K1dHaVZyOHIwMlAxTGlQNDk4SjIrNjZuYTlEUU51ZzB0S2xLcXN0?=
 =?utf-8?B?YTlUTXBNUGxGS0ZSbi9oNmZNV2hHK3NQamE0SjVKc3ZjVkFMYmF1bDcrZmpD?=
 =?utf-8?B?MlNrbGtFUUY5VURUTDQ3R2ZxbVRWeVl4SUVJM3FNbDVwUi9pUzJORDZSWVpN?=
 =?utf-8?B?TnJHZzZ4dFhPSFgvek8wSFdRNmovMnA3V3c4Znh0TUQzU3NINytXbkg3aG5h?=
 =?utf-8?B?K05ad2pIay9hUE5xK0FPeklvZCtkM1kwUXdMaHZaYnIrYW42TWxoNk9rUVNs?=
 =?utf-8?B?M1p3Vkp5Z3FsOHpxUGNQTXVkZndadXNMZkZhNkdGOGNBM2ZEdmJ4MmJ6SGJ5?=
 =?utf-8?Q?Gn/hWMaqOMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzBjVzRRWEd0cUhGLzBvbFBEd0lLbmU3RkYwSHF0U3VpSG1zbGlKVThPa1Vs?=
 =?utf-8?B?c3A0MUQxOFQvVUdXa2JhRDFkK3RybU5rZlBSOFk5aENObDMxc3p6Z0hQeFc2?=
 =?utf-8?B?Ly9VSXZQbnI2NWxOVlJzcGdhalQ0UFNkb3Qva0hCUExOUnpCUTBvUVJEcFQ1?=
 =?utf-8?B?OG9OLzVGTml2b0pJWlZTSG90akJBckRYRHBERlhQOE1DeEFGZE1PWWt5aEli?=
 =?utf-8?B?UXJaZm5QWHh4NHJFbWpjckdEZjlnSGZHN2xsb1lodUYyRlRoc1V1TmZOMmJp?=
 =?utf-8?B?NUpLdFg1bFRFYzNHdW5SdlNIanI0NEo0dDNtTVVPdUdOMkpCOTlzTWhPT1Bn?=
 =?utf-8?B?N29COHdxbE5VVnRsWWJFbStRRXhRK1pkU01rNjlHcEp5U240d0JtWlZ6VmZ3?=
 =?utf-8?B?WVMwMVZ5aVhaZjhNbDFnVzNyTUNMOHF6TTMvN0dPRFJQVmY4VGNlSFRqdXdE?=
 =?utf-8?B?SjhsR1g2dGZrRHZaOThRUjYvNFhleFpUU01yQmxvb0RyN250RmxxSVQwcU5X?=
 =?utf-8?B?U3k3RFFDeCttVlhaOW5JVTA4MlBxd21GUk80K0ZsV2dHMjRtbHVVY2lOOVNy?=
 =?utf-8?B?ZVJTNGM2UWtsVzY1MkNXREVBTUtDNTF2OFBydk8rRU1TNTk5WmUxeHlmZHd4?=
 =?utf-8?B?L1FqWU1wV3RvSXVLR3Qzb0J4ekcxZXVjUFVLTVYwTkFEbEw4YnFwNlEvMUFC?=
 =?utf-8?B?WDlvU1gxYU9mSXAwa09YOWhmRjFtbWhsdEtBaHhvc3ZxWllhOTgrcUcvRnN3?=
 =?utf-8?B?QjZQdHI3VWRnSGpIeW56Q05RMmgzT25BZ3E2VVdUSGhrWU4wZ0F2a044allo?=
 =?utf-8?B?WHEvSStBOVduRkY2OXREakIxR0NFT0FUY1gvQ2NaejVTTkQ2YUFDekFGTWNT?=
 =?utf-8?B?QzI4d25xSVk0N1N0MFdTb0gvQ3A4ajFnaTBhZE1UbHFtMEUwaXZLUEVFeWFW?=
 =?utf-8?B?ZnluT0NZODFMRCtEd05UU2ZidDhTQy94RDFiRG1keVgvNC9GNnVJQ1JxTms3?=
 =?utf-8?B?TERpTHRwbjFBRUdDeUpqazBZTmVWVzFjd0VJWEgvdUIvUjhrcm9VVnlmQWdQ?=
 =?utf-8?B?VUwyNEp3dWRKeFNBSEtob1FxdjVzZ040Q0J0ZGtscEU1anlNYTV3cEV3c2Nl?=
 =?utf-8?B?bnE1SzVGYktGSVpiVnVWSllURTZaamVHaTRPaXJVUjRTT2Q4Ry9sRWlSNFBZ?=
 =?utf-8?B?T0s0d3BKS08rUGlBRDBybjQ2K0VLVHg5RHlEZjFJQ2hSQitYSGR4MUdVeWdU?=
 =?utf-8?B?a1Q4aW84a0FSdnFGaldkSjY4d3hvWG1ZTzBRakl3YVY0MVpiVXptVHhCMnNs?=
 =?utf-8?B?cGF4SWxmY2dTeXdUNWo3WDRuektTcUZOQ0JHWXlyaGpPMzZzSWd0djg4c1B6?=
 =?utf-8?B?VUhQSk4ycjFUZUtBMTJJeVBlRHBtMlVWS0dvcEJyWW9rd20wcDZEMDJqQmNx?=
 =?utf-8?B?ZXgyclU4c3prN3dNNDBlQnpXajVWNVpVbURVRXgzUGFLUG9Ia282K1BaYk1D?=
 =?utf-8?B?R2VSSk1Mcy9qSzJjWTcrMkRPRUlZbWNUNUg0NDYxNXhnNGVOY0cvTFNWeWtY?=
 =?utf-8?B?a3pJQmFaVmF3b0UwVWpsdzhRR1dKTEtPZ0dnY1VsUGxCS1psRituYWNNUXhz?=
 =?utf-8?B?cDk4WmZUa1ArRHVqVUpRVEpBRGxNWVloZmIwR1pzYnhhajZMUjIrK200amdR?=
 =?utf-8?B?OGZDMzk1Q2h3eFo4RnQzV3g4bzJ2YUNQWDN4NHdBclMwVVM1Z0dzcWZiRG9X?=
 =?utf-8?B?NVZnMnpIdm9rTlQ3enZTZVhxNlNDeFM5c215QnArM0NYQmZDNjNYdWpacDBy?=
 =?utf-8?B?KzVReGExM2JTaEFzNVpna2xqZGVVVjFDQUZNNkg1UGhMcWlIV1F2MDlYOUVq?=
 =?utf-8?B?eGRZU0VsRE1TZllOZCt3YUk4ZXpTTW1reWhveE9QS1dzTzdRV1d4T1Yzd0ow?=
 =?utf-8?B?bVp2NDQzaE1uQVlXUFY5RmdRUkxhVUFTbVI2SmhGbityQnAxSHl0VlBIVGhE?=
 =?utf-8?B?U1V5cTc4d1FZcG1SZjR3bE5HN0FDdzdTSHBYa0w4cU5haERmVFF2TllSQ2tr?=
 =?utf-8?B?WE84UkN6ZkpKTHIvU3NOYmM0bnY2dnZlcXE4MzFiNUJLUng4NFg3T2drNzMz?=
 =?utf-8?B?dkprcjV0VjFNN2JaRlpNbzhNZzZ4NWlSR3MydnRTMmJHVUV0R3l0OUtqcFdr?=
 =?utf-8?Q?TgmHhlT6suREu6CMHMRfgjM7S9qG88/r7gdH4HlhC5s0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6742087c-73d4-417d-0a2b-08ddcea67849
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 13:47:33.7886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1OjOmHDnSiW9l59FZEDhlO+xae8S6CWnXvWIPCh06e+dRmkU91+ALR30EKVpKYLNTHfUsXYxTcxvgQxG9PZcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871
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

On Mon Jul 28, 2025 at 10:25 PM JST, Steven Price wrote:
> On 28/07/2025 12:43, Alexandre Courbot wrote:
>> On Mon Jul 28, 2025 at 4:51 PM JST, Steven Price wrote:
>>> On 28/07/2025 05:59, Alexandre Courbot wrote:
>>>> Hi Daniel, thanks for the review!
>>>>
>>>> On Sat Jul 26, 2025 at 1:14 AM JST, Daniel Almeida wrote:
>>>>> Hi Alex. Thank you and John for working on this in general. It will b=
e useful
>>>>> for the whole ecosystem! :)=20
>>>>>
>>>>>> On 18 Jul 2025, at 04:26, Alexandre Courbot <acourbot@nvidia.com> wr=
ote:
>>>>>>
>>>>>> From: John Hubbard <jhubbard@nvidia.com>
>>>>>>
>>>>>> There is only one top-level macro in this file at the moment, but th=
e
>>>>>> "macros.rs" file name allows for more. Change the wording so that it
>>>>>> will remain valid even if additional macros are added to the file.
>>>>>>
>>>>>> Fix a couple of spelling errors and grammatical errors, and break up=
 a
>>>>>> run-on sentence, for clarity.
>>>>>>
>>>>>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>>>> ---
>>>>>> drivers/gpu/nova-core/regs/macros.rs | 14 +++++++-------
>>>>>> 1 file changed, 7 insertions(+), 7 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova=
-core/regs/macros.rs
>>>>>> index cdf668073480ed703c89ffa8628f5c9de6494687..864d1e83bed2979f5661=
e038f4c9fd87d33f69a7 100644
>>>>>> --- a/drivers/gpu/nova-core/regs/macros.rs
>>>>>> +++ b/drivers/gpu/nova-core/regs/macros.rs
>>>>>> @@ -1,17 +1,17 @@
>>>>>> // SPDX-License-Identifier: GPL-2.0
>>>>>>
>>>>>> -//! Macro to define register layout and accessors.
>>>>>> +//! `register!` macro to define register layout and accessors.
>>>>>
>>>>> I would have kept this line as-is. Users will most likely know the na=
me of the
>>>>> macro already. At this point, they will be looking for what it does, =
so
>>>>> mentioning "register" here is a bit redundant IMHO.
>>>>>
>>>>>> //!
>>>>>> //! A single register typically includes several fields, which are a=
ccessed through a combination
>>>>>> //! of bit-shift and mask operations that introduce a class of poten=
tial mistakes, notably because
>>>>>> //! not all possible field values are necessarily valid.
>>>>>> //!
>>>>>> -//! The macro in this module allow to define, using an intruitive a=
nd readable syntax, a dedicated
>>>>>> -//! type for each register with its own field accessors that can re=
turn an error is a field's value
>>>>>> -//! is invalid.
>>>>>> +//! The `register!` macro in this module provides an intuitive and =
readable syntax for defining a
>>>>>> +//! dedicated type for each register. Each such type comes with its=
 own field accessors that can
>>>>>> +//! return an error if a field's value is invalid.
>>>>>>
>>>>>> -/// Defines a dedicated type for a register with an absolute offset=
, alongside with getter and
>>>>>> -/// setter methods for its fields and methods to read and write it =
from an `Io` region.
>>>>>> +/// Defines a dedicated type for a register with an absolute offset=
, including getter and setter
>>>>>> +/// methods for its fields and methods to read and write it from an=
 `Io` region.
>>>>>
>>>>> +cc Steven Price,
>>>>>
>>>>> Sorry for hijacking this patch, but I think that we should be more fl=
exible and
>>>>> allow for non-literal offsets in the macro.
>>>>>
>>>>> In Tyr, for example, some of the offsets need to be computed at runti=
me, i.e.:
>>>>>
>>>>> +pub(crate) struct AsRegister(usize);
>>>>> +
>>>>> +impl AsRegister {
>>>>> +    fn new(as_nr: usize, offset: usize) -> Result<Self> {
>>>>> +        if as_nr >=3D 32 {
>>>>> +            Err(EINVAL)
>>>>> +        } else {
>>>>> +            Ok(AsRegister(mmu_as(as_nr) + offset))
>>>>> +        }
>>>>> +    }
>>>>>
>>>>> Or:
>>>>>
>>>>> +pub(crate) struct Doorbell(usize);
>>>>> +
>>>>> +impl Doorbell {
>>>>> +    pub(crate) fn new(doorbell_id: usize) -> Self {
>>>>> +        Doorbell(0x80000 + (doorbell_id * 0x10000))
>>>>> +    }
>>>>>
>>>>> I don't think this will work with the current macro, JFYI.
>>>>
>>>> IIUC from the comments on the next patches, your need is covered with
>>>> the relative and array registers definitions, is that correct?
>>>
>>> My Rust is somewhat shaky, but I believe "non-contiguous register=20
>>> arrays" will do what we want. Although I'll admit it would be neater fo=
r=20
>>> the likes of the AS registers if there was a way to define a "block" of=
=20
>>> registers and then use an array of blocks. Something vaguely like this=
=20
>>> (excuse the poor Rust):
>>>
>>> register_block!(MMU_AS_CONTROL @ 0x2400[16 ; 64], "MMU Address Space re=
gisters" {
>>> 	register!(TRANSTAB @ 0x0000, "Translation table base address" {
>>> 		31:0	base as u32;
>>> 	});
>>> 	register!(MEMATTR @ 0x0008, "Memory attributes" {
>>> 		7:0	attr0 as u8;
>>> 		7:0	attr1 as u8;
>>> 		// ...
>>> 	});
>>> 	// More registers
>>> });
>>=20
>> I can think of two ways to achieve something similar using the current
>> patchset:
>>=20
>> - As you mentioned, a set of non-contiguous register arrays. This should
>>   work rather well, as you could just do
>>   `MMU_AS_CONTROL_MEMATTR::read(bar, 4)` to read the `MMU_AS_CONTROL_MEM=
ATTR`
>>   register of the 5th instance, with compile-time bound validation. It's
>>   not what register arrays are for originally, but it does the job.
>
> Sadly we generally don't want a compile time index - the whole point is
> that each address space is functionally the same, so the index (address
> space ID) is going to be dynamic in the code. The disadvantage here is
> that every register access will involve a bounds check - the compiler
> might be able to optimise but the code will still have to deal with a
> potential error from every access.

If you can somehow constrain the index to the range that is declared for
the register (by checking the bounds beforehand), then the compiler
should be able to work with the non-try accessors. Actually that's what
[1] does: `ucode_idx` is checked for being in the
`1..=3DNV_FUSE_OPT_FPF_SIZE` range, which allows us to use the
compile-time validated `read` method.

[1] https://lore.kernel.org/rust-for-linux/20250718-nova-regs-v2-18-7b6a762=
aa1cd@nvidia.com/

>
>> - As a set of relative offset registers sharing the same group. This is
>>   more in line with the idea of a register block, but it also means that
>>   each instance needs to have its own type declared, which is a bit
>>   cumbersome but can be mitigated with a macro. More inconvenient if the
>>   fact that you cannot address using a simple number anymore...
>
> Yeah this does sound cumbersome. Would you end up with a macro
> duplicating the code 16 times (once for each type of the 16 register
> blocks) and hoping the compiler can optimise it all back together?

Yeah, this relying on the type system I don't expect the compiler to be
able to optimize this away, so that's probably not the best idea for
your use-case.

>
>> The idea of register blocks is interesting. I wonder how that would
>> translate in terms of access to invididual registers, i.e. does the
>> block end up just being a prefix into the full register name, or is it
>> something else? From your example declaration I picture that accesses
>> would look something like `MMU_AS_CONTROL[4]::MEMATTR::read(bar)`, which
>> ngl looks great, but I also cannot think of a construct that would allow
>> such a syntax... Happy to think more about it though.
>
> Yes, that is the sort of syntax I was imagining, although I was hoping
> you could do something like:
>
>   let as =3D MMU_AS_CONTROL[as_id]::try_get(&bar)?;
>
>   let memattr =3D as.MEMATTR.read(&bar);
>   memattr.set_attr0(3).write(&bar);
>   as.TRANSTAB.write(&bar, 0x1000);
>
> Which I'm sure shows how little Rust I've written, but hopefully you get
> the idea - only the first line is a try_xxx which can fail and takes the
> address space ID from a variable and bounds checks it. The other
> accesses we already know the bounds so there's no need to deal with
> failure, and we don't have to consider the situation where MEMATTR is
> written but the TRANSTAB write fails (which couldn't actually happen
> with non-contiguous register arrays but the compiler wouldn't be able to
> tell).

That for sure looks elegant. Now the question is how can we implement
something similar using only ZSTs? `MMU_AS_CONTROL` would have to be a
static array. Then `as` needs to be some sort of struct?

The way this works looks very similar to what I suggested above with
register arrays and validating once that a given index is valid for the
register array accesses. Then the non-try accessors can be used, knowing
that the compiler will be able to infer that the index is valid. The
only drawback being that each `read` and `write` will have to carry the
`as_id`.

This would work, but if someone wants to experiment to try and implement
something closer to the interface you proposed, I'm very open to the
idea. I wonder if we could do this without any runtime overhead...

>
> [And of course having written the above I realise that MEMATTR being
> split up as separate named fields is also broken - we want to generate
> it by looping over the fields.]

I don't understand what this means. :)

