Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5DDBAD15A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C0E10E5D8;
	Tue, 30 Sep 2025 13:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Divv2P04";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A63510E2C4;
 Tue, 30 Sep 2025 13:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cwLY0P7tHNtQUf8lGzUk2nR7KxEtWSFnVZahgqJ0dK55/VlE2kOJr6Vs5fjeitCTR7M5I3Zi/UX+sF8NvFrEcMri6CN5XDE5yxHSwwW9a2eStL57ZMNsE2tQgjT11i2Fro1AX00pTZe2nyW+Rtwt1tu/z4gIxysLP86pOV/OvM+AK6hOde4uFr5LjHeFXsuJ22TTuFVP69tU7nqAhLt4detnqDLv7o50Z+31nlZWqLzzYkV0/sd6/SiJgPZtPT6WWiSqUzoaas4FB0jWstgi2NL3ML7KT7TQV1r8hY7LZ1/GqwOkqtRLUu2P9pNOGhN7sMubq2VcL2+Wg0TJj1eH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXqdNJ9tXzrl3fYnWDo2i7WemCY/+sXyDSjyCMrDhD0=;
 b=tcHBgWnZEI1y1eORPUmpqRmrbqNaAdaCPszk/eeFTcnznGSCAsADW5AjfrLfrl2kBsnzJd1mVOdK94Yp1tiVk8jxBRt7MvW60KqIlTiIXXLaByugaIpUTafrZ5x1Z/4HK8k8yMEUkFhK2RryI4ZHpsjFThFjgne7Cv+UNu6Vysqtd0WTEFO463eeGeZY/uxlkQc57IdxWkR/Yr1CCx78IvLz+2s/ySB7Rwh9mJoidehCxhopRJ/n4fsyssTVdWIrO+gtEZACAuCB+qpfLgdLNsFUmCqXZUMp1D8UQf9WY/eGEc2vRMw+aqnNYf8I+BN/cIhDGl11k/NYRXjl7YgbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXqdNJ9tXzrl3fYnWDo2i7WemCY/+sXyDSjyCMrDhD0=;
 b=Divv2P043mOC4LUVheHZA9CXdJsDRuVIJw/m4X2hA6wrHaNM7eTJ6welVGoEZFLuFOBHgq0erApXpj2kUP6174+Azj+fKwexaGzcCoT5unEZHFStK9ah9JyVAx0qlcSIHqEC6GLrY4bm1vrH9LfvEDOrEHadqmoOGjYd6jubTWWDV4GuuuOS1biFWEb6jMq2WC14FKPFg7gnB/BbAYFcrDz+zSy62SJ1na8sbWoOkIeVk1kMNLzLs0m0GmVpvrqZUo639T74fM+ZOSUEaCVgKc8wUU0LiHehD3zEM1qZ/tUL7DJsanP2fz7Gu7850J+QTZmrtynjJgNGfSyr7ec+nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7605.namprd12.prod.outlook.com (2603:10b6:8:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 13:36:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:36:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 22:36:20 +0900
Message-Id: <DD66BA7N6113.3G9J4XG0RX08V@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 05/10] gpu: nova-core: gsp: Add GSP command queue
 handling
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-6-apopple@nvidia.com>
 <DD2GCDGQ7Q4W.1CSFYSETFSN5H@nvidia.com>
 <7brvf66smc3ltqrw7tm7smth6wnefeqykdm2n4qahi5xnr6d5o@4l5xfdbznlp3>
 <DD5CXDR294YD.2RL474PWBDWTV@nvidia.com>
 <qwqmek35wzu3chimtfsoftqvt4lw4g7btbvqzoc6qb4hoce3zq@pdu57fdxfb23>
In-Reply-To: <qwqmek35wzu3chimtfsoftqvt4lw4g7btbvqzoc6qb4hoce3zq@pdu57fdxfb23>
X-ClientProxiedBy: TYCP286CA0127.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: 654bb56f-3902-4274-8b1d-08de002658e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVVaUytyQWpRemMvcncvT3VnNEt0WnlSQTVXTnFEM201dXlFUjF5ZlJVNWlX?=
 =?utf-8?B?OVdlWCtWSnN2b1NQekdQQjFIK1dRVTFBRVJqQnBkVDl5czVkTmVWUThxaG85?=
 =?utf-8?B?NkNvbll6dG83MWgwVmk1Z3RCa3ZzbkkvOCtwV1BkWmg1VWlLajJnWVpqTEp0?=
 =?utf-8?B?WTlyK0cxR2tRcDlsc1U4RCtLM1dST09mdWIxdG5wczZJY1NlTEtkdzJLUUpq?=
 =?utf-8?B?N3BmdWJmY3Nmc01KYlB4UWxQVE5Vb3IxOUVNYlkwUEV5bUxVRVJoS2hIWC8z?=
 =?utf-8?B?Z3Fneit1TTRNd1VaVTBjUUZtS0tRbXFZNE5TMzB1RlFyb3duRk1VNGs4clQ1?=
 =?utf-8?B?WkYxU1E5WWFZMTZEUzA4R0JFSEhGZDIrcDBxUUdGcnpvcG1PcXdiSmFIQWpS?=
 =?utf-8?B?ZUpYUm9PSHUwTndKSlhZZXQrcmk5UmVlelB4VTlKb0QxcFJlRW1kRytiSW5o?=
 =?utf-8?B?RW80emdibU9XNk5yVmlwOTRUYjBhMzQ1NThwb1k5S0IyUys1bDNlVGp6NHp5?=
 =?utf-8?B?N1U3NHpkeFAxVlExUU9HZlBmcDJVWXhTMVAvN0RDK0FTMTg4dGRldTI4VDQz?=
 =?utf-8?B?cFpMZitZbE9uNzBTMWtodzZNaUJNRXBjY21nRHFyL3JOcVFyaTduSVBTUm0z?=
 =?utf-8?B?Yi9jTFFQUVRqeE5Ubm9RQTdCM3RIU3VBeHpDWTVxdytQdDZZdVVaU3lYMFJr?=
 =?utf-8?B?YUdhSnBoR1NHNEQxb0VleGNzZGE5U2RrSTIxZU5OS3Z3MHI2OE5pMmRsMUpG?=
 =?utf-8?B?M2tpRE5iKzBDRGFJZE9MUUdxMlNHMEcwb01jdHZRMjRFMlZpdkJxSUtPekxa?=
 =?utf-8?B?K0k0a2ZlbEEzUWNVbE9BNGhQYXh4amVKTnd3OHk0aHJDSXZLRlM0MU9heUEz?=
 =?utf-8?B?K3pRdHZWZVlzcHE1R2F0OFQ1L3l5T0FiWElIVDM3WWEzb0taUjZvSXZVL2Nu?=
 =?utf-8?B?S2d2bVJyZ3kwS0MwRk5jMlh5RmdaQVlSM1BZRDd1ampoQ0l5bzBubFRWLzFU?=
 =?utf-8?B?dUlZL005NUJ2SWFVNFhObkxBSXNIY1l1ZjlmbDhpSDIzNngwU0x2aUdJckpn?=
 =?utf-8?B?L2liRWdDWnJYMy9zQjlRaW1pV2xrTUpFN21wTnBkUXhxL3IrdjUyL1p4VFRF?=
 =?utf-8?B?NWVDL2dIRDJudmFqRzNhZDhjRnJYYlhFR3pnTXBTaTg4dXVMdUZCZU1qQ25x?=
 =?utf-8?B?RzRjalp2dkxVTktiTXA2RjJIQ0UyaEM5R09yRmtQcytTK2hKY0QxQzJDbVpj?=
 =?utf-8?B?WUQyUGozRUZ5Zm0rTnhOK0RONFM4WlVaSjJZSHBzbHR1OFRDc0RrRFRKdDZD?=
 =?utf-8?B?d3I4alFJc1BrbHdVeVBpM0htTXRoZEN0ZjFhaGlrZnE1aUhvMWdpbWZ6d3My?=
 =?utf-8?B?Z2o5RDczcDRiZmp4YjAzS2czZ0xHTysra1NyOC9kYk5XdHZhMG5mZWZJUlI2?=
 =?utf-8?B?bksrcDl5QW1aWHdhTk9BOU1hUHRPVXFuek9ZK1g1dSs0cHBLLytESVJ2M0J3?=
 =?utf-8?B?L0xBeFNFK05qYklQYXRtZ204SHBwa2NnRDlGUDBKdllsSUtiY20wdXRXSmJy?=
 =?utf-8?B?YkxmdkdOWjFNZTcweWVUYXB1MUNMdjQ0US9naE5POW5ZdkRXM25VZW9aRlNa?=
 =?utf-8?B?VGlhci9qMjhWaG9JTjBScDVwTHB5OTltK3FabEt0UnFGeFlGWFNzZjJrcHpo?=
 =?utf-8?B?S3kvUUxqWmQzKzZxdEo3N0dnVk5LaFg5dVhKdE9Tb2pyL3k4cXgxOFF0YTFJ?=
 =?utf-8?B?ZEluZXdCb2EvaXFWbkJoVjE1TzE3dTUyOXRZaVNGRWpNQjJBODkwb1FlS0xD?=
 =?utf-8?B?OVdiT0FIMXNTTTh6TWRsUDR6TjBQOUtHRUtkdlRrYm02Yks1YXNuWkZBS0R2?=
 =?utf-8?B?VDNYWUFuT2xrWUJPRFYvVFBhTktBd3RoZVVVN1lMeHNhQ0Rtcy8ramZhU1pD?=
 =?utf-8?B?ellDbW54dG9iZStSUEJoenhBVFdaU3IvQTNaL3NxdlAyWW5sSlFFUkl4UnFp?=
 =?utf-8?B?dGxuendKbDdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGhDQ2F3d0ZnVmJPaXU5TERycy9SZi9iMDZuLy90V2hpenVlNitUZWx3Rkpq?=
 =?utf-8?B?ZUdlODlMeWZpaTJTN3BNSjhtcXNHQzhJeXRxODJQUitsZEFRbGgxN2FBTnhX?=
 =?utf-8?B?NFRLNDc4cmVRK1V1aFppSmJNWjYzRjJ1eko2V3QwUHJUd3VLZWFUWVJrZmkr?=
 =?utf-8?B?VnViYTFNR3A0M0NqY1VyVmZLaFdZWVdIQnltZ2pXaXVTZmJRNC81bDJxdWwx?=
 =?utf-8?B?aEFyWUVlUUVoZVlyU3Zkd2JFWnZzeDhMdDlPZ3RFSk9sSW92QjhnMXUyV3h2?=
 =?utf-8?B?NGVqemRrSWhpU1JqUThPZy9pdkF0dE9DRHdHSmRKWTdqTVVJR0hSZDRpZDhm?=
 =?utf-8?B?REIwdExTVVJNQWRvQ291UmtBV1dNT2xSZ0hHMy9NallPK2FvZG1TNytYYThq?=
 =?utf-8?B?djJJbWdRcEZ6NXcrQWJYRkRMZHBSVTNxSWxNOWxmYmNyNTdETjI5QnFIV2sx?=
 =?utf-8?B?aE1aUm9aRitNaU1aOXFxeVhEOStiWVRZMXp1WnBCeEJmUSt0TGUvZGxjS1BE?=
 =?utf-8?B?MW9qNC9oWjZnc3c3bGZUNS9veWQvVVJlUjk5RmdXV1BNaDNFT3BTOEkvRDVP?=
 =?utf-8?B?a2Y5MjlOL3huQzN6d1NrdGkwelV6SjRmdTI3Vk52d3FtcGNCSDN1SU92Wjhi?=
 =?utf-8?B?VXJxUExmTU1NdXRZTmRoL1l4UXFTSytGUTMxeWdnTjBUQ1FhY1JValJ0dGQx?=
 =?utf-8?B?VnVsNmNxLzVaNndlQW1MT0xQc2xDTjVSeDc1RFFJT2pHeEZ2d0dNRlFJZnVF?=
 =?utf-8?B?TkMxL1dOdnNZQVdRUU1UNmhJMTJKeTRrZGZmNnMxOVZySjF6eFgyQnpGK25s?=
 =?utf-8?B?VVNwVkFoV3FLVlRpVjhseC9FVmpIK3NqRVhlK2M5anU0YU9La2x3OHlVRHU4?=
 =?utf-8?B?cUl1d0MyOXljZE82UG9oRjR0eFg2OHVCR1VpWGNlWWluODNsKzBBMzlWNW9V?=
 =?utf-8?B?V2FDWmdKQ3RsYWlFMTYwZDNvTlBOcHJORlE1dU4wZ3VaV3p2MVJkS2I4OEJm?=
 =?utf-8?B?bUJraU1NSUo3VlBneTl5RGgyUEluQ2UxNGVmZS8reEFJV0kzTVFSSDdWOFJX?=
 =?utf-8?B?aUVHekFyZ3JPdVdtektzVWVrT0I2T2g2Uk84S0lnUjc0WEUzeDdNNkxpWnZT?=
 =?utf-8?B?UFhNeWlqUEdLVjkvM3pXQThhdjZ1Rk1TZFdFVHF6SHI3SlFROEx2QUE0Wkpu?=
 =?utf-8?B?cFhLdWhnTzEzOU11djBtSFZqMWZieVdSWnY0WmdGNkVkNkdzbWNlT090OGxQ?=
 =?utf-8?B?cHppOWcxejBxUGRFZ0tSVlU4cTFoZktDQm5nTGZLMlFvMk9vU2V2S2xOVVgr?=
 =?utf-8?B?eDh4TC9VZnRqRXgwMlpjTCtod1BzT3V2Z0JsTkl5ZHRqWEY4NHgxMHFnbGc4?=
 =?utf-8?B?OE5BcmRiUmg4NHdyV2hpR1VwWFVjZXM4TUQ0TlZUdkdaVXZGYmpDUzkxUmIv?=
 =?utf-8?B?ZkxXdDhrbHpNVU1IWXB1UGNyNFd4bnJ2QkJIL2FaY09TOHZXeFdMbTJabjli?=
 =?utf-8?B?MFlFbXBFV3BPeGJxbVpqQXZRaVVCVTdCVDFWdUF6c0xSKzljL25XLzEySHNN?=
 =?utf-8?B?b08xRkM4di9ud1FOZWw4am1MT1dFVktlMHZnUHB2eFl2cUdzb0xWQjllOEVW?=
 =?utf-8?B?eDVnaEY3WWRqRE9samdnSlVmM1N0YkxXR1NDbzFQN2ZvSWlUT0tudnNsZlJK?=
 =?utf-8?B?WE1GeUZmV1FsMlYzUXd0WHYrdEg2WlBpQ1I0UkRXRFVIMWZzcldndVE1R00y?=
 =?utf-8?B?ak4yamQ1WjQyZEQwS0k2QzRxeTdYbURpQkNGZG9HbWY1SFBtOUZIMWZNOE5U?=
 =?utf-8?B?M1pVM3hObFBabmxuYXdoK01zNWN0S0piTGhKMGRpeHpxRWhZdEdWWTJ1bDRn?=
 =?utf-8?B?b1pCSm4yUlhERElBais4SHBpbWVrb1liTzZPZkZQZENQWEJJbXllMGxsYkhJ?=
 =?utf-8?B?cys4RDRXdGRQL3hMbVRTN0RoK0VIMWlZelNZQUw4bkZ4MUF0c2I1R1czTkpQ?=
 =?utf-8?B?VHI3S0d0K0FOS3FkK2dJNXM1MFZCS0dJejVoSVE2S1hhcmlXd2lMQ2hERDYr?=
 =?utf-8?B?RjlMQ05aZ3BEbW1IaHhieXFpWVA3dUlhTTd4WkMrdUF3ZytnUkxsMkxuQVVF?=
 =?utf-8?B?L0ZzL0kxMzMwOWdVWFVhLzZMRlBjYUQzSUxOUmRWWXcwYmh0em9QalJta0Zj?=
 =?utf-8?Q?5sQv9rsVVdIOvK5mSJqHItVi25OA43uIcT//wX5TbWK3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654bb56f-3902-4274-8b1d-08de002658e9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:36:23.5757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ6eIcBqmzw5e8AEmbq9WMw0GzWsUQy76m4HL9o8iyY31I+aqp0iwv/dSLPefnw5SZky+/K8wzJd2kDp3b7psg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7605
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

On Tue Sep 30, 2025 at 9:36 AM JST, Alistair Popple wrote:
> On 2025-09-30 at 00:34 +1000, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Mon Sep 29, 2025 at 3:19 PM JST, Alistair Popple wrote:
>> <snip>
>> >> > +
>> >> > +/// Number of GSP pages making the Msgq.
>> >> > +pub(crate) const MSGQ_NUM_PAGES: u32 =3D 0x3f;
>> >> > +
>> >> > +#[repr(C, align(0x1000))]
>> >> > +#[derive(Debug)]
>> >> > +struct MsgqData {
>> >> > +    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
>> >> > +}
>> >> > +
>> >> > +// Annoyingly there is no real equivalent of #define so we're forc=
ed to use a
>> >> > +// literal to specify the alignment above. So check that against t=
he actual GSP
>> >> > +// page size here.
>> >> > +static_assert!(align_of::<MsgqData>() =3D=3D GSP_PAGE_SIZE);
>> >> > +
>> >> > +// There is no struct defined for this in the open-gpu-kernel-sour=
ce headers.
>> >> > +// Instead it is defined by code in GspMsgQueuesInit().
>> >> > +#[repr(C)]
>> >> > +struct Msgq {
>> >> > +    tx: MsgqTxHeader,
>> >> > +    rx: MsgqRxHeader,
>> >> > +    msgq: MsgqData,
>> >> > +}
>> >> > +
>> >> > +#[repr(C)]
>> >> > +struct GspMem {
>> >> > +    ptes: [u8; GSP_PAGE_SIZE],
>> >> > +    cpuq: Msgq,
>> >> > +    gspq: Msgq,
>> >> > +}
>> >> > +
>> >> > +// SAFETY: These structs don't meet the no-padding requirements of=
 AsBytes but
>> >> > +// that is not a problem because they are not used outside the ker=
nel.
>> >> > +unsafe impl AsBytes for GspMem {}
>> >> > +
>> >> > +// SAFETY: These structs don't meet the no-padding requirements of=
 FromBytes but
>> >> > +// that is not a problem because they are not used outside the ker=
nel.
>> >> > +unsafe impl FromBytes for GspMem {}
>> >>=20
>> >> These ARE used outside the kernel, since they are shared with the GSP=
.
>> >> :) I'd say the reason these are safe is just because we satisfy the
>> >> requirements of AsBytes and FromBytes:
>> >
>> > Yes, and they're actually old safety comments that I missed updating t=
o be the
>> > same as the rest.
>> > =20
>> >> - No initialized bytes,
>> >> - No interior mutability,
>> >> - All bytes patterns are valid (for some generous definition of
>> >>   "valid" limited to not triggering UB).
>> >
>> > I was under the impression that that's all `unsafe` is really marking =
- code
>> > the compiler can't prove won't trigger UB. So I'd assume that's all we=
'd have to
>> > prove in safety comments anyway.
>>=20
>> A good rule of thumb for writing `SAFETY` statements is to look at the
>> `Safety` section of the unsafe code we call (here `FromBytes`), and
>> justify why our calling code satisfies each of these.
>
> Oh that's usually where I get my inspiration for them from. This was more=
 a
> statement of my understanding of the language design, that unsafe is most=
ly
> about UB rather than overall struct validity. After all I think it is sti=
ll
> possible to have safe code initialise fields of a struct in "invalid" way=
s
> (depending on the struct).

No you are correct, unsafe blocks are blocks of code where the
responsibility for preventing UB shifts from the compiler to the
developer. The statements in `FromBytes` are here to prevent UB.

For instance, if you have the following:

#[repr(u8, C)]
enum Switch {
  Off =3D 0,
  On =3D 1,
}

#[repr(C)]
struct Light {
  switch: Switch,
  intensity: u8,
}

Then the compiler can make the assumption that `switch` will only ever
be 0 or 1, and allow UB when it is not. `FromBytes` cannot be
implemented for that structure. So in that sense, struct validity must
be withheld.

What does not need to be withheld, is e.g. GSP messages that are
structurally sound from a type point of view, but don't make any sense
semantically. For these the code should produce a runtime error while
validating them - but this is not a source of UB as long as the types
they contain indeed satisfy the requirement that any bit pattern is
valid for them.

(tbh I am not sure myself why interior mutability is not allowed)

>
>> >> > +    dev: ARef<device::Device>,
>> >> > +    seq: u32,
>> >> > +    gsp_mem: DmaGspMem,
>> >> > +    pub _nr_ptes: u32,
>> >> > +}
>> >> > +
>> >> > +impl GspCmdq {
>> >> > +    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<GspCmdq> {
>> >> > +        let gsp_mem =3D DmaGspMem::new(dev)?;
>> >> > +        let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;
>> >> > +        build_assert!(nr_ptes * size_of::<u64>() <=3D GSP_PAGE_SIZ=
E);
>> >> > +
>> >> > +        Ok(GspCmdq {
>> >> > +            dev: dev.into(),
>> >> > +            seq: 0,
>> >> > +            gsp_mem,
>> >> > +            _nr_ptes: nr_ptes as u32,
>> >> > +        })
>> >> > +    }
>> >> > +
>> >> > +    fn calculate_checksum<T: Iterator<Item =3D u8>>(it: T) -> u32 =
{
>> >> > +        let sum64 =3D it
>> >> > +            .enumerate()
>> >> > +            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
>> >> > +            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rota=
te_left(rol));
>> >> > +
>> >> > +        ((sum64 >> 32) as u32) ^ (sum64 as u32)
>> >> > +    }
>> >> > +
>> >> > +    #[expect(unused)]
>> >> > +    pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>> >> > +        &mut self,
>> >> > +        bar: &Bar0,
>> >> > +        payload_size: usize,
>> >> > +        init: impl FnOnce(&mut M, SBuffer<core::array::IntoIter<&m=
ut [u8], 2>>) -> Result,
>> >>=20
>> >> This works pretty well for in-place initialization.
>> >>=20
>> >> There a couple of small drawbacks though: `M` must implement `FromByt=
es`
>> >> even though we only send it, and (more serious) there is no guarantee
>> >
>> > Yes, that detail annoyed me slightly too.
>> >
>> >> that `init` will fully initialize the command - a forgetful caller ca=
n
>> >> omit some of its fields, or even the whole structure, and in that cas=
e
>> >> we will send a command with what happened to be at that position of t=
he
>> >> queue at that time.
>> >
>> > Good timing as I was just looking to see if there wasn't some way of e=
nsuring
>> > this happened, or at least was much more explicit than what we current=
ly do.
>> >
>> >> I think this is a good case for using the `Init` trait: it's like
>> >> `PinInit`, but without the `Pin`, and it ensures that the whole argum=
ent
>> >> is initialized. So this method would change into something like:
>> >>=20
>> >>     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>> >>         &mut self,
>> >>         bar: &Bar0,
>> >>         payload_size: usize,
>> >>         init: impl Init<M, Error>,
>> >>         init_sbuf: impl FnOnce(SBuffer<core::array::IntoIter<&mut [u8=
], 2>>) -> Result,
>> >>=20
>> >> This also allows us to drop the `FromBytes` requirement on
>> >> `GspCommandToGsp`! But also requires us to use `unsafe` to call
>> >> `Init::__init` on the pointer to the command. I think it's worth it
>> >> though, as this removes the risk of sending partially-uninitialized
>> >> commands.
>> >
>> > Agree on it being worth the unsafe call, especially because it is unsa=
fe if the
>> > caller doesn't do what it's supposed to regardless. But how does this =
contrast
>> > with `MaybeUninit`? I was wondering if something like this would work:
>> >
>> >     pub(crate) fn send_gsp_command<M: GspCommandToGsp>(
>> >         &mut self,
>> >         bar: &Bar0,
>> >         payload_size: usize,
>> >         init: impl FnOnce(MaybeUninit<&mut M>, SBuffer<core::array::In=
toIter<&mut [u8], 2>>) -> Result<&M>,
>> >
>> > Note I'm not sure we could actually make that work as I haven't tried =
it yet. I
>> > suspect I've missed something with lifetimes there :-)
>>=20
>> The difference with using `MaybeUninit` is that the unsafe code would
>> need to be *within* each `init` argument - IOW, within each caller. It
>> also does not provide any guarantee that the whole `M` is initialized,
>> we have to trust each caller for doing that properly.
>
> I suggested it because I was actually thinking that would be a feature :-=
) After
> all callers are the ones doing the initialisation and so have to be trust=
ed to
> do that, and the unsafe call to `assume_init()` would be the indication t=
hey
> have to do something right.
>
> But I'm not particularly tied to using that, it was an idle thought/quest=
ion. I
> do wonder how Init gets around callers having to guarantee the whole of `=
M` is
> initialised, so will have to go study it a bit more closely.

The only reason for `MaybeUninit` to be `unsafe` is because the user
might leave fields uninitialized or set to values that are invalid for
their type. The unsafe operation is here to shift the blame on the
developer who forget to set their fields properly.

With `Init`, such mistake cannot happen, as all fields must be
initialized (like a regular initialization) or you get a build error. So
we know for sure that the structure is properly initialized, and UB
cannot occur, hence no need for unsafe.

Of course the command thus initialized can still be invalid in the
semantic sense - but in this case the GSP will detect that upon
reception, and send us an error. As far as the compiler is concerned,
this is working as intended.

>> >
>> >
>> >> Then there is what to do with the `SBuffer`. I'd like to think a bit
>> >> more about this, as not all commands require it, and those that do
>> >> typically send arrays of particular types. I think we should be able =
to
>> >> use the type system to have more control over this, but let's keep th=
at
>> >> for the next revision.
>> >
>> > Sure. You are correct that not all (most?) commands don't need it, and=
 it's a
>> > shame we don't have proper bindings for them anyway. Although in some =
cases that
>> > still wouldn't work anyway (eg. for registry keys) where it really is =
just a
>> > packed variable number of variable length strings. Not sure what a Rus=
t native
>> > representation of that would be.
>>=20
>> For now the best I could think of is to have not one but two traits for
>> GSP commands: one for commands with payload and another one for commands
>> without payload. And two variants of `send_gsp_command` for each case.
>> That way we can at least guarantee that we won't pass a payload where we
>> shouldn't, or forget one where we should.
>
> We can't guarantee that (at least with the current bindings) because we
> still need to manually mark up the types with the correct traits. But if =
the
> majority of commands don't have a payload I agree it would provide some n=
ice
> simplifications for callers.

Yes, the idea would be that each command implements one trait or the
other depending on whether it needs an extra payload. This needs to be
done manually, but we are already manually implementing `CommandToGsp`
so this is not much different.

>> >> > +
>> >> > +            // Can't fail because msg_slice will always be
>> >> > +            // size_of::<GspMsgElement>() bytes long by the above =
split.
>> >> > +            let msg_header =3D GspMsgElement::from_bytes(msg_heade=
r_slice).unwrap();
>> >> > +            if msg_header.rpc.length < size_of::<M>() as u32 {
>> >> > +                return None;
>> >> > +            }
>> >>=20
>> >> If we have a message in the queue and this condition doesn't hold, I
>> >> don't think we can hope that it will in a further iteration - this
>> >> should be an error.
>> >
>> > I was thinking messages may get partially written and we'd see this st=
ate, but
>> > you're right - the shared pointers shouldn't be updated until the enti=
re message
>> > is written so this should be an error.
>> >
>> > That will require the `wait_on_result()` function, because `wait_on()`=
 doesn't
>> > allow the closure to return a failure. We could just return Option<Res=
ult<_>>
>> > from the closure but that's a bit gross, because wait_on() would then =
return
>> > Result<Option<Result<_>>>.
>>=20
>> We can now use `read_poll_timeout` (from `kernel::io::poll`) which
>> separates the acquisition of the state and the test of the condition
>> into two separate closures - the first one returns a `Result`, and its
>> error is propagated as-is, which is what we want in this case.
>
> Oh nice. That looks like it should do the job.

Note that this won't be usable in drm-rust-next until -rc1 is tagged,
but we can assume it will be usable for us.

>
>> Actually this reminded me that I should send a patch to remove `wait_on`
>> altogether now that we have a better alternative! :)
>
> I guess the implies we shouldn't add new callers of `wait_on` ... not sur=
e
> if there are others in this series but will take a look and convert them =
to
> read_poll_timeout.

There are a few - if we could use read_poll_timeout proactively that
would be great.

>> >> > +pub(crate) type MsgqTxHeader =3D bindings::msgqTxHeader;
>> >>=20
>> >> This should be wrapped into a newtype that provides the exact set of
>> >> features required by the gsp module, like what is done for
>> >> `LibosMemoryRegionInitArgument`. For this type we just need two thing=
s:
>> >> return the `writePtr`, and advance it by a given value. That's all
>> >> the parent module needs to see.
>> >
>> > Except that doesn't actually work, because we need to use DMA access m=
ethods on
>> > bindings::msgqTxHeader which we can't do from an accessor.
>>=20
>> If the accessor uses `read_volatile` and `write_volatile` then I guess
>> it should work? These are unsafe though, so this is not ideal, but at
>> least they would be contained into the `fw` module and limited to one
>> getter and one setter.
>
> Sure, `read_volatile()` and `write_volatile` would work but then we're ad=
ding
> more unsafe calls and going around the DMA subsystem which has special
> exceptions for justifying the SAFETY comments.

Honestly I myself don't understand why we can call `dma_write!` safely
wherever we want - technically there is nothing that guarantees that
what we access is not concurrently accessed by the device.

The volatile accesses are unsafe because they operate on pointers. I'd
rather do without but we will need them if we want to keep the bindings
opaque.

>
>> >
>> >> By just aliasing this type, we make all its members visible to the `g=
sp`
>> >> module. This increases its dependency on a given firmware version,
>> >> carries a risk that the GSP module will mess with what it is not
>> >> supposed to, and introduces inconsistency in how we abstract the
>> >> firmware types - some are wrapped, others are not. Let's be consisten=
t
>> >> and make all bindings completely opaque outside of `fw.rs`.
>> >
>> > I can't see how accessors in `fw.rs` for every firmware binding we use=
 is useful
>> > though[1]? In what way does that reduce dependency on a given firmware=
 version?
>> > I can't see how it isn't just adding boiler plate for every struct fie=
ld we want
>> > to access.
>>=20
>> While the main point of this remains hiding stuff other modules don't
>> need to see, it also allows us to choose stable method names that are
>> independent from the firmware.
>
> So the concern is firmware will rename struct fields?

That's one of the funny things the firmware can do, amongst others. :)

And yes, I agree that if the firmware changes too much this can
invalidate the whole of the GSP module, no abstraction will ever protect
us completely against that. But `fw` can be our first line of defense,
and also a logical break similar to the role `rust/kernel` fulfills
for the larger kernel [1]: the `kernel` crate is allowed to call the
C bindings, but not the drivers. Similarly, to access our GSP bindings,
we need to go through the `fw` sanitization layer.

[1] https://docs.kernel.org/next/rust/general-information.html#abstractions=
-vs-bindings

So to conclude on this topic (since we also synced offline and I see you
already have a v3 in which the bindings don't leak `fw`: yes, we need a
thin shim on top of the bindings to make them opaque, and yes this
results in a bit more code overall, but it also makes the upper layer
(gsp, cmdq) more concise and easier to read. No design is set in stone,
and as we get more visibility into what we need things can perfectly
evolve, but I think this is a reasonable state for now that requires
only a very modest amount of labor.
