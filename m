Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F8D9E8B4A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 07:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BCBD10E027;
	Mon,  9 Dec 2024 06:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="JqihH8AD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11023106.outbound.protection.outlook.com
 [40.107.201.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5BC10E027
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 06:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETiyIgZqUihvNzzA2ZhIYjltmRmu7fj1FM4jSPBlSEdXgO1nt1kUIzo07wNsrPymv1PNm7mOk995pUNi2WkGdJJznUBluxmQoIrpDy9iobEFp1J7fMSa6nYukRQy1DPV2z5n/VfHGb333QgdkPvzXlp/IVBED7ZbNAPyrbrG1hshbv18R5GuArRXIrYd4mGzCyjDciatWWLKAGZz8SemgGOJtrubr0ygYzu+atvrcvHy9GGIMj2dIUEsXIfsQf9TZP+Va16iugDFL+onF5QSNhZNF4Hu40RxQpD815ysD9msgC3TQHLspNx6Px1uHt26GUi7VsEdY3ZNjI+mLkzovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bRjX6cNTQHKwybC271xhfqesAcjp4gqseWZUGvrSDOg=;
 b=qXljoqiOip5835Cm8dT4hSmxyTlwU+0lapUUXvoNagEIpOE6AokxeIErmWvvciDgn6BMp8niv4cxRYt2WqjF2BUKJi+s0c1OXs1MVgQP/WpapV+0nPdR5exUvjn+FPq1OBY0VchfuFtUA5jsxa0uq5bSD3t/ocheNF7Ov2bY1PCJUxPPSF/9RZT0+1mW1uRJeHBgXETYHZ9mIyz/IpQvaOkfC7mGFaA2lKBG1muMNYSLRsGW5UQBaGGAkGaduNwJHPGok/sXR/fEekOuF4JjLFIszEk+kjBYwFTLpvVB6auKDDYGrHqCwjVKYI7MJjshOB5EcnfCkpFeRY1PZwEliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bRjX6cNTQHKwybC271xhfqesAcjp4gqseWZUGvrSDOg=;
 b=JqihH8ADVK6SuHRNvhwi+T0K7IDrBElU1NsvZPhQM1jy3bAjWB3GKs3HmoM6oo7sWq7ew29UfujFNB9fkVaPj1Bpzk7o/q+JEdvz8nt78I5bJ827q4WZgPlrXj9oaanhJvWBam1kOecYNcUg4pX5z2QBHw372cZv+k1Mo+cYMJc=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SA1PR04MB8920.namprd04.prod.outlook.com (2603:10b6:806:38e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 06:01:15 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%7]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 06:01:15 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, "treapking@google.com"
 <treapking@google.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge:anx7625: Update HDCP status at atomic_disable()
Thread-Topic: [PATCH] drm/bridge:anx7625: Update HDCP status at
 atomic_disable()
Thread-Index: AQHbQHjXEYKnwRZTx0i/WXbZzwEQpLLPik2AgA30DeA=
Date: Mon, 9 Dec 2024 06:01:15 +0000
Message-ID: <BY5PR04MB67392F7F98942AFA3A570CCEC73C2@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20241127030221.1586352-1-xji@analogixsemi.com>
 <rsorgspggl325hx3atrvn3jqhbhy3sg5tvd4ckufrw7hsphrpv@6z63jtk5co4v>
In-Reply-To: <rsorgspggl325hx3atrvn3jqhbhy3sg5tvd4ckufrw7hsphrpv@6z63jtk5co4v>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|SA1PR04MB8920:EE_
x-ms-office365-filtering-correlation-id: 9eed8b32-95da-479e-6fa8-08dd1816e418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?RVUyMVoxWjZQMitFcS9zMWRVRlRlTmN4dnhSTENKb2VQNzI2cyt6eGFwMlMr?=
 =?utf-8?B?UkJOMVFSRUQvbFcxTnFWWkVYQytXVi9TNjQ1bFZBSVhzVEZlZ3BnakQ3Qjcz?=
 =?utf-8?B?c01HY05uRG5FV3FvaUNxK0hjRHRFcFRTMERIZ1dXVkZEUzZrMmNUb3lzZUZi?=
 =?utf-8?B?WVZnSUR3eFJJL0Z5QW4wWTBqVTNzZ216OXBFWDBKZ0RTd2s0V0RnTjJIdStS?=
 =?utf-8?B?UEtEa1dzR3FMZVBobEV6Z1Z1anVqclJKNjBROVRkZUxFWkZZMDFVVDRndUlT?=
 =?utf-8?B?dHFoZ1U4T0pCZ21vMmtSWjFGU3F5K1RpZTYzbldVN1JyZnRIek5jVXExUVZh?=
 =?utf-8?B?SWdlU280WW81Wmt6b0l6YlR6M1NSNFFBTnpmRHhTamoyTXljUEFUZlcwNFM0?=
 =?utf-8?B?NVRKaWczMXY5ZHRtOTNIM20rRkJHeUhRam50bmtqNjI2SlZPb1FJTGxjSWJs?=
 =?utf-8?B?S08zQ0lUQjd5Ri9hV0dvbGVzL2JOdjVsd0swTFV0R0dVSTBrQnZ4Y0p0Rnlo?=
 =?utf-8?B?TjE2VXlJNStsQ2FKL25iYWg1dDN5cXkzaEVkNnk4NzVFSy90Y2xFMmxzQkV6?=
 =?utf-8?B?TzNuMGJ6a09rMDdSVnlQMU9WNGYzSENHT2pQVWpRK3BQL2tEZmpVM2hoZHJK?=
 =?utf-8?B?dGpPT1hpQS9jd0VVZ00wZ0JZSlZ0UEJzL1pOeVY5ZWlXdzNXelFIV2U4YTNL?=
 =?utf-8?B?Q1Viby84Vjd5ejVPZ1NUWHdFT1I2VUI2YVgwenYyTkYzN25tcXZ0cm5hTXdu?=
 =?utf-8?B?cnc3WGZaRXNuTmRmZ2xVRDQxeVpWWmhVVkdQVjZ6WE1jNVkzeFR0Z3lKQUgz?=
 =?utf-8?B?VFlWWTJuS2VxUEs0eExGOWlKMDdDckhrYUExeUltdGh3eDlSOGRLbjg0MFJr?=
 =?utf-8?B?UUdNbkZtTjdLdlRrMXNhZzNsSy9MRWkydHhRdldIUGR0S3ZGKzVOVndhUXVJ?=
 =?utf-8?B?TGpNL285R0I0a3VBbzBsL2xwejRLSlJIZFFhdlplbGFteEc2NVVXRkJFL1cw?=
 =?utf-8?B?Z0VRTk1aYi83emxkNnhna2EvWWpzc1JGRVgyMjZveVlZQmJKOUk2SlREcnVO?=
 =?utf-8?B?VmZleWlxTEJXaTZZYVFvMG96eWorbWJiRnBuRzZnNkp0NHRBYUxOYytsWW5G?=
 =?utf-8?B?Vk1MRXRiMVdaYlk0Zk9jQjM0K2JVMGRTQy9XWjVsVmVFQmY1RHhPdUt0QzdW?=
 =?utf-8?B?aTFGL0x2eGhJWG1wNUtwV3FxOHRPT2RsaHg0M3JKSktBM3loTHlZVXhheERw?=
 =?utf-8?B?U1NueFovc2xvOUtZNHJNcXRxOE0yUUhwNWJOR2xWSlJnSWdlajFwNStwSkdN?=
 =?utf-8?B?WG1RaHB5OXNHdXU4cURibzIrdE9vT1FJbkp4WEJRVlk2L1Vqc2tHZWxHREtM?=
 =?utf-8?B?dWFDOEFoUm9ncjUrT0hwYUJrZHQzRVd1aFVMTUtJWFhxTlNhZnd4MUtuakgz?=
 =?utf-8?B?a2RpbUZoaHlPWEwvc2ZWLzdVazcwUnZJVklPRWFJRG9qS3lZT1pvc0pHNUI2?=
 =?utf-8?B?YVVjcVJDYzBrcnZDTGhVeVZmc2dGR0dYam9JRDdleEJiWFcwWkthdWszUWFP?=
 =?utf-8?B?ZnN2NU9KM01lTzBpbytEQW1yTXlUd0tMTWdGY0c4NnJaZFZ4U0NJQjNRSTIw?=
 =?utf-8?B?b210cHA0UHpSZElqbU9nMS9nLzJaNnJmaTgvWXN0THRYZXpQbklZKzk2Qjdp?=
 =?utf-8?B?N1lWcXN6WkRhK3lHK2lsTng4ZWtMM1FUVENMUDZsbjArN0xUL0RwajNQdzd6?=
 =?utf-8?B?SzB4YlVMbGtMdnA1Tnl0SEJCM1dNdU1udU5LRG9LOTh0Z1FrdUtWbm4xWmRk?=
 =?utf-8?B?QnRwb2ExcWlxcy80MG92KzVBUjRtWkgwS3lnV3kvS1hqY2phRkdvRkVFSUVW?=
 =?utf-8?B?SjQwVDVSdGJkdzNtaGNQRVFuN1JMQ0dHSFNVdDJEREppYlE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ME1uL1ZmaFV5bHhRaGMxb003VWhtalBBdjI4d2xZZEdUeFhJV3hrOG9JOTVh?=
 =?utf-8?B?WGRsWkJrdVl3N0pkZXl0OGlUZFpOUzNGL1V5eTZ0Zmh2MkxyT3FHOE5sYytt?=
 =?utf-8?B?OGtaQlNwZmhOMll5VkZockpGN3hvZ3k4TWdUaS9GTjNERk9rdVQveGRtWnFE?=
 =?utf-8?B?TVhaRkFYUFViODJTRnFqZW95OEtmQk4wb0ZqZGNBbGJwRjdJNS9NaitDV1c0?=
 =?utf-8?B?NkZkOVR0cHMxSHNzdVNWSWFYSitKVDRhUWtJOUwxZ2Jha1ZFN29BU1Y2V0dp?=
 =?utf-8?B?bEI4Y0tJeHp1UzhZTDNRSXl1a2Y3UWFYUlR0S2pNVWRJczBWVDI0VXVBb0o3?=
 =?utf-8?B?M1piM1FoNmdCS2NISStJdWpZRFhEVjdiT3U3eUUwYmRydEc0MjFIRW1pcWJ4?=
 =?utf-8?B?Q1ROT1pTQVE1YzlDTUZ5dnB4R1hBcTRobjlCUXl5aXhENllKYkUyWjk0ajM2?=
 =?utf-8?B?eDI2UThNVWdGdVltcFB2QnBsclEwL0hVTU5CVHNRYWNxRndYWm1CanhQTDF1?=
 =?utf-8?B?RWlqcDVtRlFOMVBpK0F3am9KSVZxazM3RWh6R2xyT3hPcXhuTndOY29KV2dm?=
 =?utf-8?B?Ynprc0Fqb044R01jZWw3d0xWbnAvQ1RqOWdHaTNNaWdOR0dMTjMvVUExL01m?=
 =?utf-8?B?ZG5YTDkxNk4rYzJoUDZqbzRWNTFZZ3BSTGg1N0RWQ3lnYVNDTnlpOG4vbkNR?=
 =?utf-8?B?VVU3UXc3ZTRzQUVQVk9nL2FRNTIxTlVGNkNRckNMS1V0QkhHSUVWR2dveXND?=
 =?utf-8?B?ZHZJVDE0T0xhZitNeE45RTVzZ3Z2ajdaaUVDT3hnWVJ5cHZ6a0h4MGtKdXZC?=
 =?utf-8?B?UTAreDBoODZyaU9VWjUzNUJrYnljeThDTG84dzNwdGt1OTJnWEFhYi9LRmtq?=
 =?utf-8?B?RURZcDZjVTNFZklJTmtIM2JiRytqSnAvZlZzSUVqUjRIQmJXbUN6MGdMV1Bu?=
 =?utf-8?B?MjRQbUZrbTYveHJOUTQwL3JtQ1pGdVJYRytUYzBjZVdlUWxtc2o5UE4yT0RZ?=
 =?utf-8?B?MGpBZ1pCRWJ1SmhkcTJOQWV2c1haNWN2Y3QzZW1WUkg3S2xqbExVWVJJazYy?=
 =?utf-8?B?S0N4YlhPMmhSTzR0RzJQOXdMWXJ5UWNBczVhQ1FGelZ1anRmcGN0TmJtSDZN?=
 =?utf-8?B?bjFmaWlWaVZrTmI0R2o4ZkNLSlRCNlVOYkF1NENweWxZYm9mQldJZFVSYytU?=
 =?utf-8?B?TlcxbWtVdlY1NHNkcVN4QWpSMnYzMjNyU0gzZUdrdCtqTFBuR2UwdnFGdVJO?=
 =?utf-8?B?ZW5CaTRJZXd2aFVlWFhjRmpqZFlvL2FOTjZNZEtwd056emcwYlRkMVk3SSta?=
 =?utf-8?B?V1JCcGJleUFHMHFjMnA5dlVsUXpWa2RnWFMwOEtxQUJybmJzU0dSM2pwSG1X?=
 =?utf-8?B?REFBWVlXMFAvZzV4M2dya1gycUdyS3gzVG1RQ0J4VzRQYXhoZXQxc1ptYW11?=
 =?utf-8?B?eXE4OTh3SDBnL3d5dTlvLytNbzYvQnJvNlJTSHVaS1VETFVsZDBpUUFTNHpL?=
 =?utf-8?B?Vno5Q0tEK3c4MmlCZm8rK1YwcUlPVFdWTEVBUXYvblNtNVhzOCsrQ3RsOVJV?=
 =?utf-8?B?YnVQMGdWazdPMmJnUkZNdWd4TFE0cWh5R0ZCd0pDZzZFOXF6WTNpbUFVNG1w?=
 =?utf-8?B?QjhHbU10K29qNnA2U1BqQWJDYU5lQ0ZMK2xBVllUVWdCQzFMbWs4MElxajRn?=
 =?utf-8?B?aTR4OWRFRXNjRmtHcUhkc3o1QVpxVXhuTUVUVE4zWU5Zc2llVzE4VVdESSto?=
 =?utf-8?B?WXNPN25FOWZvdlFJYTZ3Z3FkUVpMcE12a1JvcVN0VEpjRk9PY1VuODVPKzI2?=
 =?utf-8?B?endNVkFVOU5qNmkyMGJ0c3dwQlM0OWNHMDdjSjYrRDdpWWpZRWtkQkFVS3BL?=
 =?utf-8?B?MThXK0djV2JkZER0andKY2M2ck41K1JrT2N5NUVrOGpXNmxOZWRMckdEZXJo?=
 =?utf-8?B?SC8vRUdwcmR3MjNGL2QwRjlyaWRDVVp6OTlXTm13NzlWU0lyajd1NzRSejVR?=
 =?utf-8?B?NXNIT2lYcnRNNnlMWGN2Ly84RnNGMUhWS0w5NWg1d2VHNk1LQksrYTJyZnlu?=
 =?utf-8?B?cmdSaUpVRitvd0svT2ZlMVBVUjdESGRBQWVqOHFPUldZMjN2SGF0N3VrYlZ0?=
 =?utf-8?Q?OodD/2ay9y445tF2/1RERaeKU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eed8b32-95da-479e-6fa8-08dd1816e418
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 06:01:15.1240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1u6S6NQUeqdDXy83hZLBGiM5xdaCNL4AWNKn1/V/2CkDOzfYFXd9OXr59aGqcokAObArXThXQeqoeT5UJ2iTwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB8920
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgTm92ZW1i
ZXIgMzAsIDIwMjQgNDo1NiBQTQ0KPiBUbzogWGluIEppIDx4amlAYW5hbG9naXhzZW1pLmNvbT4N
Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsgTmVpbCBBcm1z
dHJvbmcNCj4gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBSb2JlcnQgRm9zcyA8cmZvc3NA
a2VybmVsLm9yZz47IExhdXJlbnQgUGluY2hhcnQNCj4gPExhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT47IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT47DQo+IEplcm5laiBT
a3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFy
ZEBrZXJuZWwub3JnPjsNCj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
OyBEYXZpZCBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2lt
b25hQGZmd2xsLmNoPjsgQmVybmllIExpYW5nDQo+IDxibGlhbmdAYW5hbG9naXhzZW1pLmNvbT47
IFFpbGluIFdlbiA8cXdlbkBhbmFsb2dpeHNlbWkuY29tPjsNCj4gdHJlYXBraW5nQGdvb2dsZS5j
b207IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdl
ci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9icmlkZ2U6YW54NzYyNTog
VXBkYXRlIEhEQ1Agc3RhdHVzIGF0DQo+IGF0b21pY19kaXNhYmxlKCkNCj4gDQo+IENBVVRJT046
IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4g
UGxlYXNlIGRvIG5vdA0KPiBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3UgcmVjb2duaXplIHRoZSBzZW5kZXIsIGFuZCBrbm93IHRoZQ0KPiBjb250ZW50IGlzIHNhZmUu
DQo+IA0KPiANCj4gT24gV2VkLCBOb3YgMjcsIDIwMjQgYXQgMTE6MDI6MjBBTSArMDgwMCwgWGlu
IEppIHdyb3RlOg0KPiA+IFVwZGF0ZSBIRENQIGNvbnRlbnRfcHJvdGVjdGlvbiB0bw0KPiA+IERS
TV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9VTkRFU0lSRUQNCj4gPiBpbiBicmlkZ2UgLmF0b21p
Y19kaXNhYmxlKCkuDQo+IA0KPiBQTGVhc2UgZGVzY3JpYmUgd2h5LCBub3Qgd2hhdC4NCkhpIERt
aXRyeSBCYXJ5c2hrb3YsIE9LLCBJJ2xsIGFkZCBtb3JlIGRlc2NyaWJlLCB0aGFua3MhDQoNCj4g
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW4gSmkgPHhqaUBhbmFsb2dpeHNlbWkuY29tPg0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FueDc2MjUuYyB8
IDI1DQo+ID4gKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIw
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbng3NjI1LmMNCj4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYW5hbG9naXgvYW54NzYyNS5jDQo+ID4gaW5kZXggYTI2NzViMTIxZmU0Li5h
NzVmNTE5ZGRjYjggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC9hbng3NjI1LmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
L2FueDc2MjUuYw0KPiA+IEBAIC04NjEsNiArODYxLDIyIEBAIHN0YXRpYyBpbnQgYW54NzYyNV9o
ZGNwX2Rpc2FibGUoc3RydWN0IGFueDc2MjVfZGF0YQ0KPiAqY3R4KQ0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBUWF9IRENQX0NUUkwwLCB+SEFSRF9BVVRIX0VOICYgMHhGRik7
DQo+ID4gfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIGFueDc2MjVfaGRjcF9kaXNhYmxlX2FuZF91
cGRhdGVfY3Aoc3RydWN0IGFueDc2MjVfZGF0YQ0KPiA+ICsqY3R4KSB7DQo+ID4gKyAgICAgc3Ry
dWN0IGRldmljZSAqZGV2ID0gY3R4LT5kZXY7DQo+ID4gKw0KPiA+ICsgICAgIGlmICghY3R4LT5j
b25uZWN0b3IpDQo+ID4gKyAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAgIGFu
eDc2MjVfaGRjcF9kaXNhYmxlKGN0eCk7DQo+ID4gKw0KPiA+ICsgICAgIGN0eC0+aGRjcF9jcCA9
IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9VTkRFU0lSRUQ7DQo+ID4gKyAgICAgZHJtX2hk
Y3BfdXBkYXRlX2NvbnRlbnRfcHJvdGVjdGlvbihjdHgtPmNvbm5lY3RvciwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN0eC0+aGRjcF9jcCk7DQo+ID4gKw0K
PiA+ICsgICAgIGRldl9kYmcoZGV2LCAidXBkYXRlIENQIHRvIFVOREVTSVJFXG4iKTsgfQ0KPiA+
ICsNCj4gPiAgc3RhdGljIGludCBhbng3NjI1X2hkY3BfZW5hYmxlKHN0cnVjdCBhbng3NjI1X2Rh
dGEgKmN0eCkgIHsNCj4gPiAgICAgICB1OCBiY2FwOw0KPiA+IEBAIC0yMTY1LDExICsyMTgxLDgg
QEAgc3RhdGljIGludCBhbng3NjI1X2Nvbm5lY3Rvcl9hdG9taWNfY2hlY2soc3RydWN0DQo+IGFu
eDc2MjVfZGF0YSAqY3R4LA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwg
ImN1cnJlbnQgQ1AgaXMgbm90IEVOQUJMRURcbiIpOw0KPiA+ICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPiAgICAgICAgICAgICAgIH0NCj4gPiAtICAgICAgICAgICAg
IGFueDc2MjVfaGRjcF9kaXNhYmxlKGN0eCk7DQo+ID4gLSAgICAgICAgICAgICBjdHgtPmhkY3Bf
Y3AgPSBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fVU5ERVNJUkVEOw0KPiA+IC0gICAgICAg
ICAgICAgZHJtX2hkY3BfdXBkYXRlX2NvbnRlbnRfcHJvdGVjdGlvbihjdHgtPmNvbm5lY3RvciwN
Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY3R4
LT5oZGNwX2NwKTsNCj4gPiAtICAgICAgICAgICAgIGRldl9kYmcoZGV2LCAidXBkYXRlIENQIHRv
IFVOREVTSVJFXG4iKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICBhbng3NjI1X2hkY3BfZGlz
YWJsZV9hbmRfdXBkYXRlX2NwKGN0eCk7DQo+ID4gICAgICAgfQ0KPiA+DQo+ID4gICAgICAgaWYg
KGNwID09IERSTV9NT0RFX0NPTlRFTlRfUFJPVEVDVElPTl9FTkFCTEVEKSB7IEBAIC0yNDQ5LDYN
Cj4gPiArMjQ2Miw4IEBAIHN0YXRpYyB2b2lkIGFueDc2MjVfYnJpZGdlX2F0b21pY19kaXNhYmxl
KHN0cnVjdCBkcm1fYnJpZGdlDQo+ID4gKmJyaWRnZSwNCj4gPg0KPiA+ICAgICAgIGRldl9kYmco
ZGV2LCAiZHJtIGF0b21pYyBkaXNhYmxlXG4iKTsNCj4gPg0KPiA+ICsgICAgIGFueDc2MjVfaGRj
cF9kaXNhYmxlX2FuZF91cGRhdGVfY3AoY3R4KTsNCj4gPiArDQo+ID4gICAgICAgY3R4LT5jb25u
ZWN0b3IgPSBOVUxMOw0KPiA+ICAgICAgIGFueDc2MjVfZHBfc3RvcChjdHgpOw0KPiA+DQo+ID4g
LS0NCj4gPiAyLjI1LjENCj4gPg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0
cnkNCg==
