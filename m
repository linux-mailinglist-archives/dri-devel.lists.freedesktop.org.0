Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA98B8800F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 08:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FCF10E222;
	Fri, 19 Sep 2025 06:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dipW1msm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012038.outbound.protection.outlook.com [52.101.53.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B5110E222
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 06:33:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON9jqpG6pC/H+Q5RW5CzeOdGko8ZApvXFWZKoLn5/FKDCYZoMUxly334JBGx7+E1z+cB/8k4Leaf98OCrc4uAuj+LYvHCFyV6f57Ba3UcBcuTLQ1bIgNH81T/CkbZRA2gtcmWoqWqJagoy0Czdw5KL/1eoGVYgwDC2YDqkyP0SqqbvZxiKMGziUpozfihkHTyBiNMB7B7xZDG+7Gr+nj3bQ2tQ927j2cS/2QAwQGogOS1/lZNppx5VhLi9PQeESH4/Znwxp5e059sHfu/VCM+0GGjRV5hnKg7UUjxLdZkalTpE6yGBrlG8IJnEkj0H0QXh7D2lEdvPDYC8ASN5tE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1vUxRO98hn4p4qZIjX7PmcLcvXSOwhCwVGfa6hZHDg=;
 b=dCcpfEPQQhWsKIc1lPzLike2Fy82rUgJ9Q69kpsH7KwUsLAj+9rNj9QkzqsdySHG71FcekL2H/qIKNtSbQAlEnT+FsKswbAOIFo/0hntW4+3YnwbOmZuTvf4qD57IPJLf0d5UrBNjXnpqESxfzIAHRIEKkLC5i66aVaRl/N4wuwxqZV0cUU4dHWdiS67PNFapyKnAS9x8ihOhFrLokG8Nn8PDBxwDJSZ4XFTIAIVX3ZGUV31z4SvEAZVVRYXC89Eevu/idWlXU18g4dKHtyIx8ihHO7tOewJWHuANjMnbV5mzIopy2O36TXUaBbDLuqCs9ePWmyg647vUweeWAksUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1vUxRO98hn4p4qZIjX7PmcLcvXSOwhCwVGfa6hZHDg=;
 b=dipW1msm903hmGB4hcVgB5R0M95lLZLswG4Yf8AmF/004Bu4LS6e8iFzZqZt3eFihYountV3vJp9GjQaTKedrhPEkws1TrUQ/zs5eMwfJ9/wbW3gLVrRM/caPrWKf1IQ4sx/PPcC1VP6Dk6B4BxM2KsldhOTzlzMOFSLGADX0hPLcRp7x8KAdLb2Ka6uoOZXmVeG+r/T0Pd35edLullButzDRjIQCYXV7bQIazXimLr49mSsKzZH2/DL/xp4vmhpFWDeR7i/IR2nzgtIIll6J4Z/KqZPZ1X/9OHsDuS4EGAwYrEpa9HTjYn7aH4Hcr22xGmFr7s69QwWuXmBM7qwhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW4PR12MB6803.namprd12.prod.outlook.com (2603:10b6:303:20e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 19 Sep
 2025 06:33:51 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 06:33:51 +0000
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
Subject: Re: [PATCH v2 03/23] clk: tegra30: add CSI pad clock gates
Date: Fri, 19 Sep 2025 15:33:47 +0900
Message-ID: <2918362.NG923GbCHz@senjougahara>
In-Reply-To: <20250906135345.241229-4-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-4-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW4PR12MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd3fc8e-e165-4ab8-9d5a-08ddf7467f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZitHWEVJdGJBdUh1NXZjbkNSSnA3Skx1V1ZzZmpORlArcVdsMFdhdVZPYlN6?=
 =?utf-8?B?TEc3eFJ4WU1PSGM1d1lwbXhlZWxBZElIYVphRlh6SnpJaE1iTFE5OCt0anlW?=
 =?utf-8?B?R04zR3M2bGFGbDZzMm9WU1RZaHpaOTVlTmFFVGFEQ1llZ2NKN0tsRkx0YlIw?=
 =?utf-8?B?SWliQU9XSzVrRFpqcGFrSUxEWVBURHdsUW9xVEV1VUpqdFFiWlRSRVlvS2ll?=
 =?utf-8?B?aVpPUmZQNksrdE1CY0VZZnJUUTU2TlVMUWNJMUxtQWNGQmQwVEloWk84dmxT?=
 =?utf-8?B?Vi9TcmxFaTdQR1FuT1V1NlRRN2VkOHN6WDMrN2xMZ0k1ZHlsaXRnNmtUSmJ2?=
 =?utf-8?B?T1czZ29DbUNKeVp4R3ZkSGY1bmFjK3I5MjB3UFhNWmVTdFhIRjZPbVQxREtl?=
 =?utf-8?B?anJaNXZNNnBIeTZDTjNXU29HNHAzSXRiYXFMLzVSTkx6M2U0VSs5dUhUMFNE?=
 =?utf-8?B?djhtb2N3NFY0eldDNWFtd29KRlNTRkhuZnVwWXB3YklnbEpCbng1ZHY2TWJj?=
 =?utf-8?B?RE5teHhNbW5zMFBOWTBrd0ZGOE92OTJuVk5Wb3lqaDFFUW1RWVhDVnNqNExB?=
 =?utf-8?B?TUIyYlk3N29veFJxcVNzbnRxdFFsdnA1OHNsbWtOQzFnQXlMRDJQY3RxODd6?=
 =?utf-8?B?blUzWGJGWlYwWW1JdGdkQnFRaEwrRkhIbFdHcWtpZmhWMDRLMCtPSzZnRjJa?=
 =?utf-8?B?VmRXRlVHNVM0cHZQc3RuUzZYYWRnaDNMeFdhMVM4Uk10TVNtSmMyNWd4Z3Uy?=
 =?utf-8?B?aGJQVm0xNWtJVHJWcUwwaWRFaHc2bmJLd1dDRHdvd0RoQ0Y2RkxGcEF3UU54?=
 =?utf-8?B?MGQrNG5TQWUvVHNYWUtKaXh6OURRRFI1RUJtcjViNkpZUWpTTHZ5Wkh6bHNi?=
 =?utf-8?B?MGxhYWcxa1lES1JGcnpnd2hMaCtuVDU3dmFyR3NoQlRLMVdKSGROTVhKK0tP?=
 =?utf-8?B?M2QycHdHditzYndMWU9TYUFvVDNkNHREc0I5WWh5dC9FN09MSHRyN0F2TzRi?=
 =?utf-8?B?b1VMQjlxUHJ4eDJWYnpuN0U1WXhPSCtJdW5iV1NqbTNrVnhScExKdWZNamxz?=
 =?utf-8?B?YXVDS09oUDNweWRKV3RGcmc4SlNsMFFYdVdDRmFiOEFHT0tGbWY4aUl1VFVx?=
 =?utf-8?B?cVNrUFpJOWRPWjhoNjZSTmhpbytpOEU4VHJLSjJYWkkzMmM3MXVFNzZqMXF3?=
 =?utf-8?B?WnZ4cDF1cWVGdU5vVXhLblkzZFJ3dDh2ZHo5cWlUMEJJUEREM1FOZ1p0QTVU?=
 =?utf-8?B?WFF2RFIzZkpaRi9nZ3VoV3pSZDBVWVBGYmE5VmFNSllYTHJQaHlMTndnRmNJ?=
 =?utf-8?B?MWpPTHdmZ3piUHE2ZEE5UEJaTDdjdlZkNmVteTlMTnFVQVNZYmlCVWcrMW5F?=
 =?utf-8?B?V3FNNUdiWkJDS05sY0J3ZFZ2TXNkdmw5K3NCN3BNU0lyVXJKWlg0ZktMUGtW?=
 =?utf-8?B?Szlsc2l4Nm1WUFYrUFAxZitUcFlpNmpWRDIzVjNKN1FKbkdFUnArWkNaRjFs?=
 =?utf-8?B?ZWFQUlQ1dStkMDJ3WlZJalRpaE13M0tQSXFvVXFaSXMzclYvU2lVM2lKT1p5?=
 =?utf-8?B?eWxuS2JwZ2FMY1poeXg3Q1JZM20wamVSR0grZkRKcTB0Z0NoVDdLQURGVnFZ?=
 =?utf-8?B?akExWWRENjJtVGYxTWVQdnBhQ2puUzg3QXIvSFJKd25sUDM1TDJWYmd1QkZP?=
 =?utf-8?B?amNtLzA0R1ZXSHNNcHpBdTY2ZHhCalVtM0FMNDY3c2s2QUp5Z3RhY29sL2s1?=
 =?utf-8?B?K2FrS1FmWmlmdW5ldUJqRlFvRVNleFhqYTNqZHQ1ZERNN2w2SHZGa1hodTlq?=
 =?utf-8?B?R0QxN3Q1ZC9FVHVSZXJhTHNnOUo5SXZvQmlBNEZaamRvNUJTTU5sTFl2dFJm?=
 =?utf-8?B?QW9GaWpQVWU5VFBTV3g3dCtYQWVTQWdRblNQOUhCa25iWWY2QjBtMWVVR3dy?=
 =?utf-8?B?cVlrcWE4dW9BZnMxaXFkRVd2UjJwUWtucVJ1SWVPSDQ1VHdoQWZBSktUbGNk?=
 =?utf-8?B?bzVpa1RHbUFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFXbTlZSW1wRlVmQUZabUxlMDBOb3NiOFRWek0vOVpSdndxM2E1ajlsYlM3?=
 =?utf-8?B?T2tyU2lJbXBUa3pWRGJneEVjaFBWRkVCSHJBaWZWdGtXWkxGNGEzenBmS0J0?=
 =?utf-8?B?cDhtYkFIRnN5QWZhQy85eTBSRWYxNnJMc21YeFhEMWlRUGhVUG42d1MzRmZ3?=
 =?utf-8?B?YVM1L3JOMU9RMkQ1UE0vZzNKcVI0cE9zUGZUMVhNK2VTalpMNWtwck9WaDB6?=
 =?utf-8?B?cE81bnRHR05GVzRzeHMyYVlEeFhCK0FVVDMwZFQyL1g0WWhCb0Vjclo0SUlo?=
 =?utf-8?B?eENkbDJqbUlRcWFMZlFPODhlR3hHcnFnMTdyR01tVzlXU3FXbExaTkQwYndQ?=
 =?utf-8?B?K3RXQ0JrNlRmSlY4bVA1bnBwNVZablF1Sk85eS9yL21LOVN2dVZDVEtLNlh3?=
 =?utf-8?B?TTJFZlJKWnkrWTVsMVQyMlJzMWFEVTRTa2ZDVi9tbytnbDFRbUUxVXpuSGxn?=
 =?utf-8?B?dnBaRFFuZGF6WjYydUxnbDlOQ2o5bFdFcDNLS2pFVnB0SE85V0hBZWtVRnk4?=
 =?utf-8?B?TzY3MzN6dVZualZHdWtJZEpPWXpqTmxkZW5pNEIrZWdGM0xOc0c2Vk9nOGhD?=
 =?utf-8?B?V1EwUVIvU2JOU1NJTWJRK0ZTc3NIZ2YyRTRHTnhmODR0TW0yZCtjRXk2SHFl?=
 =?utf-8?B?a2dkVlZrWTJZcVRwYTdkdnQzNmp1ckZQSUYyT3pwYkVycHZRSkE3SGNZZGxr?=
 =?utf-8?B?ZW9DNE5mMG9KcWtFNHB3YmtsbW1WbWtrd3ZYTExYNFVKM1lDVVF4OWMrRFRN?=
 =?utf-8?B?L0lqcU03ZkVoOVlaemZzL2ZvU0JRWmJhWHloNHVQM3o5aXJXZmJ4WnZ2dmJs?=
 =?utf-8?B?MWFDYjBBcENFY3RwQTdLWHRRU3VOR2FlWEd4M3RxcC9kcDRxVHp2cGNWa24r?=
 =?utf-8?B?QTc4NVpmZGJ2QzZHVGRaOGI5SlZGcm96TU9KUnhKNHFRYStiL2VXL29LYXYr?=
 =?utf-8?B?djEvRVMxSkhlSzg3VGdOemRudE5WQ2g2UUNONGxvb2EyQzlSdmYyUi96TjRH?=
 =?utf-8?B?Y0RpeDZhOEJ0OFpPQkE2WXk2MTRldTNucitzTHRwUkhsOTUrd2M0RlVvWDVa?=
 =?utf-8?B?THRJK3VkazB0cU5vWjYrby9aTnZqRXVWWkhaQjdVNzVCdmdYSldQRzRvdHZG?=
 =?utf-8?B?UjdXcFJLZzBKWHdqSTBZaW04VTlzSGpTYkJiaStKUlVMSGMrMXRybExXa0FX?=
 =?utf-8?B?QVNFVWMvTCtDUkdoRkFua2dHSjNsSFVCeXpSYnlKK2FKZU56YU9lOTJUcFJs?=
 =?utf-8?B?SmRWTU9SRk5naURyM0o5MG8ySzhQdDF4SHd2QWVBd0I0aXFmaFVURHlzbTFX?=
 =?utf-8?B?TUI2Nk0ydmxSWHBNT1hiZE1BRHl1VXBXWktiL3M3ZVlGWG1CUmJ0T21hTlJY?=
 =?utf-8?B?MWNXWUY2RWVQbXI4NmZOcDIxR0ZOdFFHTFhKYWZIZTZQQzVGamMwckUvNDNS?=
 =?utf-8?B?Snh1YnE3eFRZNFl3eVdnaVpFdjZpalNCOHRoRjByS3dsdVZZSk4yTnh1UmRw?=
 =?utf-8?B?VElJOWZ2cUxZMWYwcUlRMWpiMUVkQ2JJU3NWc2dWUm4zNGwzTEZzc1VtSDVH?=
 =?utf-8?B?a0szR3I2RHlQNG5nUkd6Z01RV1c1bVozcEtWNU5QWUJad1BrU3diU211TFBM?=
 =?utf-8?B?SFh4eGllUkdMbUpjZktCZnRpTWJLOXJNQ3o3K01lOXZ1em4vMVBHTnJ5bFRs?=
 =?utf-8?B?dlhaaG03SSswd0tpL1piNmo4bTJ5a1dxMHFPSXNZQ0xGRy9QNXlOZWVpMWpO?=
 =?utf-8?B?b1EwN0pVaWxyRGhWWEVGd3NpZGpMY2Nmai81dUhPaXFvYWs5RjFoUUpDNU5S?=
 =?utf-8?B?R0U3WUd0T1IwaFhXcmhLb2hneXhsTkxrMzRhakE0VklWUkNkUG9GaGJiY3pL?=
 =?utf-8?B?dFNmTUFncnk3TVVQSmdYa2ljNFlTS1h3bjVmT2ZBT1UwNmRXVXIwaTZSejZt?=
 =?utf-8?B?SU42WGxFZXBILzZydEUzU0YyaVorT2dUUDZZQWZScWR5dFBqZWRWMFRYODdU?=
 =?utf-8?B?RWZwM3l2WXhLbHhLaE5aQ2VuaVFaWWt0UUplcE8vSUpQaUM3UE1OcWRia2hV?=
 =?utf-8?B?NUdsQWY2N2owLy83Nkd4YjRzL3R5TGR3SUtnWXhEbFR0cGtpRnp2Qmlmc1FT?=
 =?utf-8?B?eEhuQS9ybzFkN1pCSTljOHJOZTFQUWJHZXI4THB1QzNON1hBV3lZMzI3L1E0?=
 =?utf-8?B?NDQ0cUM4RnN5SVM2WnBiTm4xWGloZ2d4U1dMZTNIZVFqUVBSMnBuM25yNXFm?=
 =?utf-8?B?QVA3L2Zqbjdzd0NtOXJCL01qRG5BPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd3fc8e-e165-4ab8-9d5a-08ddf7467f24
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 06:33:51.2068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7guAdpXwSk5VzuB/fQK723jUkAkW2phWjETmuTpm2YpLYVBT+gLsqnt1S0t+b0ld4x9O3yBf/z0cMOz2kowcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6803
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
> Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
> for the correct work of the CSI block. Add CSI pad A and pad B clock gate=
s
> with PLLD/PLLD2 parents, respectively. Add plld2 spinlock, like one plld
> has to be used for clock gate registration.

I might add a note that the spinlocks are needed since both the PLLDx and C=
SIx_PAD clocks use the same registers.

In any case,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index ca738bc64615..61fe527ee6c1 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -154,6 +154,7 @@ static unsigned long input_freq;
> =20
>  static DEFINE_SPINLOCK(cml_lock);
>  static DEFINE_SPINLOCK(pll_d_lock);
> +static DEFINE_SPINLOCK(pll_d2_lock);
> =20
>  #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
>  			    _clk_num, _gate_flags, _clk_id)	\
> @@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
> =20
>  	/* PLLD2 */
>  	clk =3D tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base,=
 0,
> -			    &pll_d2_params, NULL);
> +			    &pll_d2_params, &pll_d2_lock);
>  	clks[TEGRA30_CLK_PLL_D2] =3D clk;
> =20
>  	/* PLLD2_OUT0 */
> @@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
>  				    0, 48, periph_clk_enb_refcnt);
>  	clks[TEGRA30_CLK_DSIA] =3D clk;
> =20
> +	/* csia_pad */
> +	clk =3D clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PAREN=
T,
> +				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
> +	clks[TEGRA30_CLK_CSIA_PAD] =3D clk;
> +
> +	/* csib_pad */
> +	clk =3D clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARE=
NT,
> +				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
> +	clks[TEGRA30_CLK_CSIB_PAD] =3D clk;
> +
>  	/* csus */
>  	clk =3D tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
>  					     clk_base, 0, TEGRA30_CLK_CSUS,
>=20




