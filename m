Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DA0ACB430
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED4310E567;
	Mon,  2 Jun 2025 14:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="eNISE0lU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013017.outbound.protection.outlook.com [52.101.72.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A58C10E546
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:49:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEcnkunkLddCHvV8ygWko2ZOHLadswevu0RmOj2VUtMLG+AS72Zc1yTiWWWyaltWUeItddkv6MIFswL5bxyclYSTlRxNnPiv77s1itugzKtWnlcHj47buOsBj+DjMX8heUnhBLgfBlEpRvgacD0vaAWo399kHnII7kLbzUVOHxPCEJqMIcH7RWxavtFrsvehCkrz7RSght7m16gmbc1UzsevwppqG/bxldB3mU/42esLCYqn/Kp6MyY2GvGWu8NFqJBFU1fLl+YqvES4J8TkDeFRLsxL8MGT5wO76jAdL1avimqZO/Z7+Gb7QNtUavDQZs2cpyV1d0Ttf+/AXsI6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7dtXFn/QL2mlfh9nrlAPv3OxFPgXoHAvtKKjRnKEOA=;
 b=fqPmhZehGeJzGBfVV8P3R8069YfetWpLzp3lrKCQNUdswOnp+qZNuU5DMxT0MiypWd7xNgxmfuwKdPHY0RU6F/3U7EK7fkHYA6UNRuFN1xF/kLIa0n6K9j6o7EZ7DrO+OU+PAMNY0AkoAS6/SkbicqjDAP7LbrpQ+++Ue1OR1VaYqBEj2/eSqSyDusqofBMAeGSTuKKVWAhoHAbyAhsfFxVYVUxwcoGAKt1DiD8SmhUT5lCiD+fo2BvUay1LyQV0wFWcCRyNbhgOBE7S9lHzJiUyxfEvQTlDteD1JzPn4T1iXoc1k6WQEkKpu+jHtnOcNVc9ghDsxXUlHnWtQPtlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7dtXFn/QL2mlfh9nrlAPv3OxFPgXoHAvtKKjRnKEOA=;
 b=eNISE0lUFapqrq2q3IdbFNY0fkURaOz2tnbILklUIiGMTLZVQL02X7atIO9EoZUrHW9UycvqBk/srR/DihsUug4gIspgqy1JaYIpgmGF0cktDQAQL+PsGzR2g8lBTc0Sf367VwFT70tvx8ziOlB9ZA5H6sD+t1lSL+isdCrk1NF14rbAOIzDAxh17vukoAgtGjG0p4eCFbQTnqj/PssEjjFieCUUP4hk1nGm5tF48gwAuwagz8ZozZG/rdIRsvASkTYKBXzaO/Pvh1BC40SLHTPf9+2pq12UOoGJQ/lpa+F917wH6cLLIY6RKW3UTFMN2jQUmjk5qlZf6t7EZsx/xA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9561.eurprd04.prod.outlook.com (2603:10a6:10:312::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 2 Jun
 2025 14:49:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:49:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: allow resets  property
Date: Mon,  2 Jun 2025 10:49:06 -0400
Message-Id: <20250602144906.944866-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0048.namprd17.prod.outlook.com
 (2603:10b6:510:323::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9561:EE_
X-MS-Office365-Filtering-Correlation-Id: a42f5419-5045-4706-17c5-08dda1e4a75f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7EN7ExBNafZtRWLfCUFqAANneofrxOA+ZBNqxja+VMP9anCbrvmNisfTkoL1?=
 =?us-ascii?Q?XTvVZM5fnAii2VxW8vSzAKR2h5JYSdVisiznwxI/eCwZq1ovgC3BzqKsKCqR?=
 =?us-ascii?Q?42vbqv/EdlDz6Cl5/kEbHnafT23Xxr4rObAzjfzWlV4Hfe7GP0mpkoy5/wIN?=
 =?us-ascii?Q?697Ocu+HUR+ClG1zj1euI0Z7Nlxh9zO/nATS5KR7Fn3l8TA5LoqTEAcpAY7h?=
 =?us-ascii?Q?kyC45S2dqmah9jTmmFcQC9dL5Bsbos16kz7KnX6pjzfnJGeCCU6vzO4mmUm4?=
 =?us-ascii?Q?2vfRn2K+BqKZkgVtUMjXSSXkaNgVX6Gu8BIMCoPuAqRMk8ZJvyxokdLGtnxx?=
 =?us-ascii?Q?BZb/rcQlHqLtSdkNL2fNzEQLcNfsJrdbILeMzcTNMt4Cw0/8otf3v4OZg8Sq?=
 =?us-ascii?Q?xhfHMepnGLnV0nMXqEfG1TJ2G21WRK3MBIujV7wtJeHLLMIuDcaMAqgICQtr?=
 =?us-ascii?Q?zeLjk6JEWCh56BNhc/Ri329I+p0WtjrdMg8TEEJkw2RbIeLmbQRlHcWBjziA?=
 =?us-ascii?Q?MqA3p451l7yKtMxJZ/KvAYiFTJdQJbrSzIjlTvKV5QqrsbdXSRfOEL8Jt18x?=
 =?us-ascii?Q?JnhdWjQRrCl/eUCACtSPYLxTMlDfLhH5Nn+hOAnTis/Rx+jaXB3qKG8feJt0?=
 =?us-ascii?Q?2KVZwyP3kCSAM47vmU9ce5twREPM6kHwJGh6GacW443uMEp/37WVzsUarC6/?=
 =?us-ascii?Q?tgq5cwhRv8H1zBFLPgq0m7hGNyfTnwd/XdCRl7GD6hAQuBIszJ/CHtBxabZF?=
 =?us-ascii?Q?Cfa/mWqdZLDrMgS/2+r8N3fa94j2fWpW+Rj0moKlpMps6z9tpS/bFAjz7zgj?=
 =?us-ascii?Q?vZv8tbCnaJQZZmyaANLfWwrHhpGIqgJ3GC7ZAaoZrFdjpZsd33+IeY0mEcXp?=
 =?us-ascii?Q?0wsym/DJ1JnpzADKJIPyIOxlTopONPu7y7eeU0niBxUBtsgKm4OFXIK0udYt?=
 =?us-ascii?Q?T5C8HFRmgR8NxmiTOClYjKptVofDPkvlyfNk0LyHZKgZ/HMAEfB1ksu+e3Ve?=
 =?us-ascii?Q?i0p7GbOzDiSpGoXNndXQnQxXCeq7De9/HD5D20XOn8hQ+vGvA5KunpUHxOuw?=
 =?us-ascii?Q?Rli3ISOrB/Ws+VLDRr3sUXcSuT40zPOo+0rtGQ/d0kBP5Fc8jpOZCK6vc856?=
 =?us-ascii?Q?Y45UOiGTExxek4K0kuOQau8/GYgVyd+MQfuDxw3GH9ExcA5CxaxqZoK0A1hP?=
 =?us-ascii?Q?rzIElE43M4R49R3A2aVdVP7+TCj/zz9u3jlpMPoHpjIDAJPb+oKOCVx4nc+2?=
 =?us-ascii?Q?XcdVcVbsjfAKzU03i8c2gGcv2YeQsuHEsMx1Nenq3hsIn9fQVh/3w+ATfG/p?=
 =?us-ascii?Q?TPNmZow1BioaAXD6TyQgieTK+7KUQfw1C99REAyrrpNOLh479xgjonIHh+o6?=
 =?us-ascii?Q?lVhqx1M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PUmGrdRj7Pw5hydU37TpsJrck8RkEPMXzxQ43HWIlIXlr/Ej9dX2pU2NdAU4?=
 =?us-ascii?Q?xd/MqlTVjvEPi/ENkdHdjQ/dLH4WG1tGSUlEqx/vAgPcywpJ7W+X/mDZ5nae?=
 =?us-ascii?Q?0FKErGhT1ei1pqGH29dFvlmIgZW+x+T2+Fq0Do4CumbO7O/lU6ROKZKB4B8H?=
 =?us-ascii?Q?AQD79t3/uhgDiiOjZRq9a4VQVuxVXa4Y5Ambru7T53++somGWDHssKPX2Y18?=
 =?us-ascii?Q?4H+SsMX1bDsAOfDi0mHF6iXSxgU7gYveWnQ+jpxW5TPwP5rSR/gSQEuWXube?=
 =?us-ascii?Q?MGlDJ8ubxUz+QOjqPVuQPwQnY/6EKl9FcvS9u1RIIzrEBKAMekJb8F9vo8b1?=
 =?us-ascii?Q?uEZYYeRBLto+2iMiRBLdE3MthBNucwXD1o92i/pFHjPpGeCTgMpn56u3beID?=
 =?us-ascii?Q?4zEz+kO9W9S1zYd2s1tkS1tBsKYwpkass8KQn6/CwA3HOq19awgH0uGiSxKD?=
 =?us-ascii?Q?YlcvjosQiDI/DfdfKUZNgPFpHvDotA2LcxgMySjMf4elZtpR9dDt34yXxrOZ?=
 =?us-ascii?Q?+/edYdy3NHyceXh2deX4dAfmWQCII861aKTaL+cZVxA75egPnAKrrUnGfLS4?=
 =?us-ascii?Q?fmE+xxROfW/W9SLOBGPWDwEcKcx6XBUpoMDC7N+2YjJyzE3C5BakG+0r1XZL?=
 =?us-ascii?Q?aoQCCzLLb110B5HiJMHDMav4Iffov6al5c154eMnwrjtM0/ivj7TEVfTKORx?=
 =?us-ascii?Q?/POIlSjxOjqDdjiRIgysriMacLa1nR36j4jiYM/2mJR0lc13g/cahA94XkOD?=
 =?us-ascii?Q?Bq69/1TTMxggKnLB0qlIg3Uj9BROEI+Eq0REv5lv5NA5X/H6L0ndFCrN9c23?=
 =?us-ascii?Q?taiDZY33F1moP4B3Uty+OOr9AXaD4iQ+c6rS0gv4ZL4/Flb7iK4ZWwaTFsUO?=
 =?us-ascii?Q?TuOd9x7pX3s2jC6laOrgvqMBUiWXtXZ9hwPrYLF3piaU/Ra4jAF9C1TwgWJx?=
 =?us-ascii?Q?z9hwShn/PbA/BvsIdb3fIo0m0hShZinqFg0PiApP2YbD/dGDMRCgOzMlID6K?=
 =?us-ascii?Q?IVG7M1w3NJ9Scu0XwjvrMfYEmLzwxCOBozTwHoL0cI8W7gn3dmEuwPU2hfCG?=
 =?us-ascii?Q?XJophRqNxxF15VgUA6+PpbkB9YnNZwQAJBJm4vOpSD8e2/y/FdsjBcKTyKt+?=
 =?us-ascii?Q?pJyD3zVhUJ4om8zRh9JDqd2osXTaQTdedDOOzKORFVFOTIXqRWv8538wTufL?=
 =?us-ascii?Q?XbHn4wSxbK+sG9tPgc/gQGp5g8vm50cvzN53Hym6FFWwrB4QG1Qsj0+bXc2x?=
 =?us-ascii?Q?JiQXJBQtIUHHO/gCrmXtyOY/yhx0Uf4jIEzDHnwgsZHYdli+q4DuLBCszOTG?=
 =?us-ascii?Q?dgH9FKopeV3FbtoCJojbXSVCHRE0x7jKAEjMVcoV4lpfXWrSkUnUW+ET6ikp?=
 =?us-ascii?Q?sx856q8Icf9wGsGm82TfsVGyw9ADUpaHLKvaa204sgpF0+uVlari+IojJMfw?=
 =?us-ascii?Q?BL/eRHttA8tuzB9pMa5L+01RbNz3nxwXD+0KcOfNPFB4IukP7bKgVlilOyqE?=
 =?us-ascii?Q?zuX4fhheB5vZTpp1SYmJKodEEoGWnMLzkyriA9o3S/cqspPWtBg9zvmGbUf2?=
 =?us-ascii?Q?cRxiCdZLvOKYXsTkO89fF9KAEXP1XcnuJUN7k3Rt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a42f5419-5045-4706-17c5-08dda1e4a75f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:49:19.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKdTmZubH3MJaNot4RifADYMxV6cQo3jj3c8ffHDbVjO4lUnzWuOcfcvGPk5mfigUN9AhNyvlrZGaSDNI09uJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9561
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

Allow resets property to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc4337-ciaa.dtb: lcd-controller@40008000 (arm,pl111): 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/display/arm,pl11x.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/arm,pl11x.yaml b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
index 6cc9045e5c685..a43c1c9d91131 100644
--- a/Documentation/devicetree/bindings/display/arm,pl11x.yaml
+++ b/Documentation/devicetree/bindings/display/arm,pl11x.yaml
@@ -78,6 +78,9 @@ properties:
       If not present, the memory interface is fast enough to handle all
       possible video modes.
 
+  resets:
+    maxItems: 1
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
-- 
2.34.1

