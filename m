Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC99CFEC5
	for <lists+dri-devel@lfdr.de>; Sat, 16 Nov 2024 13:18:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8CB10E27F;
	Sat, 16 Nov 2024 12:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aO96L207";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4000310E27F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Nov 2024 12:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bx98pgngxjaeJXNBL1BVr7mEvYTRHg6K53/6ZvRq+dZ6PwugWcVRr/VhkjzVZJwqs4WIO08zidiS93JE549RhhZgqiLe1UyHEnpUwoT0mouclvujqx0rMDEwf3OKaYrHnS2TZ3EFR+t8nRvxhlbkm9XImQZ4pys9RqXcTyhDrjewdfOUJkEB1QPS78MG8nxwhWPGs7gGA+t7m5DAJNlx89BVxVKum5q25lSOLA1EANH8nGxWKr41rzp5iLoDdkrKDTfQWD86ZTmLEXnoBbhmnGTak0q7LYarBhNj5NxCdi03WHI0lZf6EAmT68DZcMNf3hh1YZbzzxqdp5EiwWXhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzpgGAQ+tzQBCP7Ppuwr/sfG/SLrHYvlPWzcA3kdmh8=;
 b=uxmnq1gwWMx6F0YtQlIPoHr5ws+r1sU/yXj1OB8z3cG4pCrZk4Y8WEbxIBrFLtTJSOaz+wvLRlAeLAuUc/Mi/YtdasH7Czp5M+GByHDsqqY/hZENO+I45LLvcZMPgaL84YZjs9EtJBXdNBQ2v+K2esN4jZoFNzrS8130S7iMz3fs3JK6I46M/KUWkWP+Rfa5/S+lyQzK0Gec9gRC5w83udubXhbEAhTQdowRy7mAXXv3AuwIWQ5XaznUrEC90LJ5fVYyRtdrX0Hbf1g44VO1EcDxB+Zc7tmYoPyjBhIWamLrctvRFWJ4Q3/VvzmxJupW5FRybTG1dWgH6hv/5h9apw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzpgGAQ+tzQBCP7Ppuwr/sfG/SLrHYvlPWzcA3kdmh8=;
 b=aO96L207O3swbjOUrODG7VdwtKdSUL1dzZZdSn4fPFb2r/BcW8Es5fsjqxdoIchfRATr1NENg+iHQO5nZ/QQyOG+RTTUeOsMdQCFlWjpGcwRw5XUYdsVAdvC7+nQXdeqRVwFTCY4atm2nh/xN7RsmUbFzCppK91oYsPmM7vc1cw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB12247.jpnprd01.prod.outlook.com (2603:1096:604:2e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Sat, 16 Nov
 2024 12:18:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8158.019; Sat, 16 Nov 2024
 12:17:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Stefan Ekenberg <stefan.ekenberg@axis.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@axis.com" <kernel@axis.com>
Subject: RE: [PATCH v2] drm/bridge: adv7511_audio: Update Audio InfoFrame
 properly
Thread-Topic: [PATCH v2] drm/bridge: adv7511_audio: Update Audio InfoFrame
 properly
Thread-Index: AQHbOA0fnPDxYjVDyUmdGPuD1vDwVrK50qTA
Date: Sat, 16 Nov 2024 12:17:58 +0000
Message-ID: <TY3PR01MB1134633405204A415B726A10486252@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241115-adv7511-audio-info-frame-v2-1-ca4793ef3a91@axis.com>
In-Reply-To: <20241115-adv7511-audio-info-frame-v2-1-ca4793ef3a91@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB12247:EE_
x-ms-office365-filtering-correlation-id: 14a513b7-0a3e-46d1-a530-08dd0638b564
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?VnFVQ09nMWtucnV4T05xWXZFVmx5SEtuRFRIYmwxdHNPaG8zK0lkVnhRMFFF?=
 =?utf-8?B?RTMwNGI0UzdSK2lGZ2ptLzJNeFVyNGlrejBxcThtQWZaMlBTUUxHdmRmYzBX?=
 =?utf-8?B?eVFCdFdXQk1tamtodkhrMW5rUHR1a1hUbkl5QkFYak5XbHJZeTd0amc5bThj?=
 =?utf-8?B?VGtDZWN2bDFSd1FCM1I4QU5WeW5KODVmOGtLTDNBM0trd0VDWlhDY3Bxb0d4?=
 =?utf-8?B?a0s0TGZXV1JZajFYYVY0WWI0QmpMeExLdkQ3TDhpQndSdXl0N3lNTWhES3hZ?=
 =?utf-8?B?SWFLaVJLeU9yZFpuamtKM3pVcE1wdThROVAwTm1wL28weUNnNDEvcWxybWRk?=
 =?utf-8?B?SHNueXVIQU9IWEFGUjNiU2JSN2JiN2ZCWU8wcEhHT1dDTmdaQWpxTTAxNzJJ?=
 =?utf-8?B?VkcyTFZKd00vNktBbEdWcCs1YXBLSWRnKzVocUYwc1o1eHJqeE5zTk5oSStJ?=
 =?utf-8?B?RUc4ekxNY0w2R0FFTEVZM1ZtbzVXWlFyd1FDRWtHSXZrTUJONGtKWjBSZFlv?=
 =?utf-8?B?c01UcVFiRG80TUVreU1qd2Z6YTFVOFZqLzNWUitBQlJiR0lMK2srdE5tT2Vw?=
 =?utf-8?B?K2F0VEFQVUttVG5ERkFtQ3lJbFZmTkRCNUw2aUlJR2l2Z1VIazAraVN4TFB3?=
 =?utf-8?B?QzZnOUdHMFlTM3ZBeDZza3M4L1RNajloV2Q3VUtVTHF6bmI0bnRlYUpPYTBW?=
 =?utf-8?B?SGxXUEo4eW5FSHh6THYrSWF1MEpocnNDczF1YkRxcmpCc3d5SXRHbFVYd1FZ?=
 =?utf-8?B?am05YmtIR2JnYlNxM0Vsa0I1QmNJTWxJNGhNUHdJQjVNdjg0cTVuclRhelhD?=
 =?utf-8?B?QlZTbURkc2xWS3FReVp4Y0tSTnRlT1pvTlZQbTZjc1FlNXdkTFhnbVJiRGgr?=
 =?utf-8?B?TjQ4dnB6YkFmNzNTY3JCWnJ2Z0ZIRGpmdjU1L280VFZTSlpGOWVKL1NCSXFQ?=
 =?utf-8?B?Tnlpb21PWks2T3phMjVFdG9sMy9ZOE9GN3ZqNWVCckZzaGNrQmtpaEdiK3hV?=
 =?utf-8?B?Qm5vMDFQUkpJQXZpMmhzb1BQY2p5WVhURmRaTGhSMml1Vmg0cVZOYkg2YmU5?=
 =?utf-8?B?VkloNkVEWXd1Q3FmTG9aZUUxMUQvRkwvSnkwZE84cHNjSUU2WklhaDRCQ1ZH?=
 =?utf-8?B?aHBxV3JMOS9Eckh3c2RZUUQxQ2RkRURYU2FxSGttemN1c1phUUR5MGJCYkRS?=
 =?utf-8?B?em5wdldTbEh5U0l5MGRHZk5mMFh2WCtZbW83VnNTWkROaWhVd2pvNHpzK0pW?=
 =?utf-8?B?c0V2U0FpS1YwKzF5ZlBYTmp4YS9FclBWRmJFdUhVWENrRTFMTFZMZ1IyZTUw?=
 =?utf-8?B?TUpkNldCMjQrVEVtZDBtZHlYcWl5V25pVXVEczJlSzhYSnltbFdKN0p4SXhz?=
 =?utf-8?B?VE5KZE16M0dJUmtTNDJxcVJrcTFZTlA4SmtNdDQ3NEV0VXc4VkVZWmlYQVdP?=
 =?utf-8?B?aFh3QjBHYVpYaDRnTDErWjZTTzhPbVNaVnc0U0ZhcEJNejFna1JGdkV5M0Zl?=
 =?utf-8?B?RjdseXZzSzZZRFl2WnpTYWhwYTVsSnlFcXZUZWZ0bVdOYnU0VGR3SmZoQ1oz?=
 =?utf-8?B?Zm1mVW1zb2xzaTFLYUEwNmRpQVVUVnI4VHlEY2pjV1lwbFNJMWhYckw3MjVC?=
 =?utf-8?B?OGhTZGF2ZXVJbDEreTFha1pNUW1xWkFhUldSeHpnSTlXTUJ4OW11UlBxY2Fj?=
 =?utf-8?B?NGhTVksyNFlzaW9iVlhWSld6K281R3RRZDczRW5wQkpramxENCtIZjJzWE5K?=
 =?utf-8?B?ZjEwS1hJK2R3WmY2VmZHVHNOSFNRY1BpODZoRG9hVkFWMThoV2k5c3BiK3lm?=
 =?utf-8?B?eHQ5LzJ4R2VjVkhwUHkvTEFHazEreWpuQTFFUEZ3SHpEWjJ0UlhBbHhIcXlZ?=
 =?utf-8?B?c0RTSkV1VEhqOTFjTEdaaDJYRzk2TTdocDJaa29QT2s2Tmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEJTa2xzNFVNZzR2aUEyVE14NnNaQkU0NmpLcDBYREJFSCtzZEJDcTdNWml4?=
 =?utf-8?B?N2FGOWxOWWRyY0d2c2RnOStkd2xidWJhbCtOTGlCQ2JjZUFwU2NiYTYxdlNK?=
 =?utf-8?B?Rzd0VnBNWUlvdy9JaVQ2NmE3Z1NIanVzakJHeE9NRmFSN1A1WGpCc1F4d0ts?=
 =?utf-8?B?OFRRYmRlellwK1VreEU5TlRjQS9iQzI3Q0Z5aWkvZERNbTM0RVl2RDRVZ0hQ?=
 =?utf-8?B?NFk1RkhMSU1XVUFOQ0xrVW1EemNBMHRxN1krV1p6THlodUx2T0t6eFRnVldy?=
 =?utf-8?B?T2p4S1dqemFPZnhaVkNXdDBKTnMzemkxZTg1dWQ1MFBwaFljVUJZN1RhUXA2?=
 =?utf-8?B?Nnl0M1ZvTDBzTEFMMS9YNVJtTTZYalhWQXc5OVduTzJSZkVXaGF4dG5xRk1I?=
 =?utf-8?B?U3crbzA2ODgrdXlHMDhkelNMbjdtTlhIYzkyWHNFYVVoazZqQWJCQUVaVS9X?=
 =?utf-8?B?eStxcnd4ak1PbFlBb1Y2WHhCcHFGRzVlaFVuTGlDamg1M3A4MEdsaEZZeER4?=
 =?utf-8?B?aHVKdTFCVWNsa1d1dEFVejJja3gwMkk3dUxNckJCQzRmQmVOdGo5eGFxU2g3?=
 =?utf-8?B?S0xFVGhFR3ZocytMT3hZcTVlYTNGUno2RzNaelpEdXgwY0V5SHcraEI0aUVi?=
 =?utf-8?B?ell3RTRTUlBLMU9KcWI3aGpDNkxSakNEMlRuN3hZcnFvcXJRYmJ3aDZsQTF4?=
 =?utf-8?B?V3BGdVhWUU9RdDEyY1h3TjlCVkswY2JtdThoM3l5cjB2dTNUOWFFMFBVcTZi?=
 =?utf-8?B?cUxqTTh3UUZOcm90alZuZGluVmZ1ajVPblY3ZmRqTmI3Q0FmdkZ1R1RvaGJI?=
 =?utf-8?B?b3ZWNEFNTDdabmlCRmtNTDZXd3V2bFdwQ3F6K1FvdGlUR2x6YmFYNTBYekow?=
 =?utf-8?B?anFhb2QrSWEvUWxxcTB6ZXdoWkdKdUVnTHVoUWxWTjF3WE1XRUV3T1h1M0xG?=
 =?utf-8?B?b0dHMlpnVFJYSmE5Y0JhTVoybUlidnBZbUhGeHJBMmpZZ0FPWFdKSjZKSzdU?=
 =?utf-8?B?NTFiVFdZOWNjN1dnblNKc3JxRkNibzlkYWJBY0FLTGpFVm5IYUlDTW45YVhD?=
 =?utf-8?B?SkZydUQ0cW5mN3pUZ3BlRXhzQVkxTHM2ODRzVEl3c0MrNVMzeEIrUllHODlE?=
 =?utf-8?B?QUhQRy9TdjhUQ3l3TnNvSFZnVGx2T2VIWU1GTyt5eEwzTEV5Zk1seGR2aFBv?=
 =?utf-8?B?Skkwak1PL3V4RERmS0JBNDl0cHZJN1Y0N3h0R0JSWnJ4d0M1MFdpRUFmSlRH?=
 =?utf-8?B?eG45ZEdSK05GMmc5c2MxWUJyOEtLZzA0dXMwVENzTkxhSmRGcVhVTk5WczZi?=
 =?utf-8?B?SzhsUW5ZMFR5MkJtaDIyYlZjREpKV1hyeDJIemsrVW5FLzRwSWExUG83cjJa?=
 =?utf-8?B?MVEwbElaTXpNSisydExKYnU0K01HMXBKNm1KN1hVL3hqNEtqMHZRMkszdG1n?=
 =?utf-8?B?KzcxY1BNa2F0OE5hSW8yZnhabVJ5K1BRRDF2UGpsSzhxV2liU3F6TFpFWktK?=
 =?utf-8?B?ZWplaUNJNlFiVWhoYXRNSWQyZnpmcEV6MFkzWDdaQ3ExTEZvclRQVGEvbGhl?=
 =?utf-8?B?UFBadXVmalBGZ2k2aEFRV3I1bTRKTllxQzNxcCtKeUhkNmJlQ3hiY3ZpWGY2?=
 =?utf-8?B?MHBQaTVaQTJQenRBQm4xZktNYnNuN1FuUkxWbWdlakRUeE1mdWNMcjhXNVl2?=
 =?utf-8?B?bUF5MjRkOTVOT205TStoa3BWa3V5OXE5aTI5VHhJR3QvSDlGdTBabU9DZlJs?=
 =?utf-8?B?WkxncHdYUzBLeXMwd1FIdmxERWhhWVNydEd3KzRCekRIRXdZYXRSUytkYWpW?=
 =?utf-8?B?SmlaK2RQSDJYeEd3TXNPSTlyRGU3MkZEclg1OGlDVklLM0JzRkdjSXp1WUhK?=
 =?utf-8?B?dVlTS0pYR1Iva1NLSmxKUXQ5UWxqMG1wT3k2RWx1ejZpMU1qQlhFdHgxUW12?=
 =?utf-8?B?M01uZnVncE9ueGJpaGR0OFdvVERvV1JpUmtjbGtERXNuK09lOXNKNCtFSC81?=
 =?utf-8?B?eWRtcVplTjA2Z1had2pacjlhTEJ1MUgySHN2SEZDZmJ5K2twd1ExMEY4MWpq?=
 =?utf-8?B?QWZGeXZTYkVscjJERGI3Tzg2WUNPam5YdWhOaGhFcGx0QXUyMjdrRjVwc3RB?=
 =?utf-8?B?ODQyOWtiK3hZY2tHRnRGaXZvMnlBcEFhM1M4YStBVHJHeU92Y01GWlNrSFVC?=
 =?utf-8?B?cWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a513b7-0a3e-46d1-a530-08dd0638b564
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2024 12:17:58.7362 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqeuG6Bg9mscFXiOTbM2/TNwla3cwGBduaWK+rwFFbcwN3eA7b7yiKOXWtKC6nnY3/w0Pk4LsF/cedfU5Oxa6hV72DTKFNMXzDlE3ZBlfeo=
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
IFNlbnQ6IDE1IE5vdmVtYmVyIDIwMjQgMTI6NTcNCj4gU3ViamVjdDogW1BBVENIIHYyXSBkcm0v
YnJpZGdlOiBhZHY3NTExX2F1ZGlvOiBVcGRhdGUgQXVkaW8gSW5mb0ZyYW1lIHByb3Blcmx5DQo+
IA0KPiBBVURJT19VUERBVEUgYml0IChCaXQgNSBvZiBNQUlOIHJlZ2lzdGVyIDB4NEEpIG5lZWRz
IHRvIGJlIHNldCB0byAxIHdoaWxlIHVwZGF0aW5nIEF1ZGlvIEluZm9GcmFtZQ0KPiBpbmZvcm1h
dGlvbiBhbmQgdGhlbiBzZXQgdG8gMCB3aGVuIGRvbmUuDQo+IE90aGVyd2lzZSBwYXJ0aWFsbHkg
dXBkYXRlZCBBdWRpbyBJbmZvRnJhbWVzIGNvdWxkIGJlIHNlbnQgb3V0LiBUd28gY2FzZXMgd2hl
cmUgdGhpcyBydWxlIHdlcmUgbm90DQo+IGZvbGxvd2VkIGFyZSBmaXhlZDoNCj4gIC0gSW4gYWR2
NzUxMV9oZG1pX2h3X3BhcmFtcygpIG1ha2Ugc3VyZSBBVURJT19VUERBVEUgYml0IGlzIHVwZGF0
ZWQNCj4gICAgYmVmb3JlL2FmdGVyIHNldHRpbmcgQURWNzUxMV9SRUdfQVVESU9fSU5GT0ZSQU1F
Lg0KPiAgLSBJbiBhdWRpb19zdGFydHVwKCkgdXNlIHRoZSBjb3JyZWN0IHJlZ2lzdGVyIGZvciBj
bGVhcmluZw0KPiAgICBBVURJT19VUERBVEUgYml0Lg0KPiANCj4gVGhlIHByb2JsZW0gd2l0aCBj
b3JydXB0ZWQgYXVkaW8gaW5mb2ZyYW1lcyB3ZXJlIGRpc2NvdmVyZWQgYnkgbGV0dGluZyBhIEhE
TUkgbG9naWMgYW5hbHlzZXIgY2hlY2sgdGhlDQo+IG91dHB1dCBvZiBBRFY3NTM1Lg0KPiANCj4g
Rml4ZXM6IDUzYzUxNWJlZmUyOCAoImRybS9icmlkZ2U6IGFkdjc1MTE6IEFkZCBBdWRpbyBzdXBw
b3J0IikNCg0KV2l0aCBhbmQgd2l0aG91dCB0aGUgcGF0Y2gsIEF1ZGlvIHdvcmtzIG9uIFJlbmVz
YXMgUlovVjJMIFNNQVJDIGJvYXJkLg0KDQpUZXN0ZWQtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5q
ekBicC5yZW5lc2FzLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gRWtlbmJlcmcgPHN0
ZWZhbi5la2VuYmVyZ0BheGlzLmNvbT4NCj4gLS0tDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gQWRk
IEZpeGVzIHRhZw0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAy
NDExMTMtYWR2NzUxMS1hdWRpby1pbmZvLWZyYW1lLXYxLTEtNDliMzY4Yjk5NWE1QGF4aXMuY29t
DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfYXVkaW8u
YyB8IDE0ICsrKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2Fkdjc1MTEvYWR2NzUxMV9hdWRpby5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9h
ZHY3NTExL2Fkdjc1MTFfYXVkaW8uYw0KPiBpbmRleCA2MWY0YTM4ZTdkMmJmNjkwNTY4M2NiYzll
NzYyYjI4ZWNjOTk5ZDA1Li44Zjc4NjU5MjE0M2I2YzgxZTVhNDM0NzY4YjUxNTA4ZDVlNWYzYzcz
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9h
dWRpby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2F1
ZGlvLmMNCj4gQEAgLTE1Myw3ICsxNTMsMTYgQEAgc3RhdGljIGludCBhZHY3NTExX2hkbWlfaHdf
cGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4gIAkJCSAgIEFEVjc1MTFf
QVVESU9fQ0ZHM19MRU5fTUFTSywgbGVuKTsNCj4gIAlyZWdtYXBfdXBkYXRlX2JpdHMoYWR2NzUx
MS0+cmVnbWFwLCBBRFY3NTExX1JFR19JMkNfRlJFUV9JRF9DRkcsDQo+ICAJCQkgICBBRFY3NTEx
X0kyQ19GUkVRX0lEX0NGR19SQVRFX01BU0ssIHJhdGUgPDwgNCk7DQo+IC0JcmVnbWFwX3dyaXRl
KGFkdjc1MTEtPnJlZ21hcCwgMHg3MywgMHgxKTsNCj4gKw0KPiArCS8qIHNlbmQgY3VycmVudCBB
dWRpbyBpbmZvZnJhbWUgdmFsdWVzIHdoaWxlIHVwZGF0aW5nICovDQo+ICsJcmVnbWFwX3VwZGF0
ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5GT0ZSQU1FX1VQREFURSwNCj4g
KwkJCSAgIEJJVCg1KSwgQklUKDUpKTsNCj4gKw0KPiArCXJlZ21hcF93cml0ZShhZHY3NTExLT5y
ZWdtYXAsIEFEVjc1MTFfUkVHX0FVRElPX0lORk9GUkFNRSgwKSwgMHgxKTsNCj4gKw0KPiArCS8q
IHVzZSBBdWRpbyBpbmZvZnJhbWUgdXBkYXRlZCBpbmZvICovDQo+ICsJcmVnbWFwX3VwZGF0ZV9i
aXRzKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5GT0ZSQU1FX1VQREFURSwNCj4gKwkJ
CSAgIEJJVCg1KSwgMCk7DQo+IA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiBAQCAtMTg0LDggKzE5
Myw5IEBAIHN0YXRpYyBpbnQgYXVkaW9fc3RhcnR1cChzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQg
KmRhdGEpDQo+ICAJcmVnbWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9S
RUdfR0MoMCksDQo+ICAJCQkJQklUKDcpIHwgQklUKDYpLCBCSVQoNykpOw0KPiAgCS8qIHVzZSBB
dWRpbyBpbmZvZnJhbWUgdXBkYXRlZCBpbmZvICovDQo+IC0JcmVnbWFwX3VwZGF0ZV9iaXRzKGFk
djc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfR0MoMSksDQo+ICsJcmVnbWFwX3VwZGF0ZV9iaXRz
KGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfSU5GT0ZSQU1FX1VQREFURSwNCj4gIAkJCQlC
SVQoNSksIDApOw0KPiArDQo+ICAJLyogZW5hYmxlIFNQRElGIHJlY2VpdmVyICovDQo+ICAJaWYg
KGFkdjc1MTEtPmF1ZGlvX3NvdXJjZSA9PSBBRFY3NTExX0FVRElPX1NPVVJDRV9TUERJRikNCj4g
IAkJcmVnbWFwX3VwZGF0ZV9iaXRzKGFkdjc1MTEtPnJlZ21hcCwgQURWNzUxMV9SRUdfQVVESU9f
Q09ORklHLA0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA1OWI3MjNjZDJhZGJhYzJhMzRmYzhl
MTJjNzRhZTI2YWU0NWJmMjMwDQo+IGNoYW5nZS1pZDogMjAyNDExMDgtYWR2NzUxMS1hdWRpby1p
bmZvLWZyYW1lLTU0NjE0ZGQ0YmY1Nw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBTdGVm
YW4gRWtlbmJlcmcgPHN0ZWZhbi5la2VuYmVyZ0BheGlzLmNvbT4NCg0K
