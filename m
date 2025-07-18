Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2C9B09EBA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E8A10E152;
	Fri, 18 Jul 2025 09:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rdKHvUbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D467710E152
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5s3z5oofIo3pSvlgZLiIo5Tlx+cNFUteOPa01FeSaoMeT61OnatkuJ2rE9M9OD5hPrusUDjMsDVDqnH/ZeXCIkf/lVC26xXjxs8qz2fVTzkiS7AZWFoL0v2z+NgAclSPN4hBhRQvh8tYx29Hz8OYYtOd5Mi1T0uqwGiDqCy+0VfFw5TjKXUFTBJ7GlnNt95JT75CCUaxODesPBy2rn8RWs0CRoJtHHijpivmwLChLBfx2YL/Asigv7WTUiTUvjZN4YZgUVAjcyat3a0R6PQEY1oQm54qNBQ9poyGdEYeD0Dkb3PapMycCemDdeLcjrvoN+cEURMKvgxdGZns0LBhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYRAq1QYwxbVIhEjqwnRfOLMGPgjTNbkIwx0OIBrsGQ=;
 b=lGlDWl5KBM8lJ4Ttq3tvR0eGtQCDdFRgtQDpIUbnIpC4PQrnetpDVZ8dZcYopHPAZnyVUnid4vha8srZCvqJ10FTBdgkBCCafcG0MXUrWsKtz/iteCnSj3EVlWn/xUR7SkzZQ9sPcfjASpYSO6KITlZLI49DvOa4dqILaRRZNNA+ldSv2nzKztGetrP90ojaig/wpEEVkfJr5BeXAepQ9FuWG9ys3mhID5DWzN6vUL082uGcrgwC8TQ1PKn65CvwSq0T5pK9JgyN27OxF3J/PI2onzIjyHcSMy7C9jFDrKkP/tyiGSVnhDHiXEFQC8AyVo5VQc0mVHxFi4JlgrLmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYRAq1QYwxbVIhEjqwnRfOLMGPgjTNbkIwx0OIBrsGQ=;
 b=rdKHvUbMEWvPM02b3zqNW8c9vfitcdaVReHVaFA9hYh9I9LblXsLg8qVKtWrtP8cPKlVyiAjSNueYsMoDDwMBWUxQ4gcqR9Noll1bXmRqwgdA1Ds5stEJidLN5ZTfJpLm2NHLslh3e3YgxtibQCaRyfJgtAPiLxGfbHt+h2ZzP4rrsRiBshJcpsjCtMuV7vsuNtMT4qggu7oy8nyjt+N2VEHemOLQRLQ+WnsE5RxpDHWgSEEIEDBe8ynuN9cXVNCg9/JoLCQ1Cvuu2sY+YKt9cD3AkDRqC9XpSqQKhM5BkS7kilo61f3GJuTTaJAWyV3nDJb6iiYiWEaREm0GQoRNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 18 Jul
 2025 09:11:12 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Fri, 18 Jul 2025
 09:11:12 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 3/5] gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI
 calibration logic
Date: Fri, 18 Jul 2025 18:11:07 +0900
Message-ID: <5474709.5fSG56mABF@senjougahara>
In-Reply-To: <20250717142139.57621-4-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ebf8b30-2573-4428-d06e-08ddc5db0abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|10070799003|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmtOaUsvVEtXZUx0VWpLekRUSEJuZ28zalJ5V2Y1OTcxNXBjTUdnYnVJSm00?=
 =?utf-8?B?dEIyYWxtM0lad1drWExJS1BGUWZSSjhsL09DMGQrTnZFcjdpTmVWNGh5d1dR?=
 =?utf-8?B?d3FZOG1Bdms3Y0oybFJnQjhjeTVId3hCc3dBeVhCOVQ2QUh4dzlFTS9HQ2tq?=
 =?utf-8?B?U1o2RGFlckEzbHZ2Wk9RUUVkV3ZRN2ltRG1ZVFBYZyswYmxPQnNabVBPZ2V6?=
 =?utf-8?B?QjViWnZQYml5cVBkUmc3TDhDdmFSSk5SNUxRNEdLZWkveW5CTmhiM25XYU56?=
 =?utf-8?B?dUNpUTRtczMybjk1cGR2N3Nab3hxOGxpZEY3NlRuY1djbXZYRnAxSld0N0NS?=
 =?utf-8?B?Y2lSM2pDTHoxOXhqQXdVdnovblRwaG1zeUYyZ295QldrbHpLcmRMbHFkN1Na?=
 =?utf-8?B?RTRZR252eThJMVhRajJxMkRIbGJIdVhFQmxUQmhuYUJTR0lFeFR0MjJWd0h4?=
 =?utf-8?B?Rm1Hd0d5M3Uzbll5QXJZWHRleGo2akFIbjVJc1B0ZzFoK1R4NTIrZXFSbHRh?=
 =?utf-8?B?OEZnTi9reVB6Nm5xaERJOEVXaWVWbWMwelZkR053dnBQZkNQc29vM0o2blp5?=
 =?utf-8?B?V001T0p5LzY0T3JOTzlaVno4MmxnYVBDNjVGYmZWdEMxTllzaEt0MGVreEE2?=
 =?utf-8?B?TFJmSVhISk9Pb0J3YTNkZGJvaVMxNURQU256ZkxFQVBwM015VlEzRS93Vk9F?=
 =?utf-8?B?VE1Xdnhyd1JkV2hvd243aEMrdGwxVUNrczY0RmxMR2FINVpvUEdHVU5LODRG?=
 =?utf-8?B?VG11SkJGUGhBNGp6ZVBIeEg2U01STkNqWElrSXVmT3RCa1RBOHVrTk1EZGpn?=
 =?utf-8?B?Lzdwd2pVeGlFVzEzcjdjM2tEVS9NOTBQeGVMcmlxenkzdVd2R2lFdDFGbnh3?=
 =?utf-8?B?aldpWGRwemdsdFpLQVNYTzhEOEI2MWl5enJacWlqQ3VIZG0vY2RySDYzbWsz?=
 =?utf-8?B?b2NzYVUzMVQ2VGl6MWJ3TVc2c2ZEUTFUNjBrdjBhejJSTmRqbUVzOStEbXJM?=
 =?utf-8?B?R1BINFVvejF1cUgyS3UwSmNDYWxoOHVGTmVtek93eUVJQW52ZUVPSml2Sm8y?=
 =?utf-8?B?SS9QekMwTHdLRHRpbTJUbGJWaGlMRUJEcXgvTjVrQm90V2RmVUFkQjVtRUVO?=
 =?utf-8?B?ZkIxMTJZWDZMQWZTYmxFUkl1c01vamxuLzg1Qjg0QUlqaTBTalJWajhYazRs?=
 =?utf-8?B?dWlJbHRRV1FjaG9xdVhCRGVnZXVYTjJUSytnZUl5ZWVFcjJhRUJLcEhoUTVO?=
 =?utf-8?B?Wm9PUjN5U05ySFNTcTRMR1FDNnpUK2dmenBTdnZWejc3V0JncjJBRmtrZGpk?=
 =?utf-8?B?eFY4TXZEQUhKaHNXSXRTRktPdTlFcytOWHdHVGVrZW1TTXVpazRwNWplL3hE?=
 =?utf-8?B?a04wWnBBeGhzT0xJcng4OVhnc3lVSlpFd3VVa0E1clhBbVlmaGRMZ05JZ2pn?=
 =?utf-8?B?K2V5OGU4Zi9sQlQ1b1hlbnkwQUtoK09sTHJ6WnlRMEMzUUZqNWhtZmJyOGxO?=
 =?utf-8?B?UWtyc1h0ZXBWUmJIdWZqUDdkTm5DK0ZCTGNvOGtBZVgwSDZ2VytRV2FXVFA2?=
 =?utf-8?B?WGVkNFJseWdWeWVBcG1LYW8wY05HZnhodEpRdjdhSURoWnRLM2owZ2RvZnEw?=
 =?utf-8?B?WGtDbTRmVFJqekQvOWZSOUQ3VEEvTFk1d2QxaSs0T1ZvK0xHKzVQcDE2Smdi?=
 =?utf-8?B?SUdUcDBpTU4vSUtaTVVZc0NzQ2tjRGRJNG1qMDcvTk5ZRWhrL0xmL29ZV3pu?=
 =?utf-8?B?QkxvZUYrZUc2bXlwRFk0NjErRXhWYUE1TC8yVEZWakJZbUx0UC81ZklyWktt?=
 =?utf-8?B?TVF6M0ZwL2xZRk1NcjJid2YzbVNvdFFKbzZ1VXU4T0pPN2xTVUZLdHhRZnA0?=
 =?utf-8?B?MThwelVFU0ppUGhTczVMa095YWs0UmhOeFhnYWtZMVJMM0o2RHEyVzQzcE94?=
 =?utf-8?B?K3NVbUJpb0RlUHRxdmh0d1lzNjJ4ZTg2TTdnaE9QSlhXRUlGcC9pV1FFSDJ0?=
 =?utf-8?B?WHJhV3l6OUJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(10070799003)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFArd0QwTmFqNmNMbGVPVDlGTEhySENjSXAxRU1NQjdZOVU5TTYwZ0VPQXM3?=
 =?utf-8?B?UkRBWnQ1QXdRa21pMzN3dnp4ZTV3R1Eva0MyMnB1N1hBblFuVnNSZlQzLzJ1?=
 =?utf-8?B?R1RudTFyVHhRRER4bHFrVkJTUmR6VklFWmFXZUorZnFKSnE3YzVWNWwvN01L?=
 =?utf-8?B?Vlg3RkRUU1NFMzFQTzg1VjY1TjkvWUZPTTJ4dzkvZ1g2TkJTdmxKYlRzZnVP?=
 =?utf-8?B?NE84VWQ4S0l1VUI5NlFpUlB0TDZjTi9MRWJuTnF5OVIvR0tpbGxVZVhlK3Vp?=
 =?utf-8?B?c1Yrb29MM29nQXR5bFJ1eFJCWitnb2c1YXhkcnBuZS8yUjExVFU3U0dYTGpL?=
 =?utf-8?B?bmtUNytHRkFRWFBYN3o4Y0dQdU15QmcwYmdQVUZHNEZrNkw4cE1CeHIycG9v?=
 =?utf-8?B?M1gyandPekFpRTc2MDNHdWMwVGVEaWdsRWNGTm5LaU1ZNDdwQ0FXQlNscXox?=
 =?utf-8?B?ZEwyMGJubSt5RjJZSHVGSUMxWW5QZnlyTklCMWpSTjlPdFM5YnJHZHpYRHBD?=
 =?utf-8?B?dHJFeHprUWRLQy9SdnJTT0ljV3hacnJBYzZoK2ZoSjJEMjJQYmdmajh3aW5T?=
 =?utf-8?B?UzFUeFhvZVhlNmZFRGR0cUcwblJ3TTF2MThLaW1HRzBpL3BPRFcxWjdsSm9N?=
 =?utf-8?B?UEM2NTJNSVkxVWZ5QWh6T1hYVHcrM1JJSGUwMWxza2lBWUhaMWNuMldncXBZ?=
 =?utf-8?B?SjdpVHhKdE96WVViTExhaWpQU1hZY3psSUxieHZjVERLYXdUelpTdnF4c1pJ?=
 =?utf-8?B?eVVCVWhqVExyMllrakZwamM2OWxjT092T1dWQ0FOMU5rNkZJODBWRUQxeWFX?=
 =?utf-8?B?NitZT3owbEZUcXlleGpKMDFaK3NCdzVFS1F2bGl4ZWRpMmJ0cVhBalNPaGRk?=
 =?utf-8?B?amphWGk0dm9GUTRTWVpqelBvRjErMThEODlUSGZLOVhLdkt4b29oRlFEdUJj?=
 =?utf-8?B?T2VUZTgxL3pkdTg3bnlySWdiUWFMbHRzQTNyd3lKTlB4ZURTSjJlckNVOE41?=
 =?utf-8?B?Z3RKazE4VlVEY2QyNnNmV3ZLUVI2WlVwZDlZODAxVTZ4UWdWQzF6VTc0WXZR?=
 =?utf-8?B?V2FOVEVpUmF1THF0MjJLa1dkejhqWDFvMldDTWFIdmwyenNLWUx5UnJLOWJr?=
 =?utf-8?B?eHU5bmlEQk9qMENPcEFaWXRaWXgzNWdjSDMvWHo2NWtnMlpmcjhWNG1rNXhS?=
 =?utf-8?B?anRsVHNYL1lKeTBZc0VaeGtyMmx4Y3JuNWV0NTZsdFJVZzhHeGhEdmtZRS82?=
 =?utf-8?B?RnlwODFNSXBOQzN0U1crZWcrZkYwcEhRYXFkMU92YUpXTTVhL3BSRjVzOGJS?=
 =?utf-8?B?c0taa255ZkNObHB0cVMvb05jSEtvTzZHb214NTBEdHVQQThxK1hoTDdxWFhh?=
 =?utf-8?B?Ly9PZjBTemhNL0E1REhYWXZVc0E1WDJjS0dyYmxidWljMURpQ2NKcmNqMXJI?=
 =?utf-8?B?VUduSW1LbWVlNmxDd2licXpPbzBBa0QyTitXNCtaRUdFUERpYlNMZVdCN2VV?=
 =?utf-8?B?NzcvV29YdUt2TUtSbUlPMExHNHlON3VTZVZ6QjNjZmYwVUNORkZBUDVqcVJB?=
 =?utf-8?B?S0c4VHFGZ3NrTkp0Nkw2cUZYNGFuWXFsbklva2xYYkVFdEwzQUpUVTZPM1hQ?=
 =?utf-8?B?VndlbGdpa0RwZjNyMWdrNWF2YXNWbkMrb3JVaTVvTWQ1aVE3RVBmMlZrdTNO?=
 =?utf-8?B?amwvdldFa0M3bUFuWmg5VFExZ0d3QjAvM0VteVBSNTZ4eDQ5L24yMW51QWkw?=
 =?utf-8?B?dlQ4bjJaMUVrR3Vva2JZdmFnZDZSVXUxLy9VdWs1ZHVlOVdxczM0d2gyV242?=
 =?utf-8?B?TG9xVkUvV2hrMlduWm8wVVdWemtNR0Zub1crSEgxaFdLRDZiVWN4WUtWNlBX?=
 =?utf-8?B?K0VBL0ZSOEJkcDArMUQ4NnBoZ25qbUh5NHFDVU9WVUh0RUhISkRoN2VZNnVz?=
 =?utf-8?B?dHNzKzRzVGhtcytySWhwM2NaQXE2WGw4b3V3V0ZCTnFXYkpiV0ZXaHVRY203?=
 =?utf-8?B?L3hiTmJ0N1hVOGNqZDRnMkliaFNJTVZWR3h2YnhnWWdrbkdQdkc0YXlIWDdk?=
 =?utf-8?B?bHVyWHN5R3Vpc1VUV3ArYUlkUXA0TmxSa3FaYnNSQ0dGWWo0aUJNcVR2UWM1?=
 =?utf-8?B?eFA4MW9QM2lGMndHaW4vQjduSWdmNVp0S1RQM1MxMzV3STdNcStuT3lRZ0U5?=
 =?utf-8?B?azFtUS8yYmZyS3poYzBoWUYrV2IxSkk4S21oU3QvQlUxQ015VHY4ajc2WlRw?=
 =?utf-8?B?N1g5d0FGR2JpM05UV1NHV1ltQmNnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebf8b30-2573-4428-d06e-08ddc5db0abd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:11:12.6449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMOUm+fMJHh80loptxg5cJPMcEe5Q2uCfDMKPP3IV8fVkcd4ioCiG3cvi4VMn5vRazpM5NLx0HL4uFZQ/RSA3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261
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

On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> ...
> @@ -311,6 +330,43 @@ int tegra_mipi_finish_calibration(struct
> tegra_mipi_device *device) }
>  EXPORT_SYMBOL(tegra_mipi_finish_calibration);
>=20
> +static int tegra20_mipi_calibration(struct tegra_mipi_device *device)
> +{
> +	struct tegra_mipi *mipi =3D device->mipi;
> +	const struct tegra_mipi_soc *soc =3D mipi->soc;
> +	u32 value;
> +	int err;
> +
> +	err =3D clk_enable(mipi->csi_clk);
> +	if (err < 0)
> +		return err;
> +
> +	mutex_lock(&mipi->lock);
> +
> +	value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> +	tegra_mipi_writel(mipi, value, CSI_CILA_MIPI_CAL_CONFIG);
> +
> +	value =3D MIPI_CAL_CONFIG_TERMOS(soc->termos);
> +	tegra_mipi_writel(mipi, value, CSI_CILB_MIPI_CAL_CONFIG);
> +
> +	value =3D MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> +		MIPI_CAL_CONFIG_HSPUOS(soc->hspuos);
> +	tegra_mipi_writel(mipi, value, CSI_DSI_MIPI_CAL_CONFIG);
> +
> +	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> +		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> +	tegra_mipi_writel(mipi, value, CSI_MIPIBIAS_PAD_CONFIG);
> +
> +	tegra_mipi_writel(mipi, 0x0, CSI_CIL_PAD_CONFIG);
> +
> +	mutex_unlock(&mipi->lock);
> +
> +	clk_disable(mipi->csi_clk);
> +	clk_disable(mipi->clk);
> +
> +	return 0;
> +}
> +

Where does this sequence come from? It looks a bit strange to me, since it=
=20
doesn't trigger calibration at all. It would be useful to mention the sourc=
e=20
in the commit message.

Mikko



