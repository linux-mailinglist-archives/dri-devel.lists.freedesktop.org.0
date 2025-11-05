Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1EC385D4
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 00:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2670E10E7CC;
	Wed,  5 Nov 2025 23:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EzCaFsWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1437510E7CC;
 Wed,  5 Nov 2025 23:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9WdtbqxFumDOTRErl04SJid3GwuKg6g4Gkt9zSERYe5snfuh4uCYIE/SlrSXgZ08CAFixPEbtufqQR6f/UB+Om17svuRyYuJE324W8ih8VzapTHbxwmjlAOtPpZIQawBXVIbecjSg13y762ZAFePOwTliD6OX+BtLcxN3TVKQB1bwyb+3sZcJdLH00zTlepBrjh8fi5IfinQeYO4uCxaDvDm4/WdaI+edRFgRkG8V1dnq080hc7C0f/ZYX1KVh8izIrIHlfPMJpDVoZHd5+qu0yLZA5kEdhgW3l2fXA5g58QkJ844DN90H5kJ5q7KCyemsUN4XqFKMtCRiP7DPLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oa76gvRMFIkpgK8ugG1vepdMaVOo8T4whKEJ50P1fQ8=;
 b=uVxawUVwVl/tJ722oZVT7bYq44TBDVN5rJybNF94r5CnOCr86ZH3s328RcHDcxyegzgajJxn67YudPE1U3MG5Rnjr8S3FMqlXBaOGBI28oI7fPSic+Q68BUAVdmMckT90tSZN/BIX+vy8a29YG4iwaoPvakLBZFgTie/1w1JiYQLS5jMEEfZtwQLbcdli67mYq9R5FCwVqmhLKocyen2tf5YiRlNwwro+b7yMFreOO40ssN0mWYYZS9Z487sNi1u3pQKoWeaLMzcnya1jvKCjGKsh76dYTn3Wj6JbyQHv2XRzUTJvrV6S4cZD7OqglACNEYFXaoJsljcYMkiRAASCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oa76gvRMFIkpgK8ugG1vepdMaVOo8T4whKEJ50P1fQ8=;
 b=EzCaFsWpBp6Y5nDa/uOZRDkLXN4sjPcU6rOfJB1GwCi+794uRp1Z6+R7yOxFyOwPDs2JTHIwx9tRYafSEZNteOT0q9UNJLfdfQ1AMotuiMrL35au5eNWRmBLACPetW6WYMDq7uz6FZpm0MGkNwC3ccnSzsJq8j1cG963aKCEgDfXaqmIlk9Kn/H1QCcej8bPzwXKyYXP7WcDlKo+fP8+T3hezRgWc3akGgVRAzyiI3nVTVWNtwNabjjS6E4f/ypDzBmI4y6Daw7uYdM3PnpflyE51eq2syDUMk44bYLsCvfFonPr4GYlcgwfLZPWb9u3iXD2ucxcrqZLjyALnNqDHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 23:29:56 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Wed, 5 Nov 2025
 23:29:56 +0000
Message-ID: <eac72108-6912-45fb-bb1e-43d5e931be9f@nvidia.com>
Date: Wed, 5 Nov 2025 15:29:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] nova-core: gsp: Add support for checking if GSP
 reloaded
To: Lyude Paul <lyude@redhat.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-6-joelagnelf@nvidia.com>
 <8cc10b6ec1fce03aa41eae76dc48a6a27a58d7d9.camel@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <8cc10b6ec1fce03aa41eae76dc48a6a27a58d7d9.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:a03:333::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: a6632917-a18f-4c25-cfb2-08de1cc33af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlhCSE1DdUlwSlZDUS9obVNEVDlvQlZhUy9wcngyeGM5NWdybzE4Q1V3R3hv?=
 =?utf-8?B?bHVqaWNEWGpWNWsxWW5EdXRsK1ZJTVlzdXNXaDYzYTdNRUhHRCtjNFBZOUZo?=
 =?utf-8?B?NldIYTNZdjJXRDE0amQzbkw3L25uYlhIbDRPSUFFeFRqT29nNHRkazdLSzZB?=
 =?utf-8?B?QXpUZzFqOVIwclZVUE0zcUd3WndnMXJSWVBLZEVLWm51NXRoTmVrTWZiMXJU?=
 =?utf-8?B?LzJyOS9DNE4wTi9zT0l0OThPa3d3c1NFYmlIMDl5ME9WVkRiRyt5SmlWa1JO?=
 =?utf-8?B?bEp2d1A3dUpESEhBU1ZGUGl5V0xSVFMvaGVSSGJlNkF0dlRZZ1ZhY0FpRmVM?=
 =?utf-8?B?ZFFSdHlYU0VDWUx6MlYrUHpCd0p5Q0V6SDVQYTBLR2RFT2pvRkZONVdXVklR?=
 =?utf-8?B?aHFtKzg3aXptdzZoT2FKcEIxSElYRVJoY1E2eFk1S0k2SHVhTGhDNGlJd0RQ?=
 =?utf-8?B?WW1vL2VRMWk5WUVUemE2YVJEdnlhTkFvU2x1Y0ZyVGlwWHAzY1pzN3ZEcmRV?=
 =?utf-8?B?RjdTMlR6dFZQMFVvekdYMXY1cnZTdnd0aDZNeWY3dmJodkNoQ1dnQ1lrbHZK?=
 =?utf-8?B?QmdNd0FrZGlSQmxKRDFBZ3M2WnZlVUlrSTdZaUgzWVI3b255U29zZlFYT21s?=
 =?utf-8?B?c2R0anJERHRLUzdMT3g3V2NyUTh0VmlvQWJTVkt0VmRTY1NTVW9rVytSSDNE?=
 =?utf-8?B?ejFMSTE2S1BiUnZYT3o5QjRoMERuTjIrem5Mbyt2S2lFNmNsNlBDOVJWZlBH?=
 =?utf-8?B?cHk1dUlJbzlBZndqYXNTT3lQbC83Zm1aNG9KQ2lWYmJNeURrbDRXRHBPQWxW?=
 =?utf-8?B?RFNiUlhTdlF1dnRYOFhPczhRcnlWVFRBTWQrV0ZSd0sxYkducXRGVS8rRSsy?=
 =?utf-8?B?anFRbS81WlF5OHJvL21kakE3ZEs3aUpKalRkWTYvaXIvNUhUTkZIN0ZEcDF4?=
 =?utf-8?B?eGt0WDJxVFdMT01YUGJXRmx3ZnhDRE5CSER3aU1yTlBiYUYzZER1dXhtK0xN?=
 =?utf-8?B?K2Vic0wwWERQanVsSW9VbVFOSWFpY2Z1MDdqS3UvNisvOG05UXlSeG53cnF4?=
 =?utf-8?B?Ylhmc1ZhMTNUSWlJR3hmZk1qMldySUU2aStVcS9QOWFZRFo5TjNQYUpkTVc1?=
 =?utf-8?B?cnM1WGMwazdzZlJWZ1diVDVkcXZFS0NXMWxzTWVnY0preEhkSDk2dHZtVWhT?=
 =?utf-8?B?RHNRR1hUNSsyMlYyMnJiSkdmaEIzNmdzTE9yaXlMT2dnN2xjUjErNkhMSWVY?=
 =?utf-8?B?T3F4eHJCQ3BDSi9KY3FwSEpSVk53YnUza0hpRWxuQ2R4N3FnN3NsbzNhVGdj?=
 =?utf-8?B?OHEwdWZqcXZ0S0J4N2VWdStLWGw1SFVsbDd5MGo2R0Jjdm96Ly9TSW8xUGdh?=
 =?utf-8?B?MGg4MTVYQ2FIOGh4N01EcHM1K0lRV3Jrb3BlaHdVMVlUK1FlRzZjRTNJTUVV?=
 =?utf-8?B?R3M1cE0rNWVJNzh3UktPYkJSRzZxYTlsYmhDTmgyQ2FNVXd5VWRZblVQdVZB?=
 =?utf-8?B?RFlYSkhrQmR4dGxrcy9GOFdGQ2NvWmc2VWIrQ2JOb250MGc0RDFJZksyV0pu?=
 =?utf-8?B?TUY1SnN1R0MxVGIwNnd1R096S3JFNXZNWHZFVEdkZmlMcVFXTXFWTi9wckJ6?=
 =?utf-8?B?N2FGQVoyWkpacE92TGdkcUNkdmxFOXpHc3lwd0UrU25xMjBTWFBNei9ES2E2?=
 =?utf-8?B?NkxjbXpnM2ZkWUxuR2xTcUtpUzRZVmtzQXZQd1M1Sk5aWlQwRXAxOVZBZHlo?=
 =?utf-8?B?VTAvcEdVTWJKV0FGOTNXNSs1Zml5c2pYVzFYTXMwV3E2QUR4TXE4L0orT3hs?=
 =?utf-8?B?YWoyRklrdzJnUTlHVmxWUTk1VmJZNm1DTGZRKzlpTWVSK1ZjN0xIK0ZURWRU?=
 =?utf-8?B?dXJqVVVoK2tJWkczd0hvQW50UjVSMk9CSUZUakJsVDh0RXo1OUtScXR0WEZL?=
 =?utf-8?B?SHM5NC80M0toaWtvV2FpazRVTkxaWi9UOHJ5SVBRZ1NxRU1yTTVSMlNicTBO?=
 =?utf-8?B?Vk8rM3kvMnN3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWdrbFlMajF1ZnZ0ckdUYXNlK1VMaEZ0TmZ4b29tckhJL2haTUxhc0pRNUxL?=
 =?utf-8?B?RlFxckN0NlJ2UlZJMklQNXg1ZEN3cHRVL1FuTWM4UVJLNzZ4Vlp4OFNKL3h4?=
 =?utf-8?B?a1g2dGxVcmVUSHFCejhXc0NqSVlJZU1oRHR3YnJpYXo1WU4yZ3A3OVFva1Mz?=
 =?utf-8?B?OHZiczJQNmFmdFUrUzMxYVBaV3NPVStIVFV1bVdLcGNRUjlIYkY3RDQ3bWx4?=
 =?utf-8?B?WEpDOFZhYWw5NEZQQ1VFZlc3eW1LeTZaenpwSmRUQnZBNUE5K2FEUVMreVZi?=
 =?utf-8?B?WVZKTzdYKzd2KzdKZ2Q3U0FFTlZpWFczRjBTdTl4cWJibVAzN0xwY2VvV2M5?=
 =?utf-8?B?OWNsSTNvUDVSQmp0akRBc1dFVE4yQjJIaytoV3hWdW5lcVljRzI1di9Wb1B6?=
 =?utf-8?B?ei9Odi9ZZnNKOStobnY1bWpSV1lMS2E1Y2JTaDgvVGtBdDRPRmNlaHNPQnZ2?=
 =?utf-8?B?Y25GQzRYc0xmQXRqeDQxNkFTdHFUeHluQm5MYTFBd213TGZwTVIwa25Dd2F0?=
 =?utf-8?B?WUN6WE92eDNCUFB4WjIwRHJnaTlJdGQ1dGlFa0NnTVlRQk4wUDVXSERydlQv?=
 =?utf-8?B?bXdTTWRDYW5YNjBIY09qVkJwaENMYnhSS2FNdC91QjBYZzk2WFJkNHNzSDVD?=
 =?utf-8?B?RzN0WDlWRFNyL1Jra3dYLzJjN25VanI3WXNkQWhjYTJLbVRIYmozK0p6T1RS?=
 =?utf-8?B?OW1oajVlYjhJS3EvL3ZzMGNOZXdQTkNRWWdhUTBkS0k0NlBvdXZDZHlMZ0pO?=
 =?utf-8?B?OFovT3JYdkdsbkFGNTg1TVlGSjFqcGRmTXc2akJsYnhDN3RmODBONmRsNkVs?=
 =?utf-8?B?WlExMnpYdkErL1k2aWlCZXorTFp3bHNmdHpzU3hYNnA1SXZBbDFmM3hqNVR5?=
 =?utf-8?B?MFdsNGpzbHkrdkY0bFkySWxpaUJFVWU0VWJOWW0yUXlTeWhIRGV2L3dRaFBE?=
 =?utf-8?B?NllBK2o3NHo3cFhLMkVRb25KU1J0bjVucnNUdnpsSzcvZllYc3VkdDBlOGFE?=
 =?utf-8?B?VjFDeUxsYm9WSVJFbjN0Sk1IMnNQNFJGeE9VdWFhMDhrZzFTaFQvYVVENVVl?=
 =?utf-8?B?bVlXdUtiTDk0cERCRDVtcFJ1amUrMThrcjZMVldZVWN1b0J0WFEwRFYwbnNh?=
 =?utf-8?B?a3ZpZXdEcmpoTU9HcGk1ZnNoVmQ0OVc1SlFoQWMrbXdmVDc2NW9PRngyVlAr?=
 =?utf-8?B?TXArOXlxbEh4QWRBUE1lMlpPSG1zU05uRWtOcDBUV3F5ZnZuS25qU3pVcTZw?=
 =?utf-8?B?KzhGL1N5UURLdU4yVWVDR3dFRHA0NVBPYUdSa1hldmYzR1hsdnA2bFhqS3Bl?=
 =?utf-8?B?bDMrT1ZZam5McjE2VkROUWxDUkVMbzR4Q2R3MFZ5dVUxNEUyQU9XWmZvTnNl?=
 =?utf-8?B?eDJTVkx5TC9Ka3dhWHNzb2hiS0pWTmlqV0Z6YnIwOHh3c3p1MVd1V2tjTXlT?=
 =?utf-8?B?cE00TUZEZnltd0c3bmhxd3dGYXVMNVR4L3dOcWVkeGh1MVl5cVlRSzZTSTg5?=
 =?utf-8?B?S2M1QmUySjJBSHErVmpUTWtpckpCOVM1bXMya2RRL1gzQnRTckhvZDg1OW1F?=
 =?utf-8?B?RUFhVUZrSVhZV254bU1xVG40TURDd0ZjQ2UwSlBrd2pZVUEzK0lQWGR6UlBn?=
 =?utf-8?B?K2lySHMyQ0NnTXZXeGFIOGZIdTBCd1U2MSsvdjZiSEJ2eEY3L3Z1VDdUcDVj?=
 =?utf-8?B?M3Zlc0hETHFpR1dSTlJxbThsS3MzRndDZVlFNlVwWDFoQkphTU1SUmNLeVBN?=
 =?utf-8?B?eTRQZnpWUXVxdmF2YlJJR3NXWG1pTmh0UTMzSVM2QVpVTTQ4cWt1bUlreE5o?=
 =?utf-8?B?WXUxRWhXblFGc3E4a0dWOUZWcTZ3VUh0MzdoemloeG9KY2w5dGpycjZZczYx?=
 =?utf-8?B?YmM1UDJZdXk2VEZKZjlESStHQ1luTHM0SXJBTHNQYlBHMmFBSmRZVHJOclpa?=
 =?utf-8?B?a3VtODZ0MmFQckh4dE0rK0lmbE5kcUR1Wis0SkNkSkY5ZGViYlFPakFzT2Nt?=
 =?utf-8?B?S1IwTzQ2d3dLOERUMkR2OW11NS8zT2I2Q2FZQ0dGYXUyb1pGRWxzZ3NQaVdw?=
 =?utf-8?B?UCtmZ1pYcFJ1NlNBOFQ1N2V6YWx5emJXamdFQWZBM1BDVnBnemtsZVYwZE5K?=
 =?utf-8?Q?q4S09K5iPsGPYhAWJWAq5d1j5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6632917-a18f-4c25-cfb2-08de1cc33af0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 23:29:56.7536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnbsgJUIxadRXh7avlyOHOQlf+zV+7HOoFhEjalToldxABaQFeD2VQGwxYuZB422Gz29VjREeAG/f8REvYeDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154
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

On 11/5/25 3:18 PM, Lyude Paul wrote:
...
>> diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
>> index f17599cb49fa..e0c0b18ec5bf 100644
>> --- a/drivers/gpu/nova-core/falcon/gsp.rs
>> +++ b/drivers/gpu/nova-core/falcon/gsp.rs
>> @@ -1,5 +1,11 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  
>> +use kernel::{
>> +    io::poll::read_poll_timeout,
>> +    prelude::*,
>> +    time::Delta, //
> 
> Looks like a wild // got loose!

Not at all. This is the new normal, until rustfmt gets updated.
The idea is to avoid merge conflicts in "use" statements, by
having one item per line. The trailing ", //" is a hack that
forces the desired behavior.

As per Miguel Ojeda's note, here:

https://lore.kernel.org/all/CANiq72kDB1cX1XXX7sc3yQvnaUUYB8q1wVKNxykv8=OV-=rWuQ@mail.gmail.com/


thanks,
-- 
John Hubbard

