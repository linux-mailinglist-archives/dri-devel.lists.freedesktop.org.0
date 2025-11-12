Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E6C5224C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 13:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B2410E6F9;
	Wed, 12 Nov 2025 12:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Z8aXojaT";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Z8aXojaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022129.outbound.protection.outlook.com
 [52.101.66.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8F910E6F9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 12:00:32 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Num41dLVzBqPRRPAfamAZov8Up3rl8PmjGxoT6qMhfL6ZjayxhaGmFbSjXYZsA13s2lmjLoE25JgCb6gPIwXGyDnaQVWQkWTVwq0Idmvr7bFFRZ6rS6uWVQpZQB/PWM9LX6EHlThFokPqLWQXEyqwykYvO2InhkGWPxln30EtHQHii2YBk7zjkK9EqF5sATegV71mev7Gn6tw12qGc8v/3utuN9p1sawQtWIiSg7mm7daNUosRqITPxuaponFgI7OvF+5V1Pa7pP/cEbq721QHiE27o1wxHtOR5uVWSAkxtodrVewOpE11Qs614eGUsRlV+0WoBVvgweNjJbN4Vq0w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICM5HQbhE1lyRKUlPWIxnvdRx5ippLuG7AlREcjW88Y=;
 b=wal5UZ+M0TSqUlHGzxH3GiCY4+2TLkrFiCTZQfGNOfI+6kvN1mw2jpYtgkEk1FfBohrU0lm1Jq4fsV1HzjCeO03Ahdm/aGe+g2D/hLZbtS/zl6fKV3vU+Hlj+KQj75Ow/TdVj0sUsivwG94/WzGW1XL8dAqXzyhzaseY6yWDY8Su1UDxax5EMRMOY40CjNUvvq2po8hi4pokvH5781iXqfUUy6EUlZaVNYJrcvT5DAIahLFIwzDXrXoPzq4ZbaCUS2OCx6pdB6wovKFIWqrUbupjBmWS5deDh65obDDXpuSFfgB5SeH53AIsjout9o/kd5mBFW54D4Bonvser6nLSg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICM5HQbhE1lyRKUlPWIxnvdRx5ippLuG7AlREcjW88Y=;
 b=Z8aXojaTM++R5nIElfUEqG/6lf9XiLl0g2SAJBo6daeX/TWPf7CyNmsmYqHKBsEdxT1w3kTwN/vrEUb07N/+/NhDqTtW3v6+JIUYWE7mVC4gEfcU9yTsLzpbVeczSxs5V1+fv8iAC22WKamGdy2tdOzGp+kfA3Fmef0JsDWpoRQ=
Received: from AM8P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::8)
 by MRWPR04MB12096.eurprd04.prod.outlook.com (2603:10a6:501:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:00:29 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::78) by AM8P191CA0003.outlook.office365.com
 (2603:10a6:20b:21a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 12:00:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Wed, 12 Nov 2025 12:00:28 +0000
Received: from emails-4441287-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-162.eu-west-1.compute.internal [10.20.6.162])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 45A398037A; Wed, 12 Nov 2025 12:00:28 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762948828; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ICM5HQbhE1lyRKUlPWIxnvdRx5ippLuG7AlREcjW88Y=;
 b=OAHESZhuZ9dLMtk9ASNtNUkc+hmlhF7Bi+EjPQDZ51UL8H39z6gfcQd5ewgIjbTD4DnGN
 IZvG50fZPUcnjcGnRo9df6ZAKMk0CcQIo9IMrtMlsYV3AY+vXRudfELHS9TlmpsgPdcqV3q
 mvZCmw/asWhLsg4148Qg0jRbF652quY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762948828;
 b=FmbbZfM5ifzNKylejoY0OlrX++j080dEFFZbYjRTepOV7Hfq96Pe+zhN6yL6GBLmV3eFr
 UNQBtCoSodk2U4MlaT5XEG1GHIAa7jVr38/w3WikX/Kd9pzChpOHs6pq3JMlmp3lBTGqiJD
 AhhicMEcyFXu2sBi7ag1TKS3MNq/UN4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrJgsxfmepC+GldXOA8YMJKQgSt3gYJM0al4IbPxVaFOy87T8+Q4vqPz9f7BSXgjXXqO3vEJ9ihCJmXNQHYixC9qNB0R9wglIxDgpXUBsSU8fjeDFsQWjDmu5Of8x+bgfhoW8rg3eSsvPeBmVWgCPHQ37nLY71L+bmcrTcJwyMrRuB2P+X+OtUmf+vjBn53qCYXDr23409PH57ov+IvjKlxHQtTq0rtDBLy3yN7MdJu4bdU1W59kEf9AQYlD9rQlQQUCqtZmpoEsZXyy1BE+1A8B0oK3qiMU4m7K21wFunQjRN8oI+jMNMQVfAAAVsIdqna3MzFFqdsrZRUAXDEIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICM5HQbhE1lyRKUlPWIxnvdRx5ippLuG7AlREcjW88Y=;
 b=PQKxetNXqgoHgNDw8DSpvu3nLh6X3QT4x3V6wBstEobEAR4mLouXZxIljkEYJWEro134XE5bSyP1gR5Am/gENnHNVig74K9C1n9QEgeQTMRe2Y6aL07sQ/POqsuepeK1wYuECGQ22GACh7nqMp3STc14tqfDZfUQI8QK5+WnB9rahxBQ/r2H4C7OTGTvhwi348HALgrUGs+Q1GkeWFLORDOP6yLYC45oyyoVEdeBMs4cJUSDn5seU/d5UaQog9/pJp8xATxoMiqXQBsxiEfOviJyWGk0i1gEn6XvaQpQZh+n+5zBITJBlNx2Pe38QR5tBP9cLKprvElkBMsUXM7hIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICM5HQbhE1lyRKUlPWIxnvdRx5ippLuG7AlREcjW88Y=;
 b=Z8aXojaTM++R5nIElfUEqG/6lf9XiLl0g2SAJBo6daeX/TWPf7CyNmsmYqHKBsEdxT1w3kTwN/vrEUb07N/+/NhDqTtW3v6+JIUYWE7mVC4gEfcU9yTsLzpbVeczSxs5V1+fv8iAC22WKamGdy2tdOzGp+kfA3Fmef0JsDWpoRQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AS4PR04MB9574.eurprd04.prod.outlook.com (2603:10a6:20b:4fc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 12:00:09 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 12:00:09 +0000
From: Josua Mayer <josua@solid-run.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Fabio Estevam <festevam@gmail.com>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, Conor Dooley <conor+dt@kernel.org>, David Airlie
 <airlied@gmail.com>, Yazan Shhady <yazan.shhady@solid-run.com>, Shawn Guo
 <shawnguo@kernel.org>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, Jon Nettleton
 <jon@solid-run.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Maxime Ripard <mripard@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 00/11] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Topic: [PATCH v2 00/11] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Index: AQHcT9wncG6NjCknz0Ot90pgyiOua7Tr/oYAgAL5ioA=
Date: Wed, 12 Nov 2025 12:00:09 +0000
Message-ID: <86243f0e-3503-4ccb-ba3a-afd2c24a5472@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <176278493126.154536.17870405687578843628.robh@kernel.org>
In-Reply-To: <176278493126.154536.17870405687578843628.robh@kernel.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|AS4PR04MB9574:EE_|AM3PEPF0000A79C:EE_|MRWPR04MB12096:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acfb20a-1224-4674-4526-08de21e312a0
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?NDh4QngzZkhEM1pENkRtYTRIQ3pMZHArVEFhV0l6TGFTTkxGeTJMazhzNjM5?=
 =?utf-8?B?SCtXRFcvOU91cGMrNE5meEJQWmZaUjV3NlJKQlo2dmdzRUR4bXhwNTZNUndZ?=
 =?utf-8?B?YzNjUCt2aWFaTGdYN2ZsQlQ1TzRSMVRmSExmdW1yR0lncVBGNDg3WEZGSHNu?=
 =?utf-8?B?bExPUytkOGhJWWUwazhtaHQzUlNZVWU5dkEyNlZqb2Z0VjRuQWJXV28wOWZz?=
 =?utf-8?B?ZEF1MjhqUVBKbklsbzkyNk81aXo4K3ZoczFrcVFZRGdnektFQmtEUlVZUnl4?=
 =?utf-8?B?SVFpc3JPVFQ1eDBlYTI1MTdYZXJhbmRocGhHSUh5dTBUaGVvcFZ6MFM2THN6?=
 =?utf-8?B?N1l3dzByZVpjeUoyaFdCaXc4WHJoZTNYM0ZqY2J6Z3dxL0RwcGNQZmR6cHlR?=
 =?utf-8?B?VVZ3Ym9hV0szUXh4U2FIeWZ0d3NGQm1MTmlHZVY3WGo3cmwxSW1rOFBkVXFF?=
 =?utf-8?B?c1BiL01IeVFMSHhyZmN4eUdyanM2Wmgwby8xdUF0SkxKdHJ6Y2FEeGh3b3Zt?=
 =?utf-8?B?K3BGSFNyTE5uSjAzOHZvYlJlUFhqeVFwaVhhaVV2Z2xLaUNhOU5SYWJ6UmRr?=
 =?utf-8?B?QkY3dUpEZnJtN2w0amY3Qlo4UGRXVGZhK090eHR6cG8wM3ZoNVZaUjVSRitI?=
 =?utf-8?B?OEFyeVJSZUI4cVl2WDNDSjAyTnNvbTcyZDlXeGFQK0lHUFI3ZzQwaFhnR2c2?=
 =?utf-8?B?VlJIbWVhNEdZRS9nZ1BTOGJDVW9XSGtlblZUbDhOZkNTaThTV0U0VnA0ei9o?=
 =?utf-8?B?dTNLZU5CeUZtc21ST1FmcjF4QUcyVSsvbU8ya0kwUTJxQ2VRT3diUFFKdXpF?=
 =?utf-8?B?OFN2TzMrOVcra0NyRjIzd0pzY0VLbXQrbm95OXg2VTFoaFZUc2lNVmdJdHpC?=
 =?utf-8?B?VUhscmNwbk5mamc0M0pFUWJCYldBUGVyaE5McERDeE82dTl5VkhpcG9zVGVZ?=
 =?utf-8?B?dDFRVnJyUklpRFNpM1ZvZUlUVi9BT0lwejlTNkJOTVpmVWFJZkY0dGszZTVs?=
 =?utf-8?B?Q1dSMWQ3M05iWEk2ejBpRS9FU0RzamFvQ3NOTGlFVVZLWVVwSlJyblFVK3NP?=
 =?utf-8?B?aVFodWFHS01uZERZU2VXOW9YalJ2ZlJTYnR4dHNCTXgrSnlvZ3JPMEFtWU4z?=
 =?utf-8?B?OENrN2x6K3dWZEJoT0Yrb1dBZXpKRE1hRkFGNGFMUU4xTjdvU25CaTZoMkNI?=
 =?utf-8?B?YnBKV1IwdW5WaUhReEVtQ3BFRWJTYktRbklDNjBqMWNXeGM5NlgvWXYxaVVH?=
 =?utf-8?B?VUxubnNEb1o4T1Z3M1h3czc4Um15R0NSWml2eWRqTVAzT2FNblh2NlZlS2R2?=
 =?utf-8?B?dFRCTXNrdEdLd29zekdyMGQrU1hPTUlMVldJU05mRWNOVCtNOUhOclBzd1pj?=
 =?utf-8?B?N1FlSU5SbE4wR0psZHlmQnJxTmVQY0JiZlYydUw0aThnQ2JleFRqZjlXaUtF?=
 =?utf-8?B?SjJLQS9tbUZ3b1ZmR2xabVpCZThOeTN5aEZlNjcvSENZbTIxaW9Sa3VFRy9j?=
 =?utf-8?B?eWJZWTBHUUFlcHNlTThnZWg0dWFrNGI2WmV5WERMeW14eldORUMvTnZlcnlP?=
 =?utf-8?B?b0pkeHYxdnMwTzVsY25SRFgrbnE5VmZ3RDlFZjk3VzhjZFREekIzNWNZai9V?=
 =?utf-8?B?endnemRKVnpFaE1lNjJDRUFPMUF2a2dVeUpMM1Q1dS9iblJNYytGaTFjZTZP?=
 =?utf-8?B?UElOMzRBNTdRbU5vekR1Yk9pNXZtRzQwUStyUmFCbzJSOWE5b2Z6bWNiaFdC?=
 =?utf-8?B?UFhPSnUyMStKWlBVbWJHRklSZ1dHQy9qWi9FOUpwKzREc2p4QW9DZ3YyWVZq?=
 =?utf-8?B?VnBsaURDcWE1Y1lmRGtkUmJvR0RYeDA4ZUZNdGYvMFZ5Zy9XWXArUFQ3MVRE?=
 =?utf-8?B?NEJSeWhRSVkzOHNqZ2dOMnVhbXI1MnF4eEQyUWdVaWlvRkt6ditlVjhoQVhN?=
 =?utf-8?B?VTFSTi9iUWlXZHNiUmg5c2dOQzJyTUVQSExEUzgrb2dvWWM1Z1FMd2s4a0dB?=
 =?utf-8?B?SVFtOVRzTW54R2NvQmFEQmNOTGd6cDZ4aXkyYnl1WXVMMmtBSVBhTTdaUGdZ?=
 =?utf-8?Q?eXVs5V?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7449D034D368241BD8943D4DEFA0E6E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9574
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b3ae980f3782422aa28f262ef85ea72e:solidrun,
 office365_emails, sent, inline:6273f2d083b509b7e5b28bf9973f3f61
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 147cf19f-2464-4936-36aa-08de21e3072d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|7416014|376014|1800799024|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEFzekRHRWVuT24xN013Nm54NGdEUHoxZGVSSlRvdU5hRXdzMHNoQVl2REVj?=
 =?utf-8?B?ZHdURisyY2pQR1NDbG55MHVISllWU2dlRTVUZzdiZ0RWb3ptV3VSVEdzQm0x?=
 =?utf-8?B?RWJ5OUsrMmdDVTVDckZ0d2pnS2RFNUU5UDYrYmhKdGhRVS9LSzl2Sy8veUZZ?=
 =?utf-8?B?blp1U3ZhWE5EZ0tXdjdHUVJmdVRXTStmTkdSbXN6SHc1MTBRRmtlc2RRVnk2?=
 =?utf-8?B?UW9NdlNqcExlNU1FajZZY0YybXhZSEpEcklkSTduTnZmb2QzdFlrZzI1T3o1?=
 =?utf-8?B?bGl2d1NjNktJVnRVQzh5LzBWNmlFNEovcnJnOVR6WTd3b1VweVpYbUZNVHI5?=
 =?utf-8?B?dWkyMW43N01ObDdFa1VTcmREQlpHaGlqMDFxKzB6clo1WmE4ajV1em5tcW1Q?=
 =?utf-8?B?eXFEN2QxTmVTbEdEeEtyc0NzWjBBcVhZMjRwM3hjS1JGVkFiK0loMGtUaWZY?=
 =?utf-8?B?R1gvYjNGaEFubFhRWFhUQVJ5Y3g2UlBuR09kK3lFQUk3Tk92YjBMclNESUlO?=
 =?utf-8?B?dmY3WG82Nzk1K3Q3NHpreFJkVkxQVndXNkpnZ1R0dWxYRy9QOWRIZWw5MG9P?=
 =?utf-8?B?RG9KRERlTlBIZmNvK2tNOGxRMEpTdHlJWWJwdjEwRXJ5cmJBaTVzVkR3cmZT?=
 =?utf-8?B?aFFGVVhXR1ExSmFueFgzOE55dFpnT09RYjZwdTVTSnRrZ01BZEdjelRjVG1B?=
 =?utf-8?B?dWNqVllHMStzTlJhMmNZWkd3WGMwcE1hSC9LUDBrcy94N3BOU3Zza1NaRURB?=
 =?utf-8?B?MFFjYzJ0S1V4SmdPN0JZYXVoYWNjWGNDUHQwRGlzalExZ1NGa2pQc3VPRXdr?=
 =?utf-8?B?Rk5XOFdFaXgyYVQySUs2N29mY1JzZUJGb0pOMDVLOTdseHlPSTJKaFVOMldQ?=
 =?utf-8?B?SzJIb1RYaUJGOG1tQ3Vaams3aVZmQ2tsdmVyaUw1Nk13QVAyL0tBMWlPUERa?=
 =?utf-8?B?NVlHMFVlRktjU2RWTHByUzFKdzZGcHhIVWptOTZubXhEWTQyWVF5cHEwYk1J?=
 =?utf-8?B?VlA5eElHY0krZEdQTzJNZTdMSjd4OVVEa2Q5WjdaYWg5RERnR0c1UzVlb1Iv?=
 =?utf-8?B?eW55M0lrRWhpaXlieEZZSDNXWUFVVVYyalZQK21SQXZZRjBvUW9SQTV0cjVz?=
 =?utf-8?B?RFF3cXFpdEFnRFU4WWlEQkorZGovVFJPVzdrUFFPcERqMVJKRy9MOFZEWWV5?=
 =?utf-8?B?c1Zmc0gvN1NWNHJPclJNS2U5SkFXY213UmFHK0dyRGFtM0psekdmSFp1bnZu?=
 =?utf-8?B?Z3FYVUd2TDY3R0lkVUttYW05a01iYkZ0RzNKekhlZnBWVmJKalowMWx3TmRi?=
 =?utf-8?B?c3VjR1RXNFFYM1h6RnVVeW9xZEhLejJBV3FHbnlLZ2JLSmFHcVBzaHRHYnFq?=
 =?utf-8?B?WWp6WkdmQktPK3F1Z1c0bkRlTWZ6ajdXZ3NUcm1SRkxlZ3pSamV3WFpsWlEy?=
 =?utf-8?B?TU96U1FXWWFJUGdQTmZ2TkpYMlNMbW9CWjE3QUxKZGxwRk1vRXRuVXNLUmor?=
 =?utf-8?B?MGgrdFk1Wmtyb1BpbEV1ZEhFcmhDSlVSQkV6dkhYd0M5Nko3WG12djZsQ2ZR?=
 =?utf-8?B?ajNOcFZsa0JwMnMxa3dPQnFuNm1IQlJnMWpQTSsyVHZNOFNuenpreHQ4SWRZ?=
 =?utf-8?B?L3g2VUdyRDU0YlUrV0hPeHMzUDdTVkFFSVhFOTQ4SUFzSHhyS1BKRDA5Qitr?=
 =?utf-8?B?S21ta21yL2FlbEdraWRwcjNqQ2VvdG4vSzNGUzdOdzJWVlIvcGorN2hjMHdo?=
 =?utf-8?B?bWs0dEhWVWtHRnpwU1Q5bllkUklLd256TS95TnMvalVIQmZZV2VXNy8rMG9v?=
 =?utf-8?B?bk5HYXlmSGM2NUJtY05tejVHZ2NCWGJSTlAwemQ3ZzZxNisvdkUzblV4RHAz?=
 =?utf-8?B?enBsL2s5TC9WUmtHT2l3WjdvWUV6UHc4NnFMSTNKSEZDODh6aUZWWTRKazNs?=
 =?utf-8?B?VEptdnpIWkJUV1psUUlIY3U4U1N0NStPM05qbS9hMzY4ckQyK29TL0cwSVhk?=
 =?utf-8?B?ZGUzWkNkSFI0T2VxTTJtaTV5Z00ycWRPQUljSUFCM0I5NVZGZm5SMytPaFhE?=
 =?utf-8?B?KzVwdU4zM2U0dVhGY0hycVpoa2xRb2pjRlRoYjU0QlRuWUc1cG9BbjZ3anBu?=
 =?utf-8?Q?sLsk=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(7416014)(376014)(1800799024)(35042699022)(36860700013)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 12:00:28.6071 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acfb20a-1224-4674-4526-08de21e312a0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12096
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

DQpBbSAxMC4xMS4yNSB1bSAxNTozNCBzY2hyaWViIFJvYiBIZXJyaW5nIChBcm0pOg0KPiBPbiBG
cmksIDA3IE5vdiAyMDI1IDEyOjQ2OjA3ICswMTAwLCBKb3N1YSBNYXllciB3cm90ZToNCj4+IFRo
aXMgcGF0Y2hzZXQgbWFpbmwgYWRkcyBkZXNjcmlwdGlvbiBmb3IgMyBTb2xpZFJ1biBib2FyZHM6
DQo+PiAtIGkuTVg4TVAgSHVtbWluZ2JvYXJkIElJb1QNCj4+IC0gU29saWRTZW5zZSBOOCBDb21w
YWN0DQo+PiAtIGkuTVg4TU0gSHVtbWluZ2JvYXJkIFJpcHBsZQ0KPj4NCj4+IFRoaXMgaW5jbHVk
ZXMgZHQgYmluZGluZ3MgYW5kIGEgcmFuZ2Ugb2YgYnVnLWZpeGVzOg0KPj4NCj4+IC0gZHQgYmlu
ZGluZ3MgZm9yIHRoZSBib2FyZHMNCj4+IC0gZml4IHRvIGRzaSBwYW5lbCBiaW5kaW5ncyByZWZl
cm5jaW5nIHBhbmVsLWNvbW1vbiBhbmQgYWRkaW5nIHBvcnQNCj4+ICAgcHJvcGVydHkNCj4+IC0g
Y29zbWV0aWMgZml4IHRvIHNvbWUgIHNvbGlkcnVuIGlteDhtcCBib2FyZHMgZm9yIHJlZ3VsYXRv
ciBncGlvDQo+PiAgICBwb2xhcml0eQ0KPj4gLSBmaXggZHNpIGhkbWkgYnJpZGdlIG9uIGh1bW1p
bmdib2FyZCBwdWxzZQ0KPj4gLSBjb21waWxlIGR0YnMgd2l0aCBzeW1ib2xzIHRvIHN1cHBvcnQg
b3ZlcmxheXMNCj4+IC0gZ3Bpb2Rfc2V0X3ZhbHVlIF9jYW5fc2xlZXAgY29udmVyc2lvbiBmb3Ig
cGFuZWwgYW5kIHRvdWNoc2NyZWVuDQo+PiAgICBkcml2ZXJzDQo+Pg0KPj4gT3BlbiBRdWVzdGlv
bnM6DQo+Pg0KPj4gLSBIb3cgdG8gZGVzY3JpYmUgSFgzIFVTQi0yLjAvMy4wIEh1YiBwbGFjZWQg
b24gYSBVU0ItMi4wLW9ubHkgQnVzDQo+PiAgIChhZmZlY3RzIGlteDhtbS1odW1taW5nYm9hcmQt
cmlwcGxlLmR0cykNCj4+IC0gSXMgImRlc2NyaXB0aW9uIGZvciIgaW1wbGllZCBub3Qgb25seSBv
biBkdC1iaW5kaW5ncyBwYXRjaGVzLCBidXQgYWxzbw0KPj4gICBkdHM/IEUuZy4gaXMgdGhpcyBj
b21taXQgc3ViamVjdCBhY2NlcHRhYmxlPzoNCj4+ICAgImFybTY0OiBkdHM6IGFkZCBzb2xpZHJ1
biBzb2xpZHNlbnNlLW44IGJvYXJkIg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVy
IDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBm
aXggc3BlbGxpbmcgbWlzdGFrZXMgaW4gY29tbWl0IGRlc2NyaXB0aW9ucy4NCj4+IC0gcmVtb3Zl
IHJlZHVuZGFudCAiYmluZGluZyBmb3IiIGZyb20gc3ViamVjdDoNCj4+ICAgaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTctcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdA0KPj4gICAoUmVwb3J0ZWQtYnk6
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4pDQo+PiAtIHJlbW92ZSBvbmUg
dXNlbGVzcyBjb21tZW50IGZyb20gaW14OG1tLXNyLXNvbS5kdHNpIHRvIGZpeCBsb25nIGxpbmUN
Cj4+ICAgd2FybmluZy4NCj4+IC0gY2hhbmdlIHJvbmJvIHBhbmVsIGJpbmRpbmcgdG8gaW5oZXJp
dCBwYW5lbC1jb21tb24gYW5kIHN3aXRjaA0KPj4gICBhZGRpdGlvbmFsUHJvcGVydGllcyB0byB1
bmV2YWx1YXRlZFByb3BlcnRpZXMuDQo+PiAgIChSZXBvcnRlZC1ieTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPikNCj4+IC0gYWRkIGR0IGJpbmRpbmcgZm9yIHdpbnN0YXIg
bHZkcyBwYW5lbA0KPj4gLSBmaXggZHRic19jaGVjayBmb3IgZHNpICYgbHZkcyBwYW5lbCBhZGRv
bnMNCj4+IC0gY2hhbmdlIG44IGJvYXJkIGR0cyBjb21tZW50LXN0eWxlIGluIGhlYWRlcg0KPj4g
LSBjb2xsZWN0ZWQgYWNrIG9uIHNvbGlkcnVuIGJvYXJkcyBiaW5kaW5ncyBwYXRjaCAocGF0Y2gg
MSBpbiB0aGUgc2VyaWVzKQ0KPj4gICAoQWNrZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4pDQo+PiAtIGFkZGVkIHN0YW5kYXJkIGxlZCBs
YWJlbCBwcm9wZXJ0eSB0byBoYi1paW90IG11bHRpLXB1cnBvc2UgbGVkcw0KPj4gICBlbnN1cmlu
ZyBjb25zaXN0ZW50IG5hbWVzIGluIGNhc2UgbHA1NTYyIGRyaXZlciBzdGFydHMgdXNpbmcgaXQu
DQo+PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEwMjctaW14
OG1wLWhiLWlpb3QtdjEtMC02ODNmODYzNTc4MThAc29saWQtcnVuLmNvbQ0KPj4NCj4+IC0tLQ0K
Pj4gSm9zdWEgTWF5ZXIgKDExKToNCj4+ICAgICAgIGR0LWJpbmRpbmdzOiBhcm06IGZzbDogQWRk
IHZhcmlvdXMgc29saWRydW4gaS5teDhtIGJvYXJkcw0KPj4gICAgICAgZHQtYmluZGluZ3M6IGRp
c3BsYXk6IHBhbmVsOiByb25ibyxyYjA3MGQzMDogcGFuZWwtY29tbW9uIHJlZg0KPj4gICAgICAg
ZHQtYmluZGluZ3M6IHBhbmVsOiBsdmRzOiBhZGQgV2luc3RhciBXRjcwQThTWUpITE5HQQ0KPj4g
ICAgICAgSW5wdXQ6IGlsaXRla190c19pMmM6IGZpeCB3YXJuaW5nIHdpdGggZ3BpbyBjb250cm9s
bGVycyB0aGF0IHNsZWVwDQo+PiAgICAgICBkcm0vcGFuZWw6IHJvbmJvLXJiMDcwZDMwOiBmaXgg
d2FybmluZyB3aXRoIGdwaW8gY29udHJvbGxlcnMgdGhhdCBzbGVlcA0KPj4gICAgICAgYXJtNjQ6
IGR0czogaW14OG1wLWh1bW1pbmdib2FyZC1wdWxzZS9jdWJveC1tOiBmaXggdm1tYyBncGlvIHBv
bGFyaXR5DQo+PiAgICAgICBhcm02NDogZHRzOiBpbXg4bXAtaHVtbWluZ2JvYXJkLXB1bHNlOiBm
aXggbWluaS1oZG1pIGRzaSBwb3J0IHJlZmVyZW5jZQ0KPj4gICAgICAgYXJtNjQ6IGR0czogaW14
OG1wLXNyLXNvbTogYnVpbGQgZHRicyB3aXRoIHN5bWJvbHMgZm9yIG92ZXJsYXkgc3VwcG9ydA0K
Pj4gICAgICAgYXJtNjQ6IGR0czogYWRkIGRlc2NyaXB0aW9uIGZvciBzb2xpZHJ1biBpbXg4bXAg
aHVtbWluZ2JvYXJkLWlpb3QNCj4+ICAgICAgIGFybTY0OiBkdHM6IGFkZCBkZXNjcmlwdGlvbiBm
b3Igc29saWRydW4gc29saWRzZW5zZS1uOCBib2FyZA0KPj4gICAgICAgYXJtNjQ6IGR0czogYWRk
IGRlc2NyaXB0aW9uIGZvciBzb2xpZHJ1biBpLm14OG1tIHNvbSBhbmQgZXZiDQo+Pg0KPj4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vZnNsLnlhbWwgICAgIHwgICA5ICsN
Cj4+ICAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1sdmRzLnlhbWwgICAgICAgICB8
ICAgMiArDQo+PiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcm9uYm8scmIwNzBkMzAueWFt
bCAgICAgfCAgMTQgKy0NCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtlZmls
ZSAgICAgICAgICAgICB8ICAxNSArDQo+PiAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1tLWh1bW1p
bmdib2FyZC1yaXBwbGUuZHRzICAgfCAzMzUgKysrKysrKysNCj4+ICBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4bW0tc3Itc29tLmR0c2kgICB8IDM5NSArKysrKysrKysrDQo+PiAg
Li4uL2R0cy9mcmVlc2NhbGUvaW14OG1uLXNvbGlkc2Vuc2UtbjgtY29tcGFjdC5kdHMgfCA4NTMg
KysrKysrKysrKysrKysrKysrKysrDQo+PiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OG1wLWN1Ym94LW0uZHRzICAgfCAgIDIgKy0NCj4+ICAuLi5odW1taW5nYm9hcmQtaWlvdC1w
YW5lbC1kc2ktV0o3ME4zVFlKSE1ORzAuZHRzbyB8ICA2OSArKw0KPj4gIC4uLnVtbWluZ2JvYXJk
LWlpb3QtcGFuZWwtbHZkcy1XRjcwQThTWUpITE5HQS5kdHNvIHwgMTA1ICsrKw0KPj4gIC4uLi9p
bXg4bXAtaHVtbWluZ2JvYXJkLWlpb3QtcnM0ODUtYS5kdHNvICAgICAgICAgIHwgIDE4ICsNCj4+
ICAuLi4vaW14OG1wLWh1bW1pbmdib2FyZC1paW90LXJzNDg1LWIuZHRzbyAgICAgICAgICB8ICAx
OCArDQo+PiAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90LmR0cyAg
ICAgfCA3MTIgKysrKysrKysrKysrKysrKysNCj4+ICAuLi4vaW14OG1wLWh1bW1pbmdib2FyZC1w
dWxzZS1jb21tb24uZHRzaSAgICAgICAgICB8ICAgMiArLQ0KPj4gIC4uLi9pbXg4bXAtaHVtbWlu
Z2JvYXJkLXB1bHNlLW1pbmktaGRtaS5kdHNpICAgICAgIHwgIDExICstDQo+PiAgZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXJvbmJvLXJiMDcwZDMwLmMgICAgICAgfCAgIDggKy0NCj4+ICBk
cml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMuYyAgICAgICAgICB8ICAgNCAr
LQ0KPj4gIDE3IGZpbGVzIGNoYW5nZWQsIDI1NDggaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25z
KC0pDQo+PiAtLS0NCj4+IGJhc2UtY29tbWl0OiA2MDdiY2IxZTUzOWE3ZjJiMmJhNjgzMmJhOTZm
ZTNhZDczYjc0MDFjDQo+PiBjaGFuZ2UtaWQ6IDIwMjUxMDI2LWlteDhtcC1oYi1paW90LTUyNWIw
M2JlZWE2Mg0KPj4NCj4+IEJlc3QgcmVnYXJkcywNCj4+IC0tDQo+PiBKb3N1YSBNYXllciA8am9z
dWFAc29saWQtcnVuLmNvbT4NCj4+DQo+Pg0KPj4NCj4NCj4gTXkgYm90IGZvdW5kIG5ldyBEVEIg
d2FybmluZ3Mgb24gdGhlIC5kdHMgZmlsZXMgYWRkZWQgb3IgY2hhbmdlZCBpbiB0aGlzDQo+IHNl
cmllcy4NCj4NCj4gU29tZSB3YXJuaW5ncyBtYXkgYmUgZnJvbSBhbiBleGlzdGluZyBTb0MgLmR0
c2kuIE9yIHBlcmhhcHMgdGhlIHdhcm5pbmdzDQo+IGFyZSBmaXhlZCBieSBhbm90aGVyIHNlcmll
cy4gVWx0aW1hdGVseSwgaXQgaXMgdXAgdG8gdGhlIHBsYXRmb3JtDQo+IG1haW50YWluZXIgd2hl
dGhlciB0aGVzZSB3YXJuaW5ncyBhcmUgYWNjZXB0YWJsZSBvciBub3QuIE5vIG5lZWQgdG8gcmVw
bHkNCj4gdW5sZXNzIHRoZSBwbGF0Zm9ybSBtYWludGFpbmVyIGhhcyBjb21tZW50cy4NCj4NCj4g
SWYgeW91IGFscmVhZHkgcmFuIERUIGNoZWNrcyBhbmQgZGlkbid0IHNlZSB0aGVzZSBlcnJvcihz
KSwgdGhlbg0KPiBtYWtlIHN1cmUgZHQtc2NoZW1hIGlzIHVwIHRvIGRhdGU6DQo+DQo+ICAgcGlw
MyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQ0KPg0KPg0KPiBUaGlzIHBhdGNoIHNlcmllcyB3
YXMgYXBwbGllZCAodXNpbmcgYjQpIHRvIGJhc2U6DQo+ICBCYXNlOiBiYXNlLWNvbW1pdCA2MDdi
Y2IxZTUzOWE3ZjJiMmJhNjgzMmJhOTZmZTNhZDczYjc0MDFjIG5vdCBrbm93biwgaWdub3JpbmcN
Cj4gIEJhc2U6IGF0dGVtcHRpbmcgdG8gZ3Vlc3MgYmFzZS1jb21taXQuLi4NCj4gIEJhc2U6IHRh
Z3MvdjYuMTgtcmMxIChleGFjdCBtYXRjaCkNCj4gIEJhc2U6IHRhZ3MvdjYuMTgtcmMxICh1c2Ug
LS1tZXJnZS1iYXNlIHRvIG92ZXJyaWRlKQ0KPg0KPiBJZiB0aGlzIGlzIG5vdCB0aGUgY29ycmVj
dCBiYXNlLCBwbGVhc2UgYWRkICdiYXNlLWNvbW1pdCcgdGFnDQo+IChvciB1c2UgYjQgd2hpY2gg
ZG9lcyB0aGlzIGF1dG9tYXRpY2FsbHkpDQo+DQo+IE5ldyB3YXJuaW5ncyBydW5uaW5nICdtYWtl
IENIRUNLX0RUQlM9eSBmb3IgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvJyBmb3IgMjAy
NTExMDctaW14OG1wLWhiLWlpb3QtdjItMC1kODIzM2RlZDk5OWVAc29saWQtcnVuLmNvbToNCj4N
Cj4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWh1bW1pbmdib2FyZC1paW90
LmR0YjogYWNjZWxlcm9tZXRlckA1MyAoYWRpLGFkeGwzNDUpOiAnaW50ZXJydXB0LW5hbWVzJyBp
cyBhIGRlcGVuZGVuY3kgb2YgJ2ludGVycnVwdHMtZXh0ZW5kZWQnDQo+IAlmcm9tIHNjaGVtYSAk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2lpby9hY2NlbC9hZGksYWR4bDM0NS55
YW1sDQpBY2suIEFkZGluZyBtaXNzaW5nIGludGVycnVwdC1uYW1lIGluIHYzIC4uLg==
