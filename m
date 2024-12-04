Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 839DB9E3389
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 07:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDCE810EC03;
	Wed,  4 Dec 2024 06:27:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="k1LsMKSL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60A7410E274
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 06:27:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foM6fuMcbR2jmD68/VWE8V8ofPm09lwXCm4lADP+Gmo9S7JV6AnAQ4w3Vp7AHtS2tE6aENizC8Us/bX/Omdi9QGFjIm+45Xt+mKUArtnZ8nvb6RzFu23Tm4RmBGFE3JScnIL9G0UAmMCPuD0KdCpFBQVyydn5lVFN9xrYtyR7DVZ6NlOT85yaR7alp9z1A0bo8VQBO27NMaQrASEi1i8/CiVwAaxgd0cj3txrLZD+IYNSj9Lx9Oik3dnDd7zKuShwOM+1wVuUAH8CqoOOZVm4FCGRGWKNkSZBX1N01Gu3pbaWEPoUsKwraqZ/3Mg8fU4pD/QcN/yHE0YWa+bwf4VCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjcraNzZV6kDQ7nCQfrCtY2L5F2vX4/8eVva3XOkvyw=;
 b=wPvZdXfeJLr4BRd5KbUpC/4+Dv/cLHYvpZG+gUSJMJCWjT/ad40K2NLYDtfeza4JnrmRtBu93eG1yTpZzokIVe4kSg3f0yXbYwxTT5q7VVyEKmRZsYa46nJjVdgyko9HDn/M0mLCuM9Vz4oFnqsSkHkWtKxwrTpt4++wz3IOqTVpWwgz10qq6yvJSWhsjKyDir7zVaz8nxd7BgnDpWHUMcbbUYU2KOTr/Sh3PKGcQmEo6FUBUJMaw1qRfmL/s6czjhPYPqkpTFrCKYDTMkwUDPepWRyVQ1I8km7SWKE9UJPF8oBD9T4sFdB8wndGd7Ry3XE1CA7+eEOjynN4DJ9eqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjcraNzZV6kDQ7nCQfrCtY2L5F2vX4/8eVva3XOkvyw=;
 b=k1LsMKSLKxFmyKynAT89Z3bXiGb7H/d47PgXNpKD61qgUGJbyhMzxJWjUXCsFmzTz/vzr9hCY3lH1sfLOdgiQdLVSEx2NW4Mf75khN1cYIoYMlF+/CR8YJGU9qXQi8/vRAN/S0pAUxu14SYAsaGPF72Z+g76MXYZIlaOdGfb6p8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6054.jpnprd01.prod.outlook.com (2603:1096:604:d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 06:27:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Wed, 4 Dec 2024
 06:27:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "tomm.merciai@gmail.com"
 <tomm.merciai@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tommaso
 Merciai <tommaso.merciai.xr@bp.renesas.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Topic: [PATCH] drm/bridge: ite-it6263: Support VESA input format
Thread-Index: AQHbRafhYhDs5vdfJ0a+HUDeBItd1LLVb4KAgAAuaPA=
Date: Wed, 4 Dec 2024 06:27:51 +0000
Message-ID: <TY3PR01MB113464084E6020F0B138ABD2886372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241203172129.778123-1-tommaso.merciai.xr@bp.renesas.com>
 <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
In-Reply-To: <834a2690-ca06-4a8b-9a81-c4981074f95c@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6054:EE_
x-ms-office365-filtering-correlation-id: 87cb4c0f-a3b6-4c9b-0873-08dd142cc768
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?S2tWZDBLd3AvbENmMzFoMGVLMmF6YWttdkVHVDkzZ1RCdjA5anJwenJhRjhF?=
 =?utf-8?B?VWZUM09Za2hFN1VXaXczSXEyU1U5RlRrUU14YlRSdEMyaE05enFReTJkMUlv?=
 =?utf-8?B?SmE4ZWlwZlY5eEhKeUNVeUVBTk9HVk9PRkVBQThOQUNGSkgrU1VUVmIzakJ6?=
 =?utf-8?B?NEZSRW5JaTE3OVlFeGo5UnBBZytET3ZGc20xZnh1ZitaRmlwUGJPbUFzV3JJ?=
 =?utf-8?B?VG9UR3FaNllzckl3RVNreE9zaEZZWmlFTzNYL0xmYTN2TkNVcVhNS21tL3ll?=
 =?utf-8?B?aGNTbGpVaUhpRkRSZVlnbnEwYjdoZ1AybjdMd3RGNUNPZ1RFTUs1WExWWENI?=
 =?utf-8?B?WVJuQjJkcEE0WlBkNmdKaWYxMUJkNDVxUU5mSk51aWpFUXRTdVFSUjlua01W?=
 =?utf-8?B?MVhXVno1WWlYa3ZsNmtHSGFSWlMzTzZvTmo0L2FwRmxKRWZpTWlEWVZNZ2tY?=
 =?utf-8?B?MVUzc0Zjek5FZDJDdFJIZ1ljMWZ5amIrc1JpMUZ5NG1wNHVWNUZ5YmVwVDVS?=
 =?utf-8?B?RGQ3eVpMTFRLek55ay9tQ0lMMTBzOWs1ckF3NWZlYUlkZHk2dG4xbyttb1lO?=
 =?utf-8?B?cEloRHVzalZnWDNlM1d4b2tFWHFEeEFUS0ZBcE9rRlB6dUhLR1c5Snpjc2ZW?=
 =?utf-8?B?WSttcEhtUjkrZHJueW1wUDRzY3M4YTVDZHROd3RwdEVibkVlQ25nZlpjK3RE?=
 =?utf-8?B?RnBkby9oNzdRaENPdDZ1UGdLbEZXNlFzQUlXVmdnRWN4REFNYk5RNjFYL2lM?=
 =?utf-8?B?K0JBczd2SE1zYVdlWGNVRUlFVy9kVzdqMzlEeWsreVJOVVA1Vktid3JneVVY?=
 =?utf-8?B?azFMdXlrVTM3ejFxRmRMVlM3L1hKNTRwcW9wbWxOMU1jZ0xmeUxUQnhqSEI0?=
 =?utf-8?B?OFdRYXVrUTFhelJtcUtBbklYeGdqVDBwbFdzOW5qT3pmeEJJWE5tNWhIUm5F?=
 =?utf-8?B?MFBNZG82ZW1MZUtqeGRpTDFXQ0JwSzg1VHJFU0lwcWltZ1pSODNyWUdKbnQz?=
 =?utf-8?B?YmFqY2svWTltWitnQ2dqenNhejRicjk3aVhVc0N5R2tta2RsbEVhSUpubnpM?=
 =?utf-8?B?R2IzRzhNb2xsOUx4bGtKN2dCVDdIT21VNXNqT21iWGtxaFAxYjJGTnpsYVRs?=
 =?utf-8?B?WW1zSFhydnpNRFdpanZIQVRzRG5kN0NLcWVHRkhET09xTHRnNEZlR2NOYXg2?=
 =?utf-8?B?TnFxbGY1R0ExYm90OERvWlRMbzZtVVhjdlpYOSticUZTekMvRlFML3Fhc09o?=
 =?utf-8?B?RnFiQ0hCNGxOZXVuVXgrNHovRGd5NEtuWHF2MWhDUTcxVG05d24rcGRCYVFT?=
 =?utf-8?B?eHB6dG5NZFZXdUtCTE1QS0R2eFdMdFBVNFowMlpJc1Y2ajVpNjNwU0hWc0c3?=
 =?utf-8?B?UDNYeFllblRJMk92dnJCZGVkWGdIeVVMd1Zoc1piNkVYKy8zRTZTd1l3bUhO?=
 =?utf-8?B?WFkyTElJUHB4Uk40M2JIbzN1UGcxWW4zdWpDQ1krL1pwUFU5SmU5U0luTklR?=
 =?utf-8?B?Rnl4Qk5OZk8wOHNvZHIzTWdRMXNXWUx5enYvclkrNStPY2laUFpMTHFoVGdM?=
 =?utf-8?B?QTJWTTJTWUNMMkg4ZnBNRmI5U0NHZnNFbzFFNlJha2VVd1ovNEpoL1ZMM1hJ?=
 =?utf-8?B?RldPVWRTMU16SGxHRm9HdDNUOWtKL3VHZ0Y3RzJjcXdrRWtVdi8rYWMvbUw1?=
 =?utf-8?B?YW1LTWlwQktRM3M0QjIzZVZzc3h0RE13S3NmWDZSclpZbHU1TzVnc20raCtP?=
 =?utf-8?B?T0Z5QTMvNDlXSkJSQUU5eW85ZTdyWjlHNHJKcGNkaTY2MkgrYTlBVGZ0YVlQ?=
 =?utf-8?B?aTlFZ0REMXR1cjVXY0tEdWJuT083ZjZ6ek5ZRTZrbFpHSUxlbDYxeUJHbEhN?=
 =?utf-8?B?Nm45MGo0Q3RmSHk1WDNMM2ZhMStwVStPb051YlRMc0c4VGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXV3c2F1aEE2ZGlhZnpFNnY1Y0JVSU1VQUQ0Q01Td1ptRE83OUtlMVpaUS9u?=
 =?utf-8?B?djJsVWZMeXZXMnhId0VqNVNHT1ZwUDV5WFFJYm5OdzhUMnBLSXFzV0ZTbldn?=
 =?utf-8?B?d0NFcjIyM0EwOWFXbXRURUhPdXhjTFVCdnovNUJERlZTcU43QWIrOGtENmdH?=
 =?utf-8?B?azdqbFZPM0E4WDFsUDJscGtIQ0FlbC9ia1MvdFFNZXgrOHZMTDFIUXpiVk5n?=
 =?utf-8?B?ZEp0L1QxQzZMNkdNMnJRWXZ2U0VyenhoRXVaSDY1aHJxMTJzSjJESitubTk1?=
 =?utf-8?B?L1FiYW56UFJZWnZYOVdWdTViTEI2N1BWM2VvaUw4T3UrbkMvTHQ0RHlueEp3?=
 =?utf-8?B?d3hYb2VxZHB0R1RudG1xUXZkOXg0K0NOUnJCYWh0M2FMdFpWRUZYQy8yWVMy?=
 =?utf-8?B?VjlGWHN5T3IxeUk3TG5PdHQ0RXpzSHN5bmVkcnhRV24yd09xRkJtQWlFdUVP?=
 =?utf-8?B?Uml4eWhjc2djMGcxY1ZlSzkycHFNTlJiYjJEeDk3WERNT0MxU2lDejcxWDFP?=
 =?utf-8?B?N1BXZTlQeWVXMUp2QWdDaGJiNmVUQWR4STdMUnVUaXNJb1hDOFFiT1gzL3hv?=
 =?utf-8?B?UEowNW90Mkkrd2wrTndSS2IyQU0vcXplVGt3OE1EMTIvTVpDeUdBRDRWUkUw?=
 =?utf-8?B?NGZTdVdIdkU0QVpYUW1BUTdzdmJtZmJUREZEZ3pWN1BoUnRNWlZNendma1pG?=
 =?utf-8?B?eCtUMTlFVFY3endrc3JQQmZ3SnpXYUszdWxWVGJ3bmVRdXRGdmZrVDJGcVMz?=
 =?utf-8?B?U3BVL05meXlkeWdnRFJQTGVSN2d6T2ZKeWN1Tm1nTmNLV0RpYlc3djlhRWkz?=
 =?utf-8?B?cWVLalJvWjFJK3dsdER6SjJKaWM5YUk1R1Vldlk1WHd2STdrYXNIdVlqVjZP?=
 =?utf-8?B?T092ZjYrYjloazJaRmdPSzRXVnBhVDkzVXpDN0xOeXJSUDZEaTNWdUM5eno0?=
 =?utf-8?B?S2dYbXBpTGVqbzkrZ01oRjQ5N1loK3RGbUtnUEdHcTZUbzVKOUtKSUVCR0dD?=
 =?utf-8?B?U3VFaVd5cjVnSkU4aTJyb3Z1anRkMm8ybnBMNXdRcFRZUVY5NHN4NjV1ZTdx?=
 =?utf-8?B?c1cwWUpGbkozVGlZNGNQaXVkWUZGeGluTlNMOXRJbjdTejBVT0JYdXRSUFpJ?=
 =?utf-8?B?Z0d2ZFU2NE9icEtUK2ZNUUlEU1lJbm5KQld1aFNCWTFrWHFndlJ3dU5CMG53?=
 =?utf-8?B?MmlLY1FsVDh5NFQ3SWp1NFFmdHp1RGU3ZzRFZ3JWUGo3T0RXRjdRaEFHMkRv?=
 =?utf-8?B?VFlwU0ZwMDNXRWZLb1oxV3FXcTdTTDVmQzF6THlKY2lGTHJJZG9UQkc1Szdq?=
 =?utf-8?B?ZVMyeUhxaWlrOVBoTzB3aml0eU1TdTNIU1d1aDBUMTljQU40ZWxrMENBU0Qv?=
 =?utf-8?B?d2VxRU1URmdWMVZ2RXlTT0I4dCtkUzNRK0xkQWt1UjdSTDdSdnRsV0FRd1Rt?=
 =?utf-8?B?OW84aUxFY2tqTVVGK3pydEx6RTJuTklHcW9YMFhpY0ZvQnh6RzZVVmd5MnRk?=
 =?utf-8?B?QUVKbEl3VFBRMVJndktmWWtYalpnYXRLdXoreEcyUGN3cTZLcUpOK1QvZ3pX?=
 =?utf-8?B?RFZueTBVT09TUWx0TTEvWjFad3l3MUhxSzRyQmdJaW5uTEl0SEF2NVlPYW1I?=
 =?utf-8?B?S3FVVUgxd1BTMzhZRllvMVpVeVA1TTVzd0xuUXEyL2lyMkg2dWJFa2tZL1E1?=
 =?utf-8?B?TUs2L3Z1aWg1djV5dDl0VldtUG9tZHNoUzFqK1FlaSszQm1PLzRkc3FZTk9W?=
 =?utf-8?B?UGVGWm9VRnlvR2xHNkM0TW96TkszSWFlQndCY3k1SHJuY2tvTVorenROQXox?=
 =?utf-8?B?T0RaVlM0U1FyU0JWUnZCTWlCZWEvMkpjQ25DWmlobXU3Q0o3cG1ISDV3TVFm?=
 =?utf-8?B?WGs0Q1V4M3NtV2F0c0YwMFhVaFprTUUvRUlmdmFrYU92MHMyeDhuRDBHZ0Fh?=
 =?utf-8?B?eCttejg4aVZXSmFyT0lwSnNhM2xyV2lPbFErUzJSYjlXcFAzWmVjMGRNZjhn?=
 =?utf-8?B?K2lvOU9tUmluVGpVTjBNOWpkcll2bUw3elUvVC9yZUhDZ0N1TXhlcnJEdFU5?=
 =?utf-8?B?R0RrUWZEaHpyVjFQUDFJNGlMNFEzbisySldSNXZXWUpjcU5kY0F4aWFWRDdn?=
 =?utf-8?B?ZFRGOEEzRkN4NUNBWTNBWGtkdFlMRUQ3TStPRFBBYk9vUXVCNnVKNnFDckd2?=
 =?utf-8?B?cHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87cb4c0f-a3b6-4c9b-0873-08dd142cc768
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 06:27:51.2972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sediIbEtOUh5arJFcJAqElW5dwG1y+xgeQ5d08HbDsfofpLRHtqAM8k3UeBpdjwWGBlcTxK7i7bjg2fXR0qDTM8jgV65k5ZwP1l8Rf+1SBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6054
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

SGkgTGl1IFlpbmcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGl1
IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gU2VudDogMDQgRGVjZW1iZXIgMjAyNCAwMzoz
NA0KPiBUbzogdG9tbS5tZXJjaWFpQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBk
cm0vYnJpZGdlOiBpdGUtaXQ2MjYzOiBTdXBwb3J0IFZFU0EgaW5wdXQgZm9ybWF0DQo+IA0KPiBP
biAxMi8wNC8yMDI0LCB0b21tLm1lcmNpYWlAZ21haWwuY29tIHdyb3RlOg0KPiA+IEZyb206IFRv
bW1hc28gTWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+
ID4gSW50cm9kdWNlIGl0NjI2M19pc19pbnB1dF9idXNfZm10X3ZhbGlkKCkgYW5kIHJlZmFjdG9y
IHRoZQ0KPiA+IGl0NjI2M19icmlkZ2VfYXRvbWljX2dldF9pbnB1dF9idXNfZm10cygpIGZ1bmN0
aW9uIHRvIHN1cHBvcnQgVkVTQQ0KPiA+IGZvcm1hdCBieSBzZWxlY3RpbmcgdGhlIExWRFMgaW5w
dXQgZm9ybWF0IGJhc2VkIG9uIHRoZSBMVkRTIGRhdGENCj4gPiBtYXBwaW5nIGFuZCB0aGVyZWJ5
IHN1cHBvcnQgYm90aCBKRUlEQSBhbmQgVkVTQSBpbnB1dCBmb3JtYXRzLg0KPiANCj4gaXRlLGl0
NjI2My55YW1sIHNheXMgSVQ2MjYzIHN1cHBvcnRzIHZlc2EtMjQgYW5kIHZlc2EtMzAsIHdoaWxl
IHRoaXMgcGF0Y2ggYWN0dWFsbHkgb25seSBhZGRzIHZlc2EtMjQNCj4gc3VwcG9ydC4gIFNvLCB0
byBiZSBtb3JlIHNwZWNpZmljLCB0aGUgcGF0Y2ggc3ViamVjdCBhbmQgY29tbWl0IG1lc3NhZ2Ug
c2hvdWxkIHJlZmxlY3QgdGhpcyByYXRoZXINCj4gdGhhbiBjbGFpbSAiU3VwcG9ydCBWRVNBIGlu
cHV0IGZvcm1hdCIuDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVG9tbWFzbyBNZXJjaWFp
IDx0b21tYXNvLm1lcmNpYWkueHJAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBDYW4geW91IHBsZWFz
ZSBzZW5kIHRoaXMgcGF0Y2ggd2l0aCB5b3VyIFJlbmVzYXMgZW1haWwgYWRkcmVzcyBpbnN0ZWFk
IG9mIEdtYWlsIGVtYWlsIGFkZHJlc3M/DQo+IE90aGVyd2lzZSwgYWRkIGEgU2lnbmVkLW9mZi1i
eSB0YWcgd2l0aCB5b3VyIEdtYWlsIGVtYWlsIGFkZHJlc3MuDQoNCklmIEkgYW0gY29ycmVjdCwg
eW91IGNhbiBjbGVhcmx5IHNlZSB0aGUgUmVuZXNhcyBlbWFpbCBhZGRyZXNzIGFmdGVyIHN1Ympl
Y3QuDQpTbywgdGhlIHByb2NlZHVyZSBmb2xsb3dlZCBieSBUb21tYXNvIGlzIGNvcnJlY3QuDQoN
CllvdSBjYW4gdXNlIGdtYWlsIGFjY291bnQgZm9yIHNlbmQgcGF0Y2gsIGJ1dCB5b3UganVzdCBu
ZWVkIHRvIGFkZCBGcm9tIHRhZyBhbmQgU29CIHRhZw0KYWZ0ZXIgc3ViamVjdCB3aXRoIGNvbXBh
bnkgYWRkcmVzcy4NCg0KUGxlYXNlIHNob3V0IGlmIGFueW9uZSB0aGluayB0aGlzIHByb2NlZHVy
ZSBpcyB3cm9uZy4NCg0KPHNuaXBwZXQ+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0vYnJpZGdl
OiBpdGUtaXQ2MjYzOiBTdXBwb3J0IFZFU0EgaW5wdXQgZm9ybWF0DQoNCkZyb206IFRvbW1hc28g
TWVyY2lhaSA8dG9tbWFzby5tZXJjaWFpLnhyQGJwLnJlbmVzYXMuY29tPg0KDQpJbnRyb2R1Y2Ug
aXQ2MjYzX2lzX2lucHV0X2J1c19mbXRfdmFsaWQoKSBhbmQgcmVmYWN0b3IgdGhlDQo8L3NuaXBw
ZXQ+DQoNCg0KQ2hlZXJzLA0KQmlqdQ0K
