Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB56C974F7
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 13:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDFE10E3C9;
	Mon,  1 Dec 2025 12:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="l/XSYRek";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="l/XSYRek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021106.outbound.protection.outlook.com
 [40.107.130.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EB610E3CD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 12:39:09 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s2ZOJbEqdC1WGzfGLgk8LATDn3OyHWgHWQwo6oiY1EykN98y0gwr2VQqlihIijailfqdftKzDlW7187H4VMk54XBC0W+FLLa05uXRaZujhlanf24IX5TadV2qsB6URnSICwX2ltepKCNTetEXpO/vkAbVyoSs1ZOvgBVhxvbjl+hcVoIoB8XMNI343B3+lQQHIXtgC1aY5hxv+W1IFS3WO36kmwp52jdzZwy+v4DhtsQ6a3/4iFMU1p4bSgPkHqu/htfSfvW1r6rpsdyBkq8vlWOiS1ifgunLH/DE2aJxm8bmv42m9tz/lgkd+z3Z6/WT7SyvPTghGmaK0eOQhdEFw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqsbVu+7bp/v3AtAubZko9LSv/X7Tb8cc2jEUa2pOqI=;
 b=ZWkxJ2gPjpIgUOVROxpDSR3eV2AYSNB9SMIPaUneU7gdHiokch0mvgSw5ZdsRyI9ZWQLLSUCnzNaCa2HLbWr6gTQjxmIrJNOjMahDIub5aPwtAOUfqYNkzzbZGuhnDj/fxe/wIPize2qm8LJgox0UXkE7zOqDqXowMRlMZsjToiB+1Sjh4othdFuzIcp+cnecRxxjfNxVWObqrZxWimM6ZB1vT9hP54by8zCM8rM8omn70/AlY/dv/Clo1PmCxaBB+Q14Rt1eBNlS1bVJKHLZ2fmwXjZaeNmW+ErM2IKU8OPNK0IXXw+dPm35klQM1RuIYJwXN8aEqvZHT3a/dmyRA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqsbVu+7bp/v3AtAubZko9LSv/X7Tb8cc2jEUa2pOqI=;
 b=l/XSYRekQ58UMFRfml2M7NF4wTBapWbXjQDk6x3My0Bqz6jNEYkU5vgSs4CZS8zytPFsNoWHHS93HJEqERb88YQ53GQNdut62/jMsHgPz4teqLnZo/YkyZ5dwX9bvS+n1D9PldXChe4lA//PeL6X1CPQFHXBaoL2taJHi3Tlgz8=
Received: from DB8PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:110::25)
 by AS8PR04MB7606.eurprd04.prod.outlook.com (2603:10a6:20b:23e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:39:06 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::aa) by DB8PR04CA0015.outlook.office365.com
 (2603:10a6:10:110::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 12:38:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 1 Dec 2025 12:39:05 +0000
Received: from emails-2893024-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 0A0FA80109; Mon,  1 Dec 2025 12:39:05 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764592745; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=JqsbVu+7bp/v3AtAubZko9LSv/X7Tb8cc2jEUa2pOqI=;
 b=Y/rAIgB+QW3nTrTL5wU2vnYz80rly9glH5g07fwa/vyJwyftsFeRjAjamcMIXXc6AGq7z
 lVM+8eIgTFO7O4/yg0DXVujEvuWcDDiVY4TyP/tKOhFHXh3NmV+sLm4bBzpDUoGdR8AjPaM
 MVTQXQGYlTwLNfEy0yMwn/XGkjd8kTE=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764592745;
 b=GuJnP8K+hjmQ296FJ4QWjD8kBdNlEEiv/GxXy22FS9GJehSZ6Fci6kvK9PMF4ADhTgwut
 lp0LVHi/E++lIi696PLWNXdkXAAyC8kSHpW3qvtB+sgeSMdgrOLoliDCOiXgQrxHihHwtl6
 mvagolEdxSgO2IcHwZPo3ddz83LaKvI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMqOz0LZd5Uk7etY5M/jIGeSs2AiMgpHUzf3FFX6C4mXo9GZKgDZ8BsMy0hWR6VcN+BxBKvCSuSuLeeXveiatAL4djorE+hfQS3+R6P95ouFQEeajEUzwBuPZJDPjDP005Q75DU2YK8Bcovw0Lz4OR+4h2tXKnK84ETKioaqyq6oyAX4AarkYeMcjcoVMXvzQbvjmqEhyT0YiNWBbo30N+F0abM7qNjFTbnu7rj+GwRqySwGZYp8XYeWKWhnXk3+1n3u0nBFS131qxgvHSQ7SeNPvI5MMo3UKP882k/EVZLSBso2+DBw9iN55bWgag420Jh55jsbyLttbE6dUytVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JqsbVu+7bp/v3AtAubZko9LSv/X7Tb8cc2jEUa2pOqI=;
 b=pFmTpgbc7ULkznUuungv9eF/AVQL3T0Xk1z+HgoPYar37XWJQr5nSFoGqOcs/XCRznKnMZ7jwOEN2tL0FwVQBNJPWh3jHXdEm9iqoQFJIZrIDgpGVHhLsc0wpYtU2S7vL21kN57vM7cpNtit0kULVwZYftHlMo4fHhiccGhrQc/Dqscj6UAj36CWOMwa49whBIHXj1bWa4ga6UOCzlIGXwztaHh5HV7OJpTDnx7plECdn25K2f/tWFBM01r8DZkLNsSWM8bMgfQ7ndsF3HBGuykRsLR/6t+t1hw/FIELySSLb+TbJ+WJLYceu+3tPAjBJhIeQyFdLb51+cMlR4pS+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JqsbVu+7bp/v3AtAubZko9LSv/X7Tb8cc2jEUa2pOqI=;
 b=l/XSYRekQ58UMFRfml2M7NF4wTBapWbXjQDk6x3My0Bqz6jNEYkU5vgSs4CZS8zytPFsNoWHHS93HJEqERb88YQ53GQNdut62/jMsHgPz4teqLnZo/YkyZ5dwX9bvS+n1D9PldXChe4lA//PeL6X1CPQFHXBaoL2taJHi3Tlgz8=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU4PR04MB11412.eurprd04.prod.outlook.com (2603:10a6:10:5d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:38:53 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:38:53 +0000
From: Josua Mayer <josua@solid-run.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Thread-Topic: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Thread-Index: AQHcV73O+C1rZWt/Wk+DMe+4kWNtvrT40eMAgBP9hwA=
Date: Mon, 1 Dec 2025 12:38:53 +0000
Message-ID: <020ff4f6-b7dc-4507-b910-a629fd0a755d@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
 <rifyic7w2zyjupbmzwcewcslryqiyexxdvbgcuxtkw3trmtulw@y4otarfyvgm7>
In-Reply-To: <rifyic7w2zyjupbmzwcewcslryqiyexxdvbgcuxtkw3trmtulw@y4otarfyvgm7>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|DU4PR04MB11412:EE_|DB1PEPF00050A00:EE_|AS8PR04MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a95769-0a62-49a7-0b56-08de30d69d51
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dlFoVHhGZzZqQUlKYzY2c05aeG1PNGpMQldSeDFZMWZ4RDdCN0tMZ09JdG1B?=
 =?utf-8?B?YTFiZjArREdKbFpNRDE5N0ttVFdPMDN5VUh1Mnc2UzJDODJDWHJvc3YvL29M?=
 =?utf-8?B?ZGNvenZGN0puOVNaQ2ZBbXMwWmR5RnVsalVvZEQ2WFAxOWYvamNYKzMxVWFE?=
 =?utf-8?B?YXppbjNKeTZPZGdzblFQQncxQkg2WktOM1F4eDZYRUdBcFFXNzUwNk5DU3U0?=
 =?utf-8?B?byt6RHRkQXNBTm55TEdIcFU4cXhqZk8waTdiUDM2eitQMnp1Wm1vUVhjOFdk?=
 =?utf-8?B?SHMvZGJLcURVZmFQVkFiVnVpcXBoTGh4SStaODF6blJQV3JzNDVxdkhMSkc5?=
 =?utf-8?B?T1RRS0ZMWGNHeGJlVE5mdkZ1cXVmTVV3cGpSTVI1bm5RS2h2VHZyTDgxT0Vu?=
 =?utf-8?B?SWloTUovNFV3QUF3cU5XMzhGVkRxdmtIM05CYnk2djJuZXpiY2habWhnY05I?=
 =?utf-8?B?Z0g3ejdQYVU0ZVQxSmRmN05GSHgxd2JLR3lkNDVWdkdKaTIxc29yZkI4S3o0?=
 =?utf-8?B?cjJoRDBZdjhOQkFKeVA1TTFMK280Sk16eDZiTkM2MzdIcSsrVTM5Tyt0TER5?=
 =?utf-8?B?WFNXOVBSa3J5eVNSU0NJTkNHcDRvNkZOUnVxeDFyMHNGU21JRnQwSW0wZjZY?=
 =?utf-8?B?S2lNSHZqejN4NHhjYUY4cWVQaTA3MTNYTnBWSVAvVnZkZGtoZUJMYTFHdkg0?=
 =?utf-8?B?azNRTVFOa1l0eFlDRlJkc1JqVXJhdTBDL0daZXlseDFEZE1QTTJINVRMSGVK?=
 =?utf-8?B?OW1mWFhHb3JOME10RitPYmNSK3VHczNHMVAzejhvQ09kVHRGb21wZUlORjhj?=
 =?utf-8?B?SzNjNDNsRUFjaTNRUWZKU29YdnpyeGFGZzZSVTJsZzJCNnhiYjFzWmhHcU50?=
 =?utf-8?B?SVBJdUNiWVNSTGQzdzIydGR5dEJTZ1RpQzVYWUFzR2hlZmxEeDZVRE1RRm1w?=
 =?utf-8?B?ZE1UVlYyaEpUcDFKWE9Oamd3U094OG1UYzJ1Y0ZCdWx4aXN4Q3JDRWk5cGU0?=
 =?utf-8?B?bjJSb3d4MW5raUYvSjljQmZyaitmQUMvT3VMOW00Q200ZkRXOERDWjRVSk1Y?=
 =?utf-8?B?Y1IxVHVwRzBLMkdBMHpJd0xsU1Z6Nm80SGhWVlFkc2gxVldXcnZYMzd5bHc0?=
 =?utf-8?B?TFl1aVJQTkpqeUt1UlNtaXhQcWJMeGg1U2FyNDBBZU5WUDJSbjlLc2ZORTFk?=
 =?utf-8?B?bW5MTGxEZ01BRlYza3phb044aDQ5SnZKUlgyWVU1YUZNWUJQZnNVUzlnMlMr?=
 =?utf-8?B?N2puU2QydUs4Vi83VVJYQTJ1TUtUcjlscXRTR29xcTlZdzdTQ0dtdlowK1ZW?=
 =?utf-8?B?dUg5VTlITFE4ank0eVBHMU1VSzlVVkM4N0E5eSs2ZmZwcEpYTzdMTjluUm1x?=
 =?utf-8?B?aW4ycmdGT09GcHdCaFFGSVRVd1BYY1pWZmdmaEl0UGFXdmZxcmNjZDlRT041?=
 =?utf-8?B?NjFzWktRMXVpRWhEbWlReTFUMEVsekwwU0NYTTB0eVJRQlc0RGlNZHY2eWI3?=
 =?utf-8?B?QlpudDRiMzFVNXdkNElYK1RmakI0OEM5NW13eXFIcmREYXNqa1B4b3VMRnVR?=
 =?utf-8?B?RllMUllHQWFMcERjSzhvQU9YMlU3MnFVcndpL0VKOXY0TU1IamVOSC9IVVIw?=
 =?utf-8?B?LzVXdWowVVlONFMwZ0grVFdqQUlLYWg4ZUVlcjBpUzc5c25zVjV0RlFkbnFk?=
 =?utf-8?B?eFdjTUYwVFZUMFQyRStHakpuQ3NBelE1dEVmUnQzVkRVVmk4MlEyR0tVRnQz?=
 =?utf-8?B?Q1Y4SFQ4WnBIdksxUEloZ3RTTDNEUSt5MGxPd3NwMkJURkZpc0RMaU5CL0RV?=
 =?utf-8?B?TWVGeExuNFh0QUtGb1NKRHF3SStWNzFtWFRXTm1IWHZrbFJMZ3hwQW9qdTVz?=
 =?utf-8?B?UHV3dWVjeW5oRkN0TmYweWZPeXZ5NlhMbVQ3WXVaZGRjaG5ocVNrdmd1R1NT?=
 =?utf-8?B?NUVqTGRwVERSeGJsMDNxbVRhZTRFQkNJNGNMa1h0bjFRdzMxdnNkdnI4eFRY?=
 =?utf-8?B?VWRIcFhJMlFIRytsbkRZMGlhU3hJZnJNc2xyQjU0c1FXd2d5TXFqL1ArenQ2?=
 =?utf-8?Q?FgqDxs?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <E8B1B2AFD185654EB154AF5F0A503BF0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11412
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: bd99b0bc50bd4a248730da04913c8ea2:solidrun,
 office365_emails, sent, inline:8ec2450a1e4e9954264e28a215030784
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b9ab2b1d-4d27-4bbe-6044-08de30d6962f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|35042699022|82310400026|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c05SMld1djFwamJzOVdaRkovb2JiUFhMMENCNUUwMWFBN1M5WUhsWXNEd1N1?=
 =?utf-8?B?dHVQQ0prUVJqaVNKZUxwSURqeWE0UU80Tm1uMUZES2kvWENER3dKcWtidWlX?=
 =?utf-8?B?cnd1SHAzbmNubTN6dlAybkFDRGRhMTBUekNWaHN3by81SXExWFB4MmkxMHV3?=
 =?utf-8?B?elZCMStYWUNmNWVnTURFTzRuVG1KN1RHTi95STNpbEthQ0ZLTEN0bzMyYjQv?=
 =?utf-8?B?Sk5WOGpHQmJ5WkhlUTRwRnFybFI5UXpjdk9PM0VQa3hqL2IyR2xqS3FnR1hM?=
 =?utf-8?B?M1NNOTUrc1J6RzZYeVhkdjQyTEJXMzNMNFlpeGhSemlsLzNCSDNhWW9wZzFL?=
 =?utf-8?B?NnQwWFNXQ1FrN0JjNXpaTkFndzhRbTd6bENlTGtueXkyR09GUU8xYWlaRmlK?=
 =?utf-8?B?cFJlRlprRzVVSVliVGQyUkpZS3lpWkdpVWdtUE5kSXBKK2pHTjF2MlBHL3c1?=
 =?utf-8?B?UnVjUWI3ZDJKMXp1bjlwbmJkdlZUcGxnbFUxcXBJVG9neEhIR09TcU9qV1pQ?=
 =?utf-8?B?TTFHOHgxS0drQXB4WTRlT2NocFBFOEd0aTg3TDhnT0JXTUs5T0pjYk9GM3J1?=
 =?utf-8?B?eVJnTVdmQktuQnhSY2lIMTYyeC9pTTU1bm1IcXp1QmZpNGg3VGlOQ0xOMTNv?=
 =?utf-8?B?K0J0QlE3NXZpeUkzSTc5eGUvaHNhNkZNVzFsQWNyTWpIVXhsbVBXNTUxcjZY?=
 =?utf-8?B?VWtreWNhdHh3ZWFIQkxiOWo5TjcxQlZIV1dRbStOeVhGQmsxVjd6bHBUZG9D?=
 =?utf-8?B?ZmhESld2YnQ3N1FVdDdQNlBDRlE4SVduR2pRWmpkRU55aXJmWTc1T2xGVkFa?=
 =?utf-8?B?bU93K0ViVU9BQTlYbnJOY2hLRHRMNnJhWkxCcDhsTkRwMTN2UC9RRExBWUpy?=
 =?utf-8?B?ZFpyTWsyUkhPSmZvQUtCd3BkMUMvenR2ZiswdW1hR1RjMGFqZTgzQ0g4c241?=
 =?utf-8?B?bW9pdTVkMlpmay9tQldvSTRFbFp4aFNPTDlxUkFHaExZcGZJbDFsbVIvTlMz?=
 =?utf-8?B?SlgveU1aZTcrV09LTDlmRGFqNzdRSDZMMkU4am9STDE1djE2U1RDOWl6MFhY?=
 =?utf-8?B?U2Q5THc5Z25TQ1BxSUNOOUdhb2t3UHlqNkVzSVRsMG1PMm1WM0g1OE0vSE1z?=
 =?utf-8?B?QXE2Wnd4T1RPd0hnckFXSEE4bGlLdEg5elJqU3kvYlRDbzhwMW9xZjFEZ0dq?=
 =?utf-8?B?U1J6YzVYSGNLQ0ttQnFSQ2pSU3czUXpZZnkwOFAvRC9mZmlRVUhIZkEyd1ZQ?=
 =?utf-8?B?RFF6d0p4Z201bDVCZ3hEc2tST2Jpc2MxeFJ2dUdzL1dnZXJ1TDJNYmpvcU4z?=
 =?utf-8?B?R0VPSmVLR0VZVDhieC9ubVFpTkJOeHZrQ2VrUXpKeEwwMkJOejVMTm00ZmNK?=
 =?utf-8?B?OGxkNXNENEdjOU14NnpQRnNSYUovTHhkLytlS3E2TjRlSlJWQktmYWU3RWlF?=
 =?utf-8?B?NlBHZXpqdXc2WllVeG1mbTcrWmZqTEMwVzZPdHA2SFp6MjlRdmRJc1FSVjVS?=
 =?utf-8?B?SzVadi9jbFUwLzBpYW8yYzF5bm5ldGZGazRSSnVidnpmUkQ5UzRWdEx2dFVM?=
 =?utf-8?B?WlZBQ0w5THR5NUp3U2lzMC9jOE0xTzhUTFhyR080ZytseWkxVFNBazNHY0po?=
 =?utf-8?B?YUlvTVRYOWNkOUlkWmgwYjZ0TitFblQ4eWxscGlyNTFaLzFBcWVQNk4vTTZW?=
 =?utf-8?B?U0VURy8wN3FtUlBWamJhM2JYVEJRdlBlL0syUzFHMlYxNkIrQldKZGNNVXNG?=
 =?utf-8?B?Z252R0hnbmQwcHBYWTdoSUtFWG9SOXREUW9KT21GaSt4bldMNTlIREdMcThF?=
 =?utf-8?B?WUlNNldjTUt0SGZrcFk1RFJ6dTdwZTYrMGFEWE5vZ29BZWR0WXQybWo1YnYy?=
 =?utf-8?B?L3lmVE1yWnhHSzl0M0xCZThvVktkeTFucTREbTdnUFM3WHlJd0cydzU4SURP?=
 =?utf-8?B?UnRHdUN6NHNGdXJyU29adDdnT1FUai9NUEZ2c1g1VUZFQVlHVTgvaUxhWDJI?=
 =?utf-8?B?QzdrakN6OG9FeG9NNkZ1M2gyMUc2dGZuNFV3U3YrK0dXVFdJcUFkSmEwTUVw?=
 =?utf-8?B?cU1rZGM2WDdoeVl3VWZ0aS9va2llNXVjY1dHYlNCYVdsMFVaTjA2NnE4N2Rz?=
 =?utf-8?Q?mJe4=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:39:05.3238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a95769-0a62-49a7-0b56-08de30d69d51
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7606
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

QW0gMTguMTEuMjUgdW0gMjA6MjIgc2NocmllYiBEbWl0cnkgVG9yb2tob3Y6DQo+IEhpIEpvc3Vh
LA0KPg0KPiBPbiBNb24sIE5vdiAxNywgMjAyNSBhdCAwMToyODo0NlBNICswMTAwLCBKb3N1YSBN
YXllciB3cm90ZToNCj4+IFRoZSBpbGl0ZWsgdG91Y2hzY3JlZW4gZHJpdmVyIHVzZXMgdGhlIG5v
bi1zbGVlcGluZyBncGlvZF9zZXRfdmFsdWUNCj4+IGZ1bmN0aW9uIGZvciByZXNldC4NCj4+DQo+
PiBTd2l0Y2ggdG8gdXNpbmcgZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKCkgd2hlbiBjb250cm9s
bGluZyByZXNldF9ncGlvIHRvDQo+PiBzdXBwb3J0IEdQSU8gcHJvdmlkZXJzIHRoYXQgbWF5IHNs
ZWVwLCBzdWNoIGFzIEkyQyBHUElPIGV4cGFuZGVycy4NCj4+DQo+PiBUaGlzIGZpeGVzIG5vaXN5
IGNvbXBsYWludHMgaW4ga2VybmVsIGxvZyBmb3IgZ3BpbyBwcm92aWRlcnMgdGhhdCBkbw0KPj4g
c2xlZXAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1
bi5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19p
MmMuYyB8IDQgKystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5wdXQvdG91Y2hzY3JlZW4v
aWxpdGVrX3RzX2kyYy5jIGIvZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJj
LmMNCj4+IGluZGV4IDBkZDYzMjcyNGEwMDMuLjhjNWE1NGIzMzY4MTYgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL2lucHV0L3RvdWNoc2NyZWVuL2lsaXRla190c19pMmMuYw0KPj4gKysrIGIvZHJp
dmVycy9pbnB1dC90b3VjaHNjcmVlbi9pbGl0ZWtfdHNfaTJjLmMNCj4+IEBAIC0zOTYsOSArMzk2
LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBpbGl0ZWtfcHJvdG9jb2xfbWFwIHB0bF9mdW5jX21h
cFtdID0gew0KPj4gIHN0YXRpYyB2b2lkIGlsaXRla19yZXNldChzdHJ1Y3QgaWxpdGVrX3RzX2Rh
dGEgKnRzLCBpbnQgZGVsYXkpDQo+PiAgew0KPj4gIAlpZiAodHMtPnJlc2V0X2dwaW8pIHsNCj4+
IC0JCWdwaW9kX3NldF92YWx1ZSh0cy0+cmVzZXRfZ3BpbywgMSk7DQo+PiArCQlncGlvZF9zZXRf
dmFsdWVfY2Fuc2xlZXAodHMtPnJlc2V0X2dwaW8sIDEpOw0KPj4gIAkJbWRlbGF5KDEwKTsNCj4g
VGhpcyAoYW5kIGJlbG93KSBzaG91bGQgYmUgdXNsZWVwX3JhbmdlL21zbGVlcC9mc2xlZXAuDQoN
ClRydWUgLi4uLg0KDQpTbyBJIHdpbGwgY2hhbmdlIGl0IHNpbmNlIEkgYW0gYXJlYWRseSBjaGFu
Z2luZyB0aGUgY29kZSBuZXh0IHRvIGl0Lg0KDQo+DQo+PiAtCQlncGlvZF9zZXRfdmFsdWUodHMt
PnJlc2V0X2dwaW8sIDApOw0KPj4gKwkJZ3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKHRzLT5yZXNl
dF9ncGlvLCAwKTsNCj4+ICAJCW1kZWxheShkZWxheSk7DQo+PiAgCX0NCj4+ICB9DQo+Pg0KPiBU
aGFua3MuDQo+

