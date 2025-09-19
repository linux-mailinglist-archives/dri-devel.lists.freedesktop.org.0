Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B109DB8806A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 08:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE6810E940;
	Fri, 19 Sep 2025 06:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mJkggemw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011067.outbound.protection.outlook.com [52.101.57.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4861C10E94A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 06:47:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjfSP+aQNwjfPtAjR8o6eQ9XAcS2QD7yiELQ2FwdTIEwp4DGyx3RdNd8QRArWmcO2dIyrDY5olY/hqj4QGeFT8Z9o5KeeXNqBvhLCqFdr99+DAicI0OMcAjAEXNH8oeCLmeeZBt5X8umngq+g7xNgi7jmD+gErlPDZ1p5zLtfy28/hTE6BMSyFkmDR/1zsmCJT3ZN9XBu6OhwgagreWz+muO3cmE4TvhYO6jsyvh9EfNDdZBbm/DbBRQ6McT1uLhJ+ZF9UkZ64hkmjJ/3OcqkHuZmlpHyGuo0+NQKi+mB1q97NpkOSvJj6KKtmYYz4d4Z/OXNZ4Ez7Ocfa1/+bG9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNp9lMieMP9ZKlnjqKYaajewulwcZAQ2KZrlI3M0+z8=;
 b=OHFNIP5JeqMMjXgbNhNmTqxWlES54kJv3XWQqb9ePowe0jHoiUYX8cuaCJ3g77yWwFkgH+DiTMRP9NELWyLq5lwnHIsXVgpZC63cqrgbTsbavzegbTh4s3umZm+nQ32+lW2WhRfih4oicb+5P8l9CnuRdf9/YwODnAiKYGC2M+mZB3caPNcdmggNc8sXuHupfws+LMbAbpLCXgubycfwQg48P+WT+RW/RkrSCBVKh5gsqmGWp5a3NFMtKjmR1BgqO96NqXMkqypj7uNlRzBo8bbByCZ5QzrnMFbA7zGJPSEHwgcBQdbcOn0IXD+gwopQC7bYrebm5pqr9JxnH/Er1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNp9lMieMP9ZKlnjqKYaajewulwcZAQ2KZrlI3M0+z8=;
 b=mJkggemwzkBzTzpxWOkTDX1lEgO70uod+CMsfxRyyuvuzeAitFBHxDKntzKNgpy78dmWJJgLojO6GSjaNyK+hDbDoOfR3bgoLUsarZxC9A9NGISlzz7oGDdj7c0vLghoIWcsxcCAVvolme3ANLoOtNWFN+QqjeGUXvyX7f1iqzmlZqEp4knrFFQdx2FL6y48R1kxvQJKz4ebMhAjGv1we4PIZqn0foENYB5X7rotSk1TzDyHNFHWAIkv/lRz5CbXssq+7l3+Z3N6P7qKIzB5GaAD4cfnp46JTZvFl662sgoNIgDQlEpm8ATy4le2y0Wz9TMD5LjV1IdJ8oxjv0Eh3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ2PR12MB8691.namprd12.prod.outlook.com (2603:10b6:a03:541::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 06:47:40 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 06:47:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 09/23] gpu: host1x: convert MIPI to use operations
Date: Fri, 19 Sep 2025 15:47:37 +0900
Message-ID: <4792993.1IzOArtZ34@senjougahara>
In-Reply-To: <20250906135345.241229-10-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-10-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0133.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ2PR12MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: eee20b47-18c9-4cef-6af4-08ddf7486d8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|10070799003|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2RndXpGUkpSSDZZTnA2RnZKN3VUM282aEF3RWxneU1oQUlxdUZYdlhyWkp1?=
 =?utf-8?B?THQ4dEpJQkJOY3hEN0tCM3ROa3pSOUp2L2VkMlhBbDd5ci9CanlBVGlMUTJF?=
 =?utf-8?B?UkhRUVY3UEs3RW54d3Y4bWNVS3NiM0dIeGJETEdRTVp5WlB6Ly9USFN1MHVm?=
 =?utf-8?B?c1dyZlI1WkRVMkU2OUVsd1lscUt2aE4wVTFqaUl1TmN2NERoRVdLR253ZkY5?=
 =?utf-8?B?VmkxdzN3di9QbVlDcjVlaW5CeExBMWZHRk03SURMM0VGUy85cTVQMFNLSDN2?=
 =?utf-8?B?c3BrWUR0ejBYQk5pZmZJR083MElka1htcGFsTkhvVjdRK3FncEhLZWxkb0dz?=
 =?utf-8?B?aWsvU3hob3hFWXZUdUEzOVNzT1NVeUZjSEU4VHQyczhBeWdPU0dsNXBWanhx?=
 =?utf-8?B?dEtXYWJmem9ZZFQvUUtrVUtPcDZIS3FIek1iWEI1b24zZG5UL1hDUWN5c21X?=
 =?utf-8?B?OENsOVRvS2ZuN2M3NEE1N3A5UWlxVXVlbVg0R1hMK0s5R2g2WGdQTmNDR1F0?=
 =?utf-8?B?ZGFnc2ZQM01uK3FnS1p4Skx1VGh0bENPTGYrUnQxVnZQRmprWUM0a1dYWmR0?=
 =?utf-8?B?bzRFdHpsNXhOMEt3dzZMZjl5aUZQR0xRRnNyN2kzOE1pT2dRcjZZTjR0dmM1?=
 =?utf-8?B?Y04zSWdxajlDSC93VFVjK241VW5HaW9tYjR1VGFYTTdLK0k1WHNaaEJNdzNQ?=
 =?utf-8?B?ZjcxbnRaMTd1ckZ6QTNsR1dnUWE0eGhqdjdMV29YTFA0L3haTTFmbWhPMGJp?=
 =?utf-8?B?NVVmR1VjTXJyZDY0cDg2YzBJNS9tcmt3cVVIQ2FJdS9mZFR1UTNMY1BMeHBG?=
 =?utf-8?B?aURIL1VVTkxIL1Jkd2lJMXF5b3ZmSEpyYWJmbCtGZXhzUy9WVzNwUDNES0U3?=
 =?utf-8?B?d1ZxdTI3dCtwMVN3dEdTbUkxVFcwUzQ4SWtkVE5zSEEraGZVVmNWeDJ5Si9m?=
 =?utf-8?B?NnBES0RuSFp6cWMwUG5LMEhTQXhwTE9JbW94MitqT3NDSktuQnoxcFpsRmIr?=
 =?utf-8?B?bjM5UnJtM3had3FUd3paL3B4UkE2Y1h3SlZjV09LVUt6QkJrMmZrTW5ZSXZs?=
 =?utf-8?B?MTlqUXplSkpyRGlXL25ubUdLMTlZRThLYmczakF4cmtpejQyZlJYQVJCbGtr?=
 =?utf-8?B?Y3RyTEN5YVA4dEdSMkMwYS9mUlV0RGlxVnJrTDhidXMvbmYyNTVPcm8wb1Yy?=
 =?utf-8?B?RFErWWR6QlVERWhsaE01UzhKV1FlT1dzNTlUNHg3L2ZVTFNwWGpWYitsR0hs?=
 =?utf-8?B?OVlxMGRsTStrWkQzakNKQnRMcmpwZnV5YWZhSVZEYzhYeXMvSmdWU2REUE5h?=
 =?utf-8?B?aThuaUxrQXBKb3dxMFNpL2FWa25OcnFpTVlkKzM2RmE5OGwrZ25PZVlWZ3RD?=
 =?utf-8?B?VHg3T1AwOHR1S0JyV2FqSm1MVmd6WnkxZXFYdHJXTWxEU2RNK1FhUlAwdGh0?=
 =?utf-8?B?RDdMdFEwQ05menkyYWQ0TENSc3U3T3Z5Y01KbzUvb1BRYU9vT2RmMlhOSHAy?=
 =?utf-8?B?LzJza0dBMllmZFRsQm9EYjliOUNEVzFDYWdibFNjL2VwV1BYbkxuTDBDN2VC?=
 =?utf-8?B?cnJlMVpYMXVUQllVRXluQXpVYVh6YWV1Z0ozb29HTnNNdlVILzFqY2hwdXRD?=
 =?utf-8?B?dFhmK0NvZ3BHd3NnSVVsZ3o3V3JZUks2VTNQTk1PbHhyYzRqSVlmUmIwRmw3?=
 =?utf-8?B?SGU3eVNEdk0xcnNKdlB6TXo0azlwZVJPUGZ3RXhwNXVJOENGNmJlSzJKYmor?=
 =?utf-8?B?RGVjNUtpcmdja0pDME95b1BDU3MzTEVWRWhHcUo0bUZ3bE9iMEJYRUxIQXdq?=
 =?utf-8?B?VldUdTVPOHZsOTlFcGYzOUpaazBNYTlxYXlzMTNXQlBTamg5RFltM1RrY1FB?=
 =?utf-8?B?Y1dLZE9kVjBKY2dQZ2t5emxISitXL1d2R1FLK0o0VnpWTnJzdzhmYlFlS245?=
 =?utf-8?B?ZW5KUmxLQmsxcWxSdC9odjNhb1JpcjYreWNCT2huQ01PME9VZHFTbTFsZHBz?=
 =?utf-8?B?VjA4bDA3YjRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(10070799003)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YW56RHBlU0tuOGIwOXRwckZOYjBSYm5BTEVnLzEzajlSOFppS3lZZlBucVJS?=
 =?utf-8?B?d1ZyYzVxS2RPLzRDd1hDMzVlVmc0cUVVcDlQSGRUcC9KTUlGQVEzTFJqbDYx?=
 =?utf-8?B?YlNkNkZLejRyWUFoTnd4RmxaNFFTTzAxZSsvRlNLYlpJdzlyZW5BYWFsejlE?=
 =?utf-8?B?amNYdzBJK2Z5ZHhjQUhSbjJJQ2ZJUFc4T1VzT3g1cHUvWXJwNzdKcVNzTjd6?=
 =?utf-8?B?bkpxMUllWFJ3L2tVUlhIbmtvT2NGcUxJYVVYSVU2aHlnNWJOY0d5b0N2SnNZ?=
 =?utf-8?B?cU1SWUZTbGhJT1grWGpTRkFreS9wbXE2UE0zajFnd3pkSUtOdWlQQWlNVUVr?=
 =?utf-8?B?Nzl4cnk0cTdEa3ppek52bTlpYzNaYkRRRzEzRWxUQWhkRGZjOVZmcHlzb0U2?=
 =?utf-8?B?REdzZjN6OXExQWIvYmdSb3ZqSGowdXE4SVN5cWxiL05UbnZOcWN0MCtFUzJr?=
 =?utf-8?B?V1JWNzBoRGVMU0NLRUErQ1FvYWxnZ2RjSkhZVjFqRUxTZDJNdE5EWjYzeWtO?=
 =?utf-8?B?M3V2cEFYRXJxVnBwZFNDNXlsaUU0anBIby85dHRpd3lGV29LdUwzb2NtNXhQ?=
 =?utf-8?B?TEgyQzc0UCs2MUFEMDN2d1ZyLzhCRWtCR3hiSFN4MUI0N2daRDdKbEtMM2dh?=
 =?utf-8?B?SVI3SDNHekpoWFRKeE1RTXF5UFN2QXQ1Z2dMK0lwNnBkV0lvQkhaV212aWJt?=
 =?utf-8?B?TzREbmU4akh6QzhIdDZTMjVsVnZhUzlqM0N0dnpkam9BUVprZmdlMVIvSm42?=
 =?utf-8?B?eUtpMnhSaDlIbDB6Vjk3ZUt2cGZ2OUFXdkcyNktmU1BIU2dodEREK2xORFo1?=
 =?utf-8?B?NjNZcnhMSTFTWThHZEdPUzdPUEluQXIwY0lBUkRHYUpENS9KMWhPRzZPWnpi?=
 =?utf-8?B?WCtjMi9sZG5YRzZyZVJhZEEvUXpIcVdvSjFWM2NkOXMyMEhpMXV4OStvNU8y?=
 =?utf-8?B?TEpmdVhYcnNHekVFWlFQVlk0MEhqR0MwdldYWmc5OFhCb1dPNzU1L0dLMTF6?=
 =?utf-8?B?dXpvYmpJNTNwRjFpazIybGxNeFBDd3FuMGlvZGUwMzU1QmR0TmMrKzJuSllH?=
 =?utf-8?B?aDJncU12V0VXV2dzc2ZsdDJrWGNERGh5Ty9DNXkySk1lMWFzanE1ZzQ1b2tW?=
 =?utf-8?B?TVVkNjNocFZpSmd0ZzV2SGt0L1Vhd2l5RnZ5aW9XUW5FZWdiV1M5R3N4alpz?=
 =?utf-8?B?bkRnVmtWcVcwZkFldlQxV2xHdmtYckJRYTFrZG9IZ09VcU1lRi9kZytuQThV?=
 =?utf-8?B?SVZYK2VHUU8za3JxekZlWEZqRk12aUwxODhTOW5KaGwwTTJTUDVYMXc5TzlU?=
 =?utf-8?B?Q1NESDB1MXJaUWpUUTg4aVMrWWozSDFNOTQ3T2FKOXBoTk81eThsckNqTUo1?=
 =?utf-8?B?bFlBSUFPM1dCYXZZRXM5NEY2OU00c3FBajFPcG1QWWRWTmJBY3FjcDdOK09Q?=
 =?utf-8?B?OVlHOG1mUElYRzBFKzFNMXg4QzRVT09EU2F6WU1JSGRPRko0WEwrYVl0aXZB?=
 =?utf-8?B?dlppMkF2MjM2eHI5QStCVEJFQVpid0w5MnE3TVVGdll6MzBVdFllMk41d0xa?=
 =?utf-8?B?MjRhRktnSVpRME82YjFOK2xWRnorUW1SYThRQkQ4N0lBQW1jYlhzZXVuNmx5?=
 =?utf-8?B?NFhMYi9MZ2pBNEM1R2FFVk5CK2JxbHNzdHpOUWNycjFtT3diRmIyeWFpd1Zh?=
 =?utf-8?B?Q0JxaGRaTUZTdm4zQU1HbWx1UTIyS2pHZ2xrbFJZdkdmcFY2dWlBMERWMjFL?=
 =?utf-8?B?TkFiTHppVnRWVFMzZWlxVTRaNGFRUXpDNXpkZC9TRGtjTHNhNzhDRDdCbE9x?=
 =?utf-8?B?L1dvelUzdThXTXFqQWQveHhRSUF6b2hWZnoxRHR2b09jaGZZUVUwZmh5MXcv?=
 =?utf-8?B?ZnIxSzRrMWZxZ0p2NllCV21yZG0yQ2g5aWU4OUt0WHhTUUc4aDRsdUtJS3o0?=
 =?utf-8?B?d1YvcW9hMHdMdUZYNFdEVi9UY0dBVkM0VC9wdm9jVHQ2bGxlT2dCOHRSOG53?=
 =?utf-8?B?T1AzdnJxU0JYMWh5U1EyV09qTSthTTFiWVBqK2NMMXhCM21aS2NBckZPVFlL?=
 =?utf-8?B?RUN4c2E5eFZmRW8wMWxkQkpvQzNRdit2RXBlSUUxK0ZIQmFuYW8rYndYNVVm?=
 =?utf-8?B?amYrQktxUERNcEd1SC9ad0dTOFJwUFpIZ1k4TzBacEtrSkZQVDRmM0NPNENK?=
 =?utf-8?B?S202NWZqWFlYWE11Zm9xSXJ4SlVBbXBFVzVOeHNqYXFyM3l2eDlBeUJiYlk1?=
 =?utf-8?B?MkpWRXNuQ0hXQkU1Z1RtVEhFZ1FnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eee20b47-18c9-4cef-6af4-08ddf7486d8e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 06:47:40.5819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hpYAR6GnwYE25akL7IR3OBvjJLOZ9mhgCqKjd8D9veltmlP4pXdK0yqFFki0Y9MrEgT6jWsFd+hXodM/oA9VKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8691
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

On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> This commit converts the existing MIPI code to use operations, which is a
> necessary step for the Tegra20/Tegra30 SoCs. Additionally, it creates a
> dedicated header file, tegra-mipi-cal.h, to contain the MIPI calibration
> functions, improving code organization and readability.

I'd write out "operation function pointers", at least the first time. Just =
"operations" isn't clear to me.

Please write the commit message in imperative mood (like you've done in oth=
er patches).

>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c             |   1 +
>  drivers/gpu/host1x/mipi.c               |  40 +++------
>  drivers/staging/media/tegra-video/csi.c |   1 +
>  include/linux/host1x.h                  |  10 ---
>  include/linux/tegra-mipi-cal.h          | 111 ++++++++++++++++++++++++
>  5 files changed, 126 insertions(+), 37 deletions(-)
>  create mode 100644 include/linux/tegra-mipi-cal.h
>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 64f12a85a9dd..278bf2c85524 100644
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
> diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> index e51b43dd15a3..2fa339a428f3 100644
> --- a/drivers/gpu/host1x/mipi.c
> +++ b/drivers/gpu/host1x/mipi.c
> @@ -27,6 +27,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> +#include <linux/tegra-mipi-cal.h>
> =20
>  #include "dev.h"
> =20
> @@ -116,23 +117,6 @@ struct tegra_mipi_soc {
>  	u8 hsclkpuos;
>  };
> =20
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
>  static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
>  				   unsigned long offset)
>  {
> @@ -261,7 +245,7 @@ void tegra_mipi_free(struct tegra_mipi_device *device=
)
>  }
>  EXPORT_SYMBOL(tegra_mipi_free);
> =20
> -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> +static int tegra114_mipi_enable(struct tegra_mipi_device *dev)
>  {
>  	int err =3D 0;
> =20
> @@ -273,11 +257,9 @@ int tegra_mipi_enable(struct tegra_mipi_device *dev)
>  	mutex_unlock(&dev->mipi->lock);
> =20
>  	return err;
> -
>  }
> -EXPORT_SYMBOL(tegra_mipi_enable);
> =20
> -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> +static int tegra114_mipi_disable(struct tegra_mipi_device *dev)
>  {
>  	int err =3D 0;
> =20
> @@ -289,11 +271,9 @@ int tegra_mipi_disable(struct tegra_mipi_device *dev=
)
>  	mutex_unlock(&dev->mipi->lock);
> =20
>  	return err;
> -
>  }
> -EXPORT_SYMBOL(tegra_mipi_disable);
> =20
> -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device *de=
vice)
>  {
>  	struct tegra_mipi *mipi =3D device->mipi;
>  	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> @@ -309,9 +289,8 @@ int tegra_mipi_finish_calibration(struct tegra_mipi_d=
evice *device)
> =20
>  	return err;
>  }
> -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> =20
> -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> +static int tegra114_mipi_start_calibration(struct tegra_mipi_device *dev=
ice)
>  {
>  	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
>  	unsigned int i;
> @@ -384,7 +363,13 @@ int tegra_mipi_start_calibration(struct tegra_mipi_d=
evice *device)
> =20
>  	return 0;
>  }
> -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> +
> +static const struct tegra_mipi_ops tegra114_mipi_ops =3D {
> +	.tegra_mipi_enable =3D tegra114_mipi_enable,
> +	.tegra_mipi_disable =3D tegra114_mipi_disable,
> +	.tegra_mipi_start_calibration =3D tegra114_mipi_start_calibration,
> +	.tegra_mipi_finish_calibration =3D tegra114_mipi_finish_calibration,
> +};
> =20
>  static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
>  	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> @@ -512,6 +497,7 @@ static int tegra_mipi_probe(struct platform_device *p=
dev)
> =20
>  	mipi->soc =3D match->data;
>  	mipi->dev =3D &pdev->dev;
> +	mipi->ops =3D &tegra114_mipi_ops;
> =20
>  	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>  	if (IS_ERR(mipi->regs))
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
> index 000000000000..2bfdbfd3cb77
> --- /dev/null
> +++ b/include/linux/tegra-mipi-cal.h
> @@ -0,0 +1,111 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef __TEGRA_MIPI_CAL_H_
> +#define __TEGRA_MIPI_CAL_H_
> +
> +struct tegra_mipi {
> +	const struct tegra_mipi_soc *soc;
> +	const struct tegra_mipi_ops *ops;
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct mutex lock;
> +	struct clk *clk;
> +
> +	unsigned long usage_count;
> +};
> +
> +struct tegra_mipi_device {
> +	struct platform_device *pdev;
> +	struct tegra_mipi *mipi;
> +	struct device *device;
> +	unsigned long pads;
> +};

We should avoid putting implementation details / chip-specific things in th=
e public header. Here's a sketch of what I'm thinking about:

--- tegra-mipi-cal.h:

struct tegra_mipi_device;

struct tegra_mipi_ops {
	// ...
};

int tegra_mipi_add_provider(struct device_node *np, struct tegra_mipi_ops *=
ops);

int tegra_mipi_enable(...);
// ...

--- host1x/mipi.c:

// move tegra114-mipi specific stuff to a new file, e.g. host1x/tegra114-mi=
pi.c

struct tegra_mipi_device {
	struct tegra_mipi_ops *ops;
	struct platform_device *pdev;
};

/* only need to support one provider */
static struct {
	struct device_node *np;
	struct tegra_mipi_ops *ops;
} provider;

int tegra_mipi_add_provider(struct device_node *np, struct tegra_mipi_ops *=
ops)
{
	if (provider.np)
		return -EBUSY;

	provider.np =3D np;
	provider.ops =3D ops;

	return 0;
}

struct tegra_mipi_device *tegra_mipi_request(struct *device, struct device_=
node *np)
{
	struct device_node *phandle_np =3D /* ... */;
	struct platform_device *pdev;
	struct tegra_mipi_device *mipidev;

	if (provider.np !=3D phandle_np)
		return -ENODEV;

	pdev =3D /* ... */;

	mipidev =3D kzalloc(...);
	mipidev->ops =3D provider.ops;
	mipidev->pdev =3D pdev;
	mipidev->cells =3D phandle_cells;

	return mipidev;
}

int tegra_mipi_enable(struct tegra_mipi_device *device)
{
	return device->ops->enable(platform_get_drvdata(device->pdev), device->cel=
ls);
}

> +
> +/**
> + * Operations for Tegra MIPI calibration device
> + */
> +struct tegra_mipi_ops {
> +	/**
> +	 * @tegra_mipi_enable:
> +	 *
> +	 * Enable MIPI calibration device
> +	 */
> +	int (*tegra_mipi_enable)(struct tegra_mipi_device *device);

The tegra_mipi_ prefix should be dropped for the field names.

> +
> +	/**
> +	 * @tegra_mipi_disable:
> +	 *
> +	 * Disable MIPI calibration device
> +	 */
> +	int (*tegra_mipi_disable)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @tegra_mipi_start_calibration:
> +	 *
> +	 * Start MIPI calibration
> +	 */
> +	int (*tegra_mipi_start_calibration)(struct tegra_mipi_device *device);
> +
> +	/**
> +	 * @tegra_mipi_finish_calibration:
> +	 *
> +	 * Finish MIPI calibration
> +	 */
> +	int (*tegra_mipi_finish_calibration)(struct tegra_mipi_device *device);
> +};
> +
> +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> +					     struct device_node *np);
> +
> +void tegra_mipi_free(struct tegra_mipi_device *device);
> +
> +static inline int tegra_mipi_enable(struct tegra_mipi_device *device)
> +{
> +	/* Tegra114+ has a dedicated MIPI calibration block */
> +	if (device->mipi) {
> +		if (!device->mipi->ops->tegra_mipi_enable)
> +			return 0;
> +
> +		return device->mipi->ops->tegra_mipi_enable(device);
> +	}
> +
> +	return -ENOSYS;
> +}
> +
> +static inline int tegra_mipi_disable(struct tegra_mipi_device *device)
> +{
> +	if (device->mipi) {
> +		if (!device->mipi->ops->tegra_mipi_disable)
> +			return 0;
> +
> +		return device->mipi->ops->tegra_mipi_disable(device);
> +	}
> +
> +	return -ENOSYS;
> +}
> +
> +static inline int tegra_mipi_start_calibration(struct tegra_mipi_device =
*device)
> +{
> +	if (device->mipi) {
> +		if (!device->mipi->ops->tegra_mipi_start_calibration)
> +			return 0;
> +
> +		return device->mipi->ops->tegra_mipi_start_calibration(device);
> +	}
> +
> +	return -ENOSYS;
> +}
> +
> +static inline int tegra_mipi_finish_calibration(struct tegra_mipi_device=
 *device)
> +{
> +	if (device->mipi) {
> +		if (!device->mipi->ops->tegra_mipi_finish_calibration)
> +			return 0;
> +
> +		return device->mipi->ops->tegra_mipi_finish_calibration(device);
> +	}
> +
> +	return -ENOSYS;
> +}
> +
> +#endif /* __TEGRA_MIPI_CAL_H_ */
>=20




