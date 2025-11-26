Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB842C8A2D5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 15:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6FC10E621;
	Wed, 26 Nov 2025 14:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="S939QBJ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5E110E622
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 14:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x6Dyp3o4JVTwMFA6kyvJnzvy9tVoPtm+rUVkb0AYMQReoZ1nUm/TBfHySS39e/kYjUhmTEIz5QVIPum3HRVVGPDd/MzNjqMtngi5ZioV5vfBmqnDARs6SFCxQz9FzWyziNWH7akauVgHjhF9AbOMrnCGUCnvju1UWNF84dY540pzj2d3o+jPRZWccOSHyffWLNJA9nNYYpXaroFVXvICcMAJilfBzARqvt46EnIjSo9VFT491oo1kG4/VZ6wfb/xwbmgsd1/VH/FRlVuIueL2C4V0HEf+LTRMbiHhafh4UgD7CPZ+g3C7VRUOvf/e4KDWGYIsH7FgQH+rHu5SXgcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GupRUJGeBp3JiEaY8ttW+bTt3EpTdz9+KynMgCvc+Ks=;
 b=byfQ8xt3Ej3I1048MqkUf6KGt4IotfaAC1MEM+8btbSrI0wH/xcftmHAHnq7qI+TqPBdE0w9NXvI4740naOI1VJCChFA+ewzpLgZ/gVFkZMyZDTno8uvR6r9X+STOnVVurXe70XhW0pKMhrqKfFSOnkXZZGv827DwYXfklLXXS9HLUKl6D5lWiXAiPvZWBlDKVoOwsPlLhud5x/+GVAQWCbYnyMU7J5DZnI/yyRgca+uLwh6TdGFt6JC0XM9SEXbO80NUOGxvDtYRC6SrvjcedbL51r7BKpQqVfuJFxMSItk41M8VxbIdV45hIoMRjzPU6ZysGvXZiNuV4x//x1vXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GupRUJGeBp3JiEaY8ttW+bTt3EpTdz9+KynMgCvc+Ks=;
 b=S939QBJ+QMZycofYNKksKRCHTsdq/6oeT9ayv/pZLHRMTPJkbAulzfaZlUxI2bA5NecBvcUbhRpDCBypOQP33/1awjWr8zHtzANAiJIl3w7YzTYTlUcXvf8dt+VH4JsRzaTKgZJpvg4xpFFZXmoN20MTMGlCAswxnoeRPl86rfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB6804.jpnprd01.prod.outlook.com (2603:1096:400:b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 14:09:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 14:09:46 +0000
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
Subject: [PATCH 10/22] dt-bindings: display: renesas,
 rzg2l-du: Add support for RZ/G3E SoC
Date: Wed, 26 Nov 2025 15:07:22 +0100
Message-ID: <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: ad9a731c-a120-4b5f-8db4-08de2cf573f2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gvPRvXncdFeGVsvpcdqdvTXZ2Uv6mjoGxVgxRTHoZYkGoqud7e2edW8oZkjh?=
 =?us-ascii?Q?lXLlK4GjDevHuZ68dONWfttQ5hMqr1z1y8f1kF0GC6OqfsidjM6JyNqpJjTN?=
 =?us-ascii?Q?SUgmco0Vblu0QGGeRiczn9yEKchYh6tfzaq45WqBwIQxcowEmEJHQ+3Iwzr+?=
 =?us-ascii?Q?6XTHzZfdOreWZ1hvmJPw1yN1Eu5k8tecQ9XLzIq9NVUZChz8hSrrFfm5gcc/?=
 =?us-ascii?Q?3pKrCadY4Z0GRgwRtSiqZuzB5UeeLeJN0hXnrVMp7G05dsMwXUOEG9dahRSI?=
 =?us-ascii?Q?a1NfLYqxC46Bk7IPiHBEX14xzyXjjBbe1bH+Uh81UcxgpWqejSyz06pVIAWQ?=
 =?us-ascii?Q?Ms4El9BJ4sDaUFjDY8Xd4wzsAJeaFQkWDh+zUVYGoL8tqztUzu22T9oyI5dG?=
 =?us-ascii?Q?+BctV7adGpOVk9KGH881mI1rM5gzXUUruIpDeS8lxPxHvxqxdG2rFffNXgd5?=
 =?us-ascii?Q?27wOoKzokfl1R8FEcr19sMGvgA98Zz+fIPL+5pnU82SsoQBO7qgzOthaJ7qC?=
 =?us-ascii?Q?/asXrpf5rN9YAhA6E/E+Uw2/J1V2zxdiES3nEaBvBzQ13LZanmlWg1t7kvYi?=
 =?us-ascii?Q?vaNgJusvBmFz3BcUlYqgp6P21cWnc+Dzr2AgAuFHwqkZmGKQZEPKrIOhrPhZ?=
 =?us-ascii?Q?ns7whE9LO9h9zhmgDZydJyZZ1oKn84h5NVgLSTNdVUslbPvvQmBEgSpwq8aN?=
 =?us-ascii?Q?29hAG9VqCDdPQus3kZiZpPQpNXd8OAtVqOrl48xPbMNyF2Zl4TQM9vhATc+J?=
 =?us-ascii?Q?6MzKu52o+kagaJE6vgTnjdmNgQ3CAp4Jcf2PSWr0OfZHGHCBMFrweqk5gn0o?=
 =?us-ascii?Q?lUIOhoaoEXjwXrKIpzBdfQQepbJP6Ul7kqeVVeSoUg1HSnuY7TuIfDfiYAJu?=
 =?us-ascii?Q?/x3ywQVy2yDykyZ0MDDjFmdNNLeolx35wUdY5AOOqyyu34OK5X/oFY47H5M4?=
 =?us-ascii?Q?chWLofnwqvDf6ltL/074qpvq1UtocPEc9aaVdWdtve3CWe/uuQHWzTrqqkuK?=
 =?us-ascii?Q?6kgOw7nEDVT1OHWW1OmxumnY7N9vwq27376aRPCpl3JzyBZNotEWRMnbBfq5?=
 =?us-ascii?Q?1R6oVPKh0hHujQnqfN1HDb0rqIc1QvJwJCAKqpE3ZnVHtiQZLZFfahsPs84h?=
 =?us-ascii?Q?mw+yJJyOoW5RgtmXQ4xo+cY/9nYdV6wAWtnV140fGLLtt6bbd/1NTioY6VZM?=
 =?us-ascii?Q?ahdUPM7Lq/dgQG8bgIBM02jaGW8D7UkOdMD0b7dnnFbQt723WSFUoEnuHB3z?=
 =?us-ascii?Q?KgaEjZ55zfNOL7YZm00k1vM+NFSIlSXTH7oyPNBIS0ZY/Phny8+HvK+oQQwc?=
 =?us-ascii?Q?Hk8T4GifYF8fyjtmm+zDa+cItziCWK8qwiS/JfFTbRsYvu66VXTD0W/06qQx?=
 =?us-ascii?Q?OT+kMEDHgFVGz+v/rtvUIP3nzIxnRTazCyd10Scsmcx0MHYBvzYE8COqFden?=
 =?us-ascii?Q?J9bqI8dfkvtlnNhrF4MN7oI84X0/zKnumDYHUx3YSeeyZRJm+3a+nM/HHm3b?=
 =?us-ascii?Q?UGmmkuj2BYQA0VL3hwv5XZrUGS7a9coRrivH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VBcqaPmCLrNHtLO6+pRUTvYClkfk6z0hJc9d/ANMRkmS4hydFYwraQwoxRM+?=
 =?us-ascii?Q?JpsIVEe4B1+9WgnOH03IlCknw29SFQByNjeAbABxSsR0yQhdY8YI1/lXQD4u?=
 =?us-ascii?Q?FPVSdKSnVLvtqqGJ8sFuaXYmNTzZMCIZqMbWUDzU02sdvz/qyEq0MnlVebew?=
 =?us-ascii?Q?tTi4Nb39Z35/Aw1qBiOO3UkZ7et8opXpOYCnePBRO/++TRTVXDYDqfnxa1pu?=
 =?us-ascii?Q?h7f2y5kHdQvB05RidXUeVZuaNc/s1wilb3gUH8Izb4/fvqHZPD/9y20wVJJf?=
 =?us-ascii?Q?ZVRfvgq6ZHyWXUWOgoNUKjG2fJEm+osfixjZ4eD9Y/O0vCqUjKvk1FZdLyPL?=
 =?us-ascii?Q?VHD+3SDKaCm1kYuom/btcbZENz+s9f/qs2Uj3dTHjsY1DUYtWKWVbOB38d7+?=
 =?us-ascii?Q?o5KPlMcGA+SHprb0iPKsnbvWFkbGvusdTNs5wYPS3fzELQH6LCojTqR++qEg?=
 =?us-ascii?Q?zmU7krrdKLBSCiPGZ1L+TQG435OGV6QGTBY7lnbTjHMLJKYpuzpVfttroKS0?=
 =?us-ascii?Q?4953vbxuOonKEVd2hnqNjT9Iho4m1+qLANIt6tum3nEgf9j51WU3qg7O5Hrr?=
 =?us-ascii?Q?egd0rmW0rLKfVjCB4af7Qus+OYZ+99xfuL1PxIKTXJjSITRFX/6kwaRPFK36?=
 =?us-ascii?Q?/2zfDIBI4yE6QGkPjq5ngRU/2dS9hdbpsSzvk8FZ+IA2j4GbA9iO8HF+DU0t?=
 =?us-ascii?Q?0aPrmbb1Kawi5K5lqfM+axTked5HQtsRRvFlvmGZNoXgpB1jx9tzqwTbu76O?=
 =?us-ascii?Q?Tj9EMP3r8Zkg1WQRYTiqbW0ZgbbtD42lDtECJNDkP/+hL1ML3uw0ENtk/laK?=
 =?us-ascii?Q?tjfqS88qC8pdPWYyqR0alt2nxk1UTC9Y042+WNK7itfUauK8yRMG00C9RbeU?=
 =?us-ascii?Q?zVp4lfyTmnnOA/kVLs/cHySVUtU7+3RjjEOCa6pj08HJK2Gu9mV+S9imte8m?=
 =?us-ascii?Q?Y35W6NQeGSGjJt1sZjZcMn6qcL6QMQhlg6HEJpAtAwEn5qAXygiRshlFrqSW?=
 =?us-ascii?Q?MZUqU4kFFaoFC+NxatCxdVAXIBsVIoMIpRJX5+KullL76FgvXjq65/1LLRPR?=
 =?us-ascii?Q?3mWT17TBLMLCioGOH02ntmSiLDsx/UziVJAG4tNszv3KZdFADtTvPWGh7KNx?=
 =?us-ascii?Q?xHPe2H+DOrRDQsLyxyvu+xnjJaboNYbZHBVXtiYaVqbhiSPT1Cuqn7onq0Ep?=
 =?us-ascii?Q?vF+/9pU/97G7O4SbHXv+44l8Sd9hD+xG/9uJH8o8ZrsLKjkpeza/UUqgdF2r?=
 =?us-ascii?Q?mt7CIseqENns2or7C/GjoXvrcYLEq0GnXGT0ivzhmK14pV4kRt1LSN+PmXzE?=
 =?us-ascii?Q?TBlLSxcTUe5shHWLddGbw7xFMWwNB8cHH15AGkTr7q6KLtu9THE+k+VWSOh4?=
 =?us-ascii?Q?8cXCZNMYO8mZrxGQdPXFigVWoY9LSEgRie5Ql5jbO/CPbtEGJBpssykU5Mha?=
 =?us-ascii?Q?Bo3u18OqU4XVF6bN7w39zqu+zwTZFAsmvcXU1Hu7CuYfvz+V2o5sq0o+KEnT?=
 =?us-ascii?Q?T82XwnOr+rrVffL01aCXwg5GaDbmfC/1bgQTmqBQI7N+tPgYB6UOMzWH+ejx?=
 =?us-ascii?Q?uCB9saVFHu41OFb7z/nNu6Dza/eRGINtA9doWdgnzP+UvBuwVqY8jIYSqZQ0?=
 =?us-ascii?Q?r2GXS/WFEPUUAyYdKwDrWFg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9a731c-a120-4b5f-8db4-08de2cf573f2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 14:09:46.0409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Nv2e89CIqLy4Lu4DYI+kDYI+u+72iqCygiChjrVeoQB7cEDB4vaAAF+IErrcAKySkfa34TQH48bIQKMExBeVNLMrUESwWKKhfJHbT3cNtJLzllEnQKUKndYz9lLsoe4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6804
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

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
and 'renesas,r9a09g047-du1'.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..a68252ae02fb 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,8 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g047-du0 # RZ/G3E DU0
+          - renesas,r9a09g047-du1 # RZ/G3E DU1
           - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
@@ -137,6 +139,46 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du0
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: LVDS
+            port@2:
+              description: LVDS
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du1
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: LVDS
+            port@2:
+              description: DPAD
+
+          required:
+            - port@0
+            - port@1
+            - port@2
 
 examples:
   # RZ/G2L DU
-- 
2.43.0

