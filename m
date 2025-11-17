Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC98C64091
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 13:29:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD2110E093;
	Mon, 17 Nov 2025 12:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="RGVJhbRB";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="RGVJhbRB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020140.outbound.protection.outlook.com [52.101.69.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1A210E386
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 12:29:40 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PTEo+jKLpvHEtxa8xjrzPERJ5vHLx9LHphfjboMUslYFcIX3o4s3adHfBGBH72BfXi6YO0JlsuBE4fEBTWT+g2hrCzPCb8a1T9+kXtxiB+Q+3msUJgX50+2ihbmW6dkEQD1lB/Nye0+YO1Tk/LPkaUJEufWfVZk3CNQrlwrgDEjJBU13MOtLUAKHpI82/r1uZ72vmvIcDUPBaN4lYFVU9yFQW7z9LdZP7lu+EK7uy3DBSG1/4Lf1rqYUwWhq9ap2RCnzgXY5ECzOKXDO6ZJE9cpLFwDqx5cr0M7ko02qFzZf/Ubi9lNjohPS6Y/xaQrgLKIExlBSWHD7blECNUVr3w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=l0Xk35+6wi4VwWVDczZccIRz9WiVJ5oalIKYdZPu8gagUe43nYg29a3e+cYnPqpK/hwsNGADgMy0VwwDad4oIEEmshSkZMxWhNTEXzbJHaKW8at6xofogFBAJOfzTRggInv2AvWy8nk3a7cwMntJn0ziQlUuHoUyY5JOHf8BsOBscWdqfGQYVwTv8GA3QeTSo98LJTctdpuOMarL7MB7Qoi8aUcd3YKERHMwP/YSCkWusSacWYMoPmvUvXXrxafhC23WbRCmVqdZ6McX/BXRMWf/2LThUqiEBZMn2vnWEAKSJ5svZdjUOW4jN4D5eanxiMCNTyIlx1MOaTpUbO+COQ==
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
 b=RGVJhbRBKfz/dCuSDnxIMzv1OExM5XoPgYGN9h4edv7okY3Z/EyupJm7b76/8oDkolUR8veR/XBZzRPKQRA2iHfU1gkrJ9SW9e81b6PAyLjKZyw4RuH9EdRfol7eHks7IIqP1YyVc9xeNXYnFlLXdiUSmICLUHUk/31qeOjIwIM=
Received: from AM0PR04CA0129.eurprd04.prod.outlook.com (2603:10a6:208:55::34)
 by AMBPR04MB11718.eurprd04.prod.outlook.com (2603:10a6:20b:6f4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:36 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:208:55:cafe::5b) by AM0PR04CA0129.outlook.office365.com
 (2603:10a6:208:55::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 12:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Mon, 17 Nov 2025 12:29:36 +0000
Received: from emails-4307743-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-39.eu-west-1.compute.internal [10.20.6.39])
 by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 1D6EA80115; Mon, 17 Nov 2025 12:29:36 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1763382576; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=mTGvsZbcN8qXHqiD5l//w1TkvFR+8mQQuiGXjWiZ1BWBx+q42AmQMAyATgXnjX1oT+2QT
 9CrS9k8JQKeFGRQFD/aMhFVTuMNpPFJXGNo4XEr+gbYPpp4zBnuvQ/cyhk/DrBwZhecKAIs
 rmwlm9HXrD/eUFMBcYZvxNFhJ64Xqks=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1763382576;
 b=SmfoqKbLorAtxASK5VDzeD1J8TiTrxDsHnAmhGVRcHQQfVPK9CYR2q2T2zEDtFtr4pL96
 7JUhiaKXevQFN4OBliRrGI9aRqjuT1jRCt8mzeSVAS7jIgut7woD87U/0CUMJCiKmH5t14r
 164IvjxhrnArQLZeA+FR0Y6AgsmZED8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpX6R2ruYkNgc08F7/vcm8TIgqBtxJnNUF6OAwMt9k0ThgoZqjs8HziMPsifJyqCCxllPTRHg5tPI3ShxrCU9Q1GYI800BJOmcskQ6U+U2UBtq2B6DGAM0z6qZah8FXAG4Mng2K3aZDyjFQ/if46vDSl9m+ffwZ5GDb6xCbfAIYPHAiC8AiBY9Nxzl/DrwR6TIzpq+nMttOvcNIcPbmmBwc3ztKsY0NzVmQdsirvkDIBGtlptUvqyEBhqNLLPZXws15emqgS3Pt+KUehLMWvdVHjYGXSqT7fU0l83vVYLNMnxu9AI28hcSpvBEw9vO9lRh9iUDyd/oHg3BtGufmIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=f+LHi6Otev7kLGCaMxBcrh5H5MHqITy3RezsLMAmLGFHSPPr2Zz4txHoZfcT8QYAI4GGKDHroi0VT06Q6WaIq+EKG6pSGmgo6n8m0dNgDM7InPXHXKB6ESpIf2hVji+BhwITzTJA2+BRCflXpKyg+wbKGytf7BYmC8RkwCx6k96Si3kxG5rvMh6xMXAeKqs0RJ8sdYwebT+bUE3r+55TQ4mW1KT74qd7+jvkE2M4Mv753rN87x0OtxkDZo0Ek/2kYmKXtTAX2xObWAkuWIhkuIyEKlk8bMmHGSxkEoFMBuKv05OcOwJw98O4AN+hS/8vGXi3qf/C8dCirGuKfTH/Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=RGVJhbRBKfz/dCuSDnxIMzv1OExM5XoPgYGN9h4edv7okY3Z/EyupJm7b76/8oDkolUR8veR/XBZzRPKQRA2iHfU1gkrJ9SW9e81b6PAyLjKZyw4RuH9EdRfol7eHks7IIqP1YyVc9xeNXYnFlLXdiUSmICLUHUk/31qeOjIwIM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 12:29:27 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 12:29:26 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 17 Nov 2025 13:28:48 +0100
Subject: [PATCH v3 06/11] arm64: dts: imx8mp-hummingboard-pulse/cubox-m:
 fix vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-imx8mp-hb-iiot-v3-6-bf1a4cf5fa8e@solid-run.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PA1PR04MB11261:EE_|AMS0EPF0000019F:EE_|AMBPR04MB11718:EE_
X-MS-Office365-Filtering-Correlation-Id: dda104c0-70ec-4f63-dc5b-08de25d4f873
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?clUzb285K0xJSXJYVW9talpOUm1VZFNoMHd1L0M4V1JoQ1M2c1lhb0RNQXF0?=
 =?utf-8?B?UjFXU2FkYkFsd2V3MGhsSGZBc1RjdjNCNzI3bkhLUjdKVUM0cGZELzl2cnNi?=
 =?utf-8?B?dlV4djI4aUdrbE1nQk5PbFd1b3QrZnp2NVhrc2RISXVIYTZCb0Y5UXc0dmwz?=
 =?utf-8?B?TnVuZUxUM1Nta0lnY2N6WEZsRnpuWTNCZS95eEtYUTd0aG01djZDR3FiZVVo?=
 =?utf-8?B?SUtidnBLOTFtWDBiNnovSVJpZE9zRFBqSGNmTGpXOWZMNEFBQm1aSTl5UjM0?=
 =?utf-8?B?Ny9Ea3ZZbVNEeCtvLzFGWlU4bWJOd0NlQWx5V3VqZUJWeS94TmNIYVFtVlBj?=
 =?utf-8?B?bnFkTUVGWXpTckZsMWxzS2E0YmZmMzZjVlNBRnc2K1lZSnpZdFJ3WGlZTHVQ?=
 =?utf-8?B?R0E1NmZPVy82Ujg2SDRoaFdWVjBSOUgvbDRoTE90a3NCcVF3Vmp5M0lQbG8x?=
 =?utf-8?B?aUFtbEJXMHNMN0JQbzVESzRzSTJVeUM4WFRaUHRLN2lJMHVwdE8yZHpmWjZq?=
 =?utf-8?B?KzhsdFIyZ3h1NEg3ay9RdS9yazIzZlcvWlFTUURmaU44QXRwcFY2MjNYWWF0?=
 =?utf-8?B?OWNnbnpwTXhYMjJSZmEyR3J2WGVvNDZSNEE2UXA0Q0lIM3ZZZjcrZU1mdWpH?=
 =?utf-8?B?Ri9hTFVoU0dPbDZKb3JkT3JnTWMxV2lsa3FKZkhBQit2emhqMS9NZWNzVTZB?=
 =?utf-8?B?UUtmeSs4SUpBelJNbzc1Q01GK2Z3eE9MYS8xRjQ2b01mdGZWcmtOQzhXWGJw?=
 =?utf-8?B?a1BPV0NtSEZYZVBsMXpYUkJ5L2EwOUFNMHpUWnY0RlAzMDRmc2VGU20wYUNB?=
 =?utf-8?B?Wkw4WldaV3NWSE93SEdlbUJKM0l0WkF1Vy9tV0lzL0x1NlJrbm9ncUZBVGZp?=
 =?utf-8?B?eGNJb0VYWTk5cmR1cXRyVlZQWmlSa1B4enBXUmFRc210cUNVMzJxV2Y5UXJV?=
 =?utf-8?B?QzBCZVZxeTdQbWFjYUIzdGFiR1h3OVZwcWlkdzRaR0VsWUVQSVFmdTJwd2VN?=
 =?utf-8?B?K1p1T09aK0lEelZ1b3F0ajBjWldIQzNmMjVUdHZnTWxSaXJCZEFKUTZxUFhz?=
 =?utf-8?B?Z1BnbnZpenk4OHNhUzFoYlpKTVp1UEVreDd3VmpxeTJoV1VvanVTMzFmbXZX?=
 =?utf-8?B?MjI0OEd5ZUNIMlBQSW1nMmoydW5oY0VoNVlzenNNZDhhUkxRL01lK0hHTGNI?=
 =?utf-8?B?aTdhcE4vZmFONEpsOWIrWElFYTE5TGtrZC9MZUxyTElJVTBpbjNKSG9ETXRr?=
 =?utf-8?B?WWZSWXIrT0tkeldTNWY3eEpiVko5RVpLUCtWeHFGSi9KNjc1NWlQazZvaTk2?=
 =?utf-8?B?RzJTZVloejNOTVpqWDBtcjFYR1k3dm5LWXNOSC85Wm5GVHBlYkFWWld1cmQ0?=
 =?utf-8?B?M1lkdjB2KzJkOTFkVG1kN3Zpa1VxQzMrdi9ldEx6NEo5NkZKYU43L1hDT1ZQ?=
 =?utf-8?B?M3Z2WEdqUDJST0pLTTh0OHZBeHJCdjdaYWNnSlg5K294S1U4Tytla05qK3Bu?=
 =?utf-8?B?SElpVktHWDRLeG8xRTNLT1dqdTVRaCsrT1RYWENmQWhrTDFzbnEyeldvbVdh?=
 =?utf-8?B?ZGs0elI2ZDY5ZW9CSG4wRjkzbVhuVW03UFlET09Wc09DNmJYdlI4ZG1mdDds?=
 =?utf-8?B?cU9rdGEyOUhUc3g1Z0FPNTIzdEMzM1lrN1QrbVROU21jU0cxRXgxeTZZT1hT?=
 =?utf-8?B?SlZkdFZGRGlWalViRGtPRHNvRXltU3BGMlJ0akgrbkgrbEI0cUl4OFlVZXZN?=
 =?utf-8?B?Vk5LSm5VVmZmc2tKam1XN0hGRlRLSXkxeXFLOXhzem83U2R6R2luQ052ck5o?=
 =?utf-8?B?azlPdFB1dzUxZU1FUmY4cjhBTy9LWmpuQk4rck4yK3BTY0dyT3VlU28rWjRK?=
 =?utf-8?B?NXJqdmlKcHF3Zzc2dVJXK1Z0YW5wU0FkL1lscDZ4YUZoZDhjak4yQ2FLekpR?=
 =?utf-8?B?aDBnR1ViTHlRbksrbjNtcE1RN2lONm0zTGNYTGJPWmN3cDl2VUwwQzkwcVpB?=
 =?utf-8?B?OEM0SytPekQ5a1k5L1FzWjhBNWhSTzhVWjN3c3YvbkNJOTNRbkpyMndtRWJH?=
 =?utf-8?B?cGYxMjI0ZFgxSytDT3o4Ui9HSkREMUhjSXJQQT09?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 60cc2e0b43ee4bbaae426e57e8db647a:solidrun,
 office365_emails, sent, inline:e63acf9d0091647e1c4ec6a3b065751e
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: de5904c0-35b8-4ecf-d40e-08de25d4f2a3
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|1800799024|14060799003|82310400026|35042699022|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3djbHVFRkM0dXY3RjBLSGxuZVhFaFRaMVpXaUttT0o1MHZzR3gwVlQ3dW93?=
 =?utf-8?B?aitJeGJvTWUzc3l1b2hHbkJnS0s5SjdTcVBtdXFlRXlZcjNrWFIxYTNUTFJv?=
 =?utf-8?B?Ymh3QXVuZFY3Wkp6Z0NyMEdyY1NENG1ROHBGOWhDWVBvK3M2bDlQcW94YmZX?=
 =?utf-8?B?ZTRrVm1MWWM0QzlFekpNM0NmemFSTGcxSkwwZldZRjNWdENhcklYMjY1RFZk?=
 =?utf-8?B?ZDJyZW1oNWVPRnRpSndEVG00a1BEcGpKZ2RWS3djc2tQbStZMDFIVkFvRGJh?=
 =?utf-8?B?NytqL05NdlRwV1UzdGVvOXlGMzFmQzBkRkNXR3RTd1VzZFA3bDVkb0hzOWhZ?=
 =?utf-8?B?V3c0dVRtNkIxeUY5T1RMY1d2UXRQdGYweXBKUjcxZmJFbmF6UDlLUno4ZHZX?=
 =?utf-8?B?bkpocjMvV0F1VjVaclluNXNHakRsWXZ2RkgvZDBHdmN4a0pxUkhNcENzM2lB?=
 =?utf-8?B?eEtScGtXWEVLaWJOVFRJY1RkbFRLMENFNExXelZHVDFWWm1vT0orMlQ2bDBo?=
 =?utf-8?B?NmlTQUFBN2JFc0xMKzR4ZlBjWEJ6UWF2OVRJbFh0TGRTcmdxcURwbk1Ca0R1?=
 =?utf-8?B?OU9xTDFrM3Q0Ly83MHRtTjRuZE4rV0c5MHBybElsamNDLzZQU2h2V2owK3NG?=
 =?utf-8?B?Wi9NUHpacXhMdkEyUitteUdhNHNxMzF1RXpFSzBRZFlYcloxZ1MrNXcxc080?=
 =?utf-8?B?b2FsOGk4TWxEaWl0SG5kSm5mQ2syMWNKU3ZnaW82dHh5T2hSRWVSOU9yL1kw?=
 =?utf-8?B?Q3BRUmVseXlqNnQ1VU1iY3ZNczZzYnBWcmg3Q1NEbytYbzkwODBFZEFRNFRu?=
 =?utf-8?B?SSs2b0dad3g2QVkzTndKMnM5K3JKM3AyMVJmYU5aTTV0MWJBQ0NGVzB1N08x?=
 =?utf-8?B?RmpzM20vQ2k4Y1UyZzZlSElPT2NRREIrUExSWkl0NFBVZko2VndhQmFkd0t0?=
 =?utf-8?B?c1UzSU5wajY5eTBOWk9UYXZNTm9ZN010blQ3Mnc2MUVWQzQvRTE2NGJrZnlp?=
 =?utf-8?B?YWQxRDl0SWRDeFdmYVYzZE9yc1RxSEpuUDlYT1VnaXFiNS8rOUIxNEowakl6?=
 =?utf-8?B?ampLeXB3d1N0amVZSkNxaWk5a3kzcnYxaFNEdEEzcjZEblVWNGhjTDB0aFRM?=
 =?utf-8?B?YXB6YXRRUVp5WHdHY2NmMHJEZ1lEaXdPY0xlWTNjR3l2cHZMWEFoU1Q3WnlX?=
 =?utf-8?B?M0RjbE9oK1pIQ0VpUHhkbU9Hdy9rNjFZaUFMdmhEOENVbzMzNlFjdEpIZlhJ?=
 =?utf-8?B?MGhoZDhPZ05MQnUxdEdVYnVwL0dqNlEvSmNrT0RicTkvK09BK0RJdmppOE1q?=
 =?utf-8?B?ejY3YUpqN0J0QTJaOHlzVythemZ6MFgxMjR3U2ZpWTdWcmdybDlDdHAvSi9y?=
 =?utf-8?B?ZEJBWjhWcTk0ZjVidzdRdTdtbitXV29xcC9yTjFsN2FlWmFqUHllN3VGQWxk?=
 =?utf-8?B?eCs3TGRUVWxqRzBadERwbmVYRjZQY0N3K2c2bkVBVzJDcXgybXE2VEtiYWha?=
 =?utf-8?B?dTBnWmh3Y3Y4alEza2p6TkkwRjNBRnZ4bTlFUk9lb3JLYko2TnZQSGIrNzdE?=
 =?utf-8?B?VWxIUWdBcU1QK2UvSmNVU2RMR0RweEQ5L2NjdmFZSkkvRWhjUUFseEZNQmla?=
 =?utf-8?B?Z05BbXpXUFJyT01ZS3hKMGoxUUE0Vm9TWUNwQituZ0g3NmdVYUJpdDRBTURm?=
 =?utf-8?B?T3Bseit3STJjYzlaRWpZRGVObHJOeDF5N2prbXp0a0VtMGx3M1NxQVo3cHFq?=
 =?utf-8?B?eXdLZldsejdMTHdjVitOL0IvN2lJcGJxSkl6NEVpQ0h2L3NXLzdNWDFOay9r?=
 =?utf-8?B?dmxPclhCT0JrSVlIM1cxbmt0djVIZnF3ZzQ5WXdVeTJUcVBTbEh0S3hvSjB2?=
 =?utf-8?B?dXAzZHlKTi93Nk45V1RDZlBGOWNvRTBuVVMwNjZvVm12czczLzk3eEpPVHZU?=
 =?utf-8?B?eDU4MmpHRk4vQ0ZXWTM1VmgrODJ5UFNwVE1NeFlTWE1ZSWUwZDVFTEFuekNW?=
 =?utf-8?B?R2Q3S01iQzVQZjVNWE9XYllNdGZiK3U5YlltNHF3NHh5dm16bnhYRFBBZHU3?=
 =?utf-8?B?bG9GcnljRTFqak1GclYvdUwyM2pWcGU5YzdBVjMvcEtrbHliQ01URUNQdXl6?=
 =?utf-8?Q?vNqfKTUmQfn1jzmaf+znTgcic?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 12:29:36.3910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dda104c0-70ec-4f63-dc5b-08de25d4f873
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11718
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

