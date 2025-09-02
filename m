Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5623AB40732
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D7B10E773;
	Tue,  2 Sep 2025 14:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="hu1v5ldB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021084.outbound.protection.outlook.com
 [40.107.130.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE7310E773
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 14:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUg5hSGjcu07J0MRC0/8RUsoz/kPa7MbJAXtE0WB6+L1JyvW2MtaOCAd8A17IS9hFbgESeT+z42V31pZ3gUaWyzsfCAP+c7Z+LRyo/+46RDU/aAGBTubzbBbKobbeSmHnkMB9agGw2VVYWUSor6UsJy9Rm9M9dv79J0JaEoggVDeGdgySYVe4B6DDOpWR+UpfRnrPEK9k/pLJZTR8dhhjDouu5NUHgj8wweq+4Wb7jsM/iCBYzfFQyIxWQkkicB32ORJsvmO/WX256+0GL1l2qHoykuHhp3wxzSX1Kbr2OqUlzgrkQn21TuFep9YE7kV7qMfYUvyOgboziHoudoWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDmPKiomzJulEJNI7HtYAlP7ltqv8L/2KyuvZ5uqd5E=;
 b=i9qyDlseRDw7T1VFtQkMLKL4gmNp5DG3MVJs1RYoOmgCM+xLr+znTrvsP+yilXlig2oXrQ74M4CGEn3tuCoTuUZFdq+URZn2vhEjI6r3fpxd2Oj+TVLxCvpL8pQIs/rCBQBcU3cNcFvLkNB4Zmn58VzIElYon0u6lk6epPRxIQHk0oCnRU6NSh8v2PHLDjtU6SHvFSp8LftgEZ2c3Ox2aJJdkBiinFdDGw9YWdlbV/tWJkGiBwP4P+1P9ecBCmFeVvbhBq+8MKB8Xx3QPHKceVT3tcMNg1JcGj96Qt6MHrn2Xw2k3kvz2yiM8eivpLfMyV6JUu41UYIutQNDsYzgCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDmPKiomzJulEJNI7HtYAlP7ltqv8L/2KyuvZ5uqd5E=;
 b=hu1v5ldB2z3IkahjAu+r992D3/4EoNQoeg6/LzQRuVYlar45N3Bh5cl0rqIGR2PIsjIoBAxqYFHokmLjwOv+e6TDtv8PXCDDKUBlnMLUUH696I5FmmFceogT4Z+Fuk70ZoqmZVNFCt8XEGkan2IK5/XlNm0zRXB+Xf+oU6GYkS4vkyL7BIZQoaPD1eQmSpg4q1DYOG1jr66fHYBajeuC37TB/nGJLb69kUbg+XD9tih8iKM1GwLYohYAjfCnYT4VtUUMWQeQ9NtnRBB3K+V8LUHusUej6RlhaXwIbOrwtkPTx2nsk3PRanTrO5Re+VZNHrn6ZKHgJsnGXL/Sq2BPCw==
Received: from AM0PR03CA0062.eurprd03.prod.outlook.com (2603:10a6:208::39) by
 GV4PR04MB11380.eurprd04.prod.outlook.com (2603:10a6:150:29e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 14:42:02 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:208:0:cafe::2f) by AM0PR03CA0062.outlook.office365.com
 (2603:10a6:208::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 14:42:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.14 via Frontend Transport; Tue, 2 Sep 2025 14:42:02 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com (40.93.65.1) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 02 Sep 2025 14:42:01 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com (2603:10a6:102:cc::8)
 by AM7PR04MB7078.eurprd04.prod.outlook.com (2603:10a6:20b:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 2 Sep
 2025 14:41:59 +0000
Received: from PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc]) by PA4PR04MB7790.eurprd04.prod.outlook.com
 ([fe80::6861:40f7:98b3:c2bc%4]) with mapi id 15.20.9094.015; Tue, 2 Sep 2025
 14:41:59 +0000
Message-ID: <fccbba0a-cb8f-4d71-9c91-7558cfaa8ef7@topic.nl>
Date: Tue, 2 Sep 2025 16:41:57 +0200
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
 <e007ee80-2eff-4859-b2e3-402950081b4f@topic.nl>
 <ae28c7e0-6ea1-4a0a-b923-d3906d71141e@kernel.org>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <ae28c7e0-6ea1-4a0a-b923-d3906d71141e@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR02CA0156.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::23) To PA4PR04MB7790.eurprd04.prod.outlook.com
 (2603:10a6:102:cc::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PA4PR04MB7790:EE_|AM7PR04MB7078:EE_|AM1PEPF000252DB:EE_|GV4PR04MB11380:EE_
X-MS-Office365-Filtering-Correlation-Id: b60307ab-74e8-46f7-fe53-08ddea2ee138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|52116014|366016|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?b09xdndmMzVqZkVaQXJ0Nk02QXp5M21kUnVucjR1Z0FYdVJiZnM3d3UvKzJj?=
 =?utf-8?B?SlNudncxc0g2emZTY1NsMFFYRWM4OFpLMlY1eUVBazBNc1Zrc2h2OGs4RzBD?=
 =?utf-8?B?aUZWenVrL0o2bFRUMDJTSjhLQUNITzl1Q1hkeGo4WjZFVldudEFpbDBHZHEy?=
 =?utf-8?B?dldPeU90NDBURnBCV1F1NlVpK1dTQmZ5OHVRMllBVE9PTGxycjNpQmdheDZZ?=
 =?utf-8?B?bTFyNFluNHV5ZThlWGxmSWV6bjM5cTRCREoyUnlTNUgxU25RMWhDYVk0dWJN?=
 =?utf-8?B?Z0EyeFp4cUxvWnIvK09xdytvUzc5UFpEdEhkVlhEdjJqRi9BNjNJUWVMSmov?=
 =?utf-8?B?M29VMk1BUWxrakRIUUhJNWY0NFgrTmY0SmZjUUxpa2xSay8vdGtCM2w4dUw0?=
 =?utf-8?B?d2ZHaVd0d3dwUDM4dG5QaDdFdGdoWEQzeXVwRDhrVDB3Q0hKL09hcVduZHhH?=
 =?utf-8?B?MTIyTWp2Ni9KZThLSGlGK0MxUnk0bkJWNmwvRTRSYTZ1L2taYjRLbWxETEVm?=
 =?utf-8?B?U3NGWjNkbEliQk5uRVFXSjc4KzVBTVNPRnh5bStkbklzbGdvZVA2RE5KYUhw?=
 =?utf-8?B?dW5vVUlxNzNXSGNjYTJZRVNmemRCeEM1NldOYnZrZjQwN3VZYnMrRzc0aUV5?=
 =?utf-8?B?b0orSkVBaVlwT0JySHRlSEJRK05jcS9sV1FzZjV1S0crcW1KeVVMMHY4Z3ZX?=
 =?utf-8?B?SG9jaWd2dWcranJGblptSG8rbzNqMFBGVE14aW9lcGpFanM4YlJXcjR5N0M2?=
 =?utf-8?B?clF5QW5XZVJrVVlYaml4SDVScFM3OHBWVGFQWUZ1WGJNZDZKVjBHd1JBU0dp?=
 =?utf-8?B?U21NMG5kd2ZiZVdxOVVrcnNDcGxVbmw0UDFZZ3RtaXVNdmNiNWJUb2ppTVBK?=
 =?utf-8?B?R2NtelJob0tIQmJ0azQ3TlNXQ0gwOHpWWDBLMDFwbHNsMXQvWTV5VVZUTy80?=
 =?utf-8?B?YTJNTzVvbkplUUVWT3BMeHh5YkVIK3AreUQrQ2tUWmgzYWtrd09rUDNSdU9r?=
 =?utf-8?B?RTl4aEFPRHVDc2VEbnJGY3kzcHdOd0hFb3JLMllXeUV0SmswSWE1M3VJUTh4?=
 =?utf-8?B?SVBaMnhCS0VqNy9FcVduZHNrUmt3MHVLNHlJNTRSRlNKY2hoTGJpWnNHUGlq?=
 =?utf-8?B?TGVxNFFJa2VEcFUwSGx3VFZuTWJpYnQ5dTBPTmVDbUY0SzFMSytyUmhJaCtz?=
 =?utf-8?B?a1Z2SE50dGdtSjVzOFM0cDhCQk9Dckd2VmhORjd0SU5VcEpkZW5paFFDUlpp?=
 =?utf-8?B?ZmNBOHRYR1pFMWF1RmJva2VjS3BwNmppeTViUDhuekwydyswM05hOFNIUXVC?=
 =?utf-8?B?T25lU1M2VFpsbmFzOWwyQXAxTzM3TUlSczRZek5ieGh6WjVrNXMzWXl0OU1P?=
 =?utf-8?B?MEozN2lPcnJDdGloY0VxNTQ3OUdIcFVGVERkUU5XQjNSNXBGT0trNFJ3TE8z?=
 =?utf-8?B?eTZRZWlQdTUrTVRXY2JEcWk0eGJQUmR1TTllalR3T1NEZHNscDRmbU0rRVNs?=
 =?utf-8?B?R1o4RkVROTN2dmdaa2VjU2FjZVFUMHBaSlVFZ0UrcEx0ZjdBMk8rd1Q1cXIv?=
 =?utf-8?B?VytNazhYK3p3d2JrVm5qaVVib3VzSVZrRWZZdCt3NUxYbkxzTnhuVllOanYr?=
 =?utf-8?B?VDBsaVBYT2wzVHJybk94ZWJzcWQ2cUdyelBNdlJvL3Qvb0dkdlVnU2lCd01Y?=
 =?utf-8?B?bmt5NTV3MlVlSmVyenl1cUZkUDdwRVJBUUtGVU9JUzB0RzQzdmlRQ1pIc2Rn?=
 =?utf-8?B?cUpEN3hMWWJTZnl4b3VySXhSOVFidHNjV1R4ZWNuV0t2cGJnNzl3VHQ0R3ZL?=
 =?utf-8?B?RFdsUzgxUmhqVlFjM1gwdmFUb2F5Z0FtdlkvNTZacDJxckpRVnZPTS8rVXF6?=
 =?utf-8?B?SExnaVM1U2IxNWtoaWxNMzZvVVljeHF0bmlONFpRbkdSQTdWNHVYL0pGa0JU?=
 =?utf-8?B?YTdiWFEzOEJNVEJJMVc2UWpZbDZuU0lLalFSOXpTRTNaSFc3QlZnWHlJTldB?=
 =?utf-8?B?QnQyUUhPWUpnPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PA4PR04MB7790.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7078
X-CodeTwo-MessageID: f1fd6fb8-4884-4fa4-b132-91f635578491.20250902144201@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 65b7302e-3dbd-49d4-f859-08ddea2edf28
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUFMdHVKMXJnaUVwWUtVeVhQc2cvZUlvUGpYamtVTWpIZFRzb3JNbmVvRkVq?=
 =?utf-8?B?NlBFZlZOSzlreWZOTTZuYlcwRTBDS25rT3Q1b1huVHQxU1Y4V3JEVjc5RFdT?=
 =?utf-8?B?M2lsQUlTMGJSUzFIMUsraHBIajRDRmVWa0lVZVJ6TUhuUkh2NVZVRVl0Nm52?=
 =?utf-8?B?ZWJSTlF3cEpUQTd4MGx4N0trRzlRRmp5dnRiNVVvOUpVRTBJZ3lQMFRWZDlP?=
 =?utf-8?B?dU12RWhKY1RFWDRPekRUeEJwZnRxUlB0MzVuSW9vQ2dRUjQyUTBiT01Ib2tU?=
 =?utf-8?B?RW53K1doendWSStHZmhiT256RWoyd1cyTnZNSVN4RHZPM3haZTVpOTRjUG96?=
 =?utf-8?B?TU5MRisrbzFBWEJNdWpmWlpRK1pWVkFjcjBuVGhqOHVPNG83YjR2WDl0WUlo?=
 =?utf-8?B?eDBXZlZ2QnBNbFoxdngyUHFkc3VEL1ZzVElUMmpQMmpWSWpQUmJoYzJNQ1pt?=
 =?utf-8?B?UjBnUmlMaEhKaFY5eWtKMUZQazlWamVCY09LeURxOUhFRS9TWEpPNVN5bmJG?=
 =?utf-8?B?YmZqbURNaWwwZ2J5RXBHMnlTRlh4MWFTN3ZmSVgxNnAxSWc2YWpEd1UxUnpl?=
 =?utf-8?B?emVSUUhVQmVTMW51WjdmT0F2b2lic245SWNHNXl0VHc5bTJJVmh2SzlzYnNL?=
 =?utf-8?B?T2hsc3pjU3p3K0xvZVk0eHR1UEJtSHNDTHJKcHBwMnRNcnBxMXlLWldOMFEz?=
 =?utf-8?B?dDZlOTlhUFI1QmVUK0E0dEdrSjZuSHRGbkFMaHFjb1ZCVWlVNDhKTVZwbXB2?=
 =?utf-8?B?Q3dWOXp2N0s2L0ZVUGRRMHFWY3ovZWVBdzVDcG1hL3NwNFltemVyRE1hTElK?=
 =?utf-8?B?VGsrVVNOc21QS2szcURPS3NpOE5XYTdNQSt0dFZjOGhzeFJFRVpZNHpqVU9C?=
 =?utf-8?B?SjA1eDlqQWppbWhBWHM4R2F3N25PZzVEeVVqalVUT3hoYmFUL2FWWi9maE40?=
 =?utf-8?B?SlV5VWMwZXp5NnpNUml5RXgyVWhaaXArL3pVdDViQnM0SElybUNOWmg0ZW1E?=
 =?utf-8?B?TnkzWTBDZHh0SlV4Q3pNN2xqcGFZelZ2L1MwOXl3MlZFNUZta0wrZVdJTVdr?=
 =?utf-8?B?b29BTTlBWklra0VjTzZXVTNDSWxvZTdWZldaN3ZFTThEQTNMN1hiSkJtWDVu?=
 =?utf-8?B?RXR1R25kclQ4dW5UMnRPQzFacnNneGR2U01Lak1rU3lPTDVmaGdDeStuTmdW?=
 =?utf-8?B?dmpiRnp6a3RHYjUvZDlHWnVDVG0wMTgzSU5wbVBOWW9KOURBRDk2RVMwR01n?=
 =?utf-8?B?U2lGZUcvZ0RXeHZLU0hPaU9jQm9YVERxWnFIZ1dweFdaWEw3Qmt1aHJ5SmY5?=
 =?utf-8?B?cWFXYjUvRk9sWjkwYU9FcXVST2w4RlNIVnRQczhpWHpNbTVwL0RWN3M3Nklm?=
 =?utf-8?B?QVFQUmd2VlhoYmViVUdOTE9CWFFhcVRGdzIwYnpnOGlaU3FvY0w5cVhwUlNJ?=
 =?utf-8?B?cmRYVnVWMGNtRm9xWkZTN3JQbzdiZnZFTDNhMGhwT0tFV2RUQ0Y4cVNMVHcx?=
 =?utf-8?B?N29aeEcxQ2xvTW91RW1mVkZIdks1SVk4SnVjVXkwdlQvUnFuSjc0aTRiWjha?=
 =?utf-8?B?UGE4VnhjMEwzV1lJYUdYWUp4K01WalBiMGNnNlZSUDByVnUzRkgwRHFXZ2JV?=
 =?utf-8?B?RGlaNUdWb05xKy9haHh2UHBYZ0Uzd2E0WVEwQklPdEx2RktrNUhSckQ2Mkpz?=
 =?utf-8?B?YmdJV3NUbEtuWHEyclBpcGlmMGhnS3g4Z3Yrdm9MQWN5STR5V05TNjlIaFkx?=
 =?utf-8?B?cUVGSkJ3K0krc21rNlFrYmdqU2ZXYkRVbkhGdEdaL0NIeXNnb2lIcXhGZENi?=
 =?utf-8?B?ZTNxK0hRZVNzNnlHNjRDb2NIOExqTllBenVrWGMxWndSUU8vMlNQd2pGQmxz?=
 =?utf-8?B?MkRLcU9tRG8rSi9pVWJzSXhMaW85byswWmhIQXJnQTJRaVp5S3VUMTBJaVdO?=
 =?utf-8?B?aFpubFZoekhCclJIRjJBcTJ1TmY1aWw4eUc0ZWNXbU0yZXVUNzQvSkFGMXJO?=
 =?utf-8?B?QTAzUCs1cGJKWGF4dVRHNXh4Y0E5bnNUcHd3SXhycjdEd0ZiTkZ5b09sOGRO?=
 =?utf-8?Q?qBp979?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(376014)(7416014)(36860700013);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:42:02.3399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b60307ab-74e8-46f7-fe53-08ddea2ee138
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11380
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

On 9/2/25 15:46, Krzysztof Kozlowski wrote:
> On 02/09/2025 10:46, Mike Looijmans wrote:
>>>> +          endpoint:
>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +      port@1:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description: Video port for HDMI output (panel or bridge)
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/media/video-interfaces.yaml#
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +    required:
>>>> +      - port@0
>>>> +      - port@1
>>>> +
>>>> +  ti,source-mode:
>>>> +    type: boolean
>>>> +    description:
>>>> +      Force chip to operate in "source" mode. Allows to use
>>>> +      a TMDS181 chip (which defaults to sink) as cable driver.
>>>> +
>>>> +  ti,sink-mode:
>>> Aren't these two mutually exclusive? Can same device operate in source
>>> and in sink mode simultaneously?
>> They're exclusive, yes. Will add that.
> Then either define constraints per variant in if:then: or maybe better
> use string enum. Not sure what applies where, so tricky to say which
> choice is better.
>
> Best regards,
> Krzysztof

Since there's already going to be an "if" block, it simplifies parsing=20
to keep the booleans. My first attempt was this, but that doesn't work=20
as I'd expect. Adding "slew-rate" to the example dts results in an=20
error, so apparently the "if" block doesn't do what I think it would and=20
I haven't figured out yet what the correct syntax must be:

if:
 =C2=A0 properties:
 =C2=A0 =C2=A0 compatible:
 =C2=A0 =C2=A0 =C2=A0 contains:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const: ti,sn65dp159
then:
 =C2=A0 properties:
 =C2=A0 =C2=A0 ti,sink-mode:
 =C2=A0 =C2=A0 =C2=A0 type: boolean
 =C2=A0 =C2=A0 =C2=A0 description:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Force chip to operate in "sink" mode. Allows t=
o use
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a DP159 chip (defaults to source) for incoming=
 signals.
 =C2=A0 =C2=A0 ti,dvi-mode:
 =C2=A0 =C2=A0 =C2=A0 type: boolean
 =C2=A0 =C2=A0 =C2=A0 description: Makes the DP159 chip operate in DVI mode=
.
 =C2=A0 =C2=A0 slew-rate:
 =C2=A0 =C2=A0 =C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
 =C2=A0 =C2=A0 =C2=A0 minimum: 0
 =C2=A0 =C2=A0 =C2=A0 maximum: 3
 =C2=A0 =C2=A0 =C2=A0 default: 3
 =C2=A0 =C2=A0 =C2=A0 description: Set slew rate, 0 is slowest, 3 is fastes=
t.
else:
 =C2=A0 properties:
 =C2=A0 =C2=A0 ti,source-mode:
 =C2=A0 =C2=A0 =C2=A0 type: boolean
 =C2=A0 =C2=A0 =C2=A0 description:
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Force chip to operate in "source" mode. Allows=
 to use
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 a TMDS181 chip (which defaults to sink) as cab=
le driver.



--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl



