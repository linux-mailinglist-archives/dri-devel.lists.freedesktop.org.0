Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51241CCE60E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 04:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49B510EB02;
	Fri, 19 Dec 2025 03:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uc6t1Ywb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010071.outbound.protection.outlook.com [52.101.85.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEE910EB02;
 Fri, 19 Dec 2025 03:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bUT06OQJhnTFewojF8Bg6CIZ1zEvQVF31Ms1OMhgWwWBHsnqUJGY6yvh6wJ26utNumd52LfZvGZTZxM6f2bUOmEu4BhLvMeNlYDqivhEpJh1rO5u3tDgp6zQoNDWu/v+g/PJ4VtvmxQeNBw2n8qAe1jsA2Bzg4lVQy7uOtmPOADdr1k8ho2vBXWKU4r9+sD/TC4GJJkv47xopiAXstLoZgJdy10hmUW0YsHzOhxTWWFlPcfi69LDxzhgkZkExfwDQGLcs3jENPrrZ+aEkkbHdLZ1dcS4raB3A1mB+A+JBpjfe/2EDcIszM5SvX7n2NsJsUO4jBmNtxNJVOi8T2QWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGXm/4t/QwBRzD2AUBQZynXOE1Va32Zrb67JJ/2Pkvg=;
 b=S9iWdzgy+5OKbDEnHFkyWeh/Er7rE1f6j5Ea/VILAuAoJb7l7GpMy7GDAMYgFu26m0CKiW6DtC7mnle9wk/8bThTtII+3kG85gnBBXB9DEQtKi7rbFlsBlLBiKliebG39VV3Wvf8vlf/MuJ12hOYSRjes4lwwLY2346FOKiaaJtnumt0L7jL2GB4eJ/Z6QVI5otcXWnFJQ6VyhkWAjkF7rXXEE/KCxxPjzxRb0R1ag1uGTSrmoCc2+smTqnvUO2sSBinsa24lH9Tggsda5zNKtd/Lfcb6mLBLxdy4R7fekadC2uKiNp1OEYAK33yYxT+x5UTceU/pT2HqKDK3DEJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGXm/4t/QwBRzD2AUBQZynXOE1Va32Zrb67JJ/2Pkvg=;
 b=Uc6t1Ywb0QVThZ8fiwdulyUkzVhJITl9TbO7CtJR/Cnn6yHu1NzqF0ns/8Kb8VQRNE8zXHYwQxLRHifozX7WsQeoz4NBGRrS6Xpk1fKYMoq2Mp/TU59ppTeoKPZ9aPLn6g54pxMLTfZGqY98k6I5G6KnlZFAjjL1ozbbi359WNxPYKwWs9bq/p+qZl8vXkLTrCIZxQarjXzZW16Eql9FewdOhP5V+jq/V8SunL4IfS2HIMuM4hr5c30Cavh5NPBXsZiU+EJ8FjdYiU1Y6fQW00tNBDqH8fetTF1kUGgKLhCkv5k5pkNFPHjgMOXKCw+ZeTtVph4GQa8SfNoU9fq74A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 03:39:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 03:39:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 12:39:47 +0900
Message-Id: <DF1VQ45KF0JL.3E3GIL93DGBWL@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "kwilczynski@kernel.org"
 <kwilczynski@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
In-Reply-To: <1369611d0014a4e5b630462d66790939b0f564c0.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4466:EE_
X-MS-Office365-Filtering-Correlation-Id: fb98356f-903f-4f12-c41f-08de3eb043e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDFxSjlGZ3NsalcrYXZ0a29iaDlmUUNlNE0waHBGclducHN2ajhpRjV6YkJt?=
 =?utf-8?B?QXJxRmJacW5QRGpaU2ZKUmpoSnVBc0k4RWowemVmYStRa0d4NFhnVzk4aU9m?=
 =?utf-8?B?SGFodmExZXVpb2h0dmZQaUh1NTlKVnh5cFZNc3gwZmM4R2RYOWdYWVV5Rkhn?=
 =?utf-8?B?MndDYVBINUNqbjFWM1pGcmFiWGFOcTJLSzNWWkF1OXFHNGJkbytvOU1KZlM1?=
 =?utf-8?B?UURBLzM0STNMMGExZW1nZHR2aGptaGJMV2FJTWpYL2xiR3lqc0ZIVzcrZWdD?=
 =?utf-8?B?SjJQb1hZUHp6eHdoeFNIcHpSWVpTckZycTJZeFhGU2tVbnlLMEFBWk1xMERu?=
 =?utf-8?B?STlHOHZGTDB0Q0E4U2dkaXZsbko3bHk5OWgwS1pZTWdidTFYbmZPMVI1cG1H?=
 =?utf-8?B?ZmNKOXpPd1NPZFlkZ2o4VUExanM2dDZxR3cwU05VekdDVjEyV3FpUDBXYzRY?=
 =?utf-8?B?NFdwM3FNYnFGeEhmK3hIejNQTHhhMlpTVGxyVlNOWStwUGtIY2puT2J6SGxp?=
 =?utf-8?B?MGtYaWM1S1h1TmRnNUF1MWhMZmdkeEhlc09oMEhtU2I1dktHOFhvSDlNU2JW?=
 =?utf-8?B?b2kwd1JHdVpySlQ0RHUzREtlbjE2VjM1S3RoSmVieVNmNE1NRm9BWWdUYWtj?=
 =?utf-8?B?eUpXSWNhL0lBQVNOWFI3dS9GV2lqVzVTSDFZWXZiU0djK0JYTnVPZ0t0YWhC?=
 =?utf-8?B?bmpXVlhYSmJOMk0yTW1pazNUNmVjRlRSMlpDdkxHQkVTNzhVb3VTbUZJbW5m?=
 =?utf-8?B?WUlZbXQ5cnNkRyt4Z1pRTnh5R3JVOFdHT25KaFI0bTRCV0xRcjNkTGMvS1oy?=
 =?utf-8?B?c3VRWlR0YkRhNVlmTG5MeHhtZEpVcG1xNW4yazBjK1pIS1VSa01EZmZ5YnhV?=
 =?utf-8?B?ZmJycUdLRUFMOGFFYkJYemVkTFUwMEhwMHJGdkhTeXJFRUVYRlRmYnpKQU1W?=
 =?utf-8?B?WFlEamt4Ukpwb01GcGRsYlg4ZjRmcTBsUk5RK0NjanV5TFJlMEhkODFudUJE?=
 =?utf-8?B?ejJOYTlNZ0x5NDZ2ZUtCY3RIREllWTFyd2ZMaXFGaDBHeUFYYXRWbXNQcGJw?=
 =?utf-8?B?dTNzYUFzQUZEc0RsRXB0MFpabWdUVmhiVjVkOWhxeVpyTVMxZy81YlVmVWpG?=
 =?utf-8?B?b2ZSaWR3dUhVZjBRa3NXZFdjcHRBL3ZsKzAzOWZ5OHBzZGdkajRQQUUxQXV1?=
 =?utf-8?B?QWMvV24rTUJ1L1c4SVBITW1BZ1A0Wk45YVErdzEreHVKQWREQmdFVTF6YUt0?=
 =?utf-8?B?enRGVXllTkhGSis1QlVQclhZY0REWW9Fdi9VRld4MkRxMk1PeEFIRkN5SDhr?=
 =?utf-8?B?NW85bitmTmhsTzVaeWRWTnZZTHkvcmhHTWw2bnp0STlSTnkxTkQvYW55dU1v?=
 =?utf-8?B?N1JNN3FqK0tjN29DQmNIb0JiUGY3eTlyRERBMEJMeVA2THRvd2Y0SC9idC9J?=
 =?utf-8?B?azQwbWNKWlprcnFFSmVmV041blVGUVJtay9FRWZwRm1FWmFZWmtTL1gxYkd1?=
 =?utf-8?B?aWE1Q3NUZnYwRFBBd2hWWk5BTmNPVk5MR3hDQzl0N2hkTHBwaFZDOHVjV2ZT?=
 =?utf-8?B?NGptSCtjM3pCbVY2WnROL2VRWnJCZ1J5c0NZbDBVclZkU2lGVU10Z0pnK1hy?=
 =?utf-8?B?VTkzRXEwRlVmeER0bGNqOGhkT1JIUk45VzVoTWtFakRtSEEzQjA5WWVWWnFO?=
 =?utf-8?B?YkxicWlrS0Ruc2c4eFBLWERycGdDSjhCRnphWm1mM3U4d1R4Yi9EVGxmMktt?=
 =?utf-8?B?aWJvdkxHZEttK2xlMDhuTGVYWGo3TmlpdE1UUUtuZHZ0L0VPNXJlRXc5bGRW?=
 =?utf-8?B?T294MjVGVHFDenIvMEZGK1pZcWlwVzlyKzd0SytFWkhteXUyWWV5d000ekdy?=
 =?utf-8?B?NjJLbzRwTVFSUDBJZWUydHo5WUtkYkhoMmkzN2hIaFpKYzNPelNGMUNNTU1i?=
 =?utf-8?Q?e3dYb77K2ydmCdBFa8OVlsY3tsuZ3EkS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFpqMjhkaGwrVFNIU0JYdTltWU45Nm1DK0ZPcmhKenhPMGV4QjFyUmVpcCtt?=
 =?utf-8?B?Y1BBYjJRSTNya0srMmE4K1VDQ05uNmdGRzUzSWtyL3dVNHh1OGtKTlJSL3dq?=
 =?utf-8?B?aGx6MjU0SkF5OFFrZUJkb2RxVk1KRnFTTlByb2pLNWhYRTFqSHg1VzdILzBv?=
 =?utf-8?B?Mm9YcUZ2SFRLMHZyUFZPbGVPTzVKWU9jeHhsQXZCek11QVo1ajVXd2MxMTU5?=
 =?utf-8?B?ZTBNS2pVWWJpZXhFOFI5QjR1YkJqc1l0Y1RtakhaMUkxMmhMTFArZ0pQdUlw?=
 =?utf-8?B?RnA2Q1Bwc3hZTk1hakNlNE8rWmU2UnNDakJSUEIxZnZyU0VsVmpVZ2FZbU1G?=
 =?utf-8?B?VXU5Skdva0tMUTR2SXVCNkRDSDFsUWF0SlhyNDRJajZpak1lM3NsRytCeWlp?=
 =?utf-8?B?M1lrczBqY3p5M3BwRlBzV0dPQUVYMHduenJpSVc1RGN5YmpZVGEzVXJIbzR0?=
 =?utf-8?B?ZVQrL0hPZmR5SkhxWTc3akhEMWdyVlFpLzNwT1NWbjZYeE93aDY0VWNFSXZ3?=
 =?utf-8?B?RDZYVDFKNjZoUkVnQkFpckNsakl3TjBnT0RmQjZndVJZbzE3OFhSbkhTaVVP?=
 =?utf-8?B?Tjd0Tk1DK3prWlE1YmI4RXZJSHJaVEM4eEJYUGVlMDd3cm5SWGFJaFQ3cCtl?=
 =?utf-8?B?b25yakVObnUxdGxNbnUyK2RBK2dSczdnbHI5Tno1SW5qY2tYaGRQQ3NRd0pB?=
 =?utf-8?B?VGorbjVUZ3FPVExvdzh2TVJ4T0Z5cjJzUVovRmcvQThYdnRCR2pMVnJnbGtR?=
 =?utf-8?B?ZlFVU3dUY0gvWjRkUVJNcFg5UVlQQVNENk9ta2ZQSzQ3by84TGJlY0F3QU91?=
 =?utf-8?B?NDVmU1VFeGtPRTdZMGlpQjZyYXBpK0g5RFlRRzBoWWZmOENGVk85MUxzTy9T?=
 =?utf-8?B?NEFFWHZRcGdFRDFhejVGNmxUWS94WmZkdXV0bFh2dmlXL1FIdjhNMUNjSUFD?=
 =?utf-8?B?SE8rK3VuK0EvWXlSNzBpZnN3cGV5bXo0QnRzdnNQTm9hSThscTQ1TWthQ1Yr?=
 =?utf-8?B?Ty95cEtpalAvUlhRL3R0THJSaG9NbFY1Unp6UWx4ZXg2b3RGcVBmVFlJaU93?=
 =?utf-8?B?aWRUSC9FdXJiZlE5RHZQNVBUZ0t2YVVJZWNDVHJFYzFBVldRN0pWYXhqRGxa?=
 =?utf-8?B?UHVTZVJuYTlua3FaaDIvZDFHMVFlSk9sY3RBYmdQVkR1YmhQMVNXMStFMkxi?=
 =?utf-8?B?cklzSEI4RGdUNndXeWc0bngzbGUrU2RMQ2F6eE9xL3Jscm1pcmhwQ0VCL1ZR?=
 =?utf-8?B?UDhya0ZOVSt6b1FOVkp6cVo3b0NicGhScm5sWTdPTDdOQ0k2TnkyYS9zRzBu?=
 =?utf-8?B?N1BlZGhyOG9ON0tyVTVuWGlJYldOSWtEMkFya1dhOEp4NDhwUlp2MXE3T21h?=
 =?utf-8?B?WEV1ZlBhZEpoSkVQM29RZXBTRzZ1enpwZzZVdkduS29WcG9UeHlNL2RTcGp6?=
 =?utf-8?B?cnVNZzZDaTYwakpLZ2NvbERJWXF5UG96NXFyWlppb0ZJRThadlRlR2I0T3N3?=
 =?utf-8?B?dTl3cUd6Qkk0ZDhQZGphSis0em9ZZExFTjJzbzZvRHNjY2dDM0pIK0tiYTVz?=
 =?utf-8?B?cE93SW1oOHVlVC9nZ1JzaWFVTWxrNEJnODFKRC9oWFJDQ1F5bURQSXhBdWxG?=
 =?utf-8?B?b3FJQnVEYlR2eTNoTnFsQWMyY2tmVnljWk11LzQwRWVyR1kyMUxIZzV3dmN4?=
 =?utf-8?B?Mm5mN2xHZlNGR3Q0dUcyOTZTMGNKV3BHQThTY0VFL2JTVEpPQTFXTjNCVnhj?=
 =?utf-8?B?NFhHK1FYRXMvcWlLOWxoMjZsTGx2WXMzM3hJTUlCZGhCNnovY1grZ1pvYmdj?=
 =?utf-8?B?MmVHclR6UHArK3BZSGNvaEtXMlRIQnRteXJJL0pYSjA3eFRYTHQvNTAyNW53?=
 =?utf-8?B?WVRCZEhScFV4WFZPaEgwTXBlM2hVL1ZhL0ZVaGw2eXN4L1M2WVVJMzRMaG8y?=
 =?utf-8?B?dUttZDZEQ2JkVlR3VzhDbzU3UThCd1lGTFBqSkVCb2RYYUV4UTl4OXB0aUo1?=
 =?utf-8?B?aWFkZWJvalgwRFFYYTVVUm5peCtES1M3MGE0TzhsaEtRazJ4YjNDbHQ0K1du?=
 =?utf-8?B?YWI1QktSOEVQUzVjQzF5T21SOFdSc09rTHBJT2tUSXRnYWJUUmxESWREdTgr?=
 =?utf-8?B?bC9sUFRVRFppbDRyOGNEVG9rVlIxYmxqZ3owNFdiUEFjaTY1bzFZQmIzaHJn?=
 =?utf-8?Q?pBYo25JDkmAWcIbAZluOodFKZ/WqwClwm60l3xh7s7eJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb98356f-903f-4f12-c41f-08de3eb043e1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 03:39:50.8787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAvE8SajZ1lJXeIKYUAkV3ohVRofJkJ737UskJ3PEo+4dOuzduBJWDU/D3ePEneBMR4En0r0wVZlYM0DGDGVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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

On Fri Dec 19, 2025 at 7:33 AM JST, Timur Tabi wrote:
> On Thu, 2025-12-18 at 22:27 +0900, Alexandre Courbot wrote:
>> > > +=C2=A0=C2=A0=C2=A0 loop {
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 match cmdq.receive_msg::=
<UnloadingGuestDriverReply>(Delta::from_secs(5)) {
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Ok(resp) =3D> return Ok(resp),
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Err(ERANGE) =3D> continue,
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
Err(e) =3D> return Err(e),
>> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >=20
>> > This outer loop can go on infinitely, lets bound it?
>> >=20
>> > Either outer timeout or bounded number of tries. Bounded tries better =
since it has inner
>> > timeout.
>>=20
>> Yes. And what we really want is a more generic way to do this, because
>> this pattern occurs with several commands so far (and more to come).
>
> Isn't the real problem that we are polling for a specific message, when a=
ll message should be
> handled asynchronously as events, like Nouveau does?

Does Nouveau really handle all messages asynchronously? Just taking a
look at `r535_gsp_rpc_send` I see:

* A potential busy-loop with `r535_gsp_rpc_handle_reply`, An argument to
* define whether we should wait for a reply (`policy`).

So it seems like each GSP command expecting a reply is effectively
looping until it arrives, with some messages (LIBOS_PRINT, SEQUENCER,
etc.) being managed by a notifier registered with the command queue. But
messages sent explicitly by the driver don't seem to make use of it and
instead process messages until they find their reply.

This seems to work because IIUC the GSP sends replies in the same order
as it received the messages (so one caller cannot consume the reply
intended to another) and GSP messages are a replacement for the CPU
messing with the hardware itself anyway. So in that context that design
is not particularly awful, but maybe we will want to switch to something
interrupt-based in Nova long-term anyway.
