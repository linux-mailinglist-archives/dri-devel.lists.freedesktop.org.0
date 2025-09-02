Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC041B3F8FE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7410710E1B7;
	Tue,  2 Sep 2025 08:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="sceZqI/q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020074.outbound.protection.outlook.com [52.101.69.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE5710E1B7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8+aF7a9+mBt4bVYy/v7lSkji27+r7IEyMc/LDiHqKle0IVFefFb2q3EuuYpU8BN+Om9UIrlVsyl/RVCiqcA92lX+E3NIU6m+lXovEeEGqOeOZ2E2SMjm0K8xumoiLYylP9M5gHIrzdB5IMzsUEvCyw46kZn3evr5ciZUxhvIyvL+eG9snxv3cGE+KBnAYFRndj5f19t7R3mRU/atnKrj3WbOzAFQIMl0GeVt1LqVVc4bZymgdVFzBIcA0Ol1KI+2iOXUjUbj8NMcbf2P4zIqguXZbnPDMIMiemoJNUD4RQfD9L7x88BpBckz2z+J+ZHLUFVLZtz2M9F1VDfp8aQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWA5U4RAP7oI2oUdKp40/LRvm5Xz+4PuBHlcuyayZCw=;
 b=a2ulvDX3IE79eUpDdywezppgSG42c2y+kfbiDNyweaZiaMWQ29OS6oezW6Dnfh5ZMMWM5u1ccCYD6/vYLc8wfQMXk+iKh9LXJUem3GjY6LzFea0JSqHypnfPcojo7zMFRSvIHgoU1xODjfLIr3sAheS2Y5z2bWoukc7O5XPmgCB07svSBRU9XCgOzuQMYpd7lqSfacTdZAlmZxekQ4BWHH1QUKu/+CZdM1ejq7eqcBjBvhN/bDUCekxb7QAGivliu2LCPIIkjbFFEF7ZVGU22ykZaSbVRMdnGJtv0xivki4si9Q0oJ0Jwe+hIKsEvSoWtiYjdOcQgru7u13s2vHLSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWA5U4RAP7oI2oUdKp40/LRvm5Xz+4PuBHlcuyayZCw=;
 b=sceZqI/qyBI6Uzr+BV1Q/kVsneE8i3nUWzdCGnQOQL9IfLkOFKqpdCT1TIuA25u3SswB0qRxNGE0vzCxH6aosDicgzOhPpC0Gj3op7kKaOtqGtA1RhHPfcL3Ne8VNnNKwMvnN8tAP4xWI7KHRAUOPSSTkVx3Grppb92SXXwiH9mWb48kQEbLzARYYv0qVy5Ff+Qw6Hh9i1d6AGiUzYhT6A2IO7hBkgym9tNe107o/6j5JLYUabYa4g2dTvtv0GdgtNOojcXrQzesgPts1idOBY7EMNsnKYaLwsQWMpQOMv1WVlEVfybdZ+pk7s2rwjX+xvMgCsQSWK3OSw0eYCsYlg==
Received: from AS9PR06CA0105.eurprd06.prod.outlook.com (2603:10a6:20b:465::27)
 by DU4PR04MB11055.eurprd04.prod.outlook.com (2603:10a6:10:58f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Tue, 2 Sep
 2025 08:46:13 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:465:cafe::35) by AS9PR06CA0105.outlook.office365.com
 (2603:10a6:20b:465::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 08:46:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 08:46:13 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com (40.93.214.75) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 02 Sep 2025 08:46:12 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 08:46:07 +0000
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc]) by PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 08:46:06 +0000
Message-ID: <e007ee80-2eff-4859-b2e3-402950081b4f@topic.nl>
Date: Tue, 2 Sep 2025 10:46:05 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v4 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI
 TMDS181 and SN65DP159 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
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
References: <20250901142958.843678-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.edc18686-244f-441e-a6ac-0b62492b96c8@emailsignatures365.codetwo.com>
 <20250901142958.843678-2-mike.looijmans@topic.nl>
 <20250902-hasty-spry-nautilus-c05c6a@kuoka>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250902-hasty-spry-nautilus-c05c6a@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P251CA0030.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d3::18) To PA4PR04MB7790.eurprd04.prod.outlook.com
 (2603:10a6:102:cc::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PA4PR04MB7790:EE_|GVXPR04MB11017:EE_|AMS0EPF0000019E:EE_|DU4PR04MB11055:EE_
X-MS-Office365-Filtering-Correlation-Id: 371105ed-9371-4ec7-8659-08dde9fd2c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MlNVY2tQK0loUXJoa3JBazRsQXQyTFk1bnMvL0haNkM0bVl1b3pTMzI2YlFE?=
 =?utf-8?B?MUpuNW5zaUMwV0ZtRXBaMXhQYlFyNXAwSzREOXROVFoyRFo5YmFoS3JGTnQz?=
 =?utf-8?B?ZTduVm9PeU5iTWxkYWVuL0ZNNUFKaGFOMVpnS1dOdUVmM0Q5c1JEUHVKemVC?=
 =?utf-8?B?YWZyNXNOZ25Hb2tpeHh1M3NGRmN3d09odUxOcDh4YlA3V0lrSk9jYVZNT0xG?=
 =?utf-8?B?M3d3eTdIUjBFb0xrbm9FT2Y5VDNuSlRXSGVlK0t3bCtiRG1FS1QxMmxPZ1Mz?=
 =?utf-8?B?M2Z5dXdLb3RmRUFqdzhwTDVMM1ZjSjBLTjRpUTZENzdsTm05bFZva3J1Ri80?=
 =?utf-8?B?NmZxbURwek1Jc1g1WHdDb0xFWkRNd09HQVVYb3cyd2Zic25USUVpcWpsaXh1?=
 =?utf-8?B?cTFuVkdrK0Q4M0x6VG1RZnpoVmQrUDF0MFZsYW9DWTMvZjdDZjQyejY2RHY3?=
 =?utf-8?B?Y001czZmMFQybklZNWdZUFByUFJ5VGM1S2toRDNyQldrNms0U1JyVnUxM1dY?=
 =?utf-8?B?RlBRcjZKYkwwaWZvNkNJTmNlUDJ0eTRZNElRRUNmUFBVZk9wV2lER2IvSkFL?=
 =?utf-8?B?U2laZVVqY3VuVXl2N0J1eG82L3MrWW5lNitXMWZzanY1aVQ0R2hqT0NFVGN1?=
 =?utf-8?B?Z2w5cmpTZ1UzaGdkOC9GeEtzV05TaVRYMk95d0hmaDFBS0dhb3pIL3pZSEc1?=
 =?utf-8?B?blZRZWo3cDM0T245WTE2WDUzeGxITjhKeEVTeDFaUVlCRENsSzdqMEFQWWRo?=
 =?utf-8?B?Z21BbERjZzh1RnIwRHdtQlpHeEhjYm9SYnJlWHROSTIyVGZsbXZDV0lqZHdn?=
 =?utf-8?B?aWdPejJha1puek56aTFkRUlRQzJpSk4rUEtTRWcvaTU0eitsM0RQYnhXQjV3?=
 =?utf-8?B?Z1ZUblZ6MjV1OFlyV1hReTBlRTE0SEhNRkdaZGRHb1EzYjVVcmZrVStQS3Rh?=
 =?utf-8?B?dkN5S24zSS9rK1pvUDFHL211Zngvdk1NWWIzSUhZUTNIbHd5SktZY0NkTnBG?=
 =?utf-8?B?MnRsMzZyMk1jcXVZVVVVRnJhTHh2NjBLUlZjMTdwRktkZEhWVGpUYWpjcmlj?=
 =?utf-8?B?SW01VEdIOTB4cStEWjEvenhyVTdDQXdiOEZDbHFKWGxOT2FmbklqajR4cmV2?=
 =?utf-8?B?cjN5WEJhZ2FTdHlvQWxQVEJXYkxxeENkTmcwZ1I4YnFTSjNIUzA3TXNWVzNF?=
 =?utf-8?B?b1NjUEFTL2lyUmpwbkZKMmpQNzVXdWZUeVRLQ2d5QlZSY3pxSDNzc0VCUVFE?=
 =?utf-8?B?V1lCVk1SdXhRcTlZTm1Tc0xxYkRPRGFNTGN3M2tEWXlEeC9FS1BVbndEbXlG?=
 =?utf-8?B?SVJkU0NXK0NJd2tuRVV4V3NDTVk2VkQrM21NeDEyZzdUWmp1NFNTSkhiYTQ3?=
 =?utf-8?B?c29sTWRBenVBYUFuVjRHNlFUSU1aNmpuek9vS2dXNEY1aGhoTzVNQ3JGOWNO?=
 =?utf-8?B?NGtrdEJWanQ2VWZtYWVPUVd1a21IWGJQUFNhNmxaQzc2VWNPamJMLzVuZGtR?=
 =?utf-8?B?SmNuWDg3dGo0bzFWVGhyY2ZmYUE5aVJ3MFBwemYzT21yUTlGbFgwcVpwSHFX?=
 =?utf-8?B?bDE5TTQ1bnVYMVFPVEF4N0QzdTZxeTRVQ0xMSUZJVzZBMTNPenU1cWJLVDZw?=
 =?utf-8?B?ajlQYytTQU9hZngzMVhYSmFlQlVtSzdXVkxsMHQxbkJpVGI2dDBSaDJkbkFn?=
 =?utf-8?B?dG1vZHBLOENqbW9jRk1oQUVtYmFjSitHcXRqYlk2TjBHa0pWbWNYM281b3dD?=
 =?utf-8?B?YVdGd2V2Yk5NS2ZhUzQvcHcxZkVBR3dGTTVRZHFnNHdZM1RsK0xpbGtwcmNs?=
 =?utf-8?B?aVkwZVZlTWJla2tuTTFUTUI4bmt4T0ZKZEJmQ2Q5WjdNcS9BMmFIV205YkN3?=
 =?utf-8?B?TWNMdC9Lc2pLM1BqUHhmaXFkSGREdG9yVUs5N1Q2ZmYwVTJSbEVTcGxQSUN1?=
 =?utf-8?Q?m6R9xyYW+SY=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA4PR04MB7790.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(52116014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017
X-CodeTwo-MessageID: 69748bbc-0ac9-4853-ad6b-a7f652ea34af.20250902084612@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5fd844a7-7364-448a-5d07-08dde9fd2812
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|35042699022|1800799024|376014|7416014|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkc2OEc2ZjB2YU1OVmVoT3VPdGVFcERCaEpUWFgxSUdweVByNit6NlYxcC9y?=
 =?utf-8?B?cEp0Vms1N1o3OTZjK2F4N2Qrdlk1ZmJIVWU3L2FYcE9zVFh5RHdWaG9na3RS?=
 =?utf-8?B?RHlxYXZYSDhTd25jRzR0dktZdlFBejhrVjRKS2ROTXA5RlRqMENxUEQwWkVz?=
 =?utf-8?B?SlpYM092dEgrK1VtcDNLS3hIeVpmaWRJWFVZeDIxT3FTM2Y2K3ZUSnE3Zmd5?=
 =?utf-8?B?TGh1RHlqMUpWZWgwMkhURFZCMmlqbGprdHB3NVYwTHpjZkowQVBLU2xuTzMw?=
 =?utf-8?B?NG9mcmlVTklHT3dHZDRta09Sd3BJdWpuTitDejhTaStsa0lmcFVPYmhCYmZu?=
 =?utf-8?B?azEzYXRUUWwxM2RTazNBNHFMQ3lrRHhYWllvbFhjanBveFhOcjk0TzltN2Rk?=
 =?utf-8?B?VDNLS25EQWNrT2UzZ0x3bjVwdHQ5dFA0c1ZhOVZGZGo0VW82OUZmKzVIc0Zx?=
 =?utf-8?B?d0MySjBEeVNhTlpvcUpMdVErcXVDZ1d3QU5tYzAzajdFdHFhbFRvR24vZzVI?=
 =?utf-8?B?NWZtVU1DMXMwWFFUcUlCRCtrM2JCZ1Q2b2dyeGJ6VThiZEFpM05hbDR5d2Z5?=
 =?utf-8?B?cjMxYW96N0wwTFhQeHZQNWtvT2ROeWUxLzhRRVJVbEFqR1JSSjIwcWU2UXhR?=
 =?utf-8?B?ZElmS2t5U2pxU2hCTVBoUXhKaGV2TWlUa2xMUmVwYkwrYUtYSnBhYjZkT25H?=
 =?utf-8?B?S2MzSFFKcXRKbFBVMitHQjd6U3hMQVdyN3g4ODNISU9VYlRKRVdpcm9tWkk2?=
 =?utf-8?B?TFl1R2cra05VdlJxaVdFWWV0a0tQTjNtWWdPUmJ1c2lYV1E4Q3JveWJRMUhE?=
 =?utf-8?B?d3p3ZW5zMVA1aHVyejNnVUpPNlA5SUpXeFA5VkFPR2JSM2lnMnozY1FmVjJQ?=
 =?utf-8?B?Z1Q0UmN4R1E1emZveTlBbE5tNzlhSC9mZGFOckNVc0ZKL1dVYlFDUmtFZUxT?=
 =?utf-8?B?cWY0dVVuekVWWnRHZTU2WWtURnljKzFqeWdDMWNPNTM5aDA0ZkYyU3NUbEhj?=
 =?utf-8?B?MUhaMi9HdVlkT2xsVit6eGt0eEZjbWNjRW1wajdZcjdjMHRMUkJzSFYwQkV6?=
 =?utf-8?B?dTU0TlR5bTFrdzlaK1EwVlZMS21Zak05WkpZdGp6eE9WSnBCanVRY21SbmJ5?=
 =?utf-8?B?cW5USGhQMks1Mm5KeGtIYjlQZVJaNzQ2Y1pVYlVqbWJnV2dYMWNiakVJRWdD?=
 =?utf-8?B?aEpVbXZ5VnByWTFVTCtJaTV6dklTa0Npd253UGF0WjAySW4zVDBsU29ncnB3?=
 =?utf-8?B?aEZ4VVRjSHlMN3NMNGJvMXdKRGJ2U2xmYksyRGV5UGpsNUVoNFV1UHRUSXEy?=
 =?utf-8?B?UjZGRERJWGs3aHVndnJZL3ArcWhPRU9WT3JqWjhpOWNUOG55K3BTeFdHaU5n?=
 =?utf-8?B?eTB6K2p3QTNKNkhlZXNSUDFWbUQwTUdjanA5b05zVkNiT1hIVW4zUFlaYTZ3?=
 =?utf-8?B?RDBoaSsxbU12eEd1NFhPL1lNT0ZYS2FVdVVhMERlL1BRTUNhWUJMc1h2TWdW?=
 =?utf-8?B?TzBMUE1SaTdaTDAxTTdkaEY3ckVnTndCTW9UYVVBMFpiODZ2MkhxeGlSTXd3?=
 =?utf-8?B?T2xlSHVwekFCL0VTam1UVkhNWXJqa3BNT1dRQmQ2WlBJM2tHZy8yY1dzN09p?=
 =?utf-8?B?eWdDUElpaUxzWms1Yk5raFIwM3ZGVTFsQkI0VWJvZWs5Q0ZDOXRLZHY1eDQ5?=
 =?utf-8?B?S2ZvQ1E1cGJYVHdPS3lhN2hPV25tTXZFSlk1bFVQdW9VNm9vZFgrV3Zmdys4?=
 =?utf-8?B?aVpmWlA5Q0paT2VEeUQvdFplTHNYcklCRFhKeXovYmx6enNwWWsrS1Fub0h4?=
 =?utf-8?B?VEhvZGM1Uk5tdU1PTXNmSGNzZG5PSlpDcXcwYVRoMTFpbklsUWhtMkE3dGhx?=
 =?utf-8?B?UCtFSjgvZlRBb3RoM1pnb3FmU2RmRngxYi8zRkw0aVordDlTOWp3VytXUXRD?=
 =?utf-8?B?c0FDYjlFOUhPaUZLNWNIZ1cxZlFwM2p1VnFiSlVBUGtzblBqblh2bnc4UFJZ?=
 =?utf-8?B?MGY0VlJVVk1BPT0=?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(35042699022)(1800799024)(376014)(7416014)(14060799003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 08:46:13.1472 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371105ed-9371-4ec7-8659-08dde9fd2c15
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
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

On 9/2/25 08:53, Krzysztof Kozlowski wrote:
> On Mon, Sep 01, 2025 at 04:29:01PM +0200, Mike Looijmans wrote:
>>   .../bindings/display/bridge/ti,tmds181.yaml   | 152 ++++++++++++++++++
>>   1 file changed, 152 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/bridge/ti=
,tmds181.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181=
.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
>> new file mode 100644
>> index 000000000000..c6387c482431
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
>> @@ -0,0 +1,152 @@
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
>> +  https://www.ti.com/product/SN65DP159
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: ti,tmds181
>> +      - items:
>> +          - const: ti,sn65dp159
>> +          - const: ti,tmds181
>> +
>> +  reg:
>> +    enum:
>> +      - 0x5b
>> +      - 0x5c
>> +      - 0x5d
>> +      - 0x5e
>> +
>> +  oe-gpios:
>> +    maxItems: 1
>> +    description: GPIO specifier for OE pin (active high).
> So that's reset-gpios or powerdown-gpios (see gpio-consumer-common). At
> least datasheet calls them that in one place.

reset-gpios fits reasonably. Though the pin is labeled "OE".

(Our experience: The pin must be driven low until the power supplies are=20
up. Failure to do so may put the chip in an error state, pulling the I2C=20
lines low, that only a power cycle may resolve. So it's close enough to=20
"reset")

>> +
>> +  vdd-supply:
>> +    description: Core power supply, 1.1V
>> +
>> +  vcc-supply:
>> +    description: IO power supply, 3.3V
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: Video port for HDMI (ish) input
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: Video port for HDMI output (panel or bridge)
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>> +  ti,source-mode:
>> +    type: boolean
>> +    description:
>> +      Force chip to operate in "source" mode. Allows to use
>> +      a TMDS181 chip (which defaults to sink) as cable driver.
>> +
>> +  ti,sink-mode:
> Aren't these two mutually exclusive? Can same device operate in source
> and in sink mode simultaneously?

They're exclusive, yes. Will add that.


>> +    type: boolean
>> +    description:
>> +      Force chip to operate in "sink" mode. Allows to use
>> +      a DP159 chip (defaults to source) for incoming signals.
>> +
>> +  ti,retimer-threshold-hz:
>> +    minimum: 25000000
>> +    maximum: 600000000
>> +    default: 200000000
>> +    description:
>> +      Cross-over point. Up until this pixel clock frequency
>> +      the chip remains in the low-power redriver mode. Above
>> +      the threshold the chip should operate in retimer mode.
>> +
>> +  ti,dvi-mode:
>> +    type: boolean
>> +    description: Makes the DP159 chip operate in DVI mode.
> This suggest it is not applicable to TMDS, so you need to restrict it to
> disallow it there (see example-schema).
>
> Actually several other properties say they are applicable only to DP159.

Will do.


>
>> +
>> +  ti,slew-rate:
> Common property is "slew-rate" - see pincfg-node.yaml

Will change to slew-rate.


>
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 3
>> +    default: 3
>> +    description: Set slew rate, 0 is slowest, 3 is fastest.
>> +
>> +  ti,disable-equalizer:
>> +    type: boolean
>> +    description: Disable the equalizer (to save power).
>> +
>> +  ti,adaptive-equalizer:
>> +    type: boolean
>> +    description: Set the equalizer to adaptive mode.
> Can equalizer be disabled and adaptive the same time?

No, since "adaptive" is the default, I'll just remove that option.


>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - ports
>> +
>> +additionalProperties: false
> Best regards,
> Krzysztof
>

--=20
Mike Looijmans


