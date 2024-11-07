Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD99C048A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 12:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4447110E80A;
	Thu,  7 Nov 2024 11:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q5bkZUv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCEE10E308
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 11:47:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY4eem0oN/8rk1YeizMCoawW62ovsBHmeY8LglWlL68wJbcvhvIc9cjrjNTJ1gVg7FQeNU1hduZcH6Z2gDAI6pmMIoH95V4rKyjbAJHO4g6FHebjsv3jzRYFZzO+dRsPK8GOgd30WcmMIahpDT/e9oJqOiV7mUqqBnOKO6rv/M27UzG/DJXkEw+2cpS2gfFYpEJzRLzFuHjZgjKNEklJg0UvoF45lPe9C5cPe5fxFCg/UNJ4NklerX6MtSyHI4d6KdK1LaXSD6pqIr0bwBLr+rbXa+52/M1kcxsQO/S/ynBO49KOPW6zp9pk15UZI2uuKXh0ibwwCyKemdvbqqbm5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M5uaOC57gmhpob9wDOfdI2FBRTTDVnnCTWu5FWy3hw=;
 b=fyFOQ75H1lr6RuypdXyq2rsHhS63eABLshqR+xE+qFZRRl9kqaKC7qPSbVxcN2GJRSlfNV5vOEKLbrTLC2OswF8Uv0TqSCkaZ4Ya+C7BJOb1M3oZJJZChji0fQthhvdR8Za19eSyML+o3B1jwHBnUTzqpuIxV4yK365f8JptC25M2TSiTzC9KY9MLPs7fh9WwtweZ4C3bDgclEgDklX8+QcZ8Iyh4LDnZusG80iYMhFqrxUGpyvuAU4vlLYkN5nPajzAtY+HwbQ3LW5uTZZDveUdli0hYUqEShbo1Qzc9DjNH56xjrVJ58D9sPt4jLnRABQ4ob1S447XNw1wf4U9ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M5uaOC57gmhpob9wDOfdI2FBRTTDVnnCTWu5FWy3hw=;
 b=q5bkZUv379+xIiPDxACMO9DKeokYG4wd3zZ8YbbHHK5DDDAwPxnP9ETv1CTcsKnNhkP81hWyg1BUnpRjkJzx+CrTKYkVCKI846Pr/U0Cfj/RcelUTgxTEJDWyXD/ldwxt5uYGN3tWFBNDUhCrfl1lgvrwLefhdIWJ11kAZQIezs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9727.jpnprd01.prod.outlook.com (2603:1096:400:224::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 11:47:41 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 11:47:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
Thread-Topic: [PATCH v3 2/3] dt-bindings: display: adi,adv7533: Drop single
 lane support
Thread-Index: AQHbMHyssRJlYpgFi0mhWOO1KBseZLKqo+0AgAEQixA=
Date: Thu, 7 Nov 2024 11:47:40 +0000
Message-ID: <TY3PR01MB1134688FCF71F69CAC9098C25865C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241106184935.294513-1-biju.das.jz@bp.renesas.com>
 <20241106184935.294513-3-biju.das.jz@bp.renesas.com>
 <20241106193118.GB21454@pendragon.ideasonboard.com>
In-Reply-To: <20241106193118.GB21454@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9727:EE_
x-ms-office365-filtering-correlation-id: 6b4f3651-5add-444b-1d36-08dcff21fc28
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MlRhdTk3SjYrWjQ4UDdxaEtLYVVmbHlTcDZJMndQRWROYktCYTNQbjM2U2xi?=
 =?utf-8?B?alZmeDZTSjBLbjJyUWNLMHRnSjhCS0tvYjRnZ1JaRlV1MTBhSGpDS2FnSTZ2?=
 =?utf-8?B?dk9BYUk3SFAreEFRTGlUNnN4aDRKaHRmT0tTdzRwQ1U5bGtGK2poWHJ2OHNa?=
 =?utf-8?B?RzhySlFaQVlxWUVsWTBYWmtMamdZQThGQTVnb2ltM3lINlZuMEptYjF5bG1H?=
 =?utf-8?B?UGo3VEkwSTdHaHloOTk0TlVFU1daREd4Q1laZVA1QXBGYURwRlVSS0IzUEsr?=
 =?utf-8?B?ZHBWdG9xUkYrTEZnanlESW92MDhyQWhwZ2FCWnhWVmFROE0xdXlxT3FINEor?=
 =?utf-8?B?QU9Ram9TQW96Y0RMWlA1OTJMWkxOZnVkc0lBRkhXNGQ4T2l2RW9tZ0JGODBz?=
 =?utf-8?B?dm5NN3VNbldjUGJ1amNvWkd5anFaeEJsWmFNUUgyZE9DY2o0RnRheWYvK0hS?=
 =?utf-8?B?cHJmUmd0LzhsUGcybUJGN3I0U2pKYURUQ1I3S2RDL3dWcVRUZ05vWFVSY1hn?=
 =?utf-8?B?Z3VpMTZHRXZkTGEvTFl0ZzBzU0RVOWIvamFITVB4Nk9SWnlnU2psQVJPRUc3?=
 =?utf-8?B?ZVExUmRoNmNFQzlic0x1QVBoa1NUenlaUlg3aGZBeG10TmVPaWFURjRnQzJB?=
 =?utf-8?B?ZnJtNjhlVWxWS3grdExBTzFYTkkxV2tUNEE4all0LzVpOFFnWE4zektldERB?=
 =?utf-8?B?RmVZUDZ0ZVhVKzJrMmRXUkkwVDFhak1NN1Uvd1NQL3Y2WkdGRHU3TFZuT0da?=
 =?utf-8?B?aHhVV0tLV25CT1pxVE9KNkVBdFJXcmtWOElBeENvNWYyMGpBa3JHemhMZ3pL?=
 =?utf-8?B?VDBFN09QT3hCNG9MVGtpUmlwT1A5L2FENklBUDRQOElBbzE0RU03eUNkN1ZQ?=
 =?utf-8?B?TGI2bTRwdXNzajFRZ1ErSjYxREtqKzh1OGY4dFhVOXZyQmlyazdwQldLSXc4?=
 =?utf-8?B?WlcyUGJKbmU0cjNpOUF2YXlrQUJHZUl6UjZ1WTJ5TDZicDBJY2dmb2lOdzFx?=
 =?utf-8?B?dDJjbFp4eExlTnc2M2ZqOU0rZnN4Ui9UVHBCQ3U2WnIwMXhlTnBEMUgxdm5n?=
 =?utf-8?B?S1FpV2Nkd1ppVVBFMWRzK1U4OXpwL0dFRmpwSFV6K3N4R2VBRGlqNE8zZFVO?=
 =?utf-8?B?VTcxSkRrQ1QzTS8rM2NxK3gxOWNEK09RQnd2RC9kSUhvajl4YzY0dUR3ckZD?=
 =?utf-8?B?aUR3U1pKQWNhSlBFZXZTY3dPaHJPdXJjWWF3L1hyN1BWY0NPaFY4eUtsb1FN?=
 =?utf-8?B?RXNmTnRRSno4V3c0dVlSbWRBOHVhTnJFRVMxRWtiL2lrUFpaeFRtMnJVclVi?=
 =?utf-8?B?SklqMEhHaW5FYXRYb0VCRTk4VERRQm5uQnp6MnFBUVQvQ0JGOHl5SVVLOXlv?=
 =?utf-8?B?NjNwM0o0NE9YVE9FbGZBMVpwQVRQS2dsWWZYZ2VUeUZ5cnd3eVNRUFpUOVJX?=
 =?utf-8?B?YjBjTFg5c2hYNGtpQVpoM2diV2J1dlVXankrb2JXWmt0NDUvTXZBNHUwbnNx?=
 =?utf-8?B?ZnNtL0VleHY2dEVKYUhlQk9ibXNyWlU0S0lpMlFib3dXNWdVbU95Mmd1M2hj?=
 =?utf-8?B?VWkvckxGSU50bStFanJwQyt1YmdneEs2em43TWt2V0RBUjM0UUZSTGlGaFYw?=
 =?utf-8?B?Wmp0SnJXemJqTzJ0VXR1NUoyTjNDekVaSURsYUMvNGhIMy9PenpqMFBYUjBJ?=
 =?utf-8?B?a2prRlE0cDZuWWhveHpURXdLN0d5MGZ4eDVDS3F1Q0dUbGVvZmNHdnBDWGJl?=
 =?utf-8?B?ekhIdkU5S0pTS1NNMzExQitEdGJHVjNxRHkvWktoSWpYS1lMQjkvbGc4NkJs?=
 =?utf-8?B?bC9hN0pVVlZKK05QbWlWV29WSWpTTW9TOXprak1RY2YwQXFsQWx6Uk1qUXgv?=
 =?utf-8?Q?yKf2BTWuyXk0d?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHdSeGY2SEFpakhjcjlYN2JnVnNheXc5bnNYZUZRZWU1eXk5T3pxSEQ2S0Vi?=
 =?utf-8?B?U0x6Z3RYQ2QxNnoycWY0OEw2WW0vMlkvb3pLbGQra2hsNTN3QVVid1lYVFcx?=
 =?utf-8?B?K3ZWY1JCRXMxODJKSHVWc3dUcy8rV1J0dnFUVXQ5Uml6VVMrQk4yVGlnSVRv?=
 =?utf-8?B?R3VpMlhVTWRYWUVKTkJHS2h5eWVrZEVMTG05OVRqcFVlT0NRKzg0Q1JjWk9n?=
 =?utf-8?B?eXZHUnZ4cnpDZW1uRmQzVHRtT1ZmNmZ2SldzUUtXQ0dwT3BLYlpkdVJEZGVu?=
 =?utf-8?B?NStzN3VzRVg0UGtYbWZRMXdCeTgzbWVVYjB3QVd5b2kwdG1FTWZFWVBaM1lS?=
 =?utf-8?B?ekNJTTRzVkxnOXZzZ2QyaDhBYWxhTC80QVAzNW9aQU9hek1kR1JFd0RtZmpa?=
 =?utf-8?B?RjVKN2Y5S3h5WUE5bjhOaFlYNlRNNmhqSVpQbzRmb0RpUm5BZGRpUmZScEVJ?=
 =?utf-8?B?REhTRjQvUmpKMFlwM1QrQVRjQUx3U1NFZUpiaFdQZndnM2tjM2ZHeVJKNVg2?=
 =?utf-8?B?WElsYlp3UkFwWmRSZUY2cG5rdFdqblpqaWRZM2xMUGp1M0lVK3NLUkgraEhY?=
 =?utf-8?B?R21vUHF3VWhwTjhuU0w1RHUrWTZPUmxtT2Z3TXRONDdDbXB4WVJCcHJZTjA1?=
 =?utf-8?B?VHJnb2JnTjllYTFSdWpLSHkyT09ERGNKZFNHbkRmSW56cml4cjNQRWYyd2Va?=
 =?utf-8?B?WS9sUldaaUVWWk1pejRaWmt4QkExd1kvdkRrc3A1VnFBUTJITFMybGVCcjE0?=
 =?utf-8?B?L05SelBicHphMG84elFnVndmMFBBSktuMWxYekxsQXBWMGJzakd3cnVxWkUw?=
 =?utf-8?B?TnFFTWFPZk90Z3ozaXJGQWJ2MFVzRUtUNmVDeGsxVzUxWDNWTXR3Sm9xbXpk?=
 =?utf-8?B?bTgydXRWOU9GQTh3UWhYcFF3VE1GZXBnby9LL1hQOHY2VzRTeWJhbkRVN2tW?=
 =?utf-8?B?U1B3MVBKVFkxb3F0Q2JFb0FnN1ZPdXRSM2hkZEcvR3RtRWJzcWl2ZW5CK2R2?=
 =?utf-8?B?NzdUV2RFTnh4alhzV1l5ZFg4S0ozZ1Rqb3NUQ3MzYUlnVkc5K1g5UXFDSDRs?=
 =?utf-8?B?NGZDTmNaOVBzMElDSFAvNXd1WWk2b0lVQUNkMGRVd2VBZkdCVXpyWWZzSE1Y?=
 =?utf-8?B?N2ZPTm9FWVNnRktzRXRpOWxRc1BUYmNqcG9Rem9ObGpJM3ZTMFJyVXJqbHgx?=
 =?utf-8?B?ekZRNk5LT0tlMUVMZWNMTiszdktJenNpS1MzcndVYnRjOTZhd2RUNEo3VmVD?=
 =?utf-8?B?N0pieXpZOUJJZVJIMkZSemhmRVlqY0MwS0NOaTk5UExKeng4RkVwTVEzcUhs?=
 =?utf-8?B?aW0xRjI4NlZwKzNTNlMyNzlTcCttWW9aWHJsMWhYTHE0bEQvbWk0L2xKaU1T?=
 =?utf-8?B?NE9SY3F0bkU2dVI2MS91VVdYTzl6c1RIemlvVitGUStJVERLMDF2RU1XUWcx?=
 =?utf-8?B?NUlEVnBjVGFISTN1QTI1dlhxYS9JWGtsZXpXNmkxRHdsYnBONktoM3FYV2J5?=
 =?utf-8?B?aEJPZkk0c3l3YmhyRVQ2Ump2THlqMHpZelVwdjlBY2lZVTBVa1ppTzUrdHZX?=
 =?utf-8?B?L2lkRGt2eWpFVi94OWhrU0NnNzcweTJxOTBubWM0Zlh5My8wSURZV1ZyTDVK?=
 =?utf-8?B?TjdpQ0R4eG5GVitjQjk5ZytZSS9RT29xL0d4UDRFNzJZc2hlYzVqL2RQM2dI?=
 =?utf-8?B?THFJOHhvUDI4OGRmUDJ1OHhZWUZJMnFaMXJFdDZiOVk4U1YxVFAxcjZhNGEv?=
 =?utf-8?B?NysybC95T1BSOUYrQWlvZlF4dE5DeXA0TzN2RWdxZ29BR3F2Z0dZanpZM0N2?=
 =?utf-8?B?NFIwd2pXWW5pWldzTmNEZkpEdDZmMFhHTWFQeFU1UFlyTUhJOEZRYUpSaEtB?=
 =?utf-8?B?WjhWaFV6am12c0V1aUpnblB6aHR0cXl3YXdWME1xSnVIcVFyRWt6RGxuQ3hP?=
 =?utf-8?B?Nnp0S0dHcFIyb1NMd1I3dUc2c0psdXpwS3ozekQvT1FibEg1RzFwZHBKb2NZ?=
 =?utf-8?B?QzQrUWUyWkJjWlNZRW5DUHROL1h5d2VWWnJZYUFKeWhyUWlueWRKQTJXckF4?=
 =?utf-8?B?T0JPN3RJb2J2Zko5V1NoZnZ0djRFR25WM21seHBuNldKcVN1ZFcza3B1S3Na?=
 =?utf-8?Q?e7UBmVXnQGB4UnbFWqSKXcDyK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4f3651-5add-444b-1d36-08dcff21fc28
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 11:47:40.9063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0klwMa7DwdEdQx5vhGXx9VEaeRGEJfvPsUDqIm7wj7VVogajAFZWk5W800JK39tUCor43a1qTCX/BMTDHZ3/Dne3clDnNRQhWq/zaqx8uw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9727
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiAwNiBOb3ZlbWJlciAyMDI0IDE5OjMxDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8zXSBkdC1iaW5kaW5nczogZGlzcGxheTogYWRpLGFkdjc1
MzM6IERyb3Agc2luZ2xlIGxhbmUgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IFRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gV2VkLCBOb3YgMDYsIDIwMjQgYXQgMDY6NDk6
MjlQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gQXMgcGVyIFsxXSwgQURWNzUzNS83NTMz
IHN1cHBvcnQgb25seSAyLSwgMy0sIG9yIDQtbGFuZS4gRHJvcA0KPiA+IHVuc3VwcG9ydGVkIDEt
bGFuZSBmcm9tIGJpbmRpbmdzLg0KPiA+DQo+ID4gWzFdDQo+ID4gaHR0cHM6Ly93d3cuYW5hbG9n
LmNvbS9tZWRpYS9lbi90ZWNobmljYWwtZG9jdW1lbnRhdGlvbi9kYXRhLXNoZWV0cy9BRA0KPiA+
IFY3NTM1LnBkZg0KPiANCj4gTm8gbmVlZCBmb3IgYSBsaW5lIGJyZWFrLCB5b3UgY2FuIHdyaXRl
DQo+IA0KPiBbMV0gaHR0cHM6Ly93d3cuYW5hbG9nLmNvbS9tZWRpYS9lbi90ZWNobmljYWwtZG9j
dW1lbnRhdGlvbi9kYXRhLXNoZWV0cy9BRFY3NTM1LnBkZg0KDQpBZ3JlZWQuIFdpbGwgYWRkIHRo
ZSBtaXNzaW5nIGxpbmsgZm9yIEFEVjc1MzMgYXMgd2VsbC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+DQo+ID4gRml4ZXM6IDFlNGQ1OGNkN2Y4OCAoImRybS9icmlkZ2U6IGFkdjc1MzM6IENy
ZWF0ZSBhIE1JUEkgRFNJIGRldmljZSIpDQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCty
ZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+DQo+IA0KPiA+IC0tLQ0KPiA+IHYzOg0KPiA+ICAqIE5l
dyBwYXRjaC4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvYWRpLGFkdjc1MzMueWFtbCAgICAgICAgIHwgMiArLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9hZGks
YWR2NzUzMy55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9icmlkZ2UvYWRpLGFkdjc1MzMueWFtbA0KPiA+IGluZGV4IGRmMjBhM2M5Yzc0NC4uZWM4
OTExNWM3NGU0IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FkaSxhZHY3NTMzLnlhbWwNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvYWRpLGFkdjc1MzMu
eWFtDQo+ID4gKysrIGwNCj4gPiBAQCAtOTAsNyArOTAsNyBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAg
IGFkaSxkc2ktbGFuZXM6DQo+ID4gICAgICBkZXNjcmlwdGlvbjogTnVtYmVyIG9mIERTSSBkYXRh
IGxhbmVzIGNvbm5lY3RlZCB0byB0aGUgRFNJIGhvc3QuDQo+ID4gICAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiAtICAgIGVudW06IFsgMSwgMiwg
MywgNCBdDQo+ID4gKyAgICBlbnVtOiBbIDIsIDMsIDQgXQ0KPiA+DQo+ID4gICAgIiNzb3VuZC1k
YWktY2VsbHMiOg0KPiA+ICAgICAgY29uc3Q6IDANCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0K
PiBMYXVyZW50IFBpbmNoYXJ0DQo=
