Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF7AC3FC9D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 12:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717010EAA6;
	Fri,  7 Nov 2025 11:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="p/q/e9/t";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="p/q/e9/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11023139.outbound.protection.outlook.com
 [40.107.159.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40DF10EA94
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 11:46:50 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aQUKdctp4V7/O6W86r5J0nwnkHn+OLc0mi5T+TmLITn0DG34tIKPpGrkFsqBEsFupd1BtafUmoHzykyJg1doSiml3nT/Rnzs3puyCWgO72wGEkYYT9lyG2gFMhRGG5WqEWScPqttd8bFfn3a9hqDyiwN78g36+xwH5Cq4457V1G3TD11W26zy3G+HpfO0Fqg66qwscx3/BWW3TO3o8w7wkEtKPu34/GVEu10GgeJ6awqJLqzh/30dPRXFtCLU2sbfo77f/G/p8s5qQGDpT/f5Aglo4oKJbL9BJplGgBsw2Yn+3o1mGbrvS7uEehDYTAhFaj8a9oOXDM4WubNJzmtXg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=iMUJFPMCK3CqzatJBb5Tlxu7v5bmpqEAhJIRCrSQgttamJQPTBOLwI45NIU+Lpx3kiGVMzb9V2qnk5eieqiYadx+ml5CUxVAD6hPFs2q6V/iqQ27uO7Iope+TI8VCGhoKPuu3KmoYaN8eKgFsD7RLap27UghicfHhMfp6U67zuUAqGIuAGE4ClOhVwo00rPLCfikEdBugfzFGiDuVZjJgv5zDub8nRQQ8dLOrQeyhR06C6YWcJZEsbgg/IM1wM43XMIulgaPc1hJSU9WMlxuy0EFCudDRfX4E7ce1J5FzjBTgxQgU1Ph6bZ6XYC2fHIW1xaudsxf7R3JBBjh7XQTqA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=p/q/e9/tx4WbpMB7xZGB2q28yQqhkvGCyD4OfEwcu5g7Z+pUa6xA5iylD7dz8uphVWKcfB5fz/5erbJSe4/fWG3ggeIEa+D9VbBA1WBBImcm1zKW9L+XaTsqeO5DW+CH2B/NzH54OI+YXLEd7bCo/E1vIjaE7UFlNDTnwXUSYos=
Received: from DU2P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::17)
 by DB9PR04MB8107.eurprd04.prod.outlook.com (2603:10a6:10:243::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:45 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::da) by DU2P251CA0013.outlook.office365.com
 (2603:10a6:10:230::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 11:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 11:46:45 +0000
Received: from emails-8188765-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-176.eu-west-1.compute.internal [10.20.6.176])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id EB1FE7FF02; Fri,  7 Nov 2025 11:46:44 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762516004; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=I22vNZw3frvILuPLucevDg24rh6cdZQO5ZHJqlyZoT8LdXC+KIEKyMYLMjZ1/efOR/k1H
 TcCkJhAcflXzXCTlAFCRcgErCHKc/luuAIX7CHoCZjvil5V3pbKEWwqv8JbUZmvq8IabB49
 BTYy/MS91oxY/zLr13gL+UiQWI0WM1k=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762516004;
 b=FatJaznju8TvdcINUXckI+yu+zYhbVsEXmbG9VHz5FzTf17Vf6vgohiZisea9XJw0EgqX
 5ynabtsXY4nIfoWtUy34qBViUdgnfUvvI8D3PL26HYdGT/LPvd3j592wqCN4ZqdE/f7wTl/
 me8fM+25efuucLyz+kRUTDg64pembsU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+THJMbPcjDCVGw6H6V9+4rEs5qGR4iUwMZSehyZxL4S22RT9szy7RZlEMuFCGfBcy2OOdjbuQOTXcmk4LlUTnEAKeKbEQUhQf2OhLSSKfEnjwv8MV1fh5tl8gR2G9L7hWHojPCIFYgtUXx6AgE6PnJWb2fWFzKZrCm0WaKcO/vNFTM5iCs+8I3SJPB4AOr3l/L594+QvMECOe6oNwXBZoD3zRCpJ6N0n52oz5BM/r/8m5Ljk1s9oifu1f9PUhqTuHlQjVSwZCVSpV+bDklzTZtg6ARDX3zRDGN5VqmzEbq49kvKfo9VCc15RvBRDQoc2o8hLBxJi6U9gI9Lf0TDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=LCrtcgy1cW+iMBgxrPe5q+kjpP35jYnqtAJ/bQDschly6ZmBDBuQZqhBBduaJSG/wfB+aT6Pnv8F3FDt4PukI1Qwq6BjmOd4N3bObOfMEbPjDjHWTONZutel0Vn5anAtekuMH4z3+jG7FZ1yMw/GrWM91/quvkZFFF0C0HFWeaHEjUxXIimUAZoW2Qx7R7tOQnTsZ+ZnIUtPXkr2QLEWywQHAzShc/mDgClh7KZVUf071cdZzK3qEmyfEHgSM8zCrSYl8D5bKdU7fEh5F/Ypre/0Jtj8KSxHt/bBSw5sef5DJpHPoUpk+iyuMsBUFgzSrBpW6CcpYx0iJefQCu9paw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=p/q/e9/tx4WbpMB7xZGB2q28yQqhkvGCyD4OfEwcu5g7Z+pUa6xA5iylD7dz8uphVWKcfB5fz/5erbJSe4/fWG3ggeIEa+D9VbBA1WBBImcm1zKW9L+XaTsqeO5DW+CH2B/NzH54OI+YXLEd7bCo/E1vIjaE7UFlNDTnwXUSYos=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10095.eurprd04.prod.outlook.com (2603:10a6:800:246::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 11:46:35 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:46:35 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 07 Nov 2025 12:46:13 +0100
Subject: [PATCH v2 06/11] arm64: dts: imx8mp-hummingboard-pulse/cubox-m:
 fix vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251107-imx8mp-hb-iiot-v2-6-d8233ded999e@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|VI0PR04MB10095:EE_|DB1PEPF000509E4:EE_|DB9PR04MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: ecda8dd8-90ec-47b6-3524-08de1df353ad
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dGRrYjlWNUhmbnVsVlF1S3YrZnJJbG9XK3Y3UWEzbVpjbVVoUFpjQTdVSmQ3?=
 =?utf-8?B?bC9mRUVUV29EOEw5Q2M4ZmkyeXZVY1RZbWlUUlFONkF0QnM0UjUwSWs4bDRQ?=
 =?utf-8?B?NzNQczl3U0M5YjcrUEhnSU9PcUlDd1d5R0IwWEJJMnkvNS9CNExIdTNFTEI2?=
 =?utf-8?B?YmZ6cmZIaGd2eER1QkdxUGxGOXc1NXhPVWVGb3UzaTVYVXYxTmVlWlJZU1I5?=
 =?utf-8?B?QlNJdWRsS1lwNGwvdS9WanRKUHkrZy9SWWxrSWxJQ05IN08xNmhGcVd1Z1dT?=
 =?utf-8?B?Q3h2bE9MNlg3VUtaT1NCdENDYm9EN0FPd0VEdWNsTmlNVTExaDcrKzZaTmk5?=
 =?utf-8?B?Q0p4TnRYdS8ydzg5TGRTQzkvUkRnQlU2aFZkdlpRYnJDa1p2MU44NUIrN0U5?=
 =?utf-8?B?dVZyYjBWbVpJYmU2QmhQR2JvWnFOLy8rcFR2NGZySTR6aVR1SnFxdUtQV09D?=
 =?utf-8?B?RmNUKzNEeFE5MFlxR1UwT1NZQjNEa2p3WHFUMkVwSFNpaUdYemtMVlRSdndw?=
 =?utf-8?B?NFcxY2E0UFd4ZWcyb3FGbGVMckhuMFhrMytxR2E3ZWp3TW4wOVkwb2orS2ky?=
 =?utf-8?B?YnEwQ2szSG9vTEdkTGh3MmwzMmVJNUlvOWZlTDhZeU0xdVZSQ2k1em4zbm5q?=
 =?utf-8?B?YjhuNTNETnRhUm1jSk91LzhvWjNKekVnY0ZMSWp0OXlDeEZUTnRtUWtPeVU4?=
 =?utf-8?B?Y0FBQ0hRWlR0RmRXbjU0bWwwb0k2alBTSVNLTnp6UTlsdUFGVUxqSlFhQzZS?=
 =?utf-8?B?WUhNNjNjbHBoSjZhRjdGV0ExS0RXSUVEMlZHTjUydWZKeE9YQnNRTnZ1eUZG?=
 =?utf-8?B?NzNBYk5ITzBkbC9wakVUYzNhcnZJQmVnY0F0RU9mYktmNVBzTHB0bWhNSlpT?=
 =?utf-8?B?ZGkycURoREN3cnZPYXRKYm5LNmJodDB2NGFtNFZKRlJmWk9qdTJDQXNOZHFY?=
 =?utf-8?B?SktRRHFpNzVmRHpHT0NBTDF3MTdXNkhrTG1Cb1MyNkJqZkVMODJzWEdaMGNa?=
 =?utf-8?B?QjZIYVpWK3Nvd1NvWUZBMHI3d1ZXNjNER1dZYUxZZzBaeFpZV3lNY2tINVA3?=
 =?utf-8?B?VjhDTXhUV3ljMzYvdk5zNkVMbFpTc3FEZUZYK3hMcTFiQ2Fwd0NPU1htM1FI?=
 =?utf-8?B?eHkyZ2R1cXpEQ2g1aFRLTmJ0U0kvRjZOTDZ1dlhrd1lSc3gxek1ENXQ4Y1RS?=
 =?utf-8?B?cDZVeVFObXlVTkRacWxDcEpMWkVEcUdSUjJxTlhVKzZ5cGphaWpKUUc5b3d2?=
 =?utf-8?B?RXF2UHB5aExYemNqSTk3QVZnb0IxSER4V3dyNTBCR0pZSFZ1aXJHWkVoTDRG?=
 =?utf-8?B?RmpKV3dtL3NJakN3WEZsSkJtNHF4OVJRQzllY251aXZaTGFTTEQrTGxsbExQ?=
 =?utf-8?B?UVdPbnppcU90WnZORVBkRVBYdEJhYzZncmhFZUdCUGJCQ21HaTN0WWFJaklL?=
 =?utf-8?B?a3BmR0VxcEV3ZEQ0VGdpd1BiajQ5OGhldmk1aUxabnIxN0xZUitSU0psTzl1?=
 =?utf-8?B?N29RaHprU09rTHVNdW5PUTlXUlZUVjM0OTk2ektkWU9FMWdRM3AzbnZES0ZS?=
 =?utf-8?B?UDZ5QllZeGs5MnQ3cjZ0T2puVUFNTlR3ZGYwR1gyVmNpSW1UZlp5WlJ5emN6?=
 =?utf-8?B?N3VjVFhEWDBDZDJmL3o3dXA4Rm9zNHA3SEVHSThObnB1QzRSV3BZM283MVpq?=
 =?utf-8?B?cFBEMGRqSDdzZ3dsb2xqVi85aHBiTDV3RjhLU0hWRUdDUVJCeDNVaEcwT0t1?=
 =?utf-8?B?dFg2UVo0eVhtZElWSkthOTcvcFE2MEI3NWJYcjVtTmk2YmQvSUE1VVh5RWF3?=
 =?utf-8?B?bml1NTVoYUJsdlc0Y1hVTVA1YldFNUp5NXMrZHNqbXQzUllJbUxoeFhoOHBI?=
 =?utf-8?B?NllmQ0JaaTVOc0R3amxuZHFDUDFlTVA0Z1dEMVpvMWdtdVFQM2JtR1c5cFh1?=
 =?utf-8?B?cDZZRzMyRGpBcXQ4OTBiMDFvRG0yY0QrMzdFU2R5RmVZZXJCWjAxbmZXK0dn?=
 =?utf-8?B?aTF5bGtIMEtqYkNOSWxJTXQwbGtYMGNIMEk1aFF2VU5URHl0WlJIYlprN1pH?=
 =?utf-8?B?UEdQV0Vab0oxNmpXb0FaaVNHOEhiNjdVcmlwUT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10095
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3b59166eabd34ae1a6250116b69fe044:solidrun,
 office365_emails, sent, inline:55f0baf1cfcf9deef26c3f5032cf7141
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d1624ec8-4bd7-4b27-2898-08de1df34dbd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|7416014|376014|35042699022|1800799024|36860700013|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWZ2RGo5a3BtbE9yQjdsek1ybjlZdHlsMzFReFMwZW9IM1JnV0xtbFZwTGFw?=
 =?utf-8?B?UmJwMTE5aS9kK0RPZFlRQmJsN08xdTZkUmloQlcxZGgvSStRRXNKNjFocGJq?=
 =?utf-8?B?Vk4zVjFwYUtmQm95MERMRi81cmpNNnBrd3BFRlNrNkhUZ0ZXdGJ4TUZ0RHcx?=
 =?utf-8?B?MlFNSEFTVStUc29LMVlCRk4vRnNnRm52UXUyOERGWDA3TFB2MG53ck5PTS9q?=
 =?utf-8?B?UXkzVG0rT0Z6d2RCa3ZXTTlvOWNtbVlRdFo4YWtEQy9OdVUzZEo3cFFiUVkx?=
 =?utf-8?B?OG12Zit1VnNzR3R2TG5ZMW8wLzZEa3dvZ2Z1MjZjSHBGS09Dd0k4RnhHbzQ4?=
 =?utf-8?B?YTFTWGsrNlJCRE9tTCtIUmF6QTk3N0UzR28zS1ZKM3cwOERLT082RWNTL1k0?=
 =?utf-8?B?czNXSG1ySEx3NkQwOUd5V1lKQk1VWkRuN1hGUjU0aTJHS1k0ZkZ2TjFmbURy?=
 =?utf-8?B?N2g1TjhreEgxQjVJeXprUWZMc3liQXpBeUNCOC9LKzFEVkNTcGU2c1AyTnJZ?=
 =?utf-8?B?WU9xWjBJbmgvVkpPS01VWXVoYVpkRk45THZtblkzWHdQYjdiSDFTM01Bay95?=
 =?utf-8?B?aGZ3NlhvdU5nYUhUQ1NuYXpINWs5TGhxUWRJVEplMEkzSmhzNkhJV0hRbVNH?=
 =?utf-8?B?S2dHeElCcitvWjc0OUtoOGxlT016aGZNSldHSEdOa1lUR1Jabm1RcmFlc3V3?=
 =?utf-8?B?VEsrRUF3dGlNTThiWTNSY1o0MFpnTlBRZTdGM3QxbmV5VjllQ2pSUHgyc2ZT?=
 =?utf-8?B?T0lRbUk1Nm51dGwyOW5UOUh3aUFVbGFqallmeDhleWhzR2J4dGl5alAzQXBS?=
 =?utf-8?B?RHJKaTU5ZEZEUkkzNTlid29kc3hWdDZPRGJRWlA4ZFBSS1lGbm5ORk1Ed0N5?=
 =?utf-8?B?bm5FUUp4UitHTDFCL0ppdHkrYXZHY0x5aEhicnlPbTdnU1dRL0paVVUrK1VL?=
 =?utf-8?B?LzNsVEZWK0xjcFBVTVlKMWVtelRYcGMvTVZKd0VRdjJkZmNoQW9xbkJCbmU1?=
 =?utf-8?B?dTR6OXhERXB1NlFTcU9oYWRjY3IwdkxMekEzd3Rpb3k4c3lmeURUMVBUbU1y?=
 =?utf-8?B?M0JBTXlqeTF5RGZUZ1gvNE1BSXhzV2VMUDdJVnVJV2NIOUlSYmV2WStJY1ll?=
 =?utf-8?B?UUpvNExaRTdGeHdhcnBBVEs2bmdObS9ET285WjZjdjIrSGdZVHU1UmNIb0ww?=
 =?utf-8?B?TWJ3ak90SGk4a0RFL09rUEZ1NzJqRHBobXhSN0d2TVkwdTVDRk8xdk9DcnpE?=
 =?utf-8?B?MXc5Y3NzSXptSkRuZ0xpUEREd0xJWXRob1Q2OTRkaS95c3RZY1NPSHNTSFZH?=
 =?utf-8?B?cjNlbDBLc0tUbGZQZmlNeEV6KzRab29lSThyVTdwcU9ZTXVKdU1ld1M5anhJ?=
 =?utf-8?B?Y0p0K01hbU1vbnVtdXJwMVkyZnlpUmJrZWFWM1BxRWRIQWdmMGR2RHBMbVJQ?=
 =?utf-8?B?TDB6cmwrY0lxKzBPYVFsS1oyb3FzZTZxSDM2WUtOM2JUQ3hOUmxyWmZiR05H?=
 =?utf-8?B?MzVoOTN6WEk5NHRTRThRTmJlKzVSb2FEY2R4YTlhTHpjR3lra2U4OThYZVdy?=
 =?utf-8?B?UXdkcFh6T1FIV0VLRDMvWFp6bzVqbHprd1pQNEZGY2k1OHgwMFZDdjNpa2Fr?=
 =?utf-8?B?aWtBNUI1L2IrZms0TnRwZmFVbmkvR3Y3bklvdU5tclgrNFF3Y243L3o2Rjg2?=
 =?utf-8?B?aDVMOWovTk41dlVjeTVmb1dFYmdTQjNvUTROTEJsNi9STXlwTHBRTURmZWRz?=
 =?utf-8?B?cDVPa1FQTEtwREVlek5yNlYrajhiT2dqZzJJY1RmUW0yZzZjaVBYUmJZK0dZ?=
 =?utf-8?B?TFR5SUVqRmZtQmt4OWdqV3A1UUp2YjNKRFpLZERaQksrRWRPd0dRNVVnRmJs?=
 =?utf-8?B?eUUrSklRZktLQUZ4VEhXc0JPVWQxV1hiZGc5eVJoZlQ2OWNFVi9BZlFFMzlr?=
 =?utf-8?B?TTFvSzkzRzQrMVVxb0xNSk1FRVcxT2xhM2ZxdCtqR1lUbko3R2E3bHdXZnFB?=
 =?utf-8?B?UjE1QytKL2poeTR3RWF1K3lySVlSa3VGOW9SM1VaV1lUNFdzdW1CWEk3UkJI?=
 =?utf-8?B?SVdHOFFPT3hLMjNlMEhaSFc0eXllVnhJT2x0V0EzL09PV1g3TEV1c3BxOFFX?=
 =?utf-8?Q?XkYoyTNWCJoyD/ybo1tXXFOMr?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(7416014)(376014)(35042699022)(1800799024)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:46:45.0895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecda8dd8-90ec-47b6-3524-08de1df353ad
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8107
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

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79fd..7bc213499f094 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14e..5b8c8489713c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.51.0

