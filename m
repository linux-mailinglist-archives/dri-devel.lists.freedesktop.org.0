Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BD8C640A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB4410E38D;
	Mon, 17 Nov 2025 12:29:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mSXGS1aX";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="mSXGS1aX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021118.outbound.protection.outlook.com [52.101.70.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8900110E38D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:46 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=T8R9ZjmttGbe4aWn14E6ODZ/LmhpQ2pmy0AAnXQDpTPwEP4meq/+xMO47yNz8CJv0bEJ70WQjsgunE5PkMcd9+qmBTb4QkZJTHxd1wWe5MJL5wpp65onZCavHdKYAkmWxtXFzbzWfDOru1Xo1TnYdWgCoZGNhqqCRxX8gBjPhexUmAgTuMzlovoR2mS2adqIoFuCspmSSKkspJCwm9JgqPWPPSc4DvSdOmFX5q5q4JurlT/ATF3doy0pPKjYvJZirDlk8wNLk9zP57SXFpd1S3v+rTl0KdMIJV0KTzE3p6mGZ4+UBWsKBpDJN+zXHJD4vO/UsJ3BJ7DsYDK5O0z+gw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=fD78CAjMC0OPAXVu1xwLvFkOKw8e6J44v5euv39OINBBrdPglVxNal6j6Gt01764QISbXXtdOLL4MqDFckbPivSa0vH7n3D4V1iozh7vVplTWV/0C3ix0dJDZuK2bQfT5uFUQ01A5WYOEYTPADfzSJl7x7d1WHiOGuCB2skifAPtVxDfjMzxOE4DziWkC1TZLvYz/r3/Uw7hxKHrehe29SomH0mfT6uwu4Bl8APC8Cd15fgAP3vLh8Amyki1g61wQIx2owBrSLK4Q5Gw90K3FYAQbJCfFUOyYFfLxj46E7KaXFmhchfeQak1+BL8zEC8CENU9LoXYk3oVhpXibGyVA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=mSXGS1aXAJ82xFl9M74GTPivRVtX6eJBpryilOOHupn80JxwwnDWSRqUuMajDsCGjnDg48ukWl93UYDQTP/aJ0zkkEhzgSft9MOysLaHhfujKAw+OxYRotzzLcSShipNZ6BYu9gOMePhPHHRtUDZ4k1ycAyD4vDYWZ6a45J/5HQ=
Received: from AS4P191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::16)
 by AS8PR04MB7781.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Mon, 17 Nov
 2025 12:29:43 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:657:cafe::9a) by AS4P191CA0037.outlook.office365.com
 (2603:10a6:20b:657::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:29:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:42 +0000
Received: from emails-2609381-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-39.eu-west-1.compute.internal [10.20.6.39])
 by mta-outgoing-dlp-670-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 56B46800EF; Mon, 17 Nov 2025 12:29:42 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382582; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=DXXtFXqZuLD/+6ZpnhndX0zB6MY9uoB2WnBJyAefQb1fRAIoFAeobo17g7+3O2ckeD8Cw
 JvZvVjaLG1r/mhzcHeknPg9FWj5P58csUhB3OLuw6Gd3PVERUyYf+PcjxCnLQ2UkzVFTpMp
 D1udcLwrWFBAyJQ5VqjHs+facNauiXw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382582;
 b=GwMcILUttQZV9DwTKqD5pGTU+2JOcCJ/XWpXDPdWawZ7Qm+6NRVtmE93FIvmyPZ4RDI+O
 Rw0Dzr9FVXkCclO+itSEeaRyhvbpzUZhSvus5DFbfkgQ9sYHYmQ82VV6y2JOCjtLU4LcYw+
 6mv1h7gNxgYOG4B/DaNCyd/y7cG402Y=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHfm1apP0dvS9b/5n0lQv741iuQWacV4eSv+VsLepJbikiouBnYovCFAl7nBoOaFBDuKYsZNrE+UjDwQsRoBtR1vdEwgE6KszzysKuCS/Z5wsF8kxZz2r/EqjfOEhSZHRnRhRbjlfhWUmR9MFbvYNivy80+1lIRg3JejEzw18MsnghiUh6kVTsIcqzQSYWdJom6lIwfnsT54jRHPbIGhRd1VAWCi2Vo/0oU4osXRYSSnAZVPFEQYBfRpQ0gv8MxaROfV+kAi9SfyO1XA0tTix91IxLt3ZA/QwK9PrpZpdzuoHcp81Df+r5iEPMU+bl3YEV9QZ0HEFBBOImS1EWav9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=rkfZdRwbG1+yxzZpiVrK6KKwfWotHjCMysOCd+kwrvZugpiBbvvoc8whNM8lr/8a5vOxc7FCG21Ga082mRUe14SruQ/5d3tQOn1588iXDjIgWtN/+clPa8la8BnO8ctUNkOfhTz38IxrQ1b/fwVawZogW3UJUZ3oqhUnyXtKh+/8muVfckn9403jmeS2s42HL+XPnHjcjTyxf35vsjBZnH27gZc8vkx72qSOlM40BD4arjHdX97hNGoUgPu4a7Tgt9NDphNN3qw2p5YA8eXAq85CDdDJCawiOPtjh8/zzFClV/mUQTQglQlcVzUX/M8zrja0hY2qVGLGMEegPKbwag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=mSXGS1aXAJ82xFl9M74GTPivRVtX6eJBpryilOOHupn80JxwwnDWSRqUuMajDsCGjnDg48ukWl93UYDQTP/aJ0zkkEhzgSft9MOysLaHhfujKAw+OxYRotzzLcSShipNZ6BYu9gOMePhPHHRtUDZ4k1ycAyD4vDYWZ6a45J/5HQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:29 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:29 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:50 +0100
Subject: [PATCH v3 08/11] arm64: dts: imx8mp-sr-som: build dtbs with
 symbols for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-8-bf1a4cf5fa8e@solid-run.com>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PA1PR04MB11261:EE_|AMS1EPF00000044:EE_|AS8PR04MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b35266b-5849-4ab0-481e-08de25d4fc28
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WlBnYTNoT1A3eGRKd0ZJMlhLbGYwNGRkWnNWYUdKUC8zOFc4cGVVMFRRMmdY?=
 =?utf-8?B?WHIwRmpseEdqODhUT1JSb1pXS2NsQUxUN08weHB6UEdlYmlWRWZwVlRMckUz?=
 =?utf-8?B?TFpNbVR2ZHI2RkFBTWFvWVF4OVJwZnYyaHgwOURJQzE0TmxjUlpUTWpTeXdy?=
 =?utf-8?B?dHR0OHUrQTFDaEtTYTgwQyt2QU1EbjUvYXZieXJ5ck5Ga0FBRlBnTVhTWitl?=
 =?utf-8?B?MFV1MWQrZEVuVi9KZm5UbnBoYUxMOVlrNXJlVjE5c1V3NXYyTmxSakhNUDYy?=
 =?utf-8?B?b1ZlUGt6akUvSGVjNzlhOVpRUmJqczVac3NSYnpqR1FiRC9rT1hUTFoxaGxn?=
 =?utf-8?B?a1J5UjZib1REMXJlTXczQzJ6azJCeVpiaEJaelFFTHRsYmE4UnlyVlFOVGZx?=
 =?utf-8?B?bGNuVFIvYkZTNnJGZnNJZE9YTk5NTTdITG9UMWJPaG5IbUxMLzU3RzFCSzBa?=
 =?utf-8?B?TmdZZFI2NmRGQ2RESkd4WWdRWXRqak1kcE1jcFZlT0ZNNXRzOXJ6dXB5SGpl?=
 =?utf-8?B?R2lEUmJ6VU5JV0dybUpNeTNjblNiM0VOU3E5dVV3Y3g3YWJPbThDbUdNVmIw?=
 =?utf-8?B?UysrNGxrbHU5TDJWU29UOThQUjlzYStvcVdrVFNBMHNlNFVZd1pnU3B5RFZI?=
 =?utf-8?B?aXJ1Nk52TXJCSUJKY0R3QXFsR0ZreEZNMzA3VHdCeXVnV2Z6UXpaRmtQd254?=
 =?utf-8?B?OThBKzd4NDFWKzJGckZUZkd2Y01iZ2JXVzRhNG5yd1RId3BzRzRkZUZydWNB?=
 =?utf-8?B?UkpBY3VOWEhiWEx2b2Q5QzVLQXlSeEZtNVRLRnNmNUwzclRJSW1EQW9ZZzIx?=
 =?utf-8?B?aVR2QWpLUW9QcVlSc0VhSTRyQzk1cEkwOC9wNVMvMFdQbXljZmo5bkhGUjR4?=
 =?utf-8?B?R1crUFlLNlNORzJjWEZITkJUTHZ2cUdTZ1J3aUtZclROR3gxRzhaZWJOL0Fz?=
 =?utf-8?B?SG83TWxBUEgzbG1XK3hjVnFoVE1YSDR2VUVReSs1YVZPNXdJU0pPdzltRVVR?=
 =?utf-8?B?MDNySE9aZEo0bStEYkNuak83eUZvdzlBZWVhMkZnT2gvUldobW5IRWpKc1k3?=
 =?utf-8?B?L1hPSEp3M0dXS2FCVTNPaEdINjFiL1ZOWkYvbGJWTmRwSnZEUkNCM21WYkdk?=
 =?utf-8?B?ejZHTE4zVVhMdkVndEVlM1FwMHcxRGNOMGJoV0h3clpZR2NvcHI1Z2hLbDdx?=
 =?utf-8?B?cUFYbU9SS2VwTVgrRWE2MEdBSlFxcWV5N2RXejhuVVo4Sm1kRUVTWVF4TWZ5?=
 =?utf-8?B?Z01VbGd2S3JLUjg3TFFPVENwdGRjMUFhUlhVckZQV1JpYXVsUWpjQnZtalNV?=
 =?utf-8?B?djQwTG56K0ZnQmZTcllMRzRUQ2NZSWJ6ZTRkZjVHSjFnQkVrdDNJZnVBeDZ0?=
 =?utf-8?B?cWNxUUhQcDJEa05RSWlQbHBhMVRxNmFHaUtONFVneTVoVHh3dmNvZWVKTXpX?=
 =?utf-8?B?OHlFMmlhdmUxL3ZKYXBJNEJNRXZsdjdXdE1vd1hlZk15YUVhUElyN2oreTlE?=
 =?utf-8?B?bldzMlIzN2ZWYThIR0Q4ckczMVR5WlRPTndSUVJsQ2xxYzUzTDJTd2xIQ2Fo?=
 =?utf-8?B?MS9MTm9nOGhSWDFQdnN0UzZIMGgvTHBwOFhUb1FSZUV6bWtmeVpkakszYS9F?=
 =?utf-8?B?VXhBYWJySS95R1VoRnhnSXhHSVgzQU54UWlJTnIxM1lTc05kQjhaZ09MUkZk?=
 =?utf-8?B?Umkvd0FwYlNEeElJR05JU0ZRWVhIV3Avc2dveXVpOFdDTGI2ZG5XeGxUeURP?=
 =?utf-8?B?UFBoV3pvY2FLSEJrNG02QnRubjV1Tm1pOHhBMW5naXk0dXdqb2Z3UWNyYS9y?=
 =?utf-8?B?bnlIU214SG5WUjJWMGdQUFBkQ01LTGxkYnNqUVdCVkxMUXhXWWVNMmRWd3Nu?=
 =?utf-8?B?WFhuYk9MYUMwM2FzKzg1Sm50WWRqbkRuUzV6WURPWXNMZVVMOWdGZmYwMklR?=
 =?utf-8?B?YjFMc3BCVUVHWFE3SWthU2F6RkUrL1dtSXF6ZGF4RjBNejdSMUl6aWNieXpV?=
 =?utf-8?B?NE5NWUtVYmxQWDltZFBMcE50YVkzZW13L2FlL2NXWFZxNUZqVjIrRnR3YjZs?=
 =?utf-8?B?SXZxSWd6a0ovSUJmME5yejlEQXdWSlZjNGxzUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 04505d84d2d74564b1d5d3353c6a8f21:solidrun,
 office365_emails, sent, inline:e63acf9d0091647e1c4ec6a3b065751e
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 69c68a52-5db9-4cd0-e586-08de25d4f414
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|36860700013|14060799003|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXZ2QytzRHA0VzFHblAxbG1tTUNGeWs0SHpmWDNMaDd4Ni94aXVxVmJLQ05p?=
 =?utf-8?B?TTl0TlVQU3BsNlZEUTlDVWd3Y0dLZkR3ZmRZKzFTVnZITnczOXM2a3ExbEVK?=
 =?utf-8?B?bGhocUJMUjAvZVJmVDdPK0c3aUpMcFhPTXdFN2w5ZVBQbUxBSmFXVmxQYkt0?=
 =?utf-8?B?ck5idWhTQWRaTXVFQ0JvVmV5OERzRHNoRDZEZ3ZzQW5TeE9NVWZJNDBYMWRG?=
 =?utf-8?B?RHNZZEZBd0JEZ05PS1BFN0lyN2d6YW5yZnBQOWRET3NPVGk5NVV3d0ZManpy?=
 =?utf-8?B?cHBMemdZcm5zUWhZQUdvWlIvenByam0wMVdlN0UxUjA2ZzloeEFaZWRteGRW?=
 =?utf-8?B?RWhMQ3d5QkZ4eTNQZWlyTk53S0ROSmhCSVNRYitVRm1KQVB2Y1RNSkFzT1lG?=
 =?utf-8?B?OUFoSFV2QTROZEFxbXR4YndKU2hXeUt1MDR6Zmk3STlWcmVxV1d1R2VscFNL?=
 =?utf-8?B?REtHL2p0TFZjMlFmZ0p5MlFRZmxEUWRZM3ltVm1QZE5SYzdKRVVSd2ZjU0s2?=
 =?utf-8?B?dFNxbmFvV2w0YUZzV0RDcXNIQzdEUno4MmlNcit1bVJ0ejJjR2I5M0hieC8y?=
 =?utf-8?B?RFd6cGRjWThsZUZlN0U2NzZXNWY5RDQzNktid2Z6RUlzM0REQit3TFVGVm5Z?=
 =?utf-8?B?SDk0Q1dhQXUySUVVOHkzU2pIZ3p6bWZ2cGQ0Tk9nSlRsTEZUelh4Y3YyS1BH?=
 =?utf-8?B?VVlJZnNrLzdTYUs2RlBDN3RzcndSV0tzNXNzV1NYb29xYkxDcEtTY2RVWlpP?=
 =?utf-8?B?VlIvelgySFFNcG5ETnBVQWVhbGJWdWl4TWlueGRidjNta1lRN2Y3RzNIVE1l?=
 =?utf-8?B?emw2YU9JUzU4WDJlOWtlaDZRR0I0eFM5eXVmR3lYc0pVOUJacUdGNkxVQmp4?=
 =?utf-8?B?Qk9vNHM4cU5GRXBtRkZZejZ3N2NQT1J1K1J6Y3BEYjBVZk1qRDJUdmZjd0V4?=
 =?utf-8?B?Z0drdVdxTXZmVEVXZ1lScktxNExVdXd0NWFqRkozTktqK0g5RHNHTUxZZ25l?=
 =?utf-8?B?RVNuWmNOajFDMnpSRnhVaFBZQXpoQnhCNStuM3BzcFNDNHZHNjJrNlpFaGxL?=
 =?utf-8?B?Y1ppWjR1U3k2QnhuajBWSDZOa1hrY25NZFVVcmxGVWY2dkMvbXRPdjR4UXlB?=
 =?utf-8?B?a3kzRUdEQVFHM0twVDBENnpVc1htK3dkT1dKaG15bWtjTEtOK3hZZlJneEpl?=
 =?utf-8?B?UzNhQWVLRUp1Q0QwQUY5YWZaSkp2MmdHcHFoclJRa0VqUzNyNW96b2VqSXVo?=
 =?utf-8?B?SWpScFVTUklrK3ppM0d5Rnd1WDFzUU9vSkdLN0tlUG44aWhLWTB5Z2xoM3Ny?=
 =?utf-8?B?anhWa3dGU0QraUhHRUkrZVdYekJTZW90MHlMcWFwaGdxVU0wSGxLSG9obFBE?=
 =?utf-8?B?SXF6TEl6eFFrUlBLTGx1dFkrYkhwMFcyMUFseHRGVytqQ2lOZ1pNeEZiRFZ1?=
 =?utf-8?B?cmxwb3REVEgyN0xsellFZXY3RllkODJqWHBSamFBajZZZ3plblpqSCsyWFcv?=
 =?utf-8?B?ZFp3Z0I4V09nQ2Zib0dMNGFwcmtBUFgxc05SZ3M0aGxNMEhpMEt0cG1rdTJF?=
 =?utf-8?B?SnBmYXNtbmkwNVJCWFVIR1RmSFNjUFk2ZXRPL3dDNlJWQ3FObzl4NktGRWlk?=
 =?utf-8?B?TTljbDUyR3Rjb29GQm1ZZWVqUU53ak5LZ2UxQ2oxVWd3VG51OTE3YStVWjhM?=
 =?utf-8?B?NDZtNmp2TUw4WGhJaVoyaExyV2E3bmlFeForZmNEZUJQODJoQkxLamV0Q2tG?=
 =?utf-8?B?bXArOHJ3NmMvQkQvN1BYSmlqaklRVkp4Z2tXNTNLOHVIbk1lc3hEbDcweWRj?=
 =?utf-8?B?U1hKd2dLalhxVmJ5MXB6T3o0Vmlpd2dmWGpXZWxRY1JnY2FiWk9QcjlHemxZ?=
 =?utf-8?B?dzZIL1Jyd2UzNnE2dGc2b3NqMjhCZG51YWdIQkovRk95K2EweEphekkrYTYz?=
 =?utf-8?B?TngzQ0c0WEtFQjM0Q2xPUE94WUtVcVlrUEVUK252ZXJ6NHBia1VkTFJCaTQ1?=
 =?utf-8?B?U0ltS1A2Mm1WYUxkUGUwVHI2eUhvRmIrNlc2MVVwU1ZZQTI3MlM3NFNRV2xP?=
 =?utf-8?B?dHNYNnhCekx1NTVNWGJTeEZDc3VNaWZKSkFBanZxeC80ZzVzUWJHbm5ITFdH?=
 =?utf-8?Q?RSPI8yqvEFPI9qvPF3H5c4wDL?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(36860700013)(14060799003)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:42.6111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b35266b-5849-4ab0-481e-08de25d4fc28
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7781
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

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d3..8bda6fb0ff9c1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -207,9 +208,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.51.0

