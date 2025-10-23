Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4835BFF1CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 06:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9EE10E352;
	Thu, 23 Oct 2025 04:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jQgInkX/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011035.outbound.protection.outlook.com [52.101.52.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF9210E352
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 04:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brj9pEk0Vj2XYHXF9K8OXq773XttpPjNLsCVMFeZR1jabsmG7DRe1wl30GJXzDjCd9Sx9L57uAEAlh1Y5lRpRd6WrNP2glpKoWhnTuU5Db5o9u5MT3e4esXeZYgE2gvjuFcew8VaW0CPKrQcxa/f/YiUvZUGtrOPIwmBniWHzhvHQPp0txjey4EYm8xZTgS3yBG4cnBTTw+MV840nb6RxhTw84tdojNmDyCiesplUs4nAhJC6hUNrWbCwu3LgehUI/O7Nm6poHgQObhLrIj5kxDdQbVT2MIDxFOj+WR59W/saNQIYt2CftvYfy65IuL+rPT8vHp4q/C12Ni62VunRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QRb1aejLxAZmFamMSdDMYmohuI6M53limNFeD0UTMs=;
 b=cu5jtqQphr88PJWNi+zM7mRRexb0o9B+RgO9P1EnzRv/U/TEPo1GnSr3vL4b/IUs3PJBpmIAJ8xITJElDQ8pvO7wGRF/SWz/s0z2XQwGUqvdLi0QYcs5PWloS5hWN0HJ6Mgedu0JBpX5DD0eKx2Lhrxk0aZeT0NHI0GXXl3NQj4MAJyv9Ni72Aednweu/ldTCtzX5Wb/2RQyOrxXvrYXrK4A3LxbZkNudIyFkjYqfbvu+OHwulwCxxfLhOiUQuCOjokqhobkemMqQ7DCiKoGWnA5IQozMBi5sU/s2eUR54DN31yEccucinC4X182s5WBTa/COfwrfSGnh37c6Dh7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QRb1aejLxAZmFamMSdDMYmohuI6M53limNFeD0UTMs=;
 b=jQgInkX/uawZMr1SOWeXLBlJYuEdqpdn1iNSMci/Oo7AZKzapCJn8NoBqlrKZCHJNLdRl6q+z7h0bGH8nSKNj119rQq3BXWjic8Uz5Ogqzl5rZRs6cocs0+eP0mdqUt4pjBz1wXYQ4x4T8AuEp6Ri+djGAgjXV9uyz9U9yJb34bP7uA015WT8de81w4PF10uYPhd7+55691dbrJiUWPv+0p7CKzBskX0wy+4VdA/j91zbZIcIKenrEgvZuonj1Y2iMaWEp1wRQFg1uA/DgamSHqPGq5V2wMi1Owfr/vpGEH+lvVURNXbum6YerCGga45GtHHVUQKQMuoqgMDe1fmSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CYYPR12MB8655.namprd12.prod.outlook.com (2603:10b6:930:c4::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.16; Thu, 23 Oct 2025 04:31:06 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 04:31:06 +0000
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
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support for
 Tegra20 and Tegra30
Date: Thu, 23 Oct 2025 13:30:59 +0900
Message-ID: <3802221.l52yBJDM9G@senjougahara>
In-Reply-To: <20251022144930.73272-3-clamor95@gmail.com>
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0080.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::9) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CYYPR12MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: 839f8c2e-09d2-4022-8ee1-08de11ecfb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHBnQVlMMFBTQXkxTjhiVlhLV2R5L09DK0RFZFpoaFVLbWZsNFNNZ0tiYTN1?=
 =?utf-8?B?VnBPOEE3M1JMNS9zdlRuWGc3NUd6VGRUVEZMc3pqc092eU5USitJUzd4VGE0?=
 =?utf-8?B?Y3NSNzRDUkxUbThYd0pyaCtGYWk3dklOdHl3aDc0Qm1neDJHUWFkSlppQUFy?=
 =?utf-8?B?c0FnZStwU2tZRkowcHQ0cVVRQW1YMFAxcFRzNGttRXpISDNvQ3ByR09ibUtw?=
 =?utf-8?B?SldPWVRZc1RkV1NNaVdnK25JK04xMFVHQ3dVNWRBNkNTRXlrTmNXTjhjUUdq?=
 =?utf-8?B?UGF6eFZmOE1yWHQ3aXlkc09ZSGRiNjVFb1R3Q3FLZkJlNHR6Mk5lS0JPdU52?=
 =?utf-8?B?V2xRTzZwcVFuSlBIK3VUcHZvTkdVa3FHUGY4emc0dklmRUpCTWxBQUZVUXgx?=
 =?utf-8?B?WXJDN1IzUUIwckNlRkM3eGhaenVSZ0FiMUVXQ3dMVDlkMzl4emZTTmRDTEc0?=
 =?utf-8?B?alRRZEc4WC9HRmZkNmpOczVCOUxDNjJkb3IrZmhHZURPcUdzb2lvQUp3R3hB?=
 =?utf-8?B?dmN5a240TzYyUXVkUlY5RHhJeFBCdURlMGNsQVYvZlYrd2RSMW42dW9MTDV0?=
 =?utf-8?B?VHVwbmVsRGNCaHF6U2JrTVo4VmcvWXVXbnB2Y1cvMDk5d2tiV0crbHpjODFr?=
 =?utf-8?B?TVkxa2R5a2dEUUVEcVFidWRRMzY0QWM4Y1hMS2Rkb1l0UGNMUFdTM0UxUEx0?=
 =?utf-8?B?NU91Y1dSd1lHNTBuUElEaUJiRUErNWJxQWY1YjZFNVJZb0JyL0doeXJ4eTNT?=
 =?utf-8?B?TVA0YTNicG95V2VacmxGcDB1SFJSbklmWnd6NzhCNUMrQVdDUHU2TUU2Mmt4?=
 =?utf-8?B?S1JhWGtBdHhpeFR1UEs2bWloWlFZZ0YyWGlGY1FsTVROWGJ0ZzJ3d2xZY2Zs?=
 =?utf-8?B?RDZUWmhKNnZRem1BQkVtRTloME9yRGVCWjBWZkJ0SmhLWFhKOGFETHpzemd6?=
 =?utf-8?B?ZER3M0dmYVlEb01BbmZPcVFFWTB3bnh0WVhSNkVVekVCTVRBZnJQRkhIYm14?=
 =?utf-8?B?NVVJazMzMklEV1dtSVZPUzdEd2d2Y1VYL29EbzVZcDZYSGF4ckt5VTBTWHBI?=
 =?utf-8?B?eWhHRFlaby9qdjh1d2k4Qnc2NHRBanZENlR0T0dkcE5BK21EYm9iK3pFeit6?=
 =?utf-8?B?aEVpUVZHaVBqdDduT3hPRGJUWUdVMXVDNmdyWXo1RWRrYUc3N0FGZE81dkpm?=
 =?utf-8?B?akpCQkk2a2FVSXZ0Y1c3Q0NGTm04MGJzKzJKR0tpcGRDdnR4d0xyNVhnNkl4?=
 =?utf-8?B?a2Z4SzRTOHh4aTdMbGptS01JaTgvakRCMXY3SkdSbUtrOGIyL2dNQmNMUWNH?=
 =?utf-8?B?b295Y3BUeGJGV0VMVTZhSGRWMGV2WTIrM21JNkpWeVRiYmR1UGQzWTRCZ1Ar?=
 =?utf-8?B?aWoyeWwyY2tSQTJ0MGxBdzhTLzF0MEZuZE12VVE4TXpzcE5FTlhlUFhZSDFj?=
 =?utf-8?B?bElDRFlVY3Y1QWZOL29JTFp4Y1B0QUhYVVFIWFFiakhSY0ZLSEFPdzZqcWgv?=
 =?utf-8?B?Y0hOV3dUSFh5VGZ5Y2RMenhvVzBkRERzQzVCU2xxcDZ0R09TUTlzRzR6VXI4?=
 =?utf-8?B?dEdYQXIvN0lLcnJCUVV4UmExdS9vcXI4bDJ1dzllSXkzVTBJMW5pTjJRdDlt?=
 =?utf-8?B?SVhhSUNYaUxQSjMyaWY0dXRVTmd1TEx3bTh2cUFCT1JjSmxiUmVsclY3dmtw?=
 =?utf-8?B?ZlhSdFhZV2tvaTY1SGFONzc3MXZ4ZU1jOEZ4QTJRZWp4Y1ZOVndWYTVGVEk1?=
 =?utf-8?B?VzhHb0luMkE0cmNPZ3VkTnZJeDAxSnB2Z0xiUndBNWQ2T2lMQ1VCWGdBckNP?=
 =?utf-8?B?UkEyRU1JeWV5NnZsUWo5eGJVSkRiMWdDTXlDUzdySkJKTldOTy9Rdk5tNkxo?=
 =?utf-8?B?bWJyakF5Yy81aGlqOVpqaEpaMzFQT2cwLzRpdGNOd2ErRFNPdE9ZS3FNajV0?=
 =?utf-8?B?cFZ5WjJuNHpTelQ4NGc0QnFkS0FkR3JuQlFYeS94YldwZzFrbmZLYzJPRG8y?=
 =?utf-8?Q?0WNRPEyhURhSoMN1lUomz9hQEIim6w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sll0bWxTWVRydkJSUWxhVi9ZRzVIRWtwOFVCVGViR1VlbUI4WFVmS3Ayd2pW?=
 =?utf-8?B?ZnFiUVp3NVlLaVc5Q2dERjIwRGpRREEwWGFoWWhVcE5lekdGZGRGRzFsMkxO?=
 =?utf-8?B?dWt5ay85VmhlcVZtT1l1QSs3bzNuTEppV2lrYUNvZnNsR0ZLNlpqVTdHUnVZ?=
 =?utf-8?B?bklBRFZCZ3RYSWd2YWc4eGJKczdQaHBFZ3IyaGFERjhOakdnYnpGUXBrbkVv?=
 =?utf-8?B?K3BFckVZamI0RWh6OFA0UnZhYjRCd21yemZwY3NZS0JxWlFqOC9ZRUlqOVhF?=
 =?utf-8?B?ZEhvVnFYY3VIbnVFL1JBWHduSHVpTlpkS3RoMml1TUc3VkFmdnFhVDN3VmJm?=
 =?utf-8?B?TkIrYnh5T2NqdVBLR3JqMTJ0dXpHOVVHb0EwbU83cGQ2V0p1MjJUOVhvaG1E?=
 =?utf-8?B?aEh0Z0hYZ1RJenlKb1N1bnYrWWNEQnQzczc2VVUwWjcwOXBqTUZBOTkyR0lt?=
 =?utf-8?B?M1RlamhKa1RORERFWW85NmdYNlZsZW91ZDluWHQvREI0ZkhjUU9jM2hPU0tm?=
 =?utf-8?B?TXRITFRaU0kzMHorUWNrSEVhem5LZXZFNjAwRWFZK1l1amhZV0JZVHNWUWYv?=
 =?utf-8?B?YUNIS241YlI5UVN3eDV2RVM4Rk5jcW1RUERpdHlCTDZkRFcrTzgzYTd6MStn?=
 =?utf-8?B?OENEdEVJMkpvZSsxZVgxbk1GTENqS1lXM3pkRlptZGNDQzIvQWZQckZkZ2pW?=
 =?utf-8?B?aDY2TXQ2YXhJVTF1ZytFS3libWNEdUtINGtvOUhxZXBaak9jK3ZxWGVkY2o3?=
 =?utf-8?B?cmgwTUovcjFsN3RmRlNxWjliUHlzeC9hNHRjRElDSWNuTjZIVUU4TnRpOVVt?=
 =?utf-8?B?VXpXSTVUb0lkdER4TE5tTXRPdW1zMVhWUUUrTkEyWXM5dXpVQkErM1lTSVhT?=
 =?utf-8?B?cm5CUW50USs5aEYrejdpTjJVbDRjTi80ZVJJT0ZSbFdSQlQzT3R2MkQ0SGN3?=
 =?utf-8?B?NXNCeXZXSUdzalBrSERhUE53OWVqR2I2SG16dlZGakJSMXdENGZqRDVzL1NU?=
 =?utf-8?B?ZmpCZEVDRmFWYmJxczkzYWtKTkEzZkZSVFFZUks0ekoxQ0ZBSldkbE1sQk9E?=
 =?utf-8?B?d2lkbk9JSHorWkFsYlphWWdib3gyVHdiaDlmbUp2VTJpYjYrNWs0TTE2RFJF?=
 =?utf-8?B?SkRWck0yTmlKbTdRMUtUZFpvV0hzbkhqK3c1V1JXSG9NNDdOYXpNbVlkSlNM?=
 =?utf-8?B?dk4zUzQ1SzBVR29kR2pJaTJQVStOMExWVnovdjhTaXZZRUh1RGNHaitMTGdm?=
 =?utf-8?B?dWdZT1J3UitVYlE1Wk5CTW9jTUpMMzZNQXZsbDJ4NXFsSE0xT3lOWlVuUlRM?=
 =?utf-8?B?TmxYbjBBYTVqU04vUUh1bUtXZ0RWTkJNS091ZlllUzZFaXk3RkRubjZ3UGQw?=
 =?utf-8?B?TThkMEdSWkQxUUxqTllnYXE2RndqRjlTN0JpNFZWaEd3NHVrK095WFBjNVRQ?=
 =?utf-8?B?b242UjdFck1CKzlrL0NuYmd1NDZwWDVaV1F5VzdxR295eTBwTXNISHdWSnJ4?=
 =?utf-8?B?ditZUjdnclNWVVRPTk0rZjFjVUJ5cC9xWmNhUlJndDdTVFhObHJXK24zOUN3?=
 =?utf-8?B?K2lyNC9IODJWNm8zQzZXRmc1UWJQYXh1S0NqNWE4eE0zK1lGQVdBMHQzZ3pU?=
 =?utf-8?B?dE94SjJuRFpuQ0dTVk1jRjdldGdrcllDb2hrWXd5OWtKSnhiMXVEd2RYakNB?=
 =?utf-8?B?RVNMbGk5UUVKUGdxVDBHaDE5UEw3T0swNHp3WWwyQ2RBdWRZNDFEUm1rUTFs?=
 =?utf-8?B?YTVYZmxlRXJQYlMyZzJBdTJYRStObDRlbzdxSk94bEZKWUFiWkNnWmUvWkQ4?=
 =?utf-8?B?VGpvbUJVaDlCWVBiKzEyc0V2bWtHdkhqN3pGT2E5eHYySUpTbWRWaWo4cDdS?=
 =?utf-8?B?Y1dGcFEvQXBLbTBicGdSMHdFSU52NnJNblV5N1Uyeno1czNzSWF5bUd3TUFB?=
 =?utf-8?B?SFBwTDlLcXUyUUdWZERNbk5EUTRYZVBJYXZqSUFpdS82UUU0Y0tvbXVTR01J?=
 =?utf-8?B?SzROYjFuZ2FtWkdsaXpHV1ZiSFBqTThGQlhsSCt3UlR2Q1A1bzF0V3BRb2xK?=
 =?utf-8?B?ZFlhNHd0UllNd3F4ZEozQ2U5Q21DaEFVMlIreWZzZ0pEbFROSXk4dXY3bXJz?=
 =?utf-8?B?Rk55K3B5YWRkTnNVVXppUE9Jblk3Q1lXM2czOVRWVjNjeFR5OTU3bTlxa09Q?=
 =?utf-8?B?QzJIZmtBN2hDS215V3Yycy9GdjN0SmhmK2RhZWl0c0RJSmRCNW0rY21Zenk0?=
 =?utf-8?B?WHQ3MHQrSmlDWnRMK0tpRGlFZjF3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 839f8c2e-09d2-4022-8ee1-08de11ecfb76
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 04:31:06.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFKeoWr9ySS+pDqrW+aCHWKiqsIc/tZPbm1xvCTITpvL9Zi0tlNC50u4FgaGo9KeSrQ1bus+WIJy66ADbrU0Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8655
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

On Wednesday, October 22, 2025 11:49=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 an=
d
> Tegra30 SoC.
>=20
> To get CSI operational, an additional syncpoint was allocated to serve as
> the CSI frame counter. Both VIP and CSI use an existing syncpoint for VI
> frame start events. That said, the frame capture function was refactored
> to reflect the addition of the CSI syncpoint, and the CSI-specific
> configuration is guarded by the presence of a passed CSI channel structur=
e
> pointer.
>=20
> The camera capture setup's configuration was reconsidered: the first two
> writes must be done before tegra_channel_set_stream for MIPI calibration
> to work properly; the third write was moved to VIP/CSI-specific functions
> since it must be source-specific; the function was placed after
> tegra_channel_set_stream so the initial sequence is preserved and expande=
d.
>=20
> CSI configuration sequences were added based on downstream 3.1 kernel
> sources and adjusted to the existing video-tegra framework. Although
> Tegra20 and Tegra30 have the same set of configurations, they differ by
> the number of clocks used by CSI.
>=20
> Dropped the software syncpoint counters in favor of reading syncpoints
> directly and passing the incremented value to the polling function. If th=
e
> syncpoint increase fails, the PP is reset. This change should prevent
> possible race conditions.
>=20
> MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> have no dedicated hardware block for these operations and use CSI. These
> calls are used for both CSI and DSI to work properly, which is why MIPI
> calibration cannot be contained within CSI. The pads passed to the
> calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) and
> DSI-B (4).
>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

> ---
>  drivers/staging/media/tegra-video/csi.c     |  23 +
>  drivers/staging/media/tegra-video/csi.h     |   4 +
>  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 -
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  5 files changed, 608 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 7d70478a07aa..7192c2e8bae7 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -827,6 +827,17 @@ static int tegra_csi_probe(struct platform_device *p=
dev)
> =20
>  	csi->dev =3D &pdev->dev;
>  	csi->ops =3D csi->soc->ops;
> +
> +	if (csi->soc->mipi_ops) {
> +		ret =3D devm_tegra_mipi_add_provider(&pdev->dev, pdev->dev.of_node,
> +						   csi->soc->mipi_ops);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "failed to add MIPI calibration operations\n");
> +	}
> +
> +	mutex_init(&csi->mipi_lock);
> +
>  	platform_set_drvdata(pdev, csi);
>  	pm_runtime_enable(&pdev->dev);
> =20
> @@ -858,11 +869,23 @@ static void tegra_csi_remove(struct platform_device=
 *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
> =20
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +extern const struct tegra_csi_soc tegra20_csi_soc;
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +extern const struct tegra_csi_soc tegra30_csi_soc;
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  extern const struct tegra_csi_soc tegra210_csi_soc;
>  #endif
> =20
>  static const struct of_device_id tegra_csi_of_id_table[] =3D {
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", .data =3D &tegra20_csi_soc },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", .data =3D &tegra30_csi_soc },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_soc },
>  #endif
> diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/me=
dia/tegra-video/csi.h
> index 1550defb115a..58ca98da2305 100644
> --- a/drivers/staging/media/tegra-video/csi.h
> +++ b/drivers/staging/media/tegra-video/csi.h
> @@ -115,6 +115,7 @@ struct tegra_csi_ops {
>   * struct tegra_csi_soc - NVIDIA Tegra CSI SoC structure
>   *
>   * @ops: csi hardware operations
> + * @mipi_ops: MIPI calibration operations
>   * @csi_max_channels: supported max streaming channels
>   * @clk_names: csi and cil clock names
>   * @num_clks: total clocks count
> @@ -123,6 +124,7 @@ struct tegra_csi_ops {
>   */
>  struct tegra_csi_soc {
>  	const struct tegra_csi_ops *ops;
> +	const struct tegra_mipi_ops *mipi_ops;
>  	unsigned int csi_max_channels;
>  	const char * const *clk_names;
>  	unsigned int num_clks;
> @@ -140,6 +142,7 @@ struct tegra_csi_soc {
>   * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
>   * @soc: pointer to SoC data structure
>   * @ops: csi operations
> + * @mipi_lock: for MIPI calibration operations
>   * @csi_chans: list head for CSI channels
>   */
>  struct tegra_csi {
> @@ -150,6 +153,7 @@ struct tegra_csi {
>  	struct regulator *vdd;
>  	const struct tegra_csi_soc *soc;
>  	const struct tegra_csi_ops *ops;
> +	struct mutex mipi_lock; /* for register access */
>  	struct list_head csi_chans;
>  };
> =20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 626f34543853..ac67c6f0afae 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -4,6 +4,9 @@
>   *
>   * Copyright (C) 2023 SKIDATA GmbH
>   * Author: Luca Ceresoli <luca.ceresoli@bootlin.com>
> + *
> + * Copyright (c) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> + * Copyright (c) 2025 Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
>   */
> =20
>  /*
> @@ -12,10 +15,15 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk/tegra.h>
>  #include <linux/delay.h>
>  #include <linux/host1x.h>
> +#include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/kthread.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/tegra-mipi-cal.h>
>  #include <linux/v4l2-mediabus.h>
> =20
>  #include "vip.h"
> @@ -42,6 +50,9 @@ enum tegra_vi_out {
>  #define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
>  #define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
> =20
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(n)	(0x0070 + (n) * 8)
> +#define TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_END(n)	(0x0074 + (n) * 8)
> +
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
>  #define       VI_INPUT_BT656				BIT(25)
> @@ -88,6 +99,8 @@ enum tegra_vi_out {
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 << VI_OUTPUT_OUTPUT_=
FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 << VI_OUTPUT_OUTPU=
T_FORMAT_SFT)
>  /* TEGRA_VI_OUT_2 supported formats */
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER	(7 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER	(8 << VI_OUTPUT_OUTP=
UT_FORMAT_SFT)
>  #define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 << VI_OUTPUT_O=
UTPUT_FORMAT_SFT)
> =20
>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
> @@ -152,8 +165,106 @@ enum tegra_vi_out {
>  #define TEGRA_VI_VI_RAISE				0x01ac
>  #define       VI_VI_RAISE_ON_EDGE			BIT(0)
> =20
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_START(n)		(0x01d8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_RAISE_FRAME_END(n)		(0x01dc + (n) * 8)
> +#define TEGRA_VI_CSI_PP_H_ACTIVE(n)			(0x01e8 + (n) * 8)
> +#define TEGRA_VI_CSI_PP_V_ACTIVE(n)			(0x01ec + (n) * 8)
> +
> +/* Tegra20 CSI registers: Starts from 0x800, offset 0x0 */
> +#define TEGRA_CSI_VI_INPUT_STREAM_CONTROL		0x0000
> +#define TEGRA_CSI_HOST_INPUT_STREAM_CONTROL		0x0008
> +#define TEGRA_CSI_INPUT_STREAM_CONTROL(n)		(0x0010 + (n) * 0x2c)
> +#define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
> +#define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
> +#define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> +#define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
> +#define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
> +#define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
> +#define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
> +#define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> +#define       CSI_PP_DATA_TYPE(n)			((n) << 8)
> +#define       CSI_PP_CRC_CHECK_ENABLE			BIT(7)
> +#define       CSI_PP_WORD_COUNT_HEADER			BIT(6)
> +#define       CSI_PP_DATA_IDENTIFIER_ENABLE		BIT(5)
> +#define       CSI_PP_PACKET_HEADER_SENT			BIT(4)
> +#define TEGRA_CSI_PIXEL_STREAM_CONTROL1(n)		(0x001c + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(n)		(0x0020 + (n) * 0x2c)
> +#define TEGRA_CSI_PIXEL_STREAM_GAP(n)			(0x0024 + (n) * 0x2c)
> +#define       CSI_PP_FRAME_MIN_GAP(n)			(((n) & 0xffff) << 16)
> +#define       CSI_PP_LINE_MIN_GAP(n)			(((n) & 0xffff))
> +#define TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(n)		(0x0028 + (n) * 0x2c)
> +#define       CSI_PP_START_MARKER_FRAME_MAX(n)		(((n) & 0xf) << 12)
> +#define       CSI_PP_START_MARKER_FRAME_MIN(n)		(((n) & 0xf) << 8)
> +#define       CSI_PP_VSYNC_START_MARKER			BIT(4)
> +#define       CSI_PP_SINGLE_SHOT			BIT(2)
> +#define       CSI_PP_NOP				0
> +#define       CSI_PP_ENABLE				1
> +#define       CSI_PP_DISABLE				2
> +#define       CSI_PP_RESET				3
> +#define TEGRA_CSI_PHY_CIL_COMMAND			0x0068
> +#define       CSI_A_PHY_CIL_NOP				0x0
> +#define       CSI_A_PHY_CIL_ENABLE			0x1
> +#define       CSI_A_PHY_CIL_DISABLE			0x2
> +#define       CSI_A_PHY_CIL_ENABLE_MASK			0x3
> +#define       CSI_B_PHY_CIL_NOP				(0x0 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE			(0x1 << 16)
> +#define       CSI_B_PHY_CIL_DISABLE			(0x2 << 16)
> +#define       CSI_B_PHY_CIL_ENABLE_MASK			(0x3 << 16)
> +#define TEGRA_CSI_PHY_CIL_CONTROL0(n)			(0x006c + (n) * 4)
> +#define       CSI_CONTINUOUS_CLOCK_MODE_ENABLE		BIT(5)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_STATUS		0x0078
> +#define TEGRA_CSI_CSI_CIL_STATUS			0x007c
> +#define       CSI_MIPI_AUTO_CAL_DONE			BIT(15)
> +#define TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK	0x0080
> +#define TEGRA_CSI_CSI_CIL_INTERRUPT_MASK		0x0084
> +#define TEGRA_CSI_CSI_READONLY_STATUS			0x0088
> +#define TEGRA_CSI_ESCAPE_MODE_COMMAND			0x008c
> +#define TEGRA_CSI_ESCAPE_MODE_DATA			0x0090
> +#define TEGRA_CSI_CIL_PAD_CONFIG0(n)			(0x0094 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG1(n)			(0x0098 + (n) * 8)
> +#define TEGRA_CSI_CIL_PAD_CONFIG			0x00a4
> +#define TEGRA_CSI_CILA_MIPI_CAL_CONFIG			0x00a8
> +#define TEGRA_CSI_CILB_MIPI_CAL_CONFIG			0x00ac
> +#define       CSI_CIL_MIPI_CAL_STARTCAL			BIT(31)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_A		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_OVERIDE_B		BIT(30)
> +#define       CSI_CIL_MIPI_CAL_NOISE_FLT(n)		(((n) & 0xf) << 26)
> +#define       CSI_CIL_MIPI_CAL_PRESCALE(n)		(((n) & 0x3) << 24)
> +#define       CSI_CIL_MIPI_CAL_SEL_A			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_SEL_B			BIT(21)
> +#define       CSI_CIL_MIPI_CAL_HSPDOS(n)		(((n) & 0x1f) << 16)
> +#define       CSI_CIL_MIPI_CAL_HSPUOS(n)		(((n) & 0x1f) << 8)
> +#define       CSI_CIL_MIPI_CAL_TERMOS(n)		(((n) & 0x1f))
> +#define TEGRA_CSI_CIL_MIPI_CAL_STATUS			0x00b0
> +#define TEGRA_CSI_CLKEN_OVERRIDE			0x00b4
> +#define TEGRA_CSI_DEBUG_CONTROL				0x00b8
> +#define       CSI_DEBUG_CONTROL_DEBUG_EN_ENABLED	BIT(0)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_0		BIT(4)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_1		BIT(5)
> +#define       CSI_DEBUG_CONTROL_CLR_DBG_CNT_2		BIT(6)
> +#define       CSI_DEBUG_CONTROL_DBG_CNT_SEL(n, v)	((v) << (8 + 8 * (n)))
> +#define TEGRA_CSI_DEBUG_COUNTER(n)			(0x00bc + (n) * 4)
> +#define TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(n)	(0x00c8 + (n) * 4)
> +#define       CSI_PP_EXP_FRAME_HEIGHT(n)		(((n) & 0x1fff) << 16)
> +#define       CSI_PP_MAX_CLOCKS(n)			(((n) & 0xfff) << 4)
> +#define       CSI_PP_LINE_TIMEOUT_ENABLE		BIT(0)
> +#define TEGRA_CSI_DSI_MIPI_CAL_CONFIG			0x00d0
> +#define TEGRA_CSI_MIPIBIAS_PAD_CONFIG			0x00d4
> +#define       CSI_PAD_DRIV_DN_REF(n)			(((n) & 0x7) << 16)
> +#define       CSI_PAD_DRIV_UP_REF(n)			(((n) & 0x7) << 8)
> +#define       CSI_PAD_TERM_REF(n)			(((n) & 0x7) << 0)
> +#define TEGRA_CSI_CSI_CILA_STATUS			0x00d8
> +#define TEGRA_CSI_CSI_CILB_STATUS			0x00dc
> +
>  /* ---------------------------------------------------------------------=
-----
> - * VI
> + * Read and Write helpers
>   */
> =20
>  static void tegra20_vi_write(struct tegra_vi_channel *chan, unsigned int=
 addr, u32 val)
> @@ -161,6 +272,35 @@ static void tegra20_vi_write(struct tegra_vi_channel=
 *chan, unsigned int addr, u
>  	writel(val, chan->vi->iomem + addr);
>  }
> =20
> +static int __maybe_unused tegra20_vi_read(struct tegra_vi_channel *chan,=
 unsigned int addr)
> +{
> +	return readl(chan->vi->iomem + addr);
> +}
> +
> +static void tegra20_csi_write(struct tegra_csi_channel *csi_chan, unsign=
ed int addr, u32 val)
> +{
> +	writel(val, csi_chan->csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_csi_read(struct tegra_csi_channel *csi=
_chan, unsigned int addr)
> +{
> +	return readl(csi_chan->csi->iomem + addr);
> +}
> +
> +static void tegra20_mipi_write(struct tegra_csi *csi, unsigned int addr,=
 u32 val)
> +{
> +	writel(val, csi->iomem + addr);
> +}
> +
> +static int __maybe_unused tegra20_mipi_read(struct tegra_csi *csi, unsig=
ned int addr)
> +{
> +	return readl(csi->iomem + addr);
> +}
> +
> +/* ---------------------------------------------------------------------=
-----
> + * VI
> + */
> +
>  /*
>   * Get the main input format (YUV/RGB...) and the YUV variant as values =
to
>   * be written into registers for the current VI input mbus code.
> @@ -283,20 +423,27 @@ static int tegra20_vi_enable(struct tegra_vi *vi, b=
ool on)
>  static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *c=
han)
>  {
>  	struct tegra_vi *vi =3D chan->vi;
> -	struct host1x_syncpt *out_sp;
> +	struct host1x_syncpt *out_sp, *fs_sp;
> =20
>  	out_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANA=
GED);
>  	if (!out_sp)
> -		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n"=
);
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request mw ack syncpo=
int\n");
> =20
>  	chan->mw_ack_sp[0] =3D out_sp;
> =20
> +	fs_sp =3D host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAG=
ED);
> +	if (!fs_sp)
> +		return dev_err_probe(vi->dev, -EBUSY, "failed to request frame start s=
yncpoint\n");
> +
> +	chan->frame_start_sp[0] =3D fs_sp;
> +
>  	return 0;
>  }
> =20
>  static void tegra20_channel_host1x_syncpt_free(struct tegra_vi_channel *=
chan)
>  {
>  	host1x_syncpt_put(chan->mw_ack_sp[0]);
> +	host1x_syncpt_put(chan->frame_start_sp[0]);
>  }
> =20
>  static void tegra20_fmt_align(struct v4l2_pix_format *pix, unsigned int =
bpp)
> @@ -424,41 +571,91 @@ static void tegra20_channel_vi_buffer_setup(struct =
tegra_vi_channel *chan,
>  }
> =20
>  static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
> -					 struct tegra_channel_buffer *buf)
> +					 struct tegra_channel_buffer *buf,
> +					 struct tegra_csi_channel *csi_chan)
>  {
> +	u32 val;
>  	int err;
> =20
> -	chan->next_out_sp_idx++;
> -
>  	tegra20_channel_vi_buffer_setup(chan, buf);
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_E=
NABLE);
> +	if (csi_chan) {
> +		u32 port =3D csi_chan->csi_port_nums[0] & 1;
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
> +
> +		/*
> +		 * ERESTARTSYS workaround for syncpoints is used because host1x_syncpt=
_wait
> +		 * is unconditionally interruptible. This is not an issue with single =
shots
> +		 * or low resolution capture, but -ERESTARTSYS occurs quite often with=
 high
> +		 * resolution or high framerate captures and if not addressed here wil=
l
> +		 * cause capture to fail entirely.
> +		 *
> +		 * TODO: once uninterruptible version of host1x_syncpt_wait is availab=
le,
> +		 * host1x_syncpt_wait should be swapped and ERESTARTSYS workaround can=
 be
> +		 * removed.
> +		 */
> +
> +		val =3D host1x_syncpt_read(chan->frame_start_sp[0]);
> +		do {
> +			err =3D host1x_syncpt_wait(chan->frame_start_sp[0],
> +						 val + 1, TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +		} while (err =3D=3D -ERESTARTSYS);
> +
> +		if (err) {
> +			if (err !=3D -ERESTARTSYS)
> +				dev_err_ratelimited(&chan->video.dev,
> +						    "frame start syncpt timeout: %d\n", err);
> +
> +			tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +					  CSI_PP_START_MARKER_FRAME_MAX(0xf) | CSI_PP_RESET);
> +			goto exit;
> +		}
> +
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +				  CSI_PP_DISABLE);
> +	} else {
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_VIP_=
ENABLE);
> +	}
> +
> +	val =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> +	do {
> +		err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], val + 1,
> +					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
> +	} while (err =3D=3D -ERESTARTSYS);
> =20
> -	/* Wait for syncpt counter to reach frame start event threshold */
> -	err =3D host1x_syncpt_wait(chan->mw_ack_sp[0], chan->next_out_sp_idx,
> -				 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
>  	if (err) {
> -		host1x_syncpt_incr(chan->mw_ack_sp[0]);
> -		dev_err_ratelimited(&chan->video.dev, "frame start syncpt timeout: %d\=
n", err);
> -		release_buffer(chan, buf, VB2_BUF_STATE_ERROR);
> -		return err;
> +		if (err !=3D -ERESTARTSYS)
> +			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", =
err);
> +		goto exit;
>  	}
> =20
> -	tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> -			 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> +	if (!csi_chan)
> +		tegra20_vi_write(chan, TEGRA_VI_CAMERA_CONTROL,
> +				 VI_CAMERA_CONTROL_STOP_CAPTURE | VI_CAMERA_CONTROL_VIP_ENABLE);
> =20
> +exit:
>  	release_buffer(chan, buf, VB2_BUF_STATE_DONE);
> =20
> -	return 0;
> +	return err;
>  }
> =20
>  static int tegra20_chan_capture_kthread_start(void *data)
>  {
>  	struct tegra_vi_channel *chan =3D data;
>  	struct tegra_channel_buffer *buf;
> +	struct v4l2_subdev *csi_subdev =3D NULL;
> +	struct tegra_csi_channel *csi_chan =3D NULL;
>  	unsigned int retries =3D 0;
>  	int err =3D 0;
> =20
> +	csi_subdev =3D tegra_channel_get_remote_csi_subdev(chan);
> +	if (csi_subdev)
> +		csi_chan =3D to_csi_chan(csi_subdev);
> +
>  	while (1) {
>  		/*
>  		 * Source is not streaming if error is non-zero.
> @@ -483,7 +680,7 @@ static int tegra20_chan_capture_kthread_start(void *d=
ata)
>  		list_del_init(&buf->queue);
>  		spin_unlock(&chan->start_lock);
> =20
> -		err =3D tegra20_channel_capture_frame(chan, buf);
> +		err =3D tegra20_channel_capture_frame(chan, buf, csi_chan);
>  		if (!err) {
>  			retries =3D 0;
>  			continue;
> @@ -510,28 +707,6 @@ static void tegra20_camera_capture_setup(struct tegr=
a_vi_channel *chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	int main_output_format;
> -	int yuv_output_format;
> -
> -	tegra20_vi_get_output_formats(chan, &main_output_format, &yuv_output_fo=
rmat);
> -
> -	/*
> -	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> -	 * for luminance, which is the default and means not to touch
> -	 * anything.
> -	 */
> -	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> -			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> -			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> -
> -	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> -
> -	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> -			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> -			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> -			 yuv_output_format << VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
> -			 main_output_format << VI_OUTPUT_OUTPUT_FORMAT_SFT);
> =20
>  	/* Set up frame size */
>  	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> @@ -562,18 +737,28 @@ static int tegra20_vi_start_streaming(struct vb2_qu=
eue *vq, u32 count)
>  	struct media_pipeline *pipe =3D &chan->video.pipe;
>  	int err;
> =20
> -	chan->next_out_sp_idx =3D host1x_syncpt_read(chan->mw_ack_sp[0]);
> -
>  	err =3D video_device_pipeline_start(&chan->video, pipe);
>  	if (err)
>  		goto error_pipeline_start;
> =20
> -	tegra20_camera_capture_setup(chan);
> +	/*
> +	 * Set up low pass filter.  Use 0x240 for chromaticity and 0x240
> +	 * for luminance, which is the default and means not to touch
> +	 * anything.
> +	 */
> +	tegra20_vi_write(chan, TEGRA_VI_H_LPF_CONTROL,
> +			 0x0240 << VI_H_LPF_CONTROL_LUMA_SFT |
> +			 0x0240 << VI_H_LPF_CONTROL_CHROMA_SFT);
> +
> +	/* Set up raise-on-edge, so we get an interrupt on end of frame. */
> +	tegra20_vi_write(chan, TEGRA_VI_VI_RAISE, VI_VI_RAISE_ON_EDGE);
> =20
>  	err =3D tegra_channel_set_stream(chan, true);
>  	if (err)
>  		goto error_set_stream;
> =20
> +	tegra20_camera_capture_setup(chan);
> +
>  	chan->sequence =3D 0;
> =20
>  	chan->kthread_start_capture =3D kthread_run(tegra20_chan_capture_kthrea=
d_start,
> @@ -668,6 +853,345 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.has_h_v_flip =3D true,
>  };
> =20
> +/* ---------------------------------------------------------------------=
-----
> + * MIPI Calibration
> + */
> +static int tegra20_start_pad_calibration(struct tegra_mipi_device *mipi)
> +{
> +	struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> +	unsigned int port =3D mipi->pads;
> +	u32 value;
> +	int ret;
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D pm_runtime_resume_and_get(csi->dev);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> +		return ret;
> +	}
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_DSI_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(4) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(3) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(0));
> +	tegra20_mipi_write(csi, TEGRA_CSI_MIPIBIAS_PAD_CONFIG,
> +			   CSI_PAD_DRIV_DN_REF(5) |
> +			   CSI_PAD_DRIV_UP_REF(7) |
> +			   CSI_PAD_TERM_REF(0));
> +
> +	/* CSI B */
> +	value =3D CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_B)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_B;
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG, value);
> +
> +	/* CSI A */
> +	value =3D CSI_CIL_MIPI_CAL_STARTCAL |
> +		CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +		CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +		CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +		CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +		CSI_CIL_MIPI_CAL_TERMOS(4);
> +
> +	if (port =3D=3D PORT_A)
> +		value |=3D CSI_CIL_MIPI_CAL_SEL_A;
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG, value);
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +
> +	return 0;
> +}
> +
> +static int tegra20_finish_pad_calibration(struct tegra_mipi_device *mipi=
)
> +{
> +	struct tegra_csi *csi =3D platform_get_drvdata(mipi->pdev);
> +	void __iomem *cil_status_reg =3D csi->iomem + TEGRA_CSI_CSI_CIL_STATUS;
> +	unsigned int port =3D mipi->pads;
> +	u32 value, pp =3D 0, cil =3D 0;
> +	int ret;
> +
> +	/* This part is only for CSI */
> +	if (port > PORT_B) {
> +		pm_runtime_put(csi->dev);
> +
> +		return 0;
> +	}
> +
> +	guard(mutex)(&csi->mipi_lock);
> +
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 value & CSI_MIPI_AUTO_CAL_DONE, 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration timeout!\n");
> +		goto exit;
> +	}
> +
> +	/* clear status */
> +	tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, value);
> +	ret =3D readl_relaxed_poll_timeout(cil_status_reg, value,
> +					 !(value & CSI_MIPI_AUTO_CAL_DONE), 50, 250000);
> +	if (ret < 0) {
> +		dev_warn(csi->dev, "MIPI calibration status timeout!\n");
> +		goto exit;
> +	}
> +
> +	pp =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS);
> +	cil =3D tegra20_mipi_read(csi, TEGRA_CSI_CSI_CIL_STATUS);
> +	if (pp | cil) {
> +		dev_warn(csi->dev, "Calibration status not been cleared!\n");
> +		ret =3D -EINVAL;
> +		goto exit;
> +	}
> +
> +exit:
> +	tegra20_mipi_write(csi, TEGRA_CSI_CSI_CIL_STATUS, pp);
> +
> +	/* un-select to avoid interference with DSI */
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILB_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	tegra20_mipi_write(csi, TEGRA_CSI_CILA_MIPI_CAL_CONFIG,
> +			   CSI_CIL_MIPI_CAL_NOISE_FLT(0xa) |
> +			   CSI_CIL_MIPI_CAL_PRESCALE(0x2) |
> +			   CSI_CIL_MIPI_CAL_HSPDOS(0) |
> +			   CSI_CIL_MIPI_CAL_HSPUOS(0) |
> +			   CSI_CIL_MIPI_CAL_TERMOS(4));
> +
> +	pm_runtime_put(csi->dev);
> +
> +	return ret;
> +}
> +
> +static const struct tegra_mipi_ops tegra20_mipi_ops =3D {
> +	.start_calibration =3D tegra20_start_pad_calibration,
> +	.finish_calibration =3D tegra20_finish_pad_calibration,
> +};
> +
> +/* ---------------------------------------------------------------------=
-----
> + * CSI
> + */
> +static void tegra20_csi_capture_clean(struct tegra_csi_channel *csi_chan=
)
> +{
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_VI_INPUT_STREAM_CONTROL, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_HOST_INPUT_STREAM_CONTROL, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_INTERRUPT_MASK, =
0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_INTERRUPT_MASK, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_READONLY_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_COMMAND, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_ESCAPE_MODE_DATA, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_MIPI_CAL_STATUS, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CLKEN_OVERRIDE, 0);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_DEBUG_CONTROL,
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_0 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_1 |
> +			  CSI_DEBUG_CONTROL_CLR_DBG_CNT_2);
> +}
> +
> +static int tegra20_csi_port_start_streaming(struct tegra_csi_channel *cs=
i_chan,
> +					    u8 portno)
> +{
> +	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&csi_chan=
->subdev);
> +	int width  =3D vi_chan->format.width;
> +	int height =3D vi_chan->format.height;
> +	u32 data_type =3D vi_chan->fmtinfo->img_dt;
> +	u32 word_count =3D (width * vi_chan->fmtinfo->bit_width) / 8;
> +	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> +
> +	unsigned int main_output_format, yuv_output_format;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> +
> +	switch (data_type) {
> +	case TEGRA_IMAGE_DT_RAW8:
> +	case TEGRA_IMAGE_DT_RAW10:
> +		output_channel =3D TEGRA_VI_OUT_2;
> +		if (port =3D=3D PORT_A)
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPA_BAYER;
> +		else
> +			main_output_format =3D VI_OUTPUT_OUTPUT_FORMAT_CSI_PPB_BAYER;
> +		break;
> +	}
> +
> +	tegra20_csi_capture_clean(csi_chan);
> +
> +	/* CSI port cleanup */
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port), 0)=
;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
, 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG0(port), 0);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CIL_PAD_CONFIG1(port), 0);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, BIT(25 + port)); /*=
 CSI_PP_YUV422 */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_H_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +	tegra20_vi_write(vi_chan, TEGRA_VI_V_DOWNSCALE_CONTROL, BIT(2 + port));=
 /* CSI_PP */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_H_ACTIVE(port), width << 16);
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CSI_PP_V_ACTIVE(port), height << 16)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL1(port), 0x1)=
;
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_WORD_COUNT(port), wo=
rd_count);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_GAP(port),
> +			  CSI_PP_FRAME_MIN_GAP(0x14)); /* 14 vi clks between frames */
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_EXPECTED_FRAME(port)=
,
> +			  CSI_PP_EXP_FRAME_HEIGHT(height) |
> +			  CSI_PP_MAX_CLOCKS(0x300) | /* wait 0x300 vi clks for timeout */
> +			  CSI_PP_LINE_TIMEOUT_ENABLE);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_CONTROL0(port),
> +			  CSI_PP_OUTPUT_FORMAT_PIXEL |
> +			  CSI_PP_DATA_TYPE(data_type) |
> +			  CSI_PP_CRC_CHECK_ENABLE |
> +			  CSI_PP_WORD_COUNT_HEADER |
> +			  CSI_PP_DATA_IDENTIFIER_ENABLE |
> +			  CSI_PP_PACKET_HEADER_SENT |
> +			  port);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_INPUT_STREAM_CONTROL(port),
> +			  CSI_SKIP_PACKET_THRESHOLD(0x3f) |
> +			  (csi_chan->numlanes - 1));
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_CONTROL0(port),
> +			  CSI_CONTINUOUS_CLOCK_MODE_ENABLE |
> +			  0x5); /* Clock settle time */
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_CSI_PP_FRAME_START(port)=
,
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->frame_start_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
> +			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
> +
> +	value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_ENABLE | CSI_B_PHY_CIL_D=
ISABLE :
> +		CSI_B_PHY_CIL_ENABLE | CSI_A_PHY_CIL_DISABLE;
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			 yuv_output_format | main_output_format);
> +
> +	return 0;
> +};
> +
> +static void tegra20_csi_port_stop_streaming(struct tegra_csi_channel *cs=
i_chan, u8 portno)
> +{
> +	struct tegra_csi *csi =3D csi_chan->csi;
> +	unsigned int port =3D portno & 1;
> +	u32 value;
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS)=
;
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_PIXEL_PARSER_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_PIXEL_PARSER_STATUS, value);
> +
> +	value =3D tegra20_csi_read(csi_chan, TEGRA_CSI_CSI_CIL_STATUS);
> +	dev_dbg(csi->dev, "TEGRA_CSI_CSI_CIL_STATUS 0x%08x\n", value);
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_CSI_CIL_STATUS, value);
> +
> +	tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
> +			  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
> +			  CSI_PP_DISABLE);
> +
> +	if (csi_chan->numlanes =3D=3D 4) {
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND,
> +				  CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL_DISABLE);
> +	} else {
> +		value =3D (port =3D=3D PORT_A) ? CSI_A_PHY_CIL_DISABLE | CSI_B_PHY_CIL=
_NOP :
> +			CSI_B_PHY_CIL_DISABLE | CSI_A_PHY_CIL_NOP;
> +		tegra20_csi_write(csi_chan, TEGRA_CSI_PHY_CIL_COMMAND, value);
> +	}
> +}
> +
> +static int tegra20_csi_start_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int ret, i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++) {
> +		ret =3D tegra20_csi_port_start_streaming(csi_chan, portnos[i]);
> +		if (ret)
> +			goto stream_start_fail;
> +	}
> +
> +	return 0;
> +
> +stream_start_fail:
> +	for (i =3D i - 1; i >=3D 0; i--)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +
> +	return ret;
> +}
> +
> +static void tegra20_csi_stop_streaming(struct tegra_csi_channel *csi_cha=
n)
> +{
> +	u8 *portnos =3D csi_chan->csi_port_nums;
> +	int i;
> +
> +	for (i =3D 0; i < csi_chan->numgangports; i++)
> +		tegra20_csi_port_stop_streaming(csi_chan, portnos[i]);
> +}
> +
> +static const struct tegra_csi_ops tegra20_csi_ops =3D {
> +	.csi_start_streaming =3D tegra20_csi_start_streaming,
> +	.csi_stop_streaming =3D tegra20_csi_stop_streaming,
> +};
> +
> +static const char * const tegra20_csi_clks[] =3D {
> +	NULL,
> +};
> +
> +const struct tegra_csi_soc tegra20_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra20_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra20_csi_clks),
> +};
> +
> +static const char * const tegra30_csi_clks[] =3D {
> +	"csi",
> +	"csia-pad",
> +	"csib-pad",
> +};
> +
> +const struct tegra_csi_soc tegra30_csi_soc =3D {
> +	.ops =3D &tegra20_csi_ops,
> +	.mipi_ops =3D &tegra20_mipi_ops,
> +	.csi_max_channels =3D 2, /* CSI-A and CSI-B */
> +	.clk_names =3D tegra30_csi_clks,
> +	.num_clks =3D ARRAY_SIZE(tegra30_csi_clks),
> +};
> +
>  /* ---------------------------------------------------------------------=
-----
>   * VIP
>   */
> @@ -687,10 +1211,11 @@ static int tegra20_vip_start_streaming(struct tegr=
a_vip_channel *vip_chan)
>  	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
>  					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
>  					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
> -	unsigned int main_input_format;
> -	unsigned int yuv_input_format;
> +	unsigned int main_input_format, yuv_input_format;
> +	unsigned int main_output_format, yuv_output_format;
> =20
>  	tegra20_vi_get_input_formats(vi_chan, &main_input_format, &yuv_input_fo=
rmat);
> +	tegra20_vi_get_output_formats(vi_chan, &main_output_format, &yuv_output=
_format);
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_VI_CORE_CONTROL, 0);
> =20
> @@ -723,6 +1248,11 @@ static int tegra20_vip_start_streaming(struct tegra=
_vip_channel *vip_chan)
> =20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL, VI_CAMERA_CONTROL_ST=
OP_CAPTURE);
> =20
> +	tegra20_vi_write(vi_chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
> +			 (vi_chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
> +			 (vi_chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
> +			  yuv_output_format | main_output_format);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index bfadde8858d4..46328e488aa3 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -125,7 +125,6 @@ struct tegra_vi {
>   *		frame through host1x syncpoint counters (On Tegra20 used for the
>   *              OUT_1 syncpt)
>   * @sp_incr_lock: protects cpu syncpoint increment.
> - * @next_out_sp_idx: next expected value for mw_ack_sp[0], i.e. OUT_1 (T=
egra20)
>   *
>   * @kthread_start_capture: kthread to start capture of single frame when
>   *		vb buffer is available. This thread programs VI CSI hardware
> @@ -188,7 +187,6 @@ struct tegra_vi_channel {
>  	struct host1x_syncpt *mw_ack_sp[GANG_PORTS_MAX];
>  	/* protects the cpu syncpoint increment */
>  	spinlock_t sp_incr_lock[GANG_PORTS_MAX];
> -	u32 next_out_sp_idx;
> =20
>  	struct task_struct *kthread_start_capture;
>  	wait_queue_head_t start_wait;
> diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/=
media/tegra-video/video.c
> index 6fe8d5301b9c..9f2bddc460bf 100644
> --- a/drivers/staging/media/tegra-video/video.c
> +++ b/drivers/staging/media/tegra-video/video.c
> @@ -127,6 +127,12 @@ static const struct of_device_id host1x_video_subdev=
s[] =3D {
>  	{ .compatible =3D "nvidia,tegra20-vip", },
>  	{ .compatible =3D "nvidia,tegra20-vi", },
>  #endif
> +#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
> +	{ .compatible =3D "nvidia,tegra20-csi", },
> +#endif
> +#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
> +	{ .compatible =3D "nvidia,tegra30-csi", },
> +#endif
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", },
>  	{ .compatible =3D "nvidia,tegra210-vi", },
>=20




