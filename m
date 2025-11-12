Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934FC52198
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 12:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FF110E6F8;
	Wed, 12 Nov 2025 11:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="MZHXsvE2";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="MZHXsvE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021087.outbound.protection.outlook.com
 [40.107.130.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB2410E6F8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 11:52:08 +0000 (UTC)
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tGksfKbYqSQXCRVb6Smlbj2XbxTbrIusAmIvXqKE7tMb9nT4xd5IIdT3107/wOCxNfFr7ovzxs4yLPaNQsxhXNOmm//HolgaqPQxxn0hbjkXImpzKiqJ83iOZlvh4pR1/SPPqm1iC/q/Rx5hqwP70HEkz8Zbarc3jNG9WyY3ANZ9S038itiGjPyi7bVmcKpwrySY5+8iihGMRMqEljuw58nnhNppCNL2jxBTulgncuxGgKQ42cQtv6Gb0tg3X+MgPYsZWHzyK8+578wjMdq8V0ezBaHPokb/4SKNXCv/3WAbFwRQZfwo3fdu1mRly7Fuk2aIYkahGiZmhnIORc7ANw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J064BjBvkTMs/y89pUKASjcM1wRWmlPLG+qaPEXhhko=;
 b=D7XowE4b+MYVNuEeJ3RcmWPXqsVKwSk3TS1mqWk/Jd9cdtCKuwEz9bofdL2NPNXAmJLGT8ffPzYywz8yKUCoovSonH0IN8Q5FMiwe6u6DMq/ac8zjY3Il8DDpBC4Xc5I9FJQcCl326M+FCJAgjHUUHglrxx3V7I1GyD7gG94VSfZXr6R6K7zQLd9IgG1x/GZ4GNEwFS8yDj7PAdKKRkT26anFcZhMNdGn7u1vktwPhcZO1oqAKLujoawufGzruD684Hjd/2AIgFIDalUn8OxjYi+YIFu7T5c9+xeBT7ibZeqVMyGfKr11pA6u7tOcUKPGFq8EcCN2SZ1nvBp54EHEQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J064BjBvkTMs/y89pUKASjcM1wRWmlPLG+qaPEXhhko=;
 b=MZHXsvE2zJ/8R8f6hnjrUGnmyc88Kzc/JTEjS83rsWz06k9XU+qYTLqOkJPaIe/Eyi+knbT6sdq5LYd9SHG8pBIbiegAutyeFcSR6M4yxz2e7LrpiCrTcSrxriefnf/PMjgmGA2CMSSjtjsNqzvZYzE3Csr5K0BU5ixaHlQYEfw=
Received: from AS4PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::13)
 by AS8PR04MB7767.eurprd04.prod.outlook.com (2603:10a6:20b:288::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 11:52:05 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::96) by AS4PR09CA0011.outlook.office365.com
 (2603:10a6:20b:5e0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 11:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Wed, 12 Nov 2025 11:52:04 +0000
Received: from emails-9036328-12-mt-prod-cp-eu-2.checkpointcloudsec.com
 (ip-10-20-6-162.eu-west-1.compute.internal [10.20.6.162])
 by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with
 ESMTPS id 461F680369; Wed, 12 Nov 2025 11:52:04 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1762948324; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=J064BjBvkTMs/y89pUKASjcM1wRWmlPLG+qaPEXhhko=;
 b=YR62hMP4cdCzdn8v3aj2Qo8F5D3PuH73icxf7ue9MPtUs/Zb21yuwPh6qfNQCLAiAHL6l
 4Ddzqd9fBWFzqsnUChtIBz7WQlFGo4mrrXKSJwYkXtD+O5DW+5+kwacVo3Tak2gexBrWWCO
 q7hSk1Sk/6k6ep7cFIZegzxOL8zywSQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1762948324;
 b=W9ApRUvWeAte8ilu2DKKC5jO1raoFoEUncthXM+Xd1XnQTzpZ3rcxiqpUshfHa8hz+RBf
 zdo4sMIVjudX6g7dzkq42ClMBrtf1unjVvAfKZAOoTyk6xoRgWnDCpl/DRwKUs8G1i3xgpn
 aHBPN0b2OT1O/lKctnCGnwpiqIXmvvE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKIniysAWMVqSD0I+QRVubd18OoTtmGs1HMjJyy/LFFWumzhDCo1Pt6lUAGYu8fw9eDOozvXLadKvLDE7z1bTr4IdlQN1USW8Fg0lGA/Y6a2oopp9KrbfjHg5Rj9T39x2DRXgvZD0bdhN3yP0TovI3gYjpTgrkmRfFE7WJWGNQaPepUi4E7VZ7dXGbZY4V3QPhkLyc9Cwtq4G5tBKfdyL33HfWXWjfX2maz5fmH8re1dVUHcWZDe1/GKjMGZ7S0Z9AhN6A07Q8zbAPRTsWE5oAywro0lV1voYc/zhqN6qOcxWxa+uTbhoerXcREzTUiJvLXieRcRhAn9836Ce2EBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J064BjBvkTMs/y89pUKASjcM1wRWmlPLG+qaPEXhhko=;
 b=R/5/hfZAffkuBpMDLi/mJ2SaoxFr1avMqURGmtVUWHnUr1DUz9S0owOF/lygUFsQ9BY3EnssPYHh71QirY+uO0YVMblnIhkrnrr5YV9sCOiUNTw1bqwLMPydHLuG8z2quD7kHZ9VhB3tjQH6olCQbMhcgrvBYmoTnWhN3SFtwQWlwU4P7MUs6EInMkrxur1iAXEPYqE74nFmHMqhBUmZyLxvbmPea+J9zj5KgSLYWxCV678G7UTcuEBuGkLQaAGGnRonFvDC/6Xv3X1zXpQgzEvQMOAnMzB8Cf0OldXh1GNEi4E+qhvo0wkZKqy7ADuzsSf/Vz8swVZNXYW7Z7riWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J064BjBvkTMs/y89pUKASjcM1wRWmlPLG+qaPEXhhko=;
 b=MZHXsvE2zJ/8R8f6hnjrUGnmyc88Kzc/JTEjS83rsWz06k9XU+qYTLqOkJPaIe/Eyi+knbT6sdq5LYd9SHG8pBIbiegAutyeFcSR6M4yxz2e7LrpiCrTcSrxriefnf/PMjgmGA2CMSSjtjsNqzvZYzE3Csr5K0BU5ixaHlQYEfw=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8768.eurprd04.prod.outlook.com (2603:10a6:102:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 11:51:55 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:51:55 +0000
From: Josua Mayer <josua@solid-run.com>
To: Conor Dooley <conor@kernel.org>
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
Thread-Index: AQHcT9woumHiCA7zIES2iCNkHyfvvbTnfb+AgAd4AwA=
Date: Wed, 12 Nov 2025 11:51:55 +0000
Message-ID: <14492bcb-aa74-4fce-b9e6-3d33b08c682f@solid-run.com>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
 <20251107-cornbread-juggling-2e7e69bcac10@spud>
In-Reply-To: <20251107-cornbread-juggling-2e7e69bcac10@spud>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-traffictypediagnostic: PAXPR04MB8749:EE_|PAXPR04MB8768:EE_|AMS1EPF00000044:EE_|AS8PR04MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff81caa-267f-42bd-732b-08de21e1e629
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700021; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RXBvZTByWHl5aGppOXFaVGEzWThpZ00xdmc5MVVuSHEwSUZJNWtqN2tnVUto?=
 =?utf-8?B?YXFOdHp3N3hIRjJNVzZMeGNqK0V5MU9iNEc2RVJvRWtDREIrRGpZUVl0bHl1?=
 =?utf-8?B?R3g2UzYxVnBaQk1nTmJYVTBoT2QyaTlYNHlqM0lDZlZYVmNKc1Z2RFhPNkFV?=
 =?utf-8?B?QXpSeTdDU0VsN2Z2eGdLc1NSbnV3UmNaK1FIM0drTVgrQlhuV0FTSVZ4SmZU?=
 =?utf-8?B?VHdXL1lkMlp4UWliV0RNU3NDaXZ4UldZcnk3R0g0Yk9pTlhsSXRNcmMvaTVw?=
 =?utf-8?B?U0d6TU9DQzQ3UCtmd1NSek5wcGVGazZOTG9tUVFGZjZROExCM0NsbnpETzlt?=
 =?utf-8?B?Z01xMnY0RVBBQ09zQXJrNGYzV0lPREIxZTNxQmxrUlZ4OWhkb0dhYng3MEdK?=
 =?utf-8?B?c0Y0R0tTbS9iSXR6M3F2VDRqaCt4NkVhTXZMRkZnWDUySjhaUEF0NU1YNUp5?=
 =?utf-8?B?eG1lUDV6RUw4Zy91SnBGZXZHcnNuL0w2azVCMThJUUx0NkZGdy9xc2MwZUpS?=
 =?utf-8?B?TkNaK0N0a1VzMmUxeVJMVXVsclA2NFUzblJodUFIUnVFaEFLQVk4K2FaY2pP?=
 =?utf-8?B?cW9GL1RHdTdSMGNGZHJpTHU4N29IdmtaM3dQUHhsOVdJZExpL3NFUmhYTWZv?=
 =?utf-8?B?OEdISWt5UDA1alVyMTNCQmYvM2d2cVJ1TXUwYzErdEgvaXl0TkJ0cUxMbW13?=
 =?utf-8?B?V3NIQkxGY25lRER5akhGRy8xcS9TajN0cE9ZM25SM2kzQmRGbFpvYkJ1UEEv?=
 =?utf-8?B?djNVeHJKS29YaEtXZ1JqcVh2NTNxSHBoTlRabmlTKy9pOTl6aDZCLzNEd0pj?=
 =?utf-8?B?a3Z1Y21BUXJOSWVnZG1DT3BxWkFxTWlmZjloNC9vM2RrYVcvYTk5RUxBRERn?=
 =?utf-8?B?YnE3VFU2RGtsUmdxOVRRUTd5TjVJWE1QeWVSeHFuUTNNbThHU0YvK1NpT3N2?=
 =?utf-8?B?UGtCdDYvNVRMVWJiaVB4bDN4QUlGNG9BVGxyRnNSTytHYnc4enQ0L0hUdjJG?=
 =?utf-8?B?RXVSNWRabFoyK0tLWkhvUDZ2S1hRdkpFNlpNWWhwTjVZdk1kZGpJTGRCZS8v?=
 =?utf-8?B?QldsZ0xudUZTbTZ6ZXJPaE1ib01RM2xmcTNmRVVHK0greFl1dUlxZDZnNUtL?=
 =?utf-8?B?Mlc2c3VvVzlHbS9mQzljRWw5MUVPTjNMRG9ycUpCSXlYNHhDR05zQXVBdDA4?=
 =?utf-8?B?ajgxcFU0Ymp5YXNnNXFDV2ZjZng3WXdOdmNDRjc2WDVBc0wrOU92Kzd5VzlU?=
 =?utf-8?B?RTU4aDVKZHdjQnRwbjd4R3VidXNIbnRHdGRXem1NaUQ2OEtGRXhPODB3bFhx?=
 =?utf-8?B?M1Y5YVJ4WDZYd1VEdlZiTHlmV1FvTmYvanV3VmFHSGJOaFc0b2RZRVIwQ2lo?=
 =?utf-8?B?L1lLNVRSZmdPUXFaRkR2N1l0V1RycmZTZ2ticHFVZzgwM0Y3aXl0dzlWYTdt?=
 =?utf-8?B?ejk0YVg5OVVDM3c5REJ4WHBSYU1wOFVRZVNkaWM5NE5KcFg5ZmNsOTFMU2Fq?=
 =?utf-8?B?MEhHc2NsT2J6MUw1eU0reVk4RUNuTktoQXhCN0lwOEhPR3RtWTEraW5nTysw?=
 =?utf-8?B?anpkOVNOejFaRUNQdzA3b3htbjJOa2FmdERlS2M3WHdUYWVtQy9vbG5iS3R6?=
 =?utf-8?B?blczZnI5K3lZQmM2WlNFM3hlZXJqU1VSK0VwdXp5VjdBWlR5UllYN09TaFlK?=
 =?utf-8?B?MEJYQnhpendoMnZsVkVnUElwemlmUmgyTHFsbGNyR25ydXo0L0RzVkNibkwy?=
 =?utf-8?B?SDFIUWkzQ0tKVms2QUdvYUhia1RDa1FrYkZrWEVJUHpURUp4OVB5eWN4VUF5?=
 =?utf-8?B?d215L3g3NUtneFEzWi9EUEdyU016dUFwYis4SVlvdmkxcXEvRGtGdXQwNUVX?=
 =?utf-8?B?WjAwOGFTYnA5SmF3dFRBMnpBVFJFb3dYcGwvTTZMcElLdkVKOUhNQnM5cGRa?=
 =?utf-8?B?RHBqWGxzNzA1cmdvRjl6NExjaVVEN29Ca0RaWFEvUU1OYmIwU3NHbG1vRllh?=
 =?utf-8?B?ZkNRd01DdlFCS1ArQnVhRDNnU2JlZDlUSXhZdE9Zc21BYUJQcVFXeExlbmw1?=
 =?utf-8?Q?kRoHrn?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB8749.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1102; 
Content-Type: text/plain; charset="utf-8"
Content-ID: <47D488EA5A52584A9C1D85FBE1C05588@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8768
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a41d39318b5b4f9cb5445fd18bc5191f:solidrun,
 office365_emails, sent, inline:cd7937e249c42ee1f0e84749c09dd35b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12337b28-0205-4354-97d9-08de21e1e090
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|376014|7416014|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eU5ybjgvcTE4dUNUZTFEV2xYcFVKSjVBRUw1cWszTVNlWjE5b08vcWlsdDZZ?=
 =?utf-8?B?VGJqeTdzRW1hMDJaZFN0M0MzWnJYZkhmYjhwQzBlOW9PelJCWnhIY3Q0OHJ6?=
 =?utf-8?B?b0puYnRuL1FkMzQrMDY2VzVFRFkweDVRMXZlZ1Q5Y2ZLLzZSSVlTbkRrbHF0?=
 =?utf-8?B?eE9jUzFWVExxYm9CemlCTXo0OG5URmMva2M2d045bWw5U2NtcEMwOGRHSXZ1?=
 =?utf-8?B?cEpMZnUvZFBtSDMvRHNScEJ3dnZsVlVZZzhQK1kyS3NaWStjanpiMGg5MHUv?=
 =?utf-8?B?OHhVdWRwMWoyR3Y0MWUrNDdjNVNnRjB2QmFBY0xWdVl0Q0dudXN3Sk52RVZT?=
 =?utf-8?B?aGppd1BXV05oYSs0aEVjMDNaS1p4SVoxQkFkN2JuZDdCbTFRVUpZdGlDTUNZ?=
 =?utf-8?B?cmhVWEZOYXlDdWpKd3JUWWp1T2pTcDE0TXg0clR5RFlsMDA0bjQyWkpEUTBI?=
 =?utf-8?B?eGFEME9BZGpMdjhpVHpJRyt6NW90V25NQmwxNWxVZ0kxZzBVVzR0Y1lFV3Bh?=
 =?utf-8?B?SFhuUVpyUFZpc0lQbVJjWFB1S0U1NkdPYUZrT1g3Tm9ZWGJPOXl3UFQ1aVND?=
 =?utf-8?B?WmZNNjAweHRmdWt1MUYvTVZPZDNDcmwxVDM3WERibE9Vc1B6T0d6N05uZ3pj?=
 =?utf-8?B?ZWFXU0Jod1hJR0lXZ2lCZUUzZmkzblc2OENGbHIzaXY1YUpqSGxOZjRuTXJL?=
 =?utf-8?B?eUFCcHFobklJNFByMGVlNXE1bVNSSGxiTzQyZXB3UnlRMUZBVXlMRmd6V1U0?=
 =?utf-8?B?dmpxOThWNFdsaDFXUUpEVnQxRGZlNFRKNFVtejB4aFdkQW1ia1BYc3lOK1ly?=
 =?utf-8?B?T25hcjBDNHlHTit2SytyT2tlZ3dQaXVwdkR3L3VvTGhIeDJveTdFZXZINGJm?=
 =?utf-8?B?RHg1VUZ1QkozeHQzOVNMME9oS2VMdmx2R1N1TGdPVHJpSkVsY1d1ZjQ4U1ht?=
 =?utf-8?B?TFZqbng4cDNTTjNKd0wyN09qNFRjcjJnMEVCbk1mSjdJZlpNMEw4V25IYjRw?=
 =?utf-8?B?dmlCRDNZcmlDQXVnOVhQaVM3WlFWZWNlQ0tpUHVtbmtiKzVmT0lmOStlVklr?=
 =?utf-8?B?cXA4bSt3MVcvZG1qRTdlMk9BS3FnTmNibTRIbUx1RjdnYlVreG9nSkRuVjRa?=
 =?utf-8?B?YTRlRXhxWFMyMUl4aVh6aVkvT1paRWlqeFNBc2RiUGN4QUMwYmJrUFgyZmtQ?=
 =?utf-8?B?OUhNTUtjZ3U4cEs0UzZRdlJZOTBzdndoenFiNWJ6ZlA3MlhkMjExWEJxd3JH?=
 =?utf-8?B?cEJHZTNFNXdMUWFzSE1yR2kxQ0daQWkvUDlSck0zY3V0bzZDTHRueEdtRVNz?=
 =?utf-8?B?SktxV0I3NFQ5NDIrclcyNGVVYzFqT1ZMZ2RiZWR1bERJRUdpRTVQdjFGcFll?=
 =?utf-8?B?cXNzZ0l4WU9xaEdwcTlOS3FLMkFTZkRBME1OeUMvMTNPbVkzVDBHMU5IMmhB?=
 =?utf-8?B?M09VaklJNzJvRnhsd0Q1UW94VEJjSUZydVZ4bG9waHBqYjlaLzNZWmMxdE9G?=
 =?utf-8?B?OURPaHZoS2VjaVJOTzM0eGNmV25wTlphbXRSUE5UZWFzSnFrMHdscm1OYnRZ?=
 =?utf-8?B?VDVaTXBzaUNsNGxDZlJqUktPQU82KzJLRTIvdTJYNjFNLzVqOXlEUVdjZVpL?=
 =?utf-8?B?dUVjZnFkeFU0WFcyTGdvaStaK21QRXpZRm02MmdGU3Bob0h5VHJsc1RteC9J?=
 =?utf-8?B?M0hPYmJYKysvQTBoUndYcGZMS0IwWjQvWU9mUEkwaDkwMVowU3N3aWt3Z3RZ?=
 =?utf-8?B?bmZoOXVJa29yRkp1UnBobzI1bEx2STlCRjkzbGh0Z1hXaFErWlRPZ1VHbERR?=
 =?utf-8?B?RWUza3FQMDFlN1UrdHg2czJRWGpOQTYzOWFMeFlQVmVBd2I4Z2dyY1dmTEc0?=
 =?utf-8?B?MGxPOUNiQ2duTENwVmhicUU4Mkc2czRVSHNab3poVkNyUU9uUDBOck01RnVB?=
 =?utf-8?B?OHMrYWpHL1U1bHhHTERsMG1oanNuaithdnQwMk5Da0d3ODd6VS9ZeUVOaXFa?=
 =?utf-8?B?dDgvK01GejNTUXZ3TTZLcEwzRWdWbWZ5dFRKeUloRENldUFDelNsdDNTQ0V5?=
 =?utf-8?B?ZXpYVXdUS2JoSlpXSG9uT1lIRUI0WkhqVk9tQVhvZVJXUnBvZEY5bDFxRFlj?=
 =?utf-8?Q?GkkQ=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:eu-dlp.cloud-sec-av.com; PTR:eu-dlp.cloud-sec-av.com;
 CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(376014)(7416014)(1800799024)(36860700013)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:52:04.5135 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff81caa-267f-42bd-732b-08de21e1e629
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82; Ip=[52.17.62.50];
 Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7767
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

SGkgQ29ub3IsDQoNCkFtIDA3LjExLjI1IHVtIDE4OjQ4IHNjaHJpZWIgQ29ub3IgRG9vbGV5Og0K
PiBPbiBGcmksIE5vdiAwNywgMjAyNSBhdCAxMjo0NjowOVBNICswMTAwLCBKb3N1YSBNYXllciB3
cm90ZToNCj4+IEFkZCBtaXNzaW5nIHJlZiBvbiBwYW5lbC1jb21tb24ueWFtbCBmb3IgdGhpcyBk
c2kgcGFuZWwgc28gdGhhdCBjb21tb24NCj4+IHByb3BlcnRpZXMgY2FuIGJlIHNoYXJlZC4NCj4+
DQo+PiBEcm9wIHJlc2V0LWdwaW9zIGFuZCBiYWNrbGlnaHQgYXMgdGhleSBhcmUgYWxyZWFkeSBp
biBwYW5lbC1jb21tb24uDQo+Pg0KPj4gU3dpdGNoIGZyb20gYWRkaXRpb25hbFByb3BlcnRpZXMg
dG8gdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzIHNvIHRoYXQgY29tbW9uDQo+PiBwYW5lbCBwcm9wZXJ0
aWVzIGFyZSBhdmFpbGFibGUgd2l0aG91dCByZXBlYXRpbmcgdGhlbSBpbiB0aGlzIGJpbmRpbmcu
DQo+Pg0KPj4gTm90YWJseSBwYW5lbC1jb21tb24gZGVmaW5lcyB0aGUgInBvcnQiIHByb3BlcnR5
IGZvciBsaW5raW5nIHBhbmVscyB0byBhDQo+PiBzb3VyY2UgLSB3aGljaCB3YXMgbWlzc2luZyBm
cm9tIHRoaXMgcGFuZWwuIE1hcmsgaXQgYXMgcmVxdWlyZWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IEFja2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KSXMgeW91ciBhY2sgY29tcGF0aWJs
ZSB3aXRoIEZyYW5rIExpIHJlcXVlc3RpbmcgdG8gbW92ZSB0aGUNCnJlZiBvbiBwYW5lbC1jb21t
b24gZnVydGhlciB0b3dhcmRzIHRoZSBlbmQgb2YgdGhlIGZpbGU/DQo+IHB3LWJvdDogbm90LWFw
cGxpY2FibGU=
