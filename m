Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8333CB2BB04
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 09:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A42C10E076;
	Tue, 19 Aug 2025 07:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="awD/pM4B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11023085.outbound.protection.outlook.com
 [40.107.162.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC1610E076
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 07:47:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZ27NNW6O26Fc9Z8KgbmFIW/V8Bh2pTj4MMe0P+TuJ5Vvmzu48gVammsgwlktwdxdPNIWi64q6EQvQGCf4x+wQ3UShPUtnFhwTI4Hl4MqMIpwKR0cgj1UAnqpC5YlJ8uJ+IKy8icndNzONCawir0CRQ13b3YPWrUCEoGPc8WrZfVAg1CkfF7swE+Dlbox6mBpFZCHOxc9fJjCi+eXNjqetksQfNVF6AiZVzdUeKI2Fewzv0sfoPjIGAyhUkJSkDGpHGmpAvVhcEXS7LORLSv5i5IGBDdQnsEzI6GbrfVKDJr+HTbHBNwVNiFrLQDJNzjpWSi+76ZanoVpKxbaAlgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6myySMeFCEOTGbW2j2BIp7mI9Y23sxVkuDTQ/k2SUY=;
 b=Rcnb6zVspBuIyt1iLvzsi9v/P5NQqftsn4MUM3yzsIVHVfy+dqsrOBElAAMCzfZh89PLHdkU+VCvDxTgTqXlfKORlStoklmoWpp+F4OtKE8pKsICPF2EhVtkZKdbD7ha5WdjVRuoVq9mTsRkce6vNM8i22YH3kmuVhTm/ctiZBtcGmj77i7IME877lsGC2kLP1mPIuoAU73t1TwA0XCxSj2jRZoHPLFjfGdqivWZ/nJuVji+Z6FtF+DCgrJPg4iZoG+4tPUrZq3uPChtX20KRQLiWmYl2dqYtT+Nn4I7YupEQFfy7ZCJdP/GYf5epjH1c2pegqqP1v0IZ04769q79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6myySMeFCEOTGbW2j2BIp7mI9Y23sxVkuDTQ/k2SUY=;
 b=awD/pM4BjwbLE8ck9Y2epwm8QczF0VzBodQgEJF/0m0JbLDwfvhiY0zfMZaWZQwRzYxh5d2+HyNVTQ0G3tMn/SHgh9/g0Pnjaw/DGOfiZV0oBQdTw6XkfJf8xuLnX2GgKbHpPzScDFQwZmHBNswDQKDYMrEw7RQehe1tV70rMbR1ocGaxo0dW5K6zR55Tc/cqKrKzrVjwTSJoUV1rHu6cVf0kdcwe6M4TZgawJkFNvwpWGl9pWm68DoDi1ISch8dTVD1rMf2mWjJ+jbhfSlLCB5O4yq9jQ6dn6BBljtzihn1guTdDk5UKqzFzHUOAN/FDBr5ORlJh6B3SLi69GfGAg==
Received: from AM0PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::11)
 by PR3PR04MB7209.eurprd04.prod.outlook.com (2603:10a6:102:92::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 07:47:02 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::52) by AM0PR10CA0031.outlook.office365.com
 (2603:10a6:20b:150::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.22 via Frontend Transport; Tue,
 19 Aug 2025 07:47:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 07:47:02 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com (40.93.64.12) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 07:47:01 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.7; Tue, 19 Aug
 2025 07:46:59 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 07:46:59 +0000
Message-ID: <f4ec7690-322e-493a-b346-7b9560ac0616@topic.nl>
Date: Tue, 19 Aug 2025 09:46:58 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
To: Conor Dooley <conor@kernel.org>
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
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250812-designing-tyke-db85527b373d@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P189CA0046.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::11) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM7PR04MB6838:EE_|AM4PEPF00027A5D:EE_|PR3PR04MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 3502a782-2c5d-41a6-a3fb-08dddef495b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|1800799024|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WllOUGRZWCtXd2MrRkNndG83YkVHZ29SaDJqMXN4VTk4elRqK0lGR3ZBVjlX?=
 =?utf-8?B?SCsra3pHMHpielIyVDBreG9qakR6TWcwZytZVjJPanVmWUMrYi8rdy9ZNENB?=
 =?utf-8?B?c012eGdzeHdYZDdZREQ3ZmRvaXJiRGptV2JhYWl5eDZMNkc0RWJyS2xpc2dS?=
 =?utf-8?B?M09ta0VRRWpTL3NibWNUeGZvd0ZEWkp1RWQvY1NoTXBESEEvcGhyODNOQTJ0?=
 =?utf-8?B?WjA3d2Fnd2tBaERhZE40dkZXSTk0U2V3R2FUeXo4bVJZY1kzMEJ5cHNPNXg4?=
 =?utf-8?B?ajNJWWN5RlhOQ09EcWFWY05peThYN0Rwbzh3VURRa1BPK1lIVUJmcDRqRVkv?=
 =?utf-8?B?S0trN3ZpVktPQms1Yit6cTUvVm1veXJiZGd6VTcxQ2hkVHhMTHZMU2hQdVE3?=
 =?utf-8?B?YnNGdGtRMmpidjY0NXM2QnhNU0M0T2xNRjlhVVEzU2pSb2tJbWJRS3NlemNG?=
 =?utf-8?B?cGRQWEZDb0dWdUQrYzVqcmZnci9FVWpEWUN4ZEJiSmw1SnpCZ0hxMHM4SXNl?=
 =?utf-8?B?U0FaREt4ekJxeGphbFdwc3VYWWFJOVlFRnNEd1FsZ29GVW05bjV0L1Q0U2xn?=
 =?utf-8?B?SGZxRjNRcWh1WUhhWkxHYTBtc3YzU3M3RzdqMTlQbFd5dlpvVitTUlJiT2g5?=
 =?utf-8?B?Q3ViMFlsVmwrWTZ6QmJuckdQcytENzZSSHdCNHg5VjErYzF1RTNmUWorN0Fn?=
 =?utf-8?B?NlQ3cXViOUxvVzA2c2xhanArb3UzVS84SUgraytqY0VsMk5YUWt0QUxlRG5r?=
 =?utf-8?B?aElqdXZrVENJOXcyZEZxQlI3WlRhYWhkb0diUEdqU3JCUDU2UVpveXAvNE9x?=
 =?utf-8?B?Nkw0TnVod3UwVzJ3Nm81ZW1KSWZsUFBpZjVUOXE3Ty9qK1drSnQyL3ZSWm1o?=
 =?utf-8?B?WE56bWhtWkJmY1d0ZXlhRmN4QjhoVzViSXQ0bGhiT1R6UHg4MzhCNnVjb0Vh?=
 =?utf-8?B?clY0ME1la0Q5SWUyc2paQm1pam1xVi93V3NGZHUyVHNYTU9MOEdxa1BSNkhF?=
 =?utf-8?B?VG1sYkI0dGlwUjA4RFAza0JHZTVNWVhDNW5sZkRrM2JXNGk2T29wVmwzb2tu?=
 =?utf-8?B?b3ltMzVKbFhvYXA4eDlEOGFIMDlFczlIMHVJclk1MkFtNStQNjBubzFPWjMx?=
 =?utf-8?B?bDVxSTErWTFPVDBOd3lqa0pSa1NqS0FweGQ1OERLRStFbnhmYjVyUm85Z2Ja?=
 =?utf-8?B?d3ZGZFFMNllaS3ZhRHI4bmdPQ3dickllcFZ6MU5OSEJCeWNoK0ptNEhoeXNw?=
 =?utf-8?B?WHJaK2hQRG02c3BzNWN6dGVkemlaU2FyQ1hjZjFkamRncTV3NERsT0hudnp0?=
 =?utf-8?B?L0JiL1U4OXhaTUJneWhsOGFFYzdmS0VtTC8xL05pZ2x5aS9MZHM4TW96QUx1?=
 =?utf-8?B?QkRQMDZ0MFFSZGRzRXNvQjZKSkFQdkJkdGRGaEZBaEIvZ3hSL2JvelFiS3Ry?=
 =?utf-8?B?ekRONEc2TFdsZm1WWjN5Mnc3UWt0Ynh2dVpJZDIvRXZOSkFNZ1lValhMM0lR?=
 =?utf-8?B?VklLZE1oNnFVSWlJdTM3d1k4RUFXekxISmlIemtVMWk2c1NJejllSTVRUVdq?=
 =?utf-8?B?K1RaRGhJbDJtVVJlTy8xeEtqcUhRSVNRRC81QzVhSE1Eb3hJbHJscmNTR1BS?=
 =?utf-8?B?TStmOXhNeUhhd2JFdzF2VmxRckRaSHo4a0hianluTE9Bc1hXdzFNL3Bpekxh?=
 =?utf-8?B?aW90cUUzSFlHYXF1Sk9sWjIwSGptSytjU2JhL243NTNONDFSS2xNZVhCaDNE?=
 =?utf-8?B?dEhHOU5BbjVUY0t4bS8xYVlkZWo4SEtjYVFxMUFpS2VLRUFsZVR0SGJjVm5y?=
 =?utf-8?B?V1hicWdjUWJRSkRobjg3UWdxY242eExobCsrQ2RuZG1ac3ZxMFJHWjNyNitW?=
 =?utf-8?B?MDRlVmdMd1JwNllPVm0ycVJWdTdJZGx4MGsyU1lRL1IzNktPdnFyWlJJZW55?=
 =?utf-8?Q?tctE5/M11Oc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(13003099007)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838
X-CodeTwo-MessageID: 651f5568-9ef0-452a-8458-ebecf5eb723c.20250819074701@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5221ccaa-8fd7-44cc-9de8-08dddef493c8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|14060799003|7416014|35042699022|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmFvYzdoaCtIbDlHa1BMblQwcDhVVDFHYUVpR0JuRFRQNFhydDlGcEg5Yzhi?=
 =?utf-8?B?aWFIWnJPQW5uRTZ1MTE1KzRMaHM1UlJGeURmb1BKSFJRUE9Gb0hWK3ZYMnBM?=
 =?utf-8?B?a2h5Qi9YQURranNldnhLMU52Z1ZHZ0tMVVUrZWFsUVYrOUVqQ0dyNHhNZVZn?=
 =?utf-8?B?RnVXWmxlOWRkZXZncTE3RXNzbEUwVGQ3bkpUQjF6OW5mYXh4b3c0V1Q0d1Ri?=
 =?utf-8?B?VG50Z09QaDJJazYyYStsS05TWjY0N0ZIcWtlRUZjL2x3MmowY0ZyaThBVmZ3?=
 =?utf-8?B?UVg4ckFuS0VWc3ZaaXp4MkZSeitJQzRtRFptTHRRNEF6MS9zdEpHTFJOdDlT?=
 =?utf-8?B?N2xsN2xQa1NJa05SL1lITVliNmFveC8xZHBZaEJYMnNOQzA3Uk9CcmhlS0dx?=
 =?utf-8?B?V2FCSU1OMDVpcEVhTkRiQXFkUHFDRy9KZWFScDBIM3RUbzRETUo4Sm9leGtZ?=
 =?utf-8?B?ajVCUUlGa2dRTU5seTdLYmRBd1JpTm5Yb1RqVVQwdEprRVR1UUVpcXVrTkI4?=
 =?utf-8?B?MUpBcVQyOEhYOTVZYkl3MGovR3VEM2dTa1prOGRyOGQzTXdDU2ttbTc0UGQ4?=
 =?utf-8?B?Sis5Ty9VS1BuOFliVkF6QjBqU2tDY0pCLzFPc3hsSE5DRGp2amFFeW1LTHRU?=
 =?utf-8?B?M2d1ZWhhU2VDeURBNWY5WTlMMjBaQk1Iczd3K1pqWGlsMWtaWVRRaEcxNWpN?=
 =?utf-8?B?UGM5cHRhMGljT2pJMTJrS21VajRDTDU5NnlESVNiaWkrUHltZitUY2ViQ2lS?=
 =?utf-8?B?UHh3SFJCNUhjUE0vVnIxUXZ2ZXNlWEtkS0JUVEVoZ2Z0MzRxNWFlcTR3WDZD?=
 =?utf-8?B?clE2U2wwaXBBaml2MFFyV2ZEV0dlNUFWNk5hS3BFdUpGUklWdVE5UVhxTU10?=
 =?utf-8?B?aTJsWmR5V3dtRVhJdFRYU1dmRWJMNHcrZUxTYmJVNXUra29BanFIZ05FcU9H?=
 =?utf-8?B?cjFDRmFFZDdhSnRpaVU5K3RyMmUxdi9SVi85UldPQnN6V0dBQ2M4VGl3cXlP?=
 =?utf-8?B?RXAwdUJ0ZmhsZ2t5N0ZYRmFGSTNhWmNCZ3IxQ1B0QXM0MVR4NlprOFhtUXR1?=
 =?utf-8?B?SDhnSkVrTm9hYXV2b3crWmJzOGxlWTJ5dmxmemxJOHNZRHlnOVJ6ZHFibmpw?=
 =?utf-8?B?MzR0MDF6MHNRMGNOa01hZkQwUmhqSnJOZ3FPRGFHVFd1bFdqaXJiU2RGem0r?=
 =?utf-8?B?Snk1N3VoOEx6NTBITEkzcE5Namh1aUJKeXZ3bkc5M2Ewd0F3S1V3ZmdyRWc5?=
 =?utf-8?B?V2NMREdFUTE0WDhhRS9PZXNsN0h1RkV6ZjJ1TEhxSXRZbzZHS0VFQXlKaENH?=
 =?utf-8?B?NW85b2ROZG5CV2JvOE1MajI3NmtYR2ExSVp3WWQxOGZIMzlHOEdMMWVNNCsy?=
 =?utf-8?B?ZmsySE5OcTd4YmJNVGlVYWxjZlZ5T0lYT2sybktodlIvNFVFODBiMzFBWGpp?=
 =?utf-8?B?bnlGOFRpUThMWmJBaGJ4UnpjYWtxRXdYajF2bEdiZTh4a2o4S29USm5hd2Fy?=
 =?utf-8?B?TlFwUVJUU1Q2Mit1ckM1SUJQaVZUelJjTkdNYzN6eXM5TlFibVFMWU1ON1Y2?=
 =?utf-8?B?Z3ZhcjRZMEJUMFF6MVBVTGM3Q28wY0dqZ0ZJV0FQSnBQLzVDMDM4cEJJd3BD?=
 =?utf-8?B?UkgybUNLTlRDeTY3bTkyZVcxTVcyOUFRRGJEVUF5SFplWi9uSWl4eGFZaFFR?=
 =?utf-8?B?SGQ2L1Z0eW9mZUlZbm1VS0diUUQxUzNXY1ExYnVmRy80L2Jwd01mTG80VTIv?=
 =?utf-8?B?eTQwZGxRMzNpMngrZDBlbDFaeWhDY2ozQ1BGQTlEczQxdjNHbCt3dll1Rk1J?=
 =?utf-8?B?ZkJaNWgvWVdIOWJsUDZrVm9LcGwyNzFRejFvbUd6VGNpWEdtTTRiZlh5UThU?=
 =?utf-8?B?Z1Ywb29XUk56aitYNUxKcUxndFdsRTZZL2J6bFV0elJ2QjhCaFBwdGJPRVVl?=
 =?utf-8?B?YUNQUXBFTDhzclgxd04xR0RLY3d1RWZDNlVrendjMWVaZlQ5N2pVWWRyTE94?=
 =?utf-8?B?ZGFGN0dIS3BBPT0=?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(14060799003)(7416014)(35042699022)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 07:47:02.1343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3502a782-2c5d-41a6-a3fb-08dddef495b8
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7209
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

On 12-08-2025 19:58, Conor Dooley wrote:
> On Tue, Aug 12, 2025 at 04:51:34PM +0200, Mike Looijmans wrote:
>> Add DT binding document for TI TMDS181 and SN65DP159 HDMI retimers.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>>   .../bindings/display/bridge/ti,tmds181.yaml   | 104 ++++++++++++++++++
>>   1 file changed, 104 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/ti=
,tmds181.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181=
.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
>> new file mode 100644
>> index 000000000000..87ffb556c4ad
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
>> @@ -0,0 +1,104 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/bridge/ti,tmds181.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TMDS181 and SN65DP159 HDMI retimer/redriver chips
>> +
>> +maintainers:
>> +  - Mike Looijmans <mike.looijmans@topic.nl>
>> +
>> +description: |
>> +  Texas Instruments TMDS181 and SN65DP159 retimer and redriver chips.
>> +  https://www.ti.com/product/TMDS181
>> +  https://www.ti.com/product/TMDS181
> These two links are the same.

Will fix in v3


>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,tmds181
>> +      - ti,sn65dp159
> The driver contains:
> +	{ .compatible =3D "ti,tmds181", },
> +	{ .compatible =3D "ti,sn65dp159", },
> +	{}
> so why is a fallback compatible not suitable here?

I don't understand the question. The two are slightly different chips,=20
so it makes sense to describe that in the DT.

--=20
Mike Looijmans



