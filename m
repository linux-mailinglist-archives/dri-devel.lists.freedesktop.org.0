Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502EBBD763D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 07:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894B810E537;
	Tue, 14 Oct 2025 05:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eQ5oB9Sw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013055.outbound.protection.outlook.com
 [40.93.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3AF510E537
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 05:16:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArV+wUaIqGy2ppfX6JCUqzPq6qRrFw6mLwff0C24Wnpr9EctsDZKiUlFGdKQhbCENTAtIqn0dB2CK7dGqYrLyjxZHohWB+6NxaEgEzygb11Z32PaVdJNzz3a1JSLr/Tz+OAZvAQhBVgNPfJrD6jKGgWvSqnhqfqqTY2YoSJtoqTzVEzglK5XHRbA1NUpjrVXNqdSN/IHwzitDePaLU8EwXSYWgCjy4sLPQVxMqd99R2orThb47uN4iz2j321wUnWEordHJaXl15hczFzaGNfFLVWgRXvjuvIBHkk0W+ss9t1uKpdQIcBxDEOmuc6O91T0GWVaQOQjPFrunkT2BnxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHwQtuRgYQkZfsPSnKTIqcgvFvblW38pCCUh+jpEy9I=;
 b=AzxWEUNQAF/IKaH1WvzpKq7BVU+Sd5k0ddcIFUb4lFuAls11a6/T5U/IF594/8Zz9h51dUjj5A+gsCHlewbFIP0F3ab9OyyPfa1KAMdUfqXD1ySYBoTpSZ5XeDdZKdFUtcz5xdn1G2j2sxTmYMvUsb9/A3bqGv/wbAURghBcsCLPFJ6P4xTX1h9Y6UcNiyxg4bifyr9p+PnwrewKGGyn3R6tttztd6gBOt0AdmQAQt8jyyQiiJyVt8mzKfXSOW4+qY44+fwEEF9goc6TCzA2pHejWmWwr/SZ24jCpLYfxS/rdNTQmua+k7ce+QTFwpNxdFveZu2UgYphxUBwa2+eMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHwQtuRgYQkZfsPSnKTIqcgvFvblW38pCCUh+jpEy9I=;
 b=eQ5oB9Sw+LsUhdy4CeWN46qgr1D6f3WLNLuaZf33ppGmTmrNdeZiLm8MW9CLVJetWdaJqEvVv5qHjLPwO53lzkHi5G3TOK/Zhtu38srTprXwHPMhblVZ+TlIP9KItCjpSiWNTfUHYM0p2Z8u9p8WA8zD5HlOGFZ+rGQn07iwLiHxvXIF5Vy/1kbPbQre9R5SjxhBRBanoxVbRW0LCh4kx4W4Zax2P2gevMVcApI8kxUWFA0dshtxBbDuIZnbu/2fY9/NbdoH7XH3EXX+02soDWUd29J9XG/KhOIkOHXyV06ENLXTZFFiUD8vgRZTLfVCzBZhpyTVwOFejp9qGxHNig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW4PR12MB6900.namprd12.prod.outlook.com (2603:10b6:303:20e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 05:16:30 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 05:16:30 +0000
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
Subject: Re: [PATCH v4 02/24] clk: tegra: set CSUS as vi_sensor's gate for
 Tegra20, Tegra30 and Tegra114
Date: Tue, 14 Oct 2025 14:16:23 +0900
Message-ID: <3368358.XrmoMso0CX@senjougahara>
In-Reply-To: <20251008073046.23231-3-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR01CA0195.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::17) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW4PR12MB6900:EE_
X-MS-Office365-Filtering-Correlation-Id: a86faf23-175f-4ffd-870f-08de0ae0d548
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmtqNzdVWGFpZ1FiUVl0Mlc0WUdnUHEwZHlOZ3Z3bTgwWFpUMjFqUG9IL2dI?=
 =?utf-8?B?UzRIUGZ2UXF2VTRZWVk2OU1GVHFKelk4aG8ybTRwaWNSSXVhNjF0bW9vbCtE?=
 =?utf-8?B?bXFKeHV6K280ek9VSmU3NVV2RThzWEhqNExVbXlMQ29RNG9abTBrOU9Uc01H?=
 =?utf-8?B?WloyaW5HQUFkZE91ZHExc2I5MnJRSHBvWVBWRUk0NHZzeVlJYlRyTmhQa1du?=
 =?utf-8?B?L2R1Znk4K1JFaXZock9HRUljd3BuVHlEaitqSnlTVTc5OXBuTWNBN3Bwcllu?=
 =?utf-8?B?UUdhMWZXdTB3OU1EdUljdy9jNFVrZ2dyMGV4SVFWbHEyQzRId3NNY3VoTUo4?=
 =?utf-8?B?a0VFaGtZeFcvOUMvbW4wbVBMTGMwTHNtTDdsclZJSFZCU1NMbTZrazBNN21V?=
 =?utf-8?B?RktrUGpoNThCMDY1NXFaWE0yZUhIY1ZodW45bG1FUHAzNWkwYWd6MDlWcG42?=
 =?utf-8?B?VTdnYmRkdEt2UEUwLzBPZHpEVmhuSkRPaGRnK0NJMmZkWkVEMWQ2UnBsbUNh?=
 =?utf-8?B?azNLYUFKM2pZb3Y1ZVUvT01pNDJicE5rM2VHWUpKU1hBQXJzaVUxSzA3Y3Qz?=
 =?utf-8?B?U3FJeDEvZzFTV29UU1EwU1pySXVDSDJzSGF4RTdUMVh5ajJzaGRhdGF5bVhP?=
 =?utf-8?B?bDFzL1ZQbWdaVlZOTjJVNEVxUmwzZDZ2U0EwdEs5TmRvUExxTXBrNE8vK1Rk?=
 =?utf-8?B?ZVhIWFhPaml3UVdtczhtNytGUXlmY3hSUnorRkk3bVBnOWtiM2JCR2Y1NVFJ?=
 =?utf-8?B?QTlkMC93T2lRdG1pNnhSZEdBWFFwMUdWUE14UkhHYjFkUWVuTXdlNUMraGRY?=
 =?utf-8?B?dWx6YnlsaG1vVWM3bmVkbDhiVlpmVGRzV1dYUDUxOGFFaDBqQVJoakNtTDY2?=
 =?utf-8?B?N1UrYW4rRDM0L3FlbUt1NHp3emw0SVptZkJWNEM2SUJHdjN2bzFmdmF3OHo3?=
 =?utf-8?B?YzNZdjNsbWE1SndQUUJndWplZ2UxNUIxaEtmdlV2L1MrZXY3UW5jM0IvVStr?=
 =?utf-8?B?TXJPTXl1Z1JIQ1p6MktiZ3cwQWNsUHBCeDZaem54VzVBMVZRYngzTUJSdmFS?=
 =?utf-8?B?TGtLcDU0UnV1aitDd1lUVGR4REVOSmFwZHFKSzk1YWNJOXpvM0hGVHFQMVRs?=
 =?utf-8?B?dXBGMFFjQ1NMVjZqdjd6amNvaVlFNzdTZlZIZmFOQWhCbWNyc1l2eFdNdzha?=
 =?utf-8?B?dWtmVE50UkM5Ui9XTkI5UFFPOTNpSGVNMkZ4VHVHQTB1WU9iQmNIZXZEQTJ1?=
 =?utf-8?B?UnBLY1B1cjdPVlpTamZ1WVBDd21wemhtZ3BsRG1NVE5kakNaZWRMeW96UVVN?=
 =?utf-8?B?dXFNZVM3TWdMZFRncWpVOUltWm1BYTlsOE9CMnk0aW5idHFxaXVVMVhvVDlJ?=
 =?utf-8?B?aE5Bc3dHNGJUazRMZ0NKS1hpTVhha3MrRFY2Um1nQW9Td3E0SVZGaC9XRUVV?=
 =?utf-8?B?MlpDMmJTd0phK3Z0OVB0MGRFTGZFQzdHR3llbnBBSnJWQ1NSZnlHYUJwa0ps?=
 =?utf-8?B?bGhzSnU4aFlPZnU2MFFOR0cxVUNQQUhUeVpnODVyakwzR0lrb0syRTYva244?=
 =?utf-8?B?S0VwOXVqK0FyQXhSaGw5R0QzaHk2cWdSbjBSa1N4UDVNR2ZGblJ0aEJYOUM1?=
 =?utf-8?B?bk5NSTNwOUY1U1pNTWNFMzkvMU93R0JLSEdraUR5cUk0dkZ6STNYaTRubTJr?=
 =?utf-8?B?L0JIWnduaGIzY0xyb0hRU1JJWWx1K1dpS09TMkZESytJTXBCcnI1SktiSHp2?=
 =?utf-8?B?RFBZU011N1hVcVFtTE0ramIzaVI2aTJyeldzWTVaV1hxblYyRDl5MStzWGFF?=
 =?utf-8?B?UVdreXpPSDFtSUZUN21YUmNGRmFsd3p3clZmb01ZOUxidVJucWRwZ0hHNHFC?=
 =?utf-8?B?R2hjV3VENlJBL3lyamVrSHJ5Mm52TFhaVjgwcFVHanI2UlIxUC9ueEtaWUp6?=
 =?utf-8?B?NDBhT2R4MlhHVEc4SkkwOFJxUVhSWW1rckZYNlI2RnZmTFh1R0FUaHJZbkYx?=
 =?utf-8?Q?ayipM16FNqd6gjlyQg3q3lAv0djEQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnd6UGJWdVVad2ZNMVJ2U1lYRFpWdnpZS3hQZnpUOGcydXNlQVNRcVRCT21B?=
 =?utf-8?B?dWdhMGU2eXRKbXkxbmtOZDNvRjlzYzFyTERmbk5wTjVWbi9SRVQ5bUt0NXhu?=
 =?utf-8?B?VzZ6MkQ0WWlkcUd1bnhxcUxmYjRPQXhpSmxCVVN1bXlXdW5Jc1VyRHVqMS93?=
 =?utf-8?B?bm1jRW9kcU1oYUdTL0kvY1krMDB5Y1AzNjRWWE0rWGJ6ZzdFb0xxcGI5VmZJ?=
 =?utf-8?B?bGtkZ28vaXVQVy83bW00YmE5UUkwOS9aZU9RWkJIaGZTT3VlZy9qYWc2R1Vi?=
 =?utf-8?B?Q3ZKRFliOG9SWGlTQmlXYnBYemlURHN5Z2RUYndPZWRodFBYQkF2NUhLL3pw?=
 =?utf-8?B?UEhIdjhPZUtybWpVLzN2N0F4dWE5OGRpRTBGblFldTF2ZDN5ZWdOYTFoNVJr?=
 =?utf-8?B?eHNBcEkrdFZwUkIrQ2NNQ081S05USXljeEZULzRMR0U5ZHB3N1ZzT2RBY1Fp?=
 =?utf-8?B?dkx3ajBpWnk4bVhzU2ZxTmlQQys2U1BwRmliV2VwbmlSWVlBYlZjeWw1NEJk?=
 =?utf-8?B?TVNoUnZGVG15aGM3MFZSTCtDM3JLb1BHSnM5OG9TbWtOaDJZUEkzNnUwTnBu?=
 =?utf-8?B?dGRvanVaMHBrY0M1Qyt2NkloVS9hb214bTRjL1BMYlRvQmQra3l1YU1YUVll?=
 =?utf-8?B?WXk4VW92blVjcVZ2KzFjMnAxdk5qYnhhaHhBbnhldkx1UU9GYVViaTlVdjY0?=
 =?utf-8?B?c1JUUXZTY1J2c0xPeC9aOWRsdjdMUUFJU1VRUVROMzlWZE8zUzhwOGpPenFz?=
 =?utf-8?B?U0ZycE9jZGgwd2hFcnhrQWxVK2xkcjhvb3RpR0tBcXZweHZZQmlDb3RFK3ZC?=
 =?utf-8?B?a3hmM25CbXZVWnBkUWRleDJZTjhQWk4vNlI1b1I2L1dDbGszOWhaSkpucHlo?=
 =?utf-8?B?VWc1L05NalBBZVBKM2pwaE5GWFN2NVFOajYxOUNqNGpkWkxGbnpSNmNWWG10?=
 =?utf-8?B?dEZ1dEN6MmtqbXRtZzVwSnJrNWRpVEZYcGxqNlFSZUk5THpXTUlDM3RtOFBz?=
 =?utf-8?B?S1Y4Z1I3aENyQmVqdCs4a3BqTFJIT1lxRU9oYmFmSWVQNG9PUHJjM1FhTzBa?=
 =?utf-8?B?ekpSWE96KzVuVnZQTDV1QndZRUhPMkZ0aHJDdDJyeDhJeWlmUnIreStqcXhZ?=
 =?utf-8?B?cnNxU3YveEc3ZGhTeXQzZzZ3ejNsaVJGanZGcVVPc3VvNTlHeVFKZGkrY1hF?=
 =?utf-8?B?NVFRTThzNk0ySjVCcitIQlhiWDl3WmFRejc1cDJWeFpnc0pMOWhFN2E3b1I1?=
 =?utf-8?B?ZkFsMEFHOHFaZmtvK3IyM05pWmZwdDRkWFl2ZWdLajczQnQ5TTZHSEhoaVZn?=
 =?utf-8?B?U05YV1Y4aTV1dFdwWjRmQVhoWjlWN3pyTjRtVHpLaDRabEczTDhUVzJyOFlK?=
 =?utf-8?B?dUhMUTF6YVQxOVRseVAvY1VRbk8vVFpPUUdqeXlqa0Z0cmR1U0ZUenNxL01k?=
 =?utf-8?B?S0dQVk5JTGFoa2dRTmtHVTVYOWZNVXRUOU5pdHY5NjBVNDQ2UU05L2gxc080?=
 =?utf-8?B?dnFBenc2eFJ3QTVsQ1lodVJSdmlyOXNzajdqUHlaZ3RKSS82Rm9YVkJJZDdD?=
 =?utf-8?B?ZG5jY3ZHSFAyOWVzd0UwNE1Sd2xwL09PcmY1aE9ORzUwYTkrbGdaUHE5ZkZz?=
 =?utf-8?B?RG8wZS9zemxIbXluamgrcXlJd0I0ZXRYMGlxZW5XWmNkNGlibmFUSEdzazA2?=
 =?utf-8?B?VU9BUnpMY3pINFFPRTVaVmt5V1RVeGJxdmkwSDR1cjFRVmVwSk5RSk81Q2VJ?=
 =?utf-8?B?L29zUHlydW1jcFo3ZHZ1VUQxK3hwbk8vUjFvOEpUNjZFSFg2d3NGS2p0WlJO?=
 =?utf-8?B?M2pOdGVJOUtpbGhobWI2aWxua0VmNlFIcnhiN05qZ1FDL3NnRTc3Qm5MbG04?=
 =?utf-8?B?T28vTVY4MzU4dEpwRHNqOU41WmdJdTh3QmRKU0o2ODBIZkc3NlF6cDhaNWla?=
 =?utf-8?B?NGhtSnRIakM4akFWV09vVEV4bHdEVnRFM1FuSk5QQjVOSDBybFpDcFZ5S0w3?=
 =?utf-8?B?K0h6SzRVUW84b2FDbFE4OHE4VWlrNHVDU3NpS01VTERvcVFCUDZVQ2ZpcTVG?=
 =?utf-8?B?dlRpd1VFb0gxRHM5Uyt3N3dwMnpqR1N2SXJ1R1EycXp3Q1VqWmo0TkZhOEpu?=
 =?utf-8?Q?G3jv0PRDl+bkKlYwbwgzGkjDr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86faf23-175f-4ffd-870f-08de0ae0d548
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 05:16:30.4401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YBPghOH2V1T6QFfm/phtMQsPcLU/VJnVlWUWTw3lztGrvOoAaXd5I3/UeGKv7PUqPml2QsQGsH8slfKjBRz+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6900
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
> The CSUS clock is a clock gate for the output clock signal primarily
> sourced from the VI_SENSOR clock. This clock signal is used as an input
> MCLK clock for cameras.
>=20
> Unlike later Tegra SoCs, the Tegra 20 can change its CSUS parent, which i=
s
> why csus_mux is added in a similar way to how CDEV1 and CDEV2 are handled=
.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c |  7 ++++++-
>  drivers/clk/tegra/clk-tegra20.c  | 20 +++++++++++++-------
>  drivers/clk/tegra/clk-tegra30.c  |  7 ++++++-
>  3 files changed, 25 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-teg=
ra114.c
> index 186b0b81c1ec..00282b0d3763 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] =
__initdata =3D {
>  	[tegra_clk_tsec] =3D { .dt_id =3D TEGRA114_CLK_TSEC, .present =3D true =
},
>  	[tegra_clk_xusb_host] =3D { .dt_id =3D TEGRA114_CLK_XUSB_HOST, .present=
 =3D true },
>  	[tegra_clk_msenc] =3D { .dt_id =3D TEGRA114_CLK_MSENC, .present =3D tru=
e },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA114_CLK_CSUS, .present =3D true =
},
>  	[tegra_clk_mselect] =3D { .dt_id =3D TEGRA114_CLK_MSELECT, .present =3D=
 true },
>  	[tegra_clk_tsensor] =3D { .dt_id =3D TEGRA114_CLK_TSENSOR, .present =3D=
 true },
>  	[tegra_clk_i2s3] =3D { .dt_id =3D TEGRA114_CLK_I2S3, .present =3D true =
},
> @@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void _=
_iomem *clk_base,
>  					     0, 82, periph_clk_enb_refcnt);
>  	clks[TEGRA114_CLK_DSIB] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA114_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA114_CLK_CSUS] =3D clk;
> +
>  	/* emc mux */
>  	clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
>  			       ARRAY_SIZE(mux_pllmcp_clkm),
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index 2c58ce25af75..d8d5afeb6f9b 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] _=
_initdata =3D {
>  	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA20_CLK_RTC, .present =3D true },
>  	[tegra_clk_timer] =3D { .dt_id =3D TEGRA20_CLK_TIMER, .present =3D true=
 },
>  	[tegra_clk_kbc] =3D { .dt_id =3D TEGRA20_CLK_KBC, .present =3D true },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA20_CLK_CSUS, .present =3D true }=
,
>  	[tegra_clk_vcp] =3D { .dt_id =3D TEGRA20_CLK_VCP, .present =3D true },
>  	[tegra_clk_bsea] =3D { .dt_id =3D TEGRA20_CLK_BSEA, .present =3D true }=
,
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA20_CLK_BSEV, .present =3D true }=
,
> @@ -834,6 +833,12 @@ static void __init tegra20_periph_clk_init(void)
>  				    clk_base, 0, 93, periph_clk_enb_refcnt);
>  	clks[TEGRA20_CLK_CDEV2] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "csus_mux", 0,
> +					     clk_base, 0, TEGRA20_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA20_CLK_CSUS] =3D clk;
> +
>  	for (i =3D 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
>  		data =3D &tegra_periph_clk_list[i];
>  		clk =3D tegra_clk_register_periph_data(clk_base, data);
> @@ -1093,14 +1098,15 @@ static struct clk *tegra20_clk_src_onecell_get(st=
ruct of_phandle_args *clkspec,
>  	hw =3D __clk_get_hw(clk);
> =20
>  	/*
> -	 * Tegra20 CDEV1 and CDEV2 clocks are a bit special case, their parent
> -	 * clock is created by the pinctrl driver. It is possible for clk user
> -	 * to request these clocks before pinctrl driver got probed and hence
> -	 * user will get an orphaned clock. That might be undesirable because
> -	 * user may expect parent clock to be enabled by the child.
> +	 * Tegra20 CDEV1, CDEV2 and CSUS clocks are a bit special case, their
> +	 * parent clock is created by the pinctrl driver. It is possible for
> +	 * clk user to request these clocks before pinctrl driver got probed
> +	 * and hence user will get an orphaned clock. That might be undesirable
> +	 * because user may expect parent clock to be enabled by the child.
>  	 */
>  	if (clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV1 ||
> -	    clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV2) {
> +	    clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV2 ||
> +	    clkspec->args[0] =3D=3D TEGRA20_CLK_CSUS) {
>  		parent_hw =3D clk_hw_get_parent(hw);
>  		if (!parent_hw)
>  			return ERR_PTR(-EPROBE_DEFER);
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index 82a8cb9545eb..ca367184e185 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] _=
_initdata =3D {
>  	[tegra_clk_rtc] =3D { .dt_id =3D TEGRA30_CLK_RTC, .present =3D true },
>  	[tegra_clk_timer] =3D { .dt_id =3D TEGRA30_CLK_TIMER, .present =3D true=
 },
>  	[tegra_clk_kbc] =3D { .dt_id =3D TEGRA30_CLK_KBC, .present =3D true },
> -	[tegra_clk_csus] =3D { .dt_id =3D TEGRA30_CLK_CSUS, .present =3D true }=
,
>  	[tegra_clk_vcp] =3D { .dt_id =3D TEGRA30_CLK_VCP, .present =3D true },
>  	[tegra_clk_bsea] =3D { .dt_id =3D TEGRA30_CLK_BSEA, .present =3D true }=
,
>  	[tegra_clk_bsev] =3D { .dt_id =3D TEGRA30_CLK_BSEV, .present =3D true }=
,
> @@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
>  				    0, 48, periph_clk_enb_refcnt);
>  	clks[TEGRA30_CLK_DSIA] =3D clk;
> =20
> +	/* csus */
> +	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
> +					     clk_base, 0, TEGRA30_CLK_CSUS,
> +					     periph_clk_enb_refcnt);
> +	clks[TEGRA30_CLK_CSUS] =3D clk;
> +
>  	/* pcie */
>  	clk =3D tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
>  				    70, periph_clk_enb_refcnt);
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



