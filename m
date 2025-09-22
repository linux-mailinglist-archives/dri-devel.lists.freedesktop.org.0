Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC0B8F2B8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C97F10E3BD;
	Mon, 22 Sep 2025 06:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CMZgUy0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027B010E3BD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 06:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JtuySexUhMhP71IyljTN5zWlgf8dCjMyPxmQO9N9ka4FZC9MB1M51XKaqVz9ROoIPjVdepBql8LmixRtxBpJLDsg6/FgwSXhiQXKLKH7DKPWG92vnOZ9xBTSwVZSra2+65LiOQsSh/pSoVcgz62xPdOQBdLLHxMzLjbCf00DT07+IlhP5OaTGAqAN0rDGQGtTiqyHKXyJcELzg6Jjowz5tJ/QTGVouVoS+4/NRZfjtmz1aleReMagTAT072kdzvyAXfR/ZesCplBFNMRrUt4Szyh0Lx22jU3tyrRKfSW8E8M84mJY5hiTN3beOjXd9YIqZJ4fELNOyTIXjO/hZnQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3lgEpXG4MEQmBRH0qzM+iTN0MSFAzblpfQNYYoXtHk=;
 b=FdZ/elTMFaZEJbXQ6s60wb3rVTyMJeLw6t1NM7SL+c1IUzFB+IjvjM3dbJ/x2JuRAl9PvN4Fr2vW+9yRbThjLG976Q/Y/1LlStjtfii5XIWqBGwwkuXCBeKDaasKQSSUoNaaHaVRcAg2BvQiP5SPv+siXmRrWsrZ3uIdxW1HL4TnDMPsDG3N+JW3KQefZ4QVnOo4gkhUbh+XQE4SGpDAKtOxOlj+MeUmbDSbi2LqcGDiM+49uJ5YOHWSlAnAHbGDf+qiHTbQYO34nCDRJOfn5PpEU6hIY6UG3L+wZ0GArfrQ6PYI8W9BnAUiau13dtQJ3gxH7uGPHa9xqyrwW8PvoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3lgEpXG4MEQmBRH0qzM+iTN0MSFAzblpfQNYYoXtHk=;
 b=CMZgUy0BfigReAng2bOPg3cfhmFX5kRpwArI3s0AlbJU+716p4VbkfhgX/9PVZwm2FsqV+vQ1AxuvwhM8aYStfW1x+NSL6eVM27Z11qYdVli5+gaZ2exsRSDkIjxBxu7txM3UUgHp/84/uKNr2NJZvVgIgm4JgtyO3sByoukMJ0fcvRxJjbF2tFQjUZzYTo6ya2z3ta3X9hUJR9B6cJPdOnqFUdSkChbKfSbDTSniedmWn2BO59rtTiRSspUwRieQLe4X4yEzt8FtwlQ2Fa84Q7qEChkKAjNrs4s1zvKUhDlKC/Jlo8XC5oEuo1vVipBy8m5qBzSUa6aFFbu89lOcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CH2PR12MB4088.namprd12.prod.outlook.com (2603:10b6:610:a5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 06:37:01 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:37:00 +0000
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
Subject: Re: [PATCH v2 23/23] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Mon, 22 Sep 2025 15:36:56 +0900
Message-ID: <2283976.X513TT2pbd@senjougahara>
In-Reply-To: <CAPVz0n2OdnK4CWd7e7qefFoMBPaj8aqheJVXvTUUL-SypwP8hA@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <4167298.LM0AJKV5NW@senjougahara>
 <CAPVz0n2OdnK4CWd7e7qefFoMBPaj8aqheJVXvTUUL-SypwP8hA@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CH2PR12MB4088:EE_
X-MS-Office365-Filtering-Correlation-Id: a1dacc41-34bb-44c5-d1bd-08ddf9a26f57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVpnU28reCt4a0lrZHBHSCt6ZU5TZFRzL3ZjL1V2UUlrcnVXZUp0OFFLYTY3?=
 =?utf-8?B?VWUxRHE0Z0RWUU9QNW10TUoxbldPT3hzQkduTmlPbys3ZnNwV1FGUWF2L0xN?=
 =?utf-8?B?WnNDUnZJUWloQ1hTYXlRamhHRVduSlV3djM1MndLRFdHbFpXMHI4ajRQMjZF?=
 =?utf-8?B?eE5BRVZTampNT1RPWEZOdGRyYXNFSXY0QUpQQTltcExtNmx3MEdWWXZnTE9G?=
 =?utf-8?B?NzAvem51NFZYRTlmNU1KQkRnZHBranN2RTFaZEhjUk1LK0F5VTlNZHA4cjdD?=
 =?utf-8?B?dlNxNkdKOTAyUFVPdk1WL3V0Ri9YWlFtTm5Db0ZWcGh1Mys5dDA1cm1wSmFD?=
 =?utf-8?B?M2VPdDZjSXpUaHEvTU1lWHhPREp4bXFvLzJFTTZjQ1VCUkRWcjhhc01IUUdi?=
 =?utf-8?B?R29vTnhGWlRTandlR1p0Qk9UUE1rcWdhb3VYWFVUaFlEaFBTYStJRXJ2bWdk?=
 =?utf-8?B?a0V6ZkV3VUUvODVuMUpnUmJaQWttZE9DTG5KTHZhUms1cmpMc25sSXJXTTlL?=
 =?utf-8?B?d1RneVRJQU9aK3M2dlMrNFVQU2NTNWd2MFdRcEx2UGNBV1JlSnBzdnRxY0Ry?=
 =?utf-8?B?dVpzaE1vbUtSZnByaE1VakZjbkRuSjVlMVlPMktFN0QzdStGRFdSS1VsczE3?=
 =?utf-8?B?Q3ZGRmRTenExZXd2S3V1eGRxbWxhTFV0cVE0NHF3ZlhTWjFhMW5KcmxLTkpQ?=
 =?utf-8?B?QnhFUmI0L0o1dEhhaUpCSzVKcExhbTFTY29YY0JJV1ljRmZyZ3FoODArbVp1?=
 =?utf-8?B?cmNCMlc1N1NpaDhhYVNGNC9oL29JcXFqMml5ZXhYMnFOQ2l1OTlrd29WMDF2?=
 =?utf-8?B?ZnUwOUhGSWgvYzYvVkpKSitIakVCWHNmc3VleUZGaDAvU0tvV0hrU0lVaE5F?=
 =?utf-8?B?RlFHVzNJZEF0bWFYYUZTYkhSejFwZzJsTW4rb0hYOGdWZUFHNkRZVXdUS2pH?=
 =?utf-8?B?cmEybnpFODBhVHQvMmVvYWlhQWc2OWFKNS9ERjdIek9CUUU1blEyZVo5cm50?=
 =?utf-8?B?dWZnc3BDUENpRkFrTGVSWGNJYVE0MHJJa0QzZy9VUFQ2S1pETnRIN1ZsQWNp?=
 =?utf-8?B?THgvQk8ybEpoUXJncy9HZjF0WXFtLzRqeUpqbFIxcXlGQys3eHgrK1BteE9h?=
 =?utf-8?B?cEhsSUlibTNPQk44K2E5TlpRa0gzT0R6WmNRZkJwY1JlQjFWcmpJaUZmaUlM?=
 =?utf-8?B?NmdxOTJLeHI0ZkFqYXZ1NW83b0haNW5RVXRzVWkvTFV1K3YrTjNDeDM3bW1k?=
 =?utf-8?B?UGY0YmVteUlpNmNHOVl4aTFtZFkvZ2JBUkFWQ3VEWnZxcExrU3YrNWpjTVBV?=
 =?utf-8?B?NU9IQU83SmZhNnRyUEhvTXAwTW8yN2FEakR6RURXaXplcVRocWhLeWREY3lk?=
 =?utf-8?B?WFJUUHFNelg5VTdaM3RiNjQvbVlLOHJUSy8vUHdkazJ2Z1J2T2h1L0M1QTNL?=
 =?utf-8?B?d3B2L2g1cmRHSG93SzVjRXdqR1FadG03YlFKZFJKZ2piVmNUd0c5d2RBb0x5?=
 =?utf-8?B?Z1BvNy9hbUVka08reVVxVHp4L2MrRk9BUGNjSFYyREcwQUdHTldseDVwdyti?=
 =?utf-8?B?TFpBaEZOditmeEdDOVV6ZElWTHhQRGhEdUZqTTNaZnhrSkx6MEV1RGFSazhE?=
 =?utf-8?B?OHhtOUhLSVd2cGx2WnFOS2NxQTRmZ0hKSmdXRVB5dXBPcmN0TmhLUVBnS3dr?=
 =?utf-8?B?b0Ewa3c2a1FQVlBqSms3eWlOTjNHM1JPV3oxOEdaSS9JcnAweWhpYVVoSHdS?=
 =?utf-8?B?cXNJWG5nWmlkUUhPdGdTTFlXVk9keG10SVNHVXk4b2NqK1ZnVFZvS3JVcGVB?=
 =?utf-8?B?RW5kNWlVeUJpdHRiWWlQUUpqbndhNkVoYkpQVGdaaXgra2Y0R3Fvdk9WaE0v?=
 =?utf-8?B?S2dtMjg0NlRTRThhTlgxaE5rRHdERWlpc1l2NW5sU1JIeTFaS1B0ekRxQmhy?=
 =?utf-8?Q?Xl8sTHqTueo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHVIZUJld0x3VWdDcVNIRHhkSkcwdkMyNXIvcjRFZnZ0ZStPZGJobGZVVnU0?=
 =?utf-8?B?U095ejZhMjlMckJWTWU4MUo4bndvRDd6a1RKSzBGYWc3bnFUUGpUWHQ5bUVI?=
 =?utf-8?B?ZUhDMlBtSnFnNjJZWnpzbGRYVmExYVpON09zcU9DZmNzWGt6MVBoUjhvM0tC?=
 =?utf-8?B?dmdkRDgwaFhHY0IwQmEvMjBYaUh6U3lzUWlRL04vT2I2QlVMRzluUTNvWUNk?=
 =?utf-8?B?dGdiUTJhUkVydC9BREpKNkp3S0YzR2pFUkN1c1kwZTdmaGpqaVFyeHk5V3pK?=
 =?utf-8?B?SzJFQzhVZ2FVdEluZDJCZGtVR3ptK1MvZGw4cWpvS05ST2NZMisvYkVwMkFO?=
 =?utf-8?B?U0pPTnVRUzliZTFtQllVUnNNUXpJeWNvdUFTRUEzeHJraEJBT2JzRFNCbmFK?=
 =?utf-8?B?NHM4OXZlZ2FwOS9qR2ptWGZDYWhiU2doalJuc1M4NHRKTnpHWVRmRFhRWlJ4?=
 =?utf-8?B?QSsvYWlxeHYrb2N0ZjY5SnhwNERLY2YweC9lSDRYR0VmbjQ1UmFJc3dyZ09N?=
 =?utf-8?B?NG9lbzVIbVA0SVhLWEw4QWJmQlRrcXFhdys0T25wM1k5TXNMdjVqZ1drYUxM?=
 =?utf-8?B?alRxUGZ0STVSTTFuN29VNjh0eS9PVXJEYWdKdW9aMmRCMEh0cXI3bEZzQzht?=
 =?utf-8?B?UmNkckRQczMzc2tHaVVRQzJzMVovZW1XSEk0dTVkdnlmL3JaRkVOclRlU0x2?=
 =?utf-8?B?TmVMUHJ4elZDTjA4SXVPbXhpeVB3akt2N3lpclZMYmN1aE1RWFk4bElCeUF4?=
 =?utf-8?B?a2QyUTkzdmNWL01QZ1dscU14MHMwMDFuWHhENGduOXZsNy8zN2RGb2QreHZZ?=
 =?utf-8?B?Z3VtRC9zRDVySVZ3aXZodFA3dll5d01Mb3lEc1RWbmx1V0J0bSsxK2twWm12?=
 =?utf-8?B?UFgzUVFaT2tCMGlMTmtENDd2cmRSVnNnREtPdkpTayt3cTRNTzdPa1VhY1k4?=
 =?utf-8?B?em43aFVyU3R0S2pEVDdXczBDa1F1bEQ2NnV4bldrN0RDUVB1eDN2dXV3bTc0?=
 =?utf-8?B?VW5oYytxNmliTHhmN0ZBUVVnbmpVc3MwZldaaXk2ZEduUjREWWxGczVBZEVm?=
 =?utf-8?B?d0RqRG1CK20xMFZ4TmxJOVAyYWxuaGd6LzJFZGZZTFo3dVJjZFBEd1NmUitj?=
 =?utf-8?B?U0V3c0NBWUYvZ1NwTlBHVUp3VDVpY1pZc0p4bkpLc3BKb3BmRjFiQjhZaVkz?=
 =?utf-8?B?QjdEY21vZDhwZFVEUS9OWE1vckd5a3lIOHBSUjVmRmxMbThXQS90ODlxT24w?=
 =?utf-8?B?anFQV0lMWnFzOXFWc1BMRVB1Si8xaHYrRUpPY0VFS2k3TmMrVDhkczhWMTdo?=
 =?utf-8?B?UXlWNU1QZHlaWmR1Q2RKeXNOL2RselIwRW45NGVhYmhscVZWaEo5elY4NzZW?=
 =?utf-8?B?a0lCNXhONjR5bGhFUi9Wc3RuUlc3OEUxOXE2Q0x3ZmczVzlkZXFCZmlaazUz?=
 =?utf-8?B?YXdZeWQwZDVhTnhBaGs5djhnL3A3UEhYZnRwQ21ZdGRUd3h0bE1XMWxkalZB?=
 =?utf-8?B?THJNZUhmWkpPTEQ0eGJFc0FLSnp1N3FRcFdqUUlHWVJyaVd0V2RnSTE0UGd2?=
 =?utf-8?B?d1RJU0tLVlhxZFl6eDVVNWlxcmIyV1NIa29EZmx1YjNBTmlTcUtpbk82TXFa?=
 =?utf-8?B?MTVpNG8wSzVEc3d6YktScVorN0tjSmUxbStYMGVYeXA5cnNIUkkwTlJ3OG1P?=
 =?utf-8?B?bEZ5NW94cE9GMUlEdmVoclRUblpzUjArQ0k3K1Q0TXNSZE5rc21YMUwzVGtu?=
 =?utf-8?B?d2JjTWErcEYrS3NFWnowVXhkdEwreXdzM3VtdHVkVHVac2g4K0tUWUE1a2xO?=
 =?utf-8?B?QkZYaG9XOUxSQ2pNa2VEWnppZU94dDB1a0xxcWJmaWRQZjJrR210MjFoOS81?=
 =?utf-8?B?UXdLbk1WaGhOc2hLK3BGRHhySENCTDJYYmswNVhnRUt4aG1Ua2t1c2VYL3gr?=
 =?utf-8?B?MlM3V1o1SmttaVVyaVh4YVZEOWdOMFloYXUvS2dqTUlMWVhxbHFkNGR6VGJW?=
 =?utf-8?B?KzR6V1ZVeDVjaFp3UCtydVJDcGhSV21qMUxDdjFxZVdHeDBwdlZsUHZkYXNE?=
 =?utf-8?B?NnNvcHBUcjJ1QVJaWmp6NkhjaHdqVGpkYUNRZTBIU04wMEN2SzY0VndyNUhD?=
 =?utf-8?B?aHFnTVVOR2lvYTNOYnFpNmVlUkNHc0g2VWJpSmxHaWNNcGtybVZrdXU1QmIw?=
 =?utf-8?B?dnMzZUpxTExlTVM1WGtBdERlcW1DRjQzOEhXWEhIWmQzTzQwdSsyRDZ3STQ4?=
 =?utf-8?B?S1pFT20xQ2hWdHQzVHNGdjhwY0RRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1dacc41-34bb-44c5-d1bd-08ddf9a26f57
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:37:00.7864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9k3HkJJIjShC8KdBSLnXkmfjUVr8kvDsL4feShgLPFmY4sYFL24UrT9MRK4fHok5ZdcSqYBybA32C5XZFgR5JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4088
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

On Monday, September 22, 2025 3:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 08:16 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Add support for MIPI CSI device and calibration logic found in Tegra2=
0 and
> > > Tegra30 SoC.
> >
> > The patch is on the longer side. I'd add some more explanation in the c=
ommit message on the steps done in the patch.
> >
>=20
> Tbh, I am not sure that more to add, there was only one step -
> transfer downstream code into existing kernel v4l2 framework. This is
> basically creation of a new driver there were no multi-step setup or
> smth like that. All steps to prepare this were made separate commits.

I would add a brief note about things that are different from the existing =
VIP code, e.g. that we need to allocate another syncpoint for synchronizing=
 the CSI operations. Also if you implement the syncpoint wait race conditio=
n fix, that would be something to mention (since it affects existing code -=
- unless it's done as a separate patch). Regarding the MIPI calibration cod=
e, I would note that we register as a MIPI calibration provider since DSI c=
alibration is also done through this code. It's then a bit easier to unders=
tand those points as they come up when reading the patch.

>=20
> > >
> > > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/csi.c     |  12 +
> > >  drivers/staging/media/tegra-video/tegra20.c | 593 ++++++++++++++++++=
--
> > >  drivers/staging/media/tegra-video/vi.h      |   2 +
> > >  drivers/staging/media/tegra-video/video.c   |   6 +
> > >  4 files changed, 573 insertions(+), 40 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/stagin=
g/media/tegra-video/csi.c
> > > index 1677eb51ec21..d3f85f964ada 100644
> > > --- a/drivers/staging/media/tegra-video/csi.c
> > > +++ b/drivers/staging/media/tegra-video/csi.c
> > > @@ -863,11 +863,23 @@ static void tegra_csi_remove(struct platform_de=
vice *pdev)
> > >       pm_runtime_disable(&pdev->dev);
> > >  }
> > >
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +extern const struct tegra_csi_soc tegra20_csi_soc;
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +extern const struct tegra_csi_soc tegra30_csi_soc;
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >  extern const struct tegra_csi_soc tegra210_csi_soc;
> > >  #endif
> > >
> > >  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +     { .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_=
soc },
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +     { .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_=
soc },
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >       { .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_cs=
i_soc },
> > >  #endif
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index 20cdcc4e01aa..f81c40b6e709 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -4,6 +4,9 @@
> > >   *
> > >   * Copyright (C) 2023 SKIDATA GmbH
> > >   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > + *
> > > + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> > > + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > >   */
> > >
> > >  /*
> > > @@ -12,11 +15,16 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/clk/tegra.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/host1x.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/kthread.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/tegra-csi.h>
> > > +#include <linux/tegra-mipi-cal.h>
> > >  #include <linux/v4l2-mediabus.h>
> > >
> > >  #include "vip.h"
> > > @@ -43,6 +51,9 @@ enum tegra_vi_out {
> > >  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT   BIT(8)
> > >  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT              0
> > >
> > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)   (0x0070 + (n) *=
 8)
> > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)     (0x0074 + (n) *=
 8)
> > > +
> > >  #define TEGRA_VI_VI_INPUT_CONTROL                    0x0088
> > >  #define       VI_INPUT_FIELD_DETECT                  BIT(27)
> > >  #define       VI_INPUT_BT656                         BIT(25)
> > > @@ -88,6 +99,8 @@ enum tegra_vi_out {
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_SFT            0
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST     (3 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR   (6 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER  (7 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER  (8 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT       (9 << V=
I_OUTPUT_OUTPUT_FORMAT_SFT)
> > >
> > >  #define TEGRA_VI_VIP_H_ACTIVE                                0x00a4
> > > @@ -152,8 +165,106 @@ enum tegra_vi_out {
> > >  #define TEGRA_VI_VI_RAISE                            0x01ac
> > >  #define       VI_VI_RAISE_ON_EDGE                    BIT(0)
> > >
> > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)         (0x01d8 + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)           (0x01dc + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)                  (0x01e8 + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)                  (0x01ec + (n) *=
 8)
> > > +
> > > +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> > > +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL            0x0000
> > > +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL          0x0008
> > > +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)            (0x0010 + (n) *=
 0x2c)
> > > +#define       CSI_SKIP_PACKET_THRESHOLD(n)           (((n) & 0xff) <=
< 16)
> > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)           (0x0018 + (n) *=
 0x2c)
> > > +#define       CSI_PP_PAD_FRAME_PAD0S                 (0 << 28)
> > > +#define       CSI_PP_PAD_FRAME_PAD1S                 (1 << 28)
> > > +#define       CSI_PP_PAD_FRAME_NOPAD                 (2 << 28)
> > > +#define       CSI_PP_HEADER_EC_ENABLE                        BIT(27)
> > > +#define       CSI_PP_PAD_SHORT_LINE_PAD0S            (0 << 24)
> > > +#define       CSI_PP_PAD_SHORT_LINE_PAD1S            (1 << 24)
> > > +#define       CSI_PP_PAD_SHORT_LINE_NOPAD            (2 << 24)
> > > +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED          BIT(20)
> > > +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY         (0 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL             (1 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP         (2 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_STORE             (3 << 16)
> > > +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)           (((n) - 1) << 1=
4)
> > > +#define       CSI_PP_DATA_TYPE(n)                    ((n) << 8)
> > > +#define       CSI_PP_CRC_CHECK_ENABLE                        BIT(7)
> > > +#define       CSI_PP_WORD_COUNT_HEADER                       BIT(6)
> > > +#define       CSI_PP_DATA_IDENTIFIER_ENABLE          BIT(5)
> > > +#define       CSI_PP_PACKET_HEADER_SENT                      BIT(4)
> > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)           (0x001c + (n) *=
 0x2c)
> > > +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)         (0x0020 + (n) *=
 0x2c)
> > > +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)                        (0x0024=
 + (n) * 0x2c)
> > > +#define       CSI_PP_FRAME_MIN_GAP(n)                        (((n) &=
 0xffff) << 16)
> > > +#define       CSI_PP_LINE_MIN_GAP(n)                 (((n) & 0xffff)=
)
> > > +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)         (0x0028 + (n) *=
 0x2c)
> > > +#define       CSI_PP_START_MARKER_FRAME_MAX(n)               (((n) &=
 0xf) << 12)
> > > +#define       CSI_PP_START_MARKER_FRAME_MIN(n)               (((n) &=
 0xf) << 8)
> > > +#define       CSI_PP_VSYNC_START_MARKER                      BIT(4)
> > > +#define       CSI_PP_SINGLE_SHOT                     BIT(2)
> > > +#define       CSI_PP_NOP                             0
> > > +#define       CSI_PP_ENABLE                          1
> > > +#define       CSI_PP_DISABLE                         2
> > > +#define       CSI_PP_RST                             3
> > > +#define TEGRA_CSI_PHY_CIL_COMMAND                    0x0068
> > > +#define       CSI_A_PHY_CIL_NOP                              0x0
> > > +#define       CSI_A_PHY_CIL_ENABLE                   0x1
> > > +#define       CSI_A_PHY_CIL_DISABLE                  0x2
> > > +#define       CSI_A_PHY_CIL_ENABLE_MASK                      0x3
> > > +#define       CSI_B_PHY_CIL_NOP                              (0x0 <<=
 16)
> > > +#define       CSI_B_PHY_CIL_ENABLE                   (0x1 << 16)
> > > +#define       CSI_B_PHY_CIL_DISABLE                  (0x2 << 16)
> > > +#define       CSI_B_PHY_CIL_ENABLE_MASK                      (0x3 <<=
 16)
> > > +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)                        (0x006c=
 + (n) * 4)
> > > +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE               BIT(5)
> > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS            0x0078
> > > +#define TEGRA_CSI_CSI_CIL_STATUS                     0x007c
> > > +#define       CSI_MIPI_AUTO_CAL_DONE                 BIT(15)
> > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK    0x0080
> > > +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK             0x0084
> > > +#define TEGRA_CSI_CSI_READONLY_STATUS                        0x0088
> > > +#define TEGRA_CSI_ESCAPE_MODE_COMMAND                        0x008c
> > > +#define TEGRA_CSI_ESCAPE_MODE_DATA                   0x0090
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)                 (0x0094 + (n) *=
 8)
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)                 (0x0098 + (n) *=
 8)
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG                     0x00a4
> > > +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG                       0x00a8
> > > +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG                       0x00ac
> > > +#define       CSI_CIL_MIPI_CAL_STARTCAL                      BIT(31)
> > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_A             BIT(30)
> > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_B             BIT(30)
> > > +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)          (((n) & 0xf) <<=
 26)
> > > +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)           (((n) & 0x3) <<=
 24)
> > > +#define       CSI_CIL_MIPI_CAL_SEL_A                 BIT(21)
> > > +#define       CSI_CIL_MIPI_CAL_SEL_B                 BIT(21)
> > > +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)             (((n) & 0x1f) <=
< 16)
> > > +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)             (((n) & 0x1f) <=
< 8)
> > > +#define       CSI_CIL_MIPI_CAL_TERMOS(n)             (((n) & 0x1f))
> > > +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS                        0x00b0
> > > +#define TEGRA_CSI_CLKEN_OVERRIDE                     0x00b4
> > > +#define TEGRA_CSI_DEBUG_CONTROL                              0x00b8
> > > +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED     BIT(0)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0                BIT(4)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1                BIT(5)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2                BIT(6)
> > > +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)    ((v) << (8 + 8 =
* (n)))
> > > +#define TEGRA_CSI_DEBUG_COUNTER(n)                   (0x00bc + (n) *=
 4)
> > > +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)     (0x00c8 + (n) *=
 4)
> > > +#define       CSI_PP_EXP_FRAME_HEIGHT(n)             (((n) & 0x1fff)=
 << 16)
> > > +#define       CSI_PP_MAX_CLOCKS(n)                   (((n) & 0xfff) =
<< 4)
> > > +#define       CSI_PP_LINE_TIMEOUT_ENABLE             BIT(0)
> > > +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG                        0x00d0
> > > +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG                        0x00d4
> > > +#define       CSI_PAD_DRIV_DN_REF(n)                 (((n) & 0x7) <<=
 16)
> > > +#define       CSI_PAD_DRIV_UP_REF(n)                 (((n) & 0x7) <<=
 8)
> > > +#define       CSI_PAD_TERM_REF(n)                    (((n) & 0x7) <<=
 0)
> > > +#define TEGRA_CSI_CSI_CILA_STATUS                    0x00d8
> > > +#define TEGRA_CSI_CSI_CILB_STATUS                    0x00dc
> > > +
> > >  /* -----------------------------------------------------------------=
---------
> > > - * VI
> > > + * Read and Write helpers
> > >   */
> > >
> > >  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned=
 int addr, u32 val)
> > > @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_cha=
nnel *chan, unsigned int addr, u
> > >       writel(val, chan->vi->iomem + addr);
> > >  }
> > >
> > > +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *c=
han, unsigned int addr)
> > > +{
> > > +     return readl(chan->vi->iomem + addr);
> > > +}
> > > +
> > > +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, un=
signed int addr, u32 val)
> > > +{
> > > +     writel(val, csi_chan->csi->iomem + addr);
> > > +}
> > > +
> > > +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel =
*csi_chan, unsigned int addr)
> > > +{
> > > +     return readl(csi_chan->csi->iomem + addr);
> > > +}
> > > +
> > > +static void tegra20_mipi_write(struct tegra_mipi_device *mipi, unsig=
ned int addr, u32 val)
> > > +{
> > > +     writel(val, mipi->csi->iomem + addr);
> > > +}
> > > +
> > > +static int __maybe_unused tegra20_mipi_read(struct tegra_mipi_device=
 *mipi, unsigned int addr)
> > > +{
> > > +     return readl(mipi->csi->iomem + addr);
> > > +}
> > > +
> > > +/* -----------------------------------------------------------------=
---------
> > > + * VI
> > > + */
> > > +
> > >  /*
> > >   * Get the main input format (YUV/RGB...) and the YUV variant as val=
ues to
> > >   * be written into registers for the current VI input mbus code.
> > > @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *v=
i, bool on)
> > >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channe=
l *chan)
> > >  {
> > >       struct tegra_vi *vi =3D chan->vi;
> > > -     struct host1x_syncpt *out_sp;
> > > +     struct host1x_syncpt *out_sp, *fs_sp;
> > >
> > >       out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLI=
ENT_MANAGED);
> > >       if (!out_sp)
> > > -             return dev_err_probe(vi->dev, -ENOMEM, "failed to reque=
st syncpoint\n");
> > > +             return dev_err_probe(vi->dev, -EBUSY, "failed to reques=
t mw ack syncpoint\n");
> > >
> > >       chan->mw_ack_sp[0] =3D out_sp;
> > >
> > > +     fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIE=
NT_MANAGED);
> > > +     if (!fs_sp)
> > > +             return dev_err_probe(vi->dev, -EBUSY, "failed to reques=
t frame start syncpoint\n");
> > > +
> > > +     chan->frame_start_sp[0] =3D fs_sp;
> > > +
> > >       return 0;
> > >  }
> > >
> > >  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_chann=
el *chan)
> > >  {
> > >       host1x_syncpt_put(chan->mw_ack_sp[0]);
> > > +     host1x_syncpt_put(chan->frame_start_sp[0]);
> > >  }
> > >
> > >  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned =
int bpp)
> > > @@ -417,41 +564,68 @@ static void tegra20_channel_vi_buffer_setup(str=
uct tegra_vi_channel *chan,
> > >  }
> > >
> > >  static int tegra20_channel_capture_frame(struct tegra_vi_channel *ch=
an,
> > > -                                      struct tegra_channel_buffer *b=
uf)
> > > +                                      struct tegra_channel_buffer *b=
uf,
> > > +                                      struct tegra_csi_channel *csi_=
chan)
> > >  {
> > >       int err;
> > >
> > > -     chan->next_out_sp_idx++;
> > > -
> > >       tegra20_channel_vi_buffer_setup(chan, buf);
> > >
> > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTR=
OL_VIP_ENABLE);
> > > +     if (csi_chan) {
> > > +             u32 port =3D csi_chan->csi_port_nums[0] & 1;
> > > +
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_C=
OMMAND(port),
> > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                               CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> > > +
> > > +             err =3D host1x_syncpt_wait(chan->frame_start_sp[0], cha=
n->next_fs_sp_value + 1,
> > > +                                      TEGRA_VI_SYNCPT_WAIT_TIMEOUT, =
NULL);
> > > +             if (err) {
> > > +                     if (err !=3D -ERESTARTSYS)
> > > +                             dev_err_ratelimited(&chan->video.dev,
> > > +                                                 "frame start syncpt=
 timeout: %d\n", err);
> > > +             } else {
> > > +                     chan->next_fs_sp_value++;
> > > +             }
> >
> > Did you try the idea about resetting the HW and re-checking the syncpoi=
nt value to avoid race conditions?
> >
> > > +
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_C=
OMMAND(port),
> > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                               CSI_PP_DISABLE);
> > > +     } else {
> > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAME=
RA_CONTROL_VIP_ENABLE);
> > > +     }
> > >
> > > -     /* Wait for syncpt counter to reach frame start event threshold=
 */
> > > +     chan->next_out_sp_idx++;
> > >       err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_s=
p_idx,
> > >                                TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> > >       if (err) {
> > >               host1x_syncpt_incr(chan->mw_ack_sp[0]);
> > > -             dev_err_ratelimited(&chan->video.dev, "frame start sync=
pt timeout: %d\n", err);
> > > -             release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> > > -             return err;
> > > +             if (err !=3D -ERESTARTSYS)
> > > +                     dev_err_ratelimited(&chan->video.dev, "mw ack s=
yncpt timeout: %d\n", err);
> > >       }
> > >
> > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > -                      VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CON=
TROL_VIP_ENABLE);
> > > +     if (!csi_chan)
> > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > +                              VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CA=
MERA_CONTROL_VIP_ENABLE);
> > >
> > >       release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> > >
> > > -     return 0;
> > > +     return err;
> > >  }
> > >
> > >  static int tegra20_chan_capture_kthread_start(void *data)
> > >  {
> > >       struct tegra_vi_channel *chan =3D data;
> > >       struct tegra_channel_buffer *buf;
> > > +     struct v4l2_subdev *csi_subdev =3D NULL;
> > > +     struct tegra_csi_channel *csi_chan =3D NULL;
> > >       unsigned int retries =3D 0;
> > >       int err =3D 0;
> > >
> > > +     csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> > > +     if (csi_subdev)
> > > +             csi_chan =3D to_csi_chan(csi_subdev);
> > > +
> > >       while (1) {
> > >               /*
> > >                * Source is not streaming if error is non-zero.
> > > @@ -476,7 +650,7 @@ static int tegra20_chan_capture_kthread_start(voi=
d *data)
> > >               list_del_init(&buf->queue);
> > >               spin_unlock(&chan->start_lock);
> > >
> > > -             err =3D tegra20_channel_capture_frame(chan, buf);
> > > +             err =3D tegra20_channel_capture_frame(chan, buf, csi_ch=
an);
> > >               if (!err) {
> > >                       retries =3D 0;
> > >                       continue;
> > > @@ -503,28 +677,6 @@ static void tegra20_camera_capture_setup(struct =
tegra_vi_channel *chan)
> > >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IM=
AGE_DT_RAW8 ||
> > >                                           data_type =3D=3D TEGRA_IMAG=
E_DT_RAW10) ?
> > >                                           TEGRA_VI_OUT_2 : TEGRA_VI_O=
UT_1;
> > > -     int main_output_format;
> > > -     int yuv_output_format;
> > > -
> > > -     tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_o=
utput_format);
> > > -
> > > -     /*
> > > -      * Set up low pass filter.  Use 0x240 for chromaticity and 0x24=
0
> > > -      * for luminance, which is the default and means not to touch
> > > -      * anything.
> > > -      */
> > > -     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > -                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > -                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > -
> > > -     /* Set up raise-on-edge, so we get an interrupt on end of frame=
. */
> > > -     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > > -
> > > -     tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channe=
l),
> > > -                      (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > -                      (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > -                      yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORM=
AT_SFT |
> > > -                      main_output_format << VI_OUTPUT_OUTPUT_FORMAT_=
SFT);
> > >
> > >       /* Set up frame size */
> > >       tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channe=
l),
> > > @@ -555,18 +707,31 @@ static int tegra20_vi_start_streaming(struct vb=
2_queue *vq, u32 count)
> > >       struct media_pipeline *pipe =3D &chan->video.pipe;
> > >       int err;
> > >
> > > +     chan->next_fs_sp_value =3D host1x_syncpt_read(chan->frame_start=
_sp[0]);
> > >       chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]=
);
> > >
> > >       err =3D video_device_pipeline_start(&chan->video, pipe);
> > >       if (err)
> > >               goto error_pipeline_start;
> > >
> > > -     tegra20_camera_capture_setup(chan);
> > > +     /*
> > > +      * Set up low pass filter.  Use 0x240 for chromaticity and 0x24=
0
> > > +      * for luminance, which is the default and means not to touch
> > > +      * anything.
> > > +      */
> > > +     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > +                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > +                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > +
> > > +     /* Set up raise-on-edge, so we get an interrupt on end of frame=
. */
> > > +     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > >
> > >       err =3D tegra_channel_set_stream(chan, true);
> > >       if (err)
> > >               goto error_set_stream;
> > >
> > > +     tegra20_camera_capture_setup(chan);
> > > +
> > >       chan->sequence =3D 0;
> > >
> > >       chan->kthread_start_capture =3D kthread_run(tegra20_chan_captur=
e_kthread_start,
> > > @@ -658,6 +823,348 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> > >       .has_h_v_flip =3D true,
> > >  };
> > >
> > > +/* -----------------------------------------------------------------=
---------
> > > + * MIPI Calibration
> > > + */
> > > +static int tegra20_start_pad_calibration(struct tegra_mipi_device *m=
ipi)
> > > +{
> > > +     struct tegra_csi *csi =3D mipi->csi;
> > > +     unsigned int port =3D mipi->pads;
> > > +     u32 value;
> > > +     int ret;
> > > +
> > > +     guard(mutex)(&csi->mipi_lock);
> > > +
> > > +     ret =3D pm_runtime_resume_and_get(csi->dev);
> > > +     if (ret < 0) {
> > > +             dev_err(csi->dev, "failed to get runtime PM: %d\n", ret=
);
> > > +             return ret;
> > > +     }
> > > +
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> > > +                        CSI_CIL_MIPI_CAL_HSPDOS(4) |
> > > +                        CSI_CIL_MIPI_CAL_HSPUOS(3) |
> > > +                        CSI_CIL_MIPI_CAL_TERMOS(0));
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> > > +                        CSI_PAD_DRIV_DN_REF(5) |
> > > +                        CSI_PAD_DRIV_UP_REF(7) |
> > > +                        CSI_PAD_TERM_REF(0));
> > > +
> > > +     /* CSI B */
> > > +     value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > +
> > > +     if (port =3D=3D PORT_B)
> > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> > > +
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value)=
;
> > > +
> > > +     /* CSI A */
> > > +     value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> > > +             CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > +             CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > +             CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > +
> > > +     if (port =3D=3D PORT_A)
> > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> > > +
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value)=
;
> > > +
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *=
mipi)
> > > +{
> > > +     struct tegra_csi *csi =3D mipi->csi;
> > > +     void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL=
_STATUS;
> > > +     unsigned int port =3D mipi->pads;
> > > +     u32 value, pp, cil;
> > > +     int ret;
> > > +
> > > +     /* This part is only for CSI */
> > > +     if (port > PORT_B) {
> > > +             pm_runtime_put(csi->dev);
> > > +
> > > +             return 0;
> > > +     }
> > > +
> > > +     guard(mutex)(&csi->mipi_lock);
> > > +
> > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > +                                      value & CSI_MIPI_AUTO_CAL_DONE=
, 50, 250000);
> > > +     if (ret < 0) {
> > > +             dev_warn(csi->dev, "MIPI calibration timeout!\n");
> > > +             goto exit;
> > > +     }
> > > +
> > > +     /* clear status */
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > +                                      !(value & CSI_MIPI_AUTO_CAL_DO=
NE), 50, 250000);
> > > +     if (ret < 0) {
> > > +             dev_warn(csi->dev, "MIPI calibration status timeout!\n"=
);
> > > +             goto exit;
> > > +     }
> > > +
> > > +     pp =3D tegra20_mipi_read(mipi, TEGRA_CSI_CSI_PIXEL_PARSER_STATU=
S);
> > > +     cil =3D tegra20_mipi_read(mipi, TEGRA_CSI_CSI_CIL_STATUS);
> > > +     if (pp | cil) {
> > > +             dev_warn(csi->dev, "Calibration status not been cleared=
!\n");
> > > +             ret =3D -EINVAL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +exit:
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> > > +
> > > +     /* un-select to avoid interference with DSI */
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> > > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > > +
> > > +     tegra20_mipi_write(mipi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> > > +                        CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > +                        CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > +                        CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +                        CSI_CIL_MIPI_CAL_TERMOS(4));
> > > +
> > > +     pm_runtime_put(csi->dev);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> > > +     .tegra_mipi_start_calibration =3D tegra20_start_pad_calibration=
,
> > > +     .tegra_mipi_finish_calibration =3D tegra20_finish_pad_calibrati=
on,
> > > +};
> >
> > This patch is very long, maybe split the MIPI calibration into a separa=
te patch to make it easier to read.
> >
>=20
> I would love to, but MIPI calibration is integrated part of CSI. I
> cannot add it before CSI support since CSI soc structure includes MIPI
> operations, I might try adding it after but it will look irrational
> because CSI is not gonna work without MIPI calibration.

Ok, no problem then.

>=20
> > > +
> > > +/* -----------------------------------------------------------------=
---------
> > > + * CSI
> > > + */
> > > +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_=
chan)
> > > +{
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, =
0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL=
, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, =
0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUP=
T_MASK, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> > > +}
> > > +
> > > +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel=
 *csi_chan,
> > > +                                         u8 portno)
> > > +{
> > > +     struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&=
csi_chan->subdev);
> > > +     int width  =3D vi_chan->format.width;
> > > +     int height =3D vi_chan->format.height;
> > > +     u32 data_type =3D vi_chan->fmtinfo->img_dt;
> > > +     u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> > > +     enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> > > +
> > > +     unsigned int main_output_format, yuv_output_format;
> > > +     unsigned int port =3D portno & 1;
> > > +     u32 value;
> > > +
> > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yu=
v_output_format);
> > > +
> > > +     switch (data_type) {
> > > +     case TEGRA_IMAGE_DT_RAW8:
> > > +     case TEGRA_IMAGE_DT_RAW10:
> > > +             output_channel =3D TEGRA_VI_OUT_2;
> > > +             if (port =3D=3D PORT_A)
> > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_=
CSI_PPA_BAYER;
> > > +             else
> > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_=
CSI_PPB_BAYER;
> > > +             break;
> > > +     }
> > > +
> > > +     tegra20_csi_capture_clean(csi_chan);
> > > +
> > > +     /* CSI port cleanup */
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port=
), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(por=
t), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(por=
t), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(p=
ort), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRA=
ME(port), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0)=
;
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0)=
;
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + po=
rt)); /* CSI_PP_YUV422 */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 +=
 port)); /* CSI_PP */
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 +=
 port)); /* CSI_PP */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width=
 << 16);
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), heigh=
t << 16);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(por=
t), 0x1);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(p=
ort), word_count);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> > > +                       CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks be=
tween frames */
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRA=
ME(port),
> > > +                       CSI_PP_EXP_FRAME_HEIGHT(height) |
> > > +                       CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi c=
lks for timeout */
> > > +                       CSI_PP_LINE_TIMEOUT_ENABLE);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(por=
t),
> > > +                       CSI_PP_OUTPUT_FORMAT_PIXEL |
> > > +                       CSI_PP_DATA_TYPE(data_type) |
> > > +                       CSI_PP_CRC_CHECK_ENABLE |
> > > +                       CSI_PP_WORD_COUNT_HEADER |
> > > +                       CSI_PP_DATA_IDENTIFIER_ENABLE |
> > > +                       CSI_PP_PACKET_HEADER_SENT |
> > > +                       port);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port=
),
> > > +                       CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> > > +                       (csi_chan->numlanes - 1));
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> > > +                       CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> > > +                       0x5); /* Clock settle time */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_STA=
RT(port),
> > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > +                      host1x_syncpt_id(vi_chan->frame_start_sp[0])
> > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_chann=
el),
> > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > +                      host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > +
> > > +     value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_P=
HY_CIL_DISABLE :
> > > +             CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort),
> > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                       CSI_PP_DISABLE);
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_cha=
nnel),
> > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > +                      yuv_output_format | main_output_format);
> > > +
> > > +     return 0;
> > > +};
> > > +
> > > +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel=
 *csi_chan, u8 portno)
> > > +{
> > > +     struct tegra_csi *csi =3D csi_chan->csi;
> > > +     unsigned int port =3D portno & 1;
> > > +     u32 value;
> > > +
> > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER=
_STATUS);
> > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n",=
 value);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, =
value);
> > > +
> > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort),
> > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                       CSI_PP_DISABLE);
> > > +
> > > +     if (csi_chan->numlanes =3D=3D 4) {
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> > > +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_DISABLE);
> > > +     } else {
> > > +             value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE =
| CSI_B_PHY_CIL_NOP :
> > > +                     CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, =
value);
> > > +     }
> > > +}
> > > +
> > > +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > +     int ret, i;
> > > +
> > > +     for (i =3D 0; i < csi_chan->numgangports; i++) {
> > > +             ret =3D tegra20_csi_port_start_streaming(csi_chan, port=
nos[i]);
> > > +             if (ret)
> > > +                     goto stream_start_fail;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +stream_start_fail:
> > > +     for (i =3D i - 1; i >=3D 0; i--)
> > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > +     int i;
> > > +
> > > +     for (i =3D 0; i < csi_chan->numgangports; i++)
> > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > > +}
> > > +
> > > +/* Tegra20 CSI operations */
> >
> > These comments don't add much.
> >
> > Thanks,
> > Mikko
> >
> > > +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> > > +     .csi_start_streaming =3D tegra20_csi_start_streaming,
> > > +     .csi_stop_streaming =3D tegra20_csi_stop_streaming,
> > > +};
> > > +
> > > +static const char * const tegra20_csi_clks[] =3D {
> > > +     NULL,
> > > +};
> > > +
> > > +/* Tegra20 CSI SoC data */
> > > +const struct tegra_csi_soc tegra20_csi_soc =3D {
> > > +     .ops =3D &tegra20_csi_ops,
> > > +     .mipi_ops =3D &tegra20_mipi_ops,
> > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > +     .clk_names =3D tegra20_csi_clks,
> > > +     .num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> > > +};
> > > +
> > > +static const char * const tegra30_csi_clks[] =3D {
> > > +     "csi",
> > > +     "csia-pad",
> > > +     "csib-pad",
> > > +};
> > > +
> > > +/* Tegra30 CSI SoC data */
> > > +const struct tegra_csi_soc tegra30_csi_soc =3D {
> > > +     .ops =3D &tegra20_csi_ops,
> > > +     .mipi_ops =3D &tegra20_mipi_ops,
> > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > +     .clk_names =3D tegra30_csi_clks,
> > > +     .num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> > > +};
> > > +
> > >  /* -----------------------------------------------------------------=
---------
> > >   * VIP
> > >   */
> > > @@ -677,10 +1184,11 @@ static int tegra20_vip_start_streaming(struct =
tegra_vip_channel *vip_chan)
> > >       enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IM=
AGE_DT_RAW8 ||
> > >                                           data_type =3D=3D TEGRA_IMAG=
E_DT_RAW10) ?
> > >                                           TEGRA_VI_OUT_2 : TEGRA_VI_O=
UT_1;
> > > -     unsigned int main_input_format;
> > > -     unsigned int yuv_input_format;
> > > +     unsigned int main_input_format, yuv_input_format;
> > > +     unsigned int main_output_format, yuv_output_format;
> > >
> > >       tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_=
input_format);
> > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yu=
v_output_format);
> > >
> > >       tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> > >
> > > @@ -713,6 +1221,11 @@ static int tegra20_vip_start_streaming(struct t=
egra_vip_channel *vip_chan)
> > >
> > >       tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CO=
NTROL_STOP_CAPTURE);
> > >
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_cha=
nnel),
> > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > +                       yuv_output_format | main_output_format);
> > > +
> > >       return 0;
> > >  }
> > >
> > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging=
/media/tegra-video/vi.h
> > > index 367667adf745..648dde82a14b 100644
> > > --- a/drivers/staging/media/tegra-video/vi.h
> > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > @@ -124,6 +124,7 @@ struct tegra_vi {
> > >   *           frame through host1x syncpoint counters (On Tegra20 use=
d for the
> > >   *              OUT_1 syncpt)
> > >   * @sp_incr_lock: protects cpu syncpoint increment.
> > > + * @next_fs_sp_idx: next expected value for frame_start_sp[0] (Tegra=
20)
> > >   * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_=
1 (Tegra20)
> > >   *
> > >   * @kthread_start_capture: kthread to start capture of single frame =
when
> > > @@ -188,6 +189,7 @@ struct tegra_vi_channel {
> > >       /* protects the cpu syncpoint increment */
> > >       spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> > >       u32 next_out_sp_idx;
> > > +     u32 next_fs_sp_value;
> > >
> > >       struct task_struct *kthread_start_capture;
> > >       wait_queue_head_t start_wait;
> > > diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/stag=
ing/media/tegra-video/video.c
> > > index 6fe8d5301b9c..9f2bddc460bf 100644
> > > --- a/drivers/staging/media/tegra-video/video.c
> > > +++ b/drivers/staging/media/tegra-video/video.c
> > > @@ -127,6 +127,12 @@ static const struct of_device_id host1x_video_su=
bdevs[] =3D {
> > >       { .compatible =3D "nvidia,tegra20-vip", },
> > >       { .compatible =3D "nvidia,tegra20-vi", },
> > >  #endif
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +     { .compatible =3D "nvidia,tegra20-csi", },
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +     { .compatible =3D "nvidia,tegra30-csi", },
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >       { .compatible =3D "nvidia,tegra210-csi", },
> > >       { .compatible =3D "nvidia,tegra210-vi", },
> > >
> >
> >
> >
> >




