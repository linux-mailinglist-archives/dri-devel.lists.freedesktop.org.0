Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51079B11C55
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8B210E1A6;
	Fri, 25 Jul 2025 10:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VJ/rQAiY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VJ/rQAiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013030.outbound.protection.outlook.com
 [40.107.162.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA6410E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 10:30:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Dnva0xd4zz4Cxo0HnKqGp2KAvSCqYIndRZA2fAS7pi+8j+GO+8SrAd11OgZIkqDKQBqrIp1Ntw7EF0qC/FVN37ew5QK1WUeNzzm4gWLdPWCRtp8Gojg77wBLt3fsucyo8W/1eyZov3LQRHmrN+LKNnugDhSERZLOPFsNmhf+DdaynwxDrSlDub802PeebYd4OrYRS15eNNeEvE6LbMTrRiuFxlarwEZEud28D3PvB2b6Bxm9vi4eESFNEBJJfLqa/hgJqEmqDSOkyT6ZoQO6e4kZQVx1MSgoS8MqNm2A4Y+mMn6dhionSMcPlGfB/f9HzO6VjGleL/d8f7kA3AG1/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptcL9WFhUE5G3F2b3GRuRGLh5bp7wPuRVCCdrgfAO+g=;
 b=DYoee1K/SA4o2wEeDGcVGJZS3fxNkMkuo9nnupgLwxOgdQkCHTiNEIFZUcGvCPHpOZjGDttAE/DJJ7nqfskkGGaef6m2WWvJhcnpZUTVz2Qb7yzDwehTm3CUDZYDJJhvtxyCm8HgSKsH5JJQOZAa4cqx0B3X+5VQUMLfweOxeBUMhHwpvkGAeM+y9RLElpxh07xmcXfYBam0bbes8hWzHldkZkcbFJwy51ckrjonAYXyLPIXfFObyGH8h2+kHj78JvxlaBjacAdl0auTpOfORxN4RCJFHefZOcWm+Iw5gNtlzFF252mDYm2C6bKviz6bWfJjt6Cl/rrR229E/wY5dw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptcL9WFhUE5G3F2b3GRuRGLh5bp7wPuRVCCdrgfAO+g=;
 b=VJ/rQAiYSVjmpoAEb5EGzDm+r6kx0jYUm4YDDDO3QYGp8iWeBgWec0mWycIwiZw1U/rQSu2+NMhH5bVOD89HgQBWDMXt3va8cL01JL78kT7I+g0E+kei16spd33yc71S6VMPOIf0F9sxoUjjmj1/wQ6oyEgc9UiNssK6gsgK2B8=
Received: from AM0PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:208:1::17)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 10:30:22 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:208:1:cafe::6d) by AM0PR04CA0040.outlook.office365.com
 (2603:10a6:208:1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 10:30:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 10:30:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eis3zRdW6uUrtSvSkTTKx8shrknXOmb5oTSGZIBbG7aTYpbucRgWJEjHA3I/SWl+CZckT71IiloKtqjlmFye+SpLPCDT4YZ44DsqhhuXty8//5z/RWnnGypo5N92ebQbYbTsu9FSwvnJfEB9FnGyxQQY/T0FWWxhrRIB5NIacxoTp/tM6I8gBzbhD0ECd3gMOb5VcTgvRjMD98TAyVWeOIqTEUHAVfAcvXx7rfLAUu87ie00stSIl4NAG2prBnnkJt1mHqgmjvo5TnYsv7vOdacH4euOAjJkdwVXanFIFagreOVLQ/WHL4m1GzQNv4BbtCSaK3f06gp6TfVfNM0LjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptcL9WFhUE5G3F2b3GRuRGLh5bp7wPuRVCCdrgfAO+g=;
 b=OrOc+wpgCTZbCG/os14JGHxPuYs1sduYfg26v4g3gWXEnKfcadkfePgGlb5xeMUa7Mzpq6ADYRYLEFoWGmh1wPyQVl3wiIPjDuRyU0PlnPbwEDSuZcb/s9pfIOt5Go9JvsdgRzohlP90ujySUDFxwctGT+2OrGlO/PcDmLegvv2M3t/SfsafP3hZ96cBnyuVqT15u63TbP4uauZN265z8WAcfBnnHrPnps1dH4K4avJIyP4+U6EEiw/iFJlKi/CaltcOKmmc+1mxkZSHgU073pA1sx9AsahPktBzorJwm1J1HsjKr5lkt003S4DqaU5bQaXqdxQtkTt1e7aU8JYJug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptcL9WFhUE5G3F2b3GRuRGLh5bp7wPuRVCCdrgfAO+g=;
 b=VJ/rQAiYSVjmpoAEb5EGzDm+r6kx0jYUm4YDDDO3QYGp8iWeBgWec0mWycIwiZw1U/rQSu2+NMhH5bVOD89HgQBWDMXt3va8cL01JL78kT7I+g0E+kei16spd33yc71S6VMPOIf0F9sxoUjjmj1/wQ6oyEgc9UiNssK6gsgK2B8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by FRZPR08MB10904.eurprd08.prod.outlook.com (2603:10a6:d10:137::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 10:29:50 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 10:29:50 +0000
Message-ID: <126ff8a7-68fd-4f2b-b561-e011f3af5fb1@arm.com>
Date: Fri, 25 Jul 2025 11:29:49 +0100
User-Agent: Mozilla Thunderbird
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH v4 5/7] drm/panthor: Implement the counter sampler and
 sample handling
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <7005fb2eba3abbb2ee95282d117f70c8a7c8555f.1747148172.git.lukas.zapolskas@arm.com>
 <jd4wzkk7dfrjguzrl4q2scyi666xjywmmsthgw2a2t3b32hdpc@jgu4tzcfdawe>
Content-Language: en-GB
In-Reply-To: <jd4wzkk7dfrjguzrl4q2scyi666xjywmmsthgw2a2t3b32hdpc@jgu4tzcfdawe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0149.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::13) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|FRZPR08MB10904:EE_|AMS1EPF0000004B:EE_|AS8PR08MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 51eaa5bc-137b-407f-3cf5-08ddcb6642c0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Sm1yU2F3WVI4MmdSL0pPQkVCK2dla09ZbGU2cVlrWUFEV1IveW5pZUxuUWJI?=
 =?utf-8?B?SW9ObDRnNzhTT2JUMjBjYVlVU0c4L2dwcFZKYjk4T3JMUWw4QVZlYm0wTjFF?=
 =?utf-8?B?Vy9YOEkvU0d4VXQ0TmY4RlFaUWcrTGtUbVR4VGdHalkzNzVpaU5xN2JDcFN4?=
 =?utf-8?B?WGtiL1hMcWZWc2dPbGJOTCt1RmMyak1GbWdCU3VnSUtDSlE1aXl0Qlh4bG9m?=
 =?utf-8?B?enZ3SnRPTCtNbkMvcG9RWS8zNXR0UDhFODMwVjBXUkZjQVJxU2FST1orN0Vx?=
 =?utf-8?B?TTJZWXBSUlphT09kTTR3RDcwc09yMHdZb3Fud1RQWUdnQmVxdGNsSXFvWjZZ?=
 =?utf-8?B?em9FbzZZZWp4Vk9PaEVWaG5uYkgrSnM5MWwyWnRSYzNadjA4Ym9mR2I0RXQv?=
 =?utf-8?B?SGYyNmdjejl1bi8xQy83bnRSTVBIZXFJejBEa2ZlYWNvVXNSMWdQUzcxQVhu?=
 =?utf-8?B?dFc0V3lOSGFQRlVVUHY2SVl0M0hxNjhPVEhZaTZQWENkdVR4TTVrQlFWK3ht?=
 =?utf-8?B?RWoxdkgydWdzdGtVUVRDQXJ2eVRJOUNmMHNFWGNlR1BiSDJRQlBYRFN1VFds?=
 =?utf-8?B?S2hOMWFYYTNBTmp0M0YxeDJ2WkZuZW04ZUVlRmpmRzFzT3dwek1FamVmZjBH?=
 =?utf-8?B?WDY4T0F1aXRuSmJZNGNCcDhlQmJaRFJiczF3eWNpYmhlTmR0T3ZwaWFaejAw?=
 =?utf-8?B?WGsrbGtTNFBhMUFvc1R6MXZCTTh2eDZvQXZOSm9QL1dEcVpoaElRRXJSVTJr?=
 =?utf-8?B?bHF1aDIzRHUvVjVoelZHTHJuNUV4T3hGMnlhRTM5c29uT1lxTURQbDREWTlT?=
 =?utf-8?B?REVKeDRySmZ6QjAwNXQ0Y1R0a3hQV3BrQlpXL3ltZlBtYk80Y24wa0xzV2tz?=
 =?utf-8?B?M2RvMHJ4UUZDaWpBQTM1RFNuTlN1Ly9DZ2lJcFhsMU5UeEJjSVVXZXkvU05a?=
 =?utf-8?B?SEszdlZSOUZ4aG9Fc2hFL2ovcHlqN0NrRkNnZkxmUVdrWkFHWlZSMnJXbitw?=
 =?utf-8?B?K3dsYnZ4VFZVcGFCOU1EYmRxaWpjL1dnQTNDNTVTdGVpbXo1Wmd5NFRjNmxQ?=
 =?utf-8?B?Slg5a21PUlhyalBRNEQ0bE5VVjVIT2ZmN2RQTzVsOWE4eVJhOHVyUmhXNW9y?=
 =?utf-8?B?WHhBRzVyYytoR1JtbU9sRkJNUmNOakEwbEw0SGJYLzc1VythWVVHZ2ZlUExj?=
 =?utf-8?B?emh2dmZzNmRrbEZNb2h1OGlhMWhRNk5LZk5TUjgzOVU4WUFjditKUkFuYTBj?=
 =?utf-8?B?S1pTdVorSDlyV05hOEY1d3JlZWcybFh2RnVpNCtRb3BCVWdZbGlFeUNYSTFy?=
 =?utf-8?B?NXB0NDBNczRuYmxndGlRemI0WjhKd3F2NU9YcThxcHdqZkdyN1VvMDNQZkMr?=
 =?utf-8?B?emRYRk1MeWM4TldPc0Y2bGlGOEd6WUpONDVyRG1IclI2aVBhNjk5ZGlicmNO?=
 =?utf-8?B?amJCOTlWVUVvVE5haGNhZEEyajRZamE2bFA0cGNxUklybndwT05aZUxOSUpW?=
 =?utf-8?B?aVpBZU5pYko1RFFEUHV1bC93Y0hTRHNCcGtLYldPVGZMcGQwMmNmaTNjTjFS?=
 =?utf-8?B?MzFDRDE5TUROcGMzdXJPWXZhY1hRYWd6NFVnbytoWlVYL2NMWFFjbHlCem9k?=
 =?utf-8?B?Mm9BOUxIcWZ4MTV2dXJlbGNMbEdMQ3VFRDB1dEtMeWV4V2RPcFdkcjBpTGVT?=
 =?utf-8?B?bVNadWRyRWNWVXM3UCttR09tN1JaQ3dTd1NVZU9oaHFGa0FmbmtDb1dIdkJy?=
 =?utf-8?B?V2dLWnNHKzNJci9NRzlxWGdQVVI5RWZIWUkvSDE5WFpGRmhXWmdmc0pRUWJo?=
 =?utf-8?B?MmowR2NhNFI2ejNvRnFncFJXSjdsblFPVTNBQnIwY21TcnJwSW9TeHhldTAv?=
 =?utf-8?B?SmlOdnBobUFaZ2orTHJuU0xkbUlhQzI4WjlFV0lpSVh5U003MFpRMkNEYlRy?=
 =?utf-8?Q?AIeIeIUDqJE=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10904
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: baa7ecb2-08e1-42a5-72ba-08ddcb662f6a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|1800799024|376014|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHJxdEVEQ1JrcjNaNk9ITFBUUHlXQmorZWh5YitEVU9JeEpKRjBITVU2dHV3?=
 =?utf-8?B?aEQzbE9OZUJZT2JkMkxVcVJDTDJ0eEFpSTNoOVA4OTdONktZa0tTN0gyZlBT?=
 =?utf-8?B?YVZrZklKVGhXM3dNNzIvMHV4UlhoSnVKamFTRWRYTGoyQ3pJekpqdU4wSFRl?=
 =?utf-8?B?UFpaT0RQbll2VTFLK0daK0JWNjRnTHMxanFwY2o5cFZCa2w3NnNiMzh6L1RH?=
 =?utf-8?B?L1pFaXlYMlV5djF1ZzRjQWVTaHk5ZHpDeWhUV2ExKzdQMlBjZEF5cy9GTWJD?=
 =?utf-8?B?YzVNTmNwK3BHUTJKQnNhb3V3NmJLWitWNUlyUUIwK2Q0cTN2dE1ibzNaNXB4?=
 =?utf-8?B?M0pOSkF2QUJtTWNpWjFOMkFpNlhGMWxEMzdrd0NkVkY1SjlGSVdpNnpNM2xW?=
 =?utf-8?B?QVhGeFBTdXJ0T3VVbEgzNU1la20zU2pmbWo2cFl3WHhIbmR5eHZ4VXNuSURF?=
 =?utf-8?B?WUNnc3dxdFJOcTcrNGYrcFp2cTRYQWUrUm1QUHZodHMwbDYzdFE4bGNCaVJn?=
 =?utf-8?B?RGsyZzhCS3lBejBMM0ZnZ3Ywa0F5M1hLa1EwRURIdnJpSis0U29JTUtCWGZk?=
 =?utf-8?B?TE1Ld3Vvc09XVHVUejQzdzRTVUwyZWsya3VJQTA2VCtXdnVkRE5VR2JNSWJw?=
 =?utf-8?B?SXVBZFVkWFZVMW9RSVNQZFkyM1QvQTVuSFVkdW1CNzJJTlBWNFlHbXFEWDh2?=
 =?utf-8?B?VDdHY3FnOFVEUFh0L2hkMHZXUWczWW05OVl0N3JxZCs4amxneGF3QkxyUVpG?=
 =?utf-8?B?TFN2elR5bC9qdFk1TzdMT3dWYk1XUm8zajk5bC95SG5jeDBSdUxwMlAwN1d6?=
 =?utf-8?B?TmgwYzRteHpMaEFhQVZ6WTZmZmwrWiszNUVJczBpWVN4dWRYUTNhYkM2bCtn?=
 =?utf-8?B?Rzc3V0lOK25EN3g1ZHI1RjhLV0R5QlNnRmZLWUdxdzhzc2JydGk2azFabEdt?=
 =?utf-8?B?cmdSdzZJMEhNRGpWd0FtZGpPTnMrRXdwM3hLUFl6MG9XTVFML003SzQxOGtO?=
 =?utf-8?B?M3RSNXcwZWh3dU9NVEZ6dENFK25MY0R0Mzh1cFNrcnlFUGp2dERTODcvV285?=
 =?utf-8?B?SW5NYWRXR1R0U3pvRi9QZjY5blZuYjlLblFyME1ETmJjUGgwdmNjaWpVN1ZP?=
 =?utf-8?B?MHJCNGZabzNtTWxNYW9lMzhhaUhFeC9ON1Uzblp0cUt5RytmdjhkbjJReEtZ?=
 =?utf-8?B?cXJkeTd5SnJWZUxxbzQ5RklLZ0tBKzBrSnZoeU5tZVpTMXVGQnpNWFhwYlgr?=
 =?utf-8?B?NXd4c2RoYXg0K3J0Z213UWdTUnVDNTBPM1J0VnI4YWpxaTBvVmJHQjZCZC94?=
 =?utf-8?B?QlY1SkgzWUU1Q0lrcXhtRmtPWFVMa0ErQ3ZoZ3ZDOTR5WjlGQWN5eWQ2MUln?=
 =?utf-8?B?TzBIc2dIR2tRblUwVzg2NlFwZEwzZDZ2VTlpeVhPd1c2QTh6RTdYK3IvZUsr?=
 =?utf-8?B?b21GNnlDeTN0aGxTTEhqVklQNThWanNzNnQxMjJuNXRrVkREd09rb0FEenYv?=
 =?utf-8?B?eXdOOVlGcTl1NXp6ZXBVOEI3K0FORUF2NDBSMlFkQlhaVCtnWkk3MXJSVFFJ?=
 =?utf-8?B?WDRUUE9RMTY1b0crZFJEQzV1cW0wU1d6cm01aDhoenpidXh4YXRnYXA4UTVr?=
 =?utf-8?B?Q05lQzMwNy9uSmtCWDgvYWdQVzd2MjhTS0gvd3ZuNGJWUFNScUplcFN4UXda?=
 =?utf-8?B?dkE0RGwrUVQ4UE85VzBnNzFTUzVVenFlbUxObEJJWW1FaFZJeFhUM3RvVW00?=
 =?utf-8?B?eWhIdGtjQ2RrN0F3QTIxcFRSZTJFMDlzRy82blA1WWpMWnZhL0ZuZ0FlMDRs?=
 =?utf-8?B?MjNBRjZiWFhjMmg3K1A1cnVRV2R1UmFtWUduYXBIdDY4UzVEUDRkc2F6WVVr?=
 =?utf-8?B?TlNTbnVISGFsRG5EVC94YmRmVkZtK0VFZ21qdWlxaHc4Qkt6Q3Y2cVRIOFIv?=
 =?utf-8?B?MTdFY0p2Ym90RmF0L0hJYkJZWUl6blE1N20vYU9XbmNiVytqcWQwbTVXd0dn?=
 =?utf-8?B?eW1xTWYzK2RMYTJ5bFE0WFVIMW1OUlY1NktlYmhjMlFjd3lxNU5JM2UzL2tq?=
 =?utf-8?Q?FiZra4?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(1800799024)(376014)(82310400026)(14060799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 10:30:22.2322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eaa5bc-137b-407f-3cf5-08ddcb6642c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
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

On 18/07/2025 15:49, Adrián Larumbe wrote:
> On 16.05.2025 16:49, Lukas Zapolskas wrote:
>> From: Adrián Larumbe <adrian.larumbe@collabora.com>
>>
>> The sampler aggregates counter and set requests coming from userspace
>> and mediates interactions with the FW interface, to ensure that user
>> sessions cannot override the global configuration.
>>
>> From the top-level interface, the sampler supports two different types
>> of samples: clearing samples and regular samples. Clearing samples are
>> a special sample type that allow for the creation of a sampling
>> baseline, to ensure that a session does not obtain counter data from
>> before its creation.
>>
>> Upon receipt of a relevant interrupt, corresponding to one of the three
>> relevant bits of the GLB_ACK register, the sampler takes any samples
>> that occurred, and, based on the insert and extract indices, accumulates
>> them to an internal storage buffer after zero-extending the counters
>> from the 32-bit counters emitted by the hardware to 64-bit counters
>> for internal accumulation.
>>
>> When the performance counters are enabled, the FW ensures no counter
>> data is lost when entering and leaving non-counting regions by producing
>> automatic samples that do not correspond to a GLB_REQ.PRFCNT_SAMPLE
>> request. Such regions may be per hardware unit, such as when a shader
>> core powers down, or global. Most of these events do not directly
>> correspond to session sample requests, so any intermediary counter data
>> must be stored into a temporary accumulation buffer.
>>
>> If there are sessions waiting for a sample, this accumulated buffer will
>> be taken, and emitted for each waiting client. During this phase,
>> information like the timestamps of sample request and sample emission,
>> type of the counter block and block index annotations are added to the
>> sample header and block headers. If no sessions are waiting for
>> a sample, this accumulation buffer is kept until the next time a sample
>> is requested.
>>
>> Special handling is needed for the PRFCNT_OVERFLOW interrupt, which is
>> an indication that the internal sample handling rate was insufficient.
>>
>> The sampler also maintains a buffer descriptor indicating the structure
>> of a firmware sample, since neither the firmware nor the hardware give
>> any indication of the sample structure, only that it is composed out of
>> three parts:
>>  - the metadata is an optional initial counter block on supporting
>>    firmware versions that contains a single counter, indicating the
>>    reason a sample was taken when entering global non-counting regions.
>>    This is used to provide coarse-grained information about why a sample
>>    was taken to userspace, to help userspace interpret variations in
>>    counter magnitude.
>>  - the firmware component of the sample is composed out of a global
>>    firmware counter block on supporting firmware versions.
>>  - the hardware component is the most sizeable of the three and contains
>>    a block of counters for each of the underlying hardware resources. It
>>    has a fixed structure that is described in the architecture
>>    specification, and contains the command stream hardware block(s), the
>>    tiler block(s), the MMU and L2 blocks (collectively named the memsys
>>    blocks) and the shader core blocks, in that order.
>> The structure of this buffer changes based on the firmware and hardware
>> combination, but is constant on a single system.
>>
>> This buffer descriptor also handles the sparseness of the shader cores,
>> wherein the physical core mask contains holes, but the memory allocated
>> for it is done based on the position of the most significant bit. In
>> cases with highly sparse core masks, this means that a lot of shader
>> counter blocks are empty, and must be skipped.
>>
>> The number of ring buffer slots is configurable through module param to
>> allow for a lower memory footprint on memory constrained systems.
>>
>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>> Co-developed-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
>> ---
>>  drivers/gpu/drm/panthor/panthor_fw.c   |    6 +
>>  drivers/gpu/drm/panthor/panthor_fw.h   |    6 +-
>>  drivers/gpu/drm/panthor/panthor_perf.c | 1082 +++++++++++++++++++++++-
>>  drivers/gpu/drm/panthor/panthor_perf.h |    2 +
>>  4 files changed, 1080 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>> index 0f52766a3120..e3948354daa4 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>> @@ -22,6 +22,7 @@
>>  #include "panthor_gem.h"
>>  #include "panthor_gpu.h"
>>  #include "panthor_mmu.h"
>> +#include "panthor_perf.h"
>>  #include "panthor_regs.h"
>>  #include "panthor_sched.h"
>>
>> @@ -987,9 +988,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
>>
>>  	/* Enable interrupts we care about. */
>>  	glb_iface->input->ack_irq_mask = GLB_CFG_ALLOC_EN |
>> +					 GLB_PERFCNT_SAMPLE |
>>  					 GLB_PING |
>>  					 GLB_CFG_PROGRESS_TIMER |
>>  					 GLB_CFG_POWEROFF_TIMER |
>> +					 GLB_PERFCNT_THRESHOLD |
>> +					 GLB_PERFCNT_OVERFLOW |
>>  					 GLB_IDLE_EN |
>>  					 GLB_IDLE;
>>
>> @@ -1018,6 +1022,8 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
>>  		return;
>>
>>  	panthor_sched_report_fw_events(ptdev, status);
>> +
>> +	panthor_perf_report_irq(ptdev, status);
>>  }
>>  PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
>>
>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
>> index 8bcb933fa790..5a561e72e88b 100644
>> --- a/drivers/gpu/drm/panthor/panthor_fw.h
>> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
>> @@ -198,6 +198,7 @@ struct panthor_fw_global_control_iface {
>>  	u32 group_num;
>>  	u32 group_stride;
>>  #define GLB_PERFCNT_FW_SIZE(x) ((((x) >> 16) << 8))
>> +#define GLB_PERFCNT_HW_SIZE(x) (((x) & GENMASK(15, 0)) << 8)
>>  	u32 perfcnt_size;
>>  	u32 instr_features;
>>  #define PERFCNT_FEATURES_MD_SIZE(x) (((x) & GENMASK(3, 0)) << 8)
>> @@ -210,7 +211,7 @@ struct panthor_fw_global_input_iface {
>>  #define GLB_CFG_ALLOC_EN			BIT(2)
>>  #define GLB_CFG_POWEROFF_TIMER			BIT(3)
>>  #define GLB_PROTM_ENTER				BIT(4)
>> -#define GLB_PERFCNT_EN				BIT(5)
>> +#define GLB_PERFCNT_ENABLE			BIT(5)
>>  #define GLB_PERFCNT_SAMPLE			BIT(6)
>>  #define GLB_COUNTER_EN				BIT(7)
>>  #define GLB_PING				BIT(8)
>> @@ -243,6 +244,9 @@ struct panthor_fw_global_input_iface {
>>  	u64 perfcnt_base;
>>  	u32 perfcnt_extract;
>>  	u32 reserved3[3];
>> +#define GLB_PERFCNT_CONFIG_SIZE(x) ((x) & GENMASK(7, 0))
>> +#define GLB_PERFCNT_CONFIG_SET(x) (((x) & GENMASK(1, 0)) << 8)
>> +#define GLB_PERFCNT_METADATA_ENABLE BIT(10)
>>  	u32 perfcnt_config;
>>  	u32 perfcnt_csg_select;
>>  	u32 perfcnt_fw_enable;
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
>> index 15fa533731f3..97603b168d2d 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.c
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
>> @@ -9,7 +9,11 @@
>>
>>  #include "panthor_device.h"
>>  #include "panthor_fw.h"
>> +#include "panthor_gem.h"
>> +#include "panthor_gpu.h"
>> +#include "panthor_mmu.h"
>>  #include "panthor_perf.h"
>> +#include "panthor_regs.h"
>>
>>  /**
>>   * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
>> @@ -18,6 +22,81 @@
>>   */
>>  #define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
>>
>> +/**
>> + * PANTHOR_CTR_TIMESTAMP_LO - The first architecturally mandated counter of every block type
>> + *                            contains the low 32-bits of the TIMESTAMP value.
>> + */
>> +#define PANTHOR_CTR_TIMESTAMP_LO (0)
>> +
>> +/**
>> + * PANTHOR_CTR_TIMESTAMP_HI - The register offset containinig the high 32-bits of the TIMESTAMP
>> + *                            value.
>> + */
>> +#define PANTHOR_CTR_TIMESTAMP_HI (1)
>> +
>> +/**
>> + * PANTHOR_CTR_PRFCNT_EN - The register offset containing the enable mask for the enabled counters
>> + *                         that were written to memory.
>> + */
>> +#define PANTHOR_CTR_PRFCNT_EN (2)
>> +
>> +/**
>> + * PANTHOR_HEADER_COUNTERS - The first four counters of every block type are architecturally
>> + *                           defined to be equivalent. The fourth counter is always reserved,
>> + *                           and should be zero and as such, does not have a separate define.
>> + *
>> + *                           These are the only four counters that are the same between different
>> + *                           blocks and are consistent between different architectures.
>> + */
>> +#define PANTHOR_HEADER_COUNTERS (4)
>> +
>> +/**
>> + * PANTHOR_CTR_SAMPLE_REASON - The metadata block has a single value in position three which
>> + *                             indicates the reason a sample was taken.
>> + */
>> +#define PANTHOR_CTR_SAMPLE_REASON (3)
>> +
>> +/**
>> + * PANTHOR_HW_COUNTER_SIZE - The size of a hardware counter in the FW ring buffer.
>> + */
>> +#define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
>> +
>> +/**
>> + * PANTHOR_PERF_RINGBUF_SLOTS_MIN - The minimum permitted number of slots in the Panthor perf
>> + *                                  ring buffer.
>> + */
>> +#define PANTHOR_PERF_RINGBUF_SLOTS_MIN (16)
>> +
>> +/**
>> + * PANTHOR_PERF_RINGBUF_SLOTS_MAX - The maximum permitted number of slots in the Panthor perf
>> + *                                  ring buffer.
>> + */
>> +#define PANTHOR_PERF_RINGBUF_SLOTS_MAX (256)
>> +
>> +static unsigned int perf_ringbuf_slots = 32;
>> +
>> +static int perf_ringbuf_slots_set(const char *val, const struct kernel_param *kp)
>> +{
>> +	unsigned int slots;
>> +	int ret = kstrtouint(val, 0, &slots);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!is_power_of_2(slots))
>> +		return -EINVAL;
>> +
>> +	return param_set_uint_minmax(val, kp, 16, 256);
>> +}
>> +
>> +static const struct kernel_param_ops perf_ringbuf_ops = {
>> +	.set = perf_ringbuf_slots_set,
>> +	.get = param_get_uint,
>> +};
>> +module_param_cb(perf_ringbuf_slots, &perf_ringbuf_ops, &perf_ringbuf_slots, 0400);
>> +MODULE_PARM_DESC(perf_ringbuf_slots,
>> +		 "Power of two slots allocated for the Panthor perf kernel-FW ringbuffer");
>> +
>>  enum panthor_perf_session_state {
>>  	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
>>  	PANTHOR_PERF_SESSION_ACTIVE = 0,
>> @@ -63,6 +142,116 @@ enum session_sample_type {
>>  	SAMPLE_TYPE_REGULAR,
>>  };
>>
>> +struct panthor_perf_buffer_descriptor {
>> +	/**
>> +	 * @block_size: The size of a single block in the FW ring buffer, equal to
>> +	 *              sizeof(u32) * counters_per_block.
>> +	 */
>> +	size_t block_size;
>> +
>> +	/**
>> +	 * @buffer_size: The total size of the buffer, equal to (#hardware blocks +
>> +	 *               #firmware blocks) * block_size.
>> +	 */
>> +	size_t buffer_size;
>> +
>> +	/**
>> +	 * @available_blocks: Bitmask indicating the blocks supported by the hardware and firmware
>> +	 *                    combination. Note that this can also include blocks that will not
>> +	 *                    be exposed to the user.
>> +	 */
>> +	DECLARE_BITMAP(available_blocks, DRM_PANTHOR_PERF_BLOCK_MAX);
>> +	struct {
>> +		/** @offset: Starting offset of a block of type @type in the FW ringbuffer. */
>> +		size_t offset;
>> +
>> +		/** @block_count: Number of blocks of the given @type, starting at @offset. */
>> +		size_t block_count;
>> +
>> +		/** @phys_mask: Bitmask of the physically available blocks. */
>> +		u64 phys_mask;
>> +	} blocks[DRM_PANTHOR_PERF_BLOCK_MAX];
>> +};
>> +
>> +/**
>> + * struct panthor_perf_sampler - Interface to de-multiplex firmware interaction and handle
>> + *                               global interactions.
>> + */
>> +struct panthor_perf_sampler {
>> +	/**
>> +	 * @enabled_clients: The number of clients concurrently requesting samples. To ensure that
>> +	 *                   one client cannot deny samples to another, we must ensure that clients
>> +	 *                   are effectively reference counted.
>> +	 */
>> +	atomic_t enabled_clients;
>> +
>> +	/**
>> +	 * @sample_handled: Synchronization point between the interrupt bottom half and the
>> +	 *                  main sampler interface. Must be re-armed solely on a new request
>> +	 *                  coming to the sampler.
>> +	 */
>> +	struct completion sample_handled;
>> +
>> +	/** @rb: Kernel BO in the FW AS containing the sample ringbuffer. */
>> +	struct panthor_kernel_bo *rb;
>> +
>> +	/**
>> +	 * @sample_slots: Number of slots for samples in the FW ringbuffer. Could be static,
>> +	 *		  but may be useful to customize for low-memory devices.
>> +	 */
>> +	size_t sample_slots;
>> +
>> +	/** @em: Combined enable mask for all of the active sessions. */
>> +	struct panthor_perf_enable_masks *em;
>> +
>> +	/**
>> +	 * @desc: Buffer descriptor for a sample in the FW ringbuffer. Note that this buffer
>> +	 *        at current time does some interesting things with the zeroth block type. On
>> +	 *        newer FW revisions, the first counter block of the sample is the METADATA block,
>> +	 *        which contains a single value indicating the reason the sample was taken (if
>> +	 *        any). This block must not be exposed to userspace, as userspace does not
>> +	 *        have sufficient context to interpret it. As such, this block type is not
>> +	 *        added to the uAPI, but we still use it in the kernel.
>> +	 */
>> +	struct panthor_perf_buffer_descriptor desc;
>> +
>> +	/**
>> +	 * @sample: Pointer to an upscaled and annotated sample that may be emitted to userspace.
>> +	 *          This is used both as an intermediate buffer to do the zero-extension of the
>> +	 *          32-bit counters to 64-bits and as a storage buffer in case the sampler
>> +	 *          requests an additional sample that was not requested by any of the top-level
>> +	 *          sessions (for instance, when changing the enable masks).
>> +	 */
>> +	u8 *sample;
>> +
>> +	/**
>> +	 * @sampler_lock: Lock used to guard the list of sessions and the sampler configuration.
>> +	 *                In particular, it guards the @session_list and the @em.
>> +	 */
>> +	struct mutex sampler_lock;
>> +
>> +	/** @session_list: List of all sessions. */
>> +	struct list_head session_list;
>> +
>> +	/** @pend_lock: Lock used to guard the list of sessions with pending samples. */
>> +	spinlock_t pend_lock;
>> +
>> +	/** @pending_samples: List of sessions requesting samples. */
>> +	struct list_head pending_samples;
>> +
>> +	/** @sample_requested: A sample has been requested. */
>> +	bool sample_requested;
>> +
>> +	/** @set_config: The set that will be configured onto the hardware. */
>> +	u8 set_config;
>> +
>> +	/**
>> +	 * @ptdev: Backpointer to the Panthor device, needed to ring the global doorbell and
>> +	 *         interface with FW.
>> +	 */
>> +	struct panthor_device *ptdev;
>> +};
>> +
>>  struct panthor_perf_session {
>>  	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
>>
>> @@ -184,6 +373,9 @@ struct panthor_perf {
>>  	 * @sessions: Global map of sessions, accessed by their ID.
>>  	 */
>>  	struct xarray sessions;
>> +
>> +	/** @sampler: FW control interface. */
>> +	struct panthor_perf_sampler sampler;
>>  };
>>
>>  struct panthor_perf_counter_block {
>> @@ -237,7 +429,7 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
>>  }
>>
>>  static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
>> -		*setup_args)
>> +								*setup_args)
>>  {
>>  	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
>>  	if (IS_ERR_OR_NULL(em))
>> @@ -257,6 +449,23 @@ static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panth
>>  	return em;
>>  }
>>
>> +static void panthor_perf_em_add(struct panthor_perf_enable_masks *dst_em,
>> +				const struct panthor_perf_enable_masks *const src_em)
> 
> I think that, maybe for the sake of consistency, also make dst_em const? Just
> the pointer variable itself, not what it points to:
> struct panthor_perf_enable_masks *const dst_em
> 
>> +{
>> +	size_t i = 0;
>> +
>> +	for (i = DRM_PANTHOR_PERF_BLOCK_FIRST; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
>> +		bitmap_or(dst_em->mask[i], dst_em->mask[i], src_em->mask[i], PANTHOR_PERF_EM_BITS);
>> +}
>> +
>> +static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
>> +{
>> +	size_t i = 0;
>> +
>> +	for (i = DRM_PANTHOR_PERF_BLOCK_FIRST; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
>> +		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
>> +}
>> +
>>  static u64 session_read_extract_idx(struct panthor_perf_session *session)
>>  {
>>  	const u64 slots = session->ringbuf_slots;
>> @@ -267,6 +476,12 @@ static u64 session_read_extract_idx(struct panthor_perf_session *session)
>>  	return smp_load_acquire(&session->control->extract_idx) % slots;
>>  }
>>
>> +static void session_write_insert_idx(struct panthor_perf_session *session, u64 idx)
>> +{
>> +	/* Userspace needs the insert index to know where to look for the sample. */
>> +	smp_store_release(&session->control->insert_idx, idx);
>> +}
>> +
>>  static u64 session_read_insert_idx(struct panthor_perf_session *session)
>>  {
>>  	const u64 slots = session->ringbuf_slots;
>> @@ -326,7 +541,7 @@ static void session_put(struct panthor_perf_session *session)
>>   * Return: valid session pointer or an ERR_PTR.
>>   */
>>  static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>> -		struct panthor_perf *perf, u32 sid)
>> +						 struct panthor_perf *perf, u32 sid)
>>  {
>>  	struct panthor_perf_session *session;
>>
>> @@ -352,6 +567,761 @@ static struct panthor_perf_session *session_find(struct panthor_file *pfile,
>>  	return session;
>>  }
>>
>> +static u32 compress_enable_mask(unsigned long *const src)
>> +{
>> +	size_t i;
>> +	u32 result = 0;
>> +	unsigned long clump;
>> +
>> +	for_each_set_clump8(i, clump, src, PANTHOR_PERF_EM_BITS) {
>> +		const unsigned long shift = div_u64(i, 4);
>> +
>> +		result |= !!(clump & GENMASK(3, 0)) << shift;
>> +		result |= !!(clump & GENMASK(7, 4)) << (shift + 1);
>> +	}
>> +
>> +	return result;
>> +}
> 
> I think what you're trying to do here is, because one enable bit enables four consecutive counters,
> if we have a mask of 32 bit, then that could be used to stand for the enablement status of
> 32 * 4 = 128 counters altogether. However, one thing I keep wondering is, in what circumstances
> not all bits in a group of four could all be enabled at the same time (since they seem to be enabled
> at the user's request in groups of four anyways).
> Also, I think there's a problem in how you handle the shift.
> In the case of four consecutive bytes being handled:
> In for_each_set_clump8(i, [...]) , 'i' can take values between 0 and 15, so div_u64(i, 4)
> will return values between 0 and 3.
> Then let's say for 8-bit clumps with indeces between 0 and 3, you'd want to flag the 8 LS bits
> of 'result', but at the moment you're just overwriting them for successive clumps with the same modulo 'i'.
> 
> I think what you meant was most likely this:
> ```
>   for_each_set_clump8(i, clump, src, PANTHOR_PERF_EM_BITS) {
>           result |= !!(clump & GENMASK(3, 0)) << (i * 2);
>           result |= !!(clump & GENMASK(7, 4)) << (i * 2) + 1;
>   }
> ```
> 

The idea is that the user can request counters at a granularity of one counter per bit,
and this should work equivalently with both the case where we enable 2 counters per bit 
at the hardware (64 counter per block systems) and the case where we enable 4 counters
per bit (128 counter per block systems). 

The shift is wrong, as is the number of bits we want to be iterating over: for the Gx10
series, we want to be shifting by two bits at a time and only go through bits 0-63 
from the enable mask.

>> +
>> +static void expand_enable_mask(u32 em, unsigned long *const dst)
>> +{
>> +	size_t i;
>> +	DECLARE_BITMAP(emb, BITS_PER_TYPE(u32));
>> +
>> +	bitmap_from_arr32(emb, &em, BITS_PER_TYPE(u32));
>> +
>> +	for_each_set_bit(i, emb, BITS_PER_TYPE(u32))
>> +		bitmap_set(dst, i * 4, 4);
>> +}
>> +
>> +/**
>> + * panthor_perf_block_data - Identify the block index and type based on the offset.
>> + *
>> + * @desc:   FW buffer descriptor.
>> + * @offset: The current offset being examined.
>> + * @idx:    Pointer to an output index.
>> + * @type:   Pointer to an output block type.
>> + *
>> + * To disambiguate different types of blocks as well as different blocks of the same type,
>> + * the offset into the FW ringbuffer is used to uniquely identify the block being considered.
>> + *
>> + * In the future, this is a good time to identify whether a block will be empty,
>> + * allowing us to short-circuit its processing after emitting header information.
>> + *
>> + * Return: True if the current block is available, false otherwise.
>> + */
>> +static bool panthor_perf_block_data(struct panthor_perf_buffer_descriptor *const desc,
>> +				    size_t offset, u32 *idx,
>> +				    enum drm_panthor_perf_block_type *type)
>> +{
>> +	unsigned long id;
>> +
>> +	for_each_set_bit(id, desc->available_blocks, DRM_PANTHOR_PERF_BLOCK_LAST) {
> 
> I don't see the point of keeping this bitmask, because you set every single available bit
> in panthor_perf_setup_fw_buffer_desc, as you traverse all the enum drm_panthor_perf_block_type values.
> What you effectively do is turning the enum itself into a bitmask, so I'd just get rid of it and do
> 'for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++)'
> right here.

We do traverse all of the values, but the bitmask is meant to skip over the ones that are not
present on a given system. For instance, the metadata block and FW blocks may be missing, and if 
new blocks are added, those would not be present on older systems. 

> 
>> +		const size_t block_start = desc->blocks[id].offset;
>> +		const size_t block_count = desc->blocks[id].block_count;
>> +		const size_t block_end = desc->blocks[id].offset +
>> +			desc->block_size * block_count;
>> +
>> +		if (!block_count)
>> +			continue;
>> +
>> +		if ((offset >= block_start) && (offset < block_end)) {
>> +			const unsigned long phys_mask[] = {
>> +				BITMAP_FROM_U64(desc->blocks[id].phys_mask),
>> +			};
>> +			const size_t pos =
>> +				div_u64(offset - desc->blocks[id].offset, desc->block_size);
>> +
>> +			*type = id;
>> +
>> +			if (test_bit(pos, phys_mask)) {
>> +				const u64 mask = GENMASK_ULL(pos, 0);
>> +				const u64 zeroes = ~desc->blocks[id].phys_mask & mask;
>> +
>> +				*idx = pos - hweight64(zeroes);
>> +				return true;
> 
> I don't understand very well what you're trying to do here.
> 

The code here is a bit awkward, but here is the idea: the architecturally 
defined layout algorithm takes into account the total possible number of shader 
cores by using the most significant bit of the shader core mask. For instance, 
on one of the Rock5Bs (not sure if this is consistent), the shader core mask is 
0b1010000000000000101, so the hardware will allocate 19 slots for shader core 
counters. 

However, the blocks corresponding to zeroes in the shader core mask will always be empty.
The above code does the checking to see if the current block has counters in it, 
and then assigns each of the cores a stable index, based on the posiiton of the bit 
in the bitmask. When setting up the buffer descriptor, we create an artificial physical
mask for each of the block types, where only the shader core one can be sparse at 
current time.

With the bitmask above, the user would see a sample with four shader core blocks, 
consistently indexed as 0 through 3 (inclusive), with no gaps between them. 

For systems with highly sparse core masks, this is a fairly large memory saving. On
the Rock 5B, if I recall corerctly, the total block count is somewhere around 8-9
on the regular, whereas without the removal of architecturally mandated but empty 
slots, this would be 23-24 blocks.

>> +			}
>> +			return false;
>> +		}
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static size_t session_get_user_sample_size(const struct drm_panthor_perf_info *const info)
>> +{
>> +	const size_t block_size = get_annotated_block_size(info->counters_per_block);
>> +	const size_t block_nr = info->cshw_blocks + info->fw_blocks +
>> +		info->tiler_blocks + info->memsys_blocks + info->shader_blocks;
>> +
>> +	return sizeof(struct drm_panthor_perf_sample_header) + (block_size * block_nr);
>> +}
> 
> You've redefined session_get_user_sample_size here.
> 

Will remove, thanks. 

>> +
>> +static u32 panthor_perf_handle_sample(struct panthor_device *ptdev, u32 extract_idx, u32 insert_idx)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +	struct panthor_perf_sampler *sampler = &ptdev->perf->sampler;
>> +	const size_t ann_block_size =
>> +		get_annotated_block_size(ptdev->perf_info.counters_per_block);
>> +	u32 i;
>> +
>> +	for (i = extract_idx; i != insert_idx; i++) {
>> +		u32 slot = i % sampler->sample_slots;
>> +		u8 *fw_sample = (u8 *)sampler->rb->kmap + slot * sampler->desc.buffer_size;
>> +
>> +		for (size_t fw_off = 0, ann_off = sizeof(struct drm_panthor_perf_sample_header);
>> +				fw_off < sampler->desc.buffer_size;
>> +				fw_off += sampler->desc.block_size)
>> +
>> +		{
>> +			u32 idx = 0;
>> +			enum drm_panthor_perf_block_type type = 0;
>> +			DECLARE_BITMAP(expanded_em, PANTHOR_PERF_EM_BITS);
>> +			struct panthor_perf_counter_block *blk =
>> +				(typeof(blk))(perf->sampler.sample + ann_off);
>> +			u32 *const block = (u32 *)(fw_sample + fw_off);
>> +			const u32 prfcnt_en = block[PANTHOR_CTR_PRFCNT_EN];
>> +
>> +			if (!panthor_perf_block_data(&sampler->desc, fw_off, &idx, &type))
>> +				continue;
>> +
>> +			/**
>> +			 * TODO Data from the metadata block must be used to populate the
>> +			 * block state information.
>> +			 */
>> +			if (type == DRM_PANTHOR_PERF_BLOCK_METADATA) {
>> +				/*
>> +				 * The host must clear the SAMPLE_REASON to acknowledge it has
>> +				 * consumed the sample.
>> +				 */
>> +				block[PANTHOR_CTR_SAMPLE_REASON] = 0;
>> +				continue;
>> +			}
>> +
>> +			expand_enable_mask(prfcnt_en, expanded_em);
>> +
>> +			blk->header = (struct drm_panthor_perf_block_header) {
>> +				.clock = 0,
>> +				.block_idx = idx,
>> +				.block_type = type,
>> +				.block_states = DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN
> 
> Are you using any states other than DRM_PANTHOR_PERF_BLOCK_STATE_UNKNOWN?
> 

Not at the moment. Wanted to keep this functionality out of this patch series.

>> +			};
>> +			bitmap_to_arr64(blk->header.enable_mask, expanded_em, PANTHOR_PERF_EM_BITS);
>> +
>> +			/*
>> +			 * The four header counters must be treated differently, because they are
>> +			 * not additive. For the fourth, the assignment does not matter, as it
>> +			 * is reserved and should be zero.
>> +			 */
>> +			blk->counters[PANTHOR_CTR_TIMESTAMP_LO] = block[PANTHOR_CTR_TIMESTAMP_LO];
>> +			blk->counters[PANTHOR_CTR_TIMESTAMP_HI] = block[PANTHOR_CTR_TIMESTAMP_HI];
>> +			blk->counters[PANTHOR_CTR_PRFCNT_EN] = block[PANTHOR_CTR_PRFCNT_EN];
>> +
>> +			/*
>> +			 * The host must clear PRFCNT_EN to acknowledge it has consumed the sample.
>> +			 */
>> +			block[PANTHOR_CTR_PRFCNT_EN] = 0;
>> +
>> +			for (size_t k = PANTHOR_HEADER_COUNTERS;
>> +					k < ptdev->perf_info.counters_per_block;
>> +					k++)
>> +				blk->counters[k] += block[k];
>> +
>> +			ann_off += ann_block_size;
> 
> Why wouldn't you include this inside the for loop step definition?
> 

Because we do not want to increment the annotated block size on blocks that will be ignored, 
like the reserved but unavailable shader core ones. This determination is done in 
panthor_perf_block_data. 

>> +		}
>> +	}
>> +
>> +	return i;
>> +}
>> +
>> +static size_t panthor_perf_get_fw_reported_size(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +
>> +	size_t fw_size = GLB_PERFCNT_FW_SIZE(glb_iface->control->perfcnt_size);
>> +	size_t hw_size = GLB_PERFCNT_HW_SIZE(glb_iface->control->perfcnt_size);
>> +	size_t md_size = PERFCNT_FEATURES_MD_SIZE(glb_iface->control->perfcnt_features);
>> +
>> +	return md_size + fw_size + hw_size;
>> +}
>> +
>> +#define PANTHOR_PERF_SET_BLOCK_DESC_DATA(__desc, __type, __blk_count, __phys_mask, __offset) \
>> +	({ \
>> +		(__desc)->blocks[(__type)].offset = (__offset); \
>> +		(__desc)->blocks[(__type)].block_count = (__blk_count);  \
>> +		(__desc)->blocks[(__type)].phys_mask = (__phys_mask);   \
>> +		if ((__blk_count))                                    \
>> +			set_bit((__type), (__desc)->available_blocks); \
>> +		(__offset) + ((__desc)->block_size) * (__blk_count); \
>> +	 })
>> +
>> +static size_t get_reserved_shader_core_blocks(struct panthor_device *ptdev)
>> +{
>> +	const u64 sc_mask = ptdev->gpu_info.shader_present;
>> +
>> +	return fls64(sc_mask);
>> +}
>> +
>> +#define BLK_MASK(x) GENMASK_ULL((x) - 1, 0)
>> +
>> +static u64 get_shader_core_mask(struct panthor_device *ptdev)
>> +{
>> +	const u64 sc_mask = ptdev->gpu_info.shader_present;
>> +
>> +	return BLK_MASK(hweight64(sc_mask));
>> +}
>> +
>> +static int panthor_perf_setup_fw_buffer_desc(struct panthor_device *ptdev,
>> +					     struct panthor_perf_sampler *sampler)
>> +{
>> +	const struct drm_panthor_perf_info *const info = &ptdev->perf_info;
>> +	const size_t block_size = info->counters_per_block * PANTHOR_HW_COUNTER_SIZE;
>> +	struct panthor_perf_buffer_descriptor *desc = &sampler->desc;
>> +	const size_t fw_sample_size = panthor_perf_get_fw_reported_size(ptdev);
>> +	size_t offset = 0;
>> +
>> +	desc->block_size = block_size;
>> +
>> +	for (enum drm_panthor_perf_block_type type = 0; type < DRM_PANTHOR_PERF_BLOCK_MAX; type++) {
>> +		switch (type) {
>> +		case DRM_PANTHOR_PERF_BLOCK_METADATA:
>> +			if (info->flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
>> +				offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, 1,
>> +									  BLK_MASK(1), offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_FW:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->fw_blocks,
>> +								  BLK_MASK(info->fw_blocks),
>> +								  offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_CSHW:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->cshw_blocks,
>> +								  BLK_MASK(info->cshw_blocks),
>> +								  offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_TILER:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->tiler_blocks,
>> +								  BLK_MASK(info->tiler_blocks),
>> +								  offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_MEMSYS:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type, info->memsys_blocks,
>> +								  BLK_MASK(info->memsys_blocks),
>> +								  offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_SHADER:
>> +			offset = PANTHOR_PERF_SET_BLOCK_DESC_DATA(desc, type,
>> +								  get_reserved_shader_core_blocks(ptdev),
>> +								  get_shader_core_mask(ptdev),
>> +								  offset);
>> +			break;
>> +		case DRM_PANTHOR_PERF_BLOCK_MAX:
>> +			drm_WARN_ON_ONCE(&ptdev->base,
>> +					 "DRM_PANTHOR_PERF_BLOCK_MAX should be unreachable!");
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* Computed size is not the same as the reported size, so we should not proceed in
>> +	 * initializing the sampling session.
>> +	 */
>> +	if (offset != fw_sample_size)
>> +		return -EINVAL;
>> +
>> +	desc->buffer_size = offset;
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_fw_stop_sampling(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	u32 acked;
>> +	int ret;
>> +
>> +	if (~READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
>> +		return 0;
>> +
>> +	panthor_fw_update_reqs(glb_iface, req, 0, GLB_PERFCNT_ENABLE);
>> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
>> +	if (ret)
>> +		drm_warn(&ptdev->base, "Could not disable performance counters");
>> +
>> +	return ret;
>> +}
>> +
>> +static int panthor_perf_fw_start_sampling(struct panthor_device *ptdev)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	u32 acked;
>> +	int ret;
>> +
>> +	if (READ_ONCE(glb_iface->input->req) & GLB_PERFCNT_ENABLE)
>> +		return 0;
>> +
>> +	panthor_fw_update_reqs(glb_iface, req, GLB_PERFCNT_ENABLE, GLB_PERFCNT_ENABLE);
>> +	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> +	ret = panthor_fw_glb_wait_acks(ptdev, GLB_PERFCNT_ENABLE, &acked, 100);
>> +	if (ret)
>> +		drm_warn(&ptdev->base, "Could not enable performance counters");
>> +
>> +	return ret;
>> +}
>> +
>> +static void panthor_perf_fw_write_config(struct panthor_perf_sampler *sampler,
>> +					 struct panthor_perf_enable_masks *em)
> 
> I've noticed inconsistent usage in the way you declare some local variables (enablement mask pointers specifically)
> as pointer constants, eg, in panthor_perf_em_add() you declare it as struct panthor_perf_enable_masks *const.
> Here it would be alright to declare it as const too, because it's only being read from.
> 

Let me go through and make that more consistent, thanks. 

>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
>> +	u32 perfcnt_config;
>> +
>> +	glb_iface->input->perfcnt_csf_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW]);
>> +	glb_iface->input->perfcnt_shader_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER]);
>> +	glb_iface->input->perfcnt_mmu_l2_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS]);
>> +	glb_iface->input->perfcnt_tiler_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER]);
>> +	glb_iface->input->perfcnt_fw_enable =
>> +		compress_enable_mask(em->mask[DRM_PANTHOR_PERF_BLOCK_FW]);
>> +
>> +	WRITE_ONCE(glb_iface->input->perfcnt_as, panthor_vm_as(panthor_fw_vm(sampler->ptdev)));
>> +	WRITE_ONCE(glb_iface->input->perfcnt_base, panthor_kernel_bo_gpuva(sampler->rb));
> 
> Some of the things you do here need to be done only once at perf init time, like
> 
> ```
> WRITE_ONCE(glb_iface->input->perfcnt_as, panthor_vm_as(panthor_fw_vm(sampler->ptdev)));
> WRITE_ONCE(glb_iface->input->perfcnt_base, panthor_kernel_bo_gpuva(sampler->rb));
> [...]
> perfcnt_config = GLB_PERFCNT_CONFIG_SIZE(perf_ringbuf_slots);
> [...]
> 	if (sampler->ptdev->perf_info.flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
> 	perfcnt_config |= GLB_PERFCNT_METADATA_ENABLE;
> ```
> However, this is done every single time a new session is introduced.

We could save a little bit by skipping writing the AS and base address of the ring buffer, 
but this is sometimes required. For instance, these functions are also called in the 
post reset path, since the reset zeroes them out. 

> Also, perhaps it's a good idea to allocate the FW ring buffer only when the first session is registered,
> and remove it when no sessions are active to save some memory

It's on the list of things to improve on, but would you mind if I did that in a follow-up
patch set? I'd like to progress this series without adding more features on top. Currently,
the module param can already be used to reduce the memory consumption of the FW ring buffer
to somewhere around several pages. 

>> +
>> +	perfcnt_config = GLB_PERFCNT_CONFIG_SIZE(perf_ringbuf_slots);
>> +	perfcnt_config |= GLB_PERFCNT_CONFIG_SET(sampler->set_config);
>> +	if (sampler->ptdev->perf_info.flags & DRM_PANTHOR_PERF_BLOCK_STATES_SUPPORT)
>> +		perfcnt_config |= GLB_PERFCNT_METADATA_ENABLE;
>> +
>> +	WRITE_ONCE(glb_iface->input->perfcnt_config, perfcnt_config);
>> +
>> +	/**
>> +	 * The spec mandates that the host zero the PRFCNT_EXTRACT register before an enable
>> +	 * operation, and each (re-)enable will require an enable-disable pair to program
>> +	 * the new changes onto the FW interface.
>> +	 */
>> +	WRITE_ONCE(glb_iface->input->perfcnt_extract, 0);
>> +}
>> +
>> +static void panthor_perf_fw_write_sampler_config(struct panthor_perf_sampler *sampler)
>> +{
>> +	panthor_perf_fw_write_config(sampler, sampler->em);
>> +}
>> +
>> +static void session_populate_sample_header(struct panthor_perf_session *session,
>> +					   struct drm_panthor_perf_sample_header *hdr, u8 set)
>> +{
>> +	*hdr = (struct drm_panthor_perf_sample_header) {
>> +		.block_set = set,
>> +		.user_data = session->user_data,
>> +		.timestamp_start_ns = session->sample_start_ns,
>> +		/**
>> +		 * TODO This should be changed to use the GPU clocks and the TIMESTAMP register,
>> +		 * when support is added.
> 
> Access to the timestamp registers is available since the merging of the panthor fdinfo support patch series
> 

It is, but I'd like to address that in a separate patch series. 

>> +		 */
>> +		.timestamp_end_ns = ktime_get_raw_ns(),
>> +	};
>> +}
>> +
>> +/**
>> + * session_accumulate_sample - Accumulate the counters that are requested by the session
>> + *                             into the target buffer.
>> + *
>> + * @ptdev: Panthor device
>> + * @session: Perf session
>> + * @session_sample: Starting offset of the sample in the userspace mapping.
>> + * @sampler_sample: Starting offset of the sample in the sampler intermediate buffer.
>> + *
>> + * The hardware supports counter selection at the granularity of 1 bit per 4 counters, and there
>> + * is a single global FW frontend to program the counter requests from multiple sessions. This may
>> + * lead to a large disparity between the requested and provided counters for an individual client.
>> + * To remove this cross-talk, we patch out the counters that have not been requested by this
>> + * session and update the PRFCNT_EN, the header counter containing a bitmask of enabled counters,
>> + * accordingly.
>> + */
>> +static void session_accumulate_sample(struct panthor_device *ptdev,
>> +				      struct panthor_perf_session *session,
>> +				      u8 *session_sample, u8 *sampler_sample)
>> +{
>> +	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
>> +	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
>> +	const size_t sample_size = session_get_user_sample_size(perf_info);
>> +	const size_t sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
>> +	const size_t data_size = sample_size - sample_header_size;
>> +	struct drm_panthor_perf_sample_header *hdr = (typeof(hdr))session_sample;
>> +
>> +	hdr->timestamp_end_ns = ktime_get_raw_ns();
>> +
>> +	session_sample += sample_header_size;
>> +	sampler_sample += sample_header_size;
>> +
>> +	for (size_t i = 0; i < data_size; i += block_size) {
>> +		size_t ctr_idx;
>> +		DECLARE_BITMAP(enabled_ctrs, PANTHOR_PERF_EM_BITS);
>> +		struct panthor_perf_counter_block *dst_blk = (typeof(dst_blk))(session_sample + i);
>> +		struct panthor_perf_counter_block *src_blk = (typeof(src_blk))(sampler_sample + i);
>> +
>> +		bitmap_from_arr64(enabled_ctrs, dst_blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
>> +		bitmap_clear(enabled_ctrs, 0, PANTHOR_HEADER_COUNTERS);
>> +
>> +		dst_blk->counters[PANTHOR_CTR_TIMESTAMP_HI] =
>> +			src_blk->counters[PANTHOR_CTR_TIMESTAMP_HI];
>> +		dst_blk->counters[PANTHOR_CTR_TIMESTAMP_LO] =
>> +			src_blk->counters[PANTHOR_CTR_TIMESTAMP_LO];
>> +
>> +		for_each_set_bit(ctr_idx, enabled_ctrs, PANTHOR_PERF_EM_BITS)
>> +			dst_blk->counters[ctr_idx] += src_blk->counters[ctr_idx];
>> +	}
>> +}
>> +
>> +static void panthor_perf_fw_request_sample(struct panthor_perf_sampler *sampler)
>> +{
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(sampler->ptdev);
>> +
>> +	panthor_fw_toggle_reqs(glb_iface, req, ack, GLB_PERFCNT_SAMPLE);
>> +	gpu_write(sampler->ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
>> +}
>> +
>> +/**
>> + * session_populate_sample - Write out a new sample into a previously populated slot in the user
>> + *                           ringbuffer and update both the header of the block and the PRFCNT_EN
>> + *                           counter to contain only the selected subset of counters for that block.
>> + *
>> + * @ptdev: Panthor device
>> + * @session: Perf session
>> + * @session_sample: Pointer aligned to the start of the data section of the sample in the targeted
>> + *                  slot.
>> + * @sampler_sample: Pointer aligned to the start of the data section of the intermediate sampler
>> + *                  buffer.
>> + *
>> + * When a new sample slot is targeted, it must be cleared of the data already existing there,
>> + * enabling a direct copy from the intermediate buffer and then zeroing out any counters
>> + * that are not required for the current session.
>> + */
>> +static void session_populate_sample(struct panthor_device *ptdev,
>> +				    struct panthor_perf_session *session, u8 *session_sample,
>> +				    u8 *sampler_sample)
>> +{
>> +	const struct drm_panthor_perf_info *const perf_info = &ptdev->perf_info;
>> +
>> +	const size_t block_size = get_annotated_block_size(perf_info->counters_per_block);
>> +	const size_t sample_size = session_get_user_sample_size(perf_info);
>> +	const size_t sample_header_size = sizeof(struct drm_panthor_perf_sample_header);
>> +	const size_t data_size = sample_size - sample_header_size;
>> +
>> +	memcpy(session_sample, sampler_sample, sample_size);
> 
> If you're overwriting the sample header next line, maybe what you meant was?
> 
>     memcpy(session_sample + sample_header_size, sampler_sample, sample_size);
> 

Initially, I had done this to simplify the handling, but can equally convert it to 

	memcpy(session_sample, sampler_sample + sample_header_size, data_size)

after the start of the session sample has been incremented several lines down.

>> +
>> +	session_populate_sample_header(session,
>> +				       (struct drm_panthor_perf_sample_header *)session_sample,
>> +				       ptdev->perf->sampler.set_config);
>> +
>> +	session_sample += sample_header_size;
>> +
>> +	for (size_t i = 0; i < data_size; i += block_size) {
>> +		size_t ctr_idx;
>> +		DECLARE_BITMAP(em_diff, PANTHOR_PERF_EM_BITS);
>> +		struct panthor_perf_counter_block *blk = (typeof(blk))(session_sample + i);
>> +		enum drm_panthor_perf_block_type type = blk->header.block_type;
>> +		unsigned long *blk_em = session->enabled_counters->mask[type];
>> +
>> +		bitmap_from_arr64(em_diff, blk->header.enable_mask, PANTHOR_PERF_EM_BITS);
>> +
>> +		bitmap_andnot(em_diff, em_diff, blk_em, PANTHOR_PERF_EM_BITS);
>> +		bitmap_clear(em_diff, 0, PANTHOR_HEADER_COUNTERS);
>> +
>> +		blk->counters[PANTHOR_CTR_PRFCNT_EN] = compress_enable_mask(blk_em);
>> +
>> +		for_each_set_bit(ctr_idx, em_diff, PANTHOR_PERF_EM_BITS)
>> +			blk->counters[ctr_idx] = 0;
>> +
>> +		bitmap_to_arr64(&blk->header.enable_mask, blk_em, PANTHOR_PERF_EM_BITS);
> 
> I'm wondering about the need to do this (writing the session enablement mask into the block header)
> since we're already zeroing out the unrequested counters and also UM knows it.
> 

This handles multiple sessions with different enable masks, where the UM must not know the enable
masks of other sessions.

>> +	}
>> +}
>> +
>> +static int session_copy_sample(struct panthor_device *ptdev, struct panthor_perf_session *session)
>> +{
>> +	struct panthor_perf *perf = ptdev->perf;
>> +	const size_t sample_size = session_get_user_sample_size(&ptdev->perf_info);
>> +	const u64 insert_idx = session_read_insert_idx(session);
>> +	const u64 extract_idx = session_read_extract_idx(session);
>> +	u8 *new_sample;
>> +
>> +	if (!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots))
>> +		return -ENOSPC;
>> +
>> +	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_INITIAL)
>> +		return 0;
>> +
>> +	new_sample = session->samples + insert_idx * sample_size;
>> +
>> +	if (session->accum_idx != insert_idx) {
>> +		session_populate_sample(ptdev, session, new_sample, perf->sampler.sample);
>> +		session->accum_idx = insert_idx;
>> +	} else
>> +		session_accumulate_sample(ptdev, session, new_sample, perf->sampler.sample);
>> +
>> +	return 0;
>> +}
>> +
>> +static void session_emit_sample(struct panthor_perf_session *session)
>> +{
>> +	const u64 insert_idx = session_read_insert_idx(session);
>> +	const enum session_sample_type type = READ_ONCE(session->pending_sample_request);
>> +
>> +	if (type == SAMPLE_TYPE_INITIAL || type == SAMPLE_TYPE_NONE)
>> +		goto reset_sample_request;
>> +
>> +	session_write_insert_idx(session, (insert_idx + 1) % session->ringbuf_slots);
>> +
>> +	/* Since we are about to notify userspace, we must ensure that all changes to memory
>> +	 * are visible.
>> +	 */
>> +	wmb();
>> +
>> +	eventfd_signal(session->eventfd);
>> +
>> +reset_sample_request:
>> +	WRITE_ONCE(session->pending_sample_request, SAMPLE_TYPE_NONE);
>> +}
>> +
>> +#define PRFCNT_IRQS (GLB_PERFCNT_OVERFLOW | GLB_PERFCNT_SAMPLE | GLB_PERFCNT_THRESHOLD)
>> +
>> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status)
>> +{
>> +	struct panthor_perf *const perf = ptdev->perf;
>> +	struct panthor_perf_sampler *sampler;
>> +	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
>> +	bool sample_requested;
>> +
>> +	if (!(status & JOB_INT_GLOBAL_IF))
>> +		return;
>> +
>> +	if (!perf)
>> +		return;
>> +
>> +	sampler = &perf->sampler;
>> +
>> +	const u32 ack = READ_ONCE(glb_iface->output->ack);
>> +	const u32 req = READ_ONCE(glb_iface->input->req);
>> +
>> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock)
>> +		sample_requested = sampler->sample_requested;
>> +
>> +
>> +	/*
>> +	 * TODO Fix up the error handling for overflow. Currently, the user is unblocked
>> +	 * with a completely empty sample, whic is not the intended behaviour.
>> +	 */
>> +	if (drm_WARN_ON_ONCE(&ptdev->base, (req ^ ack) & GLB_PERFCNT_OVERFLOW))
>> +		goto emit;
>> +
>> +	if ((sample_requested && (req & GLB_PERFCNT_SAMPLE) == (ack & GLB_PERFCNT_SAMPLE)) ||
>> +			((req ^ ack) & GLB_PERFCNT_THRESHOLD)) {
>> +		const u32 extract_idx = READ_ONCE(glb_iface->input->perfcnt_extract);
>> +		const u32 insert_idx = READ_ONCE(glb_iface->output->perfcnt_insert);
>> +
>> +		/* If the sample was requested around a reset, some time may be needed
>> +		 * for the FW interface to be updated, so we reschedule a sample
>> +		 * and return immediately.
>> +		 */
>> +		if (insert_idx == extract_idx) {
>> +			guard(spinlock_irqsave)(&sampler->pend_lock);
>> +			if (sampler->sample_requested)
>> +				panthor_perf_fw_request_sample(sampler);
>> +
>> +			return;
>> +		}
>> +
>> +		WRITE_ONCE(glb_iface->input->perfcnt_extract,
>> +			   panthor_perf_handle_sample(ptdev, extract_idx, insert_idx));
> 
> Here you'd always be writing insert_idx into glb_iface->input->perfcnt_extract,
> so is it really necessary to let panthor_perf_handle_sample return it?
> 

I had originally written it this way to have more flexibility in not immediately 
handling some samples in the FW ring buffer, but since this functionality is not 
being used, it can be removed.

>> +	}
>> +
>> +	scoped_guard(mutex, &sampler->sampler_lock)
>> +	{
>> +		struct list_head *pos;
>> +
>> +		list_for_each(pos, &sampler->session_list) {
>> +			struct panthor_perf_session *session = list_entry(pos,
>> +					struct panthor_perf_session, sessions);
>> +
>> +			session_copy_sample(ptdev, session);
>> +		}
>> +	}
>> +
>> +emit:
>> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock) {
>> +		struct list_head *pos, *tmp;
>> +
>> +		list_for_each_safe(pos, tmp, &sampler->pending_samples) {
>> +			struct panthor_perf_session *session = list_entry(pos,
>> +					struct panthor_perf_session, pending);
>> +
>> +			session_emit_sample(session);
>> +			list_del(pos);
>> +			session_put(session);
>> +		}
>> +
>> +		sampler->sample_requested = false;
>> +	}
>> +
>> +	memset(sampler->sample, 0, session_get_user_sample_size(&ptdev->perf_info));
> 
> I wonder why we'd want to zero out the intermediate sample buffer, since we don't need to do
> that to tell the hardware that the FW sample was consumed (that is done in the FW ringbuffer),
> and also it'll be overwritten next time a sample is produced by the FW. However, next time
> there's an irq notification for a sample, it turns out that session->accum_idx == insert_idx,
> perhaps we could defer the zero'ing out until then? Alternatively, adding a field to the
> sample header in the sampler->sample buffer that would tell us if it needs to be overwritten
> in the next occurrence of a copy might be enough?
> 

There is no architectural reason to do this here, but in my mind, it simplifies re-use of the 
buffer. We can't use the accum_idx to determine when to zero it, because at that point, it 
would already be too late, so we would have to move it back to right before the sample 
handling. Considering the single UM session case without any set re-configurations in
between, we may be able to get away without zeroing it at all. At the same time, we would 
then have to be careful about how this interacts with the secondary and tertiary sets. If two 
subsequent sessions choose different sets, it's simpler to ensure that the buffer 
is always zeroed rather than tracking under what conditions we can skip the memset. 

>> +	complete(&sampler->sample_handled);
>> +}
>> +
>> +static int panthor_perf_sampler_init(struct panthor_perf_sampler *sampler,
>> +				     struct panthor_device *ptdev)
>> +{
>> +	struct panthor_kernel_bo *bo;
>> +	u8 *sample;
>> +	int ret;
>> +
>> +	ret = panthor_perf_setup_fw_buffer_desc(ptdev, sampler);
>> +	if (ret) {
>> +		drm_err(&ptdev->base,
>> +			"Failed to setup descriptor for FW ring buffer, err = %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	bo = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
>> +				      sampler->desc.buffer_size * perf_ringbuf_slots,
>> +				      DRM_PANTHOR_BO_NO_MMAP,
>> +				      DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC |
>> +				      DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED,
>> +				      PANTHOR_VM_KERNEL_AUTO_VA);
>> +
>> +	if (IS_ERR_OR_NULL(bo))
>> +		return IS_ERR(bo) ? PTR_ERR(bo) : -ENOMEM;
>> +
>> +	ret = panthor_kernel_bo_vmap(bo);
>> +	if (ret)
>> +		goto cleanup_bo;
>> +
>> +	sample = kzalloc(session_get_user_sample_size(&ptdev->perf_info), GFP_KERNEL);
>> +	if (ZERO_OR_NULL_PTR(sample)) {
>> +		ret = -ENOMEM;
>> +		goto cleanup_vmap;
>> +	}
>> +
>> +	sampler->rb = bo;
>> +	sampler->sample = sample;
>> +	sampler->sample_slots = perf_ringbuf_slots;
>> +	sampler->em = kzalloc(sizeof(*sampler->em), GFP_KERNEL);
>> +
>> +	mutex_init(&sampler->sampler_lock);
>> +	spin_lock_init(&sampler->pend_lock);
>> +	INIT_LIST_HEAD(&sampler->session_list);
>> +	INIT_LIST_HEAD(&sampler->pending_samples);
>> +	init_completion(&sampler->sample_handled);
>> +
>> +	sampler->ptdev = ptdev;
>> +
>> +	return 0;
>> +
>> +cleanup_vmap:
>> +	panthor_kernel_bo_vunmap(bo);
>> +
>> +cleanup_bo:
>> +	panthor_kernel_bo_destroy(bo);
>> +
>> +	return ret;
>> +}
>> +
>> +static void panthor_perf_sampler_term(struct panthor_perf_sampler *sampler)
>> +{
>> +	int ret;
>> +	bool requested;
>> +
>> +	scoped_guard(spinlock_irqsave, &sampler->pend_lock)
>> +		requested = sampler->sample_requested;
>> +
>> +	if (requested)
>> +		wait_for_completion_killable(&sampler->sample_handled);
>> +
>> +	panthor_perf_fw_write_config(sampler, &(struct panthor_perf_enable_masks){});
> 
> When you remove a session, you first call 'panthor_perf_em_zero(sampler->em);'
> and then compose a new global sampler enablement mask with the OR'd bitmap
> of the different sessions' enablement masks. But if there are no sessions
> left, you're guaranteed that here sampler->em will be all zeros,
> so you can just do 'panthor_perf_fw_write_sampler_config(sampler)' and
> inline the definition of 'panthor_perf_fw_write_config()' into it
> 

Hadn't spotted that, thank you. 

>> +
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		drm_warn_once(&sampler->ptdev->base, "Sampler termination failed, ret = %d", ret);
>> +
>> +	kfree(sampler->sample);
>> +
>> +	panthor_kernel_bo_destroy(sampler->rb);
>> +}
>> +
>> +static int panthor_perf_sampler_add(struct panthor_perf_sampler *sampler,
>> +				    struct panthor_perf_session *session, u8 set)
>> +{
>> +	int ret = 0;
>> +	struct panthor_perf_enable_masks *session_em = session->enabled_counters;
>> +
>> +	guard(mutex)(&sampler->sampler_lock);
>> +
>> +	/* Early check for whether a new set can be configured. */
>> +	if (!atomic_read(&sampler->enabled_clients))
>> +		sampler->set_config = set;
>> +	else
>> +		if (sampler->set_config != set)
>> +			return -EBUSY;
>> +
>> +	panthor_perf_em_add(sampler->em, session_em);
>> +	ret = pm_runtime_resume_and_get(sampler->ptdev->base.dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (atomic_read(&sampler->enabled_clients)) {
>> +		ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	panthor_perf_fw_write_sampler_config(sampler);
>> +
>> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	session_get(session);
>> +	list_add_tail(&session->sessions, &sampler->session_list);
>> +	atomic_inc(&sampler->enabled_clients);
>> +
>> +	return 0;
>> +}
>> +
>> +static int panthor_perf_sampler_remove_session(struct panthor_perf_sampler *sampler,
>> +					       struct panthor_perf_session *session)
>> +{
>> +	int ret;
>> +	struct list_head *snode;
>> +
>> +	guard(mutex)(&sampler->sampler_lock);
>> +
>> +	list_del_init(&session->sessions);
>> +	session_put(session);
>> +
>> +	panthor_perf_em_zero(sampler->em);
>> +	list_for_each(snode, &sampler->session_list)
>> +	{
>> +		struct panthor_perf_session *session =
>> +			container_of(snode, typeof(*session), sessions);
>> +
>> +		panthor_perf_em_add(sampler->em, session->enabled_counters);
>> +	}
>> +
>> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	atomic_dec(&sampler->enabled_clients);
>> +	pm_runtime_put_sync(sampler->ptdev->base.dev);
>> +
>> +	panthor_perf_fw_write_sampler_config(sampler);
>> +
>> +	if (atomic_read(&sampler->enabled_clients))
>> +		return panthor_perf_fw_start_sampling(sampler->Ptdev);
>> +	return 0;
>> +}
>> +
>>  /**
>>   * panthor_perf_init - Initialize the performance counter subsystem.
>>   * @ptdev: Panthor device
>> @@ -382,6 +1352,10 @@ int panthor_perf_init(struct panthor_device *ptdev)
>>  		.max = 1,
>>  	};
>>
>> +	ret = panthor_perf_sampler_init(&perf->sampler, ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	drm_info(&ptdev->base, "Performance counter subsystem initialized");
>>
>>  	ptdev->perf = no_free_ptr(perf);
>> @@ -389,6 +1363,69 @@ int panthor_perf_init(struct panthor_device *ptdev)
>>  	return ret;
>>  }
>>
>> +static int sampler_request(struct panthor_perf_sampler *sampler,
>> +			   struct panthor_perf_session *session, enum session_sample_type type)
>> +{
>> +	guard(spinlock_irqsave)(&sampler->pend_lock);
> 
> You're extending the lock to the entire function, but the only time you
> modify the pending_samples list is after getting the session, so why not
> just limit the critical section to that statement?
> 

No good reason to do so, will reduce the scope. 

>> +
>> +	/*
>> +	 * If a previous sample has not been handled yet, the session cannot request another
>> +	 * sample. If this happens too often, the requested sample rate is too high.
>> +	 */
>> +	if (READ_ONCE(session->pending_sample_request) != SAMPLE_TYPE_NONE)
>> +		return -EBUSY;
>> +
>> +	WRITE_ONCE(session->pending_sample_request, type);
>> +	session_get(session);
> 
> Why do we increase the rfcnt for the session here?
> Is it because someone might try to tear the session down while a sample
> is being waited for?

That's the idea. 

> I think, in that case the sample processing logic can determine no
> sessions might be left and then refuse to copy the FW sample.

I think we can run into a race around the UM calling a stop sample 
and a teardown simultaneously. If we hold the refcount throughout the 
sampling operation, then this never occurs.

>> +	list_add_tail(&session->pending, &sampler->pending_samples);
>> +
>> +	if (!sampler->sample_requested) {
>> +		reinit_completion(&sampler->sample_handled);
>> +		sampler->sample_requested = true;
>> +		panthor_perf_fw_request_sample(sampler);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * panthor_perf_sampler_request_initial - Request an initial sample.
>> + * @sampler: Panthor sampler
>> + * @session: Target session
>> + *
>> + * Perform a synchronous sample that gets immediately discarded. This sets a baseline at the point
>> + * of time a new session is started, to avoid having counters from before the session.
>> + */
>> +static int panthor_perf_sampler_request_initial(struct panthor_perf_sampler *sampler,
>> +						struct panthor_perf_session *session)
>> +{
>> +	int ret = sampler_request(sampler, session, SAMPLE_TYPE_INITIAL);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	return wait_for_completion_timeout(&sampler->sample_handled,
>> +			msecs_to_jiffies(1000));
>> +}
>> +
>> +/**
>> + * panthor_perf_sampler_request_sample - Request a counter sample for the userspace client.
>> + * @sampler: Panthor sampler
>> + * @session: Target session
>> + *
>> + * A session that has already requested a sample cannot request another one until the previous
>> + * sample has been delivered.
>> + *
>> + * Return:
>> + * * %0       - The sample has been requested successfully.
>> + * * %-EBUSY  - The target session has already requested a sample and has not received it yet.
>> + */
>> +static int panthor_perf_sampler_request_sample(struct panthor_perf_sampler *sampler,
>> +					       struct panthor_perf_session *session)
>> +{
>> +	return sampler_request(sampler, session, SAMPLE_TYPE_REGULAR);
>> +}
>> +
>>  static int session_validate_set(u8 set)
>>  {
>>  	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
>> @@ -417,8 +1454,8 @@ static int session_validate_set(u8 set)
>>   * Return: non-negative session identifier on success or negative error code on failure.
>>   */
>>  int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
>> -		struct drm_panthor_perf_cmd_setup *setup_args,
>> -		struct panthor_file *pfile)
>> +			       struct drm_panthor_perf_cmd_setup *setup_args,
>> +			       struct panthor_file *pfile)
>>  {
>>  	struct panthor_perf_session *session;
>>  	struct drm_gem_object *ringbuffer;
>> @@ -510,6 +1547,10 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
>>  	kref_init(&session->ref);
>>  	session->enabled_counters = em;
>>
>> +	ret = panthor_perf_sampler_add(&perf->sampler, session, setup_args->block_set);
>> +	if (ret)
>> +		goto cleanup_xa_alloc;
>> +
>>  	session->sample_freq_ns = setup_args->sample_freq_ns;
>>  	session->user_sample_size = user_sample_size;
>>  	session->ring_buf = ringbuffer;
>> @@ -520,6 +1561,9 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
>>
>>  	return session_id;
>>
>> +cleanup_xa_alloc:
>> +	xa_store(&perf->sessions, session_id, NULL, GFP_KERNEL);
>> +
>>  cleanup_em:
>>  	kfree(em);
>>
>> @@ -545,8 +1589,10 @@ int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf
>>  }
>>
>>  static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
>> -		u64 user_data)
>> +			u64 user_data)
> 
> You've changed the indentation of a few function headers in this
> commit. It's best to fix it in the original one right away.
> 

Agreed, sorry for the noise!

>>  {
>> +	int ret;
>> +
>>  	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>>  		return 0;
>>
>> @@ -559,14 +1605,17 @@ static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *
>>
>>  	session->user_data = user_data;
>>
>> +	ret = panthor_perf_sampler_request_sample(&perf->sampler, session);
>> +	if (ret)
>> +		return ret;
>> +
>>  	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
>>
>> -	/* TODO Calls to the FW interface will go here in later patches. */
>>  	return 0;
>>  }
>>
>>  static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
>> -		u64 user_data)
>> +			 u64 user_data)
>>  {
>>  	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>>  		return 0;
>> @@ -580,12 +1629,11 @@ static int session_start(struct panthor_perf *perf, struct panthor_perf_session
>>  	if (session->sample_freq_ns)
>>  		session->user_data = user_data;
>>
>> -	/* TODO Calls to the FW interface will go here in later patches. */
>> -	return 0;
>> +	return panthor_perf_sampler_request_initial(&perf->sampler, session);
>>  }
>>
>>  static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
>> -		u64 user_data)
>> +			  u64 user_data)
>>  {
>>  	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
>>  		return 0;
>> @@ -608,14 +1656,16 @@ static int session_sample(struct panthor_perf *perf, struct panthor_perf_session
>>  	session->sample_start_ns = ktime_get_raw_ns();
>>  	session->user_data = user_data;
>>
>> -	return 0;
>> +	return panthor_perf_sampler_request_sample(&perf->sampler, session);
>>  }
>>
>>  static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
>>  {
>> +	int ret = panthor_perf_sampler_remove_session(&perf->sampler, session);
>> +
>>  	session_put(session);
>>
>> -	return 0;
>> +	return ret;
>>  }
>>
>>  static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
>> @@ -691,7 +1741,7 @@ int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_per
>>   * Return: 0 on success, negative error code on failure.
>>   */
>>  int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid, u64 user_data)
>> +			       u32 sid, u64 user_data)
>>  {
>>  	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>>  	int err;
>> @@ -724,7 +1774,7 @@ int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *
>>   * Return: 0 on success, negative error code on failure.
>>   */
>>  int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid, u64 user_data)
>> +			      u32 sid, u64 user_data)
>>  {
>>  	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>>  	int err;
>> @@ -755,7 +1805,7 @@ int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *p
>>   * Return: 0 on success, negative error code on failure.
>>   */
>>  int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
>> -		u32 sid, u64 user_data)
>> +				u32 sid, u64 user_data)
>>  {
>>  	struct panthor_perf_session *session = session_find(pfile, perf, sid);
>>  	int err;
>> @@ -822,6 +1872,8 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>>
>>  	xa_destroy(&perf->sessions);
>>
>> +	panthor_perf_sampler_term(&perf->sampler);
>> +
>>  	kfree(ptdev->perf);
>>
>>  	ptdev->perf = NULL;
>> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
>> index 89d61cd1f017..c482198b6fbd 100644
>> --- a/drivers/gpu/drm/panthor/panthor_perf.h
>> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
>> @@ -28,5 +28,7 @@ int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf
>>  		u32 sid, u64 user_data);
>>  void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
>>
>> +void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
>> +
>>  #endif /* __PANTHOR_PERF_H__ */
>>
>> --
>> 2.33.0.dirty
> 
> 
> Adrian Larumbe


