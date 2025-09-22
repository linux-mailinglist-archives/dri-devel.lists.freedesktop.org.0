Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F9B8EF3D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 06:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894A710E3A0;
	Mon, 22 Sep 2025 04:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BNNaPm+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013020.outbound.protection.outlook.com
 [40.93.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE8710E3A0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:44:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Csu2gBvgz8b1RxcHmJSC0sU7YjTfyQfivKPcMkAoUCpiB0tZVvtR9Av3V8Ay8t+B+TFstboVyJ2eq3coxIUVhjRV2dbPrpqZYwZ0PSlmRozr1Fp1oQdyRauNM1SqW6VQ5Ed0h89tZnev4XIF6zppKT1QByJeWxoZ/7sKXpnMg8kb+vXQ8Ir4/1RGGwUvVjK6aep6hbZTayeKm/XkxE4KMmhpEqNC1ja0m2Er8O9/p+Rr50L5yIHCs4WEyRHOvE+yBkhujBL9uNBG0BRz84jmf9Q5f/Uo9v+Nvd5okYaTxZGa8l8pmllGh81dpqrrUOYLzVCoDd/39naKX1UaUII3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPggDztaserScnJ2HVchkZjjlDVIBaP71I53c6rDNN0=;
 b=dzkvA0j8+25zz2iGoFlOC2EwEUBKDaWl+fIZ75xrArhXt/0TWl4wk+qsXq035hKuCDldFe1KvlZtp/Ey4nNZUiGu4+w8jZlx2olSHjcNwnypHlwtxUsYVnPY/3m5frsZoCF9p8oePakl+lU4tY924GKf0pT8y9q5GAsFvyTot2409TU/xazrNgvcbUFop9FslFpHvT65/0QkQLv8qucu/ZJLF7CZv36tjKgFwQhzUeMAFtiID80CgXrArnzPNuQVnBx5A8GoGcnIBIj+EitJEyeJ5kRV7YAb7kaOC+K4pjwOC29F3CCLEyaSYbx/jqCLXUu1kPbcwAJNHZPXbYollw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPggDztaserScnJ2HVchkZjjlDVIBaP71I53c6rDNN0=;
 b=BNNaPm+bLdOzJ3bEPU3n3yRphTwsa1FfqH3wtlL5FlBwAFOQO92VZnCSCA/J1RUj12+zNNmSCU+zoSz8ZhBnD4Uy65MvAcXqBE/by6uZyKShl4Q73oPRmv9dRToWUrVUlZKRXUy2MSTAH6neHjJ1Sz0JHjWcb4vqekA/8UikAwl+o9xsQ8QwbvEp6zfgfqADKKKz/31wz6bl7fb4Wmi7XqYXY1R24AEXMkOD6UKRgDqOK5dpTvs+8Dymjpfi5zA3ResnIeoL4WC59r4g9Jty1gOyOENTJWgci6xk3dRjv9lbk5rTjVOBU+QFTw9HAtBhV04qMqKh2+EmfqbarK1sFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.14; Mon, 22 Sep 2025 04:44:48 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 04:44:48 +0000
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
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Mon, 22 Sep 2025 13:44:44 +0900
Message-ID: <25240767.ouqheUzb2q@senjougahara>
In-Reply-To: <20250906135345.241229-17-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-17-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0188.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::20) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: e68a46d3-e0ad-42f9-6c75-08ddf992c27b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZCtkOUlQUklXMFFkTk94RFo4RWU4VWJCWmE1ckhPNFJHVmp3NTAwcWxjdG9k?=
 =?utf-8?B?a2ZRY3Q2TDRnaTNpSitjenpLd2NrcWR1WW03bjRzY1NNTml4bzNIUmxPeVJB?=
 =?utf-8?B?d3JGZXhyMlZuTG9DSnFlUzEyUWxKSHlPL2c3UGlyQmpqTElWSjBQLzFMcjZ3?=
 =?utf-8?B?TVNJS2RYdm10dE1NUFcxelVEbFVxNTZ3Q1duYmNvNHJTVDNPQkRGcHdsYm9v?=
 =?utf-8?B?U0hkcEU4YTRtQjlETUlYQ0lRWE5WakZ2dGpiVHBsdno0cUVTZGlmUnM2K3pl?=
 =?utf-8?B?dlpuUVo3T1FielBUNkdkSHFtY3FiWjdrZmkzSUdzbkhod1lCMWpuWEZCTi9y?=
 =?utf-8?B?U3JhRWVqbm0yYmJYQnBvNkE5K1p0L1lEZ29qUDg4UE4wbUFGdU1kMk5DUjJO?=
 =?utf-8?B?THR2L3RwSnEyV1p6czY2dUFHS3NtZEFrcWlXeHp0NnFCL25uSERibE5KRERv?=
 =?utf-8?B?NlptdXJFTllsS0ZkK2NpbEk0cGszamx2dks0UUM0eTZoRXoxUldqbEoxNEpK?=
 =?utf-8?B?RGMvaXdLSlZqcm9oM25VN2JGQXBxRk1ESzlvUHM4NmxNdUZGZ0RuSGlCYWlS?=
 =?utf-8?B?YkpTOTdOZnJKVHgySk83c1Z6S0ZPOHUwNk9ndDlvUTRBSXlDcWRqZW9ISnJP?=
 =?utf-8?B?cnVDblIvdkphT3ZHN29UTHNVeEl5aVM5UUlLVm11Zy9ramY2STVaRzg1clNo?=
 =?utf-8?B?UU8yS2hNN1lNTGUzUFYxR0h5MjFSM1FMTHRIc0tManAzdldXTXAySE40ajh2?=
 =?utf-8?B?RVo4S1ZQeE5LMTVTWE5YRitaY2tOcTJyZGhaUmp2Vm9EdWw3TFBHSkVnR21h?=
 =?utf-8?B?K21UVm9kQ2hhaFgwbWE5NklJYnZleVBiSWppL3REWHc0K3RScEkrekhadjM3?=
 =?utf-8?B?cmluRC9GQmVtRWl4b2tneEs3bU9aSTRhblVJa2pIYW9ZRTlQdkNWeTQ4MXRj?=
 =?utf-8?B?bWhmZjhJMk90eHc3Q0pUK2psTy9SZHVFUnZVS2MyK2VGMGZvRkFvREdRT09h?=
 =?utf-8?B?SE5lT2lqK0U5VmlmcVZKUnBFRUY4azhQYzZGSFhnK2RFY0JwdzIzWGxHWVd6?=
 =?utf-8?B?NkpyRnFnQzhONDdnUWdza1pkY0JnWVlxUXVubmlzbEtjOVVHUVY0cmhxajh0?=
 =?utf-8?B?UndvWlc3TEk1QVYrT0Izc1pzeVZ6b3hWdFQyRElYREJKTGxpMVBNMjRsUmhQ?=
 =?utf-8?B?NTNERHFHVkFZWXFBUHdhbzFFa3k0bzBNd3JibXBVUjVBeWVaNUZseU9sMXlX?=
 =?utf-8?B?cTFaZHg4WCtuYlBESDFsb3Q5bHJnMVZHUldxTkk3bEdIaFdISzVmbTZFM1lV?=
 =?utf-8?B?eWMxN0dDYWhkUWhqUW8vUUhyeDlhRW55elB3cE9QWFBPQVV0amJiQ0lUZnZl?=
 =?utf-8?B?Nkk2L3QzKzZFSWpqYXJUckVsNDgrQXRmYXJaRXR0S01sQ0dVa0N0V09pZVF4?=
 =?utf-8?B?MVE2TWdVeEowV1llcitINlZqK3Y1eVdnbEJLTU1yWmN2QUVzcDVEYjJ4WmpE?=
 =?utf-8?B?K0pUWUpubFN6emlBVEdxSkphWFlXbGRhMXlRMEQxaG4xN3dsVXR3Q0RQSDEz?=
 =?utf-8?B?TG4zeENTMjFXb25ORzU3TGxHZEx4N3JZVGtvYlpaeHJsMSsxVUp5VzBHYkJF?=
 =?utf-8?B?blMydmg1RzBPT1Y2SGJXYmtRWStiWmxNeVVvNXRQUHRNalN0VnhXdS9ER3Jv?=
 =?utf-8?B?RXNlTFV0bllpNDVCc0tIOWxJZnplZTVVSE42VFc0TGNwUTNXN0I4ZW80N2xt?=
 =?utf-8?B?STM1Qi9IRUdVMXhMS0lGRHhXU1lxUGNaRDJNQ2ZxN0dsNXYrcFJlblZiOXB4?=
 =?utf-8?B?MmYzc1JQV21SeTNCcTZKNGI0VTlEVTFCQ2tzTGlyb1R2eklaQ3FybHhJSlFv?=
 =?utf-8?B?RjRjcTZzOHhwT21yU0w5QkFITzZ1ZVlpajZCL1Jybm5weDNrS1l3NkVJK3pj?=
 =?utf-8?B?VFF1MEJpRi9LNDNNeGFvc1MxSW9pK0ZQbmt2YXJtaXU0bnN5b2pRQU5ESktC?=
 =?utf-8?B?Y01pNDhNSmZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ky9qRGlZT0doRUpGbFFiYlZsL0d4K05TRHV0NmJIVk9hZjdTTXN2YzZDME5I?=
 =?utf-8?B?TWpIRG8vT0F1dmozSGJtN1hoN1psZ0trL0IvZVpGeW5xbUtYNTdmalg2WmEw?=
 =?utf-8?B?NUpJNXZFTVFzSjdGUVBIcDlOdlVHL2c4RnRrU2Q1bW42L3BaQy9XL09EM3Zw?=
 =?utf-8?B?b1JRejJORitRb2VXbFFtWnRuUTBhNXVQRTc3M3c4Q3V3VUF1bFoxc1dzZUtP?=
 =?utf-8?B?dWVPdW5MLzRhUUFpUDcyWVprM0tzeDRqamRzYUJrM3VVRGZJTHFmRnhoNWJJ?=
 =?utf-8?B?UTNrNkxTMnZLNFBzWnN3b1hCRVZFNTVSaHJuN04wK0dSSU9teXNuWmhrMTNi?=
 =?utf-8?B?Uzc0Ti83amVSWDFwV2RRQVFMWmkrZVoyQzNIcDBOY3BwU3NXUXRQQ0pPM2FW?=
 =?utf-8?B?cWNScmZ6aHJFVER3U2pLbHh6cEtna3NENW9qb1VNZC9tZUZTTHc3R1dXN29J?=
 =?utf-8?B?aHJwVFBJRG9TNUJqQkUwbEorbUszMVAxV3RuWVo4UjYvWEZSQlJMMzFqSTJN?=
 =?utf-8?B?VDJHYWJKdmwxSFVDTUxpa1Rid2x0MG0zWktNKzREdERidTBKZG5pTkRQTS9R?=
 =?utf-8?B?ZlZlcVN3UFdhbVdoVHpsSDNDeFRlTWluUWlxVE5TTFlkaUJ4VlA4U3prM0lx?=
 =?utf-8?B?QTlKWkRxR2NOcHJqdG9sUFhRYitaTUJjMjVxeG9uRFM0VStJRGc4S3NjL1c4?=
 =?utf-8?B?R2l6dWprdmplL3RjZ1BTcFVUa3FtRHhMaW1DeTllejROZXdLaEhMSTZYaXpB?=
 =?utf-8?B?a3FQTXNVT3IraUkwdFRvbVpieG8yZVAvNG80aVE0QTF6MThrNFc2M3hFRm9J?=
 =?utf-8?B?dFRBMGs3WEZ1elZ2ZUtacThTaUF1Ry9zQzZETmdZcXpSeUZUNEEvVTRzcDlu?=
 =?utf-8?B?cE8rdGw4S2Fwd0R1aUNKcGZsZzFnYnhHdTMyaUM1NlpLa0dLbDVzRzVTNnRP?=
 =?utf-8?B?VU1tbWJsQm9zdm42eXFDUXJML2dGWFFKbHdxdHhoTkRCRXJGRFd5ZEZzaWFV?=
 =?utf-8?B?dUIzTEI5ZTNPTEY2QlczZ3EzVkl3Z2RmLzRYcTYrM3ZvZlJrallvbnd4MWph?=
 =?utf-8?B?ZmRJY2pscUE3QzVqUjhvRU5GL2RyQlludEZHZzArZG9rZy90N3drNGtZSzZr?=
 =?utf-8?B?eksxNFBrRFhXWEk4aG1DeXBMamZ6Z2hrUXBEWUp1NGtFNnN3ZTBpa0hpYll6?=
 =?utf-8?B?dnB3Y0V5RVZlMnkwV0EvNWJtTTZHWm5wWVhKanp5ODRNeWEvQ05oUE1wS0VL?=
 =?utf-8?B?WHRTNFYwZGVmVVY5Sk8rZWx4OXl4TlZabGQ5eitBVGhpQlIrUzFzcTFOb20x?=
 =?utf-8?B?ZkhkQ045VDJwWTgzczJXOW1IcTVuZ2hTT1g3V04wWENvOXlVeS9hdDMveSsv?=
 =?utf-8?B?NUhReGJycTNNRmlJeXpOVkRrVklaVmlZUitFcnpyZWcxaUt4QUltSGcyekUx?=
 =?utf-8?B?N013bmxrZDhMeDVVQ1RMa2NIbkRQdnNGdUNSKzE5NXZOYmJPZ3BiQUVvTEE2?=
 =?utf-8?B?L2pCL21LL2RNbnp0MnIvNzA5NnlJSkh1NW15aWhjYm8xOExjdHdOTnI0QzlN?=
 =?utf-8?B?S2oxVTlvdjNiek1XTHhESm8zT0JrWHJFRVJSZm96YWZIVldiSk1RVEtEakhP?=
 =?utf-8?B?Wk5ETmdKRytYM1YwYllQcklsSG51bWlMT0E0b1loNFNWKzhDdkpkdGRCNWt0?=
 =?utf-8?B?V0VHT2NCd0U5TWVhMTM0eTJIcFdocEQrMXN0U0d0RnVmWE15a3VYaFVVVGMr?=
 =?utf-8?B?Y1lRdWVEOG5BZ3lKemNLQ295UGx3NE5QbmgwWjBiVm1mZWRWQmpTbHBhTDNu?=
 =?utf-8?B?TFV6dW5nR3owREJ0eVI1MjI3K3NVNTFINGx6QWJJeVV3MjRKdHYxcWkrSzFU?=
 =?utf-8?B?MHpwK2tjZjNpT0JFZ3VRS0ordStGOHZHbVVRTmYxRVlHS1Qrd0oza0lVNGlZ?=
 =?utf-8?B?bjY3eFowbEhYYnE0VVlHbDJoWGU4d01FZTZSWEYwb2JLR002MVRIc1lsRUVM?=
 =?utf-8?B?cVg3RWxDNSttNGdWaUdNeHRHaTlqWGJyVjgzRHdmWkw4S1JFMVEwbndnNElq?=
 =?utf-8?B?QzU0aWozb1BHaXlmb1ZMVHExOXA2UUpQd2dMRjBmSk1hd2Vid0ZXa2hibXlT?=
 =?utf-8?B?NWJOaHpCNEd1WWJRdEpFa1BCUjVsaGRMR3Jab0FTRnFrcXNuT2JZY3EyUHVB?=
 =?utf-8?B?eS9lSjh0K3hrZVJjTzhFaVBPMUlTQ080SDEzQml1TERjbVVDbjN1UWxORE9Q?=
 =?utf-8?B?RVJUdEtwT2FhODNyUk4xZEhEUzVRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68a46d3-e0ad-42f9-6c75-08ddf992c27b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:44:48.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhQHQfrfOh9xP6BR85n80El5/OjN9NMRScU4bVjKBIoXOwDXAGDM40DbcYl7M/fP3UTXhe+nkmj3SHzJJSM/6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001
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
> Simplify format align calculations by slightly modifying supported format=
s
> structure.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------------
>  1 file changed, 16 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 6e0b3b728623..781c4e8ec856 100644
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

Assuming the bpp is coming from the format table below, this changes the va=
lue of bytesperline for planar formats. With this it'll be (width * 12) / 8=
 i.e. width * 3/2, which doesn't sound right.

> +	pix->sizeimage =3D pix->bytesperline * pix->height;
>  }
> =20
>  /*
> @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi_ops =3D=
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
> =20
>  const struct tegra_vi_soc tegra20_vi_soc =3D {
>=20




