Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iObxDaV/lWkqSAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:00:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC615462B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 10:00:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A0B10E2E7;
	Wed, 18 Feb 2026 09:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FaHf+QC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010007.outbound.protection.outlook.com [52.101.56.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD2510E2E7;
 Wed, 18 Feb 2026 09:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlAae+mo85A5Y6djeHGC7kMdQ1hvA+LX7q2faGmso6iVAyGpTnsqZGPpdEZ/lyYBHv1CySSoFPYJjiFLEZl/mO+iBuDwDQnuC0OSD9tBwokFsEahaZXVf9BV6skUwK35ZiBi8kaox9mzPefRcXPuSu0r7OZGaylBune2BjnxtaHlqFwGSKRe+HiqiF+obYxwwAEgjQRBD3E3k95MF132zbXwEv/e6ocZTE8XXGAGSOV6lRlI710N2WKC12jXYmVB2h1JpGgmn8adaZooCHZ8iiDiDLpFZYiNocbXMqnskvy8Il59ifivxcx0IicmITzoZF7r+5uH04Qa7rOeSowtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6dbupFW5A1Qe3xsGNsTzkOsxJDVhkWvESJXaocEZ6w=;
 b=udK/nfCdLq+4Umbljtwns6ceVmrTEIJYlawmxs1ZGsh/10chbrOuekUcMqjQao0dnKbbX7pufqRv9lF+Arm8i5WkWxcGakDFCLWlZIgsJcjt0kHVvr9qZWlwtVThT2MoMkK8bRVYOp/KAEumJRsndV9lDa6+QD9JLInC5joNLutSUh4n3C8D3o+8UnNZdXvU+WNZtSYi3Qu7r/h5YgLlMTlWGeG4X5+0SUAaDNWjPeJcf+btxFCjw+gZXQ90+QMTKsWlGGM7rt/s7gD2xaoCoU66CBsvLtAwyQ0LkUpzeljVwCkY1GzoEdtceDCi9Be+9lgwhua0th0dLRwZAgJEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6dbupFW5A1Qe3xsGNsTzkOsxJDVhkWvESJXaocEZ6w=;
 b=FaHf+QC5Hr6dbZRSXH+18ozae4EWfis0+EiuneT+Fz9PB5xQX1RaK1WtIUt+CZFo07QmvfJUNkzgA4e9DSfySGmO2us5AkkKKbNfCiLEvsE0y++VsHGFn55fGTsHYUOUKtUeda5/Dn2LY314CDS+YYUXn2c//Sk1cHnk7hn7KxUCtDYwfhGKx/9YIwv9v62Zd/VzrEHb72gzpaxMPXyBw3ySpPWljk6xWtUZO1MUblC5q1gYZ5Zj5QM4FDdYgEVpiuzWl2Laa8s/Daq/u1BJ1c9IiU1BtfqeIm0m+wMal5fPPaOcKWA2wgUyhpMvGusYQbWNaitxPJV+useeylPikA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 09:00:09 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 09:00:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 18:00:04 +0900
Message-Id: <DGHYQKWAKAWT.VK1MGFIOE6UI@nvidia.com>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpu: nova-core: gsp: support large RPCs via
 continuation record
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-6-73079ded55e6@nvidia.com>
 <DGHWJ721IK47.2OJRIZJFIVVB5@nvidia.com>
In-Reply-To: <DGHWJ721IK47.2OJRIZJFIVVB5@nvidia.com>
X-ClientProxiedBy: TYCP301CA0012.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS4PR12MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c631135-866b-4fb8-8ec2-08de6ecc1de7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1RNZ1NTNVcxZU02NzBWV01Md1RlaW4rd0pOUVE2aEFvL2NvNFYvZWhJeTFY?=
 =?utf-8?B?Q0pJNHBhOHNRbTltck1UZ2FrRStqZzV0VFNobXE4ZDJBNERxbk52Vlhramc4?=
 =?utf-8?B?dkdCMmdGMlMrRlJKbFk3T1E0U3BFQUNaa2I1RGdSU3lHNk9UTDNlUWd4VVpJ?=
 =?utf-8?B?K3NoUFdKdDVtNTlyc05WYkFJY2tlNk5YMnIxbFZnRTlmM1l6Y3ZMMXdONTJY?=
 =?utf-8?B?MW9TTC9rSlBXbm1HVE40NS9xcW5KUXNsaGRvU1lQL2pyNnBob29KaElORC9R?=
 =?utf-8?B?ODU1WDBwK2ljQm5GR1ljWktJR2ZHN2ZtTUJIT09ic1VraEZveU9pZUlqSDQ4?=
 =?utf-8?B?THZhOXI2TVJwdDhWUWxxQXdyT043TnpiWHNCUkx2eHJ4UVlIckkramJWL0dC?=
 =?utf-8?B?WHgvY3ZTK3FQQ1MwVnhMRDI2UDFKVFZpUDBEVDZPenZBQkprWWhrcjErbDV4?=
 =?utf-8?B?SnQ5SlNmS0ZGVGl5RDE5L25UM2s4VldjTGlIYWRCNGV3Snk5K1hIdnl4ZTV6?=
 =?utf-8?B?c2NvOWJxQkFWdFIrcTVoUmRRRHJBRUFZejllYXIvbTlGOEhNL2h1V0NCMmxz?=
 =?utf-8?B?L3lKQll2T3U0ZGY1Tk5WZkJaVkRpU3NVQXdld2Jha2R0QlNzSE9YN1pHOVFj?=
 =?utf-8?B?Y1JsL094R05LeFZnUUpXeFZsSzBkb1FJSE1xdERMSG1hWW85MFhseXZUUWVG?=
 =?utf-8?B?T1Z6TXpaYXZjc0sxN0tPU1Z6TktUTjNZVmNmYjZ1ZHA0SWpZWS92RWhHb2g2?=
 =?utf-8?B?UXBLdEJnMmN6T2Q4aGNUUzRkWGpnR0laOTNWZ0hDN2dUV000dDd5N2FqTUFH?=
 =?utf-8?B?MlBMUDRabmVjc0xqcENzU1VrcE5WWEVhU1hXeEhQUDRGOUZ0Mk9aT0pQL25V?=
 =?utf-8?B?M3kwVkQ4a0hwOEh0bHI5ajdoWHZOYkZoRzYwM2dTRU1nY21VeDVIL1M2YXZt?=
 =?utf-8?B?Z2tJdkpScitVWGpvMnlhemwwMGJ1emNjOGJGZnIyL3QrZEpjVUJ0bmJkRkFo?=
 =?utf-8?B?OVhZK3ZJWHNXV2F2bGEzaERZNG9YUFEzWW1Wai8vQ0taWE04MUNxdTdadzI0?=
 =?utf-8?B?RVd2WUxvQzRRR050S21yYUNkL1RLSWZ0VjdOdDdEWGhtTDBRUVV0R2x1SC93?=
 =?utf-8?B?QXc4VnNXdlhqVVkyT1hEaW42aXdocTNvSjNwN2p5c2taZDBRdGtRSHRJWXN2?=
 =?utf-8?B?VHIzN20xMVljSUMxcG1QSVhTSkhjOFJnTkJQKytLdCt0WFduaGF0SlRHSmJL?=
 =?utf-8?B?cFZJVEFOaDM2ZlRkWlFpRDRCbEFTZjMxWnVXN2xjV0JvUWdsWnREMkFzY3pv?=
 =?utf-8?B?bEtFUUYrZ3FoTXdsQ0pEY3pMTGF6VmNXVDh0OVZLRFZmQzRSc3p2R3dicGpY?=
 =?utf-8?B?bUMycS9vM2RzZFBFaG9PajJrQllCUzY2cThiZUJFZWYzTGFlSWdXUFJLQlEr?=
 =?utf-8?B?NEhSYTY2RE9WYU5GYzdIQlczWXk5eUFkZkpuWWNoV05zcmNNWmhRWlpjbmFl?=
 =?utf-8?B?QjFaRmpDN0VsS3Z0ZEdBalEzNW81K3dyTFBBYVpxU2ZkMHM2M2loa3VuRjBl?=
 =?utf-8?B?Z3R4dWRxOHp6d3dxTUMzT244MmYyVFVwT0k1cDVWdXN1M2VlcC9WVVY1eEJD?=
 =?utf-8?B?UWxnTUdWaEtVaGZJUzgxVk5XSktQZmxVSU1Ub0VDSldadjN1dFVZUVpuMlIv?=
 =?utf-8?B?anBBemhKTCtSMW1wT2hFMXhlMlZoN20veVN2WHVLc3ZmVUlsSkFQWVJVYVpG?=
 =?utf-8?B?SGIxckZPV2JnR01OM2ZuaUc4aW9UN1h4Wkd1MXNkdmNTWTcvRWppZkdQLzhI?=
 =?utf-8?B?RFBVSzF2bVJhbTR6MDFWeEVCZGs0T2orT053akZGQk1qb2t3NEZ2QXJacnRa?=
 =?utf-8?B?TFBjaEFHdngwaG51bTRudzZtTnZWenc4QmVxL2ZBUmY1bkFGbzUvVjhndEV1?=
 =?utf-8?B?eWNTV3A0NWRjVzl6UTNxT1VONXY3K1M0bDFDSTRaRUl5SXI0b3RkMmFFZDY3?=
 =?utf-8?B?dEhJRm5RcmpKUUpUcGhKNThlQXVqdnpDRmF2SzAvV2piRndsbkl1MTBLU3RZ?=
 =?utf-8?B?dU4vbFRCSEVlOERzMzROWmxua2pEMm9yWVdiN0ZORjQ2SG5va3JCYWpTY2JV?=
 =?utf-8?Q?tawM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmxzRkpNUGZreXJOYnRacUYxRGpDNVhDOFM4YjYzMkhLUVlHMUZITUp2TjAz?=
 =?utf-8?B?NkdPR3J2VlJvVEQwa1JGY1BWZmFLalhiR1lNWjhhV0NSTkIwWjhDTXBRYnY1?=
 =?utf-8?B?SUZPZ3NCaGFPdFFZd3RKbTNSTjdJUkpwYjhmZUtJaFNtWldxcWhydzRiWFVG?=
 =?utf-8?B?RVRkcWlxNTZEaEVZZUtGM3JKQ0xPNE9vNHZHMzZXemNqeGMxYms0ZzNLdHBQ?=
 =?utf-8?B?di9QRnBLZzZEVHIxa3M3RHJPK0xWQWNNakNRZjd2YlJLdXppdlNnWmppYXIx?=
 =?utf-8?B?QlJUcjFKbU5wOFBKZXVHcmNRN2prSFY1NzFFRjU0VE1kMG02T0xQWTI3QVY3?=
 =?utf-8?B?a0kvOVU3VlVXZ3F4ZXExNFlIY2dxU2hkWHMvRzZxV1BVazA3OHZZOXVGNG1z?=
 =?utf-8?B?SEJ0SVJ4dy9FWUJCUnVSN2hDdFFNNzlwSUZxY1VvT25xNWZabk96TVg3ZUZF?=
 =?utf-8?B?VGswM0o5dVBKZ0s5Nmt1NWRHUUtyb2ZkMzh2Y2RRTkg3Tk5WVDNJWnBDSG1N?=
 =?utf-8?B?SGVzancvV0NHY1h6K3ZEeEFhU0UycXRiREZSc3RxUFl2TjVBOTQrNWhwVlZ1?=
 =?utf-8?B?ZS9NdnJrQ1IxUXhwSEg5Ymh5M0R1MGRUMXVPQS9XK1RISlcxbG5rVmh5VXp0?=
 =?utf-8?B?cG5TdXJOb1lHNGdoazhsV1BnV2ZSZ2w0aFQ0QzcyQUkxeDZuVnZ0WnYvZGJG?=
 =?utf-8?B?WlYzcjloUUEvRDlCa3cxM014OE91TGo2bjU1cVN2SzJOcHZCeXFBcVAvdFBh?=
 =?utf-8?B?M2JNVm1JVHp2YkRROG13VklsN2lSeng4dGhOS2RYZC95T1RYY0tqLzJya3ly?=
 =?utf-8?B?OGs1UnRKclhuWXpNdFZiVFA0dG4wMGd0M1JBaWJxNVNBVFh5cXRHQVkxb3Vh?=
 =?utf-8?B?VW8vR0t4dkJLd1hpRitNRjVkcjczc2F4QWtzRnMvYUJHMG1jMGlNVlRQSTdH?=
 =?utf-8?B?U1g0NTZxd2p6eEN3UWRHNGtzbUJCRGs0NjZTbUZvaDUrWmxhdTJKWjZsdlMv?=
 =?utf-8?B?Vy9nV3U5MTFTdUY3UExBN3lkQ2VDcytHOEhKdDhvOEtVRnVLVnMySEx1TVhq?=
 =?utf-8?B?b2daN3RiM2ZiMGRCdzhOc1RhRE50djROalFYVGNiVlJUQjNGRkNvQ0ZTSTFx?=
 =?utf-8?B?SHkvNzhYWHZiZFozNDJDazZqUnkwUGNXYU5VaEdMblB5d0FzR0pLb0d1dkpz?=
 =?utf-8?B?bDczWGd2VmdIS1N2a3Y1SjlPbXRrQjBqZXJ6eFQ3K1grSkUxTENvTTVQNW5U?=
 =?utf-8?B?SmJZVnU3TW1UYnd3cnplRTB1b2c1NzdqYllsd21oZ2hLc0pCZHBHdzBUTnZW?=
 =?utf-8?B?L09iVXFPU0RmWXVHSm9Ed2N6R3kybjdYSGhaMFltRWN0MUtITi9hTWJvc3pC?=
 =?utf-8?B?RE45Mlh2TDZveCt1WjhhdGdWMEY3b0lpNmV4ZWd4QTNSWW5JK1Bqak5ya29E?=
 =?utf-8?B?OVR5YTdZSVlLOUQrSFZqeVpoNVViUThNRkJ5US9OTjMwNGJVUlFyWjlBdFgr?=
 =?utf-8?B?UnRjUHdvVTZ3OUFoUzZMWThCcTdxQmJaNEJDVzJHRHE3dGFmSkZZWlBIRVlM?=
 =?utf-8?B?bFFrY2NJYmw4UGFqNk5RRnVjZXQxRDNOaDRBMk1tM0ZiZ1ZObGp4M21aWHJJ?=
 =?utf-8?B?NHJDL0V2Z25EdkRINkpZTHpBM05NNGpLZVQ3ZWtzZzRsVkIrQlliY09JaE9R?=
 =?utf-8?B?bVphM0haQlZ6UWxZUzVLWHVwQUZETHA2aG1yTmg3ekc1U3BOWnFIODgyTVFz?=
 =?utf-8?B?UHZVNVk2QlhDMk1UZmlucWFwSTRaUlJZZkxSRGVBQjFFSm5QWC9NYy9Jd3pu?=
 =?utf-8?B?TEs5TUJYWlhZVEFTcU5zQS9qTm1ZamxZZzlJaHk5N3hUMHVWVUZ0WVhraWw4?=
 =?utf-8?B?ZXhHYU85WDBrUksyY3d5aThOUjM1OHB2dzB6bm4xUmJEc2J3NEZFS3lNT3kx?=
 =?utf-8?B?eXZiZThGL04wL1dXVjBGUm50azdsZVdhckVkTVJaenpQdnJSeHdNa2duUktZ?=
 =?utf-8?B?SiszTVJ1VVI5Wis0bmp6UUxnWEJCM1ZCemhlWkVFM0g5UU9UYy9IQXBveU9k?=
 =?utf-8?B?K2h0TVNXZlZrVHFNcFJDeVRsdUV3ZE9VRmFUaWNhZEc2dEE0VGl2VXVwQ1Zo?=
 =?utf-8?B?MUgwQkNSb01VOUJOYVBUWS96ZjZkTHJvaG9KdHYvaTVIa24rMklPcGJwZDc4?=
 =?utf-8?B?SXd5NFZ2V2xxUFpCUXpTb2YzRWJybWNEQlRtWjZ1c3NIQmpFZVkvRlVpT1do?=
 =?utf-8?B?QUNyTnhiMzhUOGUvR2Z3dVZUUERjZi9xR2l2M0YrUzNTWUpDWTZyZWJHeXVk?=
 =?utf-8?B?SGFlTlplZWp0c0NPMk1UTElSNjFpZ0UvSzVOSHFOOHJ6aHBDdnBvWkFmS0pk?=
 =?utf-8?Q?Ia2LVEXpnp07gOWXv7TiGaZhn6cQA0DWjyMXi+D5MQKNd?=
X-MS-Exchange-AntiSpam-MessageData-1: rfUdNVUAIxPhKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c631135-866b-4fb8-8ec2-08de6ecc1de7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 09:00:08.9973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvrpClQwM0wRYRu5g9xc4cHxl5QHByUS9cJshvQ/ZttYI6hq/W9/jrV0XhqMBNTCr1tXEu5apcss/XPXb6VMYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 9BAC615462B
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 4:16 PM JST, Alexandre Courbot wrote:
>> +    /// Sends `command` to the GSP.
>> +    ///
>> +    /// The command may be split into multiple messages if it is large.
>> +    ///
>> +    /// # Errors
>> +    ///
>> +    /// - `ETIMEDOUT` if space does not become available within the tim=
eout.
>> +    /// - `EIO` if the variable payload requested by the command has no=
t been entirely
>> +    ///   written to by its [`CommandToGsp::init_variable_payload`] met=
hod.
>> +    ///
>> +    /// Error codes returned by the command initializers are propagated=
 as-is.
>> +    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) ->=
 Result
>> +    where
>> +        M: CommandToGsp,
>> +        Error: From<M::InitError>,
>> +    {
>> +        let msg_max_size =3D MSGQ_MSG_SIZE_MAX - size_of::<GspMsgElemen=
t>();
>
> This could be a const.
>
>> +        let mut wrapped =3D WrappingCommand::new(command, msg_max_size)=
?;
>
> The `max_size` argument is a bit unfortunate as it is a constant for
> non-testing purposes. Is there a way we can make testing work with the
> same limit as real-world use? That would also make our testing closer to
> reality, on top of making this argument unneeded.

Yeah good point, will do.

>
>> +
>> +        self.send_single_command(bar, &wrapped)?;
>> +
>> +        while let Some(continuation) =3D wrapped.next_continuation_reco=
rd() {
>> +            dev_dbg!(
>> +                &self.dev,
>> +                "GSP RPC: send continuation: size=3D0x{:x}\n",
>> +                Self::command_size(&continuation),
>> +            );
>> +            self.send_continuation_record(bar, &continuation)?;
>> +        }
>
> Btw, can we recover if a split message fails between two continuation
> records? I suspect the GSP will notice that the next message is not the
> expected continuation record and recover from there?

IIUC neither openrm or nouveau can recover from a failure during sending
continuation records. What failure mode do you see happening that we
could recover from?

>> +#[derive(Zeroable)]
>> +pub(crate) struct Empty {}
>> +
>> +// SAFETY: `Empty` is a zero-sized type with no bytes, therefore it tri=
vially has no uninitialized
>> +// bytes.
>> +unsafe impl AsBytes for Empty {}
>> +
>> +// SAFETY: `Empty` is a zero-sized type with no bytes, therefore it tri=
vially has no uninitialized
>> +// bytes.
>> +unsafe impl FromBytes for Empty {}
>
> Since commit 209c70953aa (on master, but not drm-rust-next yet) you can
> just use `()` as the `Command` type - that will let you remove `Empty`
> entirely. You'll then need to invoke `pin_init::init_zeroed()` in
> `init`.

Great!

>> +
>> +/// The `ContinuationRecord` command.
>> +pub(crate) struct ContinuationRecord<'a> {
>> +    data: &'a [u8],
>> +}
>> +
>> +impl<'a> ContinuationRecord<'a> {
>> +    /// Creates a new `ContinuationRecord` command with the given data.
>> +    pub(crate) fn new(data: &'a [u8]) -> Self {
>> +        Self { data }
>> +    }
>> +}
>> +
>> +impl<'a> CommandToGsp for ContinuationRecord<'a> {
>> +    const FUNCTION: MsgFunction =3D MsgFunction::ContinuationRecord;
>> +    type Command =3D Empty;
>> +    type InitError =3D Infallible;
>> +
>> +    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
>> +        Empty::init_zeroed()
>> +    }
>> +
>> +    fn variable_payload_len(&self) -> usize {
>> +        self.data.len()
>> +    }
>> +
>> +    fn init_variable_payload(
>> +        &self,
>> +        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
>> +    ) -> Result {
>> +        dst.write_all(self.data)
>> +    }
>> +}
>> +
>> +/// Wrapper that splits a command across continuation records if needed=
.
>> +pub(crate) struct WrappingCommand<C: CommandToGsp> {
>> +    inner: C,
>> +    offset: usize,
>> +    max_size: usize,
>> +    staging: KVVec<u8>,
>
> Since it is conditionally-used, `staging` should be an `Option` instead
> of assuming an empty state means it is unused. But hold on, I think we
> can do without any sort of conditional here.

Yeah you are right. I had used empty here since it makes
`next_continuation_record` here more consistent in that it doesn't need
to check for None then for length anyway, but it's special casing in
`init_variable_payload` in a very optiony way regardless.

I reckon using Option we could put `offset` in there as well in a tuple,
since if we want to use Option to avoid the special case of empty
`staging`, we might as well use it to avoid having a conceptually
useless `offset` field too.

>
>> +}
>
> This deserves more doccomments, including on its members. But I would
> also like to entertain a slightly different design.
>
> In this patch, `WrappingCommand` is always used, including for messages
> that don't need to be truncated. While the overhead is arguably
> negligible, this makes split messages pass as the norm, while they are a
> very rare exception.
>
> Also `WrappingCommand` now becomes both a command and a provider of
> other commands, which I find hard to wrap (haha) my head around, and
> forces you to pass the command by reference in `send_single_command`
> because you need to use it again afterwards. The name is also not very
> descriptive (why does it wrap?). How about this instead:
>
> `send_command` is the central path that all commands take, so it is the
> right place to check whether we need to use continuation records. If we
> don't, then we just send the command as-is, as we do today.
>
> If we need to split, we do it through a private method of `Cmdq` that
> consumes the command and returns a tuple `(SplitCommand<M>,
> ContinuationRecords)`
>
> `SplitCommand<M>` can be a wrapper around the original command, but that
> initializes the truncated part of its variable payload.
>
> `ContinuationRecords` implements `Iterator<Item =3D ContinuationRecord>`.
> `ContinuationRecord` works mostly like your current version, except it
> owns its data (yes, more allocations, but they're smaller so the
> allocator might actually appreciate).

Is it really the case that more, smaller allocations is better if we are
using KVVec rather than KVec? It feels like it would have
overhead/fragmentation to me. Eager to learn if this is wrong though

>
> Since `SplitCommand` is only used when there is actually a split needed,
> `staging` does not need an empty state anymore, and the code of each
> type becomes simpler.
>
> By doing so, you also don't need to pass the command by reference in
> `send_single_command` anymore.

I considered putting the continuation record logic inside cmdq, but I
feel it's nicer to keep it out of the core command queue logic as much
as possible, because it feels a bit noisy to have in the cmdq which
hopefully can just concentrate on sending messages, not how those
messages get made or how/when they get split.

I agree that it is a bit odd to have a command that also provides extra
commands. By the way I considered doing an Iterator thing for
WrappingCommand, but felt like it would introduce more complexity
than it was worth and make it more confusing on the command that also
produces commands front.

Another benefit to pulling the logic out of command queue is that it
makes it a lot easier to test AFAICT. If we want to test the splitting,
if the logic is a private method in the command queue that feels like it
might end up more as an integration test.

But if we just want to avoid having a command which also produces
commands, what if we created a separate type to hold the split state /
decision and it would return a SplitCommand plus either an iterator or
the iterator-like `next_continuation_record`, while being testable
separately. WDYT?

>
>> +
>> +impl<C: CommandToGsp> WrappingCommand<C>
>> +where
>> +    Error: From<C::InitError>,
>
> This `where` is unneeded.

