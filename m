Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D4FB39952
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 12:15:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A5810E1CE;
	Thu, 28 Aug 2025 10:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D7PydIXi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A1510E1CE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZSFE0wy2L8c2Tw6EyioNqG45RsKkodMGlivku6nRYJufHEaH9rRJmR8CkCu6hkatwElPoJeo7KfNqcqOudOUiGqsbXeT0DgYCipkWj11s9MCPl8YiiQiiUejV1jQQqB6pNiLna/CfQSKaNYTBwajdS2VJGoD2UQFUes3hcQKuHgtZx3Kf0mgQlJ0PJZOS0VUOgHSctCLdB7DxSGc+dzTbcdtFiRmCxtoBhA6e+9NCgAsgIbLhN3osgYnqFrmsfF3I1NSnTMmtdYs9tn2QcRhRNFv653KfY/57Vkk5kfxQNw1dBTH1Zu4G5QINkLybz+aqT5f5tYYgiS0fCb40gzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiOuYtCW//x6U93G7j0jdDQRBSe4GhR5fIY6f8R23uI=;
 b=QkQ3HsQYNobaIOs2bP8UklgszMH8gW4PS763va+s8urGvDbzhy//rQkRuxu5/4j3ZFQ9E/ZfX3b45mM9geOoaDq2rCd56HAO1eeCasXVXfrUK2ILaPK04Mum3amWKTJIQW71L+ZluJGCz+0mFXtBJDe3PGSeHN92GToJfh4goHfwZvdTtrI23yKBJxQZILzvUWh9hu79yaEhi3rUgMZ+f1WcTIAbpjbxHQ3w81KYidkq0t2waoELgFbeE7tty9jzxgYesYfWltpNie3jDH7SE2lr3tqjrOn7tJmiu/suwToXxjNBcjMsR/+falD1RRxqnUpoGM8bjwaM9rLgBZKEyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iiOuYtCW//x6U93G7j0jdDQRBSe4GhR5fIY6f8R23uI=;
 b=D7PydIXimHcpFBIbwjIEQqUVLEAcs18pVel32vw/lCYNsf5hcvCe4cfloTNb3ghjqTqKq65NytliSHbtVVc8l5piPWbnb+3bcUOHtZul/XA9HpzzP6E2c/5ZRa3UUNIBGkHOmnq+zXClqxCZU6YmpyyKLK9f1PYojeIs3hsz+87Gc1ACF1kG+QvsH/qvBCMYhASjAyz4k4SLXoujWvWaLZOZNpDwgTc8MgiwGzd4c40Qw2lKkGNP8h+lCJf1ZgUWtTM8/letwiXZIA9c47TNrubtongyTG+2/qPXErO9bgCNIpKI/6ybuBR09djDLbGrVV/H07d4DyURedoLcuEm1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY5PR12MB6597.namprd12.prod.outlook.com (2603:10b6:930:43::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Thu, 28 Aug 2025 10:15:43 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 10:15:43 +0000
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
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
Date: Thu, 28 Aug 2025 19:15:38 +0900
Message-ID: <2263218.C4sosBPzcN@senjougahara>
In-Reply-To: <CAPVz0n2JdRXQ7oUJqXkmGO+EPZTq3t6k8HY7pWHT3eAVXj9T3w@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <1797126.QkHrqEjB74@senjougahara>
 <CAPVz0n2JdRXQ7oUJqXkmGO+EPZTq3t6k8HY7pWHT3eAVXj9T3w@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0241.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::6) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY5PR12MB6597:EE_
X-MS-Office365-Filtering-Correlation-Id: d1976fb2-f1ad-4f55-ce66-08dde61bd89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWF3R0FsRkxVOGE2LzNpcDFBaE1pYkhVSGhpOVNVMkVzcU5DWUlHc3pCUlFp?=
 =?utf-8?B?SnJwcjUzQWQ1UEdnVXBTR1dPeXF5OTJBVGNuMHJjMXhUOTY0WHlUWUdsK3VL?=
 =?utf-8?B?aWZWQUkyeFliOXo3L1lSVjhvd3JaWWRCUDQwakU5aUhjRExsMGxoMExpY1VY?=
 =?utf-8?B?S3p0T2dtQ091NW1iSjViTjUydCtqaVNQNG9odXgxTWsrU1JMbUdmSEpPaGpl?=
 =?utf-8?B?bm56REtuSkE5N2ZoSm9Od01vYkoxVE9FaUFicHpJM0JVK3o2YUNLVjErR3BV?=
 =?utf-8?B?ZkxKbUtFb05lbi9FNCtBbjVqazNrV2xTNCtaaWl1REMxaGhxVzRnWE9PSWMw?=
 =?utf-8?B?WWoyTE9mYkRyMWZBVG16cTZyQ0FRc1pQaHd5bEhwRkxCNVF6S3lVWXRlcVha?=
 =?utf-8?B?SVU5Ny9CMjZJWVE4bjlMN0taTTJvRE5ONENkSG1BSmk1WFhSYVdJeVIrTEtL?=
 =?utf-8?B?akpsMEo2V3ZDeW04QTF4QVZzQWE1aEwyNVNEbFRnRHc0aElqclBwT1Fkd2RU?=
 =?utf-8?B?dDJ5N0pselE5UXNVVTlzNDZ4TVlrK3RtWUZwZ0h2OUwvWG5KaXFoSGZxS2gv?=
 =?utf-8?B?b1pYUHFNc3hpeWw2Q3Q5K2FvTHIvL0o1a1Z6SURJaWtuUTlwYWRXTFZ5OWJX?=
 =?utf-8?B?SjI4OUg4NTl1OGdtZi9uSlJPa3AyWUFqQk1VQzZaYXk4ci9NMUh1YnplaHZO?=
 =?utf-8?B?eGFQVVFCYVgycFAzczI1WC81NGpPMGdFQ3pqRnVVSkxXVlhtMWdJYXpYSTlm?=
 =?utf-8?B?eHRMWDlhL1lINzlzalFQcFErb0JPN0cxbWtqdjhiYlVRajhCWXZ0NUNqZk9n?=
 =?utf-8?B?WXRHVkQ5UTB6Mlhld24vZVI3Ly9Jak52MmYvQlEvTmJ1K0J6MnBQa0hlL1VW?=
 =?utf-8?B?ZzhpYnhBYm5yZFZDUFRwQStNcFpNQ0xRQmhvekJKWVhYWWJ4ZUJXZnVNeWV4?=
 =?utf-8?B?VjRDQUFoYzlocXN1bW56VWxETCttK3hROE5YN3ByY3Vlb2FZNlBRVXJTYmZi?=
 =?utf-8?B?YnZwYVNrUDRqSS9ldFladEZJdndmbVI0MTM4R2YzdStJa1lsei9kdWxLbGkw?=
 =?utf-8?B?VFpKWVZmSStMOU85N2g2L1kxS240TGxTaTk5R1NmRHdmQVFXLzc1blRnUXNk?=
 =?utf-8?B?ei95U1A5MXAzSE5zMXAwNzFwbG42NFkyWTljVmg3SEtJNXJ4TkdtajNYTEhJ?=
 =?utf-8?B?QkkyZHJrYlAyWkI4eGpkaVpmSUNGSFhZYU50cWZuMmQ5Z3Y4NGp4UHhYdkpk?=
 =?utf-8?B?T2lzUm1SdUlwMzVVMlQwR3cxRHo5aFJ3RXJ5UDdzd3h6Qzh1NWttTnVPZjdU?=
 =?utf-8?B?RGJ2WC8xU1UxMmVuMlE1c3B1TnBva21nS1o0MzVtVk1BM2tXQkNvbG5rTC9U?=
 =?utf-8?B?NzRoV3Bkdy9HaktTdTJQbVRQSisvZDAreVE2RnZhYnltTm5Wd0VncTZlWkE3?=
 =?utf-8?B?bHNHcW9Fa3h0eGwrbDhMY2Jjdmt0M3RGMTRYbjhnc2xLTHJGS0hzZTc1SlE2?=
 =?utf-8?B?cnJnQzU5QW8zbzYzTnJnTUFjQUdZYVpHUStId3Awc2RWWEkyWXJRLzIzR1VZ?=
 =?utf-8?B?M0FPbFdrMVBrOXRGMXB5TXpDSWdaSkRVeXR4dXh4VXBwR25ERFo4aGQ1UTMx?=
 =?utf-8?B?YlJqYnZod1M1TDBJRGVpaldJM2tUQ01kam52dmxuRGNxNkNGbkRRUURUMk9h?=
 =?utf-8?B?M0RhcG9qODhsYkg0a0VFRXRXakVId2k0cWg2YkJnQjAyeFdWOEtJZHdKOXNM?=
 =?utf-8?B?dVNsRjdTejlVdzZIUHNKbWx0QUlJcktrWG1GVXdEcE51bXhLU0JzR0VMZkF4?=
 =?utf-8?B?NGVSLzRYY2pFZSttSnMzVU14NWhEQTRGQm5PSFg5aGEzdkVlZmZlOVlXMklm?=
 =?utf-8?B?b1VyMVdoZVY1VFRKbnQrL0NnaFlWb0szeWt6K2NDbFExZ3JpM2o3QUgxYlJy?=
 =?utf-8?Q?APTyJTZUNW8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkUwRUhFRnBDQ3dOb245Z2k1R1BwUmFlN3VaTFRHYWRnVFErZEw4V3YvWmtY?=
 =?utf-8?B?ZHVFMDlDeGRKcHNmM2hCWHYvbFA1U0lWamgxZllmREl2Q3N5cTdxT0tSbkpr?=
 =?utf-8?B?bTBtWnU3NzBZYWlFMlI0RG9MenpISTlyOE1ibElaMC95OWlFVTJXaHpzOENk?=
 =?utf-8?B?MCtDdC9qRHF6bmZ4K3ZkTktMc05waXBzbnJjT0Rxbm16S1hyNC9kcWl6UTYr?=
 =?utf-8?B?VUl6YnFQNUVoenpMbHJuZVFRYStGc3BpZ0tqVVMydHg0czBTODlNTUp4dXBt?=
 =?utf-8?B?RnlRUmFmRGdsc1Bod1VNSVlzRWNqeVVFVGpPWmtKTXdndENsd0k0a1pLQm5N?=
 =?utf-8?B?cE1CNnNpZnpzeWpQbjZSVC9jYXhNVmZtenpIdE5KZ0dVcmc4c3VCY1NHa2dN?=
 =?utf-8?B?ZGEyVGNhZ1N6SkU5UmgyZjR0bmdtekhJN0JEd0Eram5XYkR2eDNTQklKcG56?=
 =?utf-8?B?NXZDRFZXRTJUSFVXQ0dkVGs3a2VLNlRGbU5jemhQR2dSSzFnTnhoeGwvN0hZ?=
 =?utf-8?B?cUVxemRjcXRqRVpuOS9ONXcxR2tJRGx5U2kzVnNUSGpDYTNGUFc1QXpORlph?=
 =?utf-8?B?ekI2Ry9rZ1RWbFFwS3dVUzRwZTNLck5KKzUxQ1ZFMHF3Qmp2RUNRVzFCZjlo?=
 =?utf-8?B?WDg1dTk2Z1VKWEZBRHZGK0RWTGJXOFdEaStYYzIxTGk5My9iTG8vRVpNUjYr?=
 =?utf-8?B?ZXZRNVNHd2xsT0ZDNzNqaVdrOGN0MGUvb3dzemRsZjZ0bW4yY3N4aUpiRGpZ?=
 =?utf-8?B?TXIvQ1dLMkZYVXd5SWpnSzNUMGl2UGJzUDVyWDdyWlRyWGovazlWNjlndkQr?=
 =?utf-8?B?VERNY2V2M1VqWEQxcFllRkI3Wi9HM2o3c25RZ1k3cGxtZjFRVnVPVnV4Ti90?=
 =?utf-8?B?aDdlRmh1MXVOY2ZSTElqOHN3dVlTRzFmcnAwYTl3VkRSaC9WSzJiV1RWZzNv?=
 =?utf-8?B?N3ZPK3NxNTZmeXQvSWZSNUQ5eFZEQ1Y5K2ErSEU1aDFFTVNKcnRRZStoKzgy?=
 =?utf-8?B?YWJRT0ZyUGZ2L0hndk0xR25YNVFtbDFOc25GcXd6SXBSYmsweEovRWU1WEtz?=
 =?utf-8?B?SVpZcTZxWnpPdFpMNURQMW5FQjVQeTQreEN6RGh1a2luVEk3ejRWWU5YMHhj?=
 =?utf-8?B?RytibWVtR2NPaWZnaXZIMGN4NHRnak11SlBBdjArRmcvSXVUc3liMEQrZmtF?=
 =?utf-8?B?dUlOL3R2Z3IvSFZZZUI5WEtHTkR0ZEdTRDNsa09iaVVFTkQrbzNhbzRiN2RD?=
 =?utf-8?B?N2dNVFpFR21DTUhKS3c5YUprNnhWOTRrRFdsc3NNSmZlVVF2RzlHY1dNcUFI?=
 =?utf-8?B?eVhBUEZCYS81L1M3aUVsZG1CaEhBWGtiMzNlK001dDh3dEdhdGRybmZadEU5?=
 =?utf-8?B?aFNBMUZUR092UFBFaEpoeTk4VVlaY0hHVU5SZ3k4SDhtOHN6SFVRL0dvTVRu?=
 =?utf-8?B?T3BzbTVXQW8wdUFtWVhUWXVqNGgvRWw0ZXpQUC9EdStuNGlCYjdMWTJXRjBI?=
 =?utf-8?B?dlpwZGZWdUxTdTRDcnRxYTA2MTlhVzl2enI5V2ptZC81NjB0c2hrUHhTYXQ4?=
 =?utf-8?B?R0dpL1Fka3hQeEpRLy9OaG9UNEFiSDBHb0lUSm9XV2Q5NTNFb3pmTUtiQVN2?=
 =?utf-8?B?NkRxT1pkUXIramdJdll2MDkzTVNSWjY0RWxLZVFqdXNGbk5qVG1YNFQwUk9F?=
 =?utf-8?B?YmV6ZFlKU1dicFVUYmtvRzFCKzFHVGI5Qmh1QTBuaFo4QS9CRytMVFd0eFZT?=
 =?utf-8?B?ZzZBWHJIV1l6M2kzVzEwM0N0RmZqdjRyS1dRcy84YmRTeSsvbms5aW5CSzdv?=
 =?utf-8?B?RThpaFg4RXYrSmFTdmFCTi9vZmp4bDIrNVBOaXVJREJTeGFtTmV3WVhOMEZ0?=
 =?utf-8?B?Zm44MXZMWk13K1NrYnJ2WDgrUTFDZFVFVGNQalVqYkhaYmQ5VEI2MURISStk?=
 =?utf-8?B?SGdzRnVDVWhRckdOQjRLT3N5TG5uVlBkY0paUzh2QndvajArYVdSYkNUbDlu?=
 =?utf-8?B?aWp4aEFTaTdJZGxQRkRRdFhWUG1mZFNVbzNNNXd2eFRVeStLMHlpSjl3OVZj?=
 =?utf-8?B?MS9oVVVZZnZpYlhISG5YNFVNbDNKNUZoVkYvNForMVFtVFRZQ0tVMi82a25V?=
 =?utf-8?B?eUFQSlNOdmhGcFBYRDRFTGdFcnZvZWpPMVhTQXVockFrUEs1ZXdRa1ovSnp5?=
 =?utf-8?B?TFB1dG03bzNuTVdrTlYzWFNpQU91WDVnTmt1dUNvUlNFNVhNbUhLSzd6RTJM?=
 =?utf-8?B?cXNUTkFRVUVYd3lhVk5KRW5peTlnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1976fb2-f1ad-4f55-ce66-08dde61bd89f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:15:43.0887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRTtXsvc2qc+BfxY59Bl4XopwKzUD9aKbtvtNvJfSuuToZHuYQrfen4BdbJaieNDAJLj2xB2u2Vk9pANRRafgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6597
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

On Thursday, August 28, 2025 5:28=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 28 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 11=
:13 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Wednesday, August 27, 2025 7:45=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=
=BE 13:36 Mikko Perttunen <mperttunen@nvidia.com>=20
=D0=BF=D0=B8=D1=88=D0=B5:
> > > > On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > > > > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:0=
9:45 GMT+03:00, Mikko Perttunen
> > > >=20
> > > > <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wro=
te:
> > > > > >> CSUS clock is required to be enabled on camera device
> > > > > >> configuration
> > > > > >> or
> > > > > >> else camera module refuses to initiate properly.
> > > > > >>=20
> > > > > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > >> ---
> > > > > >>=20
> > > > > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > > > > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > > > > >>  2 files changed, 2 insertions(+)
> > > > > >>=20
> > > > > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > > > > >> b/drivers/clk/tegra/clk-tegra20.c index
> > > > > >> 551ef0cf0c9a..42f8150c6110
> > > > > >> 100644
> > > > > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > > > > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > > > > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table
> > > > > >> init_table[]
> > > > > >> =3D {
> > > > > >>=20
> > > > > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > > > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > > > > >>=20
> > > > > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > > > > >>=20
> > > > > >>    /* must be the last entry */
> > > > > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > > > > >> =20
> > > > > >>  };
> > > > > >>=20
> > > > > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > > > >> b/drivers/clk/tegra/clk-tegra30.c index
> > > > > >> 82a8cb9545eb..70e85e2949e0
> > > > > >> 100644
> > > > > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > > > > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > > > > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table
> > > > > >> init_table[]
> > > > > >> =3D {
> > > > > >>=20
> > > > > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > > > > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 =
},
> > > > > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > > > >>=20
> > > > > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > > > > >>=20
> > > > > >>    /* must be the last entry */
> > > > > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > > > > >> =20
> > > > > >>  };
> > > > > >
> > > > > >I looked into what this clock does and it seems to be a gate for
> > > > > >the
> > > > > >CSUS
> > > > > >pin, which provides an output clock for camera sensors (VI MCLK)=
.
> > > > > >Default
> > > > > >source seems to be PLLC_OUT1. It would be good to note that on t=
he
> > > > > >commit
> > > > > >message, as I can't find any documentation about the CSUS clock
> > > > > >elsewhere.
> > > > > >
> > > > > >What is the 6MHz rate based on?
> > > > >=20
> > > > > 6mhz is the statistic value which I was not able to alter while
> > > > > testing.
> > > > > I
> > > > > have tried 12mhz and 24mhz too but it remained 6mhz, so I left it
> > > > > 6mhz.
> > > > >=20
> > > > > >Since this seems to be a clock consumed by the sensor, it seems =
to
> > > > > >me
> > > > > >that
> > > > > >rather than making it always on, we could point to it in the
> > > > > >sensor's
> > > > > >device tree entry.
> > > > >=20
> > > > > Sensor device tree uses vi_sensor as clocks source and sensor
> > > > > drivers
> > > > > don't
> > > > > support multiple linked clocks.
> > > >=20
> > > > AIUI vi_sensor is an internal clock so the sensor cannot be receivi=
ng
> > > > it
> > > > directly. Perhaps the sensor is actually connected to csus, and the
> > > > reason
> > > > we need to enable it is to allow the vi_sensor clock to pass throug=
h
> > > > the
> > > > csus gate?
> > > >=20
> > > > That leaves the question of why the csus pad would be muxed to
> > > > vi_sensor
> > > > by
> > > > default, but perhaps there's an explanation for that.
> > >=20
> > > From downstream T30 sources csus and vi_sensor are always called in
> > > pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed that
> > > latter is used as camera reference clock since most sensors has
> > > reference clock around 24 MHz
> >=20
> > It's possible that the csus pad is still outputting 24MHz. The pinmux
> > options for the csus pad are various clocks, so it would seem logical
> > that the clock source for the pad is one of those clocks. However, on t=
he
> > clock framework side, the csus clock is just a gate. What I'm confused
> > about is that since on the clock framework side the parent of csus is
> > currently set to clk_m, I don't know why setting the rate of csus would
> > affect the output of the pad, given clk_m is not one of the options for
> > the pinmux.
> >=20
> > It's be good to verify the register value for the csus pinmux to see wh=
ere
> > it thinks the clock is coming from, and then check how that matches wit=
h
> > what we are seeing.
>=20
> TRM does not provide such data, it has only register address with
> layout for it as a plain pad control, that register has only DRVDN,
> DRVUP, SLWR and SLWF and I don't see a way to decode clock value or
> parent or anything similar. If you give me a method I will calculate
> those values.

I notice that on Tegra20, there is a mux pingroup called 'csus', which has =
the=20
mux options PLLC_OUT1, PLLP_OUT2, PLLP_OUT3, and VI_SENSOR_CLK (based on=20
upstream pinctrl-tegra20.c). The TRM also says 'Enable clock to SUS pad.'=20
about the CSUS (or SUS) clock.

On Tegra30, however, which I guess you refer to, I guess mux pingroups are=
=20
gone and each pin has its own mux (again looking at upstream pinctrl-
tegra30.c). vi_mclk_pt1 is now its own mux with the options VI, VI_ALT1,=20
VI_ALT2, VI_ALT3. The drive group for this pin is still called csus, so by=
=20
that name it only has the drive settings as you mention.

Are you testing on Tegra20, Tegra30, or both?

I've looked at some Tegra30 schematics, and they show a signal called VI_MC=
LK=20
being routed to CSI cameras.

>=20
> Another theory is that maybe csus is used for VIP cameras only and
> vi_sensor is used for CSI cameras, but they both have to be on in
> order to work correctly. Csus was removed from Tegra114 along with
> VIP, might not be a coincidence. Moreover, T124 uses vi_sensor as
> camera mclk source.

I see the CSUS clock still on Tegra124 based on the upstream kernel. There =
is=20
also a CAM_MCLK pin. It seems Tegra30 has both VI_MCLK and CAM_MCLK pins,=20
which both can output the clock. After Tegra30 there is only CAM_MCLK.

Looking at L4T r21, in tegra12_clocks.c, it defines the clocks mclk and mcl=
k2.=20
There is a comment on mclk saying:

	               .clk_num =3D 92, /* csus */

whereas mclk2 is vim2_clk. These clocks are indeed defined as gates, with=20
vi_sensor / vi_sensor2 as parent, set_rate being passed onto the parent.

All of that wasn't very coherently written, but to summarize my thoughts:

On Tegra30, we have
- Pins vi_mclk and cam_mclk. Both can only source from (vi_)mclk which also=
=20
goes by name csus. The mclk/csus clock is a clock gate with vi_sensor as=20
parent.
On Tegra114 and later,
- Same situation, but vi_mclk is gone, so instead we have cam_mclk (possibl=
y=20
multiple with associated mclkN and vi_sensorN clocks)
On Tegra20,
- The vi_mclk pin has a variety of mux options, one of which is VI_SENSOR_C=
LK.=20
I expect this to correspond to the same behavior as later chips, i.e. sourc=
es=20
from the csus(/mclk) clock, which sources from vi_sensor.

>=20
> Here is a fragment of Tegra124 clock tree (dumped from Mi pad 1)
>=20
>          pll_p                                 on     13  x34      408000=
000
> vi_sensor2                       $ off    0   3.0      136000000 mclk2   =
 =20
>                    $ off    0            136000000 vi_sensor             =
 =20
>         $ off    0   3.0      136000000 mclk                          $ o=
ff
>    0            136000000
> > > > > >Cheers,
> > > > > >Mikko




