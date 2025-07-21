Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D3B0BFBA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 11:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749A910E4AC;
	Mon, 21 Jul 2025 09:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Kb4NAwzo";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Kb4NAwzo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012009.outbound.protection.outlook.com [52.101.71.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BFC10E265
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 09:11:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UDt5giv5fOSdllVeaUU0hh1GJaNJma7NGDOnHPNXxQTCxZNwPBC6ZhgxrWhcpvu62K2uID+xUpGjh/quQ6/n7XkWEnqwp5iZqjs4kaf9yX6MQ/J5347knp8aIg+YUIulIlmfKYsFs+H46K7K19qjKED3VPTGxzZB1UMWQkIL7fHIhwJjdYQLzp9YbfyX7uFv/kJ56YeCUeCIlR0NTTHLbpjAZI/5OLolAJAVXg0kGoGQ3motDqWShomyWGFGv++i+0XdMhfZaYSG8qNxBgUE/xx8tWIKsyFEMGA1kDbDfJpkw9HcRoOZgSef839BBalJdSJO3jIfUAAszuU65fnQiA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpaTGxFwDEmI31LxOtYb9zZNMfBOU+kPgZQzdgj09F0=;
 b=wIsk6qrOIia8kBVawOfiov+cGNNX0Um+9lUnNwJ9WzV7d1VhwtTY+2VwCyISrWfwphG3fjrMCqEOu1Ox5hEgnZg06mHkBLsYAVBiqbrdXovC9zBlS9Qj5l0UQmHfVdZlo/iYdtRy3i54xNQJJiRnQGEXS8KZI65H2ErO7pGMDhJjW3Mel+qWeD6i+DKcXnr8MxIZJUUXaEM7L4gBGFjv3qJqueIxAXgNTt1Um4uKA1CN2j3FKb8GcHaVpkqaEN3ZZ0scWpe3WYiBLV2aXSaZHDrxsmTmJXdUGdS3HhmtkJ3htgDBfPg3ICvv2q319v9DVPut/2FXdY6URYEu7PULYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpaTGxFwDEmI31LxOtYb9zZNMfBOU+kPgZQzdgj09F0=;
 b=Kb4NAwzoGwjwrbkCBo/HolNUlqEBnQsce/N04VMl7G+DFOOB9EdMFQrbKsbHtNDp3GZMcEqs8f0iCeuZE0lHbdxP8CJzsHNEXjmdSL5xL/p+3PLDVlidvOHqhwTwjp7pkjPHB9oha3n30GM7Juq8gVzMu9G80fu01MWg6f/11tA=
Received: from DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) by AS4PR08MB8144.eurprd08.prod.outlook.com
 (2603:10a6:20b:58f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 09:11:01 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::58) by DUZPR01CA0066.outlook.office365.com
 (2603:10a6:10:3c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 09:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 09:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rncNlvGWAoIEbWZE8AxH0VQ7YUPxL8CYuLTuIpTXR8gCz2TYQaLulpN3ta2QianCjZ1/QlCpA0aHAJyFUulRb4TRCsqs/rTcGYEkYMKlDErhjVI0QtANCI6ifOH4EAC/5B72NWlQUqMGZ3NPNZerb9DKO1muK0KAfI/6q/WkOOzXeMd1HAoQZB/4UAkRscsSe6/6FA/8zk2YM/LuYTJnyAKUAH5DYIscyz5UoqmsDCl7XXi64VkGLMq8vrG+j7sC7rEoAebmFvj/ihiyB5GMFYU53Nn/Db/XkcSgMPANwhNa/0Oj8Nd9HkCza0v7Cm1AY2HaumKqIdqbY3VWkga8tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpaTGxFwDEmI31LxOtYb9zZNMfBOU+kPgZQzdgj09F0=;
 b=ezcaP0y+1M6syNuRj4J2tkNmQ6vb+B9KlddMqHGiRnBAdfMK8Z/Oo3krWjjcU3XaX51SAX4x/ZfV4jgkqld/rSK/c1pJ7ig/MJIJlxG7p1tbR0GUD4aE1DUXKIqTpIfcIdRYpfYmo7i+VYej+Ow3aRK3yGlFqUUvz1IFe3X9/4V+BTsULIIlZPDru6jKCoGQmQ0Lx8IaT73De2Ya6dP8f6UIOtNmLvrK2xPPv09Lu+b99O2/Dbp8hJFoaFWy6R8H2XLPXY7BE7Po0DEpFax+MefJ2d3uHGUSt8qBPKpqgBupBO+8kCWTG8jjc2tV3h5EWVoHp/jz/P3qc8f2SE6+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpaTGxFwDEmI31LxOtYb9zZNMfBOU+kPgZQzdgj09F0=;
 b=Kb4NAwzoGwjwrbkCBo/HolNUlqEBnQsce/N04VMl7G+DFOOB9EdMFQrbKsbHtNDp3GZMcEqs8f0iCeuZE0lHbdxP8CJzsHNEXjmdSL5xL/p+3PLDVlidvOHqhwTwjp7pkjPHB9oha3n30GM7Juq8gVzMu9G80fu01MWg6f/11tA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by AS8PR08MB9646.eurprd08.prod.outlook.com (2603:10a6:20b:619::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Mon, 21 Jul
 2025 09:10:28 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Mon, 21 Jul 2025
 09:10:27 +0000
Message-ID: <569a368a-b8ae-4c30-a9b8-038b7b97e0e6@arm.com>
Date: Mon, 21 Jul 2025 10:10:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] drm/panthor: Add panthor perf initialization and
 termination
Content-Language: en-GB
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <c53f9e012e148329a437013a812fc688e797a26b.1747148172.git.lukas.zapolskas@arm.com>
 <i2hdrxnd4whzpfzjsmx4mmcvghqu5t6rzki2tnsrarxewnr76j@clmkf6zyiy4p>
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
In-Reply-To: <i2hdrxnd4whzpfzjsmx4mmcvghqu5t6rzki2tnsrarxewnr76j@clmkf6zyiy4p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0336.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::17) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|AS8PR08MB9646:EE_|DB5PEPF00014B93:EE_|AS4PR08MB8144:EE_
X-MS-Office365-Filtering-Correlation-Id: 30281c84-4061-4ac2-adf1-08ddc8368353
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MUIxNWYvZkM0L1RMdTBFaS9WSEt2L3VhUmorbEdZNUw4bUtSb3lZaEE5SHdF?=
 =?utf-8?B?QU54bmtKa1JHOHM1VXA5U0lENXFOcFYrVlBwU0hoamlGT3JqMFN1NW9ZRmxF?=
 =?utf-8?B?N0pESG11a0MrSERjTkE2Qmgzcm5ERWlaa2FzaElnRGdEcWR0YXRsTkV3Q1p3?=
 =?utf-8?B?anhGU3M2THRxNzhNQmxvTlFoQ0xINjNUYy9PdDhPdlExUXFhc1BCWEtldWgz?=
 =?utf-8?B?YUdjZm1UNjl6N0NXYjRRNk1wckl4ejlSWk9xOHEwY05VTHBzYnJWbE9obC8x?=
 =?utf-8?B?Rms2N3BYVVUwdEZMV01vTFBFT0pzdEdIckU4ekdPZTc5YjdRbDVPbUJ0RlhY?=
 =?utf-8?B?bUhIcG12Tk5sRzB0ZWJhZjA2Q1FPVXBHMTBZdmhEaGdBcGtsa1NqMUl3eEdZ?=
 =?utf-8?B?VytSVXhrR083RFo0dlVuK3FYL2hVUUc5K3UwamRPQnBwWEhJRWtpV3NCYTl5?=
 =?utf-8?B?dWVZR1gwY0hmZzBDUS8xekVKSUNzZW8yT2hwTkFKTjYrU3ExaGU1bGJHL1g3?=
 =?utf-8?B?ck40Z0p4dy9ueDhKeWxhdC9NOXhlSFZ2WUJJMG00Q0kzRHhwdkFQaFVRYTlw?=
 =?utf-8?B?dVhtMUh3RG9ERHlVSXIwTm16MEZ5STR1MUhRNzk1L3A2dHRGSDk4RGZFRjQ4?=
 =?utf-8?B?dG9OcGxNZTV3Q25EKzUvWm8xUkNEM2hlamVKVnhET1d6WkVIZklpYlEvMDJ1?=
 =?utf-8?B?UEdYSmJ1Q09ZMUxwc1d3aG14NjJ1Z0lNUDdJTk5tTFhBNkJJam0zSW85dGsw?=
 =?utf-8?B?QUdLdWs1MlZTbmtuY0V2eDVnb21RZ0lRMFRHdkY1UFIvRHA2cHNLbVRTWUhC?=
 =?utf-8?B?SnRMbWp2ZkhzMm5ZdzZHckhNNmhmUXh5cjA4UGVkV0xVRkV6WjBucDZXTG1P?=
 =?utf-8?B?OEtlMGd0b29PWWN2Uys1bnUwQUVwZWdOK01yNzRaQXdTaDJFcWp2WVducGt3?=
 =?utf-8?B?cmlQMkhjWjl5N1h0S0VZVTZFZTBtWVVhWTE2dDF3ejM0eDVoWE5pN3dlVVVL?=
 =?utf-8?B?ZnM4dDNjNFBXR3lyaGVaSncwOWY5T2pQR2NqOUNxUFRmMEtMVHFvV2VYV3F1?=
 =?utf-8?B?UlFQUnREVTgzMkFtQlovcW1zN2tLNldrSlBwNFZSV2plNEgzYllvNmFvQjFU?=
 =?utf-8?B?elloYS9hR21FWmxQdzNnMmV5K2s2bDJBQXlhbitId1NqNTFiVElXbmlYVmFk?=
 =?utf-8?B?RkJIMmhYbnNObXE3UkEzM3dFc0V3UzdyeXVDTkZJNDNxQUhYVGFFZUltak9u?=
 =?utf-8?B?VEtwM0lHaHhDckwwVlRrQkhqZnZ2NzlMVFpGL3VMWGg5Sjk0YXNoaVFOeHNj?=
 =?utf-8?B?TXdYbzFQM3BnbDd5YVBJWTZWQ29BMkZLcWdaMzg5VUdZTk9hV0o3RnN6dnFP?=
 =?utf-8?B?RjhISXhLZzNtSy9oazFUWkkxTXRPbCt3blYrZWs1VVl2RUxOTWpadVZUV3VZ?=
 =?utf-8?B?RFVXanVWQ21GRThwOU9PWjZsNExENFphTjB2akdva1l0N2wzZ25wekM4cTEv?=
 =?utf-8?B?TlJJVVhiTjR5WUIyaHJlTkpZQWk0YWUyN3crYVFpS0xnVys1R2FaNk1qUjlC?=
 =?utf-8?B?NVJkQmhCMytDOUtqdTFmQm82RG93VXU3d1daNGpkQitOaUJjMUZBMGdpVVk1?=
 =?utf-8?B?bVlZckwxWWE0azRWQlB0UHQ5cmc0dUV0UmVTWlB3NU92Y2w3VTdVOXVjanMr?=
 =?utf-8?B?eitXV3JackQwb3VndkVvM3A1UVdvS3hQNjRMNjBvUWluNEhiTWIrQ25DZTl4?=
 =?utf-8?B?N1RLaEJseHU5WldkcEt6SlIxZzlSb2hZZGduTXozbjhCR1VleTFjRDZiVVV3?=
 =?utf-8?B?aFNNZUh6eVdpellzNU9CUndmc3ZYZmhZNktybUVrTGVmbWZNL2ZvcXJOc3Qr?=
 =?utf-8?B?WEU2a2puRHlhd1NMMmhicEdlc2tiZTdPeDlWRDhxZElKaHFyblhHa1N1V2pi?=
 =?utf-8?Q?Q3spXH02PEk=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9646
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 691bf2bb-649f-47d6-6dbe-08ddc8366ec6
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|35042699022|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDRqalZTNzF3Ti9LeEpzZ3ZxZElWcUZCQzVlSnptQUtHdXdUNGkrbVAxOHZp?=
 =?utf-8?B?OFNyRENEQ1JzZUVTQW8rcEdVNm43Nm41MGV5cmx2ekNUYm1BQWQwMkNSUlpt?=
 =?utf-8?B?VlVIKzh0dWI1dzUybzh4K0lYbjFxZkVpMzAxVXIydXFtL3BLZXFocjBIcUYz?=
 =?utf-8?B?NFdiZ0VxcmFyUm5iL3ZLREptanhxY2RwYlBZOWRVeGYzN3lMN05BMGRIUFA4?=
 =?utf-8?B?eE9qUmlRZFZuRTA2ZHdzYm55bnc0R1NNVFB5dkswN0VwUGhyVUpRTUp1eEVN?=
 =?utf-8?B?cHJ5bXpYK0dBOUhDeUpUUmRQNHVtWFNoaXVBVHptK2J3YnZnM1NNZ0FMZG9R?=
 =?utf-8?B?QVE2SjdkQ3cwam10YS9HS0dOdTFQVEQ3WEtaeVdjZ1FtVXhFTnl5Vm9IVkhs?=
 =?utf-8?B?MHU3MmNYNE5mK0VNUFJvTU1PMEozTm1uWGpEcUJKSGRjNDQrZS9GMVJOQ21s?=
 =?utf-8?B?YitNa1FhMU1TYS9mQ2tmN3NlQ01GbnJIcms4bmk2SmlkVjQwdk9TaWRwR2Rn?=
 =?utf-8?B?YS9RTVNEVWZXRUg4aUFSc0p5V0puMkdqUUtraDRHREQ0MlVMOWdDWVBvblFI?=
 =?utf-8?B?NHd1WFBxSHNyT2tWQkRzZzhCWm5tY1F6RU9KUlc2cnNZK2xsSFE3eWw2dTZx?=
 =?utf-8?B?WkNKYzhHUDUrb1hKc2ljNkxyb2NMTlJOdTExbnBUdG1LSGR1a2U2M05Qalhu?=
 =?utf-8?B?cTB3cnJnY243SDQ3K3VMVWF3dEJNVDU0UmMrSHQzdzBiN0dzS3JrOFlrZzBT?=
 =?utf-8?B?WDNvYlpvd3VxWjk2UHg2Qzk3OVNnQ2hOdWVObjVmWFFFNWRLZnhpUFlnMHhJ?=
 =?utf-8?B?YkgyUE4vZXNhOVVIZXRHLzR5elBKSjR0amFVdjNVMXhBVlJaNjBEeFVCczcw?=
 =?utf-8?B?TjFHQlcxY3c3QWFiVjdRYXN4ZVNKeGxzTzgrS2F5b2hIRll1WHphNThjbmRs?=
 =?utf-8?B?TkEwVEZlREdMTS84MVp0cDlicHpuY0s4LzVScUM5SFhKZkJuckRtTzJ3TFhG?=
 =?utf-8?B?cnBKTEdTOUEveDFXNGZtaUlGR28vbmNFdGVuK1pRY2JOWkc4L3FjSklkM2to?=
 =?utf-8?B?Z0JJNUZNbzRqS1YrWEgra0pZbDJoTU4wdEQwU3BGY2hlNmNYL3RKTXlUa25E?=
 =?utf-8?B?UW9FaWFKM2daZWlNUC9IOE5uY0xzUFo2aElwd25LTnBycmJCUyt6YldjZEJk?=
 =?utf-8?B?ZGNQUDNZNmg4c1RsVkhpdFczZzNnbVZ0WklXUTZMYlpqT2NkdW4rVlBERWxp?=
 =?utf-8?B?cVZWWWpaVDdiYndSdXZ5d1NzY2lRSE1XcCtpYmNUWjY1VE9XWm5NVDFBWkpB?=
 =?utf-8?B?UFlWaTZCN0JDd0o2S1VNNzlrMUJ5anI3UkdHaG5vZ2YyLzF1NVFCSnNPVVY4?=
 =?utf-8?B?MVlBQUNCYm90RmoxM1VrNWFCK21uRjd2eStOZ2pkdjRyN1d2MTl4djR4dzF5?=
 =?utf-8?B?akdMbENFTG5nb3AwRExyT1RaYVZSa1pyUzZ0aGlNS3lZdVNHTUVxVnkwajBF?=
 =?utf-8?B?QktHYlR5VG5mU21UZFhab1FFeHY4em5PT3ZOeGw5ZTkwV056VmFnYVpnQjFk?=
 =?utf-8?B?dWZPZWEvdDIrYktWamQ3N3laUGtjNWwxOGtrK2JPc2xoaFByRk1qcjFiYmRk?=
 =?utf-8?B?bDF3eERwcTdpV0FqK3IxK2VmWEl5dmgvdzdVUUt4YlBzbTUrY2JWVDRtMTc4?=
 =?utf-8?B?ZGQyZXVGdjVVMVRDV1RleEY5SG51cTFsRU4vb1pmMDZQWHl2TlUweFBjeDNl?=
 =?utf-8?B?SktITGRqQnA4alBLNmt6WTJGQ3ZpMGtUNzZHT3AvczdYSUVhWEpBcVFGS2pV?=
 =?utf-8?B?ZE5vR2dyQVI4NnpjQ3dKcytSQzNxT204NnMrWGM4NzAyQTRSTGdBTlgrM0Zy?=
 =?utf-8?B?UWNCMk02SklybUhhVXB5c2JwS0xacHdvTVdROUN6bTFOeEhGbVh0ZUZCbDhw?=
 =?utf-8?B?QVBja0sxVHYzMzdYQVZQWnZRQnU1Z3JiVmpDeGJRWXVDUThHTmMzVjZBNWNP?=
 =?utf-8?B?cDZUVVhIdzR3V3diaXF5WDFMYXppcHFjYmQ1Yll5YmFwSzhWeTE4WkROM0VX?=
 =?utf-8?Q?qSjnx3?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 09:11:01.2426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30281c84-4061-4ac2-adf1-08ddc8368353
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8144
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



On 18/07/2025 04:10, Adrián Larumbe wrote:
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> Added the panthor_perf system initialization and unplug code to allow
>> for the handling of userspace sessions to be added in follow-up
>> patches.
>>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_device.c |  2 +
>>  drivers/gpu/drm/panthor/panthor_device.h |  5 +-
>>  drivers/gpu/drm/panthor/panthor_perf.c   | 62 +++++++++++++++++++++++-
>>  drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
>>  4 files changed, 68 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index 76b4cf3dc391..7ac985d44655 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -98,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>>  	/* Now, try to cleanly shutdown the GPU before the device resources
>>  	 * get reclaimed.
>>  	 */
>> +	panthor_perf_unplug(ptdev);
>>  	panthor_sched_unplug(ptdev);
>>  	panthor_fw_unplug(ptdev);
>>  	panthor_mmu_unplug(ptdev);
>> @@ -277,6 +278,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>>
>>  err_disable_autosuspend:
>>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
>> +	panthor_perf_unplug(ptdev);
>>  	panthor_sched_unplug(ptdev);
>>
>>  err_unplug_fw:
>> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
>> index 657ccc39568c..818c4d96d448 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.h
>> +++ b/drivers/gpu/drm/panthor/panthor_device.h
>> @@ -27,7 +27,7 @@ struct panthor_heap_pool;
>>  struct panthor_job;
>>  struct panthor_mmu;
>>  struct panthor_fw;
>> -struct panthor_perfcnt;
>> +struct panthor_perf;
>>  struct panthor_vm;
>>  struct panthor_vm_pool;
>>
>> @@ -138,6 +138,9 @@ struct panthor_device {
>>  	/** @devfreq: Device frequency scaling management data. */
>>  	struct panthor_devfreq *devfreq;
>>
>> +	/** @perf: Performance counter management data. */
>> +	struct panthor_perf *perf;
>> +
>>  	/** @unplug: Device unplug related fields. */
>>  	struct {
>>  		/** @lock: Lock used to serialize unplug operations. */
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 66e9a197ac1f..9365ce9fed04 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -9,6 +9,19 @@
>>  #include "panthor_fw.h"
>>  #include "panthor_perf.h"
> 
> You must include "panthor_regs.h" here or else GPU_MEM_FEATURES_L2_SLICES() won't be available.
> However, it seems this is something that should be done in the previous patch.
> 

Will add that to the perf_info patch.

>>
>> +struct panthor_perf {
>> +	/** @next_session: The ID of the next session. */
>> +	u32 next_session;
>> +
>> +	/** @session_range: The number of sessions supported at a time. */
>> +	struct xa_limit session_range;
>> +
>> +	/**
>> +	 * @sessions: Global map of sessions, accessed by their ID.
>> +	 */
>> +	struct xarray sessions;
>> +};
>> +
>>  struct panthor_perf_counter_block {
>>  	struct drm_panthor_perf_block_header header;
>>  	u64 counters[];
>> @@ -63,14 +76,61 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
>>   * panthor_perf_init - Initialize the performance counter subsystem.
>>   * @ptdev: Panthor device
>>   *
>> + * The performance counters require the FW interface to be available to setup the
>> + * sampling ringbuffers, so this must be called only after FW is initialized.
>> + *
>>   * Return: 0 on success, negative error code on failure.
>>   */
>>  int panthor_perf_init(struct panthor_device *ptdev)
>>  {
>> +	struct panthor_perf *perf __free(kfree) = NULL;
>> +	int ret = 0;
>> +
>>  	if (!ptdev)
>>  		return -EINVAL;
>>
>>  	panthor_perf_info_init(ptdev);
>>
>> -	return 0;
>> +	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(perf))
>> +		return -ENOMEM;
>> +
>> +	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
>> +
>> +	perf->session_range = (struct xa_limit) {
>> +		.min = 0,
>> +		.max = 1,
>> +	};
>> +
>> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
>> +
>> +	ptdev->perf = no_free_ptr(perf);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * panthor_perf_unplug - Terminate the performance counter subsystem.
>> + * @ptdev: Panthor device.
>> + *
>> + * This function will terminate the performance counter control structures and any remaining
>> + * sessions, after waiting for any pending interrupts.
>> + */
>> +void panthor_perf_unplug(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +
>> +	if (!perf)
>> +		return;
>> +
>> +	if (!xa_empty(&perf->sessions)) {
>> +		drm_err(&ptdev->base,
>> +			"Performance counter sessions active when unplugging the driver!");
>> +	}
> 
> I think this could only happen if someone forces module unload, even
> though there might still be processes which haven't yet closed the DRM
> file?
> 

That sounds about right. The only time I have seen that warning was in development when 
the session cleanup was not being done properly on process termination.

>> +
>> +	xa_destroy(&perf->sessions);
>> +
>> +	kfree(ptdev->perf);
>> +
>> +	ptdev->perf = NULL;
>>  }
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index 3c32c24c164c..e4805727b9e7 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -10,6 +10,7 @@
>>  struct panthor_device;
>>
>>  int panthor_perf_init(struct panthor_device *ptdev);
>> +void panthor_perf_unplug(struct panthor_device *ptdev);
>>
>>  #endif /* __PANTHOR_PERF_H__ */
>>
>> --
>> 2.33.0.dirty
> 
> Adrian Larumbe

