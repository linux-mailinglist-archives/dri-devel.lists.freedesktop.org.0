Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8BCC3FC71
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E161710EA9C;
	Fri,  7 Nov 2025 11:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Jg+WB/bX";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Jg+WB/bX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022133.outbound.protection.outlook.com
 [52.101.66.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0669410EA94
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:46 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xwtZHfz0+PXhL3xVosdJCdR1bFJ4j3LHNc2t+uzYdSx/FlpjPdBom4l8GdrrEB7E4vtpDBU01z7vrkzzSpR3eL7HfYOFE7qolw8zjyauauAc6r5W1DA0ICYqAFZrUvYb8LGIlSbBrhYulrUuptioeM2iyav8naSiIR8r4YlpbBZeHPwVi2IVakMjb9LFucGusYDRLhMB8pCqrsvRjBeIUBWeJsRgfSMi1ov8PJcq/yHIJZdNAToYXzfa14jlxrVsP3iy/JoGSMBqILv2Gt8AApNttsfUoyCudaxh2F6IXclUaw18BvCqCMtlmuKdIGvgkyyDgzPk1hAiNMWYJoGYwQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=DNn9Q4RAR7aicM+mEaEdZLhw44DjSlLhAZSo7AH9Q//+8x2H5n3QTr1RWbzbrLZBhz6pp36zbA3jrzdGS5MkRGgdp/KPwR8GhYWwucqfsidkjlyEehjhSXQvhSlzmKhxkpZ+wpW3BIxsg28E+rbUI0XQt75r32Cajr62ndmTe/avgDMrgifTfUVNv49Ylpk043WzuItPr1J5QChbQXIo+u33nJNfxZonackcJiV779nSMtx7C9QcluYCb6ynvA9fKj+C7BL/722qZwQRUQAj473aSwWua/huPPKdZPk3FX5QZfpTpQpp6NEN2NJm56sskRcyOZXNGDk/G6RW1C1s0g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=Jg+WB/bX/Jevzfge9OzogewGjT8mrKJvMOWLdPy/Of/SSjxo6MrF5bdnipl53h/8b42E5BIEkZg1Er1xEcw45jdk0pvnaA/ZdYYIjhYQl92GbBa8QzqoHTYx057Ksb6v4jZpwSE7nffKlykbWjMbs1P89ZHHlT6FVvF3vcYsf/8=
Received: from AM9P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::6)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:44 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::25) by AM9P195CA0001.outlook.office365.com
 (2603:10a6:20b:21f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:43 +0000
Received: from emails-4647514-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-203.eu-west-1.compute.internal [10.20.5.203])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 79F4280654; Fri,  7 Nov 2025 11:46:43 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516003; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=hhax8jREmm8gYZLFM5mi/8lx02VHITamhfx0kQJUPwYsAe90ndsuTQggfhqLz4hVxWheg
 qgS9Tkn0XhWIKiqPcg1UrBIDKg0KbmGMgodXyh2FpCjBqR+mLUkQU8ETL99qgG8zVmsYh5M
 uDlOcsEdCorvejZXnj4rSHHJor0Huws=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516003;
 b=XBUQvRTuu8KNO/zMx19o83E4zT8iEOPCQMMeK99FTO4GyDYcDpptopPMhVu0CrCd8eCpp
 SIQiRAEruclnOXuL7O+senF1R155ByYNcwZzr0MHovvY8aA0Bc5NJbsPAv3e/X1J3ZWgd6T
 QZty1x1QT5IDE/KRPkne0vTqLCEPs20=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsR+OZ1gZbnW2P1pWjJoOKTUXyN53g1ivBPmmV2tscE15xMRsa0L8XiPUMT+OE0KCF4Ef08k0fGp9dNpads6TOIBdnjDbIk6uiNKaFHpY2SJXXgrciNrM/CX7NZ4fxYqXzlhhhAUezV5QbnOU3eNgl8KOVJA+mfMZm9yFeBUXtQQYk0ues/0dyRtztLswzo4YmUhvXYfniGAA8u5EF3M4bVeZPIwbTs9RQwg8I5i37+G6NZqC0o/oj0OG+lRBSWmXf+YooIXnBvlagCEDFWw9L+0yk1XIbGv45T3pG9E3RMhdztZNdN/5Tt/fhyevBNimv2R6myEz/xP75JPw/Q1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=NTPYOZDLkut0fRxDKSURpprERJE2R6x6QhGSAGKSrhdkXVqE7gQNSfItJBqPvXoc3TUBPJCG555AF2M3c2NI1ldzg+CceQASsrzBMM3nEoJZeB8fwPT1caQjBbi9bgKI0CqkLIlUxa5pEsHv4GbLDI3hO3Oi+teSkGkThPn7R4ZMCV/wwMlsz0aI+IGL6IwvTqp6cy5MIT7oWrtYGGRAlf/106qxaLx0fvDvmtPicD9I4El1rRiY1rOi3H+0R/qoH1hXc7CXk7tpc1UtmW+q1zREfXJyguoaKCD/G7tb57eaSq4gvnuJcVPMf7C7CkbzIcgg+8uL62W1gWHrqMFtcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=Jg+WB/bX/Jevzfge9OzogewGjT8mrKJvMOWLdPy/Of/SSjxo6MrF5bdnipl53h/8b42E5BIEkZg1Er1xEcw45jdk0pvnaA/ZdYYIjhYQl92GbBa8QzqoHTYx057Ksb6v4jZpwSE7nffKlykbWjMbs1P89ZHHlT6FVvF3vcYsf/8=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:31 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:31 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:09 +0100
Subject: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
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
X-ClientProxiedBy: FR4P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|AM2PEPF0001C70B:EE_|PR3PR04MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: a23f195a-b5e2-491d-775c-08de1df352ea
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Syt1dWVmckdLTklVZk5TTGRFSWdVODVqc3dhZ25XT0tPWFcxdkhSdVovdGEr?=
 =?utf-8?B?OWJWL2hreUpDYjAxTWZWS1o0WkxETkhhSitEVWJsVjNURmlzQVRvYXdpRm5k?=
 =?utf-8?B?eFRSYnRIeUxaL09WZHhmNjc0aHdPblliMVgxNmRhdkQ0bUhvVm9QckYwV2w3?=
 =?utf-8?B?Y1I4WGdWOE9KdXBrOGpUZFBSenlqNlBtMC9RTXA2NjYyWHhoNm1kL2hGcG84?=
 =?utf-8?B?VEhETzJXMVV5dzFGSDBWU05sSkt1eElZQ0NwbFRRL2JPeFp3cW56SEZxRld1?=
 =?utf-8?B?Rktua3NkOGZsczZxeUtFNGJTY0l5bEp3UWJ1V3V1MHlGZGp6Qk5zMXFUeE5T?=
 =?utf-8?B?VUoybUpVY1BEaE9wNFBLOWRSU3RGOEFja1pidkFKWmRCUElqQUNoaWh6SXhU?=
 =?utf-8?B?ajdnVGVsUFZyaFh5bk9JajlTcXZlUk5ZQTk4aDJRVlcxVHBETVl5U3hXc2NN?=
 =?utf-8?B?QXg4anMvOGVmSFBtdk54VmZFRG12L1p5WG90MWhXa29DYzVpekxBcTd3OU5y?=
 =?utf-8?B?b3hDbzFzd0VGTDhzbHhFOWdDSWpnenRUdkpwVkN5NkNHSXFwdU9lbS9lVDRi?=
 =?utf-8?B?MXR5am04WTg1a0pTT1NTWElSa1hycUdQNHpOMzk4Nm5LdEtrMUtWWHNXZmFo?=
 =?utf-8?B?MEYvazJzZEVXeDFOY0FhMTZ1OFBUOFBFRDltd1AxWVZUY1FUTzFxUmxkcEg4?=
 =?utf-8?B?Y0w4NnBZanBneFMvZFhTUVZwRUVUMVJaeE84cDErWTBiWTFQYUhLL2dMTHkx?=
 =?utf-8?B?TEVucWtQSDU1ZkN1ODkybkQ5WC9mM2NOY3hzTnRkcEdCMXBQcWdsTTFFUjJP?=
 =?utf-8?B?UmowS2Q1dm5GV1J3Y3QrMnRPRzN0dHRDc1lFeHdMT2QrRERxajk1ZG9uS1Vy?=
 =?utf-8?B?bWRMeC80eEZDTXp1ZGlHVUtTTE9PTDBVSDVOWlYwQ09OMXI4RTBVSG9mem1F?=
 =?utf-8?B?VlB3eFY0RzJVQjhUOFdmd25rT3VrQzYwTE1uenZ3T1JaWnA3amZKVUNRc3I2?=
 =?utf-8?B?eTJCZVJhZUluSEtZQUxoM2Z4WURQRkhOTEw1b0FLN0diUldkNnNxaEJFMS9I?=
 =?utf-8?B?VkJmcjRwQS9SZGhIZFc2QlpsSmhEWTZUT2NDcHZmcm1HcFc0Ty9YeEdtSnEr?=
 =?utf-8?B?WXUzYXVtUDA1NGF6YWJpQjdEYXdFUXMzRUFkaFBETWp3K3dZMjJJUE5heit6?=
 =?utf-8?B?NUoyc3N6b1VYTDIzUENxSmIvUDhWWUx0M3pEU1Z4eHl6Ui9KUWlxanRCYmdF?=
 =?utf-8?B?ZkFHNVlhNXA2N2N0WmhoZUY2US9ERHlrNmpOQldMQXFCd0dSRkdDTCtzMjBw?=
 =?utf-8?B?cUV5RUdmOUFtWFFGZDh1MWxTZkxNVVhhaENheVNVYjEvMUMvVHl3aUc1UlpS?=
 =?utf-8?B?dlRqaGQ5SlRQUFNXbHJBV2tvWHpwTlpHZEZ2a0Y1S1d1QmwwMG9oQmNMWENE?=
 =?utf-8?B?Y0Z3Q3FQTUoxbXJHdnY5dWNJUHUyeWg4RWE1NXoyQ3BHcEhKcFJDYmZ3YnZM?=
 =?utf-8?B?UVhRaXp6VnIra3YvUTVydW9JMm95Z0svbks3RDVuUSsxVjVIY0FyV0lqdWRW?=
 =?utf-8?B?ODU5dUFwaFJDeGlFQUk0L0txbGkxOWhPRmVCSjh6M0ZhaXdTNDVnNGw2RzVI?=
 =?utf-8?B?Mk15dnFTZ2E1NEZ6Mi9IbU10YW4vdTJGR09iSXlBb0trZDgrODFsU2gwM0Zj?=
 =?utf-8?B?K2RZUE1iby9LK29oVkhmeHBZdnFvVU91Z1FLUkJIUmREdHZYY2R4YnI4eUho?=
 =?utf-8?B?dmMxOGdWQ1VqZEV6YkZMN0Q1ZkpmTWZOQUxBUTJuOW1ONXU5TmtMNTlYSkhR?=
 =?utf-8?B?R00zdytCdXYxNCs5a1dUbjB2SGxNWlJDdjJOdnZ3ZWgwVmxNbTllZTEraGNF?=
 =?utf-8?B?UTl4aHluTXVQZjZHRlNVeGFOeXJmNi81aG5YYzB0L2FvbmJCTUdHYWUyeXhM?=
 =?utf-8?B?eE1adkwxRXo5RFdLczV3MndYZERFTFpJL0dWdWFFbTQ1Vm1BSFJ5WklRSk9Y?=
 =?utf-8?B?NGNNNzNldW8xbEY5MThXQ2srNzZVNmZqWVNYK09YNkw1aXIvaGhZRjlFTzdt?=
 =?utf-8?B?Q3BtNHBualBLWWVxcjVWYStHVnlGaGxyQ3E4UT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f78d793aa5d34d8996a75a1e266f3762:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: db0deeff-de03-4383-fcd1-08de1df34b31
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|14060799003|35042699022|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjVtMytWSFRQbjh4aVZySkFjeUwwMGdNQTNWZXcwa3lERmowditrUTU0NjJp?=
 =?utf-8?B?MUpvSFZacUlaa2Zwb0lrMEJUVnpacnNiNEEzdk9BcnJJVFRkclMvbTd4anI1?=
 =?utf-8?B?RVowMWJMeGd3K2JIalZ3TllEcWZyRVFRUkIvd1JiblBzdkRhazE5NERsTStJ?=
 =?utf-8?B?L1FnbG1rYklvc3UvOFlnZFZaWER1S2NTL2l2TlBWTnp1ZGo5aG1pQ2Z5d0pJ?=
 =?utf-8?B?dzBrcVd4UGkzUjNlU0UrZkN3elVQUjVtNFNzdGhOeElEaVdxNElHa3FwVXM2?=
 =?utf-8?B?UWlrNFBRQko5VllKSXNGQ0ViLzZqeHNSdW4yaXpad1kyczZxNndMTHJQclkw?=
 =?utf-8?B?U3dqWWJQd1NVL2MrMzArcCtyWkJQSFpram83MDhxZUV0WmFDVXBpZnVJeHhE?=
 =?utf-8?B?VUdmdnIwb0FpZ1R2b2ZoYzJ5RENsQjNSMHduVFJCdENMZmtXczAxOVAxZXRx?=
 =?utf-8?B?T0FwQ1NMTjVUY0llOTJNOXhBNVZxQ2F6VUZmME8wMWtHOVJyZUtuZXMwTjVz?=
 =?utf-8?B?QWtSMWV3T3BxckI2a0hTZFhFV0pEMXBlTkVrRjlCaXc4d2t6YTZ3Uys2czZI?=
 =?utf-8?B?bDNIbHZFVFpaUDJWQkorS09pWGpXVWJ3OFZDODA3eENrVTZmclpGVCs1OVNn?=
 =?utf-8?B?WWhhU0xFN1RCamJVYk1vaVdZMFFHMDFSeFJyVXFydjhOZnc0YmptMTBhVUlD?=
 =?utf-8?B?RGQxaEdLcUJOYVFZMG1KNVVTRDVmQ2xXZHJvR0N5ZjZYNEZwWDJDVTRjbjk3?=
 =?utf-8?B?N2VYZ0o4dEFzL0k0dnVhNkszOHpaSldIcElkWVpCcDgrL1FLY3FhT2ppanpr?=
 =?utf-8?B?ZXU2aWFwR0hPU1p0K3RMeWoyakhINXRYS09JcDNqejRyV2dqY25xS0dEeHo5?=
 =?utf-8?B?Z0V2Q1pkbk5HdytWbkphZml5MEJvNFkxZ0FIRzhwTnRHVFNYNUNCSlpWNzJN?=
 =?utf-8?B?Y0dTbUROR1ZNYjZSQ3hXZGkyV0Zia1NUWnVyMDRML2pES0MrYnY2b3gxRnNY?=
 =?utf-8?B?VUZtUFpDajdjWE1lUDZNZnB5NzJ3bUxHWHc4U0t1SHlwRDVqenFPajl5anJ3?=
 =?utf-8?B?dFRENzJNVkNyVytycFBid0NMcEJ1aTF4UnFFejNCdWZabWJNdSs0WTY4ZzZz?=
 =?utf-8?B?QkZpcUpldDkxNDZOMkdCUllHYXFxNXJjQ0ZqNWc2czNpWTN0ekpxSHM5Rmpi?=
 =?utf-8?B?WVkwWGRqZGYyeExFMUcvUU9LVHZoOWxTN0JhZTJQUUxydWhxMEZjNDMzWXBh?=
 =?utf-8?B?MFEyK1FiTy8vZDEwUVFSZTU0Q3hOY09wTk03aStlNE1sODJJWGN5RUpBdE9z?=
 =?utf-8?B?d2JCaHZKK044aGkzTk05NGl1dnlmbmlKNklFcmJkL0l1VjhVckhJNVVNYThJ?=
 =?utf-8?B?M2svK0ViQmxkR1h3Y2llSlNCOWw3K1luMEtleW0xaklGL3FzTForV212TDBy?=
 =?utf-8?B?d3dZUFI2YWx4dlNZbVliY2hBUmw5aTRvUElRbURGVEtlZU1Jd2F1aVB2b2ho?=
 =?utf-8?B?dkNha1BRajlSSkYzTUhFdGhjZGV2Zk9vSE5naiswRWIyR0ZUNHgwaHNsUkE4?=
 =?utf-8?B?N1hFZ2FiNVUrcmY3TStZQ0RHazdrZ01JQ0dOVUdydVhuV1hyMTZSdFRENmRq?=
 =?utf-8?B?U0d1enRyemJsSDczYlpuODJQYUcwMGFqV1hRZHpmYjcwK28zd3hxbnFqSFRP?=
 =?utf-8?B?QXdxcytrS2R6Q1AzVzNsbUwrZnkvclNlQ2JjWjE5ZHBYaStpNHhBM3YydTJv?=
 =?utf-8?B?dTNhQlVKazA0bGdsb2gxaXhZTGI3YzRBZEsvMUhub3phNGp6RUdQNUdzbG10?=
 =?utf-8?B?TEdCNEUxUVMzdjR0cE1BdUJPRnNwUUQxWDlhTFB1dUlvT05WSnZyTTZTbksz?=
 =?utf-8?B?NExCdnYzczVYVlQ3bXAvb1RPb3crNlh3b0RTMTBtd0JxME14Zk9oeDY3c1l4?=
 =?utf-8?B?dGZnWWhyWWhJUHA4OUJEcjUzaFhjQk5zMktoTkdrS2NkQ1B6Q3FRTTBnWEJP?=
 =?utf-8?B?N1hxalJDVmxsU1d2TER3ZW9kS2VjeE8rMDAvWGtod1U1RDJPcEZINmJyTGZm?=
 =?utf-8?B?Z2hNTmNjeFRHUmFIYUd3MjYzSVc2WGRrYy94dWRPb203TWZEeTcxdjJCT1U4?=
 =?utf-8?Q?EfcjIFiD/NBXJasdCjlMy03t5?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(14060799003)(35042699022)(1800799024)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:43.7674 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a23f195a-b5e2-491d-775c-08de1df352ea
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420
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

Add missing ref on panel-common.yaml for this dsi panel so that common
properties can be shared.

Drop reset-gpios and backlight as they are already in panel-common.

Switch from additionalProperties to unevaluatedProperties so that common
panel properties are available without repeating them in this binding.

Notably panel-common defines the "port" property for linking panels to a
source - which was missing from this panel. Mark it as required.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml  | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
index 04f86e0cbac91..6940373015833 100644
--- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
@@ -9,6 +9,9 @@ title: Ronbo RB070D30 DSI Display Panel
 maintainers:
   - Maxime Ripard <mripard@kernel.org>
 
+allOf:
+  - $ref: panel-common.yaml#
+
 properties:
   compatible:
     const: ronbo,rb070d30
@@ -20,10 +23,6 @@ properties:
     description: GPIO used for the power pin
     maxItems: 1
 
-  reset-gpios:
-    description: GPIO used for the reset pin
-    maxItems: 1
-
   shlr-gpios:
     description: GPIO used for the shlr pin (horizontal flip)
     maxItems: 1
@@ -35,10 +34,6 @@ properties:
   vcc-lcd-supply:
     description: Power regulator
 
-  backlight:
-    description: Backlight used by the panel
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 required:
   - compatible
   - power-gpios
@@ -47,5 +42,6 @@ required:
   - shlr-gpios
   - updn-gpios
   - vcc-lcd-supply
+  - port
 
-additionalProperties: false
+unevaluatedProperties: false

-- 
2.51.0

