Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56C7BAF190
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 06:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AB1010E2E6;
	Wed,  1 Oct 2025 04:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lcpF1vGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011008.outbound.protection.outlook.com
 [40.93.194.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F7810E2E6
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 04:38:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0UzeZAx4jKR5DmrO2AyQEC7dAy6Wt/7qWt23b3Tq7jfk67UVOnvSaCA/xJg+o03lIzJtdxrF+Y31DTTyRvCXCrhcU+gOgQP/iCOQ2i4RjqO5TpixBdcgXvLWIS+Y5e3EVtl5OLUlKREdg1x+/tgt4CK7JnSlIPE4+Gct444IFpd1Qifm+ASjzzo2oPJoIRCRRky34y6U619al9+DXAeEo1NH3Dc+aZspLLhXl07LibmUjh6kVOpXRH8kqqZKDNE7bRKI8hCZtVY3xTvu2E7eIHapIkDsY4yJt2vrOJI7wCQuJ8I9vYbHSbuRD6ahsY4SDTjOrNXqjkl3pwawSDbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eBjrJ0qpsYUlPQIgxSYzIh4J1/sgNwpx5rz2LHkcCQ=;
 b=v40J3BjSfRhiOHXHcyvw7CWRzvmU8cKqN9UrmBFdpZZv+fcdjd4YfzMC0KefAgaQ4HeoAVA6h8HsfmpdJ5zZJf9HTPhMPaTyQpfsswtdR1Wjh+6USi1xeqMHsItmCudijgs9Mk9lI04iXH2WIoe01pwwAl0q/I2JbH+eJlABgUgaZbcFPDW3b5K3FDCssou9XlTXJxRjBde7h6VQdFdUU/EDYUIBN+buWwtrc6+T442Icq3965CB5dHa3xpDSdzFMJX9ek9cBlFcAaSOn1OmMwt7zPS7ebAbP9ILvFbat9f13Gg+gP29eXUUpJEJQOSHkuKDarSsfwRPsa8cX3KMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4eBjrJ0qpsYUlPQIgxSYzIh4J1/sgNwpx5rz2LHkcCQ=;
 b=lcpF1vGcq0AcTcjMSYYTN/FXzYhFsMBo+RyQwwtsHX0lxSZRaqzSnpgsXapa9X9waWlcTscZTglmVBAWLnoAN64dRaxk2hefbFfotWqBYqWfE6fnOx5Bxfsy56OpfQaiFb/po9X4ChNI/6vdDsmKzYquwh4OvjzYFhviFRlyvxM7ZMaWRcND457VhB4euev4QCT7gEdB22oqneztkQaKESuBwRq6YTT4zwyDOOcx92FGRdN4JP/2RzTZqgCrIrdM4wgohO27PGVK+v3g7hJWaWzqmV/jRjM/NKyiDmNoVM33W/HHfLzlLmHPbFRmMf/yXh/Pd78NwipJeUG1i+NUDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Wed, 1 Oct 2025 04:38:21 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 04:38:21 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Wed, 01 Oct 2025 13:38:16 +0900
Message-ID: <3419823.yaVYbkx8dN@senjougahara>
In-Reply-To: <20250925151648.79510-16-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <20250925151648.79510-16-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe294c2-2059-45de-7d07-08de00a45993
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHVkRlR0eEhhVEYxQVFaTDVDWXJkVU5CcStLN2t5Wld0amtFQXNnMCt3T0xq?=
 =?utf-8?B?czFQM3paNk1INUV6T1VrdzJ4cFR2N09LY01FR2FFUWJ3OFVlanEyNzdKaEVl?=
 =?utf-8?B?WlNScmczb3RRdlVFWkVOYmw1R1NtYXF3UzkzTStCc2t6aXM2TVhBTXZQQnlE?=
 =?utf-8?B?WTVIZWZjalJmb1lKTnQ2Q1BqVzZHZHYyYXR5ZStiYXpnc1lFazE4UEVGSWlN?=
 =?utf-8?B?V3pSVkRtMmFOM1NwOWhtdWh2UjdyZnRiL2FuL2FRNERBdXkyc0xJQ1grM1d6?=
 =?utf-8?B?eXRNUWQvR3RjRUh6dlQyMWRhK2YyV0h6ZGxZQUtEL0hRRFRRenRmZEJIVURD?=
 =?utf-8?B?WEVFZW9wTjFXZHVpRlpaVlROK3VUNDBKcmkzL2RjdlB0RjFVUTJ4UzNXeHU0?=
 =?utf-8?B?Z3dtSjJtSWxmN3BDTVg2TXJEbGZWK0xIS05EaUpaS3ZxRUh0Yjd5UHdNMlpT?=
 =?utf-8?B?TkZ6U0s0VGdta2wyaDF2VGVVRG1sbHFwV21PN25WdDNUelhFSkQvQlNKaXdH?=
 =?utf-8?B?YnBpOEJUSmxWU2h4TnVRUXlXeUlNVlA5aXVxSkRHUTMyNW9NSjNOcTNlWVov?=
 =?utf-8?B?VVRhMDVoZE5mZ3dvcFlONTQ1RFJZVmJVTkNMNjhFd0pLc1ZXWlBLL2s1OUtp?=
 =?utf-8?B?WjZzYklFdmIyZ2dZaDUvNzc0eU9rK1Q3TWZxTjl4eUttYVQ2eENvUEZLSU9w?=
 =?utf-8?B?WFlPeTZFT1l5MnRzdUoyR21jUTNwS1RCcXZoUFhZQmpkRmZQU0xsaE9PL0pJ?=
 =?utf-8?B?U1VjSnY0T25TWlo5L2dUR0Y3aW9GMHFJQ0dsUTFrRVZCVTNoU2V5aHY4RFZw?=
 =?utf-8?B?OXNaL08rTnQ2TERKZlhlRG1KQjZVWXRpV2R0KzJxSGd0UnUwT29RUlNEMyt0?=
 =?utf-8?B?VFo0SEJudkNSNXZnVFdCclB1WEtIdk52SWRoRHZ1dHNvOWhMUml3Rm9WM2lN?=
 =?utf-8?B?S0puMHk2WERFNSt2WUY0dExOeGEzRXhtYlhqemM5d1ZFZGh6MXR5TlRnYUdz?=
 =?utf-8?B?MFJVSGJzWmYwWjNkYzB1T3hjcms2SEEvbzhrMEFBNmd2RUQ4VVJJbVVBR3RD?=
 =?utf-8?B?WC9mOGZSZUZrRGpoZU1wTjFjSkZtdUh0OU1SVTRSTUEzajRSK1RZQ0F6OE9Q?=
 =?utf-8?B?bUN6elpscW5GTTJFOFoyM0FXMlBKQ2xtbGZ5d3BWSXFvcExJRFQ0VDRiZ2tH?=
 =?utf-8?B?WUtMeGg0VUMwWkVpaVFGWjVZSjYySDEwTStNZjJHcFE2MnJhdGUvQUhKYXpF?=
 =?utf-8?B?dzVFZFE1aEJWeVI0K21ZdHhPanVZMk1GL05KemhuNThpVDl5N1J2WHl0RlV3?=
 =?utf-8?B?cHdFekQxbkFkMHZjV3g2M2ZZRzFlVkg0bjlQZlN1TFdvbG5DY1hVNGNpZWJC?=
 =?utf-8?B?R2czNzhKbm81ajkvUzJGc3VBNTk2YTlBZDJ0T3dnS0pScGl1citmbUdJcy9G?=
 =?utf-8?B?VFZtQmZkSi9yQkFMZHB1cU41NG82RlIrV1l4T3JMeTFkRFlnbFJxdExTRW1l?=
 =?utf-8?B?RnFlMDVLaDUzYkJlcFdpOFJpeWZEVGJHV3VMQ3BGS0xsSHUrRUp3aXZLR2Za?=
 =?utf-8?B?WDZmUnRPUm0xcTF3MCtnaEpmOHZzMVVsOENsUGxERHVVQnZLYXNwQUtkS1VS?=
 =?utf-8?B?Ump4d1VhQkpTVnh6d1NYazRldXVvUXIzOVB1c1RXbWY4RUovQWgzSFhEbjVK?=
 =?utf-8?B?VGkvMnp4UUpNVDVwZGZYaFlxanBIOTgxRVM3TWhLOFV2emVzRkk3aHBtR2xs?=
 =?utf-8?B?RkJSdnh5Rko5NE0rRFlDR2VtSWFvWmFRYkM5WXJZUGh5UWhWTWNqQk9INnVK?=
 =?utf-8?B?WTdtcGxXOVppQVFvUGREK2hpc3pRVFNnSGFIWm5LaE5rL1cyOUhwYnlCMWUw?=
 =?utf-8?B?V29ZY3ZKODhFN1lHSFpud2wyWW10YURSMzRqaUhUdHFtVENOY2JLWVptN05W?=
 =?utf-8?B?dkpiV3drWlJrNXhhZHVtY0MzN3hBdFREVHN2VHlkVzEyRUFSd0hlZWhrNXRa?=
 =?utf-8?Q?OEqeqlIknWV8WmeOWw62ohDQfK+xKA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklVY1dmYXNQdllSWFFCYTY5YTlsTEpsOHl3M1JFRms5OXg4bXF2SDdlMFBi?=
 =?utf-8?B?Zk5Yd3VaMDJxbDFaNUd3d0kyZXFWMkhGSThzb2FlT01mT0VYWGFTcnM5bW5C?=
 =?utf-8?B?MFFnR1RCbmlVckpNNFI4Q3FkMnlJK01MTUFOU3ZNWVBpWlFDYUpuZkhjY3VT?=
 =?utf-8?B?U0NmRzh6bmN3T0swMW1KRERKeTJrMCt2VUd3c0hkYmFETCtQQWlVbkpnMXcv?=
 =?utf-8?B?bWo4NVR6bmNUMkhETmlHZDVSM1BMby9NZmEvVkVybWVFQjUzOGY3RkJSa0dD?=
 =?utf-8?B?QkltenFXdE14bzh1cWRQNGUrUjc1U2NxOVBFSGFVYzJ3SkRSbHljazdidUc5?=
 =?utf-8?B?TFFUMWo3TVlmbzdnS21nTy9vWFlFZ1dlb2k4MnpwRFF3MGNmQ2p1aFozS29n?=
 =?utf-8?B?RXZnakhXcUVCTDBvZGN5U3kxeWdoSVd1MTlWWnVPZUxWdnI1YVVhNHBMcmlU?=
 =?utf-8?B?cjllRFVFUHdQMlVXbUE1MWpPRkxnQm8yVGFoS2hXY05qQ0Vzckw0SmQ3bGtD?=
 =?utf-8?B?ditiUWNrYVNXN3psOVFlQnhJeDBUeEl6ZnhtVWplZnVjWWVibHZoTmFIRXV0?=
 =?utf-8?B?M1RhRVc3cWl3ZUpXZkZodHBUdGszUXhyUWEyK3V2bGtOayt4QUlxTDQ3MlJN?=
 =?utf-8?B?N2xkQ3l5bXdVbithS3ZwSkk1cWtpQjYyTGx0c2FyZzZXQjVWRkUvQlRDSlpR?=
 =?utf-8?B?cFprNkk5cDgydlJhWGlzRm5OTm1SWFozL0ZRU3Q3bWVMUDhUbWZ6TTJEd1g3?=
 =?utf-8?B?ejYyeHNqY20rbWMwa3RqNjNVbW1ENW83ZXlUZUJLdlR1UjkzZW5yOWpCRW5a?=
 =?utf-8?B?K3I0dk5IY2YxTnVRaE1uQmM4S0tSZ2huMkljakZrQlg0Y3FtdzErczZjYW5y?=
 =?utf-8?B?RmJNNnZONk9RWDU5eTNtOWtKQ1lIVU9VRVI1SEVjWEhHdGt4aDRTbjlRZ3dE?=
 =?utf-8?B?MENQeWhnU3RIRFVROWR0Ym9kMForYnQ5dkYwUzhRUmRac1F6UkZuS1pyN0hV?=
 =?utf-8?B?R2wyZEVhL2w5WklVcUZTTGYxbHVkNFhLcHRxeEo3dkIwK2p1K3d5aUtDYUhl?=
 =?utf-8?B?RmhORXY1ek95L3FwUEo2WDJBMTQ4OE4yOC9rMjBmdStFNmhONXJIK0ZKbkFI?=
 =?utf-8?B?eVNWZjBPSWpWeHIrNzFSV2RTajFCS092UnVINmFSd01WVkVhKzc0dVFKVThB?=
 =?utf-8?B?Q21VNWE4TjBFWHdzRFlhNmNua3VPN3g4TjNvd2ZnQ3diaHphUUEzRmJBZ0Rp?=
 =?utf-8?B?YjF0Z1BBWEI0OWJhMWdJemlJYkxPVUhRTEh3bkhlZ2U5WTVBT1Bzc2dYQVBh?=
 =?utf-8?B?NFdLa1c2NG9GRkJJVm94MFlyNXNETk43dGozREd2U3V5V2hlaHBHZlZxSXVq?=
 =?utf-8?B?azhQdDRyOWNKTVFtODdkWWJUZm9CWkg1eHIvb09uVzNGM2xjTW1QallKeWVi?=
 =?utf-8?B?eWViT2kvQVhhUTByRkg4eDJld1p1bzVPckpFUXJqV0lGbXY5ZnVUMk9lL0lO?=
 =?utf-8?B?YXpyWnR3Mkw1VlFnVXJZbUZqZFV4ZlFiWXdUMnJkWGI0aFhUVFEvMkFhTXhI?=
 =?utf-8?B?VHBJL29JVWZCMlk0VzRCcmgrSm45VEdoeWg1UUsrVXE0U09XblE4WUE5VEJk?=
 =?utf-8?B?K0FWV0xHeEpTZVcrcG9FbWQ3YStMbFEwZ0h1bUYxdnhML3ZhdVRxYkQwYnQ5?=
 =?utf-8?B?ZkpSeDAzZldtNjZrMUQ5aXp1d1F0RFZBL3FncWpqV0J4SUkzeXhSNkF5NHhp?=
 =?utf-8?B?ZCtRMHBwOGNtd3hjQ0g0eWRSMGxUZW9XUWxlYmNEcGhjVzFBWWNYSW00Vkto?=
 =?utf-8?B?K2RyaWpSOWUzSnBjRkQ5MVFaTkJEUS94NWVlUVBCNFpTbUhRa1ZFeHpBbE91?=
 =?utf-8?B?Mklub2dQdXFaM0R5ejVseDZLemRibXF2VS9vY1F6dzJsTE5rejEzdHdHcy9C?=
 =?utf-8?B?SnZyUGtVNTN1T1RIVElGM3Rmd2tqZUEwNlVoYlc4WUV1a3l0a1ZaYldlVFp6?=
 =?utf-8?B?dVJjNGFjNHVkcUJqQ0huZnVxbWtjNjRFNEt4M2dJcTVnMmRUM3J4RzJJTzNB?=
 =?utf-8?B?QmNXM2Rua29MOEh0bUpIdlJ3Q2ZHYmFIcVRBV3FkYkEydzdWVkNLeHExY2lI?=
 =?utf-8?B?U0J2NGx5V0oxVHFVOW1vUUczTUFTS2tUL0Jra3hIVDJGTzV6dktybGwvU3d5?=
 =?utf-8?B?Z21JNWk0bDBIcFJLS2IxQ3RBQUZMSm1ISjkxakJmWnhBWEY5Ry80Titmdlcv?=
 =?utf-8?B?Vm9oUWIrait5UTNrTloxaDc1NmNRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe294c2-2059-45de-7d07-08de00a45993
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 04:38:21.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4PT+TBh1oWzClB7dRr5sKocicbFtm/ggHz6rsco3LkIVsGf+fmC5zPPb75v7fu2+lMYFwXyQfEq/5iCwPkGeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
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

On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel wrote:
> Simplify format align calculations by slightly modifying supported format=
s
> structure. Adjusted U and V offset calculations for planar formats since
> YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 planes for U
> and V) so stride is width * 3/2, but offset must be calculated with plain
> width since each plain has stride width * 1. This aligns with downstream

plane

> behavior which uses same approach for offset calculations.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++------------
>  drivers/staging/media/tegra-video/vi.h      |  3 +-
>  2 files changed, 27 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 7c3ff843235d..b7a39723dfc2 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pix_format=
 *pix, unsigned int bpp)
>  	pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGRA20_MAX_WIDT=
H);
>  	pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGRA20_MAX_HEIG=
HT);
> =20
> -	switch (pix->pixelformat) {
> -	case V4L2_PIX_FMT_UYVY:
> -	case V4L2_PIX_FMT_VYUY:
> -	case V4L2_PIX_FMT_YUYV:
> -	case V4L2_PIX_FMT_YVYU:
> -		pix->bytesperline =3D roundup(pix->width, 2) * 2;
> -		pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix->height;
> -		break;
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_YVU420:
> -		pix->bytesperline =3D roundup(pix->width, 8);
> -		pix->sizeimage =3D roundup(pix->width, 8) * pix->height * 3 / 2;
> -		break;
> -	}
> +	pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> +	pix->sizeimage =3D pix->bytesperline * pix->height;
>  }
> =20
>  /*
> @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(struct tegra_=
vi_channel *chan)
>  {
>  	unsigned int stride =3D chan->format.bytesperline;
>  	unsigned int height =3D chan->format.height;
> +	unsigned int width =3D chan->format.width;
> =20
>  	chan->start_offset =3D 0;
> =20
> @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(struct tegra_=
vi_channel *chan)
> =20
>  	case V4L2_PIX_FMT_YUV420:
>  	case V4L2_PIX_FMT_YVU420:
> -		chan->addr_offset_u =3D stride * height;
> -		chan->addr_offset_v =3D chan->addr_offset_u + stride * height / 4;
> +		chan->addr_offset_u =3D width * height;
> +		chan->addr_offset_v =3D chan->addr_offset_u + width * height / 4;
> =20
>  		/* For YVU420, we swap the locations of the U and V planes. */
>  		if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_YVU420)
> @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(struct tegr=
a_vi_channel *chan)
>  		chan->start_offset_v =3D chan->addr_offset_v;
> =20
>  		if (chan->vflip) {
> -			chan->start_offset   +=3D stride * (height - 1);
> -			chan->start_offset_u +=3D (stride / 2) * ((height / 2) - 1);
> -			chan->start_offset_v +=3D (stride / 2) * ((height / 2) - 1);
> +			chan->start_offset   +=3D width * (height - 1);
> +			chan->start_offset_u +=3D (width / 2) * ((height / 2) - 1);
> +			chan->start_offset_v +=3D (width / 2) * ((height / 2) - 1);
>  		}
>  		if (chan->hflip) {
> -			chan->start_offset   +=3D stride - 1;
> -			chan->start_offset_u +=3D (stride / 2) - 1;
> -			chan->start_offset_v +=3D (stride / 2) - 1;
> +			chan->start_offset   +=3D width - 1;
> +			chan->start_offset_u +=3D (width / 2) - 1;
> +			chan->start_offset_v +=3D (width / 2) - 1;
>  		}
>  		break;
>  	}
> @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_vi_ops =3D=
 {
>  	.vi_stop_streaming =3D tegra20_vi_stop_streaming,
>  };
> =20
> -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)	\
> -{							\
> -	.code    =3D MEDIA_BUS_FMT_##MBUS_CODE,		\
> -	.bpp     =3D BPP,					\
> -	.fourcc  =3D V4L2_PIX_FMT_##FOURCC,		\
> +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	=
\
> +{									\
> +	.img_dt		=3D TEGRA_IMAGE_DT_##DATA_TYPE,			\
> +	.bit_width	=3D BIT_WIDTH,					\
> +	.code		=3D MEDIA_BUS_FMT_##MBUS_CODE,			\
> +	.bpp		=3D BPP,						\
> +	.fourcc		=3D V4L2_PIX_FMT_##FOURCC,			\
>  }
> =20
>  static const struct tegra_video_format tegra20_video_formats[] =3D {
> -	TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> -	TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> -	TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> -	TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> -	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> -	TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> +	/* YUV422 */
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
>  };

Looking at the code, BPP seems to only be used for the line stride (i.e. by=
tes per line) calculation. I think we should just make it 8 for the planar =
formats (possibly with an explaining comment). With the current code, we en=
d up with 'bytesperline' variables in places not being the actual bytes per=
 line, which is confusing.

Actually, we can then just make the 'bpp' field be bytes per pixel as it wa=
s before to avoid the discrepancy with Tegra210.

> =20
>  const struct tegra_vi_soc tegra20_vi_soc =3D {
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index bfadde8858d4..5cbc0606ed6c 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -281,7 +281,8 @@ enum tegra_image_dt {
>   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
>   * @bit_width: format width in bits per component (for CSI/Tegra210 only=
)
>   * @code: media bus format code
> - * @bpp: bytes per pixel (when stored in memory)
> + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> + *	 bits per pixel for Tegra20/Tegra30
>   * @img_fmt: image format (for CSI/Tegra210 only)
>   * @fourcc: V4L2 pixel format FCC identifier
>   */
>=20




