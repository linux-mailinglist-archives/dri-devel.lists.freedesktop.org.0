Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9552B09F43
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C0610E929;
	Fri, 18 Jul 2025 09:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZFn1iayJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7BE410E929
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbIwROOe2dneeHecGVXHm/kqvxlggRVrdMszby9+e6cQ+z8mKBPFd4rZL5dx5eZF72idWLx/Zyr8M8Gfy0sDhn+IEVIQUt9x9dYUZ2qhqfhqq9xewfSrloBH7MCU+kFND1iiKpN0tk5pl0W7R8itFH1u9S6JVCEDqJvHHnyK0fRP3ygDbdYc7RZcCmC8mzUJRXXsN4y/dpcneFPVUJX6FG0Uc91G+YBppOcOtFEOaqqPdT4GU6l4ov3dLpUduUCZ8SmII7SmK8DhIXgBRJkcJGOupHKhKTnsuOvTOaAYX6H4CIUAhF3ltP4tiNCx3UyP5QqkJJF+NhkCCm2Y5OwmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYL+0/P27xLz6zKbdCmX5mZrcxPcKT1K154E0aEOlyo=;
 b=yzbzsxdDOiIfetD6HdCw4fYsZug4QYieh+fqBQrMsILn8ymvPU7HQR8PIBtZ/bzek5CbqcLS+6jXhmKWfFxdEFgAro6Y0+chMc0jwHZrLHH14w6xXmQrfFTFlZr8PJMeUFEP6ohZuK0ZrbEzjZC07FnCoxLyaXyQ5QlD+0Azu4Kf32kvcN91rFl3Q50t30qOQEDbNGzJSUYQlNy11ezb+vKd+UfGY8gHak5rnKMW27XV7cbK9G8CiO6vnf85Cfv1Z5g+KgX+67YAFZ7tz6PcHFjmqemcGVuOSzvchvM8NPyAJkN73A6Q4G2oQ2B/1SOZBkzsIScjsUAvcHTVOvdRrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NYL+0/P27xLz6zKbdCmX5mZrcxPcKT1K154E0aEOlyo=;
 b=ZFn1iayJBKUZCP1shaYcRLuv8LaJXTEyinpbuXqD8IqPx6dsrdDH6abXoHyt6yjcrczvLU8i974fYapmhhCIh2jdx/nfNhYlE+bcuS4uhM355VWiZdVawHHvzN/nu+B7ACCCGSWxY02vasgdwxZG1+lZyT+RTXXLsTwrd55ieg9uco5BEoAs0vYyBcPxvpHoi8WpoGdHO53XypQLeMZVZDJhAxRrQLwAFTwTxGQENIar8qDzALaVrycEVabnzuQm0fXaJVlOgbF/PxSVOmqgVAZEgRhzye2sOfyyznPs5VjrfBWG1a1ZNmh1K3hyThkNPnWBvFuLqMzQlyXqA8ucEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 09:22:48 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Fri, 18 Jul 2025
 09:22:48 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for
 Tegra20/Tegra30
Date: Fri, 18 Jul 2025 18:22:42 +0900
Message-ID: <26197475.6Emhk5qWAg@senjougahara>
In-Reply-To: <CAPVz0n3W1yhrOsiYmYecxtPeYdZiK2_UY7vVc2tiYbYwfWPp7g@mail.gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <4191623.PYKUYFuaPT@senjougahara>
 <CAPVz0n3W1yhrOsiYmYecxtPeYdZiK2_UY7vVc2tiYbYwfWPp7g@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR06CA0214.apcprd06.prod.outlook.com
 (2603:1096:4:68::22) To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: e9dcca89-2f9d-4484-18da-08ddc5dca991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjVIQUtlNDNPVTg1RUNkc0lrcTk4WVJrdmhoK3BRdDBBeG5XSXNzT1V5SlJx?=
 =?utf-8?B?OW81aTJCN2tXbW5uMWI5UjBSSmpMMm1KUjAwdEJYQ0ozNzJUNkRGTzd2K0ZI?=
 =?utf-8?B?NlQxWnhGeGMvWFI0cE45OEVySUtsRXRQWUN5Nk9tRXZLbnB5QkNFU2hzcmVa?=
 =?utf-8?B?ZzNLTzRCaWZ3d0hpYjB3R29kcURvbDkrWTN1S0Q2U1FFUTAwdVJ3OGtpdnYw?=
 =?utf-8?B?Umswc1RvT0VSczNjUXpGejhJTDd1QjUwMk5CZkpqQ3ZJSTdzSUlFZk5vcVNB?=
 =?utf-8?B?cVpNUWE4ZFBUdmVTSjA5VG42N2gxV2w3VEcxU01QS0xMMDNnT1g4VWNNUVBa?=
 =?utf-8?B?L2I0SjFsSTVQN3RQcUN4djhadXJjYlFJdEpMdGo2RE0xd1dUcGFweTZ4QW93?=
 =?utf-8?B?MCtadzJlMnJ2RzJiT0hBWWV3QlhiVkQxT2l5M0xjSDVjL2sxcmJZbTBlbHZ1?=
 =?utf-8?B?UDZvV1o0YWZKbGFqVnpUS0hLVjgwQXdTcHdJcE91anVkTm9aL1F6RGdkcm1P?=
 =?utf-8?B?UXNOTGJUWThUdUxYaTcvdHI5MnZMcnpNV1JLdnF2TklBVXUxUVNuUE5pM3BX?=
 =?utf-8?B?N0VPMHpKWlN3dGptcms4MVhFY2l5Zk9aV3Y2bDJ3ZWxmcldsZVpmQlkzOHJn?=
 =?utf-8?B?NGNFbWRJK2s4eTAyVlc0dG9wMExncCtsNGtTWERzcEdQd1RYaUNxaWhmdHla?=
 =?utf-8?B?M3BwKzNwL3BGWjczbi9rMlJqQnRXdG03V0xTcTVZU2Y2SUExOHE2TUp2ck9a?=
 =?utf-8?B?Rm1PQXIxZzFQVVd3R1pVSkRLR1VDVzBTMHRMR3dsK2NVZkJDMzM5OWU2UitO?=
 =?utf-8?B?a2szSDBkZE5Dci9JaXlxQS8xWVE3Z3ZFT3RRT1NIa0xsQWowWWhQVlRhVUph?=
 =?utf-8?B?Z1gxcDM1Ymd5VCtBT0x4TEZEMWRXSW8vQ1JxaXN3eXozODgyenNpcm42OGIw?=
 =?utf-8?B?TjRScDE0RmM4OVRtaFhOUHN1OUV4REhXZjdtMWxaR0JSem0rUjZxVytrV05z?=
 =?utf-8?B?NHNoMzZTOStBL2dWcFY4SFgxWVJOUkJ2QS9yZ1I3TEMzbGtYVWxQSVR3TmEx?=
 =?utf-8?B?dW5CWDFIM0V4TndVU3ZWTy8vVnBwOTBGQWhUT2JXWTdXeTZya1FrWVdKTHIy?=
 =?utf-8?B?S25pYnlZYks3Q0diZ0ZGL0ZVS0dtbTFVOUhKYm9uaXFsWWorYmZ4d1BYaHVp?=
 =?utf-8?B?QUtTM3Q4UkJvZnRCaEd6V2VLbmswM25oNlo1dHJObUliYkxwR1hwSWR6UG0r?=
 =?utf-8?B?M2VZVnRaN3ZQTnJ3WEVham52VDFoeGNpalRwUWJlbkU3dFRPdDZJT0lGZEZ5?=
 =?utf-8?B?Skxsc1lqTUsrSXVCWitYRW5PSGJUdHFsVVp6eHFSTWNENlhkWGZqaEQ1NU9P?=
 =?utf-8?B?cEVDTjNVQlBXckJtbWRqVmFYVnR1TExtbXRaQ2pmSEdSc0pvQ3ZxY1JKUXVD?=
 =?utf-8?B?VGRQRmdndTl4TEhoRTdqUGV1eXFmRDhRN2FKQ2dxTGpNMWRFQkswWEQ5QWtn?=
 =?utf-8?B?Ly9HdnYzckV5VnlLV1pKYXkzRHBJU1NxVDVrb1dCWUYvRFR5V2hBTGRrNm15?=
 =?utf-8?B?a3QrNnlYYUxEMFFQRjRQZE1MTDBLa0tLKzV4NHAwTDJWMFZJbkFPbGQzTzZz?=
 =?utf-8?B?cmd5MDFSeDVvbjlmRldTd1ZLa0ZEc0NxUnF0d0J4TVN2NzhOYk9kK0tPSmMw?=
 =?utf-8?B?c2lVRkpaOXI3V2VKKzR3QVJyUWNvN1NXWTFiQ2dkVkRGWHNFL055aGM4c2Fo?=
 =?utf-8?B?ZHdFSTluLzV2OGlBTTk4anVmQndKY0hHTFZtWFB4cHhuNUZHcHB2VjJVQlJV?=
 =?utf-8?B?YU9MbkpIaFBVTExCQ0lUM2pZTE9Rb2IwR1RINm1qcVBvK3ptZmk0aCt1dWZW?=
 =?utf-8?B?eExuWHZmMkx0ZzFkc1k5Ym4wNmdDWHdGOTlJaEc0K2tHMEVoY2xaOVZDb2NI?=
 =?utf-8?Q?tmolHESSCAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGlHOHdLMmUwZUxxRk1rL3JYNHJ6WmlPb3h4ZWErWFlUcS9ZRjkrdTIxWHBx?=
 =?utf-8?B?T1Q2TUJ4ZWg2OVRTNVJsTm1xb0tQRGFRQ0NaWmxNT1hnbXpQdENhQnVXUjFP?=
 =?utf-8?B?WklSTFdJVEVMbHdVbk9iZWNXTThZNUhrdnFMTVErSTQwa1U1UUZxQnJUSkxx?=
 =?utf-8?B?NWxrWmRoRDJ3QlJtYjM5QUJDcVN2OVFXTUpJU2x6SGVUTlFReXVQTndJRytl?=
 =?utf-8?B?NlUxVTNqcVViQlREM0VpMytMRGF6UGhZdnplU1NvcC8wQkxhSmlGdHNsdk01?=
 =?utf-8?B?dDZIY1c5VkVybjhsMXl3bTVUNFlzanFnT05WNGxSTmZaSEprbmJsZ0NBdExa?=
 =?utf-8?B?Z2I4ZTByWWJqR1huSGVxWldxOStNcDBuNEl0ejNXTksxek5PZTlWSXZSd1ZN?=
 =?utf-8?B?NE1VQmwzandWYUlxRkc3VXlZR3hISlNEcWMyN2NWZXp5aGM3S2h4d2l6TFRY?=
 =?utf-8?B?RDR6UnFtZjRyc3E1RWt6R09Ha3pvMFp6L2FMRC9kV1lTQ2xHTTZjTFVUM0FI?=
 =?utf-8?B?aDZZRVR0cGdJZjFLK0pnWXArYjVFNlZjWlZySkVSblp3Q1VmM1NGMXNWRHN6?=
 =?utf-8?B?alJneFJxT1BRN1c4WmlHbWdKS2lHL0ZvUEJKVTFwbEN0VEFSM3ZZdWtOVGlX?=
 =?utf-8?B?K0c0OUdzYXY5d2R3S2FncXpKNEh1L2F2UGxMSnl5cGlhMytxUjJvbm9aZWd5?=
 =?utf-8?B?dmF1SW1hTGN1UnBuRi9TN0pXTFJmbWhQTVZoaytVRHk0UCsvQVNsMUxKS2d3?=
 =?utf-8?B?Ny8vNFoxL3cwNzJyZjBzTUFjTk4xVEFHU1hXZndRdzBJNVV2dm12V1FaazFH?=
 =?utf-8?B?TjNaekVKd0F3UDZPUFNJMGFQWG1MWUVPc0xrQTB0MmttcXg1eDVoT3ZORzNo?=
 =?utf-8?B?ZGh5R1NWSDA3WHFzeEpIb2dVamtBT2ZxQldldEVSdEk1SEJpN1N1YklEU1lF?=
 =?utf-8?B?aEVUQ0prMUIxb1ZkbmNXeTR2Z0tFejJxdGlKdEtVZkxlbE84TGlKL3V0allX?=
 =?utf-8?B?UCtaNVkwa2dDaE1rMUpIbUZIdDVPb0I1MU9HTk9VbUt1bzdGV0VrWDkveWZQ?=
 =?utf-8?B?a2t6ZnNvaEtrVG84Z0RUWEQwUzlKT1MxQWp4VVRDYm5CQmlTeGZOUE1lR2wr?=
 =?utf-8?B?WmtmaUl3MGNjQ0plUldrUE5ZZjJaM2FKbzZ2ZUJ6MG9pUkxPbmVIZ29Lb0ht?=
 =?utf-8?B?VllrVTVndFh0MjI3UVQrT2JyQ1ZJSUtiRzJvUmEzM2hMOVBGS1l6cHpBZmgx?=
 =?utf-8?B?Zjlnc1dzclBKdXpRZUtMazFuaUdUbkY0Y0c3dnp1NzlWZUkyRUtQUHYrWGlM?=
 =?utf-8?B?cWZ5OG11em80YkxSOG1LQklVQTRjckpIVGZBYVNBd2k3V2txRUhKT210amRs?=
 =?utf-8?B?L2J2ajBhK1ZldFlpZk5pQVJjc0lTUHk5MzdQUDNDYzJZZm03TitqdExaY09y?=
 =?utf-8?B?bVNSV04rRkJsVE5CZjcyaU0rVlNmNnU1TDRPTXIxYy9yRkNhZ3BPM2cvV05K?=
 =?utf-8?B?N0hPTFhvdG1UbEVkSzZaRzBlZ1gyZzN2RXN1c1cyVXdtZ0t1a25VVmJCcHQw?=
 =?utf-8?B?UWcrZXJGNjJUVmozSjE2Nkg0UjlEa1BCWFBWZ0o0RVZzeUx6dm5KUWwvemNF?=
 =?utf-8?B?dWFkV0ViR3FXTkJrcGJBdzhLZ2lsTGNoaUx1N1A1S0ZtLzZhUlBFcndvdWdV?=
 =?utf-8?B?bjdDa3VaL0M0bE5YMkt0MU1OR3ZIeU04UTRhYjRobFkxdnJNcVNQa1ljc0lG?=
 =?utf-8?B?WEJyTHh0N1RScnFBNGpkdkZYQk1Rc0ZYa3pkaUtrWkRNWkYrQmxRc0puZnFK?=
 =?utf-8?B?K1dyUllFV0RyR29lUVAxVExxbUU2L3psaG1EOGowZitmSUdId0YrOFB5Y1Nj?=
 =?utf-8?B?Z1BCRS9IT3huQmJheHJHd3hKb0RNVjVSWVhSK0t1OUcwMDFPTmNuTjgzd1kr?=
 =?utf-8?B?OFM2WkFmTTluNzJTQ29BZVBmbTNYbGF5aEpGcEcwWDFZSmhWZ3pzOXUvQXFB?=
 =?utf-8?B?SldmVmFFR0FqeC9Tb0oyb2dLVXJLdEJkQVNjQWRSRUZNYis1aWhkV29RcUJq?=
 =?utf-8?B?V3FxZmU3OUZwQ0c1MC9lWEFKeG9ZNkR1a1Z1Uk9vSmZXVnRTQWIvdnRTV2lj?=
 =?utf-8?B?RGFMMjVWc3ZTcStNbElrQjBINE4yNkNhQkxXa01SL01NQ24yYVNlNlZTdEZH?=
 =?utf-8?B?ZXJxRXoxdHg0Qmo0Z0RiY0JRdUJCK2NuU0ZjQ21iY0Qrb0xoMzBNMG1rejIy?=
 =?utf-8?B?eWVXa0krSjRsVGF6b2hTb09LYnZ3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9dcca89-2f9d-4484-18da-08ddc5dca991
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:22:48.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DoNE0mT9HpEl2/Z3dD3Ar3FDIm/2jyH0n1p/5DdU7ZW+yvWzS49IFsK7vSB4B+Ls4HzAhU1sroWd8N7IXsjLQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
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

On Friday, July 18, 2025 6:15=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:01 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Add MIPI calibration device node for Tegra20 and Tegra30.
> > >=20
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >=20
> > >  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
> > >  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
> > >  2 files changed, 32 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > b/arch/arm/boot/dts/nvidia/tegra20.dtsi index 92d422f83ea4..521261045=
cc8
> > > 100644
> > > --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > @@ -74,6 +74,16 @@ vi@54080000 {
> > >=20
> > >                       status =3D "disabled";
> > >              =20
> > >               };
> > >=20
> > > +             /* DSI MIPI calibration logic is a part of VI/CSI */
> > > +             mipi: mipi@54080220 {
> > > +                     compatible =3D "nvidia,tegra20-mipi";
> > > +                     reg =3D <0x54080220 0x100>;
> > > +                     clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> > > +                              <&tegra_car TEGRA20_CLK_CSI>;
> > > +                     clock-names =3D "vi", "csi";
> > > +                     #nvidia,mipi-calibrate-cells =3D <1>;
> > > +             };
> > > +
> >=20
> > As you say in the comment, MIPI calibration on Tegra20/30 is part of
> > VI/CSI. We can't add a "mipi" device here since such a device doesn't
> > exist in the hardware hierarchy. We already have the VI device in the
> > device tree, so we need to use that.
>=20
> I understand your point, but embedding MIPI calibration logic into
> VI/CSI driver will bring up another lever of unnecessary complexity
> and excessive coding. While approach I have proposed preserves
> separation between CSI and DSI and reuses already existing MIPI
> calibration framework.

We can consider different driver architectures to simplify things, but the=
=20
device tree has to conform to hardware. The host1x bus has no 'mipi' device=
 on=20
it so we can't put one in the device tree.

>=20
> > A driver for tegra20-vi already exists in
> > staging/drivers/media/tegra-video. We should aim not to break it. Perha=
ps
> > bring it out of staging? (At least partially, but then why not the whol=
e
> > thing.)
>=20
> It does not break VI/CSI, I have a WIP CSI implementation for
> Tegra20/Tegra30 which I hope to submit soon.

We have to use the tegra20-vi node as that matches hardware, and each node =
can=20
only be probed to one device, hence the issue.

Great to see a CSI driver!

Mikko

>=20
> > Thanks,
> > Mikko




