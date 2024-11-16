Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915E59CFEC9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 13:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB8A10E403;
	Sat, 16 Nov 2024 12:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TXoNbM0k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011066.outbound.protection.outlook.com [52.101.125.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504F310E403
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 12:19:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6KvUIAXTq6wNGL2xf1tK6Hac58g0ZEhcwGa/Vc4mOaZy/MuvK/bbXdDuR3BDW9P9HZP8Z+8B1zKx1X+REN2DHpdQPKdkKcVQVvZ2zsn2QkY3TFkymRDrkRyr8b4JS9bj0cFiplW6zTpRSauIvGjEP7HwpjX4mo+5on79v3DG1E4vDqARfiWe5MVUdgknNYZf9pm0OaffiW7afDqStRAfMXV6hSwh/lQzlxLdjyASKTuztypSmM+OaYOWflkk4/PubdyHRkSb5HER5e/ZpQk/X8e70yu0Qi+IDtVY6MHOvkj5Zs5LoflIQvVPVMyD5oB4uPfzQo3s3GAlefw4OzPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dKISOmBejnHF9Cd830M62eJcVNCFL6uxFQy+lRbsTs=;
 b=biV1xV5/umsjCIv6nfAgNwDM/qwSsCt5PhdlskXiuipNtddSBj3np2sf7I9r9SInA23I+V/nf7oowkr9FOjyXc2mbBX8EdDYxnaIHPHYCeRjpmHRLKFHP/zY7StektuMJ0gydIgdc16UvqZkpfVL6jWwDwLXr5FOE6Fi4Y30LnYajAWv50RjaaXG95s2gZpcdbijZ5f+oNCPcarKPmq/FXXM7jKRyTlNLw1SMnG+OveXNWEXy9rb72WIJ5X3mxUjNFgaeC4mDA3wPBl28s1+ylUD8v7mjQ3yQavc6u6vnWPkkZk9w8qItzT+vjjlnWSgHB79SZorvE9aDxj3FCYrHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dKISOmBejnHF9Cd830M62eJcVNCFL6uxFQy+lRbsTs=;
 b=TXoNbM0kshxSuYh1k92fR/+0SL7Oq8j3Uv23f5svRLVs6ni3H68kD/kVNb5LjNUQ43zIBxjkKbvk4ZzicqiLqUEBHhnEVh9yOYJZuWtl6g9Z3SI6FlbyycfmZ+awg73tMwulmv9avRRRZ6qKEN88x0g9Ya9W1IjIzT8gXviUk3s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12247.jpnprd01.prod.outlook.com (2603:1096:604:2e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Sat, 16 Nov
 2024 12:19:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8158.019; Sat, 16 Nov 2024
 12:19:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stefan Ekenberg <stefan.ekenberg@axis.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@axis.com" <kernel@axis.com>
Subject: RE: [PATCH] drm/bridge: adv7533: Reset DSI receiver logic
Thread-Topic: [PATCH] drm/bridge: adv7533: Reset DSI receiver logic
Thread-Index: AQHbNae7JghBfwuRP0KYJy+Fo5ibD7K4AHsAgAAOIwCAAclocA==
Date: Sat, 16 Nov 2024 12:19:53 +0000
Message-ID: <TY3PR01MB11346035EA645C5069C78C5B486252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241113-adv7533-dsi-reset-v1-1-6c1069e35fd3@axis.com>
 <hukcjydehdbkk4xn3c62au4az4tlfjlkmxhq5db5xwabvxhyba@nf5tzddcbikv>
 <a243c18b-7fae-27b5-83ab-755653f1bf3d@axis.com>
In-Reply-To: <a243c18b-7fae-27b5-83ab-755653f1bf3d@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12247:EE_
x-ms-office365-filtering-correlation-id: 2301ea74-a00e-444c-fbbb-08dd0638f9ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bzRtNVMxZk0zZ3VZSi8zeUxLZG54amlld0JZY1BRL0thZ3EvazNVTGZCN1VI?=
 =?utf-8?B?TWczdjhacFV5d21pMXJQWkdLb1RHbFppdWFqdEk2cHpETjNJYWx1a3NuNlI4?=
 =?utf-8?B?alVVRWNQMWRrbjNOQjFKSkE4TlB5K3g2ZkhnbjBBdTN2ZE5MRWZHUHZtRC9r?=
 =?utf-8?B?YkhLNUppQTdHM0xkV1BVakhYeUNCYU1QUzAvM0VpTmYwM01uT05aMkVWU255?=
 =?utf-8?B?cEVpT2JFR0hINHQxV0RjeDJIblY1djRuVjVvSlpHODdMdHNFb3NSS0RoVk1H?=
 =?utf-8?B?V09Gd2pWV3lXeU9FMVc2Q2R3dElYcmpiaUpiWFpwSWxYS0hJckdIRjNTQ2ZN?=
 =?utf-8?B?bm9XYzZGb0RUeTJ1R20zUEoxSE5VMWNvN2grQzNtNXppYnhPMXBXWmtPUGVq?=
 =?utf-8?B?YVNmRS9JaVR1b3ZSY2k2UW85K3NpaStsdEduZUhWT0tnNEJBNkt6Vk1xbzRj?=
 =?utf-8?B?NzVUZk9CYzRFRE9SOEtjeG5ReEtRSFhVM3hBaVlLUTBnaW94Qy9MME8vVzg2?=
 =?utf-8?B?YXlRTldmSVRGRHJUMys4WXh5MXROWEIreHlpcE03ZnZ3MXcrTzhHQWYrcnhl?=
 =?utf-8?B?b3VEVCttaGNzbUFVL040c0w4M3oxQlFnRjFUL2NBeW1rNXlyYkN4ZjRwOGV2?=
 =?utf-8?B?M0VWSjlyQjV6eWlwVTRNSWgweGlOclJ4QnBJdWVtSXhJZlJ0NHB1aldpUkV6?=
 =?utf-8?B?a1pNVU9Kd3RHYk52bUcwZGpjUGNMdUl4TVZOK0RjYkRHVS81c1RjYVZUZldF?=
 =?utf-8?B?R0pyYXFCR3FTa1h6NEtsSVhYZ1RTL2Myd1ZabURTVGw5TVFaajZRb1NieGJv?=
 =?utf-8?B?bFd2ZGhRN0FUSkFyQ1ltQi9FeGpZOThKRGNKTVZMazV5blVYS01JUVBnVHdJ?=
 =?utf-8?B?TkJPT3g2YW1CV25ieHZmek10NU5Zc3Q5RjFMbVdnRGVnazBPK1NhK2U0K1F5?=
 =?utf-8?B?dGVJZ2lzTzZxdkZMT3hOR1psUS95VmxqVmt3ZmQ1ZGxuNUhPNkc5b1FmTnJZ?=
 =?utf-8?B?dmw3Y1g2bHl6R2RBUElCKzhrL1NHdkRqaFRuWUN3SGRZeXVVdGIrZVVjSS9m?=
 =?utf-8?B?b1JvVHNheU5UWUdYdlg0NU5LMkFpaWx4MEZKTWtTciswbGhEZGNOODBsNldT?=
 =?utf-8?B?WDFmQndZQXV4NTQxQk1sQkpDTWVWQW9PSlRhQWhKN3NjSzVETUxZNXBsRW1P?=
 =?utf-8?B?K1UyaFBTYmJwNkV0WGZNUlFPWmdhbWNIc0pKRlpzUS90UzVDM2U3eitUMlBQ?=
 =?utf-8?B?aVNNNi8xUENqYy9IUlcxUERJQzZCQkJkVTdPeEtvQ05VYzRONDJQTU50aVBY?=
 =?utf-8?B?L1hIVGRwMkoweDJHLzRnRUNOalFqVlhzQVdmTFgzMDR4Q3FwRmJINFFCd2pP?=
 =?utf-8?B?ZDNmVkY2V01ueFFvRW1nZ2JWMFQzQlNkNzJ2VjhnOUVjTVZCZERHUlZXRWJ6?=
 =?utf-8?B?L09NTlI1ZHFNU1hFV09mSVozaUpGcnYyaTVRNGExaC9JbGoyb1MwNzQrUG1Y?=
 =?utf-8?B?SU9MTmFmNFJ0dVpqcmVRYi94dzFmQW1pV2ZJNWFweGhkTndGZ2dRRXhnd0Ux?=
 =?utf-8?B?R1NUWWxVUEpJWS9FcWxmSEVja1FlS3BTOERMNHp3WTQ2bDQ5NXc2REl1b0RO?=
 =?utf-8?B?UjlpcytEc095Mi9kSWZ6NVlMWnp0Q2pTYWtUcXVoWHNQN3JkS2I5dEFnZlZH?=
 =?utf-8?B?VEhySTJKWUNWTXRxWGlkdGNLU0o5MmxYaXU5MUo3SEJNUTU0VldWdFRCa3BQ?=
 =?utf-8?B?MUxlcmh2bU5CcWFnM1MxaG00NzFnK1pXbXo5R1loZ1NacC9wcXNRK0dJbHFt?=
 =?utf-8?Q?FD+qsV0l5c3eYdRfhjeSbBvxNyvRDfSDYmysg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWVsRkIvaG1qODJnWkloMzhRR2Q0ZmtvTS9LcS9yUy9mNnlOWGI4ZE5rVHM1?=
 =?utf-8?B?elJ3aDJBWkM2V29XaDdRZVFQanVlRzlFUzNmVU1oTmdhb1N2YXRlZlp4TjZz?=
 =?utf-8?B?U09PWStGTE4xTjFmT2RDQk00MDNGdVAwVmRGejFxN3QzZ3k3STBvMTFDcTc2?=
 =?utf-8?B?eXlvc1ZaMzI3REVZK0ZYVDdETmxTbHFObEZydXZFUEdQc1JPQjdYNHRpL1ZF?=
 =?utf-8?B?WThsWnRDclY4cnVja1pOSlVZOTB1WHRXTzBZWjNUd0lEYVM1L0JHN0d0d25o?=
 =?utf-8?B?cDljSmZHa3dvWHpXQWw0YURQWlFsRDBReHkxM1BkL2JIa21nWE1KS2tVNHY1?=
 =?utf-8?B?RmRkaHRFR1BpelZXMEUreFNsc0hvelY1eVdOckpzY3ROV2w3SVNJWUxoUGM5?=
 =?utf-8?B?dXdnYitTK0ZoamV3VElIYVAwSUN4K1ZxL1BSbFNvQlhYOXMrYnZ2RVBTZG5H?=
 =?utf-8?B?cVF3a1FxMk1td3VFU2w0V3poakFvbEZTd1c1ZmRzY1hLNUN0Ti81NDY4YUtD?=
 =?utf-8?B?YTlHZWtrb1BkdlJ2clpJR1JKdXA5cTlqRnp1MysveFI2NGVkcWdibnpORytp?=
 =?utf-8?B?RzU1WnlIVEtoYTZkZVNnY3ZSbHBYM3pLVmY4M0ZRdkMrQXFjSlFBTU5DTUJm?=
 =?utf-8?B?NVkyUlptdTgvYXpKcDZ4MVVzczZEZWNYbU9VTEtkMkFwSXlCbUVhUWJSNTVy?=
 =?utf-8?B?RCtzTS9qUGdoMEZ3TGxWMnc2bnFaQlIyMzNSZ2ppdGx2VUU1NUtJOWxUMWVL?=
 =?utf-8?B?RVFtL2tqV2ZjcUQ5cG5UbmRVa2JlTWU2cWNFWW16SEY3TExpOEl0SHdxMVlv?=
 =?utf-8?B?eTVVb0o1R3RNdHZPNEQvSVJ2TEVieVZmbjJwY2o1UEphcHA5QmxueTJWRlMw?=
 =?utf-8?B?eDU2MUJPallqYVVFOHVCMHRXbHhFRzR0SzhBNnJrNVZXbEIzMllxQzBuMldt?=
 =?utf-8?B?cE5YRFJxQmVhRFhZZW84ZUVjYmZ3YVdzbm0yUlc4UDYvVkJpMGFEa3BSaDFY?=
 =?utf-8?B?QVZneC83bTV3RUVmbkxIYkV2WnV1dWZJQ0NPc05mZ3BEMUovRk1FNlhUd1ZP?=
 =?utf-8?B?SS94QVh5TTM5WHEwd25DQzNKVDFMK3dDek9acS9UWlpJTnZQWVhXWndNRnlX?=
 =?utf-8?B?RFlZK01UOVRaSHFCN0ZyMUhnOGJ3eWdnTEFpUTNFRmFGcy9IRGlkTzU2SkEv?=
 =?utf-8?B?Q3JlbjhuaUVYTTAvNEJuaDN1RFhGbGxINy9seXVIZC9LcC8zZ0U4clFQVk9u?=
 =?utf-8?B?cG5CSnlkU0sxMDh4bXRaUGNwZzh0ak96WTYvVlRFTGhNY2MreFRkQmVqVVd4?=
 =?utf-8?B?b1kyWWhEcTIvY3ZKOGZmZFcyNzZmRkhsL2M1dzBSSmtwSWRoRDdIeVYrMzR0?=
 =?utf-8?B?UVNtWHlQUVBLS3NWTFhudkNsUUE1WFdyK0VzcGFzamQwRmUyNFdBNGhUTkJO?=
 =?utf-8?B?a3d0N01xbERmRjJCZFpHbVRLdTl2VHIrb0t1VU15NzkxeE4zNGlmUTR6bTRF?=
 =?utf-8?B?VzUrQXkyT3psZUNLQnkzdEh4Y0RDRkJtT3N2V2pmUmtDU2dWVnBDS1JzWFdu?=
 =?utf-8?B?TDFSVExXNEFHbzNKNlFZVVhIMUUyWlQwblRUd3IvaktybmY4VGtzNlBkQk5I?=
 =?utf-8?B?azlUN1BRdzdqTXZ1SHNCTldnYjcyK1BJZzZvSGh4ZFdQWEsxYmhHZFR2VlBN?=
 =?utf-8?B?RkMwOXZ0ME5hRWUrdG53NUdpNHI3WjdEb1dmaFlHN0ZGYmc2emFsMnYzbzRv?=
 =?utf-8?B?VkdkY1BGSUEvWGNLR1cwNk5IQzEyMUJEeGdpQTczT05BMDR3cWMzZzQ3dXR5?=
 =?utf-8?B?dFFNMzBtZm8xS2ZOMEV2NlZ2TElKZEpBL1haS2RPN0xwWDlFaS9hQUFCZDVV?=
 =?utf-8?B?VFUvS0tVNUMzMStIY0ZKaWhGYk0wOXJvOUZQWGI3ZUdEYnk0S0gzU1NDTVRE?=
 =?utf-8?B?ZmZYcGdwKzV2ZCt6UWZZOEJQRVorN3R1L2FrR2UyZmN5RVB6Z0YvNW84VVRn?=
 =?utf-8?B?aFZiK0NWTG1tcHI2UjFsdU8xN3E3d3hOanN1ZHova2FnNngrSGV0OVVYZTdx?=
 =?utf-8?B?UnBzajZhWkFaOHlPcEQ0WXpFVFpXRnY5NGgrc0dEQjRWNytROEFUQ3gvT1B2?=
 =?utf-8?B?c2ZjaEZBbFo5cWdiYnRoWmoyS0hCQUMyUXRBcWRjK0Mvcm04ZHNqUHpuS3c3?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2301ea74-a00e-444c-fbbb-08dd0638f9ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2024 12:19:53.7247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xP5m/C4sTiw7m0rNP1Pb2AnDP8Wgy/boIy/u2+/BjN9yXSslGSvkF1Xis5zoKot9mMDnqn8NQzgrBFNcufVxS/3DMHxwUc2Gx18A0RgZfrY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12247
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

SGkgU3RlZmFuIEVrZW5iZXJnIDxzdGVmYW4uZWtlbmJlcmdAYXhpcy5jb20+LA0KDQo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5j
ZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU3RlZmFuIEVrZW5iZXJnDQo+
IFNlbnQ6IDE1IE5vdmVtYmVyIDIwMjQgMDk6MDINCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJt
L2JyaWRnZTogYWR2NzUzMzogUmVzZXQgRFNJIHJlY2VpdmVyIGxvZ2ljDQo+IA0KPiBPbiAxMS8x
NS8yNCAwOToxMCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gPiBPbiBXZWQsIE5vdiAxMywg
MjAyNCBhdCAwODo0MDoxNUFNICswMTAwLCBTdGVmYW4gRWtlbmJlcmcgd3JvdGU6DQo+ID4+IFJl
c2V0IERTSSByZWNlaXZlciBsb2dpYyBkdXJpbmcgcG93ZXIgb24uIFRoZSBuZWVkIGZvciB0aGlz
IGNoYW5nZQ0KPiA+PiB3YXMgZGlzY292ZXJlZCB3aGVuIGludmVzdGlnYXRpbmcgaXNzdWUgd2l0
aCBBRFY3NTM1LiBUaGUgc3ltcHRvbSBvZg0KPiA+PiB0aGUgcHJvYmxlbSB3YXMgdGhhdCBBRFY3
NTM1IGNvbnRpbnVvdXNseSBvdXRwdXRzIGEgYmxhY2sgaW1hZ2UuIFRoaXMNCj4gPj4gaGFwcGVu
ZWQgZm9yIGFib3V0IDEwJSBvZiB0aGUgdGltZXMgdGhhdCBBRFY3NTM1IHdhcyBwb3dlcmVkIG9u
LiBUaGUNCj4gPj4gcmVzdCBvZiB0aGUgdGltZXMgdGhlIGltYWdlIHdhcyBhcyBleHBlY3RlZC4N
Cj4gPj4NCj4gPj4gVGhlIHNvbHV0aW9uIGluIHRoaXMgcGF0Y2ggKHBsYWNlbWVudCBvZiByZXNl
dCBhbmQgc2xlZXAgdGltZSBvZg0KPiA+PiAyMDBtcykgaXMgaW1wbGVtZW50ZWQgYXMgb3V0bGlu
ZWQgYnkgdGhlIEFuYWxvZyBEZXZpY2VzIHN1cHBvcnQgdGVhbS4NCj4gPg0KPiA+IElzIHRoaXMg
cmVzZXQgc2VxdWVuY2Ugc3BlY2lmaWMgb25seSB0byBhZHY3NTM1PyBJcyBpdCBhcHBsaWNhYmxl
IHRvDQo+ID4gYWR2NzUzMz8gYWR2NzUxMT8NCj4gDQo+IEkga25vdyB0aGF0IGl0IGlzIG5vdCBh
cHBsaWNhYmxlIGZvciBBRFY3NTExICh0aGF0IGNoaXAgZG9lc24ndCBoYXZlIGFueSBNSVBJIERT
SSByZWNlaXZlcikuIEl0IG1pZ2h0DQo+IGJlIGFwcGxpY2FibGUgZm9yIEFEVjc1MzMgYnV0IHVu
Zm9ydHVuYXRlbHkgSSBkb24ndCBrbm93LiBJIGhhdmUgb25seSB1c2VkIEFENzUzNSBhbmQgdGhl
cmVmb3JlIG5ldmVyDQo+IHRlc3RlZCBhbnl0aGluZyBvbiBBRFY3NTMzLg0KPiANCj4gPg0KPiA+
Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gRWtlbmJlcmcgPHN0ZWZhbi5la2VuYmVyZ0Bh
eGlzLmNvbT4NCg0KV2l0aCBhbmQgd2l0aG91dCB0aGUgcGF0Y2gsIGRpc3BsYXkgd29ya3Mgb24g
UmVuZXNhcyBSWi9WMkwgU01BUkMgYm9hcmQgd2hpY2ggaXMgY29ubmVjdGVkIHRvIEFEVjc1MzUg
ZGV2aWNlLg0KDQpUZXN0ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNv
bT4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+ID4+IC0tLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMgfCA5ICsrKysrKysrKw0KPiA+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKykNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fk
djc1MTEvYWR2NzUzMy5jDQo+ID4+IGluZGV4IDQ0ODE0ODlhYWY1ZWJmMTY0MzEzYzg2Y2JmMzQ0
N2QyZDc5MTRhYjkuLjkzMDg1YzJiODcyZWQ5OGY0ZWUzOTQyMzZkYzY2YzU2OGMwZTVjY2YgMTAw
NjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTMzLmMN
Cj4gPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MzMuYw0KPiA+
PiBAQCAtNjcsNiArNjcsMTUgQEAgdm9pZCBhZHY3NTMzX2RzaV9wb3dlcl9vbihzdHJ1Y3QgYWR2
NzUxMSAqYWR2KQ0KPiA+PiAgIHsNCj4gPj4gICAJc3RydWN0IG1pcGlfZHNpX2RldmljZSAqZHNp
ID0gYWR2LT5kc2k7DQo+ID4+DQo+ID4+ICsJLyoNCj4gPj4gKwkgKiBSZXNldCBEU0kgcmVjZWl2
ZXIgYmxvY2sgbG9naWMgdG8gYXZvaWQgQURWNzUzNSBzdGFydHVwIHByb2JsZW0uDQo+ID4+ICsJ
ICogV2l0aG91dCB0aGlzIHJlc2V0IGl0IHNvbWV0aW1lcyBjb250aW51b3VzbHkgZmFpbHMgdG8g
cmVjZWl2ZQ0KPiA+PiArCSAqIGluY29taW5nIERTSSBwYWNrZXRzIGFuZCBvdXRwdXRzIGJsYWNr
IGltYWdlLg0KPiA+PiArCSAqLw0KPiA+PiArCXJlZ21hcF93cml0ZShhZHYtPnJlZ21hcF9jZWMs
IDB4MjYsIDB4MTgpOw0KPiA+PiArCW1zbGVlcCgyMDApOw0KPiA+PiArCXJlZ21hcF93cml0ZShh
ZHYtPnJlZ21hcF9jZWMsIDB4MjYsIDB4MzgpOw0KPiA+PiArDQo+ID4+ICAgCWlmIChhZHYtPnVz
ZV90aW1pbmdfZ2VuKQ0KPiA+PiAgIAkJYWR2NzUxMV9kc2lfY29uZmlnX3RpbWluZ19nZW4oYWR2
KTsNCj4gPj4NCj4gPj4NCj4gPj4gLS0tDQo+ID4+IGJhc2UtY29tbWl0OiA1OWI3MjNjZDJhZGJh
YzJhMzRmYzhlMTJjNzRhZTI2YWU0NWJmMjMwDQo+ID4+IGNoYW5nZS1pZDogMjAyNDExMDgtYWR2
NzUzMy1kc2ktcmVzZXQtNDg4YzZmYmI1ZTQyDQo+ID4+DQo+ID4+IEJlc3QgcmVnYXJkcywNCj4g
Pj4gLS0NCj4gPj4gU3RlZmFuIEVrZW5iZXJnIDxzdGVmYW4uZWtlbmJlcmdAYXhpcy5jb20+DQo+
ID4+DQo+ID4NCg0K
