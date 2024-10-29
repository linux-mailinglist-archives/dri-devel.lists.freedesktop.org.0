Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD9E9B4574
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AA410E5EF;
	Tue, 29 Oct 2024 09:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BISrnGG1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B03210E13E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:18:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFGAKlWStno8t/CZhpOo6D6rGrvIcdNf3eDJH9Xjiiz86AvifzGjuNo/fCcuYEBF94c17J2sIhYj+19hwoZt9RtyjXF4MXuCA7vj/u3MpO339d29aYkOBaVkDaCPF5dfJK57CRHxmSTkhq71B647RfAKX38rszpdk8GyFFxtdW3J6xtjplE1keLwqrgvcuvQlOi/F0+V7oQOI72pguae4ncUNZw4DSwuB4ubMQJtCPytdcDSq8aNsGUsYuRQ3TtyC2Kwux1AzFtNLBdwqEP05QxuGDU2hrW4RU68cXC7vpDxY6CI30dmmFciE/jNItwtRhTHAsSFBwCssVQPdsajbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5q8AzwcgpbQa7Btzjt/sS9yM17dCtrs1JbMINmdOJ4=;
 b=rKtEOk4W3q7bTWo8UHxjoMvTqkIhCOIWARMzZCbRSxFC4ElnJ09QM5e9cJKsYn2flQqzG37jhVa4xnARmPgNeAFGFC1RAjA1yAZb2sUWjGjdfxAPHJGIiGJ4I0Ain7qSDwT54ICTz50MSs2HrKYCZjXZKFhHswn7QuBlMG4kqUpC91HyjpGSCLOIv28thRpdOGx23SudH1Z968UABwFxpGsJThfTZpQpLytMzNqOXGU95TeiXJNFSOd6EVj97D0wJZky45ZpPVXnXHbFRURFPSTTc0cAjLFHkmouqNcsPaS/Qcw/3w91WsxjlZQnSgd0ibLKhxcHHE7K5ghGHlSlHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5q8AzwcgpbQa7Btzjt/sS9yM17dCtrs1JbMINmdOJ4=;
 b=BISrnGG10Z8vNUOx1A3JoWFl9R2in6fFkdw82aNGHakX30i/fC7oaHFfra8/48JapjHThqsRqEoqrvKwc+kisCEvXoiGO/uG54rjkB+rR9qJhZIKpv1ZLoQGoQBNGW+/21Acyf6kZdSQlsKBj+kuZ2TkBVDhlVKOaRh3M7yrIOg=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB6733.jpnprd01.prod.outlook.com (2603:1096:400:9e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Tue, 29 Oct
 2024 09:18:08 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 09:18:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Index: AQHbKOKZPN4b66+xp0G7h8Y65TjgzbKdVYDggAAKTwCAAA0QUIAABUEAgAACR6A=
Date: Tue, 29 Oct 2024 09:18:08 +0000
Message-ID: <TYCPR01MB11332D71A26AB9FFBDF593281864B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <TY3PR01MB11346FDF74840ADF7273A218D864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <69cfeb75-696e-43c4-ad27-aaf9ad3c6c78@nxp.com>
 <TYCPR01MB11332FF433F4E10E4D0B7FE2B864B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <17b6858e-1afc-4fec-9044-2d17395ec6a5@nxp.com>
In-Reply-To: <17b6858e-1afc-4fec-9044-2d17395ec6a5@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB6733:EE_
x-ms-office365-filtering-correlation-id: 38216755-f3c6-4f07-7ef1-08dcf7fa9a67
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?U1lKU0JMRG9kay85TTBGSHhXWG02QXpSMWJROTFtTFM5WlNORmx2aSs3N0kw?=
 =?utf-8?B?SGd2UUpra2tDNkxGbThwcUoxc3ZkUEtxT3FCZGkvcGI0THhHVG95L0RFN0My?=
 =?utf-8?B?cTJrVkFMNk5LeE1MTGpmRUVJS0F3Z2lZd3AwL0crTlNIM09jOVlTNVdtMytQ?=
 =?utf-8?B?ZEc2YmJ6RWlNUTJJYXJyYlJZTUZRRDlnMjI0Y1E5a1lxOUQ3ekx4VUltR3Fi?=
 =?utf-8?B?L3JHdW9kd25ZdlZkNHRNUTZKQm50eXJsTE5vVndYbzB0anRKMzk0bFlQT0M5?=
 =?utf-8?B?RDV0aUpsTkRhbjR6Q0ZOK1duUm1wLzNISWNkNEtQbE9WNWVBaU9vdUVxOTh1?=
 =?utf-8?B?MUt3U1YxWUZoNlVWdVp6T1h4MzhRaUUvZ3hZaUpENTRmSkJaM0pkRlFsemYw?=
 =?utf-8?B?WGdtZEp2OTNicEoxMVpRT0VHNWx0elN0WCtmc3JPdVJaY1FGcXdQVDJsbjZO?=
 =?utf-8?B?ZDFjS0tRSFJXV2dlaEVtWSswZ3gyVitWdlo3cHJDSkxLOW9xeFlUdUlXOXV1?=
 =?utf-8?B?MmJpaG5qM242eVdnWW8yM2NoT1NCeEdhd1Y3YkpZV1JPd01LODBVMGU3YmZL?=
 =?utf-8?B?d29kSnMxc1lIblErVHdzcmxzczNkU3JmZFgvUFREQlcxbnZIbGxFbUwzYTRi?=
 =?utf-8?B?eWtYWTRtWFZmSGxib1p4bTNpRFVYU1gzLzVrSEF3QzZ6TlhoT1ZyM3R3WnB4?=
 =?utf-8?B?TEpzQ016bCtEajFtcDNaVkVudkFHYkJzWmc2WXRDZlA3a3l5U0ZrS0JGMkRM?=
 =?utf-8?B?UHUrTXdtd0dDdE1uWTVjUFFVRms3UmRvNS96NnFiNVMva1pRTW1ENklLVEdZ?=
 =?utf-8?B?MFlmWUI2OFAzTjlIbU1JOVVMZjc4MjQ1dGJTb3Z5S0NGZEovcnJnWFQrdjU3?=
 =?utf-8?B?ZHdXMGVYeFJGakdvUlJBMTF0K0ZRY0VkQ1JhcytnSUd5OVJrTXE4UTJCZFVO?=
 =?utf-8?B?eGVyazJsMWkvN3JFU2RrekkvVnJYSDI0RnlKbThTeWxlWHVrY3puV0k1ZmxB?=
 =?utf-8?B?YnJLWlZwb2VvZVlrR01HZXgyRDBDRlhWVDNkUU1OVVVRSzcxaUJVNXZRcDRr?=
 =?utf-8?B?VFJIWjlSckw4QndpWGhLSHlOSEhpVzlvYXN0aEFtWVRaTkJ2Mlc5UVpaOEdl?=
 =?utf-8?B?Z0t4VnpkK3dnRWVpRENTdzJHYUJoT2dmUWFnWTlwelFiaEpXQTBBdUZybXE4?=
 =?utf-8?B?azdJaWpydlEwYmZhVGhYYitEdmo5bEtwbXJZc1JOS0dGSkpZbDFKTzBmNlhD?=
 =?utf-8?B?Nk9EbngwdTlqWUgvcVB2cWRNeXdlaEdUOE5PdlVONjdNaVNXWlh3eElVVXFh?=
 =?utf-8?B?MVhYSU16Q01CZ2Q0azhvZ2ZZYXA2M2h5N28wT2NmT3prSFZiVnZuOXMwS0FV?=
 =?utf-8?B?SExpa2NFZWpkVWlVTGNXbUdwM3NPb3llU2Z5T2N2Q01EUjRjQUZ6YU5pK0RY?=
 =?utf-8?B?NmFUTEpUd29ZY1dFMlNpdHBKTFVXa0ZzeFEwYmRLK25MWXJRb1UrWVJ5Tnk3?=
 =?utf-8?B?RXBEeDZWY21KYzhueVVvUjBCRy9aTmg3N2dHeGRPaGtqL05DMkpHMVlDRW5N?=
 =?utf-8?B?amlwVVZvUG1rNkZhaDB5R1l1SlNhZ3RZNGlFSldpS3pNRkIwUG1iOXF5RzZV?=
 =?utf-8?B?MTZ6MmlGK2ZLTks0S3QwdEVhL1UrOFFFY29VZFFqdE1UTWRhWUh5Z2ZzZ2pE?=
 =?utf-8?B?aFRTRHRpZUxZbXlGSUpMN0ZrQWorUXFGOHQza1laWGl3aURNZENuRThOWHBu?=
 =?utf-8?Q?6zC6KJ0wcEr3On4G/j9Yq5zVQS09We7mv4KFbIY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aW5kZGVyUUgvZWRvb3VlUGdCNkxWQis4ci82MmxDLzFCTjRXWmV2YkhrMjZu?=
 =?utf-8?B?bEFXMkZ6VU5TTHRvd2FCUk9VZkhWYlUybWhLVFVLMG11aXgwcmhwOWQ4T0g0?=
 =?utf-8?B?TXJTSmoweVZkYURjQ0VEb1BOVytWbWVuTTM2OEFrUDZBenF3MmloZUQ3L3c0?=
 =?utf-8?B?TitiNWVTK1V4S1M1Qko5T3N4bTF4U0YwUzJtYWNHK1RKQXFGdUJxaXZIbFhV?=
 =?utf-8?B?M3pTOGo1VFduZWVtNy9kdm93MlIrOU1jOEFjS0dzL3JRVlcwbEFDWFJpbXBV?=
 =?utf-8?B?L05tYk9uZXd2UURGRTU4N00yZWpJOGphWFVIb0g4R1NSYkhpV1I0enRaZzc2?=
 =?utf-8?B?R0FTWmtVSHNBZ2NsV1NSMlNaanVlTGg2YVgwenp5QjFSWlc1U0FHbkZSb0lM?=
 =?utf-8?B?SWR5Q2ZqZmErREp1aS8rTkdCalcreWc3WlprVWQ4VXExOTV1QytnV3FvSGNt?=
 =?utf-8?B?UktMaGFZS05pUHd3citGakkyZFY1QlRHMWMyOFdPUkErK1VGS09qOHR0N3Ex?=
 =?utf-8?B?OFNRWWdXbittOExSK0REd3FieW9oSHVlZHhhWHZLeExkTlpscVVsN2l0OW1i?=
 =?utf-8?B?Z1VMQzgvM1kyOFhrTWQwTy9pajYyVllOUTAvK1Y5VlV5M1JCQzhoQ3BWM2d0?=
 =?utf-8?B?OVAvS0kyTkdCcG9oVWJaa1pTaGppQkVVWitSS1c4SVdvdWUxL1crejBKSnZ1?=
 =?utf-8?B?cW1BTUtvNmF3Wm1pdE8wZllzSm8xTEVsWGhBbTc1KzdTVWJUQ1hKei9PSm1U?=
 =?utf-8?B?a3ZoN1RaN21rUW5jeG5YU1drWmxySVJOMDNGUnF4Vk12WHZHay9QNGxCeG9U?=
 =?utf-8?B?Slk5QjhEYk1kaUU0V0x4SFQ4M1RTYUQxQUZhbkovd09Zc0dlZWYwTzlBdVIr?=
 =?utf-8?B?dVl3U2JiZjRubGo2eFoybmJsZWVHVmNodklMMXZzQkwvRDY3SlJlcmNGeHZP?=
 =?utf-8?B?NXVSV05EZUlBSUNNaVRGTFY3K3FsRG1yVjZSMUltNHRZMENoY0JzWlhvdEU3?=
 =?utf-8?B?bHNmb0xpdEtGcUJFcU9obHZRZ3F2bVRrWDQvNkdyb0RTQWI2eUM3TUdOV0VL?=
 =?utf-8?B?cVYwVHV6eWJ4Z0NjN0g2VlpUMzNSRGlwRnl1RmMwcVJmUkdzZFA1TFpCUHB6?=
 =?utf-8?B?bFhMdlZwcnF0SHJGUk0wem02ZUlCc1k4b2ZkWlA0eW9iQ1JWTFZmbHFWOTk0?=
 =?utf-8?B?ZkRRTzNDbTJBV3hTc2NaZHhhVm1nbDg1S1dQYkdwNkt2NFoyRUE0R0ZnbE41?=
 =?utf-8?B?cHhxOEtzSGlLRlRGdmNDWUg3VmVlRUF5OUdVWVYvdzJtZzV2OFhiRkNLNDJ4?=
 =?utf-8?B?YXVmV2kwQWZrWFZJY1VseHFaQlM3dUs1T25EZmhoZTR0TFZ0T0VEMVVFNWRx?=
 =?utf-8?B?N0IrUkJZUzJMVWdzeGhLY0dlNmxzb1VNdytkVWsxTEozek1rU3UyUmUyNlVz?=
 =?utf-8?B?WFdXUVkwTTZDVzJCZDArRTRjNzg2ZnJ5YXNCdEd3RDlwaFczelVydXNkTXlF?=
 =?utf-8?B?RVFoUUNnOHhVNjlkbndxUk5YTnFtYWtBWlptT1U0OHhhUkNoQXpBMmUxdCti?=
 =?utf-8?B?U1B2eUg1VmpYSUQ1czhpTDlpMzBuQjZ1bGhFRjVNakhRRXMzc3FJTFVZUEdH?=
 =?utf-8?B?SkNlRml2YkVjWDRnS1AwMDdJOUhNN0RRRlVRTWRNejNRSnZyeVRhU3B1Z2dJ?=
 =?utf-8?B?cU1lYThkK0lsUVVUQ0ZORjVxaGNzZjVKZHVsalgvMmFTekVnWElSd3JzOVJ4?=
 =?utf-8?B?Uk5ZMGhDQ3pJK29hZno3UUJOZDdRaFJ6RzMvZGR3TW1mb2ZHQ1ZaN2xMK0w2?=
 =?utf-8?B?WlVFa0ZRMEtLakFmWXJUTlZCaTJPODFGSS9ZUHRpQlBUQXJiQnIvWThEdUlO?=
 =?utf-8?B?SFNLZDI1V1VxOFhpdFVRczF5TnIvOUZlWU1PclVjYjRBMkkrbW56ck9makZy?=
 =?utf-8?B?VmdvZGkrNHNOVkJ5d2tzVEwxUkZaMW8vWE5TdTZ1WTU2aEk0dTRYMHlyNENu?=
 =?utf-8?B?OGcybVpPRVNoSGd3aDRnSy9QN1MyZHpyUTJpMnlYTFVtRDVYN3hTYk9HSFYw?=
 =?utf-8?B?dGxncDcvbENJSytlL1Nlc2crUEMrWDFpQWtNL3BuNDNSRm16c01WdnVwNlAw?=
 =?utf-8?B?aWwwZHV0aEx5ZVFzLzZxYlhQSFR2aGhPY0Vqb1BJWTNoUFdFTmoxQVEyOTZp?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38216755-f3c6-4f07-7ef1-08dcf7fa9a67
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 09:18:08.3703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXHg2t9DjvodXq9kfkAdGulpuUOFvBcMlLhevmGepIFt3iEa5FhYXqJOvcHANlwewzjABCRfnSfWTKAb5/EATYQg5qPgrcD/pHNMVi3h/Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6733
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJp
LWRldmVsIDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFs
ZiBPZiBMaXUgWWluZw0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjQgMDk6MDcNCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NCAwOC8xM10gZHQtYmluZGluZ3M6IGRpc3BsYXk6IERvY3VtZW50IGR1YWwt
bGluayBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMNCj4gDQo+IE9uIDEwLzI5LzIwMjQs
IEJpanUgRGFzIHdyb3RlOg0KPiA+IEhpIExpdSBZaW5nLA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogZHJpLWRldmVs
IDxkcmktZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZg0KPiA+
PiBPZiBMaXUgWWluZw0KPiA+PiBTZW50OiAyOSBPY3RvYmVyIDIwMjQgMDg6MDINCj4gPj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2NCAwOC8xM10gZHQtYmluZGluZ3M6IGRpc3BsYXk6IERvY3VtZW50
DQo+ID4+IGR1YWwtbGluayBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMNCj4gPj4NCj4g
Pj4gT24gMTAvMjkvMjAyNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBMaXUgWWluZywNCj4g
Pj4NCj4gPj4gSGkgQmlqdSwNCj4gPj4NCj4gPj4+DQo+ID4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiA+
Pj4+IFNlbnQ6IDI4IE9jdG9iZXIgMjAyNCAwMjozOA0KPiA+Pj4+IFN1YmplY3Q6IFtQQVRDSCB2
NCAwOC8xM10gZHQtYmluZGluZ3M6IGRpc3BsYXk6IERvY3VtZW50IGR1YWwtbGluaw0KPiA+Pj4+
IExWRFMgZGlzcGxheSBjb21tb24gcHJvcGVydGllcw0KPiA+Pj4+DQo+ID4+Pj4gRHVhbC1saW5r
IExWRFMgZGlzcGxheXMgcmVjZWl2ZSBvZGQgcGl4ZWxzIGFuZCBldmVuIHBpeGVscw0KPiA+Pj4+
IHNlcGFyYXRlbHkgZnJvbSBkdWFsIExWRFMgbGlua3MuICBPbmUgbGluayByZWNlaXZlcyBvZGQg
cGl4ZWxzIGFuZA0KPiA+Pj4+IHRoZSBvdGhlciByZWNlaXZlcyBldmVuIHBpeGVscy4gIFNvbWUg
b2YgdGhvc2UgZGlzcGxheXMgbWF5IGFsc28NCj4gPj4+PiB1c2Ugb25seSBvbmUgTFZEUyBsaW5r
IHRvIHJlY2VpdmUgYWxsIHBpeGVscywgYmVpbmcgb2RkIGFuZCBldmVuDQo+ID4+Pj4gYWdub3N0
aWMuICBEb2N1bWVudCBjb21tb24gcHJvcGVydGllcyBmb3IgdGhvc2UNCj4gPj4gZGlzcGxheXMg
YnkgZXh0ZW5kaW5nIExWRFMgZGlzcGxheSBjb21tb24gcHJvcGVydGllcyBkZWZpbmVkIGluIGx2
ZHMueWFtbC4NCj4gPj4+Pg0KPiA+Pj4+IFN1Z2dlc3RlZC1ieTogRG1pdHJ5IEJhcnlzaGtvdiA8
ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IExpdSBZ
aW5nIDx2aWN0b3IubGl1QG54cC5jb20+DQo+ID4+Pj4gLS0tDQo+ID4+Pj4gdjQ6DQo+ID4+Pj4g
KiBTcXVhc2ggY2hhbmdlIGZvciBhZHZhbnRlY2gsaWRrLTIxMjF3ci55YW1sIGFuZA0KPiA+Pj4+
ICAgcGFuZWwtc2ltcGxlLWx2ZHMtZHVhbC1wb3J0cy55YW1sIHdpdGggbHZkcy1kdWFsLXBvcnRz
LnlhbWwuDQo+ID4+Pj4gKFJvYikNCj4gPj4+PiAqIEltcHJvdmUgZGVzY3JpcHRpb24gaW4gbHZk
cy1kdWFsLXBvcnRzLnlhbWwuICAoS3J6eXN6dG9mKQ0KPiA+Pj4+DQo+ID4+Pj4gdjM6DQo+ID4+
Pj4gKiBOZXcgcGF0Y2guICAoRG1pdHJ5KQ0KPiA+Pj4+DQo+ID4+Pj4gIC4uLi9iaW5kaW5ncy9k
aXNwbGF5L2x2ZHMtZHVhbC1wb3J0cy55YW1sICAgICB8IDc2ICsrKysrKysrKysrKysrKysrKysN
Cj4gPj4+PiAgLi4uL2Rpc3BsYXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IueWFtbCAgIHwg
MTQgKy0tLQ0KPiA+Pj4+ICAuLi4vcGFuZWwvcGFuZWwtc2ltcGxlLWx2ZHMtZHVhbC1wb3J0cy55
YW1sICAgfCAyMCArLS0tLQ0KPiA+Pj4+ICAzIGZpbGVzIGNoYW5nZWQsIDc4IGluc2VydGlvbnMo
KyksIDMyIGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUNCj4gPj4+PiAxMDA2NDQNCj4gPj4+PiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMu
eWFtbA0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4+IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbHZkcy1kdWFsLXBvcnRzLnlhbWwNCj4gPj4+PiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2x2ZHMtZHVhbC1wb3J0
cy55YW1sDQo+ID4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPj4+PiBpbmRleCAwMDAwMDAw
MDAwMDAuLjVmN2EzMDY0MDQwNA0KPiA+Pj4+IC0tLSAvZGV2L251bGwNCj4gPj4+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMu
eWFtDQo+ID4+Pj4gKysrIGwNCj4gPj4+PiBAQCAtMCwwICsxLDc2IEBADQo+ID4+Pj4gKyMgU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAlWUFN
TA0KPiA+Pj4+ICsxLjINCj4gPj4+PiArLS0tDQo+ID4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRy
ZWUub3JnL3NjaGVtYXMvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbCMNCj4gPj4+PiArJHNj
aGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4+
Pj4gKw0KPiA+Pj4+ICt0aXRsZTogRHVhbC1saW5rIExWRFMgRGlzcGxheSBDb21tb24gUHJvcGVy
dGllcw0KPiA+Pj4+ICsNCj4gPj4+PiArbWFpbnRhaW5lcnM6DQo+ID4+Pj4gKyAgLSBMaXUgWWlu
ZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiA+Pj4+ICsNCj4gPj4+PiArZGVzY3JpcHRpb246IHwN
Cj4gPj4+PiArICBDb21tb24gcHJvcGVydGllcyBmb3IgTFZEUyBkaXNwbGF5cyB3aXRoIGR1YWwg
TFZEUyBsaW5rcy4gRXh0ZW5kDQo+ID4+Pj4gK0xWRFMgZGlzcGxheQ0KPiA+Pj4+ICsgIGNvbW1v
biBwcm9wZXJ0aWVzIGRlZmluZWQgaW4gbHZkcy55YW1sLg0KPiA+Pj4+ICsNCj4gPj4+PiArICBE
dWFsLWxpbmsgTFZEUyBkaXNwbGF5cyByZWNlaXZlIG9kZCBwaXhlbHMgYW5kIGV2ZW4gcGl4ZWxz
DQo+ID4+Pj4gKyBzZXBhcmF0ZWx5IGZyb20gIHRoZSBkdWFsIExWRFMgbGlua3MuIE9uZSBsaW5r
IHJlY2VpdmVzIG9kZA0KPiA+Pj4+ICsgcGl4ZWxzIGFuZCB0aGUgb3RoZXIgcmVjZWl2ZXMgIGV2
ZW4gcGl4ZWxzLiBTb21lIG9mIHRob3NlDQo+ID4+Pj4gKyBkaXNwbGF5cyBtYXkgYWxzbyB1c2Ug
b25seSBvbmUgTFZEUyBsaW5rIHRvICByZWNlaXZlIGFsbCBwaXhlbHMsIGJlaW5nIG9kZCBhbmQg
ZXZlbiBhZ25vc3RpYy4NCj4gPj4+PiArDQo+ID4+Pj4gK2FsbE9mOg0KPiA+Pj4+ICsgIC0gJHJl
ZjogbHZkcy55YW1sIw0KPiA+Pj4+ICsNCj4gPj4+PiArcHJvcGVydGllczoNCj4gPj4+PiArICBw
b3J0czoNCj4gPj4+PiArICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMv
cG9ydHMNCj4gPj4+PiArDQo+ID4+Pj4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+Pj4+ICsgICAgICBw
b3J0QDA6DQo+ID4+Pj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRlZnMv
cG9ydC1iYXNlDQo+ID4+Pj4gKyAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0K
PiA+Pj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiB0aGUgZmlyc3QgTFZEUyBpbnB1dCBsaW5rDQo+
ID4+Pj4gKw0KPiA+Pj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4+Pj4gKyAgICAgICAgICBk
dWFsLWx2ZHMtb2RkLXBpeGVsczoNCj4gPj4+PiArICAgICAgICAgICAgdHlwZTogYm9vbGVhbg0K
PiA+Pj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogdGhlIGZpcnN0IExWRFMgaW5wdXQgbGlu
ayBmb3Igb2RkIHBpeGVscw0KPiA+Pj4+ICsNCj4gPj4+PiArICAgICAgICAgIGR1YWwtbHZkcy1l
dmVuLXBpeGVsczoNCj4gPj4+PiArICAgICAgICAgICAgdHlwZTogYm9vbGVhbg0KPiA+Pj4+ICsg
ICAgICAgICAgICBkZXNjcmlwdGlvbjogdGhlIGZpcnN0IExWRFMgaW5wdXQgbGluayBmb3IgZXZl
biBwaXhlbHMNCj4gPj4+DQo+ID4+Pg0KPiA+Pj4gcG9ydEAwIHdlIGtub3cgaXQgaXMgZmlyc3Qg
bGluaw0KPiA+Pj4gcG9ydEAxIHdlIGtub3cgaXQgaXMgc2Vjb25kIGxpbmsuDQo+ID4+PiBkdWFs
LWx2ZHMtb2RkLXBpeGVsczogV2Uga25vdyBpdCBpcyBmb3Igb2RkIHBpeGVscy4NCj4gPj4+IGR1
YWwtbHZkcy1ldmVuLXBpeGVsczogV2Uga25vdyBpdCBpcyBmb3Igb2RkIHBpeGVscy4NCj4gPj4+
DQo+ID4+PiBOb3Qgc3VyZSwgd2hldGhlciB3ZSBjYW4gZ2l2ZSBjb21tb24gZGVzY3JpcHRpb24g
YW5kIGF2b2lkIHRoZQ0KPiA+Pj4gZHVwbGljYXRlIGZyb20gcG9ydEAxID8/DQo+ID4+DQo+ID4+
IFllcywgaXQnZCBiZXR0ZXIgdG8gdXNlIHBhdHRlcm5Qcm9wZXJ0aWVzLiBUaGFua3MuDQo+ID4+
DQo+ID4+IC0tODwtLQ0KPiA+PiAgICAgcGF0dGVyblByb3BlcnRpZXM6DQo+ID4+ICAgICAgICde
cG9ydEBbMDFdJCc6DQo+ID4+ICAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvJGRl
ZnMvcG9ydC1iYXNlDQo+ID4+ICAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0K
PiA+PiAgICAgICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4+ICAgICAgICAgICBwb3J0QDAgaXMgZm9y
IHRoZSBmaXJzdCBMVkRTIGlucHV0IGxpbmsuDQo+ID4+ICAgICAgICAgICBwb3J0QDEgaXMgZm9y
IHRoZSBzZWNvbmQgTFZEUyBpbnB1dCBsaW5rLg0KPiA+Pg0KPiA+PiAgICAgICAgIHByb3BlcnRp
ZXM6DQo+ID4+ICAgICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVsczoNCj4gPj4gICAgICAgICAg
ICAgdHlwZTogYm9vbGVhbg0KPiA+PiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogTFZEUyBpbnB1
dCBsaW5rIGZvciBvZGQgcGl4ZWxzDQo+ID4+DQo+ID4+ICAgICAgICAgICBkdWFsLWx2ZHMtZXZl
bi1waXhlbHM6DQo+ID4+ICAgICAgICAgICAgIHR5cGU6IGJvb2xlYW4NCj4gPj4gICAgICAgICAg
ICAgZGVzY3JpcHRpb246IExWRFMgaW5wdXQgbGluayBmb3IgZXZlbiBwaXhlbHMNCj4gPj4NCj4g
Pj4gICAgICAgICBvbmVPZjoNCj4gPj4gICAgICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2ZHMt
b2RkLXBpeGVsc10NCj4gPj4gICAgICAgICAgIC0gcmVxdWlyZWQ6IFtkdWFsLWx2ZHMtZXZlbi1w
aXhlbHNdDQo+ID4+ICAgICAgICAgICAtIHByb3BlcnRpZXM6DQo+ID4+ICAgICAgICAgICAgICAg
ZHVhbC1sdmRzLW9kZC1waXhlbHM6IGZhbHNlDQo+ID4+ICAgICAgICAgICAgICAgZHVhbC1sdmRz
LWV2ZW4tcGl4ZWxzOiBmYWxzZQ0KPiA+Pg0KPiA+PiAgICAgYW55T2Y6DQo+ID4+ICAgICAgIC0g
cmVxdWlyZWQ6DQo+ID4+ICAgICAgICAgICAtIHBvcnRAMA0KPiA+PiAgICAgICAtIHJlcXVpcmVk
Og0KPiA+PiAgICAgICAgICAgLSBwb3J0QDENCj4gPj4gLS04PC0tDQo+ID4+DQo+ID4+Pg0KPiA+
Pj4NCj4gPj4+PiArDQo+ID4+Pj4gKyAgICAgICAgb25lT2Y6DQo+ID4+Pj4gKyAgICAgICAgICAt
IHJlcXVpcmVkOiBbZHVhbC1sdmRzLW9kZC1waXhlbHNdDQo+ID4+Pj4gKyAgICAgICAgICAtIHJl
cXVpcmVkOiBbZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzXQ0KPiA+Pj4+ICsgICAgICAgICAgLSBwcm9w
ZXJ0aWVzOg0KPiA+Pj4+ICsgICAgICAgICAgICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxzOiBmYWxz
ZQ0KPiA+Pj4+ICsgICAgICAgICAgICAgIGR1YWwtbHZkcy1ldmVuLXBpeGVsczogZmFsc2UNCj4g
Pj4+DQo+ID4+PiBXaHkgdGhpcyBpcyBmYWxzZSBoZXJlPyBvbmVPZiBpcyBub3Qgc3VmZmljaWVu
dD8NCj4gPj4NCj4gPj4gVGhlICdmYWxzZScgaXMgdXNlZCB3aGVuIHRoaXMgTFZEUyBsaW5rIHdv
cmtzIGFsb25lIGFzIGEgc2luZ2xlIExWRFMNCj4gPj4gbGluaywgYmVpbmcgb2RkIGFuZCBldmVu
IGFnbm9zdGljLg0KPiA+Pg0KPiA+PiBUaGUgJ29uZU9mJyBhbGxvd3MgYSBMVkRTIGxpbmsgdG8g
YmUgZGVmaW5lZCBhcyBhIHNpbmdsZSBMVkRTIGxpbmsgb3Igb25lIGxpbmsgb2YgZHVhbCBMVkRT
IGxpbmtzLg0KPiA+DQo+ID4gT2ssIGl0IG1ha2VzIHNlbnNlIGZvciBzaW5nbGUgTFZEUyBsaW5r
LiBNYXliZSByZW5hbWUgdGhlIGZpbGUgdG8NCj4gPiBsdmRzLWR1YWwtcG9ydHMueWFtbC0+bHZk
cy1wb3J0cy55YW1sDQo+ID4gdG8gbWFrZSBpdCBjbGVhciwgaXQgaXMgZm9yIGFsbCBMVkRTIHBv
cnRzLCBpZiBpdCBpcyBnb2luZyB0byBhZGRyZXNzIHNpbmdsZSBsaW5rIGNhc2UgYXN3ZWxsPz8N
Cj4gDQo+IFNpbmdsZS1saW5rIExWRFMgZGlzcGxheXMgYXJlIHN1cHBvc2VkIHRvIGJlIGRvY3Vt
ZW50ZWQgd2l0aG91dCByZWZlcmVuY2luZyB0aGlzIHNjaGVtYSwgaS5lLiwgdGhleQ0KPiBtYXkg
cmVmZXJlbmNlIGx2ZHMueWFtbCBhbmQgZGVmaW5lIHRoZSBzaW5nbGUgTFZEUyBzaW5rIGxpbmsg
d2l0aCBwb3J0IHByb3BlcnR5KGZvciBwYW5lbHMpIG9yIHBvcnRAMA0KPiBwcm9wZXJ0eShmb3Ig
YnJpZGdlcykuDQo+IHBvcnRAMSB3b3VsZCBiZSBkZWZpbmVkIGFzIG91dHB1dCBwb3J0IGZvciBi
cmlkZ2VzLCBub3QgaW5wdXQgcG9ydC4gIE1heWJlLCB3ZSdsbCBoYXZlIHNvbWV0aGluZyBsaWtl
DQo+IGx2ZHMtc2luZ2xlLXBvcnQueWFtbCBpbiB0aGUgZnV0dXJlLg0KDQpPSywgdGhlbiB0aGlz
IGJpbmRpbmcgaXMgc3VmZmllbnQgSSBndWVzcy4NCg0KQXMgZGVzY3JpcHRpb24gc2F5cywgbWFq
b3JpdHkgZGV2aWNlcyBzdXBwb3J0cyBkdWFsIGxpbmtzLg0KU29tZSBkdWFsIGxpbmsgZGlzcGxh
eSBzdXBwb3J0cyBzaW5nbGUgbGluayBhcyB3ZWxsLg0KDQpDaGVlcnMsDQpCaWp1DQo=
