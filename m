Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C22AC1EEE
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 10:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC19B10E160;
	Fri, 23 May 2025 08:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Nt7owswX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F2510E160
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 08:50:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6yvalE/iyfV3bToe/+0B8yFZhH60asm04471mfCIFpECcdLHtA9utgLua2j8mLRPDsi4FG1DGQdyTqlaYIGREqlUPOLjGg59NqQZ8MtdC/i2+m9CADr6Va5sxNIThlZkcXtdrPYJ8TTRkIg+gCwbO/V64VpzbzPW5g/YJ1sBn1dV+kS4laOn7OHzAzQjCGEgsbsvvrHVBu9cZlP3KYxCYj3TOq4fz1hix/tCNTfIlYmrpRz+biaHf8S95Wsw2ud6JsHDNcjJsRxAbZTbFYzbAb0+6sbDmYC1GonmxM4Mxaj1SFSfs8vd1s0JULVadeFMJjA0aJWVSh0HsmNlJoeyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzec43eRfWk95KXMUvHOznhZaIwDL3QVqojtMiJ3jBg=;
 b=PyMxjISam5zcohsuhLDVkpaBbqZ8gOhAKjAXx0TKbXHV/cqYSFpnDtJUnccPx9jx1wVpiwHy2OVFgF55quSNCWt+tjYlxcqN/ZUCx17uxo8SrwMvMdIL/79BlpDqNRcyqo9QExdpb5Dmn6c8tpuWnc2cl4/vX8zjW5iyIj2LCX5XTRfQh4AZ6Bk55QXvPQv0gFPNGW/Fxdu1FN/GOyh8SIWHm/5DxVDvtpUpgmQpOrhKGyfBfsUU1hxajk0nVXau7Qa0GBZdvI9UP6mY1buxZwoRMXv8nhurSrgQmXXsnvKCMTIcf3rWWF/7UTR1M28TnA+pzb42/uxWQaMLLSi72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzec43eRfWk95KXMUvHOznhZaIwDL3QVqojtMiJ3jBg=;
 b=Nt7owswXthloqwDfyc26IWtAUpAtF/dCmm0SnZCXfZi0Ac5TkG5C2f2WvTbHVqPYMsOPVNEPPxju4+19kr9vuPsN23Tv5keacHaBnIIzeYQXCqpyzPwHKm5M/bt2tvOFci5lo1moE/6/Elz4o/ochhLY1YcMmFnN2MMwkaMxfcE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB10845.jpnprd01.prod.outlook.com (2603:1096:400:29a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 08:50:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.021; Fri, 23 May 2025
 08:50:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJhIENhbmFs?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry
 Baryshkov <lumag@kernel.org>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Adam Ford <aford173@gmail.com>
Subject: RE: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Thread-Topic: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Thread-Index: AQHbxs9ir1hJF42rS02+yM7B24cENLPcIpWAgAOfSiCAAArFgIAAJQHg
Date: Fri, 23 May 2025 08:50:47 +0000
Message-ID: <TY3PR01MB11346B18033508EDAA458C25A8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
 <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
In-Reply-To: <CAO9ioeUf_nQXfP490fDx0Ord55z6EsR+3SOhcee2B-ymewkuCg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB10845:EE_
x-ms-office365-filtering-correlation-id: 096ee3b6-0a0a-4d68-8cde-08dd99d6e975
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UGsvamp2YmNUanQydEhyVkJsRmdDNlF6Zit3TXE1MU5oRnp3RHd5WjFic3Jn?=
 =?utf-8?B?dFZLd3hJNHUvZzhJUEN4NUJNb3JrR3Vzck9tK1hpY3RSMHVGdEs0T1NWRnhu?=
 =?utf-8?B?NUZGLzQ4QmtBNHZ3SWdxWUlzUnFuY3JEWWdVV0d1a05aWG1tSlhPQUtMMno0?=
 =?utf-8?B?SkM3TGREYlVuYWR2cWQ4QnR5a21oUWVTemo0UzQ5WGZJZDNGNTZGYzFVaVhF?=
 =?utf-8?B?ZXlObVFSYXBvUTV4MmNOakFoZXV1b3JWYlpqNDAvMTlIM0pEZ0pVVmJjNVp0?=
 =?utf-8?B?ejNlVjhNMTlnNlVQSjdtanRIaytlQTAvdFoxdU1za1VVejhtdVNRSXQvc2do?=
 =?utf-8?B?dVowWTEzV284anlqUER5aXMzWWQ2NVN4YUlXcXVPWTJWS2VvUE4rMzZwa3V6?=
 =?utf-8?B?WTk1OEpXdXhJTVlHZ1FITzMyRHU1TmNRMC92czl6cHZyRDljZzhITnJDYVc4?=
 =?utf-8?B?MkIvZjl2TkdENU5QTnRXazE1YkpSd3VZd1gvOExqdlZFME9WNkh2NXV4ZGpl?=
 =?utf-8?B?UDVtOWFoUVFGNWRSSi83cWRSRkwvUWduMUcxYlk2L3Y4SnFYS2IrTlN4T1RJ?=
 =?utf-8?B?WTNBWU5JbzhUZGVOTkdQWTlQVUJGUVR5YTdxenhQN25USXA2RzdXcXhlLzNR?=
 =?utf-8?B?Zzd3ckF1Sm1DM25sSjhidlZZWXY0YWxmcjY3bmd1QlpVRmZJZytJeGJhdlgy?=
 =?utf-8?B?Z3k3QzhiWEpNV1Exb2ErMkNoM1lKN1QzVy9ndjZJSG1DQjcwZVhOYnpMeWUy?=
 =?utf-8?B?SXVzNTZPK3RLUnNDdUlpdkFQeCszSzZvRitySTJHMUIvUTV1WTNBN1BxQ1VK?=
 =?utf-8?B?cDJqaXFOM054R2RJSjVCa2ZRZjNJa0kzZC9zMUVqVFBVMnZOQzVjN0JKR01C?=
 =?utf-8?B?RWdqRFN4VjlBSE5nV0FsV3ErK29uTEMyUmZyajhRNjJuU1ZHdXR3VGpRdGpZ?=
 =?utf-8?B?SEhSMTJWeU0zUU9LamQxdzVHQW5UTENaSzJQRHMyeXN3V2YrZjJrbUNacDEr?=
 =?utf-8?B?V2tyQnJLVXBXOHd0M0I2UnEvZXJBWTBjNmVOVmNVa3J2dk5BcHNmbmd2Rms1?=
 =?utf-8?B?VU5hK3BiZ2pWRkpaVTc2bTlKZ3lQUDc0dm1oZFRpYUJGQlZuckhhZmhxSitW?=
 =?utf-8?B?bll1VFhRTlVjaXRRZlkxZlljQU96SXFsQ1VXVURlQTRQQ3FKNUYwSHNOdEwv?=
 =?utf-8?B?dGxDbVlFdUh4RTh5RTFwa090MWNNR01TUGk1UTNVYU03VjFqbkVKSmcya01T?=
 =?utf-8?B?dnZySFFZeVoxNFpxTTdtamxUT05FNk1sQkdpMHhJdXNsTUhIVzRFZ3RYZ0Rl?=
 =?utf-8?B?U0FrQ2lVNkd0enVhcDN3c1hPV0prdnlsTGlBbzdkTW93cFVkRk1xam5vakxF?=
 =?utf-8?B?M3hkQU5paTNjRUVRMWFwbzFsQ2R6TFJIS3RpdXJ1R2Z0NFB3NllTUHpQTnRq?=
 =?utf-8?B?ZGs2c0hUS0Z6Z0lXbzFmaWxXY0JzY0J0dXJzQnJJQ0FodW9ySkRoTDZ6TlFL?=
 =?utf-8?B?VkZjSVZ1eFR6R1dvMlY5WnVyNVJ1WERCSkg0SGNvbHphYVJnelVHdWpsRDVy?=
 =?utf-8?B?Vm1IaWx4c2ZlaGRncGt6bjVTOEE1M2VPclk0LzFkcnVqMGdCYUhMRzdUZ2kr?=
 =?utf-8?B?WFZBd0lQcWFmUmVkNGpyMzFreWRUbUhsWXdycG9UOUF4KytHcWwybWN3VERo?=
 =?utf-8?B?Si9GUEVUdDZuYXBsMEJ5SnBFOTVqdTlSZzhoaUI1TmlXWUl5TlJBQkVyRXVt?=
 =?utf-8?B?SnVjTUdFZWhMbmd0VXMzMDF1R2xPS3dzb1g4UHNXbWdVbGFycnVGY1hwZ0hr?=
 =?utf-8?B?NnZQNkFYNFVlUEpjbVgvYm92NloybVBreXdFZTFSNXdoQWw2QlJLK0dHbkhq?=
 =?utf-8?B?UkdvbFdselhvbzlwTnoyb0p5MDhFWHVETlpIMVo0YS9kaTkyZElPQTlhRVpq?=
 =?utf-8?B?MW1wVkJMbDAycGg5VkpCZGlyU0ZOOHFKYmhhZllvVjZrRk4vR1BTdkRBRlUw?=
 =?utf-8?B?UWxEcnNNMG1BPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2RXano1U2VmVjdvMWRyZWpsNE96ZHhaRVVYQmNUbHRCZDI3UnIrblFYWVRt?=
 =?utf-8?B?bHd6M0dPalQ2TUpQb2F1SC9RL01FNEVlMXkwK2dLSURZQjZUdnRSMTZHVWc2?=
 =?utf-8?B?ODFCK1A0WUxsT0ZFamhCYW8zOTZnRDY5S1FZV2FQWjVEdFU1V0crZXVtUEdZ?=
 =?utf-8?B?TloxQ05MTklXMFA0azIxdUI1NVlCZGo4dENkWDVibk1ZK3FNZkZOTWEvSXR1?=
 =?utf-8?B?MVRsS21DZG1td1YrZ254MkRsZEF5U0JuYkpKU01aejRwV3UyZWxIVWZNZmQx?=
 =?utf-8?B?UGdJTU5TRlEvRmFyVXg3WDFXaWtmYkhwclZDRTR1bk5OTGhMQTVaUWxKUVY1?=
 =?utf-8?B?Y3IxU21nWVgyMlhlSkdTWkNhcWJqMFdCNDg2dExuZ0V5SDBsQnV2QmcyZnZy?=
 =?utf-8?B?cmg2dVArTmRUQ1lONGh5UzBpeldQMXRZYThJZ3hHcW11RXBXMUhxTERRZU9t?=
 =?utf-8?B?Qzg4RDVvZjBlVWNDMUVYSXcrRWU0dUNNWkJKbkNSZCtYS0ZRMHBtZHVrNkxT?=
 =?utf-8?B?VWVLS2RhWGRBbUdUZjk5SW55cU5rRTk4MGQzOTV2Wm83dTVDZW1Ea01KMWRU?=
 =?utf-8?B?M0kwbTdtbEkxczV4NjN4bDBHUllMZENWQ0h6Q21PbWtsaFd5VG9vTHRFQmk3?=
 =?utf-8?B?UHVqL0g3eGQ5Qi9ubUpONXV6QlAyK1o5RGhCbkw1bExIMjdsVnNaYnFLcmZu?=
 =?utf-8?B?Um9jalNmTjBQZDlsRUFsTVEvaS9jWm5OY096WTR3YkhrVk5pclFhTTdNTXl1?=
 =?utf-8?B?RlJJM0ovZ3VNei85ZlpDMVlIcDE0UXVEMldMK3ZqMnVzR05pRjJ4MzJLaTIy?=
 =?utf-8?B?VTlvNkdOSHcvaU1wUkJmcVBQYVhlYXhnK2JlcmVOb2xoa1dyQnBnd2t5YWFL?=
 =?utf-8?B?emZvZWsrVzZBZzFxbWJXQkxDanRMMWVGNTh6S1FRWGpYTzkreXE2UFBHRUR3?=
 =?utf-8?B?R1hSeVZyUFRzLzhoTVEydEh5V2FjdnBGcE9lQ3ExZzl1bXpmdkNxdVJsNlpz?=
 =?utf-8?B?OUhLQUIyZktwaTdBenJVM3ZWL2V3ZEptbWpzYytzRWJ5N2VMWmFWdmFRdlhj?=
 =?utf-8?B?Wlg1YWdWL1NpVHRPa1lIZnlkTXJQdXg0aGlTeURrMUhtVS9qTEZwdndLVjVT?=
 =?utf-8?B?bmgwL3hCWVM0dWdZMi9kZlBnMnBpTXRZUndqRG9ZMlUrMFRydzNTNVcyMm50?=
 =?utf-8?B?bVpxVXhacEdMTHZ0VWNhUWpSQTJGQXNxeFVRTXpIcFk1YzRyNUp0QS9Idmw0?=
 =?utf-8?B?bnlnZHlxUDNDdW11b0dmVFJuSXNYZ2lycjk2R2xGakNlczFvYm16amVhbExU?=
 =?utf-8?B?ZU5zeEdSUDhhSGhQSUtGRDR5WndEdGhkODRmR211MjRqcGZydVdadDNXWkhn?=
 =?utf-8?B?eW1QVFd0c3NzZmt2djdiOGFmSDBPRkJZQ0xhQ1BDNXR4WkxlRnZTbGZMTnM1?=
 =?utf-8?B?aFRCc29ybDNWb1I4bS9QejBTQi8yTXY1cDJ4K3JOSHBxMzkxNkl6RVlUckc2?=
 =?utf-8?B?NmlIcWViaHZnSkxsYS9WeGtVS0lvUlNoajlBYmtSSlZOVzJOY2VwYVRFMmdZ?=
 =?utf-8?B?aDh0d3JOejJtT0pGWUFCMHZTbFp2Y3BnV1BlTFFDMlhubTYyR2g2Wkw0M1pt?=
 =?utf-8?B?MkRWZWV1c0VrbGM0L040WDFuQkpGVVF4Qis3OHJyQm00S3A1N0QrVzdBeGtv?=
 =?utf-8?B?T0JMTkU5UkNoQ3d6WlNFdWo2UHdQYWJzZFAwbmx3ZEZ2WUdYR3lWRU9TcTBM?=
 =?utf-8?B?Wk5pY3M5clRyckd5Z3cwMDZoSUtDWUNPTGlpSVBqNFhLWGRrOWtiUU9yYWVk?=
 =?utf-8?B?MDlEV3dVOGVPYVlNRW54VGtwSGNxeFF4d3d1WC9KMG1ZVHRld0kwL0pLVlNX?=
 =?utf-8?B?VFRocE9KdENvV05ySXZCZ0RuTGFoVmIyeUJtdkppRkNXQXpMSGZLZVM4YllF?=
 =?utf-8?B?Y0E2U0YyQjRjb2FrQ21wMlhqZVcycXIzb0JiZDdVdW5qaWVIQnZUYk8zd3g5?=
 =?utf-8?B?TEhQcVVpU0VGQVNtMkFEQUZ5UDFCSW50NEE4ZExHNGY1UWQyTWNQSjVGKzhs?=
 =?utf-8?B?dHB6QndiRmxTc0VGZ3FWaVVPbCs3cVljZlJlNnVVcW1HdkVKWGVOaU5nVnZV?=
 =?utf-8?B?U29QTVBMWU1vQm9WOXBZejllTy92QU83clFHRk04WEZXaFNRNDJtZFprYi9y?=
 =?utf-8?B?a0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096ee3b6-0a0a-4d68-8cde-08dd99d6e975
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 08:50:47.4859 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+/AKrxA3mdo5s18CmpsI5x2dwUcOLhPlh3aKsLE50CadBzx54wGA0CsL5YHlMn2FLCZ0uvLFdrFBsb0c9QLjc7YJ7baLW/tLr/V/Uc/Qy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10845
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

SGkgRG1pdHJ5IEJhcnlzaGtvdiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+
DQo+IFNlbnQ6IDIzIE1heSAyMDI1IDA3OjM3DQo+IFN1YmplY3Q6IFJlOiAoc3Vic2V0KSBbUEFU
Q0ggdjYgMDAvMTBdIGRybS9kaXNwbGF5OiBnZW5lcmljIEhETUkgQ0VDIGhlbHBlcnMNCj4gDQo+
IEhpIEJpanUNCj4gDQo+IE9uIEZyaSwgMjMgTWF5IDIwMjUgYXQgMDk6MTcsIEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBEbWl0cnkgQmFy
eXNoa292LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgc2VyaWVzLg0KPiA+DQo+ID4gTG9va3Mg
bGlrZSwgQWZ0ZXIgdGhpcyBwYXRjaCwgd2hlbiBJIGNoYW5nZSByZXNvbHV0aW9uIHVzaW5nIG1v
ZGV0ZXN0IGl0IGlzIG5vdCB3b3JraW5nLg0KPiA+IE1vbml0b3IgaXMgc2hvd2luZyBvdXQgb2Yg
cmFuZ2UvTm8gc2lnbmFsIG9uIFJaL1YyTCBTTUFSQyBFVksgY29ubmVjdGVkIHRvIEFEVjc1MzUu
DQo+ID4NCj4gPiBOb3Qgc3VyZSwgSSBhbSB0aGUgb25seSBvbmUgZmFjaW5nIHRoaXMgaXNzdWU/
DQo+IA0KPiBJIGhhdmUgYmVlbiB0ZXN0aW5nIHRoZSBzZXJpZXMgb24gZGI0MTBjIC8gYWR2NzUz
MywgYnV0IHNvbWV0aGluZyBtaWdodCBoYXZlIGNoYW5nZWQgYmV0d2VlbiB0aGUNCj4gdGVzdGlu
ZyB0aW1lIGFuZCB0aGUgcHJlc2VudCB0aW1lLiBJIHdpbGwgdHJ5IGNoZWNraW5nIGl0IG5leHQg
d2Vlay4NCj4gDQo+IEluIHRoZSBtZWFudGltZSwgeW91IGNhbiBwcm9iYWJseSB0cnkgY29tcGFy
aW5nIHdoYXQgZ2V0cyBwcm9ncmFtbWVkIGluIGFkdjc1MTFfbW9kZV9zZXQoKS4NCg0KU3VyZSwg
V2UgYXJlIGxvb2tpbmcgaW50byB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+ID4NCj4g
PiBNb2RldGVzdCB3b3JrcyBmaW5lIHdpdGggNi4xNS4wLXJjNi1uZXh0LTIwMjUwNTE2LCB3aGVy
ZSB0aGlzIHBhdGNoDQo+ID4gc2VyaWVzIGlzIG5vdCBwcmVzZW50Lg0KPiA+DQo+ID4gQ2hlZXJz
LA0KPiA+IEJpanUNCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYNCj4gPiA+IE9mIERtaXRyeSBCYXJ5c2hrb3YNCj4gPiA+IFNlbnQ6IDIwIE1h
eSAyMDI1IDIzOjQwDQo+ID4gPiBTdWJqZWN0OiBSZTogKHN1YnNldCkgW1BBVENIIHY2IDAwLzEw
XSBkcm0vZGlzcGxheTogZ2VuZXJpYyBIRE1JIENFQw0KPiA+ID4gaGVscGVycw0KPiA+ID4NCj4g
PiA+DQo+ID4gPiBPbiBTYXQsIDE3IE1heSAyMDI1IDA0OjU5OjM2ICswMzAwLCBEbWl0cnkgQmFy
eXNoa292IHdyb3RlOg0KPiA+ID4gPiBDdXJyZW50bHkgaXQgaXMgbmV4dCB0byBpbXBvc3NpYmxl
IHRvIGltcGxlbWVudCBDRUMgaGFuZGxpbmcgZm9yDQo+ID4gPiA+IHRoZSBzZXR1cCB1c2luZyBk
cm1fYnJpZGdlcyBhbmQgZHJtX2JyaWRnZV9jb25uZWN0b3I6IGJyaWRnZXMNCj4gPiA+ID4gZG9u
J3QgaGF2ZSBhIGhvbGQgb2YgdGhlIGNvbm5lY3RvciBhdCB0aGUgcHJvcGVyIHRpbWUgdG8gYmUg
YWJsZSB0byByb3V0ZSBDRUMgZXZlbnRzLg0KPiA+ID4gPg0KPiA+ID4gPiBBdCB0aGUgc2FtZSB0
aW1lIGl0IG5vdCB2ZXJ5IGVhc3kgYW5kIG9idmlvdXMgdG8gZ2V0IHRoZSBDRUMNCj4gPiA+ID4g
cGh5c2ljYWwgYWRkcmVzcyBoYW5kbGluZyBjb3JyZWN0bHkuIERyaXZlcnMgaGFuZGxlIGl0IGF0
IHZhcmlvdXMNCj4gPiA+ID4gcGxhY2VzLCBlbmRpbmcgdXAgd2l0aCB0aGUgc2xpZ2h0IGRpZmZl
cmVuY2VzIGluIGJlaGF2aW91ci4NCj4gPiA+ID4NCj4gPiA+ID4gWy4uLl0NCj4gPiA+DQo+ID4g
PiBBcHBsaWVkLCB0aGFua3MhDQo+ID4gPg0KPiA+ID4gWzAxLzEwXSBkcm0vYnJpZGdlOiBtb3Zl
IHByaXZhdGUgZGF0YSB0byB0aGUgZW5kIG9mIHRoZSBzdHJ1Y3QNCj4gPiA+ICAgICAgICAgY29t
bWl0OiBmYTM3NjllMDliZTc2MTQyZDUxYzYxN2Q3ZDBjNzJkOWM3MjVhNDlkDQo+ID4gPiBbMDIv
MTBdIGRybS9icmlkZ2U6IGFsbG93IGxpbWl0aW5nIEkyUyBmb3JtYXRzDQo+ID4gPiAgICAgICAg
IGNvbW1pdDogZDlmOWJhZTY3NTJmNWEwMjgwYTgwZDFiYzUyNGNhYmQwZDYwYzg4Ng0KPiA+ID4g
WzAzLzEwXSBkcm0vY29ubmVjdG9yOiBhZGQgQ0VDLXJlbGF0ZWQgZmllbGRzDQo+ID4gPiAgICAg
ICAgIGNvbW1pdDogZTcyY2Q1OTdjMzUwMTIxNDZiZmU3N2I3MzZhMzBmZWUzZTc3ZTYxZQ0KPiA+
ID4gWzA0LzEwXSBkcm0vZGlzcGxheTogbW92ZSBDRUNfQ09SRSBzZWxlY3Rpb24gdG8gRFJNX0RJ
U1BMQVlfSEVMUEVSDQo+ID4gPiAgICAgICAgIGNvbW1pdDogYmNjODU1M2I2MjI4ZDAzODdmZjY0
OTc4YTAzZWZhM2M4OTgzZGQyZg0KPiA+ID4gWzA1LzEwXSBkcm0vZGlzcGxheTogYWRkIENFQyBo
ZWxwZXJzIGNvZGUNCj4gPiA+ICAgICAgICAgY29tbWl0OiA4YjFhOGY4YjIwMDJkMzExMzZkODNl
NGQ3MzBiNGNiNDFlOWVlODY4DQo+ID4gPiBbMDYvMTBdIGRybS9kaXNwbGF5OiBoZG1pLXN0YXRl
LWhlbHBlcjogaGFuZGxlIENFQyBwaHlzaWNhbCBhZGRyZXNzDQo+ID4gPiAgICAgICAgIGNvbW1p
dDogNjAzY2U4NTQyNzA0M2VjYjI5ZWY3MzdjMWIzNTA5MDFjZTNlYmYwOQ0KPiA+ID4gWzA4LzEw
XSBkcm0vZGlzcGxheTogYnJpZGdlLWNvbm5lY3RvcjogaG9vayBpbiBDRUMgbm90aWZpZXIgc3Vw
cG9ydA0KPiA+ID4gICAgICAgICBjb21taXQ6IDY1YTI1NzVhNjhlNGZmMDNiYTg4N2I1YWVmNjc5
ZmM5NTQwNWZjZDINCj4gPiA+IFswOS8xMF0gZHJtL2Rpc3BsYXk6IGJyaWRnZS1jb25uZWN0b3I6
IGhhbmRsZSBDRUMgYWRhcHRlcnMNCj4gPiA+ICAgICAgICAgY29tbWl0OiBhNzQyODhjOGRlZDdj
MzQ2MjRlNTBiNGFhOGNhMzdhZTZjYzAzZGY0DQo+ID4gPiBbMTAvMTBdIGRybS9icmlkZ2U6IGFk
djc1MTE6IHN3aXRjaCB0byB0aGUgSERNSSBjb25uZWN0b3IgaGVscGVycw0KPiA+ID4gICAgICAg
ICBjb21taXQ6IGFlMDFkMzE4M2QyNzYzZWQyN2FiNzFmNGVmNTQwMmI2ODNkOWFkOGENCj4gPiA+
DQo+ID4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gPiAtLQ0KPiA+ID4gRG1pdHJ5IEJhcnlzaGtvdiA8
ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPg0KPiA+DQo+IA0KPiANCj4gLS0NCj4g
V2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==
