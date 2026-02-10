Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FB1MWmcimmVMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:48:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438191167CB
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF0710E4B9;
	Tue, 10 Feb 2026 02:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n1v6pBpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010003.outbound.protection.outlook.com
 [52.101.193.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3D510E4A9;
 Tue, 10 Feb 2026 02:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VKsnPVhKICbQsjxmmygwIQkK6uJS4/eMwSgxyQuQUYQ0J8ecG78RsvF49381a9GMAuN/2jbIrMEVWa6gBYwQzVEt2n7HVQu0lWKMYTNYraSCI8Jt3zhL9TA4cUiPVpeAhJ3mquj9cLpuizgSj4cfSxFvGt7ll/312z4BY9dVRELGw2RTGi5uPFEaEW31JD0KRIjlb4KmUeHuhtsJWlfrZzKCYHjr/H0YDz7EL0zY2UCuI94EyTllGZaV/TlYxiSyFu/+6f3/qOFA0TVvGND1EIGHAFAiKdRMD/j9PCLAaO7hiXp6vdzDQTtTH6ecYxqwZuA+lXS80L65755RIGR5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7hUAvH2EP0jmu9d974Ec/vxGle3cNihaZLWgicxHbg=;
 b=DzC4p8Na/0+4KLFXsMWdVV9gB1YF0XtkPcGPhvOst0K3m4saKD+zvvs40oxfeiTwrZaS3UoMv/tq3mH3FvsNGctjIcD50Qw8SVFo+iQdL/CEO/7k2uH9Hm9lYNvX6mBPxCA/yVYhlltUalhxhzhmNKbavrXUCvMmrQUvdXyZ4xbfJQlRgjCCNC0r1VUbm/4+N+N6MFWt+qIHieLCtLfjv3ZoxXh0r6uCVe4Z35ilZs5lJIDNU0uECrupBed/y0Vupt4YKnsKAJ/QZIvvtNJx4rSBX4+5z/RhOT3ais0wSPaWWj6slx4WLq2Xvg/rscFmLSzL7nEwwF3J0Oa2Yp1hPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7hUAvH2EP0jmu9d974Ec/vxGle3cNihaZLWgicxHbg=;
 b=n1v6pBpOIraUMZDrhaFtxbTUlNe6qkdw++dPwMFIuGuXJZjBT5pe4nyixRdlCO7f6HtBp/+d0kRS3lCD4PaoEyor/x/W0tKfNPBZCVG/iXTfGFd1orYl12jWnkTYAi3XLyR2ZTXMjsUggemTp3TDdqIzh7LWrsSKuSJNl6+KTHgp1J8HqIR2/MvK/Yss3lPGOZJ9R/JHPml/jfhsvZDe3pIC1H0Mr6EyuOsTtjqBFdWztV6VO2Qj9tWLW0qD5oSx3XTCwLHBsI5d/SSjELaGv7xPvdY0mU3OBFn6P2vGa8qxJ9uOgKxffx/6VaDHXwcyrKMYeSWgaUGHf+aCx3Zp6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB8715.namprd12.prod.outlook.com (2603:10b6:208:487::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Tue, 10 Feb
 2026 02:48:02 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:48:01 +0000
Message-ID: <7e1649dd-d673-4398-bc3c-2fd6626c9177@nvidia.com>
Date: Tue, 10 Feb 2026 13:47:56 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm: Fix a hmm_range_fault() livelock / starvation
 problem
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Alistair Popple <apopple@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@mellanox.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Matthew Brost <matthew.brost@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20260205111028.200506-1-thomas.hellstrom@linux.intel.com>
 <a1fa9630-2661-4a62-9b38-8154d8ef05b1@nvidia.com>
 <050af3658287690c9f9b29a49bb3e31ecb4c273e.camel@linux.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <050af3658287690c9f9b29a49bb3e31ecb4c273e.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: c6554107-0fea-4241-b087-08de684ece8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVJCTUhTOXl5aUtBS0RMTi9KU1ZXb241ejNPTkc5TzlpNElDWmdLTEZvQ2ky?=
 =?utf-8?B?R0dtSVR3WmhYZWROOVMrbWZiRUk0NFNaUThLWWJNdFVlM2tidGk2ZmtpaVZ6?=
 =?utf-8?B?Zm12NTlGVEV0SDQyeVpnNDNLWjM3clpJcXR0dTlOb2JvWXQ4N2NrZ3ZTNVE0?=
 =?utf-8?B?c28zSXpvNU80YVY0RUxGdXVKOTlqbXlTMnk1Z3AwaytIOTJCdFBSTnh6WE9o?=
 =?utf-8?B?TjByQ050Sk15V1BDbEdUc3p1R24xSDA3L1VEZUF6cXl1NzA5RENOc2w1OXcx?=
 =?utf-8?B?ZmNRaUxLdHlGUzZPR3NzbUdkcEY2Z3NaUFhlbXZqbVhnUFFwQ2dsS21KL3Ro?=
 =?utf-8?B?MStMYmFUWkdzUjBMaWhPMTdmczFBOWZack13aDhIRDVuQWQrUHhCbXgxZG9z?=
 =?utf-8?B?T1hrV3lKT0N3NWxsN3I1QVNZeEtaeVZRbURpckxrUmE3aE1yeWVCZUlmWlEz?=
 =?utf-8?B?UDRYUHFZMmxNQkI3MER4TnAza05QM0RYZ3N0a3JNbUdSK3NZNjVBQ3pDOCtJ?=
 =?utf-8?B?dEdWbTg0cG5qWGtnSTRZcTZjaFVVMUVwY1VpdGtnNzBidXdud0FCeWlFRFM5?=
 =?utf-8?B?UW1uc3U4RkNsQ3ovOENVbmpnRk14S0JacnJXdWRRNUFyY3VnM2NiQmx4b1k3?=
 =?utf-8?B?WGJ1K3kxMzJSM1FDWml1UEc5alIzck5zZmozY1FHZUdKcXJKTTlzWGpjNGJx?=
 =?utf-8?B?MTVHT3Q2UE12bWpDd2dhK05mYWpoaHYzbE1pRDhJU0phVGxRNVZvTlQ3dlVB?=
 =?utf-8?B?TWFNOUVMUkdXbjVYVGpoWnNBb2pveVhlRjBDSGRKTE9IaHFxckNUWG52Ujll?=
 =?utf-8?B?dThEbzhHalA1QzdqcHc4WEV0QldJRGk3aXZMdGEvcFdVTjIzN3h3U2Fudmlx?=
 =?utf-8?B?d2orZHYwa2xJdTZYOFdtMnVzVWRtclViWXg5MERiQUw5LzN3dk9vbXA4bmtU?=
 =?utf-8?B?SHdNU0ZnUXE2SGlKYVpTWDZhbTBwb0ErbWt0VUVHNjVJNng0RVVFNTUzMDRT?=
 =?utf-8?B?QnRkVHgybWQvb0J5RUpuOGFaU09ScWhrVlJzVDJkWHhMWldTcGhQL0luK0tw?=
 =?utf-8?B?QTQ4RGN5NndpUmp3STgvY0FIQ01mUTduRWNXRWxtREFqUWNGajN5WjVTTkZQ?=
 =?utf-8?B?a3NIak0xalRBT004SWlkaGRveFlBK21TczR0SlJtT09pcjdQUTdlUnBoRHdw?=
 =?utf-8?B?MmJSSDdMSHlRYzdlU0IySDVJTzRrT2loLzZlT1FrekkvR090a1A2dWFqaFhw?=
 =?utf-8?B?ODlON0oyWVpJQkZFakpseUZ0VnlWR2RDNmlqY3FEVmNQQURSdS90WVJqNGcv?=
 =?utf-8?B?L3V3eTlROUxXZCt0RlppbmRwL1owSHVLQXpBdCtjWnFXQ21EK0RGM25MbXdi?=
 =?utf-8?B?N1ZyT3EwcmUwd04yRlI2UzZBenRiN2NZMGp0WXdVU0tqcElZeTh2VTl1TXhR?=
 =?utf-8?B?K0VrVTc3Z3lmT05GUy8zbmVpb3JBUkhsS3lxNS8vTXJVdExBRVlCTmRYbjNR?=
 =?utf-8?B?USs4VnpsdTdTaFBVWXp4aUVkb2tTZlg2QXk3UVJnRHdSK0dmRGZrZ1pOV1Fa?=
 =?utf-8?B?ZEk3S21CMWlFcXk1cWJjOEtUM2tQQUFtUXhkalZJVCtlOFlNWFJGTThSMGp1?=
 =?utf-8?B?MGJsS1VKSWlKL0ZNd1M4R1F6cHdJTHJ4ZUlMSUpuamZJcktYV2lYYU44U3Z6?=
 =?utf-8?B?MzkxaEYxb2JwMHNBc0lGRTFFTXBIWVRJa1UrWjhINVo5bnoxVzJFUEx6UGNi?=
 =?utf-8?B?OFNxOFE3dzE4OUVNM2lVcTZYYXJOVUs1c1VsaC8yVmVFRGxDRElUd2gxQ1Fa?=
 =?utf-8?B?UFlHMkZQVkFlY0Z4bzdMNFVQTUVwZ05JTGpZN2ZjOTBSTVQxRW96WTRxS2U1?=
 =?utf-8?B?N1lXWkRIeXBGUEpWKysxUmJmUlljYUVoSEVISll5d3g2REc5TzVwa0hsenZT?=
 =?utf-8?B?dEI3S3plNXI2aUp3QjR2Q2t5UWlkaURLSEVwNGNPRjRma2ZkYXYrUzUySEh1?=
 =?utf-8?B?Rk03RlhLa0tpQzEwZUZ3QnRBUGQ1TjRmL3VRZzlIazVKekxDNGNwRnhKMWx6?=
 =?utf-8?B?aVdGcGZMbXZ0RkdGU3RBcWZkeDc5d2M2RTZTdG03NFVYdTVlaGJEOGpCRGho?=
 =?utf-8?Q?Xn7Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2hiUE1iY3JBVnJJdngrNXhLN1ZiQ2lXSCtDckZaR25KVmVwckRpUVcrejJ0?=
 =?utf-8?B?MExqelQ4UjM2ZDF3akRhSGgrZ0d2eSs0d3VaLzJuMHBjdHk0WkM0QnZkR1FG?=
 =?utf-8?B?OFYzcTZTb1RibFpLcTJjcXlPNGRkUU1ZQzduVDRibnYxN2JyOGZXSWpwV205?=
 =?utf-8?B?Z2wvaDhNOTEraElzT2lwVzJISkhGVWJSTnZhR2g2UW1PV1c1OHFpK25Ua1Jq?=
 =?utf-8?B?U1Z5cUw2czNtVWF4dFd0TlowU1BVUC9rK3A2Q25jMUF2a21hWFg3eHR6ZkdG?=
 =?utf-8?B?RFVoZFhQdU5hdlVza1B3L0VkNFM5NWZONWRMRjFQL0VCbW15V3ByY2VBRXpt?=
 =?utf-8?B?eUwvZUc2WjZFMWNtKzFTeFZBblQ5aVNMVWZpSVE2SXM3Y2N6UjcrSFpEY1gr?=
 =?utf-8?B?R1RKQUhpQ2pMUkVPNnI2L0lLcXl6S3ZZU2NWbjZUZERUMjFTQ0x2NmV0aUkr?=
 =?utf-8?B?cWV3UVFkc1VPcjlkQUYzdUp6WTZiaTgyR3ZHU1Zjbk5NUlJtc29wMERaV01T?=
 =?utf-8?B?QVM4NVhhQUNEWFFFOWVwMkVIbXZjN3JzL0lFRm1kYmNpZ0Z5NFJUYVNUTzRz?=
 =?utf-8?B?NGR2UmF4ajZ0R1ZhYitYbE5HdTZWaHl4MHgzYys5eHhUcis4ZGg2VjdCdXpE?=
 =?utf-8?B?bFRYY3NPYjUxUG5QYWJkdnpONWpWclVEczRFTzdURU0rN1NSS1FtZ2o1L3Bi?=
 =?utf-8?B?Zi9DOXRFQ0lsUW5yNy9iMWNOU3pjZE1FMy8yZy8zZDNEN28ycjZOZEx4VXBl?=
 =?utf-8?B?US9qR1pJZENaYW40R1dVNUg2VmhZYmQyeWpiMmhCYXF2Z2R5bHh5ZG50Q0RN?=
 =?utf-8?B?Q2c2czNYSjU2S2lMYXZ4L1ozK0JIOFdjN3hHb1ZwN3ZwK0szc0pFS0ZrZGJT?=
 =?utf-8?B?MnlXMEZFdFRobTRRUjVTcWR3QWh4Ym1MVkJKbzQyRUdHbTZCNXZnMjdadWNB?=
 =?utf-8?B?WTJiV1BRTjFnK2xQL2FqU3NPanFtdnNVZGkwNDB5YVowK09KeXprLzdicWFp?=
 =?utf-8?B?c043WXFDckFCeXNDdjl0azdtWmNiY3U1eU9SQjJZbG9kaDFGYnplTkhidkFP?=
 =?utf-8?B?Z3ZaU1gxVHdvRGxBbXMrcVZvMnlLUFp4cXlvSDMvR2Z1ZHBPbWUzcXZlK0hZ?=
 =?utf-8?B?anlUVnVOa1dJZjZ3eW5INlNkdnZubWU1S1FLc3RYcnNhY0FQNTRuV0wzT2Zl?=
 =?utf-8?B?Zkl3dFhZOWY2endkZk5sZzR1WXYzQlN4Nk9JeDNTTmlMcnUvVHJmVHhHeU9H?=
 =?utf-8?B?OUphRlB6Y0dGTndJNW8xK1pjL3g1ekpFY2trWWhOeHNOWjQ5VkJBcEhiOFUr?=
 =?utf-8?B?a3E1QnlDTiszbnhTLzlORlcvMXZnVkprRzdoR3QzbllkbkRySXVSREpWNmlx?=
 =?utf-8?B?SUIram5nellUcW90Y1VsdW5yTXg2WHBRZjd2WlJNenJZcWRxQUxSWjdqb0hW?=
 =?utf-8?B?ZUV5Nkp4WWsvblliaTdFeWRpTlRISkRkaFlCWFhpaFh0RXJqdkw5WUJDUGJC?=
 =?utf-8?B?OVdYZGFzSFltNDF3emZMY1BXY3ZYVENpbXl4Uzc0VEpDbWFFWmdvdEQzTWtJ?=
 =?utf-8?B?dVhIRDFLV3pGUExaSDQ4YVdPd2RwbU8wRmVLdHdDVGZoRGo5WVF2WW1ZbnU5?=
 =?utf-8?B?NHAweWd6dE9xeVVnQXlWNXBHNDRmYk1MWnR6dXV3M1UyRmlJL1hWUDY4NlFO?=
 =?utf-8?B?Wmw1K1NTbk5PeXJvcklCYmxYVmhlZEpkUlVMRnZyUEJ5L2hRWEkzbm1aZ1h0?=
 =?utf-8?B?cjhsc3NDMlBzTlp2a2JsMW80alNYclRBeTBVZDdBQjUvU2NFZnJkdk5MRGhr?=
 =?utf-8?B?eG1LWVAzK3VNcHRTdGEvVWpmMVZJMEIrY203YVg2MEpmYlpCUGdNSkRuc2Fk?=
 =?utf-8?B?WWVTZVpzaFNVTFljcFJXemgwMGlXZ09nUWNGaElBSUFtSk5NUzc5YW5BcS9z?=
 =?utf-8?B?VVV3dytkd0FTSXZMTHN2VkRkTFB6VWRLM29DVGtuYXlZcTlWYWhQNGRUbUJJ?=
 =?utf-8?B?M3Y4Yzh5RGh2R1lRbkl3UHVXVFpTWXRVRWFyVDdWc1ZXT2NXK0VibTJWbnpT?=
 =?utf-8?B?b0V4TDFFQVFadk9mUkNHSTIwVE5rckpFdDNxREQwQVBZNTNYenFmVEgxZWhG?=
 =?utf-8?B?b2Z6azRrdTVNOEZSTmEyNlZnQWxQOExUdCtaN1JkNnFKakNqTVpQQ0QxQUdT?=
 =?utf-8?B?QmhVQy96VXJnRFp5aDVqUno1RE93NDZsZHRESHZJWWdua2hVOHk4dDZ0Q2Rq?=
 =?utf-8?B?NmhZcEZYVzl3NHgzbC9FSDI0eUlMQXdCZTlPKzE1cUIzaDFZWkI1bXBXbUVB?=
 =?utf-8?B?WWZyK1JVOS9SWUtNVmYvN1g1V2pEaU1WOFZNaGFLUHpkc0F6T2tEd25yWGt1?=
 =?utf-8?Q?HkYSqd3MPRvvb69xsI3mTOaH0S+HCkmzZBq1BaqQtJuDX?=
X-MS-Exchange-AntiSpam-MessageData-1: 1anZqHM8tDhw4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6554107-0fea-4241-b087-08de684ece8a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:48:01.6921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqnxSvr4ZzscM+QZiLsYmQwGVVsLoh7kIkS1wCDDS3P4/5g3LutsaRPyqmPrUwVYpO7xjlatsQDuVImWK5i1Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8715
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 438191167CB
X-Rspamd-Action: no action

On 2/5/26 23:41, Thomas Hellström wrote:
> On Thu, 2026-02-05 at 22:20 +1100, Balbir Singh wrote:
>> On 2/5/26 22:10, Thomas Hellström wrote:
>>> If hmm_range_fault() fails a folio_trylock() in do_swap_page,
>>> trying to acquire the lock of a device-private folio for migration,
>>> to ram, the function will spin until it succeeds grabbing the lock.
>>>
>>> However, if the process holding the lock is depending on a work
>>> item to be completed, which is scheduled on the same CPU as the
>>> spinning hmm_range_fault(), that work item might be starved and
>>> we end up in a livelock / starvation situation which is never
>>> resolved.
>>>
>>> This can happen, for example if the process holding the
>>> device-private folio lock is stuck in
>>>    migrate_device_unmap()->lru_add_drain_all()
>>> The lru_add_drain_all() function requires a short work-item
>>> to be run on all online cpus to complete.
>>>
>>> A prerequisite for this to happen is:
>>> a) Both zone device and system memory folios are considered in
>>>    migrate_device_unmap(), so that there is a reason to call
>>>    lru_add_drain_all() for a system memory folio while a
>>>    folio lock is held on a zone device folio.
>>> b) The zone device folio has an initial mapcount > 1 which causes
>>>    at least one migration PTE entry insertion to be deferred to
>>>    try_to_migrate(), which can happen after the call to
>>>    lru_add_drain_all().
>>> c) No or voluntary only preemption.
>>>
>>> This all seems pretty unlikely to happen, but indeed is hit by
>>> the "xe_exec_system_allocator" igt test.
>>>
>>
>> Do you have a stack trace from the test? I am trying to visualize the
>> livelock/starvation, but I can't from the description.
> 
> The spinning thread: (The backtrace varies slightly from time to time:)
> 
> [  805.201476] watchdog: BUG: soft lockup - CPU#139 stuck for 52s!
> [kworker/u900:1:9985]
> [  805.201477] Modules linked in: xt_conntrack nft_chain_nat
> xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 bridge
> stp llc xfrm_user xfrm_algo xt_addrtype nft_compat x_tables nf_tables
> mei_gsc_proxy pmt_crashlog mtd_intel_dg mei_gsc overlay qrtr
> snd_hda_codec_intelhdmi snd_hda_codec_hdmi intel_rapl_msr
> intel_rapl_common cfg80211 intel_uncore_frequency
> intel_uncore_frequency_common intel_ifs i10nm_edac sunrpc binfmt_misc
> skx_edac_common nfit xe x86_pkg_temp_thermal intel_powerclamp coretemp
> nls_iso8859_1 kvm_intel kvm drm_ttm_helper drm_suballoc_helper
> gpu_sched snd_hda_intel cmdlinepart drm_gpuvm snd_intel_dspcfg drm_exec
> spi_nor drm_gpusvm_helper snd_hda_codec drm_buddy pmt_telemetry
> dax_hmem snd_hwdep pmt_discovery mtd video irqbypass cxl_acpi qat_4xxx
> iaa_crypto snd_hda_core pmt_class ttm rapl ses cxl_port snd_pcm
> intel_cstate enclosure cxl_core intel_qat isst_if_mmio isst_if_mbox_pci
> drm_display_helper snd_timer snd cec idxd crc8 einj ast mei_me
> spi_intel_pci rc_core soundcore isst_if_common
> [  805.201496]  ipmi_ssif authenc i2c_i801 intel_vsec idxd_bus
> spi_intel i2c_algo_bit mei i2c_ismt i2c_smbus wmi joydev input_leds
> ipmi_si acpi_power_meter acpi_ipmi ipmi_devintf ipmi_msghandler
> acpi_pad mac_hid pfr_telemetry pfr_update sch_fq_codel msr efi_pstore
> dm_multipath nfnetlink dmi_sysfs autofs4 btrfs blake2b libblake2b
> raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
> async_tx xor raid6_pq raid1 raid0 linear rndis_host cdc_ether usbnet
> mii nvme hid_generic mpt3sas i40e nvme_core usbhid ahci
> ghash_clmulni_intel raid_class nvme_keyring scsi_transport_sas hid
> libahci nvme_auth libie hkdf libie_adminq pinctrl_emmitsburg
> aesni_intel
> [  805.201510] CPU: 139 UID: 0 PID: 9985 Comm: kworker/u900:1 Tainted:
> G S      W    L      6.19.0-rc7+ #18 PREEMPT(voluntary) 
> [  805.201512] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN, [L]=SOFTLOCKUP
> [  805.201512] Hardware name: Supermicro SYS-421GE-TNRT/X13DEG-OA, BIOS
> 2.5a 02/21/2025
> [  805.201513] Workqueue: xe_page_fault_work_queue
> xe_pagefault_queue_work [xe]
> [  805.201599] RIP: 0010:_raw_spin_unlock+0x16/0x40
> [  805.201602] Code: cc 0f 1f 00 90 90 90 90 90 90 90 90 90 90 90 90 90
> 90 90 90 0f 1f 44 00 00 55 48 89 e5 c6 07 00 0f 1f 00 65 ff 0d fa a6 40
> 01 <74> 10 5d 31 c0 31 d2 31 c9 31 f6 31 ff c3 cc cc cc cc 0f 1f 44 00
> [  805.201603] RSP: 0018:ffffd2a663a4f678 EFLAGS: 00000247
> [  805.201603] RAX: fffff85c67e35080 RBX: ffffd2a663a4f7b8 RCX:
> 0000000000000000
> [  805.201604] RDX: ffff8b88fdd31a00 RSI: 0000000000000000 RDI:
> fffff75c86ff5928
> [  805.201605] RBP: ffffd2a663a4f678 R08: 0000000000000000 R09:
> 0000000000000000
> [  805.201605] R10: 0000000000000000 R11: 0000000000000000 R12:
> 0000631d10d42000
> [  805.201606] R13: ffffd2a663a4f7b8 R14: 00000001a4ca4067 R15:
> 74000003ff9f8d42
> [  805.201606] FS:  0000000000000000(0000) GS:ffff8bc76202b000(0000)
> knlGS:0000000000000000
> [  805.201607] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  805.201608] CR2: 0000631d10c00088 CR3: 0000003de3040004 CR4:
> 0000000000f72ef0
> [  805.201609] PKRU: 55555554
> [  805.201609] Call Trace:
> [  805.201610]  <TASK>
> [  805.201610]  do_swap_page+0x17c6/0x1b70
> [  805.201612]  ? sysvec_apic_timer_interrupt+0x57/0xc0
> [  805.201614]  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
> [  805.201615]  ? __pfx_default_wake_function+0x10/0x10
> [  805.201617]  ? ___pte_offset_map+0x1c/0x130
> [  805.201619]  __handle_mm_fault+0xa75/0x1020
> [  805.201621]  handle_mm_fault+0xeb/0x2f0
> [  805.201622]  ? handle_mm_fault+0x11a/0x2f0
> [  805.201623]  hmm_vma_fault.isra.0+0x5b/0xb0
> [  805.201625]  hmm_vma_walk_pmd+0x5c7/0xc40
> [  805.201627]  ? sysvec_apic_timer_interrupt+0x57/0xc0
> [  805.201629]  walk_pgd_range+0x5ba/0xbf0
> [  805.201631]  __walk_page_range+0x8e/0x220
> [  805.201633]  walk_page_range_mm_unsafe+0x149/0x210
> [  805.201635]  walk_page_range+0x2a/0x40
> [  805.201636]  hmm_range_fault+0x5c/0xb0
> [  805.201638]  drm_gpusvm_range_evict+0x11a/0x1d0 [drm_gpusvm_helper]
> [  805.201641]  __xe_svm_handle_pagefault+0x5fa/0xf00 [xe]
> [  805.201736]  ? select_task_rq_fair+0x9bc/0x2970
> [  805.201738]  xe_svm_handle_pagefault+0x3d/0xb0 [xe]
> [  805.201827]  xe_pagefault_queue_work+0x233/0x370 [xe]
> [  805.201905]  process_one_work+0x18d/0x370
> [  805.201907]  worker_thread+0x31a/0x460
> [  805.201908]  ? __pfx_worker_thread+0x10/0x10
> [  805.201909]  kthread+0x10b/0x220
> [  805.201910]  ? __pfx_kthread+0x10/0x10
> [  805.201912]  ret_from_fork+0x289/0x2c0
> [  805.201913]  ? __pfx_kthread+0x10/0x10
> [  805.201915]  ret_from_fork_asm+0x1a/0x30
> [  805.201917]  </TASK>
> 
> The thread holding the page-lock:
> 
> [ 1629.938195] Workqueue: xe_page_fault_work_queue
> xe_pagefault_queue_work [xe]
> [ 1629.938340] Call Trace:
> [ 1629.938341]  <TASK>
> [ 1629.938342]  __schedule+0x47f/0x1890
> [ 1629.938346]  ? psi_group_change+0x1bd/0x4d0
> [ 1629.938350]  ? __pick_eevdf+0x70/0x180
> [ 1629.938353]  schedule+0x27/0xf0
> [ 1629.938357]  schedule_timeout+0xcf/0x110
> [ 1629.938361]  __wait_for_common+0x98/0x180
> [ 1629.938364]  ? __pfx_schedule_timeout+0x10/0x10
> [ 1629.938368]  wait_for_completion+0x24/0x40
> [ 1629.938370]  __flush_work+0x2b6/0x400
> [ 1629.938373]  ? kick_pool+0x77/0x1b0
> [ 1629.938377]  ? __pfx_wq_barrier_func+0x10/0x10
> [ 1629.938382]  flush_work+0x1c/0x30
> [ 1629.938384]  __lru_add_drain_all+0x19f/0x2a0
> [ 1629.938390]  lru_add_drain_all+0x10/0x20
> [ 1629.938392]  migrate_device_unmap+0x433/0x480
> [ 1629.938398]  migrate_vma_setup+0x245/0x300
> [ 1629.938403]  drm_pagemap_migrate_to_devmem+0x2a8/0xc00
> [drm_gpusvm_helper]
> [ 1629.938410]  ? krealloc_node_align_noprof+0x12f/0x3a0
> [ 1629.938413]  ? __xe_bo_create_locked+0x376/0x840 [xe]
> [ 1629.938529]  xe_drm_pagemap_populate_mm+0x25f/0x3a0 [xe]
> [ 1629.938721]  drm_pagemap_populate_mm+0x74/0xe0 [drm_gpusvm_helper]
> [ 1629.938731]  xe_svm_alloc_vram+0xad/0x270 [xe]
> [ 1629.938933]  ? xe_tile_local_pagemap+0x41/0x170 [xe]
> [ 1629.939095]  ? ktime_get+0x41/0x100
> [ 1629.939098]  __xe_svm_handle_pagefault+0xa90/0xf00 [xe]
> [ 1629.939279]  xe_svm_handle_pagefault+0x3d/0xb0 [xe]
> [ 1629.939460]  xe_pagefault_queue_work+0x233/0x370 [xe]
> [ 1629.939620]  process_one_work+0x18d/0x370
> [ 1629.939623]  worker_thread+0x31a/0x460
> [ 1629.939626]  ? __pfx_worker_thread+0x10/0x10
> [ 1629.939629]  kthread+0x10b/0x220
> [ 1629.939632]  ? __pfx_kthread+0x10/0x10
> [ 1629.939636]  ret_from_fork+0x289/0x2c0
> [ 1629.939639]  ? __pfx_kthread+0x10/0x10
> [ 1629.939642]  ret_from_fork_asm+0x1a/0x30
> [ 1629.939648]  </TASK>
> 
> The worker that this thread waits on in flush_work() is, 
> most likely, the one starved on cpu-time on cpu #139.
> 
Thanks, makes sense!

Balbir
