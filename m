Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 408E3A3242B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 12:02:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FE610E84F;
	Wed, 12 Feb 2025 11:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="nroQu+x/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nroQu+x/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A8E10E84F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 11:02:45 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yHt8ArGWYmyymUKv9+DLnK3iKzoRQNrjuGV4dXb9OYF/M7oHEgdI5l3vYgRzM7rruB/NvJLM0i1YbFbOBNV9zCm+/CX4ABt8rX6wUcfL5Q0r0Iwr7anQf84WgWG8xG6ZOFFKAjFC7IIKyp6lAjb4kVA/I5GTB6eyJOkPc24f2v7bXaP/4Pwd0psSSfVhC1xI/sqkscOoSv2R2Z2adGeAu2UykuicmOGuQOuUxfnzZ/VBaONJcQeIQZv+tV4EUd/UBy3BSEZ9vCPVH1FvxmWOCjwAO6H2y8Li2W8AV43LOJEL0LyWIF2l05Yywd+ApuTbrxCF1D41/Oyrv9l1uZw+GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=IW0mPuK06E4ng8W7VuoqMUhsG3dW61C9NhF7uO5O0jbFlCTACjCTKn41XSUZkKmecizj95y/BUtu9h4cL4ecRZihNRJYo4zl/b5tSnNg+NxbyiT9DHJzjumP5cyA5EsHf7RToH7EoAOitUQrBXy1kOYdigPfd/eo4fJ+wjcAccOcaKr7fpkO4ZS1r5AEuHEgSGCuOuzsKe/8vO3UWnovA9giGHj6w19EJql6015o+OpKEh1qcrUS/Hj12nreOuGFKvNz0ilNb6Z9q9sx3dhk/Ty5JPDo129HIuw+1SUetBt7odYhWm//Kak3hJO8En2GDXiPoKDrTJgSRoLg6QNXTg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=nroQu+x/TA2OpWTyb+84W6NdMc5GBoBtvVhWvACHnyqyicZwB+ToUzj3mqKMSkXBjtBSFFA2Wt7edE2p4cRmCXsym/MeTqvTLkPvRB+F/j25zEsA6An4F+WUZ3/+aqiX2B7uRi1QKpaIL/MH2g5dy6iFKPiEzlcd0wsF+3LuIG0=
Received: from AM0PR02CA0211.eurprd02.prod.outlook.com (2603:10a6:20b:28f::18)
 by DB9PR08MB8459.eurprd08.prod.outlook.com (2603:10a6:10:3d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 11:02:37 +0000
Received: from AM3PEPF0000A78D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::7a) by AM0PR02CA0211.outlook.office365.com
 (2603:10a6:20b:28f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13 via Frontend Transport; Wed,
 12 Feb 2025 11:02:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78D.mail.protection.outlook.com (10.167.16.116) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Wed, 12 Feb 2025 11:02:37 +0000
Received: ("Tessian outbound b77899637302:v567");
 Wed, 12 Feb 2025 11:02:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: af1fad98ce884740
X-TessianGatewayMetadata: cjxJMYIdFIm1RAYDYHeThFIKxxel6JDLnkKIwapc6Qlbfl5A9drIjz2IsVxYbiRbzleSLZtqKiKwBPSJDpqO03WiqSS/3fAAL6dELtv8YdVWkvIUUCh3DMbvSDq2D1z+pnDppXBTQkpDBw2/Wxd5jubWMSXE8SOcZNi9BWYZvcM=
X-CR-MTA-TID: 64aa7808
Received: from L8579d43c2f8c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D69DE8BE-A08F-4C91-9B68-448EDF8DED3C.1; 
 Wed, 12 Feb 2025 11:02:25 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L8579d43c2f8c.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Feb 2025 11:02:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mME+wIeLFLHWvdRBdXD09eOqWvZpFNt4XNVem4eZNIX7mnCM6sluP/mq36gB9C9rXxVpDt4ZTeZku0Wl0kdqnzpwiWg+1cWxt1J5WTWx9yhw7nqC55vxzF20h0SMGkRhJuCP0jqs3rm+02JUFXpESeW/nW5hvEn41qSnGSmS5sWKWgK5GWi6p7F8v4EtxUwzXO0qfbupt8PS8Jai4FC6METlABVRx37WPhVNPvJ7NypGo7ipA34/r4Jeix///w5cLtpSzTX0f/jzV0EwUjGYLcDDo0+P8JyJGo+/wBcPStNovs9vcVOmTSB98FtH2FZZPzZUEOPnGomLlyFSQ35peg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=JXMkjPwv8gTJxbqwFjag+8WYxcJxhuudmtTmX4AGNf1xD8HvN7tWtQLNpZ3HN/eZ9lNOxo2VA6Gs6svS8OUWqObFjgZTua7qUB0kPZafEGib+U8nQYpAEOb13g9+zLjBHjOUBpqksnxNdInD6ONh6I5CioeY3hnR7HJi3SI3AuDkYn6D7EE9bFUADhPU7iwUj3WDIU0W2GN9NThOOn/pPFyXY2rWVpmk0PnU8zwKVEA37DaK+2AMkbvwrInu0dim9fzbbGJCWFXuzS2kqxwkfCAhb67rbGIRtQc58EeXgnG5OF/p14S2LToX7YocLzKM1zCsM4E9/qze+H0ChpgWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLVXhL4OhcP6A4zXjAOzZ6HhUQX4O5UNGHUk1/WRr6g=;
 b=nroQu+x/TA2OpWTyb+84W6NdMc5GBoBtvVhWvACHnyqyicZwB+ToUzj3mqKMSkXBjtBSFFA2Wt7edE2p4cRmCXsym/MeTqvTLkPvRB+F/j25zEsA6An4F+WUZ3/+aqiX2B7uRi1QKpaIL/MH2g5dy6iFKPiEzlcd0wsF+3LuIG0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 by AM8PR08MB6530.eurprd08.prod.outlook.com (2603:10a6:20b:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 11:02:23 +0000
Received: from AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7]) by AS4PR08MB7925.eurprd08.prod.outlook.com
 ([fe80::8ef3:b027:e22f:1ea7%4]) with mapi id 15.20.8445.011; Wed, 12 Feb 2025
 11:02:23 +0000
Message-ID: <96136918-fd44-493a-bac5-b4493f6c0d71@arm.com>
Date: Wed, 12 Feb 2025 11:02:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
 <ats2unrml5a7vbpdrqrzowodrsfj44bnubpbujg2igk3imeklx@nrpmg5oeq3gz>
 <be8e6b9f-c3c6-41d1-af9c-3dcd102f0fe3@arm.com>
 <b02711c901e8acf2bc47926919de7673a0cb0b98.camel@ndufresne.ca>
 <fae8df2a-3e47-4266-aace-392c5f37581f@arm.com>
 <20250212-naughty-chipmunk-of-potency-7e0ced@houat>
 <8ee8e684-0164-4e70-b42e-3827c7885685@arm.com>
 <20250212-sweet-nano-penguin-e85e7d@houat>
From: Florent Tomasin <florent.tomasin@arm.com>
In-Reply-To: <20250212-sweet-nano-penguin-e85e7d@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::13) To AS4PR08MB7925.eurprd08.prod.outlook.com
 (2603:10a6:20b:574::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS4PR08MB7925:EE_|AM8PR08MB6530:EE_|AM3PEPF0000A78D:EE_|DB9PR08MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ff5db89-bbc6-45da-af6e-08dd4b54c2aa
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?SjV1VGY4MW4vM3FYWjdNOGNxZUduSTBoSzFGZVNVazhFQmcxcW9hSnNDRVMy?=
 =?utf-8?B?OVJlWVZxZkRjOFVJOHYwR3BNVmhTWkpTeVRpSTdsekxDclA2OXVHek1LaVAz?=
 =?utf-8?B?a1EvRTFjUDJBN0k0RjNaOUtzaUdrK0xPMmRHUllKOGFFVlJKTjBNWi9jcXhW?=
 =?utf-8?B?MW9tNmdSYjFhV05Qei9rb3hmTXdEYUZGQy9JaXBOS2ttNEhpRVJ2ektaclhE?=
 =?utf-8?B?L1E3ZERFZWc3NGtzekxvMWxrcEdGYkxoU1BWc3BadVdVOFI3UjBLeEF2N25x?=
 =?utf-8?B?U2VDU0RpQmw4TFlYZW1JYm9CcmtLVndIYWZLYXF6d3BxcDVSbWloYWlhRlZ3?=
 =?utf-8?B?M2pJZ2hGV3FDcUFCNEc1VWZFZDNXdk1QL0tOZjhYeUhwejQ1eE9YcUV0NDFu?=
 =?utf-8?B?dkZENklEK2JaNXhxaGZNN3h4aTd5cnpLWlRNWkwxWmxWdnBlaHJWNUxYYnFZ?=
 =?utf-8?B?dnBxRE50b0luUXU3K0ZlZzVRNTJvTHZGcGJlVHBZZTNCeXVVT0FQL2h6MWpx?=
 =?utf-8?B?ZVZWR1JXbDE1UTZzd3VVdE5LZDRDeS9lYjVZWXBOVXM2SVptbXVBR1FCK3pY?=
 =?utf-8?B?U1dKVG0rZGo3eENtRWpNYStQQTZ3b29jMFhxS0RyNmptTzk1dTlKT2FqUGsw?=
 =?utf-8?B?aFZ0NlFhTU5yUnFvNk5yeENwMElZakI4V1JsOGZubklXcFdhcjVrRzhvUnNI?=
 =?utf-8?B?ZVF0cXRhLzFNWmE3ZG9Ka3pLbEEzcldQblg0VVEwUjRaajNBWFAvMUl6SE1a?=
 =?utf-8?B?Q3UxdXFQS1BVSlRxSng3ZEZDWkU4b0NyS0FieG5jalR0Zmw0eHhUL1VRWVk4?=
 =?utf-8?B?a0xhWW9lODZsOTd1UzYzRjV5OU5HM29xS3FZSnVoakZMNHNPU2VxcDNhQVU5?=
 =?utf-8?B?ZFA4U2p0K3NiN3NtUWM1QXZBK29LdmwrdUtlVk9SbGhnU0t4UkV2bmpQb1dV?=
 =?utf-8?B?eERwais3ZkREUXhwcHI0b1doN3Yxa2dQRndPTU1ZQnRYQk11azZQQVlSMFBz?=
 =?utf-8?B?SWxENkdsUUdnbkF0Z0V0ZGJ2YS9OQ0FmRkwzNDBnNnJOc0tTVFpabDcvSDU2?=
 =?utf-8?B?M2ZlejNML1BGM0lVbHFEWGNVV0dobXoxY09jalozMUV0aXVhRVZpVEJJUkRh?=
 =?utf-8?B?OStqVVMzTVZsY0FJRWVaUTREQWJYc2l4TnBrLzVscVJ3REdlb0k4UVpjVjZI?=
 =?utf-8?B?eUxEcFcya2JkdUdlaEdVUXp4YjlJWUxEVmQzWUkvQ0RONVFxTFI2T3ZtTDNT?=
 =?utf-8?B?bkU0cXYyOE5mMUpsYVl1blpub3lRSGNuY2lQZGNTM0hJa0p0TWVUcFVnSEto?=
 =?utf-8?B?UVJIenVpYXl6eWhKT3QvVVBRcFdOanZOVHlRbGZKelhsLzE1ejJJZTlTVEYy?=
 =?utf-8?B?VTNoZFVIRy82Zkw2MlZnUkJINGlxdFlNNXJCMTJ2QnMrUmRpUVRYaFpvZXdn?=
 =?utf-8?B?THhJVmtwWmVtczVaWEVNazhGV2pNcExRVlRyUmdzUms4RFdIclVtSzRKNkt3?=
 =?utf-8?B?VXB3ZlRzcU1Cdzg4OVlycFdRdklxaE0xWENTSDdCUTR2WW5zT3Y1b2tQNU5G?=
 =?utf-8?B?aWdma1gxNFhYaE9zWGM5S2Nxa3hwcjlrbjVod0ovNlpaRDFtOWw4NFE4c1pO?=
 =?utf-8?B?cFp3U20xZ2Z6bms2Uk96S3dzMDBqTUtmaGRScVJsVjNNMzFYZ09RdFErOU0y?=
 =?utf-8?B?dnZEZkNuSTI4Yit4SFJKeWorUGpmUmdNd1A2c1BUeGtrc3BVT1Evd2Z3RVdM?=
 =?utf-8?B?QXM3a0VHazk5eW9JNmNpS2I4OVI3Z21qbUUzL2FyODRFRDA0VjhpRmE1cXFo?=
 =?utf-8?B?ZTc5MVlkVEpBazB4QWt1YVdiUEQ5VTJodU1DTmd3V1RUMFdYUnJJVGo1SlJn?=
 =?utf-8?Q?/URTtWyH3LNk1?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AS4PR08MB7925.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6530
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:574::8];
 domain=AS4PR08MB7925.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d9fa6be7-b642-446c-6ed4-08dd4b54ba23
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|376014|1800799024|36860700013|82310400026|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blVGc3dueHcvVlRNT2VSK2JNVis4bXBnQk5seFU4Q09MSUhoT0lkOTBSSUtz?=
 =?utf-8?B?V2Q2eVV2UGdRM0xvUjNEL1dMRFNiZlFFNmZ6UzRGMzh5elhrYkJoOTBjbXo0?=
 =?utf-8?B?WFVqaGd6a0F5SHJ1eFlHR1ZBL3Y4ZitCNFJlcU1hcSt0L2NWMjJwSXZXZG1F?=
 =?utf-8?B?cWQvOUt2cHk2dS9IODRSLzBzSmFmU2VkT2ZtL09pMmQ0NE9DcXQ3V2pnYzFw?=
 =?utf-8?B?dkpHcUpySEV3ZThreXNqT0JVdGdTWVoycFVMOUk3bmdJSkNqNzVlTEJyQmVP?=
 =?utf-8?B?VzBzUXQ4cVZRbFE5dmIwVEMvWWF6aDBtRlFDMUdwSGw0WVBZZS9EMG5wNEdi?=
 =?utf-8?B?bGV6YXlNdUFFN0FHcUxYOHpmdUpJYW9RWVlkWFIxSjMxa2lXa3RBWmRXWjFo?=
 =?utf-8?B?VzhOSFRjS3lqaksvMDkvUEF2Rm5jajB0K1lKTFgycjhkYllqMmxrRkw3WEFt?=
 =?utf-8?B?ajlFTEtyYWx1emFoa3JvSjArUUV2dGJkVmVEVDZjUUZhRm1DanY3Y3d4UHhS?=
 =?utf-8?B?cnVXYXZxUnhaZHVWcnloeFk4RHlnN3VqSHVHM0FSdkxHUStGeG1IL0YvWHRn?=
 =?utf-8?B?ZmszWVQxY2h4M2ZwRnljRGxsMVQzYW9hcHl5aXlUT0I3WW1TNUptU3czUjBk?=
 =?utf-8?B?eUtkcTUwTG81Yk0vTHFnVEFLVTMxc1ZhbkJrZTFjWk45YUI2YjZMcXUrZWxE?=
 =?utf-8?B?dnVLbEpMbnBpL25wV0lkbTRkQm16cVJ0b0FhMHh4RHZQaGlEOXQ1ZE9BRGpD?=
 =?utf-8?B?MDFUQ0lnOE8rdXE3Z1ZqQ0Ftd24rcWZFbytMcFVBNDlJaGFnNFlUTmFDZ09p?=
 =?utf-8?B?YmV3cCt6NSsrTFRjYWx4d3VMZmNXb3FyMXg2bjI5V0J2d2JnSTdaTE5wWWtt?=
 =?utf-8?B?ZDdGbVE4N2tyL3V1dmRPV0FhamlFTDN2cVc5cjRFVGdCSUdTd0RKamExQjZJ?=
 =?utf-8?B?eWxXSEJRdkEvcW81NVNsZllhVklJYVR1U1BqczlkMjJmOXYyN1FGRmxsR2l3?=
 =?utf-8?B?a1QrQXpCRndPc3NZc2NkVXd6dEZJSXcyQkdlMElQdXczYUJyTXhEK3Y4UlBm?=
 =?utf-8?B?M05KeXRrRWNBT3lXWGlRNWwyWFpUVHRjNlFuWDZjS29zOEUxTlJ4S1R4ZzdB?=
 =?utf-8?B?c2g0WXdzdG5MZyt4UEtHaWdKMElSajBhME5WS2RSYTdGRHViRHlnUFdKaktz?=
 =?utf-8?B?UE9iQVpYZWVFdlVhR0xUVFFYU2MvcUNZNW8rQysvRGRvQ3J0ZlhKQ2xoWEQr?=
 =?utf-8?B?RXlpcEJpanppazRPaVJMUHZQWEd2S2E5M0RSWWYrVjUwREVocVo4bjByYU1B?=
 =?utf-8?B?MzJNdlRVMHdKQXUyS1dwRDhSY0RaeEUvM3JaRWU4Ulpsa1ZIZFEzSDFDQ3pR?=
 =?utf-8?B?aGNCUDk5UVBOMjUzMyt4bS9vSkhDaGxzVFk5SndIRnZTNFEyTmVtVHl2QXNO?=
 =?utf-8?B?MVYvU1Evcm5ydXg3YVprZlpCMm1SRUMzbHBXejdxRi9XL0x5V0phcDF5STg5?=
 =?utf-8?B?UEhKb09Mc2lCejZzWXkrOHB0REVyQ3FlV3pPektPN3JieHJVVDRibHE3dWc4?=
 =?utf-8?B?VDVGalIyQnBHUFdvWkJiVE14VStzd3U4Q2hwS3hBQllsYUwzZnVoa3ZlUVkv?=
 =?utf-8?B?K1NPZlliRzI3SWNBN0ZKNVgreWQ1dEZUcjlkOG1qR3JOWDFFcUx2U09hOTBB?=
 =?utf-8?B?eFlTNWNmM1JybVNHWTl2L1VuaXd2Nm9SS1BZN1VhUmVIb25vQ0J4TE10K3JO?=
 =?utf-8?B?UjNHMElxc2NGU2FIdFU0MFR5akJiaUwyWm15ajZqWlBhTWVZZVhGazd1UzRN?=
 =?utf-8?B?U2tHOE1ZeFBOZTFhS1crRkMyZDhQVnB6U0w5K0RNbzRiQms0Mk5Pc285c0RV?=
 =?utf-8?B?ZmwvSkRsUGd3T3VnT2hjaHF0bTBuT0trdjVHcGxuWE1RVmdWNXZickk0K054?=
 =?utf-8?B?bXhVM3hlVEsvVDVxNU9zamN1ajMvVzVWWHc0S1BrUkUvMkVlQXpWOUhaZHFk?=
 =?utf-8?Q?oeZCNitiDG313k1QmCbPo4ell96YYA=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(35042699022)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 11:02:37.0843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ff5db89-bbc6-45da-af6e-08dd4b54c2aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A78D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8459
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



On 12/02/2025 10:49, Maxime Ripard wrote:
> On Wed, Feb 12, 2025 at 10:29:32AM +0000, Florent Tomasin wrote:
>>
>>
>> On 12/02/2025 10:01, Maxime Ripard wrote:
>>> On Wed, Feb 12, 2025 at 09:49:56AM +0000, Florent Tomasin wrote:
>>>> Note that the CMA patches were initially shared to help reproduce my
>>>> environment of development, I can isolate them in a separate patch
>>>> series and include a reference or "base-commit:" tag to it in the
>>>> Panthor protected mode RFC, to help progress this review in another
>>>> thread. It will avoid overlapping these two topics:
>>>>
>>>> - Multiple standalone CMA heaps support
>>>> - Panthor protected mode handling
>>>
>>> You keep insisting on using CMA here, but it's really not clear to me
>>> why you would need CMA in the first place.
>>>
>>> By CMA, do you mean the CMA allocator, and thus would provide buffers
>>> through the usual dma_alloc_* API, or would any allocator providing
>>> physically contiguous memory work?
>>
>> You are correct only the CMA allocator is relevant. I needed a way to
>> sub-allocate from a carved-out memory.
> 
> I'm still confused, sorry. You're saying that you require CMA but...

Adding to Boris's comment, the objective here was to enable
sub-allocation from a carved-out memory region. The CMA heap
was used for convinience. It can be any other heap driver that
allows allocating a protected buffer.

>>> In the latter case, would something like this work:
>>> https://lore.kernel.org/all/20240515-dma-buf-ecc-heap-v1-1-54cbbd049511@kernel.org/
>>
>> Thanks for sharing this link, I was not aware previous work was done
>> on this aspect. The new carveout heap introduced in the series could
>> probably be a good alternative. I will play-around with it and share
>> some updates.
> 
> ... you seem to be ok with a driver that doesn't use it?

I will confirm it once I have done some validation.

From Panthor driver point of view, it does not matter if the we use CMA,
or alternative heaps. We just need to be able to allocate from a
protected heap. I used the CMA heap to simplify the developpment of the
feature, it can be anything.

I will extract the CMA changes from the V2 of the RFC to prevent
confusion.

Regards,
Florent
