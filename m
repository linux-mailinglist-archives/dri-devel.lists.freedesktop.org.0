Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD082B0E860
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 03:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A61910E0AD;
	Wed, 23 Jul 2025 01:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gqZ3pOMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80FA10E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 01:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdd15UINhQn5uXst1ZE6fqkPCz65QwPag7EnvCtAtbzKgVqymVfW5LTXBbsqeDA1mOJ+7il23w2sC5F7mshwKHwZZ/3OCbAgzkrnezCENwcGgQuJSjt0ez+Ir34uj2YsrCUCL2mB1xzVbNmyD2miiGb03ZnEqzdAQB/av++s3s7pp4FUhlpkcrJJYTPdHAaYOKBs2vbiwFVXP0T6cstZJgmdHCFqa/8GkrN68w6rq62E4viyYWSC4IDAJGAhsL7kQye1hN+5UvDPZi+IxHEGenLqzmir0J9W9gRX+J9iJ9Nk2YvEoMZKbvfeHoM2Oi3m8Y6Xt0ctidAeChWBlyTUHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyoGy40PzhQOoQRX+tkq05QEpPLmhF4JjRxCq7ml1Uk=;
 b=UXCEedUbZPW/oVGq+9DzILsS5xVBc93zePeh6cOFBGNus6WuGjM5pIZtRyuL538S4PAPsuHXPjlhX4iwbXa1qJghmaAE2+tUxNmXU6KcVP1IntwKh8OdqZ96mZm+yDHbPpUMv8u51hTJUUcwI43BBi40de0hSrxPRGI+j4o6fBr9X1clQI+JJBo3hvTXsB4IinDcLQcB/D78UxZJ1PB2szkTvgvUsWCoLbnF60y+jsLJChUOwU9K8gKbdTv/Ezwrxf2D+il4Smwwt25CwK8luKA0ImEJ9zYksrkag1ATpvxKJXGQqrBchQJmwOqBOn7mMDxjDuez9Nw+8FFpheXyQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyoGy40PzhQOoQRX+tkq05QEpPLmhF4JjRxCq7ml1Uk=;
 b=gqZ3pOMZhLlkCVva3AMKeRb6ZFkl+PhNBjZsTuGlfMm7ajJchhnnHqYuD4eqkdsJaNRSVC4hvUbo6e2kSdRJY7dnFP37/iExrRKouMNQYUdEXu3D56sGFR+zoLWa9ycFkRzQr7SyKhQQcJDLfFKPV87QowJUgIGtxQo6sstfkIu9+lR02OeZsyDqNYvPFvLmqOY7Sm8qKaDySOydY62FIQMhj4KJk/cgDviPne2FFVZJIwopeUfuXDrqRhGVKiXLWHd8BP/QkuMOoxesMufqSlanbNLg9IoHlBx5DkWeHFtMuAGfW9BKxh8KyO9t7TnaJMPIcB9N3W+78fkJ/bc6aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by CH3PR12MB9079.namprd12.prod.outlook.com (2603:10b6:610:1a1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 01:57:43 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 01:57:43 +0000
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
Date: Wed, 23 Jul 2025 10:57:38 +0900
Message-ID: <4377642.OBFZWjSADL@senjougahara>
In-Reply-To: <CAPVz0n1f=bAHqZiF3yMGS2T5Bg6C=CbJbLCGQMGfiAqK1YVzFg@mail.gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <26197475.6Emhk5qWAg@senjougahara>
 <CAPVz0n1f=bAHqZiF3yMGS2T5Bg6C=CbJbLCGQMGfiAqK1YVzFg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR04CA0206.apcprd04.prod.outlook.com
 (2603:1096:4:187::21) To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|CH3PR12MB9079:EE_
X-MS-Office365-Filtering-Correlation-Id: 41580416-ab64-4660-2879-08ddc98c500d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1BVdkFaLzdaWVJMWHhJVkVvWTB1Y0lsbmVDOG9CRU1HLytFNy9uek5OWk41?=
 =?utf-8?B?NFkxa2VFNXpmOXN3TUtDRU8xT2JQbFVkaW5UOVBRSWNJbjhRak5NUnBnTjRp?=
 =?utf-8?B?eVB6QjRWa1c3c1ZZcUJUbXdTNjBwN0NQM0NabVc0eE90akowWWpJNjNVaHgv?=
 =?utf-8?B?TUJBZDFJN3VMdWZIbXpXRnVvdXZTR1QxTlQrUzBncUd4Z3ZxSWtEamhsdGZR?=
 =?utf-8?B?Z2ZCMUhKMFo0R3hTblFoY3dCeG04R1NNOUlPVjh1REhReXpvOWpRSlpuZ29W?=
 =?utf-8?B?WW9pdjk1dXhkS3EvUnRFek04VzFqRTVxV0cxSnVJQ2tqbXE3a2pxK2RyMXIv?=
 =?utf-8?B?SGprcEt1UXA2NHN3NjFLL2pWcUlGc0wwVzZRSWptN3ZpWEFITEM4SGJoWmw2?=
 =?utf-8?B?ZDFkbllOdlBFdjAxTjRabkJqMEJlR0V1RUN1Y2dSdTZHT1N6WUUycWRQYjV3?=
 =?utf-8?B?WGhmZkpXV0xpekNNdGxhZkJFalY5M0pkSXpMcng4SWpGRnNFN3QwUU44OXlR?=
 =?utf-8?B?SDMyTktoYWRGd1ZXUW9PSXhtV2JzMEFOK1REdDRFU0xlNmxiMTB5SHVCYlJx?=
 =?utf-8?B?bHhpbXhWalUvL1ljbUJqaWlXRWZobTZOSzdyaTZid2FmdElTQXRLdElVV0tQ?=
 =?utf-8?B?YmhNSURTb1ZvYlU2Y2RyWkhSdms4S0lHMVU5R2k5b1Z2d2kwenU5cFMzR3RM?=
 =?utf-8?B?Q0NBQkZqS2NyU2l1SHA4QmRVNlc2SjBXVHpwSUpOOURPQlJIYU5LQ29QYzE5?=
 =?utf-8?B?R2dvSTFZUEhQTHQ0b3h5TEVQektXSG00UTdiWE10RUNEOVJub1pka2oxbjVm?=
 =?utf-8?B?cURGOE96ZzNjSy9sM0dQd1laVk56K2dOMjZlMFZtYzZnM0RTZW81QzlNRWpN?=
 =?utf-8?B?cUg3UEhXTFh4TzdqTE9rcjZGUFNyNGF4bk9FNDh6cmx0KzF2UkhRUlJncjFY?=
 =?utf-8?B?T29TeXM0YkVHZlY3UVYxNFY5dlgrdTVranBYUzdpa1Q2L0VnRDJKYUdCWVVG?=
 =?utf-8?B?TDJLZHVMZ1FpQkJ2S0E0ZTYxY2R3QnE2WE9QdmJDb1FJdFJFbER6aDMxV2J6?=
 =?utf-8?B?K2ZrZllYclhhSDk4S3R4QUJIck5TNjRFUmVyYnBwVExwMGNDVnhpVVdxMXN6?=
 =?utf-8?B?OE1yWFVrMzBzYlNPNUtUSjZkeUkyaU1aUkMwN3Y5RjhSekQ1TS9KWm1jT0lZ?=
 =?utf-8?B?RUw3a1p6SFJUV3FQbVMzU2hHOE81VWh4MFNMNWhhNmExU05PSWFaaFFYY1dh?=
 =?utf-8?B?bUkxZXRuSFltTkgwOU56TU1WQURRY29GdU5WRUdLd3ZLaW5ieDE0K3FXc2VL?=
 =?utf-8?B?dEpRVUxzZnRVT0g5bnZyZ0RvTDJXNm9vcGswVExnaStHK2Q2MHBLUDhKVnZD?=
 =?utf-8?B?MEY2Q0ZSdU11QjRwNEpQNTIrbFcxQkUvK0tUc1NUazZmYVVGMUFJcjBtQXdV?=
 =?utf-8?B?YVJKUVpackdPYkVGNWtmTGlqYzJadEQxdWprcmtFd0ZUVTFQa1FiNjBub0VC?=
 =?utf-8?B?bzhZK05ZZHBRMkk1Y29xMmtqY2h0U2NVa3BuWlNMUVRtckw5b05VeTZUMVEz?=
 =?utf-8?B?VlJPUDlYWjdYSFhteU43MVhidkllSmRYMXYycWtibitxMzd1akNqMjBTeDFw?=
 =?utf-8?B?UmE4bC9XZFJXcHVlU0R6UDhzNjF0ZitwMDlNeVpWU3cxVmVKbUtFNG00UUpY?=
 =?utf-8?B?NDE2THdzMFJsZUZEa3o4dndUY244VU8vM0xhWnREN1V4UFF6bnBScmRITGw3?=
 =?utf-8?B?K0R1dlhMd085T0ZtU1V1N0xrR1dHYlBvYjRtZGdBZXlpREhtSFJ3UzEzZmpS?=
 =?utf-8?B?YWt6RzhJbzl2MjVvcFRmS1FiQjZ2dnd6RGxqSEtjT2NScnc3SHkrV2ZCcjNw?=
 =?utf-8?B?d01aM0pLVWsyUVgwcE9WUzBwMUV4MDl1Q0U3cm5pN1lja0hFemJmVTNPRVpC?=
 =?utf-8?Q?2ShODjmoWaY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVVSdFhaSEc0emQwTm1zVWhUbU95UG8vbGJFVkpTTVdtRVpKYXNHNGVGaGtS?=
 =?utf-8?B?K21KK2xJc2lERCtNbkp5S3V1b0pLZWNHck4vSUdsL3pXRk1Vck4xNy93MDU0?=
 =?utf-8?B?VTV0MU9RS0Jmb3RWTDdIVlBVdmRCcm13MTRING9Jc0FtSi9NT1NHVXIrNXJt?=
 =?utf-8?B?TEc2RHcrL1IxNXM1WFJ0UytWOWF6S0xUWnBFb204dVZHMmcySmhaREZjMXpt?=
 =?utf-8?B?TVNvMERFeStnejhjY3EzQ3dLRWF4SHhNUm4xREdqeXN2bHM0ZXpibGpvQWNo?=
 =?utf-8?B?MkMvRkprMTFGdlkzQ0hOL3lxUDlFa1F1Zzh0aXlVUmhXSTczYlBIWFhCT3NL?=
 =?utf-8?B?VHZDVGpocVBCeWU0UGExbkxXWHFlck1ER2ZlUEgzQ1ZHUXJQZ0V0ejBaMlJV?=
 =?utf-8?B?ek5kZS9TMXVtTUhtcmZRUW1wZkIvVUJHbythY2paRllpSXRKUUNkc3pqSVBv?=
 =?utf-8?B?U1hKMW9YSDdoQm5MWWhkUFRQU3lLcWtMNFQvNlc5emp0RGhrcmJZckdVTGc1?=
 =?utf-8?B?blFrTjZkMFcycWtxRUthZ0cxdzIxMm5yUGtNanpJL0NnZlJua29QM284MWVr?=
 =?utf-8?B?SjZpMTJaVHVkNzBpVXdKQmRvTGFqbWdRZjNHeWRVdHhvSE41YlVJWi9YQSsw?=
 =?utf-8?B?SWJSQUQvYjU2TGJRRHV3dHAyRHM0K1lQYXdHc2wvcWFtT1hzR3J5Z1NSM2ha?=
 =?utf-8?B?UzFKQU51QTduQWIvMVZnWGZXdk50UkNrL3czUXhYUkh4QjU4UGExdjNtbTUz?=
 =?utf-8?B?V1Z6Z2hqbUlnS1U3NTJvY2Q2U1NHZDBySFhBNG5XeGlzZ09aQmdlcy8yVnVI?=
 =?utf-8?B?azRQUVp5UXR5YnlXTS84MVlVM0J2RS81Q09PazN4VWNTMElFVi91bU51Q3dj?=
 =?utf-8?B?ek9mcjh2V2lQT0FpVXlBYXhLbVQ4N3R0K01NNzZsVGViV2psbW5HR2Z4bjlZ?=
 =?utf-8?B?MlF2NVNpTWxtektvaDErd1kxamNrUmNRUVo3cUZYdUlUMHF1ZHZCanBzaDNL?=
 =?utf-8?B?a01LNzZQM04xYnQxT2JTMm8vblhXNW1nM0xZRVVoUlc0R3N0OC9LaE9NQk9k?=
 =?utf-8?B?L204cXpxNENEWkFtR0N6S3c2YzNMeERkT0FkVDlSc0lLNDRrMXRtc0JOdVEv?=
 =?utf-8?B?RkV5RFVtRXkrR1pYRnJ5UU5ZQzQ2Sng0Q0F3c0g4bWFjWXFBSzN0SFdMalZQ?=
 =?utf-8?B?TGsyMWJweFhHQUdUYzZBMWJlNElBV1NGamZrYUpndnRNTkNyTkxvVXpwMXBa?=
 =?utf-8?B?MThmaVQ5TCtzU3I2eTdNM3Fxd0g5dEZXRjk5bG8rWDdKc0ZIUW5LZmlScUZW?=
 =?utf-8?B?dExZYzh6ZXVRNVV5RXpkajc4ekhLY1BzRFE3V2NTdFRjTWZDcjg1ZE5jMHg3?=
 =?utf-8?B?dkVIQ1lTNm1MczdOUmtEK21nTnVXdEViWGRuY0FBaGE3SVFucDVpK2N6cmJZ?=
 =?utf-8?B?T2J3RWxBaUJjeHpPQ1p2S2JOb2Q2aVVJdUw4cmxhbGpsaTQxOU5aNUJBSnVS?=
 =?utf-8?B?Zm5wSHFQM0ZuWWkvaXRNbmdZK3N4d3Z2KzhUdjI1OUMxNDFPZ0lRZldmdm5u?=
 =?utf-8?B?d2M5cS9qZXFhTGlNQXVaM1lsbTBzWmMrbC8zaHRrT3lhVnVReFNHcExxN0hY?=
 =?utf-8?B?YWhyUGhNWGkvdE1ySDl5VlhySWcxc25obmhuc3cyTVFrYUVUakR2ZVBDL0xp?=
 =?utf-8?B?a21TM3ZGaFlXeWJqZVhESGxpeklLdFgvRGZJeGtJbWFIVzROWjZlUnc0SytE?=
 =?utf-8?B?bmJKaGRCclBCZklzeUdMcGVkaXY3M1RlVysvaWlvWmNLenloUm4zNTlaelh4?=
 =?utf-8?B?eFo2NVBjUWNCTyt0MkR2NDJ2R0Uwc2x5SWttYksxcXZTYjdqMklnVS9RZ1ZO?=
 =?utf-8?B?a1l5UWttV0V4THRTKzh4S3l4TWFrN2s3cWE0RDJwalY2ekhVZys3UG9PeDNV?=
 =?utf-8?B?aEcyNlhnMTlRbG03MWN4Vk5TeXpqMWhJSjZmYTNNTHQvWUdxS0doNXYvb1k2?=
 =?utf-8?B?cGd4cTcwSEhJYS9iRGd4NWh4OHNMYXZralBleWU3dHBFYjNmYXhvY29keVpU?=
 =?utf-8?B?VzNXZDZmWUpBR1FRSzRVa2EzNk9xMkU4QStyZlVnMHcvQW1XU3FuRnZUMU4w?=
 =?utf-8?B?TFRyNi80aGIvT2RReXJIMU5XQ21USmlLbkVranJOZ0lFVmorejZWb244ekRO?=
 =?utf-8?B?ZzhjVkdVejY5amcxMmk2WE1OanQ4RXZuKzhaZkQrQllZUW1yeElraU5BQS81?=
 =?utf-8?B?STQ5RkZ6ZkZ1amZxRXVBTGhoMVR3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41580416-ab64-4660-2879-08ddc98c500d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 01:57:43.4264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 534bT7slzZSCPpwF5KHX/rRAv26gXYjZHciQzHCIaMwB+/IjQdcjxzuTgMrWImTCPrnBDLLe5G7D5mxEluyLpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9079
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

On Friday, July 18, 2025 6:26=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:22 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Friday, July 18, 2025 6:15=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:0=
1 Mikko Perttunen <mperttunen@nvidia.com>=20
=D0=BF=D0=B8=D1=88=D0=B5:
> > > > On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > > Add MIPI calibration device node for Tegra20 and Tegra30.
> > > > >=20
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >=20
> > > > >  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
> > > > >  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
> > > > >  2 files changed, 32 insertions(+)
> > > > >=20
> > > > > diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > > b/arch/arm/boot/dts/nvidia/tegra20.dtsi index
> > > > > 92d422f83ea4..521261045cc8
> > > > > 100644
> > > > > --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > > +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> > > > > @@ -74,6 +74,16 @@ vi@54080000 {
> > > > >=20
> > > > >                       status =3D "disabled";
> > > > >              =20
> > > > >               };
> > > > >=20
> > > > > +             /* DSI MIPI calibration logic is a part of VI/CSI *=
/
> > > > > +             mipi: mipi@54080220 {
> > > > > +                     compatible =3D "nvidia,tegra20-mipi";
> > > > > +                     reg =3D <0x54080220 0x100>;
> > > > > +                     clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> > > > > +                              <&tegra_car TEGRA20_CLK_CSI>;
> > > > > +                     clock-names =3D "vi", "csi";
> > > > > +                     #nvidia,mipi-calibrate-cells =3D <1>;
> > > > > +             };
> > > > > +
> > > >=20
> > > > As you say in the comment, MIPI calibration on Tegra20/30 is part o=
f
> > > > VI/CSI. We can't add a "mipi" device here since such a device doesn=
't
> > > > exist in the hardware hierarchy. We already have the VI device in t=
he
> > > > device tree, so we need to use that.
> > >=20
> > > I understand your point, but embedding MIPI calibration logic into
> > > VI/CSI driver will bring up another lever of unnecessary complexity
> > > and excessive coding. While approach I have proposed preserves
> > > separation between CSI and DSI and reuses already existing MIPI
> > > calibration framework.
> >=20
> > We can consider different driver architectures to simplify things, but =
the
> > device tree has to conform to hardware. The host1x bus has no 'mipi'
> > device on it so we can't put one in the device tree.
>=20
> I assume then placing mipi node as CSI or VI child would resolve your
> concern?

The device tree is not intended to follow software architecture. Having a=20
separate device node implies some sort of bus / parent-child hierarchy in=20
hardware. So it seems a little difficult to justify.

In this case, it seems to me that it would be pretty easy to add/partially=
=20
copy a small VI driver while integrating with the staging driver, based on =
how=20
simple its probe function is. And given that you're planning on adding CSI=
=20
support as well, utilizing the tegra-video driver seems like it's in the ca=
rds=20
anyway.

Thanks,
Mikko

> > > > A driver for tegra20-vi already exists in
> > > > staging/drivers/media/tegra-video. We should aim not to break it.
> > > > Perhaps
> > > > bring it out of staging? (At least partially, but then why not the
> > > > whole
> > > > thing.)
> > >=20
> > > It does not break VI/CSI, I have a WIP CSI implementation for
> > > Tegra20/Tegra30 which I hope to submit soon.
> >=20
> > We have to use the tegra20-vi node as that matches hardware, and each n=
ode
> > can only be probed to one device, hence the issue.
> >=20
> > Great to see a CSI driver!
> >=20
> > Mikko
> >=20
> > > > Thanks,
> > > > Mikko




