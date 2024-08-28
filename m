Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88A596265A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 13:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACB010E481;
	Wed, 28 Aug 2024 11:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="g4nq0lHx";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g4nq0lHx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2047.outbound.protection.outlook.com [40.107.20.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BD110E478
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 11:50:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uOITBXU70sFNx8Ut3mAJq8MrNwnIgVAAoaj9/wi6zmm4SVQtsGcMxlzFjsigVLiW5di/CHnJ5ODYhqfOxxaeoual1mq4x1JIIClmr2c5v0FHkHwqPC13fRsMwSn4hzEdUbcJ3qO9Dyr9JOkt6A5USHpsB1Ry6eGyN6YCwKzWk143H7ZPRrK9RhaOmUGPjWpTujz5iTHD8tzAc/GKW5lsi3fjENTLCA/iXBqZsfgLkOF/kULAxMdTcBbr2Bq7Avi/dWpE4V5e6kQsUN6imz0PMHMSlWYE/FGQI2gJoHzxdfFBbSaiwxPYZNBjpu4Jw7BLTdR5Z9C1aAYdPTAiV1qATA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxrUs/5E/QobLjcEurY4bLabW4bcaN36q8hYEqVGdxQ=;
 b=sxTActSXxKJHvv6W234ICm8ECFuQgfx4QqHwvrCPJCDhJVl2XajtJ/BIzxK/rQ66PEOfGMzcVSeg6eU46tFCZM92iIlPN41L1xnIZmr5FbgqgRKFVI6vg1nKwaiokhsAkMAXkcHdqPWREdlnuZhZLUP/RxTbbZAl4Z17A7VWt58s80FupJw2QUmfQXsQv9/HtN837mHAMJgfoaf7m578ltvxdk6fZFFJi6VcvIFezBOMCHyMAPOZ2+U40QGdGT87mVUB/xN+6ycyy8zrXTRWis2aZIIu+WVud0UZUsFtunwwc4JiNY3mMhjJ/chAeBDZVfKPolH2VjO0NNDjV6YzFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxrUs/5E/QobLjcEurY4bLabW4bcaN36q8hYEqVGdxQ=;
 b=g4nq0lHxpHLPDlqwQo1UfATx8F0RWX64EL/R1trncCfohDUznmyc4Y6c1G+uz0agKAAQ+TmMaT1tfsAe8Ze3rS34y/iyRMyWQj1nXD0bkNysBG901v5xzosqMQpOpTT0De3lFYymklvboXp0c4t/5AP8ol+WZF0FceBily0/xGI=
Received: from AS8PR07CA0030.eurprd07.prod.outlook.com (2603:10a6:20b:451::9)
 by GV1PR08MB7900.eurprd08.prod.outlook.com (2603:10a6:150:5f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14; Wed, 28 Aug
 2024 11:50:50 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:451:cafe::b1) by AS8PR07CA0030.outlook.office365.com
 (2603:10a6:20b:451::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19 via Frontend
 Transport; Wed, 28 Aug 2024 11:50:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 28 Aug 2024 11:50:50 +0000
Received: ("Tessian outbound 8e666bd17457:v403");
 Wed, 28 Aug 2024 11:50:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d47d644ecabaaf3a
X-CR-MTA-TID: 64aa7808
Received: from L3a06678c8dab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 71C472BB-51C4-4872-A931-EB0ACABE24F6.1; 
 Wed, 28 Aug 2024 11:50:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3a06678c8dab.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Aug 2024 11:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPn2EBkGcuBa7V6Ihfg0pAbxcDQ04TO5H0Uv7GOB9ISp63vaZ51DRApJaRQpSfRakESkp1iaIKsVVdLPG8lP5+Pir3A8o5CzCB9SQpxhnQlziUxdNmp2EOjqFNyKnh8UuQwKknGCxCi8TV+k/38AHqDQ2oHhuWvsl/SG4XzqDeUUeEg6kdHrO2TkSiQGrEU5CWtzYOcnfWm+TtbVPKjXAHTkpWQ7hJHFo8P3NP2srnq6PyBabivMAel1iGwbWrFTviZ2uBw9KaQrTRTHRU1ybfUgkOVBAvp7sKxfqpnyxA8lV1TAASvQkD3DIuiHBdcFaDhv9GvjcJXN9cCaXKDggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxrUs/5E/QobLjcEurY4bLabW4bcaN36q8hYEqVGdxQ=;
 b=wB1whIiGvSCwcYyG6SIaANyMCRq1e3e1lJdfDzhRn3bvfUjemA51oySNzCZ66T33yyObB2Uf6K/Ara0d1UU6JgZP/huApbDqbSFlR4huhKq6kYYy77MHTqOUoY5zzbxq0LVSaq4MCYWGQYpu8sLfhMQw70FW++w70YpbrIjllFQPJANqnCeQOVxha3pdvU2ND4P4KnNEdRCXGPk+O+tZzZneW4iLYttOz3Y3YqT9/rMqITCGjaOBEf/elAg+/54zeMBW/BI7UzUnaaNLQi3AHdHIMA13bn8EbNpTlZiDk9xcsDv0y1zBg1yBAQUPo0TjO76nYGViI2vDPXSrLHBu5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxrUs/5E/QobLjcEurY4bLabW4bcaN36q8hYEqVGdxQ=;
 b=g4nq0lHxpHLPDlqwQo1UfATx8F0RWX64EL/R1trncCfohDUznmyc4Y6c1G+uz0agKAAQ+TmMaT1tfsAe8Ze3rS34y/iyRMyWQj1nXD0bkNysBG901v5xzosqMQpOpTT0De3lFYymklvboXp0c4t/5AP8ol+WZF0FceBily0/xGI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 by AS2PR08MB8286.eurprd08.prod.outlook.com (2603:10a6:20b:555::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.12; Wed, 28 Aug
 2024 11:50:41 +0000
Received: from AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c]) by AS8PR08MB6263.eurprd08.prod.outlook.com
 ([fe80::12b5:3f0a:2090:fa7c%7]) with mapi id 15.20.7918.012; Wed, 28 Aug 2024
 11:50:41 +0000
Message-ID: <b3522d39-89c9-44cc-b5cf-0c31c1b30e00@arm.com>
Date: Wed, 28 Aug 2024 12:50:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Mary Guillemard <mary.guillemard@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel@collabora.com,
 Christopher Healy <healych@amazon.com>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240819112508.67988-2-mary.guillemard@collabora.com>
 <20240828133042.4b731826@collabora.com>
Content-Language: en-US
From: Mihail Atanassov <mihail.atanassov@arm.com>
In-Reply-To: <20240828133042.4b731826@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0033.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::21)
 To AS8PR08MB6263.eurprd08.prod.outlook.com
 (2603:10a6:20b:290::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6263:EE_|AS2PR08MB8286:EE_|AM4PEPF00027A5F:EE_|GV1PR08MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 90e4cdd1-e7a1-476f-89f2-08dcc757a9d9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YjczSS9sWmJ4QXU1OWFMVlV0TDNvSFpOTWNad3daUzRFTW1LeDM1RGhiOWNF?=
 =?utf-8?B?VzhGRGdweVhHYkZSUU1mS2VYTmEvM084TGw2Y1FvQkdsNnR1eC91SmFrK2Jp?=
 =?utf-8?B?Tklpc0t5ZkQvNno3TjBsVmtMMFd4a3lnSTg1U0JrQWc0QitVN1ZHS2FEVzVy?=
 =?utf-8?B?ZHVqVEsxcEoyT2lQK2NnaUVuSVRTNzdmVXo3cEZYUnNCWUVXeEhPeitRQnJh?=
 =?utf-8?B?WHpOcDFkSDlodHQ1WmVXYW1CYlVVTERlUHlGZTNQTGVjUmZ0dEhPMGZsT3pM?=
 =?utf-8?B?V0tFSVA5THl0elNUQTlNM0w1V3hPOEoxUmVmMTkrQWY4VnA2Q0ZFeGxOZkJ1?=
 =?utf-8?B?dW00UHdCaTJGZkVuYkRMUWRWTGNPejgraUFvZUtadEh5UG1zZ083bytVUUdX?=
 =?utf-8?B?eDIrcjNWeE1YUE4vT2MvcFdDOFBMdTZINVd5b0JIK2l3N0lDVVYrVFJEYzdh?=
 =?utf-8?B?VVBlV3dNTnowT1c2ajZFNWtDWFlyMGZYcEhza0tzVFVXNjh4SkVXVTYzaW5V?=
 =?utf-8?B?MXQ4eVk5dHNLZGgwanpDSDBkQlU1eEtxTXVaT2c2cmlCWGdqME9UNFZqK0x1?=
 =?utf-8?B?bkZsRENPRkV0aitxTzhLQXN3VVlBVkpEV3VIVktSbjk5MGhBWTN6Nlg4bGNI?=
 =?utf-8?B?b256MnIwUkwvWWVzK3Z6b3lRdUNnUzQvK1JPQkJtZVZpV0JwaXZxNVlMaCtp?=
 =?utf-8?B?Z2FZaUROaEFETThTVkVVNUF2bVNsQkVpbEk4SlVUVUZvYmxQYk1reXQ2ZS9r?=
 =?utf-8?B?b3FEZ0RLVFB3ZHBkcFhLTmlXTktIS0ZyV0RYejdvdUx2R0FjTTZGNDcxNzFG?=
 =?utf-8?B?NVg1a0kvbnBtSVF6N3dEczlDMk1GS2hpNjZJM0lFTTZIdm1rQ1JBWEFEd0NV?=
 =?utf-8?B?NlJ0ZHcxQmg3bGU0Wkd5S2ZSK3FINnVLRVpTK2lobHBXejJJRFlKR3RqTTJV?=
 =?utf-8?B?dHNSaGp0c1dnTWZjV013bHVrQjlRYlAxbDNaZkhKSUZLSVdZQUYramxKZkxF?=
 =?utf-8?B?ZTNpcFZkR3RJQWpOcFB5L3daclNPbTBKSjFETTQzamRLNllnVFE4Y0ZTd0hD?=
 =?utf-8?B?Ry9iVDZOQ2RQWTdiZEhOSmw2eG1xZVhheFQvci9IS09MM2pYUFBzcGtJYzdO?=
 =?utf-8?B?SmdaekN5OTdic0FKc0QreFpwZ2FxNU1zWVkxS1BzeUl2UGpEZ1ZiZ3RLeGVk?=
 =?utf-8?B?U2Nac1VpQlFQVkVITHk0UzJybFpEMk5vVEZyMXZ1eVNWTVo3dFg1c242M0Zr?=
 =?utf-8?B?Mk0zZmpySjJrOTVPVFFRSThWUHArODVERnJvMGdtTFpqN2R4RG84dlh2NXQ2?=
 =?utf-8?B?RFF1VUErVVhOVTBZWTZ5eUtpYVBBbSsrRWl0dzYyZEhoZURPcjM1RSs5bHR5?=
 =?utf-8?B?NTdrak8wMVhBU0JPWjhJR2FVUUF1QVRMb1dmM0FDSG4zeEdWUU9qQVpYNDF0?=
 =?utf-8?B?RVNIOFl3ZU1acHp6Y2NKR0pQS3k4dzFsUlJZbUdraTZndTNjNGgrdmpsNzln?=
 =?utf-8?B?SmQzNDNSYXZnNHRVUlZjZmNhRGF1V1FyS2syWXgwOEFzOENBbnkxY0U5K1lL?=
 =?utf-8?B?WlA5RHF1b1ZzU0djaVZtT3lKbEF2Z1M0QjIvQjV0VUE4REJXdjBycG15NG5M?=
 =?utf-8?B?dzk1S2ZubmpVcDJ3NElhN28yaEU3TGNOR3F2OUJheG9vNEJ3WlJ6MjRWS21C?=
 =?utf-8?B?Q2M1UWRWTWxUMlY0akdmMUQ3bkYweTJJcFNIdWszeUpKLzZLYjlZNFZoM2tX?=
 =?utf-8?B?VVpITnkyU2dIMlRGcGxGK01FNklVQjRYU0dFQ0pCNmp6TTNmVnByNnFPbE9M?=
 =?utf-8?B?Tk5VSURuRVBJZm9nc3lIdz09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS8PR08MB6263.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:290::9];
 domain=AS8PR08MB6263.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3eba8f0e-38c9-42dc-03a9-08dcc757a410
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|35042699022; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2hOTlNDOG8ranZjTTFOVWViVGZaeGJFV29FOXo0RmxKWDM3Zm9oSHFQYjhU?=
 =?utf-8?B?NlZKT01vSk9nZGVOZWo4WWYvRGNpVGV2amN2VEZ4TXlwcTdJUnJtUklYVjFX?=
 =?utf-8?B?SWtkdmhsQ0E3OWgyR1lDTUwwU0tjY1pydWt5eXdqeGlQNk0rZ2lLUUFCWVNC?=
 =?utf-8?B?ZnppR0ZHRTRwZDI2NjVVNVNuVGFWWDJRY1JoYmY0cmxaT3c4M296c3Rjc2Ex?=
 =?utf-8?B?UCtsV1NuL1VWYjhtcnNEbXZZOXJsMC9TTEJnWTVXcmxLVG5XOEFMQk52NUk2?=
 =?utf-8?B?UUdhQlVkdUw1eUV6SU91WmdTY0NpWVpTREZBeWcwK3pLbkRiL3dhLzc2Z3Bl?=
 =?utf-8?B?RnFqeUE0bC94TlFsK1BvTmx5RW82QUt3SVJXWndnUndyY0dsOUhFZzJTQ0Vk?=
 =?utf-8?B?S0RWOFFNZUNVZTk0eHowSmZNTUNuazlxUjgra1I1MmhQZk9wdDRxd1h3dk9G?=
 =?utf-8?B?SkFXQXh1dTVWUzh3eTdGWFF3aUhrWFFqUWdUZXV1K3plbU55cG5iUWNlZXdD?=
 =?utf-8?B?OXRlc1JrcnpkeWpZR1A3bjVvVWwwK3IyaHhTU2c5YlFGV0ZnekFIM3VFODNU?=
 =?utf-8?B?aXVRa0wwdTRYR2ZEbkVnQzFSZmZtb29Ia1pBalU0M25XMkFkWXEvRXJrcWpD?=
 =?utf-8?B?SnpPVFpzbjhOaElzUUhZMExNakV5MW8wS0ZnVkI2MGxJV0pnc1FqeFdDbWxr?=
 =?utf-8?B?emNkWnJ3dzZKU01QR0ZFVzdYT1BUV1FlZTEzWGp4cmtqRUxTMDg3cnIvT0hq?=
 =?utf-8?B?aEg5VWU0QU5MR1FkNGJBblNVaWtDRVpxRkRtenp2WEhPVFZUNFora3IyRk1E?=
 =?utf-8?B?VUpqeVhQSm5VbmErdytkZ3EyYnpSeUxwcytNSnBrQUZ1UXc5Y1UwcUttbWpE?=
 =?utf-8?B?UEtxaEF1SFpRWHBndURKVFJLMWNQVENMV21zWnhCdjRRMUZMYzczbjFaWmFY?=
 =?utf-8?B?MW44QUdUS1pVMXdBTnBMS0VLRmNVcmZPKzZtL1VkUkdsYWpLdndsTTJvdjZj?=
 =?utf-8?B?ZXh6dUNKMVk2Si8vaTkyUkoybThFQmZQOUFqOG1LeitlL2ducWFxaTZqeW1r?=
 =?utf-8?B?bzVlMlZaTjBZS0hELzdCOU55NlBCc05kZXR6RXJBK085M0NDQWZrYTFSUkNG?=
 =?utf-8?B?MUQydndFSTVncjJMVU8vQk5FMGxoRVNwUVNCZzVaeWh0K1dRUEFlTUxuR2lI?=
 =?utf-8?B?eWVoQ245N3EwTFRYTko0Q0VzSHZKUHRpZXorcnVadmVPUDBUZlZhT3JabEJu?=
 =?utf-8?B?cXZ3bm5kL09TN2RkemhEY04zUXhTQlJkRzVtRm13L0ZHSlFPNnA4MHZ2blQw?=
 =?utf-8?B?Tk0yc0ppQmlkQ2hPN3lDelFOTW5zWnZQYisxRkxvV0pWUnN4ZjZoaU9Hd0s5?=
 =?utf-8?B?WWpUazFxRFdLMHRkYWgvTnltQkdTcnE2WmJTWHBDTDJXWEhrMkxidWg0RnZq?=
 =?utf-8?B?cGNkeGpXNFVzeERHdzZrcjBtZmxoQ0dxOHo0MXZjTDY1bUpHQUpRSXExNDcw?=
 =?utf-8?B?R3I2TUwvclNiYVhqQzMzUFhEcUVGWVRTeHhQSHc3aDZRU1h6L1JKMVlRT045?=
 =?utf-8?B?K29YSmwxd1NmVVFMd1ZEbVkzZkZVd1ZXSU5ieExVWkxpZXUxcnV4eE9uUlFC?=
 =?utf-8?B?RVlzOWFkY0xta0VMQkFXNmdvMXVJZUVob0lLYmFWWTMrbm1maVhVcGNPWnlK?=
 =?utf-8?B?Tk1FWHQ3WC9XekpXZTk5eC9Ybms4eDcxcm5KSFg5dWpzcThqanE0NU9ZcXE1?=
 =?utf-8?B?Mms2ajdBY0xHVXpTZGUyZEc0NkZLZ3VnRGhRVFNDNUxVdHRqbmV5UVZUTjV0?=
 =?utf-8?B?dEpSYnBrNW42S0FZSitxREpOajI3OXV3MEk4OUUxYzU2VkNBcXJmTmJJeExO?=
 =?utf-8?B?QkRSdlYvV2dOMVN0aVNyNHB4UVNOMkVqakVaOHZaSTkzb20rUDdJdlRqK1N2?=
 =?utf-8?Q?jH3O3Ifzh1RO21mmZ6CQgF4ADk0QsweN?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 11:50:50.4987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e4cdd1-e7a1-476f-89f2-08dcc757a9d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7900
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



On 28/08/2024 12:30, Boris Brezillon wrote:
> On Mon, 19 Aug 2024 13:25:08 +0200
> Mary Guillemard <mary.guillemard@collabora.com> wrote:
> 
>> +/**
>> + * struct drm_panthor_timestamp_info - Timestamp information
>> + *
>> + * Structure grouping all queryable information relating to the GPU timestamp.
>> + */
>> +struct drm_panthor_timestamp_info {
>> +	/** @timestamp_frequency: The frequency of the timestamp timer. */
>> +	__u64 timestamp_frequency;
>> +
>> +	/** @current_timestamp: The current timestamp. */
>> +	__u64 current_timestamp;
>> +
>> +	/** @timestamp_offset: The offset of the timestamp timer. */
>> +	__u64 timestamp_offset;
> 
> I'm not sure we should expose the offset to be honest. It looks like
> something that's related to suspend/resume which only the kernel needs
> to know.

Just for some context: it's necessary information to verify that the GPU 
timestamp correlates well with the CPU timestamp. It's untestable (in 
userspace) without the offset.

The struct can be extended later if really needed, so while I'd like to 
have the field stay, I'm not going to argue very hard against removing it.

> 
>> +};

-- 
Mihail Atanassov <mihail.atanassov@arm.com>

