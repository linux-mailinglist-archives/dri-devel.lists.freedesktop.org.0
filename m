Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB07C039AB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 23:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE77B10E961;
	Thu, 23 Oct 2025 21:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ee15vx5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B83110E960;
 Thu, 23 Oct 2025 21:47:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UH+SrJC/2EzU8DI5jnx+AyNGx5Mgym0UWQZIBYiEQ/uOvD5RnLPYWV60NdtLNMY1ZAAG69Tu5kvjN5lW2KVmcGOR43X9tyeedghSPQKOwcpYOZn55EWxuDECfbqvaSv2lc9bf0kaoXOH//8lmIGRC9UdOBobU8IzeGAkHNeG6mFWIDbDXCTsSCJLUjbKsftL4eEaggu9qGoEYWy79Zht/wZrN+hEFWsH6eRJ8zNnVGrIu8vVEYQSldHC0P3QYWBkwMOuRWBH0fS5tsTaLPjwfOxYJyG5JL251k+r22iYUqULnY2zZKQuw35RR5xr3f2jTQYmjHjb3zGookgYM/WCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jqk0lhDQ9gV7uOggJzGHvCgdLAwnCDzf1WQ4S/7wWhg=;
 b=sxLZnzqjjcPWBVUieX3wn1fyyk2i4vok+y41PNxYF5R7mDj3Xpdnp7d8Dwe6zbT/HrHGGBJFXj4q+5Mu2oUBJFB+2kXwaP+S4yDWqNYn9Mpja02iW1yoWeq9StrUZAT76kQimmkq01Y53zq/qiLfcX037uSWdR67qvkD/s7T9Me/A6ucUA0BCf8r6uTB0EVzaFDk/Wl6RNQrDzsvjmHwdwNclA/pb+oGpps4tu4+ySEYICvA1AzNZybukqaB6fgC3linpbpbTaNqNW9ZHIyvgjP66on1m0QBzaHgFIBh0wMP9r1OyTA5VlW28itm2s2Mcyfh1ODqWcH/KV7/NxhI/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jqk0lhDQ9gV7uOggJzGHvCgdLAwnCDzf1WQ4S/7wWhg=;
 b=Ee15vx5BW+IHTgdyAP8TbcjyZrYBFqU3u2FTC29aWhybw/Ti0cxEqV1q9AjMGplTk7mo+aQe/rcQGfEX4Od/NydElQ3rQGpD7fmA3pQOLouNr19oF3ZW4It/0dPtP/5XNfNDQU8Q4vc+gOQRPMxO+TVLK+V0v/f2KTjeTiWohrSOOYClIAt2eKaa1943ZfWRh/9ID9RbrXT3UzaX8IFUgRFdG8mWtIrmGegnnZPAHBH1tduxtfzvP3SLh+QptZ7UAJn7I3qHirtq/90Do1a3TqkKQflTp//ZZfZi4T/vwTyvvO2M2lOdRg9gZE7/L2osn9fbe+qBQpnysYfa3jqtew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 21:47:19 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 23 Oct 2025
 21:47:14 +0000
Message-ID: <47d6ab72-1526-457d-990a-928088ba7022@nvidia.com>
Date: Thu, 23 Oct 2025 17:47:11 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Beata Michalska <beata.michalska@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "joel@joelfernandes.org" <joel@joelfernandes.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com> <aPklNydcTdOeXtdU@arm.com>
 <ACAA327A-AE2B-4D21-B8C5-C66BB5E09B7C@nvidia.com> <aPozw8TGp85YdmNU@arm.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aPozw8TGp85YdmNU@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0058.namprd04.prod.outlook.com
 (2603:10b6:408:e8::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e2f0d3-1b81-4a50-0ed1-08de127dba65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFFZRWdxMFdCdnlrRThWdHB1VjVlM0o5U1dIT28xQVJFS2dqMm5IRllOM1Ux?=
 =?utf-8?B?bkFSRW9WOCttNkxYc2FYdDJuNkttNXVqM2lsWjVTN3Y5bnR5dmxkUnpOaGZF?=
 =?utf-8?B?YlhTanVvYncydEFoVE9La3prUm5yR2ROdlo2aEVjYjRUUWRLUG9EQUh3bGxz?=
 =?utf-8?B?ZmdhVmdBUTZOOXdoSFZwU25hYkVVUkczNFFkcGU2bHBsdmRNZDFGQ1pzc3M2?=
 =?utf-8?B?ZVVHeTRicG1adHRIY1F6cUx1L1JHRlBrMzNWSTQ1ZGNsKzMyclZSVGJycHJh?=
 =?utf-8?B?KzBLdmFMTER4ZlBiQUJJY0tHNjlZblZ5K203NmJJRWprWUV5ZExwTVdqTith?=
 =?utf-8?B?S1kxRjhyQVlJQytOaGNGZkwyYWpLaVBSL204cGFWeC9nbGhLTEJlQXZhNEx4?=
 =?utf-8?B?YjI3VG44SGM5WFZNdVNZRkx1SEszcmhQVTR1YTFCTWNxelh2N25kaFJDVFpP?=
 =?utf-8?B?aGJ3QllVTnlhQkNxUWpnSWRkSXJpRSs4NWZuUFN3NStDTzJZZ3pFWkVxaHJ3?=
 =?utf-8?B?ODRIRVFaUFF2S1g2UDVQejVXd001Zi9lZjZLR1dwWDM4M1hQYXZ5aStKTkRY?=
 =?utf-8?B?Q1d4aWNJcE5iQ3haakZQQWk4MmN1V0htM1FvUmtkTkxLZkRmYUY2RytzSGEr?=
 =?utf-8?B?dkk1L0UrWUlaMVVCdEF0ZTczM0xDeGxaR28wOEpuMlp2c3RRdFdaeXkvK1dZ?=
 =?utf-8?B?VnVlbm1pYWk3b2xVZEFZTzl2UC9jYzNuZkJFRExQMWFWM0ZhTzIwcGFGcFhk?=
 =?utf-8?B?WmNlaG5BbUljMWlUMGVGSzFiNVZUZjk5aXZoeXdBQ2VJMUp6bjJzOUlBQUE5?=
 =?utf-8?B?Sm1kSkdYcC9GN3M1a09kdG1KUEUrcUV1Q2loOWtsRXF1K1M2UlpFeEJDY0pX?=
 =?utf-8?B?MCtCckUrU1MvZE5hTWhKN1M3UHFJaHNHQklSUGdSNGQrYVpUR2JwcTUxVFZR?=
 =?utf-8?B?WWJwSXg1R0xTN3RJbGlrSXlJbnpja2w5MC9LUjltNUFqTWsyeHVKS3BJR2Vj?=
 =?utf-8?B?alU0dnRhbXFHY293UU83eC9wTEhFcDlxeGJ0L0JibVpQUlBrcDVYV0pWZXZD?=
 =?utf-8?B?TmxtRTU4dnplQWpjb2F4Rm1kc2NjOTRBMXVPQzJCd0JoaTdCR0lVK2hOYlFQ?=
 =?utf-8?B?NkVvd0JZWG05bnVKaUJ5Mkt5andqVTlWQWNlTWhSNXp3amc0MG5sT3hyN2FD?=
 =?utf-8?B?cFlRaWtvS0prVWxSVTZaV2kzTmxQMjNWU0h2aUFxRllkMGVnSTRVb3NoNjFr?=
 =?utf-8?B?T2J2Ri81aGpoZitpa3NiRDE0STE1OUROYmNGMnJOQlF4Q2xrL2FmM1hIODB6?=
 =?utf-8?B?c2xnU3hWVzM5STljb1EwbVdyekFnQUJpeUt6VW1LZ1QyUGZVVzhXQU1COWp2?=
 =?utf-8?B?WG1qMUcxT3RXWHVaV2M4YmozeUlOOUQvaVBBZjZBVWNsNEh2N3BGS0RIUmp5?=
 =?utf-8?B?MXJ1U3BOdEJOa0I1VzBRRUY4c05KeWVmd2EzR2xRSlZxbFBzeVpvdGY1UHl3?=
 =?utf-8?B?YnFqS1piTU83MlZ4aWNQMGVsOHpwejgzMnE2aHNTaXpkK1hLcXJFWkhVSmt1?=
 =?utf-8?B?bi90VFNUVUlRMFI1WWhjejRmZVQ3Q2VQTUI3R1hoTnRKMkwyZDRKUmFGaVZC?=
 =?utf-8?B?S2RSSnFWRVR2YVNmYm1MY0p1MEVlc2Z6Z3ZEWTl2RCtid25hK3R0NmV4REF3?=
 =?utf-8?B?N3NEMkcwRzQwKzVSd1FmamFTQXdzOFRRR09HN0NqUDN3emsvU3U2cHkzc3hJ?=
 =?utf-8?B?eHRDVnVad3ZTK0ozbnBsSnJpMEJWeUtnM1c3K1VSa3hPbDg5RUFBWkk2YUJy?=
 =?utf-8?B?R2V1ZmZzSVcxQUlza3JwQTAweDRuQVhGVS9EMm54WDlyOHRsNEVEQXFudUtX?=
 =?utf-8?B?MGNIdDRuWnJ5dWh2M0xMaXpGU1hPazVRT1dKa2lYZkxldERDcTNiZG96cTBW?=
 =?utf-8?Q?+V/KV8tG0BMWTPbBi6EI3kOCoxlDFooW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHFWYTJGQ3ZsUFBmQlhqYzZlVmZFd2ZqV0NvZTJKTGU3MWlqYWI1WmIzWHY4?=
 =?utf-8?B?Q2NNcDNaUjBBOUtJTmR2bmhrS2tldmg0ZVdneVNENGNKakdVR0NSM29PVDND?=
 =?utf-8?B?QWtXWlh4UHVkTFNYTncvNURoU0Nqa3krRnIvQWkzemIxWDc4MktkVHFJWkkx?=
 =?utf-8?B?T2JYMmppWWdJVGtTV2Z6N3lFemVERTBTZGlYWCtOOTZhQnMrcytQYzBGOVd0?=
 =?utf-8?B?d1cyQmwvYWtBOUZYR2U5ZWJId1c4Sk5ib0FlQWhpSFFTeG0vblFVbXNVYnpE?=
 =?utf-8?B?UVl1THVYTDIzcXZTUjdVVzRQVWVDUmMyVlhFNDdUeFl2MTRDbFJ6MFNQcGpu?=
 =?utf-8?B?TGJ0NkQ5bnZlQkRKQStsVHNJbFpmUWNRL0YvM09LRmhyWVNKc0Y1Z3c1Q0lx?=
 =?utf-8?B?VFFHeTRHajJKbTZjTzFNUXdDZWM4OVh3N3RPekdvS3B0UTczZ21ZVDFXUC82?=
 =?utf-8?B?TnkvVDB1U2RKK1lwYm5aL1Fsci92Snl5aGE3OHNkWXlQOHg2WisvNzlUaHAx?=
 =?utf-8?B?QjlkUzB0Q2lXNCtTMlJmY1hwUHNTd2UveVpLMXJqZEdrTk1CcEQ5d0ZJSjRR?=
 =?utf-8?B?cE9za1ErelE0M2pmdy9YRUc5S3kyYW1mODUzNFRkRklrbGxrOC9PVEM1cHFI?=
 =?utf-8?B?cWhHbThFUkNScjBzVE1zL29wNFBvVkh4b3d5bUhrRVpUZGFmSXY3ais0WmU1?=
 =?utf-8?B?YXdWMUFDSVo3TEZ3cFhDNGR6YVZsMWYwZ2ZlUjlKbkw5TFJCS3NFemlLb25i?=
 =?utf-8?B?SDZTWUtXdkd5cGtnWnNUdXVLbDArQ08xcVliSTRMUWdxTTFMQVplWElPdFZu?=
 =?utf-8?B?Mnc5Rit0T3BVQ2dyMGduMjJDQy9CSTR4M010cmcwZTQ3TXBKeC9RcnVRaFlp?=
 =?utf-8?B?NUVXZHRzdU9leklBT2ptWm9UdlgwVzN3SmlPUUQ2QnI5Y0tsMndPbDFYWjFm?=
 =?utf-8?B?L3ZSa3JCS1o0YWFCYi9GR1FVMSs4alBQVE5kSjNSTk5zb0hoWUhuRmswck15?=
 =?utf-8?B?djdLK3F1aS8yWEJKcndMSElpYkJhMDRSZG1uU1VqcTJYWDkvWlV0a21vRGxm?=
 =?utf-8?B?SnZJbkJqcFp5NmRLbkhSNU1UaDBNTXo4U1lHY2IwUzAxMUtuVWN3dkpDczJD?=
 =?utf-8?B?cEtvWVhkTUFwRzdYbnA5Z0hQK3hZUDNEWmFnWmFOR1g0WkV6azR6VVdkVjNp?=
 =?utf-8?B?NGtWS1QxWUpFdTBDUkdaVjRRUTQweG5FcmdhTUJ6Unl2aGwzdk93WFdWOUNM?=
 =?utf-8?B?QS8vaDM5NkQ1cnllb3hDcEZaeWtPNFJFVXlOYUtMMlNreks3YVRqNC9iK0hn?=
 =?utf-8?B?anJrOW44THFLcnoxNUxzelptT3lsNUNZSFlNdXBmUmhxV284YUdRSzZoMko0?=
 =?utf-8?B?V0RLZk9GbHNuMlJWdCtNdWtIems1NmRESEdsODRoQWJHdDNrckszNnhtNU9u?=
 =?utf-8?B?Um0yWElOcW1SWWVkTzF4UzgzcnBVMjFHaHpPWDRrZ0VZeTBla3hMWHA1Rlh6?=
 =?utf-8?B?VUxBTnE2N3ZDdktkdlJ5UXB1K1doa0FlRzRTRng3c0pPcTFNWVdIQmFwOXdI?=
 =?utf-8?B?Z0tOT3RLU3Z0bUZ4azJ2MmxyRmRoWmlVQkNzeGZwZ2hRMzFtUzNIMFpaR0ox?=
 =?utf-8?B?bnRINlZVMytwQ0tKUVdON1REZG1nYVhoU0U1VlROb2ZxaENZcld5VEhydWVm?=
 =?utf-8?B?em5NUXhINnZINzNPMlZGQnVzYnpuSjdpd1BMd0NzWTJuc1pwdnNQeFkzWUlu?=
 =?utf-8?B?TmZqQmFFUUFqUVBpOXZva2dJR2U3b3JnVEtGTkVINDM2U3hJS3phSFJpR3Fq?=
 =?utf-8?B?bjJBazF6YUI0VldwN0tTQzk4VUZJK0dsQlBCbWR3RGVJNmo1NWRQRXQ5azA1?=
 =?utf-8?B?ZDFzVTlmdE9TME5Md0RvRHhXWThNN0pXZlgxK0EwMVNIUFFDOFBIT2JDcFMy?=
 =?utf-8?B?T3ZBRGQrbmp6WjQ0am9DTEJEaGdWUmp1aFZDMVlZM1BTYmUyUk9ZRDdjSlhD?=
 =?utf-8?B?WWY5cW1abWk2S1AyRlJ1c21GSE5ubnBhTEdjbDdpOWdFUWYrMmo4ZU1pLzM5?=
 =?utf-8?B?c3U3U3lPZXN5TmJwckROc1BiWnVnV0NsUzNMT3ZSMVlwUTdJUi8wZjdFYVF6?=
 =?utf-8?Q?KZQpbQR2WOYoYTbolICf3+brf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e2f0d3-1b81-4a50-0ed1-08de127dba65
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 21:47:14.3258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kN26+RmLc9FhrnpLAv5XWSCc1L3m+W9CuxdDbTzEImK9dBb0cChdu0fXPpjG0vYqwZq56iG4JxADuspKWYZe2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410
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

Hi Beata,

> On Oct 23, 2025, at 9:55 AM, Beata Michalska <beata.michalska@arm.com> wrote:
[...]
>>>
>>> The current design assumes a fixed, compile-time-known MMIO region size.
>>> It does not cover cases when the region size is known only at runtime.
>>> I do appreciate that in cases like that, we are loosing all the deliberate
>>> compile-time checks but it might be necessary to provide support for those
>>> as well (at some point at least).
>>
>> Sure that could be useful if you have a use case.
> I guess everything that would use IoRequest::iomap(self), which generates
> Io<SIZE=0> which is a game over for the macro.

I am curious what is your usecase for this such that size of the IO region
cannot be know until runtime, can you share? It should also be possible at
runtime to use the correct type, based on the IO region size IMO. The correct
type can encode the required size.

>>
>>>
>>> On the (potential) improvement side:
>>>
>>> Allowing offsets to be expressions rather than literals would make the macro
>>> easier to use for regions defined at a fixed base offset, where subsequent
>>> offsets are derived from that base, i.e:
>>>
>>> REG_1_BASE    -> 0x100
>>> REG_1_STATUS    -> REG_1_BASE + 0x0
>>> REG_1_CONTROL    -> REG_1_BASE + 0x04
>>
>> This is already possible with the register macro using relative-registers
>> (RegisterBase) right?
>
> Probably though the use case I had in mind is relative array of registers.
> It's fine to use the macro as is for few registers, having a significant
> number of those gets cumbersome though. Unless I am misreading things.

I am not sure it is cumbersome. The relative register syntax should be able to
support a larger number of registers. Could you share an example to describe the
issue with RegisterBase vs with your proposed syntax?

>>> The alias mechanism is a nice touch. It might be worth allowing arrays of
>>> registers with explicit aliases to be defined in a single macro invocation,
>>> instead of repeating similar definitions, smth along the lines of:
>>>
>>> register!(
>>>     REG_STATUS @ 0x300[8; STRIDE] {
>>>         0:0 enabled as bool;
>>>         3:1 mode as u8;
>>>         7:4 flags as u8;
>>>     }
>>>     aliases {
>>>         REG_STATUS_ENABLED[0] {
>>>             0:0 enabled as bool;
>>>         }
>>>         REG_STATUS_MODE[0] {
>>>             3:1 mode as u8;
>>>         }
>>>         REG_STATUS_FLAGS[4] {
>>>             7:4 flags as u8;
>>>         }
>>>     }
>>
>> The aliasing might be better do embed as syntax in the Bitfield itself,
>> instead of additional aliases{} blocks.
>> By the way, array of registers is also supported already as you may know.
> I was referring to aliasing having in mind array of registers.
>

AFAICS, either way you will still have a large number of alias definitions.
It might be better to invoke register macro explicitly for each alias IMO.

By the way, I do not follow your example because the names of the aliases in it
have the names of specific fields embedded in them. Whereas the register macro
aliases feature aliases the whole register, not specific fields, right?

>>> Finally, for runtime values such as indexes, it could be useful to verify
>>> once and then allow infallible reads/writes through some kind access token.
>>
>> Why? The verification is already done at compile-time AFAICS.
>
> Well, that's the point. Those are runtime values, and as of now, the only
> support for those is for arrays of registers when one, when using try_xxx
> methods, ends up with check being performed each time the method is called.

Ah for this part of your email, you are referring to try accessors. For the
fixed sizes regions at least, to avoid the runtime check, it will be possible to
accept BoundedInt [1] in the future. That type actually came up for the exact
same reason (keeping the checking light). This cleverly moves the checking to
the caller side which could be done in a slow path. If the size of the IO region
is fixed, then you don’t need to use try accessors at all if you use BoundedInt
whenever we have it.

thanks,

 - Joel

[1] https://lore.kernel.org/all/20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com/

>
> ---
> BR
> Beata
>>
>>> That might make runtime-safe access patterns simpler and more efficient.
>>
>> Because it is compile-time, it is already runtime efficient :)
>>
>>> I'm still pondering on how that could look like though (implementation-wise)
>>
>> Patches welcomed! For now this still lives in nova-core and Alex is working
>> on adding support for BoundedInt after which we can move it out.
>>
>> Thanks,
>>
>> - Joel
>>
>>
>>> ---
>>> BR
>>> Beata
>>>
>>>> On Fri, Oct 03, 2025 at 11:47:47AM -0400, Joel Fernandes wrote:
>>>> Out of broad need for the register and bitfield macros in Rust, move
>>>> them out of nova into the kernel crate. Several usecases need them (Nova
>>>> is already using these and Tyr developers said they need them).
>>>>
>>>> bitfield moved into kernel crate - defines bitfields in Rust.
>>>> register moved into io module - defines hardware registers and accessors.
>>>>
>>>> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
>>>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>> ---
>>>> drivers/gpu/nova-core/falcon.rs               |  2 +-
>>>> drivers/gpu/nova-core/falcon/gsp.rs           |  4 +-
>>>> drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
>>>> drivers/gpu/nova-core/nova_core.rs            |  3 -
>>>> drivers/gpu/nova-core/regs.rs                 |  6 +-
>>>> .../gpu/nova-core => rust/kernel}/bitfield.rs | 27 ++++-----
>>>> rust/kernel/io.rs                             |  1 +
>>>> .../macros.rs => rust/kernel/io/register.rs   | 58 ++++++++++---------
>>>> rust/kernel/lib.rs                            |  1 +
>>>> 9 files changed, 54 insertions(+), 50 deletions(-)
>>>> rename {drivers/gpu/nova-core => rust/kernel}/bitfield.rs (91%)
>>>> rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
>>>> index 37e6298195e4..a15fa98c8614 100644
>>>> --- a/drivers/gpu/nova-core/falcon.rs
>>>> +++ b/drivers/gpu/nova-core/falcon.rs
>>>> @@ -6,6 +6,7 @@
>>>> use hal::FalconHal;
>>>> use kernel::device;
>>>> use kernel::dma::DmaAddress;
>>>> +use kernel::io::register::RegisterBase;
>>>> use kernel::prelude::*;
>>>> use kernel::sync::aref::ARef;
>>>> use kernel::time::Delta;
>>>> @@ -14,7 +15,6 @@
>>>> use crate::driver::Bar0;
>>>> use crate::gpu::Chipset;
>>>> use crate::regs;
>>>> -use crate::regs::macros::RegisterBase;
>>>> use crate::util;
>>>>
>>>> pub(crate) mod gsp;
>>>> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs
b/drivers/gpu/nova-core/falcon/gsp.rs
>>>> index f17599cb49fa..cd4960e997c8 100644
>>>> --- a/drivers/gpu/nova-core/falcon/gsp.rs
>>>> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
>>>> @@ -1,9 +1,11 @@
>>>> // SPDX-License-Identifier: GPL-2.0
>>>>
>>>> +use kernel::io::register::RegisterBase;
>>>> +
>>>> use crate::{
>>>>    driver::Bar0,
>>>>    falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
>>>> -    regs::{self, macros::RegisterBase},
>>>> +    regs::self,
>>>> };
>>>>
>>>> /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
>>>> diff --git a/drivers/gpu/nova-core/falcon/sec2.rs
b/drivers/gpu/nova-core/falcon/sec2.rs
>>>> index 815786c8480d..81717868a8a8 100644
>>>> --- a/drivers/gpu/nova-core/falcon/sec2.rs
>>>> +++ b/drivers/gpu/nova-core/falcon/sec2.rs
>>>> @@ -1,7 +1,7 @@
>>>> // SPDX-License-Identifier: GPL-2.0
>>>>
>>>> use crate::falcon::{FalconEngine, PFalcon2Base, PFalconBase};
>>>> -use crate::regs::macros::RegisterBase;
>>>> +use kernel::io::register::RegisterBase;
>>>>
>>>> /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
>>>> pub(crate) struct Sec2(());
>>>> diff --git a/drivers/gpu/nova-core/nova_core.rs
b/drivers/gpu/nova-core/nova_core.rs
>>>> index 112277c7921e..fffcaee2249f 100644
>>>> --- a/drivers/gpu/nova-core/nova_core.rs
>>>> +++ b/drivers/gpu/nova-core/nova_core.rs
>>>> @@ -2,9 +2,6 @@
>>>>
>>>> //! Nova Core GPU Driver
>>>>
>>>> -#[macro_use]
>>>> -mod bitfield;
>>>> -
>>>> mod dma;
>>>> mod driver;
>>>> mod falcon;
>>>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>>>> index 206dab2e1335..1f08e6d4045a 100644
>>>> --- a/drivers/gpu/nova-core/regs.rs
>>>> +++ b/drivers/gpu/nova-core/regs.rs
>>>> @@ -4,15 +4,13 @@
>>>> // but are mapped to types.
>>>> #![allow(non_camel_case_types)]
>>>>
>>>> -#[macro_use]
>>>> -pub(crate) mod macros;
>>>> -
>>>> use crate::falcon::{
>>>>    DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion,
FalconFbifMemType, FalconFbifTarget,
>>>>    FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase,
PeregrineCoreSelect,
>>>> };
>>>> use crate::gpu::{Architecture, Chipset};
>>>> use kernel::prelude::*;
>>>> +use kernel::register;
>>>>
>>>> // PMC
>>>>
>>>> @@ -331,6 +329,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>>>>
>>>> pub(crate) mod gm107 {
>>>>    // FUSE
>>>> +    use kernel::register;
>>>>
>>>>    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
>>>>        0:0     display_disabled as bool;
>>>> @@ -339,6 +338,7 @@ pub(crate) mod gm107 {
>>>>
>>>> pub(crate) mod ga100 {
>>>>    // FUSE
>>>> +    use kernel::register;
>>>>
>>>>    register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
>>>>        0:0     display_disabled as bool;
>>>> diff --git a/drivers/gpu/nova-core/bitfield.rs b/rust/kernel/bitfield.rs
>>>> similarity index 91%
>>>> rename from drivers/gpu/nova-core/bitfield.rs
>>>> rename to rust/kernel/bitfield.rs
>>>> index cbedbb0078f6..09cd5741598c 100644
>>>> --- a/drivers/gpu/nova-core/bitfield.rs
>>>> +++ b/rust/kernel/bitfield.rs
>>>> @@ -9,7 +9,7 @@
>>>> /// # Syntax
>>>> ///
>>>> /// ```rust
>>>> -/// use nova_core::bitfield;
>>>> +/// use kernel::bitfield;
>>>> ///
>>>> /// #[derive(Debug, Clone, Copy, Default)]
>>>> /// enum Mode {
>>>> @@ -82,10 +82,11 @@
>>>> ///   the result.
>>>> /// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s
`TryFrom::<<type>>` implementation
>>>> ///   and returns the result. This is useful with fields for which not all
values are valid.
>>>> +#[macro_export]
>>>> macro_rules! bitfield {
>>>>    // Main entry point - defines the bitfield struct with fields
>>>>    ($vis:vis struct $name:ident($storage:ty) $(, $comment:literal)? {
$($fields:tt)* }) => {
>>>> -        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
>>>> +        ::kernel::bitfield!(@core $vis $name $storage $(, $comment)? {
$($fields)* });
>>>>    };
>>>>
>>>>    // All rules below are helpers.
>>>> @@ -114,7 +115,7 @@ fn from(val: $name) -> $storage {
>>>>            }
>>>>        }
>>>>
>>>> -        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
>>>> +        ::kernel::bitfield!(@fields_dispatcher $vis $name $storage {
$($fields)* });
>>>>    };
>>>>
>>>>    // Captures the fields and passes them to all the implementers that
require field information.
>>>> @@ -130,7 +131,7 @@ fn from(val: $name) -> $storage {
>>>>        )*
>>>>    }
>>>>    ) => {
>>>> -        bitfield!(@field_accessors $vis $name $storage {
>>>> +        ::kernel::bitfield!(@field_accessors $vis $name $storage {
>>>>            $(
>>>>                $hi:$lo $field as $type
>>>>                $(?=> $try_into_type)?
>>>> @@ -139,8 +140,8 @@ fn from(val: $name) -> $storage {
>>>>            ;
>>>>            )*
>>>>        });
>>>> -        bitfield!(@debug $name { $($field;)* });
>>>> -        bitfield!(@default $name { $($field;)* });
>>>> +        ::kernel::bitfield!(@debug $name { $($field;)* });
>>>> +        ::kernel::bitfield!(@default $name { $($field;)* });
>>>>    };
>>>>
>>>>    // Defines all the field getter/setter methods for `$name`.
>>>> @@ -155,13 +156,13 @@ fn from(val: $name) -> $storage {
>>>>        }
>>>>    ) => {
>>>>        $(
>>>> -            bitfield!(@check_field_bounds $hi:$lo $field as $type);
>>>> +            ::kernel::bitfield!(@check_field_bounds $hi:$lo $field as $type);
>>>>        )*
>>>>
>>>>        #[allow(dead_code)]
>>>>        impl $name {
>>>>            $(
>>>> -            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field
as $type
>>>> +            ::kernel::bitfield!(@field_accessor $vis $name $storage,
$hi:$lo $field as $type
>>>>                $(?=> $try_into_type)?
>>>>                $(=> $into_type)?
>>>>                $(, $comment)?
>>>> @@ -198,7 +199,7 @@ impl $name {
>>>>        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt
$field:ident as bool => $into_type:ty
>>>>            $(, $comment:literal)?;
>>>>    ) => {
>>>> -        bitfield!(
>>>> +        ::kernel::bitfield!(
>>>>            @leaf_accessor $vis $name $storage, $hi:$lo $field
>>>>            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
>>>>            $into_type => $into_type $(, $comment)?;
>>>> @@ -209,7 +210,7 @@ impl $name {
>>>>    (
>>>>        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt
$field:ident as bool $(, $comment:literal)?;
>>>>    ) => {
>>>> -        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as
bool => bool $(, $comment)?;);
>>>> +        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo
$field as bool => bool $(, $comment)?;);
>>>>    };
>>>>
>>>>    // Catches the `?=>` syntax for non-boolean fields.
>>>> @@ -217,7 +218,7 @@ impl $name {
>>>>        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt
$field:ident as $type:tt ?=> $try_into_type:ty
>>>>            $(, $comment:literal)?;
>>>>    ) => {
>>>> -        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
>>>> +        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
>>>>            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
>>>>            ::core::result::Result<
>>>>                $try_into_type,
>>>> @@ -231,7 +232,7 @@ impl $name {
>>>>        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt
$field:ident as $type:tt => $into_type:ty
>>>>            $(, $comment:literal)?;
>>>>    ) => {
>>>> -        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
>>>> +        ::kernel::bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
>>>>            { |f| <$into_type>::from(f as $type) } $into_type => $into_type
$(, $comment)?;);
>>>>    };
>>>>
>>>> @@ -240,7 +241,7 @@ impl $name {
>>>>        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt
$field:ident as $type:tt
>>>>            $(, $comment:literal)?;
>>>>    ) => {
>>>> -        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as
$type => $type $(, $comment)?;);
>>>> +        ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo
$field as $type => $type $(, $comment)?;);
>>>>    };
>>>>
>>>>    // Generates the accessor methods for a single field.
>>>> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
>>>> index 03b467722b86..a79b603604b1 100644
>>>> --- a/rust/kernel/io.rs
>>>> +++ b/rust/kernel/io.rs
>>>> @@ -8,6 +8,7 @@
>>>> use crate::{bindings, build_assert, ffi::c_void};
>>>>
>>>> pub mod mem;
>>>> +pub mod register;
>>>> pub mod resource;
>>>>
>>>> pub use resource::Resource;
>>>> diff --git a/drivers/gpu/nova-core/regs/macros.rs b/rust/kernel/io/register.rs
>>>> similarity index 93%
>>>> rename from drivers/gpu/nova-core/regs/macros.rs
>>>> rename to rust/kernel/io/register.rs
>>>> index c0a5194e8d97..c24d956f122f 100644
>>>> --- a/drivers/gpu/nova-core/regs/macros.rs
>>>> +++ b/rust/kernel/io/register.rs
>>>> @@ -17,7 +17,8 @@
>>>> /// The `T` generic argument is used to distinguish which base to use, in
case a type provides
>>>> /// several bases. It is given to the `register!` macro to restrict the use
of the register to
>>>> /// implementors of this particular variant.
>>>> -pub(crate) trait RegisterBase<T> {
>>>> +pub trait RegisterBase<T> {
>>>> +    /// The base address for the register.
>>>>    const BASE: usize;
>>>> }
>>>>
>>>> @@ -26,7 +27,7 @@ pub(crate) trait RegisterBase<T> {
>>>> ///
>>>> /// Example:
>>>> ///
>>>> -/// ```no_run
>>>> +/// ```ignore
>>>> /// register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
>>>> ///    3:0     minor_revision as u8, "Minor revision of the chip";
>>>> ///    7:4     major_revision as u8, "Major revision of the chip";
>>>> @@ -39,7 +40,7 @@ pub(crate) trait RegisterBase<T> {
>>>> /// significant bits of the register. Each field can be accessed and
modified using accessor
>>>> /// methods:
>>>> ///
>>>> -/// ```no_run
>>>> +/// ```ignore
>>>> /// // Read from the register's defined offset (0x100).
>>>> /// let boot0 = BOOT_0::read(&bar);
>>>> /// pr_info!("chip revision: {}.{}", boot0.major_revision(),
boot0.minor_revision());
>>>> @@ -61,7 +62,7 @@ pub(crate) trait RegisterBase<T> {
>>>> /// It is also possible to create a alias register by using the `=> ALIAS`
syntax. This is useful
>>>> /// for cases where a register's interpretation depends on the context:
>>>> ///
>>>> -/// ```no_run
>>>> +/// ```ignore
>>>> /// register!(SCRATCH @ 0x00000200, "Scratch register" {
>>>> ///    31:0     value as u32, "Raw value";
>>>> /// });
>>>> @@ -111,7 +112,7 @@ pub(crate) trait RegisterBase<T> {
>>>> /// this register needs to implement `RegisterBase<Base>`. Here is the
above example translated
>>>> /// into code:
>>>> ///
>>>> -/// ```no_run
>>>> +/// ```ignore
>>>> /// // Type used to identify the base.
>>>> /// pub(crate) struct CpuCtlBase;
>>>> ///
>>>> @@ -162,7 +163,7 @@ pub(crate) trait RegisterBase<T> {
>>>> /// compile-time or runtime bound checking. Simply define their address as
`Address[Size]`, and add
>>>> /// an `idx` parameter to their `read`, `write` and `alter` methods:
>>>> ///
>>>> -/// ```no_run
>>>> +/// ```ignore
>>>> /// # fn no_run() -> Result<(), Error> {
>>>> /// # fn get_scratch_idx() -> usize {
>>>> /// #   0x15
>>>> @@ -211,7 +212,7 @@ pub(crate) trait RegisterBase<T> {
>>>> /// Combining the two features described in the sections above, arrays of
registers accessible from
>>>> /// a base can also be defined:
>>>> ///
>>>> -/// ```no_run
>>>> +/// ```ignore
>>>> /// # fn no_run() -> Result<(), Error> {
>>>> /// # fn get_scratch_idx() -> usize {
>>>> /// #   0x15
>>>> @@ -273,28 +274,29 @@ pub(crate) trait RegisterBase<T> {
>>>> /// # Ok(())
>>>> /// # }
>>>> /// ```
>>>> +#[macro_export]
>>>> macro_rules! register {
>>>>    // Creates a register at a fixed offset of the MMIO space.
>>>>    ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* }
) => {
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_fixed $name @ $offset);
>>>>    };
>>>>
>>>>    // Creates an alias register of fixed offset register `alias` with its
own fields.
>>>>    ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } )
=> {
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_fixed $name @ $alias::OFFSET);
>>>>    };
>>>>
>>>>    // Creates a register at a relative offset from a base address provider.
>>>>    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? {
$($fields:tt)* } ) => {
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_relative $name @ $base [ $offset ]);
>>>>    };
>>>>
>>>>    // Creates an alias register of relative offset register `alias` with
its own fields.
>>>>    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? {
$($fields:tt)* }) => {
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
>>>>    };
>>>>
>>>> @@ -305,7 +307,7 @@ macro_rules! register {
>>>>        }
>>>>    ) => {
>>>>        static_assert!(::core::mem::size_of::<u32>() <= $stride);
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_array $name @ $offset [ $size ; $stride ]);
>>>>    };
>>>>
>>>> @@ -326,7 +328,7 @@ macro_rules! register {
>>>>            $(, $comment:literal)? { $($fields:tt)* }
>>>>    ) => {
>>>>        static_assert!(::core::mem::size_of::<u32>() <= $stride);
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_relative_array $name @ $base [ $offset [ $size ;
$stride ] ]);
>>>>    };
>>>>
>>>> @@ -348,7 +350,7 @@ macro_rules! register {
>>>>        }
>>>>    ) => {
>>>>        static_assert!($idx < $alias::SIZE);
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_relative $name @ $base [ $alias::OFFSET + $idx *
$alias::STRIDE ] );
>>>>    };
>>>>
>>>> @@ -357,7 +359,7 @@ macro_rules! register {
>>>>    // to avoid it being interpreted in place of the relative register array
alias rule.
>>>>    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? {
$($fields:tt)* }) => {
>>>>        static_assert!($idx < $alias::SIZE);
>>>> -        bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>> +        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? {
$($fields)* } );
>>>>        register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
>>>>    };
>>>>
>>>> @@ -414,12 +416,12 @@ pub(crate) fn read<const SIZE: usize, T, B>(
>>>>                base: &B,
>>>>            ) -> Self where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>            {
>>>>                const OFFSET: usize = $name::OFFSET;
>>>>
>>>>                let value = io.read32(
>>>> -                    <B as crate::regs::macros::RegisterBase<$base>>::BASE
+ OFFSET
>>>> +                    <B as
::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
>>>>                );
>>>>
>>>>                Self(value)
>>>> @@ -435,13 +437,13 @@ pub(crate) fn write<const SIZE: usize, T, B>(
>>>>                base: &B,
>>>>            ) where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>            {
>>>>                const OFFSET: usize = $name::OFFSET;
>>>>
>>>>                io.write32(
>>>>                    self.0,
>>>> -                    <B as crate::regs::macros::RegisterBase<$base>>::BASE
+ OFFSET
>>>> +                    <B as
::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
>>>>                );
>>>>            }
>>>>
>>>> @@ -455,7 +457,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>>>>                f: F,
>>>>            ) where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>                F: ::core::ops::FnOnce(Self) -> Self,
>>>>            {
>>>>                let reg = f(Self::read(io, base));
>>>> @@ -600,11 +602,11 @@ pub(crate) fn read<const SIZE: usize, T, B>(
>>>>                idx: usize,
>>>>            ) -> Self where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>            {
>>>>                build_assert!(idx < Self::SIZE);
>>>>
>>>> -                let offset = <B as
crate::regs::macros::RegisterBase<$base>>::BASE +
>>>> +                let offset = <B as
::kernel::io::register::RegisterBase<$base>>::BASE +
>>>>                    Self::OFFSET + (idx * Self::STRIDE);
>>>>                let value = io.read32(offset);
>>>>
>>>> @@ -622,11 +624,11 @@ pub(crate) fn write<const SIZE: usize, T, B>(
>>>>                idx: usize
>>>>            ) where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>            {
>>>>                build_assert!(idx < Self::SIZE);
>>>>
>>>> -                let offset = <B as
crate::regs::macros::RegisterBase<$base>>::BASE +
>>>> +                let offset = <B as
::kernel::io::register::RegisterBase<$base>>::BASE +
>>>>                    Self::OFFSET + (idx * Self::STRIDE);
>>>>
>>>>                io.write32(self.0, offset);
>>>> @@ -643,7 +645,7 @@ pub(crate) fn alter<const SIZE: usize, T, B, F>(
>>>>                f: F,
>>>>            ) where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>                F: ::core::ops::FnOnce(Self) -> Self,
>>>>            {
>>>>                let reg = f(Self::read(io, base, idx));
>>>> @@ -662,7 +664,7 @@ pub(crate) fn try_read<const SIZE: usize, T, B>(
>>>>                idx: usize,
>>>>            ) -> ::kernel::error::Result<Self> where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>            {
>>>>                if idx < Self::SIZE {
>>>>                    Ok(Self::read(io, base, idx))
>>>> @@ -684,7 +686,7 @@ pub(crate) fn try_write<const SIZE: usize, T, B>(
>>>>                idx: usize,
>>>>            ) -> ::kernel::error::Result where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>            {
>>>>                if idx < Self::SIZE {
>>>>                    Ok(self.write(io, base, idx))
>>>> @@ -707,7 +709,7 @@ pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
>>>>                f: F,
>>>>            ) -> ::kernel::error::Result where
>>>>                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
>>>> -                B: crate::regs::macros::RegisterBase<$base>,
>>>> +                B: ::kernel::io::register::RegisterBase<$base>,
>>>>                F: ::core::ops::FnOnce(Self) -> Self,
>>>>            {
>>>>                if idx < Self::SIZE {
>>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>>> index fcffc3988a90..8f8260090c02 100644
>>>> --- a/rust/kernel/lib.rs
>>>> +++ b/rust/kernel/lib.rs
>>>> @@ -63,6 +63,7 @@
>>>> pub mod alloc;
>>>> #[cfg(CONFIG_AUXILIARY_BUS)]
>>>> pub mod auxiliary;
>>>> +pub mod bitfield;
>>>> pub mod bits;
>>>> #[cfg(CONFIG_BLOCK)]
>>>> pub mod block;
>>>> --
>>>> 2.34.1
>>>>
>>>>
