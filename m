Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F28C8A317
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7581F10E629;
	Wed, 26 Nov 2025 14:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Gh6Iv/Lu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011045.outbound.protection.outlook.com [40.107.74.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 719DD10E628
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JT96pIuOL2gvLTH90vRYW4K1RZnRFb/IPv9IBsg7/t4z5kkZ+29mUo56pfiuFlwlNi9KfDsZ5PtsyelcWIXq9ISqeDFcZqpX3s/gqZDYmP+1DnWbOlRAfBsEvZuOLgenV2WuJlBGAy0ISzV0ivNoNkSnEajP/7c2Oll1VWYl/IdeM7dL35eLH56c6roktgHnE5oLsqxUlihF/DWPaCVWgQHHQOq8EpLTp5cp3/TaWxFt6Evr9LiNUg8CZxEXWHH9/ejs97kerTKGPRTWpTl/zqZiOBRhk4zn6aMab3eV4zElGvH7sqLXBQIOu1BtRZFvDnw5bxsYr75KihKBJ4RGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF/UMAN2nVg0Z+pF5f4Hy3Bwiq9dbot+kznNffpz6Vg=;
 b=Ch++n0RZNv0lJes5qaPIQP9uij55sAj3pFdCKxg1yAtLh+3lbgXm/1p/kIHmaAmrEc16+dCRpuRSTudHhSISBgne82Icmr4YUWbCvb13mLOT9S5wdzDr2PN4fqjgcJrKficz7OknFwDpURm2zGtb7Wg6CJKWatP1NinwsQRPuZb9Wxp+ynzw6YrJzPbrSrUdDYuoWIDKPA5v5JT7HD7vkOnbGqYxubJEXjH+4HBNGU1XFOowkQjyM1VG0G4A7XpA+xLxvz5lsce0p0YLhuERJDSZjiFfHk9N8kW0T661YtsUJctmTy+CVI8AFvBE82rETv3yqWvKMCcu/QEDy51COw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF/UMAN2nVg0Z+pF5f4Hy3Bwiq9dbot+kznNffpz6Vg=;
 b=Gh6Iv/Lu13b3yBLD5TtA7lQ8fvUONU85e+M4dQjyDqN0bWmjqmUb9MwpZAyV4ekXuiXHDATPeI34lMH8jDOc4dzV33bzD3NwceAvv0kShjTIKI1irJztg+e05zwOutVoQlw+v4e3ecKOiHs/yh6XDZMS2ksaBQd0EqCcR5/k4Sc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:38 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 16/22] media: dt-bindings: media: renesas,
 fcp: Document RZ/G3E SoC
Date: Wed, 26 Nov 2025 15:07:28 +0100
Message-ID: <7b30184db6564f61742594c83c3da072d15a2576.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB12821:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfc2b0f-a60f-47c9-64d4-08de2cf59371
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dy9G++bfOvuOTnpQlM3RfAcHcJ40x3hHGNMAMwm6XRJ7OnWWLsBUvmIfXIbM?=
 =?us-ascii?Q?xHRdKhxmDJVz0B4kGFTJe3uvXptl3TESe10HQueAUJ28kZLu1v1Jc1CqcAfa?=
 =?us-ascii?Q?wo3taRXPJ4brRQ6DhKLgrQmfMEXe5hkSf8xm2F+QIM6MzvF2xrJT3PXrpiWJ?=
 =?us-ascii?Q?JHYYowjxPK+eYTbYfvmM9+9HdbUaBAdQgZoukV/aJ7t0m6HRz2N55ptX2tGM?=
 =?us-ascii?Q?7hup+OEjnsIXpXkTwH7pVYYi+W6eHjbTAY6QDp0NnPv5OcTUrunzKCJ1Ztu9?=
 =?us-ascii?Q?eQPKOfq6qFibG1Bd5BR44ANqUJIGdeNg6OJHxjgmlZ7cZtoiiScbpuy2Z2Qb?=
 =?us-ascii?Q?aiwY3Kcd+PkuwpDxjIwWEHnCTHArnqmSJQyLMlHNGWnxdi3SpMquSKP0CfMR?=
 =?us-ascii?Q?SWwwdFP6vQXafuujN0+2NsH29P9Z0Qn9gnsnPjz/oIUrSBD2MHXcm/yH9Ylf?=
 =?us-ascii?Q?gPyz4J2dRWdrIbeGdudhBEDmuZ17yaPh18WRYF8TuNugew5M4wMIrBg7ZlRB?=
 =?us-ascii?Q?jvJjwz1D4Cd9A4UsUuxSxJtHlT+iB5yNz8z0RZSwfzn+L6o+ubiKly9yvmeP?=
 =?us-ascii?Q?sxUh34Mt7XYaziHWulKWyJo72m6jDwksWfc2yDxa+8oO5bgBoJ4rVMU5cx2E?=
 =?us-ascii?Q?qm7XXawm0LQmmS3ozfWmCckSG9a5fhYIPB0YeNLyl9lV+jNhfCaFF3P43xNX?=
 =?us-ascii?Q?Ei5am/SZG2wmmYVDIx/72pPRR2+xkk1YnyPY+4H/HYGGMzy0d63dn8vtN7BU?=
 =?us-ascii?Q?HrfBWe/zbR4enCGcgQQUGucRkOdQaFXT5rY7r675TH4RDU9HMbaOdKc+yYT4?=
 =?us-ascii?Q?eXWeOe0cP9gT06ex7qDqpi/VpmGQ5seNEy2DvCFHvpsbNB6DvTjLYptDvH1h?=
 =?us-ascii?Q?FGzK/HlXH2RxBZutvHlKsS6/2LAAmpXz1VxOSHqMHQbwdOnbklR3lxviMyax?=
 =?us-ascii?Q?VKj+KseRH9+ypRkuQ2hbbGz/U2gd+fjptMFXekgNJ5dAJdvd9lZOkt0MQeoO?=
 =?us-ascii?Q?+9WJqZ+ZvRAMGlBpbHw1O0MSbAphD58cxzDI3Zy6ITn8NMjfBMv5rRDgGkCc?=
 =?us-ascii?Q?ZWYZXpmNxsCqJ8ut/jiUkAeIaRblohjIDzA0k4h/0xdUqqVSjcxMBzj1azaU?=
 =?us-ascii?Q?NYY66ilhRra1KEgkn9ZO8+LVs0aT9kP+Dg0z/Q3iMVl2VYnGR0kfrn4FA8pV?=
 =?us-ascii?Q?M+IB2bDlh05ABkm5HdbNiG0bWSK4HODS9OLD+C/DdH/IOakuPL4ZZFRvbSp5?=
 =?us-ascii?Q?VuPmtnPB04QR3Kmkx5ZpOzgroxPCtekwDKBrtV2HBLOerr6H1paFFFd2lhDn?=
 =?us-ascii?Q?ZEZs59VgC43uypgJYYOJzPP9fpwAHOF7Tdy9sDl6ydxxUwzDvoCoYqV8YQ7z?=
 =?us-ascii?Q?PRbMPwOy2A1zdf5RGhQhLH4GxeRem54KD8TiAGj2uBXu+Z+WwjHyFjEbkX1q?=
 =?us-ascii?Q?VT/qzBDwt4/KldL45fEf2Jvt5FJwc1sBI7zrmb+1xU4ttkhw4MQ4xDI9EsRg?=
 =?us-ascii?Q?wpkAoxm/AdpLkf4qc6t1/mAPSRLExUqd16H7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p0jOG7b9RrC4UgUcoFQ+1iA23JUPDm7sYLTvfi0AqzoJU6IqFZxoeZw1bXVM?=
 =?us-ascii?Q?jdy8yBUdpMNPCSQW2m9fizA0HJMGGAlumifLXx9lhchbN003lGUwIjv2Pc7y?=
 =?us-ascii?Q?lVXqUYIR+5OJ1CCXEWDWVX/3x6r0N1CwWwSOhC+6CvkPsaFmVLa1wuGgudkt?=
 =?us-ascii?Q?0kadiirydko9Yik7VkGwSwOr8DrOyuNZpouPxrBDHAaD+KCZyMnQIAUSjHtg?=
 =?us-ascii?Q?lovfPBQn+zwIGekvPRXzsilfK/LMnu+JMwCsD4vmTGz85f4Ur0YQERFb0/aT?=
 =?us-ascii?Q?pqBLszYzNWLbSSDQDLOdUlbV6KETSQtmJ4dkqrGGqKttEwfGL6y9eYGL/I05?=
 =?us-ascii?Q?oKoHO6AEBrAHWJx795e8iilRkqZezuUymnaWC7sdfxryvzVEiXyKalhjS4wR?=
 =?us-ascii?Q?GfO0spzx4ELo6zEqpNojHd9a3FzbWsV91IdbBqNtRl0PaVNbZYSBD+xfR54d?=
 =?us-ascii?Q?RlZ64KwunsyJuOisE1q1a/obj4CJkIEZ5xduO0sgMsBvRQs03Ylbz/w0Xv2L?=
 =?us-ascii?Q?aqLugJoYDZnb28trJXcpQBAyUVD/XGXXeULaLSo7fdwK2WjMwDJsEd8l6Mxl?=
 =?us-ascii?Q?zlt9HeyFaJWoJrQHfh2ykQmNLNCZQql2djo8TpZwmRxFoH28rLiWixagF5bo?=
 =?us-ascii?Q?0aGUjtfjiss18PSRbNXD37Kne+TzAh7Tu2jlRrrouD+ypYXL/pjXoXXU53tu?=
 =?us-ascii?Q?XstDdlG8zLjetNfUV7AQjwdbKdjDIaXy1ufNvolAtB/oeDZ95oa/3uYH3JUu?=
 =?us-ascii?Q?IY7rw61AuU2MxtpEvaEkbodOMSk7JMEM1r74OT0Do9A9J8HR/1q0TCe4VZBP?=
 =?us-ascii?Q?57lpdbpJj57950y4SnUARwSubRGqvhXxrHviFPcqSD2kegSr/e/i5SEqai8R?=
 =?us-ascii?Q?HY9gfO3CprG7sXySy0nOdMsGh58Y61afUQPULHTPZr7ZeOZ7noHVYrRK0KUM?=
 =?us-ascii?Q?noodUZMSxmKa0TeoW6LGKIuguCN35szrpXeNhTVf06jtPTHjgibXOrc8rux/?=
 =?us-ascii?Q?lccYLnS+RL6kCEaDUZUq1QSUsRCs+0TPdlCi7NuLp6mxPAlgygD6fG84X3qq?=
 =?us-ascii?Q?TUkl3PCVhkUoy2Qj+wC7XAUZbREVPD4F7Kd8gojlP7ZfldTNw7S2incagElA?=
 =?us-ascii?Q?RkVOw33iM4F3cObPTT/hI3pPT/pvX8JSW8nMOg8yjM6T55PyF8hmIs9zOpZJ?=
 =?us-ascii?Q?NfodWvV9WNW4K6k69wTVq45UgIR7ql6V8wCV2H+75SXdnUniyDpI5IMojJPN?=
 =?us-ascii?Q?7Kw8BZ39fY0ETdJS9TY1AYKcuFc9Qnrg4rgjb/3urfGhrDBrspsK64CG1D2s?=
 =?us-ascii?Q?3vJIfml8GMYH54ahEcVTDW8tOVeCvCaDATu0tifwRekHhnQeOy20hjg9ezA2?=
 =?us-ascii?Q?lSX+bsf6wtN31Iws99j5kTZ3Jg1nE9wyDOfUPPnu8ulFzjGcpB+MMgI1Cj0v?=
 =?us-ascii?Q?444IlXsAyFynelS46W9IImJGt32I/+FB7HDy2STkZJ2HmKgfIjLrmQTcfI9t?=
 =?us-ascii?Q?9igeXnpIkfiyfXB8mUbxOG7zIo0M6zj0jCj509bzReEf8XgDqRJgDudXQBAq?=
 =?us-ascii?Q?EtummSgp7AJWql34H2k48Q46R/EbqKxCMkCxP+5TsvjZ5GrXFlZq7/F1DZfZ?=
 =?us-ascii?Q?DQ1gAWUlRAJ4jJ5o2TOngdg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfc2b0f-a60f-47c9-64d4-08de2cf59371
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:38.6338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXk/f8xr80NpEgfoFW2A6Jl+SASjVkwJEtpDhZg0bmuzQGEu7mqQ+Z4CLf3MCeEp75HFATr1hpkWObGNfH7CCbYaPLy+YT14h1Yj0HUFpvyHvZ+tMYsHrx+xCngFkCAH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12821
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

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index cf92dfe69637..68c460c4a038 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
       properties:
-- 
2.43.0

