Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E86B3F532
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA0710E5B5;
	Tue,  2 Sep 2025 06:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iXAPUxN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD38E10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucSDieymfyENf1olPHcCkMCBvgfDgiVuA/9cBcqYs/MOGfeSN1R6GN2eC+1uXx4KOd8Xju53f9YBo6KZMKPQHMWF/3vBZeCUYrXuvaUdEe5MBCp+5Kz/2Mj1ZKL2ADBE8hyMHW0pBhqkaUhj1rZULDHUsMpCN1X+rTX7v5IwN6giP17dJiTa0DgmvBo1ZnfrQjowDqa4Mu7/TyvA2E2BAfgg6JVje9j5hzMXdt+m1JVjz4jhkzBPwZKe1JNGk+5R1rgCf98PjOohW/v6B3YGfGkoBpA1MDwiBSC58YWT24Y/hX4IJw2U//9jpKtfi7yfqdublclKiCauLgFFgpCteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ppn6NebkGPaYt1LJxUSv7eUW9K6ryqBv6PGU5YJbuO4=;
 b=XShsTHjQ7X3+HghOzaKBgPUjx54x3yoGUk0pQlVvz2pA0aE/BCDoZ3NTYzojj02eFWhqKcstfd1E2ypP8o4CygExw6Mq5ld+T2/2kRMLmwJHRFJy4AtHR5O3eBn5SPI8ket7leNHobiVjefyy/UNAgCAKUfiZ27NFGfE4lc5H6FPWfYque3H2YHLRP17BCaQtz0IGZ3cYZdPqxgV36M8HNFOprD2cmfTRr5wSGz6e006Xx/Y7IZhBhIXyVgwX/ZzsiVjZzgdjVt94MjGC1SnsLBWYOFYpUkNC+gwQQpzxMMKhu2zOjWz03f2M5VJULs6TPXMbuiKWp8GAhNPffsjGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ppn6NebkGPaYt1LJxUSv7eUW9K6ryqBv6PGU5YJbuO4=;
 b=iXAPUxN4gXVH0MZQ9vYepXJs3B/A7njhJj8jRbxFY9bcnKSy1ZRPXkD1FU6dq12QvzEsQwIISnayoZV7X6QpcdomR4mBhAFt8AIDJ1N8UVRgrLmZfD1ImL/g1HZNU2Szac9Sa4ARal+QsN+eVnND+3RJZdZugY8CULcWCrjJ25oXdCDyWf3tevcxAgl01lYLbzsfrJjE1t/7N9+9w/8OD/DfbEonvej/WyO4AgBN6HfxdqoWGK1XQjsopiuLxV2JO0P+VXt0IHrhcXfEFk4tKLqTUBzj107h2q8LsnRuSJ3bC+pVz0yMKj4ee2HvIf6KUYtisLHDaMhfkzVEEaFkqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.25; Tue, 2 Sep 2025 06:17:57 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 06:17:57 +0000
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
Subject: Re: [PATCH v1 19/19] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Tue, 02 Sep 2025 15:17:52 +0900
Message-ID: <4776680.aeNJFYEL58@senjougahara>
In-Reply-To: <CAPVz0n2Uv9s6O9EqGA9nRYHnv2Uq1-nTeO2jtE_g9OApks7QNw@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <3643424.irdbgypaU6@senjougahara>
 <CAPVz0n2Uv9s6O9EqGA9nRYHnv2Uq1-nTeO2jtE_g9OApks7QNw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: b6164f0e-9fe1-4a25-f2cd-08dde9e87564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTl1OFMxTHJGWXA1dnZ0cG55TVVRUFk1R1RrMmVrWURNZTFmUVVVZ3NFS216?=
 =?utf-8?B?a0ZpbXl1eXE1czVFWWkzdnpGYXBtY2JiYUs1MUZLSFAwTWZTRWw1emRaUENS?=
 =?utf-8?B?cElvSnZ6QTZSZ29sVXY2TEY5bmdRK0tjZ09IOWdjdzRuelp5bVVXZ3NSTnNx?=
 =?utf-8?B?R1c3ZDd0ZzdVOUI3YmJTakFYVjJRWlI0dHc2eStSYnNORU9LQnRwNGJVeXJ6?=
 =?utf-8?B?K29LVjc2ZHFORGZ6aUVSQUZzcEx1ekVWaXI4eWFBMVRVMVo4ZUlDVkFDaFdY?=
 =?utf-8?B?d2V2Ky83eVRGMXpWQ1BsNEY1SUpwYWphWEVDNTNYMmRET0FvdUIzbFBOQ0ta?=
 =?utf-8?B?bEJ5UVA0WkpoRExMc3NRUVp2WVdEUHJZbk5xa0VPeUtYeElxKzBqUjJ2L0JG?=
 =?utf-8?B?TGJIVW5XMVhjNXh5VlpKNnpnT203b05GSEJhMUxUZTRRTGhMRXk2UzdwaTRr?=
 =?utf-8?B?bW0vQUEwME9jekN2andRVnhUMm5nL0lqSFJlWHdjeklQbG14VmwzZGloM2Ft?=
 =?utf-8?B?ck4wUXhua2hsMzNNK3RPRjlUeTgxSnRjZFhGV1lsUFV5Nlc0WndjWk1PZjRx?=
 =?utf-8?B?Y1RwRDk2RytpZ0thT0wxaFRvWUdLRlo4TFJxWTdnYkhodW1IZlp3cUcrMmth?=
 =?utf-8?B?Nm5ySmlDU0tYcWhza3hVTFNSL3dtelkvcGJBSHl3ZTFwLzhUN1d3ZlZzTTBs?=
 =?utf-8?B?NHI2TFloaVBza3ZMR1VFdWt4eGp3dGtiMjl3T2RJL2JNU0FiSDZwVmJFTlM5?=
 =?utf-8?B?SG9wUTM2ZEUrZ3ErUjhTT0lpMTlQcGowNEp1Wk10VFEvQ1gzaDh6VzJsVDl4?=
 =?utf-8?B?RFMveFpvajhlTUpoUDBJQTlTeWd5S2pGM0IvQTVEL3ZTZGMra1F5T3paRXp5?=
 =?utf-8?B?MUFwNndzUmQvSHJrN2FlNXFEZ0c2M09aMnFFdW5xa2NlYjV0OXRTT01qbGQ1?=
 =?utf-8?B?ZFZpZzBmTVRyUk1WblJQVnBxV2R4L0l3YXJ1NzhqbDBkMjczUUU3bzEyM203?=
 =?utf-8?B?a0xVUnEyME5sc05YRWEzMmd2QWdhKzJSYUpkbEhwUHR6Zk1QN1VhNmJjekta?=
 =?utf-8?B?cXJyMWpqMGJmd0NDZVRSS3l1VCtGTnJBWFordWdBL0J6a0xuWTdwaDNLckgx?=
 =?utf-8?B?WVFUYy9EdXRYQmJMWjdZQkZkWVMrdk1odEcyNGFiRUN3MUhUeFZkTDJKUVN2?=
 =?utf-8?B?QktzN2VoVGJxUXhEd1E3aFI3ajBNYm50dy9BcTJmbG9BbW92Q0p0UzVDREFO?=
 =?utf-8?B?Y1hTOVhXMmxLaDgvMnMyU25acEtKT0VMa3krcFE5WStHeDhmZ1ZPeEpEY0pa?=
 =?utf-8?B?Njd3Tnk1L1ZhVVBRTkhzdU5neWpOamdFOEZ2eS8xZHBkTjRkdE5UNDVPcWRP?=
 =?utf-8?B?enhSbitWdjJTSjFrSUNxSVBPSDNJWkw4Zmh2RVlrWWdDeG1waXVBNHVtZ2Vp?=
 =?utf-8?B?MzZwRXVNRjNOM3E5RHhqdUFORmovbld5NDB4WWcvVTIrYS9iTUxib2M0N3NH?=
 =?utf-8?B?bjd4QU9Nb0lBd3BVR1JXTWF0TzZqQ1dDSTE0WjNYZ0w2eXNFZWowdkx5NHpv?=
 =?utf-8?B?QUNvbWpuSEhCZFRzMzZIY0t6OGdWUFhNSkZNWW81aWNZczZLcWNseVNha2h1?=
 =?utf-8?B?eDJQR1RoTXMwTzV0NXUwdEpsRjZ2Wjd0b1ZJZnNVelU5SHpIVnhWSmwyK1R0?=
 =?utf-8?B?NWtLK3ZUS0NTcSt6OEpxT2tSTHNiWnNXcTVOYUZEVmc0S3FZVmx1V1BZUGx1?=
 =?utf-8?B?ckF6WVBBU0YxeUQ0bTQ3NTJlMmNHRStZekVEY2hiL0FVRDcyY3pqWjJHTjM5?=
 =?utf-8?B?SGdlR2VoNVlZWmU2SXhXckxFM1RnT3I5Kzk0K2lnQXkvd1B4dkpEaGpHZENF?=
 =?utf-8?B?cGhUVDJMaFRnVzIvTlBna2hPT0VrZ051aklMVVdWYkwydUYrNHRQUFFGRS9V?=
 =?utf-8?Q?HPQapgYaKlU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1dKZ0swSjJWaWcvTnJsSmowV0V3OExwRDhXd1VrZWk4T0dOLzdzaU1pT2o2?=
 =?utf-8?B?Q05PM0p3MjdsNkNlOVZIY01sNnh0b3FCS1VQQmlMMENXSTY4dVVmNk80Y0pa?=
 =?utf-8?B?eXlXZGhVcjh4bkRWeXlnQUwxM1cvTnUyRkxuVWdIM0lSa3pwVEt6N014TFF2?=
 =?utf-8?B?UlUwbFBBeUFQeEZVa1lqNnk3aEt0T0plVVZiVElIS2VqMjJBbG5QNm9BMWNE?=
 =?utf-8?B?Sk5DRFhXN05iWmFpUDFRK1JOUzFjRlVFNnYrNnhabkQ1TU92Y0t5R2hWNWFt?=
 =?utf-8?B?clk0bkJJMVhOT0k0YU5FWmlBTThtOGhoUTY2S2F3d2VBdTNmYmpyTG9HVmEz?=
 =?utf-8?B?WHkzeGo2VmtBblh1UERzMFdOQnM3ZC9mY3lwbkNMTWdiSXgybmYxVDNDcUoz?=
 =?utf-8?B?NVJKQkVpcFRkc0t2VFZscThianRvMndaVXYxSnBOWG1acVZnZ2pzd09YeFI1?=
 =?utf-8?B?cmNYbTNQMkhrU3JDZk4xdkU2Y3MyQXVEMlFsWm5hUjN4bTY3NzRlVkJJWnNZ?=
 =?utf-8?B?RStyVXFBNHpYMkVOQXpvK3JBNk9iMTdDbWlINUpDWjFvYkJucjRBbmZBUEF1?=
 =?utf-8?B?RGxwTEl3eDBlc1l4R2xWa25sV0pSMmI5c2hkMlVKNjFPT2dpamJybU10UXA3?=
 =?utf-8?B?YUsyWmFxZWZEejNjVWJTalZveGJDSUhtb0VmQWIwcy9rTHpjSTdwQW4xOW1i?=
 =?utf-8?B?MEpxS01kb0dzR3lwZnpjL0ZsNWNWNjJPSzRkT1FyMGx4OFUveThySThaZFNH?=
 =?utf-8?B?YlppbU0zdlJCTHo1WElTUTJyZ3ZXamVDd1hnWURHRTJsM1NhazNpeHNBdncx?=
 =?utf-8?B?OTRPelRxSy9HdmtKU3Z0UVpScnl4VXpGTDNzaE1SVzRSeEhxY0MzUzlSWWZo?=
 =?utf-8?B?N0dsQ0VPVnlycWxmNnpqck9Kc1VBbGt2bzdVNFgrT3E3U1VYMFdCeFRnT0NR?=
 =?utf-8?B?R09sVlJNVkswUUp6eXhEQU44MVR3TjlEOHl3ZFFMWWJFais3ajh2amZzUkJM?=
 =?utf-8?B?VzdESnk4WXVjZjZQOURWZFFoMkhJNld3TUt0SVJOL0VadHd1b1hBbnpHMzNx?=
 =?utf-8?B?V2Y0ZnRjSEthQlpkQk9hTVlGRkNSdVBhWnhnNERmVmFrTWp1eXUxTDMzcWEw?=
 =?utf-8?B?OFRyQ3I4S0NZU3hKRjBMWkVaKzlGV1RVeWdUdlZLTlhta2xmZ2ZQS1d1RGVp?=
 =?utf-8?B?TEhMZW1ZSEF5cXhmbU1ZaEtxVlIyVkJiRnJMaXJwRTM1YXJUTURreUVqMUhz?=
 =?utf-8?B?M3hUT0FFRWhGUXI5YkFRRmZIWmZhL2R6eTk1MWx5MG11N3dXaGpTQUxESTB6?=
 =?utf-8?B?aDI2TDEwUGg1UmVVemFwV2FJRW5tTnY4YlQvSGttbXFJZFJzNFhtbTY0Qzk4?=
 =?utf-8?B?ekVzOEVLME8xTS9SRE91SUc4bUtYN0cwZ2FDU0NlOTJteXhOY3NBK2FjK2xW?=
 =?utf-8?B?eVZybGJNTWFIcW9FUlFUMkRtc2NBcDkxZWtXUG5vMUh4NTNNY3BSY1IyekJm?=
 =?utf-8?B?ckhYQVIyeFZEMk50YXl3NXpyVGtpUWxDZXBlU0J0RVkyMkNETkp0YXFKRFNS?=
 =?utf-8?B?Y2lVbWVXcHhYNmRxQUhQd0ErRDgyRHBHWHdqQzBmc05pYVRpakxWcE1rOTlp?=
 =?utf-8?B?VnJNc2h3M2t0ZVNmL09iNDlkRytxZ1FUczRwdVNlaDFyM2tJRmh6dDN0eTBw?=
 =?utf-8?B?bWt4RFYzMUgxRjZqYjdGV3RSRThKazhhNmJEbWc3R2p1bTNYS3Y4bklMdGxS?=
 =?utf-8?B?UTh4YmhtZU5QVEYvZ1lTTUorSVkxb0lPKytLZ1kxRWhvT3ZsTDZjMFRGVDNB?=
 =?utf-8?B?RWpTVTB3UUVBazczMGpkQ05KWXl1VU5MZTROVmE5dmVOd2szNmNVQUYzOGpn?=
 =?utf-8?B?ZVNPREVrZVh6YStMdlhlR1pLNzFtWlQ2Ui9DSHJjMnpZN0g5Tnl6VGV1enhn?=
 =?utf-8?B?YVdsaWRwUUJYa0lacGRrMFhPREtFeU16QkdQMHFyTWwwUzFadmk4UDhZOHZV?=
 =?utf-8?B?QnJuV1hLTWQxakpUZjY2cVQvd3p6T0FZQlFhd2twMStOK2dLYUVuNldCWFhI?=
 =?utf-8?B?QUsrTDlYZ0tJaHpFbUd1SWRLdlkxMFAybTBCcmxZM1liR0VIbEZRK0wxdkY2?=
 =?utf-8?B?Mk1aNjFHR3JQTWVSLzFGL0NlRGIyd0JMQ2pLaVcrdGZoZGxJUHVRYnhHNlJq?=
 =?utf-8?B?MTQ5TVJGYWdvOVR4NDkrWkpMT08yTmcvUFIzZ0ZabE83NW5zUmlMNVdIakRX?=
 =?utf-8?B?cTFaMDJYanR2OXFzK3psUlRINnlnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6164f0e-9fe1-4a25-f2cd-08dde9e87564
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 06:17:57.1256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+UXEqvAE8w1nf3z9HONCvIaAmuFPvna2JFnAhsjSEZVJkcUDNzAt8BTsgHPDn1cDDpVAd8gcejvNySeg81csA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025
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

On Tuesday, September 2, 2025 2:51=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 2 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 05:38 Mik=
ko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC.
> > >
> > > Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/staging/media/tegra-video/csi.c     |  12 +
> > >  drivers/staging/media/tegra-video/tegra20.c | 575 ++++++++++++++++++=
--
> > >  drivers/staging/media/tegra-video/vi.h      |   2 +
> > >  drivers/staging/media/tegra-video/video.c   |   2 +
> > >  4 files changed, 553 insertions(+), 38 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/stagin=
g/media/tegra-video/csi.c
> > > index 2f9907a20db1..714ce52a793c 100644
> > > --- a/drivers/staging/media/tegra-video/csi.c
> > > +++ b/drivers/staging/media/tegra-video/csi.c
> > > @@ -826,11 +826,23 @@ static void tegra_csi_remove(struct platform_de=
vice *pdev)
> > >       pm_runtime_disable(&pdev->dev);
> > >  }
> > >
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +extern const struct tegra_csi_soc tegra20_csi_soc;
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +extern const struct tegra_csi_soc tegra30_csi_soc;
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >  extern const struct tegra_csi_soc tegra210_csi_soc;
> > >  #endif
> > >
> > >  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> > > +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +     { .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_=
soc },
> > > +#endif
> > > +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +     { .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_=
soc },
> > > +#endif
> > >  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
> > >       { .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_cs=
i_soc },
> > >  #endif
> > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/st=
aging/media/tegra-video/tegra20.c
> > > index a06afe91d2de..e528ba280ae4 100644
> > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > @@ -4,6 +4,9 @@
> > >   *
> > >   * Copyright (C) 2023 SKIDATA GmbH
> > >   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > + *
> > > + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> > > + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> > >   */
> > >
> > >  /*
> > > @@ -12,12 +15,16 @@
> > >   */
> > >
> > >  #include <linux/bitfield.h>
> > > +#include <linux/clk.h>
> > > +#include <linux/clk/tegra.h>
> > >  #include <linux/delay.h>
> > >  #include <linux/host1x.h>
> > > +#include <linux/iopoll.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/kthread.h>
> > >  #include <linux/v4l2-mediabus.h>
> > >
> > > +#include "csi.h"
> > >  #include "vip.h"
> > >  #include "vi.h"
> > >
> > > @@ -42,6 +49,9 @@ enum {
> > >  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT   BIT(8)
> > >  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT              0
> > >
> > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)   (0x0070 + (n) *=
 8)
> > > +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)     (0x0074 + (n) *=
 8)
> > > +
> > >  #define TEGRA_VI_VI_INPUT_CONTROL                    0x0088
> > >  #define       VI_INPUT_FIELD_DETECT                  BIT(27)
> > >  #define       VI_INPUT_BT656                         BIT(25)
> > > @@ -87,6 +97,8 @@ enum {
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_SFT            0
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST     (3 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR   (6 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER  (7 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > > +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER  (8 << VI_OUTPUT=
_OUTPUT_FORMAT_SFT)
> > >  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT       (9 << V=
I_OUTPUT_OUTPUT_FORMAT_SFT)
> > >
> > >  #define TEGRA_VI_VIP_H_ACTIVE                                0x00a4
> > > @@ -151,8 +163,106 @@ enum {
> > >  #define TEGRA_VI_VI_RAISE                            0x01ac
> > >  #define       VI_VI_RAISE_ON_EDGE                    BIT(0)
> > >
> > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)         (0x01d8 + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)           (0x01dc + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)                  (0x01e8 + (n) *=
 8)
> > > +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)                  (0x01ec + (n) *=
 8)
> > > +
> > > +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> > > +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL            0x0000
> > > +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL          0x0008
> > > +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)            (0x0010 + (n) *=
 0x2c)
> > > +#define       CSI_SKIP_PACKET_THRESHOLD(n)           (((n) & 0xff) <=
< 16)
> > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)           (0x0018 + (n) *=
 0x2c)
> > > +#define       CSI_PP_PAD_FRAME_PAD0S                 (0 << 28)
> > > +#define       CSI_PP_PAD_FRAME_PAD1S                 (1 << 28)
> > > +#define       CSI_PP_PAD_FRAME_NOPAD                 (2 << 28)
> > > +#define       CSI_PP_HEADER_EC_ENABLE                        BIT(27)
> > > +#define       CSI_PP_PAD_SHORT_LINE_PAD0S            (0 << 24)
> > > +#define       CSI_PP_PAD_SHORT_LINE_PAD1S            (1 << 24)
> > > +#define       CSI_PP_PAD_SHORT_LINE_NOPAD            (2 << 24)
> > > +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED          BIT(20)
> > > +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY         (0 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL             (1 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP         (2 << 16)
> > > +#define       CSI_PP_OUTPUT_FORMAT_STORE             (3 << 16)
> > > +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)           (((n) - 1) << 1=
4)
> > > +#define       CSI_PP_DATA_TYPE(n)                    ((n) << 8)
> > > +#define       CSI_PP_CRC_CHECK_ENABLE                        BIT(7)
> > > +#define       CSI_PP_WORD_COUNT_HEADER                       BIT(6)
> > > +#define       CSI_PP_DATA_IDENTIFIER_ENABLE          BIT(5)
> > > +#define       CSI_PP_PACKET_HEADER_SENT                      BIT(4)
> > > +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)           (0x001c + (n) *=
 0x2c)
> > > +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)         (0x0020 + (n) *=
 0x2c)
> > > +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)                        (0x0024=
 + (n) * 0x2c)
> > > +#define       CSI_PP_FRAME_MIN_GAP(n)                        (((n) &=
 0xffff) << 16)
> > > +#define       CSI_PP_LINE_MIN_GAP(n)                 (((n) & 0xffff)=
)
> > > +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)         (0x0028 + (n) *=
 0x2c)
> > > +#define       CSI_PP_START_MARKER_FRAME_MAX(n)               (((n) &=
 0xf) << 12)
> > > +#define       CSI_PP_START_MARKER_FRAME_MIN(n)               (((n) &=
 0xf) << 8)
> > > +#define       CSI_PP_VSYNC_START_MARKER                      BIT(4)
> > > +#define       CSI_PP_SINGLE_SHOT                     BIT(2)
> > > +#define       CSI_PP_NOP                             0
> > > +#define       CSI_PP_ENABLE                          1
> > > +#define       CSI_PP_DISABLE                         2
> > > +#define       CSI_PP_RST                             3
> > > +#define TEGRA_CSI_PHY_CIL_COMMAND                    0x0068
> > > +#define       CSI_A_PHY_CIL_NOP                              0x0
> > > +#define       CSI_A_PHY_CIL_ENABLE                   0x1
> > > +#define       CSI_A_PHY_CIL_DISABLE                  0x2
> > > +#define       CSI_A_PHY_CIL_ENABLE_MASK                      0x3
> > > +#define       CSI_B_PHY_CIL_NOP                              (0x0 <<=
 16)
> > > +#define       CSI_B_PHY_CIL_ENABLE                   (0x1 << 16)
> > > +#define       CSI_B_PHY_CIL_DISABLE                  (0x2 << 16)
> > > +#define       CSI_B_PHY_CIL_ENABLE_MASK                      (0x3 <<=
 16)
> > > +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)                        (0x006c=
 + (n) * 4)
> > > +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE               BIT(5)
> > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS            0x0078
> > > +#define TEGRA_CSI_CSI_CIL_STATUS                     0x007c
> > > +#define       CSI_MIPI_AUTO_CAL_DONE                 BIT(15)
> > > +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK    0x0080
> > > +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK             0x0084
> > > +#define TEGRA_CSI_CSI_READONLY_STATUS                        0x0088
> > > +#define TEGRA_CSI_ESCAPE_MODE_COMMAND                        0x008c
> > > +#define TEGRA_CSI_ESCAPE_MODE_DATA                   0x0090
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)                 (0x0094 + (n) *=
 8)
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)                 (0x0098 + (n) *=
 8)
> > > +#define TEGRA_CSI_CIL_PAD_CONFIG                     0x00a4
> > > +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG                       0x00a8
> > > +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG                       0x00ac
> > > +#define       CSI_CIL_MIPI_CAL_STARTCAL                      BIT(31)
> > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_A             BIT(30)
> > > +#define       CSI_CIL_MIPI_CAL_OVERIDE_B             BIT(30)
> > > +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)          (((n) & 0xf) <<=
 26)
> > > +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)           (((n) & 0x3) <<=
 24)
> > > +#define       CSI_CIL_MIPI_CAL_SEL_A                 BIT(21)
> > > +#define       CSI_CIL_MIPI_CAL_SEL_B                 BIT(21)
> > > +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)             (((n) & 0x1f) <=
< 16)
> > > +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)             (((n) & 0x1f) <=
< 8)
> > > +#define       CSI_CIL_MIPI_CAL_TERMOS(n)             (((n) & 0x1f))
> > > +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS                        0x00b0
> > > +#define TEGRA_CSI_CLKEN_OVERRIDE                     0x00b4
> > > +#define TEGRA_CSI_DEBUG_CONTROL                              0x00b8
> > > +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED     BIT(0)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0                BIT(4)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1                BIT(5)
> > > +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2                BIT(6)
> > > +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)    ((v) << (8 + 8 =
* (n)))
> > > +#define TEGRA_CSI_DEBUG_COUNTER(n)                   (0x00bc + (n) *=
 4)
> > > +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)     (0x00c8 + (n) *=
 4)
> > > +#define       CSI_PP_EXP_FRAME_HEIGHT(n)             (((n) & 0x1fff)=
 << 16)
> > > +#define       CSI_PP_MAX_CLOCKS(n)                   (((n) & 0xfff) =
<< 4)
> > > +#define       CSI_PP_LINE_TIMEOUT_ENABLE             BIT(0)
> > > +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG                        0x00d0
> > > +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG0                       0x00d4
> > > +#define       CSI_PAD_DRIV_DN_REF(n)                 (((n) & 0x7) <<=
 16)
> > > +#define       CSI_PAD_DRIV_UP_REF(n)                 (((n) & 0x7) <<=
 8)
> > > +#define       CSI_PAD_TERM_REF(n)                    (((n) & 0x7) <<=
 0)
> > > +#define TEGRA_CSI_CSI_CILA_STATUS                    0x00d8
> > > +#define TEGRA_CSI_CSI_CILB_STATUS                    0x00dc
> > > +
> > >  /* -----------------------------------------------------------------=
---------
> > > - * VI
> > > + * Read and Write helpers
> > >   */
> > >
> > >  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned=
 int addr, u32 val)
> > > @@ -160,6 +270,25 @@ static void tegra20_vi_write(struct tegra_vi_cha=
nnel *chan, unsigned int addr, u
> > >       writel(val, chan->vi->iomem + addr);
> > >  }
> > >
> > > +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *c=
han, unsigned int addr)
> > > +{
> > > +     return readl(chan->vi->iomem + addr);
> > > +}
> > > +
> > > +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, un=
signed int addr, u32 val)
> > > +{
> > > +     writel(val, csi_chan->csi->iomem + addr);
> > > +}
> > > +
> > > +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel =
*csi_chan, unsigned int addr)
> > > +{
> > > +     return readl(csi_chan->csi->iomem + addr);
> > > +}
> > > +
> > > +/* -----------------------------------------------------------------=
---------
> > > + * VI
> > > + */
> > > +
> > >  /*
> > >   * Get the main input format (YUV/RGB...) and the YUV variant as val=
ues to
> > >   * be written into registers for the current VI input mbus code.
> > > @@ -282,20 +411,27 @@ static int tegra20_vi_enable(struct tegra_vi *v=
i, bool on)
> > >  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channe=
l *chan)
> > >  {
> > >       struct tegra_vi *vi =3D chan->vi;
> > > -     struct host1x_syncpt *out_sp;
> > > +     struct host1x_syncpt *out_sp, *fs_sp;
> > >
> > >       out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLI=
ENT_MANAGED);
> > >       if (!out_sp)
> > > -             return dev_err_probe(vi->dev, -ENOMEM, "failed to reque=
st syncpoint\n");
> > > +             return dev_err_probe(vi->dev, -ENOMEM, "failed to reque=
st mw ack syncpoint\n");
> >
> > Existing issue, but dev_err_probe doesn't print anything when the error=
 is -ENOMEM, since "there is already enough output". But that's not necessa=
rily the case with failing syncpoint allocation. Maybe we should be using a=
 different error code like EBUSY?
> >
>=20
> That is interesting. I am fine to switching to any error code as long
> as it fits here, EBUSY fits fine.
>=20
> > >
> > >       chan->mw_ack_sp[0] =3D out_sp;
> > >
> > > +     fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIE=
NT_MANAGED);
> > > +     if (!fs_sp)
> > > +             return dev_err_probe(vi->dev, -ENOMEM, "failed to reque=
st frame start syncpoint\n");
> > > +
> > > +     chan->frame_start_sp[0] =3D fs_sp;
> > > +
> > >       return 0;
> > >  }
> > >
> > >  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_chann=
el *chan)
> > >  {
> > >       host1x_syncpt_put(chan->mw_ack_sp[0]);
> > > +     host1x_syncpt_put(chan->frame_start_sp[0]);
> > >  }
> > >
> > >  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned =
int bpp)
> > > @@ -418,30 +554,60 @@ static void tegra20_channel_vi_buffer_setup(str=
uct tegra_vi_channel *chan,
> > >  static int tegra20_channel_capture_frame(struct tegra_vi_channel *ch=
an,
> > >                                        struct tegra_channel_buffer *b=
uf)
> > >  {
> > > +     struct v4l2_subdev *csi_subdev =3D NULL;
> > > +     struct tegra_csi_channel *csi_chan =3D NULL;
> > > +     u32 port;
> > >       int err;
> > >
> > > -     chan->next_out_sp_idx++;
> > > +     csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> > > +     if (csi_subdev) {
> > > +             /* CSI subdevs are named after nodes, channel@0 or chan=
nel@1 */
> > > +             if (!strncmp(csi_subdev->name, "channel", 7)) {
> > > +                     csi_chan =3D to_csi_chan(csi_subdev);
> > > +                     port =3D csi_chan->csi_port_nums[0] & 1;
> > > +             }
> > > +     }
> >
> > tegra_channel_get_remote_csi_subdev sounds like it should only return n=
on-NULL if it's a CSI subdev. I'd move this check into that function.
> >
>=20
> That is possible.
>=20
> > Checking by name doesn't seem right -- v4l2_subdev has an 'ops' pointer=
, could we compare that to tegra_csi_ops to check if it's a CSI subdev?
> >
>=20
> I may try that. My main concern was VIP. Unlike Tegra210,
> Tegra20/Tegra30 have VIP which can cause issues if no additional
> checks are done.
>=20
> > Finally, is it possible to move this logic to some initialization logic=
 for the 'chan' instead of each frame?
> >
>=20
> Yes, I hope so. We did not implement this logic, it existed before, we
> just expanded it to support CSI.

If it's non-trivial it can be left for later.

>=20
> > >
> > >       tegra20_channel_vi_buffer_setup(chan, buf);
> > >
> > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTR=
OL_VIP_ENABLE);
> > > +     if (csi_chan) {
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_C=
OMMAND(port),
> > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                               CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> > > +
> > > +             chan->next_fs_sp_idx++;
> > > +             err =3D host1x_syncpt_wait(chan->frame_start_sp[0], cha=
n->next_fs_sp_idx,
> > > +                                      TEGRA_VI_SYNCPT_WAIT_TIMEOUT, =
NULL);
> > > +             if (err) {
> > > +                     host1x_syncpt_incr(chan->frame_start_sp[0]);
> >
> > This is technically a race condition -- the HW could increment the sync=
point between the wait timing out and the call to _incr. The driver should =
ensure the HW won't increment the syncpoint before checking the value one m=
ore time and then making conclusions about the syncpoint's value. I also do=
n't think it's necessary to call _incr here, you can pass chan->next_fs_sp_=
idx + 1 to syncpt_wait, and then only on success increment chan->next_fs_sp=
_idx.
> >
>=20
> The race condition should be avoidable by resetting pixel parser and
> checking syncpt value again.
> Incrementing the software reference counter only if hardware completed
> successfully sounds like a good idea.
>=20
> > Also, I'd rename this to next_fs_sp_value. 'idx' to me sounds like ther=
e are multiple syncpoints that are used e.g. in succession.
> >
> > (I know these are in line with the existing out_sp code, but it'd be gr=
eat if we can fix these issues.)
> >
> > > +                     if (err !=3D -ERESTARTSYS)
> > > +                             dev_err_ratelimited(&chan->video.dev,
> > > +                                                 "frame start syncpt=
 timeout: %d\n", err);
> > > +             }
> > > +
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_C=
OMMAND(port),
> > > +                               CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                               CSI_PP_DISABLE);
> > > +     } else {
> > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAME=
RA_CONTROL_VIP_ENABLE);
> > > +     }
> > >
> > > -     /* Wait for syncpt counter to reach frame start event threshold=
 */
> > > +     chan->next_out_sp_idx++;
> > >       err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_s=
p_idx,
> > >                                TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> > >       if (err) {
> > >               host1x_syncpt_incr(chan->mw_ack_sp[0]);
> > > -             dev_err_ratelimited(&chan->video.dev, "frame start sync=
pt timeout: %d\n", err);
> > > -             release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> > > -             return err;
> > > +             if (err !=3D -ERESTARTSYS)
> > > +                     dev_err_ratelimited(&chan->video.dev, "mw ack s=
yncpt timeout: %d\n", err);
> > >       }
> > >
> > > -     tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > -                      VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CON=
TROL_VIP_ENABLE);
> > > +     if (!csi_chan)
> > > +             tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> > > +                              VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CA=
MERA_CONTROL_VIP_ENABLE);
> > >
> > >       release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> > >
> > > -     return 0;
> > > +     return err;
> > >  }
> > >
> > >  static int tegra20_chan_capture_kthread_start(void *data)
> > > @@ -502,28 +668,6 @@ static void tegra20_camera_capture_setup(struct =
tegra_vi_channel *chan)
> > >       int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> > >                             data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > >                             OUT_2 : OUT_1;
> > > -     int main_output_format;
> > > -     int yuv_output_format;
> > > -
> > > -     tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_o=
utput_format);
> > > -
> > > -     /*
> > > -      * Set up low pass filter.  Use 0x240 for chromaticity and 0x24=
0
> > > -      * for luminance, which is the default and means not to touch
> > > -      * anything.
> > > -      */
> > > -     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > -                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > -                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > -
> > > -     /* Set up raise-on-edge, so we get an interrupt on end of frame=
. */
> > > -     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > > -
> > > -     tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channe=
l),
> > > -                      (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > -                      (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > -                      yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORM=
AT_SFT |
> > > -                      main_output_format << VI_OUTPUT_OUTPUT_FORMAT_=
SFT);
> > >
> > >       /* Set up frame size */
> > >       tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channe=
l),
> > > @@ -548,24 +692,148 @@ static void tegra20_camera_capture_setup(struc=
t tegra_vi_channel *chan)
> > >       tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
> > >  }
> > >
> > > +static int tegra20_csi_pad_calibration(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     struct tegra_csi *csi =3D csi_chan->csi;
> > > +     void __iomem *cil_status_reg =3D csi_chan->csi->iomem + TEGRA_C=
SI_CSI_CIL_STATUS;
> > > +     unsigned int port =3D csi_chan->csi_port_nums[0] & 1;
> > > +     u32 value, pp, cil;
> > > +     int ret;
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> > > +                       CSI_CIL_MIPI_CAL_HSPDOS(4) |
> > > +                       CSI_CIL_MIPI_CAL_HSPUOS(3) |
> > > +                       CSI_CIL_MIPI_CAL_TERMOS(0));
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_MIPIBIAS_PAD_CONFIG0,
> > > +                       CSI_PAD_DRIV_DN_REF(5) |
> > > +                       CSI_PAD_DRIV_UP_REF(7) |
> > > +                       CSI_PAD_TERM_REF(0));
> > > +
> > > +     /* CSI B */
> > > +     value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > +
> > > +     if (port =3D=3D PORT_B || csi_chan->numlanes =3D=3D 4)
> > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, val=
ue);
> > > +
> > > +     /* CSI A */
> > > +     value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> > > +             CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > +             CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > +             CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +             CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +             CSI_CIL_MIPI_CAL_TERMOS(4);
> > > +
> > > +     if (port =3D=3D PORT_A)
> > > +             value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, val=
ue);
> > > +
> > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > +                                      value & CSI_MIPI_AUTO_CAL_DONE=
, 50, 250000);
> > > +     if (ret < 0) {
> > > +             dev_warn(csi->dev, "MIPI calibration timeout!\n");
> > > +             goto exit;
> > > +     }
> > > +
> > > +     /* clear status */
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > +     ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> > > +                                      !(value & CSI_MIPI_AUTO_CAL_DO=
NE), 50, 250000);
> > > +     if (ret < 0) {
> > > +             dev_warn(csi->dev, "MIPI calibration status timeout!\n"=
);
> > > +             goto exit;
> > > +     }
> > > +
> > > +     pp =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_ST=
ATUS);
> > > +     cil =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> > > +     if (pp | cil) {
> > > +             dev_warn(csi->dev, "Calibration status not been cleared=
!\n");
> > > +             ret =3D -EINVAL;
> > > +             goto exit;
> > > +     }
> > > +
> > > +exit:
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, pp);
> > > +
> > > +     /* un-select to avoid interference with DSI */
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> > > +                       CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +                       CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +                       CSI_CIL_MIPI_CAL_TERMOS(4));
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> > > +                       CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> > > +                       CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> > > +                       CSI_CIL_MIPI_CAL_HSPDOS(0) |
> > > +                       CSI_CIL_MIPI_CAL_HSPUOS(0) |
> > > +                       CSI_CIL_MIPI_CAL_TERMOS(4));
> > > +
> > > +     return ret;
> > > +}
> > > +
> > >  static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 coun=
t)
> > >  {
> > >       struct tegra_vi_channel *chan =3D vb2_get_drv_priv(vq);
> > >       struct media_pipeline *pipe =3D &chan->video.pipe;
> > > +     struct v4l2_subdev *csi_subdev, *src_subdev;
> > > +     struct tegra_csi_channel *csi_chan =3D NULL;
> > >       int err;
> > >
> > > +     csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> > > +     if (csi_subdev) {
> > > +             if (!strncmp(csi_subdev->name, "channel", 7))
> > > +                     csi_chan =3D to_csi_chan(csi_subdev);
> > > +     }
> > > +
> > > +     chan->next_fs_sp_idx =3D host1x_syncpt_read(chan->frame_start_s=
p[0]);
> > >       chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]=
);
> > >
> > >       err =3D video_device_pipeline_start(&chan->video, pipe);
> > >       if (err)
> > >               goto error_pipeline_start;
> > >
> > > -     tegra20_camera_capture_setup(chan);
> > > +     /*
> > > +      * Set up low pass filter.  Use 0x240 for chromaticity and 0x24=
0
> > > +      * for luminance, which is the default and means not to touch
> > > +      * anything.
> > > +      */
> > > +     tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> > > +                      0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> > > +                      0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> > > +
> > > +     /* Set up raise-on-edge, so we get an interrupt on end of frame=
. */
> > > +     tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> > >
> > >       err =3D tegra_channel_set_stream(chan, true);
> > >       if (err)
> > >               goto error_set_stream;
> > >
> > > +     tegra20_camera_capture_setup(chan);
> > > +
> > > +     if (csi_chan) {
> > > +             /*
> > > +              * TRM has incorrectly documented to wait for done stat=
us from
> > > +              * calibration logic after CSI interface power on.
> > > +              * As per the design, calibration results are latched a=
nd applied
> > > +              * to the pads only when the link is in LP11 state whic=
h will happen
> > > +              * during the sensor stream-on.
> > > +              * CSI subdev stream-on triggers start of MIPI pads cal=
ibration.
> > > +              * Wait for calibration to finish here after sensor sub=
dev stream-on.
> > > +              */
> > > +             src_subdev =3D tegra_channel_get_remote_source_subdev(c=
han);
> > > +             if (!src_subdev->s_stream_enabled) {
> > > +                     err =3D v4l2_subdev_call(src_subdev, video, s_s=
tream, true);
> > > +                     if (err < 0 && err !=3D -ENOIOCTLCMD)
> > > +                             goto error_set_stream;
> > > +             }
> > > +
> > > +             tegra20_csi_pad_calibration(csi_chan);
> > > +     }
> > > +
> > >       chan->sequence =3D 0;
> > >
> > >       chan->kthread_start_capture =3D kthread_run(tegra20_chan_captur=
e_kthread_start,
> > > @@ -592,12 +860,17 @@ static int tegra20_vi_start_streaming(struct vb=
2_queue *vq, u32 count)
> > >  static void tegra20_vi_stop_streaming(struct vb2_queue *vq)
> > >  {
> > >       struct tegra_vi_channel *chan =3D vb2_get_drv_priv(vq);
> > > +     struct v4l2_subdev *src_subdev;
> > >
> > >       if (chan->kthread_start_capture) {
> > >               kthread_stop(chan->kthread_start_capture);
> > >               chan->kthread_start_capture =3D NULL;
> > >       }
> > >
> > > +     src_subdev =3D tegra_channel_get_remote_source_subdev(chan);
> > > +     if (src_subdev->s_stream_enabled)
> > > +             v4l2_subdev_call(src_subdev, video, s_stream, false);
> > > +
> > >       tegra_channel_release_buffers(chan, VB2_BUF_STATE_ERROR);
> > >       tegra_channel_set_stream(chan, false);
> > >       video_device_pipeline_stop(&chan->video);
> > > @@ -652,11 +925,231 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
> > >       .default_video_format =3D &tegra20_video_formats[0],
> > >       .ops =3D &tegra20_vi_ops,
> > >       .hw_revision =3D 1,
> > > -     .vi_max_channels =3D 1, /* parallel input (VIP) */
> > > +     .vi_max_channels =3D 4, /* parallel input (VIP), CSIA, CSIB, HO=
ST */
> > >       .vi_max_clk_hz =3D 450000000,
> > >       .has_h_v_flip =3D true,
> > >  };
> > >
> > > +/* -----------------------------------------------------------------=
---------
> > > + * CSI
> > > + */
> > > +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_=
chan)
> > > +{
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, =
0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL=
, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, =
0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUP=
T_MASK, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> > > +                       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> > > +}
> > > +
> > > +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel=
 *csi_chan,
> > > +                                         u8 portno)
> > > +{
> > > +     struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&=
csi_chan->subdev);
> > > +     int width  =3D vi_chan->format.width;
> > > +     int height =3D vi_chan->format.height;
> > > +     u32 data_type =3D vi_chan->fmtinfo->img_dt;
> > > +     u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> > > +     int output_channel =3D OUT_1;
> > > +
> > > +     unsigned int main_output_format, yuv_output_format;
> > > +     unsigned int port =3D portno & 1;
> > > +     u32 value;
> > > +
> > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yu=
v_output_format);
> > > +
> > > +     switch (data_type) {
> > > +     case TEGRA_IMAGE_DT_RAW8:
> > > +     case TEGRA_IMAGE_DT_RAW10:
> > > +             output_channel =3D OUT_2;
> > > +             if (port =3D=3D PORT_A)
> > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_=
CSI_PPA_BAYER;
> > > +             else
> > > +                     main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_=
CSI_PPB_BAYER;
> > > +             break;
> > > +     }
> > > +
> > > +     tegra20_csi_capture_clean(csi_chan);
> > > +
> > > +     /* CSI port cleanup */
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port=
), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(por=
t), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(por=
t), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(p=
ort), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRA=
ME(port), 0);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0=
);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0)=
;
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0)=
;
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + po=
rt)); /* CSI_PP_YUV422 */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 +=
 port)); /* CSI_PP */
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 +=
 port)); /* CSI_PP */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width=
 << 16);
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), heigh=
t << 16);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(por=
t), 0x1);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(p=
ort), word_count);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> > > +                       CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks be=
tween frames */
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRA=
ME(port),
> > > +                       CSI_PP_EXP_FRAME_HEIGHT(height) |
> > > +                       CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi c=
lks for timeout */
> > > +                       CSI_PP_LINE_TIMEOUT_ENABLE);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(por=
t),
> > > +                       CSI_PP_OUTPUT_FORMAT_PIXEL |
> > > +                       CSI_PP_DATA_TYPE(data_type) |
> > > +                       CSI_PP_CRC_CHECK_ENABLE |
> > > +                       CSI_PP_WORD_COUNT_HEADER |
> > > +                       CSI_PP_DATA_IDENTIFIER_ENABLE |
> > > +                       CSI_PP_PACKET_HEADER_SENT |
> > > +                       port);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port=
),
> > > +                       CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> > > +                       (csi_chan->numlanes - 1));
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> > > +                       CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> > > +                       0x5); /* Clock settle time */
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_STA=
RT(port),
> > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > +                      host1x_syncpt_id(vi_chan->frame_start_sp[0])
> > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_chann=
el),
> > > +                      VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> > > +                      host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> > > +                      << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> > > +
> > > +     value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_P=
HY_CIL_DISABLE :
> > > +             CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort),
> > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                       CSI_PP_DISABLE);
> > > +
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_cha=
nnel),
> > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > +                      yuv_output_format | main_output_format);
> > > +
> > > +     return 0;
> > > +};
> > > +
> > > +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel=
 *csi_chan, u8 portno)
> > > +{
> > > +     struct tegra_csi *csi =3D csi_chan->csi;
> > > +     unsigned int port =3D portno & 1;
> > > +     u32 value;
> > > +
> > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER=
_STATUS);
> > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n",=
 value);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, =
value);
> > > +
> > > +     value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> > > +     dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> > > +
> > > +     tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(p=
ort),
> > > +                       CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> > > +                       CSI_PP_DISABLE);
> > > +
> > > +     if (csi_chan->numlanes =3D=3D 4) {
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> > > +                               CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_DISABLE);
> > > +     } else {
> > > +             value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE =
| CSI_B_PHY_CIL_NOP :
> > > +                     CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> > > +             tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, =
value);
> > > +     }
> > > +}
> > > +
> > > +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > +     int ret, i;
> > > +
> > > +     for (i =3D 0; i < csi_chan->numgangports; i++) {
> > > +             ret =3D tegra20_csi_port_start_streaming(csi_chan, port=
nos[i]);
> > > +             if (ret)
> > > +                     goto stream_start_fail;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +stream_start_fail:
> > > +     for (i =3D i - 1; i >=3D 0; i--)
> > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi=
_chan)
> > > +{
> > > +     u8 *portnos =3D csi_chan->csi_port_nums;
> > > +     int i;
> > > +
> > > +     for (i =3D 0; i < csi_chan->numgangports; i++)
> > > +             tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> > > +}
> > > +
> > > +/* Tegra20 CSI operations */
> > > +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> > > +     .csi_start_streaming =3D tegra20_csi_start_streaming,
> > > +     .csi_stop_streaming =3D tegra20_csi_stop_streaming,
> > > +};
> > > +
> > > +static const char * const tegra20_csi_clks[] =3D {
> > > +     "csi",
> > > +};
> > > +
> > > +/* Tegra20 CSI SoC data */
> > > +const struct tegra_csi_soc tegra20_csi_soc =3D {
> > > +     .ops =3D &tegra20_csi_ops,
> > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > +     .clk_names =3D tegra20_csi_clks,
> > > +     .num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> > > +     .has_mipi_calibration =3D false,
> > > +};
> > > +
> > > +static const char * const tegra30_csi_clks[] =3D {
> > > +     "csi",
> > > +     "csia_pad",
> > > +     "csib_pad",
> > > +};
> > > +
> > > +/* Tegra30 CSI SoC data */
> > > +const struct tegra_csi_soc tegra30_csi_soc =3D {
> > > +     .ops =3D &tegra20_csi_ops,
> > > +     .csi_max_channels =3D 2, /* CSI-A and CSI-B */
> > > +     .clk_names =3D tegra30_csi_clks,
> > > +     .num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> > > +     .has_mipi_calibration =3D false,
> > > +};
> > > +
> > >  /* -----------------------------------------------------------------=
---------
> > >   * VIP
> > >   */
> > > @@ -677,10 +1170,11 @@ static int tegra20_vip_start_streaming(struct =
tegra_vip_channel *vip_chan)
> > >                             data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> > >                             OUT_2 : OUT_1;
> > >
> > > -     unsigned int main_input_format;
> > > -     unsigned int yuv_input_format;
> > > +     unsigned int main_input_format, yuv_input_format;
> > > +     unsigned int main_output_format, yuv_output_format;
> > >
> > >       tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_=
input_format);
> > > +     tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yu=
v_output_format);
> > >
> > >       tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> > >
> > > @@ -713,6 +1207,11 @@ static int tegra20_vip_start_streaming(struct t=
egra_vip_channel *vip_chan)
> > >
> > >       tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CO=
NTROL_STOP_CAPTURE);
> > >
> > > +     tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_cha=
nnel),
> > > +                      (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> > > +                      (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> > > +                       yuv_output_format | main_output_format);
> > > +
> > >       return 0;
> > >  }
> > >
> > > diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging=
/media/tegra-video/vi.h
> > > index cac0c0d0e225..c02517c9e09b 100644
> > > --- a/drivers/staging/media/tegra-video/vi.h
> > > +++ b/drivers/staging/media/tegra-video/vi.h
> > > @@ -127,6 +127,7 @@ struct tegra_vi {
> > >   *           frame through host1x syncpoint counters (On Tegra20 use=
d for the
> > >   *              OUT_1 syncpt)
> > >   * @sp_incr_lock: protects cpu syncpoint increment.
> > > + * @next_fs_sp_idx: next expected value for frame_start_sp[0] (Tegra=
20)
> > >   * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_=
1 (Tegra20)
> > >   *
> > >   * @kthread_start_capture: kthread to start capture of single frame =
when
> > > @@ -191,6 +192,7 @@ struct tegra_vi_channel {
> > >       /* protects the cpu syncpoint increment */
> > >       spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> > >       u32 next_out_sp_idx;
> > > +     u32 next_fs_sp_idx;
> > >
> > >       struct task_struct *kthread_start_capture;
> > >       wait_queue_head_t start_wait;
> > > diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/stag=
ing/media/tegra-video/video.c
> > > index a25885f93cd7..8fa660431eb0 100644
> > > --- a/drivers/staging/media/tegra-video/video.c
> > > +++ b/drivers/staging/media/tegra-video/video.c
> > > @@ -124,10 +124,12 @@ static int host1x_video_remove(struct host1x_de=
vice *dev)
> > >
> > >  static const struct of_device_id host1x_video_subdevs[] =3D {
> > >  #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> > > +     { .compatible =3D "nvidia,tegra20-csi", },
> > >       { .compatible =3D "nvidia,tegra20-vip", },
> > >       { .compatible =3D "nvidia,tegra20-vi", },
> > >  #endif
> > >  #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> > > +     { .compatible =3D "nvidia,tegra30-csi", },
> > >       { .compatible =3D "nvidia,tegra30-vip", },
> > >       { .compatible =3D "nvidia,tegra30-vi", },
> > >  #endif
> > >
> >
> >
> >
> >




