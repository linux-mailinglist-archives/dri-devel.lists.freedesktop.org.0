Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F758B2781A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 07:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD8B10E8D9;
	Fri, 15 Aug 2025 05:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a0oCzR7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011032.outbound.protection.outlook.com [40.107.74.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1E110E8D9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 05:11:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjETwrEsC/JGUmkiv7KMq5sdp7MfQyV8AWb8DP4pE+UhaaTR1CsX4paZRJWBm6iJHRSJ4mbuKZgQ02R+NQ01WAhnqEBjFImcZbHblF9tcuO1VCzrqLon3wyrXw2zrCv6FbaiUw8PouDBaA+I1R18oURDgUMcDfVSgxVLqLhVfIkd9Vwi9v8tvKeap/+XmoAOG00J/OxC8RYeYxj3wy5nPnqZv6UT9KXWfWII9E+d7BhzwLctykicX6OYxsmLDvPNoB57alkmquiMBABNuz8K/UM2nbF4BTccGK8897wMgjuDLKMlLKz01aBIQa/QzOwG7PkR6214DGHi2aCceKbyPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeJHP59/ZAAPxHz0h1MXJ89wtDKxCj3xJdtPkm8jie8=;
 b=jdpzIZ3mjMvW7x730nP/apiGFXYX1i254a5WkJFAiugj903jntEAwmEzqQG6ERDSD3gYORmP5aEOxf+VykOnfmL+kboNtZxnCr0ELWBq89kBliBTqDeRjtwOSfzvKmOhhUk4JtV5rdK3Rxf2bpvIoX2njBIrOfBdu+h/FbWTDL2V7DySxv/7RM3qDDY/L6C258cc9/YcIwlVu5uAoHDaC/E6U3RF6z02BOU2Q1rZ7WKMR5kOjXd8BqOCbXjkp6fBViEEf3aY57SKgqg4hqDEHN5MwgmakPHVfviPT/SXgB62QHC3a/odqNVPszkHKnWv7k0g7C9KCdHrgx4v4Jajxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeJHP59/ZAAPxHz0h1MXJ89wtDKxCj3xJdtPkm8jie8=;
 b=a0oCzR7yMtpS1CUSMcAzU6LOrifHQU/VYhiQpnWOnEG+WlbNXWQMQYc+BuMoIgyx6QAs5poFlhnQdpN9DGUt+4X5960+otXO44WgSiInNi+H7wg5NSWfMlqDY4Sbw/kPfQMdWID56wnlu7AL7e0n8aVs1lIJMe3wQRg8d9vHW58=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB9312.jpnprd01.prod.outlook.com (2603:1096:604:1d3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 05:11:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 05:11:48 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 magnus.damm <magnus.damm@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to
 struct pll
Thread-Topic: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to
 struct pll
Thread-Index: AQHb//xCPQ7OVBG3XkOLTjLLPmGBtLRjRfaw
Date: Fri, 15 Aug 2025 05:11:48 +0000
Message-ID: <TY3PR01MB1134626ED06D305D6CB03A37E8634A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250728201435.3505594-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB9312:EE_
x-ms-office365-filtering-correlation-id: 102cee40-3e1a-4a45-cd4f-08dddbba3cd4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?m997yPtMcwiwT24BTZIrvs8D8mtpnseG525n74OZXRUtqYpxKgus0BGdbg/B?=
 =?us-ascii?Q?2nlqXS8g0En5zkKnnrF4ZK9kmpBdqJ2F3uZAk9atcYliX/RgrXj3nhBjj79O?=
 =?us-ascii?Q?5fvvQuq8RJbXiyYBoFvrnNKCj7rYDQIEwzHkWPclhobED5uImC9evkMrFert?=
 =?us-ascii?Q?TQdA7q07CdnNRDp1MzNKK6Q/HumseiGxcuPC+slUykRo/jed1JDyqlZ+lCof?=
 =?us-ascii?Q?wZNEAttKks28zSwo5YtKq/9iU+h0VmA5m60g8LLWryVQXIo3L6MOUJ6K5O0y?=
 =?us-ascii?Q?SmYxPbKYH4esgIrWuaZOM2C3uOUh8YJhhmdHYmjM5gbNxFTES0BW58DGG9Or?=
 =?us-ascii?Q?tsoUXOOwDn5J07+h4GZhEKnr7FU86YdtmutnBuCURiiela5zK4WtJg5jAZBt?=
 =?us-ascii?Q?99HoAuYlhEAlCqonoKC6RruEcjl6u/LF0anEq1B6dAWueSbvaPydbCHRFRXR?=
 =?us-ascii?Q?fpzSv1urNm0JG9eUTPjjiMJr5jsZEZ8z+zwCKnsW89xKbKjdFnQv4VTPTKkb?=
 =?us-ascii?Q?o1Vrkf8nn1+EufTLFj5nyx0YhngdgzlfpjSK68AInVuc1mqRWL/5mVOv729Y?=
 =?us-ascii?Q?VCsx8VQzD/XZiODyhVSLM5L0dSCA6iu1pibOcXch82UvX3+Lph2nPxM84cgj?=
 =?us-ascii?Q?2WfrcZ0GtcJzmY8dlAST7RhqOC2m5IXU4XpWX78e6fkZflUfGy9B71l24V1m?=
 =?us-ascii?Q?N8qtWnkOaxAu74igJQOd57jB4F8ojLUHQDqkJv7sqLXjvF6ab89Q4NCiAmkW?=
 =?us-ascii?Q?aK7aWzY0KReJ0z2eDqoTba9gR8oP90zDSkJcFKpTYV7Ecsxjwsuy7sEvS0au?=
 =?us-ascii?Q?Ek5alXhccA8xj49A1YDS0O9k8rpB7k4OWboKw+Kfn5uESqZb6coWiq8ExheE?=
 =?us-ascii?Q?LJLDStfIfR0iq5nx6rXngxDtd5GR0mRPW1V6JyA1Ji2ebwJWWfYFRDVJ3f5u?=
 =?us-ascii?Q?MB5ETypCFbAqG+oui/IVtmQ5eLtlSo1M5HY48VKqOOihG9JQzH033xVRqSsU?=
 =?us-ascii?Q?LCio4TYxM7mrcnZ2M7QX0gtD+tsOYzvs7/w3585iIdtmgmcG0tTjNjI8gV4a?=
 =?us-ascii?Q?Tuatffcz5rsj8tQjhbjtMco2Qaf2XJbllNWnJxF5VGWOEHyqov0/K0yVbGKb?=
 =?us-ascii?Q?WsMmPq5/c+XGXwqNHG4ctMQ9FMG+FTt3XTi6ynPdo4lriWZNjBu9WNvxZucg?=
 =?us-ascii?Q?pOPHyyl369ZOiSh7wg3s7n7P2AdwZdOgo0QnRYz3CTablg19gQtQfGBUOIQ3?=
 =?us-ascii?Q?iKI3CUEeZiqN0Npu3K42fmfnDmeeMr+XwIHeB8w6lecoYDBzw5qDEBcJ6W+C?=
 =?us-ascii?Q?IadnrN1dRI4ETEPr59ZF2ai7xfAdVOmO6kyJWfFoz3VUSsH9mzISsWjiQSLD?=
 =?us-ascii?Q?IOJGgbR+mRAwpy6GH5vUbJH0/+EiMAcQWzY8PlnyHM9u36bYO47uk60BBa6a?=
 =?us-ascii?Q?4Bv7y3Ss70bgsLj0HM5IiwxiEpGtuNCZfgwkmCP970CG+Uz1s/NNzE+BPpfg?=
 =?us-ascii?Q?B5FQuupVgO4kqVQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?99F0et0yLXJOremE+NtkLHD+b7hK/KLImq0unAmeZQvlTc2QCVtjk8dfyM7T?=
 =?us-ascii?Q?uybpauzc7OqOPqRWeuqSbfWpZZLTtJTtF6uDjerBHqwMcjybFJGI0S69d2tD?=
 =?us-ascii?Q?Rwepe3FOW6P0NwasFUr30hG3gF+WuBMBXKvgV4XlQAcV+Ua+U0k6HiSSrUOO?=
 =?us-ascii?Q?5qsONCGD+MnzphDDEE8rAqDfLICAzB4sIE5LBdjtLtqdq4+GgmdzDw33NL8F?=
 =?us-ascii?Q?zqaKUmRNFkrlGaYZHNYRzJOQdO/J9lz/3mzb0Dkwj3Rfgh8Ismjvhs0tZrYe?=
 =?us-ascii?Q?gBeMZDDNsbazdrVo282Ido1XX+O+JjTTmCCw636KaAzcI+9cwPv6uFCDhWAA?=
 =?us-ascii?Q?qhuvsgxcb4KvIaPG7X4s5W//j039wOUZxMv7ao/4bhAAgI5wP2Ru9bXVdE24?=
 =?us-ascii?Q?lvGV7HZ9z7B9f3etNq8u/1RZjYpxiJaq3S12on+cxi9VerelZMT8vLU/FzO5?=
 =?us-ascii?Q?80B6vAucrNkd2X8fh/0/QbS1poBnMWhJo0+USLoUNMSTu9kdeff2JXOrs0p2?=
 =?us-ascii?Q?nCEExn7P5IwbAnZAn7lEk8Mz9X5mHbzS9YNGSgganjYQmgS020tehQPak8rl?=
 =?us-ascii?Q?loscX+KWIp97gslAT0NaAgrQm3tNRoE9eapXjEfMW19p4uOv88aL2yWytrT2?=
 =?us-ascii?Q?6e+Tr53gAiZgefvsJqXKqeWK5rWKcmwTJPWC1Jol7UFjHZSZet5eXFYNcHpC?=
 =?us-ascii?Q?q7klwaVXg3ZvLodwtRbdSa7lqWBnqx1bqGZGZApdbZ6b3d3OxXEIUXIywpSq?=
 =?us-ascii?Q?BXG4SR+7TbvTqgKVUN13LCDeNGafXVqEQBDhYThR3zET0Bgobt562xo3QVu/?=
 =?us-ascii?Q?0KdbLm0ifP/oRvcfzEyAQD9gDBOwpn/aoeAjZtKZl+QNC6LVfbOyORb3XaJ+?=
 =?us-ascii?Q?RzYmu+7Loy0Zm3GSadsUXRzC5vB8WWxP8vkhRtDHg8NBs0SHnzWFI4Sz75Rf?=
 =?us-ascii?Q?BHsS+5MJKHQqrFairbiGYbQir5Pm0mBTw6nKdSHOU0ObqHOD29dppQ276s13?=
 =?us-ascii?Q?02cMVR2xqLEAR4lmvNU80LCw2mXKoj7gTbXBX3yPjrlfbcprOtIqJJe+hi57?=
 =?us-ascii?Q?eKE+ogVxAFiCefuUXatgLEpShJUH3OKDKJE+3edo3UQmMcQRmbu3lRjTkXlh?=
 =?us-ascii?Q?Fw/K4mudpGBVBMfkBrEW6bYZDEvlXTraJLpxkgbMFeuu8t6LIXmZ6ohDbya0?=
 =?us-ascii?Q?8D4sXZasxvIvGChgEi8S8qV8m12pTLOxVgog7E2v0zVIHN+MdJOoEgZxk8TY?=
 =?us-ascii?Q?bHyazmVJEYiV2cymeTBFNuSLaECUseWRzikVaD9rbGbkLbLNjVzQ14oZ8TPM?=
 =?us-ascii?Q?xBHMr8/rPO1B1+u62w+qRkyW2iLwcnGUNxdIQASDcqz+6XsB1cBdtmVMP1DF?=
 =?us-ascii?Q?gifeqWfrIVPzzz9kWeUPm2AZIlw5IO1HfL3reUCIpyxLpX2SOyZ7EVJMMX1Q?=
 =?us-ascii?Q?OZzgH+GurUksnNFdCzkZeFFSQ2j+RS0VYycsHGYIRAm/O2fB50LOPK8J1FMg?=
 =?us-ascii?Q?OpcLVjVbzI/ZbaxpUoLBfmQ2DRgxpSiYYiDHYeyefZgJ4kbWFWToTCiBZNsb?=
 =?us-ascii?Q?HH+HishHF+l/p7znTBOtwNfapmgorkkWJPWWQtiRQqcySUI7ap0CpPokchMo?=
 =?us-ascii?Q?JA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102cee40-3e1a-4a45-cd4f-08dddbba3cd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 05:11:48.7102 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yIg3TcOUWe1ScsTnDkpIOJuzo9v+VJC+39ndls9WQE+peWZcDJphSfnB7y/RGVzrtiOXiw9Ecdyr+USLDM+CWekoQfq9b462N36GUeJOLkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9312
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



> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 28 July 2025 21:15
> Subject: [PATCH v7 1/6] clk: renesas: rzv2h-cpg: Add instance field to st=
ruct pll
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Add a two-bit "instance" member to struct pll and extend the PLL_PACK() m=
acro to accept an instance
> parameter.  Initialize all existing PLL definitions with instance 0 to pr=
eserve legacy behavior. This
> change enables support for SoCs with multiple PLL instances (for example,=
 RZ/G3E we have two PLL DSIs).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

