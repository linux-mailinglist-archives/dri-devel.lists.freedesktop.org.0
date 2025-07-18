Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B18B09E8E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:01:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BBB10E119;
	Fri, 18 Jul 2025 09:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K4JU7HWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E14E10E119
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EI9v2Hc5uQhNoGB6cYJdqiYP0yuI1xi0GcF5N8majryaeFE7a6A9Ic4+VKYh/jwa1zQoBp3UiQUkvNRIs+6fiGeY+CdZehqrCnosp8QZvJzgWXhlQ3LorTQkVPvJ59a6UxHt2J69zd/k9DFPwhNx/KDyBBn8HCLS6uji0hqhoLbWaW5Xq1ypHIRdyGEsK5RVSZob4lYl+jUbsrCL2mk+EwNlDUw9XsXO3uBG/4vDoJTdwDdeqfPoiOgfCZSAvWo2OeFGGmqG9WO7Kjxb0NVTMAQgtudUA8GOqbvR5cMrs2znTXxxhN3eQfu7stFIh4nQKEKeFeAK7pD8QxrPROtwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jbql4STCU8ooODQaga+BPO2087UIfO+L+xMHUavXoQk=;
 b=S/dwtJZHM9Tw+wZvrYb+RPruV0p1BdL27k5Q2SwxMnvPFh8t0Fkkhy0Cl3Ud2Nvc8V3MIpFpOqa2PM7IXd/1/7NSIGb/wWeatSh28o43TmeYjt+HoWiOMtdSCjAnvXgqcNC6zW53pPo8g8qQyLOC+g3wGmbmMkkrXb/CSwlhSsz8KN2bJ2YPuC5BZ48A59hmuQLS6ehVR48NutV7TG3qixZG3YYOkMcnA+ti+4v0KGa4TR8q2eRTLYJRJBI2iUg56mXaqjCSWA6F0i8so21MZji5WDpH8h++cM5WoIDIWKAOWeC1HmrOoP2I72yz3Dafr7f9wxjU6GTIJEzT7k0Kww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jbql4STCU8ooODQaga+BPO2087UIfO+L+xMHUavXoQk=;
 b=K4JU7HWBu0D/WC5XNsu4ATIgStKnyYcaEftfLKaczJPVED/1sMLvRXlD/8Z5pGg7ptNX6i0pcEXS2IXdVjIEVO4kvk5tVYlJpzjpiJ/YNCfDB6D5kAp5yNVK7I/oWcMTZPlTRL7F4sLgWXGo3X+R5yJ9IxMHNu6GlqkJL1KuMqypRt2Xw7jTkdERqGPkavnv7OoO8tp0cpRwGofpEIBY0esKdngMxqFs3S6H5qcvWL73ry6K+ZHH2tr4RgE6Ah5eWXpUN6HYXb7j66/cv6ffKYbYE9htEgzi4TZpyM5TMVh1j5y24x5XjZcL5v8rOmbRnf0AaMvXTfLK+FC1Cp7iYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 18 Jul
 2025 09:01:43 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Fri, 18 Jul 2025
 09:01:43 +0000
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
Subject: Re: [PATCH v1 5/5] ARM: tegra: add MIPI calibration binding for
 Tegra20/Tegra30
Date: Fri, 18 Jul 2025 18:01:38 +0900
Message-ID: <4191623.PYKUYFuaPT@senjougahara>
In-Reply-To: <20250717142139.57621-6-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-6-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: e4028187-6d90-49eb-f3ca-08ddc5d9b769
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SU4zU2NOUWRIMTJqT3F1R1pJamxXcHkyNGUzQW5OeHppUzNnSXB3MFpGNFM2?=
 =?utf-8?B?a0ZyYThZV2llOExyQWVaam9FcGtuaXRta0ZIdWlpUkRISFR1SW9QVkhuU2R0?=
 =?utf-8?B?RjY3KzdRYWpnRGxjZ002WmhiTzRhK20vSzlSREErdTh3T1ROZ1M1bHNPa3cv?=
 =?utf-8?B?dFM2Si9zbVErUm44NjBFSVZMZW1jWHFhSXh0UGsvZklJQ1pPWXFWakk5TmVZ?=
 =?utf-8?B?T29xWUlackZyWmJxQ1dmOGM1SkpCNW5JWUQ2NE9Xd3hxbEl0UXhIVnViSlB1?=
 =?utf-8?B?YXBJMEJBdWtTRnZpRE5oNkU2cmszSnhxOElxUW1EZ2NNclZCVDFFeHl4NU5N?=
 =?utf-8?B?YWxwVE9KOGg3U1UvSmVkTkJJR0V2Qk41T2RxR0NlYUZmbUVNQ1VOazhTcDNi?=
 =?utf-8?B?VUplS21EemtTTTBCeDBlWXM5bURIVUFsMGhBcDg0aHVyMVVXUnZnR1B3b0t6?=
 =?utf-8?B?aGZ0REhHWC9LWEpuMHppOVVhd1pHakNaNE14V2dMajdVVm1BN1lxV0x3cndZ?=
 =?utf-8?B?NzlHZDdCenNDVFJ3T3ZxK2lQVS9zamVtQlhLWTU0UzErbkpLQ2Rlam9FNDdR?=
 =?utf-8?B?RGxOeTdKRFdiVnpkN3RiTFhqY1JnV0FQYmxNcVlVYTJvVy9nbEdQeXptQXNZ?=
 =?utf-8?B?Mnd1dm1sMEs3eFJQRzB1eU1hUlU2S05qdmo5TUx4cTAyY2NNMDlJajI2R2ds?=
 =?utf-8?B?bzlQK0d5by9XVEoyYzk5czdCdUx6b2M5dHI0S1N6MWpxU2FLdHpyWVd1NXBn?=
 =?utf-8?B?QVFEZjN3MlVGb0lHUm1LM0FTTWd1ZEtXbWQ1THZXcXlRVFcyMGlOZ0sxaGR0?=
 =?utf-8?B?OS9VNnoyYlp3bEpYOEYvYVhKZ0JsNlFYV0c4R3V2anpLeGZWdjAyV1N5My9u?=
 =?utf-8?B?Qm9oaHF3MnlSbzZNUk02eFVaSlovemhQcG01WGt4cTl2cUVrcXZmZER4cUNQ?=
 =?utf-8?B?T1luSm9WY24xTnZIUkVWQTREZ3lWMlFmMi9zdE9hMWlDQUpYTXNTa3R3MXRW?=
 =?utf-8?B?THhQNEE0TU5kdUtSeU9Ed1dYcUxtdFo3RmFGTlZ4MTNKRTNvWWNudm41ekxD?=
 =?utf-8?B?S2lQWjlWR1JGaEk5QTNyMHBxcTU0bmJoQW9QTGprNnVDc01zYUcyNkdhTk1M?=
 =?utf-8?B?TGRYSGNleG1oOWJkUVNtalpTMUdOOTBCRzJrSWlsNVVHay9YT2l3Qzhobkx4?=
 =?utf-8?B?SXBLTStod1FxR2IyNEZ2Mnkrck1Ub2xHVXFzODZnUkZ0bVBqYTM3M3lySnhC?=
 =?utf-8?B?MDhkZnpsMTJnVGFXYTZ6UEFLcTM4dUdRZTdXTU8rTEl1RVA5Z1lNS015bW9w?=
 =?utf-8?B?N3l6WWl3bXgvQjR2NFloZGJHYTgzVTVkSDV0RVNncmRZTGQ5UnlKNzNYU0NJ?=
 =?utf-8?B?VXBoT1J3VWVmNzZDQmc5NVladTdOZFhzTjRKOXJKOXVob1JjU2VBS1BjMmtt?=
 =?utf-8?B?QldJRWpteVZ4SmdRa2xOb2dPb1FZRzQ1b0ZXMnZULy9jdjkrN1dnanhZQUZi?=
 =?utf-8?B?aWRVSFFyZW9Vc2FNSFFpNFQvVms1UmR1K1JmbkRWT0xPYzhTcU9WVDh5VTl1?=
 =?utf-8?B?VzVXb3d2ODRYd2NZLyswdnVNTFdRRjJ1VUtSYmdrUHh4enF0b1ZIOHFGQk5X?=
 =?utf-8?B?UjB0T05WU2VSdmNCbXpIeG5TeXRIOVdubHFod1EwRnJSQnAxa3FrTjRtMzEy?=
 =?utf-8?B?VHc0ZGlycFZTVW1yRTYzbWp1dUVUc29BRVJ0eWFLRXMrT3YyZTFHenFCMXlM?=
 =?utf-8?B?cFU4Z0lqc2tJNC94dzNDUGJjYTByQk5oQ2pxclRKdnFKV01NaGhkZ3ZTNzZ1?=
 =?utf-8?B?QXFWa1BnMFJYKzFDUkpWbzJ4RXd6ZEhPUFg3QmhFTG1yQmFDTmJqS0JtUzFu?=
 =?utf-8?B?L0cveGwvcjAvRXIxMS8wczl3ajkzZWhFMElvUHhFVk55SU9JMUl0dmVPa0h2?=
 =?utf-8?B?cG9zSno3eFN4V3J6STRpSi9lR0o5QVFUR01qYWdGd2lVOVd3R0c4Q0c5NzVs?=
 =?utf-8?B?SjBnUWMwaGp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTk5bjlxcjVnS2xFejZISDhRRXQ4Qmt4YlN1SzFPZXhwbWl6aTZDa2tZdTg0?=
 =?utf-8?B?R1dkU3o2MndpUXlJNGZ5MEkrYVk5dlFSTTY4N0dabW5LMXY3WFRYS1EvOHFz?=
 =?utf-8?B?ZFhwVXFPV2orS0ZWZFhJRUxwa2hOeHBGaHF6ZUNTTW1JYW0wcmFWSzVyUHZL?=
 =?utf-8?B?NVVJWFRUL0p0YlhyQ1doMVVHMVZ1aEpBNlEyQVF6QVlqWUtLVzVwRHNKVEpv?=
 =?utf-8?B?Q2swMHZGcHBlNFBOV1RZajJrZnNVWm1xU3Q3cnN0eGUyeFhMZ1NDTG9pbzNr?=
 =?utf-8?B?MW1CeHJpUWlSWFd0cTBZZjkxSk5ueFE1alNJam5EQkc0NHhNT3VFeWVneWVB?=
 =?utf-8?B?cXpPcDNyeGlaUTVPelBuK3JOelA2c0xNSi9YNXpoVzZ6WjAvQTJzWkRrUHJh?=
 =?utf-8?B?alVKakJ6WGdJUjg5eU9neWYyMGNPU3JZUVgybzFDMU1zeGtPN2EyVUY4MXFn?=
 =?utf-8?B?Nk1ScmcwL3pJTEtpMmlkc1RveFZGVFhkYkNNZjFkLzIvN2xmUjZNazVmT1hi?=
 =?utf-8?B?QzAwN0x2TlpnRDArZXpkTnVpNk1LTVRiUkxJOThRekFCNHFxNEpyMm5pL25x?=
 =?utf-8?B?NG1vcThBUDhLeGFOM0tsSkdqZllPeDhOKzRKYmd3eXh5K3gzVnp1M2RLaUJx?=
 =?utf-8?B?dkFsRzVpR24zTTB4QXV1cW5xbVB5VjZYVWlXbkF0dVcwWUp3b3o1NjRuUWtH?=
 =?utf-8?B?NmpvZ2RveVFsOG84VHRZM1lNNFYzNkczNm4vV2d0aWVRUWh2UE95aXUvMU44?=
 =?utf-8?B?T210VHhBU3BQVUhMWkdUUzNydXNOTW8wK2psS0k3MEVsbWg5M2x5S3FnSld3?=
 =?utf-8?B?aUpwVTBkQTZRZktaTFdnM2plbG92OW1yYURTb0RuTGdTczNJM1NXOFk2UWZT?=
 =?utf-8?B?QjBJZnpjalpKQkZwcTM2clp0NzF2YUxqZ0E4aTJLRzFocGxDVzM4N2ZmNkkv?=
 =?utf-8?B?SStCWUVzWG5zQlVnUW1OVHdESDlSbGFtV0xMSlJ4Q2s1S0ZSR2txbk5vUk5n?=
 =?utf-8?B?VnhzdEROUlgwZlFTbTZKeGtyUUJ3cmh1RVA3OXhIaDY2ME9KOW5FM3FTbXhN?=
 =?utf-8?B?eDVWZmt5Zk42QjM2L2RaTUNBNHNXU0VPTHBKN2YwWkswT1pnNnBlZnU1WW9z?=
 =?utf-8?B?Wi9ZNWVFR0Y0STEwWG5zcWd1N0Z0RkxaVWpiRkplRG1XQTVjQTYyZW9zWGRC?=
 =?utf-8?B?VyttOGNKaHVDSk1Ucnd0U1RUTzdCS0d6eEpWVVR0QWlsQU8zMGxVOHdVM21X?=
 =?utf-8?B?NFgyMGZrVzlEUUxzbVlsUDVrcEZlbFBOejJtQlNzc05wQUh5WTlKY2tQdTJH?=
 =?utf-8?B?eGFjT1orclhFUE4vS0QxYlJ4MEpxVDZUcTZWcUd6Wmg3ZUtMTlMxcmIwTXJF?=
 =?utf-8?B?OUxjMXhXRHFPVzlmeThBMlMxUjI4Mk9zRmxkU3dlcHhJTkplODYyRm43MXVj?=
 =?utf-8?B?ZjBGMW9PaUN6Z2hUZWpGTHh2SWRrVjhwM0ZRMDRkeDlYakdIM0c0dG1QOUdK?=
 =?utf-8?B?UmJsdWZKY0hqU240ck5vbytMVXFnM0JCRGt0WkNXdzJ5Y2dLc1VvYkdqeUZo?=
 =?utf-8?B?UVIwVjlBNXk5SHJkOGk4RmZRVC9ReEVMeEl3Q0wySFVSbHMzM1Z0bnFZd3FJ?=
 =?utf-8?B?MTNzeUhDL2R0ZmdvUDRPaFdQS3NPM0t4MjJNNlI0eG5sd1VHZ2gyMjIyVm1Z?=
 =?utf-8?B?Sm1MYVU3b2UzV2JTQTBEMHUrNHF1anpLTEpQZ3RCMzFMdzFFZUMycjFsNkxB?=
 =?utf-8?B?RXRKcS92a3paazJRQXdWT0dJVmI2VDBtVTFyc04yVGE2VWtrODgxT1RHR3Rp?=
 =?utf-8?B?THZiOXBDbmNodnN5cWxpdmovQXB2bHVuUHJyRk5PWXFGd2VjT0lnU3BTRDla?=
 =?utf-8?B?YUZvQkRCcWNkbmkzYmRSR3I3eUdKMlpyL3JqdUVhN09tSmNBWHdJZDZGUEQz?=
 =?utf-8?B?eUxocWJJczNyMi8zSWtOWXRLU1hNTXMvaDF3YXlxRytWZGRCTDNvbHhzb3BT?=
 =?utf-8?B?dG1walNDdUpiczVkdHlJVUgwOGNxZEQ4OUUrejlUQ1BacWNHSWlnSkFhS1BU?=
 =?utf-8?B?TE5qQksxTkl6Y2o5SWpWdElzRUdTaG5ERDNYT0g4VGRpZzdyWHpPTVlHRVMv?=
 =?utf-8?B?V1g1S0QrbW9lNVcrK2VHRUQ2TFNIWS9GUU04SGhmOHJTYTJKRHhtTWFJdHEy?=
 =?utf-8?B?ZjNKR2NVTzJ3NmJvaUw2RW1ESEFIdU5BL0cwZTgrT04vaGNlcGQ0UDlkUTRk?=
 =?utf-8?B?RjlRdXhGTW4vbkdsSGlJYjI2clhRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4028187-6d90-49eb-f3ca-08ddc5d9b769
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:01:43.4314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXSQrvTuq/YTdK+HME9Gb7pUgBefvyTQXkYdoAYg8NDfMEqOqATIGDJOiFKCLBIpu3iddmInz8R2gcoCKKTfXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001
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
> Add MIPI calibration device node for Tegra20 and Tegra30.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 14 ++++++++++++++
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 18 ++++++++++++++++++
>  2 files changed, 32 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> b/arch/arm/boot/dts/nvidia/tegra20.dtsi index 92d422f83ea4..521261045cc8
> 100644
> --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> @@ -74,6 +74,16 @@ vi@54080000 {
>  			status =3D "disabled";
>  		};
>=20
> +		/* DSI MIPI calibration logic is a part of VI/CSI */
> +		mipi: mipi@54080220 {
> +			compatible =3D "nvidia,tegra20-mipi";
> +			reg =3D <0x54080220 0x100>;
> +			clocks =3D <&tegra_car TEGRA20_CLK_VI>,
> +				 <&tegra_car TEGRA20_CLK_CSI>;
> +			clock-names =3D "vi", "csi";
> +			#nvidia,mipi-calibrate-cells =3D <1>;
> +		};
> +

As you say in the comment, MIPI calibration on Tegra20/30 is part of VI/CSI=
.=20
We can't add a "mipi" device here since such a device doesn't exist in the=
=20
hardware hierarchy. We already have the VI device in the device tree, so we=
=20
need to use that.

A driver for tegra20-vi already exists in staging/drivers/media/tegra-video=
.=20
We should aim not to break it. Perhaps bring it out of staging? (At least=20
partially, but then why not the whole thing.)

Thanks,
Mikko




