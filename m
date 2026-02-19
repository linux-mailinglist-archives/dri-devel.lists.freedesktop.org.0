Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CGAH/Qrl2nmvQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:27:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E864F1601EC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4CA10E6F8;
	Thu, 19 Feb 2026 15:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNAregNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F0810E6F7;
 Thu, 19 Feb 2026 15:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0BMeVExOdEhSltPIZZKFFZHhq89CxPjXrsfSGQHIXA+qqfXuL0fqvW0i9523hMJe8g9XbWXXf+2U7Tl95qfpi0Z6H8JT5N6m5f7yDLWjHmWBfW6Rva+Pi/NS2SxZ/WVFVk9cJBWD1o6Qv0UiQ30xa5vrOxLGyTmK08lQ/EL8c81Hx6FLCVRDLKPC1yx+OyV0DlhRb28Ll/v//CC1PiAw2ok8L5PM3+AWaRbuJYRmC6LtXGKISi1Uq7jFwyT+taM9bd/MxVuvXNV9H9NED53L2izfPWVS3cd8r161Xwy8lAS+NfGxCBi8QuPwTdfigPvKS1FAEuQixcaB9LiJmq9ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnKvOhBG8O32al+XN/IFZivMzVRp5ky+hHzUXUTwWoE=;
 b=UIs1E4y+jKF/IkycoIm0YAPLGI7ohH4KbyushkIMgJ0E8kaw3QqnvIojALHkAplECl1+tsx0v59A4hwOOHX0TOfYnst+OgbH/K+FwqPC7bhJiBn0sAVl4LbNe3wGsbur5nlwCDyC9zKkjxvgYoDyhqtp0EO1QMv67YBCDFZrGZ8OpjBS51iFee5w7NL0+ZRqZkc3Js7NrU8r9186cwLx71Km/qkpB9DwnKrnSQi6hYehOcH/J7U9sLwNE1Bx207riU+Pd451kBYlsycO30p/I1wRnJEA0kTxJ9MKsx6e/RI/29LIgmnonKuoTdqiUOq2p3tY4n6hPBs9LMUbAr9DkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnKvOhBG8O32al+XN/IFZivMzVRp5ky+hHzUXUTwWoE=;
 b=cNAregNMia+G05k0nxySNj02w6VVT4ZtDMoJHWO2SJR0/hJK6VhqVaqtB8bgDlAWnd3HfumqHm4V/Cl3HlE6iKT/1cx/5Am9sV3oI5y4vlF+cxIOwfGzrW9bSClr6yWR/h/Y7VCuR86wyyQmA2mNS7wrSJy/eVtsMIUjW3XYlwxOIIb2qB4tTd/4r45TBAsOlvTTUh1GbcRiMj4u2Ue2kYE2OQ/8OGLwWfwt+xDucnzw0IeRYI3L0JWwSxLfYn7BsWSSBitHDAVAgYj2voLpmsmucykBTZ/oAdHsVoNx1VaJSyaiDAjfZ+qDcled9MaQJtXcGpSwJJals01yeQa/yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9437.namprd12.prod.outlook.com (2603:10b6:408:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.15; Thu, 19 Feb 2026 15:27:38 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:27:38 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, Björn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, Nikola Djukic <ndjukic@nvidia.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
In-Reply-To: <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
Message-ID: <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
Date: Thu, 19 Feb 2026 10:27:36 -0500
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:208:52f::23) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9437:EE_
X-MS-Office365-Filtering-Correlation-Id: d27db625-0204-451b-e844-08de6fcb6a09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0FaYmdUWnpGRk1ieHFtTWIvL1ZaTmhBeEY5ZU9BdVU5TyszSnFYZ0xZVWdQ?=
 =?utf-8?B?cGxtRHczWEhaVUd5VjNFcHpQODc4ZnFHcytaUDl4MVBjbnFKRVRiNTJCU3FJ?=
 =?utf-8?B?QVYrWGgwRFhkdE1FMEE0Sk9uMHNtZFFoOGNWVWJPOWRzOE9TaFlRWC9XMWtC?=
 =?utf-8?B?MHZkOUJJbFB1Qm1BZDVjREViT2ZXR3k5S01oSDk2N0kzSVEzdWdwU25wVDla?=
 =?utf-8?B?cDRTUEg3TmlTcVNWdk9ialhHQUVLaktTaHNDQXNDVU4yaUVUc3Fvd0tLVDFN?=
 =?utf-8?B?QmVnNW9teTFtcjk1MGVwS29PVTZsbStTSElrTmxOQ0dpV3I0aTNUUU1zLzNV?=
 =?utf-8?B?UHdIcm9EeXkwOGJ5QjdadStLU0dyeE9UNFE5dVBZcmFpMHJKK1ZMK2NydStx?=
 =?utf-8?B?V3RiaTRYOG9iWnlrelR0MzBjVE9nc3FMNG1MZzhzaWEwZ3oxSGllZ05GZkhz?=
 =?utf-8?B?dUtwUkhDc252Rnk3WC9TcVE1VjV5bE83YmljcktUSDdwQ1plZGNEZ1djRlVD?=
 =?utf-8?B?R1IvdXF2S2FSRFlNOG1vYjBxUWZxSk10a2lpZExuMEVyQkhIeG5zaTRlWGI5?=
 =?utf-8?B?cktLbG9YOEpjRkE4U0IzRjlVSk1vZkNuaG5sK0E5czU0MWFiY1g1WmEyWUUx?=
 =?utf-8?B?WlFrMFMyZk1JRHBMYnVvRHZObkpWRnV2MkxJSkxRbElNS1BhNEFUYlNkQXY1?=
 =?utf-8?B?VVdGZHoweGxyOFNhcUpKQ1kyVzdGMXIxV3FrUVZZK1hMYThnTTY2VlVneWJz?=
 =?utf-8?B?bTBiS2JQWWl2MjZpWUF6bFRpZXRidnc5WWVVLzAyVlFwVHQrZzZXb0ZqWGZv?=
 =?utf-8?B?WEtURW5zSUJhTkJRWUk0dkVXTnNQSzlhUURieGFiYi9iOWM0elkyZFMvYzQ1?=
 =?utf-8?B?eUpxQ0xTZnB2aU1INXkyRk0yayt0WE91dUo1bForTmt1QVl3elE2cWx3S1dx?=
 =?utf-8?B?MGRtM3cwV0Zzb3hqclkyWDNaNnJ1eHVURVppK3lONDRqRy9kNW5iajFWelZE?=
 =?utf-8?B?LzJhN1hUcWlha3NoMkhtVGlUWFNtLzBKSC94eTMyaWl6RzkwMXlSNWhzd2Nz?=
 =?utf-8?B?V01aL2YzVlRUbGJGdWNxc2FQbEFQWTRuektYcE0wVit4aDlvNC81MzJUeWd5?=
 =?utf-8?B?NzhFOGFwU2VBMHE5WldDNjQrT1doVDVCUXhBWnQ4OXplRk05ckV3MFFzOVpv?=
 =?utf-8?B?akQ2dHNodzlXeHFzc05OTmtMclpreXFFbm9qUURKM2JDUTdLa1ZGMlBvYSt4?=
 =?utf-8?B?clRmWlI1SnptV3cwVnVrVmxsY1EySlA0ZG1RRXdleTh0WENGb2ZieFFNa1A2?=
 =?utf-8?B?Rll2U0RNT3U1SytjbU8vc045RjB1cHdFREN0eThVOXJ5ZzZ0UTVTS3lCTmVO?=
 =?utf-8?B?Zi9iZi9IRWFtazVWdEhtdkJMU0V0aXo0MzdzNG53TDlybElSMDhQam5CRE5X?=
 =?utf-8?B?YWNPdFFSVHJtbUFQbzNvdnBxb2dWbjN0c2ZaMCtoN3MwMjZaYlA4dFVrdGxC?=
 =?utf-8?B?SlAvUUFpNnJSNDlzVmJ3aEMwb0lFWHZPL1dxb2dHNVdLSGMyaW1ncTJIdWgy?=
 =?utf-8?B?Uy9DNG9sUkd1cG9EUHFrOVlSWXJtWDR0U3E1UmpsNWNEb3FiUlZVdzQ1ZE90?=
 =?utf-8?B?RkhaQmxlWDdMaFh5OG9PQldKUmM2bzlKRUI0RTRtOVc4a0JRSERrcjdHa2xN?=
 =?utf-8?B?d1l5MExqbWpOQURFdEtsdklROEVNUTh3cEV5ZDZnUmNYY3VPVXRWNE52bjBV?=
 =?utf-8?B?UkJnd0h6NmlMSDczUzFLRnppd3czUWpvR05EVVZqTDJzS1Bxb0hOMlF4aW51?=
 =?utf-8?B?SldhUEVHWDJ2NlIzclFSTnAwSGUrOUoreUJadDRyOWhwZEprNXd3VnpjRVg5?=
 =?utf-8?B?bndOMUJrWStiTEFPVGRVaWMxSWxQaFpqNFVRSm5GZHBzK05RaUdBSk1zeW41?=
 =?utf-8?B?KzZ2Z2thMzVzWWh2V0syeWt2UzhSRnBQbkF4MkRNSW8ySFRRTEF5L0xXcVZV?=
 =?utf-8?B?c1dKaFJQbjBuU1JwUFF0U0s1Zm1YWkhIcWt5Nk5GMzg2ZHcwb3FoRDYyMkF6?=
 =?utf-8?B?ZkdybXZ4UjVIOGNHaWtyenZFOGRHbklNN0VtY2o2T1BKZjc2eVhnTzFyLzJF?=
 =?utf-8?Q?4otU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFF2Qzl4WDJPMnlUOVY3Wnk3ZWxKVXJOTWFrb0xZUnlaU2FvS1gvS0w1eFF0?=
 =?utf-8?B?VENNeGlwWVR4d3BwWGtoT1VzMVFnT1FWbTRzMzU5RURESmZzWkIxOUwwSWxH?=
 =?utf-8?B?bHo0V2txZlRhN3FYNUJNd3lSM1hrMWwvcEUwVC9NbkxHYVd3ZndXNXllazJr?=
 =?utf-8?B?WVh1My84RlN0T29QdmhPemFGdk5KMTB4SThJS0tDd0p4UGkrU0NpeFB3eGN5?=
 =?utf-8?B?YW4rVGpTUXJPa05EYUNTdGEzUDVDczEzWWpCaTBXWGhmWlVwV1h5N0Rvd2FV?=
 =?utf-8?B?SUl5eCtrVVBZaUlGbTk5QzZOM21UcHJrYmY0TlFFaWhYNllYUVBWVVhRVWFk?=
 =?utf-8?B?TTBVT3RJLytRQU9RN3pTVGhlUERVZnJGU01oR1g2L0IxTWdGQzZUL3hOZ2N6?=
 =?utf-8?B?TjFDWWhhTkFIU1pqOXdHWVlRbkUwVnF1VXBtSnhwaWE0dWE1MFBpc0xuSko4?=
 =?utf-8?B?RzlVTk83bGEwdmQ5N21hTytLb2pOSSs0MGN6TDk2Q0RPZzA2ME5EeFRBelJz?=
 =?utf-8?B?elRBZDBYOHAvMHM5THhCQ0NWVlIrdnduY3ZBRm4vckhQeHMvcUUzUEhTRmJo?=
 =?utf-8?B?U0FjZW16cVdDSTZ4dGNCK3JtUFI2OFVIZHVGTzQ3c29qTGtvSnRSVStqOEVy?=
 =?utf-8?B?RERmN0JhTEg2ZzkrV2QvSWxoa1hjblhFNm5zU0x5UVFFQmVsd1ZVd2RJc3Vy?=
 =?utf-8?B?YnQ5aDJNOFZaZkE0a20xcTdJaGRMU0o1R0ZOcEdQWTdhUXJBbUpJZzh4S2Nn?=
 =?utf-8?B?d0l5WUtneGhTNnpqUVNhdnA2dktTQUhSTWJCTlp0bXNsM3crSFVZUmhwaXY2?=
 =?utf-8?B?ZU9HVWU4UVFMdG11ZmFPR0p5TU5vaGtuNDRrei96MWovUmFnYlFNb0hBakgx?=
 =?utf-8?B?blJSZXRKOGlucmlQRStERjczZWEzUmpzVDZzRFF2U0ZGWFh6Tm1zTW4zd3lF?=
 =?utf-8?B?NkNlNDBrTHk1Z214M2FqRVIzTlI3RmhOMGZKckNQb3oveDVScXFJSlVKbHYv?=
 =?utf-8?B?MlJ4Yk1nSENZS09TQWtRRGRlR1pEaVJ5c09NSktDYTR4bWRVZWRyZm1BNzdT?=
 =?utf-8?B?RjNHRFhMQWtNbTBzUFpnK2FzdUJwdnkzZmlKQmZ0cWJlYlYreGN6WFJKZkZH?=
 =?utf-8?B?UDRSdGsxemxicmdPME1tMTB6dlk4dkd2ZGRBdk5tbW9weG5nQW4xNk9jQnRa?=
 =?utf-8?B?ODk1dUl3cHZxdGpYT3VYNUZ1MjMwYjd0Qjg3QmRxQXJpMmlmaUhIZzJvMDZ3?=
 =?utf-8?B?Zmg4alhQdTlwVVIwNkxDQlg5SlBaekRuNThEb1RBRDUydVRWQ3A0Y3Ntc1Fy?=
 =?utf-8?B?Szc0SzMxdWtwbkZhYlpockdVS3NvcjVhVXFhbFpLS0VhZHZTOGI3MDhEZy8y?=
 =?utf-8?B?WkZLcHR2OG1uSkdrM01LemhxRHJOL2JZalQ4bmVYeWI5RUlLSTRHWC9zT1Qy?=
 =?utf-8?B?SlR1bXZ4THQvVmRkZ0hXc0NBN25YRFNPblFHSkpIcVNxWGdPc2VqMXJvckdZ?=
 =?utf-8?B?cFZqN0xMMUpaZXh0Q3VGS2pwY2x2RHJmTDQ4SXRxOTRDcVo5c2E4M1loOERU?=
 =?utf-8?B?OGNCZjFnM29YZU9XRXZ3VWVLMFAwYzZWbWZneS8rSEQxOWYzRHFMdHEzcWxS?=
 =?utf-8?B?TS9mZG1JNlZ6U3I5V2oxSVhxbEpMVFJmOXFuK3pFKzB4NTh3Q3dTU3Zpdmk2?=
 =?utf-8?B?RnQ0NWh3YldSZ0VoeUZNdENicmlJczdkckVIL1FWcWdYTXlUdWcyVGs2TWoz?=
 =?utf-8?B?L1pHUVZrRHNqTkpaOE5TSnRsN2V0ZCtzZ2JRMldHOXVPc2NYR3ZRM29UMzJF?=
 =?utf-8?B?QVhvcDF1aVBBSWJ3c2VvVG4yUmdyTlZzKzFTaWxQYkdWMFNzVEFBbjhJWExE?=
 =?utf-8?B?a082dlh5bnRvK3diVnhyYUJWL05QM0RuUkgvb3lmQ2EreTdlWVo2cXo1U1Js?=
 =?utf-8?B?bnl3Y2UzbjhXc2xmM3N0eTFNWi9rNEFnRGNEaU5MZkRZNHhJSmFBN1BvMldk?=
 =?utf-8?B?ekJONEMvdG0wVUx0VEoxR1E3SGN4TjBFT1p1TFZLK29Ld0c2b1hNbWNBT0tt?=
 =?utf-8?B?RUwzb290djl0M2Y0Q0xPZnluY0M2cGQ1L05pZFVHZFJuaVFuaVBTQmtuSmZx?=
 =?utf-8?B?aWd6eDZIVTZlZHZuV2Y1RHhFUFZtNmc3bFVlRmJyTm5VNEFOQ0dsRGhrWUp0?=
 =?utf-8?B?Mi9BczNwSW1YRHlpQTVLTG9aZ2ZDVlMrcUpMWkhWUkZCdlZmQTYxWENtK3hD?=
 =?utf-8?B?S282a2lpbXVJZzR3akk2bmVzb0kxZzJPWENmZ3BxV1lrcTZUeWZ3YlpWbVow?=
 =?utf-8?B?RzlzVitHdUdyME1obUF0MlR6bGNRRjRiNEhYMTlYZXkrc1NyMUNJUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27db625-0204-451b-e844-08de6fcb6a09
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:27:38.3627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TY0wP4aNRGhm6MXyg60j5gidEOvdnCIaoEqEihxSPgt6AJx/hyrHwt2aObbuJoulJ7daik8dhe/WoYWpHzPkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9437
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,device.rs:url]
X-Rspamd-Queue-Id: E864F1601EC
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 12:21:56PM +0100, Danilo Krummrich wrote:
> On Wed Feb 18, 2026 at 9:55 PM CET, Joel Fernandes wrote:
> > +RUST TO C LIST INTERFACES
>
> Maybe this should just be "RUST [FFI]" instead (in case Alex and you want to
> sign up for looking after FFI helper infrastructure in general)?

Good idea, done.

> > +F:	rust/kernel/ffi/clist.rs
>
> <snip>
>
> > +//! This module provides Rust abstractions for iterating over C `list_head`-based
> > +//! linked lists. It is intended for FFI use-cases where a C subsystem manages a
> > +//! circular linked list that Rust code needs to read. This is generally required
> > +//! only for special cases and should be avoided by drivers.
>
> Maybe generalize the statement a bit and say that this should only be used for
> cases where C and Rust code share direct access to the same linked list through
> an FFI interface.
>
> Additionally, add a separate note that this *must not* be used by Rust
> components that just aim for a linked list primitive and instead refer to the
> Rust linked list implementation with an intra-doc link.

Done. Updated the module doc to say "It should only be used for cases
where C and Rust code share direct access to the same linked list
through an FFI interface" and added a separate note:

  Note: This *must not* be used by Rust components that just need a
  linked list primitive. Use [`kernel::list::List`] instead.

> > +//!     types::Opaque, //
>
> Examples don't necessarily need '//' at the end, as they are not automatically
> formatted anyways.

Removed from the example. Non-example imports keep the '//' as a
rustfmt guard.

> > +//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
> > +//! #     unsafe {
>
> I understand that this is just setup code for a doc-test, but I still think we
> should hold it to the same standards, i.e. let's separate the different unsafe
> calls into their own unsafe blocks and add proper safety comments.

Done. Split into three separate unsafe blocks with individual SAFETY
comments for the value write, INIT_LIST_HEAD, and list_add_tail calls.

> > +    PinInit //
>
> Should be 'PinInit, //'.

Fixed.

> > +/// - [`CListHead`] represents an allocated and valid `list_head` structure.
>
> What does "allocated" mean in this context? (Dynamic allocations, stack, .data
> section of the binary, any of those?)
>
> In case of the latter, I'd just remove "allocated".

Removed "allocated". The invariant now reads:

  The underlying `list_head` has been initialized (e.g. via
  `INIT_LIST_HEAD()`) and its `next`/`prev` pointers are valid and
  non-NULL.

> > +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
>
> Same here, what exactly is meant by "allocated"?

Removed "allocated" from from_raw() safety docs as well. Updated to:

  `ptr` must be a valid pointer to an initialized `list_head` (e.g.
  via `INIT_LIST_HEAD()`), with valid non-NULL `next`/`prev` pointers.

> > +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> > +    ///   for the lifetime `'a`.
>
> This is a bit vague I think, concurrent modifications of (other) Rust code are
> not OK either.

Fixed. Changed to "must not be concurrently modified for the lifetime
`'a`" which covers both Rust and C code.

> > +        // SAFETY:
> > +        // - `self.as_raw()` is valid per type invariants.
> > +        // - The `next` pointer is guaranteed to be non-NULL.
>
> I'm not sure whether "valid" in the type invariant implies that the struct
> list_head is initialized. From a language point of view it is also valid if the
> pointers are NULL.
>
> So, I think the invariant (and the safety requirements of from_raw()) have to
> ensure that the struct list_head is initialized in the sense of
> INIT_LIST_HEAD().

Agreed. The invariant and from_raw() safety requirements now explicitly
require INIT_LIST_HEAD() initialization with valid non-NULL next/prev
pointers. The next() SAFETY comment now reads:

  - `self.as_raw()` is valid and initialized per type invariants.
  - The `next` pointer is valid and non-NULL per type invariants
    (initialized via `INIT_LIST_HEAD()` or equivalent).

> > +/// - The [`CListHead`] is an allocated and valid sentinel C `list_head` structure.
> > +/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
> > +/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
>
> Comments from CListHead also apply here.

Updated CList invariants and from_raw() safety docs to match the
CListHead pattern (removed "allocated", added INIT_LIST_HEAD, non-NULL
pointers, "concurrently modified").

> > +/// This is an unsafe macro. The caller must ensure:
>
> Given that, we should probably use the same (or a similar) trick as in [1].
>
> [1] https://rust.docs.kernel.org/src/kernel/device.rs.html#665-688

Done. Applied the device.rs pattern - the macro now requires
`clist_create!(unsafe { ... })` syntax, which forces callers to
acknowledge the safety requirements at the call site. The macro
internally wraps the `CList::from_raw` call in an unsafe block.

Thanks for the review!

Joel
