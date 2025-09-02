Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BACB3F1BA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 03:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCE810E556;
	Tue,  2 Sep 2025 01:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Un2JQ6ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F399D10E556
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 01:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOavim9bGLiJdILTJbsyozgt3uuNO4wS7CE3LMw1z4BSZNGYU7Xa3dDqZpYN3mRFLFbE30uTl8cJrhD3birsNEMcpf7dl+6ueuNiMmOrbRtvcI9fC4Uy0R5qQQnGPArSBZWEwJCdxgTiL/1XE9/bY61HTiQKJ1ILYGCFyN6HgQifXaWF0N0+ysx8QxjE3EMa6oZspSkBMVKYuXke3HuQvujzTWONeM9wusIdnOiDRglHGLHyF3ySyaHnPhZ/wRuu14ZUtknbRwrsMHnrrZmpYPOtqIEDs6wWXE9AgeYBwJA2JMmE7Vzr+s0uVBP8tPQcy71iw4fmZcIEIQo/ACNG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vKtlltfqquotOQJ6ZRs4vzPKq4T18P6X3nyE5k2ZDmA=;
 b=ZztxvPI/vSGCqwVl4zPWcRf+hLgJztBiVN3leVCmc2oPKxkTUO0hqC5A9pxTnV+FsL/zyCLwoMXjwr+Emx2MACpdXE+3yE9kzvtQ3W5BoCQ/uYS0KUo8VVLiJ6+gPa8pWIy+wr8wttT7YHZgX0HGatHA8+1Hz19sOyRyLMyBEgXrWFlZJ3Dc6tvwRQHxeZkIjCDaXvWdsW4isO9r5n2WcFFJ/lF8ABM0hmDxxmLLMd49zRwdkcz0sdXlWY6yHMYZ8DBzbWCSWdyiq+FBjG43N7lT95gINnvMzb/V4Pki3HCFNS+ImuuFzeG4AzVdzTj1N1vxzT2L7Cf8aTUHBVCcpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vKtlltfqquotOQJ6ZRs4vzPKq4T18P6X3nyE5k2ZDmA=;
 b=Un2JQ6ihxsjoTSZ25qXWlqJsUwCa4FbStfmVGF0C/tpTsNNtvdt45zw9dCc2OyNthakHY555ir+5LyuyNqz+XljdBruwxmloL6inwQBwBo4qCLiOi0Py/x2omNHv+ZgchjNmORWn2Xedl3yVxS/gTFoCHvXnyY9Dn0CQkffBRD9ozbjE+vIVTqrMRuo5Dlrx8TtSxGpeOkhRbV5e5wSuYAYyT3GFLkdYmHxZg1gfDFm2h3EgRxu5euUDzFP+y2BBpXMPB+RIdCUpYT86fjTy6hH2bzS5835X+GNvwAT1WMR/KQ564tfax/IwWU6jygsoEP5lMCtTZgg1O3kyVRCiVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 DS0PR12MB7900.namprd12.prod.outlook.com (2603:10b6:8:14e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.22; Tue, 2 Sep 2025 01:00:27 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 01:00:27 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
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
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 11/19] staging: media: tegra-video: tegra20: add
 support for second output of VI
Date: Tue, 02 Sep 2025 10:00:23 +0900
Message-ID: <2690954.tdWV9SEqCh@senjougahara>
In-Reply-To: <20250819121631.84280-12-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-12-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|DS0PR12MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: b7699ac5-d088-4588-7a0a-08dde9bc1aad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUZ3ZFJITUFUQUZsSUdoVGNQMDN6OGFFbHpCQjNPNmV4RmVIcGMyMmh4cVZm?=
 =?utf-8?B?UVpNZEVQcnVqV0s4Y3R2VGQ4dDZURSs2dDN4QkJXNEp3dkxkU3hIcEJyQ1Ax?=
 =?utf-8?B?b1JSdmhPTXpuM2Z2M1NBRWlxOGErQ2o1c2Nzb0pQTVhLQVlSbWxJcUhBSnRU?=
 =?utf-8?B?SmhWb0VnT2tVWENIcG9YdG5CQkZ4M3JyUWU0bGF6TzlkSEV0RlYzc054b0Iz?=
 =?utf-8?B?dGxaU3FNWVdEUWZGZkdQbjU5ZytBTUN3cDVrMzlxcFhzQkhhOGJpVXdieGlY?=
 =?utf-8?B?REpVWU45eUlweGdjdkpVcUExcXNPUzV0VHQyRDJCN1QxWkxxK0M1dnA0QkRy?=
 =?utf-8?B?c29lL1cvc3psT3VFeWxoUTVUci96blJMbHk3MXBaU0hocWlsQ1lyR1ZScDdy?=
 =?utf-8?B?K1BZeEI2ZFRwUXN3Y0dpT3YvTHp5b3VGVFNQMGZ4T1hsQnNaK00wZmpyZkhi?=
 =?utf-8?B?TUtuYTJTNE5HdkEybVVrUVQ1ZGV2MDJRNGVFbndZVzdRenJiblkvOWVibHc5?=
 =?utf-8?B?L0cvQkN1Z1BPQnVyeWQ5cnhLQVdZbTJDa1k1SjFhMWh0UUVaMDBhdXRJQ01D?=
 =?utf-8?B?anJtczJIOFBNdHhLcmMyUWdmWjBQTkEyb25XLy9YaERIbHBxVE1tWWZyQ3Ur?=
 =?utf-8?B?UFdBMm1Sc0pqbW1wTmdlcHE0djg3anZQWEppZ0I2NFJUVlhCQy9ncFEvTkVW?=
 =?utf-8?B?eFBiSHNWUFZPbGVibTJnYTRhV0wzWUZlU3NFTWZDUzFKL3FxeGI4a0xlaStK?=
 =?utf-8?B?ejhhcUc0SEFYS21TOGhLalJvWnJDVzVoQUFPbmE5d1hlR3BKbWp5M0U1bmRq?=
 =?utf-8?B?ZmJIb1BHay9yS0RXK1JrcmNqQ2VYQ05Nd0pFQVZIaUhSTG5XTGhjRXR0K1VS?=
 =?utf-8?B?QzNNTFVxL25vcVJadEdPMjdGcm4weGcyNnQxeDZiMjk3MWYxamR2NTVCeEg5?=
 =?utf-8?B?SEZmRzRWQUR0bUZRdWNzKytCV0pUeTN6ZHMzcmZOMzA1YVd1bUF5TCtISGFl?=
 =?utf-8?B?SG00MEFFUU5wcUNWY3pBam5uVytGZTVkRXZtc3dkS3N0Uk9QR1pxMUd4QlQz?=
 =?utf-8?B?K3Y5bTE3bUtIUlhmd2RyYldQZEZ1NXEyKzU0aEJUTDRPTUo2NDZLbmVlMUlJ?=
 =?utf-8?B?STZnb1MwZ2d4Wnh6Y29HN3B3VW83OTR4YjRWT1RIRDBnNE1ScEtnQUpMeC9r?=
 =?utf-8?B?V0lYNUpMajY2WWlUVWQvc29XUlJoTVhEQ1pnN2R2bWFKZmkzblYxVU1pN0dS?=
 =?utf-8?B?TXVxL09Ucll6QlNSdkw1SHR5K1dnSTJiOVB5NVllZkM1TlVPZ2F5RTVYTnpj?=
 =?utf-8?B?T1RmY3FVOG4xZ3d6UzNWQVNVUTYrUTVYREJaTlRreXM2cWVzZ2xvQkJMU3A2?=
 =?utf-8?B?V3Z0NG0wUUdzcVhDY2trOXF3bGI1Qm9ocDRBZ3ZVbmZ6YVhLQUlYSjJsVWxY?=
 =?utf-8?B?bWR0NUFvSzBFREpHYlV2cmw3b2FNbXl5Wld0M2tORUtZd0dEVzRNMFRtdi9F?=
 =?utf-8?B?bHZic2JQZHMrdjlERzZiL2V2QjRTcnNWVGxsVmJSR1hEQ3pDaFlWRzd3Uk04?=
 =?utf-8?B?OTZBWE9HUlBhZXpMQ1pBUFVsY1lnNEtBL1NMdytnTVk5ekNJT3RhbmNueW4r?=
 =?utf-8?B?Skt3THl4ellsTFlXQ3dNYXVnTEFoRlAybm9hMEdZekVsdW9pKzB5V1ZHVVpx?=
 =?utf-8?B?ckJBUmhjbk5CY0VWbVNZcGxJcE1FU1JlOHNTTTFaSW9UMWJFNURmSDRJZXlh?=
 =?utf-8?B?MjJBVnk3ZFIwQ2NCbjh1Qnh4Rmo4T1R2UDhxOEhBV3IrMDFyb0x6ODdFdjAr?=
 =?utf-8?B?KzVxUnpsSXZZc05VVXNMbWtZdXNRVWxPQi95VzJYNG9KVjhLcFFHYnJ6S0Qy?=
 =?utf-8?B?anhYWnlnNitOcndscEtjZGlCTVFJdWIwZ2EwTmg5YXIrVktzb29LSUdSeW9V?=
 =?utf-8?B?cFBIOGw2aEN3enBmcDdVYmdOTmZtSWxteWtIMHUrRGp6QkNoQkFtSThBYTNW?=
 =?utf-8?B?TWdRcXBmYk93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJ0aEd2U0dJRjl2RVl0aTUvaUJLNmloenZUWG9mQXZUaWZ3My9nN3JFU0g5?=
 =?utf-8?B?eThNSjNRQ2cwQ0Q4cVJlR0ZySllwcEhKU2tQQmdxZXZuWjRKTjFFZHhteXZa?=
 =?utf-8?B?cHdzSjBZME5MMXNpVE50MzIwYWxRWVVIcDJielA2V2dqL3c3V2kzb3RmcVRi?=
 =?utf-8?B?TVY3dkUreFVucVJTeXduODBReXM2RGVJODY5L0FUT1U1R3NORkJINmQrZkRF?=
 =?utf-8?B?bG5yQVlYa1UySzROWnhGTjFreEdhbkhQTlgzVDUzK0twNlVxZWM3U3l5QTdE?=
 =?utf-8?B?bWhhMWs2bEUxR01jN2lXamFoblBHOTg1RXRmYzRQanZPZnVVbk5ZZk81SzJx?=
 =?utf-8?B?dTNSU1VVakZaLzNNMDYyUFlpZHVzK2RhT2txYnlqMmFhTlJ5SHR4cDA2UEZ1?=
 =?utf-8?B?K2dEbHMvMTRTMGNqaTRCSDhjdEcyUDVnKy92a1NvZEZhSmVOUDZiL0VhRUtZ?=
 =?utf-8?B?Ykppdyt1bEVJM2RLUVRDNkk1T3pMMlQ1bFFvRXBJS1A4eCtJNnBaU3J0T2N4?=
 =?utf-8?B?R1MxSjJWNUJhNTczZTE2VlkyL1J5NEJveGZmNWJGQXQwdk5ZWnkzMjMrdnhj?=
 =?utf-8?B?MmtaTGNDTUR0U050bUVNVHpHVG44cTlmVTNLamJPU2U2Q0UrY0VEOWkwN2tP?=
 =?utf-8?B?TkhxN2dUTkFlZlloZTlZUko2YVlXNGlaaXo5NUU5UUQ4cnBMMUFTaVhWVktY?=
 =?utf-8?B?SklpcjV0cFZ2WXh5eGZ2UDdzaHdXTHNWTC9rcTNhTzFrYTQyY2dsVUdiUkZD?=
 =?utf-8?B?QWZiL2NFQXRsZ0NtOWZtOU1MZFl6aWNMZjZMMEdnUCsxWnVsbE1rTmN5Z01a?=
 =?utf-8?B?TVVtUmJJVzJxOE1WblU3ZVZsMTI5LzVnbXNxc1JEWEo1ZEgxaklwM3A5UE9t?=
 =?utf-8?B?WjNxZ29SdXM2SEgwcDBOYWMxaEhzRjhnbC92TW1KTVJkSStwVWRUN1dJMXpT?=
 =?utf-8?B?b3pNbkd5ZUpMQ3lpbzdDR0RTRWJzRjY5SWRIRGZhU1kxNDBFU3RoRjhRdDN3?=
 =?utf-8?B?TkUvVHN5T3htNmFJMXF0VVBFRnB5dS80WHlCTDdzZ3F3N0psSVNQTmFCQTE0?=
 =?utf-8?B?ZmdjTm83enJPQS91UUYxUi9teUVLcEFMaEJLY2NPL2RON2tjbWU5RW96TjZ3?=
 =?utf-8?B?a2xxbFVNd3JZOWQ4amViQTZyQjU4VEpnYVdFeUdCdHd5eFlMN2RTeFJzMW53?=
 =?utf-8?B?SWV5MXpaSlVFU0h1WGdMK1JGNHZ6ZWFFRTRsdUpXOTVxcW84L2s0aDkwSHdY?=
 =?utf-8?B?R1J2QXpOdGprOG42SisvUis2WFFBSklpVkx4NHM4SjFQY3FjSHJ3NlROanJr?=
 =?utf-8?B?ZE9UREJ1eS95cG1UaExPRVRJeVI1VzkyeVlTaUt2cmhZUXYyNDdNYXBFZ2R0?=
 =?utf-8?B?MnpUT3g4UUJuTnVOZHVZbEhRcnErYmdBRUJpTUtNOGhuL1Ntek9majduS2tC?=
 =?utf-8?B?eUxLWnZKS3llNVNianp4RVBnVEZDSDRtWGJLMGVHak1Dc1RGTlRXTUpSTWhq?=
 =?utf-8?B?VXNSaHNOR21rWHMrN1d4L2NweDFLZ0ZjNGoxV0tXdVpnN2o5VlhHZVBPVHVS?=
 =?utf-8?B?c2dpYzlnelN2Vmh4UHdOa2lNWGFNcTRZdC9GbmRUMFFtRlNxQUNYb1psVEt2?=
 =?utf-8?B?bnJOM0VPUnI2Q3IvUXF5cW0zQzQySmNQRWZBaC9FNzNVNDZZcXBmM0YwMTBX?=
 =?utf-8?B?WmdrZGtYNU0xak1paCtyaUpJL2xtZmgxTWtzVGhCKzYvN1l2UDBNK2c3a2xa?=
 =?utf-8?B?QStQTzJucUt2R1g3NXQvTjZOM3JMRkpmbldabFhNTi9FNlJLNllSQUpUOHBs?=
 =?utf-8?B?ejROc0NhdUZNdCtjM29maHByejNpSHl5OXJDZzV1cFdrNlcxcHFSeTJRZzdZ?=
 =?utf-8?B?WUNjOFYwdGp3ZHZWSUJqTUpNRm43L2JDSFFRRWN0ZHFPdXRnZnk0RzJrb0ZH?=
 =?utf-8?B?eGN2RW95K3BYb3hkaUdVUGVkTXlhN29JNWtUVkdCVGE5eEhBcWphdHJyK080?=
 =?utf-8?B?VWwxaHRJN2VZbmxZOThuT3VDTStWa0tibEhqcE1wc0I0NXFrV256RkxMUmVF?=
 =?utf-8?B?Q0pZR1RacnhOQ3RQbWREaE5yYmJOVWQxVnhQQmxaY1I0S0wwcWpieVBRMk44?=
 =?utf-8?B?aG01VnRsR1NER2gzamVab2Noc0tJQTBQWHB3aTM4U0ttc3htMGxDVHZRZ1k0?=
 =?utf-8?B?SGNaYmtZYkpBL1YyY2xJU2hKL3FPMEFoa2FheGg5Nmp0TXhqS0FkTEJJV00x?=
 =?utf-8?B?dHA2WnpDRWFyalh1ZWZCYVpWZjlRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7699ac5-d088-4588-7a0a-08dde9bc1aad
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 01:00:26.9452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sEpQDH7S2JFLPReZHNocwPHS1E7VfFrKtBGH1EaIOxhlZfYsZGaWEd3lhGDpijDfr7bwC44qtCMb9wMTuxlQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7900
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> VI in Tegra20/Tegra30 has 2 VI outputs with different set of supported
> formats. Convert output registers to macros for simpler work with both
> outputs since apart formats their layout matches.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 80 ++++++++++++---------
>  1 file changed, 45 insertions(+), 35 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c
> b/drivers/staging/media/tegra-video/tegra20.c index
> 3e2d746638b6..54512d1ecf83 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -28,13 +28,19 @@
>  #define TEGRA20_MIN_HEIGHT	32U
>  #define TEGRA20_MAX_HEIGHT	8190U
>=20
> +/* Tegra20/Tegra30 has 2 outputs in VI */
> +enum {
> +	OUT_1,
> +	OUT_2,
> +};
> +

I would prefer ..

enum tegra_vi_out {
	TEGRA_VI_OUT_1 =3D 0, // explicit since the values are important here
	TEGRA_VI_OUT_2 =3D 1,
};

and then using the type instead of int.

>  /*
> -------------------------------------------------------------------------=
-
> * Registers
>   */
>=20
> -#define TEGRA_VI_CONT_SYNCPT_OUT_1			0x0060
> -#define       VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT	BIT(8)
> -#define       VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT	0
> +#define TEGRA_VI_CONT_SYNCPT_OUT(n)			(0x0060 + (n) *=20
4)
> +#define       VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT	BIT(8)
> +#define       VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT		0
>=20
>  #define TEGRA_VI_VI_INPUT_CONTROL			0x0088
>  #define       VI_INPUT_FIELD_DETECT			BIT(27)
> @@ -46,6 +52,7 @@
>  #define       VI_INPUT_YUV_INPUT_FORMAT_YVYU		(3 <<
> VI_INPUT_YUV_INPUT_FORMAT_SFT) #define       VI_INPUT_INPUT_FORMAT_SFT	=09
	2=20
> /* bits [5:2] */
>  #define       VI_INPUT_INPUT_FORMAT_YUV422		(0 <<
> VI_INPUT_INPUT_FORMAT_SFT) +#define       VI_INPUT_INPUT_FORMAT_BAYER	=09
(2
> << VI_INPUT_INPUT_FORMAT_SFT) #define     =20
> VI_INPUT_VIP_INPUT_ENABLE			BIT(1)
>=20
>  #define TEGRA_VI_VI_CORE_CONTROL			0x008c
> @@ -66,7 +73,7 @@
>  #define       VI_VI_CORE_CONTROL_OUTPUT_TO_EPP_SFT	2
>  #define       VI_VI_CORE_CONTROL_OUTPUT_TO_ISP_SFT	0
>=20
> -#define TEGRA_VI_VI_FIRST_OUTPUT_CONTROL		0x0090
> +#define TEGRA_VI_VI_OUTPUT_CONTROL(n)			(0x0090 + (n) *=20
4)
>  #define       VI_OUTPUT_FORMAT_EXT			BIT(22)
>  #define       VI_OUTPUT_V_DIRECTION			BIT(20)
>  #define       VI_OUTPUT_H_DIRECTION			BIT(19)
> @@ -80,6 +87,7 @@
>  #define       VI_OUTPUT_OUTPUT_FORMAT_SFT		0
>  #define       VI_OUTPUT_OUTPUT_FORMAT_YUV422POST	(3 <<
> VI_OUTPUT_OUTPUT_FORMAT_SFT) #define     =20
> VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR	(6 <<=20
VI_OUTPUT_OUTPUT_FORMAT_SFT)
> +#define       VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT	(9 <<
> VI_OUTPUT_OUTPUT_FORMAT_SFT)
>=20
>  #define TEGRA_VI_VIP_H_ACTIVE				0x00a4
>  #define       VI_VIP_H_ACTIVE_PERIOD_SFT		16 /* active pixels/
line, must be
> even */ @@ -89,26 +97,26 @@
>  #define       VI_VIP_V_ACTIVE_PERIOD_SFT		16 /* active lines */
>  #define       VI_VIP_V_ACTIVE_START_SFT			0
>=20
> -#define TEGRA_VI_VB0_START_ADDRESS_FIRST		0x00c4
> -#define TEGRA_VI_VB0_BASE_ADDRESS_FIRST			0x00c8
> +#define TEGRA_VI_VB0_START_ADDRESS(n)			(0x00c4 + (n) *=20
44)
> +#define TEGRA_VI_VB0_BASE_ADDRESS(n)			(0x00c8 + (n) *=20
44)
>  #define TEGRA_VI_VB0_START_ADDRESS_U			0x00cc
>  #define TEGRA_VI_VB0_BASE_ADDRESS_U			0x00d0
>  #define TEGRA_VI_VB0_START_ADDRESS_V			0x00d4
>  #define TEGRA_VI_VB0_BASE_ADDRESS_V			0x00d8
>=20
> -#define TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE		0x00e0
> -#define       VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT		16
> -#define       VI_FIRST_OUTPUT_FRAME_WIDTH_SFT		0
> +#define TEGRA_VI_OUTPUT_FRAME_SIZE(n)			(0x00e0 + (n) *=20
24)
> +#define       VI_OUTPUT_FRAME_HEIGHT_SFT		16
> +#define       VI_OUTPUT_FRAME_WIDTH_SFT			0
>=20
> -#define TEGRA_VI_VB0_COUNT_FIRST			0x00e4
> +#define TEGRA_VI_VB0_COUNT(n)				(0x00e4 + (n) *=20
24)
>=20
> -#define TEGRA_VI_VB0_SIZE_FIRST				0x00e8
> -#define       VI_VB0_SIZE_FIRST_V_SFT			16
> -#define       VI_VB0_SIZE_FIRST_H_SFT			0
> +#define TEGRA_VI_VB0_SIZE(n)				(0x00e8 + (n) *=20
24)
> +#define       VI_VB0_SIZE_V_SFT				16
> +#define       VI_VB0_SIZE_H_SFT				0
>=20
> -#define TEGRA_VI_VB0_BUFFER_STRIDE_FIRST		0x00ec
> -#define       VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT	30
> -#define       VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT	0
> +#define TEGRA_VI_VB0_BUFFER_STRIDE(n)			(0x00ec + (n) *=20
24)
> +#define       VI_VB0_BUFFER_STRIDE_CHROMA_SFT		30
> +#define       VI_VB0_BUFFER_STRIDE_LUMA_SFT		0
>=20
>  #define TEGRA_VI_H_LPF_CONTROL				0x0108
>  #define       VI_H_LPF_CONTROL_CHROMA_SFT		16
> @@ -136,7 +144,7 @@
>  #define       VI_CAMERA_CONTROL_TEST_MODE		BIT(1)
>  #define       VI_CAMERA_CONTROL_VIP_ENABLE		BIT(0)
>=20
> -#define TEGRA_VI_VI_ENABLE				0x01a4
> +#define TEGRA_VI_VI_ENABLE(n)				(0x01a4 + (n) *=20
4)
>  #define       VI_VI_ENABLE_SW_FLOW_CONTROL_OUT1		BIT(1)
>  #define       VI_VI_ENABLE_FIRST_OUTPUT_TO_MEM_DISABLE	BIT(0)
>=20
> @@ -366,8 +374,8 @@ static void tegra20_channel_vi_buffer_setup(struct
> tegra_vi_channel *chan, case V4L2_PIX_FMT_VYUY:
>  	case V4L2_PIX_FMT_YUYV:
>  	case V4L2_PIX_FMT_YVYU:
> -		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS_FIRST, =20
base);
> -		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS_FIRST,=20
base +
> chan->start_offset); +		tegra20_vi_write(chan,
> TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base); +		tegra20_vi_write(chan,
> TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset); break;
>  	}
>  }
> @@ -455,6 +463,7 @@ static void tegra20_camera_capture_setup(struct
> tegra_vi_channel *chan) int stride_l =3D chan->format.bytesperline;
>  	int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
>  			output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0;
> +	int output_channel =3D OUT_1;
>  	int main_output_format;
>  	int yuv_output_format;
>=20
> @@ -472,33 +481,33 @@ static void tegra20_camera_capture_setup(struct
> tegra_vi_channel *chan) /* Set up raise-on-edge, so we get an interrupt o=
n
> end of frame. */ tegra20_vi_write(chan, TEGRA_VI_VI_RAISE,
> VI_VI_RAISE_ON_EDGE);
>=20
> -	tegra20_vi_write(chan, TEGRA_VI_VI_FIRST_OUTPUT_CONTROL,
> +	tegra20_vi_write(chan, TEGRA_VI_VI_OUTPUT_CONTROL(output_channel),
>  			 (chan->vflip ? VI_OUTPUT_V_DIRECTION : 0) |
>  			 (chan->hflip ? VI_OUTPUT_H_DIRECTION : 0) |
>  			 yuv_output_format <<=20
VI_OUTPUT_YUV_OUTPUT_FORMAT_SFT |
>  			 main_output_format <<=20
VI_OUTPUT_OUTPUT_FORMAT_SFT);
>=20
>  	/* Set up frame size */
> -	tegra20_vi_write(chan, TEGRA_VI_FIRST_OUTPUT_FRAME_SIZE,
> -			 height << VI_FIRST_OUTPUT_FRAME_HEIGHT_SFT |
> -			 width  << VI_FIRST_OUTPUT_FRAME_WIDTH_SFT);
> +	tegra20_vi_write(chan, TEGRA_VI_OUTPUT_FRAME_SIZE(output_channel),
> +			 height << VI_OUTPUT_FRAME_HEIGHT_SFT |
> +			 width  << VI_OUTPUT_FRAME_WIDTH_SFT);
>=20
>  	/* First output memory enabled */
> -	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
> +	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
>=20
>  	/* Set the number of frames in the buffer */
> -	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT_FIRST, 1);
> +	tegra20_vi_write(chan, TEGRA_VI_VB0_COUNT(output_channel), 1);
>=20
>  	/* Set up buffer frame size */
> -	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE_FIRST,
> -			 height << VI_VB0_SIZE_FIRST_V_SFT |
> -			 width  << VI_VB0_SIZE_FIRST_H_SFT);
> +	tegra20_vi_write(chan, TEGRA_VI_VB0_SIZE(output_channel),
> +			 height << VI_VB0_SIZE_V_SFT |
> +			 width  << VI_VB0_SIZE_H_SFT);
>=20
> -	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE_FIRST,
> -			 stride_l << VI_VB0_BUFFER_STRIDE_FIRST_LUMA_SFT |
> -			 stride_c <<=20
VI_VB0_BUFFER_STRIDE_FIRST_CHROMA_SFT);
> +	tegra20_vi_write(chan, TEGRA_VI_VB0_BUFFER_STRIDE(output_channel),
> +			 stride_l << VI_VB0_BUFFER_STRIDE_LUMA_SFT |
> +			 stride_c << VI_VB0_BUFFER_STRIDE_CHROMA_SFT);
>=20
> -	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE, 0);
> +	tegra20_vi_write(chan, TEGRA_VI_VI_ENABLE(output_channel), 0);
>  }
>=20
>  static int tegra20_vi_start_streaming(struct vb2_queue *vq, u32 count)
> @@ -607,6 +616,7 @@ static int tegra20_vip_start_streaming(struct
> tegra_vip_channel *vip_chan) struct tegra_vi_channel *vi_chan =3D
> v4l2_get_subdev_hostdata(&vip_chan->subdev); int width  =3D
> vi_chan->format.width;
>  	int height =3D vi_chan->format.height;
> +	int output_channel =3D OUT_1;
>=20
>  	unsigned int main_input_format;
>  	unsigned int yuv_input_format;
> @@ -637,10 +647,10 @@ static int tegra20_vip_start_streaming(struct
> tegra_vip_channel *vip_chan) GENMASK(9, 2) << VI_DATA_INPUT_SFT);
>  	tegra20_vi_write(vi_chan, TEGRA_VI_PIN_INVERSION, 0);
>=20
> -	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT_1,
> -			 VI_CONT_SYNCPT_OUT_1_CONTINUOUS_SYNCPT |
> +	tegra20_vi_write(vi_chan, TEGRA_VI_CONT_SYNCPT_OUT(output_channel),
> +			 VI_CONT_SYNCPT_OUT_CONTINUOUS_SYNCPT |
>  			 host1x_syncpt_id(vi_chan->mw_ack_sp[0])
> -			 << VI_CONT_SYNCPT_OUT_1_SYNCPT_IDX_SFT);
> +			 << VI_CONT_SYNCPT_OUT_SYNCPT_IDX_SFT);
>=20
>  	tegra20_vi_write(vi_chan, TEGRA_VI_CAMERA_CONTROL,
> VI_CAMERA_CONTROL_STOP_CAPTURE);




