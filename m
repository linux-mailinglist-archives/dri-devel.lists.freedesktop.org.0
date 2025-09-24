Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF43B983CB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 06:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FC7310E0DB;
	Wed, 24 Sep 2025 04:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c8paAYRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012033.outbound.protection.outlook.com [40.107.209.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FE110E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 04:47:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihzds6NSb9SMZB3HBI33A//p0Om8Xo8j0mult7w6jeKWbNzkR+f3fRoRkaACSizG0uyxnUuyVTnD6l8qI9LSSZivpe9fnKfFjod2lPtgvS5aXO/0+cMz6GD9Lnw/aK/p/IXlUia0FJdc8KrMCbvj5MpjOX/h8zSq5C+CkVj3PvB1v5sc1MyDxNhroi8/fQYhm6mpVSAM8bZ3PgFnYVTvxkwQvrjT2OrDI8cLd+eNn0XxhtiEYKHEF0FIJLum+YWvuYhzbqEz8TU/oCpS+5w0++h/GwkCziAXxGJeAtcg5B4VPEWS8HbGZjV1lVtwQ+w063tYRCP6b4XUGTGUhhnTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6Z0TO69KHqEWwCxXxjprD9Y1+YpAo3wEX4Syn7/g0U=;
 b=SMURxlvgvHAXCWiM/RkjqG11fGs9tBUJiheJq8rYMOGiXg+j/3ilIqLA2++9da56iy68L+iwvfZgWgEHaFqQyy5KTMVjdzxE4NoAo2SHmhzBhVynaUbGGj7HCwXO3sfTyDdp4hamiQdUl8RwQm+5Dj6XZCpFuvHvRfBR7TUqqgAoLC9L2uGbefa90RfsYlBkNy62QlfIxEAzPuaYVZSoEP48JfyoxaaQu4uGP+TDd2qVvTcaK14/r9GwBn0ZnO1Q78lANbrZ+eA5qFrAoy1ewWKtgv4+BdTIqICy0rXcVi0pavjVziKtmbeuyCOdZhHnyYvrc/P2l3VlK3POgCpzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6Z0TO69KHqEWwCxXxjprD9Y1+YpAo3wEX4Syn7/g0U=;
 b=c8paAYRriWcbW3EM2OfACdT4TB4xlQkVroQkBaWUEGlwrBq8/pv2VR7vP7aQ8HITnJnW7Bi5T1rQN1Vw3BCOyKIl+rvz57M5bUgNtxnIBCr0GnMWv30TAWNx5Ic/tFXNoRhpWDTtq6+qf4L94YbgCzawr4MyQFRCl9G7hZBuYlu3rgZAq05FZKZhDOJHq4PU/dfMsVKCAd90epcYgFV+jPnPGRq305jxlYmEl+WEg9L7JIFJyw2/8IQUI2GYHCnz10iISlQzGTGwKwsuKPhbzDRsSnMtF8oBHTxzvmiX/IwjTBG2jlScGTt6ErvVzQldGrp33oglXuLGTu4nYFdo1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 04:47:18 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 04:47:18 +0000
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
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Wed, 24 Sep 2025 13:47:13 +0900
Message-ID: <16036554.JCcGWNJJiE@senjougahara>
In-Reply-To: <CAPVz0n1YDdM+EtuO72CNqVE0opJLt5KfONNGenuSKO678mfc4Q@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <CAPVz0n2iRVBf0+BwdV6Le2FhY8xERqbtsyeff26Dh44mKsTy6A@mail.gmail.com>
 <CAPVz0n1YDdM+EtuO72CNqVE0opJLt5KfONNGenuSKO678mfc4Q@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea4ab43-f091-4bea-f35f-08ddfb257095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitaSDZVSUhMalZBNnF0U0VodmJQcnpPdlRvNVNxSW5UZm1CcTdQNHUxN0Nl?=
 =?utf-8?B?SVJub0lqNm9OQnRzdDFJZGcyamY5ZWNYc1hCc0xPbFIzNjhnU1YwcWRwcGQv?=
 =?utf-8?B?SU1SVEhOVnpicnZRcFlrZlpFYnlIWUMxZmVTWmttZzhrRW5qM09LaWhxZ2lY?=
 =?utf-8?B?Vis2SnVWbUdvL1dwaHVWdndLWVVEcFZzdXZmRThTVGZwOXRrSy8vRVRQSENT?=
 =?utf-8?B?WXk0SkRENlVpZ0FvcVRlRzlia3NsN0FnU3FzTFcyTXgyY2RXSXJpNHBiSTFs?=
 =?utf-8?B?VEFla2ROSml6aWZZYXNpYWl0VUwvbjY4VHRrZERuclFZemw1YTM3T1dnMlB2?=
 =?utf-8?B?Y0g0Z2UwZzg4VXBGeHg2NEsyeFdxdDRMWWJhRUl6VjUxL0NnU2p6ODg1VzFX?=
 =?utf-8?B?U1hxN0N2K2JUVWdDU0Q2OUgxZmZnNElhbEhqWm5lNENFVkJJNDJDbFAyR3Fh?=
 =?utf-8?B?MjFubVBpa016RzFxRDRlK1d5Tnk4bFNvMS9aaXRROWVXb2xHeUhtSlBJcldX?=
 =?utf-8?B?SnJOaks5Q3NWWG1hN3AzbTJPQWovcHVzejJwVklhUVFEcjFOTnNvTml6QjFh?=
 =?utf-8?B?VlltQkUzcnhqR3k4U21BSEdUdys0MjhyaWlZWThlUjNsT3k4UXNZOTJPdzF6?=
 =?utf-8?B?SWlGdjc1T25DbDBjS3EzY2JOaGxsNy9kWWxWSUtrc2NvWWc3cC9ka2pBOE91?=
 =?utf-8?B?Skt0bGFYQnVhSG5wVUFiVTJkT28yYXF3Nlk5YWFIT21tMGRoWG9JbnJmK1RE?=
 =?utf-8?B?TkJRc3o3QndKZG9mbHp0NmtaK1BsV0dnbWJKaXNmS1NGemxJc3lqNlU3TUFE?=
 =?utf-8?B?ckF1dFEvSWdjTGczekRraTlqV09NNVBLMWxJUXpnazFRaGhoZVNoUTkxbm5B?=
 =?utf-8?B?L1RqcVBqaXl3S2pJVWx2YU4xaVNmVnpJWFZWSDBqRjEwSGNxNHFKUXV6THB0?=
 =?utf-8?B?Z0l1b1M1aVRGSFRVSmd2VFFsNHFhbWRIOWEyQ2tua3pZUk44TlZOYTZLZ2Ry?=
 =?utf-8?B?cDBadGUzY3FYbys5NTRGNEt2RzQ1MmltZnNmOTJuWUlqN1p5RGgvdUhWdllu?=
 =?utf-8?B?d2oraWRPaXZVQWcvSFhvMmh0Z01Mb0JsTWZBVkpVSTZ5ZEptWjg4MTE3bVEv?=
 =?utf-8?B?ckd1ZW9lcFhEb2lVcnFRVDBrY0FKZUxSVUJnSVh4cUlLeWhzbnZwbm9mOXRY?=
 =?utf-8?B?NktZVWVZTWRyZnZRU0FIdTNlK2lTeVFzQWhreXJMbkVadllTaTBUSXJjUWFp?=
 =?utf-8?B?aG1icXdpYUJBdXA1V01mN0JvRWZpdzEyRGcyU3hWdFpOa1gvU2s1cVdtU00z?=
 =?utf-8?B?UEJ0TWxrNFh2L2d5M0ZOSXowNThGRXlnUWkrMHMyLzQybVk1eU1lbGxOTkUv?=
 =?utf-8?B?cFR6MUFNVDI5SmU0d1pnOGFvQ1krR2g3WDRsUHlQYVZiYkM5TUlGTVRiV3ph?=
 =?utf-8?B?SUN5eFBDZi9GNzJYWDVqd2pPcVJYQzlubFo2WXEzcW9HSVdvdGsrRTkxRFdh?=
 =?utf-8?B?NU02MW1JeG0xcVZGbGY3TEtwK3Y0bkE3NmFYbGRxeWhrbnczZEZvVnk2UHdQ?=
 =?utf-8?B?UXh6N2RMdVlZYW54Y0MvbzFXdnovdDhWS3ZWVElSRXNPS3FZMzRFeW5YMUlq?=
 =?utf-8?B?WEJOL3B1R21idlRLMERhOGprZGgxY2ZSV2RwNHZhS2xQbnp5d0tCTEVaM0tT?=
 =?utf-8?B?eVlNRjZJTlFxU2dFVGZydTdhRS9KQ2hxeFk3QVhXMEVpZ0NBTjlOYndPbXJN?=
 =?utf-8?B?VjZxT2Q1aWI2S25yTnY1TkdCMkFoQXV1Rm1kSndINUg1YytFS1RJQjlnMXNF?=
 =?utf-8?B?TXR3SmFJUDhZdjJPM3JIdmgvcHFYZm9lSjI3STdTaXRzaitSRXBzTFhTUS93?=
 =?utf-8?B?WG5Yd0RZYS9NVi90MnJXbFVTZlhUSHZoem1SSDJkb2I3VkUxNVZnMkFEZ3Zj?=
 =?utf-8?Q?xLc5cBnq+CI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1dFbnFoU0t5MzU2UnA4VGt1SzNSd3N4aGxyd0VGWGN6OHlPdUwxN3ZnaW9y?=
 =?utf-8?B?OHh2WFlOMEtiM1J0MGdOSWtyeGFrQXRkdHp1Tlh5ZVVTZ0hqZER3QTNXeGV1?=
 =?utf-8?B?eWM3VHE5WkRoa0xjaVBUL0xCZHR0NUpEbHZwVmk5eVNNOHFnNDFFdWJNbG1E?=
 =?utf-8?B?aFl5b0x6bDUwSzhpSFFDN21LM0pCWE9vYzI2aFQxU25YYUpyL1hWWXhPdkJQ?=
 =?utf-8?B?U1lZMmlmWGloTjBjUG1wVGlGaUQzV0dMWkxTN1BYK1VoRGtEeGhZZVpscFZY?=
 =?utf-8?B?Wnc3REhZc01XaGxLWW5WMWl0SkpyWnJVb25xWTcrYTNSZkM4dzdadXIvSWtM?=
 =?utf-8?B?Z2l4djdpZUZ1d0l2VHY1dGpuQnRQeXRhVTh6bFU4YWRlOE9TS1lPOWlZUUww?=
 =?utf-8?B?aDlWRTZVcVZwSVlza05VZlNkbmllSFVOMWkra0pPYXRzYS9wdjAxRTJES1BI?=
 =?utf-8?B?K012dGx4dlNidnhpQWkvUldkbVRIeEU5T2sya0dhbk9jRzZFZDVFYlgwRnV2?=
 =?utf-8?B?UmtUZVBpZG03czRnMDMrelF1QjF4RDArYmw1bW4wV0N1SzJvQkdVbE1vUDU3?=
 =?utf-8?B?RVFXSmNsSzhJNHc2YXhpaVRUTWN3MnhVanNoWjNENE1KRmtIdkxITHNPNWtI?=
 =?utf-8?B?aUJpM3EyckxtbVdMSDdvOW92RFNubE13bERpT2x2L1Y5MmVXMDdGRzBTTFlN?=
 =?utf-8?B?TTljaEhqRUlEWklKL2gwQkYyUnd5ZW5ydEhrcEZaY2lFZGQwSDI2bTBEZm9v?=
 =?utf-8?B?QlN1KzU3YktoQWE0N0tmbzZMVi9NOVUzOVFudUxKS3V0QXB2T1RWWVk3L2JC?=
 =?utf-8?B?VmlhNm5PTmxxYVpOaXpOY25WZnN1eUxGZ0VWbWMwdmd0Q20xbWNtN2s2Ym9O?=
 =?utf-8?B?aUUrckE0eHdoMlRFTVZycGMxWkRYK0JPYVF3Z0hXRFVrY3JJaVcrTFVDdWhz?=
 =?utf-8?B?UGR3MVZ5UlozZnBlS2dxaFZHR0l0Ui82OEN5dGF4L0JxUzBDbURsWVpKM1g4?=
 =?utf-8?B?b0lRNUNwWkNoOEJURE9QQVFkYjI2dWg3L2Q4QWlPYUkyYzdoSlAzSmZ1OVYv?=
 =?utf-8?B?a2RNMVExdFl0cERjNXhCaC9uT1FJNHR0a2M0cmFXZmdiS1dSZHoxTVlnUnJK?=
 =?utf-8?B?VUMvZFhhMFA2Z2t0dzVheTdBRzNMemtqYTBMZUE0d3VzeVliaVZSVk5lUDlr?=
 =?utf-8?B?Q3h2bHNScU94anUyUmVNODFDQjByTEsxM2JBZUMyL3hCdmV2SHBJZDkxL1F1?=
 =?utf-8?B?TlVsVkFXWDR0RFB2a2xrSWs1R3h1WnI5S2w3amRzbDNlVUJDeUJFTkF5bjFF?=
 =?utf-8?B?Mm5mTHVta1FVNUdUNEVZaXIxdENucjc1TGd2UURkSlZQbzE4WDd1VW1JeU5m?=
 =?utf-8?B?OExnQlRUTHNFaExoMjdsRC9xWkdIeWpnWWFRR1c4dU9wNmFsOXdtQ1BFT0xE?=
 =?utf-8?B?dWt0cnBuM28wdGFoZ1A1Q3MrV1d4RmpwTzZhTzVKSVBIa01tdFlBbm10Y09q?=
 =?utf-8?B?WEpLNEMyU1Q1NmdFNUwvQmwzcndxM1d1TUpJaFlLdTYrL3FUK0dHNnN3RGl2?=
 =?utf-8?B?cE5SaHRkSVp3NitZdmcwNjd2TnNjSmQydittS2xtV3JZQWljb2xVMmxwY1NP?=
 =?utf-8?B?R3Z3WHlibHpuK05uSHVxSDhGTlZrSjdCamIrMEdZbzZtcWlhVGVYL0VVSSsy?=
 =?utf-8?B?bGdpeURPaFVDaUhUL1E0MFhmYkhLREZBY2RmN1FrR2s3RzhaYk5LOU1VQzZr?=
 =?utf-8?B?SStrSjNYSHhwYUZmZ0N3blBsSGNRc0oyUzVZcDd1ckJ2Q3dqL3dwSERFb2c2?=
 =?utf-8?B?UnREMmE0aThNZ3JGZk5vWnVKZTVrcmwzaWRUbm0xWFMzWExvTnZmME94UnBn?=
 =?utf-8?B?Wnd0eURDM2RWMlBPUTNpZTZTNHFEM1pvbWlmaG40YlFMTTNuenpBRFQ4MXFx?=
 =?utf-8?B?U05mVXJtYUlGSEF3M05nYUtCTGE1ZXBNcjJ3QXJ5ZjFadEg3c21FZmFUeUlW?=
 =?utf-8?B?ci9JWGhoZ3NHRm9JRXR6cmk1Mm1CbklIWGUzYmFqalN1b1pHOVB0Z3BwMlZY?=
 =?utf-8?B?NmkrempRWDhiUkd3L1paZFRHMXZ3TzBsZkxiNm4vTVZRbVp1UjdSb3RWYnQy?=
 =?utf-8?B?NWhWdjlMMVAxTjRxeXdXV1AyZjdKeEkraGhlR2tjTGduYk04SjduTkN6UVNy?=
 =?utf-8?B?bWp0UXd1VDdoSVBBVnlQRXo5amk0K0MwcXJVWDNhZzQ3bCtwSmlLd2o4dm9s?=
 =?utf-8?B?YjRLWmtPeWMzZktZR2o2ZlVBQ3R3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea4ab43-f091-4bea-f35f-08ddfb257095
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:47:18.0961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdeW1+Ur/Aa8MhZ6OOVSQLs8wG/MStXSUSk2gSvDxx5xvc3+mZC6H+l1cv52Y2zVFZ4gs6PayPxR5tE9nwmc3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478
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

On Tuesday, September 23, 2025 3:50=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:11 Sv=
yatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:04 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Monday, September 22, 2025 4:36=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 10=
:27 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wr=
ote:
> > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=
=BE 09:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >
> > > > > > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhe=
l wrote:
> > > > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =
=D0=BE 07:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > > > >
> > > > > > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatosla=
v Ryhel wrote:
> > > > > > > > > > Simplify format align calculations by slightly modifyin=
g supported formats
> > > > > > > > > > structure.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > > > > > > ---
> > > > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 +++++=
+++-------------
> > > > > > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > > > > > >
> > > > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.=
c b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(stru=
ct v4l2_pix_format *pix, unsigned int bpp)
> > > > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WI=
DTH,  TEGRA20_MAX_WIDTH);
> > > > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HE=
IGHT, TEGRA20_MAX_HEIGHT);
> > > > > > > > > >
> > > > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > > > -             pix->bytesperline =3D roundup(pix->width,=
 2) * 2;
> > > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 2)=
 * 2 * pix->height;
> > > > > > > > > > -             break;
> > > > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > > > -             pix->bytesperline =3D roundup(pix->width,=
 8);
> > > > > > > > > > -             pix->sizeimage =3D roundup(pix->width, 8)=
 * pix->height * 3 / 2;
> > > > > > > > > > -             break;
> > > > > > > > > > -     }
> > > > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * b=
pp, 8);
> > > > > > > > >
> > > > > > > > > Assuming the bpp is coming from the format table below, t=
his changes the value of bytesperline for planar formats. With this it'll b=
e (width * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Downstream uses soc_mbus_bytes_per_line for this calculatio=
n which was
> > > > > > > > deprecated some time ago, here is a fragment
> > > > > > > >
> > > > > > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbu=
s_pixelfmt *mf)
> > > > > > > > {
> > > > > > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > > > > > >  return 0;
> > > > > > > >
> > > > > > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > > > > > >  return width * mf->bits_per_sample / 8;
> > > > > > > >
> > > > > > > >  switch (mf->packing) {
> > > > > > > >  case SOC_MBUS_PACKING_NONE:
> > > > > > > >   return width * mf->bits_per_sample / 8;
> > > > > > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > > > > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > > > > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > > > > > >   return width * 2;
> > > > > > > >  case SOC_MBUS_PACKING_1_5X8:
> > > > > > > >   return width * 3 / 2;
> > > > > > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > > > > > >   return 0;
> > > > > > > >  }
> > > > > > > >    return -EINVAL;
> > > > > > > > }
> > > > > > > >
> > > > > > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified =
as
> > > > > > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > > > > > >
> > > > > > > Googling this brings up the entry
> > > > > > >
> > > > > > > {
> > > > > > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > > > > > >         .fmt =3D {
> > > > > > >                 .fourcc                 =3D V4L2_PIX_FMT_YUV4=
20,
> > > > > > >                 .name                   =3D "YUYV 4:2:0",
> > > > > > >                 .bits_per_sample                =3D 8,
> > > > > > >                 .packing                        =3D SOC_MBUS_=
PACKING_1_5X8,
> > > > > > >                 .order                  =3D SOC_MBUS_ORDER_LE=
,
> > > > > > >                 .layout                 =3D SOC_MBUS_LAYOUT_P=
ACKED,
> > > > > > >         },
> > > > > > > }
> > > > > > >
> > > > > > > which matches that you're describing. It doesn't make sense t=
o me, since it at the same time specifies PIX_FMT_YUV420 (which is planar w=
ith 3 planes, as documented by include/uapi/linux/videodev2.h), and LAYOUT_=
PACKED
> > > > > > >
> > > > > > > /**
> > > > > > >  * enum soc_mbus_layout - planes layout in memory
> > > > > > >  * @SOC_MBUS_LAYOUT_PACKED:             color components pack=
ed
> > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored=
 in 3 planes (4:2:2)
> > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored=
 in a luma and a
> > > > > > >  *                                      chroma plane (C plane=
 is half the size
> > > > > > >  *                                      of Y plane)
> > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored=
 in a luma and a
> > > > > > >  *                                      chroma plane (C plane=
 is the same size
> > > > > > >  *                                      as Y plane)
> > > > > > >  */
> > > > > > > enum soc_mbus_layout {
> > > > > > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > > > > > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > > > > > };
> > > > > > >
> > > > > > > i.e. non-planar. The code in the driver is handling it as thr=
ee planes as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_B=
ASE_ADDRESS_V. Since the planes are separate, there should be no need to ha=
ve more than 'width' samples per line.
> > > > > > >
> > > > > >
> > > > > > I did not invent this, I have just simplified this calculation =
from
> > > > > > downstream, output values remain same. I have no cameras which =
can
> > > > > > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot t=
est if
> > > > > > this works either. Other YUV and RAW formats were tested on rea=
l HW
> > > > > > and work perfectly fine.
> > > > >
> > > > > My understanding from the code was, that the MEDIA_BUS_FMT_ forma=
ts listed in the video format table refer to the input formats from the cam=
era, and the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI coul=
d input UYVY8_2X8 and write to memory in YUV420. The code dealing with V4L2=
_PIX_FMT_ values seems to be related to the output to memory. Is it possibl=
e to test this (your camera -> VI converts to YUV420) or am I mistaken?
> > > > >
> > > >
> > > > Camera I am testing with has no YUV420 options available and from w=
hat
> > > > I can tell there is no way to force VI to output in YUV420 unless
> > > > camera supports it. Any format manipulations should requite hooking=
 up
> > > > ISP, or am I missing smth?
> > >
> > > From a quick look at the spec it looks to me like for YUV422 packed i=
nput formats specifically, VI should be able to convert to YUV420. If that =
were not the case, e.g. 'TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV=
420),' would not make sense anyway as it's talking about both YUV422 packed=
 input data and then also YUV420.
> > >
> >
> > After additional checking you are correct, VI should be able to
> > perform YUV442 to YUV440. One of the reasons why VI is not exposing
> > YUV440 may be video-centric nature of the driver, so that it exposes
> > only formats supported by camera and VI. I will double check which
> > formats video device exposes. What should I test exactly?
> >

If you are able to test, I would like to see the following (with YUV422 inp=
ut camera, VI set to output YUV420)
(1) Output image is correct
(2) Check output image bytes per line (e.g. with a hex editor)
(3) If output image bytes per line is 3/2 * width, try changing it to 1 * w=
idth and repeating test

>=20
> Alternatively, since code that I propose matches in output with one
> that was before, changes can be applied and revised once there will be
> such need. Especially, since YUV422 and RAW8/10 work fine and were
> tested. I am not sure there will be many use cases which deliberately
> target YUV420.
>=20

Yeah, since it's a pre-existing issue, that makes sense. However, I'd still=
 add a comment to the bytes per line calculation with a reference to the do=
wnstream code it's based on, and that it produces an unexpected 3/2 * width=
 for YUV420.

Mikko

> > > >
> > > > > It's certainly possible that the current code is functional -- if=
 bytesperline is set to a too large value and that information flows to use=
rspace, it could still read the buffer. It would just waste memory.
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->heigh=
t;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  /*
> > > > > > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops =
tegra20_vi_ops =3D {
> > > > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > > > > > > -{                                                    \
> > > > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,          =
 \
> > > > > > > > > > -     .bpp     =3D BPP,                                =
 \
> > > > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,              =
 \
> > > > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_C=
ODE, BPP, FOURCC)      \
> > > > > > > > > > +{                                                     =
               \
> > > > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,  =
                 \
> > > > > > > > > > +     .bit_width      =3D BIT_WIDTH,                   =
                 \
> > > > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,   =
                 \
> > > > > > > > > > +     .bpp            =3D BPP,                         =
                 \
> > > > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,       =
                 \
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  static const struct tegra_video_format tegra20_video_f=
ormats[] =3D {
> > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > > > +     /* YUV422 */
> > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UY=
VY),
> > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VY=
UY),
> > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YU=
YV),
> > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YV=
YU),
> > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YU=
V420),
> > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YV=
U420),
> > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > >
> > >
> > >




