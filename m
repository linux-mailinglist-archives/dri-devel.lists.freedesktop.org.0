Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE65C8A311
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2906A10E627;
	Wed, 26 Nov 2025 14:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="iOrf5FuP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637B510E628
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AhphQB2zWPVF5Vddc2f2T+o5Z4xgIaqfwcPo+YHzgpP/QdCshnSe6oTzBUiLnY+s3I6NRJKjbYC8U8buoHHckMVE9XmG5SdvsSvLOdwq9jlyK2dk5d8GTSeKYq/lfchkUFCA7EjcGynhvEH+XRI00JZ7cyH5miUunDo2qiRx5I6vm0Xisn/lOH0CgTHoX1RoMmgWD5RO5W4asbbbfLLUmEmnv0XuIkv0SxAUsV0LNjY0CNcfqyr07RXk5s98QOEL5UwmcGn+2w55/9xmyDEV2ftMcqjTs0GcsBLDHACm1B1eEMhreavS6PDoAD6Ik/kTN9cm0ZuA4APsCvMjlwuWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIy73oWAQrm6MxkzOVaArRYlL+tRPBrWD0Qosav+0ac=;
 b=XytFkXhHDjheDS5u6NdOETEdlrR6vKHKXfUgk2618nomAFU6wvJ8b1pQWdb57ZGh6zJZxwr4TK4R1+eHAm689EQBxSxjjJZy3EPIGK/JyRXPzYLPtOycyvj1YCGoIevkmrJuGU5gA6aOOhaZA3u48+sj2S0u94+N0a6URFXBWpqQd1h50fxFCDyJ4gHHuBYz/rc5Bdn5QNItrNIEa7xalD1GaKKEHdQyigayPVHBueIoyjk+TpRnAJHKlRLWbul4izMu7FyxloqqY9eXENTIlMbmsRFO7kE+QX6pYZCBD0OhhAVuvE2s/PosqAviRPHYjtPQQfnnO/6+tpWwzggMaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIy73oWAQrm6MxkzOVaArRYlL+tRPBrWD0Qosav+0ac=;
 b=iOrf5FuPhdCt3Ny+Un+YYW9apFPbtESmOuH5VAsW8nC5Nmyr/Wq4n+0zM0i87Jk2Xl6+K9SvoBHW+QTLF7NmAJl27j0UPWbS8IuZuAOsewHteLF9j370qXWxGHwHBO9lJw/mLZqXy639XwhZpxeLQ40eExFwaup//1TmV54TRfs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB12821.jpnprd01.prod.outlook.com (2603:1096:405:1b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:10:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:10:30 +0000
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
Subject: [PATCH 15/22] media: dt-bindings: media: renesas,
 vsp1: Document RZ/G3E
Date: Wed, 26 Nov 2025 15:07:27 +0100
Message-ID: <2483415f35dabe42ba3c35a0c50a3e9b28dd724a.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6150d5a8-2c16-4c5a-fd4b-08de2cf58e3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cf2/pnp+pzDpauKcmPesIZ5ZEnzhA8zrX5vqwNvaL/SGchK5+tt41jdbESOU?=
 =?us-ascii?Q?ynbbEsXx5zPfoagWwS+EqSzYr3WjKD7UerXxRHX8qzZWyIRJrFXVhRoeT3g6?=
 =?us-ascii?Q?x1rtcEpL7IAUTm6VX2+jEUl7HOFYgvkIWXcAD6+WZ7vJzrW54nhivGU5ZNb9?=
 =?us-ascii?Q?Mzn6Gxqp2sxYXZpxi6HHVvwf59frgqqJoqpo44SAG6EfEPekBSAPg5ATmOJP?=
 =?us-ascii?Q?k4DQC0rFbSjNuN7g90K6/30vjxmA49zrepSIg75qV/C/IFm7J7DdU8sDwsJt?=
 =?us-ascii?Q?cXTw1BUGqmKEst+LDdSBMJgl/9mInrVzLSqtod4PjGbPYj3z/ftZIBpYbP/S?=
 =?us-ascii?Q?/eIdA26dWlqILN5R/PU5zPm1opaYH6X+sU/VYSrn0qpkVmOERFOAu+9E1sh3?=
 =?us-ascii?Q?Ww6/6e/RBLect6Z+BHudPqHeINCtLwxWCwuddvnHhMiodxYIJI1jawG5jAj5?=
 =?us-ascii?Q?m78gy+gzDoXPrpB31YF8kLrVbb5pT79ShPVruVThC/puMUucEuW9wvDZqHlW?=
 =?us-ascii?Q?i5fO8Pty6t7kRA629m7rKtL2Ka0na7BHvZoAFoEWtIF2A++qrcfcLIaTyi3r?=
 =?us-ascii?Q?CxRUxfHudv4gXYrgm+2qMyvUqppxGE9YCPbKiNnPWnQnKNqZ92lGIFH4rdk8?=
 =?us-ascii?Q?YFRer/lUTQLj9JnS8NAxSN+GB+pn5myy0aKxdEHNO9vaTtN431lZA785+DlE?=
 =?us-ascii?Q?HrcttOYBlZKXDo0UcSa8SKEzu8GPx8dSI7HVC20NhM2taYahPIK5nMkgbhKx?=
 =?us-ascii?Q?qnj0iV5tLqGY7Xg5dWB0qYxNEkmGTghSnuug4osp3A2ETMKMbd57E6PxvNeJ?=
 =?us-ascii?Q?CYXFI68EiyD2HNH8zevQA3qTh7nWQ9dXw18POPTDb8XBqgGo1nAeaKCVl7vy?=
 =?us-ascii?Q?r/E9fDWN6c0dl2EyP2Phgojx5Pm9L5j4xq7kt4s7O4D2uBIZ5PVwIKtOyb3c?=
 =?us-ascii?Q?Q0lhAj35SJ6qF/FpNJqaXAlgjznBfp2kibR8PLju23MxsuV6VUEXyklL0twp?=
 =?us-ascii?Q?3+48myNF1H8F6hbdKk7l5ic4xEwMIWrXgbwZhyq306vF74YVYfmB2Ad1pRDO?=
 =?us-ascii?Q?iotqY2vIcopJk6s4oclg9Diey4bENCok4pZrXqWKagi0MwoapB7GR0Gx9u61?=
 =?us-ascii?Q?HBnVtn7gOM/q+NwClzh0kBqyczINsIgLezbebXWBgM7U4xlhyBLk53+0ccKv?=
 =?us-ascii?Q?BrlyOKDhIoizn7NSUGbiCwSk34Ozy5po1LiBa+iUhKncjyXLNakDI/A55X+b?=
 =?us-ascii?Q?70v2JHFgApCwUEhLrfWVv5OBdzZrrSVgfImKYonUacuf5VFlN+CsG+o4KQmR?=
 =?us-ascii?Q?tfu6aPsU1+zT7IWhBKZr+TheEnTEQAY+wzTSVhsyYo+kdDflqO8DW4lOUMYX?=
 =?us-ascii?Q?c0yaHAfGZUi2qED7FMdKQd9c3AWr57i2Ap+plmaARSpmtcTxN6V7Ic88+6Xu?=
 =?us-ascii?Q?TwRWntFioqPnrRe972zDE5NvO+buZoO6ViTB2cKugOcvBJ5TgvFnnKVRnczT?=
 =?us-ascii?Q?uDbKqacmXW9Rr0/L6FOwzflWH8co0Jge3hRh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CoZXa8upmpUDmoUjepeC5x8n7yeG8jf1aTZrADNnGHj0yUsddv8lw22CPkJu?=
 =?us-ascii?Q?YIpNg+JKn/00m15iTP1zgXqSQbjkMbXufA33o6tJ0UfWknCm7DdzLLnJ8F5e?=
 =?us-ascii?Q?XEvKruNjvlrJDzt71Qe/PitL//3yZUe5rxipb1G1OJuCsiUzjcOoWqeBR651?=
 =?us-ascii?Q?zsu+/a6D++IUCX/uWHQg9vNKSfvW2+XHm9hYJmUFZXYmbf21OHlCZqeDyNRk?=
 =?us-ascii?Q?F4gugsqzlD5pSKwILDfXJshUjk7fy+xXluzjaMK973N1LtnVCy6NFqjf7Kg+?=
 =?us-ascii?Q?HwVMwWsPYT2TGmZNpylzwPyA3/dEaQEM0owta5nFDEV/OJTDxIkcJeUT8Sfr?=
 =?us-ascii?Q?hcrq+824bJkkpyauecsRvWUsiAov9PlKkhpvMISvX9h5UsEcGGfUlcXrwXt0?=
 =?us-ascii?Q?rsfhhvG01ygUtu0taORfB3/NzmwPrl+8cYkcXdU7hdoTOhDtUhWy81BBsh/W?=
 =?us-ascii?Q?2BUTLOWGcvrhay/b5/Dk9aCspAVQ0FRe4l0ikWftMzEBj8Y9oe+oE9uovQTU?=
 =?us-ascii?Q?jKfxTFRessbzDwdTMHr6DP3ACW1gJfIh0kBuC0W4jNiQ+tE4DTigvLajKiAJ?=
 =?us-ascii?Q?drzZIuHFHK0kJpZk1bGTpZZpGQ7q9TA4dXpV3uVHJmNjW6El+sJNxPAf/cZ1?=
 =?us-ascii?Q?8Z67GNYkLyFCwBx8IAY9ZY49gZlR7tzozuJs7U4Z7XyafqrFwz9RQhFHU67v?=
 =?us-ascii?Q?5jbjemNHVEa36oWFhel43iZA5ZvNRvCbFrQjEakybjQ6nI5L9YjF6Ej3uj4S?=
 =?us-ascii?Q?5ZfkBxhsV+Qn6bedRliLxVW133Nd39Xep+c2bah7eN0Rtcxh8lXSEpeXC3Sn?=
 =?us-ascii?Q?aFnGnOiwpBVAQ1Mwp8H21ckmm5O2wsQoqb0n0qCgqUFwdCY18Et14iDuwN0h?=
 =?us-ascii?Q?NlH3mEQEsscyaz0+gFrRlEs0ydtnfwCIj03hPUtN+XQJ3vtuqNXEXGQU7ngm?=
 =?us-ascii?Q?TrrAsLl27+ry8N8L9QA3mWDtf7YFHWP70a2YgxoLu7l1ZdDAO19Z5FSrS/QY?=
 =?us-ascii?Q?3B15sqf7NIiRkvrL6wGWTxlXra2EHXK4+ZHTXMU/AVf1OfJ1/FIunHYLDGrp?=
 =?us-ascii?Q?AM9cb9XnGqs/7m4hgUlQyljyXARGrY4GqeyVKFUiP7/UsXV1qYaeKctX0EiR?=
 =?us-ascii?Q?+3gTcOpdnhbG1hQudpP3GJUaeSI+bgJTHmWLeoK7O08k7/eZivfh7EnDHEkC?=
 =?us-ascii?Q?yFFcVJEsYF/U03dRaJJ4p2b61D79AJzICHAwiMON1j5/h98ShTZEzKC4Ksaj?=
 =?us-ascii?Q?QaJ96t3MUHQ1lpZVSnzsKAvx/Ddkhpzvp55f8BfNaUmFSsWI46tlexLjzXL5?=
 =?us-ascii?Q?vJgwumVKoruV+onEF3ODQUEEqX5o8n/qYdni0w90GLG/kzDTffZ2z3wazQwJ?=
 =?us-ascii?Q?zog4gAz1h019WbC2WAmVXl1PbmodAKBeBR58fT+lN6DSxnjJ5tvYcOORqVSe?=
 =?us-ascii?Q?Azl6lZQfi6sSJKZZDEtB/QWV1eajPlDDWv1VY+wJUvw04PbXShko4Bv/5UDN?=
 =?us-ascii?Q?7YzkpwQWftcPGxAWgJpxCrkvZAjDoqpcWvRo6Harg0WxTgaKrLj0RQ5U0Wuf?=
 =?us-ascii?Q?frdGwI2D3FOw7889HxXbBi27P4PSm+h9BBRe0pfdyovJlOyzz83W+5sF6F71?=
 =?us-ascii?Q?dRcRUFGAa27WdNiaGBXcGmE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6150d5a8-2c16-4c5a-fd4b-08de2cf58e3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:10:30.1404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2hUMckw22TSjdzpDwXNgDdrKrEfg3NgK2fTeEjuuJEol7OfB9an1rATTPuVCJFnfYiuq2+8vV19mCHrtVI6LbbmoItPi0xmCkFW3DHdaoG1+FrmjTvo/2yecICfJyho
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

The VSPD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..62bff3ce3eaa 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0

