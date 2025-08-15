Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517C0B27F7C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 13:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D5010E140;
	Fri, 15 Aug 2025 11:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="O7z/X96V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9570710E140
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 11:47:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bQfjLFR4lx9SCGOD2hbLD09wMezyxn4grGhLTO3bie53diZUArBpjI7gfQ2G8wrYjRYvY40KckBwg3n3InofQZvwOS8l3qiRT+Ytog/LfcNvsvEeT2MP3dxweyxb2j4A6vl2BGCao96CI1kVTJJuRYXiEc7r58uYQ6Y3PWM5JRH85OQVVe1rn6JZBLJfJobmTT9zDrqu++47Kzwt+jeenqbIgkCM86u4Ia8IdSzq9oMz4Fmct5J+Wh5vDwB5X8O7uioHcLbL1qca23f7ylVXEcCiHXsmtxCSVswBxsPiCvXdCdTvPG8Z/7MnLnsAmht6uOObb2B9QMS3mca/sna47w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hgQ/jQm5DUGeyAiHkH6qFWAuOIVbxj07Pp+6JlwnPo=;
 b=yANJj87laspim4PQYPbSIVJfcAIngzKAmqznETeIF5wwqp+OgNFWA8tNPIFIHylaNdzP7Irl9T3CwHPCtPBkk+VNX36bxVjjcKyOumctGfGGTWTwJDcFTyJOxn5PnN+FctcZVHyuTNBi5Pz0abRFAxK8La3qVzN4M68I+PROX8QBMtkpKlovU5E7fQXl5Oz9mMx6bZlDTdr3cUFKGhuzZp/XrAYTFC5zQdoaVJD2jxwD1oRKC9SJzWLUiVWENFFv8ptdutf+PaMQcgXzhIZdQ3vbAnpcYfh+FqZCWhbfp9sYwOVlzQH00g7uXfGtn8uaHypAo09Y58ucfkwyTAWKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hgQ/jQm5DUGeyAiHkH6qFWAuOIVbxj07Pp+6JlwnPo=;
 b=O7z/X96Vkg0QgfEQVmI/UYOU1pz82+mc89btcAqthI8EbBwf10A+HOeMvhbQ1oKLETJwbOnzfN0mpsg71ITgtrqx488c7c8jMbEbMi3dJOpxifTxpYqf27iMCHjqYZb+BvnHRcvwJwqCQZu+harPWIp41K1971619z7EA2B5mdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6257.namprd12.prod.outlook.com (2603:10b6:208:3e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 11:47:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 11:47:00 +0000
Message-ID: <b057fb0a-5fe0-4cee-bbba-c4c88521bb86@amd.com>
Date: Fri, 15 Aug 2025 13:46:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] accel: Add Arm Ethos-U NPU driver
To: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250811-ethos-v2-0-a219fc52a95b@kernel.org>
 <20250811-ethos-v2-2-a219fc52a95b@kernel.org>
 <CAPj87rNG8gT-Wk+rQnFMsbCBqX6pL=qZY--_5=Z4XchLNsM5Ng@mail.gmail.com>
 <CAPj87rNDPQqTqj1LAdFYmd4Y12UHXWi5+65i0RepkcOX3wvEyA@mail.gmail.com>
 <20250814161718.GA3117411-robh@kernel.org>
 <CAPj87rN=Hod6GyA72x07yTvxL5X2q4UyUmPg-hyjjFA5KJvYGQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPj87rN=Hod6GyA72x07yTvxL5X2q4UyUmPg-hyjjFA5KJvYGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: fab4282a-ea60-4618-9ca8-08dddbf17210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0ptRmZOSWtjU28rM2NReHZXcEhvQXl0cDgyUlNNMFBYK3R1WGp1ckVhVDMv?=
 =?utf-8?B?bUt6ZllyQ3I5OVRPbUNhc0xoNDFYSk1GbjhFMzRteEVIeDFSVzQxdk5pcENp?=
 =?utf-8?B?RjVjZWgrS284KzE0VkIwdGR3WXhhczV1cWNMTUZwVk9LRDd1VnJVVkkySTdk?=
 =?utf-8?B?di9uUVhZZERoa0tKMVo2dlIySzdaZVJhSW9oS0Q0WW1OTkdXcTZSdnBybEtk?=
 =?utf-8?B?dHFuOERFdndMSFB5VnIwU2g2OEQwS2N0VXY4WUEvci80V0JEOUxQK0t2bUpx?=
 =?utf-8?B?bFY4bXpYcC93Nm9CczFmYndHN3Zua1VOTnVIQ3h5SmdOT3NQbzJpaVg3K21B?=
 =?utf-8?B?SjBFYkNHN3VIS2h2WStsQnVWS3U4L1o4SnhzeC9UTEZCU3hOeDhWaTVtcVJp?=
 =?utf-8?B?OGcwSGRsOGZSUTJaTDBJbHhKdDVqZ2Z6SFl1VTc0eFNYVUZnK1BGaEMzMzJH?=
 =?utf-8?B?RjN1UG9GU01WTjUzaEJ5SW5DMGtTU3RqQSs3eU9GbncycmxpUWhwam5sTFJt?=
 =?utf-8?B?SDFvYzVQTCtXQy80dzIwZ20wdTJiVGtSQ2ZYN3kvTHU4LzhMMDU5MG5NcjJJ?=
 =?utf-8?B?dk5naUUrUEdVY0Y4ZDBHRHdGcFl6V0FzTDVna1F1WFYyYXZDUy9ZeGhla0pT?=
 =?utf-8?B?WWJtam14aFdKUCtBeHRsc1R2NTdRUkJodEcyK245TkdWWTdmTkVCcExyUGVU?=
 =?utf-8?B?b1lLZUZXMVE3SEFHTU5CcW4rT1Q4WXVSYUhUM1FFdHpsRzlMaEZFMngzVDZx?=
 =?utf-8?B?NFN4VWZIUnFLd1diR0E2bEdwbHlXc09iTGdxUkpvRmRtK0NoSGV3Y0R6ZkhB?=
 =?utf-8?B?WUY4SmRudVZlVjVOUEMvcDRaQWJBMmlqR2VrTG0yYU8zZkQ4VG94NUFTcW1i?=
 =?utf-8?B?SGpiV29IUTE1NGJpeXlXcStTRlZRREZrVnovOU1LYmZvSVlTaHBIQVp4eThM?=
 =?utf-8?B?Qkt4NG5EL0RQU0pXQjUxRlljaVlIZ014bC9GbDVSelgrTkpwQ1NTdy81bEN2?=
 =?utf-8?B?VnNLR0JMdHFSd3FCamd3WTcwMU10Y3lMYmRvTUFGUXdBc1NBd3grRHFLaGx0?=
 =?utf-8?B?cmxMa0pOZ1VJeXNuampQNC9ZQlpHTGpGQUNobHZQTU5odjRTTE83dXVJOWNX?=
 =?utf-8?B?VHVQWUVWNjZEV00yak42ejNvaFNlQ3NwcmJiazRaSlAxOGN1Sm0vQXpaVlJj?=
 =?utf-8?B?Y2NhU0MzNnRqeWVVbHU2dmIvRWJlOHJERUpyQ3BoejFsUEtmQkx3cms2ZXJr?=
 =?utf-8?B?NjNkZi9Hd09UWVN6MnVSTitEV1B4emlPVE9ydDc0ZitCM3F6Q3ZUTEgxdWNa?=
 =?utf-8?B?c2JmeGRrZi9Dd0ZJVkVNS3EwTm84M1V2UTlmNEtuVzBKVjlyWDdGZ29rVWx0?=
 =?utf-8?B?MndaUjk4QTBud3NNOW9DOE1zNkk1NW5leVR5Mml1bFplWVZKMkp0eVhQRzZ4?=
 =?utf-8?B?aWsyLzVSbFVOV241eWVIUlNsTVAvb0ZEVDhNditNQi9MYW1WcFlIWXg3WWJR?=
 =?utf-8?B?RDlLV3R6dVBiWkJjMm5ML05pU1VFbEJIUkUrc1QycFFiOWUwOUJwTWpna3cz?=
 =?utf-8?B?UHkxOE5EQjFzSm5DS1V3UnNldjNYZlRyV2JZTy9nUEF5Z2JUa0VOOWlFejIy?=
 =?utf-8?B?RlQyTlRtanRDRUZ5bFdEOWRGVVZPQTdRdmJHQ1huOVZlMTUzS0Jja3JsWjQv?=
 =?utf-8?B?Q1hVdEc1YWZHMjUycGVKakhlQ2hOeVR6RWx4S0lsM1BVRmhqVGU1dFBYc3RB?=
 =?utf-8?B?dWR0eHlZdzFXaHRNa3JkeHltck8rOUZ3TXhNQmRTSXJzL0YxZWZNZ0tDNGho?=
 =?utf-8?B?dEdkZjJvdldnSU1PNFE2cXBjVEt5ZlQyZUpiOEw5bXFPeVk3Q2RqQS9Lc24y?=
 =?utf-8?B?ZmhSZHQ5T1hWZTdlV3VFTUJvU3BwbUw3WTR2RStlUUZzbUxiWGZCSWVuOUpP?=
 =?utf-8?Q?3/swlejDKz8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0pMSTNkeDVuazM3aHc4Y1dRUU84ZjFvSDF5UU5Cc2lOckZoYTRhdTNETHU2?=
 =?utf-8?B?d095Mlc3ZEpoYlM2dERCRDN6TVdRc0sralNBZ1FBZ1NuRytudk82ZWVZalNl?=
 =?utf-8?B?REl3bGJMYVVRU3NXMnh3SXMvdkwrQ29WamZ1ZDd1WFdwam1VZ0pHK0c5Y01n?=
 =?utf-8?B?andpYklkOHdyV2hodVF3UHdlaWc3N0hzSjI4amZzV2xxUTdqaDBLdG91MTYw?=
 =?utf-8?B?b2NEUU1sRFM5N2tXaWg3NWROYW1kWHpzOWdBcHFPUTZFUmF2Q2NLcnFtSnFp?=
 =?utf-8?B?OUJCaUtRcmpyaE04Y2hqVjNrYURTRjk4R0RYYmU2QjlsTExPbG9FdzFuRzc0?=
 =?utf-8?B?N2wyZkdseWdHM0QreTdMOWc1NXJkYitjZHMvZXJ6cllNZzJ1Y2ova1FTUTd5?=
 =?utf-8?B?UnozTWswK0J5Y3NPUTRGU1dqUlFudExlUjNXUzUzaUM4L3ZILzVHc1ZaMXl1?=
 =?utf-8?B?OWtPcEJKK2tDRGNDUTFnVGdISUQ1TUxsS044cEhjdkh5cFF1SjN4ZmpQaWtv?=
 =?utf-8?B?c1V5aTN6Q3oxVUdLQWRPSGY2N0lCZkI2a1N0aHVhQlEwbm1RRWJ5R09xUDNk?=
 =?utf-8?B?R3JFa3czOXZrTkZPemswVnV4d0Z5SGVQQWhxVDFWMWRHSzMyU3NvenNFZGN0?=
 =?utf-8?B?TGJCMlhBdmZmTUJlcEl4cXlreUxrMUZZVEQvdmpEbUtkQ0hmZWFjeFNlUHVt?=
 =?utf-8?B?Mkl1dVdUY3ZZS1pQc3pvc3pFUkhPbGMwNkQxTXI0UWtvdDVSVmxNQy93MS9m?=
 =?utf-8?B?SnVzdy9XNWtRZFltVU5FakRMQm42dU82QjZkY3ppOHJTaWV3MjdraVhCYkRq?=
 =?utf-8?B?ZlZxUEdVbUFCL3ZXKzN5ZEwrTy9TN1lFRXQwOWhPd0ZVTlE4aFg0cWx4YXV0?=
 =?utf-8?B?TGNUd0p3dXNKNnZHOW5WcHBrWnFYVVVqcU84L2c4eXRKWHRrVDVEeDlFaFhx?=
 =?utf-8?B?ZGxyT1ZkRktqV0VZZ3Y0dzZlMmQ2dk1KT05Ma3ZjY0pESDBlYWNORUR1VjZj?=
 =?utf-8?B?RE5xc1Azam5sbDhSTXdRQ0lUM09aRzBKbzl3QUhubGptL0krZHFGbG1YYm52?=
 =?utf-8?B?aVlUWlZXdWIveC9hWmluanhheGFkZDliTzBsMjlxQlh2SlVKeDVBUG56QVhN?=
 =?utf-8?B?YzBtOGlwRXBjT25iVDB1dVd4WGQ3bDVMUDV4aDE2YW13RjJHTVFMMHZWYWdT?=
 =?utf-8?B?YmZYSFJjYks3UzlxYWgzRUg0UlEzVEtyOTVnQUNKUE9FWU1EbmlJemtNT3J0?=
 =?utf-8?B?UWtKN2UzbU5rQTJkdUZaNmRyVDJ5MnVLTVhsWHJFTVo5M0tLUnhHQ0dZZTAw?=
 =?utf-8?B?Ri8ycXVieUYvMVNGWDk4MXdoNlI4VlRvckExNlp2Y2hPbkFJR2JFTEVKWXg1?=
 =?utf-8?B?MXdsUWFSeHlSMVEyZ1dsZXZSVVVpS0RmdncwQ2ViS3VROXp1clF4elVHZ0Nu?=
 =?utf-8?B?b3RHRnpSakVzNDZqV00rWWNiQXprcEI0MW9jcU9ZNGdoOUczUHQ3dFJYbVlq?=
 =?utf-8?B?RmtYWlBkSzBQUGV4MGUyZTNNUjhpaDVUS2tmclFjQTQyeHoxbGNxTnNHUDRm?=
 =?utf-8?B?ck55Rm02bEx1RGpjd29sSDRGYjdJSEZ1NE93VW1KTitqNVBteWxESTFEbGpK?=
 =?utf-8?B?a2lURTN3YzhCeTZoaU9jMXhKVC9LeVlRZWl0NVF6NlMxcE5FcGw0ZThuME03?=
 =?utf-8?B?QnlhZVF5SUxyT1I0ZWZOS3BSS1dpQzFTN2M5bWcxZFZJSTBYRm5kOHhZako0?=
 =?utf-8?B?TDBta3lhRnNuTS81ZmJ1Um9aZ0JXU3AxdmZReWlFZFc5WmJXZ1VqQlA3L2xp?=
 =?utf-8?B?aGU2QTFEZHlIM3JaNjgyQmVzVEg4UEJpcWJaT3dNNXljQXQxMVA2OE5jRnRj?=
 =?utf-8?B?bTlBNnZGcFZhaWF3NWJmR3lldlZhQlFoVXRKWncweW9qWjhIZjU2a0xHd01p?=
 =?utf-8?B?T2pjL25aNExITDZCZ3B3aGNvT3kxajNQZG9VWngxZng3RE5vVElmUnBBUk8x?=
 =?utf-8?B?c3ZoUlNtMDlJdGpMc25wd0JqSFRoaDFYSTRhVzRsZ1JjcnQvWlVRdFlmTHFI?=
 =?utf-8?B?VVlIMU03NFRaZ2pCbUI5TnF6L0pwVE96N3JGdXVyNVdOMzlvWTVTUUsySnlC?=
 =?utf-8?Q?COiZIsDY8YcDOFJyA17mqqlJc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fab4282a-ea60-4618-9ca8-08dddbf17210
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 11:47:00.5995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDFRqyHyChY5vcJ+iJOU3V6It3pDHlrPcch/6NdgEXQVDHfhD2wJX4rjNHSECgc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6257
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

On 15.08.25 13:15, Daniel Stone wrote:
> Hi Rob,
> 
> On Thu, 14 Aug 2025 at 17:17, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Aug 14, 2025 at 11:51:44AM +0100, Daniel Stone wrote:
>>> This is the main security issue, since it would allow writes a
>>> cmdstream BO which has been created but is not _the_ cmdstream BO for
>>> this job. Fixing that is pretty straightforward, but given that
>>> someone will almost certainly try to add dmabuf support to this
>>> driver, it's also probably worth a comment in the driver flags telling
>>> anyone who tries to add DRIVER_PRIME that they need to disallow export
>>> of cmdbuf BOs.
>>
>> What would be the usecase for exporting BOs here?
>>
>> I suppose if one wants to feed in camera data and we need to do the
>> allocation in the ethos driver since it likely has more constraints
>> (i.e. must be contiguous). (Whatever happened on the universal allocator
>> or constraint solver? I haven't been paying attention for a while...)
> 
> Yeah, I guess it's just reasonably natural to allow export if you're
> allowing import as well.

I only partially agree, allowing export only makes sense if you have device memory which is not already covered by DMA-buf heaps.

So if you have special on chip memory which is accessible by for example a PCIe BAR then go ahead and provide an exporter for that.

But if your HW only needs CMA system memory then it is most likely better to use DMA-buf heaps instead and only provide an import functionality.

You can of course directly use the CMA code from your driver as well if you still want to support standard DRM, V4L or accel interfaces.

Regards,
Christian.

> 
>> Here's the reworked (but not yet tested) code which I think should solve
>> all of the above issues. There was also an issue with the cleanup path
>> that we wouldn't do a put on the last BO if there was a size error. We
>> just need to set ejob->region_bo[ejob->region_cnt] and increment
>> region_cnt before any checks.
> 
> Nice, thanks! That all looks good to me.
> 
> Using unchecked add/mul when calculating the sizes also made me raise
> an eyebrow - it might be provably safe but perhaps it's better to use
> all the helpers just to make sure undetected overflow can't occur.
> 
> Cheers,
> Daniel

