Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A02A78F7C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3CE10E78E;
	Wed,  2 Apr 2025 13:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YhGFotED";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010036.outbound.protection.outlook.com [52.101.228.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B05A10E78E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 13:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IaNtOU4TytzJ/is+5DzYyAKc3eNJeqUAse/GOp/tjxdqVML0U4BV2eVNeGGvsdAjkuoYsOP1ZmvUpuFCE6DYJFqi13yJI2QD/B5tkJbqsFGK5wwSEnItd9jnaZkvqUuH4Am8reO5JIFCEVyKHFi7DoGQqRU+JpiNJIIjIh+P83f8JcuUSN7RI8h2x8j6cyP0RVsp1y/JXtFEOIS20kAfwk8POdhngAuzf4b6Tmh26J1bkMtfRX81TnEsTqTczKb3Y7ybi+pNS56sl0L3iHcttwF5Gwe3kyqY5jEzzqYbtkNHf9q0D1xeZXAcmr85lCQzWzVLr3hn89WDtmSHLZXx+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtbJhlX+BVPPqUAaL0aMcT4yhKqXatcxjmKU4Emd5oo=;
 b=G9ZOxBMXrYnICD7zLc0B4vat4ZvKYcNB7iygh2TB6ZS3ZEUYL30v4IErcxI5aqsV5Uj0MvNbC8ScOKLKOsMDmdt8J9ifDvvhbLAicTF6AQf4dxyUqirM4XSmwCYPWzJ4gkXL0/ER5SY+drlxdLoi319LC+KYOVcDGPh9mLJVX1POAkOv8T2z383NeZW7kT+7aImrpmnbtlfuoMsjjW/S+48u+barzGV5DrN897qAnXGJ4UQtFNOHVIQXTL9DLwQOOD+Qc/1Haenic9cDXG4+eYYrqmcevTB9Yx9fxALaW3qHlKgEQ5xqKtGdEB9G7i0UKadG1gtlmhMeiaW9RwAsqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtbJhlX+BVPPqUAaL0aMcT4yhKqXatcxjmKU4Emd5oo=;
 b=YhGFotEDAv4wxG8sRdM1gH0na1qOFpi5p50Y0gYIBzRtQypIQHQYLiYE2laQpxhNnE6v1lUlr8nWvxJzMEmoa8XGkRYOfELvUpl7R6FlBQ329XqJZs7dsvMbR00tVP/mTcp0SPinX6rVoFi7gV50AHKzunU9NTHUdP4icNNX7DM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6688.jpnprd01.prod.outlook.com (2603:1096:400:9d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 13:12:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 13:12:41 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
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
Subject: [PATCH 2/4] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3E
 SoC
Date: Wed,  2 Apr 2025 15:11:39 +0200
Message-ID: <20250402131142.1270701-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e4b3785-802c-4a4b-4586-08dd71e80c5a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Yac+PxovMzhOy6OY1szacvlrR19lThjsds8aEXXjCmN1745Cs73tyIAmRSS?=
 =?us-ascii?Q?Hxj8SxVf1rv4fZwaFyNeMOqfx+I2A+aPlTpdntWYVJjZLd62KT/DEMsaC8OW?=
 =?us-ascii?Q?a4tRGz66PsIX+KblP7IxWp8MDSyedF4vAvy0S1ubNnDyusj3bZXdS1v0yaT+?=
 =?us-ascii?Q?8YxK5TMgWoYOTe4y5bSxyUhSkN3/tH+4aKal0W4e+8iCwDHwbj4Q0BkjQnnY?=
 =?us-ascii?Q?51WNgfsU5VL5pRLlWRnjGed5JUopU4nOxu1505kGyPDvSvBm3Ta7od+j/Ggn?=
 =?us-ascii?Q?8xRNLeFgOD5gOG38FwkKNEKfPGex9fkPGkKtqzvwV+dULk3XKPPEz+DEqp8C?=
 =?us-ascii?Q?A9yP8bkfKzww4DLkWDbedzrwTgJuyTq84T0G52mSHRVHmpP8a+LtPWyy82ZJ?=
 =?us-ascii?Q?pPGvkATgWk46O9XZ6wUU6rNmkFf7G6hmj1ht+QTH6h4RERNvGHeV14+Y8nRk?=
 =?us-ascii?Q?FdMUGYt8tUUB8FbHNI9YaFUmyyvn87+8r7yhQgrL9n5Y20PCl67/jLJQ6nbv?=
 =?us-ascii?Q?00n6tzMafJ8/TCh5VtSq24uMXeBsbmJegU49UZgNS4kX7cIgEDYkkov5LVWH?=
 =?us-ascii?Q?aUoLly5RvqKcQIDtFWB+me2Pl3OFcofhDp+kabiCcfvjXAmGSV44HO4X3ARM?=
 =?us-ascii?Q?mbLqoaxJOuyCeNZnGhO6sECc80DdSu/g06c6G5PdvOXRdbntQ2U8Q501vM70?=
 =?us-ascii?Q?O9T1gMsX45vA2kyrLf/2GiqdeNb+l9SSl8Rh/JC78lc5LTYTvKzurWlvi6m+?=
 =?us-ascii?Q?SonGw8zFVOZGTs+XcW0usOWVQfClLqkW5a4i99NYny5te9k54x5dmehwbuyc?=
 =?us-ascii?Q?b0gr4uETqFXlZ0oa02LmEXIcYorZt29+MIE1qQELKhDjRsl32CV8YDpAhvvh?=
 =?us-ascii?Q?p8GXlRNpTWD8F5MAxq13h7ZId3FwPG3/UQ1ia2D6ProwMMQGCpXdLcc+W1La?=
 =?us-ascii?Q?WIpJkT3NBwoW0Qc3mYMgc/LqLKBnd6PonQt8Q/R3LHkxGE6forBO7AeVt0ur?=
 =?us-ascii?Q?W+fHn2IvpczfXGu93D4MPRtwLvkiUPMsSgSVYWJN4Bh1dOcBg/+/pzn5V2ir?=
 =?us-ascii?Q?SfI3WcKYiTeOCBv9ChF0cMEy+pcvu1XSrgGgKVBdeSGIus3Y+yvVwn+Mtnyu?=
 =?us-ascii?Q?VnLCcDGKqUIPicWQWQOeU7ysJT87R4C01CpRtmva5/7jDNKfohTpS5SOGgk4?=
 =?us-ascii?Q?MtUkigKRoXNceYno9Fj9Iyp9rV39eqJKRShzS6pHxNCGCBtr4QOAZ4Sa7OZn?=
 =?us-ascii?Q?qcDEiLub6CXkY1KrJMrSoY4KAU2R1qIdvCUh+Q54e26shwBFFT7+Z9Aa2VJT?=
 =?us-ascii?Q?F7b72hUP0xv8oyiLitlxgNrw5znIqfIB0LxGhEY/UuN+Rw6Zc8q2n3/hBc/r?=
 =?us-ascii?Q?SjltgJSYNEsfQ/52J2+Rlv71DzVGx0eDLp03Iwqo5/KVPcqHiROLXk29fM4i?=
 =?us-ascii?Q?3Sel3s4dFx6bTDvF2OSWqbIJP/eDttWy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5qmXxKJ3t3l3AFHlEbDuVt7Q0YZYOAw6nmWPKfB0mOkciI4E15oPtIsQyDqO?=
 =?us-ascii?Q?K9D4VYo6+GqHlcM1Z7+ELLo8kfDEWSkUYFOH5UcS0Vs0VAm6LGUqsG+97LPC?=
 =?us-ascii?Q?xjsF3Zboa4kKhcSrRsj8qty56RBHfT78eUn9hcmrH4ZTw4CJOYLZIyT7+Xyv?=
 =?us-ascii?Q?sTt7rfzRlWoPQYqlFu7P0ztyQMzlSkxOlg64EfBdWWnpxMR6Jcxm+gXTvV66?=
 =?us-ascii?Q?2Vad7EC2cwfiGL9Oh4je/L6lA5Yu1a+qNjn4ZIr3pRDnFu1I6JJiLlt65BBY?=
 =?us-ascii?Q?ZiqvLQhWHdNXeMs1fDkrIovYTb4Ovk6ARCZprCRGkTFwwcZhkJY6dD0b5icl?=
 =?us-ascii?Q?kLHwjSqCU8uGN2Gigt8fRVSNH0LA9+/h7RLl7iQ5VX1V7Mj0OY6aP6J/D1Pm?=
 =?us-ascii?Q?ejcw0dBnjYs0PbTEZuQ1Y0eLyvCoGCZhPr3keHLab7Mq21gXyOvyqqWTTQol?=
 =?us-ascii?Q?f00QvjE7i7Z6VQ2Afa9CtJgTQXm1BjHhVC2rnvs8Zwpwk1TloQtgvsUW6LmD?=
 =?us-ascii?Q?BiC5DZZlAzH6Z0Oi4j4K0R743h/UynZNOsxg0D3EzP+jDWqsuH+hrr2VDcBJ?=
 =?us-ascii?Q?VC/9iVi42rr5Bm9LuC7mH6yhMrt8GX2cqXtpK7roSb4iZbIrPXG3IfpCBskJ?=
 =?us-ascii?Q?mTlHabSzpQfGJuUrDgwVVxOUuZUfrf6CdKcVjUZDBHO0xJWHNdnkJtFxz6DH?=
 =?us-ascii?Q?Jm7vpdYIxCdFzjSw3+DOkIJDLgIjae4c7oLftvKI8au2sB/c/aquVSlXLHrc?=
 =?us-ascii?Q?xQ5Q+nJvGIXoW3/ZFzEoanGUtUKezYK52OGBJ/vlLq7PPgjlbJRyRtlpQHAD?=
 =?us-ascii?Q?lfxadNIxNQzANzEE98cjwt1W6sYhIw8tEjstYMCfeDMrjINbzMVcDeszT29H?=
 =?us-ascii?Q?vZ6xdIzo03t191d+jWlCtwPrQTv3aSq4XW7IV5sE9BVsJAr0kdgY+jOpl51Y?=
 =?us-ascii?Q?wy4dWFPSwh+NFaSzbssGrj3v2tIshzjPYSE6ZAJTEHrBnZQDWoYJtELvKIe/?=
 =?us-ascii?Q?k2I2As/Ct2mXz5m7afkkNZoAo/TuazD2valnRPsp55SUvqspqoSDYBtAF51b?=
 =?us-ascii?Q?xJEw7O8+cfdBpSLtPrqdyCuNuZkhgPw33dioAOKuRryDsit3cpxv+LzbIW+g?=
 =?us-ascii?Q?TvZlUXiiGuxgTgPHKB0UbNX1Cfkg+Cca8Vr8EWM1RkZycOcMlzk8Slrp6abg?=
 =?us-ascii?Q?tBSeMfIRLrv7h3RLnde9qL7JJhcaoCGuRYdXPe4HBAdvW+1yg+ktBb7/nh+K?=
 =?us-ascii?Q?Db/pWVE3Bh/J+56qBVrT6AxHkQ4zxSDkM3wlXQmQ29h7WIZMoepPRxdLOAoI?=
 =?us-ascii?Q?2pzTcoJoyL0C7Xo0ZDSuWIAIEawkLYNuZKkOVQlbTv1Tk2lJKf/mVv8gSu96?=
 =?us-ascii?Q?1QsnAhyzEo6B67FirQp5dgKrOfOnDHUDZQj3CtRw93pGltGR3FoUO2gLO+Wx?=
 =?us-ascii?Q?jMVqJjktF4ER8j1J4D7xkbUTiEEnl8rmMtZtqjA0X8TRJyIIgg89wk43M0Oo?=
 =?us-ascii?Q?1TG/NYPNSTQOB9jhufhjLaNka/zn59YvJBxwKDDjzQu9sj6NPhporzL+2Ybp?=
 =?us-ascii?Q?2CMKwGfY6bp/n7+rFUHhXfUYx2TBudCXwljNU8TBdf3fh1Rm7lgLDv032pMN?=
 =?us-ascii?Q?bT6lw04PgA+StcYxporSHD0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4b3785-802c-4a4b-4586-08dd71e80c5a
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:12:41.4001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o48m3yOZJmIySbrzuENoCfSlFs474oEYA5uBeEx2ACdTnRDRPqLa55jDzEii3hCv/I022chOigGKkA1CZYXS+6KvJG2aNxrt4CkRiRwFFvj521QvKqUGjRkkoWfZ+dAl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6688
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

Add a compatible string for the Renesas RZ/G3E SoC variants that
include a Mali-G52 GPU. These variants share the same restrictions on
interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
the existing schema validation accordingly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 019bd28a29f19..e25478f2ce521 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -25,6 +25,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g047-mali
               - renesas,r9a09g057-mali
               - rockchip,px30-mali
               - rockchip,rk3562-mali
@@ -145,6 +146,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g047-mali
               - renesas,r9a09g057-mali
     then:
       properties:
-- 
2.43.0

