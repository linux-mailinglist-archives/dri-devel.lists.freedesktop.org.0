Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF15C6409D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6656410E386;
	Mon, 17 Nov 2025 12:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="WlK5s7wh";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="WlK5s7wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023118.outbound.protection.outlook.com [52.101.72.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C9A10E093
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:41 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m07yBzJqJIR/BsJOXlGA2CExcXRXMnUR79VEbml53Q3pCke3ho0h9UOCDG1orgKVKMblgyCm/uqvSjS+xP8katFJoomU26trwFWwPOP/xw0fFP5VpGCI6mctRQR/+Nv7E5674fvjuAKLTGnmLlzYqvSxOHH2JG5jIr70p1tJeZPuqb4NOc026Pb93j2VykLjIc9VnR2HH9qEmPRh/UhyHYEw5MLd7azi4u3V1i8DOA9+UhAep8yk3Wg/zB0gjvtf6Q+lCCzmCkq+5bOxSHqtqztIT0QyzffCzk+n0yw453oPxfi/RCYPcb1sfNYZfX5RDDc5DPNjo+kEtN4JCQqxsA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=yCeMsMQzMoNwsW6qv7gwt3ByWX/qt2Et+3uR0+XtErNLTTtJu1Q8YtImPLH5QBBOmW8/kI7rDjVoGd4Ji8bhgYtKN9JudvSeS3PKW4mRQnW41bkwGg8ffkDYLZKWpOA8v+XIscmWZQIQ/KwspBlveayXR7x0Y8mGzOGhZ2Ns0+YppQtZE/P4d7SYLWiGb/5jAEJCmGb+DuGPMrhzB/8Ci7PHfCw4f3OSmPacT7r/juOlzW+02A1rWAHhHm+PH7hvD9VqhtFMZQ2uLV1+cippfEe83A2X3z29L1zFGiFYnAQH+KBW3uwfOGH1a0eRoV+HG/kG8jgaWmoTGj5F2Jdu5Q==
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
 b=WlK5s7whziqUVhrWfGcr2QpevRO2ee+8ffQ575DueRPHQ10QsVj2kmoIv5LxANrPWNo43ZxPxp2yaSQlPePqjPUhhCqrmTj6Lt51I36m96FeYbjOc6qcmidDVaxeQuxWMKxutv82hbUmns3nkCu+iMqURrg1200G9gqlK7ojTbY=
Received: from AS4P189CA0045.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::17)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:38 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::33) by AS4P189CA0045.outlook.office365.com
 (2603:10a6:20b:5dd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 12:29:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:37 +0000
Received: from emails-1571551-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-5-219.eu-west-1.compute.internal [10.20.5.219])
 by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 9768D800D3; Mon, 17 Nov 2025 12:29:37 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382577; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=M4Fw48ivglJLa7ebyPBppfplrJwDXqi86sV51GTyyf2D2VLopJ6vc+reHffrlDobDRnp/
 6eT0P40JDGAOTZ4BuTC4prRpw8OwINdjh8kzP/C5WOU8DKA3cOVuSM6RxLcVGLPeDWjOy3B
 IO1yBhACZ73/IKrjk/bzIAThGNqPhvo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382577;
 b=bNczie1LY0V7r/4hFhHCFPNCrRbR+AxiEivcY7gLXWbAwPaCFgs7DxnB1ACaw5JllzZKR
 hcPWlcPt7u67kRZe7BjLaoyY7TOWpqqZQZqNg4SFoWkQDGWHVi9ChbVY+W2ACBoEZ3hpKLF
 O7ZgXngWtuKwHAs6s+1g6tWPwPZ/pXE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXkMQcFK53PyewVJA7eaeYnLiEqzQqU32EmVrOz0jZLOPto0Kjh61YQT0OujS23LNoXVsC5cmhKP6uQ3Y7G3TaQWnUt3b8ACQOeLCCmm6I/y3W75mcYlfLV2xLHebCYLzUXcRdEsm9prVxL0XnTjjWfOl8x68kvpO9KdqCt7JxNmjywGct4dQvxSfEr5NAWxFkWAvfTCKJpHhl/AC0kMMbsn4OMho7iUtvswUprgiDXfJhXzQQ4p5Odp74x+CNiKhoqXu1+S+HoFkmSMklFIazFnqHU5M5uOgsVX+6Ct1oR7CBaMO6rtw4ZQPMnAyQL9xRjpafHCZtzwivID8JTzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=MzH2n6tLy36FUG0JGw1OzNFKvWATuCfLyATg2vzW5zU/kypTHPhPr74NCTHQVXRMdNJetROVGuO7z3Wajar9egT4e2oIMYqad6jCV8GDj2conxBqVVh6W0gdcWLPDgAiraMhZ4wfeLZP9d+08MEol3a76727CfnFG35XL3M/LjTLPy6bp8bftugyLBgzCcNAdCdOgeG++8lskHTTmfQ95J/ozK33b3zIjLsYuCG1+RLT5bJ1drcnydp+s/84oucqrzbcUG9y6EX2JSPtmcrrgOAaQhMNGeQLS+dlVNqhJngDyULFavUmkNm6bMqimwK865H4pI76+39XilwhD/UqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dt808wMsxzCHyyYxIFqQyHPQjNxiInWYRG3+/6OqSCc=;
 b=WlK5s7whziqUVhrWfGcr2QpevRO2ee+8ffQ575DueRPHQ10QsVj2kmoIv5LxANrPWNo43ZxPxp2yaSQlPePqjPUhhCqrmTj6Lt51I36m96FeYbjOc6qcmidDVaxeQuxWMKxutv82hbUmns3nkCu+iMqURrg1200G9gqlK7ojTbY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:3df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Mon, 17 Nov
 2025 12:29:22 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:22 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:44 +0100
Subject: [PATCH v3 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-2-bf1a4cf5fa8e@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM9PR04MB8440:EE_|AM4PEPF00027A6B:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: 627cbe38-8cb2-47c7-3d9d-08de25d4f950
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?OVI3d01lckh6V0hVOEttK2RkampKWFN3SjdTY2lOaExvREN1eTdERWxJT2h3?=
 =?utf-8?B?ZUtXZVgxdGhRNjZMT2Y4REtLakZLdjF3QytoeUowN2dGT1hwWGVpcnJXOWpu?=
 =?utf-8?B?N014K3NJdnZhNGFkazY0ZzkvcUVZaXRvWWh6R0tKVnE0ZEU0ZHBOSkNEUHdJ?=
 =?utf-8?B?cjFPWnVsL2w3N3R0bTFEcndSQkVhTm5XZHVOS1FGV1JHb2kvL3E1N2RudXkw?=
 =?utf-8?B?T3hjUjYxYjB3QUhJUlFGSDFZYzhWQk42NEdyMlVOOU9KYkxlaVZJakFnVjJa?=
 =?utf-8?B?dUxMSzFmbW9XYUhsZ3F0ZzRjMlRTekQzT2tXQ3RoK2JSNjBYR0Y0OXREd3FH?=
 =?utf-8?B?SnBsWnMrR0pVanQ2N1RMTFJqazhydzI2STQ2d3pWOVMzMVRPZEJsQS8ydmdI?=
 =?utf-8?B?YUlOamlEUDN4MUFHaWFWYU1TbnJaa2VlVlVkc0g1RXNQdXJreDcvYjZGZHkz?=
 =?utf-8?B?eUVaWUJUQXI0d2QzWnh0d0VBallvbkRTUllBeXZWcnh6dmlzRE9weFVPdEV4?=
 =?utf-8?B?V0kwSjJFRWlLcDFQSG1IWlp1R0Nmcm1CVmhwK2g0dEVqYzNEWXAzOVBwenJ6?=
 =?utf-8?B?TGV2YnhvMG1sUnFsRTlMTE83NW1SZ1NBVk80ajRXd1VFdlB5dzZDT2NRNHBQ?=
 =?utf-8?B?TzN5MG1oa2JrQVdkK3JpbU5hNnBJTVpZeDY3bmZKdzZLRDJYOW9mSERmci9D?=
 =?utf-8?B?NHB2dVptdU0zU3BOTU5vOSs5REJ1VVhOZnpHamFFY2FaRTZvM3d4RlV1WUds?=
 =?utf-8?B?SlJZaGxsVGw5VUNpbVhMM3o5L29JOWpLWmhUTHpYalM5V1FkNzhKV2MyRVhw?=
 =?utf-8?B?dGthc2h3K2JjTTFYcFk3dHhhL3NWVHRpMmFoQk51V1FPakkyUmRNSVBnbTRi?=
 =?utf-8?B?WGhuVFZyZk1OVG1DNGpMV1RPdGx1SlBoeHU0SHA4R1RDbDhxRW1sQWJXcGpD?=
 =?utf-8?B?OXZXb1hnSTJaS1poSkhZbWZEVTZySHN0OHo5all4TlI4N2lEKzZVd292c2h2?=
 =?utf-8?B?cU5ieTFKczllZ3NqSnRqSmkyZjlWTjcwN0xBTW1BT1U3N25OV2hrcWlBRzd3?=
 =?utf-8?B?NldtQ0RMYzF4TFZ3ZEloU0J2TGJSRlQ5STMwczd3TUVuRnpwTE1uajJhOXQ4?=
 =?utf-8?B?cWJDazBRbFo4Tjg1YVd1d0NpTUNRVWhyY1FTZnRxSXl4V0FYT2plQjN5SEJa?=
 =?utf-8?B?VUkrZkl1SEw3WUlCRWRDbnN4dVlzWGF3WXV6QUNqdDYvZjNRUHo0WWk3U2Ix?=
 =?utf-8?B?YWxGTjM1bG9jMmk3K1lrdWxVbDdqZHRIbGtvVUNzbnhPNE9Kd3lqb0FPd044?=
 =?utf-8?B?SFV6OWhSZkwzcXkvc1VuMm4vR0t4VXZEVlh2MWhYTDJhT1BZNHpmS1RiZFd5?=
 =?utf-8?B?MUJGaXRkUkN4d0hxTGVBbnc1Tk9RT1NCZDVPa1F3S0ZBUG1vdndwYy8wc1Vx?=
 =?utf-8?B?dGQ4cnFsWDh5TVNUS2wrV0I5Q3g0R0d6L0FiczhZNk5EOEg1NVlza0NVRUw1?=
 =?utf-8?B?QVNMMVVIaFErbkU3ajBMSEJEWWhCRUtGUTVmSXU2SFBpQjQ4WUM1bnhqeDF1?=
 =?utf-8?B?cnNkSHdvbThiamdoWXROMVNpeUkvcjl5WVVTcVY0NXN5MTR6dmIxcnQ0ZDln?=
 =?utf-8?B?MU03M3hLN2J4aDNKSCsxbzhFRk1MbGNDcmh3U0NFM0RwMWVzT1FyMkJLN3FC?=
 =?utf-8?B?ZyszWDl1cjZ6bnppWTVBc21ReHhoaXJNbGR2Nkx4S3JxN3ZiN0FQLzByQkZC?=
 =?utf-8?B?eUlhODdEeHNER3NJK3dIK0hPTlhRWUdZcEVaUlVJN1JiVmpZNkhpRTNuKzhJ?=
 =?utf-8?B?eW1pL1NCTG5SQUJSLzNGc2hKWDcycklDYlNxb2kzOWtHRWxKdjNoQVp0Rmx2?=
 =?utf-8?Q?wFswxOC5bL74J?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 83eb317837314d4ba162dbb37b1ed9e4:solidrun,
 office365_emails, sent, inline:e63acf9d0091647e1c4ec6a3b065751e
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 99601b84-84bc-4cd4-2f35-08de25d4efd1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7416014|35042699022|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWlCVFhwL2ZaejB1L0FobWlxbmR1N1g0dE1SQ1NGSUI4RlZlKzhaRGo2UTRF?=
 =?utf-8?B?MHhYazA0N3pHd0crQi9qZ2VDa0xhV29ZWlk4bEtXY2dtMmpGbUZSM2l3REhB?=
 =?utf-8?B?ZnhYTVVLQXI0Yk1JdE5tYkpQSXN0c2RlQmMrVGdIUEcxVmp3RkRCeUtvV1Yr?=
 =?utf-8?B?QThKSXF2d1huOUxIR05GWVE4bFk4WE16RFpjVWF6Ym9TQUhKcjJrRUtNdnds?=
 =?utf-8?B?TVpuKzBjUmtpUTZ6UVFTYjJhYzliTVZZVEwyZUVtQkszK2VKa0J5eTlORFZI?=
 =?utf-8?B?RnVmekozL3J5ckVSTTJRWkNjdFhYL3RpTTI2bzVIRjVNWCtSR05FL3BPLysr?=
 =?utf-8?B?VkR1K3ozQ1pHNkNCM2Y3MlUwWGg2UG9XSE91cDBVRkVETHI1WXJIT0U1djA4?=
 =?utf-8?B?dFZCUUo4cEdoYTJ2Rm9yNlgzekVQdlFDcDN0T1p2ZENwejVSczduY0pYc1Vi?=
 =?utf-8?B?WFNrQWFxNVVyTER6MDlacWNRZFpvaVN4QVBzVGlFMXJyeFNwbTFTbndYMVdh?=
 =?utf-8?B?cDUzeUdRcXlobEhHbzZZYXVmSFl0OEd3VVk3UUdhQVB2c1BwSFRvUU95UGkx?=
 =?utf-8?B?ZzY0Z053b1BjSnVOd01kRkE1MlgyVVlBK2h6RkpjKzJCUnFkNU5mY3J0UmY2?=
 =?utf-8?B?YVZ4NWUxUlkxZHdJMTMzTVViT1UxbVVGaWdISTM2S3F4dnluQUM3cjN3SGFa?=
 =?utf-8?B?ckZ0WE1MTGNVbXh6TUdGb3dSQ0hzWVIzNDBvclFncXRGMDhhWENtUWFYSmI1?=
 =?utf-8?B?c25VL005ZndCM0xvRVpHZk1rdlJBdEtJMkFUTkFCZkFmNnd4d2h3bm44TG10?=
 =?utf-8?B?SE1EOGQwalhBUVAyTHhKaVAwbmgrVkV4NThvc0RmOE90ZnpOM2VVb1k3Z3Ry?=
 =?utf-8?B?K0NtTWM1ZUFKTlQ2S2RLMithWTdjSWFjcmdzV3JXamZtQm9oRURGNjU0WUZ0?=
 =?utf-8?B?blNFRnY0K3UxWWVyQTdpc29kSExnWENOSjc1VnIrZm9maUJXSllaMmFvSTF4?=
 =?utf-8?B?bVRYL1hxc01mbnRHV0NGZ2lvSEdqVUNDc1F3OU9MbFpRK3g5L2x4dmwrOGNi?=
 =?utf-8?B?S1dNazFCTUE2bFRlVWt2MUNOVTF4RHJ6Tkk4ZFNVNW9hVWEyVEc5M2tSdU5W?=
 =?utf-8?B?dEMxY0lmT3VTWjVyTEYwOU1iNnNCdC9iN1FzMWo4NTE0ajZJc1JaTUdpM0lU?=
 =?utf-8?B?UWpOOUwyK0hxNk4wbUlHSFdEZHZxQnhIT3pISnIzSDhVSkNpN3R5TFRBMHgz?=
 =?utf-8?B?a0U3clhSMjZiUlNKd2xMSmZWSHJrMHFsbmV6VEMvaFlsNGFHbzJTVjFFSW15?=
 =?utf-8?B?b1ExcWhlMXdwc3BDUWJnVnp1Nzl3TFRuazdjU0lPdkJPWGRvVmFRcnhDN2pF?=
 =?utf-8?B?TElqL3QxOFRiT2Y0aFFpK3N5dUE3SHd6SnQrZVBDWkg0Wk1pYm5VWTBRTlUv?=
 =?utf-8?B?NzBMdG1ySEhXN3Znb3ZXVXFjcnZXaHpFby9JUitJMnBvaVlJTW5zcUdSWmtv?=
 =?utf-8?B?YnFpR2YvbmRyVFgzakNtcWFMYkhjdzdrYlI3b240K2VYNU5FbTJSdGM2QUl0?=
 =?utf-8?B?TEZIN1BWc2xGUXc2dzBoUWlITzRBQWlSbVBRVHJlWGlxTVM5MUloWXIwcW9C?=
 =?utf-8?B?Vm9DRlF6RHF2VEtuQkt2K05kbU9JTUhkMU5HSnZKckxqVFFiREtySWxjWCtk?=
 =?utf-8?B?aDFwTlJWdFdRVUR2Y0VRMlJVS25pWTNKKzZoOCtITzloWDRQakJpR3VIZkV4?=
 =?utf-8?B?T25yemxzNzh3dkV3a09NQnZiUUdRZnVtT3lVNlJ1MW9SdkpIeWxCZC84WnBm?=
 =?utf-8?B?b2hSZGVSUkVLYkRpZklyTGJDOVpzeE1QTGVGNUFYTWpOUWJpUEpOTUhseGd4?=
 =?utf-8?B?eDl1SFNoaGI2ZGVGT3ZBNkNBYmZwb3hJeE91Ly9vbXhKTjByRVRhRUJ6TVAx?=
 =?utf-8?B?VmdhTzhqbFhkSUs0bTMwWU5aN1BVbVM3V2liUEdBUHdicTgvVEdORGtJQno1?=
 =?utf-8?B?c2RCaDEzQ1l3VWVNMUtrTzM4aHk5ZFlpMVhQNjlMWkhnckR6VURVdHB2Y2JF?=
 =?utf-8?B?Zk5hdkp0ZDUxa2lzalhTRVVibHgrZHljc2dER2hnU3MvNFEwemhSdys5ckdy?=
 =?utf-8?Q?bl4yb6zPlx/X8rGT3KHjWGExi?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014)(35042699022)(14060799003)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:37.8402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 627cbe38-8cb2-47c7-3d9d-08de25d4f950
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512
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

