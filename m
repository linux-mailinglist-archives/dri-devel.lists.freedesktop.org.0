Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE9BC8CE6
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152210E9C0;
	Thu,  9 Oct 2025 11:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aSc24Caf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010046.outbound.protection.outlook.com
 [40.93.198.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9C810E9BF;
 Thu,  9 Oct 2025 11:28:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIOxXcI2KTk7shl68oV98ivATIfdhcpV5ZY1DfEySs+rQ8z+3k2USoD+/C5F+R61MB0ktxJ8R7fosLx8Cy7gCbbsCFbSPaaj7ffyA/tkXiLub8gAB0IFvdVgrjxW9W75FTACUwSG7pddHciR5pVJoW6KsA9Eso/AH8pWV0aMmfiKS124oMUZCKSN0nO6WtHEnjYiDBadK3RgVNp+L67ry+Sm/A+FfQdflKBBQtiJQKL1NKuyfZrlxbwTwfb/hfPhu0CNFNPpBgQWeuaHwYw2xs2k9cGGfbBpbBooXLMrMegmfRcaYCh89hDV3CE64KoLVz+hjyfVhVTDeKRKIpC/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYW6ATztn+43CM6aI2Ko24HuLVRgv8ljWOnReL4e0vU=;
 b=RUWmcrzDqV82rI5gZTIqVoD5SyM9uDwk3wYVJbWLqN0SJMmpnEBeQp7zqGK+T8rJQ68YZnUifaE5bz4O2218N9VOJISAZ3Ly4nOd2iY5pixK+CJkGDeVhazYpsDeVYLkMUPxdK/f4AtCxky4t9gcJ6b4BiwgFD88joF5nbFJKIznJaqN6F6eutEQ/r/CT5kCTKXAdMwrvmzPiYCYEOpa1IJbySOdRzJeVh5RRVOvxW735eb9MNCBDGL0ues5YrFHbxmQKL18qCtWztzMAno6g+wjkCaBdCKazuy6DKsTh3Vn/rpN0keWZHegxkAGs6W+0TJU2u4lNUkOQWq7sQSoTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYW6ATztn+43CM6aI2Ko24HuLVRgv8ljWOnReL4e0vU=;
 b=aSc24CafL8Qayf2sEmlFAiiuZvglJ8Ue9YP3JPUG0THTvq4j1Fz1MGmvsFgN3dF8cOq6ALAFgQq0pq0jw3Y8hUuU5UuHoxlIwPpETuShXJzAmlmwdRssteCbO7jEqlknd9t15IoR4WVYcsd4CrizIwNDxRBdu7VCk9Q9cSMmLCbwvfDu/Q4GsGcOnjsHDrMaqzr7JzgshsfF3AhFcGeh1fW6+wSmcP7imNFJVE5lMHbt+88akvg5b98PMUCcRp7fcA/Cj2QyqvzS+FVGxd4uoETlI/VDJ39tlTTM2ZGPP/6OjYiQpZAhqJ0hhxQdrw+2mKb6irkGE12dYHBC9Gf4sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 11:28:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 11:28:39 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 20:28:35 +0900
Message-Id: <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Andrea Righi" <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Dirk Behme"
 <dirk.behme@de.bosch.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
In-Reply-To: <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
X-ClientProxiedBy: TYCPR01CA0205.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::6) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b01c2c9-ec77-4ba4-60d5-08de0726fe1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkExMmhFWnl5VCtZbFVlUThLZVpMbTI3VlhFRU9hTG1Nb3RzcUVTU0tXZ212?=
 =?utf-8?B?ZEwrZWhiNzEzVTg0dlpWWXhpRHZudHc1eHQyOFpKUUFkK25jRGZSdmhkbEY1?=
 =?utf-8?B?Mk5iMWlWSUcvWDJDK3A3OXlVOEVFZCtvbERGVzhjVWVCbWFJWU9iZW04KzVK?=
 =?utf-8?B?OFN0RG1IbzlIcjZWY3ZRNEZKTVJJMFNKY1ZFTUhORCtHYVdPTThkRFd2UUw1?=
 =?utf-8?B?NDRsbkorSHZ2bkNENHFqNEkzV01qZmJtYmhKakVod2MwUmhkNnRKZGp0WFl0?=
 =?utf-8?B?UG83aENpY255QVdkUVNNaStUTXBYcDd4d0tlQVUrSndhY081SXFhd3dSRE9C?=
 =?utf-8?B?OTdETXQ3L0s3NU40UXA5d1k1aEhxdytQdXhWbTIrdmNXemNFTVgrKzBMWXBP?=
 =?utf-8?B?WnJuTHFMSnd1SzFZa0J4QmFpazRjREJXcUdycWtIVVdnMjJ4dUlidHg2c09G?=
 =?utf-8?B?cWFjeGNLa0YyUVllcVI5QnE4U25MWFhrbTg2Z0VCam0yVGlQL29rV1QwSU0z?=
 =?utf-8?B?VDdlQ05pN0lGMHhYdmx4UENPcFQzR2VwSE41dEV1cjBjajBOc0lhdDVxS1Bh?=
 =?utf-8?B?VWpGaktvZW4vTWlpcmlDTkhsS2hVUlozd1NwSWNvLy9VVVE5RkpLa1U3ek1p?=
 =?utf-8?B?K256SzVjL3A4WFJjOCtSL245T2NXOVhBeit3QlRqSy9LTzI5TkV0SGpCQjNk?=
 =?utf-8?B?bWtmTXp5aGdKNVdsUVEwYlZzUzBKMEZid0R5MnVlUzBzekpCeHphbEpsVHRs?=
 =?utf-8?B?RVFUNW1QQUEwdHFGVTkzWjdRTTduRnVuOWRNVUs3U3hueGtHSi9jUFplVzdR?=
 =?utf-8?B?UDBJZEt6Nm9uQ0dJZ3h2WGJMc3RkTXdjNW11TU1sa2xBVGJlOWw2UWl5SURW?=
 =?utf-8?B?WWRGdFhyczBOSnBBaTRWd3RNTVU4aVdzbVB3UzF0eVI4Y1dQUHZSanBiL0dZ?=
 =?utf-8?B?UUhFNmp6QkNENjJobjc4NFlTam1lWm1sd1Z3V0hSdHVkQ1Fza0VDcGFYSXln?=
 =?utf-8?B?K1RtNk9MT1dIM1BPWlVxY0RFVDNEOUVhWjdDL0hPeWtNZVI3Sld3clY3WGE5?=
 =?utf-8?B?Vko2Q3dxdStjQkVtZ3pWQ1BTL2drVnMzdGR4cURrV3UydXZrZ09haUE3b3FR?=
 =?utf-8?B?SkR3QUJjOEM0Wi9lbWczOFJOalcyZlJSN3lMWnhsNFVuZ2pIbmc4R1RlTlkw?=
 =?utf-8?B?cEUzaWhTSjlocElEdlhoSE9UV3lVYmQwWUdUbVRPY3VmUzVxRE5XZVV3dGI4?=
 =?utf-8?B?U0REVS9aRGNaNnhsUEd2ZTBaY3dVTTk5cWl2K29UakdGQlNEVyszdEh3a1NI?=
 =?utf-8?B?MzlqQlk5MGRwSDMyWmtkTlhFb1JLcmg4eGdOTWZkVmlDTlZHV1o2RnVpTDV4?=
 =?utf-8?B?SnBaY1JRTTNCL011cUVhS3BPQkZlRXhZbjdLdytWUGtQNmxHNzlKUnFaWkc2?=
 =?utf-8?B?RkZNaWhkT1VDMGliaDVwOFJpUTNSdGduZEdtTXE3R08zV1R2V2NzSEh6R0sv?=
 =?utf-8?B?VkZRNnhVYXZNM2tHbmVhZkxVMUNTUmppYWtvTmdKZWhTWFovSUtRMjViVHln?=
 =?utf-8?B?UlhZRTJpMnF1SVF3OVFmejhlNGNvTXN1aE9BQ1kvZ1NUSnN3TW1jTmtJMGRJ?=
 =?utf-8?B?bHNpWnE0NVJCVGQ3N0RQREpKYU5pOUtXays2aTRVUERJNXh2RlRjd1cxOG14?=
 =?utf-8?B?VU51RTJkc3VGMm94aU9WSHZNL2t3ZDRCKzl4aFcweVY3N0tXT2sxVHlUSlJw?=
 =?utf-8?B?aHdrek9SWlBCZTFEcnpBbkJxSWtJWkNTVW9TeGpWekx1RHhUMmE5YXlPSEhI?=
 =?utf-8?B?dEhVQ0x0OFI0bHFyMzloY3I4VnJvS1lxVG5qaVRSZHFxM2RiUHB4MW1XUWJj?=
 =?utf-8?B?OXlVQlJDaWdaMDlzTE1rWkRQOUlHdkxkZjdKaHZpblFXdVRDYlFvRlpDMWEx?=
 =?utf-8?Q?eNWp8Nqu8YjWeFecAnhy9XoiEI9k7sZz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjYyTmxCN2d6MG9UUlhXd1RQR3FLK3I3Skk0eFBxcThMbExIR3IyMVNobDZF?=
 =?utf-8?B?TVBMRjdEUlN3YjZhV1Y0MGRPbjZJc0FoQzBmcE9RRmVqMU9UYmpLQWNoSzBh?=
 =?utf-8?B?SHFoalJSRmRLcUMzVnJGL1dUeE9yTDVWN1JoYXVZMEUwSjZ4UFRaWG1hM1Iz?=
 =?utf-8?B?cUZmMk9LQTIyQXJYL1NscnI4WlFqWlRCcWgxbkljMnpEVE43TWxNYUNEM2Z6?=
 =?utf-8?B?UUhpVXBnNXlQemZhNWRkSHBHVnh1QjRWYWdEekZpQWVyL2UwUTUzY1F4NzRV?=
 =?utf-8?B?WUpaMGxYbms1eGhpNnlBUXY2R2lpQ0VZUlMyZDBxdVV3Q3o3NkMwUlAwNXFG?=
 =?utf-8?B?WFFabW8wYlR4Q3RDdnM2c0NLQTRVczRCY2Z5WjN6d0NOc21tYUxxR3daQldJ?=
 =?utf-8?B?eWhVMU9ib2RNNVhmSWlSRDFheVRQSDVZd3U5UFc1dDRuRi9kNFVhYjFmS25Y?=
 =?utf-8?B?SG9EdzY1NG9FTEpVMTlzYTN5Wkc2NGZzSXBoZURiWm9ncFMwT2RmUnBqVW5w?=
 =?utf-8?B?eERQcUx3N2xiTFRnaUVMcWhzbklDWitiUW92RVpiUjhZUno4SHFIc0NqR2ln?=
 =?utf-8?B?eHo1bFNjWmJmUmZIOTBiaDBjczVKdDhqcGk1VEcweWh6STRva0t4dmlDZGFp?=
 =?utf-8?B?bTB1UFcyRlc4VlZlMXBLV21EWW5jSDlXUmpER2JUNTB5M1lXRzd4WjFKbEFV?=
 =?utf-8?B?TzZWTHNseGFLbjBKUDl5NmUxR1ZKd1hTQzIxaUdaZnlNdE9sNU9tY0N5dmJy?=
 =?utf-8?B?SjBmWUpZUTMxam9WU05TRG9JN2YrQ2FWRGRBVEdEYWhpRGE2YnNGSDM1K0ha?=
 =?utf-8?B?WUtjamxKRThnSVQvWFdZK3kxTWVPNWQ3THBmc2Y0U2JmNGdDamhMVFVuemxY?=
 =?utf-8?B?b29BZlFjbURoQzdrejh3ZXRlTWdFV2V0T1ZmbnptVWJYbVZiak9lSE5NR090?=
 =?utf-8?B?KzZ5Q0l5b204bzlwYWo4cnZWZ0FBS0tBT0pNZ3pHcjBCcWpUeklRS2RLUGNz?=
 =?utf-8?B?eWpsSFJlMjdsOFB2MWc1TzdlTCtrUU1vWjkra2E2SGJjTW1LRGhkd2trY0xP?=
 =?utf-8?B?SnM5SzFZZHBmMlZvakhsUmxnVkI3eldOMXRKTjBJVi9icnR4blZYUU1zdEJV?=
 =?utf-8?B?TUlKWmk5U29nRy85cDc4ZzVqZ3dLN3hOQ3JtZjRybXdvRlVKbU9PdkYrbGxi?=
 =?utf-8?B?VHZxVUl5bEt4VUlJWXFrTmo2clppcHFXVzZ3OStONmZjb1Nwai9Bcm11UlM4?=
 =?utf-8?B?bEQxZkRwblBuYVZ5dHlrOTN1WDhCamEyZkduR08xL2EwenFwa2h5cjdNMnls?=
 =?utf-8?B?RzVzUVhhRkMrUHh3ZFFaUU40L2Nlcm1jVTRGdFRJdWlVR1BzREs5ek1UVnVs?=
 =?utf-8?B?Vk5wbDNFQXhneDJ4RXM5NVBncysrQTJzUTk0eElvdDI5UnVVempXUFFQVVd0?=
 =?utf-8?B?bHcxeEpPMURuNlh4blhIM3NWcnV5VnJiSis1MDFzNjBKeERuZFZOcjJWL3lH?=
 =?utf-8?B?Y2JOdUQzb3RrM2JjM2hYK1hTZ0hOQUtFMlQzQUhBSEJucjBhekNzcEJUNHgr?=
 =?utf-8?B?NlJ6WG14YS92MW4rZ3BscG10Z0hOVWYvTUQ2THBOc2VNZ2htMFlYaWJ1VkJ5?=
 =?utf-8?B?TFRxN053a28vcG1iQ1pJTmRLZm5mQ0JuWk5IK2tmQ3BkWlVNS0YraHR1Vmw4?=
 =?utf-8?B?cGt5MEV3bk1JLzMyNFptS1F5cEtKMW1iemZMWmpKdDl5Y1hjakxDNldkTytO?=
 =?utf-8?B?MmVjOXVBRHlXZmdLa1pIVVVLcXBidU9WTi9peDZ0YnAzL3dEZkUycWVqT1ZZ?=
 =?utf-8?B?WWZWaVowUnhybGNBZWV3UC9jYnUzZnVOdHBzNGJuOExTSDlzSkY4cmdwQjE1?=
 =?utf-8?B?dUEzSTkyY0Z5WjJEdkJlVXhkSnE3Wk1ia3NnT082WmtXY08xbTFyZlJOdmIv?=
 =?utf-8?B?amg1SWtheGtCc1ZLV21Mc1JXSUplY2EwNmxGd3MvcjN5NnZhcmE0Q1NLQ2Jv?=
 =?utf-8?B?QUVVZnl0ZXo4Si9uQ3pXbTNrN2RpS1FqMzZHeFNld2JCaTU1SXZmNjRCR2xy?=
 =?utf-8?B?YmoyKzhyZHFsT01sVlJNSHlZL2dGc1J5TkhFZGhBa1RkZWY2c1pBNitNNkQ4?=
 =?utf-8?B?K2pKa0pIQjY2TUJJMS85MWRvb3d5dTFXdEUrdmQ3Tll6VDZhSFdLN3Z4bVIz?=
 =?utf-8?Q?/05On269xTyqeBXKP7vTQyUX5W/3+/7709LE2d8uM8Jw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b01c2c9-ec77-4ba4-60d5-08de0726fe1d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 11:28:39.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M57ZQ5xv2TFWv/sEGVfVZw49Gm1CGaJz0HtxcATlHpkxriaqMaBGQQkG7nfhbIIWYWUYW/fw7+nRcVnnWJYe+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335
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

On Thu Oct 9, 2025 at 8:16 PM JST, Danilo Krummrich wrote:
> On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
>> Assuming that register.rs is supposed to become the "generic" way to=20
>> access hardware registers I started to have a look to it. Some weeks=20
>> back testing interrupts I used some quite simple timer with 4 registers=
=20
>> [1]. Now, thinking about converting it to register!() I have three=20
>> understanding / usage questions:
>>
>> * At the moment register!() is for 32-bit registers, only? So it can't=20
>> be used for my example having 8-bit and 16-bit registers as well?
>
> Yes, currently the register!() macro always generates a 32-bit register t=
ype
> (mainly because nova-core did not need anything else). However, this will=
 of
> course be generalized (which should be pretty straight forward).
>
> Having a brief look at the TMU datasheet it looks like you should be able=
 to
> treat TSTR and TCR as 32-bit registers without any issues for testing the
> register!() macro today. I.e. you can just define it as:
>
> 	register!(TSTR @ 0x04, "Timer Start Register" {
> 	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopped=
.";
> 	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopped=
.";
> 	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopped=
.";
> 	});
>
> Same for TCR.

Patch 2 of this series actually adds support for 16 and 8 bit register
storage.

