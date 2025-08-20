Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E42B2DC19
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 14:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5870010E140;
	Wed, 20 Aug 2025 12:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="ah6BawIi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020079.outbound.protection.outlook.com [52.101.84.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BA010E140
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 12:10:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j/jwGrSpLolWxEbbbhB+NqMLWjqNgxjGzccaLt6W+vHhsS2brYDFStQPMEMBP6wZl1gCSZUAfi4TF3mjqK/L6nKVWiILy8ePKs3KjG+RzMIZrpHDmQvwuV4W7hwz06Vlqw3w9C2LphqUtKcU0ndwQ+AX2uTVd0PLwllZc+o6m2FaPHplvSQ+eUyRZvJoYuHEuu+vcUnUCSS4x9gpLXpaRB/1RI0mW7l1yhzfbH7K5U79CG6s5rwaiihnlPjLYskYiM5WSnlRZUwkp1nNSdffSbW8/JPAaXjugL6Jo4ok9TNgaNKik1AkKqgdV79R5Q7vWgdBZxA9ZGTdQB7IcZBaPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL/8LbBtvppH2LhR5YA8+eoV/CZ2PNhhH0TaGgsdoTQ=;
 b=m/ZMNM5uIhxB04TmehvHOR+E5HjKE0tDS5UfV6IHNeQRGRt3Rv8GQl8PBJdFd0IY1ccFWmGon9ArPM6PxPpF42uChA6tZZ2Y4iEpC66J3H4rWEB3ppThq+ItM0l8XYI34d0rtJvIcNX1A0VBVjF3VoS9SfArUmE5FDaAOcfHXGp60YKUF+qab1GCKSeLr4WkXWtxntXmDbIrv9fzodLcAx7Uq8mi2sTnlVsKUo6+d2fr1O2TRpveq8xfj6xZWIBCL6B9YWjbOxZbSUsIrc1jtKYc+3vgdMCoPwTmg3BjmAIG6RicxmWtTlnpwRP7u4u6wOFZFajuGovVJGF2yf5GdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL/8LbBtvppH2LhR5YA8+eoV/CZ2PNhhH0TaGgsdoTQ=;
 b=ah6BawIiLlAly4N1kLZ+hTSheq+2BFRzEPdvcSpgqR/ylipB9/nSmam7I7ZnThhfY3a5Asf5CB4DVyk5iNrGPpZL9oMvzraVXaBAx1HCuQCuO2bKejKJrRg+RDfXoXnkARGDzR0G6ihc2/FJUCVmfYRTq3sKwD/fPHvIThCAFWc2ua5bf2T64h7IYaQHb470yNdSpIGwB/LiMaNAQKjibkL8iCFVKr9rRGmG845WfgCY1kvZs8eu0R7cehq+DB64QtF0r87SNHi99nIsRNc65d7MQjGocv17ytZg7tlR5Cs+LjmxApptxUWZSTYUBL2ZZ2UHU/LZVunXDXMpGGdMkg==
Received: from AS4P190CA0060.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::13)
 by AS8PR04MB8515.eurprd04.prod.outlook.com (2603:10a6:20b:342::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Wed, 20 Aug
 2025 12:10:08 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::5a) by AS4P190CA0060.outlook.office365.com
 (2603:10a6:20b:656::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 12:10:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 12:10:08 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com (40.93.64.31) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 20 Aug 2025 12:10:07 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB8994.eurprd04.prod.outlook.com (2603:10a6:20b:42d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 12:10:05 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 12:10:05 +0000
Message-ID: <34d4e81a-d4fa-47f2-85d1-ef01c9c21173@topic.nl>
Date: Wed, 20 Aug 2025 14:10:04 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.3b7d4319-e208-470d-9ada-585343a64822@emailsignatures365.codetwo.com>
 <20250812145256.135645-2-mike.looijmans@topic.nl>
 <20250812-designing-tyke-db85527b373d@spud>
 <f4ec7690-322e-493a-b346-7b9560ac0616@topic.nl>
 <9fba4917-a24f-4fee-8f1a-7509a0bc542e@kernel.org>
 <2d694c9c-704e-4353-8b57-de83eb5a7f96@topic.nl>
 <1b517073-cadb-41e4-b470-54a6ad93dd59@kernel.org>
 <3a4448a5-a01f-4d4e-a890-56eb9357abd3@topic.nl>
 <2e16f923-5dad-4c8d-80d7-667dbece92c9@kernel.org>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <2e16f923-5dad-4c8d-80d7-667dbece92c9@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR10CA0085.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::38) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB8994:EE_|AMS0EPF00000192:EE_|AS8PR04MB8515:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be47dd5-07f9-4d78-5cb9-08dddfe28150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bE4xUTJ0dUFTci9KYVE0OEFLRzl5dnVaSkhRcEhMQVBtczNraENNUjMwM2d0?=
 =?utf-8?B?NFZvVkp6VVc3T0VSSThLQzhDR25DS0ZxVVhuaWF3RTVkcXk0OE82WkFDRUwy?=
 =?utf-8?B?STdxaWV4aUpIbHNEcURXZyt3OFVQeTBJWGRnNWUwb2d5a0pwandIRUJYRXNH?=
 =?utf-8?B?Q3R3NmlRYUVESzc4R2ZXdHhxZVhVdXYyVlFsbnJEb3hpWEI0RS9aeFRrSmhV?=
 =?utf-8?B?UFJLMEJiSzdIRFE3ck5wY0dzNlNyTkFwTmlvZitMQThyaHVQNWlYeFBHMzJa?=
 =?utf-8?B?c3drUW5LMTlLeVBRb2Q4MTVVK0t0UFN6L1hkUFVZdzYvREJPK1BWVExST2JT?=
 =?utf-8?B?ZnR6bnh5MkhzeVNqL0J1RVdudTQ0bUtWQkphanFWdEtHQTFuOHVVS2J4UmJP?=
 =?utf-8?B?VFJJRDVlZkQ4NmdyamFpMExkeGQ1TURtQlE3dzQ0M2ZqT0RLeHBLd0FFMFZ1?=
 =?utf-8?B?T1BCWGhTT0lkclIzeVlzR2NtTnlCWkRtUytadmFjS1FrTlh3SVZPZ2dQRHZk?=
 =?utf-8?B?U3c1M0phSnAwY2JpNkNJQXlMYkdiRnZCRFB6ZmpDY2duYTZRbm9JOWRDSGFL?=
 =?utf-8?B?UnpNSEwveW5aZDN4QUdCTW5pNnFFQ3cvRmlWWGZZLzZmU241SHcybzhOejJx?=
 =?utf-8?B?bEE2eUtJcnkyTGdPUStjZGdDYmlDT0VMalZscVBFamF4a3NGZ2ZaaEQ0dm9z?=
 =?utf-8?B?M3dreEt4dzk2UUFMYXN4R3NOUkk2Y2pLQUJDbCtLb1Z6b2FFMVBlQTQyUGds?=
 =?utf-8?B?RVRaZTIrWEg3K2RlT2hZZC9yOU9PQ3VCK1FLTTFrYUlsaGJrZ084WGNhZi91?=
 =?utf-8?B?K1RFUnh0RWZBUGkvZW4xTnZFcHZxaHF0cVRFWVRTMXUrZnRkUFJYbW9BNmJh?=
 =?utf-8?B?YkVVSmVOYnVEaTF3ZWtEdHgvc2dFSXdqM0dhTTJ6K0NMTnIrWVRpa2JQMUp4?=
 =?utf-8?B?aWNndzBVSkFKdXB2elphWStvNXFvUlNRdEw3SHE5Tko2VlJlMENJMmNBSnND?=
 =?utf-8?B?amppVU1tNDZCZkZjSzdFMFRWVE1CQmN5dGlOdXZXSmtZa1phTldBaDJHelRB?=
 =?utf-8?B?QWd0b2wrSEIybUJGUmN2Q1dzUlp3R1c5ODYyZWVoelhaUUJWTDh6WUhVa2Ux?=
 =?utf-8?B?ZmJ4RktqOC9XeVg3ZUxNVTVMTERLVk9aZFFkQ0ZBSlAzTWhoS0ZPT0hhdHBk?=
 =?utf-8?B?L2M4UEdPMHQ2Sy9MVTJQSGw0Y0FuTG91ckdNUzc0RXFoTFJsVVZlcFRqaWtN?=
 =?utf-8?B?U1cyc3dCcGt1R1V0OFlWSlY0YXdKZnBYUTVWU1IycFpSbEpIanlKS1JPVml6?=
 =?utf-8?B?UWhnV2F6UnAvQkEvVTM5M0FwOEhVL0JXYW54YU03L1ZiMzZKOGh5YVNkVEVL?=
 =?utf-8?B?QmxsL0xWMi9DZ3lTcXJGQ0hqWGdMTjZ4dU9qMFRaYk9BUVNUcmR0Y1lCNTU1?=
 =?utf-8?B?dHJEWENnZlRTcW42NmJ5VVN6OWxIR0FBRXF5N1ovTlZoOTJFdzBOUjFkVGo5?=
 =?utf-8?B?bkpXRTdMbk9jMWh5QmJHT1JLQ1ZySjlyV3FPbWZBRjhNRkFkcG52c3hLdW5s?=
 =?utf-8?B?NStnbkxBSEpSSCtiV1lUakdDejN3dTdOcTY1endlT0xTcEQ4SjBQLzkvdVpU?=
 =?utf-8?B?WUdGOWpWaktaclAwUXI3S0RlbmhCZmJBQU5paDZCMWVwZ3RmV1NuOGlhNkRi?=
 =?utf-8?B?dnBzSGlXNUNOc0grTUVMMldtUkdoZ3JrUjU1bVkwVVFLcG0xUVN2SXR1UWtG?=
 =?utf-8?B?TFZsektZNThnMjV4emVLWXBaRFc2QVVNYnJNMDV2ekh4WUlKRXpDOUU3OGFS?=
 =?utf-8?B?eHU5Y05ZSEY0U3F1Tmh0VktLMWVXa0xTbmV6SWZOUVRITVNOQnhETkROV3dh?=
 =?utf-8?B?M21HODZyQTBWd29GUUh5T3F5ZHVpa0VvYUs4WUkzd0JDbXJHMEc4MksxTXA1?=
 =?utf-8?Q?nKwD57H7iBs=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8994
X-CodeTwo-MessageID: b372146d-5983-4223-8485-679669111ac0.20250820121007@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c5d5ccf0-e8b9-4369-c659-08dddfe27f5d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|35042699022|14060799003|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG9Nc0xnR1Q0c3R3MWJLL0o1RWkyMFQ4ZmJiZGsreFY5WWs1OUt6YkpVZWZG?=
 =?utf-8?B?UHZUdzZRZlZoWThnWnZIaFZuU0F1cm9Fa0tzK3ZPcUxiWmpQc3FVSFBraG4x?=
 =?utf-8?B?VXlBNS9jb0s5cHNHMlhrQk1MMjMvQTdQR3g2eDJTakk5ZWY1YXhtOUc2dCtu?=
 =?utf-8?B?WVU5VHhadzFScVVaMnlPWisrelFIMEhlOURyYzlPTHFZclFtMHhVY29sU1p5?=
 =?utf-8?B?ODBubFd2VS9TaGFPeU1oMjJLQkxjdW9OQ0RzN0U3UUY4b01xWlZ4dUM0T1Nn?=
 =?utf-8?B?WGEyeDJSOXdoTTlYdWxVcVh4WjBQT1VLTzU3ZUV3RFB6T09RblRmUzIxS0c5?=
 =?utf-8?B?L2JpeHVIR283UkE1ZzV1TzVVV2NqaFpaaG9icU9jdStRZHlyUG9HWVJZenE1?=
 =?utf-8?B?Z1BoeTc5c1UxS1VWNDlXS3laQzg4Y25MdERuZ0dFWkNtZmE0eVZTR2ZWUWxo?=
 =?utf-8?B?TmlPWWRGZkdPS2JvZkdmeDlBdEZORDV6UGkrSGRRRERiaGg3cHVwYzZuYXdS?=
 =?utf-8?B?YllTbDNJblN4YXF3ODNFaHJXUGFaVXdzbWUweCt5ZVQ3NWdXVzUvSU1RNkFj?=
 =?utf-8?B?WWNobEpqZnhPWlh6OEJzVlF4bkZuaDlMS0hBeVdFVm91STF1bkR4NEQ2a1Jz?=
 =?utf-8?B?eGRXekhFa0pjVUh0RFd0SEZMTi9xclZvY0YxNWpzVHc2eE5zVzlOK0YvVXZt?=
 =?utf-8?B?Vy8xY2c0WVJKUUd4K2JEdXJoY1VEVVhpNVY5NGh1OE1FYmk1U016dC8rUjI2?=
 =?utf-8?B?OTV3VHY5cVNtQU9UM3ZkeEYzSzVGcUZiU1lmSXlaWG1kaXNhZy9kNlMwMmF2?=
 =?utf-8?B?Nm84dkRZMDAzL04xQUk0cHZxSDNZbVJmNzFyZDMxNENXTm9RTnBHUTNmd0RH?=
 =?utf-8?B?L0FaUWR3ajhJOGpRaDhRb1Yrc2FudytqZEg3dEw3eUZTMndWR1Nad0tNNVNB?=
 =?utf-8?B?eUxaUFpGWVJjTU9ZTW5YRUhNc3RwZTFSTzc2dkNDVVAwREN0SjhUSGd6VExr?=
 =?utf-8?B?MVhPbU1PLzNmZEgxVTI4YkJRVmd0SWhBeTNad0JWRjdkandHR0tveEtaWUZs?=
 =?utf-8?B?clpqRE9yMHhUNjNabDNPcFhKY1ppMzZOZHZhOVh3a21pNkF0WHZWK21qZFRG?=
 =?utf-8?B?eHE1dm9VRmIxREJzQWVuSmk2RmxDVVl1Z0NqUnBJSXNzTU1QYmZNOVo1VkVO?=
 =?utf-8?B?SmV3WWVKNk1tQzNERjRUUG9yN0V3OWFDS2RRT2RDN1NSWS9ocEpXeEhoZDBT?=
 =?utf-8?B?cjB4cSsxUVpKeExnOHB1NG4rMUVzbTEydEQ5VnAwdE56Z2JnVXZZYVEwVGs0?=
 =?utf-8?B?VzFXdHNkZWt5ejRKMFVkTEg0bTNrbWM0aGNaL1FTbStQbmJCcGRUMzNKR2NU?=
 =?utf-8?B?V2gzbEZTLzY4dG0rOU9QOVlnVktRRjY2WTM1UDlmajRFVzZqU2wySC9oK2Jp?=
 =?utf-8?B?RjZ6TEFEREFDcEtLQ3NxT1QyOExDWnVUc1M3VTg0RnFqZHhEYzNIMEx1czdm?=
 =?utf-8?B?dVZ0Ri93dWJXa3poNTNudWN1dHptZlliSkxTQmcrR3V4dTRvUTBZamZhRTlN?=
 =?utf-8?B?TzBnTjdwN01zcC83QmxrTEdBSTg3Z240OVQzV1VvdE1rNnV4NHlGYm0yNEV1?=
 =?utf-8?B?K256SHFaWWNaVXNmWGs2OHFIZFBjVEcxdWJYdEZhakRXaVNRaXQ1TlZrczlw?=
 =?utf-8?B?WTVUWW42cTgwaXRmdUEzRDgvUm53ZE5kQUg1SXhFMForY3ZRSVBsclN2L2RK?=
 =?utf-8?B?WDg2QzUwKzVvTXNsMTdCQ0hHVlZrVDVJT1BNMVRralBDMEk4N3BDeE5UZE84?=
 =?utf-8?B?VytlQWtVMmlPVTlFSno1R3Vvak1zdWZZVktmREc0MVVUOUdvU0RWRHR1VEhz?=
 =?utf-8?B?bEVSazhWVnN3NXM4TUVFSkNxNGtjTjJldWFXZlBCOVQrdFU4eWtjQmhXNGM3?=
 =?utf-8?B?bDJadnJ4THhic053TGxON0c0V2ZjK0VLY2tLaDZGRVZXWnFVZmxGc0d5ZUhl?=
 =?utf-8?B?SU1sczdielpBPT0=?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(35042699022)(14060799003)(82310400026)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 12:10:08.1063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be47dd5-07f9-4d78-5cb9-08dddfe28150
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8515
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


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 20-08-2025 13:35, Krzysztof Kozlowski wrote:
> On 20/08/2025 11:37, Mike Looijmans wrote:
> Please fix your email client not to attach such top signature.
>
> ...

It's actually the company IT that does that, but I'll keep doing my best to=
=20
prevent it (though sometimes it kicks in anyway).


>
>>> Also, e.g. first file in iio/adc:
>>> adi,ad4000.yaml
>>>
>> I think I get it. Instead of having compatibles "a" and "b" the driver o=
nly
>> supports "a" in its match table, and the devicetree entry must be either
>> compatible=3D"a"; or compatible=3D"b","a". Using compatible=3D"b"; would=
 be disallowed.
>>
>> I actually planned (I have implemented it locally already for v3) for th=
e
>> driver to check the chip type and complain if it doesn't match the devic=
etree.
>> If the wrong device is there, the most likely cause is that the input an=
d
>> output buses got mixed up. That would also justify having separate
> I don't understand why. I don't get what is input and output bus.
>
> Either devices are compatible or not.
>
> If you can check which device you have via registers, then usually they
> are compatible.
>
They have almost the same registers, but they are intended for opposite sid=
es=20
of the HDMI cable. The DP159 variant expects to drive signals into the cabl=
e,=20
while the TDMS181 expects to receive its input from the cable. If you=20
encounter a TMDS181 where you expected the other, something's wrong with yo=
ur=20
board (the board manufacturer placed the wrong chip) or your devicetree (e.=
g.=20
you mixed up the I2C addresses of the receiver and sender). In such case, t=
he=20
chip will happily do its thing, but the system may not work as expected.

Valid setups:

CRTC -> pcb -> DP159 -> cable -> hdmi-monitor

CRTC -> pcb -> cable -> TMDS181 -> hdmi-to-lvds -> panel

CRTC -> pcb -> DP159 -> cable -> TMDS181 -> hdmi-to-lvds -> panel





