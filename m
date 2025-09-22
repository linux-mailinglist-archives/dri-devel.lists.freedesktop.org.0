Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9773DB8F1FD
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D1B10E3BB;
	Mon, 22 Sep 2025 06:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fdq31dF3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FDC10E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 06:24:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2LAHG+cFa9K1lHYcOHs6/OX2WTJZm2z7mYJcyOtNvYGzr/6Hsn5CbKEwSHRwh1N32y5KkATMsuy7TEpgBUpgJF78uowyuCPRdqaiaMDkfNgPPdLC9Z6JlsKHu7xDZGegu9pVhb7zfhmoGnHu/JTx9uvSO7ntrBDFjJRSR0kPhTbBcV5mjU8OhXK7R0Y/8hhq26yZ8D873VsJPiczYdKNwbwOdXko2ZipgINeUD7U1LJ0Ve8b6CEjXgRP/iG9j7AwJ9g08sPvGQJobUPIDSIcOke0QnHYc3cbySfUt2k4pXHxobbjjvHaYsi8y0zB6kSF2uTxVylZQxgbehADF8g+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bg+2vwqo696TUPQHOUVyrcU6E+9SikgKZtT3GZxAohk=;
 b=CFkkosj2ZWvBKi2tT2dzmbbBIm+/uDeq5VYJRLB+o3uRMn6vfKr9eG4B84l5y9cCdPClGpqAfHhCITLPlm7ikHpdPByGKhgoblj6R3USdTK48NWvjV9Lxtbw6gOFor9cDjsPSEK4O2Zvml4J6aggB07dlPSdXTVaT3NKcoYsEV0/1PPO5/91qdQaVC6qYLVk4eCF3rLyjToTzvP8QEh/nixauE0FV+4NGqkMb/YVtf8+cFFSPQvLK66vxomCfzZflAqep4LJu6g/YxC+Hx20jCBgcIpg8zSMqiQJkUTPuIxt3+7jrZ/CG+wuUPVL/3HTtmuL9hvx7Ie0zuFD2E9Zfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bg+2vwqo696TUPQHOUVyrcU6E+9SikgKZtT3GZxAohk=;
 b=fdq31dF3cuV62eafHUPth6JtzoCYT6DdHKdE+m1hxOfMl4Kj4niR+R71IM+d/nw4DbM6f+0jhwSNuI/MSrdEjFox+POHYqVJU3nIA10tGYb/Ir4/tkFuLMjs1B8wm000+VuquVyE6tGaWMFW+mF3SPc8/ni2NBKQ+RUAVtTmHJn6/zGiEhvnV9rzpS/Tj22+nOkUlL/gN37JBN50XewP0+KSo6uSMHl+RMOuzUGEuXqRxkLGu2EZeNdTGU5uMkY5lywRVxazZqogp6/QfdMhLo0UgqLOgKyex60l2vPklvnr8alvhWcFEbrbbC5N+3R5Ulgny1fH1B9WiG4jneLt/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DM4PR12MB6086.namprd12.prod.outlook.com (2603:10b6:8:b2::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Mon, 22 Sep 2025 06:24:07 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:24:07 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Mon, 22 Sep 2025 15:23:58 +0900
Message-ID: <39551204.XM6RcZxFsP@senjougahara>
In-Reply-To: <CAPVz0n2AjRPMuZbLAnc=9TriPHDLOFok+Qz3zoSpQSKX1R=cqg@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <2331830.3VsfAaAtOV@senjougahara>
 <CAPVz0n2AjRPMuZbLAnc=9TriPHDLOFok+Qz3zoSpQSKX1R=cqg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DM4PR12MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7cbd18-bb13-42dd-d858-08ddf9a0a2b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVFvbm9YWHZQNk1RQkVwMTJxeGgzdTdqcUVyUWswa29NRzVFNzRhVWJQeTJN?=
 =?utf-8?B?VXVHcFVRb01GZHRmVmlSbUlvNUNubWdlQ0pxYmxIdnJJbmxOa2QwdmkvRDAw?=
 =?utf-8?B?NDRoQmZQQXB4OUptR1pOMlJrbEwySTlBY3pvdHNlbGtQUGxvTUJ4bXJOTTVM?=
 =?utf-8?B?b24wbTdhTUN0S1NZR0picmQ4aWFlUzRlZmZWcmxXRXhCSVRYZzdiZXNQQ0o3?=
 =?utf-8?B?dnQ2eGo0SmtXZld6WHp1aTRoK21UTk9vTGNFeUppaE1HY0l2OWhKTVlid2ph?=
 =?utf-8?B?cklJZ29LS05UeVE2WmlLbExvL0pBamQ1THE3aGlCTVRmRFNBOFZFanlFNFBO?=
 =?utf-8?B?bmp0NzZ6ZDYxVDFWL2pRTmN2dWxKMjUzNk9VOE9wRTN6Z3ZSZU9PZ0NrQmZC?=
 =?utf-8?B?MmxtbCtMTEp6OUJHM0hrZVFFODJ1aFovWVlKWDZtN1loNG5jSnVKOVEzUFg3?=
 =?utf-8?B?WklQYTkzUVlOOC90Mkg5T1k4SnBmMGRBeUVOek0yVVBQQmxaWkNGQk9Zb0g3?=
 =?utf-8?B?d0FRcWlDUjgxcXpKYlNDdEhXSFhqYnlaUTRLMGI0Wnh5M3F0RENLWS9nZU1E?=
 =?utf-8?B?VXRDREdZbXFCL0ZuRDdrb3BLV0c4aGVVZ1JGbjVFL09kd1F0NUQ2Z1I5ZHpC?=
 =?utf-8?B?ZXNlOHhUVWpjbVpkRTJRNjdUcmp3d1Rnekg2cDRjTVBLcXFTUWE0Z25XMEtH?=
 =?utf-8?B?QjdXK3lIdElDRkJpYytBRHVYUFRjQ3FsajVrZ1psaUJsTkMvanFFM0o1eGFu?=
 =?utf-8?B?VW41amJmL3VMaUZXUjA4ajdMa0NIdVRpK25aekEzVlRGcitjT2ppaVZoREtU?=
 =?utf-8?B?MjczK013MUU1WTNYUkpvMm5OVWJUQ2FvZHFldVZ3OVl6V0xWdVNqTXRKZTFE?=
 =?utf-8?B?d25qOTBPS2dzci8wYlVueC9mM0tpNHJsczN3US9RNkU4cUQ2WWdjQmZwMGYz?=
 =?utf-8?B?dFNFMlRoYWlTendmNGxYcGt1bjlDNTc3b1VhWFpSMXRzOUFyVzdocXlnYXYr?=
 =?utf-8?B?N1pQU1M3TU9lc2hzWG5ZNmhFU0JBdEtkM3hNSVkzeWxqTU5VTXhUNmR4S1du?=
 =?utf-8?B?OS90Vi9wdUJhcjd3MnBaQ1BkVEZXV1hOMHdzeXRsN2QweWpUUXEzVGxTN2VK?=
 =?utf-8?B?cVA5YUNiOE92NU8vRysrQlN6bzhHc1orWDB6RDNoWExKZUpmQnlYT1c0bk1n?=
 =?utf-8?B?em1jZ3ZxSExra1Fxb3FreDAvZmQ3MWVnQmI1ZEVBQm52SjNuS215RUdQSEdp?=
 =?utf-8?B?WFZZUWJnK08vNXlYRTVDejdZVjVCVW9zMXl0VmZUa0kzdGw4ZXBIekRFaHA1?=
 =?utf-8?B?aDhzbVM5Z1BzcEJ2QnFJRGx0UVI3cWdmNTdjdERib1pVc0NxN2c5dzdtUW5Q?=
 =?utf-8?B?UmgxeEtUZ1NWZUNtbmtRMTdHL25jbzU5TFg3alE3Q1BTbDRPdGkxY1Zra0VZ?=
 =?utf-8?B?c1FlNHNUUmo2TU1aV0U0T2VMQnFuRU4xWHpudTFpdGJWSGtJcG1Fakl6aUJa?=
 =?utf-8?B?emloaGFqdERja0YwamxMVHZoUmFSQ2FWb0d6VFZnMlFYVUhTSy8ySENBaExm?=
 =?utf-8?B?V1JPOXJZOFArbUNxRnJEYVVvV1B0cEg3Wm5FaldyTUxxUjdwNXo3OWNZSDFT?=
 =?utf-8?B?ZnNheUdXS0dicURrNllFbW1RQUhOa2xoTEFYNFphVUN3OThoVjJXVXJ1UVgx?=
 =?utf-8?B?Z2hYWG9wS1RONTAzMG1kOXY3UEx5REZTdHVXNm9pOWFqWXRwM2VtNTNDTVc3?=
 =?utf-8?B?WmFmck54KzI4T1haWm9oNE52S2JOTVpyUVNMQVNQKzFUb2lia1hsT2M2WGpN?=
 =?utf-8?B?aHRwSVNLZkZ6SWM3OC9wS2lhb3VyNUV6NnptblZmWnBxYWFoaythbWd2NDJT?=
 =?utf-8?B?dk9qdExYcS8xU3NPeEpOeG5JR2luNFZmVW1iMUZCbEZWeFVNb1RDKy9oQjRY?=
 =?utf-8?Q?KiS4AlmLzuQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUlsTEJXZHBUSzBMcU5McFhLNDNYYUdEZHdhTjV6TjN3K1FicHVPa1ZxWHlK?=
 =?utf-8?B?dDJWblRJdjhwbmttMnd0SEtUc2FyV1djK2FyZWRsa3pxUW12YVpxemRtWlJr?=
 =?utf-8?B?bzdKa2g4dFVSN1M3dWVOdnBwUmNNMk40Y21FTzlENFdublkvZlloZko0TkRQ?=
 =?utf-8?B?eCtlK1NCK3pEd2ROeE5SbTJnaUhGRFNveHdFZEtOZlp4NnVFVWhvcis4WU1a?=
 =?utf-8?B?aElkN2hQeUR4MUJPbDVpcy9POUVQUyt6ODRLT3hlK1NCb2FNdE1JdjBqR3lJ?=
 =?utf-8?B?ZkM0K2o3cWRCamx6c1NFdHdIRjVaTWZabzAvMUNkMGVBZ2lYd01hL3NhL0tl?=
 =?utf-8?B?T2N2d0JKZGtyYkFOUEtOMGVpUkxia3NQVG9YUUJxbkFGUFdKNkxwUzBUNW44?=
 =?utf-8?B?aFltTk9UUXpXUXgxWU1LamVaZjdZaERma1ExUjhIRERsM1lRK1JmWDFoMk5Q?=
 =?utf-8?B?ZW9jNlIzbXlydUhnL2dFNFVyenJpUWRES05oaDB5RnYvZVJOVGd4ZmVzR2N4?=
 =?utf-8?B?ZGVGVVk4eURLZFFua1JYb2lLNm5nVFYyc0FTWTlRL0N6TWN5eExXcUErVUMy?=
 =?utf-8?B?dGdOcnhzNHlzNlBJcFlwZVVZN1BqNWNhUnlyTlVpcDlyM3VoZ25SaXllcjFx?=
 =?utf-8?B?WnlsRTdralFYNE9JMTdnTEZjRFlsVWpWT0xtM3Ivb3JMazcyblloUFlTYkpO?=
 =?utf-8?B?WUtJMWxaV1FEU1RieFpMaGdNUXZzZWdzTEJPcjR2OFZBV010bFZwR01ucnBH?=
 =?utf-8?B?Q3NHQUp4MWlGSDhibk8rczIzZzA4UGtzempJMEVJWWFPdmZPQzFXOVJVUlV3?=
 =?utf-8?B?WC9UTkM5bEt1OUZsZ1QzS1hqWWMwMy9JeGVwRWE2L25YSDhlOXJsb01IK3pu?=
 =?utf-8?B?S3VxVXlHejh3ZllEalp4YTB5OXNHd0YrWFBrMVByN1U3TjN6dGptSkk3UHpB?=
 =?utf-8?B?cFdTWU03cmtXV0gvSEhWZHNTbXc1NXFWdU9ZVzFIZXhGTjhPUnNJWlNMSkxT?=
 =?utf-8?B?b1AxRzNJc2l3MVNBNCt3WkhFZk1VbCt5SENtdEFVYU81R1JqWmZINE5GL0dE?=
 =?utf-8?B?TDRtRWJ3RGI3STU3L2xCNFRkUmYwcTdLMWtwT21vTTFVdXZlNUgvT1g5VlY4?=
 =?utf-8?B?VENtbUxvQW1qL2M4eGFaQ1BNc05LTGNmSXNwNElGUUtjMDVFdWVKOUYrK1JQ?=
 =?utf-8?B?Zm5oL3RYSGo1VTFTSHRXUENOY0M0RzIvNGkxTldYaE9pcHlFSytZNUVHUzBI?=
 =?utf-8?B?SzFvaFM5SldaQXNRSUEzMDlxcFFFZEd5ODlXQkVzbkplTE95K01SdlEzRmp4?=
 =?utf-8?B?VFRTaXAwcGhDWnR2ZXpxL0dZek5zTmRFeVdFbnZuVjQxSEpldDlMWlAzYkxa?=
 =?utf-8?B?SFJ3MXlYR2twbTF5VGY0WVVYMnFQUjhQVm5FNGduc3hGVW94YWZYUzFNdXQv?=
 =?utf-8?B?MlVjS05tL1FQREZyTXlKdGhyWDJCelVrWEUrTUptRDVrN1FPUjhGZkJFWEgv?=
 =?utf-8?B?MEdBaE9XajBodTZXOUtLTEdLa3NiSXB0dHNaOXA1UjYwODVPc3NyVHFtTHQw?=
 =?utf-8?B?aTRsYmVaZFJPY29pWkhlK0UrT1MwK3hoTmVoSTdWMVROODlpdEhiRlZSWjhG?=
 =?utf-8?B?dkFmeWY5L3VVbSthMm5GMHJhVXFvVzI4eFhjQjlrVUtFa1NaL29MUDluUmdW?=
 =?utf-8?B?Qy9wd2h5dnl4c1F5QU54V0s5cERGeDFNd3REMFBGV1lOaW5SNlJYbDJhNTZi?=
 =?utf-8?B?YndEbHBCY25BempJTmg5NUxWNDkzWDJBbFBtVStvUTBFNm0zWEVmZUFQUU1a?=
 =?utf-8?B?bGxRUnNXaUlFQ3FnM1BiS1k5Q0luWVl0OEtwQWJUWWpDbGRtdCt4eEVxbVBi?=
 =?utf-8?B?QVBDU3JaRVVkQkMzdys0YlI5emhqK0laNEZZc2hYZENHYnlsb2M4NEJwYlhY?=
 =?utf-8?B?djh4ZjUrQUsxR0xmRm51Qkc4MEppT21hLy9xZFJsS0FnSHdlN1NNMXg0UnlW?=
 =?utf-8?B?QWVpQnNzRkdyL1ZpREc1Nkk4UmRGa0dJSWc3LzdDZlRHTmdIWXNlMVJBSXp1?=
 =?utf-8?B?OVViblE2ZGtpeHJ2Mnc5MU5SRkUvNHl6S1ZqTzFqVUtKWEZIQzl6K21Za0V5?=
 =?utf-8?B?TitPUHBZWjVibzlvcmdKdDdrRmxuZGc1WjBTeFJzY2ZVQ2pIaUwzclFqRyta?=
 =?utf-8?B?clkxcFc0SlNOVXRIOGUzNHVWQ2RLUVJZcHJtem1lRm5KeHN3OU1ZWlpBd0dN?=
 =?utf-8?B?ZlZmczQ4dGR4YURSMHBQT2NmOVRBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7cbd18-bb13-42dd-d858-08ddf9a0a2b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:24:07.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWPrZDBkVDKwrIcLqr+08/laWjh2wyTnEMwzHEZZRjJgAGFjON1scgW3V1scqLkgUxqMJuqAgDBDOX7rqJfC/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6086
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

On Monday, September 22, 2025 1:58=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:54 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Increase maximum VI clock frequency to 450MHz to allow correct work w=
ith
> > > high resolution camera sensors.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/tegra20.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index e0da496bb50f..3c5bafebfcd8 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> > >       .ops =3D &tegra20_vi_ops,
> > >       .hw_revision =3D 1,
> > >       .vi_max_channels =3D 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
> > > -     .vi_max_clk_hz =3D 150000000,
> > > +     .vi_max_clk_hz =3D 450000000,
> > >       .has_h_v_flip =3D true,
> > >  };
> > >
> > >
> >
> > Where does the 450MHz come from? Instead of hardcoding this value for e=
ach SoC, could we just clk_set_rate(ULONG_MAX) like e.g. the vic driver doe=
s, or does that get a too high rate?
> >
>=20
> This values comes from downstream 3.1 tegra30 sources and setting it
> higher breaks VI, I have tried. If it is set lower (150MHz as it was)
> it breaks VI for cameras with resolution higher then 2MP
>=20
> >

Ok, very good.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



