Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1D4BD7710
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 07:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5600A10E1FB;
	Tue, 14 Oct 2025 05:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QpX6u9Ij";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC85A10E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:35:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHF5jOiDxqwMXTl+mzjL7rqe+AjP3dz8sWO0bOZGYhhvOlJf+qwVm9sii7VaDhjoQKpo7uVMaXBtafgL/qLgSHYBXn4hIh52ddSX1rpIoqJctW/fpLiKmQSUO/2YdWo4PzgAYr1GuhAzWNmnaTm/K4GIFLjbEoDpb1IA0EZf5gFGc4HN6JbKBjqP2DxN7Zu7kZv6bHyoA5QzHxck8qY1rLTa+VYBlFXtmCN2QVz0YOMU4JyDGqesgWAekiioCpAqz3tpRwgSY4iutroel56Y/z0BkCdRtqsFbb5gbYC5anrQrt0R0MrPLHIynQjep56WjXoRsNL8V2Q2VPGBxALEzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rMhVa56im73jjOEyThgXBULnBsWYGW3AleMBQbViiE=;
 b=ieUyXNcmQHQDN4wym95FJg0eI2UR6mXiWu3N0QIPUFbtivkGhCxePj004iJp2EQExlt9qFJJRz1HsGUNGgkoWXrVHpDMXlPgqnUx4YRSgGK3HRC0fiUS+xmq80MHSsVzihZKfc/vG2fiwPZkPr8slI7iUANWapMP6XiC0cvpv507hVKb2xnA01ddN+2cjq7iv1WVplEqQgtcBtBs4UQss1uMA7Yh65/MHoF60PAAUdZzZvma5bRo6eJrqqwDoSHV27YFkpqUb4gkb/opDE+GJKRoKXSvtO9P+hEFgX2jOsjli013kEdZaeGzgoqm4Cfwg8No828bAS0Xt8nrV9cF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rMhVa56im73jjOEyThgXBULnBsWYGW3AleMBQbViiE=;
 b=QpX6u9IjrGmJSIv0yibJ0rwvxeqlX3l6xr8IDD41tduZAYMgElMQVk63ORFA1P1E65FJmeIkr0JHDZoMi4dDePLD+eewIZs3qDqmNR2bGUaLh14Z2GXM2nhejJNaTyesnaFqUpo2La0lyhsPgiyZREydNXfT0m92Q0JJ5FoShwPnaizL7mBYmnT0zL4Eiz8AyqjmvFS+lNX76DArTdeM1Sl148cF9vzPq/qnrLPn3mAxTWV8l8libWAvihJtVKu1qWB3kI+SGbtUbOdRfj+8au5r0B9h3CqCtElNJn2rMRKUvNFnHjcJ1SrMLu0T9Iso4KRwTqckvu8YdXYC1xQlUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH7PR12MB5901.namprd12.prod.outlook.com (2603:10b6:510:1d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 05:35:51 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 05:35:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 10/24] gpu: host1x: convert MIPI to use operation
 function pointers
Date: Tue, 14 Oct 2025 14:35:45 +0900
Message-ID: <12287833.MucGe3eQFb@senjougahara>
In-Reply-To: <20251008073046.23231-11-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-11-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH7PR12MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: 46c3d770-5392-4519-c2c6-08de0ae388e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlRQdGd5dVppN0VZY0M4bmpVam05TWtaS2F5RFpQdUEwUHRyUWFoMzh4aC91?=
 =?utf-8?B?ZHhYSFFoWkNoaUl1VWQyWndKcjN2V2tscENhb2tyT2F6V2VYeXFQVkw3V3pW?=
 =?utf-8?B?UVRweW9xMUNoVU5TSEZCREp6MEdsNGpHQzZHZGlFek1uZjdjaUcxTTdZOE14?=
 =?utf-8?B?VkNRNHh2QWk5NWpaQjY0TGdWeFdIZUV0WTgyZ3JtWUVkNUlHSXlGbEloUCs5?=
 =?utf-8?B?UVFWNGdlSENUUjlmYzd2eGNnaVk0ZlNFdWloL1oyN0tzSWxMV2lFMkFhY0Za?=
 =?utf-8?B?Q1dYZTd6d0VkMnp2ajV1OWUxUndIQkY3ZFJIZUpqZWZsbWR3TWRNeFVmZHRU?=
 =?utf-8?B?MC95WXlDVmZNV1NyNm1XLzdyZ1Z3M1lkeUlPYm9jOEZnSXplbmU0T01pcU9l?=
 =?utf-8?B?U0p5M0M2WjhES2FoN095clVEN0pwOUhlSkhHZDNheXhINjhxWDBTK3FYaDBQ?=
 =?utf-8?B?NGtEY3ZhaEx5d29mSXArWlZDL1NteFJyRUsvWkF5VmNKaW1UNm9QSVJJTTRT?=
 =?utf-8?B?allFSzZzMXE0ajhBSjh2ZVZ4ZU94SzBYNnVzMkViT1pjVXJPM0MzOFhkMmg0?=
 =?utf-8?B?cisyUjZqci9SWkJiM0dWemg4OU91V25rZnBwaENXWWNYazBEZ05sdkIzaFpQ?=
 =?utf-8?B?Kyt1dFo4STUyUkY2b3NHZ2VBRGRHRzBLSFFKZFJKQjRqbTdEaWRxQjd6KzlT?=
 =?utf-8?B?TVJmV28waDNMV1JKS3dxaXREUEZvNGwrNjQ5SkR5UXNXc05iQVZqYWZMZHhP?=
 =?utf-8?B?WnVDdjJXdVRId1QvOEFOR2kydVpYTGhKRHZmRGp3RS95ZTJuNW44VUluZk13?=
 =?utf-8?B?ODRpeWNjazZjMk8xb1hPRklQQXRyZzBNVnJtVmZKcHJlUmhEd1hBRC8xNjZq?=
 =?utf-8?B?dFhSUG9XamsvRUZUVzNJcUF1RnB4UW5UZUd5bnQ2SXZub0VaZmxhaWp0Rmw0?=
 =?utf-8?B?UXhGU1JMS1JGNVFpS2RQaXhTZ3BTS2JXWC95NGtlQmZmTFNtaUIzRC8yQnla?=
 =?utf-8?B?dVpmaXhKd1h1djVUUUNkSTdpN3VkQnluSXVHYk5MR05kVWRCTFVPaUFRQjA2?=
 =?utf-8?B?NzYyczh4ckZ5MlQ1OU95a1o0MWpITEptUWdYRWFIOTk4WHNSMnU2NXozZGc2?=
 =?utf-8?B?VmRpWnJWU05EQUNvYy9hUTRNSXh4aU9CRXBNeVZaZFNXamhJVmUwblAvWXNr?=
 =?utf-8?B?TStUL0U1VkFoS0xLTk1GRWpGWkhrekJ5QWpuZStXdDZGWTFFMElaVGJQY2E4?=
 =?utf-8?B?WnZXcXR0NUpvT0J3bnlsZlphMkdUV1ZFMkVka09oazVCOWFSM1BwTTBDNmZh?=
 =?utf-8?B?MndzNGNKRE5McFVadHl3c2lIV1lqYktPcXRwWW5saXVyZ2ZJa1B6UXhXSk5h?=
 =?utf-8?B?K3ZtUkg2VnZjSEdORkkwenUwdWEyUFRsczd2N3dYNTBWeU5paDhncS80OUFE?=
 =?utf-8?B?MHlXdThzNE4xSGNNSFpoZFFvUXF6YUQ2V3FMM0hueHVGV1h4THpoUTk3Z2tS?=
 =?utf-8?B?Qk5WR0FEMU5DVFBtN1hSSys3RXpBd2FaQVY5Y0wvQzhraHIzQmFRK3psdlo2?=
 =?utf-8?B?SkFXajB4cklVbzRLT2lyYkNtZlZ4MitPUzFzdjhrTFJTYWRBSXVxV0pOUSt1?=
 =?utf-8?B?SjJ1ODVPSEViKzJhZGNEaVZDSVJlZkhMZ2Y2WEg3Y0tMTzVKa3RLODdOand6?=
 =?utf-8?B?OEtmK3UzeVl0SDNLZDhya1RxMm5KVTdpWXNncmtUVmY2d1BIbjRFZitsaXVP?=
 =?utf-8?B?aUtyR1U2R21TamlKMWJIalMvSnhFZXBjNUVDNUZxQkNDcmZkd1prb3RobENo?=
 =?utf-8?B?YlY3eFhFTkV1WFNkZitSbjlWVHZmc2d5T0NwSkNWK2dnOWhTMldCVm0rZ2dU?=
 =?utf-8?B?NndXRTBwYmZiV0Zlc3F1ZnNyRmxFcWVyVjdqdGJKemZPNlpyNklydzhqY2xa?=
 =?utf-8?B?TTVuTVdtQnRaY0tDY3BmaFdGekhEOENSS1U1VW90RHRWVk5EbTZWd2FUQmFz?=
 =?utf-8?Q?mosR4Rs/6pwh88LAMDMZmbfleAzl7s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzl3SE5DNml3Y3c3ZUZmQkFYOG1SZDJJRUNqMFE3cHNuUnR6cDNxMnRRemtJ?=
 =?utf-8?B?d0FMNjFHT2dEZ0tYdHcvQzZVcHJsY1hOYXQxbjYrNGtabWUzVnRBSThXQnZQ?=
 =?utf-8?B?dExNcHM5dVNIQmcxaUtiNjRpdy9yRjJlOWwzUGxaQ05rQVdTTFhQOFptTS9E?=
 =?utf-8?B?dzJIRDVQRzJpaTlFM0UycWFzeWVtUHlQZ3Fidkt5OHFXODFSdlNNQnNSTHg3?=
 =?utf-8?B?OHQzK1BNY1lwTURSTXk5a2FJQ1V3WktzM3p5U2dvbElONUEwU21TODZTSDZs?=
 =?utf-8?B?TncydmpaUFdMWTVlMUMvaUJncVdERXZPcE5tSzNaZWx2TGd5WGx3RlNhRCtk?=
 =?utf-8?B?YW44Smx3NmVZUU5SdzVaL2NhTGVMeG5tNVhsL3pjVlRtKzN1T2pORkpwZDd2?=
 =?utf-8?B?R3VzOFh6TmZjb3dVZUp5RWVCNGpVSSs0eE1tdW5OdEpyeUs3bFpsdzRWSTRo?=
 =?utf-8?B?aml3dVdEN0RtQ2RaNm1CcXoyZmlMRTlPSkxtelJaTktXcE5yalJuSUk5cG1x?=
 =?utf-8?B?K0kwanJ6b2dERFZuZVdETmJkSm1ISitFbldBSm1HdHIwRUJzNGwxUU9aSGIr?=
 =?utf-8?B?cHNCWVBPeWh5UTNxczdIallWSHFPMGNLek03WjJJM0RNZ1poMDg1RlB3SENi?=
 =?utf-8?B?UndJanAyV1d2L3kxY1BnK2lCWFNpMjZ4OFhoYW9TcDIzOG9sR05uK3BWbFJ4?=
 =?utf-8?B?a3NkbmQ4ZnFwblVESllja3U2NmVoNjdYZDZaa0oycXk5cWZQVEJmTlNwVXBl?=
 =?utf-8?B?bm44emxiVGtTcWdIWDBxOVV1Z1JZMWhrQnFOWTRHR3JVUGtRS1NpaVZpRkpB?=
 =?utf-8?B?TWYrRjZnckVaS1NtbU5qYU5BeEtocjc2QW11bGY5SUlPWmwyZUZxVEx3Q25C?=
 =?utf-8?B?SHRKcWVYVjVnY24rVG1PVlNBR3JIT3RvdEQrdUxzQ1U0L1UrVnNTUEJNVWlR?=
 =?utf-8?B?azN2UXJIdmtmQUw0ekRRSGlOK25JaldDNFR5cFNtaytxMVJHcTFKSmgwNnZi?=
 =?utf-8?B?S05xTElWN0JldmhoN2FBMEJnQnUzNXRwNGI3MDNVdTEzVzAycWtSYXZzTnNS?=
 =?utf-8?B?blFrcjZObXRzcjc1MHJwZkFUcmZLNVpGWHVtWXlFaEpQZmJ0b0ZhYkZnN250?=
 =?utf-8?B?eTRpQWRucVdWVzJ1ZW4yajgwUGwrNU1BeFppTk4zSGRlKzFibEZ4eTZaTGt4?=
 =?utf-8?B?VEQvSzRrSWJId2RoL2JCNWJ4KzlodWxRNUJWK1JvMy92ek9UK3p4ZW43MThI?=
 =?utf-8?B?UDNnUE40K2FEVXJwdjBTZFBZQXhrb05lMnhxbEU0d0lzeFFVQXFaeFZ5TEJW?=
 =?utf-8?B?RlZoSmp6SkJOYU8zeWRuUXplUkZtOHBPNCtpdEFQNjNzVVRlR0paMHdPdUJn?=
 =?utf-8?B?ZHNtaHNqNWZ1WlFMZngrSVhvb3RsQXJodjRrY1FDKzlUdVVBeWF5dWVrWUdv?=
 =?utf-8?B?Smh2ZWJmK1NMUHBRQzVXYmZENXhrNHFNeFRtTFU5djdyWTNzL0JVQm1LOGFB?=
 =?utf-8?B?WDU4WE01S3U4Vmswcy9rcVIvMFZZUUpHL1pJNVdacEZyeGIxYXVzTm5SS1px?=
 =?utf-8?B?MjFmZXFyRzRhdWZBTXdXTEExTUlPa3VTTlVUSzBTMTVjNU5BY3RXUjhHY09Y?=
 =?utf-8?B?Ykt6UTA4Z1drbGRNcjFRTzNhbFhhQWdHWUFFaU5oUmRIUllUMStkMUtFbGV1?=
 =?utf-8?B?U2pZelRib2JKTXY5dE5hNStKek5zMXZBWHRhMEtGajZEcjVrRDBQdnlGTUdH?=
 =?utf-8?B?ZmdpRk9RRDNSM1ZpTW9JMnVieCtXaDQrdTZLL1ZkREZsVXJGaytJdFBkUjVR?=
 =?utf-8?B?R3JscDFYdURBdmI3cHNsRVJwV2JKbEJEVThGYStDbnIrdkdtMHZMWjFvREVw?=
 =?utf-8?B?d0pYMjJBVSt1LzBZVE1oa1ZTdFdjb1Zwa3cwTXI1ZitybzBpZmhXc2hkLyto?=
 =?utf-8?B?cTl5aUY4VElyTXoyWWhRQkhrWmNqVHJKOTA3SzJoMStOODlZNk5JK25GMjBj?=
 =?utf-8?B?OXA0bVh1Nys2bUVPRmMxZUQxazNxVFNzSUJTK01rRXU1cUthcngrTHpOZFRk?=
 =?utf-8?B?Y2c2OFZmcGJ1Um01RHpMZE1kWnJWQUFEbUVPRzhuMmYvR1NPNVZENGdtMlZL?=
 =?utf-8?Q?9JCciSYGB6LeCVWc4itvO9ca5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c3d770-5392-4519-c2c6-08de0ae388e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 05:35:50.7772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ditvxiRait5Rtw9ckV0BP0yHEwCM7DqHyskqv/n1C7+mV8NuB857WBixupNwIglPXN5oGJ88byrMDq1BPy27jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5901
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

On Wednesday, October 8, 2025 4:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> Convert existing MIPI code to use operation function pointers, a necessar=
y
> step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> that is SoC-independent remains in mipi.c, while all SoC-specific code is
> moved to tegra114-mipi.c (The naming matches the first SoC generation wit=
h
> a dedicated calibration block). Shared structures and function calls are
> placed into tegra-mipi-cal.h.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c             |   1 +
>  drivers/gpu/host1x/Makefile             |   1 +
>  drivers/gpu/host1x/mipi.c               | 525 +++---------------------
>  drivers/gpu/host1x/tegra114-mipi.c      | 483 ++++++++++++++++++++++
>  drivers/staging/media/tegra-video/csi.c |   1 +
>  include/linux/host1x.h                  |  10 -
>  include/linux/tegra-mipi-cal.h          |  57 +++
>  7 files changed, 599 insertions(+), 479 deletions(-)
>  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
>  create mode 100644 include/linux/tegra-mipi-cal.h
>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index b2046f6ea515..502f0cd0ce53 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -14,6 +14,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
>  #include <video/mipi_display.h>
> =20
> diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> index ee5286ffe08d..fead483af0b4 100644
> --- a/drivers/gpu/host1x/Makefile
> +++ b/drivers/gpu/host1x/Makefile
> @@ -9,6 +9,7 @@ host1x-y =3D \
>  	job.o \
>  	debug.o \
>  	mipi.o \
> +	tegra114-mipi.o \
>  	fence.o \
>  	hw/host1x01.o \
>  	hw/host1x02.o \
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e51b43dd15a3..8d32072e2244 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -1,215 +1,65 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (C) 2013 NVIDIA Corporation
> - *
> - * Permission to use, copy, modify, distribute, and sell this software a=
nd its
> - * documentation for any purpose is hereby granted without fee, provided=
 that
> - * the above copyright notice appear in all copies and that both that co=
pyright
> - * notice and this permission notice appear in supporting documentation,=
 and
> - * that the name of the copyright holders not be used in advertising or
> - * publicity pertaining to distribution of the software without specific=
,
> - * written prior permission.  The copyright holders make no representati=
ons
> - * about the suitability of this software for any purpose.  It is provid=
ed "as
> - * is" without express or implied warranty.
> - *
> - * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOF=
TWARE,
> - * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN N=
O
> - * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT=
 OR
> - * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS O=
F USE,
> - * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHE=
R
> - * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERF=
ORMANCE
> - * OF THIS SOFTWARE.
> + * Copyright (C) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
>   */
> =20
>  #include <linux/clk.h>
> -#include <linux/host1x.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
> -#include "dev.h"
> +/* only need to support one provider */
> +static struct {
> +	struct device_node *np;
> +	const struct tegra_mipi_ops *ops;
> +} provider;
> =20
> -#define MIPI_CAL_CTRL			0x00
> -#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> -#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> -#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
> -#define MIPI_CAL_CTRL_START		(1 << 0)
> -
> -#define MIPI_CAL_AUTOCAL_CTRL		0x01
> -
> -#define MIPI_CAL_STATUS			0x02
> -#define MIPI_CAL_STATUS_DONE		(1 << 16)
> -#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
> -
> -#define MIPI_CAL_CONFIG_CSIA		0x05
> -#define MIPI_CAL_CONFIG_CSIB		0x06
> -#define MIPI_CAL_CONFIG_CSIC		0x07
> -#define MIPI_CAL_CONFIG_CSID		0x08
> -#define MIPI_CAL_CONFIG_CSIE		0x09
> -#define MIPI_CAL_CONFIG_CSIF		0x0a
> -#define MIPI_CAL_CONFIG_DSIA		0x0e
> -#define MIPI_CAL_CONFIG_DSIB		0x0f
> -#define MIPI_CAL_CONFIG_DSIC		0x10
> -#define MIPI_CAL_CONFIG_DSID		0x11
> -
> -#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> -#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> -#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> -#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> -#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> -#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> -#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> -
> -/* for data and clock lanes */
> -#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
> -
> -/* for data lanes */
> -#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> -#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> -#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> -
> -/* for clock lanes */
> -#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> -#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> -#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
> -#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> -#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> -#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> -
> -#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> -#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> -#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> -#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
> -
> -struct tegra_mipi_pad {
> -	unsigned long data;
> -	unsigned long clk;
> -};
> -
> -struct tegra_mipi_soc {
> -	bool has_clk_lane;
> -	const struct tegra_mipi_pad *pads;
> -	unsigned int num_pads;
> -
> -	bool clock_enable_override;
> -	bool needs_vclamp_ref;
> -
> -	/* bias pad configuration settings */
> -	u8 pad_drive_down_ref;
> -	u8 pad_drive_up_ref;
> -
> -	u8 pad_vclamp_level;
> -	u8 pad_vauxp_level;
> -
> -	/* calibration settings for data lanes */
> -	u8 hspdos;
> -	u8 hspuos;
> -	u8 termos;
> -
> -	/* calibration settings for clock lanes */
> -	u8 hsclkpdos;
> -	u8 hsclkpuos;
> -};
> -
> -struct tegra_mipi {
> -	const struct tegra_mipi_soc *soc;
> -	struct device *dev;
> -	void __iomem *regs;
> -	struct mutex lock;
> -	struct clk *clk;
> -
> -	unsigned long usage_count;
> -};
> -
> -struct tegra_mipi_device {
> -	struct platform_device *pdev;
> -	struct tegra_mipi *mipi;
> -	struct device *device;
> -	unsigned long pads;
> -};
> -
> -static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> -				   unsigned long offset)
> +int tegra_mipi_enable(struct tegra_mipi_device *device)
>  {
> -	return readl(mipi->regs + (offset << 2));
> -}
> +	if (device->ops->enable)
> +		return device->ops->enable(device);
> =20
> -static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
> -				     unsigned long offset)
> -{
> -	writel(value, mipi->regs + (offset << 2));
> +	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_enable);
> =20
> -static int tegra_mipi_power_up(struct tegra_mipi *mipi)
> +int tegra_mipi_disable(struct tegra_mipi_device *device)
>  {
> -	u32 value;
> -	int err;
> -
> -	err =3D clk_enable(mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> -
> -	if (mipi->soc->needs_vclamp_ref)
> -		value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> -
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> -
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	clk_disable(mipi->clk);
> +	if (device->ops->disable)
> +		return device->ops->disable(device);
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_disable);
> =20
> -static int tegra_mipi_power_down(struct tegra_mipi *mipi)
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
>  {
> -	u32 value;
> -	int err;
> +	if (device->ops->start_calibration)
> +		return device->ops->start_calibration(device);
> =20
> -	err =3D clk_enable(mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	/*
> -	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> -	 * supplies the DSI pads. This must be kept enabled until none of the
> -	 * DSI lanes are used anymore.
> -	 */
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value |=3D MIPI_CAL_BIAS_PAD_PDVREG;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	/*
> -	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> -	 * control a regulator that supplies current to the pre-driver logic.
> -	 * Powering down this regulator causes DSI to fail, so it must remain
> -	 * powered on until none of the DSI lanes are used anymore.
> -	 */
> -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> -
> -	if (mipi->soc->needs_vclamp_ref)
> -		value &=3D ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +	return 0;
> +}
> +EXPORT_SYMBOL(tegra_mipi_start_calibration);
> =20
> -	value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
> -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> +{
> +	if (device->ops->finish_calibration)
> +		return device->ops->finish_calibration(device);
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> =20
>  struct tegra_mipi_device *tegra_mipi_request(struct device *device,
>  					     struct device_node *np)
>  {
> -	struct tegra_mipi_device *dev;
> +	struct tegra_mipi_device *mipidev;
>  	struct of_phandle_args args;
>  	int err;
> =20
> @@ -219,321 +69,58 @@ struct tegra_mipi_device *tegra_mipi_request(struct=
 device *device,
>  	if (err < 0)
>  		return ERR_PTR(err);
> =20
> -	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> -	if (!dev) {
> +	if (provider.np !=3D args.np)
> +		return ERR_PTR(-ENODEV);
> +
> +	mipidev =3D kzalloc(sizeof(*mipidev), GFP_KERNEL);
> +	if (!mipidev) {
>  		err =3D -ENOMEM;
>  		goto out;
>  	}
> =20
> -	dev->pdev =3D of_find_device_by_node(args.np);
> -	if (!dev->pdev) {
> +	mipidev->pdev =3D of_find_device_by_node(args.np);
> +	if (!mipidev->pdev) {
>  		err =3D -ENODEV;
>  		goto free;
>  	}
> =20
> -	dev->mipi =3D platform_get_drvdata(dev->pdev);
> -	if (!dev->mipi) {
> -		err =3D -EPROBE_DEFER;
> -		goto put;
> -	}
> -
>  	of_node_put(args.np);
> =20
> -	dev->pads =3D args.args[0];
> -	dev->device =3D device;
> +	mipidev->ops =3D provider.ops;
> +	mipidev->pads =3D args.args[0];
> =20
> -	return dev;
> +	return mipidev;
> =20
> -put:
> -	platform_device_put(dev->pdev);
>  free:
> -	kfree(dev);
> +	kfree(mipidev);
>  out:
>  	of_node_put(args.np);
>  	return ERR_PTR(err);
>  }
>  EXPORT_SYMBOL(tegra_mipi_request);
> =20
> -void tegra_mipi_free(struct tegra_mipi_device *device)
> +void tegra_mipi_free(struct tegra_mipi_device *mipidev)
>  {
> -	platform_device_put(device->pdev);
> -	kfree(device);
> +	platform_device_put(mipidev->pdev);
> +	kfree(mipidev);
>  }
>  EXPORT_SYMBOL(tegra_mipi_free);
> =20
> -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> +static void tegra_mipi_remove_provider(void *data)
>  {
> -	int err =3D 0;
> -
> -	mutex_lock(&dev->mipi->lock);
> -
> -	if (dev->mipi->usage_count++ =3D=3D 0)
> -		err =3D tegra_mipi_power_up(dev->mipi);
> -
> -	mutex_unlock(&dev->mipi->lock);
> -
> -	return err;
> -
> +	provider.np =3D NULL;
> +	provider.ops =3D NULL;
>  }
> -EXPORT_SYMBOL(tegra_mipi_enable);
> =20
> -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> +int devm_tegra_mipi_add_provider(struct device *device, struct device_no=
de *np,
> +				 const struct tegra_mipi_ops *ops)
>  {
> -	int err =3D 0;
> -
> -	mutex_lock(&dev->mipi->lock);
> -
> -	if (--dev->mipi->usage_count =3D=3D 0)
> -		err =3D tegra_mipi_power_down(dev->mipi);
> +	if (provider.np)
> +		return -EBUSY;
> =20
> -	mutex_unlock(&dev->mipi->lock);
> +	provider.np =3D np;
> +	provider.ops =3D ops;
> =20
> -	return err;
> -
> -}
> -EXPORT_SYMBOL(tegra_mipi_disable);
> -
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> -{
> -	struct tegra_mipi *mipi =3D device->mipi;
> -	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> -	u32 value;
> -	int err;
> -
> -	err =3D readl_relaxed_poll_timeout(status_reg, value,
> -					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
> -					 (value & MIPI_CAL_STATUS_DONE), 50,
> -					 250000);
> -	mutex_unlock(&device->mipi->lock);
> -	clk_disable(device->mipi->clk);
> -
> -	return err;
> -}
> -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> -
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> -{
> -	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
> -	unsigned int i;
> -	u32 value;
> -	int err;
> -
> -	err =3D clk_enable(device->mipi->clk);
> -	if (err < 0)
> -		return err;
> -
> -	mutex_lock(&device->mipi->lock);
> -
> -	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> -		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> -
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> -	value &=3D ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> -	value |=3D MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> -	value |=3D MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> -
> -	for (i =3D 0; i < soc->num_pads; i++) {
> -		u32 clk =3D 0, data =3D 0;
> -
> -		if (device->pads & BIT(i)) {
> -			data =3D MIPI_CAL_CONFIG_SELECT |
> -			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> -			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> -			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> -			clk =3D MIPI_CAL_CONFIG_SELECT |
> -			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> -			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> -		}
> -
> -		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
> -
> -		if (soc->has_clk_lane && soc->pads[i].clk !=3D 0)
> -			tegra_mipi_writel(device->mipi, clk, soc->pads[i].clk);
> -	}
> -
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> -	value &=3D ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> -	value &=3D ~MIPI_CAL_CTRL_PRESCALE(0x3);
> -	value |=3D MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> -	value |=3D MIPI_CAL_CTRL_PRESCALE(0x2);
> -
> -	if (!soc->clock_enable_override)
> -		value &=3D ~MIPI_CAL_CTRL_CLKEN_OVR;
> -	else
> -		value |=3D MIPI_CAL_CTRL_CLKEN_OVR;
> -
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> -
> -	/* clear any pending status bits */
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_STATUS);
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_STATUS);
> -
> -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> -	value |=3D MIPI_CAL_CTRL_START;
> -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> -
> -	/*
> -	 * Wait for min 72uS to let calibration logic finish calibration
> -	 * sequence codes before waiting for pads idle state to apply the
> -	 * results.
> -	 */
> -	usleep_range(75, 80);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> -
> -static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> -	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIB },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIC },
> -	{ .data =3D MIPI_CAL_CONFIG_CSID },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIE },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIA },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIB },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIC },
> -	{ .data =3D MIPI_CAL_CONFIG_DSID },
> -};
> -
> -static const struct tegra_mipi_soc tegra114_mipi_soc =3D {
> -	.has_clk_lane =3D false,
> -	.pads =3D tegra114_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra114_mipi_pads),
> -	.clock_enable_override =3D true,
> -	.needs_vclamp_ref =3D true,
> -	.pad_drive_down_ref =3D 0x2,
> -	.pad_drive_up_ref =3D 0x0,
> -	.pad_vclamp_level =3D 0x0,
> -	.pad_vauxp_level =3D 0x0,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x4,
> -	.termos =3D 0x5,
> -	.hsclkpdos =3D 0x0,
> -	.hsclkpuos =3D 0x4,
> -};
> -
> -static const struct tegra_mipi_pad tegra124_mipi_pads[] =3D {
> -	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D MIPI_CAL_CONFIG_CSIE_CLK  },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK  },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK  },
> -};
> -
> -static const struct tegra_mipi_soc tegra124_mipi_soc =3D {
> -	.has_clk_lane =3D true,
> -	.pads =3D tegra124_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> -	.clock_enable_override =3D true,
> -	.needs_vclamp_ref =3D true,
> -	.pad_drive_down_ref =3D 0x2,
> -	.pad_drive_up_ref =3D 0x0,
> -	.pad_vclamp_level =3D 0x0,
> -	.pad_vauxp_level =3D 0x0,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x0,
> -	.termos =3D 0x0,
> -	.hsclkpdos =3D 0x1,
> -	.hsclkpuos =3D 0x2,
> -};
> -
> -static const struct tegra_mipi_soc tegra132_mipi_soc =3D {
> -	.has_clk_lane =3D true,
> -	.pads =3D tegra124_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> -	.clock_enable_override =3D false,
> -	.needs_vclamp_ref =3D false,
> -	.pad_drive_down_ref =3D 0x0,
> -	.pad_drive_up_ref =3D 0x3,
> -	.pad_vclamp_level =3D 0x0,
> -	.pad_vauxp_level =3D 0x0,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x0,
> -	.termos =3D 0x0,
> -	.hsclkpdos =3D 0x3,
> -	.hsclkpuos =3D 0x2,
> -};
> -
> -static const struct tegra_mipi_pad tegra210_mipi_pads[] =3D {
> -	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_CSIF, .clk =3D 0 },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_DSIC, .clk =3D MIPI_CAL_CONFIG_DSIC_CLK },
> -	{ .data =3D MIPI_CAL_CONFIG_DSID, .clk =3D MIPI_CAL_CONFIG_DSID_CLK },
> -};
> -
> -static const struct tegra_mipi_soc tegra210_mipi_soc =3D {
> -	.has_clk_lane =3D true,
> -	.pads =3D tegra210_mipi_pads,
> -	.num_pads =3D ARRAY_SIZE(tegra210_mipi_pads),
> -	.clock_enable_override =3D true,
> -	.needs_vclamp_ref =3D false,
> -	.pad_drive_down_ref =3D 0x0,
> -	.pad_drive_up_ref =3D 0x3,
> -	.pad_vclamp_level =3D 0x1,
> -	.pad_vauxp_level =3D 0x1,
> -	.hspdos =3D 0x0,
> -	.hspuos =3D 0x2,
> -	.termos =3D 0x0,
> -	.hsclkpdos =3D 0x0,
> -	.hsclkpuos =3D 0x2,
> -};
> -
> -static const struct of_device_id tegra_mipi_of_match[] =3D {
> -	{ .compatible =3D "nvidia,tegra114-mipi", .data =3D &tegra114_mipi_soc =
},
> -	{ .compatible =3D "nvidia,tegra124-mipi", .data =3D &tegra124_mipi_soc =
},
> -	{ .compatible =3D "nvidia,tegra132-mipi", .data =3D &tegra132_mipi_soc =
},
> -	{ .compatible =3D "nvidia,tegra210-mipi", .data =3D &tegra210_mipi_soc =
},
> -	{ },
> -};
> -
> -static int tegra_mipi_probe(struct platform_device *pdev)
> -{
> -	const struct of_device_id *match;
> -	struct tegra_mipi *mipi;
> -
> -	match =3D of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> -	if (!match)
> -		return -ENODEV;
> -
> -	mipi =3D devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> -	if (!mipi)
> -		return -ENOMEM;
> -
> -	mipi->soc =3D match->data;
> -	mipi->dev =3D &pdev->dev;
> -
> -	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> -	if (IS_ERR(mipi->regs))
> -		return PTR_ERR(mipi->regs);
> -
> -	mutex_init(&mipi->lock);
> -
> -	mipi->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);
> -	if (IS_ERR(mipi->clk)) {
> -		dev_err(&pdev->dev, "failed to get clock\n");
> -		return PTR_ERR(mipi->clk);
> -	}
> -
> -	platform_set_drvdata(pdev, mipi);
> -
> -	return 0;
> +	return devm_add_action_or_reset(device, tegra_mipi_remove_provider, NUL=
L);
>  }
> -
> -struct platform_driver tegra_mipi_driver =3D {
> -	.driver =3D {
> -		.name =3D "tegra-mipi",
> -		.of_match_table =3D tegra_mipi_of_match,
> -	},
> -	.probe =3D tegra_mipi_probe,
> -};
> +EXPORT_SYMBOL(devm_tegra_mipi_add_provider);
> diff --git a/drivers/gpu/host1x/tegra114-mipi.c b/drivers/gpu/host1x/tegr=
a114-mipi.c
> new file mode 100644
> index 000000000000..c084a09784d1
> --- /dev/null
> +++ b/drivers/gpu/host1x/tegra114-mipi.c
> @@ -0,0 +1,483 @@
> +/*
> + * Copyright (C) 2013 NVIDIA Corporation
> + *
> + * Permission to use, copy, modify, distribute, and sell this software a=
nd its
> + * documentation for any purpose is hereby granted without fee, provided=
 that
> + * the above copyright notice appear in all copies and that both that co=
pyright
> + * notice and this permission notice appear in supporting documentation,=
 and
> + * that the name of the copyright holders not be used in advertising or
> + * publicity pertaining to distribution of the software without specific=
,
> + * written prior permission.  The copyright holders make no representati=
ons
> + * about the suitability of this software for any purpose.  It is provid=
ed "as
> + * is" without express or implied warranty.
> + *
> + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOF=
TWARE,
> + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN N=
O
> + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY SPECIAL, INDIRECT=
 OR
> + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS O=
F USE,
> + * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHE=
R
> + * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERF=
ORMANCE
> + * OF THIS SOFTWARE.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/host1x.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
> +
> +#include "dev.h"
> +
> +#define MIPI_CAL_CTRL			0x00
> +#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> +#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> +#define MIPI_CAL_CTRL_CLKEN_OVR		BIT(4)
> +#define MIPI_CAL_CTRL_START		BIT(0)
> +
> +#define MIPI_CAL_AUTOCAL_CTRL		0x01
> +
> +#define MIPI_CAL_STATUS			0x02
> +#define MIPI_CAL_STATUS_DONE		BIT(16)
> +#define MIPI_CAL_STATUS_ACTIVE		BIT(0)
> +
> +#define MIPI_CAL_CONFIG_CSIA		0x05
> +#define MIPI_CAL_CONFIG_CSIB		0x06
> +#define MIPI_CAL_CONFIG_CSIC		0x07
> +#define MIPI_CAL_CONFIG_CSID		0x08
> +#define MIPI_CAL_CONFIG_CSIE		0x09
> +#define MIPI_CAL_CONFIG_CSIF		0x0a
> +#define MIPI_CAL_CONFIG_DSIA		0x0e
> +#define MIPI_CAL_CONFIG_DSIB		0x0f
> +#define MIPI_CAL_CONFIG_DSIC		0x10
> +#define MIPI_CAL_CONFIG_DSID		0x11
> +
> +#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> +#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> +#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> +#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> +#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> +#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> +#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> +
> +/* for data and clock lanes */
> +#define MIPI_CAL_CONFIG_SELECT		BIT(21)
> +
> +/* for data lanes */
> +#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> +#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> +
> +/* for clock lanes */
> +#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> +#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> +#define MIPI_CAL_BIAS_PAD_PDVCLAMP	BIT(1)
> +#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	BIT(0)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> +#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> +#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> +
> +#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> +#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> +#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> +#define MIPI_CAL_BIAS_PAD_PDVREG	BIT(1)
> +
> +struct tegra_mipi_pad {
> +	unsigned long data;
> +	unsigned long clk;
> +};
> +
> +struct tegra_mipi_soc {
> +	bool has_clk_lane;
> +	const struct tegra_mipi_pad *pads;
> +	unsigned int num_pads;
> +
> +	bool clock_enable_override;
> +	bool needs_vclamp_ref;
> +
> +	/* bias pad configuration settings */
> +	u8 pad_drive_down_ref;
> +	u8 pad_drive_up_ref;
> +
> +	u8 pad_vclamp_level;
> +	u8 pad_vauxp_level;
> +
> +	/* calibration settings for data lanes */
> +	u8 hspdos;
> +	u8 hspuos;
> +	u8 termos;
> +
> +	/* calibration settings for clock lanes */
> +	u8 hsclkpdos;
> +	u8 hsclkpuos;
> +};
> +
> +struct tegra_mipi {
> +	const struct tegra_mipi_soc *soc;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock; /* for register access */
> +	struct clk *clk;
> +
> +	unsigned long usage_count;
> +};
> +
> +static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> +				   unsigned long offset)
> +{
> +	return readl(mipi->regs + (offset << 2));
> +}
> +
> +static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 value,
> +				     unsigned long offset)
> +{
> +	writel(value, mipi->regs + (offset << 2));
> +}
> +
> +static int tegra114_mipi_power_up(struct tegra_mipi *mipi)
> +{
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +
> +	if (mipi->soc->needs_vclamp_ref)
> +		value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	clk_disable(mipi->clk);
> +
> +	return 0;
> +}
> +
> +static int tegra114_mipi_power_down(struct tegra_mipi *mipi)
> +{
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	/*
> +	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> +	 * supplies the DSI pads. This must be kept enabled until none of the
> +	 * DSI lanes are used anymore.
> +	 */
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value |=3D MIPI_CAL_BIAS_PAD_PDVREG;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	/*
> +	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> +	 * control a regulator that supplies current to the pre-driver logic.
> +	 * Powering down this regulator causes DSI to fail, so it must remain
> +	 * powered on until none of the DSI lanes are used anymore.
> +	 */
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	if (mipi->soc->needs_vclamp_ref)
> +		value &=3D ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> +
> +	value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> +
> +	return 0;
> +}
> +
> +static int tegra114_mipi_enable(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	int err =3D 0;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	if (mipi->usage_count++ =3D=3D 0)
> +		err =3D tegra114_mipi_power_up(mipi);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_disable(struct tegra_mipi_device *mipidev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	int err =3D 0;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	if (--mipi->usage_count =3D=3D 0)
> +		err =3D tegra114_mipi_power_down(mipi);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *mi=
pidev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> +	u32 value;
> +	int err;
> +
> +	err =3D readl_relaxed_poll_timeout(status_reg, value,
> +					 !(value & MIPI_CAL_STATUS_ACTIVE) &&
> +					 (value & MIPI_CAL_STATUS_DONE), 50,
> +					 250000);
> +	mutex_unlock(&mipi->lock);
> +	clk_disable(mipi->clk);
> +
> +	return err;
> +}
> +
> +static int tegra114_mipi_start_calibration(struct tegra_mipi_device *mip=
idev)
> +{
> +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> +	const struct tegra_mipi_soc *soc =3D mipi->soc;
> +	unsigned int i;
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->clk);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> +		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> +	value &=3D ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> +	value |=3D MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> +	value |=3D MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> +
> +	for (i =3D 0; i < soc->num_pads; i++) {
> +		u32 clk =3D 0, data =3D 0;
> +
> +		if (mipidev->pads & BIT(i)) {
> +			data =3D MIPI_CAL_CONFIG_SELECT |
> +			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> +			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> +			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> +			clk =3D MIPI_CAL_CONFIG_SELECT |
> +			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> +			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> +		}
> +
> +		tegra_mipi_writel(mipi, data, soc->pads[i].data);
> +
> +		if (soc->has_clk_lane && soc->pads[i].clk !=3D 0)
> +			tegra_mipi_writel(mipi, clk, soc->pads[i].clk);
> +	}
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> +	value &=3D ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> +	value &=3D ~MIPI_CAL_CTRL_PRESCALE(0x3);
> +	value |=3D MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> +	value |=3D MIPI_CAL_CTRL_PRESCALE(0x2);
> +
> +	if (!soc->clock_enable_override)
> +		value &=3D ~MIPI_CAL_CTRL_CLKEN_OVR;
> +	else
> +		value |=3D MIPI_CAL_CTRL_CLKEN_OVR;
> +
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> +
> +	/* clear any pending status bits */
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_STATUS);
> +
> +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> +	value |=3D MIPI_CAL_CTRL_START;
> +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> +
> +	/*
> +	 * Wait for min 72uS to let calibration logic finish calibration
> +	 * sequence codes before waiting for pads idle state to apply the
> +	 * results.
> +	 */
> +	usleep_range(75, 80);
> +
> +	return 0;
> +}
> +
> +static const struct tegra_mipi_ops tegra114_mipi_ops =3D {
> +	.enable =3D tegra114_mipi_enable,
> +	.disable =3D tegra114_mipi_disable,
> +	.start_calibration =3D tegra114_mipi_start_calibration,
> +	.finish_calibration =3D tegra114_mipi_finish_calibration,
> +};
> +
> +static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> +	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIB },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIC },
> +	{ .data =3D MIPI_CAL_CONFIG_CSID },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIE },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIA },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIB },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIC },
> +	{ .data =3D MIPI_CAL_CONFIG_DSID },
> +};
> +
> +static const struct tegra_mipi_soc tegra114_mipi_soc =3D {
> +	.has_clk_lane =3D false,
> +	.pads =3D tegra114_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra114_mipi_pads),
> +	.clock_enable_override =3D true,
> +	.needs_vclamp_ref =3D true,
> +	.pad_drive_down_ref =3D 0x2,
> +	.pad_drive_up_ref =3D 0x0,
> +	.pad_vclamp_level =3D 0x0,
> +	.pad_vauxp_level =3D 0x0,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x4,
> +	.termos =3D 0x5,
> +	.hsclkpdos =3D 0x0,
> +	.hsclkpuos =3D 0x4,
> +};
> +
> +static const struct tegra_mipi_pad tegra124_mipi_pads[] =3D {
> +	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D MIPI_CAL_CONFIG_CSIE_CLK  },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK  },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK  },
> +};
> +
> +static const struct tegra_mipi_soc tegra124_mipi_soc =3D {
> +	.has_clk_lane =3D true,
> +	.pads =3D tegra124_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> +	.clock_enable_override =3D true,
> +	.needs_vclamp_ref =3D true,
> +	.pad_drive_down_ref =3D 0x2,
> +	.pad_drive_up_ref =3D 0x0,
> +	.pad_vclamp_level =3D 0x0,
> +	.pad_vauxp_level =3D 0x0,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x0,
> +	.termos =3D 0x0,
> +	.hsclkpdos =3D 0x1,
> +	.hsclkpuos =3D 0x2,
> +};
> +
> +static const struct tegra_mipi_soc tegra132_mipi_soc =3D {
> +	.has_clk_lane =3D true,
> +	.pads =3D tegra124_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> +	.clock_enable_override =3D false,
> +	.needs_vclamp_ref =3D false,
> +	.pad_drive_down_ref =3D 0x0,
> +	.pad_drive_up_ref =3D 0x3,
> +	.pad_vclamp_level =3D 0x0,
> +	.pad_vauxp_level =3D 0x0,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x0,
> +	.termos =3D 0x0,
> +	.hsclkpdos =3D 0x3,
> +	.hsclkpuos =3D 0x2,
> +};
> +
> +static const struct tegra_mipi_pad tegra210_mipi_pads[] =3D {
> +	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_CSIF, .clk =3D 0 },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_DSIC, .clk =3D MIPI_CAL_CONFIG_DSIC_CLK },
> +	{ .data =3D MIPI_CAL_CONFIG_DSID, .clk =3D MIPI_CAL_CONFIG_DSID_CLK },
> +};
> +
> +static const struct tegra_mipi_soc tegra210_mipi_soc =3D {
> +	.has_clk_lane =3D true,
> +	.pads =3D tegra210_mipi_pads,
> +	.num_pads =3D ARRAY_SIZE(tegra210_mipi_pads),
> +	.clock_enable_override =3D true,
> +	.needs_vclamp_ref =3D false,
> +	.pad_drive_down_ref =3D 0x0,
> +	.pad_drive_up_ref =3D 0x3,
> +	.pad_vclamp_level =3D 0x1,
> +	.pad_vauxp_level =3D 0x1,
> +	.hspdos =3D 0x0,
> +	.hspuos =3D 0x2,
> +	.termos =3D 0x0,
> +	.hsclkpdos =3D 0x0,
> +	.hsclkpuos =3D 0x2,
> +};
> +
> +static const struct of_device_id tegra_mipi_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra114-mipi", .data =3D &tegra114_mipi_soc =
},
> +	{ .compatible =3D "nvidia,tegra124-mipi", .data =3D &tegra124_mipi_soc =
},
> +	{ .compatible =3D "nvidia,tegra132-mipi", .data =3D &tegra132_mipi_soc =
},
> +	{ .compatible =3D "nvidia,tegra210-mipi", .data =3D &tegra210_mipi_soc =
},
> +	{ },
> +};
> +
> +static int tegra_mipi_probe(struct platform_device *pdev)
> +{
> +	const struct of_device_id *match;
> +	struct tegra_mipi *mipi;
> +
> +	match =3D of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> +	if (!match)
> +		return -ENODEV;
> +
> +	mipi =3D devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> +	if (!mipi)
> +		return -ENOMEM;
> +
> +	mipi->soc =3D match->data;
> +	mipi->dev =3D &pdev->dev;
> +
> +	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (IS_ERR(mipi->regs))
> +		return PTR_ERR(mipi->regs);
> +
> +	mutex_init(&mipi->lock);
> +
> +	mipi->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(mipi->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(mipi->clk);
> +	}
> +
> +	platform_set_drvdata(pdev, mipi);
> +
> +	return devm_tegra_mipi_add_provider(&pdev->dev, pdev->dev.of_node,
> +					    &tegra114_mipi_ops);
> +}
> +
> +struct platform_driver tegra_mipi_driver =3D {
> +	.driver =3D {
> +		.name =3D "tegra-mipi",
> +		.of_match_table =3D tegra_mipi_of_match,
> +	},
> +	.probe =3D tegra_mipi_probe,
> +};
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 74c92db1032f..9e3bd6109781 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
>  #include <media/v4l2-fwnode.h>
> =20
> diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> index 9fa9c30a34e6..b1c6514859d3 100644
> --- a/include/linux/host1x.h
> +++ b/include/linux/host1x.h
> @@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client *=
client);
>  int host1x_client_suspend(struct host1x_client *client);
>  int host1x_client_resume(struct host1x_client *client);
> =20
> -struct tegra_mipi_device;
> -
> -struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> -					     struct device_node *np);
> -void tegra_mipi_free(struct tegra_mipi_device *device);
> -int tegra_mipi_enable(struct tegra_mipi_device *device);
> -int tegra_mipi_disable(struct tegra_mipi_device *device);
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> -
>  /* host1x memory contexts */
> =20
>  struct host1x_memory_context {
> diff --git a/include/linux/tegra-mipi-cal.h b/include/linux/tegra-mipi-ca=
l.h
> new file mode 100644
> index 000000000000..2a540b50f65d
> --- /dev/null
> +++ b/include/linux/tegra-mipi-cal.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __TEGRA_MIPI_CAL_H_
> +#define __TEGRA_MIPI_CAL_H_
> +
> +struct tegra_mipi_device {
> +	const struct tegra_mipi_ops *ops;
> +	struct platform_device *pdev;
> +	unsigned long pads;
> +};
> +
> +/**
> + * Operations for Tegra MIPI calibration device
> + */
> +struct tegra_mipi_ops {
> +	/**
> +	 * @enable:
> +	 *
> +	 * Enable MIPI calibration device
> +	 */
> +	int (*enable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @disable:
> +	 *
> +	 * Disable MIPI calibration device
> +	 */
> +	int (*disable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @start_calibration:
> +	 *
> +	 * Start MIPI calibration
> +	 */
> +	int (*start_calibration)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @finish_calibration:
> +	 *
> +	 * Finish MIPI calibration
> +	 */
> +	int (*finish_calibration)(struct tegra_mipi_device *device);
> +};
> +
> +int devm_tegra_mipi_add_provider(struct device *device, struct device_no=
de *np,
> +				 const struct tegra_mipi_ops *ops);
> +
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> +					     struct device_node *np);
> +void tegra_mipi_free(struct tegra_mipi_device *device);
> +
> +int tegra_mipi_enable(struct tegra_mipi_device *device);
> +int tegra_mipi_disable(struct tegra_mipi_device *device);
> +int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> +
> +#endif /* __TEGRA_MIPI_CAL_H_ */
>=20

Acked-by: Mikko Perttunen <mperttunen@nvidia.com>



