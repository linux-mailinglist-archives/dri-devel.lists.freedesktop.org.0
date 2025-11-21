Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90329C7A5B1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D3A10E8E0;
	Fri, 21 Nov 2025 15:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eldNYnoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFBA10E8A7;
 Fri, 21 Nov 2025 15:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkwI0KINNd0yIMtvYft9OKM70XDtbvjM1w/eBoG+Kom73VCW8guLTVxoKHawMdE5qQbeG6uVw7+U9TXCW7WUR0LQ2Nb7+1yR35nUKCzNbuXQpVbjG4ZBM2A0pheFATEeBGKVU6knuXSFR3CB9f4Edflh70eY8tG5KhtklqVM8DoxCZLQ7rp4q+8KqYXbmfZxHS7JZ2rNlEKEWlL37v+fVgE2II1O4G8RTHFq3GxnO9eHL1SificOuZbeZhz6BHUhYcuqe8lDGoElWRjw56C0EnpJFNPlTv0/bswlV3S5s9YhaBjtJoH5mlZW7/zBE+0Pw8bspnQDof1shOJLZaCV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsGmOxfkY0wEP/sA8TcIrBOCFYhw6mKVK0nw6NbiQy0=;
 b=reNUE7S5OT33Bdm1Yjane7kxSVizv380bTPABOiRGQMcc7ZU8ufnN39bqxyl7dChdN1qyjyu5d7lAWVeu4NMPosVNk0+72okpW3RP8TfJK1m+avyjLDZ3+XWCTaNVp+GwP9rlTwBVLvd/5m8MEltzhrizynNLBK/qKb+2agOkIMR64rfWPe0+Ne/PeoVrnJGWz3JbFzWABCkJhreumNv45qoswPD/hhfFUCPPA/yZU8DB6IuBSayhoqcBoNImTVAp35EPOtzF15cY9n483ovtOiqr72JcakEiL9Y3eB7R0rSJJmdYEgcedRMV3C1WLFaw2nQAoL5TghKm5uawZGbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CsGmOxfkY0wEP/sA8TcIrBOCFYhw6mKVK0nw6NbiQy0=;
 b=eldNYnoDaV0Em6z4b8VEjEWmG0VtwYanBIWX+XuIYt6kQAOA+eXrNxtwizfDPzoe2e4DFNrioSRl6Ft3XAUk608elf3+leK6/RpvWYvVNYBQ8MP6ZnCVzcCI/MQF905Fxwb0NT+cxjEDr7GZgBz/aEPOAo/5kOI3QFYpV6DbQQxowJiITJZ9uaBoLJ69qxy5nhQmmndYcc3JiG02hHXsm4TV8QGs//6B7u8HhTmrnYtsHQamfpjAIzb8Ugl+xpynnuFDd8/eJlJTByyVa4xTatZli52wCZr8zC5iZFm1zZ9w3skcx35t1aAd7o2QNWyPM6BTZEF6da37CnH+TJEDWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9229.namprd12.prod.outlook.com (2603:10b6:408:191::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Fri, 21 Nov
 2025 15:00:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 15:00:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 22 Nov 2025 00:00:13 +0900
Subject: [PATCH 2/4] gpu: nova-core: gsp: Fix length of received messages
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-nova-fixes-v1-2-a91eafeed7b5@nvidia.com>
References: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
In-Reply-To: <20251122-nova-fixes-v1-0-a91eafeed7b5@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: 24a29bf7-e30f-48fd-67bb-08de290eb4af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M091U08wS01sRTF5cDh5WVhrQ3hmUEZUTFpKVnp4ekswZ0xxT0VsL3hPY0dl?=
 =?utf-8?B?Q0tqc0RFbXZxZlljSW04aGo4cllTOGFlZ09ITlRYd3hLT3VTMUgzWGtEN1Fj?=
 =?utf-8?B?bUY3MmpoOHpuZmMvZ1cyY1BkZkFYMzBlMmdCWmxiU1Jic21Bb0NxSk1mTlZj?=
 =?utf-8?B?Rkx2alZVTXdmOGpnYzJCcXVzT0V1ZTF1MjhqZWlhdE9NWVZTWURCWHdKVSt5?=
 =?utf-8?B?em9mRTQ1VkhrTXpRN3pZSklveFUwbU0xTk5SU2hjWllNcVBFa21UVzlUaW5w?=
 =?utf-8?B?THdtMWhxWFpVZjBOcW5UenNEVXBQandaV1RtTTdOUUxqOUU1OW9Td3hmM2VW?=
 =?utf-8?B?eGNhVWpwOTZ5c0VqL0QydHBtVkdzVUp0L2k1MU1mdlUyMGhKT0c5NE5VdXdU?=
 =?utf-8?B?ZXdiYkcxV3QvS01kSW1ZOWQvczF4TFFLQTlrckdWa3hUN0NtM2Q1ZGNCckd1?=
 =?utf-8?B?WTRHUkppT2RNdXJ6ejhRcnNlTTBuWW12OStzRk41RFZkOWxMdnJUaXVKNXF3?=
 =?utf-8?B?eVlaQTlQaFNMODJ1dmdTaEh5dDRRbE9lOHRpR05sRDNUTGo5d0N1QmZpcEl6?=
 =?utf-8?B?TUtJOGllaUNYQlQ0UnlHaTgwQWVBOXFrM0NLS3d1VDRWS0p3QUVLNHc3b0V1?=
 =?utf-8?B?bkgyUGZUelprUWpMdkx1cHUrQ1h3MzNqbmdUWHBxK0l1cmxvcjBDbTBwSHRn?=
 =?utf-8?B?dlB5amFUZVZBaG9HR3lrSDVPZWJ1cHFKUU5NSE84Z0QxM2dFb1pVd0xWVFB4?=
 =?utf-8?B?ZjdHa253RVluOTgzSWRXWDI4RXpIZTNGYklhcm1JbDhLVUhjZms1dUU1ZWNt?=
 =?utf-8?B?VHBnVFltNFVIZGF6aW5jclBlNEFDLzRib3ljbUkvTHRCUzU0a3loM1NSSUVG?=
 =?utf-8?B?Qy9YNHlOMnhBZnJnbklkVWJHMHljd0tSa096RndOOGFxUlRhYzEwT2lzcVJC?=
 =?utf-8?B?SGU4YmE1YTE4NjVBRC9tUko2VlN5RWl2aUlHL3Q1RjZ2N2NhLzZJcU1qOWU5?=
 =?utf-8?B?enJoNVhwSGhvWVpGYXJHR3Q0SVlzaTNSTlhjeko3Und4UnlJMzdSTFp5YWRO?=
 =?utf-8?B?Q3gvdCtDSzhraFBLZmNnMzZ2ZmQxUzAycEZ3aXdKaHc5UERWVGF2Vkh1WlNL?=
 =?utf-8?B?cjdRWkFnUzB4OUNCSGo0aWlVb01sZmx3elY1QmQwSTVRVUMzYXd6eXptMFo3?=
 =?utf-8?B?OEhCUlRNck9YUGE3TGg2S1dKL3cwVElNeC83NjA1WWtETlJ6YzQ0Um9wQUJP?=
 =?utf-8?B?WDZTU0hkWHVVOHMwK2c4MXFnUTYxMW81cFVyWFFZUEYxMjkyYTZQWXF6enY5?=
 =?utf-8?B?MkZlMnBtcTRFd0NQdUhWMlorWkFXUlFtY2NjTWRLekhpc3drbUI0QXRVemE3?=
 =?utf-8?B?S0xoUVk3K2F6Tjk5dlBHcldJQmZDTTd5a3BMcjZ1bXpGYU4xM0dEWDQyZWxw?=
 =?utf-8?B?UUhsaUQ0amVWYmNXVGVFa2ZCOXdnK3Q3T3BVTXFFdCtvVFpCVzNYSmoyUVBi?=
 =?utf-8?B?dzBiZ0taZTVqSzBuSmU1Smt2NVhjVG9LczMzc0JUaml0M0FvSXFzMEJoc0pw?=
 =?utf-8?B?amtxYlhpemp0eDlWaDJxK2JvWkZRc3A3WHZUcFNmZkwrQ0xlK3UwVDFzWitP?=
 =?utf-8?B?d3JNa0hSL1BvSzJTdXBkeVFwSzNWNHAyVnEwY0J3QVhNcG1MT0xNbEVyZnFL?=
 =?utf-8?B?ajhXS1oxSWRoQk4rcG84WWlBQTN6ZEQyOFg1NCtuSGNhZXNtUDBQTUNrWDJN?=
 =?utf-8?B?YW9DZ2NJY0ZyUkQ5UkZXMHlITTNJNnNYYmdUeHc3QjVrb2p5LzNBSmdnSzlk?=
 =?utf-8?B?cWFLMnpScDhuOXJxYndPN1hEZE5NYm90VmlRRDhrZEs4djdvRDJOOFlRdHpt?=
 =?utf-8?B?OGlGWTNCeE9OemJQbVFrNWIyaTFMYVYwQmFIY3R1MHhHRmRjQit4Njg1WXRG?=
 =?utf-8?B?QSsrZHp1bm9xWU81NUQ3bE1ad1E5Ukh6cFFOSlhCRnRVYkJ1NDFKbVB1YWRn?=
 =?utf-8?B?bkxidHB1alJDUjlUYzdWNEZIeVVYK2t0RlRsTEx1S2phUWN4MG1lNU9tWG4x?=
 =?utf-8?Q?H5XEI6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW91NWpZdGdMRHJQeTIzV3dhbThJS0ptd050ekNYSEszUmRPMTJxdS9CSm5M?=
 =?utf-8?B?OHl6TWoxaXhzQ2QzWTJyNzJGaW4wcUp5SWoxL3c3Nkp6aFdweFpxTHh2T3lp?=
 =?utf-8?B?MzNvR2NMZW1VUzE3NEpyOXI3K3lTcUxPWUVUVXUxR3RGZTg4MlNxTVl5WTdK?=
 =?utf-8?B?SHNPK3pnYjROdDlTKzIzbk9aNFR4aHcrNlZNTDJyV1RyN1BBTUZxRUZ3TjBu?=
 =?utf-8?B?d2t3T0tWTDdCOC82OUhYVXpNNFFSNjlGSFlDempib3FMc21LYXJ1enloY3ds?=
 =?utf-8?B?bythNXlZOER0dkRyYmx6aG1GUGZCZFNGUC93V09tbjdsOC9GdHhFeWE0Wm01?=
 =?utf-8?B?aEJjdTRyTDZXb3VXQ1lTMkZXbDFvc2h1d2hEb05oQ29Fc3NIZUpSaGZKS0tX?=
 =?utf-8?B?SVlxSGJOT3JPZEtGOW10N2R0Y1g2Z3pKNks1WFoxdGxYampaYWtOTlpSZkFp?=
 =?utf-8?B?ZHFLMUF1a3FPMURNVkdTaEt1S1JqS25GM1phUDhzdmNPdWZQMENRTUFrOUMr?=
 =?utf-8?B?SEhuM0hPKzJmUU01bHc5dkY0cU5XSFQvOGhVMkNOYmVEbVo4azBURVdBQVFJ?=
 =?utf-8?B?dUVCdkZXNXJRU2VBSHFaQkdOeDJWSGIyYkY5dHVDZVRhTDVra2VoeEVCZ2dL?=
 =?utf-8?B?YTNLdU03YlBvWmZyRGcvWGRpTW9KZUNTTFNGMDFITyt6UnFGZ0hmcENSNTF6?=
 =?utf-8?B?Q2FOM1gwVnhHWnBGNnIzS0dNSkpaMnFBejY4dk9HQVN4L2gxTm1EM0QyVTZU?=
 =?utf-8?B?c1FqVk9DdzIzN1Q0eEl6dlNnaVBJcXdnQkZ2akUvVDdCVXBWb3NPbkpyc1BE?=
 =?utf-8?B?MlZWMDJINFVKM3locHRuZXBoMFJNUU1uaFJVcFNJUFI1bGxoT0NwZm80Tk5o?=
 =?utf-8?B?MFBmQXpRejJWRkVheDRqeWp1V1JnQnVHL042MlBkMmR0RGpMdGJmZmdmcTVK?=
 =?utf-8?B?MlYvYlhFcVE1TWdHSm85V0dhejk1WXdEa0FLdHJvY3VYeUtvVXFPWnVMSFlM?=
 =?utf-8?B?OVZ1emlFTEVNSTBSREhDSWJuTEJWa1N4eWdPa29rQk11TkZwLzJjb1Q0amRV?=
 =?utf-8?B?YjlTVWUva1pBOGdiemxyNlFJekZTdDJORXU2YUdLV3hCdFV0ZE1YdUUwei8w?=
 =?utf-8?B?OG1BamlsMDY0aFhURUxQWTFjejFVeDFPNTBYMXpoRlVYcytGMG9NN28xWHlC?=
 =?utf-8?B?MXZLV0tTVHVHOEVINDdndHM4RXRBZkh5b0JZcTR1OHJiQnQzRHF0Z0l3Tzg0?=
 =?utf-8?B?UFNSWUIvWlZyVCtVcW1TN1NGS25wdmt2WHkrU1FBVjU2MDc1OE43S2NqNmZS?=
 =?utf-8?B?eVNEZU1BU3Uyd0YwUWJNRDlPMmlUeFRsa3Jvc0lqREozVjZTT1FRcXllTVJQ?=
 =?utf-8?B?TzB4UHJwWnFab0RlTHJCRHNwWWQ3QTl0bmtKbWdsdHl0aW1NWlh6YWkxT0Mr?=
 =?utf-8?B?dHdSZWQ0RVJ3TDh3WGdVTlRlTHNHWnVWbmVlYng4bDdjRXZNM0N0YjNRdlNy?=
 =?utf-8?B?RHRCNzR2RFlCZXJFeFEwTC8xdkpUb2xVU20rL3FrQVFqUnlZSmxuYnlxalpN?=
 =?utf-8?B?c2FtSkhVUjgrSU5VTThLdnhXVHYvZWt6NlhvQVdhditZcDRNYWVNWmdFUmp0?=
 =?utf-8?B?elk0MkN5YnhDcjN5SmtVOWR2RzFkZE9ibjB5d09IaVZpc0s2cm1CdDE1VTU1?=
 =?utf-8?B?cU5VTVdhQWp3SXBhMjdXb1phTERlNDd4cExoR0p5Y0tCenV1SlpDT29iV0ky?=
 =?utf-8?B?SitXd3EzWG1UV0NLVGFTSXYzSGlhTS9iUmxJcmRmb1pDVTV2blRrb3pIRFJl?=
 =?utf-8?B?VU5qU0tqdkxyRjlMRkNJZHBydWhEUFRndEtMb3lCSlVJVG9PaUcxRDNJTm9n?=
 =?utf-8?B?U25SWWF5VWJETERDZEpRUEVRNGV1YnZ0enYrWXJQM055VVBBT21HaHJWb0ti?=
 =?utf-8?B?eE1kQWZ5VjRxMHM3REJUNWV2Y0NOcWZMQmRPeEFWdTdBSUlFZDBhdHJmNHBu?=
 =?utf-8?B?cU5JZHhsTXRWRTlmRDBSSnB3R3ZsQXYyL2dMZzJwb0Y4azJqN2RRZ0xhTnpK?=
 =?utf-8?B?Z1NQVnBBMG9ncDVLandPNGxvR0RqTytPMjUvSEJhNXdNaGJhTkJHaDByMjAx?=
 =?utf-8?B?Q0NmTlJTYjF1cG9vVTJHeURub1RKQkFaTE9lM3JyUkRxT25uRExKVmdyZTh3?=
 =?utf-8?Q?6wmC/U9kJ5yae1V0H7pdKh5XIeBpooOH2J18km06rVFp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24a29bf7-e30f-48fd-67bb-08de290eb4af
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:00:27.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHcMujLeliMjmlpVNwXIiPVwZ4ouKBfUkn18WXyPaiIcmGp1ucQpAJO+0gqckyOz2B//TMZJq/UL9ORkuhpFCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9229
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

The size of messages' payload is miscalculated, leading to extra data
passed to the message handler. While this is not a problem with our
current set of commands, others with a variable-length payload may
misbehave. Fix this.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 +++++++----
 drivers/gpu/nova-core/gsp/fw.rs   |  2 +-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 6f946d14868a..dab73377c526 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -588,21 +588,24 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             header.length(),
         );
 
+        // The length of the message that follows the header.
+        let msg_length = header.length() - size_of::<GspMsgElement>();
+
         // Check that the driver read area is large enough for the message.
-        if slice_1.len() + slice_2.len() < header.length() {
+        if slice_1.len() + slice_2.len() < msg_length {
             return Err(EIO);
         }
 
         // Cut the message slices down to the actual length of the message.
-        let (slice_1, slice_2) = if slice_1.len() > header.length() {
+        let (slice_1, slice_2) = if slice_1.len() > msg_length {
             // PANIC: we checked above that `slice_1` is at least as long as `msg_header.length()`.
-            (slice_1.split_at(header.length()).0, &slice_2[0..0])
+            (slice_1.split_at(msg_length).0, &slice_2[0..0])
         } else {
             (
                 slice_1,
                 // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
                 // large as `msg_header.length()`.
-                slice_2.split_at(header.length() - slice_1.len()).0,
+                slice_2.split_at(msg_length - slice_1.len()).0,
             )
         };
 
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..7fcba5afb0a3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -853,7 +853,7 @@ pub(crate) fn set_checksum(&mut self, checksum: u32) {
         self.inner.checkSum = checksum;
     }
 
-    /// Returns the total length of the message.
+    /// Returns the total length of the message, message and RPC headers included.
     pub(crate) fn length(&self) -> usize {
         // `rpc.length` includes the length of the GspRpcHeader but not the message header.
         size_of::<Self>() - size_of::<bindings::rpc_message_header_v>()

-- 
2.51.2

