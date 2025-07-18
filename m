Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5A1B09EDD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F16210E34C;
	Fri, 18 Jul 2025 09:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="miiMUrTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06E8C10E15F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:15:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTr++pmX57R80VDftgYSn+d7MBh87Rre+BEyBWI7yRlBKlUU3LExNJwGESN+8oKQhzVLo2SbAIjvep5X59FmWwhiRXZ6NC6c8THLTXq3NfkRVwAJjd+tTlOoEw+D4TdAHVAkaXlivDAFldtSG3pbV7FtSaUmwm4UY5at9XuGaZCHsjzEDx3WTmrIoBv8kqOGzDTJh6jdzZ2AagGmnPt6m5TUnhgpA+j19zTfz0vtyTM0KbDT82DF658GTFe9WMQrucGHGYLgq0BdLVe5bQweieCXBzqu+GccLj8PJDZIj6YoJ2mENtG6SVhxa5fxbC1TSkC6uWYemaWtyyHGju3p4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcJ5CDv6WCQ03CgUSqUz2dsz6tLJKiCqjhggMCPo21o=;
 b=DpiXZJu1eLWI6S8afLmVOk2XpNiUZMCLD3qCmEbGxDQ6Xir1L3DzR1+b6BprlLcJtU9DuiZTPdyoeetzavYL1zhAy1/hqyDhXNXWyj5GBmBgbfzrgP+pFD6b1xOqn7JAzckwa3UAb8hh8xLT1fxPs7XePhDRXiVnUlB4A3LgxX5qI37268QKorGawgpAJOjlQK4UpaWcVql70M1oNYh2FwXyxWORFbkN1Rg0/pi6lrrgZfcrre1jl+Qt12BiQsLZBzSR5QUKQrTflrgVBW2/a562uBfEndX3fPckq6SblBtVQoTyawINgjskPuKXV888IQ6qYLoVcqQLVm5nJA7Jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcJ5CDv6WCQ03CgUSqUz2dsz6tLJKiCqjhggMCPo21o=;
 b=miiMUrTSdGMZ9cNv8zwAW/RZVARLsjiE0t4f/hDapjsAV2uFest1r0Dt9WebScLevqWqLO3gbAkE7WiN6KfQqsDRcCL+8hyCsQHV3Q5JFDx8bjVHQ3NXQMQffT9QUf/mMTbr4ALfiGXIVC2QcvNEBh92/kt0P+8gYqF9MZKVBWDOctMDAZjqsvhw4mjAxoKhy+hLSZ4P3jzk+TAM2AxZfl3hhNHQsT4wMnFB5AehxunXeHe3A1urFzmAKpEkDYuTOEBrqWP4HwqMh0IfczsrM8EjHASEe1ZSHQCsFUpFWqNAy7tlmHoROEQbquuYP08+WiAouou0f8GBmTG6uxXAUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 09:15:13 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Fri, 18 Jul 2025
 09:15:13 +0000
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
Subject: Re: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
Date: Fri, 18 Jul 2025 18:15:08 +0900
Message-ID: <10778402.NyiUUSuA9g@senjougahara>
In-Reply-To: <20250717142139.57621-5-clamor95@gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <20250717142139.57621-5-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR01CA0131.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::35) To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 582cd878-c5ed-4981-dcb7-08ddc5db9a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTZFUWVsU0tzajVMR0dpT2hodVc0SFRNUnlQUTMzYUN4T3lxOGpETFI4ZFBV?=
 =?utf-8?B?RGp0UnJPWkpwMGNnRitCcmcrWFdHKy8xdXBPTGw4NzJSQUR6T1h3b1RYeEpN?=
 =?utf-8?B?ckFqM2hLcXVleTYwSTNRNlgrZHRSYkZqMjV0TlZKZzRQOFplRlZQSWZkSWZ6?=
 =?utf-8?B?ZGVsZFZkbDNZL21XRHVKelFYS3diZFkyVWZzOVNFS0RYUjVFdEl6TzVDOWh6?=
 =?utf-8?B?UFJFd0pyWjJqWVl1TFU0d0toVytqUGt2blZ5ZWFRUHIyaTRkdlZIR2dDRFdB?=
 =?utf-8?B?T3pDL1FYMEFkV3M4RjdnSGZuTjc4WW5SWjZ3M3JLazRrZEpOREtZOWNtd1pU?=
 =?utf-8?B?aUQ2STBtdGZ5dXh1SnZHSkRnS3QrRWFSWTQ5dkxZQXFnQS96TTBsTHVuMzBu?=
 =?utf-8?B?ZS9QNWx0cVY4bDhaZGNCdHRjY2RhaHNSaU5zSmFkaFNyUkE1UEZvejdCazJE?=
 =?utf-8?B?d0c5ZHYva2tjcDh4TTBaNmU4SHJVU0s3NytXMHdScHB3SDBsblV2K3c4Szgw?=
 =?utf-8?B?ZnFoR3NpeW1RMHFIL0kxUHZpWTkzYkhlNEFONVNtKzJ3Tm4rSzRIR3J6MDcw?=
 =?utf-8?B?OXE5ZTJTS2o0L081NktoaU1hNlNiLy9Yci9zTGlhOGM2SUgveXZ6cDIrcUJS?=
 =?utf-8?B?N1hJRGduNmVUbGRiT0RoZWIvOXZvR3lTUDI4dHY2a2cwR1QrN0I0TFlRNCtk?=
 =?utf-8?B?NkZSTUp3bzcrdTFicjBrZzV6RnFVNUgxaTNzZ1NCcFkxOUFWeERLcFhKbmdq?=
 =?utf-8?B?RjBnbDFrNHJPaGJkUnJ3cUxCTXVkbGlRSDkwWHBMcUdyNitlUENYMU84NlRX?=
 =?utf-8?B?UEFZN1V3dFk4OUp0UFBBWGt0QWRGaURMY1ZCQWxnSjNJQ01DZFhabGJGdnFW?=
 =?utf-8?B?SEh1Z0N1T1RqMzRQMlJQN2pxRit0bXNaTzZZWjFSSTdUOWNqcUtyUmR3aWJh?=
 =?utf-8?B?SG5Mbm1LdjFxYTJERmczVlZodHZUeHpjdWZ3Y1RVL0o5bi9pY0JjUk0reGJt?=
 =?utf-8?B?SFZGZUwxb0JJZUFIWXhqd3pRcUgwdWJBWTJNbkZlS2dtN2ZnU21ycFpySGRh?=
 =?utf-8?B?N3hJMzUyazFqV1RhZGMyditCV3FqbUJjWTZ4b3hmTmtUMFNSK0lIcFdGRHhD?=
 =?utf-8?B?TWU4S2NqV2tTZkFkRFdreDhvTXk2RUtiNk1Qc2pkUUlGYjJxb0tUQmFqWGpr?=
 =?utf-8?B?S2ZwMllhYjEwNEpzUVBoaG9LRTR6NTNudXRKa0FKTUhaZmVrS05vRjJPTGpI?=
 =?utf-8?B?MG5EU05KMG13TGRWUXlPbWd0eUUySStVZVM5bkpRZmhWOXB3akpaQzYvK0pw?=
 =?utf-8?B?OW5RSlh1WloyVysvRVpTOWlnZXBLcVowdXdIeWVvMndyMVNBVlJSc3JhNG9O?=
 =?utf-8?B?djlqRXFyczBkc1VHeFVyZVVubSt3RnhaR2dsVE9xZUNVMDNIK1MvQmEwbjVQ?=
 =?utf-8?B?MWFUNE9Pb0duTzZUSXFFbUIvSTdyWXRRZUwySGptNjBmckJ3cG1yVWpkOWRh?=
 =?utf-8?B?dkZ0SS81QXBEN1NvYXdPOWZra3E1SHBZS2dNNEY2Mlg3RU5nbGd4OHhTclZl?=
 =?utf-8?B?UHBONDlVOTMwcnpsWUNSeGdpamlWTjdIZlpUVjg2RUJCdyt2OS8reFlYMVNF?=
 =?utf-8?B?ZHUrcC93MnFycnV1b0NUVkIxUkM0QVFGS0RGZGUraHFaTTNvdjVLZjJPV1du?=
 =?utf-8?B?UVlCSDJrNXl3UTYxVGI0TmRYWTJDWTh4UUp6NWVxY1FpZFR4cjRscFNBLzVP?=
 =?utf-8?B?M2liTEJEZXB3UUtCY0dLY1g0eVV4UVNxMXF3Mlp2VkYxalVUUDNwUm93Zytk?=
 =?utf-8?B?Rm9yVWNHc3RnbXQ5eHVMTk5FRzZ6dk51SnBjV2dnNForOWJqbFkyUisyWUlu?=
 =?utf-8?B?S21ua08vdFMyejZ0Qmh0YVNlM0FGVVczN3ZRNTF1SGdoWXlWTFFhcVRnQlFZ?=
 =?utf-8?B?V3pCdzc1NUpSeVM3K2Vlb3lDK0xacy9Wc3lFckpzeHZXTXdRMDNtYmNUcGlh?=
 =?utf-8?B?RGViMzA1dXlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y085OGg0QUpFVGR2VExBOGJqb3M3WUFJSTd1RTZ4ZzAvcjNXT1REakpJbXln?=
 =?utf-8?B?QUFkc2ZGWHVxWU1mUWx2VkpzdnlGTVYvMFNsem5JY3J2ODJ0RC9YZk1yajFw?=
 =?utf-8?B?WFRqd01TSFI2bEpISG5KenEyUkM3S0gyYnBHYnRnaU44U1VDTEcxRW5LMmV5?=
 =?utf-8?B?Zk1Wbmk0dVEyYWwvcjU5NGxlWVYyUXJlUFVwOUZLNWxnaGtCTjZQN3owendk?=
 =?utf-8?B?eVZCQS9uREVXckl4L0xqODU1ZW56VThwbndETDZZMTJ5dlRySmdvT2Zja0Jy?=
 =?utf-8?B?UUhHSkpPYWxtVUZkZ2w4Q1FhS0dDQ2lVaHNzYlc4SkhnMEt5TkU4aXdpa1h5?=
 =?utf-8?B?M0VDODVEczM1OVFLTVk1MDE4OVhzUndjM1BDTm9sR09iTHlEaWlvM2FlMnVH?=
 =?utf-8?B?ek93NmZNWVpNSkFUTWpDYXZmQ2JuU25qUWYzV1grZndCMk43WUZVRndsK251?=
 =?utf-8?B?b3lheElvaG9NeHFpUlducWd5Wk5wTlc5d3hjUmJIakxLd005NndESlFDZzBT?=
 =?utf-8?B?enZqQ2dyNk8zblNwWW41RjBPV25lTTFlUEtSb3A1WFVzVUY3cS8ycUJzZnh4?=
 =?utf-8?B?a0o4OHl4OEpIUFFMMUNNYnI2VitMVkoxanJmUURiYllDTVBTM1FQYWUvMEVG?=
 =?utf-8?B?Rk9yQXhmUFE0S0x5Q1UzOGZGUDE0MnJUZFRkQ1ZNL2VONHFzM1BmY01nYStx?=
 =?utf-8?B?YzVQNjA4YnM4M1NCNFRIV01tRHB0QTlPUkdSbXVwZWRUMnRsaEx5NXAzYWtk?=
 =?utf-8?B?MDloRU9KNmU4TTVVc0daQ2I1NWxWRGJkR0hwUnVLMkVuZ2d4UnFFUTdIWUZP?=
 =?utf-8?B?RTArRU95aXRNYzUyUXNWMEdiRG9QM2wwODdWSit3TjlRcUkxcEhteGk4WDA2?=
 =?utf-8?B?QXRVd3RxOXZQVlROWkEwbng5YjRQVkU3QkZOYXlJNksyZ0MzZ1NYc2g4VzEr?=
 =?utf-8?B?S3hKTFk1SDNLZXNVVzNvYkJFendyclp5QVB1TjI1eWJiR1d3V1Z4RGVITVFK?=
 =?utf-8?B?SWlXM0plUDU1a1Zpd1RBNVVxYkdIZDhWeFhhakVXck5UMGxLOUlJWlk2aEpV?=
 =?utf-8?B?SnV5QTJvTEFRMEFIeG1Qbzc1Ymp4dHF3b1lNaTlQVjdSQ2Y5KzdJSmV1dmth?=
 =?utf-8?B?VHAza0UzM3kyWUtsZ1pUYzRwV2JNSzFYZGNqSGoweFl6cjlwQ3B2dmRQSkpX?=
 =?utf-8?B?dlRqWlYxVDlTRmZDaGhhSDBob1dmZkdZSGwyblo2anRwc0ppdndkVnBxdG9O?=
 =?utf-8?B?cTlsWkpOM2FMZzVWR1BwUGx2SG5NWHRIT2xrQTN5TzdheVU5bEJWNkZVNzRQ?=
 =?utf-8?B?aC85WE02U0VLVlFJTkNvNWJMSW5jbkY5c0hZWDB5VDdqNGZjS3JpeUZmMXNH?=
 =?utf-8?B?cC81Ukk2QWNuNUpBenZUWEFiTGNucFJUby9CckJueUh5NDQxZlpYNTVJeC8v?=
 =?utf-8?B?RCtXSnJIRmtuYjk1R0Z6OHRsMnNVQmE4blNpRjcvQjREUFhqdzZEMG9veGlU?=
 =?utf-8?B?TitYT0pDTzBieXIvT0VSbVJyNmM5M0Y0N0k2QWhWMGlmTHJZR0t3RUlmM3NH?=
 =?utf-8?B?ZXptWHJiN0ZuZGtxRlVrdUFFTWR3YkZCb1FKaUM0K2h4NlR2WjlvVFFuUkVs?=
 =?utf-8?B?UktRM0NvYjlNU3NyNHp3SWkyTmRWdGpsUjZzTWNBcEExV0lydzFtc1NTQjYy?=
 =?utf-8?B?UTlWOFZEUTJCeW1lZmFQNzF4L1JYdTNHUlBodUZ0blFVbGNGcUU4UDZpR3lL?=
 =?utf-8?B?UFlBQXZTTE1oSENsYXZXb0J1akNUSllBcDdoenY3KytrdDZSbzJ0VjVSSm1p?=
 =?utf-8?B?VDlnWEpuMFo2TnhMZU9kSEpveG9DMVZSOWxVSGJ4U1ZmeU5Md3hpeHFKbUUy?=
 =?utf-8?B?NWZFbHp1THhWamtsa3Rsc3ljRGNnS05tYTkzSGg2WXczdlpFQzVDWWdsa2xW?=
 =?utf-8?B?azUxdExPUDNzeEtQMElMSDI4Y3EvNWh0aHBMUkd1bGprb1NxZ1krYVpvV282?=
 =?utf-8?B?WUp4blgwWkFPUGdNOHRIS2FaZFlOZVE1NWZ1K3NxanVTOEttMUZOVStkalp4?=
 =?utf-8?B?elBXeUtqK3N3QVdzcDBZeEJnbUhNdjBpTHd5c3JoSkUybFJRcmhISjJqZ2xG?=
 =?utf-8?B?V2hINlUzQWQ3ZHE2THVTVmFvanZLbU9kVHFsZGd1dHhFdklaNnNsK2VUb0RP?=
 =?utf-8?B?N2tkM0cwOVZhNUlYeTIrcFptQTNxRDVmOFhUK21iTStSbFpWdW5tUkRwcG5Y?=
 =?utf-8?B?MkQyNkV4dGFYTGtQNXBIbTFaeVVBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582cd878-c5ed-4981-dcb7-08ddc5db9a2c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:15:13.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pl5qrxv2LHiEOSLdp8+pahLGPyc8Oljg6Pju5/N70MLPLVoBYPkqxLeGdsmjpTC+6/HaHI9TCem8pHooe6bTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
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
> Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apart

'apart from'

> clock configuration and MIPI calibration which are addressed by this patc=
h.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |  2 ++
>  drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/tegra/dsi.h | 10 ++++++
>  3 files changed, 54 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index 4596073fe28f..5d64cd57e764 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> host1x_drm_suspend,
>=20
>  static const struct of_device_id host1x_drm_subdevs[] =3D {
>  	{ .compatible =3D "nvidia,tegra20-dc", },
> +	{ .compatible =3D "nvidia,tegra20-dsi", },
>  	{ .compatible =3D "nvidia,tegra20-hdmi", },
>  	{ .compatible =3D "nvidia,tegra20-gr2d", },
>  	{ .compatible =3D "nvidia,tegra20-gr3d", },
>  	{ .compatible =3D "nvidia,tegra30-dc", },
> +	{ .compatible =3D "nvidia,tegra30-dsi", },
>  	{ .compatible =3D "nvidia,tegra30-hdmi", },
>  	{ .compatible =3D "nvidia,tegra30-gr2d", },
>  	{ .compatible =3D "nvidia,tegra30-gr3d", },
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 3f91a24ebef2..85bcb8bee1ae 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -662,39 +662,48 @@ static int tegra_dsi_pad_enable(struct tegra_dsi *d=
si)
> {
>  	u32 value;
>=20
> -	value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) | DSI_PAD_CONTROL_VS1_PDIO(0);
> -	tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> +	/* Tegra20/30 uses DSIv0 while Tegra114+ uses DSIv1 */
> +	if (of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra20-dsi")=20
||
> +	    of_device_is_compatible(dsi->dev->of_node, "nvidia,tegra30-dsi"))

You need to add "soc data" structures to the of_match table instead of=20
checking for compatible string in the code itself.

Thanks,
Mikko




