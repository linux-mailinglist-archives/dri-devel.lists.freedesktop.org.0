Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDezN16goGlVlAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 20:34:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CF81AE675
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 20:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888B910E98F;
	Thu, 26 Feb 2026 19:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FYCiqLLZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA9010E081;
 Thu, 26 Feb 2026 19:34:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmog0qpJSpjdOTGrYITxkQb015y6VMiuuBfmbtNm3xFk5h9aw+wvH4mgGueGyuflZ7FuTQe/EbG9m3zcMskEVU/DP/z0lu1/+q2+x/waNFybm76dZrdXz/+anIsGXyYMS+NsMYBLea3ywd8pjRN08IUCx9HqR15SCRJ3ZjQ56gxbK5hm9rm3QRyLzd3Zj1fJJPWrOT6hlOkKMlFbjdmTYPF3kgclu4BLL7mqmQN98hClTB3jO2iU8aiGO5Ch+JTLZdHhoaUk7oho9EQ4Ztcf3wQt8PSCO1kEBUXe10SJI2uoxiYSzFjjEyRyHeUIH+yzsTHauZ/M1JjxtalqYrQCew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wHSi3pjValyWrBjLVT37rL2hXPwTAhDbStrp9d+/g0=;
 b=OWrYP+TQh3NOFoo5XDRSMg+p6SoD8yewgDcnibPApFNrnxa1Jg5TDVH5M1oa9RgQRYV9EFJ53NOEpYFFvEZRNFAL62hB//ZQhZFfy0dw3mpPLkDmkM55HCOeF87KnydLMCV47Kxd61dtLrUBWiU7+rCtU/b8St5OTeLPCmQwXS96CNQQKJI2audSAzjniSJqcGZaW9RLjc3Bc2Mw0mostyLHCF83lfro1fGrmAzAWXvaVE/gZSWP/AP/xqTwpFeo9rp5i61pOIWjGnObLowXnR2roeNq3IKI/xY6o8ctwt8u/5HP6agVb25LC3z+au1UyrK22K2snh7aDBFV0hXz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wHSi3pjValyWrBjLVT37rL2hXPwTAhDbStrp9d+/g0=;
 b=FYCiqLLZ5pckO3Jel8x2o9RO7yiDfgB92INWhrjqVsUWVG9eQq5QSEI3xbu0IqEau+5jFiYSXVl5Yy1UZkX7fJGJfUbJq5sPBYmYDUMzOXR2eIOQ/TpO2FFcuXvMrkO7eKQ1oG93VZB+Iexc0pM7AipVpTAeol183WOQXjCcILpeAYIqIhZwap3u4EDixiJUgNVzo6mGeVtpRw2hA6XN4LCjmr2JkSEpYzg0jAhm7Z5VQRnPCvHuIGsm5Cy2E/qQsEna1KbEkJCPvd+AP2+/6Ix/yKRkIgl8z5r9KDahdP8GTv43cuecZDnY5fOxplL5z9FH7QQ/danMCib3t1oQLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MN0PR12MB5787.namprd12.prod.outlook.com (2603:10b6:208:376::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.11; Thu, 26 Feb 2026 19:34:44 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 19:34:44 +0000
Date: Thu, 26 Feb 2026 14:34:42 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v11 2/2] rust: clist: Add support to interface with C
 linked lists
Message-ID: <20260226193442.GA4077409@joelbox2>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
 <20260224222734.3153931-3-joelagnelf@nvidia.com>
 <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbbb1a93-93fc-4ea6-bd6f-6f7fbfcc4710@linux.dev>
X-ClientProxiedBy: BL1PR13CA0320.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::25) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MN0PR12MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 532058d6-1b8e-462e-ac20-08de756e17da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: 6nPdqX3OqgQXtsz14/YuelpySacGzsWaQOpWAWxlxhqmwNQ2i28CohhYpOu2qo+b5HXi4VT8tRMBAyby3POzEx/DeGf2P58t+mBQ2GB1k3G+WXUtnbuu133ZyK3qHB5jrR/xTqB+7EZfKzU1IsK5G1bBoMmCWWEVjmGrZrAXYn8Pct1omksh+d+sGtpPskl4XPXmfXG2rs5qGBXo5XxC0oayIQ7zs9+nQYtILBbkhVM5i5JjHMeeg+gtRq/SlQrbPFbaFSB3J69QHZZN6skb9HkDso1LiHTW8pWGE39XvDdVUPefZiLDI/7XNOZXanyXhTydn/Jvz4bS/Im5+kWFZwJaJSHpLpT2FhpcDUIbh0i0FDU+LTPkRdIN0RtbL4t0fiEkvr9hfCssVFpC7IFER0tQWZI1NBlzTOUeNDwNuSRB7LSd3wwLQIntIPTfuOmRJYg0n8q4f0uqW0Dp3vbBUcXfjVKXPm7GgA3epBUPdCaHupank0KdRAtQpDTC9bQrj/hW1xs2TcCa0kALy23ywXZEbZjeboLqUiPH3xZG79F4ZQc4y2zaGhVRdl7VkXoAposCtolFqMv7wzH4qPvRP9Ux5uv2Ih5Y7PvMnfFUNlwR9RKfaQRGCiEU7ilEHwmDnFt965fIwodvNFGyWXywskctTTyP9lH5Pybr+n+PVlmu21gn7o+RykFbVXyH/JcHmiR1yj347O07oUvUGOoOnMIMn6oRtNh3SM8j1rP/1oo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1dhYzN6dWQwK1Y1Uysvb2xvUnRuQkM4aVd5ZERYc2hNRENuMkY3a2krbVpL?=
 =?utf-8?B?Sy9xYU5vTGtLYThLQjhlczNKSU5DVWM2NU9PaXV1WDR2WEJVRUJnVW5jNVRK?=
 =?utf-8?B?cHhRRVFXVnNNM2tRUGlmR1BtNyt0emNSVjFvTGwvK3NpVzZDQy9laHZZMElN?=
 =?utf-8?B?bDRidjU2dG15VmdrbkVxc1VmN0hXbVlPSlRxd1ZNNCtON21QQkRxeDJOYi9V?=
 =?utf-8?B?bUk0cStVSXZDL3RTM3dkUFZ4bFBIQU5zTWhqZHlHTmZGUlVMcUxjdzVrYmxk?=
 =?utf-8?B?K29YQXJwK0xZT1hlWG90RFVkK1RVZkQ0NitFbXJQOXdGNWNlU2RyMVNKMUpk?=
 =?utf-8?B?b0ZKQkJ2bHJZaVVSaG5XbHJhcng1a0hkWmw4bDREK2d5NDVqUXpXUElXdWZH?=
 =?utf-8?B?dlpGQWQ5LzFhNWNIdGI0cmZ3R3R3SDlsQ0QxazN3SnJMYmJLM1NKcDk5cDRX?=
 =?utf-8?B?M0svbjFTM1huejdoaWMvLzNWQ3lnUWRqemNEaXFuYzNBQVp6cDFZOU1QRTV5?=
 =?utf-8?B?dHc0TGlZV2hyR08yeFpxa0Z0d0o2TU5MZnR2Y1JMTTNDbjBWK1Rid2Rmclhu?=
 =?utf-8?B?aVhaNTMySFhNbzdwbWFKb3l6a3IxVXdGN0lHa0NCM1FYOGlOVmw5Sy9nbVN1?=
 =?utf-8?B?Y3ZkK05OdnJqUG5IbFVFdHFoSVVDeGk2K1E4OWlNTzZDMjVNTkRuNGk1M0FN?=
 =?utf-8?B?VmhRb0g3b1dkWlBzKzQ0dk5nT0ExNlE0VlUrKzlYYTFFdmRMVmxNdzlqdnhY?=
 =?utf-8?B?VnR2QVRsMW54U2RQTVJ1ekZYQS93M1lpdkltN1I4cDJIYm5Mc1dRbitRYzYy?=
 =?utf-8?B?RUdFZW9ZbTY1dXpPV0lWS0VuRUZoOXBjUVFWTWpEaVJKUENSeDlwMEFiK2sr?=
 =?utf-8?B?MGM3a2t1NDZiTFFGYUt3K0NOMVo1ekVTeTFUWGh6MVA5MEZKVWdxdnBEbjc0?=
 =?utf-8?B?Z1oxeXJDelBIWElIQlZQTGZ3SlF3U3hJUzZvV2JpMzVoNDVLRy9pQnppU3F2?=
 =?utf-8?B?VVRmTjRkbWpkcTA3T0xNZ3VtS0RkYXFmS25LQnJTZ2JPYUZKblN1WGY2YnZy?=
 =?utf-8?B?aVl6QkVzTXRxaEpNR1BDOFM2TkNXSExSWlo0WTRMTEI0SmlmdG5TUlF3cGU0?=
 =?utf-8?B?WGFQazhuQmd1Y1hEM01oS09DbGdXa1pQUk9EbjFJOTdueUxRaFBtZG0xUklj?=
 =?utf-8?B?ZVE4OU5uVi96TEc0WWFpWHdvams1dW5jOXBpR0ZrRnU5cWkyOGpya09GaThh?=
 =?utf-8?B?VklNMW9ObzVYdUpRNzVOK1c0Y3dsT3hOWWlmSE0vb1pUZGwvenRoWEE4bjJu?=
 =?utf-8?B?SkUvK3cwUmJHcFVFM1k1QUhxVmpybFIzQlViaTdjc3FiR1BTR01iUENMbHJE?=
 =?utf-8?B?Sk1XYjZJZFIzQVppRUUzZWlSMk1TMmx5cHd1OEdkaCtzc0xOaEt3RWwrcXBM?=
 =?utf-8?B?ZThBUVZkU3BwYmNpQnRLRjJ2UjF2MzJHejIxVmNUSGJLc2FOb3BqSmdLQjVh?=
 =?utf-8?B?bGVIMG9FVW9pVDQrbyt5dzR3UTlNRHY2QU80TzFtWFVsSnRoVE9LUkY2am5s?=
 =?utf-8?B?d3h3RlZiYXpUdVhDYm5OMjBUZVY4ZFkvNnNVV0NndFoxdTE5RUVXbUZxSEo5?=
 =?utf-8?B?Zi85cHkxS0V2ODJGTjVmRVFSUEpwNEFBSHZscEc3cE82U29DZEltU0szOVRV?=
 =?utf-8?B?MVB4OFNRQ1dMVmZPWmxENGVrRTkyRzd2K0pkbDFhRkJ4YnhEVGsxTWtHWnI0?=
 =?utf-8?B?SjNHOUlkWTFrSTE4L01LMVlvV29oR0JleUcvdnVOYnNnMXc0Y21KcThORm50?=
 =?utf-8?B?cU5Ea0RLdTVZMWNRSkJJWXIxRnYyRHVYelB2K2JRNVQ5bDI0cVZiTWdkVlBi?=
 =?utf-8?B?ZFRRb0ZPZW1SazdpVEsrUFVWM2UrQVp0d0sxY1l3N09tMlV6eU16SDQxSjI3?=
 =?utf-8?B?UUVTN0l4Ty9IOC9rV1pFam9EcFA2Z20xZjVxWG15RExEWUxPWS9DRHIvZzUr?=
 =?utf-8?B?cmxhUXBjOWo4cUZMaWVBNmcwRW5lZHI3LzBoUjNxdnpWSmVONXJvcklZZ2I3?=
 =?utf-8?B?dEhoUUt3SjMyVjRpOC9QMVBPaVh5RXY1WndoeDN6Mko4RFBSMGJHWDhXVlZk?=
 =?utf-8?B?WG9OWDZ6WDBXT2duUGkvQmJkb3VzOTZqcUpndFRCcXdJV1NBcXp2amd5WHpm?=
 =?utf-8?B?Q1dkc0J4OUxvRFlLQTJCamZPbzRxMnVoU2F3SGxOUUp4Y2Q3U3FVeld4ZWZZ?=
 =?utf-8?B?bVBiWk41ek53QTlreWZLbDM3dzFwUmhMVk1iU0tKS0Z1RStRS21tRC94em9H?=
 =?utf-8?B?SW1YbXQyUExRSXB3bGoweUV3Uk9BNTBHZDMvM0xHNmc3cDlNNlRtZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 532058d6-1b8e-462e-ac20-08de756e17da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 19:34:44.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUTRpmo283bUvQODzUtZiOu2F7P8l0Rol8phibgJSdx/thZozlhgV2N9KhOkak9nPKZSynQP+i9VoNaaOe2SUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5787
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 77CF81AE675
X-Rspamd-Action: no action

On Fri, 27 Feb 2026, Alvin Sun wrote:
> Thanks for the clist abstraction. The Tyr debugfs [1] I'm implementing
> needs to iterate over a GpuVm's VA list, and I'd like to switch that to
> a CList-based implementation.

Thanks for looking into using CList for this!

> Could you make CListHeadIter public and expose a public constructor?
> Or do you have a better suggestion?

I think this can be handled without exposing CListHeadIter. See below.

> The VA list mixes two node types in one list — GpuVa (with driver-specific
> data) and KernelGpuVa — so we have to filter/skip nodes and can't use
> CList as-is. With a public CListHeadIter and new(), we can implement a
> custom iterator (like our current GpuVaIter) on top of CListHeadIter and
> then migrate that code to clist instead of hand-rolled list traversal.

Looking at the Tyr code, both GpuVa and KernelGpuVa are
#[repr(transparent)] wrappers over the same C struct (drm_gpuva), linked
through the same list_head field at the same offset. The "two types" are
a Rust-level modeling choice for safety, not a structural difference in
the list — every node in that list is a drm_gpuva.

So CList's typed iteration already works here. You can iterate over all
nodes using a common Rust wrapper type (like a #[repr(transparent)]
wrapper over drm_gpuva), and then skip the kernel-reserved node by
pointer identity — since drm_gpuvm has its kernel_alloc_node as a named
field, its address is known. Something like:

    // Iterate all nodes as a common base type.
    let list = clist_create!(unsafe { head, RawGpuVa, drm_gpuva, rb.entry });
    let kernel_ptr = unsafe { &raw mut (*gpuvm_raw).kernel_alloc_node };

    for va in list.iter() {
        if va.as_raw() == kernel_ptr {
            continue;  // skip
        }

        // Cast to &GpuVa
        let gpu_va = unsafe { GpuVa::from_raw(va.as_raw()) };
        ...
    }

If you need a named iterator type (e.g. for returning from a method),
you can wrap CListIter in your own GpuVaIter struct that stores the
kernel node pointer and filters in its Iterator::next() impl. That would
probably also be cleaner.

OTOH, with CListHeadIter you'd need to do container_of manually on each node,
which might be more erroneous code, whereas CListIter handles that for you.
And anyway, the pointer comparison needed to skip the kernel node is the same
in both approaches.

Would this work for the Tyr debugfs use case?

--
Joel Fernandes

