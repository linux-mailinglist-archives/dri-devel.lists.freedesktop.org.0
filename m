Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1391BC520A2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:43:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991B910E07D;
	Wed, 12 Nov 2025 11:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="o2b7HcWJ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="o2b7HcWJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023111.outbound.protection.outlook.com
 [52.101.83.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF49D10E02F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:43:31 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N0vTZKjgD9f4+kJsIzUy1GhqsLQrK/pwK5uPPGU50AcCRUTHE3XyXOF2neGU4pJzsB0zXNH7rOzEy7TuRiw8uTpOiOgaPfLMqQ6hPs4aMHUYbQgk4RVokv9caQJzGbCPgoUqSr4bu7XEK5PdgnxHwkBeQZ2b3A18QQ8UaD0yr+tV0sbMLekP62jM02IHYMtnB2ZCDfxrshhqVKZjkYnOJpKQkM/exB5S1xzcMPWJuA8E2tM9zTUt1jlnG/CmrU+o/5Y+IegPHwjcojFDl4+uw6CK447hiDigyX4YWq4beaOnT+Rzj5m+Qkq4skljmjsHLh47GJG5+ulvgwqQkbuiWg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot8grM4Nzz3Hzz6JVKI30P2iQnRdrwHlSnAm5Dths28=;
 b=JuUnfSX12FsFMxwRJCDm/1u1NNboHTVvG0VieY7k1ebtiGsxhEHJ11p0dRzCQojM4KaD5DagcUFKe291rQc5dAc0nnFxAzTQ7zdFoZf0vd0N0G9bk4VVnPqKpdCL1sr9mAgtCDbZMrKq3KN/pVVUm6vzmM9HMQ9scyVe8e9dCmX0l4dkr2XTmnx8x9TW2tCVB3JDqtMC7XUJBFVF1l6E3D824LtA4mtzvkDfRLV+ddZqgTeXS1T/zeUXTfYpEpf+X5xin9g1/DvICcV3UH339noRrwEyk3ZVho3VJ2p28+Ty5MKKmMBiE5NwEIDu3ZaY6DkV8Y+DnnoaTsVvRpUMOw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot8grM4Nzz3Hzz6JVKI30P2iQnRdrwHlSnAm5Dths28=;
 b=o2b7HcWJwsuM/ACKxkh5qTAWGhwg2XL/gMyG6Conv7GwCb5k+Z4tJuDCoy5kuPOay01Gqxr8zBNouIahZq/DLSSThCLaHfVCV3xTdgxL5u6M4FGOChEzJYXwmJiQIIZABVJkvrFJn8EQ8e96n3NQzfL3yHXWprwZN9OKs9y2RhM=
Received: from DB7PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:10:36::14)
 by AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 11:43:25 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:36:cafe::44) by DB7PR05CA0001.outlook.office365.com
 (2603:10a6:10:36::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 11:43:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Wed, 12 Nov 2025 11:43:25 +0000
Received: from emails-3800416-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-162.eu-west-1.compute.internal [10.20.6.162])
 by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id DF41A80379; Wed, 12 Nov 2025 11:43:24 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762947804; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=ot8grM4Nzz3Hzz6JVKI30P2iQnRdrwHlSnAm5Dths28=;
 b=e12I3kKU1PRQ34GTo3uZtFy0hWV6lMP5JlxZFLQOXbc+RkS9Lzv0JzWWREwfhOn2xKeHe
 uP/z+9QW4fe6l84FwzgHjcJN1B9nhaCLmLP4W7IB4RAg4LpcZzD2GZIF0qTkyDswnOh2MvM
 iL1xeUWUblhtCh9+1BNdert77rixqLA=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762947804;
 b=RU34t896NonIp9nswONgZMpdVnHT1hHHZc7qXiAnwewE2VycGTGTXLT9F0vO2JA4DGTz4
 KQjoOrDb1+ig8OhaPH4oLYlGf4+CUBWbhtUyk3rGW2fFHFqWVCfORXN5sJj4k2Y7xkv38eE
 NpzSGgxodd9EcqnumI74O1TFZSyqzig=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQmZYRDg/nAyGJSi/SQqnGujs+7KVjkIuP0q0D8tnn7naRLp4pGTrcnpGyMWE9Oh2QdT4YJC9fH1NmLprTe5931wHgFU60LRFu7jMbRNYwlbNHHchnPIYbcke7thi5QC1NrUGzhLTw6kXl/3U+bGGUlyTKrGde8W4lVMJiguiXlXWKL2tlL/lY2izxrKAaUEroA5qo7eWTl6uDh4eOJhHkXdpcaTHcGlNulw6xKuNC21UPuCXpSUJ+cbYwlXWzAZDNRds1OBYOPkY4R4SvnzvzFpW2VNk2YSFpoFOJ3ymMV3zvQphUbYwMxU/3SkW6HCygoey2Dh0HVaGcb7AYtEpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ot8grM4Nzz3Hzz6JVKI30P2iQnRdrwHlSnAm5Dths28=;
 b=rprNZo3XTYFB/IMjCS70kb+jlcjHUU3ZnjXnNmwyOc1KA/Atit4MRjoAAZT/IptaSjXimb9O0qYjNpHKjrGNUfiupIok3befSzg9xykTiWkbWzWieC67VZwqPSse8mBn2qwLSSym5D0jW6bTqDuBkU9gGThlqaMe/JyXT2zFHIWiOKxToJXMVRNHKnUALnWGz8Xujtjs010Tlav+/EPTA0UEUPq2+A16OT+RlJuPzK0dA/biLxqEdtLApIfYCqlfZEznxja4SWkmXbgGqPLj/KyMR1D+TjpAckqg+vibXIrJNXfAOaNmKoYEqpqtQHfRgaBUJzTfU25XqWTGxfkD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ot8grM4Nzz3Hzz6JVKI30P2iQnRdrwHlSnAm5Dths28=;
 b=o2b7HcWJwsuM/ACKxkh5qTAWGhwg2XL/gMyG6Conv7GwCb5k+Z4tJuDCoy5kuPOay01Gqxr8zBNouIahZq/DLSSThCLaHfVCV3xTdgxL5u6M4FGOChEzJYXwmJiQIIZABVJkvrFJn8EQ8e96n3NQzfL3yHXWprwZN9OKs9y2RhM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU4PR04MB10458.eurprd04.prod.outlook.com (2603:10a6:10:565::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 11:43:13 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:43:13 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
 <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Thread-Topic: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Thread-Index: AQHcT9woumHiCA7zIES2iCNkHyfvvbTnXZmAgAeVuwA=
Date: Wed, 12 Nov 2025 11:43:13 +0000
Message-ID: <a52a7602-c7e2-4964-b9ed-3facd9bae95f@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
 <aQ4V+QW8l4X5yEV2@lizhi-Precision-Tower-5810>
In-Reply-To: <aQ4V+QW8l4X5yEV2@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|DU4PR04MB10458:EE_|DU2PEPF00028D0F:EE_|AMBPR04MB11741:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff99cf5-ca2f-44b7-0618-08de21e0b082
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?Q0NsT0tjdVhyVVZpOFZ6UWJYODFDakZHaU9lMFpKc1BjQ0g5bkdhZ2JSUGNp?=
 =?utf-8?B?ekFGc1dmRnNRV2hIT1drVlN6Z29FWlFCWHk1VG00Y0NjMjlaWDF3dTFPaXZz?=
 =?utf-8?B?N0pMaGcybmltMmt2dDM1elFPOWpVa3pCV2dPQ3B6WTZIeHNpdzVNcVhlbjhm?=
 =?utf-8?B?L2JDblJuTmQwVmxPSlIxejk0SUF3aytLOGR0STEzMHVWNFFkbjVra2tuQU5l?=
 =?utf-8?B?SnFvVURwOGFUakdVSi9HK2FlZFB0S28vVFozY3BsbHc4THlLelFFdTdjTmE4?=
 =?utf-8?B?UEVKSGNRTXRZZnp1cWhuZk94MjA5TkpKaHUzcVF5ZnNXV2dNSmxqZWJkUkE4?=
 =?utf-8?B?NGpjRCtUVXBaK2xJNGpzUXR6VmFqRmtKMTVDdDF5ZGpXYTZGL1NiRTNVNVV5?=
 =?utf-8?B?Um1ObEUwM3FFbXZVbENscGhWMmJqNTNlRDF1aWdyY0o5cmFqaDFmYTlVMDht?=
 =?utf-8?B?U3NJVEhwbjRlck9HZDA2U1M1S1dudUVZVUpZeWlDNjQ4N3A0Y3VrRlk0anJC?=
 =?utf-8?B?S2VlNEJlL3lMSzN6OExadlZwa1pDOXVkSEdnZ2J2SkdNckpqUnhEZVhjdjFX?=
 =?utf-8?B?M1ovWUNHcU5Ia2VPeUVDSlJoVkV2TlUwMWUxckZNVWlyeUFPR1FxNmJoTU0r?=
 =?utf-8?B?RXZ2SFB6MUJJM0plRzQ0S1FZUVBsTEZtWEh3S2R2K21vSHlwRjBhd01FNmpp?=
 =?utf-8?B?dUlFcUNxQ2ZWa2MvM1FMa0VCSWpLN3VaVFVtclY4Lzhnc0hSL1ZuQzVrUEpS?=
 =?utf-8?B?Ui9pd3kycWg5TGU4YTZJUzRiWVVpVVh2SVdBNjA2UlBQWExhTDc5WFRFUzdo?=
 =?utf-8?B?ZE93UEpzNjF0RGg3SzVSZXN2RHk5YitlZFFtcFJOMzJHTUNQdUE5SEpNSURO?=
 =?utf-8?B?WTZHNUxzQnhZUWJoWThKTTRISGk3eVFrZ3FsVGlsSXFXdHA0dkNNMFNEdDdu?=
 =?utf-8?B?TzlRK0VFSUpWM2NjVUI0M20xamF2dDFmRVR4Q1RnVi94Z00rQ3JCS0MvSitC?=
 =?utf-8?B?RTdtWVEzdlFKR0IzdHJpcnZEaTdCaHRPTERVK0FvZXBHdWtkSE9wYzNmRlVK?=
 =?utf-8?B?YVZkSHRrbVFuZm9INEczazNHczRGdzAxcC9FcmVWRWFieGoreFpydUxWL1hQ?=
 =?utf-8?B?cStzamttMEFpM3hWczV2T1hwTnduMmhjQXBnZGlZdnlxaEZaL2dXWmVqMjF2?=
 =?utf-8?B?TjByNHhuWW9BbFdLL1FOTWNJMnVSYVFOSDBEd2lVb3V4SHJJdDhXS1M0a0Mr?=
 =?utf-8?B?TUM3MzlPWUhsd0pVOThMUnlFZS9BVFF0N2Njb3VwMnExNFEyN1dvcldRdnRD?=
 =?utf-8?B?SWJ4aHB6dWdLVFF4UVJ1N1htWnFzaE9kRXMzcW1QZVA5aWY5T3BjZjA2L05s?=
 =?utf-8?B?SlNqVUZtcDIzd2ZmWWFzTjJwcTBkRlFQWUFLdjNpTzRaRjZUcDJRcTdUUnJy?=
 =?utf-8?B?ZEZ1a1U2YkJYYVdYOEVZSGMralkxUWFTd3B5eXhiUm9lNDY0dlJhL0tkZm5Z?=
 =?utf-8?B?b0ZlVGt2UXVnaDZoVnIxNnVia2hYbzh4L2IvUGpCN0xRVlJGakEvWFVTVUpt?=
 =?utf-8?B?MnFnYXJpOUZmbDNvaCtidE5yYXpnamROd2ZDVkozUVZObFdodlkrU3pGNFoz?=
 =?utf-8?B?V1c3cm1Rc1JJK0wzMVd3Vmtya2ZEeXBzMTdwWFF5eTBhcmdWaWFPZ3ZIeUxW?=
 =?utf-8?B?V1pidFNOUEdObjBzVHFMV0d0cUFEZUZaRlV3bDdjSUlrdDI5NW94NjFaMFB4?=
 =?utf-8?B?RUJLV094TUlQVU9tT0tvc053ZEJkNjdyN0tMQzYvbE9TOUlWd2I5MUFJRVVI?=
 =?utf-8?B?cnp3dklKSlh3SUtMUU1FM21BSDhDc1VpdmljT1E1QmcvaDROWGttQ2R5aUpN?=
 =?utf-8?B?WS9oSWNyQmRiTFJnRkxRcVg3MG90dE1NVEpSWk5ONHkweDdGd2RkbWs5TkMw?=
 =?utf-8?B?VDA5cm9uRUFmVDhBWTRhZUcvWTFqRXNSSkZLS1J3bzlxVXk2Q3RpY212VXN5?=
 =?utf-8?B?YTJpck9hdzU4QUdrZFZybDhhVk9hcWFOOXJpbGl1TTM2ZXZWL0hDbGpVVnpW?=
 =?utf-8?Q?FWySHw?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <80106FDE7C69154C87B590FA20E4A116@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10458
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a975293aa5e64153809ad93c636b0fbb:solidrun,
 office365_emails, sent, inline:8309a8118d5c0d65e8f014746d6cd002
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5b459a90-b9cc-41c3-286c-08de21e0a95e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|82310400026|36860700013|376014|7416014|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkwyQUNuaFhTOWFQT2psaWs4Z09WUi90V003d1M3Sk1GRGxvUUQ1RjNFS1cw?=
 =?utf-8?B?QS9ydXkwRVZ3c3VwejdPTzlwSDR2a0RGSmpaUEUvZmJlZm5NdHZ5eXBxYWI2?=
 =?utf-8?B?NS9oNlBlU0dkSGhWQ2owN0Y3MzZDYzkvZTROZGZ0YTkvYTczVHgxRFl1Mi9o?=
 =?utf-8?B?alQ4VDFHL1dwREZFL2NOOGxLRDlWR2F6elRGckJ1MkxPNXpNYWVOWWlaem9Q?=
 =?utf-8?B?eXhLQ2hwK0NPR004VVlXcG00Ulp1SkRLSHNWajFxNy9DOThLN0RXcFV0L1k4?=
 =?utf-8?B?Q3RSbjB4ems5ZWpPajQ3Y1Y0Tk9OcXN1YVZvWk5ISURHOThsYStwZFJEUmwx?=
 =?utf-8?B?dThLcjQ1M29hOVkzbWgyMS9tb1RsSERnMkNKREpLOHJneGRCUXRBTWE5RWxk?=
 =?utf-8?B?NjRqU1hRRVJLZFEvVVluWlR1YmdiNEVlSGZLMDhmSXZpS3JrQ0dSOGI2dEdx?=
 =?utf-8?B?bWtXMXRXS0szUmJPSFk3QmN0UmlIaVZQWDU2STVWcnNZbTFuTytUYW5CUHpF?=
 =?utf-8?B?VUgyM2xDQkJtYkw5R3VmVWZHdUVnR0ticmdXNGdUeDJvNURJTWNvbFpHMU1R?=
 =?utf-8?B?WlhpSFRBNEdxV05sb04rZ3J2V3JmMStWb1A3ZVJIZDFiZW5VclFVejhoRk4z?=
 =?utf-8?B?Y1FuQms3UmVtZDBtNUp3YktLaUlyaklUZHFib2F1TnpzRXBuKzVMdGVCYXVi?=
 =?utf-8?B?VVZTTzZWNHJxNjZvRkwzcWdqRmU0QXpNMlVRMnZ0YUNNMkg3T01URmxzL2J2?=
 =?utf-8?B?MHN4QnJYdjhaM2l6WkNTMzdrNFJRRkhvUGZFWFdobmIzcjZldmtIT0JPY3Iz?=
 =?utf-8?B?NENpRXZaQkFTcVAyR0hpSVBLdXNuQlFuTkMyc2tWV1hsZFFtYkxpS3ZMc1pP?=
 =?utf-8?B?bERSb3pOQkFHb1NWMWV5OERMdm05Z2RzN3dDWWtXVEpFc3NLb1liNWFKTERT?=
 =?utf-8?B?S1dheU9KaFFJNVljcFZyanI4NDQ0ODNRZm43VkU4MmxzVm1HbGgwUDlCcmVk?=
 =?utf-8?B?UnpNcFZoMnFuclRWSXQ4cGovVUE5ZFVGMlhEM3IxdUlvRVlTclRSUnBheEZn?=
 =?utf-8?B?V0lSWGplN1ZJRGNsT1ZTVG1WRmpqai9OSGd6eXQzcEFQdTltZkpGcGx3OUZ5?=
 =?utf-8?B?Q2VNSDhtb0xxK0U4bmx3TkhqcHhnWTVHbk5Vd3pDdUtOODZwMHMrKytRNllW?=
 =?utf-8?B?YzExQ2FTSG1WbGpDTzQ0L1ZnU0dyblhxSnkraFdjN2VQbnB2THAzaFdpYzFE?=
 =?utf-8?B?d1liYkMwUk4xY21SU044Nzg5eExOMTlrOStDUlRpaVZIRUtCekl3NS9TTmo3?=
 =?utf-8?B?MEJlTjNFanl3L1F3K2ZxRHV1NHByd0NpdGFrdG5mRlJlT3pVY2lhZkdBU1pI?=
 =?utf-8?B?WHpicEF5R1NaQTVQZitZS0diZTE4MHEydGhyRmU3MUR5RHl4MFRDVFJBRkF6?=
 =?utf-8?B?c29QVGxURExxNUZpeENvRWQ0ZkptUUZKeS9HVnk5S3Y0bEdpWllQakJmcFg3?=
 =?utf-8?B?ZXk5cTBmOVlMajgrbXJOWHNHMXlaMzRDWHZETzQzZGdjTGZxejJ0OUlETUUv?=
 =?utf-8?B?VEViQUpoOGtjNUltbnE5dVpNUWlxdnVGUTJ1b3JMbkZBNTM2TEd6WFN0RnRo?=
 =?utf-8?B?eTFGS3ptbThmQitYUU1kODRYTm45SnNrOEVBRExjaHc4bzNsdFBTVEJtbDdB?=
 =?utf-8?B?ZDdvREFxQ3Y0Wng1Nlp4VW5Vb09rN1JNQU8yclRqS2RXbndMY0haZTdTcXZw?=
 =?utf-8?B?WUFRNkdHZmZkK1NoWklhNEYxUzVrcGF2U3lQRmxKNlBVQWNqdnV5b3NCaXFU?=
 =?utf-8?B?bHg0aGxOMDRoZ01LYk9mY2dxUU1uREZwb3owdlc0MytiblIyR2t1WlNlaVhh?=
 =?utf-8?B?VkN1KzZCK1hhUjNySVlUM3FGS0J5TWJKWTUyNnI0L3ZxY2NlVzBldzJqRU5W?=
 =?utf-8?B?Q2pDZVN0SnhYaVZRZldnMzBoV0lnUklEcy9KQ0txYTdoNTduNlJoUmdMRXhN?=
 =?utf-8?B?TXJ0REFDdG5LcTdLS20vdkFrRFlJVzZnZ0s4QnBGS3lxZ0d0aWRodGhiTnNw?=
 =?utf-8?B?czFNclc0OE02MTlMUnRIOUpXKzdyQ2t0QTI2aXF5YmNVQXlUenE3QkV0UVZo?=
 =?utf-8?Q?0BHk=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(82310400026)(36860700013)(376014)(7416014)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:43:25.0461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff99cf5-ca2f-44b7-0618-08de21e0b082
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11741
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

QW0gMDcuMTEuMjUgdW0gMTY6NTMgc2NocmllYiBGcmFuayBMaToNCj4gT24gRnJpLCBOb3YgMDcs
IDIwMjUgYXQgMTI6NDY6MDlQTSArMDEwMCwgSm9zdWEgTWF5ZXIgd3JvdGU6DQo+PiBBZGQgbWlz
c2luZyByZWYgb24gcGFuZWwtY29tbW9uLnlhbWwgZm9yIHRoaXMgZHNpIHBhbmVsIHNvIHRoYXQg
Y29tbW9uDQo+PiBwcm9wZXJ0aWVzIGNhbiBiZSBzaGFyZWQuDQo+Pg0KPj4gRHJvcCByZXNldC1n
cGlvcyBhbmQgYmFja2xpZ2h0IGFzIHRoZXkgYXJlIGFscmVhZHkgaW4gcGFuZWwtY29tbW9uLg0K
Pj4NCj4+IFN3aXRjaCBmcm9tIGFkZGl0aW9uYWxQcm9wZXJ0aWVzIHRvIHVuZXZhbHVhdGVkUHJv
cGVydGllcyBzbyB0aGF0IGNvbW1vbg0KPj4gcGFuZWwgcHJvcGVydGllcyBhcmUgYXZhaWxhYmxl
IHdpdGhvdXQgcmVwZWF0aW5nIHRoZW0gaW4gdGhpcyBiaW5kaW5nLg0KPj4NCj4+IE5vdGFibHkg
cGFuZWwtY29tbW9uIGRlZmluZXMgdGhlICJwb3J0IiBwcm9wZXJ0eSBmb3IgbGlua2luZyBwYW5l
bHMgdG8gYQ0KPj4gc291cmNlIC0gd2hpY2ggd2FzIG1pc3NpbmcgZnJvbSB0aGlzIHBhbmVsLiBN
YXJrIGl0IGFzIHJlcXVpcmVkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxq
b3N1YUBzb2xpZC1ydW4uY29tPg0KPj4gLS0tDQo+PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9yb25ibyxyYjA3MGQzMC55YW1sICB8IDE0ICsrKysrLS0tLS0tLS0tDQo+
PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcm9uYm8scmIwNzBkMzAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL3JvbmJvLHJiMDcwZDMwLnlhbWwNCj4+IGluZGV4IDA0Zjg2ZTBj
YmFjOTEuLjY5NDAzNzMwMTU4MzMgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb25ibyxyYjA3MGQzMC55YW1sDQo+PiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb25ibyxy
YjA3MGQzMC55YW1sDQo+PiBAQCAtOSw2ICs5LDkgQEAgdGl0bGU6IFJvbmJvIFJCMDcwRDMwIERT
SSBEaXNwbGF5IFBhbmVsDQo+PiAgbWFpbnRhaW5lcnM6DQo+PiAgICAtIE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4NCj4+DQo+PiArYWxsT2Y6DQo+PiArICAtICRyZWY6IHBhbmVs
LWNvbW1vbi55YW1sIw0KPj4gKw0KPiBDYW4geW91IG1vdmUgYWxsb2YgYWZ0ZXIgcmVxdWlyZWQg
aW5jYXNlIGFkZCBpZi1lbHNlIGJyYW5jaCBsYXRlci4NCg0KRG8geW91IG1lYW4gYXQgdGhlIHZl
cnkgZW5kIGp1c3QgYmVmb3JlIHVuZXZhbHVhdGVkUHJvcGVydGllcz8NCg0KSSBoYXZlIG5vIHN0
cm9uZyBvcGluaW9uIHRoZXJlIGJ1dCBtb3N0IHBhbmVsIGJpbmRpbmdzIHJlZmVyZW5jZSBwYW5l
bC1jb21tb24NCmF0IHRoZSB2ZXJ5IGJlZ2lubmluZywgYWZ0ZXIgbWFpbnRhaW5lcnMgb3IgZGVz
Y3JpcHRpb24uDQoNCj4NCj4gRnJhbmsNCj4+ICBwcm9wZXJ0aWVzOg0KPj4gICAgY29tcGF0aWJs
ZToNCj4+ICAgICAgY29uc3Q6IHJvbmJvLHJiMDcwZDMwDQo+PiBAQCAtMjAsMTAgKzIzLDYgQEAg
cHJvcGVydGllczoNCj4+ICAgICAgZGVzY3JpcHRpb246IEdQSU8gdXNlZCBmb3IgdGhlIHBvd2Vy
IHBpbg0KPj4gICAgICBtYXhJdGVtczogMQ0KPj4NCj4+IC0gIHJlc2V0LWdwaW9zOg0KPj4gLSAg
ICBkZXNjcmlwdGlvbjogR1BJTyB1c2VkIGZvciB0aGUgcmVzZXQgcGluDQo+PiAtICAgIG1heEl0
ZW1zOiAxDQo+PiAtDQo+PiAgICBzaGxyLWdwaW9zOg0KPj4gICAgICBkZXNjcmlwdGlvbjogR1BJ
TyB1c2VkIGZvciB0aGUgc2hsciBwaW4gKGhvcml6b250YWwgZmxpcCkNCj4+ICAgICAgbWF4SXRl
bXM6IDENCj4+IEBAIC0zNSwxMCArMzQsNiBAQCBwcm9wZXJ0aWVzOg0KPj4gICAgdmNjLWxjZC1z
dXBwbHk6DQo+PiAgICAgIGRlc2NyaXB0aW9uOiBQb3dlciByZWd1bGF0b3INCj4+DQo+PiAtICBi
YWNrbGlnaHQ6DQo+PiAtICAgIGRlc2NyaXB0aW9uOiBCYWNrbGlnaHQgdXNlZCBieSB0aGUgcGFu
ZWwNCj4+IC0gICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRs
ZQ0KPj4gLQ0KPj4gIHJlcXVpcmVkOg0KPj4gICAgLSBjb21wYXRpYmxlDQo+PiAgICAtIHBvd2Vy
LWdwaW9zDQo+PiBAQCAtNDcsNSArNDIsNiBAQCByZXF1aXJlZDoNCj4+ICAgIC0gc2hsci1ncGlv
cw0KPj4gICAgLSB1cGRuLWdwaW9zDQo+PiAgICAtIHZjYy1sY2Qtc3VwcGx5DQo+PiArICAtIHBv
cnQNCj4+DQo+PiAtYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+PiArdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPj4NCj4+IC0tDQo+PiAyLjUxLjANCj4+
