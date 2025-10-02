Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318CBB2753
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 06:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D77910E76A;
	Thu,  2 Oct 2025 04:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f4dUk6iE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013068.outbound.protection.outlook.com
 [40.93.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5A810E16B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 04:00:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl6/IFpwoAvpFTQR35a80WBuF24Kun8+k8SBIeskkoKBhMiFTwHK+97OachdiylcAIVM5yk1HRWUfbVTgFQ0il9DWij2SGzPHP6ppT2dNruDQUvLdO835CiHpCoqLG9BxhMNOx/oHG5wvpTv3ztYoX0AaePBTXpn/u/2c75NcmCmmnsj8f1qpoynRrt58vnZyULZY1P4HysMRBsmRAePOBn9DyYTcTzgKBXA2ibKv7TvqFuhqv/qobaZU0CAe6L+87RL0N9R5joaud3atXUMVH95IKdvgaxptFZuizqdnVV4I8D0wX/SG391Fc8RjE1WmdNbPqX7jFbG8k1SO6SS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3GiRR8BNBolMmv/1/nuIffVR685IJ510nd1YpOjtdE=;
 b=MmldMXB1+VCxvmtoSbnCyK8dMYJAU8iD1Rz+JxHcnhmKvVEokYVXz7eTzikrJjRU2RefCFF4tJGvmHyA8FSnigUfniZXG1wgqhdkRo3LOrKr+RWfyFBbVCpA8LTUmFnfg04+u03KeSXrpCEIVDs4DA+eDLoT5cAqv7AIqEEIfqB/Fwl+fjdvADCU75XoKilyntQcZaAh3dDb/svjjVuJrpB1hKHCwTKxeLDps7JUKodfnzeo155H3QLCzMWouunp3QMlxMPexv4/buWzLSbUa0LAIFWNQQ3mNOmx828uvXXclQBozWtGMykZ3346oPfYJBnynJVDwUnESnBX/onYWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3GiRR8BNBolMmv/1/nuIffVR685IJ510nd1YpOjtdE=;
 b=f4dUk6iE8rJRwcyWIVL9YwrMoDtwcmiUR6cgDR1BjMJNslpn/fHAjkm1fp9M7DqqGbZrxkYeDdpdMbdxRjbUfjRM07tM9tqFxS2jHKxwBW+T4MJzwqCDsUij6z6DVHzsVroJL86+Um1ECnWYjfiea44xmby2o90oTMqmZAR49fnxhXvyKXDF4BRmRUQHl0GEQWGqbvDUxXJbvDCbih2Ct2ppT2QTC2KxnufTct+ZEK+uH53OnQpiyz4Y4jDyQkLy+q2JQrTxkOy3Hd022ClOdpwNPMy1ENqDZR8MP2Y24T6b7yX1YwZIs8y9CvxDNE+VWhCcDvn3nXomHzbcvM2OwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW6PR12MB8900.namprd12.prod.outlook.com (2603:10b6:303:244::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 04:00:24 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 04:00:24 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 15/22] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Thu, 02 Oct 2025 13:00:20 +0900
Message-ID: <3665995.U7HbjWM52l@senjougahara>
In-Reply-To: <CAPVz0n2pibxHzZS_s2i6ZzP1FEcUYCuH=aP8oM18RoivF4xY9A@mail.gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
 <2368735.QZUTf85G27@senjougahara>
 <CAPVz0n2pibxHzZS_s2i6ZzP1FEcUYCuH=aP8oM18RoivF4xY9A@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW6PR12MB8900:EE_
X-MS-Office365-Filtering-Correlation-Id: c77fd457-06d0-4f13-95c0-08de0168370d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2pRb0R1eDE1RThhRlBMWlMyMml6bnNCcHRUYkNlT3ZNS1VQaVlFVk1DMUZw?=
 =?utf-8?B?V29kdktBSm4rNGxLajVyN3FCSnovc3F5U2cwNkt0OWlpa0xBeGhRWmRqOXdm?=
 =?utf-8?B?QVZvSTlUb1JMRFVaMjhiUDZHSyt0TWxpcGN4UmVxVjQzaDM3OUJZSWNuS2RC?=
 =?utf-8?B?WEgvcm94dVQyanEzdDF3dGRxWW1VcDAxQ3ZlSEY0YlFiQlhrdk83aU81WXA4?=
 =?utf-8?B?VjRBZ0V2dlpucXBPRUlmYWF4b2FodU1pYis0bTNLaTNZUVFLYjdaanUxQWll?=
 =?utf-8?B?SXpMcVZ2dUg2SEhpd1h5Wk9JK05BR0xibWFSaHNZWWIzOTBJTGQ1czV0Umhw?=
 =?utf-8?B?MG93dWFiRWZYcEJwNGFXMVlFbG92bEtVYnFtNlNDTGRIMnJFOFdoakV5MU1E?=
 =?utf-8?B?aGNWY09xczN5YmRvK3pPZ1B2bmpTbE80ZEVObmppemhzZlFoUkkwOGhXaGI4?=
 =?utf-8?B?MWs3NldpWFpCV3VQTDVHbERSOFJHTjFoejh2OFh2SzVKZHlwNklBSktrd2pi?=
 =?utf-8?B?QlJhaFZTQ1RCSGxFTGFoaEVMdjEvNXJ4aVU1S0hWNlBhTDJwaXhoMlRGWnht?=
 =?utf-8?B?ZytsRlNIbXhUa3Y0SjlrM2tUK2RJQjVNc0EzL05icXI5MXdiWnB0aGxLK21Q?=
 =?utf-8?B?bFpFOFhwNWNtVm9xQ0hiNk9hc00rRGtjb3hIVUhVRTBjL1BwS21KNHJCNG5R?=
 =?utf-8?B?ZUE1NWF5Q25NOXY4L2lrcDV3OXI4OG5vWUk5NTV0bHRuZW5WT2sybThCVHYr?=
 =?utf-8?B?Z3I4bEFTenBZTlNZWlQrcnZabmhVa2ttSGNrU1FkSUtZLzl3dytaUFQ4Tnha?=
 =?utf-8?B?RDRsNDFYTDY4Tkt0V2Z6M2FrdnR6Nm5uL1l2M3dXc2Vsbm1kQmJnQ3Q3NXZO?=
 =?utf-8?B?SGx6WkRVcWd5TUY1YmF1RUIyWkZXUmlvUUROR3ZBcmZzZ2N4eDRTK2lYRnlj?=
 =?utf-8?B?WGR6b0ErMUJYUSsvQVBFQnN1UVU1YXdESHZjYUd4UmgwREtiMlpNdzdjRmZM?=
 =?utf-8?B?SGNSTlpyUEVrRVhCTFBPZTdTc2dhbXNiTjBCKzhNTmh2amZXMXRtWEM4THlL?=
 =?utf-8?B?SkQ1aUl0MmVDUGNUWWtWMTZ3YXJqSytiRGFKMU1ldmlZODZ0QTRnOWVudXJS?=
 =?utf-8?B?aXkwWHFyNFk4ZiswakhMMnFiMWpUM29GMmhDbStaaXpaVWtLbmRPVUJFbERx?=
 =?utf-8?B?R0FyeFhEYUd6cFgrRHh5L1NNZ25QaE4xN08yYzF5MWlqUDdnSTQrSU5HY2Zq?=
 =?utf-8?B?MWZXL1cvMXlySDdIQmpnU1VHUkdXT0dyeS9FY0d5ai9UUlpQNDVDSFBaS3px?=
 =?utf-8?B?eS9qOGZIc0J3OWQ5Y3hlMFNyb0F3a0EzNDlHdXVhY0c3Uzcwa0dQRHNDdmFx?=
 =?utf-8?B?bG41dGdOTmNPNGlTa25iSHBMYVNRaFdCTlUwaW85VTJldHJTcDlpa3dIV0Vt?=
 =?utf-8?B?aDdHcCtMMnFTUVlKNCsyQmZYa2NadmlGeitPTVBBdm9LWlFlSlBUSG44RWow?=
 =?utf-8?B?NHg4Rzczc1NobGhPalo2RnpDZmF3TUMramNET3VFY0hsYzdsdkx1dTF1NjhE?=
 =?utf-8?B?VWVmVm0zam93YXJKUTB2WlVWZEthUWkwdHJ1RE55STdBQUlkYkg1S1pkQmFB?=
 =?utf-8?B?elJ3NTVrR2h2TWdEWkJab2tZUi9HZDBzdmdaMXBYb1N4Tk94NnhEdjMvaHFp?=
 =?utf-8?B?S3lRdGM4Z0N1RS9ONmt2M1lIaGp0anhNa1JvUWIxdExCZEJ4L202UGZWMVFy?=
 =?utf-8?B?a0NxRmVRbkJscWhvdGtpWFFTbUVtVHlJdWdmZmw1MmtnYXBqKzVuUkFPNnh1?=
 =?utf-8?B?aHV2N2lkZ1hsZjgzWkMwejNwRkV5V3BCT0Roa1AybEpMVGdIdlFZUXRjcjFM?=
 =?utf-8?B?S3NsNm50M1FXU2g5ME1GdTFEay9wbGc1eUtyNXczZjJpbUJVRkhUVHpMajkr?=
 =?utf-8?Q?wyrMsVu33DelTtIMZmpNXxjaUSqmNURh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0NWL09lSFhkbk5KMkM2L28yZCt3ZXNhVTErMUx2WENYdktBc3QrVDdidGVX?=
 =?utf-8?B?L29INUdTVDFKUzFQNXhqcmZJMlNQcHlJUlphaElGR3JjcDlCeXdDQ2V3cWRj?=
 =?utf-8?B?bUdZZERULzZJQWhteHk2d0VLZ0VLMDU3WmhKME5xNHlvMWkxQTRwL2Z6dkI0?=
 =?utf-8?B?WFQrYnE4akpHbWFmOTcrRVdoT3dyajd4RnZQWnNKZ2labTBuY21Vc2NOd2xt?=
 =?utf-8?B?YTBTZnZteTJyaER3S1NiSmhQTHNSOGU4OFcvQmFPRzU3Zmt5T0pZT281Smtz?=
 =?utf-8?B?T0N3cG5xZTc4bTRYV2xkZ1drNXdhQ0pseVovdGhtMXZyRmM1UHdyN0xKMHdN?=
 =?utf-8?B?MkovU3U0UFdrc3NIbTFoeDlMYXkxTHN1c2ZWS0RpMi9GT0h1NS9yVUZybFdS?=
 =?utf-8?B?T1JNUFlQNDJxWkpMSC94NzAveWlFNVlBWmVZRHRXZHp1S0pFM2wxUnpSK3gw?=
 =?utf-8?B?bVpQTmdNRDFtNDB5emMrelZkc0FLaE9Cbm5FRFNUWHFIbnBtTEZSdWkzMFZH?=
 =?utf-8?B?cEYxcTBlSTZYWGsweFJXY1dzTStYKzRVcGdmWjlsMnhRN3NOemx5L2R4VWph?=
 =?utf-8?B?SExNdGs4T2lTdXpPckpkUmhURWlKNWQ1cDM5NWNyWld3VWUrRE9nQ25DNjFo?=
 =?utf-8?B?UlpGQ1Zmb3FwNW9zamE1WDEyR1pISGdLc1loV2FrSFhuTVBrcUVWUllERGZ0?=
 =?utf-8?B?bzdJUTF2dmk4blM5UzAwMTREc3lQbXRoNUFXQVUvenkxL2dycEVBbHZLeGN1?=
 =?utf-8?B?dVdRVEhRR3AvekRpQW1aVnpsRzdYSXVNLzBLaTdsaFhDRTgwL24yMStsMDUz?=
 =?utf-8?B?ZzYrRmdrK2p5QnM1bEhJdmNnQjVoeFRqakN1a0tISnhURkthaEl0RExuN2Rj?=
 =?utf-8?B?WVhxTDNXK1c5OEpiaURudHpGVFdrRW5iVFNQMnd0N2RKRENTWUVtYkNJQXFD?=
 =?utf-8?B?K2ZTUy9XYjRzcGsrMEtVdW9tck1hcU1pZFpwcTlqVUFzOVZZMG5ZcmhGSlBr?=
 =?utf-8?B?ZGR6MnNKdVJSMHJENkNVTTVGV2cvWUY3Lzhnc05XemtWMDVWU3FibDcyd2Qy?=
 =?utf-8?B?d0dNSTJBZnBXYkVFLzFuRXpWYWhIc3F5dkVEblp2TjIyaS9uc0srNUlHRmpr?=
 =?utf-8?B?bndCbnlnZHFGRW92aWVYamlRNzVyWDAvanREdURKMjFJMGdkWVdDUUdoREh5?=
 =?utf-8?B?NkdVdUM5U0ZXTHFzUkhXSmZxTlV1bitGVGdub2N4TEdVVWJrUElvUXU0dy9X?=
 =?utf-8?B?TWU5ZlB6TWhsZWh0cDJSUDQrRDBCODRCblpzN3hQallGSU51ek80aTg2VERK?=
 =?utf-8?B?ZDZwV09qaUhkaU80UFhDV0lXNGN1dUtrK3ovR1pFbW1hNitVd2NrVGI2Y1BX?=
 =?utf-8?B?MVhaQnJmaEJvYTFRaGYzbWRYQmx1Z3FsL3lRQnAyNVhnVURtQ25GaTEvUjc2?=
 =?utf-8?B?cS9SSzBlUVBpSyt3R3lGM0hDanVNN0poRCtYU0xpdkl3akUwMzV6djNUd3lU?=
 =?utf-8?B?TytTTEhUT1ppOFVISnBPeWRkRWJ3NGNFcnlFa1JmWXhsODdOTUpIbFh3aHRo?=
 =?utf-8?B?cTExZWE0bnlXMWZNeTNhVE10K0I2NzdETTdSbkx2MXI5cnFRZ0ZDN2Vuc0x5?=
 =?utf-8?B?bHpPTU5Tck9qSUI5a0V0V2dhMHZkd1QyeldoSWNOM29FdHpqdkloclR3TnU2?=
 =?utf-8?B?SCtVR1RhR0xNQktIN3lFRW9ueE5UNUlyTnJIaldwdm9rdjhZdmdPRUplMmVh?=
 =?utf-8?B?UU5zNTZxNE9OcGhHV1hwQXBCd1UvQXlGMFdtQ0gvSHBUZDZ3bUhpRS9kUWJJ?=
 =?utf-8?B?MGx3MWdTRlpYYk9HbFloUFJCWEhkZ3lyV1duNWhqMUhlSmFZWE94VFc5eUts?=
 =?utf-8?B?RHl4UmRPbVdraUFiM1R1b3Q0U3JBbndrYW1CUXFOdjM1UjRjWWVvS3RGMGlM?=
 =?utf-8?B?Y2xRMnoyR2ZGYTh3NjRUanFySzltei94anZZZ3BtT1U5cFp2K1FOUmxJeE1a?=
 =?utf-8?B?WXdMK1BTa0tkRDVHUGdXUTBqZ1NRcDFVaEJpMGdoVUQ0WTFQSVhSSE1qRWRV?=
 =?utf-8?B?UmNoTHNYdzlkTXROWHFFMzhFUjZQOTUwbC9OSXNNUzlSeTJtcGRjVDk5YXVo?=
 =?utf-8?B?SFhDZHk5b1RpYnBRQ3pSNTBLV0dWWm0yUWJQa3Y2MWVyellDVk4rbmdtb2pu?=
 =?utf-8?B?Nk5jQlluSXpkSEpJdS8vbFRPUVU3V2RwSkpEQkl0QzdKUGdBc202MkkwaFJu?=
 =?utf-8?B?enZ0b0pyeFNvSnVybVp1UjFtWW9nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77fd457-06d0-4f13-95c0-08de0168370d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 04:00:24.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bdESpY2d8kRtwsbhcKs4nkiksfTYyxnqfr0F3BV6nRnGRW5kmDOXGkqpz/R1EhWCQtHZSmqteEh1pjl4nLTaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8900
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

On Wednesday, October 1, 2025 4:59=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 10:=
51 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wednesday, October 1, 2025 2:35=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE=
 08:07 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > =D1=81=D1=80, 1 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=
=BE 07:38 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Friday, September 26, 2025 12:16=E2=80=AFAM Svyatoslav Ryhel w=
rote:
> > > > > > Simplify format align calculations by slightly modifying suppor=
ted formats
> > > > > > structure. Adjusted U and V offset calculations for planar form=
ats since
> > > > > > YUV420P bits per pixel is 12 (1 full plane for Y + 2 * 1/4 plan=
es for U
> > > > > > and V) so stride is width * 3/2, but offset must be calculated =
with plain
> > > > > > width since each plain has stride width * 1. This aligns with d=
ownstream
> > > > >
> > > > > plane
> > > > >
> > > > > > behavior which uses same approach for offset calculations.
> > > > > >
> > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > ---
> > > > > >  drivers/staging/media/tegra-video/tegra20.c | 58 +++++++++----=
--------
> > > > > >  drivers/staging/media/tegra-video/vi.h      |  3 +-
> > > > > >  2 files changed, 27 insertions(+), 34 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/driv=
ers/staging/media/tegra-video/tegra20.c
> > > > > > index 7c3ff843235d..b7a39723dfc2 100644
> > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_=
pix_format *pix, unsigned int bpp)
> > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TE=
GRA20_MAX_WIDTH);
> > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TE=
GRA20_MAX_HEIGHT);
> > > > > >
> > > > > > -     switch (pix->pixelformat) {
> > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * p=
ix->height;
> > > > > > -             break;
> > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->=
height * 3 / 2;
> > > > > > -             break;
> > > > > > -     }
> > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > > >  }
> > > > > >
> > > > > >  /*
> > > > > > @@ -305,6 +293,7 @@ static void tegra20_channel_queue_setup(str=
uct tegra_vi_channel *chan)
> > > > > >  {
> > > > > >       unsigned int stride =3D chan->format.bytesperline;
> > > > > >       unsigned int height =3D chan->format.height;
> > > > > > +     unsigned int width =3D chan->format.width;
> > > > > >
> > > > > >       chan->start_offset =3D 0;
> > > > > >
> > > > > > @@ -321,8 +310,8 @@ static void tegra20_channel_queue_setup(str=
uct tegra_vi_channel *chan)
> > > > > >
> > > > > >       case V4L2_PIX_FMT_YUV420:
> > > > > >       case V4L2_PIX_FMT_YVU420:
> > > > > > -             chan->addr_offset_u =3D stride * height;
> > > > > > -             chan->addr_offset_v =3D chan->addr_offset_u + str=
ide * height / 4;
> > > > > > +             chan->addr_offset_u =3D width * height;
> > > > > > +             chan->addr_offset_v =3D chan->addr_offset_u + wid=
th * height / 4;
> > > > > >
> > > > > >               /* For YVU420, we swap the locations of the U and=
 V planes. */
> > > > > >               if (chan->format.pixelformat =3D=3D V4L2_PIX_FMT_=
YVU420)
> > > > > > @@ -332,14 +321,14 @@ static void tegra20_channel_queue_setup(s=
truct tegra_vi_channel *chan)
> > > > > >               chan->start_offset_v =3D chan->addr_offset_v;
> > > > > >
> > > > > >               if (chan->vflip) {
> > > > > > -                     chan->start_offset   +=3D stride * (heigh=
t - 1);
> > > > > > -                     chan->start_offset_u +=3D (stride / 2) * =
((height / 2) - 1);
> > > > > > -                     chan->start_offset_v +=3D (stride / 2) * =
((height / 2) - 1);
> > > > > > +                     chan->start_offset   +=3D width * (height=
 - 1);
> > > > > > +                     chan->start_offset_u +=3D (width / 2) * (=
(height / 2) - 1);
> > > > > > +                     chan->start_offset_v +=3D (width / 2) * (=
(height / 2) - 1);
> > > > > >               }
> > > > > >               if (chan->hflip) {
> > > > > > -                     chan->start_offset   +=3D stride - 1;
> > > > > > -                     chan->start_offset_u +=3D (stride / 2) - =
1;
> > > > > > -                     chan->start_offset_v +=3D (stride / 2) - =
1;
> > > > > > +                     chan->start_offset   +=3D width - 1;
> > > > > > +                     chan->start_offset_u +=3D (width / 2) - 1=
;
> > > > > > +                     chan->start_offset_v +=3D (width / 2) - 1=
;
> > > > > >               }
> > > > > >               break;
> > > > > >       }
> > > > > > @@ -576,20 +565,23 @@ static const struct tegra_vi_ops tegra20_=
vi_ops =3D {
> > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > >  };
> > > > > >
> > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > -{                                                    \
> > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > > -     .bpp     =3D BPP,                                 \
> > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP=
, FOURCC)      \
> > > > > > +{                                                             =
       \
> > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,          =
         \
> > > > > > +     .bit_width      =3D BIT_WIDTH,                           =
         \
> > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,           =
         \
> > > > > > +     .bpp            =3D BPP,                                 =
         \
> > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,               =
         \
> > > > > >  }
> > > > > >
> > > > > >  static const struct tegra_video_format tegra20_video_formats[]=
 =3D {
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > +     /* YUV422 */
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > > >  };
> > > > >
> > > > > Looking at the code, BPP seems to only be used for the line strid=
e (i.e. bytes per line) calculation. I think we should just make it 8 for t=
he planar formats (possibly with an explaining comment). With the current c=
ode, we end up with 'bytesperline' variables in places not being the actual=
 bytes per line, which is confusing.
> > > > >
> > > > > Actually, we can then just make the 'bpp' field be bytes per pixe=
l as it was before to avoid the discrepancy with Tegra210.
> > > > >
> > > >
> > > > No, this code is actually cleaner and in sync with what downstream
> > > > does, Tegra210 bytes per pixel is confusing since it totally neglec=
ts
> > > > formats with fractional bytes per pixel, it is impossible to set th=
ere
> > > > 3/2 for example, which is used by YUV420.
> > > >
> > > > According to downstream code bytes_per_line =3D
> > > > soc_mbus_bytes_per_line..., downstream directly name is bytes_per_l=
ine
> > > > and soc_mbus_bytes_per_line returns width * 3 / 2 which is correct
> > > > calculation (12 bits). Meanwhile for planar formats Tegra has 3
> > > > different buffers so with offset calculation plain width must be us=
ed
> > > > (which matches downstream).
> > > >
> > >
> > > If you mean use of BPP by VI, I can propose removing bytesperline and
> > > sizeimage configuration from VI entirely and leave this to per-SoC
> > > fmt_align function which does this already anyway and guards every
> > > time those values are referred. This way there will be no instances
> > > where "places not being the actual bytes per line" comes true.
> >
> > Without trying myself, I'm not sure what approach is the cleanest. In a=
ny case, the downstream code is just wrong (or incorrectly named), so we sh=
ouldn't defer to it in this matter. I don't see a reason to keep the value =
'12' either if it doesn't serve any purpose (admittedly if we changed it to=
 8 or 1, 'bpp' would be a confusing name for it, but explainable with a com=
ment and improve-able later) I don't mind having an if/switch statement for=
 the planar formats to use a '8' as multiplier instead of '12' if we need t=
o keep the '12'. But the main thing I want to avoid is a bytesperline/strid=
e variable that isn't the line stride in bytes.
> >
>=20
> I am proposing you a solution, handle bytesperline and sizeimage in
> per-SoC fmt_align function.

Ok, I think that sounds good. It's good to consolidate the calculation in o=
ne place.

>=20
> 12 represents amount of bits used per pixel, 8 for Y plane, 2 for U
> plane and 2 for V plane, total is 12. "but explainable with a comment
> and improve-able later" why then we cannot use 12 with a comment? this
> is all arbitrary. Downstream is not wrong from this perspective, you
> don't take into account that YUV420 is planar and it uses 3 planes a
> whole Y plane and 1/4 of U and V which in total results in wigth + 2 *
> 1/4 width which is width * 3/2

Yes -- but AIUI, the only thing the bpp value is used for the bytesperline =
calculation. When we add the special case for planar formats, which doesn't=
 use the bpp value, then the value 12 is never used anywhere. We should at =
least have a comment saying it is unused. (At that point, we could just har=
dcode the bpp values in the fmt_align function -- but I don't mind either w=
ay.)

>=20
> > >
> > > > > >
> > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/s=
taging/media/tegra-video/vi.h
> > > > > > index bfadde8858d4..5cbc0606ed6c 100644
> > > > > > --- a/drivers/staging/media/tegra-video/vi.h
> > > > > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > > > > @@ -281,7 +281,8 @@ enum tegra_image_dt {
> > > > > >   * @img_dt: MIPI CSI-2 data type (for CSI-2 only)
> > > > > >   * @bit_width: format width in bits per component (for CSI/Teg=
ra210 only)
> > > > > >   * @code: media bus format code
> > > > > > - * @bpp: bytes per pixel (when stored in memory)
> > > > > > + * @bpp: bytes per pixel (when stored in memory) for Tegra210,
> > > > > > + *    bits per pixel for Tegra20/Tegra30
> > > > > >   * @img_fmt: image format (for CSI/Tegra210 only)
> > > > > >   * @fourcc: V4L2 pixel format FCC identifier
> > > > > >   */
> > > > > >
> >
> >
> >
> >




