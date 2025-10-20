Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9DBEF194
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 04:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E293710E244;
	Mon, 20 Oct 2025 02:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nMbMpjey";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D7D10E244
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 02:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNa4/RapZTB1C6FjU1t5lWVlMoZbZXoc0BkMQpcDFclUyBdZQOFd7qIjO/UXpg0BVk6fhFT26fx7cqknLqUcTG9EoVhcQBoR7LjiHlGwXXOAqhKjQ/SiCa+Mx5FguCogpdFi3mlDw4D6H+5TYTEX8djt4kd8uA5fTNomthjq7+dm6+Ke2I1Zi4ap5YtbXk4Vn9kUNUy3IchpvSoyE+91n9EqSiK2RDVRTkkKXTELrGheVEXd3+CGqUe/k/ZCXLr/k02M0ac0DWKZRNFcaKxQ1y31UGy7gvEshxDeiQqiFKhrQxNniBaYL7BTPyB0cqYrU7Hfq2413aNFr3xQdpL0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSbzyYny5z/nWP2Mbclq744UlTwfohlcBbacBcyB5AM=;
 b=n8EBdcsvZSHocuFB8ZCQYm1I1z4s58xS8Bb+n60B/PaTNP1qBeo4YQ+sWQ0ZwhF/mlXwqJM34IFZCKl4FPeRiDrsQ+EtOnYoAAC0ZnWx7uAnRQM/fQlkLYEjSoWjbatdiM9WHCO/TLYpRlQdXbEA/zjBP4SW9UQTSN/n0YqRbIlcCa6DQIDeSmEcPpEpd6SCGO56e2EiZ66zMzV1Sll45Icf9VIhFbKNxwSGTXbPIWG3axi4JKDbiKtBaOtIiunrVC2XbY2HNxvHOqocSiGjS/CYoPicLYaLCGc5uEqZsNQPBQDuQVSoKH1hNrVmean0cyUMBRhq/mAvpgVS1N/bEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSbzyYny5z/nWP2Mbclq744UlTwfohlcBbacBcyB5AM=;
 b=nMbMpjey/y2xvBlVxcXtNW8SVYIKCJAtZTYSuy7JT0o2LcCYt2G6xKahWev0/9xCWxTvvA05hmDdsUS6GvK9VFiO9+heWoH8xjNtjoqSQtTfWJ4MVOCV0qzeaLbW0IzL29YsqqXhTY8EC4eMU6M1KXEvAZeY9ER2F+11huxfLGTNmXRZCItYsxSVFThwazQIcIH4DiBc5aBrSWFn2tBPglLHgjwCbHFgqHfF2DMPmPfauAfjfde2/G23if1GaVAxjVwek3Hp8SNveohxHyC+wRZ7P4PAeqmiqo7NgwQQcKAUoYa5QQC4edIQOnvjPBprdJgdXKxaGF0dc/DCvww/qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY5PR12MB6345.namprd12.prod.outlook.com (2603:10b6:930:22::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.15; Mon, 20 Oct 2025 02:36:48 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9228.012; Mon, 20 Oct 2025
 02:36:48 +0000
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
Subject: Re: [PATCH v4 23/24] ARM: tegra: add CSI nodes for Tegra20 and Tegra30
Date: Mon, 20 Oct 2025 11:36:44 +0900
Message-ID: <7779687.aoefvbuG5b@senjougahara>
In-Reply-To: <20251008073046.23231-24-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
 <20251008073046.23231-24-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::15) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY5PR12MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a3943e0-b8f7-4177-f2e2-08de0f818458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTM2VWVUenAwSTgzTWczbXRoME5WTWY2U3BDT2pvd2d6MGxHUng1dloyTG5o?=
 =?utf-8?B?c0Z5NHR1WVlHTmdoRUF1VzQ5VXlXZWtnb2dFclp5L0hsKzQyVEppSm9HMVRB?=
 =?utf-8?B?Q2Z1ZnJzQTJ1d3k5ZFlWMjg4a3l4LzlzS1RJbnhXY0d5R1p5dm9YY1hnWHVK?=
 =?utf-8?B?ZHozRVNPLzdlbnhodW92bk80c25BYmFReWZRNXBKeGpHc0VFc0VPckExKytL?=
 =?utf-8?B?ME5YRVBRN2RQSTM2d0xFRjB2S1VXUnl3c21CcHUwdEQyQS9KKzhZY3NPZ0NV?=
 =?utf-8?B?ZmdlbVpsc3FlM2VmSktWeGVpYVpEaTVSaHJIK1IrU1A2ajI2TjUvWXZJNElh?=
 =?utf-8?B?Zkxyc01hd1VkY2xTSDFPVGRkZ05ZNXdrNWI2RVB6d1N5dG10ZmVCUVJYc25I?=
 =?utf-8?B?cGhxUnFMSXA0YVM4QnMyNTRtZHRwVThtS3llSzF5U3llUjdnTDV1c0xSQ21M?=
 =?utf-8?B?MU1LUXZaT3JXbllRQkVPNWoxRWJNRUFmS2hBdk81dXFoUThpaDA3V3k2Nkg4?=
 =?utf-8?B?QXdCd011S096K3FCTUZrTTRveDZnZmgwQm44TGIyeDlYZjVNWUNUWm9iSFc3?=
 =?utf-8?B?WHdJOTU4eWN6ZTB1cWJPMnMzN1AvYmtXUXNwRmI4UXpqeWppRVRIVm5kUDEr?=
 =?utf-8?B?ZU5ENytSWUVRL1RiTTk4L2xxbTIrdktpZFpoQ1JuWm54Yi9Lc09OdURKTDdh?=
 =?utf-8?B?VzFDcE56MURRNTZHNDZOOWNpbi9aRm8rOWxlYys5cnQvY1FtUFU3WmJPeXp1?=
 =?utf-8?B?bVhIQWdzYzFxVGk0eUdvU3NJNHU1RWZGODk1cEZQc2dmcDByb3NKM0o3bG1O?=
 =?utf-8?B?QWdRSFVsa2dmcVpLWWNieWd1VzNldTdvblNYc0Nwd1lYVG9yU2I2K1V2UXFo?=
 =?utf-8?B?N0NoWmV1a0owTmlOMWVlTk1ocENUZlpDN2hDZ2FWbzBMYm80NGJqbWxTaXNo?=
 =?utf-8?B?MHdtaXgvcC9TbTVCOXlwNXpBaURORkU0NGdpY1VVSjlMU3BPbmFoT0t4dzlL?=
 =?utf-8?B?a0dudDJScnF1Q3FXUHdpZ1ZWQmxsMTJVbUkxY3RBVmN1S1FtcktXcUxaemk1?=
 =?utf-8?B?b3pJWVBET2lRbnlSTzM0U1JrSk5qZmVLeGMyanVOWUF2RGthV21LTTdlWDNn?=
 =?utf-8?B?MEllQU5TS3VNS0hnWlU5SUxUaGZIUGxuRHJKc09CMmRVQmZqdjdROHptcEtv?=
 =?utf-8?B?dTBHUTJXY2NycklnZTAreWZsQlg5MndkR1hKOGNGN2dFYkltSWIwRzlxSUNO?=
 =?utf-8?B?bWNuUVJGZVNVUVRJWG1YYkdtcFVraDRmS09vTnVLTzV1bnpabHJGOUlrWEZa?=
 =?utf-8?B?VTFqV2tJZ2E5eHdMd2pwcFNOaHhNTmowdlkrcUhURFg3MkNiN3Y0VW1kZUdV?=
 =?utf-8?B?SktpN3grdzVaM2VxcjFEL1VLTWlWeFhoRmVobFNlVmdvclgxZDRVVm01Nkt2?=
 =?utf-8?B?SG85OWpxeU9PalNHVHl5a2xLYTV0WFkyTUd5K013UlZiTFNBcWEvdlJaWmZ1?=
 =?utf-8?B?Qi94TjlVelNEazZWYmRnNWNRbE5Vam0vWnE1RkFoRDBkeHZWbTJnWTdXSmxD?=
 =?utf-8?B?Z2tkTm5uWUMzY1VpTWM2azNOUW4xNWQ2NzNNS0h4azdZMnpPOVFTekhZZ0o4?=
 =?utf-8?B?Y3BaemNSWVVrUFNRTVVUOVlubDBrNE9XUVN6cDhIZDBJR0c1b2dONTllM3VR?=
 =?utf-8?B?cEppcGUyenRuSFBZSjViUzQ5cjFsU01FUmtmSndvU3NkbnJqbnBaanI2TTlM?=
 =?utf-8?B?a3RRZ1JOcld4UXRhSkQveHY0TWkzVEpRNytEQ3VVbFFDQ3M1bDlhcndhbUFk?=
 =?utf-8?B?MjRVUXZGOGVoTmJRd0YzRFBlL1dwUjEzRUFIZkp3b1RUU0RCYnpJNVFrMHli?=
 =?utf-8?B?UnZCRGZFbUFnQXAvZEx5VVJ1YXA1YTdzM3ZBZ1ZkNWcrSHZYL2lDRUhmb1kr?=
 =?utf-8?B?TWN1SG5waEVuMVBoZkU4QldmdnRaSzZ2NE5ybTg3QVZEeGcwQk4vU1pmK0th?=
 =?utf-8?Q?yLZW4Fp7okDtSczXmtnlx3gGISdnCM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWlRR09kQ1BqQzRlNWNpbzBNcVlVQW5EY2I3cnJSdnVvMnVrSTFxRVdsK054?=
 =?utf-8?B?QVVWSHdiSEJVbmVNVkFOSDJRdEV6SlFsbnJyUXlON3EvMnlacW5Nc0g2U2Z3?=
 =?utf-8?B?Y2hVQTZLL05GUmkzWTU1eXdFSlVLczA5QytOMDRQVnI4dXN2Qkk5dExNU1Vk?=
 =?utf-8?B?aTFKZ0tDamZWMS95aDZ1TVNpN3MyVEovQVJPNUhZaHJNbStLNVpMUUZOS09K?=
 =?utf-8?B?cWxnSjE4NlJSOHJaazg4Q2x4VHRiZUtBTWdZU2VyZUdnSmpmUUF3YzNJa0ZH?=
 =?utf-8?B?VGROOSs4MDM5NVNmZFdMYWlmTGkvWjF4V2tLdTB1ZlhScjY1STg3SHJsdzhJ?=
 =?utf-8?B?YUFWSVlkQ2Q1Q2RDdTNxNHBJRzZDWUNKWis0R213SXdCZklCSDhMc1VEenBK?=
 =?utf-8?B?VnJFTEM3Q0dKNU5jVWxNZXV1ZTg1eFczb2FlMEpTTWJJMmFhQzhpTUZiMkNE?=
 =?utf-8?B?c2FVeVhieHY3b3duL2o4YnZPdFdIbzlLNXA5TmFJSVBpSFEzck51cDV3eHVZ?=
 =?utf-8?B?UTNRcmhacExXQm41NE05V0NZNnhIcWZKMS93cVZLQlh3R0lOUXJpUGd1cHhS?=
 =?utf-8?B?NmFrdWFGa0NKYWhJd0JQbGZYY2tXeW5IbXlDTkxwVTgyY1NkVkRKYWdKMktl?=
 =?utf-8?B?dFFiZ1NjMEQ3VG8ydnlwU3ZWNnhRMXNHWVhjdy9DZXlZQVlTOHkraitzSkph?=
 =?utf-8?B?VlhsU1Fja2grV2VDOEJRUDFqdkdxS2pvQ0pOdjhMNHpTM0lydWVHWXBnd3k2?=
 =?utf-8?B?N0VJOGpWZDBFbmNpS0pQSlVwRDdMTWJOSmE4dFo2OVUydFBPbzRzRmxPWnB4?=
 =?utf-8?B?OXVhYkVQK0Eza0lUa1pjc1BBdVJ1NW91WTZKRStNNCs1VGV2OWRXOXBXY3Zz?=
 =?utf-8?B?UVAvVEllL2NXTy8yR3RkbVFkRDMvWW5hQnE4V1RKUVI4bU9wdStIZ2QxVU9V?=
 =?utf-8?B?MG5JSjFaRDNScUZ3bUw4T2VCa1pRdGRHMzlDbGJWT0xCTHpHaGFHcnhUWGZw?=
 =?utf-8?B?ZlVqMTBNd0NvcWM4UVlndE9sNVA4eS9Fam1RNENiMkZ5Q3M0cXM5Zy9qWHB1?=
 =?utf-8?B?cW1ZelVWNjZ6aHZnazZrV1FNTVYrY04wRStRT0lWRnFHZjdEWUp6T0NGZFNW?=
 =?utf-8?B?SGVqc3hqUWNoaGZRck1IRlJmY2NhSUpRZFZhT2k3TG5PWlBFVFl4Vm5yWmdP?=
 =?utf-8?B?MUZhVTMyUG93Z0FYa21vNE1aaEdyellZS0ttalY1MDI4Qlh1cjZ5Q3BZcDhH?=
 =?utf-8?B?bG95ZngzZzNRbFJEWkI0ZzVVTVNKOGVSMVBPTnNMWTduU2Y1WFJiY2tZRXIy?=
 =?utf-8?B?ZmlLY3M3Ny84ekhNRy9MVld2WU9uajFYZytyeVJ4dVJ6Y3VWRXdicGNQa3pu?=
 =?utf-8?B?NUpKS0dyS0tDRllMM1FobGpFUHQybHUyRU9qaUN0Z2tGSWRRdDBXbEhCc3pH?=
 =?utf-8?B?ZlNYemk5WG9vcUo1b3ZZYTdHVHZBZnk3Tm1GaC92dmhOa08yeGFPTUtPeStr?=
 =?utf-8?B?RHdLTUQwYkpmajFTbTBpWVN6VE5KK3Rkd0p5WVdaT2pCaG95VE9uZzJrUEh1?=
 =?utf-8?B?OWM4aFhyWlgrenpGRTR6Uks0LzF4Q21ER2E4ejZtN2E1eHJncUdlOXh0b3c1?=
 =?utf-8?B?UkoycTVja2w1dEd1RHdwQ0Z1czRrdk1GUTR2RkkyR2c2aGVOajRGYVZUeitY?=
 =?utf-8?B?NnR2TWhITjJFS0RIT2k4TWV4cEFxTXNESUkwNU9NM2Vjc0dsY2ZuWTdqZVFk?=
 =?utf-8?B?czRtUGw2dG4wL1N6b0FtdzdzTGtSR1h6cmV6K3hjZTVGQ1VUUVJMUU1zTml5?=
 =?utf-8?B?cmFicURCVVlYdHl2RmE4U3hObFArYjV1cy9NOXgzOG9jamNsZW0raXF1Q3h2?=
 =?utf-8?B?WkZ4bUFRRjZqd0l2SnMxL244S0g0S2U5RnZra0N2Y2ZqK0x6clNML1hWQXpV?=
 =?utf-8?B?RzdsVzhnUjQ1YUFSczcwM1loMWtpUUhHL0tpTVdSdUdLK3RXMjg5dFhHWHNs?=
 =?utf-8?B?NnhtUDY1WGJoeFhGRitndWhWRDZQOVM1R0F5bmw4b1RnZFZLc2EzdENBNmRL?=
 =?utf-8?B?M095TWZMb2x1RlJjM1VFREhqd1NSaCtLRmVIeFdYSThNZmRBWmZhWGNKV3lo?=
 =?utf-8?B?bEh0bEJPRnFHaTd6ZkRBc1RGaXd0VmovTHhUcUJHSG1aWkxyRnNhTCtKSzc1?=
 =?utf-8?B?d29UVCtOcWptcVk0Yjl5Nm9uSDNyUEl1TFpjYTJXT1o4eVZhVERTbm1qUWtM?=
 =?utf-8?B?YlhJWG4xQ25QNllsOHNPSEFMalFnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a3943e0-b8f7-4177-f2e2-08de0f818458
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 02:36:48.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P1jhTKt0I5fplwVEtz9yDjxL1hYiDRDJFwpMsvQ7wufTENl+ceIN8qTGWbAFeIatdUZFq1LiX087hQSe+YyY8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6345
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
> Add CSI node to Tegra20 and Tegra30 device trees.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra20.dtsi | 19 ++++++++++++++++++-
>  arch/arm/boot/dts/nvidia/tegra30.dtsi | 24 ++++++++++++++++++++++--
>  2 files changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra20.dtsi b/arch/arm/boot/dts/nv=
idia/tegra20.dtsi
> index 6ae07b316c8a..5cdbf1246cf8 100644
> --- a/arch/arm/boot/dts/nvidia/tegra20.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra20.dtsi
> @@ -64,7 +64,7 @@ mpe@54040000 {
> =20
>  		vi@54080000 {
>  			compatible =3D "nvidia,tegra20-vi";
> -			reg =3D <0x54080000 0x00040000>;
> +			reg =3D <0x54080000 0x00000800>;
>  			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&tegra_car TEGRA20_CLK_VI>;
>  			resets =3D <&tegra_car 20>;
> @@ -72,6 +72,23 @@ vi@54080000 {
>  			power-domains =3D <&pd_venc>;
>  			operating-points-v2 =3D <&vi_dvfs_opp_table>;
>  			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			ranges =3D <0x0 0x54080000 0x4000>;
> +
> +			csi: csi@800 {
> +				compatible =3D "nvidia,tegra20-csi";
> +				reg =3D <0x800 0x200>;
> +				clocks =3D <&tegra_car TEGRA20_CLK_CSI>;
> +				power-domains =3D <&pd_venc>;
> +				#nvidia,mipi-calibrate-cells =3D <1>;
> +				status =3D "disabled";
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
>  		};
> =20
>  		epp@540c0000 {
> diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nv=
idia/tegra30.dtsi
> index 20b3248d4d2f..be752a245a55 100644
> --- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
> +++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
> @@ -150,8 +150,8 @@ mpe@54040000 {
>  		};
> =20
>  		vi@54080000 {
> -			compatible =3D "nvidia,tegra30-vi";
> -			reg =3D <0x54080000 0x00040000>;
> +			compatible =3D "nvidia,tegra30-vi", "nvidia,tegra20-vi";
> +			reg =3D <0x54080000 0x00000800>;
>  			interrupts =3D <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks =3D <&tegra_car TEGRA30_CLK_VI>;
>  			resets =3D <&tegra_car 20>;
> @@ -162,6 +162,26 @@ vi@54080000 {
>  			iommus =3D <&mc TEGRA_SWGROUP_VI>;
> =20
>  			status =3D "disabled";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			ranges =3D <0x0 0x54080000 0x4000>;
> +
> +			csi: csi@800 {
> +				compatible =3D "nvidia,tegra30-csi";
> +				reg =3D <0x800 0x200>;
> +				clocks =3D <&tegra_car TEGRA30_CLK_CSI>,
> +					 <&tegra_car TEGRA30_CLK_CSIA_PAD>,
> +					 <&tegra_car TEGRA30_CLK_CSIB_PAD>;
> +				clock-names =3D "csi", "csia-pad", "csib-pad";
> +				power-domains =3D <&pd_venc>;
> +				#nvidia,mipi-calibrate-cells =3D <1>;
> +				status =3D "disabled";
> +
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
>  		};
> =20
>  		epp@540c0000 {
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




